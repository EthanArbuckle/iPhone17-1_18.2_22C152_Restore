@interface NSUUID(CppConvenience)
+ (id)CR_UUIDFromStdString:()CppConvenience;
- (void)CR_toStdString;
@end

@implementation NSUUID(CppConvenience)

+ (id)CR_UUIDFromStdString:()CppConvenience
{
  id v4 = objc_alloc(MEMORY[0x1E4F29128]);
  if (*((char *)a3 + 23) >= 0) {
    v5 = a3;
  }
  else {
    v5 = (uint64_t *)*a3;
  }
  v6 = [NSString stringWithUTF8String:v5];
  v7 = (void *)[v4 initWithUUIDString:v6];

  return v7;
}

- (void)CR_toStdString
{
  id v3 = [a1 UUIDString];
  std::string::basic_string[abi:ne180100]<0>(a2, (char *)[v3 UTF8String]);
}

@end