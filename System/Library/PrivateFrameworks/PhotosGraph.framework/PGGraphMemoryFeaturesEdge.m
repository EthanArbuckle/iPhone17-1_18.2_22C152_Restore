@interface PGGraphMemoryFeaturesEdge
+ (id)filter;
- (PGGraphMemoryFeaturesEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromMemoryNode:(id)a3 toFeatureNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphMemoryFeaturesEdge

- (unsigned)domain
{
  return 1100;
}

- (id)label
{
  v2 = @"MEMORY_FEATURES";
  return @"MEMORY_FEATURES";
}

- (PGGraphMemoryFeaturesEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphMemoryFeaturesEdge *)[(PGGraphMemoryFeaturesEdge *)self initFromMemoryNode:a4 toFeatureNode:a5];
}

- (id)initFromMemoryNode:(id)a3 toFeatureNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphMemoryFeaturesEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"MEMORY_FEATURES" domain:1100];
  return v2;
}

@end