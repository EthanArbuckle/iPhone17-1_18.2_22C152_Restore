@interface NSURL
+ (id)objectType;
+ (id)objectTypeKey;
- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4;
- (NSURL)initWithFMDCoder:(id)a3 error:(id *)p_isa;
- (id)URLByReplacingHost:(id)a3;
@end

@implementation NSURL

- (id)URLByReplacingHost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSURL *)self host];
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    v8 = [(NSURL *)self absoluteString];
    id v10 = [v8 rangeOfString:v6];
    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      v11 = [v8 stringByReplacingCharactersInRange:v10 withString:v9];
      v7 = +[NSURL URLWithString:v11];
    }
  }

  return v7;
}

- (BOOL)encodeWithFMDCoder:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [(NSURL *)self absoluteString];
  v7 = +[NSURL objectType];
  [v5 encodeString:v6 forKey:v7];

  return 1;
}

- (NSURL)initWithFMDCoder:(id)a3 error:(id *)p_isa
{
  id v6 = a3;
  v7 = +[NSURL objectType];
  v8 = [v6 decodeStringForKey:v7];

  if (v8)
  {
    self = [(NSURL *)self initWithString:v8];
    p_isa = (id *)&self->super.isa;
  }
  else if (p_isa)
  {
    NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v12 = @"Key \"FM.url\" not found.";
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    *p_isa = +[NSError errorWithDomain:@"FMURLErrorDomain" code:0 userInfo:v9];

    p_isa = 0;
  }

  return (NSURL *)p_isa;
}

+ (id)objectType
{
  return @"FM.url";
}

+ (id)objectTypeKey
{
  return @"urlType";
}

@end