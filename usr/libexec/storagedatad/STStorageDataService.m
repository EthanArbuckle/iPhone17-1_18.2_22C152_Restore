@interface STStorageDataService
- (void)storageInfoDict:(id)a3;
@end

@implementation STStorageDataService

- (void)storageInfoDict:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  v4 = sub_100002B5C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling request for StorageData info", v7, 2u);
  }

  id v5 = objc_alloc_init((Class)STStorageDataInterface);
  v6 = [v5 storageInfoDict];
  if (v3) {
    v3[2](v3, v6);
  }
}

@end