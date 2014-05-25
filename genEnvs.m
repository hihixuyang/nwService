function genEnvs()

global grid_type numRows numColumns xmin ymin env_graph numCells xmax ymax;
global numAgent numTask numObstacle sim_cont comm_network aC_range bC_range aT_range;
global task_counter max_tasks current_tasks time Total_obstacle_space d_max;
global size_x size_y size_g gridpoints_x gridpoints_y covered_fraction aS_range;
global gridlocation gridCells s_time index_for_UD losMat cNeighMat maxTargets;


for i= 1:50

    load('20Env');

    % Add Obstacles
    obstacle = generate_obstacle(base);

    [losMat cNeighMat] = getLosMatrix(base,obstacle);

    save([ num2str(i) 'Serial20l20b40o']);

end

pause(1);