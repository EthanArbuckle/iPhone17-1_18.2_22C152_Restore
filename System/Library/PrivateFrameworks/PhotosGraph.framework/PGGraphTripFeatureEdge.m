@interface PGGraphTripFeatureEdge
+ (id)filter;
- (PGGraphTripFeatureEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromHighlightGroupNode:(id)a3 toFeatureNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphTripFeatureEdge

- (unsigned)domain
{
  return 200;
}

- (id)label
{
  v2 = @"TRIP_FEATURES";
  return @"TRIP_FEATURES";
}

- (PGGraphTripFeatureEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphTripFeatureEdge *)[(PGGraphTripFeatureEdge *)self initFromHighlightGroupNode:a4 toFeatureNode:a5];
}

- (id)initFromHighlightGroupNode:(id)a3 toFeatureNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphTripFeatureEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"TRIP_FEATURES" domain:200];
  return v2;
}

@end