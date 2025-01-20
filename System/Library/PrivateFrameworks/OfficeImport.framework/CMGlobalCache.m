@interface CMGlobalCache
+ (id)borderStyleCache;
+ (id)borderWidthCache;
+ (id)colorPropertyCache;
+ (id)cssStylesheetCache;
+ (id)drawableElementCache;
+ (id)lengthPropertyCache;
+ (void)initGlobalCache;
+ (void)releaseGlobalCache;
@end

@implementation CMGlobalCache

+ (void)initGlobalCache
{
  id v14 = [MEMORY[0x263F08B88] currentThread];
  v2 = [v14 threadDictionary];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  [v2 setObject:v3 forKey:@"gColorPropertyCache"];

  id v15 = [MEMORY[0x263F08B88] currentThread];
  v4 = [v15 threadDictionary];
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  [v4 setObject:v5 forKey:@"gLengthPropertyCache"];

  id v16 = [MEMORY[0x263F08B88] currentThread];
  v6 = [v16 threadDictionary];
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  [v6 setObject:v7 forKey:@"gBorderStyleCache"];

  id v17 = [MEMORY[0x263F08B88] currentThread];
  v8 = [v17 threadDictionary];
  v9 = [MEMORY[0x263EFF9A0] dictionary];
  [v8 setObject:v9 forKey:@"gBorderWidthCache"];

  id v18 = [MEMORY[0x263F08B88] currentThread];
  v10 = [v18 threadDictionary];
  v11 = [MEMORY[0x263EFF9A0] dictionary];
  [v10 setObject:v11 forKey:@"gCssStylesheetCache"];

  id v19 = [MEMORY[0x263F08B88] currentThread];
  v12 = [v19 threadDictionary];
  v13 = [MEMORY[0x263EFF9A0] dictionary];
  [v12 setObject:v13 forKey:@"gDrawableElementCache"];
}

+ (id)colorPropertyCache
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];
  v4 = [v3 objectForKey:@"gColorPropertyCache"];

  return v4;
}

+ (id)drawableElementCache
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];
  v4 = [v3 objectForKey:@"gDrawableElementCache"];

  return v4;
}

+ (id)lengthPropertyCache
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];
  v4 = [v3 objectForKey:@"gLengthPropertyCache"];

  return v4;
}

+ (void)releaseGlobalCache
{
  id v8 = [MEMORY[0x263F08B88] currentThread];
  v2 = [v8 threadDictionary];
  [v2 setValue:0 forKey:@"gColorPropertyCache"];

  id v9 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v9 threadDictionary];
  [v3 setValue:0 forKey:@"gLengthPropertyCache"];

  id v10 = [MEMORY[0x263F08B88] currentThread];
  v4 = [v10 threadDictionary];
  [v4 setValue:0 forKey:@"gBorderStyleCache"];

  id v11 = [MEMORY[0x263F08B88] currentThread];
  v5 = [v11 threadDictionary];
  [v5 setValue:0 forKey:@"gBorderWidthCache"];

  id v12 = [MEMORY[0x263F08B88] currentThread];
  v6 = [v12 threadDictionary];
  [v6 setValue:0 forKey:@"gCssStylesheetCache"];

  id v13 = [MEMORY[0x263F08B88] currentThread];
  v7 = [v13 threadDictionary];
  [v7 setValue:0 forKey:@"gDrawableElementCache"];
}

+ (id)borderStyleCache
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];
  v4 = [v3 objectForKey:@"gBorderStyleCache"];

  return v4;
}

+ (id)borderWidthCache
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];
  v4 = [v3 objectForKey:@"gBorderWidthCache"];

  return v4;
}

+ (id)cssStylesheetCache
{
  v2 = [MEMORY[0x263F08B88] currentThread];
  v3 = [v2 threadDictionary];
  v4 = [v3 objectForKey:@"gCssStylesheetCache"];

  return v4;
}

@end