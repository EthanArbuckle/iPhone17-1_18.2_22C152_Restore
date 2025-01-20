@interface UISplitViewController(Bridge)
- (uint64_t)ts_isCollapsing;
- (uint64_t)ts_setGutterWidth:()Bridge;
- (void)ts_setPrimaryBackgroundStyle:()Bridge;
@end

@implementation UISplitViewController(Bridge)

- (uint64_t)ts_setGutterWidth:()Bridge
{
  *(float *)&a3 = a3;
  return [a1 setGutterWidth:a3];
}

- (uint64_t)ts_isCollapsing
{
  uint64_t result = [a1 _isCollapsed];
  if (result) {
    return [a1 isCollapsed] ^ 1;
  }
  return result;
}

- (void)ts_setPrimaryBackgroundStyle:()Bridge
{
  v3 = result;
  if (a3 != 1)
  {
    if (a3) {
      return result;
    }
    objc_msgSend(result, "setPrimaryBackgroundStyle:");
  }
  return (void *)[v3 setPrimaryBackgroundStyle:1];
}

@end