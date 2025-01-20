@interface UIActivityIndicatorView(Private)
+ (id)smu_activityIndicatorViewForStyleWithLoadingMessage;
@end

@implementation UIActivityIndicatorView(Private)

+ (id)smu_activityIndicatorViewForStyleWithLoadingMessage
{
  v0 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:22];

  return v0;
}

@end