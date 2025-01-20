@interface MTEnvironmentDeviceDelegate
- (BOOL)isAnonymous;
- (id)_diskUsage;
- (id)app;
- (id)appVersion;
- (id)capacityData;
- (id)capacityDataAvailable;
- (id)capacityDisk;
- (id)capacitySystem;
- (id)capacitySystemAvailable;
- (id)connectionType;
- (id)cookies;
- (id)dsId;
- (id)hardwareFamily;
- (id)hardwareModel;
- (id)hostApp;
- (id)os;
- (id)osBuildNumber;
- (id)osLanguages;
- (id)osVersion;
- (id)pageUrl;
- (id)pixelRatio;
- (id)resourceRevNum;
- (id)screenHeight;
- (id)screenWidth;
- (id)storeFrontHeader;
- (id)userAgent;
- (id)userType;
- (id)windowInnerHeight;
- (id)windowInnerWidth;
- (id)windowOuterHeight;
- (id)windowOuterWidth;
@end

@implementation MTEnvironmentDeviceDelegate

- (BOOL)isAnonymous
{
  return 0;
}

- (id)app
{
  v2 = +[MTFrameworkEnvironment sharedEnvironment];
  v3 = [v2 hostProcessBundleIdentifier];

  return v3;
}

- (id)appVersion
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 infoDictionary];
  v4 = [v3 objectForKeyedSubscript:@"CFBundleShortVersionString"];

  return v4;
}

- (id)hardwareFamily
{
  v2 = (__CFString *)MGCopyAnswer();
  if ([(__CFString *)v2 isEqualToString:@"iPod"])
  {

    v2 = @"iPod touch";
  }

  return v2;
}

- (id)hardwareModel
{
  v2 = (void *)MGGetStringAnswer();

  return v2;
}

- (id)osBuildNumber
{
  v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)os
{
  return @"iOS";
}

- (id)osLanguages
{
  return (id)[MEMORY[0x263EFF960] preferredLanguages];
}

- (id)osVersion
{
  if (osVersion_onceToken != -1) {
    dispatch_once(&osVersion_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)osVersion_productVersion;

  return v2;
}

void __40__MTEnvironmentDeviceDelegate_osVersion__block_invoke()
{
  id v2 = (id)_CFCopySystemVersionDictionary();
  uint64_t v0 = [v2 objectForKey:*MEMORY[0x263EFFAC0]];
  v1 = (void *)osVersion_productVersion;
  osVersion_productVersion = v0;
}

- (id)pixelRatio
{
  MGGetFloat32Answer();
  if (v2 <= 0.0)
  {
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(NSNumber, "numberWithFloat:");
  }

  return v3;
}

- (id)screenHeight
{
  uint64_t v2 = MGGetSInt32Answer();
  if ((int)v2 < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [NSNumber numberWithInt:v2];
  }

  return v3;
}

- (id)screenWidth
{
  uint64_t v2 = MGGetSInt32Answer();
  if ((int)v2 < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [NSNumber numberWithInt:v2];
  }

  return v3;
}

- (id)windowInnerHeight
{
  return 0;
}

- (id)windowInnerWidth
{
  return 0;
}

- (id)_diskUsage
{
  return +[MTEventHandler cachableWithKey:@"diskUsage" onBackgroundThread:1 block:&__block_literal_global_38];
}

id __41__MTEnvironmentDeviceDelegate__diskUsage__block_invoke()
{
  uint64_t v0 = (void *)MGCopyAnswer();
  v1 = v0;
  if (!v0) {
    uint64_t v0 = (void *)MEMORY[0x263EFFA78];
  }
  id v2 = v0;

  return v2;
}

- (id)capacityData
{
  id v2 = [(MTEnvironmentDeviceDelegate *)self _diskUsage];
  v3 = [v2 thenWithBlock:&__block_literal_global_44];

  return v3;
}

id __43__MTEnvironmentDeviceDelegate_capacityData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKey:*MEMORY[0x263F8BD38]];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  v5 = v4;

  v6 = +[MTPromise promiseWithResult:v5];

  return v6;
}

- (id)capacityDataAvailable
{
  id v2 = [(MTEnvironmentDeviceDelegate *)self _diskUsage];
  v3 = [v2 thenWithBlock:&__block_literal_global_48];

  return v3;
}

id __52__MTEnvironmentDeviceDelegate_capacityDataAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKey:*MEMORY[0x263F8BD28]];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  v5 = v4;

  v6 = +[MTPromise promiseWithResult:v5];

  return v6;
}

- (id)capacityDisk
{
  id v2 = [(MTEnvironmentDeviceDelegate *)self _diskUsage];
  v3 = [v2 thenWithBlock:&__block_literal_global_50];

  return v3;
}

id __43__MTEnvironmentDeviceDelegate_capacityDisk__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKey:*MEMORY[0x263F8BD48]];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  v5 = v4;

  v6 = +[MTPromise promiseWithResult:v5];

  return v6;
}

- (id)capacitySystem
{
  id v2 = [(MTEnvironmentDeviceDelegate *)self _diskUsage];
  v3 = [v2 thenWithBlock:&__block_literal_global_52];

  return v3;
}

id __45__MTEnvironmentDeviceDelegate_capacitySystem__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKey:*MEMORY[0x263F8BD60]];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  v5 = v4;

  v6 = +[MTPromise promiseWithResult:v5];

  return v6;
}

- (id)capacitySystemAvailable
{
  id v2 = [(MTEnvironmentDeviceDelegate *)self _diskUsage];
  v3 = [v2 thenWithBlock:&__block_literal_global_54];

  return v3;
}

id __54__MTEnvironmentDeviceDelegate_capacitySystemAvailable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKey:*MEMORY[0x263F8BD58]];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF9D0] null];
  }
  v5 = v4;

  v6 = +[MTPromise promiseWithResult:v5];

  return v6;
}

- (id)windowOuterHeight
{
  return 0;
}

- (id)windowOuterWidth
{
  return 0;
}

- (id)connectionType
{
  id v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate connectionType]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)cookies
{
  id v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate cookies]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)dsId
{
  id v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate dsId]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)hostApp
{
  id v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate hostApp]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)pageUrl
{
  id v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate pageUrl]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)resourceRevNum
{
  id v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate resourceRevNum]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)storeFrontHeader
{
  id v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate storeFrontHeader]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)userAgent
{
  id v8 = MTUndelegatedMethodError((uint64_t)"-[MTEnvironmentDeviceDelegate userAgent]", (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return 0;
}

- (id)userType
{
  return 0;
}

@end