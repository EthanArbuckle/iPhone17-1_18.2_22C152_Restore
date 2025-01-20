@interface QLThumbnailAdditionIndex(CacheDelete)
@end

@implementation QLThumbnailAdditionIndex(CacheDelete)

- (void)purgeableSpaceOnMountPoint:()CacheDelete withUrgency:beforeDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "#CacheDelete Could not open database", v1, 2u);
}

@end