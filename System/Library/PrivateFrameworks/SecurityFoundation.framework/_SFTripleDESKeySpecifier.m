@interface _SFTripleDESKeySpecifier
+ (Class)keyClass;
- (int64_t)keyLengthInBytes;
@end

@implementation _SFTripleDESKeySpecifier

+ (Class)keyClass
{
  return (Class)objc_opt_class();
}

- (int64_t)keyLengthInBytes
{
  return 21;
}

- (void).cxx_destruct
{
}

@end