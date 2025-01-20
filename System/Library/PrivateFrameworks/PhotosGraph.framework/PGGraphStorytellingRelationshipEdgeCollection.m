@interface PGGraphStorytellingRelationshipEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphStorytellingRelationshipEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end