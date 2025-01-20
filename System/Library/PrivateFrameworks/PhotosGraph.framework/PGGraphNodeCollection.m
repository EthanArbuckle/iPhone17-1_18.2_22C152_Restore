@interface PGGraphNodeCollection
+ (Class)nodeClass;
+ (MANodeFilter)filter;
+ (id)nodesInGraph:(id)a3;
+ (id)subsetInCollection:(id)a3;
- (PGGraphNodeCollection)initWithSubsetInGraph:(id)a3 elementIdentifiers:(id)a4;
@end

@implementation PGGraphNodeCollection

- (PGGraphNodeCollection)initWithSubsetInGraph:(id)a3 elementIdentifiers:(id)a4
{
  sub_1D181F2D8(0, &qword_1EA65D9C0);
  swift_unknownObjectRetain();
  sub_1D1B3463C(a3, a4);
  return result;
}

+ (id)subsetInCollection:(id)a3
{
  id v4 = a3;
  v5 = [a1 filter];
  v6 = [v5 relation];
  v7 = [a1 nodesRelatedToNodes:v4 withRelation:v6];

  return v7;
}

+ (id)nodesInGraph:(id)a3
{
  id v4 = a3;
  v5 = [a1 filter];
  v6 = [a1 nodesMatchingFilter:v5 inGraph:v4];

  return v6;
}

+ (MANodeFilter)filter
{
  v2 = (void *)[a1 nodeClass];
  return (MANodeFilter *)[v2 filter];
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end