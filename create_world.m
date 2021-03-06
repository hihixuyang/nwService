function [base, obstacle, agent_node, task_node] = create_world(filename)
%%Initialize global variables. Create base station, obstacles, agents and
%%tasks. Make environment graph. Debugging made easy. Environment for every
%%run is saved. May be run again by calling create_world with filename as
%%argument.

global grid_type numRows numColumns xmin ymin env_graph numCells xmax ymax;
global numAgent numTask numObstacle sim_cont comm_network aC_range bC_range;
global task_counter max_tasks current_tasks time Total_obstacle_space d_max;
global size_x size_y size_g gridpoints_x gridpoints_y covered_fraction;
global gridlocation gridCells s_time index_for_UD losMat cNeighMat maxTargets;

%0:custom, 1:random
if nargin == 1
    
    load(filename);
    
    initEnv(filename);

    % Define base station
    base = define_baseStation(filename);

    % Add Obstacles
    obstacle = generate_obstacle(base,filename);

    % Define agents
    agent_node = define_agents(base, obstacle, graph, filename);%, obstacle);

    % Task Node definition
    task_node = define_tasks(base, obstacle, filename);
    
    % Los Data
    [losMat cNeighMat] = getLosMatrix(base,obstacle,agent_node, filename);
    
%     save(['a' num2str(numAgent) 't' num2str(numTask) 'o' num2str(numObstacle)]);

elseif nargin == 0
    
    initEnv;

    env_graph = make_graph();
    % view(biograph(env_graph,[],'ShowWeights','on','ShowArrows','off'));

    % Define base station
    base = define_baseStation();

    % Save basic environment graph for agents
    graph = env_graph;

    % Add Obstacles
    obstacle = generate_obstacle(base);

    % Define agents
    agent_node = define_agents(base, obstacle, graph);%, obstacle);

    % Task Node definition
    task_node = define_tasks(base, obstacle);
    
    [losMat cNeighMat] = getLosMatrix(base,obstacle,agent_node);
    
    save(['a' num2str(numAgent) 't' num2str(numTask) 'o' num2str(numObstacle)]);
    
end