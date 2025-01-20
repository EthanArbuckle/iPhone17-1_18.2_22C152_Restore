@interface SXJSONLinearGradient
+ (id)valueClassBlockForPropertyWithName:(id)a3;
@end

@implementation SXJSONLinearGradient

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  if ([a3 isEqualToString:@"colorStops"]) {
    return &__block_literal_global_85;
  }
  else {
    return 0;
  }
}

uint64_t __59__SXJSONLinearGradient_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

@end