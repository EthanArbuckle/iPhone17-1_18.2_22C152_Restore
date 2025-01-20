@interface PGGraphHolidayNodeCollection
+ (Class)nodeClass;
+ (id)holidayNodesWithCategory:(unint64_t)a3 inGraph:(id)a4;
+ (id)holidayNodesWithName:(id)a3 inGraph:(id)a4;
+ (id)holidayNodesWithNames:(id)a3 inGraph:(id)a4;
- (NSSet)holidayNames;
- (NSSet)localizedHolidayNames;
- (PGGraphDateNodeCollection)dateNodes;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
- (PGGraphMomentNodeCollection)celebratingMomentNodes;
- (void)enumerateHolidayNamesUsingBlock:(id)a3;
@end

@implementation PGGraphHolidayNodeCollection

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (void)enumerateHolidayNamesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PGGraphHolidayNodeCollection_enumerateHolidayNamesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EDC50;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];
}

uint64_t __64__PGGraphHolidayNodeCollection_enumerateHolidayNamesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSSet)localizedHolidayNames
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PGGraphHolidayNodeCollection_localizedHolidayNames__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];

  return (NSSet *)v4;
}

void __53__PGGraphHolidayNodeCollection_localizedHolidayNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = [MEMORY[0x1E4F76CA8] localizedNameForName:v5];
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (NSSet)holidayNames
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PGGraphHolidayNodeCollection_holidayNames__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];

  return (NSSet *)v4;
}

void __44__PGGraphHolidayNodeCollection_holidayNames__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 length]) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (PGGraphDateNodeCollection)dateNodes
{
  v3 = +[PGGraphHolidayEdge filter];
  id v4 = [v3 inRelation];
  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphDateNodeCollection *)v5;
}

- (PGGraphMomentNodeCollection)celebratingMomentNodes
{
  v3 = +[PGGraphCelebratingEdge filter];
  id v4 = [v3 inRelation];

  id v5 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v4];

  return (PGGraphMomentNodeCollection *)v5;
}

+ (id)holidayNodesWithCategory:(unint64_t)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = +[PGGraphHolidayNode holidayNodeFilterWithCategory:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)holidayNodesWithNames:(id)a3 inGraph:(id)a4
{
  id v6 = a4;
  id v7 = +[PGGraphHolidayNode holidayNodeFilterWithNames:a3];
  v8 = [a1 nodesMatchingFilter:v7 inGraph:v6];

  return v8;
}

+ (id)holidayNodesWithName:(id)a3 inGraph:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v12 count:1];

  v10 = objc_msgSend(a1, "holidayNodesWithNames:inGraph:", v9, v7, v12, v13);

  return v10;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end