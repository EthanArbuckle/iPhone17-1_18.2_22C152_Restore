@interface NSData(WLMessage)
- (id)wl_subdataWithRangeExcludingTrailingCrnl:()WLMessage;
@end

@implementation NSData(WLMessage)

- (id)wl_subdataWithRangeExcludingTrailingCrnl:()WLMessage
{
  if (wl_subdataWithRangeExcludingTrailingCrnl__onceToken != -1) {
    dispatch_once(&wl_subdataWithRangeExcludingTrailingCrnl__onceToken, &__block_literal_global_407);
  }
  unint64_t v7 = a4 - 2;
  if (a4 >= 2)
  {
    v8 = objc_msgSend(a1, "subdataWithRange:", v7 + a3, 2);
    if ([v8 isEqualToData:wl_subdataWithRangeExcludingTrailingCrnl__crlfData])
    {
      v11 = [NSNumber numberWithUnsignedInteger:v7];
      _WLLog();

      a4 -= 2;
    }
  }
  if (a4)
  {
    v9 = objc_msgSend(a1, "subdataWithRange:", a3, a4);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end