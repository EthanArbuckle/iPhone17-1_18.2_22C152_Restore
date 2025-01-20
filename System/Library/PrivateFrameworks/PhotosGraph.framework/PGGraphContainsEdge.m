@interface PGGraphContainsEdge
+ (id)filter;
- (PGGraphContainsEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromHighlightNode:(id)a3 toMomentNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphContainsEdge

- (unsigned)domain
{
  return 102;
}

- (id)label
{
  v2 = @"CONTAINS";
  return @"CONTAINS";
}

- (PGGraphContainsEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphContainsEdge *)[(PGGraphContainsEdge *)self initFromHighlightNode:a4 toMomentNode:a5];
}

- (id)initFromHighlightNode:(id)a3 toMomentNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphContainsEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"CONTAINS" domain:102];
  return v2;
}

@end