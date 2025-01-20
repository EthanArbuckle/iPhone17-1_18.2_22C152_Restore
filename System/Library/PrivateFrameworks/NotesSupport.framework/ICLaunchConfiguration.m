@interface ICLaunchConfiguration
+ (ICLaunchConfiguration)currentConfiguration;
+ (ICLaunchConfiguration)userInterfaceTesting;
+ (id)nonDefaultValueForValue:(id)a3;
- (BOOL)resetsCloud;
- (BOOL)resetsContainer;
- (BOOL)resetsState;
- (ICLaunchConfiguration)initWithDictionary:(id)a3;
- (ICLaunchConfiguration)initWithEnvironment:(unint64_t)a3 container:(id)a4 resetsContainer:(BOOL)a5 resetsCloud:(BOOL)a6 resetsState:(BOOL)a7 localAccountArchive:(id)a8 cloudAccountArchive:(id)a9;
- (NSArray)launchArguments;
- (NSString)cloudAccountArchiveName;
- (NSString)container;
- (NSString)localAccountArchiveName;
- (unint64_t)environment;
- (void)setCloudAccountArchiveName:(id)a3;
- (void)setContainer:(id)a3;
- (void)setEnvironment:(unint64_t)a3;
- (void)setLocalAccountArchiveName:(id)a3;
- (void)setResetsCloud:(BOOL)a3;
- (void)setResetsContainer:(BOOL)a3;
- (void)setResetsState:(BOOL)a3;
@end

@implementation ICLaunchConfiguration

- (unint64_t)environment
{
  return self->_environment;
}

+ (ICLaunchConfiguration)currentConfiguration
{
  if (currentConfiguration_onceToken != -1) {
    dispatch_once(&currentConfiguration_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)currentConfiguration_s_currentConfiguration;
  return (ICLaunchConfiguration *)v2;
}

- (ICLaunchConfiguration)initWithDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"Environment"];
  v5 = [v3 allKeys];
  char v6 = [v5 containsObject:@"-PPTLaunchTest"];

  if (v6) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = ICLaunchConfigurationEnvironmentWithString(v4);
  }
  v8 = [v3 objectForKeyedSubscript:@"Container"];
  v9 = +[ICLaunchConfiguration nonDefaultValueForValue:v8];

  v10 = [v3 objectForKeyedSubscript:@"ResetContainer"];
  uint64_t v11 = [v10 BOOLValue];

  v12 = [v3 objectForKeyedSubscript:@"ResetCloud"];
  uint64_t v13 = [v12 BOOLValue];

  v14 = [v3 objectForKeyedSubscript:@"ResetState"];
  uint64_t v15 = [v14 BOOLValue];

  v16 = [v3 objectForKeyedSubscript:@"LocalAccountArchiveName"];
  v17 = +[ICLaunchConfiguration nonDefaultValueForValue:v16];

  v18 = [v3 objectForKeyedSubscript:@"CloudAccountArchiveName"];
  v19 = +[ICLaunchConfiguration nonDefaultValueForValue:v18];

  v20 = [(ICLaunchConfiguration *)self initWithEnvironment:v7 container:v9 resetsContainer:v11 resetsCloud:v13 resetsState:v15 localAccountArchive:v17 cloudAccountArchive:v19];
  return v20;
}

