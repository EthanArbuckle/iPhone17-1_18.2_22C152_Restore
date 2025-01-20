@interface NSDate(WatchListKit)
+ (id)wlk_dateWithMillisecondsSince1970:()WatchListKit;
@end

@implementation NSDate(WatchListKit)

+ (id)wlk_dateWithMillisecondsSince1970:()WatchListKit
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    v5 = objc_msgSend([a1 alloc], "initWithTimeIntervalSince1970:", (double)objc_msgSend(v4, "longLongValue") / 1000.0);
  }
  else {
    v5 = 0;
  }

  return v5;
}

@end