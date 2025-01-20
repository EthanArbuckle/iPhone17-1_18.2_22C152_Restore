@interface NSURL(ICSWriter)
- (void)_ICSStringWithOptions:()ICSWriter appendingToString:;
@end

@implementation NSURL(ICSWriter)

- (void)_ICSStringWithOptions:()ICSWriter appendingToString:
{
  id v6 = a4;
  id v7 = [a1 absoluteString];
  iCalendarAppendStringToStringWithOptions(v7, v6, a3);
}

@end