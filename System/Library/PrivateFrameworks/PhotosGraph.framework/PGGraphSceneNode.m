@interface PGGraphSceneNode
+ (MARelation)momentOfReliableScene;
+ (MARelation)momentOfScene;
+ (MARelation)momentOfSceneWithHighConfidenceAssets;
+ (id)filter;
+ (id)filterForSceneName:(id)a3;
+ (id)filterForSceneNames:(id)a3;
+ (id)filterWithSceneIdentifiers:(id)a3;
+ (id)momentOfSceneWithDominantSceneAssets;
+ (id)momentOfSceneWithSearchConfidenceAssets;
+ (id)suggestableSceneNames;
+ (unsigned)domain;
- (BOOL)hasProperties:(id)a3;
- (BOOL)isIndexed;
- (BOOL)isSuitableForSuggestions;
- (NSArray)localizedSynonyms;
- (NSString)description;
- (NSString)featureIdentifier;
- (NSString)localizedName;
- (NSString)sceneName;
- (PGGraphSceneNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphSceneNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6;
- (PGGraphSceneNode)initWithSceneName:(id)a3 sceneIdentifier:(unint64_t)a4 level:(unint64_t)a5 isIndexed:(BOOL)a6 localizedName:(id)a7 localizedSynonyms:(id)a8;
- (PGGraphSceneNode)initWithSceneTaxonomyNode:(id)a3 level:(unint64_t)a4;
- (PGGraphSceneNodeCollection)collection;
- (id)initForTestingWithSceneName:(id)a3;
- (id)label;
- (id)momentNodes;
- (id)propertyDictionary;
- (unint64_t)featureType;
- (unint64_t)level;
- (unint64_t)numberOfAssets;
- (unint64_t)numberOfDominantSceneAssets;
- (unint64_t)numberOfHighConfidenceAssets;
- (unint64_t)numberOfSearchConfidenceAssets;
- (unint64_t)sceneIdentifier;
- (unsigned)domain;
- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3;
@end

@implementation PGGraphSceneNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_localizedSynonyms, 0);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (BOOL)isIndexed
{
  return self->_isIndexed;
}

- (unint64_t)level
{
  return *((unsigned __int8 *)self + 32);
}

- (unint64_t)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (id)label
{
  return self->_label;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphSceneNode *)self label];
  v7 = [v3 stringWithFormat:@"%@|%@", v5, v6];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 18;
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
}

- (id)momentNodes
{
  v2 = [(PGGraphSceneNode *)self collection];
  v3 = [v2 momentNodes];
  v4 = [v3 temporarySet];

  return v4;
}

- (NSArray)localizedSynonyms
{
  return [(NSString *)self->_localizedSynonyms componentsSeparatedByString:@","];
}

