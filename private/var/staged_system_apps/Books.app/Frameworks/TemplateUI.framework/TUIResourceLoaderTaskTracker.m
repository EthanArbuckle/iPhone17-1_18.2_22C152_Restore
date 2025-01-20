@interface TUIResourceLoaderTaskTracker
- (BOOL)stopTrackingController:(id)a3;
- (NSArray)controllers;
- (TUIResourceLoaderTask)resourceLoaderTask;
- (TUIResourceLoaderTaskTracker)init;
- (void)_updateTaskWithHighestRequestedPriority;
- (void)setResourceLoaderTask:(id)a3;
- (void)updatePriorty:(float)a3 forController:(id)a4;
@end

@implementation TUIResourceLoaderTaskTracker

- (TUIResourceLoaderTaskTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUIResourceLoaderTaskTracker;
  v2 = [(TUIResourceLoaderTaskTracker *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    controllerPriorities = v2->_controllerPriorities;
    v2->_controllerPriorities = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)_updateTaskWithHighestRequestedPriority
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_controllerPriorities allValues];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    float v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v9 floatValue];
        if (v10 > v7)
        {
          [v9 floatValue];
          float v7 = v11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    float v7 = 0.0;
  }

  [(TUIResourceLoaderTask *)self->_resourceLoaderTask setPriority:v7];
}

- (void)updatePriorty:(float)a3 forController:(id)a4
{
  controllerPriorities = self->_controllerPriorities;
  id v7 = a4;
  *(float *)&double v8 = a3;
  v9 = +[NSNumber numberWithFloat:v8];
  [(NSMutableDictionary *)controllerPriorities setObject:v9 forKey:v7];

  [(TUIResourceLoaderTaskTracker *)self _updateTaskWithHighestRequestedPriority];
}

- (BOOL)stopTrackingController:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_controllerPriorities objectForKey:v4];

  if (v5)
  {
    [(NSMutableDictionary *)self->_controllerPriorities removeObjectForKey:v4];
    uint64_t v6 = [(NSMutableDictionary *)self->_controllerPriorities allKeys];
    id v7 = [v6 count];

    if (!v7)
    {
      [(TUIResourceLoaderTask *)self->_resourceLoaderTask cancel];
      BOOL v8 = 1;
      goto LABEL_6;
    }
    [(TUIResourceLoaderTaskTracker *)self _updateTaskWithHighestRequestedPriority];
  }
  BOOL v8 = 0;
LABEL_6:

  return v8;
}

- (NSArray)controllers
{
  return (NSArray *)[(NSMutableDictionary *)self->_controllerPriorities allKeys];
}

- (TUIResourceLoaderTask)resourceLoaderTask
{
  return self->_resourceLoaderTask;
}

- (void)setResourceLoaderTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLoaderTask, 0);

  objc_storeStrong((id *)&self->_controllerPriorities, 0);
}

@end