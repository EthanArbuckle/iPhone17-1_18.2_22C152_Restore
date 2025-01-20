@interface NSMutableData(Append)
- (uint64_t)appendByte:()Append;
- (void)appendShortBE:()Append;
@end

@implementation NSMutableData(Append)

- (uint64_t)appendByte:()Append
{
  char v4 = a3;
  return [a1 appendBytes:&v4 length:1];
}

- (void)appendShortBE:()Append
{
  [MEMORY[0x1E4F1C9B8] dataWithShortBE:];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 appendData:v2];
}

@end