@interface BKTouchDeliveryObservationManager
+ (id)sharedInstance;
- (BKTouchDeliveryObservationManager)init;
- (OS_dispatch_queue)queue;
- (int)_pidForClientPort:(unsigned int)a3;
- (void)_queue_pendUpdate:(id)a3;
- (void)_queue_postPendingUpdates;
- (void)_queue_postUpdate:(id)a3 forTouchIdentifier:(unsigned int)a4;
- (void)_queue_postUpdate:(id)a3 toProcessPID:(int)a4;
- (void)_queue_setProcessPID:(int)a3 observesGlobalTouches:(BOOL)a4;
- (void)_queue_setProcessPID:(int)a3 observesTouch:(BOOL)a4 withIdentifier:(unsigned int)a5;
- (void)connectionDidTerminate:(id)a3 process:(id)a4;
- (void)noteTouchUpOccurred:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 clientPort:(unsigned int)a6;
- (void)setObservesAllTouches:(id)a3;
- (void)setObservesTouch:(id)a3 withIdentifier:(id)a4;
- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6;
- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4;
- (void)touchDidFinishProcessingTouchCollection;
@end

@implementation BKTouchDeliveryObservationManager

- (int)_pidForClientPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = BKHIDEventRoutingGetClientConnectionManager();
  v5 = [v4 clientForTaskPort:v3];
  v6 = v5;
  if (v5) {
    int v7 = [v5 pid];
  }
  else {
    int v7 = -1;
  }

  return v7;
}

- (void)_queue_pendUpdate:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v4 = [v9 touchIdentifier];
  unsigned int v5 = [v9 contextID];
  uint64_t v6 = v4;
  uint64_t v7 = [(BSMutableIntegerMap *)self->_touchIdentifierToUpdate objectForKey:v4];
  v8 = (void *)v7;
  if (v5 || !v7) {
    [(BSMutableIntegerMap *)self->_touchIdentifierToUpdate setObject:v9 forKey:v6];
  }
}

- (void)_queue_postUpdate:(id)a3 toProcessPID:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109376;
    v10[1] = [v6 touchIdentifier];
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "post update for touch:%X to pid:%d", (uint8_t *)v10, 0xEu);
  }

  v8 = [(BKHIDDomainServiceServer *)self->_server connectionForPID:v4];
  id v9 = [(BKHIDDomainServiceServer *)self->_server userInfoForConnection:v8];
  if (!v9)
  {
    id v9 = [[BKTouchObservationClient alloc] initWithConnection:v8 pid:v4];
    -[BKHIDDomainServiceServer setUserInfo:forConnection:](self->_server, "setUserInfo:forConnection:");
  }
  [(BKTouchObservationClient *)v9 sendTouchUpdate:v6];
}

- (void)_queue_postUpdate:(id)a3 forTouchIdentifier:(unsigned int)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v7 = [v6 pid];
  v8 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    unsigned int v21 = a4;
    __int16 v22 = 1024;
    int v23 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "touch %X sent to destination pid:%d", buf, 0xEu);
  }

  id v9 = [(BSMutableIntegerMap *)self->_touchIdentifierToPIDs objectForKey:a4];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100036BE4;
  v18[3] = &unk_1000F6540;
  v18[4] = self;
  id v10 = v6;
  id v19 = v10;
  [v9 enumerateIndexesUsingBlock:v18];
  id v11 = [(NSMutableIndexSet *)self->_globalTouchObserverPIDs mutableCopy];
  int v12 = v11;
  if (v9) {
    [v11 removeIndexes:v9];
  }
  if (v7 >= 1 && [v12 count])
  {
    id v13 = [v10 copy];
    [v13 setTouchIdentifier:0];
    globalTouchObserverPIDs = self->_globalTouchObserverPIDs;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001A9E0;
    v16[3] = &unk_1000F6540;
    v16[4] = self;
    id v15 = v13;
    id v17 = v15;
    [(NSMutableIndexSet *)globalTouchObserverPIDs enumerateIndexesUsingBlock:v16];
  }
}

- (void)_queue_postPendingUpdates
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  touchIdentifierToUpdate = self->_touchIdentifierToUpdate;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001ABD0;
  v4[3] = &unk_1000F6518;
  v4[4] = self;
  [(BSMutableIntegerMap *)touchIdentifierToUpdate enumerateWithBlock:v4];
  [(BSMutableIntegerMap *)self->_touchIdentifierToUpdate removeAllObjects];
}

- (void)touchDidFinishProcessingTouchCollection
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A830;
  block[3] = &unk_1000F8E78;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)touch:(unsigned int)a3 pathIndex:(int64_t)a4 upAtPoint:(CGPoint)a5 detached:(BOOL)a6
{
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A9F0;
  v7[3] = &unk_1000F64F0;
  v7[4] = self;
  unsigned int v8 = a3;
  BOOL v9 = a6;
  dispatch_async(queue, v7);
}

- (void)noteTouchUpOccurred:(unsigned int)a3 detached:(BOOL)a4 context:(unsigned int)a5 clientPort:(unsigned int)a6
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004068;
  block[3] = &unk_1000F64A8;
  block[4] = self;
  unsigned int v8 = a6;
  unsigned int v9 = a3;
  unsigned int v10 = a5;
  BOOL v11 = a4;
  dispatch_async(queue, block);
}

