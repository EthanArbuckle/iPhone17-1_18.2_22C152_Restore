@interface SAPersistenceManagerSettings
- (NSString)persistenceStoreFileName;
- (NSURL)persistenceDirectoryURL;
- (SAPersistenceManagerSettings)init;
- (SAPersistenceManagerSettings)initWithDirectoryURLOrDefault:(id)a3 storeFileNameOrDefault:(id)a4;
- (id)_getStoreURL;
- (void)setPersistenceDirectoryURL:(id)a3;
- (void)setPersistenceStoreFileName:(id)a3;
@end

@implementation SAPersistenceManagerSettings

- (SAPersistenceManagerSettings)init
{
  return [(SAPersistenceManagerSettings *)self initWithDirectoryURLOrDefault:0 storeFileNameOrDefault:0];
}

- (SAPersistenceManagerSettings)initWithDirectoryURLOrDefault:(id)a3 storeFileNameOrDefault:(id)a4
{
  id v6 = a3;
  v7 = (__CFString *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SAPersistenceManagerSettings;
  v8 = [(SAPersistenceManagerSettings *)&v13 init];
  if (v8)
  {
    if (v6)
    {
      v9 = (NSURL *)v6;
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/root/Library/Caches/locationd/TrackingAvoidance/" isDirectory:1];
    }
    persistenceDirectoryURL = v8->_persistenceDirectoryURL;
    v8->_persistenceDirectoryURL = v9;

    if (v7) {
      v11 = v7;
    }
    else {
      v11 = @"separationalerts.bin";
    }
    objc_storeStrong((id *)&v8->_persistenceStoreFileName, v11);
  }

  return v8;
}

- (id)_getStoreURL
{
  return (id)[MEMORY[0x1E4F1CB10] fileURLWithPath:self->_persistenceStoreFileName relativeToURL:self->_persistenceDirectoryURL];
}

- (NSURL)persistenceDirectoryURL
{
  return self->_persistenceDirectoryURL;
}

- (void)setPersistenceDirectoryURL:(id)a3
{
}

- (NSString)persistenceStoreFileName
{
  return self->_persistenceStoreFileName;
}

- (void)setPersistenceStoreFileName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceStoreFileName, 0);
  objc_storeStrong((id *)&self->_persistenceDirectoryURL, 0);
}

@end