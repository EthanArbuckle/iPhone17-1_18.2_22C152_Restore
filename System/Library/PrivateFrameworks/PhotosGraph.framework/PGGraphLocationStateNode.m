@interface PGGraphLocationStateNode
+ (id)addressOfState;
+ (id)countryOfState;
+ (id)filter;
+ (id)momentOfState;
- (Class)collectionClass;
- (PGGraphLocationStateNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5;
- (PGGraphLocationStateNodeCollection)collection;
- (id)label;
- (unint64_t)featureType;
@end

@implementation PGGraphLocationStateNode

- (unint64_t)featureType
{
  return 5;
}

- (Class)collectionClass
{
  return (Class)objc_opt_class();
}

- (PGGraphLocationStateNodeCollection)collection
{
  v2 = [(MANodeCollection *)[PGGraphLocationStateNodeCollection alloc] initWithNode:self];
  return v2;
}

- (id)label
{
  v2 = @"State";
  return @"State";
}

- (PGGraphLocationStateNode)initWithLabel:(id)a3 domain:(unsigned __int16)a4 properties:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PGGraphLocationStateNode;
  return [(PGGraphNamedLocationNode *)&v6 initWithLabel:a3 domain:a4 properties:a5];
}

+ (id)countryOfState
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F71F18];
  v3 = +[PGGraphLocationEdge filter];
  v4 = [v3 outRelation];
  v5 = [v4 transitiveClosure];
  v11[0] = v5;
  objc_super v6 = +[PGGraphLocationCountryNode filter];
  v7 = [v6 relation];
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  v9 = [v2 chain:v8];

  return v9;
}

+ (id)momentOfState
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

+ (id)addressOfState
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
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71F00]) initWithLabel:@"State" domain:200];
  return v2;
}

@end