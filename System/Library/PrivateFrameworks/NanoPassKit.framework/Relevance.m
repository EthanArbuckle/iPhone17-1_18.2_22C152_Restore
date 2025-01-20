@interface Relevance
@end

@implementation Relevance

void __pk_Relevance_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.passkit", "Relevance");
  v1 = (void *)pk_Relevance_log___logger;
  pk_Relevance_log___logger = (uint64_t)v0;
}

@end