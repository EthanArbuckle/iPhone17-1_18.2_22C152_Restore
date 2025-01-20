@interface PGGraphIsOwnerOfPetEdge
+ (id)filter;
- (PGGraphIsOwnerOfPetEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromPersonNode:(id)a3 toPetNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphIsOwnerOfPetEdge

- (unsigned)domain
{
  return 304;
}

- (id)label
{
  v2 = @"IS_OWNER_OF";
  return @"IS_OWNER_OF";
}

- (PGGraphIsOwnerOfPetEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphIsOwnerOfPetEdge *)[(PGGraphIsOwnerOfPetEdge *)self initFromPersonNode:a4 toPetNode:a5];
}

- (id)initFromPersonNode:(id)a3 toPetNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphIsOwnerOfPetEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"IS_OWNER_OF" domain:304];
  return v2;
}

@end