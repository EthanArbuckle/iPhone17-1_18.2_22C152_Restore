@interface CKKSKeychainViewState
- (BOOL)ckksManagedView;
- (BOOL)isEqual:(id)a3;
- (BOOL)priorityView;
- (BOOL)readyNotificationArmed;
- (CKKSKeychainViewState)initWithZoneID:(id)a3 forContextID:(id)a4 ckksManagedView:(BOOL)a5 priorityView:(BOOL)a6 notifyViewChangedScheduler:(id)a7 notifyViewReadyScheduler:(id)a8;
- (CKKSNearFutureScheduler)notifyViewChangedScheduler;
- (CKKSNearFutureScheduler)notifyViewReadyScheduler;
- (CKRecordZoneID)zoneID;
- (NSDictionary)keyHierarchyConditions;
- (NSMutableDictionary)mutableStateConditions;
- (NSOperationQueue)operationQueue;
- (NSSet)allowableStates;
- (NSString)contextID;
- (NSString)zoneName;
- (OS_dispatch_queue)queue;
- (OctagonStateString)viewKeyHierarchyState;
- (SecLaunchSequence)launch;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)armReadyNotification;
- (void)launchComplete;
- (void)setAllowableStates:(id)a3;
- (void)setLaunch:(id)a3;
- (void)setMutableStateConditions:(id)a3;
- (void)setNotifyViewChangedScheduler:(id)a3;
- (void)setNotifyViewReadyScheduler:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReadyNotificationArmed:(BOOL)a3;
- (void)setViewKeyHierarchyState:(id)a3;
@end

@implementation CKKSKeychainViewState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mutableStateConditions, 0);
  objc_storeStrong((id *)&self->_allowableStates, 0);
  objc_storeStrong((id *)&self->_notifyViewReadyScheduler, 0);
  objc_storeStrong((id *)&self->_notifyViewChangedScheduler, 0);
  objc_storeStrong((id *)&self->_launch, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);

  objc_storeStrong((id *)&self->_viewKeyHierarchyState, 0);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 96, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setReadyNotificationArmed:(BOOL)a3
{
  self->_readyNotificationArmed = a3;
}

- (BOOL)readyNotificationArmed
{
  return self->_readyNotificationArmed;
}

- (void)setMutableStateConditions:(id)a3
{
}

- (NSMutableDictionary)mutableStateConditions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAllowableStates:(id)a3
{
}

- (NSSet)allowableStates
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNotifyViewReadyScheduler:(id)a3
{
}

- (CKKSNearFutureScheduler)notifyViewReadyScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 64, 1);
}

- (void)setNotifyViewChangedScheduler:(id)a3
{
}

- (CKKSNearFutureScheduler)notifyViewChangedScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)priorityView
{
  return self->_priorityView;
}

- (BOOL)ckksManagedView
{
  return self->_ckksManagedView;
}

- (void)setLaunch:(id)a3
{
}

