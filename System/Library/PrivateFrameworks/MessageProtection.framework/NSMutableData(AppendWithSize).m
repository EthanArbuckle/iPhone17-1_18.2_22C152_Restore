@interface NSMutableData(AppendWithSize)
- (void)appendDataAndSize:()AppendWithSize;
@end

@implementation NSMutableData(AppendWithSize)

- (void)appendDataAndSize:()AppendWithSize
{
  id v4 = a3;
  __int16 v5 = bswap32([v4 length]) >> 16;
  [a1 appendBytes:&v5 length:2];
  [a1 appendData:v4];
}

@end