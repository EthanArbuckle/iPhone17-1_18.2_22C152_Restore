@interface PBEnterpriseInfo
+ (id)sharedInstance;
- (NSString)orgName;
- (PBEnterpriseInfo)init;
- (void)updateOrgName;
@end

@implementation PBEnterpriseInfo

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006F3C;
  block[3] = &unk_100030CE0;
  block[4] = a1;
  if (qword_100039518 != -1) {
    dispatch_once(&qword_100039518, block);
  }
  v2 = (void *)qword_100039510;
  return v2;
}

- (PBEnterpriseInfo)init
{
  v12.receiver = self;
  v12.super_class = (Class)PBEnterpriseInfo;
  v2 = [(PBEnterpriseInfo *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("PBEnterpriseInfo-queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    [(PBEnterpriseInfo *)v2 updateOrgName];
    int out_token = 0;
    objc_initWeak(&location, v2);
    v5 = (const char *)[MDMManagingOrgInfoChangedNotification cStringUsingEncoding:4];
    v6 = v2->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000070B4;
    handler[3] = &unk_100030D08;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch(v5, &out_token, v6, handler);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (NSString)orgName
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100007224;
  v10 = sub_100007234;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000723C;
  v5[3] = &unk_100030D30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)updateOrgName
{
  id v3 = +[MCProfileConnection sharedConnection];
  v4 = [v3 managingOrganizationInformation];
  v5 = [v4 objectForKeyedSubscript:kMCCCOrganizationNameKey];
  orgName = self->_orgName;
  self->_orgName = v5;

  v7 = _PBLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = self->_orgName;
    int v9 = 138543362;
    v10 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Updated MDM organization name: %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orgName, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end