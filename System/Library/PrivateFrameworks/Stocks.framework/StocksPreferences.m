@interface StocksPreferences
+ (id)sharedPreferences;
+ (void)clearSharedPreferences;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)isChangeColorSwapped;
- (BOOL)textAttachmentDirectionIsRightToLeft;
- (StocksPreferences)init;
- (id)objectForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (int64_t)integerForKey:(id)a3;
- (unint64_t)textDirection;
- (void)removeObjectForKey:(id)a3;
- (void)resetLocale;
- (void)setInteger:(int64_t)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)synchronize;
@end

@implementation StocksPreferences

+ (id)sharedPreferences
{
  v2 = (void *)__sharedPreferences;
  if (!__sharedPreferences)
  {
    v3 = objc_alloc_init(StocksPreferences);
    v4 = (void *)__sharedPreferences;
    __sharedPreferences = (uint64_t)v3;

    v2 = (void *)__sharedPreferences;
  }

  return v2;
}

+ (void)clearSharedPreferences
{
  v2 = (void *)__sharedPreferences;
  __sharedPreferences = 0;
}

- (StocksPreferences)init
{
  v10.receiver = self;
  v10.super_class = (Class)StocksPreferences;
  v2 = [(StocksPreferences *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(StocksPreferences *)v2 resetLocale];
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_resetLocale name:*MEMORY[0x263EFF458] object:0];

    v5 = [MEMORY[0x263F08850] defaultManager];
    v6 = [v5 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.stocks"];

    uint64_t v7 = [objc_alloc(MEMORY[0x263EFFA40]) _initWithSuiteName:@"group.com.apple.stocks" container:v6];
    sharedDefaults = v3->_sharedDefaults;
    v3->_sharedDefaults = (NSUserDefaults *)v7;
  }
  return v3;
}

- (void)resetLocale
{
  v3 = [MEMORY[0x263EFF960] currentLocale];
  self->_changeColorSwapped = ShouldSwapColorsForLocale(v3);

  v4 = (void *)MEMORY[0x263EFF960];
  v5 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v6 = *MEMORY[0x263EFF508];
  uint64_t v7 = [v5 objectForKey:*MEMORY[0x263EFF508]];
  self->_textDirection = [v4 characterDirectionForLanguage:v7];

  v8 = (void *)MEMORY[0x263EFF960];
  id v13 = [MEMORY[0x263EFF960] currentLocale];
  v9 = [v13 objectForKey:*MEMORY[0x263EFF500]];
  objc_super v10 = [v8 componentsFromLocaleIdentifier:v9];
  v11 = [v10 objectForKey:v6];
  v12 = [v11 lowercaseString];
  self->_textAttachmentDirectionIsRightToLeft = [v12 isEqualToString:@"ar"];
}

- (BOOL)BOOLForKey:(id)a3
{
  return [(NSUserDefaults *)self->_sharedDefaults BOOLForKey:a3];
}

- (int64_t)integerForKey:(id)a3
{
  return [(NSUserDefaults *)self->_sharedDefaults integerForKey:a3];
}

- (id)stringForKey:(id)a3
{
  return [(NSUserDefaults *)self->_sharedDefaults stringForKey:a3];
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
}

- (id)objectForKey:(id)a3
{
  return [(NSUserDefaults *)self->_sharedDefaults objectForKey:a3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (void)synchronize
{
}

- (void)removeObjectForKey:(id)a3
{
}

- (BOOL)isChangeColorSwapped
{
  return self->_changeColorSwapped;
}

- (unint64_t)textDirection
{
  return self->_textDirection;
}

- (BOOL)textAttachmentDirectionIsRightToLeft
{
  return self->_textAttachmentDirectionIsRightToLeft;
}

- (void).cxx_destruct
{
}

@end