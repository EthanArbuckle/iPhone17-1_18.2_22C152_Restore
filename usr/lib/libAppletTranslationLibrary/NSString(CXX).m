@interface NSString(CXX)
+ (uint64_t)stringWithCXXString:()CXX;
- (void)asCXXString;
@end

@implementation NSString(CXX)

+ (uint64_t)stringWithCXXString:()CXX
{
  if (*((char *)a3 + 23) < 0) {
    a3 = (uint64_t *)*a3;
  }
  return [NSString stringWithCString:a3 encoding:1];
}

- (void)asCXXString
{
  v3 = (char *)[a1 UTF8String];

  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

@end