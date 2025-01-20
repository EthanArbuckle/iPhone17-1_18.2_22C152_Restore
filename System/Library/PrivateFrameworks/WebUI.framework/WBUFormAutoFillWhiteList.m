@interface WBUFormAutoFillWhiteList
+ (id)sharedAutoFillWhiteList;
- (BOOL)allowsURL:(id)a3;
- (WBUFormAutoFillWhiteList)init;
- (void)_whiteListSettingsChanged:(id)a3;
- (void)dealloc;
@end

@implementation WBUFormAutoFillWhiteList

+ (id)sharedAutoFillWhiteList
{
  if (sharedAutoFillWhiteList_onceToken != -1) {
    dispatch_once(&sharedAutoFillWhiteList_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedAutoFillWhiteList_sharedWhiteList;
  return v2;
}

uint64_t __51__WBUFormAutoFillWhiteList_sharedAutoFillWhiteList__block_invoke()
{
  sharedAutoFillWhiteList_sharedWhiteList = objc_alloc_init(WBUFormAutoFillWhiteList);
  return MEMORY[0x270F9A758]();
}

- (WBUFormAutoFillWhiteList)init
{
  v8.receiver = self;
  v8.super_class = (Class)WBUFormAutoFillWhiteList;
  v2 = [(WBUFormAutoFillWhiteList *)&v8 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cache = v2->_cache;
    v2->_cache = v3;

    [(NSCache *)v2->_cache setCountLimit:10];
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__whiteListSettingsChanged_ name:*MEMORY[0x263F536E0] object:0];

    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WBUFormAutoFillWhiteList;
  [(WBUFormAutoFillWhiteList *)&v4 dealloc];
}

- (void)_whiteListSettingsChanged:(id)a3
{
}

- (BOOL)allowsURL:(id)a3
{
  id v4 = a3;
  v5 = [(NSCache *)self->_cache objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = [v5 BOOLValue];
  }
  else
  {
    objc_super v8 = [MEMORY[0x263F53C50] sharedConnection];
    uint64_t v7 = [v8 isSafariPasswordAutoFillAllowedForURL:v4];

    cache = self->_cache;
    v10 = [NSNumber numberWithBool:v7];
    [(NSCache *)cache setObject:v10 forKey:v4];
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end