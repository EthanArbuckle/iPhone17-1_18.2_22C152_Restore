@interface NSCoder(VisualLocalizationExtras)
- (uint64_t)_vl_decodeFloat6x6:()VisualLocalizationExtras forKey:;
- (uint64_t)_vl_decodeSimdDouble4x4:()VisualLocalizationExtras forKey:;
- (uint64_t)_vl_encodeFloat6x6:()VisualLocalizationExtras forKey:;
- (uint64_t)_vl_encodeSimdDouble4x4:()VisualLocalizationExtras forKey:;
@end

@implementation NSCoder(VisualLocalizationExtras)

- (uint64_t)_vl_encodeSimdDouble4x4:()VisualLocalizationExtras forKey:
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v4 = a3[1];
  v9[0] = *a3;
  v9[1] = v4;
  long long v5 = a3[3];
  v9[2] = a3[2];
  v9[3] = v5;
  long long v6 = a3[5];
  v9[4] = a3[4];
  v9[5] = v6;
  long long v7 = a3[7];
  v9[6] = a3[6];
  v9[7] = v7;
  return [a1 encodeBytes:v9 length:128 forKey:a4];
}

- (uint64_t)_vl_decodeSimdDouble4x4:()VisualLocalizationExtras forKey:
{
  v26[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v24 = 0;
  id v7 = a1;
  v8 = (_OWORD *)[v7 decodeBytesForKey:v6 returnedLength:&v24];
  if (v8) {
    BOOL v9 = v24 == 128;
  }
  else {
    BOOL v9 = 0;
  }
  uint64_t v10 = v9;
  if (v9)
  {
    if (a3)
    {
      long long v11 = v8[1];
      long long v13 = v8[2];
      long long v12 = v8[3];
      long long v15 = v8[4];
      long long v14 = v8[5];
      long long v17 = v8[6];
      long long v16 = v8[7];
      *a3 = *v8;
      a3[1] = v11;
      a3[2] = v13;
      a3[3] = v12;
      a3[4] = v15;
      a3[5] = v14;
      a3[6] = v17;
      a3[7] = v16;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v19 = *MEMORY[0x263F07F70];
    uint64_t v25 = *MEMORY[0x263EFFC40];
    v20 = [NSString stringWithFormat:@"%@ bytes were not the expected length", v6];
    v26[0] = v20;
    v21 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v22 = [v18 errorWithDomain:v19 code:4864 userInfo:v21];
    [v7 failWithError:v22];
  }
  return v10;
}

- (uint64_t)_vl_encodeFloat6x6:()VisualLocalizationExtras forKey:
{
  return [a1 encodeBytes:a3 length:144 forKey:a4];
}

- (uint64_t)_vl_decodeFloat6x6:()VisualLocalizationExtras forKey:
{
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v17 = 0;
  id v7 = a1;
  v8 = (_DWORD *)[v7 decodeBytesForKey:v6 returnedLength:&v17];
  if (v8) {
    BOOL v9 = v17 == 144;
  }
  else {
    BOOL v9 = 0;
  }
  uint64_t v10 = v9;
  if (v9)
  {
    if (a3)
    {
      *a3 = *v8;
      a3[1] = v8[1];
      a3[2] = v8[2];
      a3[3] = v8[3];
      a3[4] = v8[4];
      a3[5] = v8[5];
      a3[6] = v8[6];
      a3[7] = v8[7];
      a3[8] = v8[8];
      a3[9] = v8[9];
      a3[10] = v8[10];
      a3[11] = v8[11];
      a3[12] = v8[12];
      a3[13] = v8[13];
      a3[14] = v8[14];
      a3[15] = v8[15];
      a3[16] = v8[16];
      a3[17] = v8[17];
      a3[18] = v8[18];
      a3[19] = v8[19];
      a3[20] = v8[20];
      a3[21] = v8[21];
      a3[22] = v8[22];
      a3[23] = v8[23];
      a3[24] = v8[24];
      a3[25] = v8[25];
      a3[26] = v8[26];
      a3[27] = v8[27];
      a3[28] = v8[28];
      a3[29] = v8[29];
      a3[30] = v8[30];
      a3[31] = v8[31];
      a3[32] = v8[32];
      a3[33] = v8[33];
      a3[34] = v8[34];
      a3[35] = v8[35];
    }
  }
  else
  {
    long long v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = *MEMORY[0x263F07F70];
    uint64_t v18 = *MEMORY[0x263EFFC40];
    long long v13 = [NSString stringWithFormat:@"%@ bytes were not the expected length", v6];
    v19[0] = v13;
    long long v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
    long long v15 = [v11 errorWithDomain:v12 code:4864 userInfo:v14];
    [v7 failWithError:v15];
  }
  return v10;
}

@end