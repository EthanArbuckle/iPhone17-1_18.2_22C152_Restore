@interface PersistentStore
- (BOOL)_loadStoreCoordinatorWithIntegrityCheck:(BOOL)a3 error:(id *)a4;
- (BOOL)loadStoreCoordinatorWithOptions:(id)a3 error:(id *)a4;
- (BOOL)performLightweightMigration:(id *)a3;
- (BOOL)resetStore:(id *)a3;
- (NSURL)databaseFileURL;
- (NSURL)modelFileURL;
- (PersistentStore)init;
- (PersistentStore)initWithConfiguration:(id)a3 error:(id *)a4;
- (PersistentStoreConfiguration)configuration;
- (id)_baseFilePath;
- (id)_newLegacyManagedObjectModel;
- (id)beginThreadContextSession;
- (id)managedObjectModel;
- (void)checkIntegrityWithInitializationBlock:(id)a3;
- (void)dealloc;
- (void)endThreadContextSession;
@end

@implementation PersistentStore

- (PersistentStore)init
{
  return [(PersistentStore *)self initWithConfiguration:0 error:0];
}

- (PersistentStore)initWithConfiguration:(id)a3 error:(id *)a4
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"PersistentStore.m" lineNumber:35 description:@"Must provide a configuration"];
  }
  v10.receiver = self;
  v10.super_class = (Class)PersistentStore;
  v7 = [(PersistentStore *)&v10 init];
  if (v7)
  {
    v7->_configuration = (PersistentStoreConfiguration *)[a3 copy];
    if ([(PersistentStore *)v7 _loadStoreCoordinatorWithIntegrityCheck:0 error:a4])
    {
      id v8 = (id)[(PersistentStoreConfiguration *)v7->_configuration storeType];
      v7->_threadContextKey = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"itunesstored.store-context.%d", v8);
      v7->_threadCountKey = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"itunesstored.store-count.%d", v8);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PersistentStore;
  [(PersistentStore *)&v3 dealloc];
}

- (id)beginThreadContextSession
{
  objc_super v3 = [+[NSThread currentThread] threadDictionary];
  id v4 = [(NSMutableDictionary *)v3 objectForKey:self->_threadContextKey];
  if (!v4)
  {
    id v5 = objc_alloc((Class)NSManagedObjectContext);
    id v6 = [v5 initWithConcurrencyType:_NSBackgroundThreadConfinementConcurrencyType];
    id v4 = v6;
    if (!v6) {
      return v4;
    }
    [v6 setPersistentStoreCoordinator:self->_storeCoordinator];
    [v4 setUndoManager:0];
    [(NSMutableDictionary *)v3 setObject:v4 forKey:self->_threadContextKey];
  }
  id v7 = [(NSMutableDictionary *)v3 objectForKey:self->_threadCountKey];
  id v8 = objc_alloc((Class)NSNumber);
  if (v7) {
    uint64_t v9 = (uint64_t)[v7 integerValue] + 1;
  }
  else {
    uint64_t v9 = 1;
  }
  id v10 = [v8 initWithInteger:v9];
  [(NSMutableDictionary *)v3 setObject:v10 forKey:self->_threadCountKey];

  return v4;
}

- (void)checkIntegrityWithInitializationBlock:(id)a3
{
  id v5 = objc_msgSend(-[PersistentStore _baseFilePath](self, "_baseFilePath"), "stringByAppendingPathComponent:", -[PersistentStoreConfiguration integrityCookieFileName](self->_configuration, "integrityCookieFileName"));
  if (v5)
  {
    id v6 = v5;
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_INFO)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v23 = 138412546;
      uint64_t v24 = objc_opt_class();
      __int16 v25 = 2112;
      id v26 = v6;
      LODWORD(v22) = 22;
      v21 = &v23;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v23, v22);
        free(v11);
        v21 = (int *)v12;
        SSFileLog();
      }
    }
    id v13 = objc_alloc_init((Class)NSFileManager);
    if ([v13 fileExistsAtPath:v6])
    {
      id v14 = +[SSLogConfig sharedDaemonConfig];
      if (!v14) {
        id v14 = +[SSLogConfig sharedConfig];
      }
      unsigned int v15 = objc_msgSend(v14, "shouldLog", v21);
      if ([v14 shouldLogToDisk]) {
        int v16 = v15 | 2;
      }
      else {
        int v16 = v15;
      }
      if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v16 &= 2u;
      }
      if (v16)
      {
        uint64_t v17 = objc_opt_class();
        int v23 = 138412290;
        uint64_t v24 = v17;
        LODWORD(v22) = 12;
        v21 = &v23;
        uint64_t v18 = _os_log_send_and_compose_impl();
        if (v18)
        {
          v19 = (void *)v18;
          v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v23, v22);
          free(v19);
          v21 = (int *)v20;
          SSFileLog();
        }
      }

      self->_storeCoordinator = 0;
      [(PersistentStore *)self _loadStoreCoordinatorWithIntegrityCheck:1 error:0];
    }
    objc_msgSend(v13, "createFileAtPath:contents:attributes:", v6, 0, 0, v21);
    (*((void (**)(id))a3 + 2))(a3);
    [v13 removeItemAtPath:v6 error:0];
  }
}

