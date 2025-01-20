@interface PGGraphPublicEventNode
+ (MARelation)businessOfPublicEvent;
+ (MARelation)categoryOfPublicEvent;
+ (MARelation)momentOfPublicEvent;
+ (MARelation)performerOfPublicEvent;
+ (id)filter;
+ (id)unsupportedCategoriesForTitles;
- (BOOL)hasProperties:(id)a3;
- (NSSet)categories;
- (NSSet)localizedCategories;
- (NSSet)performers;
- (NSSet)preciseLocalizedCategoryNames;
- (NSString)description;
- (NSString)featureIdentifier;
- (NSString)name;
- (PGGraphBusinessNode)businessNode;
- (PGGraphPublicEventNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphPublicEventNode)initWithMUID:(unint64_t)a3 name:(id)a4 expectedAttendance:(int64_t)a5;
- (PGGraphPublicEventNodeCollection)collection;
- (PPNamedEntity)pg_namedEntity;
- (id)associatedNodesForRemoval;
- (id)keywordDescription;
- (id)label;
- (id)propertyDictionary;
- (int64_t)expectedAttendance;
- (unint64_t)featureType;
- (unint64_t)muid;
- (unsigned)domain;
- (void)enumerateLocalizedSubcategoryNodesUsingBlock:(id)a3;
- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3;
- (void)enumeratePerformerEdgesAndNodesUsingBlock:(id)a3;
- (void)enumeratePerformerNodesUsingBlock:(id)a3;
- (void)enumeratePublicEventCategoryEdgesAndNodesUsingBlock:(id)a3;
- (void)enumeratePublicEventCategoryNodesUsingBlock:(id)a3;
@end

@implementation PGGraphPublicEventNode

- (PPNamedEntity)pg_namedEntity
{
  v3 = [(PGGraphPublicEventNode *)self name];
  v4 = v3;
  if (v3 && [v3 length])
  {
    v5 = [(PGGraphPublicEventNode *)self categories];
    v6 = [v5 anyObject];

    id v7 = v6;
    if (namedEntityCategoryFromPublicEventCategory_onceToken != -1) {
      dispatch_once(&namedEntityCategoryFromPublicEventCategory_onceToken, &__block_literal_global_116);
    }
    v8 = [(id)namedEntityCategoryFromPublicEventCategory_namedEntityCategoryByPublicEventCategory objectForKeyedSubscript:v7];
    v9 = v8;
    if (v8) {
      uint64_t v10 = [v8 unsignedIntegerValue];
    }
    else {
      uint64_t v10 = 2;
    }

    v12 = [MEMORY[0x1E4F1CA20] currentLocale];
    v13 = [v12 localeIdentifier];

    v11 = (void *)[objc_alloc(MEMORY[0x1E4F89E90]) initWithName:v4 category:v10 language:v13];
  }
  else
  {
    v11 = 0;
  }

  return (PPNamedEntity *)v11;
}

- (void).cxx_destruct
{
}

- (int64_t)expectedAttendance
{
  return self->_expectedAttendance;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (NSString)featureIdentifier
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PGGraphPublicEventNode *)self name];
  id v7 = [v3 stringWithFormat:@"%@|%@|%llu", v5, v6, -[PGGraphPublicEventNode muid](self, "muid")];

  return (NSString *)v7;
}

- (unint64_t)featureType
{
  return 21;
}

- (id)associatedNodesForRemoval
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PGGraphPublicEventNode_associatedNodesForRemoval__block_invoke;
  aBlock[3] = &unk_1E68ECE60;
  id v4 = v3;
  id v16 = v4;
  v5 = _Block_copy(aBlock);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__PGGraphPublicEventNode_associatedNodesForRemoval__block_invoke_2;
  v13[3] = &unk_1E68ECE88;
  id v6 = v5;
  id v14 = v6;
  [(PGGraphPublicEventNode *)self enumeratePublicEventCategoryNodesUsingBlock:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__PGGraphPublicEventNode_associatedNodesForRemoval__block_invoke_3;
  v11[3] = &unk_1E68ECEB0;
  id v12 = v6;
  id v7 = v6;
  [(PGGraphPublicEventNode *)self enumeratePerformerNodesUsingBlock:v11];
  v8 = v12;
  id v9 = v4;

  return v9;
}

