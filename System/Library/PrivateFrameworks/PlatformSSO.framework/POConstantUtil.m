@interface POConstantUtil
+ (id)stringForDeviceAction:(int64_t)a3;
+ (id)stringForRegistrationStatus:(int64_t)a3;
+ (id)stringForTokenStatus:(int64_t)a3;
+ (id)stringForUserAction:(int64_t)a3;
@end

@implementation POConstantUtil

+ (id)stringForDeviceAction:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    v3 = 0;
  }
  else {
    v3 = off_264BBEBA0[a3];
  }
  v4 = NSString;
  v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  v6 = [v4 stringWithFormat:@"%@ (%@)", v3, v5];

  return v6;
}

+ (id)stringForUserAction:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    v3 = 0;
  }
  else {
    v3 = off_264BBEBB8[a3];
  }
  v4 = NSString;
  v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  v6 = [v4 stringWithFormat:@"%@ (%@)", v3, v5];

  return v6;
}

+ (id)stringForRegistrationStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    v3 = 0;
  }
  else {
    v3 = off_264BBEBD8[a3];
  }
  v4 = NSString;
  v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  v6 = [v4 stringWithFormat:@"%@ (%@)", v3, v5];

  return v6;
}

+ (id)stringForTokenStatus:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    v3 = 0;
  }
  else {
    v3 = off_264BBEBF8[a3];
  }
  v4 = NSString;
  v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  v6 = [v4 stringWithFormat:@"%@ (%@)", v3, v5];

  return v6;
}

@end