@interface PGGraphPersonPresentEdge
+ (id)filter;
- (PGGraphPersonPresentEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7;
- (id)label;
@end

@implementation PGGraphPersonPresentEdge

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:@"PRESENT" domain:300];
  return v2;
}

- (id)label
{
  v2 = @"PRESENT";
  return @"PRESENT";
}

- (PGGraphPersonPresentEdge)initWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 domain:(unsigned __int16)a6 properties:(id)a7
{
  id v10 = a7;
  id v11 = a5;
  id v12 = a4;
  v13 = [v10 objectForKeyedSubscript:@"importance"];
  [v13 doubleValue];
  double v15 = v14;

  v16 = [v10 objectForKeyedSubscript:@"numberOfAssets"];

  uint64_t v17 = [v16 unsignedIntegerValue];
  v18 = [(PGGraphBasePresentEdge *)self initFromPersonNode:v12 toMomentNode:v11 importance:v17 numberOfAssets:v15];

  return v18;
}

@end