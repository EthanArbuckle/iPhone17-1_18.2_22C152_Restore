@interface SUSettingsUserDefaults
+ (id)allDefaults;
+ (id)sharedDefaults;
- (BOOL)BOOLForEntry:(id)a3;
- (BOOL)containsKey:(id)a3;
- (BOOL)defaultsContainsKey:(id)a3;
- (BOOL)isNeRDProfileStatusInstalled;
- (BOOL)shouldBypassSystemRootWarning;
- (BOOL)shouldHideComingSoonTip;
- (BOOL)shouldKeepPreviousMockingKitSession;
- (BOOL)shouldShowComingSoonTip;
- (BOOL)shouldSkipMockingKitPIDValidation;
- (NSString)comingSoonTipLearnMoreLink;
- (NSString)comingSoonTipMessage;
- (NSString)comingSoonTipTitle;
- (SUSettingsUserDefaults)init;
- (id)numberForEntry:(id)a3;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (id)stringForEntry:(id)a3;
- (void)comingSoonTipLearnMoreLink:(id)a3;
- (void)comingSoonTipMessage:(id)a3;
- (void)comingSoonTipTitle:(id)a3;
- (void)isNeRDProfileStatusInstalled:(BOOL)a3;
- (void)removeEntry:(id)a3;
- (void)reset;
- (void)setBool:(BOOL)a3 forEntry:(id)a4;
- (void)setNumber:(id)a3 forEntry:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setString:(id)a3 forEntry:(id)a4;
- (void)shouldBypassSystemRootWarning:(BOOL)a3;
- (void)shouldHideComingSoonTip:(BOOL)a3;
- (void)shouldKeepPreviousMockingKitSession:(BOOL)a3;
- (void)shouldShowComingSoonTip:(BOOL)a3;
- (void)shouldSkipMockingKitPIDValidation:(BOOL)a3;
@end

@implementation SUSettingsUserDefaults

+ (id)allDefaults
{
  v5 = (dispatch_once_t *)&allDefaults_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)allDefaults_defaultsDeclarations;
  return v2;
}

void __37__SUSettingsUserDefaults_allDefaults__block_invoke()
{
  v12[9] = *MEMORY[0x263EF8340];
  v11[0] = @"SUBypassSystemRootWarning";
  v10 = -[SUSettingsUserDefaultsEntry initWithType:key:description:]([SUSettingsUserDefaultsEntry alloc], "initWithType:key:description:");
  v12[0] = v10;
  v11[1] = @"SUKeepPreviousMockingKitSesson";
  v9 = [[SUSettingsUserDefaultsEntry alloc] initWithType:0 key:@"SUKeepPreviousMockingKitSesson" description:@"Whether Mocking Kit test plans sessions should be kept alive after the end of the test execution."];
  v12[1] = v9;
  v11[2] = @"SUSkipMockingKitPIDValidation";
  v8 = [[SUSettingsUserDefaultsEntry alloc] initWithType:0 key:@"SUSkipMockingKitPIDValidation" description:@"Whether Mocking Kit test plans sessions should be kept bypass the Process ID validation."];
  v12[2] = v8;
  v11[3] = @"SUShowComingSoonTip";
  v7 = [[SUSettingsUserDefaultsEntry alloc] initWithType:0 key:@"SUShowComingSoonTip" description:@"Indicates whether the \"Coming Soon\" tip should be forcely shown regardless of its "];
  v12[3] = v7;
  v11[4] = @"SURecoveryOSProfileStatus";
  v6 = [[SUSettingsUserDefaultsEntry alloc] initWithType:0 key:@"SURecoveryOSProfileStatus" description:@"Indicates whether RecoveryOS profile is installed so the user will be able to get the status Constellation display criterias"];
  v12[4] = v6;
  v11[5] = @"SUHideComingSoonTip";
  v5 = [[SUSettingsUserDefaultsEntry alloc] initWithType:0 key:@"SUHideComingSoonTip" description:@"Indicates whether the \"Coming Soon\" tip should be forcely hidden regardless of its Constellation display criterias"];
  v12[5] = v5;
  v11[6] = @"SUComingSoonTipTitle";
  v4 = -[SUSettingsUserDefaultsEntry initWithType:key:description:]([SUSettingsUserDefaultsEntry alloc], "initWithType:key:description:");
  v12[6] = v4;
  v11[7] = @"SUComingSoonTipMessage";
  v3 = [[SUSettingsUserDefaultsEntry alloc] initWithType:2 key:@"SUComingSoonTipMessage" description:@"The message body for the \"Coming Soon\" tip. This field will override the value returned by Constellation."];
  v12[7] = v3;
  v11[8] = @"SUComingSoonTipLearnMoreLink";
  v2 = [[SUSettingsUserDefaultsEntry alloc] initWithType:2 key:@"SUComingSoonTipLearnMoreLink" description:@"The action URL that will be opened by the \"Learn More\" link, referenced in the \"Coming Soon\" tip. This field will override the value returned by Constellation."];
  v12[8] = v2;
  id v0 = (id)[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:9];
  v1 = (void *)allDefaults_defaultsDeclarations;
  allDefaults_defaultsDeclarations = (uint64_t)v0;
}

