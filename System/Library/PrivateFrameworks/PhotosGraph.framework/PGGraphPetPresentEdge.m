@interface PGGraphPetPresentEdge
+ (id)filter;
- (PGGraphPetPresentEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromPetNode:(id)a3 toMomentNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphPetPresentEdge

- (unsigned)domain
{
  return 304;
}

- (id)label
{
  v2 = @"PET_IS_PRESENT";
  return @"PET_IS_PRESENT";
}

- (PGGraphPetPresentEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphPetPresentEdge *)[(PGGraphPetPresentEdge *)self initFromPetNode:a4 toMomentNode:a5];
}

- (id)initFromPetNode:(id)a3 toMomentNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphPetPresentEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"PET_IS_PRESENT" domain:304];
  return v2;
}

@end