@interface NSNotificationCenter(SBLeafIconDataSource)
+ (id)sbh_leafIconDataSourceNotificationCenter;
@end

@implementation NSNotificationCenter(SBLeafIconDataSource)

+ (id)sbh_leafIconDataSourceNotificationCenter
{
  if (sbh_leafIconDataSourceNotificationCenter_onceToken != -1) {
    dispatch_once(&sbh_leafIconDataSourceNotificationCenter_onceToken, &__block_literal_global_280);
  }
  v0 = (void *)sbh_leafIconDataSourceNotificationCenter_sbh_leafIconDataSourceNotificationCenter;
  return v0;
}

@end