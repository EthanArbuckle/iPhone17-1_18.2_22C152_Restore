@interface TXRDataScaler
+ (id)newImageFromSourceImage:(id)a3 bufferAllocattor:(id)a4 filter:(unint64_t)a5 error:(id *)a6;
+ (id)newImageFromSourceImage:(id)a3 scaledDimensions:(id)a4 bufferAllocattor:(unint64_t)a5 filter:(id *)a6 error:;
@end

@implementation TXRDataScaler

+ (id)newImageFromSourceImage:(id)a3 bufferAllocattor:(id)a4 filter:(unint64_t)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a3;
  [v11 dimensions];
  v15.i32[0] = 0;
  int32x4_t v13 = (int32x4_t)vshrq_n_u32(v12, 1uLL);
  int8x16_t v14 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_s32(v13, v15), 0);
  v15.i64[0] = 0x100000001;
  v16.i32[0] = 1;
  v16.i32[1] = v13.i32[1];
  v16.i64[1] = v13.u32[2] | 0x100000000;
  int8x16_t v17 = vbslq_s8(v14, v16, (int8x16_t)v13);
  int8x16_t v18 = v17;
  if (!v17.i32[1])
  {
    v15.i32[0] = v17.i32[0];
    v15.i64[1] = __PAIR64__(v13.u32[3], v17.u32[2]);
    int8x16_t v18 = (int8x16_t)v15;
  }
  if (!v18.i32[2]) {
    v15.i64[0] = v18.i64[0];
  }
  v19 = objc_msgSend(a1, "newImageFromSourceImage:scaledDimensions:bufferAllocattor:filter:error:", v11, v10, a5, a6, *(double *)v18.i64, *(double *)v15.i64);

  return v19;
}

+ (id)newImageFromSourceImage:(id)a3 scaledDimensions:(id)a4 bufferAllocattor:(unint64_t)a5 filter:(id *)a6 error:
{
  __n128 v23 = v6;
  id v10 = a3;
  id v11 = a4;
  [v10 dimensions];
  unsigned int v13 = v12;
  __n128 v14 = v23;
  if (v13 >= v23.n128_u32[0] && ([v10 dimensions], v16 = v15, __n128 v14 = v23, v16 >= v23.n128_u32[1]))
  {
    [v10 dimensions];
    unsigned __int32 v19 = v18;
    __n128 v14 = v23;
    BOOL v17 = v19 < v23.n128_u32[2];
  }
  else
  {
    BOOL v17 = 1;
  }
  if (a5 == 2 && v17) {
    unint64_t v20 = 0;
  }
  else {
    unint64_t v20 = a5;
  }
  if (v20 > 1)
  {
    if (v20 == 2) {
      +[TXRDataScaler newImageFromSourceImage:scaledDimensions:bufferAllocattor:filter:error:](v10, v11);
    }
    if (a6)
    {
      _newTXRErrorWithCodeAndErrorString(0, @"Unsupported filter");
      v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = newScaledImageWithLancosFilter(v10, v11, v20, a6, v14);
  }

  return v21;
}

+ (void)newImageFromSourceImage:(void *)a1 scaledDimensions:(void *)a2 bufferAllocattor:filter:error:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  __assert_rtn("newScaledImageWithBoxFilter", "TXRDataScaler.m", 382, "!\"TODO:Box filter needs implementation\"");
}

@end