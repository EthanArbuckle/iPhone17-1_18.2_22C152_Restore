@interface NSNumber
+ (id)objectType;
+ (id)objectTypeKey;
- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4;
- (NSNumber)initWithFMDCoder:(id)a3 error:(id *)a4;
@end

@implementation NSNumber

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = +[NSNumber objectType];
  [v5 encodeNumber:self forKey:v6];

  return 1;
}

- (NSNumber)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[NSNumber objectType];
  v8 = [v6 decodeNumberForKey:v7];

  if (v8)
  {
    self = -[NSNumber initWithInt:](self, "initWithInt:", [v8 intValue]);
    if (self) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }
    a4 = v9;
  }
  else if (a4)
  {
    NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v13 = @"Key \"FM.number\" not found.";
    v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    *a4 = +[NSError errorWithDomain:@"FMNumberErrorDomain" code:0 userInfo:v10];

    a4 = 0;
  }

  return (NSNumber *)a4;
}

+ (id)objectType
{
  return @"FM.number";
}

+ (id)objectTypeKey
{
  return @"numberType";
}

@end