@interface PGGraphEntityNetSceneNodeCollection
+ (Class)nodeClass;
+ (id)sceneNodesForSceneNames:(id)a3 inGraph:(id)a4;
- (NSSet)localizedNames;
- (void)enumerateLocalizedNamesUsingBlock:(id)a3;
- (void)enumerateSceneIdentifiersUsingBlock:(id)a3;
@end

@implementation PGGraphEntityNetSceneNodeCollection

+ (id)sceneNodesForSceneNames:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  v7 = +[PGGraphSceneNode filterForSceneNames:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

- (void)enumerateSceneIdentifiersUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__PGGraphEntityNetSceneNodeCollection_enumerateSceneIdentifiersUsingBlock___block_invoke;
  v6[3] = &unk_1E68EDCF0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateUnsignedLongLongPropertyValuesForKey:@"sceneIdentifier" withBlock:v6];
}

uint64_t __75__PGGraphEntityNetSceneNodeCollection_enumerateSceneIdentifiersUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateLocalizedNamesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__PGGraphEntityNetSceneNodeCollection_enumerateLocalizedNamesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EDC50;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"localizedName" withBlock:v6];
}

uint64_t __73__PGGraphEntityNetSceneNodeCollection_enumerateLocalizedNamesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSSet)localizedNames
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PGGraphEntityNetSceneNodeCollection_localizedNames__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"localizedName" withBlock:v6];

  return (NSSet *)v4;
}

uint64_t __53__PGGraphEntityNetSceneNodeCollection_localizedNames__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

@end