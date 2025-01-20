@interface RMInternalStateArchiver
+ (RMInternalStateArchiver)sharedArchiver;
- (NSDictionary)deviceStatusByKeyPath;
- (NSDictionary)pushTokenByEnvironmentName;
- (NSPersistentContainer)persistentContainer;
- (NSPersistentHistoryToken)commandAndDeclarationStatusPersistentHistoryToken;
- (RMInternalStateArchiver)initWithPersistentContainer:(id)a3;
- (RMPersistentActiveIdentifiers)persistentActiveIdentifiers;
- (id)_unarchiveObjectOfClass:(Class)a3 forKey:(id)a4;
- (id)_unarchiveObjectOfClasses:(id)a3 forKey:(id)a4;
- (void)_archiveObject:(id)a3 forKey:(id)a4;
- (void)configurationPublisher:(id)a3 didChangePersistentActiveIdentifiers:(id)a4;
- (void)internalStatusPublisher:(id)a3 didChangeCommandAndDeclarationsPersistentHistoryToken:(id)a4;
- (void)internalStatusPublisher:(id)a3 didChangeDeviceStatusByKeyPath:(id)a4;
- (void)pushController:(id)a3 didChangePushTokenByEnvironmentName:(id)a4;
- (void)setCommandAndDeclarationStatusPersistentHistoryToken:(id)a3;
- (void)setDeviceStatusByKeyPath:(id)a3;
- (void)setPersistentActiveIdentifiers:(id)a3;
- (void)setPushTokenByEnvironmentName:(id)a3;
@end

@implementation RMInternalStateArchiver

+ (RMInternalStateArchiver)sharedArchiver
{
  if (qword_1000DB1A0 != -1) {
    dispatch_once(&qword_1000DB1A0, &stru_1000C6040);
  }
  v2 = (void *)qword_1000DB198;

  return (RMInternalStateArchiver *)v2;
}

- (void)setCommandAndDeclarationStatusPersistentHistoryToken:(id)a3
{
}

- (NSPersistentHistoryToken)commandAndDeclarationStatusPersistentHistoryToken
{
  uint64_t v3 = objc_opt_class();

  return (NSPersistentHistoryToken *)[(RMInternalStateArchiver *)self _unarchiveObjectOfClass:v3 forKey:@"InternalStateArchiver.CommandAndDeclarationsPersistentHistoryToken"];
}

- (void)setDeviceStatusByKeyPath:(id)a3
{
}

- (NSDictionary)deviceStatusByKeyPath
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v11 = [(RMInternalStateArchiver *)self _unarchiveObjectOfClasses:v10 forKey:@"InternalStateArchiver.DeviceStatusByKeyPath"];

  return (NSDictionary *)v11;
}

- (void)setPersistentActiveIdentifiers:(id)a3
{
}

- (RMPersistentActiveIdentifiers)persistentActiveIdentifiers
{
  uint64_t v3 = objc_opt_class();

  return (RMPersistentActiveIdentifiers *)[(RMInternalStateArchiver *)self _unarchiveObjectOfClass:v3 forKey:@"InternalStateArchiver.PersistentActiveIdentifiers"];
}

- (void)setPushTokenByEnvironmentName:(id)a3
{
}

- (NSDictionary)pushTokenByEnvironmentName
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, objc_opt_class(), 0);
  uint64_t v6 = [(RMInternalStateArchiver *)self _unarchiveObjectOfClasses:v5 forKey:@"InternalStateArchiver.PushTokenByEnvironmentName"];

  return (NSDictionary *)v6;
}

- (RMInternalStateArchiver)initWithPersistentContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMInternalStateArchiver;
  uint64_t v6 = [(RMInternalStateArchiver *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistentContainer, a3);
  }

  return v7;
}

- (void)configurationPublisher:(id)a3 didChangePersistentActiveIdentifiers:(id)a4
{
}

- (void)internalStatusPublisher:(id)a3 didChangeDeviceStatusByKeyPath:(id)a4
{
}

- (void)internalStatusPublisher:(id)a3 didChangeCommandAndDeclarationsPersistentHistoryToken:(id)a4
{
}

- (void)pushController:(id)a3 didChangePushTokenByEnvironmentName:(id)a4
{
}

- (void)_archiveObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v11 = [(RMInternalStateArchiver *)self persistentContainer];
  uint64_t v8 = [v11 persistentStoreCoordinator];
  objc_super v9 = [v8 persistentStores];
  v10 = [v9 firstObject];
  +[RMPersistentController archiveObject:v7 forKey:v6 intoMetadataForPersistentStore:v10];
}

- (id)_unarchiveObjectOfClass:(Class)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(RMInternalStateArchiver *)self persistentContainer];
  uint64_t v8 = [v7 persistentStoreCoordinator];
  objc_super v9 = [v8 persistentStores];
  v10 = [v9 firstObject];
  id v11 = +[RMPersistentController unarchiveObjectOfClass:a3 forKey:v6 fromMetadataForPersistentStore:v10];

  return v11;
}

- (id)_unarchiveObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(RMInternalStateArchiver *)self persistentContainer];
  objc_super v9 = [v8 persistentStoreCoordinator];
  v10 = [v9 persistentStores];
  id v11 = [v10 firstObject];
  v12 = +[RMPersistentController unarchiveObjectOfClasses:v7 forKey:v6 fromMetadataForPersistentStore:v11];

  return v12;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void).cxx_destruct
{
}

@end