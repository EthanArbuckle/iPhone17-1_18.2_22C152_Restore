@interface ICMigrationDeviceInfo
+ (void)logDeviceList:(id)a3;
- (BOOL)isIOSDevice;
- (BOOL)isOSXDevice;
- (BOOL)shouldBeHidden;
- (BOOL)upgradable;
- (BOOL)upgradableToIOS13;
- (BOOL)upgradableToIOS14orMacOS11;
- (BOOL)upgraded;
- (BOOL)upgradedToIOS13;
- (BOOL)upgradedToIOS14EorMacOS11E;
- (ICMigrationDeviceInfo)init;
- (ICMigrationDeviceInfo)initWithName:(id)a3;
- (ICMigrationDeviceInfo)initWithName:(id)a3 upgradable:(BOOL)a4 upgraded:(BOOL)a5;
- (NSString)name;
- (id)attributedStringWithAttributes:(id)a3 asteriskColor:(id)a4;
@end

@implementation ICMigrationDeviceInfo

- (ICMigrationDeviceInfo)init
{
  return 0;
}

- (ICMigrationDeviceInfo)initWithName:(id)a3 upgradable:(BOOL)a4 upgraded:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICMigrationDeviceInfo;
  v10 = [(ICMigrationDeviceInfo *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_name, a3);
    v11->_upgradable = a4;
    v11->_upgraded = a5;
  }

  return v11;
}

- (ICMigrationDeviceInfo)initWithName:(id)a3
{
  return [(ICMigrationDeviceInfo *)self initWithName:a3 upgradable:1 upgraded:0];
}

- (BOOL)shouldBeHidden
{
  return 0;
}

+ (void)logDeviceList:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = os_log_create("com.apple.notes", "Migration");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = [v8 loggableDescription];
          *(_DWORD *)buf = 138412290;
          v16 = v10;
          _os_log_impl(&dword_1C3A61000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
}

- (id)attributedStringWithAttributes:(id)a3 asteriskColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v9 = [(ICMigrationDeviceInfo *)self name];
  v10 = (void *)[v8 initWithString:v9 attributes:v6];

  if (![(ICMigrationDeviceInfo *)self upgradable])
  {
    long long v11 = (void *)[v6 mutableCopy];
    [v11 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4FB0700]];
    long long v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" *" attributes:v11];
    [v10 appendAttributedString:v12];
  }
  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)upgraded
{
  return self->_upgraded;
}

- (BOOL)upgradedToIOS13
{
  return self->_upgradedToIOS13;
}

- (BOOL)upgradedToIOS14EorMacOS11E
{
  return self->_upgradedToIOS14EorMacOS11E;
}

- (BOOL)upgradable
{
  return self->_upgradable;
}

- (BOOL)upgradableToIOS13
{
  return self->_upgradableToIOS13;
}

- (BOOL)upgradableToIOS14orMacOS11
{
  return self->_upgradableToIOS14orMacOS11;
}

- (BOOL)isOSXDevice
{
  return self->_isOSXDevice;
}

- (BOOL)isIOSDevice
{
  return self->_isIOSDevice;
}

- (void).cxx_destruct
{
}

@end