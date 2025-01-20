@interface PGGraphIsOwnedByEdge
+ (id)filter;
- (PGGraphIsOwnedByEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromHomeWorkNode:(id)a3 toPersonNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphIsOwnedByEdge

- (unsigned)domain
{
  return 202;
}

- (id)label
{
  v2 = @"IS_OWNED_BY";
  return @"IS_OWNED_BY";
}

- (PGGraphIsOwnedByEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphIsOwnedByEdge *)[(PGGraphIsOwnedByEdge *)self initFromHomeWorkNode:a4 toPersonNode:a5];
}

- (id)initFromHomeWorkNode:(id)a3 toPersonNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphIsOwnedByEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"IS_OWNED_BY" domain:202];
  return v2;
}

@end