- (unint64_t)numberOfDominantSceneAssets
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v2 = [(PGGraphSceneNode *)self collection];
  v3 = +[PGGraphEdgeCollection edgesToNodes:v2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PGGraphSceneNode_numberOfDominantSceneAssets__block_invoke;
  v6[3] = &unk_1E68E79F8;
  v6[4] = &v7;
  [v3 enumerateEdgesUsingBlock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __47__PGGraphSceneNode_numberOfDominantSceneAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 numberOfDominantSceneAssets];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)numberOfSearchConfidenceAssets
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v2 = [(PGGraphSceneNode *)self collection];
  v3 = +[PGGraphEdgeCollection edgesToNodes:v2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PGGraphSceneNode_numberOfSearchConfidenceAssets__block_invoke;
  v6[3] = &unk_1E68E79F8;
  v6[4] = &v7;
  [v3 enumerateEdgesUsingBlock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __50__PGGraphSceneNode_numberOfSearchConfidenceAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 numberOfSearchConfidenceAssets];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)numberOfHighConfidenceAssets
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v2 = [(PGGraphSceneNode *)self collection];
  v3 = +[PGGraphEdgeCollection edgesToNodes:v2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__PGGraphSceneNode_numberOfHighConfidenceAssets__block_invoke;
  v6[3] = &unk_1E68E79F8;
  v6[4] = &v7;
  [v3 enumerateEdgesUsingBlock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __48__PGGraphSceneNode_numberOfHighConfidenceAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 numberOfHighConfidenceAssets];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)numberOfAssets
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v2 = [(PGGraphSceneNode *)self collection];
  v3 = +[PGGraphEdgeCollection edgesToNodes:v2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PGGraphSceneNode_numberOfAssets__block_invoke;
  v6[3] = &unk_1E68E79F8;
  v6[4] = &v7;
  [v3 enumerateEdgesUsingBlock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __34__PGGraphSceneNode_numberOfAssets__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 numberOfAssets];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (BOOL)isSuitableForSuggestions
{
  v3 = [(id)objc_opt_class() suggestableSceneNames];
  unint64_t v4 = [(PGGraphSceneNode *)self label];
  int v5 = [v3 containsObject:v4];

  if (!v5) {
    return 0;
  }
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PGGraphSceneNode_isSuitableForSuggestions__block_invoke;
  v8[3] = &unk_1E68E79D0;
  v8[4] = v9;
  v8[5] = &v10;
  [(PGGraphSceneNode *)self enumerateMomentEdgesAndNodesUsingBlock:v8];
  BOOL v6 = *((unsigned char *)v11 + 24) != 0;
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __44__PGGraphSceneNode_isSuitableForSuggestions__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isSearchableForEvent];
  if (result)
  {
    if (++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

- (PGGraphSceneNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphSceneNodeCollection alloc] initWithNode:self];
  return v2;
}

- (unsigned)domain
{
  v2 = objc_opt_class();
  return [v2 domain];
}

- (NSString)sceneName
{
  return [(NSString *)self->_label lowercaseString];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"PGGraphSceneNode (%@, %d)", self->_label, *((unsigned __int8 *)self + 32)];
}

