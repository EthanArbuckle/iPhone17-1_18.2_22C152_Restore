@interface CLLocationContextConversions
+ (int)fromCLPipelinedLocationContext:(int64_t)a3;
@end

@implementation CLLocationContextConversions

+ (int)fromCLPipelinedLocationContext:(int64_t)a3
{
  return a3 == 1;
}

@end