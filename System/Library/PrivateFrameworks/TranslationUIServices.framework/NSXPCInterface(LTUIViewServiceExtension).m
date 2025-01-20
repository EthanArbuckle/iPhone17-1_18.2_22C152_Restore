@interface NSXPCInterface(LTUIViewServiceExtension)
+ (id)__LTUI_viewServiceExtensionHostInterface;
+ (id)__LTUI_viewServiceExtensionInterface;
@end

@implementation NSXPCInterface(LTUIViewServiceExtension)

+ (id)__LTUI_viewServiceExtensionInterface
{
  if (__LTUI_viewServiceExtensionInterface_onceToken != -1) {
    dispatch_once(&__LTUI_viewServiceExtensionInterface_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)__LTUI_viewServiceExtensionInterface_interface;

  return v0;
}

+ (id)__LTUI_viewServiceExtensionHostInterface
{
  if (__LTUI_viewServiceExtensionHostInterface_onceToken != -1) {
    dispatch_once(&__LTUI_viewServiceExtensionHostInterface_onceToken, &__block_literal_global_45);
  }
  v0 = (void *)__LTUI_viewServiceExtensionHostInterface_interface;

  return v0;
}

@end