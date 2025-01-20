@interface NSData(Integer)
- (uint64_t)s24BE:()Integer;
- (uint64_t)s32BE:()Integer;
- (uint64_t)u16BE:()Integer;
- (uint64_t)u24BE:()Integer;
- (uint64_t)u32BE:()Integer;
- (uint64_t)u8:()Integer;
- (unint64_t)u64BE:()Integer;
@end

@implementation NSData(Integer)

- (uint64_t)s32BE:()Integer
{
  return bswap32(*(_DWORD *)([a1 bytes] + a3));
}

- (uint64_t)u16BE:()Integer
{
  return bswap32(*(unsigned __int16 *)([a1 bytes] + a3)) >> 16;
}

- (uint64_t)u8:()Integer
{
  return *(unsigned __int8 *)([a1 bytes] + a3);
}

- (uint64_t)u32BE:()Integer
{
  return bswap32(*(_DWORD *)([a1 bytes] + a3));
}

- (unint64_t)u64BE:()Integer
{
  return bswap64(*(void *)([a1 bytes] + a3));
}

- (uint64_t)s24BE:()Integer
{
  int v5 = [a1 u8:];
  unsigned int v6 = [a1 u16BE:a3 + 1] | (v5 << 16);
  if ((v5 & 0x80u) == 0) {
    return v6;
  }
  else {
    return v6 | 0xFF000000;
  }
}

- (uint64_t)u24BE:()Integer
{
  int v5 = [a1 u8:];
  return [a1 u16BE:a3 + 1] | (v5 << 16);
}

@end