- (id)propertyDictionary
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"sceneIdentifier";
  v3 = [NSNumber numberWithUnsignedLongLong:self->_sceneIdentifier];
  v10[0] = v3;
  v9[1] = @"level";
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:*((unsigned __int8 *)self + 32)];
  v10[1] = v4;
  v9[2] = @"isIndexed";
  int v5 = [NSNumber numberWithBool:self->_isIndexed];
  localizedName = self->_localizedName;
  v10[2] = v5;
  v10[3] = localizedName;
  v9[3] = @"localizedName";
  void v9[4] = @"localizedSynonyms";
  v10[4] = self->_localizedSynonyms;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4 && [v4 count])
  {
    BOOL v6 = [v5 objectForKeyedSubscript:@"sceneIdentifier"];
    uint64_t v7 = v6;
    if (v6 && [v6 unsignedLongLongValue] != self->_sceneIdentifier) {
      goto LABEL_15;
    }

    v8 = [v5 objectForKeyedSubscript:@"level"];
    uint64_t v7 = v8;
    if (v8)
    {
      if ([v8 unsignedIntegerValue] != *((unsigned __int8 *)self + 32)) {
        goto LABEL_15;
      }
    }

    uint64_t v9 = [v5 objectForKeyedSubscript:@"isIndexed"];
    uint64_t v7 = v9;
    if (v9)
    {
      if (self->_isIndexed != [v9 BOOLValue]) {
        goto LABEL_15;
      }
    }

    uint64_t v10 = [v5 objectForKeyedSubscript:@"localizedName"];
    uint64_t v7 = v10;
    if (v10)
    {
      if (![v10 isEqual:self->_localizedName]) {
        goto LABEL_15;
      }
    }

    v11 = [v5 objectForKeyedSubscript:@"localizedSynonyms"];
    uint64_t v7 = v11;
    if (v11 && ![v11 isEqual:self->_localizedSynonyms]) {
LABEL_15:
    }
      BOOL v12 = 0;
    else {
      BOOL v12 = 1;
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (id)initForTestingWithSceneName:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  BOOL v6 = [v4 set];
  uint64_t v7 = [(PGGraphSceneNode *)self initWithSceneName:v5 sceneIdentifier:1 level:1 isIndexed:1 localizedName:v5 localizedSynonyms:v6];

  return v7;
}

- (PGGraphSceneNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 weight:(float)a5 properties:(id)a6
{
  uint64_t v7 = a4;
  id v9 = a3;
  id v10 = a6;
  v11 = [v10 objectForKeyedSubscript:@"lvl"];

  if (v11)
  {
    BOOL v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v10];
    char v13 = [v10 objectForKeyedSubscript:@"lvl"];
    [v12 setObject:v13 forKeyedSubscript:@"level"];

    [v12 setObject:0 forKeyedSubscript:@"lvl"];
    id v10 = v12;
  }
  v14 = [(PGGraphSceneNode *)self initWithLabel:v9 domain:v7 properties:v10];

  return v14;
}

- (PGGraphSceneNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [v7 objectForKeyedSubscript:@"sceneIdentifier"];
  uint64_t v10 = [v9 unsignedLongLongValue];

  v11 = [v7 objectForKeyedSubscript:@"level"];
  uint64_t v12 = [v11 unsignedIntegerValue];

  char v13 = [v7 objectForKeyedSubscript:@"isIndexed"];
  uint64_t v14 = [v13 BOOLValue];

  uint64_t v15 = [v7 objectForKeyedSubscript:@"localizedName"];
  v16 = (void *)v15;
  if (v15) {
    v17 = (void *)v15;
  }
  else {
    v17 = v8;
  }
  id v18 = v17;

  id v19 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v20 = [v7 objectForKeyedSubscript:@"localizedSynonyms"];

  if (v20) {
    v21 = v20;
  }
  else {
    v21 = &stru_1F283BC78;
  }
  v22 = [(__CFString *)v21 componentsSeparatedByString:@","];
  v23 = (void *)[v19 initWithArray:v22];

  v24 = [(PGGraphSceneNode *)self initWithSceneName:v8 sceneIdentifier:v10 level:v12 isIndexed:v14 localizedName:v18 localizedSynonyms:v23];
  return v24;
}

- (PGGraphSceneNode)initWithSceneName:(id)a3 sceneIdentifier:(unint64_t)a4 level:(unint64_t)a5 isIndexed:(BOOL)a6 localizedName:(id)a7 localizedSynonyms:(id)a8
{
  char v11 = a5;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  v26.receiver = self;
  v26.super_class = (Class)PGGraphSceneNode;
  v17 = [(PGGraphNode *)&v26 init];
  if (v17)
  {
    uint64_t v18 = [v14 capitalizedString];
    label = v17->_label;
    v17->_label = (NSString *)v18;

    v17->_sceneIdentifier = a4;
    *((unsigned char *)v17 + 32) = v11;
    v17->_isIndexed = a6;
    objc_storeStrong((id *)&v17->_localizedName, a7);
    v20 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"self" ascending:1];
    v27[0] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    v22 = [v16 sortedArrayUsingDescriptors:v21];
    uint64_t v23 = [v22 componentsJoinedByString:@","];
    localizedSynonyms = v17->_localizedSynonyms;
    v17->_localizedSynonyms = (NSString *)v23;
  }
  return v17;
}

- (PGGraphSceneNode)initWithSceneTaxonomyNode:(id)a3 level:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [v6 name];
  id v8 = [v6 localizedName];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [v7 capitalizedString];
  }
  char v11 = v10;

  uint64_t v12 = [v6 localizedSynonyms];
  char v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1CAD0] set];
  }
  id v15 = v14;

  id v16 = -[PGGraphSceneNode initWithSceneName:sceneIdentifier:level:isIndexed:localizedName:localizedSynonyms:](self, "initWithSceneName:sceneIdentifier:level:isIndexed:localizedName:localizedSynonyms:", v7, [v6 identifier], a4, objc_msgSend(v6, "isIndexed"), v11, v15);
  return v16;
}

