@interface _QLCacheThread(CacheDelete)
@end

@implementation _QLCacheThread(CacheDelete)

- (void)purgeableSpaceOnMountPoint:()CacheDelete withUrgency:beforeDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "#CacheDelete Could not read in disk cache to determine purgeable space.", v1, 2u);
}

- (void)purgeOnMountPoint:()CacheDelete withUrgency:beforeDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "#CacheDelete Could not write into disk cache to delete thumbnails.", v1, 2u);
}

@end