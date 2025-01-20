@interface PGGraphLocationCountyNode
+ (id)addressOfCounty;
+ (id)filter;
+ (id)momentOfCounty;
- (Class)collectionClass;
- (PGGraphLocationCountyNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphLocationCountyNodeCollection)collection;
- (id)label;
@end

@implementation PGGraphLocationCountyNode

- (Class)collectionClass
{
  return (Class)objc_opt_class();
}

- (PGGraphLocationCountyNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphLocationCountyNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)label
{
  v2 = @"County";
  return @"County";
}

- (PGGraphLocationCountyNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PGGraphLocationCountyNode;
  return [(PGGraphNamedLocationNode *)&v6 initWithLabel:a3 domain:a4 properties:a5];
}

+ (id)momentOfCounty
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = [a1 filter];
  v4 = [v3 relation];
  v5 = +[PGGraphLocationEdge filter];
  objc_super v6 = [v5 inRelation];
  v7 = [v6 transitiveClosure];
  v13[1] = v7;
  v8 = +[PGGraphMomentNode filter];
  v9 = [v8 relation];
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  v11 = [v2 chain:v10];

  return v11;
}

+ (id)addressOfCounty
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = [a1 filter];
  v4 = [v3 relation];
  v5 = +[PGGraphLocationEdge filter];
  objc_super v6 = [v5 inRelation];
  v7 = [v6 transitiveClosure];
  v13[1] = v7;
  v8 = +[PGGraphAddressNode filter];
  v9 = [v8 relation];
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:3];
  v11 = [v2 chain:v10];

  return v11;
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"County" domain:200];
  return v2;
}

@end