- (SecLaunchSequence)launch
{
  return (SecLaunchSequence *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (CKRecordZoneID)zoneID
{
  return (CKRecordZoneID *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)armReadyNotification
{
  v3 = [(CKKSKeychainViewState *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019ACA0;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)launchComplete
{
  v3 = [(CKKSKeychainViewState *)self launch];
  [v3 launch];

  v4 = [(CKKSKeychainViewState *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019AD4C;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(v4, block);
}

- (NSDictionary)keyHierarchyConditions
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10019AEE0;
  v11 = sub_10019AEF0;
  id v12 = 0;
  v3 = [(CKKSKeychainViewState *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10019AEF8;
  v6[3] = &unk_100307348;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)setViewKeyHierarchyState:(id)a3
{
  id v5 = a3;
  v6 = [(CKKSKeychainViewState *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10019B018;
  block[3] = &unk_1003075B8;
  id v9 = v5;
  v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_sync(v6, block);
}

- (OctagonStateString)viewKeyHierarchyState
{
  return self->_viewKeyHierarchyState;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(CKKSKeychainViewState *)self zoneName];
    id v7 = [v5 zoneName];
    if ([v6 isEqualToString:v7]
      && (unsigned int v8 = [(CKKSKeychainViewState *)self ckksManagedView],
          v8 == [v5 ckksManagedView]))
    {
      v10 = [(CKKSKeychainViewState *)self viewKeyHierarchyState];
      SEL v11 = [v5 viewKeyHierarchyState];
      if ([v10 isEqualToString:v11])
      {
        id v12 = [(CKKSKeychainViewState *)self contextID];
        v13 = [v5 contextID];
        unsigned __int8 v9 = [v12 isEqualToString:v13];
      }
      else
      {
        unsigned __int8 v9 = 0;
      }
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(CKKSKeychainViewState *)self zoneName];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = [(CKKSKeychainViewState *)self contextID];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = [CKKSKeychainViewState alloc];
  id v5 = [(CKKSKeychainViewState *)self zoneID];
  unint64_t v6 = [(CKKSKeychainViewState *)self contextID];
  BOOL v7 = [(CKKSKeychainViewState *)self ckksManagedView];
  BOOL v8 = [(CKKSKeychainViewState *)self priorityView];
  unsigned __int8 v9 = [(CKKSKeychainViewState *)self notifyViewReadyScheduler];
  v10 = [(CKKSKeychainViewState *)self notifyViewReadyScheduler];
  SEL v11 = [(CKKSKeychainViewState *)v4 initWithZoneID:v5 forContextID:v6 ckksManagedView:v7 priorityView:v8 notifyViewChangedScheduler:v9 notifyViewReadyScheduler:v10];

  id v12 = [(CKKSKeychainViewState *)self viewKeyHierarchyState];
  [(CKKSKeychainViewState *)v11 setViewKeyHierarchyState:v12];

  return v11;
}

- (id)description
{
  v3 = [(CKKSKeychainViewState *)self contextID];
  unint64_t v4 = [(CKKSKeychainViewState *)self zoneName];
  if ([(CKKSKeychainViewState *)self ckksManagedView]) {
    CFStringRef v5 = @"ckks";
  }
  else {
    CFStringRef v5 = @"ext";
  }
  unint64_t v6 = [(CKKSKeychainViewState *)self viewKeyHierarchyState];
  BOOL v7 = +[NSString stringWithFormat:@"<CKKSKeychainViewState(%@): %@(%@), %@>", v3, v4, v5, v6];

  return v7;
}

- (CKKSKeychainViewState)initWithZoneID:(id)a3 forContextID:(id)a4 ckksManagedView:(BOOL)a5 priorityView:(BOOL)a6 notifyViewChangedScheduler:(id)a7 notifyViewReadyScheduler:(id)a8
{
  id v15 = a3;
  id v34 = a4;
  id v16 = a7;
  id v17 = a8;
  v37.receiver = self;
  v37.super_class = (Class)CKKSKeychainViewState;
  v18 = [(CKKSKeychainViewState *)&v37 init];
  if (v18)
  {
    uint64_t v19 = [v15 zoneName:v34];
    zoneName = v18->_zoneName;
    v18->_zoneName = (NSString *)v19;

    objc_storeStrong((id *)&v18->_zoneID, a3);
    objc_storeStrong((id *)&v18->_contextID, a4);
    v18->_priorityView = a6;
    v18->_ckksManagedView = a5;
    dispatch_queue_t v21 = dispatch_queue_create("key-state", 0);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v21;

    v23 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v18->_operationQueue;
    v18->_operationQueue = v23;

    objc_storeStrong((id *)&v18->_notifyViewChangedScheduler, a7);
    objc_storeStrong((id *)&v18->_notifyViewReadyScheduler, a8);
    if (qword_10035CDF8 != -1) {
      dispatch_once(&qword_10035CDF8, &stru_1002F8E90);
    }
    objc_storeStrong((id *)&v18->_allowableStates, (id)qword_10035CDF0);
    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mutableStateConditions = v18->_mutableStateConditions;
    v18->_mutableStateConditions = v25;

    allowableStates = v18->_allowableStates;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10019B870;
    v35[3] = &unk_100306028;
    v28 = v18;
    v36 = v28;
    [(NSSet *)allowableStates enumerateObjectsUsingBlock:v35];
    [(CKKSKeychainViewState *)v28 setViewKeyHierarchyState:@"initializing"];
    v29 = (SecLaunchSequence *)[objc_alloc((Class)SecLaunchSequence) initWithRocketName:@"com.apple.security.ckks.launch"];
    launch = v28->_launch;
    v28->_launch = v29;

    v31 = v28->_launch;
    v32 = [v15 zoneName];
    [(SecLaunchSequence *)v31 addAttribute:@"view" value:v32];

    v28->_readyNotificationArmed = 0;
  }

  return v18;
}

@end