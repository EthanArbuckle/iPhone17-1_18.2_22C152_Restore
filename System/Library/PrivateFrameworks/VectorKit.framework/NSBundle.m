@interface NSBundle
@end

@implementation NSBundle

void __32__NSBundle_VKBundle____vkBundle__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = (void *)+[NSBundle(VKBundle) __vkBundle]::bundle;
  +[NSBundle(VKBundle) __vkBundle]::bundle = v0;
}

@end