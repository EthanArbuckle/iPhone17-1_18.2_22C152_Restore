@interface PGGraphLocationStateEdge
+ (id)filter;
- (PGGraphLocationStateEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromLocationNode:(id)a3 toStateNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphLocationStateEdge

- (unsigned)domain
{
  return 200;
}

- (id)label
{
  v2 = @"STATE";
  return @"STATE";
}

- (PGGraphLocationStateEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphLocationStateEdge *)[(PGGraphLocationStateEdge *)self initFromLocationNode:a4 toStateNode:a5];
}

- (id)initFromLocationNode:(id)a3 toStateNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphLocationStateEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"STATE" domain:200];
  return v2;
}

@end