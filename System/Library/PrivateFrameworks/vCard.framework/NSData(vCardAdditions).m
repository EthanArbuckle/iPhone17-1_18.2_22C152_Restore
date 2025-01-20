@interface NSData(vCardAdditions)
+ (unint64_t)_cn_maxDataLengthFittingInBase64EncodingLength:()vCardAdditions;
- (id)_cn_encodeVCardBase64DataWithInitialLength:()vCardAdditions;
@end

@implementation NSData(vCardAdditions)

+ (unint64_t)_cn_maxDataLengthFittingInBase64EncodingLength:()vCardAdditions
{
  return (unint64_t)((double)(3 * (-3 * ((a3 & 0xFFFFFFFFFFFFFFFCLL) / 0x4B) + (a3 & 0xFFFFFFFFFFFFFFFCLL)))
                          * 0.25);
}

- (id)_cn_encodeVCardBase64DataWithInitialLength:()vCardAdditions
{
  NSUInteger v5 = 4 * [a1 length] / 3uLL;
  v6 = NSZoneMalloc(0, 0x18uLL);
  if (v5 <= 1) {
    NSUInteger v5 = 1;
  }
  v7 = NSZoneMalloc(0, v5);
  v6[1] = 0;
  v6[2] = v5;
  void *v6 = v7;
  id v8 = a1;
  v9 = (unsigned char *)[v8 bytes];
  uint64_t v10 = [v8 length];
  if (v10 < 1) {
    goto LABEL_18;
  }
  unint64_t v11 = v10;
  unint64_t v12 = 0;
  uint64_t v13 = v10;
  do
  {
    unint64_t v14 = v12 % 3;
    if (v12 % 3 == 2)
    {
      a3 = appendToBufferWithLineFolding((uint64_t)v6, Encode64Table[((unint64_t)(*v9 | (*(v9 - 1) << 8)) >> 6) & 0x3F], a3);
      unint64_t v15 = *v9 & 0x3F;
    }
    else if (v14 == 1)
    {
      unint64_t v15 = ((unint64_t)(*v9 | (*(v9 - 1) << 8)) >> 4) & 0x3F;
    }
    else
    {
      if (v14) {
        goto LABEL_12;
      }
      unint64_t v15 = (unint64_t)*v9 >> 2;
    }
    a3 = appendToBufferWithLineFolding((uint64_t)v6, Encode64Table[v15], a3);
LABEL_12:
    ++v12;
    ++v9;
    --v13;
  }
  while (v13);
  if (v11 % 3 == 2)
  {
    char v18 = Encode64Table[4 * (*(v9 - 1) & 0xF)];
    uint64_t v17 = (uint64_t)v6;
    uint64_t v16 = a3;
LABEL_17:
    uint64_t v19 = appendToBufferWithLineFolding(v17, v18, v16);
    appendToBufferWithLineFolding((uint64_t)v6, 61, v19);
  }
  else if (v11 % 3 == 1)
  {
    uint64_t v16 = appendToBufferWithLineFolding((uint64_t)v6, Encode64Table[16 * (*(v9 - 1) & 3)], a3);
    uint64_t v17 = (uint64_t)v6;
    char v18 = 61;
    goto LABEL_17;
  }
LABEL_18:
  v20 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*v6 length:v6[1]];
  NSZoneFree(0, v6);
  return v20;
}

@end