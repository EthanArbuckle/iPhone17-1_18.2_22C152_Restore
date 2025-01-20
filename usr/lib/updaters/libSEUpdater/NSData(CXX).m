@interface NSData(CXX)
+ (uint64_t)dataWithCXXVector:()CXX;
- (void)asCXXVector;
@end

@implementation NSData(CXX)

+ (uint64_t)dataWithCXXVector:()CXX
{
  return [MEMORY[0x263EFF8F8] dataWithBytes:*a3 length:a3[1] - *a3];
}

- (void)asCXXVector
{
  id v3 = a1;
  v4 = (const void *)[v3 bytes];
  id v5 = v3;
  uint64_t v6 = [v5 bytes];
  uint64_t v7 = v6 + [v5 length];
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;

  return std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a2, v4, v7, v7 - (void)v4);
}

@end