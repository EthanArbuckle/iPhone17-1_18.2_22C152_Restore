@interface PGGraphIsHomeWorkEdge
+ (id)filter;
- (PGGraphIsHomeWorkEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromAddressNode:(id)a3 toHomeWorkNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphIsHomeWorkEdge

- (unsigned)domain
{
  return 202;
}

- (id)label
{
  v2 = @"IS_HOME_WORK";
  return @"IS_HOME_WORK";
}

- (PGGraphIsHomeWorkEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphIsHomeWorkEdge *)[(PGGraphIsHomeWorkEdge *)self initFromAddressNode:a4 toHomeWorkNode:a5];
}

- (id)initFromAddressNode:(id)a3 toHomeWorkNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphIsHomeWorkEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"IS_HOME_WORK" domain:202];
  return v2;
}

@end