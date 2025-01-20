@interface UIKBGraphCache
+ (id)graphCacheForScreen:(id)a3;
- (BOOL)_matchingOptions:(id)a3;
- (NSDictionary)_options;
- (NSMutableDictionary)graphCache;
- (UIScreen)_intendedScreen;
- (id)_initWithScreen:(id)a3 options:(id)a4;
@end

@implementation UIKBGraphCache

- (id)_initWithScreen:(id)a3 options:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIKBGraphCache;
  v7 = [(UIKBGraphCache *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:30];
    graphCache = v7->_graphCache;
    v7->_graphCache = (NSMutableDictionary *)v8;

    objc_storeStrong((id *)&v7->_screen, a3);
  }

  return v7;
}

- (UIScreen)_intendedScreen
{
  return self->_screen;
}

- (BOOL)_matchingOptions:(id)a3
{
  return 1;
}

- (NSDictionary)_options
{
  return 0;
}

+ (id)graphCacheForScreen:(id)a3
{
  id v3 = a3;
  v4 = +[_UIObjectPerScreen objectOfClass:objc_opt_class() forScreen:v3 withOptions:0 createIfNecessary:1];

  return v4;
}

- (NSMutableDictionary)graphCache
{
  return self->_graphCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphCache, 0);
  objc_storeStrong((id *)&self->_screen, 0);
}

@end