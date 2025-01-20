@interface NSBundle(VKBundle)
+ (id)__vkBundle;
@end

@implementation NSBundle(VKBundle)

+ (id)__vkBundle
{
  if (+[NSBundle(VKBundle) __vkBundle]::onceToken != -1) {
    dispatch_once(&+[NSBundle(VKBundle) __vkBundle]::onceToken, &__block_literal_global_36226);
  }
  v0 = (void *)+[NSBundle(VKBundle) __vkBundle]::bundle;
  return v0;
}

@end