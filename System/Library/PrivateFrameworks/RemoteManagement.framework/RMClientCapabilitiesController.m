@interface RMClientCapabilitiesController
+ (RMClientCapabilitiesController)sharedController;
+ (void)start;
- (NSSet)supportedKeyPaths;
- (RMClientCapabilitiesController)initWithSubscribedStatusKeyPathUpdater:(id)a3;
- (RMSubscribedStatusKeyPathUpdater)subscribedStatusUpdater;
- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5;
- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6;
- (void)_notifyChangesIfNeeded;
- (void)setSubscribedStatusUpdater:(id)a3;
@end

@implementation RMClientCapabilitiesController

+ (RMClientCapabilitiesController)sharedController
{
  if (qword_1000DB018 != -1) {
    dispatch_once(&qword_1000DB018, &stru_1000C50B8);
  }
  v2 = (void *)qword_1000DB010;

  return (RMClientCapabilitiesController *)v2;
}

- (RMClientCapabilitiesController)initWithSubscribedStatusKeyPathUpdater:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMClientCapabilitiesController;
  v6 = [(RMClientCapabilitiesController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subscribedStatusUpdater, a3);
  }

  return v7;
}

+ (void)start
{
  if (qword_1000DB020 != -1) {
    dispatch_once(&qword_1000DB020, &stru_1000C50D8);
  }
}

- (void)_notifyChangesIfNeeded
{
  v3 = objc_opt_new();
  v4 = +[RMPersistentController sharedController];
  id v5 = [v4 persistentContainer];
  id v6 = [v5 newBackgroundContext];

  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_1000139BC;
  v13 = &unk_1000C5100;
  id v7 = v3;
  id v14 = v7;
  id v8 = v6;
  id v15 = v8;
  [v8 performBlockAndWait:&v10];
  if (objc_msgSend(v7, "count", v10, v11, v12, v13))
  {
    objc_super v9 = [(RMClientCapabilitiesController *)self subscribedStatusUpdater];
    [v9 notifyStatusDidChangeForKeyPathsByManagementSourceObjectID:v7];
  }
  else
  {
    objc_super v9 = +[RMLog clientCapabilitiesController];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100013EDC(v9);
    }
  }
}

- (NSSet)supportedKeyPaths
{
  return +[NSSet setWithObject:RMModelStatusItemManagementClientCapabilities];
}

- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5
{
  id v6 = a4;
  uint64_t v7 = RMModelStatusItemManagementClientCapabilities;
  if ([a3 containsObject:RMModelStatusItemManagementClientCapabilities])
  {
    id v8 = +[RMCapabilities capabilitiesForEnrollmentType:scope:protocolType:](RMCapabilities, "capabilitiesForEnrollmentType:scope:protocolType:", [v6 type], +[RMBundle managementScope](RMBundle, "managementScope"), objc_msgSend(v6, "protocolType"));
    uint64_t v13 = v7;
    objc_super v9 = [v8 status];
    v10 = [v9 serializeWithType:1];
    id v14 = v10;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  }
  else
  {
    uint64_t v11 = &__NSDictionary0__struct;
  }

  return v11;
}

- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6
{
  return [(RMClientCapabilitiesController *)self queryForStatusWithKeyPaths:a3 onBehalfOfManagementChannel:a5 error:a6];
}

- (RMSubscribedStatusKeyPathUpdater)subscribedStatusUpdater
{
  return self->_subscribedStatusUpdater;
}

- (void)setSubscribedStatusUpdater:(id)a3
{
}

- (void).cxx_destruct
{
}

@end