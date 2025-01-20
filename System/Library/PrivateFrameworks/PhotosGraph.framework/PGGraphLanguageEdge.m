@interface PGGraphLanguageEdge
+ (id)filter;
- (PGGraphLanguageEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)initFromLocationNode:(id)a3 toLanguageNode:(id)a4;
- (id)label;
- (unsigned)domain;
@end

@implementation PGGraphLanguageEdge

- (unsigned)domain
{
  return 205;
}

- (id)label
{
  v2 = @"POPULAR_LANGUAGE";
  return @"POPULAR_LANGUAGE";
}

- (PGGraphLanguageEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  return (PGGraphLanguageEdge *)[(PGGraphLanguageEdge *)self initFromLocationNode:a4 toLanguageNode:a5];
}

- (id)initFromLocationNode:(id)a3 toLanguageNode:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PGGraphLanguageEdge;
  return [(PGGraphEdge *)&v5 initWithSourceNode:a3 targetNode:a4];
}

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"POPULAR_LANGUAGE" domain:205];
  return v2;
}

@end