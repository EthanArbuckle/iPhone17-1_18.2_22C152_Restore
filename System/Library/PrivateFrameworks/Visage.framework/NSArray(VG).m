@interface NSArray(VG)
+ (id)vg_arrayWithNumbersFromFloat3:()VG;
+ (id)vg_arrayWithNumbersFromFloat4:()VG;
+ (id)vg_arrayWithNumbersFromFloatSpan:()VG;
+ (id)vg_arrayWithNumbersFromFloatVector:()VG;
+ (id)vg_arrayWithRowMajorNumbersFromFloat3x3:()VG;
+ (id)vg_arrayWithRowMajorNumbersFromFloat4x4:()VG;
- (__n128)vg_float3ByInvokingFloatValue;
- (__n128)vg_float3x3From1DArrayByInvokingFloatValue;
- (__n128)vg_float3x3FromRowMajorByInvokingFloatValue;
- (__n128)vg_float4ByInvokingFloatValue;
- (id)vg_arrayByInvokingBlock:()VG;
- (id)vg_compactArrayByInvokingBlock:()VG;
- (id)vg_dataByInvokingFloatValue;
- (void)vg_vectorByInvokingFloatValue;
- (void)vg_vectorFloat3ByInvokingFloatValue;
@end

@implementation NSArray(VG)

- (id)vg_arrayByInvokingBlock:()VG
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        objc_msgSend(v5, "addObject:", v10, (void)v13);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v5 copy];

  return v11;
}

- (id)vg_compactArrayByInvokingBlock:()VG
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        if (*(void *)(*((void *)&v13 + 1) + 8 * i))
        {
          v10 = v4[2](v4);
          objc_msgSend(v5, "addObject:", v10, (void)v13);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v5 copy];

  return v11;
}

+ (id)vg_arrayWithNumbersFromFloatVector:()VG
{
  v5 = [MEMORY[0x263EFF980] arrayWithCapacity:(uint64_t)(a3[1] - *a3) >> 2];
  uint64_t v7 = (_DWORD *)*a3;
  uint64_t v8 = (_DWORD *)a3[1];
  if ((_DWORD *)*a3 != v8)
  {
    do
    {
      LODWORD(v6) = *v7;
      v9 = [NSNumber numberWithFloat:v6];
      [v5 addObject:v9];

      ++v7;
    }
    while (v7 != v8);
  }
  v10 = [a1 arrayWithArray:v5];

  return v10;
}

+ (id)vg_arrayWithNumbersFromFloatSpan:()VG
{
  v5 = [MEMORY[0x263EFF980] arrayWithCapacity:*(void *)(a3 + 8)];
  uint64_t v7 = *(void *)(a3 + 8);
  if (v7)
  {
    uint64_t v8 = *(_DWORD **)a3;
    uint64_t v9 = 4 * v7;
    do
    {
      LODWORD(v6) = *v8;
      v10 = [NSNumber numberWithFloat:v6];
      [v5 addObject:v10];

      ++v8;
      v9 -= 4;
    }
    while (v9);
  }
  v11 = [a1 arrayWithArray:v5];

  return v11;
}

- (void)vg_vectorByInvokingFloatValue
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  std::vector<float>::reserve((void **)a2, [a1 count]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "floatValue", (void)v21);
        int v9 = v8;
        v11 = *(_DWORD **)(a2 + 8);
        unint64_t v10 = *(void *)(a2 + 16);
        if ((unint64_t)v11 >= v10)
        {
          long long v13 = *(_DWORD **)a2;
          uint64_t v14 = ((uint64_t)v11 - *(void *)a2) >> 2;
          unint64_t v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 62) {
            std::vector<vg::hrtf::FaceFrameData>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v16 = v10 - (void)v13;
          if (v16 >> 1 > v15) {
            unint64_t v15 = v16 >> 1;
          }
          if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v15;
          }
          if (v17)
          {
            uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2 + 16, v17);
            long long v13 = *(_DWORD **)a2;
            v11 = *(_DWORD **)(a2 + 8);
          }
          else
          {
            uint64_t v18 = 0;
          }
          v19 = &v18[4 * v14];
          *(_DWORD *)v19 = v9;
          v12 = v19 + 4;
          while (v11 != v13)
          {
            int v20 = *--v11;
            *((_DWORD *)v19 - 1) = v20;
            v19 -= 4;
          }
          *(void *)a2 = v19;
          *(void *)(a2 + 8) = v12;
          *(void *)(a2 + 16) = &v18[4 * v17];
          if (v13) {
            operator delete(v13);
          }
        }
        else
        {
          _DWORD *v11 = v8;
          v12 = v11 + 1;
        }
        *(void *)(a2 + 8) = v12;
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }
}

