@interface NSURLQueryItem(TelephonyUtilities)
+ (__CFString)queryItemValueForHandleType:()TelephonyUtilities;
+ (id)queryItemForHandleType:()TelephonyUtilities;
@end

@implementation NSURLQueryItem(TelephonyUtilities)

+ (id)queryItemForHandleType:()TelephonyUtilities
{
  v1 = (void *)MEMORY[0x1E4F290C8];
  v2 = objc_msgSend(a1, "queryItemValueForHandleType:");
  v3 = [v1 queryItemWithName:@"handleType" value:v2];

  return v3;
}

+ (__CFString)queryItemValueForHandleType:()TelephonyUtilities
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = *(&off_1E58E7550)[a3 - 1];
  }
  return v4;
}

@end