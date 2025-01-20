@interface ASLogCategoryDefaultLogger
@end

@implementation ASLogCategoryDefaultLogger

void __ASLogCategoryDefaultLogger_block_invoke(id a1)
{
  os_log_t v1 = os_log_create("com.apple.podcasts", "PodcastsUI");
  v2 = (void *)ASLogCategoryDefaultLogger_logger;
  ASLogCategoryDefaultLogger_logger = (uint64_t)v1;
}

@end