@interface CLPersistenceStore
- (BOOL)loadWithCoordinator:(id)a3;
- (CLPersistenceStore)initWithURL:(id)a3 useCloudKit:(BOOL)a4;
- (NSDictionary)options;
- (NSString)storeType;
- (NSURL)url;
- (id)persistentStoreDescription;
- (void)dealloc;
- (void)setUpCloudKit;
- (void)setUpCloudKitForProd;
- (void)setUpCloudKitForTest;
@end

@implementation CLPersistenceStore

- (CLPersistenceStore)initWithURL:(id)a3 useCloudKit:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLPersistenceStore.m", 36, @"Invalid parameter not satisfying: %@", @"URL" object file lineNumber description];
  }
  v10.receiver = self;
  v10.super_class = (Class)CLPersistenceStore;
  v7 = [(CLPersistenceStore *)&v10 init];
  if (v7)
  {
    v8 = (NSPersistentStoreDescription *)objc_opt_new();
    v7->_storeDescription = v8;
    [(NSPersistentStoreDescription *)v8 setShouldAddStoreAsynchronously:0];
    [(NSPersistentStoreDescription *)v7->_storeDescription setShouldMigrateStoreAutomatically:1];
    [(NSPersistentStoreDescription *)v7->_storeDescription setShouldInferMappingModelAutomatically:1];
    [(NSPersistentStoreDescription *)v7->_storeDescription setURL:a3];
    [(NSPersistentStoreDescription *)v7->_storeDescription setType:NSSQLiteStoreType];
    [(NSPersistentStoreDescription *)v7->_storeDescription setOption:NSFileProtectionCompleteUnlessOpen forKey:NSPersistentStoreFileProtectionKey];
    [(NSPersistentStoreDescription *)v7->_storeDescription setValue:@"WAL" forPragmaNamed:@"journal_mode"];
    if (v4) {
      [(CLPersistenceStore *)v7 setUpCloudKit];
    }
  }
  return v7;
}

- (void)setUpCloudKit
{
  if ([@"com.apple.locationd.clx" isEqualToString:@"com.apple.locationd.clx"])
  {
    [(CLPersistenceStore *)self setUpCloudKitForProd];
  }
  else if ([@"com.apple.locationd.clx" isEqualToString:@"com.apple.locationd.clx.test"])
  {
    [(CLPersistenceStore *)self setUpCloudKitForTest];
  }
  else
  {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"CLPersistenceStore.m", 74, @"CoreData+CloudKit, Please implement setUpCloudKit for this new container %@", @"com.apple.locationd.clx" object file lineNumber description];
  }
}

- (void)setUpCloudKitForProd
{
  id v3 = objc_alloc_init((Class)CKContainerOptions);
  [v3 setUseZoneWidePCS:1];
  id v4 = [objc_alloc((Class)NSCloudKitMirroringDelegateOptions) initWithContainerIdentifier:@"com.apple.locationd.clx"];
  [v4 setContainerOptions:v3];
  [v4 setUseDeviceToDeviceEncryption:1];
  [v4 setOperationMemoryThresholdBytes:&off_102394328];
  id v5 = [objc_alloc((Class)NSCloudKitMirroringDelegate) initWithOptions:v4];
  [(NSPersistentStoreDescription *)self->_storeDescription setMirroringDelegate:v5];
  id v6 = [objc_alloc((Class)NSPersistentCloudKitContainerOptions) initWithContainerIdentifier:@"com.apple.locationd.clx"];
  [v6 setApsConnectionMachServiceName:@"com.apple.aps.locationd"];
  [v6 setUseDeviceToDeviceEncryption:1];
  [(NSPersistentStoreDescription *)self->_storeDescription setCloudKitContainerOptions:v6];
  [(NSPersistentStoreDescription *)self->_storeDescription setOption:+[NSNumber numberWithInt:2] forKey:NSPersistentStoreConnectionPoolMaxSizeKey];
}

- (void)setUpCloudKitForTest
{
  id v3 = [objc_alloc((Class)NSCloudKitMirroringDelegateOptions) initWithContainerIdentifier:@"com.apple.locationd.clx"];
  id v4 = [objc_alloc((Class)NSCloudKitMirroringDelegate) initWithOptions:v3];
  [(NSPersistentStoreDescription *)self->_storeDescription setMirroringDelegate:v4];
  id v5 = [objc_alloc((Class)NSPersistentCloudKitContainerOptions) initWithContainerIdentifier:@"com.apple.locationd.clx"];
  [v5 setApsConnectionMachServiceName:@"com.apple.aps.locationd"];
  [(NSPersistentStoreDescription *)self->_storeDescription setCloudKitContainerOptions:v5];
}

- (BOOL)loadWithCoordinator:(id)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = sub_100177EF8;
  v12 = sub_100177674;
  uint64_t v13 = 0;
  storeDescription = self->_storeDescription;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_101196770;
  v7[3] = &unk_10230F7A0;
  v7[4] = &v8;
  [a3 addPersistentStoreWithDescription:storeDescription completionHandler:v7];
  uint64_t v5 = v9[5];
  if (v5) {
    NSLog(@"CoreData, Could not add store with error = %@", v9[5]);
  }
  else {
    NSLog(@"CoreData, Successfully loaded store into NSPersistentStoreCoordinator!");
  }
  _Block_object_dispose(&v8, 8);
  return v5 == 0;
}

- (NSURL)url
{
  return [(NSPersistentStoreDescription *)self->_storeDescription URL];
}

- (NSString)storeType
{
  return [(NSPersistentStoreDescription *)self->_storeDescription type];
}

- (NSDictionary)options
{
  return [(NSPersistentStoreDescription *)self->_storeDescription options];
}

- (id)persistentStoreDescription
{
  return self->_storeDescription;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLPersistenceStore;
  [(CLPersistenceStore *)&v3 dealloc];
}

@end