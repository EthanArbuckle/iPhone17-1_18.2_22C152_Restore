@interface MSHistoryItem
+ (Class)mutableObjectClass;
+ (id)mutableObjectProtocol;
- (BOOL)isFailed;
- (BOOL)tracksRAPReportingOnly;
@end

@implementation MSHistoryItem

+ (Class)mutableObjectClass
{
  return (Class)objc_opt_class();
}

+ (id)mutableObjectProtocol
{
  return 0;
}

- (BOOL)isFailed
{
  return 0;
}

- (BOOL)tracksRAPReportingOnly
{
  return 0;
}

@end