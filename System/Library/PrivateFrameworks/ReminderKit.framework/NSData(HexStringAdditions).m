@interface NSData(HexStringAdditions)
+ (id)rem_dataWithHexString:()HexStringAdditions;
@end

@implementation NSData(HexStringAdditions)

+ (id)rem_dataWithHexString:()HexStringAdditions
{
  id v3 = a3;
  unsigned int v4 = [v3 length];
  id v5 = [MEMORY[0x1E4F1CA58] dataWithLength:(v4 + 1) >> 1];
  uint64_t v6 = [v5 mutableBytes];
  uint64_t v7 = v4;
  if (v4)
  {
    uint64_t v8 = v6;
    uint64_t v9 = 0;
    char v10 = 0;
    char v11 = 0;
    unsigned int v12 = 0;
    do
    {
      int v13 = [v3 characterAtIndex:v9];
      __int16 v14 = v13 - 48;
      if (v13 - 48) <= 0x36 && ((0x7E0000007E03FFuLL >> v14))
      {
        ++v11;
        char v10 = v13 + word_1B9BF2078[v14] + 16 * v10;
        if ((v11 & 1) == 0)
        {
          *(unsigned char *)(v8 + v12++) = v10;
          char v10 = 0;
        }
      }
      ++v9;
    }
    while (v7 != v9);
    if (v11) {
      *(unsigned char *)(v8 + v12++) = v10;
    }
  }
  else
  {
    unsigned int v12 = 0;
  }
  [v5 setLength:v12];

  return v5;
}

@end