+ (id)nonDefaultValueForValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"]) {
    v4 = 0;
  }
  else {
    v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (ICLaunchConfiguration)initWithEnvironment:(unint64_t)a3 container:(id)a4 resetsContainer:(BOOL)a5 resetsCloud:(BOOL)a6 resetsState:(BOOL)a7 localAccountArchive:(id)a8 cloudAccountArchive:(id)a9
{
  id v15 = a4;
  id v16 = a8;
  id v17 = a9;
  v22.receiver = self;
  v22.super_class = (Class)ICLaunchConfiguration;
  v18 = [(ICLaunchConfiguration *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_environment = a3;
    objc_storeStrong((id *)&v18->_container, a4);
    v19->_resetsContainer = a5;
    v19->_resetsCloud = a6;
    v19->_resetsState = a7;
    objc_storeStrong((id *)&v19->_localAccountArchiveName, a8);
    objc_storeStrong((id *)&v19->_cloudAccountArchiveName, a9);
  }

  return v19;
}

- (BOOL)resetsState
{
  return self->_resetsState;
}

- (BOOL)resetsContainer
{
  return self->_resetsContainer;
}

- (BOOL)resetsCloud
{
  return self->_resetsCloud;
}

- (NSString)localAccountArchiveName
{
  return self->_localAccountArchiveName;
}

- (NSString)container
{
  return self->_container;
}

- (NSString)cloudAccountArchiveName
{
  return self->_cloudAccountArchiveName;
}

void __45__ICLaunchConfiguration_currentConfiguration__block_invoke()
{
  v0 = [ICLaunchConfiguration alloc];
  id v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v1 = [v4 dictionaryRepresentation];
  uint64_t v2 = [(ICLaunchConfiguration *)v0 initWithDictionary:v1];
  id v3 = (void *)currentConfiguration_s_currentConfiguration;
  currentConfiguration_s_currentConfiguration = v2;
}

+ (ICLaunchConfiguration)userInterfaceTesting
{
  if (userInterfaceTesting_onceToken != -1) {
    dispatch_once(&userInterfaceTesting_onceToken, &__block_literal_global_28_0);
  }
  uint64_t v2 = (void *)userInterfaceTesting_s_userInterfaceTesting;
  return (ICLaunchConfiguration *)v2;
}

uint64_t __45__ICLaunchConfiguration_userInterfaceTesting__block_invoke()
{
  userInterfaceTesting_s_userInterfaceTesting = [[ICLaunchConfiguration alloc] initWithEnvironment:2 container:@"User Interface Testing" resetsContainer:1 resetsCloud:0 resetsState:1 localAccountArchive:@"User Interface Testing" cloudAccountArchive:0];
  return MEMORY[0x270F9A758]();
}

- (NSArray)launchArguments
{
  v31[14] = *MEMORY[0x263EF8340];
  v30 = [NSString stringWithFormat:@"-%@", @"Environment"];
  v31[0] = v30;
  v29 = NSStringFromICLaunchConfigurationEnvironment([(ICLaunchConfiguration *)self environment]);
  v31[1] = v29;
  v28 = [NSString stringWithFormat:@"-%@", @"Container"];
  v31[2] = v28;
  uint64_t v3 = [(ICLaunchConfiguration *)self container];
  v27 = (void *)v3;
  id v4 = @"Default";
  if (v3) {
    id v4 = (__CFString *)v3;
  }
  v31[3] = v4;
  v26 = [NSString stringWithFormat:@"-%@", @"ResetContainer"];
  v31[4] = v26;
  id v5 = NSString;
  v25 = objc_msgSend(NSNumber, "numberWithBool:", -[ICLaunchConfiguration resetsContainer](self, "resetsContainer"));
  v24 = [v5 stringWithFormat:@"%@", v25];
  v31[5] = v24;
  v23 = [NSString stringWithFormat:@"-%@", @"ResetCloud"];
  v31[6] = v23;
  char v6 = NSString;
  objc_super v22 = objc_msgSend(NSNumber, "numberWithBool:", -[ICLaunchConfiguration resetsCloud](self, "resetsCloud"));
  uint64_t v7 = [v6 stringWithFormat:@"%@", v22];
  v31[7] = v7;
  v8 = [NSString stringWithFormat:@"-%@", @"ResetState"];
  v31[8] = v8;
  v9 = NSString;
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[ICLaunchConfiguration resetsState](self, "resetsState"));
  uint64_t v11 = [v9 stringWithFormat:@"%@", v10];
  v31[9] = v11;
  v12 = [NSString stringWithFormat:@"-%@", @"LocalAccountArchiveName"];
  v31[10] = v12;
  uint64_t v13 = [(ICLaunchConfiguration *)self localAccountArchiveName];
  v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = @"Default";
  }
  v31[11] = v15;
  id v16 = [NSString stringWithFormat:@"-%@", @"CloudAccountArchiveName"];
  v31[12] = v16;
  uint64_t v17 = [(ICLaunchConfiguration *)self cloudAccountArchiveName];
  v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @"Default";
  }
  v31[13] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:14];

  return (NSArray *)v20;
}

- (void)setEnvironment:(unint64_t)a3
{
  self->_environment = a3;
}

- (void)setContainer:(id)a3
{
}

- (void)setResetsCloud:(BOOL)a3
{
  self->_resetsCloud = a3;
}

- (void)setResetsContainer:(BOOL)a3
{
  self->_resetsContainer = a3;
}

- (void)setResetsState:(BOOL)a3
{
  self->_resetsState = a3;
}

- (void)setLocalAccountArchiveName:(id)a3
{
}

- (void)setCloudAccountArchiveName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudAccountArchiveName, 0);
  objc_storeStrong((id *)&self->_localAccountArchiveName, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end