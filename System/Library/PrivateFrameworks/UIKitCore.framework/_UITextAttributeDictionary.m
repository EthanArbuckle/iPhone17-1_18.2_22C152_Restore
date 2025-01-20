@interface _UITextAttributeDictionary
+ (id)alloc;
+ (id)new;
- (BOOL)ignoresFallbackForKey:(id)a3;
- (BOOL)usesFallbackForKey:(id)a3;
- (_UITextAttributeDictionary)initWithDictionary:(id)a3 fallback:(id)a4;
- (id)sparseDictionary;
@end

@implementation _UITextAttributeDictionary

+ (id)new
{
  return (id)objc_opt_new();
}

+ (id)alloc
{
  return [_UITextAttributeDictionaryImplI alloc];
}

- (_UITextAttributeDictionary)initWithDictionary:(id)a3 fallback:(id)a4
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