- (PersistentStoreConfiguration)configuration
{
  id v2 = [(PersistentStoreConfiguration *)self->_configuration copy];

  return (PersistentStoreConfiguration *)v2;
}

- (NSURL)databaseFileURL
{
  result = (NSURL *)objc_msgSend(-[PersistentStore _baseFilePath](self, "_baseFilePath"), "stringByAppendingPathComponent:", -[PersistentStoreConfiguration databaseFileName](self->_configuration, "databaseFileName"));
  if (result)
  {
    return +[NSURL fileURLWithPath:result];
  }
  return result;
}

- (void)endThreadContextSession
{
  objc_super v3 = [+[NSThread currentThread] threadDictionary];
  uint64_t v4 = (uint64_t)objc_msgSend(-[NSMutableDictionary objectForKey:](v3, "objectForKey:", self->_threadCountKey), "integerValue");
  if (v4 >= 1)
  {
    if (v4 == 1)
    {
      [(NSMutableDictionary *)v3 removeObjectForKey:self->_threadCountKey];
      threadContextKey = self->_threadContextKey;
      [(NSMutableDictionary *)v3 removeObjectForKey:threadContextKey];
    }
    else
    {
      id v6 = [objc_alloc((Class)NSNumber) initWithInteger:v4 - 1];
      [(NSMutableDictionary *)v3 setObject:v6 forKey:self->_threadCountKey];
    }
  }
}

