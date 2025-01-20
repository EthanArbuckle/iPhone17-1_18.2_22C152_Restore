@interface ICMigrationDeviceInfo
+ (void)logDeviceList:(id)a3;
- (BOOL)isIOSDevice;
- (BOOL)isOSXDevice;
- (BOOL)shouldBeHidden;
- (BOOL)upgradable;
- (BOOL)upgradableTo2019OSes;
- (BOOL)upgradableToSydneyRomeKincaid;
- (BOOL)upgraded;
- (BOOL)upgradedTo2019OSes;
- (BOOL)upgradedToSydneyRomeKincaid;
- (ICMigrationDeviceInfo)initWithName:(id)a3;
- (ICMigrationDeviceInfo)initWithName:(id)a3 upgradable:(BOOL)a4 upgraded:(BOOL)a5;
- (NSString)name;
- (id)loggableDescription;
@end

@implementation ICMigrationDeviceInfo

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

- (id)loggableDescription
{
  return [(ICMigrationDeviceInfo *)self description];
}

+ (void)logDeviceList:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v14;
    *(void *)&long long v5 = 138412290;
    long long v12 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v8);
        v10 = +[REMLogStore utility];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = [v9 loggableDescription];
          *(_DWORD *)buf = v12;
          v18 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v6);
  }
}

- (BOOL)upgradedTo2019OSes
{
  return 0;
}

- (BOOL)upgradableTo2019OSes
{
  return 1;
}

- (BOOL)upgradedToSydneyRomeKincaid
{
  return 0;
}

- (BOOL)upgradableToSydneyRomeKincaid
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)upgraded
{
  return self->_upgraded;
}

- (BOOL)upgradable
{
  return self->_upgradable;
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