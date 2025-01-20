@interface UIKeyWindowSceneObserverUsesHIDPolicyObserver
@end

@implementation UIKeyWindowSceneObserverUsesHIDPolicyObserver

uint64_t ___UIKeyWindowSceneObserverUsesHIDPolicyObserver_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  _MergedGlobals_1192 = result;
  return result;
}

@end