- (NSURL)modelFileURL
{
  result = (NSURL *)objc_msgSend(objc_msgSend(-[NSArray objectAtIndex:](-[NSProcessInfo arguments](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "arguments"), "objectAtIndex:", 0), "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", -[PersistentStoreConfiguration modelFileName](self->_configuration, "modelFileName"));
  if (result)
  {
    return +[NSURL fileURLWithPath:result];
  }
  return result;
}

- (BOOL)performLightweightMigration:(id *)a3
{
  v38 = 0;
  id v5 = [(PersistentStore *)self managedObjectModel];
  id v6 = [(PersistentStore *)self _newLegacyManagedObjectModel];
  if (!v6)
  {
    id v21 = +[SSLogConfig sharedDaemonConfig];
    if (!v21) {
      id v21 = +[SSLogConfig sharedConfig];
    }
    unsigned int v22 = [v21 shouldLog];
    if ([v21 shouldLogToDisk]) {
      int v23 = v22 | 2;
    }
    else {
      int v23 = v22;
    }
    if (!os_log_type_enabled((os_log_t)[v21 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v23 &= 2u;
    }
    if (v23)
    {
      int v39 = 138412290;
      uint64_t v40 = objc_opt_class();
      LODWORD(v35) = 12;
LABEL_33:
      v20 = (void *)_os_log_send_and_compose_impl();
      if (!v20) {
        goto LABEL_55;
      }
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v39, v35);
      free(v20);
      SSFileLog();
    }
LABEL_35:
    LOBYTE(v20) = 0;
    goto LABEL_55;
  }
  id v7 = +[NSMappingModel inferredMappingModelForSourceModel:v6 destinationModel:v5 error:&v38];
  if (!v7)
  {
    id v24 = +[SSLogConfig sharedDaemonConfig];
    if (!v24) {
      id v24 = +[SSLogConfig sharedConfig];
    }
    unsigned int v25 = [v24 shouldLog];
    if ([v24 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    if (!os_log_type_enabled((os_log_t)[v24 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v26 &= 2u;
    }
    if (v26)
    {
      uint64_t v27 = objc_opt_class();
      int v39 = 138412546;
      uint64_t v40 = v27;
      __int16 v41 = 2112;
      v42 = v38;
      LODWORD(v35) = 22;
      goto LABEL_33;
    }
    goto LABEL_35;
  }
  unsigned int v8 = v7;
  v37 = a3;
  int v9 = [(PersistentStore *)self databaseFileURL];
  uint64_t v10 = [(NSURL *)v9 URLByAppendingPathExtension:@"migrated"];
  id v11 = objc_alloc_init((Class)NSFileManager);
  [v11 removeItemAtURL:v10 error:0];
  id v12 = +[SSLogConfig sharedDaemonConfig];
  if (!v12) {
    id v12 = +[SSLogConfig sharedConfig];
  }
  unsigned int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    v13 |= 2u;
  }
  if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_INFO)) {
    v13 &= 2u;
  }
  if (v13)
  {
    uint64_t v14 = objc_opt_class();
    int v39 = 138412546;
    uint64_t v40 = v14;
    __int16 v41 = 2112;
    v42 = v9;
    LODWORD(v35) = 22;
    v34 = &v39;
    uint64_t v15 = _os_log_send_and_compose_impl();
    if (v15)
    {
      int v16 = (void *)v15;
      uint64_t v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v39, v35);
      free(v16);
      v34 = (int *)v17;
      SSFileLog();
    }
  }
  id v18 = objc_msgSend(objc_alloc((Class)objc_msgSend(objc_msgSend(-[NSDictionary objectForKey:](+[NSPersistentStoreCoordinator registeredStoreTypes](NSPersistentStoreCoordinator, "registeredStoreTypes", v34), "objectForKey:", NSSQLiteStoreType), "pointerValue"), "migrationManagerClass")), "initWithSourceModel:destinationModel:", v6, v5);
  if (([v18 migrateStoreFromURL:v9 type:NSSQLiteStoreType options:0 withMappingModel:v8 toDestinationURL:v10 destinationType:NSSQLiteStoreType destinationOptions:0 error:&v38] & 1) == 0)
  {
    id v28 = +[SSLogConfig sharedDaemonConfig];
    v19 = v11;
    if (!v28) {
      id v28 = +[SSLogConfig sharedConfig];
    }
    unsigned int v29 = [v28 shouldLog];
    if ([v28 shouldLogToDisk]) {
      v29 |= 2u;
    }
    if (!os_log_type_enabled((os_log_t)[v28 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v29 &= 2u;
    }
    a3 = v37;
    if (!v29) {
      goto LABEL_53;
    }
LABEL_51:
    uint64_t v32 = objc_opt_class();
    int v39 = 138412546;
    uint64_t v40 = v32;
    __int16 v41 = 2112;
    v42 = v38;
    LODWORD(v36) = 22;
    v20 = (void *)_os_log_send_and_compose_impl();
    if (!v20) {
      goto LABEL_54;
    }
    +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v39, v36);
    free(v20);
    SSFileLog();
LABEL_53:
    LOBYTE(v20) = 0;
    goto LABEL_54;
  }
  v19 = v11;
  [v11 removeItemAtURL:v9 error:0];
  if (([v11 moveItemAtURL:v10 toURL:v9 error:&v38] & 1) == 0)
  {
    id v30 = +[SSLogConfig sharedDaemonConfig];
    a3 = v37;
    if (!v30) {
      id v30 = +[SSLogConfig sharedConfig];
    }
    unsigned int v31 = [v30 shouldLog];
    if ([v30 shouldLogToDisk]) {
      v31 |= 2u;
    }
    if (!os_log_type_enabled((os_log_t)[v30 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v31 &= 2u;
    }
    if (!v31) {
      goto LABEL_53;
    }
    goto LABEL_51;
  }
  LOBYTE(v20) = 1;
  a3 = v37;
LABEL_54:

LABEL_55:
  if (a3) {
    *a3 = v38;
  }
  return (char)v20;
}

- (BOOL)resetStore:(id *)a3
{
  int v26 = 0;
  id v5 = [(PersistentStore *)self databaseFileURL];
  id v6 = v5;
  if (self->_storeCoordinator)
  {
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      int v27 = 138412546;
      uint64_t v28 = objc_opt_class();
      __int16 v29 = 2112;
      p_isa = (NSString *)&v6->super.isa;
      LODWORD(v25) = 22;
      id v24 = &v27;
      uint64_t v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        id v11 = (void *)v10;
        id v12 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v27, v25);
        free(v11);
        id v24 = (int *)v12;
        SSFileLog();
      }
    }
    unsigned __int8 v13 = -[NSPersistentStoreCoordinator destroyPersistentStoreAtURL:withType:options:error:](self->_storeCoordinator, "destroyPersistentStoreAtURL:withType:options:error:", v6, NSSQLiteStoreType, 0, &v26, v24);
    if (a3) {
LABEL_13:
    }
      *a3 = v26;
  }
  else
  {
    uint64_t v15 = [(NSURL *)v5 path];
    id v16 = objc_alloc_init((Class)NSFileManager);
    uint64_t v17 = [(NSString *)v15 stringByAppendingPathExtension:@"bad"];
    id v18 = +[SSLogConfig sharedDaemonConfig];
    if (!v18) {
      id v18 = +[SSLogConfig sharedConfig];
    }
    unsigned int v19 = [v18 shouldLog];
    if ([v18 shouldLogToDisk]) {
      int v20 = v19 | 2;
    }
    else {
      int v20 = v19;
    }
    if (!os_log_type_enabled((os_log_t)[v18 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v20 &= 2u;
    }
    if (v20)
    {
      int v27 = 138412802;
      uint64_t v28 = objc_opt_class();
      __int16 v29 = 2112;
      p_isa = v15;
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      LODWORD(v25) = 32;
      id v24 = &v27;
      uint64_t v21 = _os_log_send_and_compose_impl();
      if (v21)
      {
        unsigned int v22 = (void *)v21;
        int v23 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v27, v25);
        free(v22);
        id v24 = (int *)v23;
        SSFileLog();
      }
    }
    objc_msgSend(v16, "removeItemAtPath:error:", v17, 0, v24);
    unsigned __int8 v13 = [v16 moveItemAtPath:v15 toPath:v17 error:&v26];

    if (a3) {
      goto LABEL_13;
    }
  }
  return v13;
}

- (BOOL)loadStoreCoordinatorWithOptions:(id)a3 error:(id *)a4
{
  v46 = 0;
  id v7 = [(PersistentStore *)self managedObjectModel];
  if (!v7)
  {
    id v20 = +[SSLogConfig sharedDaemonConfig];
    if (!v20) {
      id v20 = +[SSLogConfig sharedConfig];
    }
    unsigned int v21 = [v20 shouldLog];
    if ([v20 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    if (!os_log_type_enabled((os_log_t)[v20 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v22 &= 2u;
    }
    if (!v22) {
      goto LABEL_41;
    }
    int v49 = 138412290;
    uint64_t v50 = objc_opt_class();
    LODWORD(v44) = 12;
    uint64_t v23 = _os_log_send_and_compose_impl();
    if (!v23) {
      goto LABEL_41;
    }
    id v24 = (void *)v23;
    +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v23, 4, &v49, v44);
    free(v24);
LABEL_40:
    SSFileLog();
LABEL_41:
    if (a4) {
      *a4 = v46;
    }
    return self->_storeCoordinator != 0;
  }
  id v8 = v7;
  int v9 = [(PersistentStore *)self databaseFileURL];
  unsigned __int8 v10 = +[NSFileManager ensureDirectoryExists:[(NSString *)[(NSURL *)v9 path] stringByDeletingLastPathComponent]];
  id v11 = +[SSLogConfig sharedDaemonConfig];
  id v12 = v11;
  if ((v10 & 1) == 0)
  {
    if (!v11) {
      id v12 = +[SSLogConfig sharedConfig];
    }
    unsigned int v25 = [v12 shouldLog];
    if ([v12 shouldLogToDisk]) {
      int v26 = v25 | 2;
    }
    else {
      int v26 = v25;
    }
    if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v26 &= 2u;
    }
    if (!v26) {
      goto LABEL_41;
    }
    int v49 = 138412546;
    uint64_t v50 = objc_opt_class();
    __int16 v51 = 2112;
    v52 = v9;
    LODWORD(v44) = 22;
    uint64_t v27 = _os_log_send_and_compose_impl();
    if (!v27) {
      goto LABEL_41;
    }
    uint64_t v28 = (void *)v27;
    +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v27, 4, &v49, v44);
    free(v28);
    goto LABEL_40;
  }
  if (!v11) {
    id v12 = +[SSLogConfig sharedConfig];
  }
  unsigned int v13 = [v12 shouldLog];
  if ([v12 shouldLogToDisk]) {
    int v14 = v13 | 2;
  }
  else {
    int v14 = v13;
  }
  if (!os_log_type_enabled((os_log_t)[v12 OSLogObject], OS_LOG_TYPE_INFO)) {
    v14 &= 2u;
  }
  if (v14)
  {
    int v49 = 138412546;
    uint64_t v50 = objc_opt_class();
    __int16 v51 = 2112;
    v52 = v9;
    LODWORD(v44) = 22;
    uint64_t v15 = _os_log_send_and_compose_impl();
    if (v15)
    {
      id v16 = (void *)v15;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v49, v44);
      free(v16);
      SSFileLog();
    }
  }
  id v17 = [objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v8];
  id v18 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", NSFileProtectionCompleteUntilFirstUserAuthentication, NSPersistentStoreFileProtectionKey, 0);
  unsigned int v19 = v18;
  if (a3) {
    [v18 addEntriesFromDictionary:a3];
  }
  if ((objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", NSPersistentStoreFileProtectionKey), "isEqualToString:", NSFileProtectionNone) & 1) != 0|| MKBDeviceUnlockedSinceBoot())
  {
    if ([v17 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v9 options:v19 error:&v46])
    {
      goto LABEL_18;
    }
    if (!ISErrorIsEqual()) {
      goto LABEL_57;
    }
    id v30 = +[SSLogConfig sharedDaemonConfig];
    if (!v30) {
      id v30 = +[SSLogConfig sharedConfig];
    }
    unsigned int v31 = [v30 shouldLog];
    if ([v30 shouldLogToDisk]) {
      int v32 = v31 | 2;
    }
    else {
      int v32 = v31;
    }
    if (!os_log_type_enabled((os_log_t)[v30 OSLogObject], OS_LOG_TYPE_INFO)) {
      v32 &= 2u;
    }
    if (v32)
    {
      uint64_t v33 = objc_opt_class();
      int v49 = 138412290;
      uint64_t v50 = v33;
      LODWORD(v45) = 12;
      v43 = &v49;
      uint64_t v34 = _os_log_send_and_compose_impl();
      if (v34)
      {
        uint64_t v35 = (void *)v34;
        uint64_t v36 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4, &v49, v45);
        free(v35);
        v43 = (int *)v36;
        SSFileLog();
      }
    }
    if (-[PersistentStore performLightweightMigration:](self, "performLightweightMigration:", &v46, v43)
      && [v17 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v9 options:0 error:&v46])
    {
LABEL_18:

      self->_storeCoordinator = (NSPersistentStoreCoordinator *)v17;
    }
    else
    {
LABEL_57:
      id v37 = +[SSLogConfig sharedDaemonConfig];
      if (!v37) {
        id v37 = +[SSLogConfig sharedConfig];
      }
      unsigned int v38 = [v37 shouldLog];
      if ([v37 shouldLogToDisk]) {
        int v39 = v38 | 2;
      }
      else {
        int v39 = v38;
      }
      if (!os_log_type_enabled((os_log_t)[v37 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v39 &= 2u;
      }
      if (v39)
      {
        uint64_t v40 = objc_opt_class();
        int v49 = 138412546;
        uint64_t v50 = v40;
        __int16 v51 = 2112;
        v52 = v46;
        LODWORD(v45) = 22;
        uint64_t v41 = _os_log_send_and_compose_impl();
        if (v41)
        {
          v42 = (void *)v41;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v49, v45);
          free(v42);
          SSFileLog();
        }
      }
    }

    goto LABEL_41;
  }
  if (a4)
  {
    v47 = NSSQLiteErrorDomain;
    v48 = &off_1003C9138;
    *a4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 256, +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1]);
  }

  return 0;
}

- (id)managedObjectModel
{
  if (!self->_model)
  {
    id v3 = +[SSLogConfig sharedDaemonConfig];
    if (!v3) {
      id v3 = +[SSLogConfig sharedConfig];
    }
    unsigned int v4 = [v3 shouldLog];
    if ([v3 shouldLogToDisk]) {
      int v5 = v4 | 2;
    }
    else {
      int v5 = v4;
    }
    if (!os_log_type_enabled((os_log_t)[v3 OSLogObject], OS_LOG_TYPE_INFO)) {
      v5 &= 2u;
    }
    if (v5)
    {
      int v20 = 138412546;
      uint64_t v21 = objc_opt_class();
      __int16 v22 = 2112;
      uint64_t v23 = [(PersistentStore *)self modelFileURL];
      LODWORD(v19) = 22;
      id v18 = &v20;
      uint64_t v6 = _os_log_send_and_compose_impl();
      if (v6)
      {
        id v7 = (void *)v6;
        id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 4, &v20, v19);
        free(v7);
        id v18 = (int *)v8;
        SSFileLog();
      }
    }
    int v9 = (NSManagedObjectModel *)objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", -[PersistentStore modelFileURL](self, "modelFileURL"));
    self->_model = v9;
    if (!v9)
    {
      id v11 = +[SSLogConfig sharedDaemonConfig];
      if (!v11) {
        id v11 = +[SSLogConfig sharedConfig];
      }
      unsigned int v12 = objc_msgSend(v11, "shouldLog", v18);
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      if (!os_log_type_enabled((os_log_t)[v11 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v13 &= 2u;
      }
      if (v13)
      {
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = [(PersistentStore *)self modelFileURL];
        int v20 = 138412546;
        uint64_t v21 = v14;
        __int16 v22 = 2112;
        uint64_t v23 = v15;
        LODWORD(v19) = 22;
        uint64_t v16 = _os_log_send_and_compose_impl();
        if (v16)
        {
          id v17 = (void *)v16;
          +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v20, v19);
          free(v17);
          SSFileLog();
        }
      }
    }
  }
  return self->_model;
}

- (id)_baseFilePath
{
  id v2 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"Library"];

  return [v2 stringByAppendingPathComponent:@"com.apple.itunesstored"];
}

- (BOOL)_loadStoreCoordinatorWithIntegrityCheck:(BOOL)a3 error:(id *)a4
{
  id v6 = 0;
  id v10 = 0;
  if (a3)
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", +[NSNull null](NSNull, "null"), @"integrity_check", 0);
    id v6 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v7, NSSQLitePragmasOption, 0);
  }
  if ([(PersistentStore *)self loadStoreCoordinatorWithOptions:v6 error:&v10])
  {
    BOOL v8 = 1;
  }
  else if (ISErrorIsEqual() {
         && objc_msgSend(objc_msgSend(objc_msgSend(v10, "userInfo"), "objectForKeyedSubscript:", NSSQLiteErrorDomain), "intValue") == 23)
  }
  {
    BOOL v8 = 0;
  }
  else
  {
    [(PersistentStore *)self resetStore:0];
    BOOL v8 = [(PersistentStore *)self loadStoreCoordinatorWithOptions:v6 error:&v10];
  }

  if (a4) {
    *a4 = v10;
  }
  return v8;
}

- (id)_newLegacyManagedObjectModel
{
  id v3 = [(NSDictionary *)+[NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType URL:[(PersistentStore *)self databaseFileURL] options:0 error:0] objectForKey:@"NSStoreModelVersionHashes"];
  if (v3)
  {
    id v4 = v3;
    int v5 = [(PersistentStoreConfiguration *)self->_configuration legacyModelVersionIdentifiers];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        int v9 = 0;
        do
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", -[NSURL URLByAppendingPathExtension:](-[NSURL URLByAppendingPathComponent:](-[PersistentStore modelFileURL](self, "modelFileURL"), "URLByAppendingPathComponent:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v9)), "URLByAppendingPathExtension:", @"mom"));
          if (objc_msgSend(objc_msgSend(v10, "entityVersionHashesByName"), "isEqualToDictionary:", v4))
          {
            id v11 = v10;

            if (v11) {
              return v11;
            }
          }
          else
          {
          }
          int v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return 0;
}

@end