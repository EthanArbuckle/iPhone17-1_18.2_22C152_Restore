@interface NSBundle
+ (id)mobileBluetoothBundle;
@end

@implementation NSBundle

+ (id)mobileBluetoothBundle
{
  v2 = (void *)qword_1000CD0F8;
  if (!qword_1000CD0F8)
  {
    id v3 = [objc_alloc((Class)NSBundle) initWithPath:@"/System/Library/PrivateFrameworks/MobileBluetooth.framework/"];
    v4 = (void *)qword_1000CD0F8;
    qword_1000CD0F8 = (uint64_t)v3;

    v2 = (void *)qword_1000CD0F8;
  }

  return v2;
}

@end