@interface NSBundle
+ (id)mobileBluetoothBundle;
@end

@implementation NSBundle

+ (id)mobileBluetoothBundle
{
  v2 = (void *)qword_10000D080;
  if (!qword_10000D080)
  {
    id v3 = [objc_alloc((Class)NSBundle) initWithPath:@"/System/Library/PrivateFrameworks/MobileBluetooth.framework/"];
    v4 = (void *)qword_10000D080;
    qword_10000D080 = (uint64_t)v3;

    v2 = (void *)qword_10000D080;
  }

  return v2;
}

@end