- (BOOL)shouldBypassSystemRootWarning
{
  v6 = self;
  v5[1] = (id)a2;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  v5[0] = (id)[v3 objectForKey:@"SUBypassSystemRootWarning"];

  BOOL v4 = [(SUSettingsUserDefaults *)v6 BOOLForEntry:v5[0]];
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)shouldBypassSystemRootWarning:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  id v4 = (id)[v3 objectForKey:@"SUBypassSystemRootWarning"];

  [(SUSettingsUserDefaults *)v7 setBool:v5 forEntry:v4];
  objc_storeStrong(&v4, 0);
}

- (BOOL)shouldKeepPreviousMockingKitSession
{
  SEL v6 = self;
  v5[1] = (id)a2;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  v5[0] = (id)[v3 objectForKey:@"SUKeepPreviousMockingKitSesson"];

  BOOL v4 = [(SUSettingsUserDefaults *)v6 BOOLForEntry:v5[0]];
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)shouldKeepPreviousMockingKitSession:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  id v4 = (id)[v3 objectForKey:@"SUKeepPreviousMockingKitSesson"];

  [(SUSettingsUserDefaults *)v7 setBool:v5 forEntry:v4];
  objc_storeStrong(&v4, 0);
}

- (BOOL)shouldSkipMockingKitPIDValidation
{
  SEL v6 = self;
  v5[1] = (id)a2;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  v5[0] = (id)[v3 objectForKey:@"SUSkipMockingKitPIDValidation"];

  BOOL v4 = [(SUSettingsUserDefaults *)v6 BOOLForEntry:v5[0]];
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)shouldSkipMockingKitPIDValidation:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  id v4 = (id)[v3 objectForKey:@"SUSkipMockingKitPIDValidation"];

  [(SUSettingsUserDefaults *)v7 setBool:v5 forEntry:v4];
  objc_storeStrong(&v4, 0);
}

- (BOOL)isNeRDProfileStatusInstalled
{
  SEL v6 = self;
  v5[1] = (id)a2;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  v5[0] = (id)[v3 objectForKey:@"SURecoveryOSProfileStatus"];

  BOOL v4 = [(SUSettingsUserDefaults *)v6 BOOLForEntry:v5[0]];
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)isNeRDProfileStatusInstalled:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  id v4 = (id)[v3 objectForKey:@"SURecoveryOSProfileStatus"];

  [(SUSettingsUserDefaults *)v7 setBool:v5 forEntry:v4];
  objc_storeStrong(&v4, 0);
}

- (BOOL)shouldShowComingSoonTip
{
  SEL v6 = self;
  v5[1] = (id)a2;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  v5[0] = (id)[v3 objectForKey:@"SUShowComingSoonTip"];

  BOOL v4 = [(SUSettingsUserDefaults *)v6 BOOLForEntry:v5[0]];
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)shouldShowComingSoonTip:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  id v4 = (id)[v3 objectForKey:@"SUShowComingSoonTip"];

  [(SUSettingsUserDefaults *)v7 setBool:v5 forEntry:v4];
  objc_storeStrong(&v4, 0);
}

- (BOOL)shouldHideComingSoonTip
{
  SEL v6 = self;
  v5[1] = (id)a2;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  v5[0] = (id)[v3 objectForKey:@"SUHideComingSoonTip"];

  BOOL v4 = [(SUSettingsUserDefaults *)v6 BOOLForEntry:v5[0]];
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)shouldHideComingSoonTip:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  id v4 = (id)[v3 objectForKey:@"SUHideComingSoonTip"];

  [(SUSettingsUserDefaults *)v7 setBool:v5 forEntry:v4];
  objc_storeStrong(&v4, 0);
}

- (NSString)comingSoonTipTitle
{
  SEL v6 = self;
  v5[1] = (id)a2;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  v5[0] = (id)[v3 objectForKey:@"SUComingSoonTipTitle"];

  id v4 = [(SUSettingsUserDefaults *)v6 stringForEntry:v5[0]];
  objc_storeStrong(v5, 0);
  return (NSString *)v4;
}

