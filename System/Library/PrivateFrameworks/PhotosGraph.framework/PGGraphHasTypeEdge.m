@interface PGGraphHasTypeEdge
+ (id)filter;
- (PGGraphHasTypeEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromHighlightGroupNode:(id)a3 toHighlightTypeNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphHasTypeEdge

- (unsigned)domain
{
  return 103;
}

- (id)label
{
  v2 = @"HAS_TYPE";
  return @"HAS_TYPE";
}

- (PGGraphHasTypeEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphHasTypeEdge *)[(PGGraphHasTypeEdge *)self initFromHighlightGroupNode:a4 toHighlightTypeNode:a5];
}

- (id)initFromHighlightGroupNode:(id)a3 toHighlightTypeNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphHasTypeEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"HAS_TYPE" domain:103];
  return v2;
}

@end