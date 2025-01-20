@interface _MLLog
+ (id)clientFramework;
+ (id)common;
+ (id)daemon;
+ (id)serverFramework;
+ (id)tool;
@end

@implementation _MLLog

+ (id)common
{
  if (common_onceToken != -1) {
    dispatch_once(&common_onceToken, &__block_literal_global);
  }
  v2 = (void *)common__common;
  return v2;
}

+ (id)clientFramework
{
  if (clientFramework_onceToken != -1) {
    dispatch_once(&clientFramework_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)clientFramework__framework;
  return v2;
}

+ (id)daemon
{
  if (daemon_onceToken != -1) {
    dispatch_once(&daemon_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)daemon__daemon;
  return v2;
}

+ (id)serverFramework
{
  if (serverFramework_onceToken != -1) {
    dispatch_once(&serverFramework_onceToken, &__block_literal_global_9);
  }
  v2 = (void *)serverFramework__framework;
  return v2;
}

+ (id)tool
{
  if (tool_onceToken != -1) {
    dispatch_once(&tool_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)tool__tool;
  return v2;
}

@end