- (void)vg_vectorFloat3ByInvokingFloatValue
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE7reserveEm((void **)a2, [a1 count]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "vg_float3ByInvokingFloatValue", v21, (void)v22);
        long long v21 = v8;
        unint64_t v10 = a2[1];
        unint64_t v9 = (unint64_t)a2[2];
        if ((unint64_t)v10 >= v9)
        {
          uint64_t v12 = (v10 - *a2) >> 4;
          if ((unint64_t)(v12 + 1) >> 60) {
            std::vector<vg::hrtf::FaceFrameData>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v13 = v9 - (void)*a2;
          uint64_t v14 = v13 >> 3;
          if (v13 >> 3 <= (unint64_t)(v12 + 1)) {
            uint64_t v14 = v12 + 1;
          }
          if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v15 = v14;
          }
          if (v15) {
            uint64_t v16 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv4_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(a2 + 2), v15);
          }
          else {
            uint64_t v16 = 0;
          }
          unint64_t v17 = &v16[16 * v12];
          *(_OWORD *)unint64_t v17 = v21;
          v11 = v17 + 16;
          v19 = *a2;
          uint64_t v18 = a2[1];
          if (v18 != *a2)
          {
            do
            {
              long long v20 = *((_OWORD *)v18 - 1);
              v18 -= 16;
              *((_OWORD *)v17 - 1) = v20;
              v17 -= 16;
            }
            while (v18 != v19);
            uint64_t v18 = *a2;
          }
          *a2 = v17;
          a2[1] = v11;
          a2[2] = &v16[16 * v15];
          if (v18) {
            operator delete(v18);
          }
        }
        else
        {
          *(_OWORD *)unint64_t v10 = v8;
          v11 = v10 + 16;
        }
        a2[1] = v11;
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }
}

+ (id)vg_arrayWithNumbersFromFloat3:()VG
{
  v3 = objc_msgSend(NSNumber, "numberWithFloat:");
  HIDWORD(v4) = a2.n128_u32[1];
  LODWORD(v4) = a2.n128_u32[1];
  uint64_t v5 = [NSNumber numberWithFloat:v4];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  uint64_t v7 = objc_msgSend(a1, "arrayWithObjects:", v3, v5, v6, 0);

  return v7;
}

+ (id)vg_arrayWithNumbersFromFloat4:()VG
{
  v3 = objc_msgSend(NSNumber, "numberWithFloat:");
  HIDWORD(v4) = a2.n128_u32[1];
  LODWORD(v4) = a2.n128_u32[1];
  uint64_t v5 = [NSNumber numberWithFloat:v4];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  long long v8 = objc_msgSend(a1, "arrayWithObjects:", v3, v5, v6, v7, 0);

  return v8;
}

