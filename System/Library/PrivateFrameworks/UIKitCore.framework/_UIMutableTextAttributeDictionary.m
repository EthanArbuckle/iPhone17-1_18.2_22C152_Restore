@interface _UIMutableTextAttributeDictionary
+ (id)alloc;
+ (id)new;
- (BOOL)ignoresFallbackForKey:(id)a3;
- (BOOL)usesFallbackForKey:(id)a3;
- (_UIMutableTextAttributeDictionary)initWithDictionary:(id)a3 fallback:(id)a4;
- (_UIMutableTextAttributeDictionary)initWithFallback:(id)a3;
- (id)sparseDictionary;
@end

@implementation _UIMutableTextAttributeDictionary

+ (id)new
{
  return (id)objc_opt_new();
}

+ (id)alloc
{
  return [_UITextAttributeDictionaryImplM alloc];
}

- (_UIMutableTextAttributeDictionary)initWithDictionary:(id)a3 fallback:(id)a4
{
  return 0;
}

- (_UIMutableTextAttributeDictionary)initWithFallback:(id)a3
{
  return 0;
}

- (BOOL)usesFallbackForKey:(id)a3
{
  return 0;
}

- (BOOL)ignoresFallbackForKey:(id)a3
{
  return 0;
}

- (id)sparseDictionary
{
  return 0;
}

@end