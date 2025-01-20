@interface SCMLLog
+ (id)handler;
+ (id)imageAnalyzer;
+ (id)signpost;
+ (id)textAnalyzer;
+ (id)videoAnalyzer;
@end

@implementation SCMLLog

+ (id)handler
{
  if (handler_onceToken != -1) {
    dispatch_once(&handler_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)handler__framework;

  return v2;
}

uint64_t __18__SCMLLog_handler__block_invoke()
{
  handler__framework = (uint64_t)os_log_create("com.apple.SensitiveContentAnalysisML", "handler");

  return MEMORY[0x270F9A758]();
}

+ (id)imageAnalyzer
{
  if (imageAnalyzer_onceToken != -1) {
    dispatch_once(&imageAnalyzer_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)imageAnalyzer__framework;

  return v2;
}

uint64_t __24__SCMLLog_imageAnalyzer__block_invoke()
{
  imageAnalyzer__framework = (uint64_t)os_log_create("com.apple.SensitiveContentAnalysisML", "imageAnalyzer");

  return MEMORY[0x270F9A758]();
}

+ (id)textAnalyzer
{
  if (textAnalyzer_onceToken != -1) {
    dispatch_once(&textAnalyzer_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)textAnalyzer__framework;

  return v2;
}

uint64_t __23__SCMLLog_textAnalyzer__block_invoke()
{
  textAnalyzer__framework = (uint64_t)os_log_create("com.apple.SensitiveContentAnalysisML", "textAnalyzer");

  return MEMORY[0x270F9A758]();
}

+ (id)videoAnalyzer
{
  if (videoAnalyzer_onceToken != -1) {
    dispatch_once(&videoAnalyzer_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)videoAnalyzer__framework;

  return v2;
}

uint64_t __24__SCMLLog_videoAnalyzer__block_invoke()
{
  videoAnalyzer__framework = (uint64_t)os_log_create("com.apple.SensitiveContentAnalysisML", "videoAnalyzer");

  return MEMORY[0x270F9A758]();
}

+ (id)signpost
{
  if (signpost_onceToken != -1) {
    dispatch_once(&signpost_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)signpost__framework;

  return v2;
}

uint64_t __19__SCMLLog_signpost__block_invoke()
{
  signpost__framework = (uint64_t)os_log_create("com.apple.SensitiveContentAnalysisML", "signpost");

  return MEMORY[0x270F9A758]();
}

@end