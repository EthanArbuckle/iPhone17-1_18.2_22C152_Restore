@interface PGGraphContactSuggestionEdgeCollection
+ (Class)edgeClass;
@end

@implementation PGGraphContactSuggestionEdgeCollection

+ (Class)edgeClass
{
  return (Class)objc_opt_class();
}

@end