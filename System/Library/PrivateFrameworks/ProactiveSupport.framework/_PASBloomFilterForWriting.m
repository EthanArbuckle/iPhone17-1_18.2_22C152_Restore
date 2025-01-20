@interface _PASBloomFilterForWriting
+ (id)bloomFilterInMemoryWithNumberOfValuesN:(unint64_t)a3 errorRateP:(float)a4;
- (BOOL)saveToFile:(id)a3;
- (void)setWithHashes:(id)a3;
@end

@implementation _PASBloomFilterForWriting

- (BOOL)saveToFile:(id)a3
{
  return [(NSData *)self->super._data writeToFile:a3 atomically:0];
}

- (void)setWithHashes:(id)a3
{
  v5 = self->super._data;
  uint64_t v6 = [a3 hashes];
  char v13 = 0;
  if (self->super._numHashFunctions >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    do
    {
      int v9 = *(_DWORD *)(v7 + 4 * v8);
      if (v9 < 0) {
        int v9 = -v9;
      }
      unsigned int v10 = v9 % self->super._numBits;
      int v11 = 1 << (v10 & 7);
      uint64_t v12 = (v10 >> 3) + 16;
      -[NSData getBytes:range:](v5, "getBytes:range:", &v13, v12, 1);
      v13 |= v11;
      -[NSData replaceBytesInRange:withBytes:length:](v5, "replaceBytesInRange:withBytes:length:", v12, 1, &v13, 1);
      ++v8;
    }
    while (v8 < self->super._numHashFunctions);
  }
}

+ (id)bloomFilterInMemoryWithNumberOfValuesN:(unint64_t)a3 errorRateP:(float)a4
{
  unint64_t v5 = 1000;
  if (a3 > 0x3E8) {
    unint64_t v5 = a3;
  }
  float v6 = 0.00001;
  if (a4 >= 0.00001)
  {
    float v6 = a4;
    if (a4 > 0.99999) {
      float v6 = 0.99999;
    }
  }
  double v7 = (double)v5;
  double v8 = (double)(unint64_t)ceil(log(v6) * (double)v5 / -0.480453014);
  LODWORD(v4) = vcvtad_u64_f64(v8 * 0.693147181 / v7);
  if (v4 <= 0x40
    && (unint64_t v9 = vcvtps_u32_f32((float)(vcvtpd_u64_f64(v8 * 0.125) + 16) * 0.000061035), v9 << 14 <= 0x40000000))
  {
    int v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v9 << 14];
    unsigned int v14 = bswap32(objc_msgSend(v11, "length", 0x1000000173F00B7) - 16);
    unsigned int v15 = bswap32(v4);
    objc_msgSend(v11, "replaceBytesInRange:withBytes:length:", 0, 16, &v13, 16);
    unsigned int v10 = [[_PASBloomFilterForWriting alloc] initWithData:v11 numBits:((v9 << 17) - 128) hashFunctionCode:1 numHashFunctions:v4];
  }
  else
  {
    unsigned int v10 = 0;
  }

  return v10;
}

@end