@interface PGGraphMomentNextEdge
+ (id)filter;
- (PGGraphMomentNextEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromMomentNode:(id)a3 toMomentNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphMomentNextEdge

- (unsigned)domain
{
  return 101;
}

- (id)label
{
  v2 = @"NEXT";
  return @"NEXT";
}

- (PGGraphMomentNextEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphMomentNextEdge *)[(PGGraphMomentNextEdge *)self initFromMomentNode:a4 toMomentNode:a5];
}

- (id)initFromMomentNode:(id)a3 toMomentNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphMomentNextEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"NEXT" domain:101];
  return v2;
}

@end