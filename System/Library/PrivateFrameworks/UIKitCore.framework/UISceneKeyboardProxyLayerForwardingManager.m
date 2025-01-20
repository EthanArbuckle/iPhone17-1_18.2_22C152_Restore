@interface UISceneKeyboardProxyLayerForwardingManager
@end

@implementation UISceneKeyboardProxyLayerForwardingManager

void __61___UISceneKeyboardProxyLayerForwardingManager_sharedInstance__block_invoke()
{
  uint64_t v0 = [objc_alloc((Class)objc_opt_class()) _init];
  v1 = (void *)qword_1EB25F380;
  qword_1EB25F380 = v0;
}

void __71___UISceneKeyboardProxyLayerForwardingManager_isRootSystemShellProcess__block_invoke()
{
  id v0 = +[_UIApplicationConfigurationLoader sharedLoader];
  _MergedGlobals_973 = [v0 usesLocalInitializationContext];
}

@end