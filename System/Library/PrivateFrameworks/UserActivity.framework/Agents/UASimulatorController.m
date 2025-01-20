@interface UASimulatorController
+ (id)simulatorControllerForCommandPort:(unsigned int)a3;
+ (void)setSimulatorForCommandPort:(unsigned int)a3 controller:(id)a4;
- (BOOL)active;
- (BOOL)terminate;
- (NSSet)simulators;
- (OS_dispatch_queue)dispatchQ;
- (SFPeerDevice)ourPeerDevice;
- (UASimulatorController)initWithManager:(id)a3;
- (id)simulatorStatus;
- (id)statusString;
- (unsigned)simulatorPort;
- (void)addSimulator:(id)a3;
- (void)removeSimulator:(id)a3;
- (void)setDispatchQ:(id)a3;
- (void)setOurPeerDevice:(id)a3;
- (void)setSimulatorPort:(unsigned int)a3;
@end

@implementation UASimulatorController

+ (id)simulatorControllerForCommandPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000E67D0);
  v4 = (void *)qword_1000E67C8;
  if (qword_1000E67C8)
  {
    v5 = +[NSNumber numberWithUnsignedInt:v3];
    v4 = [v4 objectForKeyedSubscript:v5];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000E67D0);

  return v4;
}

+ (void)setSimulatorForCommandPort:(unsigned int)a3 controller:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v9 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1000E67D0);
  v5 = (void *)qword_1000E67C8;
  if (v9 && !qword_1000E67C8)
  {
    uint64_t v6 = +[NSMutableDictionary dictionary];
    v7 = (void *)qword_1000E67C8;
    qword_1000E67C8 = v6;

    v5 = (void *)qword_1000E67C8;
  }
  v8 = +[NSNumber numberWithUnsignedInt:v4];
  [v5 setObject:v9 forKeyedSubscript:v8];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000E67D0);
}

- (UASimulatorController)initWithManager:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UASimulatorController;
  v5 = [(UACornerActionManagerHandler *)&v11 initWithManager:v4 name:@"SimCreator"];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("simulator", 0);
    dispatchQ = v5->_dispatchQ;
    v5->_dispatchQ = (OS_dispatch_queue *)v6;

    uint64_t v8 = +[NSMutableSet set];
    simulators = v5->_simulators;
    v5->_simulators = (NSMutableSet *)v8;
  }
  return v5;
}

- (NSSet)simulators
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(NSMutableSet *)v2->_simulators copy];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (void)addSimulator:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  [(NSMutableSet *)obj->_simulators addObject:v4];

  objc_sync_exit(obj);
}

- (void)removeSimulator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    [(NSMutableSet *)v5->_simulators removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (BOOL)active
{
  v2 = [(UASimulatorController *)self simulators];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)terminate
{
  v15.receiver = self;
  v15.super_class = (Class)UASimulatorController;
  BOOL v3 = [(UACornerActionManagerHandler *)&v15 terminate];
  if (v3)
  {
    id v4 = sub_10000BA18(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SIMULATOR: Terminating all UASimulators.", buf, 2u);
    }

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = [(UASimulatorController *)self simulators];
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) terminate];
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v5 countByEnumeratingWithState:&v10 objects:v16 count:16];
      }
      while (v6);
    }
  }
  return v3;
}

- (id)statusString
{
  BOOL v3 = [(UASimulatorController *)self simulators];
  id v4 = [v3 count];

  if (v4)
  {
    v5 = +[NSMutableString string];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(UASimulatorController *)self simulators];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          long long v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) statusString];
          [v5 appendFormat:@"%@\n", v10];
        }
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    long long v11 = v5;
  }
  else
  {
    long long v11 = 0;
  }
  id v12 = [v11 copy];

  return v12;
}

- (id)simulatorStatus
{
  uint64_t v21 = 0;
  unsigned int v22 = 0;
  char v23 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [(UASimulatorController *)self simulators];
  id v2 = [obj countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v2)
  {
    BOOL v3 = 0;
    uint64_t v4 = *(void *)v18;
    do
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v18 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v7 = sub_10007CE38((int)[v6 pairedClientPort], 0x1C9C380u, &v21, &v22);
        uint64_t v8 = v7;
        if (v7)
        {
          id v9 = mach_error_string(v7);
          long long v10 = [v6 statusString];
          uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(ERROR %d/%s for simulator %@"), v8, v9, v10;

          BOOL v3 = (void *)v11;
        }
        else
        {
          id v12 = objc_alloc((Class)NSString);
          long long v13 = +[NSData dataWithBytes:v21 length:v22];
          id v14 = [v12 initWithData:v13 encoding:4];

          if (v14) {
            goto LABEL_14;
          }
          BOOL v3 = 0;
        }
      }
      id v2 = [obj countByEnumeratingWithState:&v17 objects:v24 count:16];
      id v14 = v3;
    }
    while (v2);
  }
  else
  {
    id v14 = 0;
  }
LABEL_14:

  sub_100043D1C((uint64_t)&v21);

  return v14;
}

- (OS_dispatch_queue)dispatchQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDispatchQ:(id)a3
{
}

- (unsigned)simulatorPort
{
  return self->_simulatorPort;
}

- (void)setSimulatorPort:(unsigned int)a3
{
  self->_simulatorPort = a3;
}

- (SFPeerDevice)ourPeerDevice
{
  return (SFPeerDevice *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOurPeerDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ourPeerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQ, 0);

  objc_storeStrong((id *)&self->_simulators, 0);
}

@end