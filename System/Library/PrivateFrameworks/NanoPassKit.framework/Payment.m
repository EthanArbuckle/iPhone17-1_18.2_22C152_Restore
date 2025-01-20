@interface Payment
@end

@implementation Payment

void __pk_Payment_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.passkit", "Payment");
  v1 = (void *)pk_Payment_log___logger;
  pk_Payment_log___logger = (uint64_t)v0;
}

@end