void __51__PGGraphPublicEventNode_associatedNodesForRemoval__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v8 = a2;
  id v7 = a3;
  if (v8 && [v8 countOfEdgesWithLabel:v7 domain:a4] == 1) {
    [*(id *)(a1 + 32) addObject:v8];
  }
}

uint64_t __51__PGGraphPublicEventNode_associatedNodesForRemoval__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__PGGraphPublicEventNode_associatedNodesForRemoval__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)keywordDescription
{
  v3 = [(PGGraphPublicEventNode *)self categories];
  id v4 = [v3 allObjects];

  v5 = [(PGGraphPublicEventNode *)self performers];
  id v6 = [v5 allObjects];

  id v7 = NSString;
  id v8 = [(PGGraphPublicEventNode *)self name];
  id v9 = [v4 componentsJoinedByString:@", "];
  uint64_t v10 = [v6 componentsJoinedByString:@", "];
  v11 = [v7 stringWithFormat:@"%@ [%@] [%@]", v8, v9, v10];

  return v11;
}

- (void)enumeratePublicEventCategoryNodesUsingBlock:(id)a3
{
}

- (void)enumeratePublicEventCategoryEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumeratePerformerNodesUsingBlock:(id)a3
{
}

- (void)enumeratePerformerEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumerateMomentEdgesAndNodesUsingBlock:(id)a3
{
}

- (void)enumerateLocalizedSubcategoryNodesUsingBlock:(id)a3
{
}

- (NSSet)preciseLocalizedCategoryNames
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PGGraphPublicEventNode_preciseLocalizedCategoryNames__block_invoke;
  v8[3] = &unk_1E68ECE38;
  id v4 = v3;
  id v9 = v4;
  uint64_t v10 = v11;
  [(PGGraphPublicEventNode *)self enumerateLocalizedSubcategoryNodesUsingBlock:v8];
  if (![v4 count])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__PGGraphPublicEventNode_preciseLocalizedCategoryNames__block_invoke_2;
    v6[3] = &unk_1E68ED410;
    id v7 = v4;
    [(PGGraphPublicEventNode *)self enumeratePublicEventCategoryNodesUsingBlock:v6];
  }
  _Block_object_dispose(v11, 8);
  return (NSSet *)v4;
}

void __55__PGGraphPublicEventNode_preciseLocalizedCategoryNames__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  unint64_t v3 = [v7 level];
  if ([*(id *)(a1 + 32) count]
    && (unint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), v3 <= v4))
  {
    if (v3 != v4) {
      goto LABEL_6;
    }
  }
  else
  {
    [*(id *)(a1 + 32) removeAllObjects];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  }
  v5 = *(void **)(a1 + 32);
  id v6 = [v7 label];
  [v5 addObject:v6];

LABEL_6:
}

void __55__PGGraphPublicEventNode_preciseLocalizedCategoryNames__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 localizedName];
  if (v3)
  {
    unint64_t v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    unint64_t v3 = v4;
  }
}

- (PGGraphBusinessNode)businessNode
{
  v2 = [(PGGraphPublicEventNode *)self collection];
  unint64_t v3 = [v2 businessNodes];
  unint64_t v4 = [v3 anyNode];

  return (PGGraphBusinessNode *)v4;
}

- (NSSet)performers
{
  unint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  unint64_t v4 = [(PGGraphPublicEventNode *)self collection];
  v5 = [v4 performerNodes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__PGGraphPublicEventNode_performers__block_invoke;
  v8[3] = &unk_1E68F1988;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateStringPropertyValuesForKey:@"name" withBlock:v8];

  return (NSSet *)v6;
}

void __36__PGGraphPublicEventNode_performers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v7 = v4;
    uint64_t v6 = [v4 length];
    v5 = v7;
    if (v6)
    {
      [*(id *)(a1 + 32) addObject:v7];
      v5 = v7;
    }
  }
}

