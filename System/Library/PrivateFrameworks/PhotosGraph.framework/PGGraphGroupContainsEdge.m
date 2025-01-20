@interface PGGraphGroupContainsEdge
+ (id)filter;
- (PGGraphGroupContainsEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromHighlightGroupNode:(id)a3 toHighlightNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphGroupContainsEdge

- (unsigned)domain
{
  return 102;
}

- (id)label
{
  v2 = @"GROUP_CONTAINS";
  return @"GROUP_CONTAINS";
}

- (PGGraphGroupContainsEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphGroupContainsEdge *)[(PGGraphGroupContainsEdge *)self initFromHighlightGroupNode:a4 toHighlightNode:a5];
}

- (id)initFromHighlightGroupNode:(id)a3 toHighlightNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphGroupContainsEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"GROUP_CONTAINS" domain:102];
  return v2;
}

@end