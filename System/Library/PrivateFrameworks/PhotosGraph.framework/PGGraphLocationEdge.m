@interface PGGraphLocationEdge
+ (id)filter;
- (MAEdgeFilter)uniquelyIdentifyingFilter;
@end

@implementation PGGraphLocationEdge

+ (id)filter
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F71EB0]) initWithLabel:0 domain:200];
  return v2;
}

- (MAEdgeFilter)uniquelyIdentifyingFilter
{
  v2 = objc_opt_class();
  return (MAEdgeFilter *)[v2 filter];
}

@end