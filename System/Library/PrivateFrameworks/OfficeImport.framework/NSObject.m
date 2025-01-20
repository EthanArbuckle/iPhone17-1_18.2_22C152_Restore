@interface NSObject
@end

@implementation NSObject

os_log_t __69__NSObject_TSUAdditions__tsu_addObserver_forKeyPath_options_context___block_invoke()
{
  os_log_t result = TSULogCreateCategory("TSUDefaultCat");
  TSUDefaultCat_log_t = (uint64_t)result;
  return result;
}

@end