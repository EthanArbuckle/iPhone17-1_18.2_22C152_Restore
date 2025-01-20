@interface SUIUtilities
+ (BOOL)isAppIntentsSupportEnabled;
+ (id)visionResourcesQueue;
+ (unint64_t)deviceAuthenticationStateForView:(id)a3;
+ (unint64_t)stateForSearchUIAuthenticationState:(unint64_t)a3;
+ (void)prewarmVisionForImageDerivedColors;
+ (void)releaseVisionCachedResources;
@end

@implementation SUIUtilities

+ (void)prewarmVisionForImageDerivedColors
{
  if (os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_22F3C4000, &_os_log_internal, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "vision_prewarm", (const char *)&unk_22F3D702A, v4, 2u);
  }
  v3 = [a1 visionResourcesQueue];
  dispatch_async(v3, &__block_literal_global_52);
}

void __50__SUIUtilities_prewarmVisionForImageDerivedColors__block_invoke()
{
  v10[1] = *MEMORY[0x263EF8340];
  v0 = objc_opt_new();
  [v0 setRevision:2];
  v1 = [MEMORY[0x263F1F000] globalSession];
  v10[0] = v0;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  id v5 = 0;
  int v3 = [v1 prepareForPerformingRequests:v2 error:&v5];
  id v4 = v5;

  if (os_signpost_enabled(&_os_log_internal))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_22F3C4000, &_os_log_internal, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "vision_prewarm", (const char *)&unk_22F3D702A, buf, 2u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v7 = v3;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_22F3C4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Pre-warmed Vision framework for image-derived colors (success: %d, error: %@)", buf, 0x12u);
  }
}

+ (id)visionResourcesQueue
{
  if (visionResourcesQueue_onceToken != -1) {
    dispatch_once(&visionResourcesQueue_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)visionResourcesQueue_queue;

  return v2;
}

void __36__SUIUtilities_visionResourcesQueue__block_invoke()
{
  int v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  dispatch_queue_t v1 = dispatch_queue_create("spotlight vision prewarm queue", v0);
  v2 = (void *)visionResourcesQueue_queue;
  visionResourcesQueue_queue = (uint64_t)v1;
}

+ (void)releaseVisionCachedResources
{
  v2 = [a1 visionResourcesQueue];
  dispatch_async(v2, &__block_literal_global_56);
}

void __44__SUIUtilities_releaseVisionCachedResources__block_invoke()
{
  v0 = [MEMORY[0x263F1F000] globalSession];
  [v0 releaseCachedResources];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v1 = 0;
    _os_log_impl(&dword_22F3C4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Released Vision framework cached resources for image-derived colors", v1, 2u);
  }
}

+ (BOOL)isAppIntentsSupportEnabled
{
  return MEMORY[0x270ED8070]("SpotlightUI", "AppIntents");
}

+ (unint64_t)stateForSearchUIAuthenticationState:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (unint64_t)deviceAuthenticationStateForView:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F67C78] deviceAuthenticationStateForView:a3];

  return +[SUIUtilities stateForSearchUIAuthenticationState:v3];
}

@end