+ (id)vg_arrayWithRowMajorNumbersFromFloat3x3:()VG
{
  long long v21 = objc_msgSend(NSNumber, "numberWithFloat:");
  long long v20 = [NSNumber numberWithFloat:a3.n128_f64[0]];
  v19 = [NSNumber numberWithFloat:a4.n128_f64[0]];
  uint64_t v5 = objc_msgSend(a1, "arrayWithObjects:", v21, v20, v19, 0);
  HIDWORD(v6) = a2.n128_u32[1];
  LODWORD(v6) = a2.n128_u32[1];
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  HIDWORD(v8) = a3.n128_u32[1];
  LODWORD(v8) = a3.n128_u32[1];
  unint64_t v9 = [NSNumber numberWithFloat:v8];
  HIDWORD(v10) = a4.n128_u32[1];
  LODWORD(v10) = a4.n128_u32[1];
  v11 = [NSNumber numberWithFloat:v10];
  uint64_t v12 = objc_msgSend(a1, "arrayWithObjects:", v7, v9, v11, 0);
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  unint64_t v15 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  uint64_t v16 = objc_msgSend(a1, "arrayWithObjects:", v13, v14, v15, 0);
  unint64_t v17 = objc_msgSend(a1, "arrayWithObjects:", v5, v12, v16, 0);

  return v17;
}

+ (id)vg_arrayWithRowMajorNumbersFromFloat4x4:()VG
{
  v35 = objc_msgSend(NSNumber, "numberWithFloat:");
  v34 = [NSNumber numberWithFloat:a3.n128_f64[0]];
  v33 = [NSNumber numberWithFloat:a4.n128_f64[0]];
  v32 = [NSNumber numberWithFloat:a5.n128_f64[0]];
  uint64_t v6 = objc_msgSend(a1, "arrayWithObjects:", v35, v34, v33, v32, 0);
  HIDWORD(v7) = a2.n128_u32[1];
  LODWORD(v7) = a2.n128_u32[1];
  v31 = (void *)v6;
  uint64_t v8 = [NSNumber numberWithFloat:v7];
  HIDWORD(v9) = a3.n128_u32[1];
  LODWORD(v9) = a3.n128_u32[1];
  v30 = (void *)v8;
  uint64_t v10 = [NSNumber numberWithFloat:v9];
  HIDWORD(v11) = a4.n128_u32[1];
  LODWORD(v11) = a4.n128_u32[1];
  v29 = (void *)v10;
  uint64_t v12 = [NSNumber numberWithFloat:v11];
  HIDWORD(v13) = a5.n128_u32[1];
  LODWORD(v13) = a5.n128_u32[1];
  v28 = (void *)v12;
  uint64_t v27 = [NSNumber numberWithFloat:v13];
  uint64_t v26 = objc_msgSend(a1, "arrayWithObjects:", v8, v10, v12, v27, 0);
  long long v25 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  long long v24 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  long long v23 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a5.n128_u32[1], a5.n128_u32[2])));
  unint64_t v15 = objc_msgSend(a1, "arrayWithObjects:", v25, v24, v23, v14, 0);
  uint64_t v16 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  unint64_t v17 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  uint64_t v18 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  v19 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(a5.n128_u32[1], a5.n128_u32[3])));
  long long v20 = objc_msgSend(a1, "arrayWithObjects:", v16, v17, v18, v19, 0);
  long long v21 = objc_msgSend(a1, "arrayWithObjects:", v31, v26, v15, v20, 0);

  return v21;
}

- (id)vg_dataByInvokingFloatValue
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", 4 * objc_msgSend(a1, "count"));
  id v2 = objc_claimAutoreleasedReturnValue();
  v3 = (_DWORD *)[v2 mutableBytes];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "floatValue", (void)v10);
        *v3++ = v8;
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

- (__n128)vg_float3ByInvokingFloatValue
{
  id v2 = [a1 objectAtIndexedSubscript:0];
  [v2 floatValue];
  unsigned __int32 v11 = v3;
  id v4 = [a1 objectAtIndexedSubscript:1];
  [v4 floatValue];
  unsigned __int32 v10 = v5;
  uint64_t v6 = [a1 objectAtIndexedSubscript:2];
  [v6 floatValue];
  unsigned __int32 v9 = v7;

  result.n128_u32[0] = v11;
  result.n128_u32[1] = v10;
  result.n128_u32[2] = v9;
  return result;
}

