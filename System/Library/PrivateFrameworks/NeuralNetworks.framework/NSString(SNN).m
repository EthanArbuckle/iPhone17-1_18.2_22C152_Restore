@interface NSString(SNN)
- (uint64_t)initWithCXXString:()SNN;
- (uint64_t)initWithCXXStringNoCopy:()SNN;
- (void)cxxString;
- (void)initWithOwnedCXXStringNoCopy:()SNN;
@end

@implementation NSString(SNN)

- (uint64_t)initWithCXXString:()SNN
{
  if (*((char *)a3 + 23) < 0) {
    a3 = (uint64_t *)*a3;
  }
  return [a1 initWithCString:a3 encoding:4];
}

- (uint64_t)initWithCXXStringNoCopy:()SNN
{
  uint64_t v3 = a3[1];
  if (*((char *)a3 + 23) >= 0)
  {
    uint64_t v4 = *((unsigned __int8 *)a3 + 23);
  }
  else
  {
    a3 = (uint64_t *)*a3;
    uint64_t v4 = v3;
  }
  return [a1 initWithBytesNoCopy:a3 length:v4 encoding:4 freeWhenDone:0];
}

- (void)initWithOwnedCXXStringNoCopy:()SNN
{
  v0[0] = 0;
  v0[1] = v0;
  v0[2] = 0x3812000000;
  v0[3] = __Block_byref_object_copy_;
  v0[4] = __Block_byref_object_dispose_;
  v0[5] = 0;
  operator new();
}

- (void)cxxString
{
  uint64_t v3 = (char *)[a1 UTF8String];
  return std::string::basic_string[abi:ne180100]<0>(a2, v3);
}

@end