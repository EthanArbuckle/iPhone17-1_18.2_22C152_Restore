@interface NSString
+ (NSString)stringWithFourCC:(unsigned int)a3;
+ (id)objectType;
+ (id)objectTypeKey;
+ (id)sanitizedHexString:(id)a3;
- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4;
- (NSString)fmd_localizedString;
- (NSString)initWithFMDCoder:(id)a3 error:(id *)a4;
- (id)fmd_localizedStringInTable:(id)a3;
@end

@implementation NSString

+ (NSString)stringWithFourCC:(unsigned int)a3
{
  __int16 v6 = bswap32(a3) >> 16;
  v5[1] = BYTE2(a3);
  v5[0] = HIBYTE(a3);
  char v7 = 0;
  v3 = +[NSString stringWithCString:v5 encoding:4];

  return (NSString *)v3;
}

+ (id)sanitizedHexString:(id)a3
{
  id v3 = a3;
  v4 = +[NSCharacterSet characterSetWithCharactersInString:@"01234567890ABCDEFabcdef"];
  v5 = [v4 invertedSet];

  __int16 v6 = [v3 componentsSeparatedByCharactersInSet:v5];

  char v7 = [v6 componentsJoinedByString:&stru_1002E7428];

  return v7;
}

- (NSString)fmd_localizedString
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 localizedStringForKey:self value:&stru_1002E7428 table:0];
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (id)fmd_localizedStringInTable:(id)a3
{
  id v4 = a3;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  __int16 v6 = v5;
  if (v5)
  {
    char v7 = [v5 localizedStringForKey:self value:&stru_1002E7428 table:v4];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5 = a3;
  __int16 v6 = +[NSString objectType];
  [v5 encodeString:self forKey:v6];

  return 1;
}

- (NSString)initWithFMDCoder:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = +[NSString objectType];
  v8 = [v6 decodeStringForKey:v7];

  if (v8)
  {
    self = [(NSString *)self initWithString:v8];
    a4 = self;
  }
  else if (a4)
  {
    NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v12 = @"Key \"FM.String\" not found.";
    v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    *a4 = +[NSError errorWithDomain:@"FMStringErrorDomain" code:0 userInfo:v9];

    a4 = 0;
  }

  return a4;
}

+ (id)objectType
{
  return @"FM.string";
}

+ (id)objectTypeKey
{
  return @"stringType";
}

@end