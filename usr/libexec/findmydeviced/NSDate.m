@interface NSDate
+ (id)objectType;
+ (id)objectTypeKey;
- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4;
- (NSDate)initWithFMDCoder:(id)a3 error:(id *)a4;
- (id)stringValueForServer;
@end

@implementation NSDate

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [(NSDate *)self fm_epochObject];
  v7 = +[NSDate objectType];
  [v5 encodeNumber:v6 forKey:v7];

  return 1;
}

- (NSDate)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[NSDate objectType];
  v8 = [v6 decodeNumberForKey:v7];

  if (!v8)
  {
    if (!a4) {
      goto LABEL_7;
    }
    NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v12 = @"Key \"FM.date\" not found.";
    v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    *a4 = +[NSError errorWithDomain:@"FMDateErrorDomain" code:0 userInfo:v9];

LABEL_6:
    a4 = 0;
    goto LABEL_7;
  }
  self = -[NSDate initWithTimeIntervalSince1970:](self, "initWithTimeIntervalSince1970:", (double)(uint64_t)[v8 longLongValue]);
  if (!self) {
    goto LABEL_6;
  }
  +[NSDate fm_dateFromEpoch:](NSDate, "fm_dateFromEpoch:", [v8 longLongValue]);
  a4 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return (NSDate *)a4;
}

+ (id)objectType
{
  return @"FM.date";
}

+ (id)objectTypeKey
{
  return @"dateType";
}

- (id)stringValueForServer
{
  v3 = CFDateFormatterCreate(kCFAllocatorDefault, 0, kCFDateFormatterNoStyle, kCFDateFormatterNoStyle);
  CFTimeZoneRef v4 = CFTimeZoneCreateWithTimeIntervalFromGMT(kCFAllocatorDefault, 0.0);
  CFDateFormatterSetProperty(v3, kCFDateFormatterTimeZone, v4);
  CFDateFormatterSetFormat(v3, @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
  if (v4) {
    CFRelease(v4);
  }
  StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(kCFAllocatorDefault, v3, (CFDateRef)self);
  if (v3) {
    CFRelease(v3);
  }

  return StringWithDate;
}

@end