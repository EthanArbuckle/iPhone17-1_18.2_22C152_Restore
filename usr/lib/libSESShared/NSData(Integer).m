@interface NSData(Integer)
+ (id)withU16BE:()Integer;
- (uint64_t)s32BE:()Integer;
- (uint64_t)u16BE:()Integer;
- (uint64_t)u16LE:()Integer;
- (uint64_t)u32BE:()Integer;
- (uint64_t)u32LE:()Integer;
- (uint64_t)u64LE:()Integer;
- (uint64_t)u8:()Integer;
- (unint64_t)u64BE:()Integer;
@end

@implementation NSData(Integer)

- (uint64_t)u8:()Integer
{
  return *(unsigned __int8 *)([a1 bytes] + a3);
}

- (uint64_t)u16LE:()Integer
{
  return *(unsigned __int16 *)([a1 bytes] + a3);
}

- (uint64_t)u16BE:()Integer
{
  return bswap32(*(unsigned __int16 *)([a1 bytes] + a3)) >> 16;
}

- (uint64_t)u32LE:()Integer
{
  return *(unsigned int *)([a1 bytes] + a3);
}

- (uint64_t)u32BE:()Integer
{
  return bswap32(*(_DWORD *)([a1 bytes] + a3));
}

- (uint64_t)s32BE:()Integer
{
  return bswap32(*(_DWORD *)([a1 bytes] + a3));
}

- (uint64_t)u64LE:()Integer
{
  return *(void *)([a1 bytes] + a3);
}

- (unint64_t)u64BE:()Integer
{
  return bswap64(*(void *)([a1 bytes] + a3));
}

+ (id)withU16BE:()Integer
{
  id v4 = [MEMORY[0x263EFF990] dataWithLength:2];
  *(_WORD *)[v4 mutableBytes] = __rev16(a3);

  return v4;
}

@end