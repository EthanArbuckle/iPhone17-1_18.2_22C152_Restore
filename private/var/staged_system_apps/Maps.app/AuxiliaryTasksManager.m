@interface AuxiliaryTasksManager
- (AuxiliaryTasksManager)initWithPlatformController:(id)a3;
- (NSArray)tasks;
- (NSMutableArray)auxiliaryTasks;
- (PlatformController)platformController;
- (RoutePlanningSessionRouteLoadedNotifier)routePlanningSessionRouteLoadedNotifier;
- (VehicleDisambiguationTask)vehicleDisambiguationTask;
- (id)auxilaryTaskForClass:(Class)a3;
- (void)addTasks:(id)a3;
- (void)setAuxiliaryTasks:(id)a3;
- (void)setPlatformController:(id)a3;
@end

@implementation AuxiliaryTasksManager

- (AuxiliaryTasksManager)initWithPlatformController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AuxiliaryTasksManager;
  v5 = [(AuxiliaryTasksManager *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_platformController, v4);
    uint64_t v7 = +[NSMutableArray array];
    auxiliaryTasks = v6->_auxiliaryTasks;
    v6->_auxiliaryTasks = (NSMutableArray *)v7;
  }
  return v6;
}

- (id)auxilaryTaskForClass:(Class)a3
{
  id v4 = [(AuxiliaryTasksManager *)self auxiliaryTasks];
  objc_sync_enter(v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(AuxiliaryTasksManager *)self auxiliaryTasks];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  objc_sync_exit(v4);

  return v10;
}

- (void)addTasks:(id)a3
{
  id v4 = a3;
  v5 = [(AuxiliaryTasksManager *)self auxiliaryTasks];
  objc_sync_enter(v5);
  id v6 = [(AuxiliaryTasksManager *)self auxiliaryTasks];
  [v6 addObjectsFromArray:v4];

  objc_sync_exit(v5);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v10);
        long long v12 = [(AuxiliaryTasksManager *)self platformController];
        [v12 addObserver:v11];

        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  long long v13 = +[NSNotificationCenter defaultCenter];
  [v13 postNotificationName:off_1015F8128 object:self];
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (NSMutableArray)auxiliaryTasks
{
  return self->_auxiliaryTasks;
}

- (VehicleDisambiguationTask)vehicleDisambiguationTask
{
  uint64_t v3 = objc_opt_class();

  return (VehicleDisambiguationTask *)[(AuxiliaryTasksManager *)self auxilaryTaskForClass:v3];
}

- (RoutePlanningSessionRouteLoadedNotifier)routePlanningSessionRouteLoadedNotifier
{
  uint64_t v3 = objc_opt_class();

  return (RoutePlanningSessionRouteLoadedNotifier *)[(AuxiliaryTasksManager *)self auxilaryTaskForClass:v3];
}

- (NSArray)tasks
{
  uint64_t v3 = [(AuxiliaryTasksManager *)self auxiliaryTasks];
  objc_sync_enter(v3);
  id v4 = [(AuxiliaryTasksManager *)self auxiliaryTasks];
  id v5 = [v4 copy];

  objc_sync_exit(v3);

  return (NSArray *)v5;
}

- (void)setAuxiliaryTasks:(id)a3
{
}

- (void)setPlatformController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platformController);

  objc_storeStrong((id *)&self->_auxiliaryTasks, 0);
}

@end