@interface PGGraphFrequentLocationAtEdge
+ (id)filter;
- (PGGraphFrequentLocationAtEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromFrequentLocationNode:(id)a3 toAddressNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphFrequentLocationAtEdge

- (unsigned)domain
{
  return 204;
}

- (id)label
{
  v2 = @"AT";
  return @"AT";
}

- (PGGraphFrequentLocationAtEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphFrequentLocationAtEdge *)[(PGGraphFrequentLocationAtEdge *)self initFromFrequentLocationNode:a4 toAddressNode:a5];
}

- (id)initFromFrequentLocationNode:(id)a3 toAddressNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphFrequentLocationAtEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"AT" domain:204];
  return v2;
}

@end