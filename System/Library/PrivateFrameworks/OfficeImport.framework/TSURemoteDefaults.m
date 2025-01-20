@interface TSURemoteDefaults
+ (id)sharedDefaults;
- (TSURemoteDefaults)initWithRemoteURL:(id)a3 localURL:(id)a4;
- (id)initInternal;
- (id)objectForKey:(id)a3;
- (void)processPropertyList:(id)a3;
- (void)registerDefaults;
@end

@implementation TSURemoteDefaults

+ (id)sharedDefaults
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__TSURemoteDefaults_sharedDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDefaults_onceToken != -1) {
    dispatch_once(&sharedDefaults_onceToken, block);
  }
  v2 = (void *)sharedDefaults_sharedDefaults;
  return v2;
}

void __35__TSURemoteDefaults_sharedDefaults__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initInternal];
  v2 = (void *)sharedDefaults_sharedDefaults;
  sharedDefaults_sharedDefaults = v1;
}

- (TSURemoteDefaults)initWithRemoteURL:(id)a3 localURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [NSString stringWithUTF8String:"-[TSURemoteDefaults initWithRemoteURL:localURL:]"];
  v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSURemoteDefaults.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:314 isFatal:0 description:"Do not call method"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  v9 = (void *)MEMORY[0x263EFF940];
  uint64_t v10 = *MEMORY[0x263EFF498];
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSURemoteDefaults initWithRemoteURL:localURL:]");
  id v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];

  objc_exception_throw(v12);
}

- (id)initInternal
{
  v3 = [NSURL URLWithString:@"https://configuration.apple.com/configurations/internetservices/iworkapps/RemoteDefaults.plist"];
  v6.receiver = self;
  v6.super_class = (Class)TSURemoteDefaults;
  v4 = [(TSURemotePropertyList *)&v6 initWithRemoteURL:v3 localURL:0];

  if (v4) {
    [(TSURemoteDefaults *)v4 registerDefaults];
  }
  return v4;
}

- (void)registerDefaults
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  id v9 = [v2 URLForResource:@"RemoteDefaults" withExtension:@"plist"];

  if (v9)
  {
    v3 = objc_msgSend(NSDictionary, "dictionaryWithContentsOfURL:");
    if (v3)
    {
      v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
      [v4 registerDefaults:v3];
    }
    else
    {
      v7 = [NSString stringWithUTF8String:"-[TSURemoteDefaults registerDefaults]"];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSURemoteDefaults.m"];
      +[OITSUAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:336 isFatal:0 description:"Can't parse local defaults plist"];

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
  }
  else
  {
    id v5 = [NSString stringWithUTF8String:"-[TSURemoteDefaults registerDefaults]"];
    objc_super v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSURemoteDefaults.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v5 file:v6 lineNumber:345 isFatal:0 description:"Don't have local defaults plist"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  objc_super v6 = [v5 dictionaryForKey:@"TSURemoteDefaults"];
  v7 = [v6 objectForKey:v4];

  if (!v7)
  {
    v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    id v9 = [v8 volatileDomainForName:*MEMORY[0x263F084B0]];
    uint64_t v10 = [v9 objectForKey:@"TSURemoteDefaults"];

    v7 = [v10 objectForKey:v4];

    if (!v7)
    {
      v12.receiver = self;
      v12.super_class = (Class)TSURemoteDefaults;
      v7 = [(TSURemotePropertyList *)&v12 objectForKey:v4];
    }
  }

  return v7;
}

- (void)processPropertyList:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFFA40];
  id v5 = a3;
  objc_super v6 = [v4 standardUserDefaults];
  [v6 setObject:v5 forKey:@"TSURemoteDefaults"];

  v7.receiver = self;
  v7.super_class = (Class)TSURemoteDefaults;
  [(TSURemotePropertyList *)&v7 processPropertyList:v5];
}

@end