+ (id)sharedInstance
{
  if (qword_100122E08 != -1) {
    dispatch_once(&qword_100122E08, &stru_1000F6480);
  }
  v2 = (void *)qword_100122E00;

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_globalTouchObserverPIDs, 0);
  objc_storeStrong((id *)&self->_touchIdentifierToUpdate, 0);
  objc_storeStrong((id *)&self->_touchIdentifierToPIDs, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)_queue_setProcessPID:(int)a3 observesGlobalTouches:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  globalTouchObserverPIDs = self->_globalTouchObserverPIDs;
  if (v4)
  {
    [(NSMutableIndexSet *)globalTouchObserverPIDs addIndex:a3];
  }
  else
  {
    [(NSMutableIndexSet *)globalTouchObserverPIDs removeIndex:a3];
  }
}

- (void)_queue_setProcessPID:(int)a3 observesTouch:(BOOL)a4 withIdentifier:(unsigned int)a5
{
  BOOL v5 = a4;
  id v9 = [(BSMutableIntegerMap *)self->_touchIdentifierToPIDs objectForKey:a5];
  if (v9) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v5;
  }
  if (!v8)
  {
    id v9 = +[NSMutableIndexSet indexSet];
    -[BSMutableIntegerMap setObject:forKey:](self->_touchIdentifierToPIDs, "setObject:forKey:");
  }
  if (v5) {
    [v9 addIndex:a3];
  }
  else {
    [v9 removeIndex:a3];
  }
}

- (void)touchDidDetach:(unsigned int)a3 destinations:(id)a4
{
  id v6 = a4;
  id v7 = [v6 copy];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036DFC;
  block[3] = &unk_1000F8EC8;
  id v11 = v7;
  int v12 = self;
  unsigned int v13 = a3;
  id v9 = v7;
  dispatch_async(queue, block);
}

- (void)setObservesTouch:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v8 = +[BSServiceConnection currentContext];
  id v9 = [v8 remoteProcess];

  id v10 = [v9 pid];
  id v11 = [v7 unsignedIntValue];
  int v12 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109632;
    v13[1] = v10;
    __int16 v14 = 1024;
    unsigned int v15 = [v6 BOOLValue];
    __int16 v16 = 1024;
    int v17 = (int)v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "pid:%d observes touch:%{BOOL}u identifier:%X", (uint8_t *)v13, 0x14u);
  }

  -[BKTouchDeliveryObservationManager _queue_setProcessPID:observesTouch:withIdentifier:](self, "_queue_setProcessPID:observesTouch:withIdentifier:", v10, [v6 BOOLValue], v11);
}

- (void)setObservesAllTouches:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v5 = +[BSServiceConnection currentContext];
  id v6 = [v5 remoteProcess];

  id v7 = [v6 pid];
  BOOL v8 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[BSServiceConnection currentContext];
    int v10 = 138543874;
    id v11 = v6;
    __int16 v12 = 2114;
    unsigned int v13 = v9;
    __int16 v14 = 1024;
    unsigned int v15 = [v4 BOOLValue];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "process:%{public}@ (ctx:%{public}@) observes all touches:%{BOOL}u", (uint8_t *)&v10, 0x1Cu);
  }
  -[BKTouchDeliveryObservationManager _queue_setProcessPID:observesGlobalTouches:](self, "_queue_setProcessPID:observesGlobalTouches:", v7, [v4 BOOLValue]);
}

- (void)connectionDidTerminate:(id)a3 process:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = BKLogTouchDeliveryObserver();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v12 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "terminate %{public}@", buf, 0xCu);
  }

  signed int v7 = [v5 pid];
  [(NSMutableIndexSet *)self->_globalTouchObserverPIDs removeIndex:v7];
  touchIdentifierToPIDs = self->_touchIdentifierToPIDs;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003743C;
  v9[3] = &unk_1000F64C8;
  signed int v10 = v7;
  [(BSMutableIntegerMap *)touchIdentifierToPIDs enumerateWithBlock:v9];
}

- (BKTouchDeliveryObservationManager)init
{
  v17.receiver = self;
  v17.super_class = (Class)BKTouchDeliveryObservationManager;
  v2 = [(BKTouchDeliveryObservationManager *)&v17 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    touchIdentifierToPIDs = v2->_touchIdentifierToPIDs;
    v2->_touchIdentifierToPIDs = (BSMutableIntegerMap *)v3;

    uint64_t v5 = objc_opt_new();
    touchIdentifierToUpdate = v2->_touchIdentifierToUpdate;
    v2->_touchIdentifierToUpdate = (BSMutableIntegerMap *)v5;

    uint64_t v7 = +[NSMutableIndexSet indexSet];
    globalTouchObserverPIDs = v2->_globalTouchObserverPIDs;
    v2->_globalTouchObserverPIDs = (NSMutableIndexSet *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.backboard.BKTouchDeliveryObservationManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    id v11 = objc_alloc((Class)BKHIDDomainServiceServer);
    id v12 = v2->_queue;
    unsigned int v13 = BKLogTouchDeliveryObserver();
    __int16 v14 = (BKHIDDomainServiceServer *)[v11 initWithDelegate:v2 serverTarget:v2 serverProtocol:&OBJC_PROTOCOL___BKSTouchDeliveryObservationService_IPC clientProtocol:&OBJC_PROTOCOL___BKSTouchDeliveryObserving_IPC serviceName:BKSTouchDeliveryObservationBSServiceName queue:v12 log:v13 entitlement:BKObserveTouchDeliveryObservingEntitlement];
    server = v2->_server;
    v2->_server = v14;

    [(BKHIDDomainServiceServer *)v2->_server activate];
  }
  return v2;
}

@end