@interface NSMutableData(Append)
- (uint64_t)appendU16BE:()Append;
- (uint64_t)appendU16LE:()Append;
- (uint64_t)appendU32BE:()Append;
- (uint64_t)appendU32LE:()Append;
- (uint64_t)appendU64BE:()Append;
- (uint64_t)appendU64LE:()Append;
- (uint64_t)appendU8:()Append;
@end

@implementation NSMutableData(Append)

- (uint64_t)appendU8:()Append
{
  char v4 = a3;
  return [a1 appendBytes:&v4 length:1];
}

- (uint64_t)appendU16BE:()Append
{
  __int16 v4 = __rev16(a3);
  return [a1 appendBytes:&v4 length:2];
}

- (uint64_t)appendU16LE:()Append
{
  __int16 v4 = a3;
  return [a1 appendBytes:&v4 length:2];
}

- (uint64_t)appendU32BE:()Append
{
  unsigned int v4 = bswap32(a3);
  return [a1 appendBytes:&v4 length:4];
}

- (uint64_t)appendU32LE:()Append
{
  int v4 = a3;
  return [a1 appendBytes:&v4 length:4];
}

- (uint64_t)appendU64BE:()Append
{
  unint64_t v4 = bswap64(a3);
  return [a1 appendBytes:&v4 length:8];
}

- (uint64_t)appendU64LE:()Append
{
  uint64_t v4 = a3;
  return [a1 appendBytes:&v4 length:8];
}

@end