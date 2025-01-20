@interface NSString(ULExtensions)
- (void)boostUUID;
@end

@implementation NSString(ULExtensions)

- (void)boostUUID
{
  if (a1)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[a1 UTF8String]);
    CLMicroLocationProtobufHelper::uuidFromStdString((uint64_t)__p, (uint64_t)a2);
    if (v4 < 0) {
      operator delete(__p[0]);
    }
  }
  else
  {
    *a2 = 0;
    a2[16] = 0;
  }
}

@end