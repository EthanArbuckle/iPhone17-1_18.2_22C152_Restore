@interface ECPackedDataUtils
+ (BOOL)setData:(char *)a3 ofLength:(unsigned int)a4 atIndex:(unsigned int)a5 withPreviousLength:(unsigned int)a6 inPackedData:(__CFData *)a7 packedDataSize:(unsigned int)a8;
+ (char)prepareForDataOfLength:(unsigned int)a3 atIndex:(unsigned int)a4 withPreviousLength:(unsigned int)a5 inPackedData:(__CFData *)a6 packedDataSize:(unsigned int)a7;
+ (id)dumpDataToHexadecimalString:(char *)a3 start:(unsigned int)a4 stop:(unsigned int)a5 nicelyFormatted:(BOOL)a6;
+ (id)readStringFromData:(char *)a3 atOffset:(unsigned int)a4 withLength:(unsigned int)a5;
+ (void)writeString:(id)a3 toPackedData:(__CFData *)a4 packedDataSize:(unsigned int)a5 atIndex:(unsigned int)a6 withPreviousLength:(unsigned __int16)a7 outLength:(unsigned __int16 *)a8;
@end

@implementation ECPackedDataUtils

+ (void)writeString:(id)a3 toPackedData:(__CFData *)a4 packedDataSize:(unsigned int)a5 atIndex:(unsigned int)a6 withPreviousLength:(unsigned __int16)a7 outLength:(unsigned __int16 *)a8
{
  id v12 = a3;
  uint64_t v10 = [v12 length];
  if ((unint64_t)(2 * v10) < 0x10000)
  {
    if (a8) {
      *a8 = 2 * v10;
    }
    objc_msgSend(v12, "getCharacters:range:", objc_msgSend(a1, "prepareForDataOfLength:atIndex:withPreviousLength:inPackedData:packedDataSize:"), 0, v10);
    v11 = v12;
  }
  else
  {
    *a8 = 0;
    v11 = v12;
  }
}

+ (char)prepareForDataOfLength:(unsigned int)a3 atIndex:(unsigned int)a4 withPreviousLength:(unsigned int)a5 inPackedData:(__CFData *)a6 packedDataSize:(unsigned int)a7
{
  v7 = a6;
  if (a6)
  {
    if (a3 > a5) {
      CFDataIncreaseLength(a6, a3 - a5);
    }
    MutableBytePtr = CFDataGetMutableBytePtr(v7);
    if (MutableBytePtr)
    {
      v7 = (__CFData *)&MutableBytePtr[a4];
      if (a3 != a5) {
        memmove((char *)v7 + a3, (char *)v7 + a5, a7 - (a5 + a4));
      }
    }
    else
    {
      return 0;
    }
  }
  return (char *)v7;
}

+ (id)readStringFromData:(char *)a3 atOffset:(unsigned int)a4 withLength:(unsigned int)a5
{
  if (a5)
  {
    v6 = [NSString stringWithCharacters:&a3[a4] length:a5 >> 1];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (BOOL)setData:(char *)a3 ofLength:(unsigned int)a4 atIndex:(unsigned int)a5 withPreviousLength:(unsigned int)a6 inPackedData:(__CFData *)a7 packedDataSize:(unsigned int)a8
{
  return 1;
}

+ (id)dumpDataToHexadecimalString:(char *)a3 start:(unsigned int)a4 stop:(unsigned int)a5 nicelyFormatted:(BOOL)a6
{
  if (a5 == a4)
  {
    v6 = &stru_26EBF24D8;
  }
  else
  {
    BOOL v7 = a6;
    v6 = [MEMORY[0x263F089D8] string];
    if (a5 > a4)
    {
      uint64_t v11 = 0;
      id v12 = &a3[a4];
      do
      {
        if ((unint64_t)a4 + v11 > a4 && v7 && (v11 & 3) == 0) {
          [(__CFString *)v6 appendString:@" "];
        }
        [(__CFString *)v6 appendFormat:@"%02X", v12[v11++]];
      }
      while (a4 - a5 + v11);
    }
    if (v7) {
      [(__CFString *)v6 appendFormat:@" (%i bytes)", a5 - a4];
    }
  }
  return v6;
}

@end