- (NSSet)localizedCategories
{
  unint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__PGGraphPublicEventNode_localizedCategories__block_invoke;
  v11[3] = &unk_1E68ED410;
  id v4 = v3;
  id v12 = v4;
  [(PGGraphPublicEventNode *)self enumeratePublicEventCategoryNodesUsingBlock:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PGGraphPublicEventNode_localizedCategories__block_invoke_2;
  v9[3] = &unk_1E68ECE10;
  id v5 = v4;
  id v10 = v5;
  [(PGGraphPublicEventNode *)self enumerateLocalizedSubcategoryNodesUsingBlock:v9];
  uint64_t v6 = v10;
  id v7 = (NSSet *)v5;

  return v7;
}

void __45__PGGraphPublicEventNode_localizedCategories__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 localizedName];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    unint64_t v3 = v4;
  }
}

void __45__PGGraphPublicEventNode_localizedCategories__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 label];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    unint64_t v3 = v4;
  }
}

- (NSSet)categories
{
  unint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__PGGraphPublicEventNode_categories__block_invoke;
  v6[3] = &unk_1E68ED410;
  id v4 = v3;
  id v7 = v4;
  [(PGGraphPublicEventNode *)self enumeratePublicEventCategoryNodesUsingBlock:v6];

  return (NSSet *)v4;
}

void __36__PGGraphPublicEventNode_categories__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 label];
  [v2 addObject:v3];
}

- (PGGraphPublicEventNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphPublicEventNodeCollection alloc] initWithNode:self];
  return v2;
}

- (unsigned)domain
{
  return 900;
}

- (id)label
{
  v2 = @"PublicEvent";
  return @"PublicEvent";
}

- (NSString)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)PGGraphPublicEventNode;
  id v4 = [(PGGraphOptimizedNode *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ (%@, %llu, %d)", v4, self->_name, self->_muid, self->_expectedAttendance];

  return (NSString *)v5;
}

- (id)propertyDictionary
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"id";
  id v3 = [NSNumber numberWithUnsignedLongLong:self->_muid];
  name = self->_name;
  v9[0] = v3;
  v9[1] = name;
  v8[1] = @"name";
  v8[2] = @"attdc";
  id v5 = [NSNumber numberWithInteger:self->_expectedAttendance];
  v9[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (BOOL)hasProperties:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [v5 objectForKeyedSubscript:@"id"];
    objc_super v7 = v6;
    if (v6 && [v6 unsignedIntegerValue] != self->_muid) {
      goto LABEL_11;
    }

    id v8 = [v5 objectForKeyedSubscript:@"name"];
    objc_super v7 = v8;
    if (v8)
    {
      if (![v8 isEqual:self->_name]) {
        goto LABEL_11;
      }
    }

    id v9 = [v5 objectForKeyedSubscript:@"attdc"];
    objc_super v7 = v9;
    if (v9 && [v9 integerValue] != self->_expectedAttendance) {
LABEL_11:
    }
      BOOL v10 = 0;
    else {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (PGGraphPublicEventNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  id v6 = a5;
  objc_super v7 = [v6 objectForKeyedSubscript:@"id"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  id v9 = [v6 objectForKeyedSubscript:@"name"];
  BOOL v10 = [v6 objectForKeyedSubscript:@"attdc"];

  uint64_t v11 = [v10 integerValue];
  id v12 = [(PGGraphPublicEventNode *)self initWithMUID:v8 name:v9 expectedAttendance:v11];

  return v12;
}

- (PGGraphPublicEventNode)initWithMUID:(unint64_t)a3 name:(id)a4 expectedAttendance:(int64_t)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGGraphPublicEventNode;
  BOOL v10 = [(PGGraphNode *)&v13 init];
  uint64_t v11 = v10;
  if (v10)
  {
    v10->_muid = a3;
    objc_storeStrong((id *)&v10->_name, a4);
    v11->_expectedAttendance = a5;
  }

  return v11;
}

+ (MARelation)businessOfPublicEvent
{
  v2 = +[PGGraphPublicEventBusinessEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)performerOfPublicEvent
{
  v2 = +[PGGraphPerformerEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (MARelation)momentOfPublicEvent
{
  v2 = +[PGGraphPublicEventEdge filter];
  id v3 = [v2 inRelation];

  return (MARelation *)v3;
}

+ (MARelation)categoryOfPublicEvent
{
  v2 = +[PGGraphPublicEventCategoryEdge filter];
  id v3 = [v2 outRelation];

  return (MARelation *)v3;
}

+ (id)unsupportedCategoriesForTitles
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F28D4818];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"PublicEvent" domain:900];
  return v2;
}

@end