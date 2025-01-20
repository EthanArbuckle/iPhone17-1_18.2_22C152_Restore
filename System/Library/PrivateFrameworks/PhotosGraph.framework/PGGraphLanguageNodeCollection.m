@interface PGGraphLanguageNodeCollection
+ (Class)nodeClass;
+ (id)nodesWithLocaleIdentifiers:(id)a3 inGraph:(id)a4;
- (NSSet)locales;
@end

@implementation PGGraphLanguageNodeCollection

+ (id)nodesWithLocaleIdentifiers:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  v7 = +[PGGraphLanguageNode filterWithLocaleIdentifiers:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

- (NSSet)locales
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PGGraphLanguageNodeCollection_locales__block_invoke;
  v6[3] = &unk_1E68EE5E0;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateNodesUsingBlock:v6];

  return (NSSet *)v4;
}

void __40__PGGraphLanguageNodeCollection_locales__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = [a2 localeIdentifier];
  id v6 = [v3 localeWithLocaleIdentifier:v4];

  v5 = v6;
  if (v6)
  {
    [*(id *)(a1 + 32) addObject:v6];
    v5 = v6;
  }
}

@end