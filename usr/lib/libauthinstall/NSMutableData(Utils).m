@interface NSMutableData(Utils)
- (uint64_t)appendByte:()Utils;
- (uint64_t)appendLittleInt16:()Utils;
- (uint64_t)appendLittleInt32:()Utils;
@end

@implementation NSMutableData(Utils)

- (uint64_t)appendByte:()Utils
{
  char v4 = a3;
  return [a1 appendBytes:&v4 length:1];
}

- (uint64_t)appendLittleInt16:()Utils
{
  __int16 v4 = a3;
  return [a1 appendBytes:&v4 length:2];
}

- (uint64_t)appendLittleInt32:()Utils
{
  int v4 = a3;
  return [a1 appendBytes:&v4 length:4];
}

@end