@interface BYSetupUserDisposition
+ (id)current;
- (BYSetupUserDisposition)init;
- (BYSetupUserDisposition)initWithChild:(BOOL)a3;
- (BYSetupUserDisposition)initWithNewUser:(BOOL)a3 child:(BOOL)a4;
- (BYSetupUserDisposition)initWithPreferences:(id)a3;
- (BYSetupUserDisposition)initWithProductVersion:(id)a3 buildVersion:(id)a4 date:(id)a5;
- (BYSetupUserDisposition)initWithProductVersion:(id)a3 buildVersion:(id)a4 date:(id)a5 newUser:(BOOL)a6 child:(BOOL)a7;
- (NSDate)date;
- (NSNumber)isChild;
- (NSNumber)isNewUser;
- (NSString)buildVersion;
- (NSString)productVersion;
- (id)_dictionaryRepresentation;
- (void)_loadDataFromPreferences:(id)a3;
- (void)persistUsingPreferences:(id)a3;
- (void)setBuildVersion:(id)a3;
- (void)setChild:(id)a3;
- (void)setDate:(id)a3;
- (void)setNewUser:(id)a3;
- (void)setProductVersion:(id)a3;
@end

@implementation BYSetupUserDisposition

- (BYSetupUserDisposition)init
{
  v3 = +[BYPreferencesController buddyPreferencesExcludedFromBackup];
  v4 = [(BYSetupUserDisposition *)self initWithPreferences:v3];

  return v4;
}

- (BYSetupUserDisposition)initWithPreferences:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BYSetupUserDisposition;
  v5 = [(BYSetupUserDisposition *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BYSetupUserDisposition *)v5 _loadDataFromPreferences:v4];
  }

  return v6;
}

- (BYSetupUserDisposition)initWithProductVersion:(id)a3 buildVersion:(id)a4 date:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BYSetupUserDisposition;
  v12 = [(BYSetupUserDisposition *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_productVersion, a3);
    objc_storeStrong((id *)&v13->_buildVersion, a4);
    objc_storeStrong((id *)&v13->_date, a5);
  }

  return v13;
}

- (BYSetupUserDisposition)initWithProductVersion:(id)a3 buildVersion:(id)a4 date:(id)a5 newUser:(BOOL)a6 child:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v9 = [(BYSetupUserDisposition *)self initWithProductVersion:a3 buildVersion:a4 date:a5];
  if (v9)
  {
    uint64_t v10 = [NSNumber numberWithBool:v8];
    newUser = v9->_newUser;
    v9->_newUser = (NSNumber *)v10;

    uint64_t v12 = [NSNumber numberWithBool:v7];
    child = v9->_child;
    v9->_child = (NSNumber *)v12;
  }
  return v9;
}

- (BYSetupUserDisposition)initWithNewUser:(BOOL)a3 child:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = +[BYDeviceConfiguration currentConfiguration];
  BOOL v8 = [v7 productVersion];

  id v9 = +[BYDeviceConfiguration currentConfiguration];
  uint64_t v10 = [v9 buildVersion];

  id v11 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v12 = [(BYSetupUserDisposition *)self initWithProductVersion:v8 buildVersion:v10 date:v11 newUser:v5 child:v4];

  return v12;
}

- (BYSetupUserDisposition)initWithChild:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[BYDeviceConfiguration currentConfiguration];
  v6 = [v5 productVersion];

  BOOL v7 = +[BYDeviceConfiguration currentConfiguration];
  BOOL v8 = [v7 buildVersion];

  id v9 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v10 = [(BYSetupUserDisposition *)self initWithProductVersion:v6 buildVersion:v8 date:v9];

  if (v10)
  {
    uint64_t v11 = [NSNumber numberWithBool:v3];
    child = v10->_child;
    v10->_child = (NSNumber *)v11;
  }
  return v10;
}

+ (id)current
{
  if (current_onceToken != -1) {
    dispatch_once(&current_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)current_disposition;
  return v2;
}

uint64_t __33__BYSetupUserDisposition_current__block_invoke()
{
  current_disposition = objc_alloc_init(BYSetupUserDisposition);
  return MEMORY[0x1F41817F8]();
}

- (void)persistUsingPreferences:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BYSetupUserDisposition *)self _dictionaryRepresentation];
  [v4 setObject:v5 forKey:@"disposition" persistImmediately:1];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.purplebuddy.userdisposition.updated", 0, 0, 1u);
}

- (void)_loadDataFromPreferences:(id)a3
{
  id v4 = [a3 objectForKey:@"disposition"];
  if (v4)
  {
    id v10 = v4;
    BOOL v5 = [v4 valueForKey:@"date"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(BYSetupUserDisposition *)self setDate:v5];
    }
    v6 = [v10 valueForKey:@"productVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(BYSetupUserDisposition *)self setProductVersion:v6];
    }
    BOOL v7 = [v10 valueForKey:@"buildVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(BYSetupUserDisposition *)self setBuildVersion:v7];
    }
    BOOL v8 = [v10 valueForKey:@"child"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(BYSetupUserDisposition *)self setChild:v8];
    }
    id v9 = [v10 valueForKey:@"newUser"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(BYSetupUserDisposition *)self setNewUser:v9];
    }

    id v4 = v10;
  }
}

- (id)_dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(BYSetupUserDisposition *)self date];

  if (v4)
  {
    BOOL v5 = [(BYSetupUserDisposition *)self date];
    [v3 setObject:v5 forKeyedSubscript:@"date"];
  }
  v6 = [(BYSetupUserDisposition *)self productVersion];

  if (v6)
  {
    BOOL v7 = [(BYSetupUserDisposition *)self productVersion];
    [v3 setObject:v7 forKeyedSubscript:@"productVersion"];
  }
  BOOL v8 = [(BYSetupUserDisposition *)self buildVersion];

  if (v8)
  {
    id v9 = [(BYSetupUserDisposition *)self buildVersion];
    [v3 setObject:v9 forKeyedSubscript:@"buildVersion"];
  }
  id v10 = [(BYSetupUserDisposition *)self isChild];

  if (v10)
  {
    uint64_t v11 = [(BYSetupUserDisposition *)self isChild];
    [v3 setObject:v11 forKeyedSubscript:@"child"];
  }
  uint64_t v12 = [(BYSetupUserDisposition *)self isNewUser];

  if (v12)
  {
    v13 = [(BYSetupUserDisposition *)self isNewUser];
    [v3 setObject:v13 forKeyedSubscript:@"newUser"];
  }
  return v3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSNumber)isNewUser
{
  return self->_newUser;
}

- (void)setNewUser:(id)a3
{
}

- (NSNumber)isChild
{
  return self->_child;
}

- (void)setChild:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_child, 0);
  objc_storeStrong((id *)&self->_newUser, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end