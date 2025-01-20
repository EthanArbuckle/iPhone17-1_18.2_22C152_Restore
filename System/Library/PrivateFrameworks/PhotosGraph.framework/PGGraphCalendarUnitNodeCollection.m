@interface PGGraphCalendarUnitNodeCollection
+ (Class)nodeClass;
+ (MARelation)dateOfCalendarUnit;
+ (id)calendarUnitNodesForUnitValue:(int64_t)a3 inGraph:(id)a4;
+ (id)calendarUnitNodesForUnitValues:(id)a3 inGraph:(id)a4;
+ (id)filter;
+ (unint64_t)calendarUnit;
- (PGGraphDateNodeCollection)dateNodes;
- (PGGraphFeatureNodeCollection)featureNodeCollection;
@end

@implementation PGGraphCalendarUnitNodeCollection

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:self];
}

- (PGGraphDateNodeCollection)dateNodes
{
  v3 = [(id)objc_opt_class() dateOfCalendarUnit];
  v4 = +[MANodeCollection nodesRelatedToNodes:self withRelation:v3];

  return (PGGraphDateNodeCollection *)v4;
}

+ (id)calendarUnitNodesForUnitValues:(id)a3 inGraph:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 filter];
  v13 = @"name";
  v14[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  v10 = [v8 filterBySettingProperties:v9];

  v11 = [a1 nodesMatchingFilter:v10 inGraph:v6];

  return v11;
}

+ (id)calendarUnitNodesForUnitValue:(int64_t)a3 inGraph:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 filter];
  v13 = @"name";
  v8 = [NSNumber numberWithInteger:a3];
  v14[0] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  v10 = [v7 filterBySettingProperties:v9];

  v11 = [a1 nodesMatchingFilter:v10 inGraph:v6];

  return v11;
}

+ (MARelation)dateOfCalendarUnit
{
  uint64_t v2 = [a1 calendarUnit];
  if ((unint64_t)(v2 - 1) > 5) {
    v3 = 0;
  }
  else {
    v3 = *off_1E68ED620[v2 - 1];
  }
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:v3 domain:400];
  v5 = [v4 inRelation];

  return (MARelation *)v5;
}

+ (id)filter
{
  uint64_t v2 = [a1 calendarUnit];
  if ((unint64_t)(v2 - 1) > 5) {
    v3 = 0;
  }
  else {
    v3 = *off_1E68ED5F0[v2 - 1];
  }
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:v3 domain:400];

  return v4;
}

+ (unint64_t)calendarUnit
{
  PGAbstractMethodException(a1, a2);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end