+ (id)momentOfSceneWithDominantSceneAssets
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = +[PGGraphSceneEdge dominantSceneAssetsFilter];
  id v4 = [v3 inRelation];
  v10[0] = v4;
  id v5 = +[PGGraphMomentNode filter];
  id v6 = [v5 relation];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = [v2 chain:v7];

  return v8;
}

+ (id)momentOfSceneWithSearchConfidenceAssets
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = +[PGGraphSceneEdge searchConfidenceAssetsFilter];
  id v4 = [v3 inRelation];
  v10[0] = v4;
  id v5 = +[PGGraphMomentNode filter];
  id v6 = [v5 relation];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = [v2 chain:v7];

  return v8;
}

+ (MARelation)momentOfSceneWithHighConfidenceAssets
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = +[PGGraphSceneEdge highConfidenceAssetsFilter];
  id v4 = [v3 inRelation];
  v10[0] = v4;
  id v5 = +[PGGraphMomentNode filter];
  id v6 = [v5 relation];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (MARelation)momentOfReliableScene
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = +[PGGraphSceneEdge isReliableFilter];
  id v4 = [v3 inRelation];
  v10[0] = v4;
  id v5 = +[PGGraphMomentNode filter];
  id v6 = [v5 relation];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (MARelation)momentOfScene
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = +[PGGraphSceneEdge filter];
  id v4 = [v3 inRelation];
  v10[0] = v4;
  id v5 = +[PGGraphMomentNode filter];
  id v6 = [v5 relation];
  v10[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v8 = [v2 chain:v7];

  return (MARelation *)v8;
}

+ (id)suggestableSceneNames
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PGGraphSceneNode_suggestableSceneNames__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (suggestableSceneNames_onceToken != -1) {
    dispatch_once(&suggestableSceneNames_onceToken, block);
  }
  v2 = (void *)suggestableSceneNames_suggestableSceneNames;
  return v2;
}

void __41__PGGraphSceneNode_suggestableSceneNames__block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = [v0 URLForResource:@"SuggestableSceneNames" withExtension:@"plist"];

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = 0;
  v3 = [MEMORY[0x1E4F1C978] arrayWithContentsOfURL:v1 error:&v9];
  id v4 = v9;
  uint64_t v5 = [v2 setWithArray:v3];
  id v6 = (void *)suggestableSceneNames_suggestableSceneNames;
  suggestableSceneNames_suggestableSceneNames = v5;

  if (v4)
  {
    id v7 = +[PGLogging sharedLogging];
    id v8 = [v7 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      char v11 = @"SuggestableSceneNames";
      _os_log_error_impl(&dword_1D1805000, v8, OS_LOG_TYPE_ERROR, "Couldn't load %@.plist", buf, 0xCu);
    }
  }
}

+ (unsigned)domain
{
  return 600;
}

+ (id)filterWithSceneIdentifiers:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 filter];
  id v9 = @"sceneIdentifier";
  v10[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v7 = [v5 filterBySettingProperties:v6];

  return v7;
}

+ (id)filterForSceneNames:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "capitalizedString", (void)v16);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v12 = objc_alloc(MEMORY[0x1E4F71F00]);
  uint64_t v13 = [a1 domain];
  id v14 = (void *)[v12 initWithLabels:v5 domain:v13 properties:MEMORY[0x1E4F1CC08]];

  return v14;
}

+ (id)filterForSceneName:(id)a3
{
  id v4 = [a3 capitalizedString];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F71F00]), "initWithLabel:domain:", v4, objc_msgSend(a1, "domain"));

  return v5;
}

+ (id)filter
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F71F00]), "initWithLabel:domain:", 0, objc_msgSend(a1, "domain"));
  return v2;
}

@end