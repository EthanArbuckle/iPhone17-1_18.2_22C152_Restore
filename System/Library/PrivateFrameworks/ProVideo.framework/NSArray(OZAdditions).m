@interface NSArray(OZAdditions)
+ (uint64_t)oz_arrayWithSIMDFloat3x3:()OZAdditions;
+ (uint64_t)oz_arrayWithSIMDFloat4x4:()OZAdditions;
- (__n128)oz_SIMDFloat4x4;
- (double)oz_SIMDFloat3x3;
@end

@implementation NSArray(OZAdditions)

+ (uint64_t)oz_arrayWithSIMDFloat3x3:()OZAdditions
{
  v10[9] = *MEMORY[0x1E4F143B8];
  v10[0] = objc_msgSend(NSNumber, "numberWithFloat:");
  v10[1] = [NSNumber numberWithFloat:a2.n128_f64[0]];
  v10[2] = [NSNumber numberWithFloat:a3.n128_f64[0]];
  HIDWORD(v3) = a1.n128_u32[1];
  LODWORD(v3) = a1.n128_u32[1];
  v10[3] = [NSNumber numberWithFloat:v3];
  HIDWORD(v4) = a2.n128_u32[1];
  LODWORD(v4) = a2.n128_u32[1];
  v10[4] = [NSNumber numberWithFloat:v4];
  HIDWORD(v5) = a3.n128_u32[1];
  LODWORD(v5) = a3.n128_u32[1];
  v10[5] = [NSNumber numberWithFloat:v5];
  v10[6] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v10[7] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v10[8] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  return [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:9];
}

+ (uint64_t)oz_arrayWithSIMDFloat4x4:()OZAdditions
{
  v13[16] = *MEMORY[0x1E4F143B8];
  v13[0] = objc_msgSend(NSNumber, "numberWithFloat:");
  v13[1] = [NSNumber numberWithFloat:a2.n128_f64[0]];
  v13[2] = [NSNumber numberWithFloat:a3.n128_f64[0]];
  v13[3] = [NSNumber numberWithFloat:a4.n128_f64[0]];
  HIDWORD(v4) = a1.n128_u32[1];
  LODWORD(v4) = a1.n128_u32[1];
  v13[4] = [NSNumber numberWithFloat:v4];
  HIDWORD(v5) = a2.n128_u32[1];
  LODWORD(v5) = a2.n128_u32[1];
  v13[5] = [NSNumber numberWithFloat:v5];
  HIDWORD(v6) = a3.n128_u32[1];
  LODWORD(v6) = a3.n128_u32[1];
  v13[6] = [NSNumber numberWithFloat:v6];
  HIDWORD(v7) = a4.n128_u32[1];
  LODWORD(v7) = a4.n128_u32[1];
  v13[7] = [NSNumber numberWithFloat:v7];
  v13[8] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2])));
  v13[9] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  v13[10] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  v13[11] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  v13[12] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[3])));
  v13[13] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  v13[14] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  v13[15] = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  return [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:16];
}

- (double)oz_SIMDFloat3x3
{
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 0), "floatValue");
  unsigned int v6 = v2;
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 3), "floatValue");
  unsigned int v5 = v3;
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 6), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 1), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 4), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 7), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 2), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 5), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 8), "floatValue");
  return COERCE_DOUBLE(__PAIR64__(v5, v6));
}

- (__n128)oz_SIMDFloat4x4
{
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 0), "floatValue");
  unsigned int v10 = v2;
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 4), "floatValue");
  unsigned int v9 = v3;
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 8), "floatValue");
  unsigned int v8 = v4;
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 12), "floatValue");
  *(void *)&long long v5 = __PAIR64__(v9, v10);
  *((void *)&v5 + 1) = __PAIR64__(v6, v8);
  long long v11 = v5;
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 1), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 5), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 9), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 13), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 2), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 6), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 10), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 14), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 3), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 7), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 11), "floatValue");
  objc_msgSend((id)objc_msgSend(a1, "objectAtIndexedSubscript:", 15), "floatValue");
  return (__n128)v11;
}

@end