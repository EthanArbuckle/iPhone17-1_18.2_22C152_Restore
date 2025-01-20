@interface PGGraphMemoryContainsAssetsFromEdge
+ (id)filter;
- (PGGraphMemoryContainsAssetsFromEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromMemoryNode:(id)a3 toMomentSourceNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphMemoryContainsAssetsFromEdge

- (unsigned)domain
{
  return 1100;
}

- (id)label
{
  v2 = @"CONTAINS_ASSETS_FROM";
  return @"CONTAINS_ASSETS_FROM";
}

- (PGGraphMemoryContainsAssetsFromEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphMemoryContainsAssetsFromEdge *)[(PGGraphMemoryContainsAssetsFromEdge *)self initFromMemoryNode:a4 toMomentSourceNode:a5];
}

- (id)initFromMemoryNode:(id)a3 toMomentSourceNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphMemoryContainsAssetsFromEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"CONTAINS_ASSETS_FROM" domain:1100];
  return v2;
}

@end