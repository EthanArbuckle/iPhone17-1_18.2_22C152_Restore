@interface PGGraphFrequentLocationInEdge
+ (id)filter;
- (PGGraphFrequentLocationInEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromMomentNode:(id)a3 toFrequentLocationNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphFrequentLocationInEdge

- (unsigned)domain
{
  return 204;
}

- (id)label
{
  v2 = @"IN";
  return @"IN";
}

- (PGGraphFrequentLocationInEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphFrequentLocationInEdge *)[(PGGraphFrequentLocationInEdge *)self initFromMomentNode:a4 toFrequentLocationNode:a5];
}

- (id)initFromMomentNode:(id)a3 toFrequentLocationNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphFrequentLocationInEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"IN" domain:204];
  return v2;
}

@end