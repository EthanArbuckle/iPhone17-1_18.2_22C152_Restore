@interface SNNLogging
+ (id)framework;
@end

@implementation SNNLogging

+ (id)framework
{
  if (framework_onceToken != -1) {
    dispatch_once(&framework_onceToken, &__block_literal_global);
  }
  v2 = (void *)framework_coreChannel;
  return v2;
}

void __23__SNNLogging_framework__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.neuralnetworks", "backend.milespresso");
  v1 = (void *)framework_coreChannel;
  framework_coreChannel = (uint64_t)v0;

  if (!framework_coreChannel && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __23__SNNLogging_framework__block_invoke_cold_1();
  }
}

void __23__SNNLogging_framework__block_invoke_cold_1()
{
  *(_WORD *)os_log_t v0 = 0;
  _os_log_error_impl(&dword_257455000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Couldn't create os_log_t coreChannel", v0, 2u);
}

@end