- (void)comingSoonTipTitle:(id)a3
{
  SEL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  id v4 = (id)[v3 objectForKey:@"SUComingSoonTipTitle"];

  [(SUSettingsUserDefaults *)v6 setString:location[0] forEntry:v4];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (NSString)comingSoonTipMessage
{
  SEL v6 = self;
  v5[1] = (id)a2;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  v5[0] = (id)[v3 objectForKey:@"SUComingSoonTipMessage"];

  id v4 = [(SUSettingsUserDefaults *)v6 stringForEntry:v5[0]];
  objc_storeStrong(v5, 0);
  return (NSString *)v4;
}

- (void)comingSoonTipMessage:(id)a3
{
  SEL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  id v4 = (id)[v3 objectForKey:@"SUComingSoonTipMessage"];

  [(SUSettingsUserDefaults *)v6 setString:location[0] forEntry:v4];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (NSString)comingSoonTipLearnMoreLink
{
  SEL v6 = self;
  v5[1] = (id)a2;
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  v5[0] = (id)[v3 objectForKey:@"SUComingSoonTipLearnMoreLink"];

  id v4 = [(SUSettingsUserDefaults *)v6 stringForEntry:v5[0]];
  objc_storeStrong(v5, 0);
  return (NSString *)v4;
}

- (void)comingSoonTipLearnMoreLink:(id)a3
{
  SEL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = (id)[(id)objc_opt_class() allDefaults];
  id v4 = (id)[v3 objectForKey:@"SUComingSoonTipLearnMoreLink"];

  [(SUSettingsUserDefaults *)v6 setString:location[0] forEntry:v4];
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

+ (id)sharedDefaults
{
  id v11 = a1;
  SEL v10 = a2;
  uint64_t obj = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __40__SUSettingsUserDefaults_sharedDefaults__block_invoke;
  v8 = &__block_descriptor_40_e5_v8__0l;
  id v9 = a1;
  v13 = (dispatch_once_t *)&sharedDefaults_onceToken;
  id location = 0;
  objc_storeStrong(&location, &obj);
  if (*v13 != -1) {
    dispatch_once(v13, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedDefaults_sharedInstance;
  return v2;
}

void __40__SUSettingsUserDefaults_sharedDefaults__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedDefaults_sharedInstance;
  sharedDefaults_sharedInstance = (uint64_t)v1;
}

- (SUSettingsUserDefaults)init
{
  SEL v8 = a2;
  id v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)SUSettingsUserDefaults;
  int v6 = [(SUSettingsUserDefaults *)&v7 init];
  id v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.softwareupdatesettings"];
    userDefaults = v9->_userDefaults;
    v9->_userDefaults = (NSUserDefaults *)v2;
  }
  int v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (BOOL)containsKey:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[(id)objc_opt_class() allDefaults];
  id v3 = (id)[v5 objectForKey:location[0]];
  BOOL v6 = v3 != 0;

  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)defaultsContainsKey:(id)a3
{
  SEL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = (id)[(id)objc_opt_class() allDefaults];
  id v8 = (id)[v7 objectForKey:location[0]];

  if (v8)
  {
    userDefaults = v10->_userDefaults;
    id v6 = (id)[v8 key];
    id v3 = -[NSUserDefaults objectForKey:](userDefaults, "objectForKey:");
    BOOL v11 = v3 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (void)reset
{
}

- (BOOL)BOOLForEntry:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = v9;
  id v6 = (id)[location[0] key];
  id v7 = [(SUSettingsUserDefaults *)v5 objectForKey:v6 ofClass:objc_opt_class()];

  if (v7) {
    int v4 = [v7 BOOLValue] & 1;
  }
  else {
    int v4 = 0;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v4 != 0;
}

- (id)numberForEntry:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v4 = v8;
  id v5 = (id)[location[0] key];
  id v6 = [(SUSettingsUserDefaults *)v4 objectForKey:v5 ofClass:objc_opt_class()];

  objc_storeStrong(location, 0);
  return v6;
}

- (id)stringForEntry:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v4 = v8;
  id v5 = (id)[location[0] key];
  id v6 = [(SUSettingsUserDefaults *)v4 objectForKey:v5 ofClass:objc_opt_class()];

  objc_storeStrong(location, 0);
  return v6;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = (id)[(NSUserDefaults *)v7->_userDefaults valueForKey:location[0]];
  objc_storeStrong(location, 0);
  return v5;
}

- (void)setString:(id)a3 forEntry:(id)a4
{
  SEL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v6 = v10;
  id v5 = location[0];
  id v7 = (id)[v8 key];
  -[SUSettingsUserDefaults setObject:forKey:](v6, "setObject:forKey:", v5);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)setBool:(BOOL)a3 forEntry:(id)a4
{
  SEL v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  int v4 = v10;
  id v6 = (id)[NSNumber numberWithBool:v8];
  id v5 = (id)[location key];
  -[SUSettingsUserDefaults setObject:forKey:](v4, "setObject:forKey:", v6);

  objc_storeStrong(&location, 0);
}

- (void)setNumber:(id)a3 forEntry:(id)a4
{
  SEL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v6 = v10;
  id v5 = location[0];
  id v7 = (id)[v8 key];
  -[SUSettingsUserDefaults setObject:forKey:](v6, "setObject:forKey:", v5);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(NSUserDefaults *)v7->_userDefaults setObject:location[0] forKey:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)removeEntry:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  userDefaults = v6->_userDefaults;
  id v4 = (id)[location[0] key];
  -[NSUserDefaults removeObjectForKey:](userDefaults, "removeObjectForKey:");

  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end