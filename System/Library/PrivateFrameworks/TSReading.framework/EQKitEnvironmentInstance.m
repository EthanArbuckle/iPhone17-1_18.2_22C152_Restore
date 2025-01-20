@interface EQKitEnvironmentInstance
+ (id)dataForEnvironment:(id)a3;
+ (id)defaultEnvironment;
+ (id)environmentFromData:(id)a3;
- (BOOL)fontsLoaded;
- (BOOL)kerning;
- (EQKitEnvironmentInstance)initWithConfig:(id)a3;
- (const)fontManager;
- (const)kerningManager;
- (const)layoutConfig;
- (const)operatorDictionary;
- (id)newDictionaryForArchiving;
- (void)beginLayout;
- (void)dealloc;
- (void)endLayout;
- (void)setKerning:(BOOL)a3;
@end

@implementation EQKitEnvironmentInstance

+ (id)environmentFromData:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = EQKitUtilDynamicCast(v4, [MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:&v8 error:&v9]);
  v6 = [EQKitEnvironmentInstance alloc];
  return -[EQKitEnvironmentInstance initWithConfig:](v6, "initWithConfig:", v5, v8, v9);
}

+ (id)defaultEnvironment
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__EQKitEnvironmentInstance_defaultEnvironment__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = a1;
  if (+[EQKitEnvironmentInstance defaultEnvironment]::onceToken != -1) {
    dispatch_once(&+[EQKitEnvironmentInstance defaultEnvironment]::onceToken, block);
  }
  return (id)+[EQKitEnvironmentInstance defaultEnvironment]::sInstance;
}

void __46__EQKitEnvironmentInstance_defaultEnvironment__block_invoke()
{
  v0 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithContentsOfURL:", objc_msgSend(NSURL, "fileURLWithPath:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", @"EQKitDefaultEnvironment", @"plist")));
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = EQKitUtilDynamicCast(v1, [MEMORY[0x263F08AC0] propertyListWithData:v0 options:0 format:&v5 error:&v4]);
  v3 = [EQKitEnvironmentInstance alloc];
  +[EQKitEnvironmentInstance defaultEnvironment]::sInstance = -[EQKitEnvironmentInstance initWithConfig:](v3, "initWithConfig:", v2, v4, v5);
}

+ (id)dataForEnvironment:(id)a3
{
  uint64_t v6 = 0;
  v3 = (void *)[a3 newDictionaryForArchiving];
  uint64_t v4 = (void *)[MEMORY[0x263F08AC0] dataWithPropertyList:v3 format:100 options:0 error:&v6];

  return v4;
}

- (EQKitEnvironmentInstance)initWithConfig:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)EQKitEnvironmentInstance;
  uint64_t v4 = [(EQKitEnvironmentInstance *)&v12 init];
  if (v4)
  {
    uint64_t v5 = (EQKit::Config::Operator::Dictionary *)objc_msgSend(NSURL, "fileURLWithPath:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", @"EQKitOperatorDictionary", @"plist"));
    v4->mConfig = (NSDictionary *)[a3 copy];
    v4->mOperatorDictionary = EQKit::Config::Operator::Dictionary::dictionaryFromURL(v5, v6);
    uint64_t v7 = objc_opt_class();
    EQKitUtilDynamicCast(v7, (uint64_t)[(NSDictionary *)v4->mConfig objectForKey:@"fonts"]);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = (NSNumber *)EQKitUtilDynamicCast(v8, (uint64_t)[(NSDictionary *)v4->mConfig objectForKey:@"version"]);
    EQKit::Environment::Version::Version((EQKit::Environment::Version *)v11, v9);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  mOperatorDictionary = (EQKit::Config::Operator::Dictionary *)self->mOperatorDictionary;
  if (mOperatorDictionary)
  {
    EQKit::Config::Operator::Dictionary::~Dictionary(mOperatorDictionary);
    MEMORY[0x223CB8F20]();
  }
  mFontManager = self->mFontManager;
  if (mFontManager) {
    (*((void (**)(Manager *))mFontManager->var0 + 1))(mFontManager);
  }
  mKerningManager = (EQKit::Kerning::Manager *)self->mKerningManager;
  if (mKerningManager)
  {
    EQKit::Kerning::Manager::~Manager(mKerningManager);
    MEMORY[0x223CB8F20]();
  }
  mLayoutConfig = self->mLayoutConfig;
  if (mLayoutConfig) {
    MEMORY[0x223CB8F20](mLayoutConfig, 0x1000C4000313F17);
  }
  v7.receiver = self;
  v7.super_class = (Class)EQKitEnvironmentInstance;
  [(EQKitEnvironmentInstance *)&v7 dealloc];
}

- (id)newDictionaryForArchiving
{
  return (id)[(NSDictionary *)self->mConfig copy];
}

- (const)operatorDictionary
{
  return self->mOperatorDictionary;
}

- (const)fontManager
{
  return self->mFontManager;
}

- (const)kerningManager
{
  return self->mKerningManager;
}

- (const)layoutConfig
{
  return self->mLayoutConfig;
}

- (void)beginLayout
{
  EQKit::Font::Manager::beginLayout((uint64_t)self->mFontManager);
  mKerningManager = self->mKerningManager;

  EQKit::Kerning::Manager::beginLayout((uint64_t)mKerningManager);
}

- (void)endLayout
{
  EQKit::Kerning::Manager::endLayout((uint64_t ***)self->mKerningManager);
  mFontManager = self->mFontManager;

  EQKit::Font::Manager::endLayout((EQKit::Font::Manager *)mFontManager);
}

- (BOOL)kerning
{
  return *((unsigned char *)self->mKerningManager + 16);
}

- (void)setKerning:(BOOL)a3
{
  *((unsigned char *)self->mKerningManager + 16) = a3;
}

- (BOOL)fontsLoaded
{
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)EQKit::Font::Manager::defaultCollection((EQKit::Font::Manager *)self->mFontManager)
                           + 192);

  return v2();
}

@end