- (__n128)vg_float4ByInvokingFloatValue
{
  id v2 = [a1 objectAtIndexedSubscript:0];
  [v2 floatValue];
  unsigned int v14 = v3;
  id v4 = [a1 objectAtIndexedSubscript:1];
  [v4 floatValue];
  unsigned int v13 = v5;
  uint64_t v6 = [a1 objectAtIndexedSubscript:2];
  [v6 floatValue];
  unsigned int v12 = v7;
  int v8 = [a1 objectAtIndexedSubscript:3];
  [v8 floatValue];
  *(void *)&long long v9 = __PAIR64__(v13, v14);
  *((void *)&v9 + 1) = __PAIR64__(v10, v12);
  long long v15 = v9;

  return (__n128)v15;
}

- (__n128)vg_float3x3FromRowMajorByInvokingFloatValue
{
  uint64_t v26 = [a1 objectAtIndexedSubscript:0];
  long long v25 = [v26 objectAtIndexedSubscript:0];
  [v25 floatValue];
  unsigned __int32 v18 = v2;
  long long v24 = [a1 objectAtIndexedSubscript:1];
  long long v23 = [v24 objectAtIndexedSubscript:0];
  [v23 floatValue];
  unsigned __int32 v17 = v3;
  long long v22 = [a1 objectAtIndexedSubscript:2];
  long long v21 = [v22 objectAtIndexedSubscript:0];
  [v21 floatValue];
  unsigned __int32 v16 = v4;
  long long v20 = [a1 objectAtIndexedSubscript:0];
  v19 = [v20 objectAtIndexedSubscript:1];
  [v19 floatValue];
  unsigned int v5 = [a1 objectAtIndexedSubscript:1];
  uint64_t v6 = [v5 objectAtIndexedSubscript:1];
  [v6 floatValue];
  unsigned int v7 = [a1 objectAtIndexedSubscript:2];
  int v8 = [v7 objectAtIndexedSubscript:1];
  [v8 floatValue];
  long long v9 = [a1 objectAtIndexedSubscript:0];
  unsigned int v10 = [v9 objectAtIndexedSubscript:2];
  [v10 floatValue];
  unsigned __int32 v11 = [a1 objectAtIndexedSubscript:1];
  unsigned int v12 = [v11 objectAtIndexedSubscript:2];
  [v12 floatValue];
  unsigned int v13 = [a1 objectAtIndexedSubscript:2];
  unsigned int v14 = [v13 objectAtIndexedSubscript:2];
  [v14 floatValue];

  result.n128_u32[0] = v18;
  result.n128_u32[1] = v17;
  result.n128_u32[2] = v16;
  return result;
}

- (__n128)vg_float3x3From1DArrayByInvokingFloatValue
{
  unsigned __int32 v2 = [a1 objectAtIndexedSubscript:0];
  [v2 floatValue];
  unsigned __int32 v17 = v3;
  unsigned __int32 v4 = [a1 objectAtIndexedSubscript:3];
  [v4 floatValue];
  unsigned __int32 v16 = v5;
  uint64_t v6 = [a1 objectAtIndexedSubscript:6];
  [v6 floatValue];
  unsigned __int32 v15 = v7;
  int v8 = [a1 objectAtIndexedSubscript:1];
  [v8 floatValue];
  long long v9 = [a1 objectAtIndexedSubscript:4];
  [v9 floatValue];
  unsigned int v10 = [a1 objectAtIndexedSubscript:7];
  [v10 floatValue];
  unsigned __int32 v11 = [a1 objectAtIndexedSubscript:2];
  [v11 floatValue];
  unsigned int v12 = [a1 objectAtIndexedSubscript:5];
  [v12 floatValue];
  unsigned int v13 = [a1 objectAtIndexedSubscript:8];
  [v13 floatValue];

  result.n128_u32[0] = v17;
  result.n128_u32[1] = v16;
  result.n128_u32[2] = v15;
  return result;
}

@end