@interface PGGraphPublicEventCategoryNode
+ (MARelation)publicEventOfCategory;
+ (id)filter;
+ (id)filterWithCategories:(id)a3;
+ (id)filterWithCategory:(id)a3;
- (BOOL)hasProperties:(id)a3;
- (NSArray)localizedSynonyms;
- (NSString)description;
- (NSString)localizedName;
- (PGGraphPublicEventCategoryNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphPublicEventCategoryNode)initWithLabel:(id)a3 localizedName:(id)a4;
- (PGGraphPublicEventCategoryNodeCollection)collection;
- (id)associatedNodesForRemoval;
- (id)label;
- (id)propertyDictionary;
- (unsigned)domain;
@end

@implementation PGGraphPublicEventCategoryNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)label
{
  return self->_label;
}

- (id)associatedNodesForRemoval
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PGGraphPublicEventCategoryNode_associatedNodesForRemoval__block_invoke;
  v6[3] = &unk_1E68F1B78;
  id v4 = v3;
  id v7 = v4;
  [(MANode *)self enumerateNeighborEdgesAndNodesThroughEdgesWithLabel:@"LOCALIZED_SUBCATEGORY" domain:902 usingBlock:v6];

  return v4;
}

void __59__PGGraphPublicEventCategoryNode_associatedNodesForRemoval__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 countOfEdgesWithLabel:@"LOCALIZED_SUBCATEGORY" domain:902] == 1) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (NSArray)localizedSynonyms
{
  return (NSArray *)+[PGGraphSynonymSupportHelper localizedSynonymsForLocalizationKey:self->_label];
}

- (unsigned)domain
{
  return 901;
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphPublicEventCategoryNode;
  id v4 = [(PGGraphOptimizedNode *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ (%@)", v4, self->_localizedName];

  return (NSString *)v5;
}

- (id)propertyDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  localizedName = self->_localizedName;
  if (localizedName)
  {
    v5 = @"lcln";
    v6[0] = localizedName;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v3;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    v6 = [v5 objectForKeyedSubscript:@"lcln"];
    objc_super v7 = v6;
    BOOL v8 = !v6 || [v6 isEqual:self->_localizedName];
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (PGGraphPublicEventCategoryNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphPublicEventCategoryNodeCollection alloc] initWithNode:self];
  return v2;
}

- (PGGraphPublicEventCategoryNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v7 = a3;
  BOOL v8 = [a5 objectForKeyedSubscript:@"lcln"];
  v9 = [(PGGraphPublicEventCategoryNode *)self initWithLabel:v7 localizedName:v8];

  return v9;
}

- (PGGraphPublicEventCategoryNode)initWithLabel:(id)a3 localizedName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGGraphPublicEventCategoryNode;
  BOOL v8 = [(PGGraphNode *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    label = v8->_label;
    v8->_label = (NSString *)v9;

    objc_storeStrong((id *)&v8->_localizedName, a4);
  }

  return v8;
}

+ (MARelation)publicEventOfCategory
{
  v2 = +[PGGraphPublicEventCategoryEdge filter];
  v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (id)filterWithCategories:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = (void *)[v5 initWithLabels:v4 domain:901 properties:MEMORY[0x1E4F1CC08]];

  return v6;
}

+ (id)filterWithCategory:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F71F00];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithLabel:v4 domain:901];

  return v5;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:0 domain:901];
  return v2;
}

@end