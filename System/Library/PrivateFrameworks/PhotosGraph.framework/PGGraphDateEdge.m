@interface PGGraphDateEdge
+ (id)filter;
- (PGGraphDateEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromMomentNode:(id)a3 toDateNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphDateEdge

- (unsigned)domain
{
  return 400;
}

- (id)label
{
  v2 = @"DATE";
  return @"DATE";
}

- (PGGraphDateEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphDateEdge *)[(PGGraphDateEdge *)self initFromMomentNode:a4 toDateNode:a5];
}

- (id)initFromMomentNode:(id)a3 toDateNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphDateEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"DATE" domain:400];
  return v2;
}

@end