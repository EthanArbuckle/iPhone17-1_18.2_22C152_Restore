uint64_t downsample_2x2_2Hx32W_N64()
{
  return row_loop2b();
}

uint64_t col_loop2b(const char *a1, uint64_t a2, uint8x16_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, const char *a7)
{
  do
  {
    int8x16x2_t v11 = vld2q_s8(a1);
    a1 += 32;
    int8x16x2_t v12 = vld2q_s8(a7);
    a7 += 32;
    *a3++ = vhaddq_u8(vhaddq_u8((uint8x16_t)v11.val[0], (uint8x16_t)v12.val[0]), vhaddq_u8((uint8x16_t)v11.val[1], (uint8x16_t)v12.val[1]));
  }
  while (v8-- > 1);
  uint64_t result = (uint64_t)&a1[2 * a2 + -32 * a6];
  if (v7 > 1) {
    return row_loop2b(result);
  }
  return result;
}

uint64_t downsample_3x3_3Hx24W_N64()
{
  return row_loop3();
}

uint64_t col_loop3@<X0>(const char *a1@<X0>, uint64_t a2@<X1>, int8x8_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, const char *a7@<X6>, const char *a8@<X7>, uint64_t a9@<X8>)
{
  do
  {
    int8x8x3_t v18 = vld3_s8(a1);
    a1 += 24;
    int8x8x3_t v19 = vld3_s8(a7);
    a7 += 24;
    int8x8x3_t v20 = vld3_s8(a8);
    a8 += 24;
    *a3++ = vmovn_s16(vqdmulhq_s16((int16x8_t)vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddl_u8((uint8x8_t)v18.val[0], (uint8x8_t)v18.val[1]), (uint8x8_t)v18.val[2]), (uint8x8_t)v19.val[0]), (uint8x8_t)v19.val[1]), (uint8x8_t)v19.val[2]), (uint8x8_t)v20.val[0]), (uint8x8_t)v20.val[1]), (uint8x8_t)v20.val[2]), v12));
  }
  while (v11-- > 1);
  uint64_t result = (uint64_t)&a1[a9];
  v15 = &a7[a9];
  v16 = &a8[a9];
  v17 = (char *)a3 + v9;
  if (v10 > 1) {
    return row_loop3(result, a2, v17, a4, a5, a6, v15, v16);
  }
  return result;
}

uint64_t downsample_4x4_4Hx32W_N64()
{
  return row_loop4();
}

uint64_t col_loop4@<X0>(const char *a1@<X0>, uint64_t a2@<X1>, int8x8_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, const char *a7@<X6>, const char *a8@<X7>, const char *a9@<X8>)
{
  do
  {
    int8x16x2_t v18 = vld2q_s8(a1);
    a1 += 32;
    int8x16x2_t v19 = vld2q_s8(a7);
    a7 += 32;
    int8x16x2_t v20 = vld2q_s8(a8);
    a8 += 32;
    int8x16x2_t v21 = vld2q_s8(a9);
    a9 += 32;
    *a3++ = vrshrn_n_s16((int16x8_t)vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpaddlq_u8((uint8x16_t)v18.val[0]), (uint8x16_t)v18.val[1]), (uint8x16_t)v19.val[0]), (uint8x16_t)v19.val[1]), (uint8x16_t)v20.val[0]), (uint8x16_t)v20.val[1]), (uint8x16_t)v21.val[0]), (uint8x16_t)v21.val[1]), 4uLL);
  }
  while (v12-- > 1);
  uint64_t result = (uint64_t)&a1[v9];
  v15 = &a7[v9];
  v16 = &a8[v9];
  v17 = (char *)a3 + v10;
  if (v11 > 1) {
    return row_loop4(result, a2, v17, a4, a5, a6, v15, v16);
  }
  return result;
}

uint64_t downsample_5x5_5Hx15W_N64()
{
  return row_loop5();
}

uint64_t col_loop5@<X0>(uint8x16_t *a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X2>, uint64_t a4@<X7>, uint64_t a5@<X8>)
{
  do
  {
    uint8x16_t v10 = *a1;
    uint64_t v9 = (uint8x16_t *)((char *)a1 + a2);
    uint8x16_t v12 = *v9;
    uint64_t v11 = (uint8x16_t *)((char *)v9 + a2);
    uint8x16_t v14 = *v11;
    v13 = (uint8x16_t *)((char *)v11 + a2);
    uint8x16_t v16 = *v13;
    v15 = (uint8x16_t *)((char *)v13 + a2);
    uint8x16_t v17 = *v15;
    a1 = (uint8x16_t *)((char *)v15 + a4);
    int8x16_t v18 = (int8x16_t)vaddw_u8(vaddw_u8(vaddw_u8(vaddl_u8(*(uint8x8_t *)v10.i8, *(uint8x8_t *)v12.i8), *(uint8x8_t *)v14.i8), *(uint8x8_t *)v16.i8), *(uint8x8_t *)v17.i8);
    int8x16_t v19 = (int8x16_t)vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddl_high_u8(v10, v12), v14), v16), v17);
    int16x8_t v20 = (int16x8_t)vandq_s8(v18, v8);
    v20.i16[0] = vaddvq_s16(v20);
    *a3 = vmovn_s16(vqdmulhq_s16(v20, v7)).u8[0];
    int8x16x2_t v21 = a3 + 1;
    int16x8_t v22 = (int16x8_t)vandq_s8(vextq_s8(v18, v19, 0xAuLL), v8);
    v22.i16[0] = vaddvq_s16(v22);
    *v21++ = vmovn_s16(vqdmulhq_s16(v22, v7)).u8[0];
    int16x8_t v23 = (int16x8_t)vandq_s8(vextq_s8(v19, v19, 4uLL), v8);
    v23.i16[0] = vaddvq_s16(v23);
    *int8x16x2_t v21 = vmovn_s16(vqdmulhq_s16(v23, v7)).u8[0];
    a3 = v21 + 1;
  }
  while (v6-- > 1);
  uint64_t result = (uint64_t)a1->i64 + a5;
  if (v5 > 1) {
    return row_loop5(result);
  }
  return result;
}

uint64_t downsample_6x6_6Hx48W_N64(__n128 a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, __n128 a6, __n128 a7)
{
  return row_loop6(a1, a2, a3, a4, a5, a6, a7, (__n128)vdupq_lane_s16((int16x4_t)910, 0));
}

uint64_t row_loop6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return col_loop6(a1 + 4 * a2 + 2 * a2, a2, a3 + a4);
}

uint64_t col_loop6@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, const char *a6@<X6>, int8x8_t *a7@<X8>, int16x8_t a8@<Q7>)
{
  do
  {
    uint64_t v9 = a6;
    int8x16x3_t v18 = vld3q_s8(v9);
    uint8x16_t v10 = &v9[a2];
    int8x16x3_t v21 = vld3q_s8(v10);
    uint64_t v11 = &v10[a2];
    uint16x8_t v12 = vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpaddlq_u8((uint8x16_t)v18.val[0]), (uint8x16_t)v18.val[1]), (uint8x16_t)v18.val[2]), (uint8x16_t)v21.val[0]), (uint8x16_t)v21.val[1]), (uint8x16_t)v21.val[2]);
    int8x16x3_t v19 = vld3q_s8(v11);
    v13 = &v11[a2];
    int8x16x3_t v22 = vld3q_s8(v13);
    uint8x16_t v14 = &v13[a2];
    uint16x8_t v15 = vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(v12, (uint8x16_t)v19.val[0]), (uint8x16_t)v19.val[1]), (uint8x16_t)v19.val[2]), (uint8x16_t)v22.val[0]), (uint8x16_t)v22.val[1]), (uint8x16_t)v22.val[2]);
    int8x16x3_t v20 = vld3q_s8(v14);
    uint8x16_t v16 = &v14[a2];
    int8x16x3_t v23 = vld3q_s8(v16);
    *a7++ = vmovn_s16(vqdmulhq_s16((int16x8_t)vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(vpadalq_u8(v15, (uint8x16_t)v20.val[0]), (uint8x16_t)v20.val[1]), (uint8x16_t)v20.val[2]), (uint8x16_t)v23.val[0]), (uint8x16_t)v23.val[1]), (uint8x16_t)v23.val[2]), a8));
    a6 += 48;
  }
  while (v8-- > 1);
  if (a5 > 1) {
    return row_loop6(a1, a2, a3, a4);
  }
  return a1;
}

uint64_t convertUV2SignalSpace_Hx16W_N64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  return convertUV_row_loop((__n128)vdupq_lane_s16((int16x4_t)(a7 >> 16), 0), (__n128)vdupq_lane_s16((int16x4_t)a7, 0), (__n128)vdupq_lane_s16((int16x4_t)((a8 << 6) + 32), 0));
}

uint64_t convertUV_row_loop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return convertUV_col_loop(a1 + a2, a2, a3 + a4);
}

uint64_t convertUV_col_loop@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, const char *a6@<X6>, int8x16_t *a7@<X7>, uint64_t a8@<X8>, int16x8_t a9@<Q0>, int16x8_t a10@<Q1>, int16x8_t a11@<Q2>)
{
  do
  {
    int8x16x2_t v12 = vld2q_s8(a6);
    a6 += 32;
    *a7++ = vqshrun_high_n_s16(vqshrun_n_s16(vqaddq_s16(vqaddq_s16(vqdmulhq_s16((int16x8_t)vshll_n_u8(*(uint8x8_t *)v12.val[0].i8, 6uLL), a9), a11), vqdmulhq_s16((int16x8_t)vshll_n_u8(*(uint8x8_t *)v12.val[1].i8, 6uLL), a10)), 6uLL), vqaddq_s16(vqaddq_s16(vqdmulhq_s16((int16x8_t)vshll_high_n_u8((uint8x16_t)v12.val[0], 6uLL), a9), a11), vqdmulhq_s16((int16x8_t)vshll_high_n_u8((uint8x16_t)v12.val[1], 6uLL), a10)), 6uLL);
  }
  while (a8-- > 1);
  if (a5 > 1) {
    return convertUV_row_loop(a1, a2, a3, a4);
  }
  return a1;
}

uint64_t convertUVDownsample_2x2_2Hx16W_N64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  return convertUV_2x2_row_loop((__n128)vdupq_lane_s16((int16x4_t)(a7 >> 16), 0), (__n128)vdupq_lane_s16((int16x4_t)a7, 0), (__n128)vdupq_lane_s16((int16x4_t)(8 * a8 + 4), 0));
}

uint64_t convertUV_2x2_row_loop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return convertUV_2x2_col_loop(a1 + 2 * a2, a2, a3 + a4);
}

uint64_t convertUV_2x2_col_loop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int16x8_t a6, int16x8_t a7, int16x8_t a8, uint64_t a9, const char *a10, const char *a11)
{
  do
  {
    int8x16x2_t v14 = vld2q_s8(a10);
    a10 += 32;
    int8x16x2_t v15 = vld2q_s8(a11);
    a11 += 32;
    *v11++ = vqshrun_n_s16(vqaddq_s16(vqaddq_s16(vqdmulhq_s16((int16x8_t)vqshlq_n_u16(vpadalq_u8(vpaddlq_u8((uint8x16_t)v14.val[1]), (uint8x16_t)v15.val[1]), 3uLL), a7), a8), vqdmulhq_s16((int16x8_t)vqshlq_n_u16(vpadalq_u8(vpaddlq_u8((uint8x16_t)v14.val[0]), (uint8x16_t)v15.val[0]), 3uLL), a6)), 3uLL);
  }
  while (v12-- > 1);
  if (a5 > 1) {
    return convertUV_2x2_row_loop(a1, a2, a3, a4);
  }
  return a1;
}

uint64_t convertUVDownsample_3x3_3Hx24W_N64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  return convertUV_3x3_row_loop((__n128)vdupq_lane_s16((int16x4_t)(a7 >> 16), 0), (__n128)vdupq_lane_s16((int16x4_t)a7, 0), (__n128)vdupq_lane_s16((int16x4_t)(8 * a8 + 4), 0));
}

uint64_t convertUV_3x3_row_loop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return convertUV_3x3_col_loop(a1 + a2 + a2 + a2, a2, a3 + a4);
}

uint64_t convertUV_3x3_col_loop@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, const __int16 *a6@<X6>, const __int16 *a7@<X7>, const __int16 *a8@<X8>, int16x8_t a9@<Q0>, int16x8_t a10@<Q1>, int16x8_t a11@<Q2>)
{
  do
  {
    int16x8x3_t v16 = vld3q_s16(a6);
    a6 += 24;
    int16x8x3_t v17 = vld3q_s16(a7);
    a7 += 24;
    int16x8x3_t v18 = vld3q_s16(a8);
    a8 += 24;
    int16x8_t v13 = (int16x8_t)vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddw_u8(vaddl_u8(*(uint8x8_t *)v16.val[0].i8, *(uint8x8_t *)v16.val[1].i8), *(uint8x8_t *)v16.val[2].i8), *(uint8x8_t *)v17.val[0].i8), *(uint8x8_t *)v17.val[1].i8), *(uint8x8_t *)v17.val[2].i8), *(uint8x8_t *)v18.val[0].i8), *(uint8x8_t *)v18.val[1].i8), *(uint8x8_t *)v18.val[2].i8);
    int16x8_t v14 = (int16x8_t)vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddw_high_u8(vaddl_high_u8((uint8x16_t)v16.val[0], (uint8x16_t)v16.val[1]), (uint8x16_t)v16.val[2]), (uint8x16_t)v17.val[0]), (uint8x16_t)v17.val[1]), (uint8x16_t)v17.val[2]), (uint8x16_t)v18.val[0]), (uint8x16_t)v18.val[1]), (uint8x16_t)v18.val[2]);
    *v11++ = vqshrun_n_s16(vqaddq_s16(vqaddq_s16(vqdmulhq_s16((int16x8_t)vqshlq_n_u16((uint16x8_t)vuzp2q_s16(v13, v14), 3uLL), a10), a11), vqdmulhq_s16((int16x8_t)vqshlq_n_u16((uint16x8_t)vuzp1q_s16(v13, v14), 3uLL), a9)), 3uLL);
  }
  while (v12-- > 1);
  if (a5 > 1) {
    return convertUV_3x3_row_loop(a1, a2, a3, a4);
  }
  return a1;
}

uint64_t convertUVDownsample_4x4_4Hx32W_N64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  return convertUV_4x4_row_loop((__n128)vdupq_lane_s16((int16x4_t)(a7 >> 16), 0), (__n128)vdupq_lane_s16((int16x4_t)a7, 0), (__n128)vdupq_lane_s16((int16x4_t)((a8 << 6) + 32), 0));
}

uint64_t convertUV_4x4_row_loop(uint64_t a1, uint64_t a2)
{
  return convertUV_4x4_col_loop(a1 + 4 * a2);
}

uint64_t convertUV_4x4_col_loop@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X4>, const char *a4@<X6>, const char *a5@<X7>, const char *a6@<X8>, int16x8_t a7@<Q0>, int16x8_t a8@<Q1>, int16x8_t a9@<Q2>)
{
  do
  {
    int8x16x4_t v19 = vld4q_s8(a4);
    a4 += 64;
    uint16x8_t v12 = vpadalq_u8(vpaddlq_u8((uint8x16_t)v19.val[0]), (uint8x16_t)v19.val[2]);
    uint16x8_t v13 = vpadalq_u8(vpaddlq_u8((uint8x16_t)v19.val[1]), (uint8x16_t)v19.val[3]);
    int8x16x4_t v20 = vld4q_s8(a5);
    a5 += 64;
    uint16x8_t v14 = vpadalq_u8(vpadalq_u8(v12, (uint8x16_t)v20.val[0]), (uint8x16_t)v20.val[2]);
    uint16x8_t v15 = vpadalq_u8(vpadalq_u8(v13, (uint8x16_t)v20.val[1]), (uint8x16_t)v20.val[3]);
    int8x16x4_t v21 = vld4q_s8(a6);
    a6 += 64;
    uint16x8_t v16 = vpadalq_u8(vpadalq_u8(v14, (uint8x16_t)v21.val[0]), (uint8x16_t)v21.val[2]);
    uint16x8_t v17 = vpadalq_u8(vpadalq_u8(v15, (uint8x16_t)v21.val[1]), (uint8x16_t)v21.val[3]);
    int8x16x4_t v22 = vld4q_s8(v9);
    v9 += 64;
    *v10++ = vqshrun_n_s16(vqaddq_s16(vqaddq_s16(vqdmulhq_s16((int16x8_t)vqshlq_n_u16(vpadalq_u8(vpadalq_u8(v17, (uint8x16_t)v22.val[1]), (uint8x16_t)v22.val[3]), 2uLL), a8), a9), vqdmulhq_s16((int16x8_t)vqshlq_n_u16(vpadalq_u8(vpadalq_u8(v16, (uint8x16_t)v22.val[0]), (uint8x16_t)v22.val[2]), 2uLL), a7)), 6uLL);
  }
  while (v11-- > 1);
  if (a3 > 1) {
    return convertUV_4x4_row_loop(a1, a2);
  }
  return a1;
}

uint64_t VPCreateWatermarkPixelBuffers(char *__s, size_t a2, int a3, int a4, CFIndex capacity, int *a6)
{
  size_t v8 = a2;
  uint64_t v28 = *MEMORY[0x263EF8340];
  CVPixelBufferRef pixelBufferOut = 0;
  if (a2 == -1) {
    size_t v8 = strlen(__s);
  }
  if (v8 > 0x6E)
  {
    int v19 = -6743;
  }
  else
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, capacity, MEMORY[0x263EFFF70]);
    if (Mutable)
    {
      CFMutableArrayRef v11 = Mutable;
      v24 = &v21;
      CVPixelBufferPoolRef poolOut = 0;
      CFMutableDictionaryRef v12 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      if (v12)
      {
        uint16x8_t v13 = v12;
        CFDictionarySetInt64();
        CFDictionarySetInt64();
        CFDictionarySetInt64();
        CFDictionarySetInt64();
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x263F04170], (const void *)*MEMORY[0x263EFFB40]);
        CFMutableDictionaryRef v14 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
        if (v14)
        {
          __src = __s;
          int8x16x3_t v23 = a6;
          CFDictionarySetValue(v13, (const void *)*MEMORY[0x263F04130], v14);
          CFMutableDictionaryRef v15 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          if (v15)
          {
            CFDictionaryRef v16 = v15;
            CFDictionarySetInt64();
            CVReturn v17 = CVPixelBufferPoolCreate(0, v16, v13, &poolOut);
            CVPixelBufferPoolRef v18 = poolOut;
            if (v17)
            {
              int v19 = v17;
              if (poolOut)
              {
                CFRelease(poolOut);
                CVPixelBufferPoolRef v18 = 0;
              }
            }
            else if (poolOut)
            {
              int v19 = 0;
              CVPixelBufferPoolRef poolOut = 0;
            }
            else
            {
              int v19 = -6700;
            }
            CFRelease(v16);
          }
          else
          {
            CVPixelBufferPoolRef v18 = 0;
            int v19 = -6728;
          }
          CFRelease(v14);
          CFRelease(v13);
          if (v18)
          {
            memcpy(__dst, __src, v8);
            bzero(&__dst[v8], 110 - v8);
            startEmbed();
          }
          if (!v19) {
            int v19 = -6700;
          }
          a6 = v23;
          goto LABEL_16;
        }
        CFRelease(v13);
      }
      int v19 = -6728;
LABEL_16:
      CFRelease(v11);
      goto LABEL_17;
    }
    int v19 = -6728;
  }
LABEL_17:
  if (a6) {
    *a6 = v19;
  }
  return 0;
}

void sub_228A401D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228A4025C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228A402F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228A404A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_228A40638(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228A40788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228A4092C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_228A40F30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228A41120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228A411C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_228A41268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_228A41358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_228A414B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_228A41560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_228A4198C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_228A422EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t CachedGrayBlockConfig::CachedGrayBlockConfig(uint64_t result, __int16 a2, __int16 a3, int a4, int a5, __int16 a6, uint64_t a7)
{
  *(void *)(result + 24) = 0;
  *(void *)(result + 32) = 0;
  *(unsigned char *)(result + 16) = 0;
  *(void *)uint64_t result = &unk_26DD17E68;
  *(void *)(result + 8) = a7;
  *(unsigned char *)(result + 40) = 0;
  *(_WORD *)(result + 42) = a6;
  *(void *)(result + 240) = 0;
  *(_WORD *)(result + 248) = a3;
  *(_WORD *)(result + 250) = a2;
  *(_WORD *)(result + 252) = a4 * a3;
  *(_DWORD *)(result + 256) = a4;
  if (a5) {
    *(_WORD *)(result + 252) = a5;
  }
  for (uint64_t i = 0; i != 192; i += 48)
  {
    uint64_t v8 = result + i;
    *(unsigned char *)(v8 + 48) = 0;
    *(_OWORD *)(v8 + 56) = 0uLL;
    *(_OWORD *)(v8 + 72) = 0uLL;
    *(_DWORD *)(v8 + 88) = 0;
    *(_DWORD *)(v8 + 92) = a4;
  }
  *(unsigned char *)(result + 48) = 1;
  return result;
}

void CachedGrayBlockConfig::~CachedGrayBlockConfig(CachedGrayBlockConfig *this)
{
  *(void *)this = &unk_26DD17E68;
  if (*((unsigned char *)this + 40))
  {
    uint64_t v2 = *((void *)this + 8);
    if (v2) {
      MEMORY[0x22A6A46F0](v2, 0x1000C8077774924);
    }
  }
  for (uint64_t i = 112; i != 256; i += 48)
  {
    uint64_t v4 = *(void *)((char *)this + i);
    if (v4) {
      MEMORY[0x22A6A46F0](v4, 0x1000C8077774924);
    }
  }
  BlockConfigBase::~BlockConfigBase(this);
}

{
  uint64_t vars8;

  CachedGrayBlockConfig::~CachedGrayBlockConfig(this);
  JUMPOUT(0x22A6A4700);
}

void BlockConfigBase::~BlockConfigBase(BlockConfigBase *this)
{
  *(void *)this = &unk_26DD17EF8;
  unint64_t v2 = *((unsigned int *)this + 8);
  if (v2)
  {
    for (unint64_t i = 0; i < v2; ++i)
    {
      uint64_t v4 = *(void *)(*((void *)this + 3) + 8 * i);
      if (v4)
      {
        MEMORY[0x22A6A4700](v4, 0x1000C403F306F5FLL);
        unint64_t v2 = *((unsigned int *)this + 8);
      }
    }
  }
  uint64_t v5 = *((void *)this + 3);
  if (v5) {
    MEMORY[0x22A6A46F0](v5, 0x20C8093837F09);
  }
}

uint64_t CachedGrayBlockConfig::bumpSizeToScaleInd(CachedGrayBlockConfig *this, int a2)
{
  if ((a2 - 2) < 3) {
    return (a2 - 2) + 1;
  }
  else {
    return 0;
  }
}

uint64_t CachedGrayBlockConfig::downsampleAndPadd(CachedGrayBlockConfig *this, unsigned int a2)
{
  if (!*((unsigned char *)this + 16)) {
    return 5;
  }
  uint64_t v3 = *((void *)this + 30);
  if (!v3) {
    return 3;
  }
  if (a2 > 3) {
    return 2;
  }
  int v5 = *((_DWORD *)this + 23);
  int v7 = *((_DWORD *)this + 20);
  int v6 = *((_DWORD *)this + 21);
  uint64_t v8 = *((unsigned int *)this + 22);
  uint64_t v9 = *((void *)this + 7);
  uint8x16_t v10 = (_DWORD *)((char *)this + 48 * a2 + 92);
  *uint8x16_t v10 = v5;
  switch(a2)
  {
    case 0u:
      uint64_t result = 0;
      int v12 = *((unsigned __int16 *)this + 125);
      int v13 = *((unsigned __int16 *)this + 124);
      *((_DWORD *)this + 20) = v12;
      *((_DWORD *)this + 21) = v13;
      *((_DWORD *)this + 18) = v12;
      *((_DWORD *)this + 19) = v13;
      int v14 = *((unsigned __int16 *)this + 126);
      *((void *)this + 7) = v3;
      *((void *)this + 8) = v3;
      int v15 = *((_DWORD *)this + 64);
      *((_DWORD *)this + 22) = v14;
      *((_DWORD *)this + 23) = v15;
      return result;
    case 1u:
      if (!*((void *)this + 6 * a2 + 8))
      {
        CFDictionaryRef v16 = (_DWORD *)((char *)this + 48 * a2);
        v16[20] = v7 >> 1;
        v16[21] = v6 >> 1;
        int v17 = 2 * *((unsigned __int16 *)this + 21);
        v16[18] = v17 + (v7 >> 1);
        v16[19] = v17 + (v6 >> 1);
        operator new[]();
      }
      if (!v9) {
        return 0;
      }
      CVPixelBufferPoolRef v18 = (char *)this + 48 * a2;
      int v19 = (unsigned __int8 *)*((void *)v18 + 7);
      unsigned int v20 = (unsigned __int16)v8;
      unsigned int v21 = (unsigned __int16)*((_DWORD *)v18 + 22);
      int v22 = (unsigned __int16)(v7 >> 1);
      int v23 = (unsigned __int16)(v6 >> 5);
      uint64_t result = v9;
      if (v5 != 1) {
        goto LABEL_36;
      }
      goto LABEL_13;
    case 2u:
      if (!*((void *)this + 6 * a2 + 8))
      {
        v24 = (_DWORD *)((char *)this + 48 * a2);
        v24[20] = v7 / 3;
        v24[21] = v6 / 3;
        int v25 = *((unsigned __int16 *)this + 21);
        int v26 = v6 / 3 + 2 * v25;
        v24[18] = v7 / 3 + 2 * v25;
        v24[19] = v26;
        v24[22] = v26 * v5;
        operator new[]();
      }
      if (!v9) {
        return 0;
      }
      if (v5 != 1)
      {
        downsample_3x3_YUV_3Hx24W_G(v9, (unsigned __int16)v8, *((unsigned __int8 **)this + 6 * a2 + 7), *((unsigned __int16 *)this + 24 * a2 + 44), *((unsigned __int16 *)this + 24 * a2 + 40), (unsigned __int16)(*((_DWORD *)this + 12 * a2 + 21) >> 3));
        return 0;
      }
      int v27 = *((_DWORD *)this + 12 * a2 + 20);
      if (v27 < 1) {
        return 0;
      }
      int v28 = 0;
      while (1)
      {
        int v29 = v27 >= 0x64 ? 100 : v27;
        uint64_t v30 = v9;
        uint64_t v31 = v8;
        downsample_3x3_3Hx24W_N64();
        v32 = (unsigned int *)*((void *)this + 1);
        if (v32)
        {
          v33 = (void (*)(void))*((void *)v32 + 1);
          if (v33) {
            v33(*v32);
          }
          v34 = (unsigned char *)*((void *)v32 + 2);
          if (v34)
          {
            if (*v34) {
              break;
            }
          }
        }
        uint64_t result = 0;
        v27 -= v29;
        v28 += v29;
        uint64_t v8 = v31;
        uint64_t v9 = v30;
        if (v27 < 1) {
          return result;
        }
      }
      return 9;
    case 3u:
      int v35 = (*(uint64_t (**)(CachedGrayBlockConfig *, uint64_t))(*(void *)this + 72))(this, 2);
      if (!*((void *)this + 6 * a2 + 8))
      {
        if (!*((void *)this + 6 * v35 + 7)) {
          (*(void (**)(CachedGrayBlockConfig *, uint64_t))(*(void *)this + 80))(this, 1);
        }
        v36 = (_DWORD *)((char *)this + 48 * a2);
        v36[20] = v7 >> 2;
        v36[21] = v6 >> 2;
        int v37 = 2 * *((unsigned __int16 *)this + 21);
        int v38 = v37 + (v7 >> 2);
        int v39 = v37 + (v6 >> 2);
        v36[18] = v38;
        v36[19] = v39;
        v36[22] = *v10 * v39;
        operator new[]();
      }
      uint64_t result = *((void *)this + 6 * v35 + 7);
      if (!result) {
        return result;
      }
      v40 = (char *)this + 48 * a2 + 48;
      int v19 = (unsigned __int8 *)*((void *)v40 + 1);
      unsigned int v20 = (unsigned __int16)*((_DWORD *)this + 12 * v35 + 22);
      unsigned int v21 = (unsigned __int16)*((_DWORD *)v40 + 10);
      int v22 = (unsigned __int16)(v7 >> 2);
      int v23 = (unsigned __int16)(v6 >> 6);
      if (*v10 == 1) {
LABEL_13:
      }
        downsample_2x2_2Hx32W_N64();
      else {
LABEL_36:
      }
        downsample_2x2_YUV_2Hx32W_G(result, v20, v19, v21, v22, v23);
      return 0;
    default:
      return 0;
  }
}

uint64_t CachedGrayBlockConfig::UpdateImageData(CachedGrayBlockConfig *this, unsigned __int8 *a2)
{
  if (!a2) {
    return 3;
  }
  if (!*((unsigned char *)this + 16)) {
    return 5;
  }
  uint64_t v3 = 0;
  *((void *)this + 30) = a2;
  uint64_t v4 = (unsigned __int8 *)this + 48;
  while (1)
  {
    int v5 = *v4;
    v4 += 48;
    if (v5)
    {
      (*(void (**)(CachedGrayBlockConfig *, void))(*(void *)this + 80))(this, v3);
      int v6 = (unsigned int *)*((void *)this + 1);
      if (v6)
      {
        int v7 = (void (*)(void))*((void *)v6 + 1);
        if (v7) {
          v7(*v6);
        }
        uint64_t v8 = (unsigned char *)*((void *)v6 + 2);
        if (v8)
        {
          if (*v8) {
            break;
          }
        }
      }
    }
    if (++v3 == 4) {
      return 0;
    }
  }
  return 9;
}

uint64_t CachedGrayBlockConfig::AddBlock(CachedGrayBlockConfig *this, uint64_t a2, int a3, int a4)
{
  if (!a2) {
    return 2;
  }
  if (!*((unsigned char *)this + 16)) {
    return 5;
  }
  if (a3 * (int)a2 >= *((unsigned __int16 *)this + 124)
    || a4 * (int)a2 >= *((unsigned __int16 *)this + 125))
  {
    return 2;
  }
  int v5 = (*(uint64_t (**)(CachedGrayBlockConfig *, uint64_t))(*(void *)this + 72))(this, a2);
  *((unsigned char *)this + 48 * v5 + 48) = 1;
  if (!*((void *)this + 30)
    || *((void *)this + 6 * v5 + 8)
    || (uint64_t result = (*(uint64_t (**)(CachedGrayBlockConfig *, void))(*(void *)this + 80))(this, v5), !result))
  {
    uint64_t result = BlockConfigBase::resizeBlockConfigArray(this, *((_DWORD *)this + 8) + 1);
    if (!result) {
      operator new();
    }
  }
  return result;
}

uint64_t BlockConfigBase::resizeBlockConfigArray(BlockConfigBase *this, unsigned int a2)
{
  if (*((_DWORD *)this + 9) < a2) {
    operator new[]();
  }
  return 0;
}

uint64_t CachedGrayBlockConfig::ExtractBlock1stStage(uint64_t a1, unsigned int a2, void *a3, _WORD *a4, __int32 *a5)
{
  if (!*(unsigned char *)(a1 + 16)) {
    return 5;
  }
  if (!a3) {
    return 3;
  }
  if (*(_DWORD *)(a1 + 32) <= a2) {
    return 2;
  }
  uint64_t v9 = *(unsigned __int8 **)(*(void *)(a1 + 24) + 8 * a2);
  int v10 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 72))(a1, *v9);
  uint64_t result = 0;
  int v12 = (int32x2_t *)(a1 + 48 * v10);
  v13.i32[0] = *((unsigned __int16 *)v9 + 1);
  v13.i32[1] = *((unsigned __int16 *)v9 + 2);
  int32x2_t v14 = vsra_n_s32(vrev64_s32(vadd_s32(v13, (int32x2_t)0x3F0000003FLL)), vsub_s32(v12[9], v12[10]), 1uLL);
  __int32 v16 = v12[11].i32[0];
  __int32 v15 = v12[11].i32[1];
  *a3 = *(void *)&v12[8] + ((v14.i32[1] + v14.i32[0] * v16) * v15);
  *a4 = v16;
  *a5 = v15;
  return result;
}

uint64_t CachedGrayBlockConfig::ExtractBlockReadStage(uint64_t a1, unsigned int a2, void *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8)
{
  if (!*(unsigned char *)(a1 + 16)) {
    return 5;
  }
  if (!a3) {
    return 3;
  }
  if (*(_DWORD *)(a1 + 32) <= a2) {
    return 2;
  }
  __int32 v15 = *(unsigned __int8 **)(*(void *)(a1 + 24) + 8 * a2);
  int v16 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 72))(a1, *v15);
  uint64_t result = 0;
  uint64_t v18 = a1 + 48 * v16;
  *a3 = *(void *)(v18 + 64);
  *a4 = *(_DWORD *)(v18 + 72);
  *a5 = *(_DWORD *)(v18 + 76);
  *a6 = *((unsigned __int16 *)v15 + 1) + ((*(_DWORD *)(v18 + 76) - *(_DWORD *)(v18 + 84)) >> 1);
  *a7 = *((unsigned __int16 *)v15 + 2) + ((*(_DWORD *)(v18 + 72) - *(_DWORD *)(v18 + 80)) >> 1);
  *a8 = *(_DWORD *)(v18 + 92);
  return result;
}

uint64_t BlockConfigBase::Initialize(BlockConfigBase *this)
{
  uint64_t result = BlockConfigBase::resizeBlockConfigArray(this, 0xAu);
  if (!result) {
    *((unsigned char *)this + 16) = 1;
  }
  return result;
}

uint64_t BlockConfigBase::GetBlockConfPtr(BlockConfigBase *this, unsigned int a2)
{
  if (*((_DWORD *)this + 8) <= a2) {
    return 0;
  }
  else {
    return *(void *)(*((void *)this + 3) + 8 * a2);
  }
}

uint64_t BlockConfigBase::GetNumBlocks(BlockConfigBase *this)
{
  return *((unsigned int *)this + 8);
}

void ConvolutionCodec1_3::ConvDecodeSoft2(ConvolutionCodec1_3 *this, char *a2, const int *a3, int a4, int *a5, int *a6)
{
}

uint64_t CrossCorrInt8_32x32_G(uint64_t result, const signed __int8 *a2, int *a3, unsigned int *a4, unsigned int *a5)
{
  uint64_t v5 = 0;
  *a4 = 0;
  *a5 = 0;
  a3[8] = 0;
  *(_OWORD *)a3 = 0u;
  *((_OWORD *)a3 + 1) = 0u;
  int v6 = a2 + 97;
  do
  {
    for (uint64_t i = 0; i != 32; ++i)
    {
      int v8 = *(char *)(result + i);
      int v9 = a3[1];
      *a3 += v6[i - 48] * v8;
      int v10 = a3[2];
      a3[3] += v6[i - 47] * v8;
      int v11 = a3[7];
      a3[6] += v6[i - 46] * v8;
      a3[1] = v9 + v6[i] * v8;
      int v12 = a3[5];
      a3[4] += v6[i + 1] * v8;
      a3[7] = v11 + v6[i + 2] * v8;
      a3[2] = v10 + v6[i + 48] * v8;
      a3[5] = v12 + v6[i + 49] * v8;
      a3[8] += v6[i + 50] * v8;
      int v13 = v6[i + 1];
      *a4 += v8 * v8;
      *a5 += v13 * v13;
    }
    ++v5;
    result += 32;
    v6 += 48;
  }
  while (v5 != 32);
  return result;
}

uint64_t CorrelateWithTemplate3x3_32x32(const signed __int8 *a1, const signed __int8 *a2, int *a3, unsigned int *a4)
{
  *(void *)int v9 = 0;
  CrossCorrInt8_32x32_G((uint64_t)a1, a2, a3, &v9[1], v9);
  uint64_t result = v9[0];
  if (v9[1]) {
    BOOL v7 = v9[0] == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    *a3 = 0;
    *a4 = 0;
  }
  else
  {
    *a4 = a3[4] / ((v9[1] + 512) >> 10);
    uint64_t result = SquareRoot::sqrt((SquareRoot *)result);
    for (uint64_t i = 0; i != 9; ++i)
      a3[i] = (21 * a3[i] / (int)result) >> 3;
  }
  return result;
}

uint64_t CRCCodec::CheckCRC(uint64_t result, int a2, signed int a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  memset(v13, 0, sizeof(v13));
  if (a3 > 2) {
    return 0;
  }
  uint64_t v3 = dword_228A5E424[a3];
  if (((int)v3 + a2 < 0) ^ __OFADD__(v3, a2) | (v3 + a2 == 0))
  {
    uint64_t v6 = a2;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(&off_26484EF60 + a3);
    uint64_t v6 = a2;
    do
    {
      char v7 = *((unsigned char *)v13 + (v3 - 1));
      uint64_t v8 = (v3 - 1);
      do
      {
        BOOL v9 = v8 <= 1;
        *((unsigned char *)v13 + v8) = (v5[v8] * v7) ^ *((unsigned char *)v13 + (v8 - 1));
        --v8;
      }
      while (!v9);
      if (v4 >= a2) {
        char v10 = *v5 * v7;
      }
      else {
        char v10 = (*v5 * v7) ^ *(unsigned char *)(result + v4);
      }
      LOBYTE(v13[0]) = v10;
      ++v4;
    }
    while (v4 != v3 + a2);
  }
  int v11 = (unsigned __int8 *)(result + v6);
  LOBYTE(result) = 1;
  do
  {
    int v12 = *v11++;
    uint64_t result = (v12 == *((unsigned __int8 *)&v13[-1] + v3-- + 15)) & result;
  }
  while (v3);
  return result;
}

BOOL CRCCodec::AppendEncodedCRC(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  memset(v14, 0, sizeof(v14));
  if (a3 <= 2)
  {
    uint64_t v3 = dword_228A5E424[a3];
    if (((int)v3 + a2 < 0) ^ __OFADD__(v3, a2) | (v3 + a2 == 0))
    {
      uint64_t v6 = a2;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v5 = *(&off_26484EF60 + (int)a3);
      uint64_t v6 = a2;
      do
      {
        char v7 = *((unsigned char *)v14 + (v3 - 1));
        uint64_t v8 = (v3 - 1);
        uint64_t v9 = v8;
        if (v4 >= a2)
        {
          do
          {
            BOOL v10 = v9 <= 1;
            *((unsigned char *)v14 + v9) = (v5[v9] * v7) ^ *((unsigned char *)v14 + (v9 - 1));
            --v9;
          }
          while (!v10);
          char v11 = *v5 * v7;
        }
        else
        {
          do
          {
            BOOL v10 = v8 <= 1;
            *((unsigned char *)v14 + v8) = (v5[v8] * v7) ^ *((unsigned char *)v14 + (v8 - 1));
            --v8;
          }
          while (!v10);
          char v11 = (*v5 * v7) ^ *(unsigned char *)(a1 + v4);
        }
        LOBYTE(v14[0]) = v11;
        ++v4;
      }
      while (v4 != v3 + a2);
    }
    int v12 = (unsigned char *)(a1 + v6);
    do
      *v12++ = *((unsigned char *)&v14[-1] + v3-- + 15);
    while (v3);
  }
  return a3 < 3;
}

void Decode::~Decode(Decode *this)
{
  uint64_t v2 = *((void *)this + 8);
  if (v2) {
    MEMORY[0x22A6A46F0](v2, 0x1000C8052888210);
  }
  uint64_t v3 = *((void *)this + 13);
  if (v3) {
    MEMORY[0x22A6A46F0](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 15);
  if (v4) {
    MEMORY[0x22A6A46F0](v4, 0x1000C80BDFB0063);
  }
  uint64_t v5 = (TailbiteConvCode **)*((void *)this + 3);
  if (v5)
  {
    TailbiteConvCode924::~TailbiteConvCode924(v5);
    MEMORY[0x22A6A4700]();
  }
  uint64_t v6 = (TailbiteConvCode **)*((void *)this + 4);
  if (v6)
  {
    TailbiteConvCode924::~TailbiteConvCode924(v6);
    MEMORY[0x22A6A4700]();
  }
  char v7 = (TailbiteConvCode **)*((void *)this + 5);
  if (v7)
  {
    TailbiteConvCode924::~TailbiteConvCode924(v7);
    MEMORY[0x22A6A4700]();
  }
  uint64_t v8 = (TailbiteConvCode **)*((void *)this + 6);
  if (v8)
  {
    TailbiteConvCode924::~TailbiteConvCode924(v8);
    MEMORY[0x22A6A4700]();
  }
  if (*(void *)this) {
    MEMORY[0x22A6A4700](*(void *)this, 0x1050C40C62AA19FLL);
  }
  uint64_t v9 = *((void *)this + 1);
  if (v9) {
    MEMORY[0x22A6A4700](v9, 0x1050C40C62AA19FLL);
  }
}

void Decode::Initialize(Decode *this, CMCKeyChain *a2)
{
  *((void *)this + 14) = a2;
  operator new[]();
}

uint64_t Decode::SetParamsExtensible(Decode *this, int a2)
{
  uint64_t v2 = *((void *)this + 1);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)this;
  if (!*(void *)this) {
    return 0;
  }
  *((_DWORD *)this + 22) = 4;
  *(_DWORD *)uint64_t v2 = 5;
  *(void *)(v2 + 8) = &Decode::I4optrampInterval;
  *(void *)(v2 + 16) = &Decode::R4optrampAmount;
  switch(a2)
  {
    case 5:
      uint64_t v4 = 0;
      *(void *)((char *)this + 92) = 0x2000000005;
      *((_DWORD *)this + 25) = 1;
      *((void *)this + 10) = 0x100000018;
      uint64_t v5 = &Decode::RKE32_24_V5_calc;
      uint64_t v6 = &Decode::IKE32_24_V5_calc;
      __int16 v7 = 9;
      goto LABEL_12;
    case 6:
      uint64_t v4 = 0;
      *(void *)((char *)this + 92) = 0x4000000006;
      *((_DWORD *)this + 25) = 2;
      *((void *)this + 10) = 0x100000018;
      uint64_t v5 = &Decode::RKE64_24_V6_calc;
      uint64_t v6 = &Decode::IKE64_24_V6_calc;
      __int16 v7 = 8;
      goto LABEL_12;
    case 7:
      *(void *)((char *)this + 92) = 0x2F00000007;
      *((_DWORD *)this + 25) = 2;
      *((void *)this + 10) = 0x100000018;
      uint64_t v4 = *((void *)this + 3);
      goto LABEL_11;
    case 8:
      *(void *)((char *)this + 92) = 0x4000000008;
      *((_DWORD *)this + 25) = 2;
      *((void *)this + 10) = 0x200000020;
      uint64_t v4 = *((void *)this + 4);
      goto LABEL_11;
    case 9:
      *(void *)((char *)this + 92) = 0x6200000009;
      *((_DWORD *)this + 25) = 4;
      *((void *)this + 10) = 0x200000020;
      uint64_t v4 = *((void *)this + 5);
      goto LABEL_11;
    case 10:
      *(void *)((char *)this + 92) = 0x7D0000000ALL;
      *((_DWORD *)this + 25) = 4;
      *((void *)this + 10) = 0x100000018;
      uint64_t v4 = *((void *)this + 6);
LABEL_11:
      uint64_t v5 = &Decode::RKE_IDENT_calc;
      uint64_t v6 = &Decode::IKE_IDENT_calc;
      __int16 v7 = 1;
LABEL_12:
      *((void *)this + 7) = v4;
      *(_WORD *)uint64_t v3 = v7;
      *(void *)(v3 + 8) = v6;
      *(void *)(v3 + 16) = v5;
      uint64_t result = 1;
      *(_WORD *)(v3 + 2) = 100;
      break;
    default:
      return 0;
  }
  return result;
}

uint64_t Decode::ValidateKeyChain(Decode *this)
{
  uint64_t v1 = *((void *)this + 14);
  if (*(int *)(v1 + 8) < 1) {
    return 1;
  }
  uint64_t v3 = 0;
  uint64_t v4 = MEMORY[0x263EF8318];
LABEL_3:
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)(*(void *)(v1 + 8 * v3 + 16) + 16);
  while (1)
  {
    uint64_t v7 = *(unsigned __int8 *)(v6 + v5);
    uint64_t result = *(char *)(v6 + v5) < 0 ? __maskrune(v7, 0x40000uLL) : *(_DWORD *)(v4 + 4 * v7 + 60) & 0x40000u;
    if (!result) {
      return result;
    }
    if (++v5 == 4)
    {
      ++v3;
      uint64_t v1 = *((void *)this + 14);
      if (v3 < *(int *)(v1 + 8)) {
        goto LABEL_3;
      }
      return 1;
    }
  }
}

uint64_t Decode::XORExtractedWithKey(Decode *this, __int16 *a2, int a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *(void *)(*(void *)(*((void *)this + 14) + 8 * a3 + 16) + 16);
  do
  {
    uint64_t v5 = 0;
    char v6 = *(unsigned char *)(v3 + v4 + 8);
    do
    {
      if (v6 < 0) {
        a2[v5] = -a2[v5];
      }
      v6 *= 2;
      ++v5;
    }
    while (v5 != 8);
    ++v3;
    a2 += 8;
  }
  while (v3 != 128);
  return 1;
}

void Decode::GatherDataToDecodeFromSignature(Decode *this, __int16 *a2)
{
}

uint64_t Decode::DoRealWork(Decode *this, __int16 *a2, BOOL *a3)
{
  *a3 = 0;
  *((void *)this + 9) = a2;
  if (!Decode::ValidateKeyChain(this)) {
    return 6;
  }
  if (*(int *)(*((void *)this + 14) + 8) >= 1)
  {
    Decode::XORExtractedWithKey(this, *((__int16 **)this + 9), 0);
    Decode::GatherDataToDecodeFromSignature(this, *((__int16 **)this + 9));
  }
  return 0;
}

uint64_t Decode::ExtractPayloadInfo(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)(result + 100);
  *(_DWORD *)(a2 + 16) = *(_DWORD *)(result + 92);
  *(_DWORD *)(a2 + 20) = v2;
  if (v2 >= 1)
  {
    int v3 = 0;
    int v4 = 0;
    int v5 = *(_DWORD *)(result + 96);
    do
    {
      if (v5 << 16 >= 0x200000) {
        int v6 = 32;
      }
      else {
        int v6 = (__int16)v5;
      }
      if (v6 < 1)
      {
        int v9 = 0;
      }
      else
      {
        int v7 = 0;
        int v8 = 0;
        int v9 = 0;
        int v10 = 32 * v3;
        do
        {
          int v11 = *(unsigned __int8 *)(*(void *)(result + 104) + v7 + v10);
          int v12 = 1 << v7;
          if (!v11) {
            int v12 = 0;
          }
          v9 += v12;
          int v7 = (__int16)++v8;
        }
        while (v6 > (__int16)v8);
      }
      int v5 = (__int16)v5 - 32;
      *(_DWORD *)(a2 + 4 * (__int16)v4++ + 24) = v9;
      int v3 = (__int16)v4;
    }
    while (*(_DWORD *)(result + 100) > (__int16)v4);
  }
  return result;
}

uint64_t Demodulator::GenBitLut(Demodulator *this)
{
  uint64_t v1 = 0;
  v16[1] = *MEMORY[0x263EF8340];
  v16[0] = 0x124095809200FFFLL;
  uint64_t v2 = *((void *)this + 1);
  int v3 = (_WORD *)(v2 + 32766);
  *(_WORD *)uint64_t v2 = 0;
  do
  {
    unint64_t v4 = (v1 + 1);
    unsigned int v5 = v4 >> 6;
    uint64_t v6 = (v4 >> 6) & 1;
    __int16 v7 = *(_WORD *)((unint64_t)v16 & 0xFFFFFFFFFFFFFFFDLL | (2 * (v5 & 1)));
    *(_WORD *)(v2 + 2 + 2 * v1) = v7 >> 1;
    __int16 v8 = 2 * v7;
    if ((v7 & 0x800) != 0) {
      v8 ^= __const__ZN11Demodulator9GenBitLutEv_taps[v6];
    }
    *(_WORD *)((unint64_t)v16 | (2 * v6)) = v8;
    ++v1;
  }
  while (v1 != 8190);
  uint64_t v9 = 0;
  *(_DWORD *)(v2 + 16382) = 0;
  uint64_t v10 = v2 + 16386;
  do
  {
    unint64_t v11 = ((unint64_t)(v9 + 8193) >> 6) & 1 | 2;
    int v12 = (__int16 *)((unint64_t)v16 | (2 * v11));
    __int16 v13 = *v12;
    *(_WORD *)(v10 + 2 * v9) = *v12 >> 1;
    __int16 v14 = 2 * v13;
    if ((v13 & 0x800) != 0) {
      v14 ^= __const__ZN11Demodulator9GenBitLutEv_taps[v11];
    }
    *int v12 = v14;
    ++v9;
  }
  while (v9 != 8190);
  _WORD *v3 = 0;
  return 0x4000;
}

uint64_t Demodulator::Demodulate(Demodulator *this, __int16 *a2, __int16 *a3, unsigned int a4, int a5, int a6)
{
  if (!*((unsigned char *)this + 16))
  {
    if (!*((void *)this + 1)) {
      operator new[]();
    }
    Demodulator::GenBitLut(this);
    *((unsigned char *)this + 16) = 1;
  }
  if ((int)a4 >= 1)
  {
    uint64_t v12 = 0;
    int v13 = (a4 >> 1) + 127;
    uint64_t v14 = *((void *)this + 1);
    unsigned int v15 = a6 - (a4 >> 1) + ((v13 - a6 + ((a6 - (a4 >> 1)) & ~((int)(a6 - (a4 >> 1)) >> 31))) & 0xFFFFFF80);
    int v16 = *((_DWORD *)this + 5);
    int v17 = *((_DWORD *)this + 6);
    do
    {
      if ((int)(v15 + v12) <= 0) {
        int v18 = -(-(v15 + v12) & 0x7F);
      }
      else {
        int v18 = (v15 + v12) & 0x7F;
      }
      int v19 = v18 << 7;
      signed int v20 = a5 + ((v13 - a5 + ((a5 - (a4 >> 1)) & ~((int)(a5 - (a4 >> 1)) >> 31))) & 0xFFFFFF80) - (a4 >> 1);
      unsigned int v21 = a3;
      uint64_t v22 = a4;
      do
      {
        if (v20 <= 0) {
          int v23 = -(-v20 & 0x7F);
        }
        else {
          int v23 = v20 & 0x7F;
        }
        int v24 = *(unsigned __int16 *)(v14 + 2 * (v23 + v19));
        int v25 = v17 & v24;
        int v27 = (unsigned __int16)*v21++;
        int v26 = v27;
        BOOL v28 = v16 <= v24;
        __int16 v29 = a2[v17 & v24];
        if (!v28) {
          int v26 = -v26;
        }
        a2[v25] = v26 + v29;
        ++v20;
        --v22;
      }
      while (v22);
      ++v12;
      a3 += a4;
    }
    while (v12 != a4);
  }
  return 0;
}

void Demodulator::~Demodulator(Demodulator *this)
{
  *(void *)this = &unk_26DD17F40;
  uint64_t v1 = *((void *)this + 1);
  if (v1) {
    MEMORY[0x22A6A46F0](v1, 0x1000C80BDFB0063);
  }
}

{
  uint64_t v1;
  uint64_t vars8;

  *(void *)this = &unk_26DD17F40;
  uint64_t v1 = *((void *)this + 1);
  if (v1) {
    MEMORY[0x22A6A46F0](v1, 0x1000C80BDFB0063);
  }
  JUMPOUT(0x22A6A4700);
}

void DetectStage::~DetectStage(DetectStage *this)
{
  *(void *)this = &unk_26DD17F70;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    MEMORY[0x22A6A46F0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    MEMORY[0x22A6A46F0](v3, 0x1000C80BDFB0063);
  }
  uint64_t v4 = *((void *)this + 5);
  if (v4) {
    MEMORY[0x22A6A46F0](v4, 0x1000C80BDFB0063);
  }
  uint64_t v5 = *((void *)this + 6);
  if (v5) {
    MEMORY[0x22A6A46F0](v5, 0x1000C8077774924);
  }
  uint64_t v6 = *((void *)this + 7);
  if (v6) {
    MEMORY[0x22A6A46F0](v6, 0x1000C8077774924);
  }
}

{
  uint64_t vars8;

  DetectStage::~DetectStage(this);
  JUMPOUT(0x22A6A4700);
}

uint64_t DetectStage::DoFirstStage(uint64_t a1, unsigned __int8 *a2, unsigned int a3, _DWORD *a4, uint64_t a5, unsigned int *a6)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32)) {
    operator new[]();
  }
  if (!*(void *)(a1 + 40)) {
    operator new[]();
  }
  if (!*(void *)(a1 + 24)) {
    operator new[]();
  }
  uint64_t v9 = *(signed __int8 **)(a1 + 56);
  if (!v9) {
    operator new[]();
  }
  if (!*(void *)(a1 + 48)) {
    operator new[]();
  }
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = v9;
  *(void *)(a1 + 80) = v9;
  *(_DWORD *)(a1 + 20) = 0;
  if (*a4 == 1) {
    octaxis_O((uint64_t)a2, 128, 128, a3, v9);
  }
  else {
    octaxis_128x128_YUV422_G(a2, a3, v9);
  }
  fft2_i16_r128x128_G(*(const signed __int8 **)(a1 + 64), *(__int16 **)(a1 + 32), *(unsigned __int8 **)(a1 + 24), *(unsigned __int16 **)(a1 + 40));
  FilterFMag_65x128_G(*(const unsigned __int16 **)(a1 + 40), *(unsigned __int8 **)(a1 + 72));
  if (a6)
  {
    uint64_t v10 = (void (*)(void))*((void *)a6 + 1);
    if (v10) {
      v10(*a6);
    }
    unint64_t v11 = (unsigned char *)*((void *)a6 + 2);
    if (v11)
    {
      if (*v11) {
        return 9;
      }
    }
  }
  bzero(*(void **)(a1 + 48), 0x8340uLL);
  uint64_t v12 = *(void *)(a1 + 72);
  int v13 = (const unsigned __int16 *)&LP_UL2x2SrcIndex[160 * *(unsigned __int16 *)(a1 + 100)];
  uint64_t v14 = (const unsigned __int8 *)&LP_Top1x2InterpKernelQ8 + 320 * *(unsigned __int16 *)(a1 + 100);
  unsigned int v15 = (const unsigned __int8 *)&LP_Bottom1x2InterpKernelQ8 + 320 * *(unsigned __int16 *)(a1 + 100);
  int v16 = (unsigned __int8 *)(*(void *)(a1 + 48) + 320 * *(unsigned __int16 *)(a1 + 100));
  unsigned int v17 = *(unsigned __int16 *)(a1 + 102);
  v45[0][0] = 0;
  LogPolarRemap_G(v12, v13, v14, v15, 0x80u, v16, v17, 0xA0u, (unsigned int *)v45);
  unsigned int v18 = v45[0][0];
  if (a6)
  {
    int v19 = (void (*)(void))*((void *)a6 + 1);
    if (v19) {
      v19(*a6);
    }
    signed int v20 = (unsigned char *)*((void *)a6 + 2);
    if (v20)
    {
      if (*v20) {
        return 9;
      }
    }
  }
  unsigned int v21 = (4 * v18) | 2;
  unsigned int v22 = 160 * v17;
  uint64_t v23 = *(unsigned __int16 *)(a1 + 96);
  int v24 = (const unsigned __int8 *)(*(void *)(a1 + 48) + 320 * v23);
  uint64_t v25 = *(unsigned __int16 *)(a1 + 98);
  int v26 = (const unsigned __int8 *)&IMF_pGridIndSearchRange + 2 * v23;
  int v27 = (const unsigned __int16 *)((char *)&IMF_pEqualPolynom2Q9Q10 + 4 * v23);
  BOOL v28 = *(unsigned __int16 **)(a1 + 80);
  int v29 = v21 / v22;
  if (v25 <= 0x68) {
    bzero(&v28[160 * *(unsigned __int16 *)(a1 + 98)], 320 * (105 - v25));
  }
  ImpulseMatchedFilter_O(v24, v25, IMF_pRelativeGridIndices, v26, v28, v27, (unsigned __int16)v29);
  if (a6)
  {
    uint64_t v30 = (void (*)(void))*((void *)a6 + 1);
    if (v30) {
      v30(*a6);
    }
    uint64_t v31 = (unsigned char *)*((void *)a6 + 2);
    if (v31)
    {
      if (*v31) {
        return 9;
      }
    }
  }
  findKPeaks2x1Blocks8x16AndRefine(*(unsigned __int16 **)(a1 + 80), (*(unsigned __int16 *)(a1 + 98) + 6) >> 3, 10, v48, v49, v47, 0xAu, 9u, 6u, *(unsigned __int8 **)(a1 + 24));
  uint64_t v34 = 0;
  int v35 = 8 * *(unsigned __int16 *)(a1 + 96);
  do
    v48[v34++] += v35;
  while (v34 != 10);
  uint64_t v36 = 0;
  int v37 = (unsigned int *)v45;
  do
  {
    DetectStage::CalculateXform((DetectStage *)v37, (int (*)[4])v48[v36], v49[v36], (uint64_t)&unk_228A771B8, v33);
    ++v36;
    v37 += 4;
  }
  while (v36 != 10);
  FMagCorrelation_G((uint64_t)v46, *(const unsigned __int16 **)(a1 + 40), 10, v45, CGridLuts::m_GridX, CGridLuts::m_GridY);
  int v39 = 0;
  uint64_t v40 = 1;
  int v41 = v46[0];
  do
  {
    if (v46[v40] > v41)
    {
      int v39 = v40;
      int v41 = v46[v40];
    }
    ++v40;
  }
  while (v40 != 10);
  *(_DWORD *)(a1 + 20) = v46[v39];
  unsigned int v42 = v49[v39];
  int v43 = v48[v39];
  *(_OWORD *)(a5 + 16) = *(_OWORD *)&v45[v39][0];
  int v44 = DetectStage::CalculateXform((DetectStage *)a5, (int (*)[4])(840 - v43), v42, (uint64_t)&IMF_pIMFLogSpaceToScaleQ13, v38);
  uint64_t result = 0;
  *(_DWORD *)(a5 + 32) = v44;
  *(_DWORD *)(a5 + 36) = (int)(v42 << 11) / 160 - 0x2000;
  return result;
}

uint64_t DetectStage::CalculateXform(DetectStage *this, int (*a2)[4], unsigned int a3, uint64_t a4, const unsigned __int16 *a5)
{
  int v5 = *(__int16 *)(a4 + ((uint64_t)((unint64_t)(a2 >> 3) << 48) >> 47));
  __int16 v6 = v5 + ((IMF_pScaleFractQ16[a2 & 7] * v5 + 0x8000) >> 16);
  uint64_t v7 = (uint64_t)((unint64_t)(a3 >> 3) << 48) >> 47;
  int v8 = *(__int16 *)((char *)&LP_pSinPolarSpaceQ14 + v7);
  LOWORD(v7) = *(_WORD *)((char *)&LP_pCosPolarSpaceQ14 + v7);
  int v9 = IMF_p1mCosFractQ16[a3 & 7];
  int v10 = IMF_pSinFractQ16[a3 & 7];
  int v11 = (__int16)-(__int16)v7;
  int v12 = v9 * v8 - v10 * v11 + 0x8000;
  LOWORD(v10) = ((v10 * v8 + v9 * v11 + 0x8000) >> 16) - v7;
  uint64_t v13 = v6;
  LODWORD(v7) = ((__int16)(v8 + HIWORD(v12)) * (int)v13 + 64) >> 7;
  int v14 = (__int16)v10 * v13 + 64;
  *(_DWORD *)this = v7;
  *((_DWORD *)this + 1) = -(v14 >> 7);
  *((_DWORD *)this + 2) = v14 >> 7;
  *((_DWORD *)this + 3) = v7;
  return v13;
}

uint64_t downsample_2x2_YUV_2Hx32W_G(uint64_t result, unsigned int a2, unsigned __int8 *a3, unsigned int a4, int a5, int a6)
{
  if (a5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    LODWORD(v8) = 16 * a6;
    if ((16 * a6) <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v8;
    }
    uint64_t v10 = 2 * a2;
    uint64_t v11 = 1;
    do
    {
      uint64_t v12 = v6;
      uint64_t v13 = v8;
      uint64_t v14 = v11;
      if (a6)
      {
        do
        {
          a3[v14] = (((*(unsigned __int8 *)(result + a2 + v12 + 3)
                                   + *(unsigned __int8 *)(result + (v12 + 3))) >> 1)
                                 + ((*(unsigned __int8 *)(result + a2 + v12 + 1)
                                   + *(unsigned __int8 *)(result + (v12 & 0xFFFFFFFE) + 1)) >> 1)) >> 1;
          v14 += 2;
          v12 += 4;
          --v13;
        }
        while (v13);
      }
      ++v7;
      v11 += a4;
      v6 += v10;
    }
    while (v7 != a5);
  }
  return result;
}

uint64_t downsample_3x3_YUV_3Hx24W_G(uint64_t result, unsigned int a2, unsigned __int8 *a3, unsigned int a4, unsigned int a5, int a6)
{
  if (a5)
  {
    unsigned int v6 = 0;
    uint64_t v7 = 0;
    LODWORD(v8) = 8 * a6;
    uint64_t v9 = a4;
    unsigned int v10 = 2 * a2;
    if ((8 * a6) <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v8;
    }
    uint64_t v11 = result + 5;
    uint64_t v12 = result + 3;
    uint64_t v13 = 1;
    uint64_t v14 = a5;
    uint64_t result = 3 * a2;
    do
    {
      if (a6)
      {
        unsigned int v15 = (unsigned __int8 *)(v11 + v6);
        int v16 = (unsigned __int8 *)(v12 + v10);
        uint64_t v17 = v8;
        uint64_t v18 = v13;
        int v19 = (unsigned __int8 *)(v11 + a2);
        do
        {
          int v20 = *(v15 - 2) + *(v15 - 4);
          int v21 = *v15;
          v15 += 6;
          int v22 = v20 + v21 + *(v19 - 4);
          int v23 = *(v19 - 2);
          int v24 = *v19;
          v19 += 6;
          a3[v18] = (7282 * (v22 + v23 + v24 + *(v16 - 2) + *v16 + v16[2])) >> 16;
          v18 += 2;
          v16 += 6;
          --v17;
        }
        while (v17);
      }
      ++v7;
      v13 += v9;
      v6 += result;
      v10 += result;
      a2 += result;
    }
    while (v7 != v14);
  }
  return result;
}

void EmbedKE::~EmbedKE(EmbedKE *this)
{
  uint64_t v2 = *((void *)this + 4);
  if (v2) {
    MEMORY[0x22A6A46F0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 1);
  if (v3) {
    MEMORY[0x22A6A46F0](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 2);
  if (v4) {
    MEMORY[0x22A6A46F0](v4, 0x1000C8077774924);
  }
  uint64_t v5 = *((void *)this + 3);
  if (v5) {
    MEMORY[0x22A6A46F0](v5, 0x1000C8077774924);
  }
}

void EmbedKE::encodePayloadIntoSignature(EmbedKE *this, unsigned __int8 *a2)
{
  for (uint64_t i = 0; i != 1024; ++i)
    *(unsigned char *)(*((void *)this + 2) + i) = 0;
  uint64_t v4 = *((void *)this + 2);
  *(_OWORD *)(v4 + 32) = xmmword_228A77604;
  *(_OWORD *)(v4 + 48) = unk_228A77614;
  *(_OWORD *)(v4 + 64) = xmmword_228A77624;
  *(_OWORD *)(v4 + 80) = unk_228A77634;
  *(_OWORD *)uint64_t v4 = EmbedKE::kFixedPatternV10;
  *(_OWORD *)(v4 + 16) = unk_228A775F4;
  *(_DWORD *)(v4 + 96) = 0;
  memcpy(*((void **)this + 4), a2, *(unsigned int *)this);
  CRCCodec::AppendEncodedCRC(*((void *)this + 4), *(_DWORD *)this, 1u);
  uint64_t v5 = 0;
  v6[0] = 0;
  *(void *)((char *)v6 + 6) = 0;
  TailbiteConvCode924::Init((TailbiteConvCode924 *)&v5, (unsigned __int16)(*(_WORD *)this + 24), 9);
}

void sub_228A46820(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  TailbiteConvCode924::~TailbiteConvCode924((TailbiteConvCode **)va);
  _Unwind_Resume(a1);
}

uint64_t EmbedKE::createPM1PayloadTileFromSignature(EmbedKE *this)
{
  uint64_t result = EmbedKE::decompressKEKey(this, "MOOF");
  if (!result)
  {
    for (uint64_t i = 0; i != 1024; ++i)
      *(unsigned char *)(*((void *)this + 2) + i) ^= *(unsigned char *)(*((void *)this + 3) + i);
    for (uint64_t j = 0; j != 0x4000; ++j)
      *(unsigned char *)(*((void *)this + 1) + j) = (EmbedKE::kBitLUT[j] > 0x3FFu) ^ (*(unsigned char *)(*((void *)this + 2)
                                                                                         + (EmbedKE::kBitLUT[j] & 0x3FF)) == 0);
    for (uint64_t k = 0; k != 0x4000; ++k)
      *(unsigned char *)(*((void *)this + 1) + k) = 2 * *(unsigned char *)(*((void *)this + 1) + k) - 1;
    return 0;
  }
  return result;
}

uint64_t EmbedKE::decompressKEKey(EmbedKE *this, const unsigned __int8 *a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = MEMORY[0x263EF8318];
  do
  {
    uint64_t v6 = a2[v4];
    if ((char)a2[v4] < 0)
    {
      if (!__maskrune(v6, 0x40000uLL)) {
        return 5;
      }
    }
    else if ((*(_DWORD *)(v5 + 4 * v6 + 60) & 0x40000) == 0)
    {
      return 5;
    }
    ++v4;
  }
  while (v4 != 4);
  int v7 = *((_DWORD *)a2 + 1);
  if (v7 == 0x40000 || v7 == 1024)
  {
    uint64_t v8 = 0;
    int v9 = 0;
    unsigned int v10 = a2 + 8;
    do
    {
      uint64_t v11 = 0;
      int v12 = *v10;
      do
      {
        *(unsigned char *)(*((void *)this + 3) + v8 + v11) = (v12 & 0x80) != 0;
        v12 *= 2;
        ++v11;
      }
      while (v11 != 8);
      ++v10;
      ++v9;
      v8 += 8;
    }
    while (v9 != 128);
  }
  return 0;
}

void EmbedKE::InitWithPayload(EmbedKE *this, unsigned __int8 *a2, int a3)
{
  *(_DWORD *)this = a3;
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    MEMORY[0x22A6A46F0](v3, 0x1000C8077774924);
  }
  operator new[]();
}

uint64_t EmbedKE::OutputWmAsHFloats(EmbedKE *this, char *a2, int a3, int a4, unsigned int a5, unsigned int a6, unsigned int a7, float a8, float a9, float a10, float a11, float a12, float _S5)
{
  if (!a2) {
    return 3;
  }
  if (a7 > a5) {
    return 0;
  }
  int v14 = 0;
  float v15 = a10 / 255.0;
  __asm { FCVT            H5, S5 }
  int v21 = a6 / a7;
  if (a6 / a7 <= 1) {
    int v21 = 1;
  }
  float v22 = a11 / 255.0;
  int v23 = a5 / a7;
  if (a5 / a7 <= 1) {
    int v23 = 1;
  }
  float v24 = a12 / 255.0;
  do
  {
    if (a7 <= a6)
    {
      int v25 = 0;
      int v26 = 0;
      uint64_t v27 = *((void *)this + 1);
      do
      {
        uint64_t v28 = 0;
        float v29 = (float)((float)*(char *)(v27 + (v26 & 0x7F | ((v14 & 0x7F) << 7))) * a9)
            + (float)(a8 * EmbedKE::kGridTile128x128[v26 & 0x7F | ((v14 & 0x7F) << 7)]);
        do
        {
          float v30 = v29 * EmbedKE::kBumpShapes[4 * a7 - 4 + v28];
          uint64_t v31 = &EmbedKE::kBumpShapes[4 * a7 - 4];
          int v32 = v25;
          uint64_t v33 = a7;
          do
          {
            float v34 = *v31++;
            int v35 = &a2[2 * (v14 * a7 + v28) * a4 + 2 * v32];
            _S17 = v15 * (float)(v30 * v34);
            __asm { FCVT            H17, S17 }
            *(_WORD *)int v35 = LOWORD(_S17);
            _S17 = v22 * (float)(v30 * v34);
            __asm { FCVT            H17, S17 }
            *((_WORD *)v35 + 1) = LOWORD(_S17);
            _S16 = v24 * (float)(v30 * v34);
            __asm { FCVT            H16, S16 }
            *((_WORD *)v35 + 2) = LOWORD(_S16);
            *((_WORD *)v35 + 3) = _H5;
            v32 += a3;
            --v33;
          }
          while (v33);
          ++v28;
        }
        while (v28 != a7);
        ++v26;
        v25 += a3 * a7;
      }
      while (v26 != v21);
    }
    ++v14;
  }
  while (v14 != v23);
  return 0;
}

uint64_t fft8_i16_col2(const signed __int8 *a1, __int16 *a2)
{
  uint64_t v2 = 0;
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1 + 1;
  do
  {
    *(&v51 + v2) = 4 * *(v3 - 1);
    *(&v43 + v2++) = 4 * *v3;
    v3 += 2048;
  }
  while (v2 != 8);
  __int16 v4 = v55 + v51;
  __int16 v5 = v47 + v43;
  int v6 = v51 - v55;
  int v7 = v43 - v47;
  __int16 v8 = v56 + v52;
  __int16 v9 = v48 + v44;
  int v10 = v52 - v56;
  int v11 = v44 - v48;
  __int16 v12 = v57 + v53;
  __int16 v13 = v49 + v45;
  int v14 = v53 - v57;
  int v15 = v45 - v49;
  __int16 v16 = v58 + v54;
  __int16 v17 = v50 + v46;
  int v18 = v54 - v58;
  int v19 = v46 - v50;
  __int16 v20 = v12 + v4;
  __int16 v21 = v13 + v5;
  __int16 v22 = v4 - v12;
  __int16 v23 = v5 - v13;
  int v24 = v15 + v6;
  __int16 v25 = v7 - v14;
  int v26 = v6 - v15;
  int v27 = v14 + v7;
  LOWORD(v14) = v16 + v8;
  __int16 v28 = v17 + v9;
  __int16 v29 = v8 - v16;
  __int16 v30 = v9 - v17;
  int v31 = v19 + v10;
  int v32 = v11 - v18;
  int v33 = v10 - v19;
  int v34 = v18 + v11;
  int v35 = 11585 * v31;
  int v36 = -11585 * v32;
  unsigned int v37 = v24 + ((4 * (11585 * v31 - -11585 * v32) + 0x8000) >> 16);
  v32 *= 11585;
  v31 *= -11585;
  __int16 v38 = v30 + v22;
  unsigned int v39 = v26 + ((4 * (-11585 * v33 - -11585 * v34) + 0x8000) >> 16);
  unsigned int v40 = v27 + ((4 * (-11585 * v33 - 11585 * v34) + 0x8000) >> 16);
  __int16 v41 = v22 - v30;
  v33 *= 11585;
  v34 *= 11585;
  uint64_t result = v26 + ((4 * (v33 - v34) + 0x8000) >> 16);
  v60.val[0].i16[0] = v14 + v20;
  v60.val[0].i16[1] = v37;
  v60.val[0].i16[2] = v38;
  v60.val[0].i16[3] = v39;
  v60.val[0].i16[4] = v20 - v14;
  v60.val[0].i16[5] = v24 + ((4 * (v31 - v32) + 0x8000) >> 16);
  v60.val[0].i16[6] = v41;
  v60.val[0].i16[7] = v26 + ((4 * (v33 - v34) + 0x8000) >> 16);
  v60.val[1].i16[0] = v28 + v21;
  v60.val[1].i16[1] = v25 + ((4 * (v31 + v32) + 0x8000) >> 16);
  v60.val[1].i16[2] = v23 - v29;
  v60.val[1].i16[3] = v40;
  v60.val[1].i16[4] = v21 - v28;
  v60.val[1].i16[5] = v25 + ((4 * (v35 + v36) + 0x8000) >> 16);
  v60.val[1].i16[6] = v29 + v23;
  v60.val[1].i16[7] = v27 + ((4 * (v33 + v34) + 0x8000) >> 16);
  vst2q_s16(a2, v60);
  return result;
}

uint64_t fft16_i16_col2(__int16 *a1, int a2, __int16 *a3)
{
  int v5 = 0;
  int v6 = 0;
  uint64_t v7 = 0;
  uint64_t v81 = *MEMORY[0x263EF8340];
  if (a2 - 8 >= 0) {
    int v8 = -((a2 - 8) & 7);
  }
  else {
    int v8 = (8 - a2) & 7;
  }
  __int16 v9 = &a1[2 * v8 + 1];
  int v10 = &a1[2 * a2 + 1];
  do
  {
    int v11 = *(v10 - 1);
    int v12 = *v10;
    if (v5 <= 0) {
      int v13 = -(-v5 & 0x7F);
    }
    else {
      int v13 = v5 & 0x7F;
    }
    int v14 = 2 * v13;
    int v15 = pTwiddleTblQ14[2 * v13];
    int v16 = pTwiddleTblQ14[v14 + 1];
    v80[0].i16[v7] = (v15 * v11 - v16 * v12 + 0x2000) >> 14;
    v79[0].i16[v7] = (v16 * v11 + v15 * v12 + 0x2000) >> 14;
    int v17 = *(v9 - 1);
    int v18 = *v9;
    if (v6 <= 0) {
      int v19 = -(-v6 & 0x7F);
    }
    else {
      int v19 = v6 & 0x7F;
    }
    int v20 = 2 * v19;
    int v21 = pTwiddleTblQ14[2 * v19];
    int v22 = pTwiddleTblQ14[v20 + 1];
    v78[0].i16[v7] = (v21 * v17 - v22 * v18 + 0x2000) >> 14;
    v77[0].i16[v7++] = (v22 * v17 + v21 * v18 + 0x2000) >> 14;
    v6 += v8;
    v5 += a2;
    v9 += 16;
    v10 += 16;
  }
  while (v7 != 16);
  fft16(v80, v79, v76, v75);
  fft16(v78, v77, v73, v71);
  if (a2)
  {
    uint64_t v23 = 0;
    int v24 = &a3[256 * v8 + 2];
    __int16 v25 = &a3[256 * a2 + 1];
    uint64_t v26 = 15;
    do
    {
      int v27 = (unsigned __int16)v73[v26];
      int v28 = (unsigned __int16)v76[v23];
      int v29 = (__int16)(v28 + v27);
      if (v29 < 0) {
        unsigned int v30 = -((1 - (__int16)(v28 + v27)) >> 1);
      }
      else {
        LOWORD(v30) = v29 >> 1;
      }
      int v31 = (unsigned __int16)v71[v26];
      *(v25 - 1) = v30;
      int v32 = (unsigned __int16)v75[v23];
      int v33 = (__int16)(v32 - v31);
      unsigned int v34 = -(-v33 >> 1);
      unsigned int v35 = (v33 + 1) >> 1;
      if ((((_WORD)v32 - (_WORD)v31) & 0x8000) != 0) {
        __int16 v36 = v34;
      }
      else {
        __int16 v36 = v35;
      }
      *__int16 v25 = v36;
      v37.i32[0] = v32 + v31;
      v37.i32[1] = v27 - v28;
      int32x2_t v38 = vshr_n_s32(vshl_n_s32(v37, 0x10uLL), 0x10uLL);
      int8x8_t v39 = vbsl_s8((int8x8_t)vcltz_s32(v38), (int8x8_t)vneg_s32((int32x2_t)vshr_n_u32((uint32x2_t)vsub_s32((int32x2_t)0x100000001, v38), 1uLL)), (int8x8_t)vshr_n_u32((uint32x2_t)v38, 1uLL));
      v25[2] = v39.i16[2];
      v25[1] = v39.i16[0];
      int v40 = (unsigned __int16)v76[v26];
      int v41 = (unsigned __int16)v73[v23];
      int v42 = (__int16)(v41 + v40);
      if (v42 < 0) {
        unsigned int v43 = -((1 - (__int16)(v41 + v40)) >> 1);
      }
      else {
        LOWORD(v43) = v42 >> 1;
      }
      *(v24 - 2) = v43;
      int v44 = (unsigned __int16)v75[v26];
      int v45 = (unsigned __int16)v71[v23];
      int v46 = (__int16)(v45 - v44);
      unsigned int v47 = -(-v46 >> 1);
      uint64_t result = (v46 + 1) >> 1;
      if ((((_WORD)v45 - (_WORD)v44) & 0x8000) != 0) {
        __int16 v49 = v47;
      }
      else {
        __int16 v49 = result;
      }
      *(v24 - 1) = v49;
      v50.i32[0] = v45 + v44;
      v50.i32[1] = v40 - v41;
      int32x2_t v51 = vshr_n_s32(vshl_n_s32(v50, 0x10uLL), 0x10uLL);
      int8x8_t v52 = vbsl_s8((int8x8_t)vcltz_s32(v51), (int8x8_t)vneg_s32((int32x2_t)vshr_n_u32((uint32x2_t)vsub_s32((int32x2_t)0x100000001, v51), 1uLL)), (int8x8_t)vshr_n_u32((uint32x2_t)v51, 1uLL));
      ++v23;
      v24[1] = v52.i16[2];
      __int16 *v24 = v52.i16[0];
      --v26;
      v24 += 2048;
      v25 += 2048;
    }
    while (v23 != 8);
  }
  else
  {
    *a3 = v76[0];
    a3[1] = 0;
    a3[2] = v75[0];
    a3[3] = 0;
    char v53 = a3 + 2050;
    char v54 = (unsigned __int16 *)&v74;
    char v55 = (unsigned __int16 *)&v72;
    for (uint64_t i = 1; i != 9; ++i)
    {
      int v58 = *v54--;
      int v57 = v58;
      int v59 = (unsigned __int16)v76[i];
      int v60 = (__int16)(v59 + v58);
      if (v60 < 0) {
        unsigned int v61 = -((1 - v60) >> 1);
      }
      else {
        LOWORD(v61) = v60 >> 1;
      }
      *(v53 - 2) = v61;
      int v63 = *v55--;
      int v62 = v63;
      int v64 = (unsigned __int16)v75[i];
      int v65 = (__int16)(v64 - v63);
      unsigned int v66 = -(-v65 >> 1);
      uint64_t result = (v65 + 1) >> 1;
      if ((((_WORD)v64 - (_WORD)v63) & 0x8000) != 0) {
        __int16 v67 = v66;
      }
      else {
        __int16 v67 = result;
      }
      *(v53 - 1) = v67;
      v68.i32[0] = v64 + v62;
      v68.i32[1] = v57 - v59;
      int32x2_t v69 = vshr_n_s32(vshl_n_s32(v68, 0x10uLL), 0x10uLL);
      int8x8_t v70 = vbsl_s8((int8x8_t)vcltz_s32(v69), (int8x8_t)vneg_s32((int32x2_t)vshr_n_u32((uint32x2_t)vsub_s32((int32x2_t)0x100000001, v69), 1uLL)), (int8x8_t)vshr_n_u32((uint32x2_t)v69, 1uLL));
      v53[1] = v70.i16[2];
      *char v53 = v70.i16[0];
      v53 += 2048;
    }
  }
  return result;
}

uint64_t fft16(int16x8_t *a1, int16x8_t *a2, __int16 *a3, __int16 *a4)
{
  uint64_t v4 = 0;
  uint64_t v99 = *MEMORY[0x263EF8340];
  int16x8_t v5 = a1[1];
  v100.val[0] = vaddq_s16(v5, *a1);
  v100.val[1] = vsubq_s16(*a1, v5);
  int16x8_t v6 = a2[1];
  v101.val[0] = vaddq_s16(v6, *a2);
  v101.val[1] = vsubq_s16(*a2, v6);
  uint64_t v7 = (__int16 *)v98;
  vst2q_s16(v7, v100);
  int v8 = (__int16 *)v97;
  vst2q_s16(v8, v101);
  uint64_t v9 = 18;
  do
  {
    __int16 v10 = *(_WORD *)&v97[v9 + 14];
    __int16 v11 = *(_WORD *)&v97[v9 + 30];
    int v12 = &a3[v4];
    *int v12 = v11 + v10;
    __int16 v13 = *(_WORD *)&v97[v9 - 18];
    __int16 v14 = *(_WORD *)&v97[v9 - 2];
    int v15 = &a4[v4];
    __int16 *v15 = v14 + v13;
    v12[1] = v10 - v11;
    v15[1] = v13 - v14;
    __int16 v16 = *(_WORD *)&v97[v9 + 16];
    __int16 v17 = *(_WORD *)&v97[v9];
    v12[2] = v17 + v16;
    __int16 v18 = *(_WORD *)&v97[v9 - 16];
    __int16 v19 = *(_WORD *)&v98[v9];
    v15[2] = v18 - v19;
    v12[3] = v16 - v17;
    v4 += 4;
    v9 += 4;
    v15[3] = v19 + v18;
  }
  while (v4 != 16);
  int v20 = a3[11];
  int v21 = a4[11];
  int v22 = (unsigned __int16)a3[3];
  __int16 v23 = v22 + ((4 * (-11585 * v20 - -11585 * v21) + 0x8000) >> 16);
  __int16 v96 = a4[3];
  __int16 v24 = v96 + ((4 * (-11585 * v21 - 11585 * v20) + 0x8000) >> 16);
  int v93 = 11585 * v20;
  int v94 = 11585 * v21;
  int v95 = v22 + ((4 * (11585 * v20 - 11585 * v21) + 0x8000) >> 16);
  int v25 = a3[15];
  int v26 = a4[15];
  int v27 = (unsigned __int16)a3[7];
  __int16 v28 = v27 + ((4 * (-11585 * v25 - -11585 * v26) + 0x8000) >> 16);
  int v29 = (unsigned __int16)a4[7];
  __int16 v30 = v29 + ((4 * (-11585 * v26 - 11585 * v25) + 0x8000) >> 16);
  v25 *= 11585;
  v26 *= 11585;
  int v90 = v29 + ((4 * (v26 + v25) + 0x8000) >> 16);
  int v91 = v27 + ((4 * (v25 - v26) + 0x8000) >> 16);
  unsigned int v31 = 15137 * v30 + 6270 * v28 + 0x2000;
  __int16 v32 = v23 + (v31 >> 14);
  unsigned int v33 = 6270 * v30 + 1073726687 * v28 + 0x2000;
  __int16 v34 = v24 + (v33 >> 14);
  __int16 v35 = v23 - (v31 >> 14);
  int v36 = (unsigned __int16)a3[1];
  int v37 = (unsigned __int16)a4[9];
  __int16 v38 = a3[5];
  __int16 v39 = a4[13];
  __int16 v40 = a4[5];
  __int16 v41 = a3[13];
  __int16 v42 = v24 - (v33 >> 14);
  int v43 = -11585 * (__int16)(v41 + v40);
  int v44 = -11585 * (__int16)(v38 - v39) + 0x2000;
  unsigned int v45 = v36 - v37 + ((v44 - v43) >> 14);
  unsigned int v46 = v36 - v37 - ((v44 - v43) >> 14);
  __int16 v47 = a4[1];
  __int16 v48 = a3[9];
  unsigned int v49 = v43 + v44;
  __int16 v50 = v48 + v47 + (v49 >> 14);
  LOWORD(v26) = v48 + v47 - (v49 >> 14);
  int v51 = (__int16)(v39 + v38);
  int v52 = (__int16)(v40 - v41);
  int v53 = 11585 * v52 + 1073730239 * v51;
  __int16 v54 = a3[8];
  int v55 = v52 + v51;
  __int16 v92 = v54 + *a3;
  __int16 v56 = *a3 - v54;
  LOWORD(v52) = *a4;
  LOWORD(v36) = v37 + v36;
  __int16 v57 = a4[8];
  __int16 v58 = v47 - v48;
  int v59 = a4[10];
  int v60 = (unsigned __int16)a4[2];
  __int16 v61 = a4[4];
  LOWORD(v37) = a4[12];
  int v62 = a4[14];
  LOWORD(v25) = a4[6];
  a3[3] = v32;
  int v63 = (unsigned __int16)a3[2];
  int v64 = a3[10];
  __int16 v65 = a3[4];
  LOWORD(v51) = a3[12];
  LOWORD(v21) = a3[6];
  int v66 = a3[14];
  a4[3] = v34;
  a3[11] = v35;
  a4[11] = v42;
  a3[6] = v45;
  a4[6] = v50;
  a3[14] = v46;
  a4[14] = v26;
  unsigned int v67 = 11585 * v55 + 0x2000;
  a3[2] = v36 + (v67 >> 14);
  a4[2] = v58 + ((v53 + 0x2000) >> 14);
  a3[10] = v36 - (v67 >> 14);
  __int16 v68 = v57 + v52;
  __int16 v69 = v52 - v57;
  a4[10] = v58 - ((v53 + 0x2000) >> 14);
  unsigned int v70 = 6270 * (__int16)v90 + 1073726687 * (__int16)v91 + 0x2000;
  a3[7] = v95 + (v70 >> 14);
  unsigned int v71 = 1073726687 * (__int16)v90 + 1073735554 * (__int16)v91 + 0x2000;
  LOWORD(v67) = v96 + ((4 * (v94 + v93) + 0x8000) >> 16);
  a4[7] = v67 + (v71 >> 14);
  a3[15] = v95 - (v70 >> 14);
  int v72 = 11585 * v64;
  LOWORD(v71) = v67 - (v71 >> 14);
  int v73 = -11585 * v59;
  v59 *= 11585;
  uint64_t result = (-11585 * v64);
  a4[15] = v71;
  int v75 = 11585 * v66;
  int v76 = 11585 * v62;
  v62 *= -11585;
  v66 *= -11585;
  int v77 = v76 + v66;
  int v78 = v66 - v76;
  int v79 = v75 - v62;
  int v80 = (__int16)(v21 + ((4 * v78 + 0x8000) >> 16));
  int v81 = (__int16)(v25 + ((4 * (v62 + v75) + 0x8000) >> 16));
  unsigned int v82 = 1073735554 * v81 + 1073726687 * v80;
  unsigned int v83 = 15137 * v81 + 1073735554 * v80;
  LOWORD(v80) = v21 + ((4 * v79 + 0x8000) >> 16);
  v83 += 0x2000;
  LOWORD(v21) = v63 + ((4 * (result - v59) + 0x8000) >> 16);
  a3[5] = v21 + (v83 >> 14);
  int v84 = (__int16)(v25 + ((4 * v77 + 0x8000) >> 16));
  int v85 = 6270 * v84 + 15137 * (__int16)v80;
  unsigned int v86 = 15137 * v84 + 1073735554 * (__int16)v80;
  v82 += 0x2000;
  int v87 = v60 + ((4 * (v73 + v72) + 0x8000) >> 16);
  a4[5] = v87 + (v82 >> 14);
  a3[13] = v21 - (v83 >> 14);
  a4[13] = v87 - (v82 >> 14);
  int v88 = v63 + ((4 * (v72 - v73) + 0x8000) >> 16);
  a3[1] = v88 + ((v85 + 0x2000) >> 14);
  v86 += 0x2000;
  int v89 = v60 + ((4 * (v59 + result) + 0x8000) >> 16);
  a4[1] = v89 + (v86 >> 14);
  a3[9] = v88 - ((v85 + 0x2000) >> 14);
  a4[9] = v89 - (v86 >> 14);
  *a3 = v51 + v65 + v92;
  *a4 = v37 + v61 + v68;
  a3[8] = v92 - (v51 + v65);
  a4[8] = v68 - (v37 + v61);
  a3[4] = v61 - v37 + v56;
  a4[4] = v69 - (v65 - v51);
  a3[12] = v56 - (v61 - v37);
  a4[12] = v65 - v51 + v69;
  return result;
}

uint64_t fft128_i16_col2(const signed __int8 *a1, __int16 *a2, __int16 *a3)
{
  for (uint64_t i = 0; i != 256; i += 16)
  {
    fft8_i16_col2(a1, &a3[i]);
    a1 += 128;
  }
  for (int j = 0; j != 5; ++j)
    uint64_t result = fft16_i16_col2(a3, (__int16)j, a2);
  return result;
}

uint64_t fft8_i16_row(const __int16 *a1, __int16 a2, int a3, __int16 *a4)
{
  uint64_t v4 = 0;
  uint64_t v46 = *MEMORY[0x263EF8340];
  int16x8_t v5 = &a1[(__int16)((a2 << 8) + 2 * a3) + 1];
  do
  {
    *(unsigned __int16 *)((char *)&v38 + v4) = *(v5 - 1);
    __int16 v6 = *v5;
    v5 += 32;
    *(__int16 *)((char *)&v30 + v4) = v6;
    v4 += 2;
  }
  while (v4 != 16);
  int v7 = v42 + v38;
  int v8 = v38 - v42;
  int v9 = v44 + v40;
  int v10 = v32 - v36;
  __int16 v11 = v9 + v7;
  __int16 v12 = v36 + v32 + v34 + v30;
  uint64_t result = (v7 - v9);
  __int16 v14 = v34 + v30 - (v36 + v32);
  int v15 = v10 + v8;
  __int16 v16 = v30 - v34 - (v40 - v44);
  LOWORD(v10) = v8 - v10;
  LOWORD(v8) = v40 - v44 + v30 - v34;
  __int16 v17 = v45 + v41 + v43 + v39;
  __int16 v18 = v37 + v33 + v35 + v31;
  __int16 v19 = v43 + v39 - (v45 + v41);
  __int16 v20 = v35 + v31 - (v37 + v33);
  int v21 = (__int16)(v33 - v37 + v39 - v43);
  int v22 = 11585 * v21;
  int v23 = (__int16)(v31 - v35 - (v41 - v45));
  int v24 = -11585 * v23;
  unsigned int v25 = v15 + ((4 * (11585 * v21 - -11585 * v23) + 0x8000) >> 16);
  v23 *= 11585;
  v21 *= -11585;
  int v26 = (__int16)(v39 - v43 - (v33 - v37));
  int v27 = -11585 * v26;
  int v28 = (__int16)(v41 - v45 + v31 - v35);
  v26 *= 11585;
  v47.val[0].i16[0] = v17 + v11;
  v47.val[0].i16[1] = v25;
  v47.val[0].i16[2] = v20 + result;
  v47.val[0].i16[3] = v10 + ((4 * (v27 - -11585 * v28) + 0x8000) >> 16);
  v47.val[0].i16[4] = v11 - v17;
  v47.val[0].i16[5] = v15 + ((4 * (v21 - v23) + 0x8000) >> 16);
  v47.val[0].i16[6] = result - v20;
  v47.val[0].i16[7] = v10 + ((4 * (v26 - 11585 * v28) + 0x8000) >> 16);
  v47.val[1].i16[0] = v18 + v12;
  v47.val[1].i16[1] = v16 + ((4 * (v21 + v23) + 0x8000) >> 16);
  v47.val[1].i16[2] = v14 - v19;
  v47.val[1].i16[3] = v8 + ((4 * (v27 - 11585 * v28) + 0x8000) >> 16);
  v47.val[1].i16[4] = v12 - v18;
  v47.val[1].i16[5] = v16 + ((4 * (v22 + v24) + 0x8000) >> 16);
  v47.val[1].i16[6] = v19 + v14;
  v47.val[1].i16[7] = v8 + ((4 * (v26 + 11585 * v28) + 0x8000) >> 16);
  int v29 = &a4[((16 * a3) | 1) - 1];
  vst2q_s16(v29, v47);
  return result;
}

uint64_t fft16_i16_row(const __int16 *a1, int a2, __int16 *a3, unsigned __int16 *a4)
{
  int v7 = 0;
  uint64_t v8 = 0;
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v9 = &a1[2 * a2 + 1];
  do
  {
    int v10 = *(v9 - 1);
    int v11 = *v9;
    if (v7 <= 0) {
      int v12 = -(-v7 & 0x7F);
    }
    else {
      int v12 = v7 & 0x7F;
    }
    int v13 = 2 * v12;
    int v14 = pTwiddleTblQ14[2 * v12];
    int v15 = pTwiddleTblQ14[v13 + 1];
    v27[0].i16[v8] = (v14 * v10 - v15 * v11 + 0x2000) >> 14;
    v26[0].i16[v8++] = (v15 * v10 + v14 * v11 + 0x2000) >> 14;
    v7 += a2;
    v9 += 16;
  }
  while (v8 != 16);
  uint64_t result = fft16(v27, v26, v25, v24);
  uint64_t v17 = 0;
  int v18 = a2 + 64;
  do
  {
    if (v18 <= 0) {
      int v19 = -(-v18 & 0x7F);
    }
    else {
      int v19 = v18 & 0x7F;
    }
    int v20 = v25[v17];
    a3[2 * v19] = v25[v17];
    int v21 = v24[v17];
    a3[2 * v19 + 1] = v24[v17];
    if (v20 < 0) {
      int v20 = -v20;
    }
    int v20 = (unsigned __int16)v20;
    if (v21 < 0) {
      int v21 = -v21;
    }
    int v22 = (unsigned __int16)v21;
    BOOL v23 = (unsigned __int16)v20 > (unsigned __int16)v21;
    if ((unsigned __int16)v20 >= (unsigned __int16)v21) {
      int v21 = (unsigned __int16)v21;
    }
    else {
      int v21 = (unsigned __int16)v20;
    }
    if (!v23) {
      int v20 = v22;
    }
    a4[(__int16)v19] = ((62168 * v20 + 0x8000) >> 16) + ((25752 * v21 + 0x8000) >> 16);
    ++v17;
    v18 += 8;
  }
  while (v17 != 16);
  return result;
}

uint64_t fft2_i16_r128x128_G(const signed __int8 *a1, __int16 *a2, unsigned __int8 *a3, unsigned __int16 *a4)
{
  uint64_t result = 3;
  if (a1 && a2 && a3 && a4)
  {
    for (uint64_t i = 0; i != 256; i += 4)
    {
      fft128_i16_col2(a1, &a2[i], (__int16 *)a3);
      a1 += 2;
    }
    for (uint64_t j = 0; j != 65; ++j)
    {
      int v11 = 0;
      do
      {
        fft8_i16_row(a2, j, (__int16)v11, (__int16 *)a3);
        unsigned int v12 = (unsigned __int16)v11++;
      }
      while (v12 < 0xF);
      for (int k = 0; k != 8; ++k)
        fft16_i16_row((const __int16 *)a3, (__int16)k, &a2[256 * j], &a4[128 * j]);
    }
    return 0;
  }
  return result;
}

uint64_t findMaxBlock8x16_G(unsigned __int16 *a1, __int16 a2, int a3, int a4)
{
  do
  {
    int v4 = a3;
    a3 += a4;
  }
  while ((v4 & 0x8000) != 0);
  do
  {
    __int16 v5 = v4;
    v4 -= a4;
  }
  while (a4 <= v5);
  int v6 = 0;
  LOWORD(v7) = 0;
  do
  {
    int v8 = 0;
    int v9 = (unsigned __int16)(v6 + a2) * a4;
    do
    {
      int v10 = v9 + (unsigned __int16)(v5 + v8);
      unsigned __int16 v11 = a1[v10];
      if (a4 - 1 == (unsigned __int16)(v5 + v8)) {
        int v12 = (unsigned __int16)(v6 + a2) * a4;
      }
      else {
        int v12 = v10 + 1;
      }
      unsigned int v13 = a1[v12];
      unsigned int v14 = a1[a4 + v9 + (unsigned __int16)(v5 + v8)];
      if (v13 > v14) {
        LOWORD(v14) = v13;
      }
      unsigned int v15 = (unsigned __int16)(v14 + v11);
      if (v15 <= (unsigned __int16)v7) {
        uint64_t v7 = (unsigned __int16)v7;
      }
      else {
        uint64_t v7 = v15;
      }
      ++v8;
    }
    while (v8 != 16);
    ++v6;
  }
  while (v6 != 8);
  return v7;
}

unsigned __int16 *findKPeaks2x1Blocks8x16AndRefine(unsigned __int16 *result, int a2, int a3, int *a4, int *a5, int *a6, unsigned int a7, unsigned int a8, unsigned __int16 a9, unsigned __int8 *a10)
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  if (a2 && a3)
  {
    unsigned __int16 v11 = result;
    int v12 = a10;
    unsigned int v13 = ((2 * a3 * a2) & 0xFFFFFFE0) + 32;
    if (((a3 * a2) & 0xF) == 0) {
      unsigned int v13 = 2 * a2 * a3;
    }
    unsigned int v102 = v13;
    if ((unsigned __int16)v13 >= 2u) {
      bzero(a10, v13 & 0xFFFE);
    }
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = 0;
      __int16 v16 = v12;
      do
      {
        uint64_t result = (unsigned __int16 *)findMaxBlock8x16_G(v11, 8 * (unsigned __int16)v15, (__int16)(16 * v14), (unsigned __int16)(16 * a3));
        *(_WORD *)__int16 v16 = (_WORD)result;
        ++v15;
        v16 += 2 * (a3 & 0xFFF);
      }
      while (a2 != v15);
      ++v14;
      v12 += 2;
    }
    while (v14 != a3);
    if (a7)
    {
      int v19 = a4;
      int v18 = a5;
      int v20 = a6;
      uint64_t v21 = a7;
      do
      {
        *v18++ = 0;
        *v19++ = 0;
        *v20++ = 0;
        --v21;
      }
      while (v21);
      uint64_t v22 = 0;
      uint64_t v23 = (v102 >> 1) & 0x7FF0;
      signed int v24 = (unsigned __int16)(16 * a3);
      int v25 = v24 - 1;
      int v26 = 8 * a2;
      uint64_t v101 = a7 - 1;
      int v100 = 8 * a2;
      unsigned int v27 = a3;
      signed int v106 = 15 - a8;
      int v99 = a3 - 1;
      int v98 = a2 - 1;
      uint64_t v28 = a10;
      while (1)
      {
        if ((unsigned __int16)v102 >= 0x20u)
        {
          uint64_t v30 = 0;
          uint64_t v29 = 0;
          do
          {
            if (*(unsigned __int16 *)&v28[2 * v30] > (unint64_t)*(unsigned __int16 *)&v28[2 * v29]) {
              uint64_t v29 = (unsigned __int16)v30;
            }
            ++v30;
          }
          while (v23 != v30);
        }
        else
        {
          uint64_t v29 = 0;
        }
        int v31 = 0;
        unsigned int v32 = (unsigned __int16)v29 % v27;
        int v33 = (int)((unsigned __int16)v29 / v27 * v27) / (int)v27;
        __int16 v34 = 16 * v32;
        int v116 = (__int16)v32;
        int v117 = (__int16)v33;
        __int16 v111 = v33;
        int v35 = *(unsigned __int16 *)&v28[2 * v29];
        __int16 v119 = v34;
        int v112 = v33 << 16;
        while (1)
        {
          int v36 = 0;
          int v37 = (unsigned __int16)(v34 + v31);
          __int16 v38 = 255;
          do
          {
            unsigned int v39 = (unsigned __int16)(8 * ((int)((unsigned __int16)v29 / v27 * v27) / (int)v27) + v36) * v24;
            int v40 = v39 + v37;
            unsigned __int16 v41 = v11[v39 + v37];
            if (v25 != v37) {
              unsigned int v39 = v40 + 1;
            }
            unsigned int v42 = v11[v39];
            unsigned int v43 = v11[v40 + v24];
            if (v42 <= v43) {
              LOWORD(v42) = v43;
            }
            if (v35 == (unsigned __int16)(v42 + v41)) {
              __int16 v38 = v36;
            }
            ++v36;
          }
          while (v36 != 8);
          if (v38 != 255) {
            break;
          }
          if (++v31 == 16)
          {
            unsigned __int16 v44 = 0;
            goto LABEL_34;
          }
        }
        unsigned __int16 v44 = v31 + v34 + (8 * ((int)((unsigned __int16)v29 / v27 * v27) / (int)v27) + v38) * v24;
LABEL_34:
        signed int v45 = v44 / v24 * v24;
        unsigned int v46 = v44 % v24;
        int v47 = v45 / v24;
        int v48 = v47 * v24;
        unsigned int v49 = v47 * v24 + v46;
        unsigned int v50 = v11[v49];
        unsigned int v51 = v11[v46 + (v47 + 1) * v24];
        if (v46 == v25) {
          int v52 = v47 * v24;
        }
        else {
          int v52 = v49 + 1;
        }
        unsigned int v53 = v11[v52];
        if (v46 == v25) {
          unsigned int v54 = 0;
        }
        else {
          unsigned int v54 = v46 + 1;
        }
        if (v50 >= v53) {
          unsigned int v54 = v46;
        }
        if (v50 >= v51) {
          int v55 = v47;
        }
        else {
          int v55 = v47 + 1;
        }
        BOOL v56 = v51 >= v53;
        if (v51 < v53)
        {
          int v57 = v47 + 1;
        }
        else
        {
          int v48 = v55 * v24;
          int v57 = v55 + 1;
        }
        if (v56) {
          unsigned int v58 = v46;
        }
        else {
          unsigned int v58 = v54;
        }
        if (v56) {
          int v59 = v55;
        }
        else {
          int v59 = v47;
        }
        a6[v22] = v35;
        int v60 = v58 - 1;
        if (!v58) {
          int v60 = (unsigned __int16)(16 * a3) - 1;
        }
        if (v25 == v58) {
          unsigned int v61 = 0;
        }
        else {
          unsigned int v61 = v58 + 1;
        }
        int v62 = v59 - 1;
        if (!v59) {
          int v62 = v26;
        }
        if (v26 == v59) {
          int v57 = 0;
        }
        int v63 = v11[v48 + v58];
        v122[0] = v11[v48 + v60];
        v122[1] = v63;
        v122[2] = v11[v48 + v61];
        v121[0] = v11[v58 + v62 * v24];
        v121[1] = v63;
        v121[2] = v11[v58 + v57 * v24];
        int v64 = PeakRefine::getMedianIntQ16((PeakRefine *)v122, v17) + (v58 << 16);
        uint64_t result = (unsigned __int16 *)PeakRefine::getMedianIntQ16((PeakRefine *)v121, v65);
        int v66 = result + (v59 << 16);
        int v67 = 8 * (unsigned __int16)(16 * a3);
        if (v64 >= -4096) {
          int v67 = 0;
        }
        int v68 = v66 >= -4096 ? (v66 + 4096) >> 13 : 0;
        a5[v22] = v67 + ((v64 + 4096) >> 13);
        a4[v22] = v68;
        if (v22 == v101) {
          break;
        }
        uint64_t v109 = v22;
        int v69 = (__int16)v26;
        int v70 = (__int16)(v59 - a9) & ~((__int16)(v59 - a9) >> 31);
        int v113 = v59;
        if ((__int16)(v59 + a9) < (__int16)v26) {
          int v69 = (__int16)(v59 + a9);
        }
        int v71 = v58 + a8;
        int v72 = v58 + a8 - v24;
        if ((int)(v58 + a8) >= v24) {
          int v73 = (unsigned __int16)(16 * a3) - 1;
        }
        else {
          int v73 = v58 + a8;
        }
        if (v71 < v24) {
          int v72 = -1;
        }
        char v107 = v58;
        BOOL v74 = v58 >= a8;
        if (v58 < a8) {
          int v75 = (unsigned __int16)(16 * a3) - a8 + v58;
        }
        else {
          int v75 = v58 - a8;
        }
        if (v74) {
          int v76 = v73;
        }
        else {
          int v76 = (unsigned __int16)(16 * a3) - 1;
        }
        if (v74) {
          int v77 = v72;
        }
        else {
          int v77 = v71;
        }
        if (v70 <= (__int16)v69)
        {
          unsigned int v78 = v70 * v24;
          if (v75 <= v76) {
            int v79 = v76;
          }
          else {
            int v79 = v75;
          }
          size_t v120 = 2 * (v79 - v75) + 2;
          if (v69 <= v70) {
            int v69 = v70;
          }
          uint64_t v80 = -(uint64_t)(v69 - v70 + 1);
          do
          {
            if (v75 <= v76) {
              bzero(&v11[v75 + v78], v120);
            }
            if ((v77 & 0x80000000) == 0) {
              bzero(&v11[v78], 2 * (v77 + 1));
            }
            v78 += v24;
            BOOL v56 = __CFADD__(v80++, 1);
          }
          while (!v56);
        }
        if (v113 <= 0) {
          int v81 = -(-v113 & 7);
        }
        else {
          int v81 = v113 & 7;
        }
        int v114 = v81;
        unsigned int v82 = v107 & 0xF;
        int v83 = v112;
        uint64_t v28 = a10;
        unsigned __int16 v84 = 16 * a3;
        if (v112 >= 1 && v81 < a9)
        {
          __int16 v85 = 8 * v111 - 8;
          if (v82 >= a8)
          {
            int v87 = a3;
            int v108 = (v117 - 1) * a3;
            unsigned __int16 v88 = 16 * a3;
            int v89 = a10;
            int v86 = v116;
          }
          else
          {
            int v86 = v116;
            int v87 = a3;
            int v108 = (v117 - 1) * a3;
            unsigned __int16 v88 = 16 * a3;
            int v89 = a10;
            *(_WORD *)&a10[2 * ((v116 + v99) % a3) + 2 * v108] = findMaxBlock8x16_G(v11, 8 * v111 - 8, (__int16)(v119 - 16), (unsigned __int16)(16 * a3));
          }
          *(_WORD *)&v89[2 * (v86 % v87) + 2 * v108] = findMaxBlock8x16_G(v11, v85, v119, v88);
          uint64_t v28 = v89;
          unsigned __int16 v84 = v88;
          int v83 = v112;
          if ((int)v82 > (int)(16 - a8)) {
            *(_WORD *)&v28[2 * ((v116 + 1) % a3) + 2 * v108] = findMaxBlock8x16_G(v11, v85, (__int16)(v119 + 16), v88);
          }
        }
        __int16 v90 = v83 >> 13;
        signed int v91 = v82;
        unsigned int v27 = a3;
        if (v82 < a8) {
          *(_WORD *)&v28[2 * ((v116 + v99) % a3) + 2 * v117 * a3] = findMaxBlock8x16_G(v11, v90, (__int16)(v119 - 16), v84);
        }
        *(_WORD *)&v28[2 * v29] = findMaxBlock8x16_G(v11, v90, v119, v84);
        if ((int)v82 > v106) {
          *(_WORD *)&v28[2 * ((v116 + 1) % a3) + 2 * v117 * a3] = findMaxBlock8x16_G(v11, v90, (__int16)(v119 + 16), v84);
        }
        if (v114 > 8 - a9 && v117 < v98)
        {
          __int16 v92 = 8 * v111 + 8;
          if (v82 >= a8)
          {
            int v94 = v116;
            int v95 = a3 + a3 * v117;
          }
          else
          {
            __int16 MaxBlock8x16_G = findMaxBlock8x16_G(v11, 8 * v111 + 8, (__int16)(v119 - 16), v84);
            __int16 v92 = 8 * v111 + 8;
            int v94 = v116;
            int v95 = a3 + a3 * v117;
            *(_WORD *)&v28[2 * ((v116 + v99) % a3) + 2 * v95] = MaxBlock8x16_G;
          }
          int v96 = v84;
          __int16 v97 = v92;
          *(_WORD *)&v28[2 * (v94 % a3) + 2 * v95] = findMaxBlock8x16_G(v11, v92, v119, v96);
          if (v91 > v106) {
            *(_WORD *)&v28[2 * ((v116 + 1) % a3) + 2 * v95] = findMaxBlock8x16_G(v11, v97, (__int16)(v119 + 16), v96);
          }
        }
        uint64_t v22 = v109 + 1;
        uint64_t v23 = (v102 >> 1) & 0x7FF0;
        int v26 = v100;
      }
    }
  }
  return result;
}

uint64_t PeakRefine::getMedianIntQ16(PeakRefine *this, int *a2)
{
  int v3 = *((_DWORD *)this + 1);
  int v2 = *((_DWORD *)this + 2);
  int v4 = *(_DWORD *)this;
  int v5 = (v2 - *(_DWORD *)this) << 16;
  if (v2 >= *(_DWORD *)this)
  {
    int v6 = v3 + v2 - 2 * v4;
    if (!v6) {
      int v6 = 1;
    }
    int v7 = v5 + (v6 >> 1);
  }
  else
  {
    int v6 = v3 + v4 - 2 * v2;
    if (!v6) {
      int v6 = 1;
    }
    int v7 = v5 - (v6 >> 1);
  }
  return (v7 / v6);
}

uint64_t FMagCore_LinearTaylorQ10_Q7(unsigned int a1, unsigned int a2)
{
  if (a2)
  {
    if ((a2 & 0x8000) != 0)
    {
      __int16 v4 = -6;
    }
    else
    {
      int v2 = 0;
      do
      {
        __int16 v3 = v2;
        a2 *= 2;
        ++v2;
      }
      while ((a2 & 0x8000) == 0);
      __int16 v4 = v3 - 5;
    }
    unsigned int v6 = (a2 + 32) >> 6;
    if (a2 >> 5 > 0x55A) {
      unsigned int v6 = (v6 + 1) >> 1;
    }
    int v7 = (__int16)(v4 - (a2 >> 5 > 0x55A));
    unsigned int v8 = 2048 - (((v6 << 16) + 1040187392) >> 14);
    if (v7 <= -7) {
      unsigned int v9 = a1 >> (-6 - v7);
    }
    else {
      unsigned int v9 = a1 << (v7 + 6);
    }
    if (v9 >= 0xFFFF) {
      unsigned int v9 = 0xFFFF;
    }
    unsigned int v5 = (v9 * (v8 & 0xFFFC)) >> 16;
    if (v5 >= 0xFF) {
      LOBYTE(v5) = -1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

uint64_t FilterFMag_65x128_G(const unsigned __int16 *a1, unsigned __int8 *a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  unsigned int v6 = a1;
  do
  {
    uint64_t v7 = 0;
    int v8 = v5 << 7;
    uint64_t v9 = (v5 << 7) + 128;
    uint64_t v10 = 255;
    do
    {
      if (v5)
      {
        if ((int)v7 >= 126) {
          int v11 = 126;
        }
        else {
          int v11 = v7;
        }
        uint64_t v12 = (v5 << 7) - 127 + v11;
        uint64_t v13 = v4 + v7 - 128;
        if ((int)v7 <= 1) {
          __int16 v14 = 1;
        }
        else {
          __int16 v14 = v7;
        }
        uint64_t v15 = (unsigned __int16)(v14 - 1);
        uint64_t v16 = (v5 << 7) - 128 + v15;
      }
      else
      {
        unsigned __int16 v17 = v10 - 126;
        if ((int)v10 - 126 >= 127) {
          unsigned __int16 v17 = 127;
        }
        uint64_t v12 = v17 + 128;
        unsigned __int16 v18 = v10 - 127;
        if ((int)v10 - 127 >= 127) {
          unsigned __int16 v18 = 127;
        }
        uint64_t v13 = v18 + 128;
        if ((int)v7 <= 1) {
          __int16 v19 = 1;
        }
        else {
          __int16 v19 = v7;
        }
        uint64_t v15 = (unsigned __int16)(v19 - 1);
        uint64_t v16 = v10;
      }
      unsigned __int16 v20 = a1[v13];
      unsigned __int16 v21 = a1[v12];
      unsigned __int16 v22 = a1[v16];
      uint64_t v23 = v7 + 1;
      if ((int)v7 + 1 >= 127) {
        int v24 = 127;
      }
      else {
        int v24 = v7 + 1;
      }
      unsigned __int16 v25 = a1[v24 | v8];
      unsigned __int16 v26 = a1[(v8 + v15)];
      uint64_t v27 = (int)(v24 | v9);
      uint64_t v28 = v9 + v15;
      uint64_t v29 = v24 | 0x2000u;
      uint64_t v30 = v15 + 0x2000;
      if (v5 == 64)
      {
        uint64_t v31 = v7 + 0x2000;
      }
      else
      {
        uint64_t v29 = v27;
        uint64_t v31 = v4 + v7 + 128;
      }
      if (v5 != 64) {
        uint64_t v30 = v28;
      }
      uint64_t result = FMagCore_LinearTaylorQ10_Q7(v6[v7], (unsigned __int16)(v21 + v20 + v25 + v22 + v26 + a1[v31] + a1[v29] + a1[v30]));
      a2[v7] = result;
      --v10;
      ++v7;
    }
    while (v23 != 128);
    ++v5;
    v4 += 128;
    a2 += 128;
    v6 += 128;
  }
  while (v5 != 65);
  return result;
}

uint64_t FMagCorrelation_G(uint64_t result, const unsigned __int16 *a2, int a3, const int (*a4)[4], const signed __int8 *a5, const signed __int8 *a6)
{
  if (a3 >= 1)
  {
    uint64_t v9 = result;
    uint64_t v10 = 0;
    uint64_t v66 = a3;
    do
    {
      int v11 = 0;
      uint64_t v12 = 0;
      uint64_t v13 = &(*a4)[4 * v10];
      *(_DWORD *)(v9 + 4 * v10) = 0;
      __int16 v14 = v13 + 2;
      uint64_t v15 = v13 + 1;
      uint64_t v16 = v13 + 3;
      int v70 = v13 + 2;
      int v68 = v13 + 3;
      int v69 = v13 + 1;
      do
      {
        int v17 = a6[v12];
        int v18 = a5[v12];
        int v19 = *v13 * v17 + *v14 * v18;
        int v20 = (*v16 * v18 + *v15 * v17 + 16) >> 5;
        if (v19 >= -16) {
          unsigned int v21 = (v19 + 16) >> 5;
        }
        else {
          unsigned int v21 = -((v19 + 16) >> 5);
        }
        if (v19 >= -16) {
          int v22 = v20;
        }
        else {
          int v22 = -v20;
        }
        if (v21 - 1998849 >= 0xFFE27FFF && v22 <= 1998848 && v22 >= -2031616)
        {
          uint64_t v25 = 0;
          unsigned int v26 = 0;
          int v27 = v22 + 0x200000;
          int v28 = v22 & 0x7FFF;
          unsigned int v29 = ((v21 >> 8) & 0xFFFF80) + ((v22 + 0x200000) >> 15);
          unsigned int v30 = (((v21 & 0x7FFF ^ 0x7FFF) * (v28 ^ 0x7FFF)) >> 15) * a2[v29];
          unsigned int v31 = (((v21 & 0x7FFF ^ 0x7FFF) * v28) >> 15) * a2[v29 + 1];
          int v32 = a2[v29 + 129];
          unsigned int v33 = (((v28 ^ 0x7FFF) * (v21 & 0x7FFF)) >> 15) * a2[v29 + 128];
          unsigned int v34 = (((v21 & 0x7FFF) * v28) >> 15) * v32;
          do
          {
            unsigned int v35 = extentX[v25] + v27;
            unsigned int v36 = extentY[v25] + v21;
            unsigned int v37 = v35 >> 15;
            int v38 = v35 & 0x7FFF;
            int v39 = v36 & 0x7FFF;
            int v40 = ((v36 >> 8) & 0x7FFF80) + (unsigned __int16)v37;
            int v41 = a2[v40];
            int v42 = a2[v40 + 1];
            int v43 = a2[v40 + 128];
            int v44 = a2[v40 + 129];
            unsigned int v45 = (((v39 ^ 0x7FFF) * (v38 ^ 0x7FFFu)) >> 15) * v41;
            if (v45 >> 30) {
              __int16 v46 = 0x7FFF;
            }
            else {
              __int16 v46 = v45 >> 15;
            }
            unsigned int v47 = (((v39 ^ 0x7FFFu) * v38) >> 15) * v42;
            if (v47 >> 30) {
              __int16 v48 = 0x7FFF;
            }
            else {
              __int16 v48 = v47 >> 15;
            }
            unsigned int v49 = ((v39 * (v38 ^ 0x7FFFu)) >> 15) * v43;
            if (v49 >> 30) {
              __int16 v50 = 0x7FFF;
            }
            else {
              __int16 v50 = v49 >> 15;
            }
            unsigned int v51 = ((v39 * v38) >> 15) * v44;
            if (v51 >> 30) {
              __int16 v52 = 0x7FFF;
            }
            else {
              __int16 v52 = v51 >> 15;
            }
            v26 += (unsigned __int16)(v46 + v50 + v48 + v52);
            ++v25;
          }
          while (v25 != 8);
          unsigned int v53 = v34 >> 30;
          unsigned int v54 = v34 >> 15;
          unsigned int v55 = v33 >> 30;
          unsigned int v56 = v33 >> 15;
          unsigned int v57 = v31 >> 30;
          unsigned int v58 = v31 >> 15;
          unsigned int v59 = v30 >> 15;
          unsigned int v60 = v30 >> 30;
          if (v57) {
            LOWORD(v58) = 0x7FFF;
          }
          if (v55) {
            __int16 v61 = 0x7FFF;
          }
          else {
            __int16 v61 = v56;
          }
          if (v53) {
            __int16 v62 = 0x7FFF;
          }
          else {
            __int16 v62 = v54;
          }
          if (v60) {
            __int16 v63 = 0x7FFF;
          }
          else {
            __int16 v63 = v59;
          }
          unsigned __int16 v64 = v58 + v63 + v61 + v62;
          if (v26 >= 0xFFFF) {
            unsigned int v65 = 0xFFFF;
          }
          else {
            unsigned int v65 = v26;
          }
          uint64_t result = FMagCore_LinearTaylorQ10_Q7(v64, v65);
          int v11 = result + v11 - 127;
          *(_DWORD *)(v9 + 4 * v10) = v11;
          __int16 v14 = v70;
          uint64_t v13 = &(*a4)[4 * v10];
          uint64_t v16 = v68;
          uint64_t v15 = v69;
        }
        ++v12;
      }
      while (v12 != 64);
      *(_DWORD *)(v9 + 4 * v10++) = v11 >> 4;
    }
    while (v10 != v66);
  }
  return result;
}

uint64_t GF256::runForwardGaussElimination(uint64_t result, unsigned int a2, unsigned int a3, uint64_t a4)
{
  if (a2)
  {
    unint64_t v4 = 0;
    unsigned int v5 = a3 + 1;
    uint64_t v6 = 1;
    unsigned int v7 = a3;
    do
    {
      uint64_t v8 = v4 + v4 * a3;
      int v9 = *(unsigned __int8 *)(result + v8);
      if (*(unsigned char *)(result + v8)) {
        goto LABEL_15;
      }
      unsigned int v10 = v5 * v4;
      unsigned int v11 = -1;
      unsigned int v12 = v5 * v4;
      unint64_t v13 = v4;
      do
      {
        if (*(unsigned char *)(result + v12)) {
          unsigned int v11 = v13;
        }
        ++v13;
        v12 += a3;
      }
      while (a2 != v13);
      if ((v11 & 0x80000000) != 0) {
        return result;
      }
      unint64_t v14 = a3 - v4;
      if (a3 > v4)
      {
        unsigned int v15 = v4 + v11 * a3;
        do
        {
          char v16 = *(unsigned char *)(result + v10);
          *(unsigned char *)(result + v10) = *(unsigned char *)(result + v15);
          *(unsigned char *)(result + v15++) = v16;
          ++v10;
          --v14;
        }
        while (v14);
      }
      if (a4)
      {
        char v17 = *(unsigned char *)(a4 + v4);
        *(unsigned char *)(a4 + v4) = *(unsigned char *)(a4 + v11);
        *(unsigned char *)(a4 + v11) = v17;
      }
      int v9 = *(unsigned __int8 *)(result + v8);
      if (*(unsigned char *)(result + v8))
      {
LABEL_15:
        unint64_t v18 = v4 + 1;
        if (v4 + 1 < a2)
        {
          unsigned int v19 = v7 + v4;
          uint64_t v20 = v6;
          do
          {
            if (*(unsigned char *)(result + v4 + v20 * a3))
            {
              unint64_t v21 = *(unsigned __int8 *)(result + v4 + v20 * a3);
              unsigned __int8 v22 = GF256::m_HighMulTable[(16 * GF256::m_InvTable[v9]) & 0xF00 | v21] ^ GF256::m_LowMulTable[((GF256::m_InvTable[v9] & 0xF) << 8) | v21];
              if (a3 > v4)
              {
                unsigned int v23 = v5 * v4;
                unsigned int v24 = v19;
                unint64_t v25 = a3 - v4;
                do
                {
                  *(unsigned char *)(result + v24++) ^= GF256::m_HighMulTable[v22 | (*(unsigned char *)(result + v23) >> 4 << 8)] ^ GF256::m_LowMulTable[v22 | ((*(unsigned char *)(result + v23) & 0xF) << 8)];
                  ++v23;
                  --v25;
                }
                while (v25);
              }
              if (a4) {
                *(unsigned char *)(a4 + v20) ^= GF256::m_HighMulTable[(16 * *(unsigned __int8 *)(a4 + v4)) & 0xF00 | v22] ^ GF256::m_LowMulTable[((*(unsigned char *)(a4 + v4) & 0xF) << 8) & 0xFFFFFFFFFFFFFF00 | v22];
              }
            }
            ++v20;
            v19 += a3;
          }
          while (v20 != a2);
        }
      }
      else
      {
        unint64_t v18 = v4 + 1;
      }
      ++v6;
      v7 += a3;
      unint64_t v4 = v18;
    }
    while (v18 != a2);
  }
  return result;
}

uint64_t GF256::rankOfUpperTriangMatrix(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  int v4 = a3 + 1;
  int v5 = a2 - 1;
  unsigned int v6 = a3;
  while (1)
  {
    if (v3 == a3) {
      return a3;
    }
    char v7 = 1;
    if (v3 + 1 < (unint64_t)a2)
    {
      unsigned int v8 = v6;
      int v9 = v5;
      do
      {
        v7 &= *(unsigned char *)(a1 + v8) == 0;
        v8 += a3;
        --v9;
      }
      while (v9);
    }
    if (v3 == a2) {
      break;
    }
    uint64_t v10 = v3;
    if (!*(unsigned char *)(a1 + (v4 * v3))) {
      char v7 = 0;
    }
    --v5;
    v6 += v4;
    ++v3;
    if ((v7 & 1) == 0) {
      return v10;
    }
  }
  return a2;
}

uint64_t GF256::runBackSubstitution(uint64_t result, int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4 = (a2 - 1);
  if (a2 >= 1)
  {
    unint64_t v5 = a2;
    unsigned int v6 = a3 + 1;
    uint64_t v7 = a3;
    while (1)
    {
      unint64_t v8 = v5--;
      int v9 = GF256::m_InvTable[*(unsigned __int8 *)(result + v6 * v5)];
      *(unsigned char *)(a4 + v5) = GF256::m_HighMulTable[(16 * v9) & 0xF00 | (unint64_t)*(unsigned __int8 *)(a4 + v5)] ^ GF256::m_LowMulTable[((v9 & 0xF) << 8) | (unint64_t)*(unsigned __int8 *)(a4 + v5)];
      *(unsigned char *)(result + v6 * v5) = 1;
      if (v8 < 2) {
        break;
      }
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      do
      {
        *(unsigned char *)(a4 + v11) ^= GF256::m_HighMulTable[(16 * *(unsigned __int8 *)(a4 + v5)) & 0xF00 | (unint64_t)*(unsigned __int8 *)(result + (v4 + v10))] ^ GF256::m_LowMulTable[((*(unsigned char *)(a4 + v5) & 0xF) << 8) | (unint64_t)*(unsigned __int8 *)(result + (v4 + v10))];
        *(unsigned char *)(result + (v4 + v10)) = 0;
        ++v11;
        v10 += v7;
      }
      while (v4 != v11);
      --v4;
    }
  }
  return result;
}

void DMEMmbedSession::DMEMmbedSession(DMEMmbedSession *this, unsigned int a2, unsigned __int8 *a3)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  operator new[]();
}

void DMEMmbedSession::~DMEMmbedSession(EmbedKE **this)
{
  int v2 = *this;
  if (v2)
  {
    EmbedKE::~EmbedKE(v2);
    MEMORY[0x22A6A4700]();
  }
  uint64_t v3 = this[1];
  if (v3) {
    MEMORY[0x22A6A46F0](v3, 0x1000C8077774924);
  }
  uint64_t v4 = this[2];
  if (v4) {
    MEMORY[0x22A6A46F0](v4, 0x1000C8077774924);
  }
  unint64_t v5 = this[3];
  if (v5) {
    MEMORY[0x22A6A46F0](v5, 0x1000C8077774924);
  }
}

void startEmbed()
{
}

void sub_228A4921C(_Unwind_Exception *a1)
{
  MEMORY[0x22A6A4700](v1, 0x30C40E3C0B0CCLL);
  _Unwind_Resume(a1);
}

uint64_t addPacketIDToPayload(unsigned int a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *((void *)a2 + 2);
    do
    {
      *(unsigned char *)(v4 + v3) = (a1 >> v3) & 1;
      ++v3;
    }
    while (v3 != 5);
    RandomErasureEncoder::EncodePayloadIntoPacket(*((RandomErasureEncoder **)a2 + 1), (unsigned __int8 *)0x72, *((void *)a2 + 3), (unsigned __int8 *)0xF, a1);
    unint64_t v5 = (unsigned __int8 *)*((void *)a2 + 2);
    uint64_t v6 = *((void *)a2 + 3);
    if (v6)
    {
      for (uint64_t i = 0; i != 15; ++i)
      {
        uint32x4_t v8 = (uint32x4_t)vdupq_n_s32(*(unsigned __int8 *)(v6 + i));
        *(int8x8_t *)&v5[8 * i + 5] = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vshlq_u32(v8, (uint32x4_t)xmmword_228A919E0), (int16x8_t)vshlq_u32(v8, (uint32x4_t)xmmword_228A919D0))), (int8x8_t)0x101010101010101);
      }
      unint64_t v5 = (unsigned __int8 *)*((void *)a2 + 2);
    }
    int v9 = *(EmbedKE **)a2;
    EmbedKE::InitWithPayload(v9, v5, 125);
  }
  return 0xFFFFFFFFLL;
}

uint64_t doGenWMAtScaleH(unsigned int a1, unsigned int a2, unsigned int a3, int a4, char *a5, void *a6, unsigned __int8 a7, float a8, float a9, float a10)
{
  uint64_t result = addPacketIDToPayload(a1, a6);
  if (!result)
  {
    uint64_t v20 = (EmbedKE *)*a6;
    return EmbedKE::OutputWmAsHFloats(v20, a5, 4, a4, a3, a2, a7, a8, a9, 0.3, -0.5, 0.2, a10);
  }
  return result;
}

void HCImagePerspectiveReader::~HCImagePerspectiveReader(HCImagePerspectiveReader *this)
{
  if (this->var0)
  {
    var5 = this->var5;
    if (var5)
    {
      if (*((void *)var5 + 1))
      {
        RandomErasureDecoder::~RandomErasureDecoder(*((RandomErasureDecoder **)var5 + 1));
        MEMORY[0x22A6A4700]();
        var5 = this->var5;
      }
      *((void *)var5 + 1) = 0;
      if (*(void *)var5)
      {
        (*(void (**)(void))(**(void **)var5 + 8))(*(void *)var5);
        var5 = this->var5;
      }
      *(void *)var5 = 0;
      uint64_t v3 = *((void *)var5 + 2);
      if (v3)
      {
        (*(void (**)(void))(*(void *)v3 + 24))(*((void *)var5 + 2));
        var5 = this->var5;
      }
      *((void *)var5 + 2) = 0;
      MEMORY[0x22A6A4700]();
    }
  }
}

void HCImagePerspectiveReader::Reset(HCImagePerspectiveReader *this)
{
  this->var0 = 0;
  var5 = this->var5;
  if (var5)
  {
    if (*((void *)var5 + 1))
    {
      RandomErasureDecoder::~RandomErasureDecoder(*((RandomErasureDecoder **)var5 + 1));
      MEMORY[0x22A6A4700]();
      var5 = this->var5;
    }
    if (*(void *)var5)
    {
      (*(void (**)(void))(**(void **)var5 + 8))(*(void *)var5);
      var5 = this->var5;
    }
    uint64_t v3 = *((void *)var5 + 2);
    if (v3)
    {
      (*(void (**)(void))(*(void *)v3 + 24))(*((void *)var5 + 2));
      var5 = this->var5;
    }
    *(void *)var5 = 0;
    *((void *)var5 + 1) = 0;
    *((void *)var5 + 2) = 0;
    operator new();
  }
  operator new();
}

void sub_228A49A8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  CMCKey::~CMCKey((CMCKey *)va);
  _Unwind_Resume(a1);
}

void CMCKey::~CMCKey(CMCKey *this)
{
  *(void *)this = &unk_26DD17FC8;
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    MEMORY[0x22A6A46F0](v2, 0x1000C8077774924);
  }
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 2) = 0;
}

{
  uint64_t v2;
  uint64_t vars8;

  *(void *)this = &unk_26DD17FC8;
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    MEMORY[0x22A6A46F0](v2, 0x1000C8077774924);
  }
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 2) = 0;
  JUMPOUT(0x22A6A4700);
}

uint64_t HCImagePerspectiveReader::ProcessUVFrame(uint64_t a1, uint64_t a2, int a3, int a4, unsigned int a5, uint64_t a6)
{
  if (!*(unsigned char *)a1) {
    return 4;
  }
  if (!a2) {
    return 3;
  }
  if (a5 < 2 * a4) {
    return 2;
  }
  if (*(_DWORD *)(a1 + 4) != a3 || *(_DWORD *)(a1 + 8) != a4 || *(_DWORD *)(a1 + 12) != a5) {
    return 5;
  }
  if ((*(unsigned int (**)(void))(***(void ***)(a1 + 24) + 56))(**(void **)(a1 + 24))) {
    return 7;
  }
  if (a6)
  {
    *(_DWORD *)(a6 + 4) = 0;
    *(unsigned char *)a6 = 0;
  }
  if (MultiBlockReader::ReadWatermark(*(void *)(*(void *)(a1 + 24) + 16), 0, 0)) {
    return 7;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 24) + 16);
  uint64_t v10 = *(unsigned int *)(v9 + 40);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)(v9 + 24);
  uint64_t v13 = 136 * v10;
  do
  {
    if (*(_DWORD *)(v12 + v11 + 16) == 3 && *(_DWORD *)(v12 + v11 + 40) == 10)
    {
      if (a6)
      {
        *(float *)(a6 + 4) = (float)*(int *)(v12 + v11 + 12) * 0.00012207;
        *(unsigned char *)a6 = 1;
      }
      operator new[]();
    }
    uint64_t result = 0;
    v11 += 136;
  }
  while (v13 != v11);
  return result;
}

BOOL CMCKey::Initialize(CMCKey *this, const unsigned __int8 *a2, unsigned int a3)
{
  uint64_t v5 = *((void *)this + 2);
  if (v5) {
    MEMORY[0x22A6A46F0](v5, 0x1000C8077774924);
  }
  *((void *)this + 2) = 0;
  *((_DWORD *)this + 2) = 0;
  if (a3 <= 0x100) {
    operator new[]();
  }
  return a3 < 0x101;
}

uint64_t ImpulseMatchedFilter_O(const unsigned __int8 *a1, unsigned int a2, const __int16 *a3, const unsigned __int8 *a4, unsigned __int16 *a5, const unsigned __int16 *a6, int a7)
{
  if (a2)
  {
    uint64_t v7 = 0;
    uint64_t v8 = a2;
    do
    {
      uint64_t v9 = 0;
      unint64_t v10 = a4[2 * v7];
      uint64_t v11 = (2 * v7) | 1;
      unint64_t v12 = a4[v11];
      unsigned int v13 = (a6[v11] * a7 + 2) >> 2;
      unint64_t v14 = v12 & 0xFC;
      int v15 = 2 * a6[2 * v7];
      do
      {
        int v16 = v9 + 320 * v7;
        if (v14 <= v10)
        {
          unsigned __int16 v17 = 0;
          unint64_t v20 = v10;
        }
        else
        {
          unsigned __int16 v17 = 0;
          unint64_t v18 = &a3[v10 + 2];
          unint64_t v19 = v10;
          do
          {
            v17 += a1[v16 + *(v18 - 2)] + a1[v16 + *(v18 - 1)] + a1[v16 + *v18] + a1[v16 + v18[1]];
            v19 += 4;
            v18 += 4;
          }
          while (v19 < v14);
          unint64_t v20 = v19;
        }
        if (v20 <= v12)
        {
          unint64_t v21 = v12 + 1 - v20;
          unsigned __int8 v22 = &a3[v20];
          do
          {
            int v23 = *v22++;
            v17 += a1[v16 + v23];
            --v21;
          }
          while (v21);
        }
        a5[160 * v7 + v9++] = (v13 + v15 * v17) >> 10;
      }
      while (v9 != 160);
      ++v7;
    }
    while (v7 != v8);
  }
  return 0;
}

uint64_t InvertLTBilinear36x36Stride48_G(uint64_t result, unsigned int a2, unsigned __int8 *a3, int *a4, int a5, int a6)
{
  uint64_t v6 = 0;
  int v7 = *a4;
  int v8 = a4[1];
  int v9 = a4[2];
  int v10 = a4[3];
  int v11 = a5 + 512;
  int v12 = a6 + 512;
  do
  {
    uint64_t v13 = 0;
    int v14 = v12;
    int v15 = v11;
    do
    {
      int v16 = (v15 >> 10) & 0x3FF;
      uint64_t v17 = (int)((v14 >> 20) * a2) + (uint64_t)(v15 >> 20);
      int v18 = (*(unsigned __int8 *)(result + v17 + 1) - *(unsigned __int8 *)(result + v17)) * v16
          + (*(unsigned __int8 *)(result + v17) << 10);
      a3[v13] = ((((*(unsigned __int8 *)(result + v17 + a2 + 1) - *(unsigned __int8 *)(result + v17 + a2))
                               * v16
                               - v18
                               + (*(unsigned __int8 *)(result + v17 + a2) << 10)) >> 5)
               * ((v14 >> 10) & 0x3FF)
               + 32 * v18) >> 15;
      v15 += v10;
      v14 += v9;
      ++v13;
    }
    while (v13 != 36);
    v11 += v8;
    v12 += v7;
    ++v6;
    a3 += 48;
  }
  while (v6 != 36);
  return result;
}

uint64_t InvertLTBilinear36x36Stride48_YUV422_G(uint64_t result, unsigned int a2, unsigned __int8 *a3, int *a4, int a5, int a6)
{
  uint64_t v6 = 0;
  int v7 = *a4;
  int v8 = a4[1];
  int v9 = a4[2];
  int v10 = a4[3];
  unsigned int v11 = a5 + 512;
  int v12 = a6 + 512;
  do
  {
    uint64_t v13 = 0;
    int v14 = v12;
    unsigned int v15 = v11;
    do
    {
      int v16 = (v15 >> 10) & 0x3FF;
      uint64_t v17 = (((uint64_t)(int)v15 >> 19) & 0xFFFFFFFFFFFFFFFELL) + (int)((v14 >> 20) * a2) + result;
      int v18 = (*(unsigned __int8 *)(v17 + 3) - *(unsigned __int8 *)(v17 + 1)) * v16
          + (*(unsigned __int8 *)(v17 + 1) << 10);
      a3[v13] = ((((*(unsigned __int8 *)(v17 + a2 + 3) - *(unsigned __int8 *)(v17 + a2 + 1)) * v16
                               - v18
                               + (*(unsigned __int8 *)(v17 + a2 + 1) << 10)) >> 5)
               * ((v14 >> 10) & 0x3FF)
               + 32 * v18) >> 15;
      v15 += v10;
      v14 += v9;
      ++v13;
    }
    while (v13 != 36);
    v11 += v8;
    v12 += v7;
    ++v6;
    a3 += 48;
  }
  while (v6 != 36);
  return result;
}

uint64_t mul_3x3_float_matrices(uint64_t result, float *a2, float *a3)
{
  for (uint64_t i = 0; i != 3; ++i)
  {
    for (uint64_t j = 0; j != 3; ++j)
      *(float *)(result + j * 4) = (float)((float)(a2[3 * i + 1] * a3[j + 3]) + (float)(a2[3 * i] * a3[j]))
                                 + (float)(a2[3 * i + 2] * a3[j + 6]);
    result += 12;
  }
  return result;
}

float inv_3x3_float_matrix(float *a1, float *a2)
{
  float v2 = a2[4];
  float v3 = a2[5];
  float v5 = a2[7];
  float v4 = a2[8];
  float v6 = 1.0
     / (float)((float)((float)((float)((float)((float)(a2[2] * a2[3]) * v5) + (float)((float)(*a2 * v2) * v4))
                             + (float)((float)(a2[6] * a2[1]) * v3))
                     + 0.0)
             - (float)((float)((float)(v4 * (float)(a2[3] * a2[1])) + (float)((float)(*a2 * v3) * v5))
                     + (float)((float)(v2 * a2[2]) * a2[6])));
  *a1 = (float)((float)(v2 * v4) - (float)(v3 * v5)) * v6;
  a1[1] = v6 * (float)((float)(a2[2] * a2[7]) - (float)(a2[1] * a2[8]));
  a1[2] = v6 * (float)((float)(a2[1] * a2[5]) - (float)(a2[2] * a2[4]));
  a1[3] = v6 * (float)((float)(a2[5] * a2[6]) - (float)(a2[3] * a2[8]));
  a1[4] = v6 * (float)((float)(*a2 * a2[8]) - (float)(a2[2] * a2[6]));
  a1[5] = v6 * (float)((float)(a2[2] * a2[3]) - (float)(*a2 * a2[5]));
  a1[6] = v6 * (float)((float)(a2[3] * a2[7]) - (float)(a2[4] * a2[6]));
  a1[7] = v6 * (float)((float)(a2[1] * a2[6]) - (float)(*a2 * a2[7]));
  float result = v6 * (float)((float)(*a2 * a2[4]) - (float)(a2[1] * a2[3]));
  a1[8] = result;
  return result;
}

void Homography::Homography(Homography *this, float *a2)
{
  float v2 = 1.0 / a2[8];
  float32x4_t v3 = (float32x4_t)vdupq_n_s32(0x49800000u);
  v4.i64[0] = 0x3F0000003F000000;
  v4.i64[1] = 0x3F0000003F000000;
  v5.i64[0] = 0x3F0000003F000000;
  v5.i64[1] = 0x3F0000003F000000;
  int32x4_t v6 = vcvtq_s32_f32(vrndmq_f32(vmlaq_f32(v4, v3, vmulq_n_f32(*(float32x4_t *)a2, v2))));
  int32x4_t v7 = vcvtq_s32_f32(vrndmq_f32(vmlaq_f32(v5, v3, vmulq_n_f32(*(float32x4_t *)(a2 + 4), v2))));
  *(int32x4_t *)this = v6;
  *((int32x4_t *)this + 1) = v7;
}

uint64_t InvertPTBilinearX_16Hx16W(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, unsigned __int16 a9, uint64_t a10)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (!*(_DWORD *)(a7 + 28))
  {
    uint64_t v38 = result;
    if (a9)
    {
      unsigned int v10 = a8;
      uint64_t v14 = 0;
      int v15 = a3 << 20;
      int v16 = a4 << 20;
      uint64_t v17 = a8;
      int v34 = a6;
      uint64_t v35 = a7;
      do
      {
        uint64_t v37 = v14;
        float result = (*(uint64_t (**)(unsigned char *, uint64_t, void))a10)(v39, a7, (unsigned __int16)v14);
        if (v10)
        {
          uint64_t v18 = 0;
          do
          {
            int v19 = 0;
            char v20 = 1;
            char v21 = 1;
            do
            {
              uint64_t v22 = 0;
              char v23 = v20;
              int v24 = v19 | (16 * v18);
              char v25 = 1;
              do
              {
                char v26 = v25;
                uint64_t v27 = 4 * v22;
                int v28 = *(_DWORD *)&v39[(4 * v22) | 4] + *(_DWORD *)&v39[4 * v22] * v24;
                int v29 = *(_DWORD *)&v39[v27 | 0xC] + *(_DWORD *)&v39[v27 | 8] * v24;
                BOOL v32 = v28 < v16 && (v28 | v29) >= 0 && v29 < v15;
                v21 &= v32;
                uint64_t v22 = 60;
                char v25 = 0;
              }
              while ((v26 & 1) != 0);
              char v20 = 0;
              int v19 = 15;
            }
            while ((v23 & 1) != 0);
            int v33 = 16 * (v18 + (~v37 + v17) * v34);
            if (v21) {
              float result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, unsigned char *))(a10 + 16))(v38, a2, a5 + v33, a6, (unsigned __int16)v18, v39);
            }
            else {
              float result = (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 32))(a5 + v33, a6);
            }
            ++v18;
          }
          while (v18 != v17);
        }
        uint64_t v14 = v37 + 1;
        unsigned int v10 = a8;
        a7 = v35;
      }
      while (v37 + 1 != a9);
    }
  }
  return result;
}

uint64_t InvertPTBilinearY_16Hx16W(uint64_t result, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, unsigned __int16 a9, uint64_t a10)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (!*(_DWORD *)(a7 + 24))
  {
    uint64_t v40 = result;
    if (a8)
    {
      uint64_t v13 = 0;
      int v14 = a3 << 20;
      int v15 = a4 << 20;
      int v36 = a6;
      uint64_t v37 = a8;
      uint64_t v38 = a7;
      do
      {
        uint64_t v39 = v13;
        float result = (*(uint64_t (**)(unsigned char *, uint64_t, void))(a10 + 8))(v41, a7, (unsigned __int16)v13);
        if (a9)
        {
          for (uint64_t i = 0; i != a9; ++i)
          {
            uint64_t v17 = 0;
            char v18 = 1;
            char v19 = 1;
            do
            {
              int v20 = 0;
              char v21 = v18;
              uint64_t v22 = 4 * v17;
              int v23 = *(_DWORD *)&v41[4 * v17];
              int v24 = *(_DWORD *)&v41[v22 | 4];
              int v25 = *(_DWORD *)&v41[v22 | 8];
              int v26 = *(_DWORD *)&v41[v22 | 0xC];
              char v27 = 1;
              do
              {
                char v28 = v27;
                int v29 = v20 | (16 * i);
                int v30 = v24 + v29 * v23;
                int v31 = v26 + v29 * v25;
                BOOL v34 = v30 < v15 && (v30 | v31) >= 0 && v31 < v14;
                v19 &= v34;
                int v20 = 15;
                char v27 = 0;
              }
              while ((v28 & 1) != 0);
              char v18 = 0;
              uint64_t v17 = 60;
            }
            while ((v21 & 1) != 0);
            uint64_t v35 = (16 * (i + v39 * v36));
            if (v19) {
              float result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, unsigned char *))(a10 + 24))(v40, a2, a5 + v35, a6, (unsigned __int16)i, v41);
            }
            else {
              float result = (*(uint64_t (**)(uint64_t, uint64_t))(a10 + 32))(a5 + v35, a6);
            }
          }
        }
        a7 = v38;
        uint64_t v13 = v39 + 1;
      }
      while (v39 + 1 != v37);
    }
  }
  return result;
}

void *setZero_16x16_G(void *result, unsigned int a2)
{
  uint64_t v2 = 16;
  do
  {
    *float result = 0;
    result[1] = 0;
    float result = (void *)((char *)result + a2);
    --v2;
  }
  while (v2);
  return result;
}

uint64_t calculateRowTransforms_16_G(uint64_t a1, int *a2, int a3)
{
  uint64_t v3 = 0;
  float32x4_t v4 = (_DWORD *)(a1 + 8);
  do
  {
    int v5 = 16 * a3 + v3;
    int v6 = a2[7] * v5 + 0x100000;
    if (a2[7] * v5 != -1048576) {
      int v6 = vcvts_n_s32_f32(1.0 / (float)((float)v6 * 0.00000095367), 0x14uLL);
    }
    *(v4 - 2) = (unint64_t)(*a2 * (uint64_t)v6 + 0x80000) >> 20;
    uint64_t result = a2[2];
    *(v4 - 1) = (unint64_t)((result + a2[1] * (uint64_t)v5) * v6 + 0x80000) >> 20;
    _DWORD *v4 = (unint64_t)(a2[3] * (uint64_t)v6 + 0x80000) >> 20;
    v4[1] = (unint64_t)((a2[5] + a2[4] * (uint64_t)v5) * v6 + 0x80000) >> 20;
    ++v3;
    v4 += 4;
  }
  while (v3 != 16);
  return result;
}

uint64_t calculateColTransforms_16_G(uint64_t a1, int *a2, int a3)
{
  uint64_t v3 = 0;
  float32x4_t v4 = (_DWORD *)(a1 + 8);
  do
  {
    int v5 = 16 * a3 + v3;
    int v6 = a2[6] * v5 + 0x100000;
    if (a2[6] * v5 != -1048576) {
      int v6 = vcvts_n_s32_f32(1.0 / (float)((float)v6 * 0.00000095367), 0x14uLL);
    }
    *(v4 - 2) = (unint64_t)(a2[1] * (uint64_t)v6 + 0x80000) >> 20;
    uint64_t result = a2[2];
    *(v4 - 1) = (unint64_t)((result + *a2 * (uint64_t)v5) * v6 + 0x80000) >> 20;
    _DWORD *v4 = (unint64_t)(a2[4] * (uint64_t)v6 + 0x80000) >> 20;
    v4[1] = (unint64_t)((a2[5] + a2[3] * (uint64_t)v5) * v6 + 0x80000) >> 20;
    ++v3;
    v4 += 4;
  }
  while (v3 != 16);
  return result;
}

uint64_t invertPTBilinearX_16x16_G(uint64_t result, unsigned int a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  uint64_t v6 = 0;
  int v7 = 16 * a5;
  uint64_t v8 = a3 - a4 + 16 * a4;
  uint64_t v9 = -(uint64_t)a4;
  do
  {
    uint64_t v10 = 0;
    unsigned int v11 = (int *)(a6 + 16 * v6);
    int v12 = *v11;
    int v13 = v11[2];
    int v14 = v11[3];
    int v15 = v11[1] + *v11 * v7;
    int v16 = v14 + v13 * v7;
    do
    {
      int v17 = (v15 >> 10) & 0x3FF;
      uint64_t v18 = (int)((v16 >> 20) * a2) + (uint64_t)(v15 >> 20);
      int v19 = *(unsigned __int8 *)(result + v18);
      int v20 = (*(unsigned __int8 *)(result + v18 + 1) - v19) * v17;
      LODWORD(v18) = (((*(unsigned __int8 *)(result + v18 + a2 + 1) - *(unsigned __int8 *)(result + v18 + a2)) * v17
                     - (v20
                      + (v19 << 10))
                     + (*(unsigned __int8 *)(result + v18 + a2) << 10)) >> 5)
                   * ((v16 >> 10) & 0x3FF)
                   + 32 * (v20 + (v19 << 10));
      *(unsigned char *)(v8 + v10) = (v18 >> 15) & ~((int)v18 >> 31);
      v15 += v12;
      v16 += v13;
      ++v10;
    }
    while (v10 != 16);
    ++v6;
    v8 += v9;
  }
  while (v6 != 16);
  return result;
}

uint64_t invertPTBilinearY_16x16_G(uint64_t result, unsigned int a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  uint64_t v6 = 0;
  int v7 = 16 * a5;
  uint64_t v8 = a4;
  do
  {
    uint64_t v9 = 0;
    uint64_t v10 = (int *)(a6 + 16 * v6);
    int v11 = *v10;
    int v12 = v10[2];
    int v13 = v10[3];
    int v14 = v10[1] + *v10 * v7;
    int v15 = v13 + v12 * v7;
    do
    {
      int v16 = (v14 >> 10) & 0x3FF;
      uint64_t v17 = (int)((v15 >> 20) * a2) + (uint64_t)(v14 >> 20);
      int v18 = *(unsigned __int8 *)(result + v17);
      int v19 = (*(unsigned __int8 *)(result + v17 + 1) - v18) * v16;
      LODWORD(v17) = (((*(unsigned __int8 *)(result + v17 + a2 + 1) - *(unsigned __int8 *)(result + v17 + a2)) * v16
                     - (v19
                      + (v18 << 10))
                     + (*(unsigned __int8 *)(result + v17 + a2) << 10)) >> 5)
                   * ((v15 >> 10) & 0x3FF)
                   + 32 * (v19 + (v18 << 10));
      *(unsigned char *)(a3 + v9) = (v17 >> 15) & ~((int)v17 >> 31);
      v14 += v11;
      v15 += v12;
      ++v9;
    }
    while (v9 != 16);
    ++v6;
    a3 += v8;
  }
  while (v6 != 16);
  return result;
}

uint64_t LogPolarRemap_G(uint64_t result, const unsigned __int16 *a2, const unsigned __int8 *a3, const unsigned __int8 *a4, unsigned int a5, unsigned __int8 *a6, unsigned int a7, unsigned int a8, unsigned int *a9)
{
  *a9 = 0;
  if (a7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = a7;
    do
    {
      if (a8)
      {
        int v12 = &a6[v9 & 0xFFFFFFFE];
        uint64_t v13 = v9;
        uint64_t v14 = a8;
        do
        {
          uint64_t v15 = *(const unsigned __int16 *)((char *)a2 + v13);
          unsigned int v16 = (a3[v13] * *(unsigned __int8 *)(result + v15)
               + a3[(v13 + 1)] * *(unsigned __int8 *)(result + v15 + 1)
               + a4[v13] * *(unsigned __int8 *)(result + v15 + a5)
               + a4[(v13 + 1)] * *(unsigned __int8 *)(result + v15 + a5 + 1)) >> 8;
          if (v16 >= 0xFF) {
            unsigned int v16 = 255;
          }
          *int v12 = v16;
          v12[a8] = v16;
          *a9 += v16;
          ++v12;
          v13 += 2;
          --v14;
        }
        while (v14);
      }
      ++v10;
      v9 += 2 * a8;
    }
    while (v10 != v11);
  }
  return result;
}

void MultiBlockReader::~MultiBlockReader(MultiBlockReader *this)
{
  *(void *)this = &unk_26DD17FF8;
  uint64_t v2 = *((void *)this + 21);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  uint64_t v3 = (PhaseDeviation **)*((void *)this + 22);
  if (v3)
  {
    TranslationStage::~TranslationStage(v3);
    MEMORY[0x22A6A4700]();
  }
  uint64_t v4 = *((void *)this + 23);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)this + 6);
  if (v5) {
    MEMORY[0x22A6A46F0](v5, 0x1000C8052888210);
  }
  uint64_t v6 = *((void *)this + 3);
  if (v6) {
    MEMORY[0x22A6A46F0](v6 - 16, 0x1080C8099388928);
  }
  CMCKeyChain::~CMCKeyChain((MultiBlockReader *)((char *)this + 72));
}

{
  uint64_t vars8;

  MultiBlockReader::~MultiBlockReader(this);
  JUMPOUT(0x22A6A4700);
}

uint64_t MultiBlockReader::Initialize(MultiBlockReader *this, BlockConfigBase *a2)
{
  if (a2)
  {
    *((void *)this + 8) = a2;
    operator new();
  }
  return 2;
}

uint64_t (***MultiBlockReader::SetReadStatsProvider(uint64_t a1, uint64_t a2))(void)
{
  *(void *)(a1 + 8) = a2;
  uint64_t result = *(uint64_t (****)(void))(a1 + 168);
  if (result) {
    return (uint64_t (***)(void))(**result)(result);
  }
  return result;
}

uint64_t MultiBlockReader::SetReadStatsImportance(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 16) = a2;
  uint64_t result = *(void *)(a1 + 168);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t CMCKeyChain::AddKey(CMCKeyChain *this, CMCKey *a2)
{
  if (a2 && *((_DWORD *)this + 2) != 10) {
    operator new();
  }
  return 0;
}

void sub_228A4AF7C(_Unwind_Exception *a1)
{
  MEMORY[0x22A6A4700](v1, 0x1091C400F2A5985);
  _Unwind_Resume(a1);
}

uint64_t MultiBlockReader::ReadWatermark(uint64_t a1, unsigned int *a2, int a3)
{
  if (!*(_DWORD *)(a1 + 80)) {
    return 6;
  }
  uint64_t v42 = 0;
  int v6 = *(_DWORD *)(a1 + 40);
  if (v6 != (*(unsigned int (**)(void))(**(void **)(a1 + 64) + 48))(*(void *)(a1 + 64)))
  {
    uint64_t v7 = *(void *)(a1 + 24);
    if (v7) {
      MEMORY[0x22A6A46F0](v7 - 16, 0x1080C8099388928);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      MEMORY[0x22A6A46F0](v8, 0x1000C8052888210);
    }
    *(_DWORD *)(a1 + 40) = (*(uint64_t (**)(void))(**(void **)(a1 + 64) + 48))(*(void *)(a1 + 64));
    operator new[]();
  }
  LOWORD(v43) = 0;
  int v41 = 0;
  if (!*(_DWORD *)(a1 + 40)) {
    goto LABEL_30;
  }
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  do
  {
    *(_DWORD *)(*(void *)(a1 + 48) + 4 * v10) = v10;
    uint64_t v11 = *(void *)(a1 + 24) + v9;
    *(void *)uint64_t v11 = 0;
    *(void *)(v11 + 8) = 0;
    *(_DWORD *)(v11 + 16) = -1;
    *(_OWORD *)(v11 + 24) = 0uLL;
    *(_OWORD *)(v11 + 40) = 0uLL;
    *(_OWORD *)(v11 + 56) = 0uLL;
    *(_OWORD *)(v11 + 72) = 0uLL;
    *(_OWORD *)(v11 + 88) = 0uLL;
    *(_OWORD *)(v11 + 104) = 0uLL;
    *(_OWORD *)(v11 + 120) = 0uLL;
    ++v10;
    unint64_t v12 = *(unsigned int *)(a1 + 40);
    v9 += 136;
  }
  while (v10 < v12);
  if (v12)
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = *(void *)(a1 + 24);
      if (!(*(uint64_t (**)(void, unint64_t))(**(void **)(a1 + 64) + 40))(*(void *)(a1 + 64), v14))return 4; {
      uint64_t v16 = v15 + v13;
      }
      *(_DWORD *)(v15 + v13 + 16) = 0;
      (*(void (**)(void, unint64_t, unsigned __int8 **, int *, int *))(**(void **)(a1 + 64) + 24))(*(void *)(a1 + 64), v14, &v42, &v43, &v41);
      uint64_t result = DetectStage::DoFirstStage(*(void *)(a1 + 168), v42, (unsigned __int16)v43, &v41, v15 + v13 + 72, a2);
      if (result) {
        return result;
      }
      if (a2)
      {
        int v18 = (void (*)(void))*((void *)a2 + 1);
        if (v18) {
          v18(*a2);
        }
        int v19 = (unsigned char *)*((void *)a2 + 2);
        if (v19)
        {
          if (*v19) {
            return 9;
          }
        }
      }
      uint64_t v20 = *(void *)(a1 + 168);
      int v21 = *(_DWORD *)(v20 + 20);
      *(_DWORD *)(v15 + v13) = v21;
      if (v21 >= 91)
      {
        *(_DWORD *)(v16 + 16) = 1;
        *(_DWORD *)(v15 + v13 + 12) = *(_DWORD *)(v15 + v13 + 104);
        uint64_t result = TranslationStage::GetBlockTranslationPD(*(PhaseDeviation ***)(a1 + 176), *(const __int16 **)(v20 + 32), (int32x4_t *)(v15 + v13 + 72));
        if (result) {
          return result;
        }
        int v22 = *(_DWORD *)(*(void *)(a1 + 176) + 8);
        *(_DWORD *)(v15 + v13 + 4) = v22;
        if (v22 <= -1769473)
        {
          *(_DWORD *)(v16 + 16) = 2;
          *(_DWORD *)(v15 + v13 + 8) = *(_DWORD *)(v15 + v13 + 108);
        }
      }
      if (a2)
      {
        int v23 = (void (*)(void))*((void *)a2 + 1);
        if (v23) {
          v23(*a2);
        }
        int v24 = (unsigned char *)*((void *)a2 + 2);
        if (v24)
        {
          if (*v24) {
            return 9;
          }
        }
      }
      ++v14;
      v13 += 136;
      if (v14 >= *(unsigned int *)(a1 + 40)) {
        goto LABEL_30;
      }
    }
  }
  else
  {
LABEL_30:
    if ((*(unsigned int (**)(void))(**(void **)(a1 + 64) + 48))(*(void *)(a1 + 64)) >= 2)
    {
      unint64_t v25 = 1;
      do
      {
        while (1)
        {
          uint64_t v26 = *(void *)(a1 + 48);
          unsigned int v27 = *(_DWORD *)(v26 + 4 * (v25 - 1));
          unsigned int v28 = *(_DWORD *)(v26 + 4 * v25);
          if (*(_DWORD *)(*(void *)(a1 + 24) + 136 * v27 + 4) <= *(_DWORD *)(*(void *)(a1 + 24) + 136 * v28 + 4)) {
            break;
          }
          *(_DWORD *)(v26 + 4 * (v25 - 1)) = v28;
          *(_DWORD *)(v26 + 4 * v25) = v27;
          unint64_t v25 = 1;
          if ((*(unsigned int (**)(void))(**(void **)(a1 + 64) + 48))(*(void *)(a1 + 64)) <= 1) {
            goto LABEL_36;
          }
        }
        ++v25;
      }
      while (v25 < (*(unsigned int (**)(void))(**(void **)(a1 + 64) + 48))(*(void *)(a1 + 64)));
    }
LABEL_36:
    uint64_t v29 = 56;
    if (a3) {
      uint64_t v29 = 40;
    }
    uint64_t v30 = *(unsigned int *)(a1 + v29);
    if (v30)
    {
      uint64_t v31 = 0;
      uint64_t v32 = 4 * v30;
      while (1)
      {
        if (a2)
        {
          int v33 = (void (*)(void))*((void *)a2 + 1);
          if (v33) {
            v33(*a2);
          }
          BOOL v34 = (unsigned char *)*((void *)a2 + 2);
          if (v34)
          {
            if (*v34) {
              return 9;
            }
          }
        }
        uint64_t v35 = *(unsigned int *)(*(void *)(a1 + 48) + v31);
        if (*(_DWORD *)(*(void *)(a1 + 24) + 136 * v35 + 16) != 2) {
          goto LABEL_55;
        }
        uint64_t v39 = 0;
        uint64_t v40 = 0;
        uint64_t v38 = 0;
        int v37 = 0;
        (*(void (**)(void, uint64_t, uint64_t *, uint64_t *, char *, uint64_t *, int *, char *))(**(void **)(a1 + 64) + 32))(*(void *)(a1 + 64), v35, &v40, &v39, (char *)&v38 + 4, &v38, &v37, (char *)&v39 + 4);
        ReadStage::ReadWatermark(*(void *)(a1 + 184), v40, SHIDWORD(v38), v39, v38, v37, SHIDWORD(v39), (uint32x2_t *)(*(void *)(a1 + 24) + 136 * v35 + 72), *(void *)(a1 + 24) + 136 * v35 + 24, a2);
        uint64_t v36 = *(void *)(a1 + 24);
        if (!*(unsigned char *)(v36 + 136 * v35 + 36) || (*(_DWORD *)(v36 + 136 * v35 + 16) = 3, (a3 & 1) != 0))
        {
LABEL_55:
          v31 += 4;
          if (v32 != v31) {
            continue;
          }
        }
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
}

void CMCKeyChain::~CMCKeyChain(CMCKeyChain *this)
{
  CMCKeyChain::~CMCKeyChain(this);
  JUMPOUT(0x22A6A4700);
}

{
  uint64_t i;
  uint64_t v3;

  *(void *)this = &unk_26DD18040;
  for (uint64_t i = 16; i != 96; i += 8)
  {
    uint64_t v3 = *(void *)((char *)this + i);
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
    }
  }
}

void PayloadInfo::~PayloadInfo(PayloadInfo *this)
{
}

uint64_t octaxis_128x128_YUV422_G(const unsigned __int8 *a1, unsigned int a2, signed __int8 *a3)
{
  uint64_t v3 = 0;
  unint64_t v4 = 0;
  int v5 = -a2;
  int v6 = -a2 - 1;
  uint64_t v7 = a2;
  unsigned int v8 = a2 - 1;
  uint64_t v9 = &a1[a2];
  do
  {
    unint64_t v10 = 0;
    uint64_t v11 = (v4 - 1) & 0xFF80;
    unint64_t v12 = v4 + 1;
    uint64_t v13 = v3;
    do
    {
      if (v11)
      {
        char v14 = 0;
      }
      else
      {
        unsigned int v15 = a1[v13 + 1];
        unsigned int v16 = a1[(v5 + v13 + 1)];
        BOOL v17 = v15 >= v16;
        char v14 = v15 != v16;
        if (!v17) {
          char v14 = -1;
        }
      }
      if (v4 > 0x7E)
      {
        char v20 = 0;
      }
      else
      {
        unsigned int v18 = a1[v13 + 1];
        unsigned int v19 = v9[v13 + 1];
        BOOL v17 = v18 >= v19;
        char v20 = v18 != v19;
        if (!v17) {
          char v20 = -1;
        }
      }
      if (v10 > 0x7E)
      {
        char v24 = 0;
      }
      else
      {
        unsigned int v21 = a1[v13 + 1];
        unsigned int v22 = a1[v13 + 3];
        BOOL v17 = v21 >= v22;
        BOOL v23 = v21 != v22;
        if (v17) {
          char v24 = v23;
        }
        else {
          char v24 = -1;
        }
      }
      unint64_t v25 = v10 - 1;
      if ((((v10 - 1) | v4) & 0x8000) != 0)
      {
        char v28 = 0;
      }
      else
      {
        unsigned int v26 = a1[v13 + 1];
        unsigned int v27 = a1[(v13 - 1)];
        BOOL v17 = v26 >= v27;
        char v28 = v26 != v27;
        if (!v17) {
          char v28 = -1;
        }
      }
      char v29 = 0;
      if (!v11 && v10 <= 0x7E)
      {
        unsigned int v30 = a1[v13 + 1];
        unsigned int v31 = a1[(v5 + v13 + 3)];
        BOOL v17 = v30 >= v31;
        char v29 = v30 != v31;
        if (!v17) {
          char v29 = -1;
        }
      }
      char v32 = 0;
      if (v4 <= 0x7E && ((v25 | v12) & 0x8000) == 0)
      {
        unsigned int v33 = a1[v13 + 1];
        unsigned int v34 = a1[v8 + v13];
        BOOL v17 = v33 >= v34;
        char v32 = v33 != v34;
        if (!v17) {
          char v32 = -1;
        }
      }
      if (((v25 | (v4 - 1)) & 0x8000) != 0)
      {
        char v37 = 0;
      }
      else
      {
        unsigned int v35 = a1[v13 + 1];
        unsigned int v36 = a1[(v6 + v13)];
        BOOL v17 = v35 >= v36;
        char v37 = v35 != v36;
        if (!v17) {
          char v37 = -1;
        }
      }
      char v38 = 0;
      if (v4 <= 0x7E && v10 <= 0x7E)
      {
        unsigned int v39 = a1[v13 + 1];
        unsigned int v40 = v9[v13 + 3];
        BOOL v17 = v39 >= v40;
        char v38 = v39 != v40;
        if (!v17) {
          char v38 = -1;
        }
      }
      a3[v10] = v20 + v14 + v24 + v28 + v29 + v32 + v37 + v38;
      v13 += 2;
      ++v10;
    }
    while (v25 != 126);
    a3 += 128;
    v3 += v7;
    ++v4;
  }
  while (v12 != 128);
  return 0;
}

uint64_t octaxis_O(uint64_t result, int a2, int a3, unsigned int a4, signed __int8 *a5)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v5 = (a2 - 1);
  uint64_t v6 = a4;
  uint64_t v7 = (unsigned __int8 *)(result + a4);
  unsigned int v8 = *(unsigned __int8 *)result;
  unsigned int v9 = *v7;
  BOOL v10 = v8 >= v9;
  int v11 = v8 != v9;
  if (!v10) {
    int v11 = -1;
  }
  int v12 = -v11;
  signed __int8 v64 = -(char)v11;
  if (a2 < 2)
  {
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v13 = v65;
    uint64_t v14 = (a2 - 1);
    unsigned int v15 = a5;
    uint64_t v16 = result;
    do
    {
      BOOL v17 = (unsigned __int8 *)(v16 + v6);
      unsigned int v18 = *(unsigned __int8 *)(v16 + v6 + 1);
      BOOL v10 = v18 >= v8;
      char v19 = v18 != v8;
      if (!v10) {
        char v19 = -1;
      }
      unsigned int v21 = *(unsigned __int8 *)++v16;
      unsigned int v20 = v21;
      BOOL v10 = v21 >= v8;
      char v22 = v21 != v8;
      if (!v10) {
        char v22 = -1;
      }
      *v15++ = v11 - v22 - v19;
      unsigned int v23 = *v17;
      BOOL v10 = v20 >= v23;
      char v24 = v20 != v23;
      if (!v10) {
        char v24 = -1;
      }
      char v25 = v24 + v22;
      *(v13 - 1) = v12 - v24;
      unsigned int v26 = v17[1];
      BOOL v10 = v20 >= v26;
      BOOL v27 = v20 != v26;
      if (v10) {
        char v28 = v27;
      }
      else {
        char v28 = -1;
      }
      LOBYTE(v11) = v25 + v28;
      LOBYTE(v12) = v19 - v28;
      *v13++ = v12;
      unsigned int v8 = v20;
      --v14;
    }
    while (v14);
    uint64_t v29 = (a2 - 1);
  }
  a5[v29] = v11;
  int v30 = a3 - 2;
  if (a3 <= 2)
  {
    unsigned int v33 = v7;
  }
  else
  {
    uint64_t v31 = result + 2 * v6;
    char v32 = &a5[a2];
    LODWORD(result) = 1;
    do
    {
      unsigned int v33 = &v7[v6];
      unsigned int v34 = *v7;
      unsigned int v35 = v7[v6];
      BOOL v10 = v35 >= v34;
      BOOL v36 = v35 != v34;
      if (v10) {
        char v37 = v36;
      }
      else {
        char v37 = -1;
      }
      signed __int8 v38 = v64 - v37;
      signed __int8 v64 = v37;
      if ((int)v5 < 1)
      {
        int v51 = 0;
      }
      else
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          unsigned int v40 = (unsigned __int8 *)(v31 + i);
          unsigned int v41 = *(unsigned __int8 *)(v31 + i + 1);
          BOOL v10 = v41 >= v34;
          char v42 = v41 != v34;
          if (!v10) {
            char v42 = -1;
          }
          unsigned int v43 = v7[i + 1];
          BOOL v10 = v43 >= v34;
          char v44 = v43 != v34;
          if (!v10) {
            char v44 = -1;
          }
          v32[i] = v38 - (v42 + v44);
          char v45 = v65[i];
          unsigned int v46 = *v40;
          BOOL v10 = v43 >= v46;
          char v47 = v43 != v46;
          if (!v10) {
            char v47 = -1;
          }
          v65[i - 1] = v37 - v47;
          unsigned int v48 = v40[1];
          BOOL v10 = v43 >= v48;
          BOOL v49 = v43 != v48;
          if (v10) {
            char v50 = v49;
          }
          else {
            char v50 = -1;
          }
          char v37 = v42 - v50;
          v65[i] = v42 - v50;
          signed __int8 v38 = v44 + v45 + v47 + v50;
          unsigned int v34 = v43;
        }
        int v51 = a2 - 1;
      }
      a5 += a2;
      a5[v51] = v38;
      v31 += v6;
      v32 += a2;
      uint64_t v7 = v33;
      BOOL v52 = result == v30;
      uint64_t result = (result + 1);
    }
    while (!v52);
  }
  signed __int8 v53 = v64;
  if (a2 < 2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    unsigned int v56 = *v33;
    unsigned int v54 = v33 + 1;
    unsigned int v55 = v56;
    unsigned int v57 = v65;
    uint64_t v58 = (a2 - 1);
    unsigned int v59 = &a5[a2];
    do
    {
      unsigned int v61 = *v54++;
      unsigned int v60 = v61;
      BOOL v10 = v61 >= v55;
      char v62 = v61 != v55;
      if (!v10) {
        char v62 = -1;
      }
      *v59++ = v53 - v62;
      char v63 = *v57++;
      signed __int8 v53 = v62 + v63;
      unsigned int v55 = v60;
      --v58;
    }
    while (v58);
  }
  a5[a2 + v5] = v53;
  return result;
}

uint64_t PhaseDeviation::Initialize(PhaseDeviation *this)
{
  if (!*((void *)this + 4)) {
    operator new[]();
  }
  uint64_t v2 = *((void *)this + 3);
  if (!v2) {
    operator new[]();
  }
  *((void *)this + 13) = v2 + 128;
  *((void *)this + 14) = v2 + 256;
  uint64_t v3 = *((void *)this + 5);
  if (!v3) {
    operator new[]();
  }
  *((void *)this + 6) = v3 + 32;
  *((void *)this + 7) = v3 + 64;
  *((void *)this + 8) = v3 + 96;
  *((void *)this + 11) = v3 + 128;
  *((void *)this + 12) = v3 + 192;
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    operator new[]();
  }
  *((void *)this + 10) = v4 + 32;
  *((void *)this + 15) = v4 + 64;
  *((void *)this + 16) = v4 + 128;
  return 0;
}

uint64_t PhaseDeviation::doPhaseEstimation(PhaseDeviation *this, const __int16 *a2, const int (*a3)[4])
{
  uint64_t v5 = 0;
  int v6 = (*a3)[0];
  int v7 = (*a3)[1];
  int v8 = (*a3)[2];
  int v9 = (*a3)[3];
  uint64_t v10 = *((void *)this + 4);
  int v80 = v7;
  int v81 = (*a3)[0];
  int v78 = v9;
  int v79 = v8;
  do
  {
    int v11 = CGridLuts::m_GridY[v5];
    int v12 = CGridLuts::m_GridX[v5];
    int v13 = v6 * v11 + v8 * v12;
    unsigned int v14 = (v13 + 0x2000) >> 14;
    int v15 = (v9 * v12 + v7 * v11 + 0x2000) >> 14;
    if (v13 >= -8192) {
      int v16 = v15;
    }
    else {
      int v16 = -v15;
    }
    if (v13 < -8192) {
      unsigned int v14 = -v14;
    }
    *(unsigned char *)(v10 + v5) = 0;
    if ((v16 - 4032) >= 0xFFFFE040 && v14 <= 0xFFF)
    {
      unsigned int v17 = v16 + 4096;
      unsigned int v18 = (v16 + 4096) >> 6;
      unsigned int v19 = 2 * (v16 & 0x3F);
      int v20 = PhaseDeviation::m_Fract1DComplexPSF_Q6[v19];
      int v21 = PhaseDeviation::m_Fract1DComplexPSF_Q6[v19 | 1];
      int v22 = PhaseDeviation::m_Fract1DComplexPSF_Q6[128 - v19];
      int v23 = PhaseDeviation::m_Fract1DComplexPSF_Q6[129 - v19];
      unsigned int v24 = v18 + 1;
      int v25 = 2 * v14;
      unsigned int v26 = (2 * v14) & 0x7E;
      int v27 = PhaseDeviation::m_Fract1DComplexPSF_Q6[v26];
      int v28 = PhaseDeviation::m_Fract1DComplexPSF_Q6[(2 * (v14 & 0x3F)) | 1];
      int v29 = PhaseDeviation::m_Fract1DComplexPSF_Q6[128 - v26];
      int v30 = PhaseDeviation::m_Fract1DComplexPSF_Q6[129 - v26];
      int v31 = (v30 * v23 + v29 * v22 + 2048) >> 12;
      int v32 = (v30 * v22 - v23 * v29 + 2048) >> 12;
      int v33 = v25 & 0x7FFFFF80;
      unsigned int v34 = (v25 & 0x7FFFFF80) + 128 + v24;
      int v35 = a2[2 * v34];
      int v36 = a2[(2 * v34) | 1];
      int v37 = (v27 * v22 - v28 * v23 + 2048) >> 12;
      int v38 = -(v28 * v22) - v23 * v27 + 2048;
      unsigned int v39 = v24 + v33;
      int v40 = a2[2 * v24 + 2 * v33];
      v38 >>= 12;
      int v41 = a2[(2 * v39) | 1];
      int v42 = (v29 * v20 - v30 * v21 + 2048) >> 12;
      int v43 = (v30 * v20 + v29 * v21 + 2048) >> 12;
      int v44 = v33 + 128 + (v17 >> 6);
      int v45 = a2[2 * v44];
      int v46 = a2[(2 * v44) | 1];
      int v47 = (v28 * v21 + v27 * v20 + 2048) >> 12;
      int v48 = (v27 * v21 - v28 * v20 + 2048) >> 12;
      int v49 = v33 + (v17 >> 6);
      int v50 = a2[2 * v49];
      int v51 = a2[(2 * v49) | 1];
      int v52 = v32 * v36 + v38 * v41 + v43 * v46 + v48 * v51;
      int v53 = v31 * v35 + v37 * v40 + v42 * v45 + v47 * v50;
      int v54 = v53 - v52;
      int v55 = v31 * v36 + v32 * v35 + v38 * v40 + v37 * v41 + v43 * v45 + v42 * v46 + v48 * v50 + v47 * v51;
      if (v13 >= -8192) {
        unint64_t v56 = v55;
      }
      else {
        unint64_t v56 = -v55;
      }
      if (v54 >= 0) {
        unsigned int v57 = v53 - v52;
      }
      else {
        unsigned int v57 = v52 - v53;
      }
      if (v55 < 0) {
        int v55 = -v55;
      }
      if (v55 >= v57)
      {
        __int16 v60 = PhaseDeviation::atanOver2PiQ16Octant18((PhaseDeviation *)v56, v53 - v52);
        __int16 v59 = -16384 - v60;
        if ((int)v56 >= 1) {
          __int16 v59 = 0x4000 - v60;
        }
      }
      else
      {
        __int16 v58 = PhaseDeviation::atanOver2PiQ16Octant18((PhaseDeviation *)(v53 - v52), v56);
        __int16 v59 = v58 ^ 0x8000;
        if (v54 > 0) {
          __int16 v59 = v58;
        }
      }
      int v7 = v80;
      int v6 = v81;
      int v9 = v78;
      int v8 = v79;
      *(_WORD *)(*((void *)this + 3) + 2 * v5) = v59;
      *(unsigned char *)(v10 + v5) = 1;
    }
    ++v5;
  }
  while (v5 != 64);
  uint64_t v61 = 0;
  *((_DWORD *)this + 4) = 0;
  do
  {
    *(unsigned char *)(*((void *)this + 15) + v61) = 0;
    *(unsigned char *)(*((void *)this + 16) + v61) = 0;
    *(unsigned char *)(*((void *)this + 11) + v61) = 0;
    *(unsigned char *)(*((void *)this + 12) + v61) = 0;
    uint64_t v62 = *((void *)this + 14);
    *(_WORD *)(*((void *)this + 13) + 2 * v61) = 0;
    *(_WORD *)(v62 + 2 * v61) = 0;
    if (*(unsigned char *)(*((void *)this + 4) + v61))
    {
      *(unsigned char *)(*((void *)this + 15) + *((int *)this + 4)) = CGridLuts::m_GridX[v61];
      *(unsigned char *)(*((void *)this + 16) + *((int *)this + 4)) = CGridLuts::m_GridY[v61];
      __int16 v63 = CGridLuts::m_anGridPhase[v61];
      *(unsigned char *)(*((void *)this + 11) + *((int *)this + 4)) = (unsigned __int16)(*(_WORD *)(*((void *)this + 3)
                                                                                            + 2 * v61)
                                                                                 - v63
                                                                                 + 128) >> 8;
      *(unsigned char *)(*((void *)this + 12) + *((int *)this + 4)) = (unsigned __int16)(v63
                                                                                 + *(_WORD *)(*((void *)this + 3)
                                                                                            + 2 * v61)
                                                                                 + 128) >> 8;
      uint64_t v64 = *((void *)this + 3);
      uint64_t v65 = *((int *)this + 4);
      uint64_t v66 = *((void *)this + 14);
      *(_WORD *)(*((void *)this + 13) + 2 * v65) = *(_WORD *)(v64 + 2 * v61) - v63;
      *(_WORD *)(v66 + 2 * v65) = *(_WORD *)(v64 + 2 * v61) + v63;
      *((_DWORD *)this + 4) = v65 + 1;
    }
    ++v61;
  }
  while (v61 != 64);
  uint64_t v67 = 0;
  uint64_t v68 = 0;
  *((_DWORD *)this + 5) = 0;
  uint64_t v69 = 1u;
  do
  {
    *(unsigned char *)(*((void *)this + 5) + v68) = 0;
    *(unsigned char *)(*((void *)this + 7) + v68) = 0;
    *(unsigned char *)(*((void *)this + 6) + v68) = 0;
    *(unsigned char *)(*((void *)this + 8) + v68) = 0;
    *(unsigned char *)(*((void *)this + 9) + v68) = 0;
    *(unsigned char *)(*((void *)this + 10) + v68) = 0;
    uint64_t v70 = *((void *)this + 4);
    if (*(unsigned char *)(v70 + v67) && *(unsigned char *)(v70 + v67 + 1))
    {
      int v71 = (_WORD *)(*((void *)this + 3) + v69 * 2);
      __int16 v72 = *(v71 - 1);
      LOWORD(v71) = *v71;
      __int16 v73 = CGridLuts::m_anGridPhase[v69 - 1];
      __int16 v74 = CGridLuts::m_anGridPhase[v69];
      __int16 v75 = v72 - v73 + 128;
      *(unsigned char *)(*((void *)this + 5) + v68) = (unsigned __int16)(v75 - ((_WORD)v71 - v74)) >> 8;
      *(unsigned char *)(*((void *)this + 6) + v68) = (unsigned __int16)(v75 + (_WORD)v71 - v74) >> 8;
      LOWORD(v71) = v74 + (_WORD)v71;
      __int16 v76 = v72 + v73 + 128;
      *(unsigned char *)(*((void *)this + 7) + v68) = (unsigned __int16)(v76 - (_WORD)v71) >> 8;
      *(unsigned char *)(*((void *)this + 8) + v68) = (unsigned __int16)((_WORD)v71 + v76) >> 8;
      *(unsigned char *)(*((void *)this + 9) + v68) = 2 * CGridLuts::m_GridX[v67];
      *(unsigned char *)(*((void *)this + 10) + v68) = 2 * CGridLuts::m_GridY[v67];
      ++*((_DWORD *)this + 5);
    }
    ++v68;
    v67 += 2;
    v69 += 2;
  }
  while (v68 != 32);
  return 0;
}

void PhaseDeviation::~PhaseDeviation(PhaseDeviation *this)
{
  uint64_t v2 = *((void *)this + 4);
  if (v2) {
    MEMORY[0x22A6A46F0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3) {
    MEMORY[0x22A6A46F0](v3, 0x1000C80BDFB0063);
  }
  uint64_t v4 = *((void *)this + 5);
  if (v4) {
    MEMORY[0x22A6A46F0](v4, 0x1000C8077774924);
  }
  uint64_t v5 = *((void *)this + 9);
  if (v5) {
    MEMORY[0x22A6A46F0](v5, 0x1000C8077774924);
  }
}

uint64_t PhaseDeviation::Calc1DWith2DSparseRefinement(PhaseDeviation *this, int a2, unsigned __int8 a3, unsigned __int8 a4, unsigned __int8 *a5)
{
  uint64_t v7 = 0;
  uint64_t v142 = *MEMORY[0x263EF8340];
  uint64_t v8 = *((void *)this + 9);
  uint64_t v9 = *((void *)this + 5);
  uint64_t v10 = *((void *)this + 7);
  v11.i64[0] = 0xFF000000FFLL;
  v11.i64[1] = 0xFF000000FFLL;
  do
  {
    uint64_t v12 = 0;
    int8x16_t v13 = vdupq_n_s8(v7);
    int16x8_t v14 = 0uLL;
    int16x8_t v15 = 0uLL;
    int16x8_t v16 = 0uLL;
    int16x8_t v17 = 0uLL;
    do
    {
      int8x16_t v18 = vmulq_s8(*(int8x16_t *)(v8 + v12), v13);
      uint8x16_t v19 = (uint8x16_t)vsubq_s8(*(int8x16_t *)(v9 + v12), v18);
      uint16x8_t v20 = vmovl_u8(*(uint8x8_t *)v19.i8);
      int8x16_t v21 = (int8x16_t)vmovl_high_u16(v20);
      uint16x8_t v22 = vmovl_high_u8(v19);
      int8x16_t v23 = (int8x16_t)vmovl_high_u16(v22);
      int32x4_t v24 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v20.i8);
      int32x4_t v25 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v22.i8);
      int8x16_t v26 = (int8x16_t)vnegq_s32(v25);
      int8x16_t v27 = (int8x16_t)vsubw_high_u16((uint32x4_t)0, v22);
      int8x16_t v28 = (int8x16_t)vnegq_s32(v24);
      int8x16_t v29 = (int8x16_t)vsubw_high_u16((uint32x4_t)0, v20);
      int16x8_t v17 = vaddq_s16((int16x8_t)(*(_OWORD *)&vuzp1q_s16((int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v26, v11), (uint32x4_t)v25), (int8x16_t)v25, v26), (int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v27, v11), (uint32x4_t)v23), v23, v27)) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)), v17);
      int16x8_t v16 = vaddq_s16((int16x8_t)(*(_OWORD *)&vuzp1q_s16((int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v28, v11), (uint32x4_t)v24), (int8x16_t)v24, v28), (int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v29, v11), (uint32x4_t)v21), v21, v29)) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)), v16);
      uint8x16_t v30 = (uint8x16_t)vsubq_s8(*(int8x16_t *)(v10 + v12), v18);
      uint16x8_t v31 = vmovl_u8(*(uint8x8_t *)v30.i8);
      int8x16_t v32 = (int8x16_t)vmovl_high_u16(v31);
      uint16x8_t v33 = vmovl_high_u8(v30);
      int8x16_t v34 = (int8x16_t)vmovl_high_u16(v33);
      int32x4_t v35 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v31.i8);
      int32x4_t v36 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v33.i8);
      int8x16_t v37 = (int8x16_t)vnegq_s32(v36);
      int8x16_t v38 = (int8x16_t)vsubw_high_u16((uint32x4_t)0, v33);
      int8x16_t v39 = (int8x16_t)vnegq_s32(v35);
      int8x16_t v40 = (int8x16_t)vsubw_high_u16((uint32x4_t)0, v31);
      int16x8_t v15 = vaddq_s16((int16x8_t)(*(_OWORD *)&vuzp1q_s16((int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v37, v11), (uint32x4_t)v36), (int8x16_t)v36, v37), (int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v38, v11), (uint32x4_t)v34), v34, v38)) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)), v15);
      int16x8_t v14 = vaddq_s16((int16x8_t)(*(_OWORD *)&vuzp1q_s16((int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v39, v11), (uint32x4_t)v35), (int8x16_t)v35, v39), (int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v40, v11), (uint32x4_t)v32), v32, v40)) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)), v14);
      v12 += 16;
    }
    while (v12 != 32);
    v141[v7] = vaddvq_s16(vaddq_s16(v16, v17));
    v140[v7++] = vaddvq_s16(vaddq_s16(v14, v15));
  }
  while (v7 != 128);
  uint64_t v41 = 0;
  uint64_t v42 = *((void *)this + 10);
  uint64_t v43 = *((void *)this + 6);
  v44.i64[0] = 0xFF000000FFLL;
  v44.i64[1] = 0xFF000000FFLL;
  uint64_t v45 = *((void *)this + 8);
  do
  {
    uint64_t v46 = 0;
    int8x16_t v47 = vdupq_n_s8(v41);
    int16x8_t v48 = 0uLL;
    int16x8_t v49 = 0uLL;
    int16x8_t v50 = 0uLL;
    int16x8_t v51 = 0uLL;
    do
    {
      int8x16_t v52 = vmulq_s8(*(int8x16_t *)(v42 + v46), v47);
      uint8x16_t v53 = (uint8x16_t)vsubq_s8(*(int8x16_t *)(v43 + v46), v52);
      uint16x8_t v54 = vmovl_u8(*(uint8x8_t *)v53.i8);
      int8x16_t v55 = (int8x16_t)vmovl_high_u16(v54);
      uint16x8_t v56 = vmovl_high_u8(v53);
      int8x16_t v57 = (int8x16_t)vmovl_high_u16(v56);
      int32x4_t v58 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v54.i8);
      int32x4_t v59 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v56.i8);
      int8x16_t v60 = (int8x16_t)vnegq_s32(v59);
      int8x16_t v61 = (int8x16_t)vsubw_high_u16((uint32x4_t)0, v56);
      int8x16_t v62 = (int8x16_t)vnegq_s32(v58);
      int8x16_t v63 = (int8x16_t)vsubw_high_u16((uint32x4_t)0, v54);
      int16x8_t v51 = vaddq_s16((int16x8_t)(*(_OWORD *)&vuzp1q_s16((int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v60, v44), (uint32x4_t)v59), (int8x16_t)v59, v60), (int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v61, v44), (uint32x4_t)v57), v57, v61)) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)), v51);
      int16x8_t v50 = vaddq_s16((int16x8_t)(*(_OWORD *)&vuzp1q_s16((int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v62, v44), (uint32x4_t)v58), (int8x16_t)v58, v62), (int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v63, v44), (uint32x4_t)v55), v55, v63)) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)), v50);
      uint8x16_t v64 = (uint8x16_t)vsubq_s8(*(int8x16_t *)(v45 + v46), v52);
      uint16x8_t v65 = vmovl_u8(*(uint8x8_t *)v64.i8);
      int8x16_t v66 = (int8x16_t)vmovl_high_u16(v65);
      uint16x8_t v67 = vmovl_high_u8(v64);
      int8x16_t v68 = (int8x16_t)vmovl_high_u16(v67);
      int32x4_t v69 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v65.i8);
      int32x4_t v70 = (int32x4_t)vmovl_u16(*(uint16x4_t *)v67.i8);
      int8x16_t v71 = (int8x16_t)vnegq_s32(v70);
      int8x16_t v72 = (int8x16_t)vsubw_high_u16((uint32x4_t)0, v67);
      int8x16_t v73 = (int8x16_t)vnegq_s32(v69);
      int8x16_t v74 = (int8x16_t)vsubw_high_u16((uint32x4_t)0, v65);
      int16x8_t v49 = vaddq_s16((int16x8_t)(*(_OWORD *)&vuzp1q_s16((int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v71, v44), (uint32x4_t)v70), (int8x16_t)v70, v71), (int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v72, v44), (uint32x4_t)v68), v68, v72)) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)), v49);
      int16x8_t v48 = vaddq_s16((int16x8_t)(*(_OWORD *)&vuzp1q_s16((int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v73, v44), (uint32x4_t)v69), (int8x16_t)v69, v73), (int16x8_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vandq_s8(v74, v44), (uint32x4_t)v66), v66, v74)) & __PAIR128__(0xFF00FF00FF00FFLL, 0xFF00FF00FF00FFLL)), v48);
      v46 += 16;
    }
    while (v46 != 32);
    v139[v41] = vaddvq_s16(vaddq_s16(v50, v51));
    v138[v41++] = vaddvq_s16(vaddq_s16(v48, v49));
  }
  while (v41 != 128);
  PhaseDeviation::partialSort((uint64_t)v141, v137, a3, a4, a5);
  PhaseDeviation::partialSort((uint64_t)v139, (unsigned __int16 *)&v135, v75, v76, v77);
  uint64_t v79 = 0;
  for (uint64_t i = 0; i != 10; ++i)
  {
    int v81 = &v133[v79];
    unsigned int v82 = &v134[v79];
    uint64_t v83 = 0x101010101010101 * *((unsigned __int8 *)v137 + i);
    *(void *)unsigned int v82 = v83;
    *((_WORD *)v82 + 4) = v83;
    *(void *)int v81 = v135;
    *((_WORD *)v81 + 4) = v136;
    v79 += 10;
  }
  v127 = this;
  PhaseDeviation::do2DSparsePD64_G((uint64_t)this, *((unsigned __int8 **)this + 11), v134, v133, (uint64_t)v131, v78);
  uint64_t v87 = 0;
  unsigned int v88 = 0;
  unsigned int v89 = 0;
  __int16 v90 = (unsigned __int16 *)v132;
  unsigned int v91 = 0xFFFF;
  do
  {
    if (*(v90 - 2) < v91)
    {
      unsigned int v89 = v134[v87];
      unsigned int v88 = v133[v87];
      unsigned int v91 = *(v90 - 2);
    }
    if (*(v90 - 1) < v91)
    {
      unsigned int v89 = v134[v87] ^ 0xFFFFFF80;
      unsigned int v88 = v133[v87];
      unsigned int v91 = *(v90 - 1);
    }
    if (*v90 < v91)
    {
      unsigned int v89 = v134[v87];
      unsigned int v88 = v133[v87] ^ 0xFFFFFF80;
      unsigned int v91 = *v90;
    }
    if (v90[1] < v91)
    {
      unsigned int v89 = v134[v87] ^ 0xFFFFFF80;
      unsigned int v88 = v133[v87] ^ 0xFFFFFF80;
      unsigned int v91 = v90[1];
    }
    v90 += 4;
    ++v87;
  }
  while (v87 != 100);
  PhaseDeviation::partialSort((uint64_t)v140, v137, v84, v85, v86);
  PhaseDeviation::partialSort((uint64_t)v138, (unsigned __int16 *)&v135, v92, v93, v94);
  uint64_t v96 = 0;
  for (uint64_t j = 0; j != 10; ++j)
  {
    int v98 = &v133[v96];
    int v99 = &v134[v96];
    uint64_t v100 = 0x101010101010101 * *((unsigned __int8 *)v137 + j);
    *(void *)int v99 = v100;
    *((_WORD *)v99 + 4) = v100;
    *(void *)int v98 = v135;
    *((_WORD *)v98 + 4) = v136;
    v96 += 10;
  }
  PhaseDeviation::do2DSparsePD64_G((uint64_t)v127, *((unsigned __int8 **)v127 + 12), v134, v133, (uint64_t)v131, v95);
  uint64_t v101 = 0;
  unsigned int v102 = 0;
  unsigned int v103 = 0;
  v104 = (unsigned __int16 *)v132;
  unsigned int v105 = 0xFFFF;
  do
  {
    if (*(v104 - 2) < v105)
    {
      unsigned int v103 = v134[v101];
      unsigned int v102 = v133[v101];
      unsigned int v105 = *(v104 - 2);
    }
    if (*(v104 - 1) < v105)
    {
      unsigned int v103 = v134[v101] ^ 0xFFFFFF80;
      unsigned int v102 = v133[v101];
      unsigned int v105 = *(v104 - 1);
    }
    if (*v104 < v105)
    {
      unsigned int v103 = v134[v101];
      unsigned int v102 = v133[v101] ^ 0xFFFFFF80;
      unsigned int v105 = *v104;
    }
    if (v104[1] < v105)
    {
      unsigned int v103 = v134[v101] ^ 0xFFFFFF80;
      unsigned int v102 = v133[v101] ^ 0xFFFFFF80;
      unsigned int v105 = v104[1];
    }
    v104 += 4;
    ++v101;
  }
  while (v101 != 100);
  if (v91 >= v105) {
    char v106 = -76;
  }
  else {
    char v106 = 0;
  }
  if (v91 >= v105) {
    unsigned int v107 = v105;
  }
  else {
    unsigned int v107 = v91;
  }
  if (v91 >= v105)
  {
    int v108 = (unsigned __int16 **)((char *)v127 + 112);
  }
  else
  {
    unsigned int v103 = v89;
    unsigned int v102 = v88;
    int v108 = (unsigned __int16 **)((char *)v127 + 104);
  }
  uint64_t v109 = *v108;
  uint64_t v110 = v102 << 8;
  *((unsigned char *)v127 + 4) = v106;
  *((_DWORD *)v127 + 2) = v107 << 8;
  unsigned int v111 = v103 << 8;
  *(_WORD *)v127 = (_WORD)v103 << 8;
  *((_WORD *)v127 + 1) = v110;
  *((void *)v127 + 20) = v109;
  if (a2)
  {
    int v112 = v127;
    int v113 = 0;
    unsigned int v130 = 256;
    do
    {
      int v126 = v113;
      while (1)
      {
        unsigned int v128 = v110 + v130;
        unsigned int v129 = v110 - v130;
        while (1)
        {
          uint64_t v114 = v110;
          __int16 v115 = v110;
          unsigned int v116 = PhaseDeviation::do2DSparsePrecisePD((uint64_t)v112, v109, v111, v110);
          unsigned int v117 = v111 - v130;
          uint64_t v118 = PhaseDeviation::do2DSparsePrecisePD((uint64_t)v112, v109, (unsigned __int16)v111 - (unsigned __int16)v130, v115);
          if (v118 >= v116)
          {
            __int16 v119 = (PhaseDeviation *)v118;
            unsigned int v117 = v111 + v130;
            unsigned int v120 = PhaseDeviation::do2DSparsePrecisePD((uint64_t)v112, v109, v111, v128);
            v121 = (PhaseDeviation *)PhaseDeviation::do2DSparsePrecisePD((uint64_t)v112, v109, v111, v129);
            unsigned int v122 = PhaseDeviation::do2DSparsePrecisePD((uint64_t)v112, v109, (unsigned __int16)v111 + (unsigned __int16)v130, v115);
            if (v122 >= v116) {
              break;
            }
          }
          *(_WORD *)int v112 = v117;
          unsigned int v111 = v117;
          uint64_t v110 = v114;
        }
        if (v121 >= v116)
        {
          unsigned int v129 = v128;
          if (v120 >= v116) {
            break;
          }
        }
        int v112 = v127;
        uint64_t v110 = v129;
        *((_WORD *)v127 + 1) = v129;
      }
      int v123 = PhaseDeviation::quadFitMinSearchQ15(v119, v116, v122);
      int v124 = PhaseDeviation::quadFitMinSearchQ15(v121, v116, v120);
      v111 += (v123 * v130 + 0x4000) >> 15;
      int v112 = v127;
      *(_WORD *)v127 = v111;
      uint64_t v110 = v114 + ((v124 * v130 + 0x4000) >> 15);
      *((_WORD *)v127 + 1) = v114 + ((v124 * v130 + 0x4000) >> 15);
      v130 >>= 1;
      int v113 = v126 + 1;
    }
    while (v126 != 4);
    *((_DWORD *)v127 + 2) = PhaseDeviation::do2DSparsePrecisePD((uint64_t)v127, v109, v111, v110);
  }
  return 0;
}

uint64_t PhaseDeviation::partialSort(uint64_t this, unsigned __int16 *a2, unsigned __int8 a3, unsigned __int8 a4, unsigned __int8 *a5)
{
  for (uint64_t i = 0; i != 10; ++i)
    *((unsigned char *)a2 + i) = i;
  do
  {
    uint64_t v6 = 0;
    char v7 = 0;
    uint64_t v8 = *(unsigned __int8 *)a2;
    do
    {
      uint64_t v9 = *((unsigned __int8 *)a2 + v6 + 1);
      if (*(unsigned __int16 *)(this + 2 * v8) <= *(unsigned __int16 *)(this + 2 * v9))
      {
        uint64_t v8 = *((unsigned __int8 *)a2 + v6 + 1);
      }
      else
      {
        *((unsigned char *)a2 + v6) = v9;
        *((unsigned char *)a2 + v6 + 1) = v8;
        char v7 = 1;
      }
      ++v6;
    }
    while (v6 != 9);
  }
  while ((v7 & 1) != 0);
  unsigned int v10 = *(unsigned __int16 *)(this + 2 * *((unsigned __int8 *)a2 + 9));
  for (uint64_t j = 10; j != 128; ++j)
  {
    if (*(unsigned __int16 *)(this + 2 * j) < v10)
    {
      uint64_t v12 = 0;
      *((unsigned char *)a2 + 9) = j;
      do
      {
        int8x16_t v13 = (char *)a2 + v12;
        uint64_t v14 = *((unsigned __int8 *)a2 + v12 + 8);
        uint64_t v15 = *((unsigned __int8 *)a2 + v12 + 9);
        if (*(unsigned __int16 *)(this + 2 * v14) > *(unsigned __int16 *)(this + 2 * v15))
        {
          v13[8] = v15;
          v13[9] = v14;
        }
        char v16 = v12-- + 8;
      }
      while (v16);
      unsigned int v10 = *(unsigned __int16 *)(this + 2 * *((unsigned __int8 *)a2 + 9));
    }
  }
  return this;
}

uint64_t PhaseDeviation::do2DSparsePrecisePD(uint64_t this, unsigned __int16 *a2, __int16 a3, __int16 a4)
{
  uint64_t v4 = *(unsigned int *)(this + 16);
  if ((int)v4 < 1) {
    return 0;
  }
  uint64_t v5 = this;
  LODWORD(this) = 0;
  char v7 = *(char **)(v5 + 120);
  uint64_t v6 = *(char **)(v5 + 128);
  do
  {
    __int16 v9 = *v7++;
    __int16 v8 = v9;
    __int16 v11 = *v6++;
    __int16 v10 = v11;
    __int16 v12 = *a2++;
    unsigned __int16 v13 = v12 - v10 * a4 - v8 * a3;
    if (v13 < (unsigned __int16)-v13) {
      LOWORD(v14) = v13;
    }
    else {
      int v14 = -v13;
    }
    this = this + (unsigned __int16)v14;
    --v4;
  }
  while (v4);
  return this;
}

uint64_t PhaseDeviation::quadFitMinSearchQ15(PhaseDeviation *this, int a2, unsigned int a3)
{
  unsigned int v3 = this >> 1;
  if (this >> 1 == a3 >> 1) {
    return 0;
  }
  int v5 = v3 - (a3 >> 1);
  int v6 = a3 - a2 + this - a2;
  if (v5 >= 0) {
    unsigned int v7 = v3 - (a3 >> 1);
  }
  else {
    unsigned int v7 = (a3 >> 1) - v3;
  }
  if (v6 >= 0) {
    int v8 = a3 - a2 + this - a2;
  }
  else {
    int v8 = -v6;
  }
  if (v8 < 0x8000)
  {
    char v9 = 0;
  }
  else
  {
    char v9 = 0;
    unsigned int v10 = v8;
    do
    {
      int v8 = v10 >> 1;
      --v9;
      unsigned int v11 = HIWORD(v10);
      v10 >>= 1;
    }
    while (v11);
  }
  if (!(v8 >> 14))
  {
    do
    {
      v8 *= 2;
      ++v9;
    }
    while (v8 < 0x4000);
  }
  int v12 = v5 ^ v6;
  int v13 = 92521 - ((1928 * v8 + 512) >> 10);
  int v14 = 3;
  do
  {
    int v13 = ((0x10000 - ((v13 * v8 + 0x4000) >> 15)) * v13 + 0x4000) >> 15;
    --v14;
  }
  while (v14);
  if (v7 < 0x8000)
  {
    char v15 = 0;
  }
  else
  {
    char v15 = 0;
    do
    {
      unsigned int v16 = HIWORD(v7);
      v7 >>= 1;
      --v15;
    }
    while (v16);
  }
  unsigned int v17 = (int)((1 << (v15 - v9 + 14)) + v7 * v13) >> (v15 - v9 + 15);
  if (v12 >= 0) {
    return v17;
  }
  else {
    return -v17;
  }
}

uint64_t PhaseDeviation::do2DSparsePD64_G(uint64_t this, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int16 *a6)
{
  uint64_t v6 = 0;
  uint64_t v7 = *(unsigned int *)(this + 16);
  do
  {
    if ((int)v7 < 1)
    {
      __int16 v11 = 0;
      __int16 v10 = 0;
      __int16 v9 = 0;
      __int16 v8 = 0;
    }
    else
    {
      __int16 v8 = 0;
      __int16 v9 = 0;
      __int16 v10 = 0;
      __int16 v11 = 0;
      unsigned __int8 v12 = a3[v6];
      unsigned __int8 v13 = a4[v6];
      char v15 = *(char **)(this + 120);
      int v14 = *(char **)(this + 128);
      unsigned int v16 = a2;
      uint64_t v17 = v7;
      do
      {
        char v19 = *v15++;
        char v18 = v19;
        char v20 = v12 * v19;
        char v21 = *v14++;
        char v22 = v21 * v13;
        char v23 = v21 * ((v13 ^ 0x7F) + 1);
        char v25 = *v16++;
        char v24 = v25;
        LOBYTE(v26) = v25 - v22 - v20;
        if (v26 >= (v20 - (v25 - v22))) {
          int v26 = -v26;
        }
        v11 += v26;
        char v27 = v24 + v18 * ((v12 ^ 0x7F) + 1);
        LOBYTE(v28) = v27 - v22;
        if (v28 >= -(char)v28) {
          int v28 = -v28;
        }
        v10 += v28;
        LOBYTE(v29) = v24 - v20 + v23;
        if (v29 >= -(char)v29) {
          int v29 = -v29;
        }
        v9 += v29;
        unsigned __int8 v30 = v27 + v23;
        if (v30 >= -v30) {
          int v31 = -v30;
        }
        else {
          LOBYTE(v31) = v30;
        }
        v8 += v31;
        --v17;
      }
      while (v17);
    }
    int8x16_t v32 = (_WORD *)(a5 + 8 * v6);
    _WORD *v32 = v11;
    v32[1] = v10;
    v32[2] = v9;
    v32[3] = v8;
    ++v6;
  }
  while (v6 != 112);
  return this;
}

uint64_t PhaseDeviation::atanOver2PiQ16Octant18(PhaseDeviation *this, int a2)
{
  if (this)
  {
    while ((int)this > 0x8000 || (int)this < -32768 || a2 > 0x8000 || a2 < -32768)
    {
      LODWORD(this) = (int)this >> 1;
      a2 >>= 1;
    }
    if ((int)this < 0x4000)
    {
      while ((int)this >= -16383 && a2 < 0x4000 && a2 >= -16383)
      {
        int v2 = 2 * this;
        a2 *= 2;
        BOOL v3 = (int)this < 0x2000;
        LODWORD(this) = 2 * this;
        if (!v3) {
          goto LABEL_14;
        }
      }
    }
    int v2 = (int)this;
LABEL_14:
    int v4 = 5215 * ((v2 * a2 + 0x4000) >> 15) + 0x4000;
    unsigned int v5 = ((a2 * a2) >> 5) + ((a2 * a2) >> 2) + v2 * v2 + 0x4000;
    int v6 = v5 >> 15;
    unsigned int v7 = v5 >> 29;
    if (v7)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      do
      {
        v6 *= 2;
        LOBYTE(v7) = v7 + 1;
      }
      while (v6 < 0x4000);
    }
    int v9 = v4 >> 15;
    int v10 = 92521 - ((1928 * v6 + 512) >> 10);
    int v11 = 3;
    do
    {
      int v10 = ((0x10000 - ((v10 * v6 + 0x4000) >> 15)) * v10 + 0x4000) >> 15;
      --v11;
    }
    while (v11);
    return (unsigned __int16)(2 * (((1 << (14 - v7)) + v10 * v9) >> (15 - v7)));
  }
  else
  {
    LOWORD(v8) = 0;
  }
  return (unsigned __int16)v8;
}

uint64_t RandomErasureEncoder::EncodePayloadIntoPacket(RandomErasureEncoder *this, unsigned __int8 *a2, uint64_t a3, unsigned __int8 *a4, int a5)
{
  uint64_t v5 = 3;
  if (this && a3)
  {
    if (a4 >= a2)
    {
      return 2;
    }
    else
    {
      if (a4)
      {
        uint64_t v6 = 0;
        do
        {
          char v7 = 0;
          int v8 = this;
          uint64_t v9 = a2;
          do
          {
            a5 = 214013 * a5 + 2531011;
            int v10 = *(unsigned __int8 *)v8;
            int v8 = (RandomErasureEncoder *)((char *)v8 + 1);
            v7 ^= GF256::m_LowMulTable[BYTE2(a5) | ((v10 & 0xF) << 8)] ^ GF256::m_HighMulTable[(16 * v10) & 0xF00 | BYTE2(a5)];
            --v9;
          }
          while (v9);
          *(unsigned char *)(a3 + v6++) = v7;
        }
        while (v6 != a4);
      }
      return 0;
    }
  }
  return v5;
}

uint64_t RandomErasureEncoder::BitsToBytes(uint8x8_t *this, unsigned __int8 *a2, unsigned char *a3, unsigned __int8 *a4)
{
  if ((a2 & 7) != 0) {
    return 2;
  }
  uint64_t v4 = 3;
  if (this && a3)
  {
    if (a2 >= 8)
    {
      uint64_t v4 = a2 >> 3;
      do
      {
        uint8x8_t v6 = *this++;
        uint8x8_t v7 = vshl_u8(v6, (uint8x8_t)0x1020304050607);
        *a3++ = v7.i8[0] | v7.i8[4] | ((v7.i32[0] | v7.i32[1]) >> 16) | ((unsigned __int16)(v7.i16[0] | v7.i16[2] | ((v7.i32[0] | v7.i32[1]) >> 16)) >> 8);
        --v4;
      }
      while (v4);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

uint64_t RandomErasureEncoder::BytesToBits(RandomErasureEncoder *this, unsigned __int8 *a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v4 = 3;
  if (this && a3)
  {
    if (a2)
    {
      uint64_t v5 = 0;
      do
      {
        unsigned int v6 = *(unsigned __int8 *)this;
        this = (RandomErasureEncoder *)((char *)this + 1);
        uint32x4_t v7 = (uint32x4_t)vdupq_n_s32(v6);
        *(int8x8_t *)(a3 + (v5 & 0xFFFFFFF8)) = vand_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vshlq_u32(v7, (uint32x4_t)xmmword_228A919E0), (int16x8_t)vshlq_u32(v7, (uint32x4_t)xmmword_228A919D0))), (int8x8_t)0x101010101010101);
        v5 += 8;
      }
      while (8 * a2 != v5);
    }
    return 0;
  }
  return v4;
}

void RandomErasureDecoder::~RandomErasureDecoder(RandomErasureDecoder *this)
{
  uint64_t v2 = *((void *)this + 2);
  if (v2) {
    MEMORY[0x22A6A46F0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3) {
    MEMORY[0x22A6A46F0](v3, 0x1000C8077774924);
  }
}

void RandomErasureDecoder::Init(RandomErasureDecoder *this, unsigned int a2)
{
  *(_DWORD *)this = a2;
  *((_DWORD *)this + 2) = vcvtms_u32_f32((float)(*((float *)this + 8) + 1.0) * (float)a2);
  operator new[]();
}

uint64_t RandomErasureDecoder::AddPacketToDecodeQueue(RandomErasureDecoder *this, int a2, unsigned __int8 *a3, int a4)
{
  uint64_t v4 = *((void *)this + 2);
  if (!v4 || !*((void *)this + 3)) {
    return 6;
  }
  if (!a3) {
    return 7;
  }
  unsigned int v6 = *((_DWORD *)this + 1) + a4;
  if (v6 > *((_DWORD *)this + 2)) {
    return 2;
  }
  if (a4)
  {
    for (uint64_t i = 0; i != a4; ++i)
    {
      int v9 = *(_DWORD *)this;
      if (*(_DWORD *)this)
      {
        unsigned int v10 = 0;
        do
        {
          a2 = 214013 * a2 + 2531011;
          *(unsigned char *)(v4 + v10 + v9 * (i + *((_DWORD *)this + 1))) = BYTE2(a2);
          ++v10;
          int v9 = *(_DWORD *)this;
        }
        while (v10 < *(_DWORD *)this);
      }
      *(unsigned char *)(*((void *)this + 3) + (*((_DWORD *)this + 1) + i)) = a3[i];
    }
    unsigned int v6 = *((_DWORD *)this + 1) + a4;
  }
  *((_DWORD *)this + 1) = v6;
  if (!v6) {
    return 1;
  }
  GF256::runForwardGaussElimination(v4, v6, *(_DWORD *)this, *((void *)this + 3));
  uint64_t v12 = *(unsigned int *)this;
  uint64_t v11 = *((unsigned int *)this + 1);
  if (v11)
  {
    unsigned int v13 = v12 * (v11 - 1);
    while (1)
    {
      if (v12)
      {
        int v14 = v11;
        char v15 = 1;
        unsigned int v16 = v13;
        uint64_t v17 = v12;
        do
        {
          v15 &= *(unsigned char *)(v4 + v16++) == 0;
          --v17;
        }
        while (v17);
        if ((v15 & 1) == 0) {
          break;
        }
      }
      if (*(unsigned char *)(*((void *)this + 3) + --v11)) {
        return 3;
      }
      *((_DWORD *)this + 1) = v11;
      v13 -= v12;
      if (!v11) {
        goto LABEL_24;
      }
    }
  }
  else
  {
LABEL_24:
    int v14 = 0;
  }
  if (GF256::rankOfUpperTriangMatrix(v4, v11, v12) != v12) {
    return 1;
  }
  GF256::runBackSubstitution(v4, v14, v12, *((void *)this + 3));
  return 0;
}

void ReadStage::~ReadStage(ReadStage *this)
{
  *(void *)this = &unk_26DD180A0;
  uint64_t v2 = *((void *)this + 32);
  if (v2) {
    MEMORY[0x22A6A46F0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 37);
  if (v3) {
    MEMORY[0x22A6A46F0](v3, 0x1000C80BDFB0063);
  }
  uint64_t v4 = *((void *)this + 7);
  if (v4) {
    MEMORY[0x22A6A46F0](v4, 0x1000C80A86A77D5);
  }
  uint64_t v5 = *((void *)this + 31);
  if (v5) {
    MEMORY[0x22A6A46F0](v5, 0x1000C8077774924);
  }
  uint64_t v6 = *((void *)this + 30);
  if (v6) {
    MEMORY[0x22A6A46F0](v6, 0x1000C8077774924);
  }
  Decode::~Decode((ReadStage *)((char *)this + 104));
  *((void *)this + 9) = &unk_26DD17F40;
  uint64_t v7 = *((void *)this + 10);
  if (v7) {
    MEMORY[0x22A6A46F0](v7, 0x1000C80BDFB0063);
  }
}

{
  uint64_t vars8;

  ReadStage::~ReadStage(this);
  JUMPOUT(0x22A6A4700);
}

void ReadStage::Init(ReadStage *this, CMCKeyChain *a2)
{
}

uint64_t ReadStage::ReadWatermark(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, uint32x2_t *a8, uint64_t a9, unsigned int *a10)
{
  *(_DWORD *)(a1 + 12) = a7;
  *(void *)(a1 + 288) = a2;
  *(_DWORD *)(a1 + 276) = a4;
  *(_DWORD *)(a1 + 272) = a3;
  *(_DWORD *)(a1 + 280) = a5;
  *(_DWORD *)(a1 + 284) = a6;
  *(void *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 64) = 0;
  bzero(*(void **)(a1 + 296), 0x800uLL);
  for (unsigned int i = 0; ; ++i)
  {
    unsigned int v13 = 0;
    do
      char SubBlockData = ReadStage::ExtractSubBlockData(a1, a8, i, v13++, 1);
    while ((SubBlockData & 1) != 0);
    if (v13 == 1) {
      break;
    }
    unsigned int v15 = -1;
    do
      char v16 = ReadStage::ExtractSubBlockData(a1, a8, i, v15--, 1);
    while ((v16 & 1) != 0);
    if (a10)
    {
      uint64_t v17 = (void (*)(void))*((void *)a10 + 1);
      if (v17) {
        v17(*a10);
      }
      char v18 = (unsigned char *)*((void *)a10 + 2);
      if (v18)
      {
        if (*v18) {
          return 9;
        }
      }
    }
  }
  for (unsigned int j = -1; ; --j)
  {
    unsigned int v20 = 0;
    do
      char v21 = ReadStage::ExtractSubBlockData(a1, a8, j, v20++, 1);
    while ((v21 & 1) != 0);
    if (v20 == 1) {
      break;
    }
    unsigned int v22 = -1;
    do
      char v23 = ReadStage::ExtractSubBlockData(a1, a8, j, v22--, 1);
    while ((v23 & 1) != 0);
    if (a10)
    {
      char v24 = (void (*)(void))*((void *)a10 + 1);
      if (v24) {
        v24(*a10);
      }
      char v25 = (unsigned char *)*((void *)a10 + 2);
      if (v25)
      {
        if (*v25) {
          return 9;
        }
      }
    }
  }
  BOOL v53 = 0;
  Decode::DoRealWork((Decode *)(a1 + 104), *(__int16 **)(a1 + 296), &v53);
  ++*(_DWORD *)(a9 + 8);
  if (a10)
  {
    int v26 = (void (*)(void))*((void *)a10 + 1);
    if (v26) {
      v26(*a10);
    }
    char v27 = (unsigned char *)*((void *)a10 + 2);
    if (v27)
    {
      if (*v27) {
        return 9;
      }
    }
  }
  if (v53) {
    goto LABEL_32;
  }
  int v29 = *(_DWORD *)(a1 + 64);
  if (v29 > 1)
  {
    uint64_t v30 = 0;
    for (unint64_t k = 1; (uint64_t)k < v29; ++k)
    {
      int8x16_t v32 = *(int **)(a1 + 56);
      uint16x8_t v33 = &v32[5 * k];
      unint64_t v34 = -1;
      do
      {
        ++v34;
        int v36 = *v32;
        v32 += 5;
        int v35 = v36;
      }
      while (v34 < k && *v33 < v35);
      if (v34 < k)
      {
        long long v51 = *(_OWORD *)v33;
        int v52 = v33[4];
        uint64_t v38 = v30;
        do
        {
          uint64_t v39 = *(void *)(a1 + 56) + v38;
          *(_OWORD *)(v39 + 20) = *(_OWORD *)v39;
          *(_DWORD *)(v39 + 36) = *(_DWORD *)(v39 + 16);
          ++v34;
          v38 -= 20;
        }
        while (k > v34);
        uint64_t v40 = *(void *)(a1 + 56) + v38;
        *(_OWORD *)(v40 + 20) = v51;
        *(_DWORD *)(v40 + 36) = v52;
        int v29 = *(_DWORD *)(a1 + 64);
      }
      v30 += 20;
    }
  }
  if (v29 >= 1)
  {
    uint64_t v41 = 0;
    if (v29 >= 5) {
      unsigned int v42 = 5;
    }
    else {
      unsigned int v42 = v29;
    }
    uint64_t v43 = 20 * v42;
    do
    {
      uint64_t v44 = *(void *)(a1 + 56) + v41;
      unsigned int v46 = *(_DWORD *)(v44 + 4);
      unsigned int v45 = *(_DWORD *)(v44 + 8);
      *(void *)(a1 + 16) = *(void *)(v44 + 12);
      *(void *)(a1 + 48) = -1;
      ReadStage::ExtractSubBlockData(a1, a8, v45, v46, 0);
      *(void *)(a1 + 48) = 0xFFFFFFFF00000000;
      ReadStage::ExtractSubBlockData(a1, a8, v45, v46, 0);
      *(void *)(a1 + 48) = 0xFFFFFFFF00000001;
      ReadStage::ExtractSubBlockData(a1, a8, v45, v46, 0);
      *(void *)(a1 + 48) = 0xFFFFFFFFLL;
      ReadStage::ExtractSubBlockData(a1, a8, v45, v46, 0);
      if (a10)
      {
        int8x16_t v47 = (void (*)(void))*((void *)a10 + 1);
        if (v47) {
          v47(*a10);
        }
        int16x8_t v48 = (unsigned char *)*((void *)a10 + 2);
        if (v48)
        {
          if (*v48) {
            return 9;
          }
        }
      }
      *(void *)(a1 + 48) = 1;
      ReadStage::ExtractSubBlockData(a1, a8, v45, v46, 0);
      *(void *)(a1 + 48) = 0x1FFFFFFFFLL;
      ReadStage::ExtractSubBlockData(a1, a8, v45, v46, 0);
      *(void *)(a1 + 48) = 0x100000000;
      ReadStage::ExtractSubBlockData(a1, a8, v45, v46, 0);
      *(void *)(a1 + 48) = 0x100000001;
      ReadStage::ExtractSubBlockData(a1, a8, v45, v46, 0);
      v41 += 20;
    }
    while (v43 != v41);
  }
  if (a10)
  {
    int16x8_t v49 = (void (*)(void))*((void *)a10 + 1);
    if (v49) {
      v49(*a10);
    }
    int16x8_t v50 = (unsigned char *)*((void *)a10 + 2);
    if (v50)
    {
      if (*v50) {
        return 9;
      }
    }
  }
  Decode::DoRealWork((Decode *)(a1 + 104), *(__int16 **)(a1 + 296), &v53);
  ++*(_DWORD *)(a9 + 8);
  if (v53)
  {
LABEL_32:
    *(unsigned char *)(a9 + 12) = 1;
    Decode::ExtractPayloadInfo(a1 + 104, a9);
  }
  return 0;
}

uint64_t ReadStage::ExtractSubBlockData(uint64_t a1, uint32x2_t *a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t result = 0;
  int64_t v79 = 0;
  uint64_t v80 = 0;
  int v81 = 0;
  unsigned int v82 = &v66;
  int v83 = 0;
  if (a3 - 5 < 0xFFFFFFF7 || a4 - 5 < 0xFFFFFFF7) {
    return result;
  }
  int v11 = 32 * a4;
  int v12 = 32 * a3;
  int v64 = v12;
  unsigned int v65 = 32 * a4;
  if (!a5)
  {
    v11 += 16 * *(_DWORD *)(a1 + 48);
    v12 += 16 * *(_DWORD *)(a1 + 52);
    int v64 = v12;
    unsigned int v65 = v11;
    int32x2_t v15 = *(int32x2_t *)(a1 + 16);
    goto LABEL_12;
  }
  if (!(a4 | a3))
  {
    int32x2_t v15 = vneg_s32((int32x2_t)vand_s8((int8x8_t)vshl_u32(a2[5], (uint32x2_t)vdup_n_s32(8 - a2[6].i32[0])), (int8x8_t)0xFF000000FFLL));
    goto LABEL_12;
  }
  int v13 = *(_DWORD *)(a1 + 32);
  int v14 = *(_DWORD *)(a1 + 36);
  int v66 = v14;
  int v67 = v13;
  if (a4 == -1)
  {
    int32x2_t v15 = *(int32x2_t *)(a1 + 24);
    int v67 = v15.i32[0];
    int v11 = -32;
    goto LABEL_13;
  }
  if (!a4)
  {
    if (a3 == -1)
    {
      int v11 = 0;
      int32x2_t v15 = *(int32x2_t *)(a1 + 16);
      int v67 = v15.i32[0];
      int v12 = -32;
      goto LABEL_13;
    }
    if (!a3)
    {
      int v12 = 0;
      int v11 = 0;
      int v67 = 0;
      int32x2_t v15 = 0;
LABEL_13:
      int v14 = v15.i32[1];
      int v66 = v15.i32[1];
      int v13 = v15.i32[0];
      goto LABEL_14;
    }
    int v11 = 0;
    int32x2_t v15 = *(int32x2_t *)(a1 + 24);
LABEL_12:
    int v67 = v15.i32[0];
    goto LABEL_13;
  }
LABEL_14:
  uint64_t result = ReadStage::InvertLTWithBoundaryCheck(a1, v11, v12, (int *)a2, v13, v14, 1);
  if (!result) {
    return result;
  }
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  __int32 v18 = a2[6].i32[0];
  int v19 = (a2[5].i32[0] >> v18) + v65;
  int v68 = (a2[5].i32[1] >> v18) + v64;
  int v69 = v19;
  int v20 = ~(2 * v19) & 0x1E;
  unsigned int v21 = ((v19 + 112) >> 4) & 7;
  unsigned int v22 = ((((v68 - 16) & ~((v68 - 16) >> 31)) - v68 + 143) & 0xFFFFFF80) + v68 - 16;
  do
  {
    int v23 = 0;
    int v24 = 0;
    int v25 = 0;
    if ((int)(v22 + v17) <= 0) {
      int v26 = -(-(v22 + v17) & 0x7F);
    }
    else {
      int v26 = (v22 + v17) & 0x7F;
    }
    int v27 = 8 * v26;
    int v28 = v20;
    unsigned int v29 = v21;
    do
    {
      if (v28 >= v25)
      {
        int v30 = CGridLuts::m_packedGrid[v29 + v27];
        uint64_t v31 = v16 + v24;
        do
        {
          *(unsigned char *)(*(void *)(a1 + 256) + v31) = 16 * ((v30 >> v28) & 3) - 16;
          v28 -= 2;
          ++v31;
          ++v24;
        }
        while (v28 >= v25);
      }
      if (v29 == 7) {
        unsigned int v29 = 0;
      }
      else {
        ++v29;
      }
      int v25 = (2 * v24 - 32) & ~((2 * v24 - 32) >> 31);
      ++v23;
      int v28 = 30;
    }
    while (v23 != 4);
    ++v17;
    v16 += 32;
  }
  while (v17 != 32);
  octaxis_O(*(void *)(a1 + 240), 48, 36, 0x30u, *(signed __int8 **)(a1 + 248));
  int v84 = 0;
  CorrelateWithTemplate3x3_32x32(*(const signed __int8 **)(a1 + 256), *(const signed __int8 **)(a1 + 248), v70, (unsigned int *)&v84);
  int v32 = 0;
  *(_DWORD *)(a1 + 8) = v84;
  for (uint64_t i = 24; i != 60; i += 4)
  {
    if (*(int *)((char *)&v64 + i) > v32) {
      int v32 = *(int *)((char *)&v64 + i);
    }
  }
  unsigned int v78 = v32;
  if (v32 < 0x4E) {
    goto LABEL_73;
  }
  int v34 = 0;
  for (uint64_t j = 24; j != 60; j += 4)
  {
    int v36 = *(int *)((char *)&v64 + j);
    if (v36 < 0) {
      *(int *)((char *)&v64 + j) = 0;
    }
    else {
      v34 += v36;
    }
  }
  int v37 = (v34 + 128) >> 8;
  if (v34 < 0x800000) {
    int v37 = v34;
  }
  if (v37 < 1)
  {
    int v39 = 0;
    int v40 = 0;
  }
  else
  {
    char v38 = 8 * (v34 < 0x800000);
    int v39 = ((v76 + v75 + v77 - (v70[0] + v70[1] + v71)) << v38) / v37;
    int v40 = ((v77 - (v75 + v70[0]) + v71 + v74 - v72) << v38) / v37;
  }
  int64_t v79 = __PAIR64__(v39, v40);
  int v41 = v40 + v66;
  int v42 = v39 + v67;
  LODWORD(v80) = v40 + v66;
  HIDWORD(v80) = v39 + v67;
  if (a5)
  {
    int v43 = *(_DWORD *)(a1 + 64);
    if (v43 <= 199)
    {
      uint64_t v44 = (unsigned int *)(*(void *)(a1 + 56) + 20 * v43);
      *uint64_t v44 = v78;
      v44[3] = HIDWORD(v80);
      v44[4] = v80;
      v44[1] = a4;
      v44[2] = a3;
      *(_DWORD *)(a1 + 64) = v43 + 1;
      int v41 = v80;
      int v42 = HIDWORD(v80);
    }
  }
  *(_DWORD *)(a1 + 32) = v42;
  *(_DWORD *)(a1 + 36) = v41;
  if (!a4)
  {
    *(_DWORD *)(a1 + 24) = v42;
    *(_DWORD *)(a1 + 28) = v41;
    if (!a3)
    {
      *(_DWORD *)(a1 + 16) = v42;
      *(_DWORD *)(a1 + 20) = v41;
    }
  }
  unsigned int v45 = HIDWORD(v79);
  if (v79 < 0) {
    unsigned int v45 = -HIDWORD(v79);
  }
  if (v45 <= 0x19)
  {
    unsigned int v46 = v79;
    if ((int)v79 < 0) {
      unsigned int v46 = -(int)v79;
    }
    if (v46 < 0x1A)
    {
      int v57 = (v73 + 8) >> 4;
      int v83 = v57;
      uint64_t v58 = a1;
      int v59 = 1;
LABEL_72:
      ReadStage::PostProcessSubBlock(v58, v57, v59);
      Demodulator::Demodulate((Demodulator *)(a1 + 72), *(__int16 **)(a1 + 296), *(__int16 **)(a1 + 264), 0x20u, v69, v68);
      *(int32x2_t *)(a1 + 40) = vadd_s32(*(int32x2_t *)(a1 + 40), (int32x2_t)(v78 | 0x100000000));
      return 1;
    }
  }
  if (ReadStage::InvertLTWithBoundaryCheck(a1, v65, v64, (int *)a2, v42, v41, 0))
  {
    octaxis_O(*(void *)(a1 + 240), 48, 36, 0x30u, *(signed __int8 **)(a1 + 248));
    uint64_t v47 = 0;
    LODWORD(v48) = 0;
    int v49 = 0;
    int v50 = 0;
    int v81 = 0;
    uint64_t v51 = *(void *)(a1 + 256);
    uint64_t v52 = *(void *)(a1 + 248) + 49;
    do
    {
      for (uint64_t k = 0; k != 32; ++k)
      {
        int v54 = *(char *)(v51 + k);
        int v55 = *(char *)(v52 + k);
        v49 += v54 * v54;
        int16x8_t v48 = (SquareRoot *)(v48 + v55 * v55);
        v50 += v55 * v54;
        int v81 = v50;
      }
      ++v47;
      v52 += 48;
      v51 += 32;
    }
    while (v47 != 32);
    if (v49 < 1 || (int)v48 <= 0)
    {
      *(_DWORD *)(a1 + 8) = 0;
    }
    else
    {
      *(_DWORD *)(a1 + 8) = v50 / (int)((v49 + 512) >> 10);
      int v60 = SquareRoot::sqrt(v48);
      int v61 = 21 * v81 / v60;
      int v81 = v61 >> 3;
      if (v61 > 575)
      {
        unsigned int v82 = (int *)&v80;
        int v57 = ((v61 >> 3) + 8) >> 4;
        int v83 = v57;
        uint64_t v58 = a1;
        int v59 = 0;
        goto LABEL_72;
      }
    }
LABEL_73:
    int v63 = v66;
    int v62 = v67;
    *(_DWORD *)(a1 + 32) = v67;
    *(_DWORD *)(a1 + 36) = v63;
    if (!a4)
    {
      *(_DWORD *)(a1 + 24) = v62;
      *(_DWORD *)(a1 + 28) = v63;
      if (!a3)
      {
        *(_DWORD *)(a1 + 16) = v62;
        *(_DWORD *)(a1 + 20) = v63;
      }
    }
    return 1;
  }
  uint64_t result = 0;
  if (a5) {
    --*(_DWORD *)(a1 + 64);
  }
  return result;
}

uint64_t ReadStage::InvertLTWithBoundaryCheck(uint64_t a1, int a2, int a3, int *a4, int a5, int a6, int a7)
{
  if (a7) {
    int v8 = 18;
  }
  else {
    int v8 = 17;
  }
  int v9 = a2 - v8;
  int v10 = a3 - v8;
  int v11 = a4[1];
  int v12 = a4[3];
  int v13 = v11 * v10 + (*(_DWORD *)(a1 + 280) << 20) + v12 * v9 + ((v11 * a6 + v12 * a5) >> 8);
  int v14 = v13 + 36 * (v12 + v11);
  if (v12 < 0) {
    int v15 = v13 + 36 * v12;
  }
  else {
    int v15 = v13;
  }
  if (v12 < 0) {
    int v16 = v13 + 36 * v11;
  }
  else {
    int v16 = v13 + 36 * (v12 + v11);
  }
  if (v12 < 0)
  {
    int v17 = v13;
  }
  else
  {
    int v14 = v13 + 36 * v11;
    int v17 = v13 + 36 * v12;
  }
  BOOL v18 = v11 >= 0;
  if (v11 < 0) {
    int v19 = v14;
  }
  else {
    int v19 = v15;
  }
  if (v18) {
    int v17 = v16;
  }
  if (v19 < 0) {
    return 0;
  }
  if (v17 < v19 || v17 >> 20 >= *(_DWORD *)(a1 + 272) - 1) {
    return 0;
  }
  int v21 = *a4;
  int v22 = a4[2];
  int v23 = v21 * v10 + (*(_DWORD *)(a1 + 284) << 20) + v22 * v9 + ((v21 * a6 + v22 * a5) >> 8);
  int v24 = v23 + 36 * (v22 + *a4);
  if (v22 < 0) {
    int v25 = v23 + 36 * v22;
  }
  else {
    int v25 = v23;
  }
  if (v22 < 0) {
    int v26 = v23 + 36 * *a4;
  }
  else {
    int v26 = v23 + 36 * (v22 + *a4);
  }
  if (v22 < 0)
  {
    int v27 = v23;
  }
  else
  {
    int v24 = v23 + 36 * *a4;
    int v27 = v23 + 36 * v22;
  }
  if (v21 >= 0)
  {
    int v24 = v25;
    int v27 = v26;
  }
  if (v24 < 0) {
    return 0;
  }
  if (v27 < v24 || v27 >> 20 >= *(_DWORD *)(a1 + 276) - 1) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 12) == 1) {
    InvertLTBilinear36x36Stride48_G(*(void *)(a1 + 288), (unsigned __int16)*(_DWORD *)(a1 + 272), *(unsigned __int8 **)(a1 + 240), a4, v13, v23);
  }
  else {
    InvertLTBilinear36x36Stride48_YUV422_G(*(void *)(a1 + 288), 2 * (*(_DWORD *)(a1 + 272) & 0x7FFF), *(unsigned __int8 **)(a1 + 240), a4, v13, v23);
  }
  return 1;
}

uint64_t ReadStage::PostProcessSubBlock(uint64_t this, int a2, int a3)
{
  uint64_t v3 = 0;
  int v4 = *(_DWORD *)(this + 8) * a2;
  if (a3) {
    uint64_t v5 = 98;
  }
  else {
    uint64_t v5 = 49;
  }
  uint64_t v6 = *(void *)(this + 256);
  uint64_t v7 = *(void *)(this + 264);
  uint64_t v8 = *(void *)(this + 248) + v5;
  do
  {
    for (uint64_t i = 0; i != 32; ++i)
      *(_WORD *)(v7 + 2 * i) = *(char *)(v8 + i) * (_WORD)a2 - ((v4 * *(char *)(v6 + i) + 512) >> 10);
    ++v3;
    v7 += 64;
    v6 += 32;
    v8 += 48;
  }
  while (v3 != 32);
  return this;
}

uint64_t SquareRoot::sqrt(SquareRoot *this)
{
  unsigned int v1 = this;
  if ((int)this >= 0x10000)
  {
    if (this >> 24)
    {
      unsigned int v2 = this >> 28;
      if (this >> 26) {
        char v3 = 20;
      }
      else {
        char v3 = 18;
      }
      if (this >> 26) {
        char v4 = 6;
      }
      else {
        char v4 = 5;
      }
      if (this >> 30) {
        char v5 = 24;
      }
      else {
        char v5 = 22;
      }
      if (this >> 30) {
        char v6 = 8;
      }
      else {
        char v6 = 7;
      }
      BOOL v7 = v2 == 0;
      if (v2) {
        char v8 = v5;
      }
      else {
        char v8 = v3;
      }
      if (v7) {
        char v9 = v4;
      }
      else {
        char v9 = v6;
      }
      int v10 = (SquareRoot *)(table[(unint64_t)this >> v8] << v9);
      int v11 = (v10 | 1) + ((int)(SquareRoot::approxRecip(v10) * (v1 >> 10)) >> 10);
      int v12 = ((int)(SquareRoot::approxRecip((SquareRoot *)(v11 >> 1)) * (v1 >> 10)) >> 10) + (v11 >> 1) + 1;
    }
    else
    {
      if (this >> 18) {
        char v14 = 12;
      }
      else {
        char v14 = 10;
      }
      if (this >> 18) {
        char v15 = 2;
      }
      else {
        char v15 = 1;
      }
      if (this >> 22) {
        char v16 = 16;
      }
      else {
        char v16 = 14;
      }
      if (this >> 22) {
        char v17 = 4;
      }
      else {
        char v17 = 3;
      }
      if (this >= 0x100000)
      {
        char v14 = v16;
        char v15 = v17;
      }
      BOOL v18 = (SquareRoot *)(table[(unint64_t)this >> v14] << v15);
      int v12 = (v18 | 1) + ((int)(SquareRoot::approxRecip(v18) * (v1 >> 10)) >> 10);
    }
    int v19 = v12 >> 1;
    BOOL v20 = v19 * v19 > (int)v1;
    return (v19 - v20);
  }
  if ((int)this >= 256)
  {
    if (this < 0x1000)
    {
      if (this < 0x400) {
        int v13 = table[(unint64_t)this >> 2] >> 3;
      }
      else {
        int v13 = table[(unint64_t)this >> 4] >> 2;
      }
    }
    else if (this < 0x4000)
    {
      int v13 = table[(unint64_t)this >> 6] >> 1;
    }
    else
    {
      int v13 = table[(unint64_t)this >> 8];
    }
    int v19 = v13 + 1;
    BOOL v20 = v19 * v19 > this;
    return (v19 - v20);
  }
  if ((this & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return table[this] >> 4;
  }
}

uint64_t SquareRoot::approxRecip(SquareRoot *this)
{
  if ((int)this < 4096)
  {
    char v1 = 0;
  }
  else
  {
    char v1 = 0;
    unsigned int v2 = this;
    do
    {
      LODWORD(this) = (v2 + 2) >> 2;
      v1 += 2;
      BOOL v3 = v2 > 0x3FFD;
      unsigned int v2 = this;
    }
    while (v3);
  }
  if ((int)this < 716)
  {
    unsigned int v4 = this;
  }
  else
  {
    do
    {
      unsigned int v4 = (this + 1) >> 1;
      ++v1;
      BOOL v3 = this > 0x596;
      LODWORD(this) = v4;
    }
    while (v3);
  }
  unsigned int v5 = v4 - 512;
  return ((int)(((v5 * v5 + 64) >> 7)
                            - 4 * v5
                            + (1 << v1 >> 1)
                            - ((int)(((v5 * v5 + 64) >> 7) * v5 + 256) >> 9)
                            + 2048) >> v1);
}

void TailbiteConvCode::~TailbiteConvCode(TailbiteConvCode *this)
{
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    MEMORY[0x22A6A46F0](v2, 0x1000C80BDFB0063);
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    MEMORY[0x22A6A46F0](v3, 0x1000C80BDFB0063);
  }
  uint64_t v4 = *((void *)this + 5);
  if (v4) {
    MEMORY[0x22A6A46F0](v4, 0x1000C8052888210);
  }
  uint64_t v5 = *((void *)this + 10);
  if (v5) {
    MEMORY[0x22A6A46F0](v5, 0x1000C8052888210);
  }
  uint64_t v6 = *((void *)this + 7);
  if (v6) {
    MEMORY[0x22A6A46F0](v6, 0x1000C8052888210);
  }
}

uint64_t TailbiteConvCode::Init(TailbiteConvCode *this, unsigned int a2, int a3, unsigned int a4, unsigned __int16 *a5, unsigned __int16 *a6, char a7)
{
  if (a2 - 14 < 0xFFFFFFF4) {
    return 2;
  }
  if (!(unsigned __int16)(a4 % a2))
  {
    *((_DWORD *)this + 2) = 1 << a3;
    *((_DWORD *)this + 3) = (1 << a3) >> 1;
    *(_DWORD *)this = a2;
    *((_DWORD *)this + 1) = a3;
    *((_WORD *)this + 8) = a4;
    *((_WORD *)this + 9) = a4 / a2;
    *((unsigned char *)this + 88) = a7;
    uint64_t v9 = *((void *)this + 3);
    if (v9) {
      MEMORY[0x22A6A46F0](v9, 0x1000C80BDFB0063);
    }
    *((void *)this + 3) = 0;
    uint64_t v10 = *((void *)this + 4);
    if (v10) {
      MEMORY[0x22A6A46F0](v10, 0x1000C80BDFB0063);
    }
    *((void *)this + 4) = 0;
    uint64_t v11 = *((void *)this + 5);
    if (v11) {
      MEMORY[0x22A6A46F0](v11, 0x1000C8052888210);
    }
    *((void *)this + 5) = 0;
    uint64_t v12 = *((void *)this + 10);
    if (v12) {
      MEMORY[0x22A6A46F0](v12, 0x1000C8052888210);
    }
    *((void *)this + 10) = 0;
    uint64_t v13 = *((void *)this + 7);
    if (v13) {
      MEMORY[0x22A6A46F0](v13, 0x1000C8052888210);
    }
    *((void *)this + 7) = 0;
    operator new[]();
  }
  return 2;
}

uint64_t TailbiteConvCode::Encode(TailbiteConvCode *this, unsigned __int8 *a2, unsigned __int8 *a3)
{
  if (!*((void *)this + 3)) {
    return 4;
  }
  unsigned int v3 = *((_DWORD *)this + 1);
  unsigned int v4 = *((unsigned __int16 *)this + 9);
  LOWORD(v5) = 0;
  if ((int)v3 >= (int)v4) {
    uint64_t v6 = *((unsigned __int16 *)this + 9);
  }
  else {
    uint64_t v6 = v3;
  }
  if (v6)
  {
    unsigned int v7 = v4 - 1;
    do
    {
      LOWORD(v5) = a2[v7--] | (unsigned __int16)(2 * v5);
      --v6;
    }
    while (v6);
  }
  if (*((_WORD *)this + 9))
  {
    unint64_t v8 = 0;
    char v9 = v3 - 1;
    int v10 = *(_DWORD *)this;
    do
    {
      int v5 = (a2[v8] << v9) | ((unsigned __int16)(v5 & 0xFFFE) >> 1);
      if (v10 >= 1)
      {
        for (uint64_t i = 0; i < v10; ++i)
        {
          uint64_t v12 = *((void *)this + 4);
          int v13 = (unsigned __int16)(*(_WORD *)(*((void *)this + 3) + 2 * i) & v5);
          unsigned int v14 = v13 ^ ((unsigned __int16)(v13 & 0xFF00) >> 8) ^ (((v13 ^ ((unsigned __int16)(v13 & 0xFF00) >> 8)) & 0xFFF0u) >> 4);
          unsigned __int8 v15 = (v14 ^ ((unsigned __int16)(v14 & 0xFFFC) >> 2) ^ ((v14 ^ ((unsigned __int16)(v14 & 0xFFFC) >> 2)) >> 1)) & 1;
          if (v12)
          {
            if (*(_WORD *)(v12 + 2 * ((int)i + v10 * (int)v8)))
            {
              unsigned int v16 = 0;
              do
              {
                *a3++ = v15;
                ++v16;
                int v10 = *(_DWORD *)this;
              }
              while (v16 < *(unsigned __int16 *)(*((void *)this + 4) + 2 * ((int)i + *(_DWORD *)this * (int)v8)));
            }
          }
          else
          {
            *a3++ = v15;
            int v10 = *(_DWORD *)this;
          }
        }
        unsigned int v4 = *((unsigned __int16 *)this + 9);
      }
      ++v8;
    }
    while (v8 < v4);
  }
  return 0;
}

uint64_t TailbiteConvCode::SoftMaxDecode(TailbiteConvCode *this, int *a2, unsigned __int8 *a3)
{
  if (!*((void *)this + 3)) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 7);
  if (!v4) {
    return 4;
  }
  switch(*(_DWORD *)this)
  {
    case 6:
      unsigned int v6 = *((_DWORD *)this + 1) - 7;
      if (v6 >= 3) {
        goto LABEL_21;
      }
      unsigned int v7 = off_26DD180C0;
      goto LABEL_20;
    case 7:
      unsigned int v6 = *((_DWORD *)this + 1) - 7;
      if (v6 >= 3) {
        goto LABEL_21;
      }
      unsigned int v7 = off_26DD180D8;
      goto LABEL_20;
    case 8:
      unsigned int v6 = *((_DWORD *)this + 1) - 7;
      if (v6 >= 3) {
        goto LABEL_21;
      }
      unsigned int v7 = off_26DD180F0;
      goto LABEL_20;
    case 9:
      unsigned int v6 = *((_DWORD *)this + 1) - 7;
      if (v6 >= 3) {
        goto LABEL_21;
      }
      unsigned int v7 = off_26DD18108;
      goto LABEL_20;
    case 0xA:
      unsigned int v6 = *((_DWORD *)this + 1) - 7;
      if (v6 >= 3) {
        goto LABEL_21;
      }
      unsigned int v7 = off_26DD18120;
      goto LABEL_20;
    case 0xB:
      unsigned int v6 = *((_DWORD *)this + 1) - 7;
      if (v6 >= 3) {
        goto LABEL_21;
      }
      unsigned int v7 = off_26DD18138;
      goto LABEL_20;
    case 0xC:
      unsigned int v6 = *((_DWORD *)this + 1) - 7;
      if (v6 >= 3) {
        goto LABEL_21;
      }
      unsigned int v7 = off_26DD18150;
      goto LABEL_20;
    case 0xD:
      unsigned int v6 = *((_DWORD *)this + 1) - 7;
      if (v6 >= 3) {
        goto LABEL_21;
      }
      unsigned int v7 = off_26DD18168;
LABEL_20:
      unint64_t v8 = v7[v6];
      goto LABEL_24;
    default:
LABEL_21:
      if (*((unsigned char *)this + 88)) {
        return 6;
      }
      unint64_t v8 = TailbiteConvCode::forwardViterbiMax;
LABEL_24:
      int v32 = 0;
      if (!a2) {
        return 3;
      }
      uint64_t v10 = *((void *)this + 10);
      uint64_t v11 = *((void *)this + 4);
      if (v10)
      {
        if (v11)
        {
          uint64_t v12 = *((unsigned __int16 *)this + 8);
          if (!*((_WORD *)this + 8)) {
            return 7;
          }
          uint64_t v13 = 0;
          LODWORD(v14) = 0;
          do
          {
            LODWORD(v14) = v14 + *(unsigned __int16 *)(v11 + v13);
            v13 += 2;
          }
          while (2 * v12 != v13);
          char v15 = 0;
          if (!v14) {
            return 7;
          }
          goto LABEL_35;
        }
      }
      else if (v11)
      {
        return 4;
      }
      uint64_t v11 = 0;
      LODWORD(v12) = *((unsigned __int16 *)this + 8);
      char v15 = 1;
      LODWORD(v14) = v12;
      if (!*((_WORD *)this + 8)) {
        return 7;
      }
LABEL_35:
      char v16 = 0;
      uint64_t v14 = v14;
      while (1)
      {
        uint64_t v17 = 0;
        int v18 = 0;
        char v19 = 1;
        do
        {
          int v20 = a2[v17];
          BOOL v21 = v20 == 0;
          if (v20 < 0) {
            int v20 = -v20;
          }
          char v22 = v21;
          v19 &= v22;
          v18 += v20 >> v16;
          ++v17;
        }
        while (v14 != v17);
        if (v19) {
          return 7;
        }
        if (v18 != 0x7FFFFFFF) {
          break;
        }
        ++v16;
      }
      if (v15)
      {
        *((void *)this + 10) = a2;
        do
        {
          *a2++ >>= v16;
          --v14;
        }
        while (v14);
      }
      else if (v12)
      {
        uint64_t v23 = 0;
        do
        {
          *(_DWORD *)(v10 + 4 * v23) = 0;
          int v24 = *(unsigned __int16 *)(v11 + 2 * v23);
          if (*(_WORD *)(v11 + 2 * v23))
          {
            int v25 = 0;
            do
            {
              int v26 = *a2++;
              v25 += v26 >> v16;
              *(_DWORD *)(v10 + 4 * v23) = v25;
              --v24;
            }
            while (v24);
          }
          ++v23;
        }
        while (v23 != v12);
      }
      int v27 = (void *)*((void *)this + 5);
      if (!v27) {
        return 4;
      }
      uint64_t v28 = *((unsigned int *)this + 2);
      unsigned int v29 = (_DWORD *)(v4 + 4 * v28);
      *((void *)this + 8) = v29;
      *((void *)this + 9) = v4;
      if (v28)
      {
        unint64_t v30 = 0;
        do
          v29[v30++] = -2147483647;
        while (v30 < *((unsigned int *)this + 2));
      }
      *unsigned int v29 = 0;
      bzero(v27, 4 * (*((_DWORD *)this + 12) * *((_DWORD *)this + 13)));
      uint64_t result = v8(this, *((unsigned __int16 *)this + 9), *((int **)this + 10));
      if (!result)
      {
        uint64_t result = TailbiteConvCode::subtractMax(this, &v32);
        if (!result)
        {
          uint64_t result = v8(this, *((unsigned __int16 *)this + 9), *((int **)this + 10));
          if (!result)
          {
            uint64_t result = TailbiteConvCode::subtractMax(this, &v32);
            if (!result)
            {
              uint64_t v31 = *((void *)this + 5);
              *((void *)this + 5) = v31 + 4 * *((_DWORD *)this + 13) * *((unsigned __int16 *)this + 9);
              uint64_t result = ((uint64_t (*)(TailbiteConvCode *))v8)(this);
              if (!result)
              {
                uint64_t result = TailbiteConvCode::subtractMax(this, &v32);
                if (!result)
                {
                  *((void *)this + 5) = v31;
                  if (!*((void *)this + 4)) {
                    *((void *)this + 10) = 0;
                  }
                  uint64_t result = TailbiteConvCode::backtrackBestPathTailbite(this, a3);
                }
              }
            }
          }
        }
      }
      break;
  }
  return result;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R6C7(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v3 = *((void *)this + 5);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 8);
  if (!v4) {
    return 4;
  }
  uint64_t v5 = *((void *)this + 9);
  if (!v5) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v62 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    uint64_t v6 = 0;
    do
    {
      unint64_t v7 = 0;
      int v8 = *a3;
      int v9 = a3[1];
      int v10 = v9 + *a3;
      int v12 = a3[2];
      int v11 = a3[3];
      int v13 = v10 + v12;
      int v14 = v10 + v12 + v11;
      int v15 = a3[4];
      int v16 = a3[5];
      int v17 = v14 + v15;
      int v18 = v12 - v10;
      int v19 = v12 - v10 + v11;
      int v20 = v11 - (v10 + v12);
      int v21 = v10 - v12;
      int v22 = v10 - v12 + v11;
      v63[0] = v14 + v15 + v16;
      v63[1] = v19 + v15 - v16;
      int v23 = v9 - v8;
      int v24 = v9 - v8 - v12;
      v63[2] = v20 - v15 + v16;
      v63[3] = v22 - (v16 + v15);
      int v25 = v8 - v9;
      int v26 = v25 - v12;
      int v27 = v25 - v12 - v11;
      v63[4] = v24 - v11 - (v16 + v15);
      v63[5] = v27 - v15 + v16;
      int v28 = v25 + v12;
      int v29 = v25 + v12 - v11;
      int v30 = v23 + v12;
      v63[6] = v29 + v15 - v16;
      v63[7] = v16 + v15 + v30 - v11;
      v63[8] = v29 - (v16 + v15);
      v63[9] = v30 - v11 - v15 + v16;
      v63[10] = v24 - v11 + v15 - v16;
      v63[11] = v16 + v15 + v27;
      v63[12] = v16 + v15 + v20;
      v63[13] = v22 + v15 - v16;
      v63[14] = v14 - v15 + v16;
      v63[15] = v19 - (v16 + v15);
      int v31 = v21 - v11;
      v63[16] = v21 - v11 + v15 - v16;
      v63[17] = v16 + v15 - v14;
      int v32 = v18 - v11;
      int v33 = v13 - v11;
      v63[18] = v18 - v11 - (v16 + v15);
      v63[19] = v33 - v15 + v16;
      int v34 = v30 + v11;
      int v35 = v28 + v11;
      v63[20] = v30 + v11 - v15 + v16;
      v63[21] = v35 - (v16 + v15);
      int v36 = v26 + v11;
      int v37 = v24 + v11;
      v63[22] = v16 + v15 + v36;
      v63[23] = v37 + v15 - v16;
      v63[24] = v36 - v15 + v16;
      v63[25] = v37 - (v16 + v15);
      uint64_t v38 = v5;
      v63[26] = v16 + v15 + v34;
      v63[27] = v35 + v15 - v16;
      v63[28] = v32 + v15 - v16;
      v63[29] = v16 + v15 + v33;
      v63[30] = v31 - (v16 + v15);
      v63[31] = v16 - v17;
      uint64_t v5 = v4;
      int v39 = (int *)(v3 + 8 * v6);
LABEL_8:
      int v40 = 0;
      unint64_t v41 = v7 >> 1;
      int v42 = (signed int *)(v38 + 256 + 4 * (v7 >> 1));
      int v43 = (_DWORD *)((char *)v63 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v45 = *v43++;
        int v44 = v45;
        uint64_t v46 = 4 * v7;
        int v47 = *(_DWORD *)(v5 + 4 * v7);
        int v48 = *(_DWORD *)(v5 + ((4 * v7) | 4));
        BOOL v49 = v47 <= v48;
        if (v47 <= v48) {
          int v47 = *(_DWORD *)(v5 + ((4 * v7) | 4));
        }
        unsigned int v50 = v47 + v44;
        if (__OFADD__(v47, v44)) {
          unsigned int v50 = ((v47 + v44) >> 31) ^ 0x80000000;
        }
        *(v42 - 64) = v50;
        BOOL v51 = __OFSUB__(v47, v44);
        signed int v52 = v47 - v44;
        if (v51) {
          signed int v52 = (v52 >> 31) ^ 0x80000000;
        }
        *int v42 = v52;
        int v53 = (4 * v40) | (2 * v49);
        int v54 = *(_DWORD *)(v5 + (v46 | 8));
        int v55 = *(_DWORD *)(v5 + (v46 | 0xC));
        BOOL v56 = v54 <= v55;
        if (v54 > v55) {
          int v55 = v54;
        }
        int v40 = v53 | v56;
        unsigned int v57 = v55 - v44;
        if (__OFSUB__(v55, v44)) {
          unsigned int v57 = ((v55 - v44) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v38 + ((4 * v41) | 4)) = v57;
        BOOL v51 = __OFADD__(v55, v44);
        signed int v58 = v55 + v44;
        if (v51) {
          signed int v58 = (v58 >> 31) ^ 0x80000000;
        }
        v42[1] = v58;
        if ((~(_BYTE)v7 & 0x3C) == 0)
        {
          *v39++ = v40;
          BOOL v59 = v7 >= 0x7C;
          v7 += 4;
          if (v59) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v41 += 2;
        v42 += 2;
        BOOL v59 = v7 >= 0x7C;
        v7 += 4;
      }
      while (!v59);
      if (v40) {
        *int v39 = v40;
      }
LABEL_30:
      a3 += 6;
      ++v6;
      uint64_t v4 = v38;
    }
    while (v6 != v62);
    uint64_t v4 = v38;
  }
  uint64_t v60 = 0;
  *((void *)this + 8) = v4;
  *((void *)this + 9) = v5;
  return v60;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R7C7(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v61 = *((void *)this + 5);
  if (!v61) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v60 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    BOOL v59 = this;
    uint64_t v5 = 0;
    do
    {
      uint64_t v62 = v3;
      unint64_t v6 = 0;
      int v7 = *a3;
      int v8 = a3[1];
      int v9 = v8 + *a3;
      int v11 = a3[2];
      int v10 = a3[3];
      int v12 = v9 + v11 + v10;
      int v13 = a3[4];
      int v14 = a3[5];
      int v15 = a3[6];
      int v16 = v11 - v9 + v10;
      int v17 = v10 - (v9 + v11);
      v63[0] = v15 + v14 + v12 + v13;
      v63[1] = v16 - v14 + v15 + v13;
      int v18 = v8 - v7;
      int v19 = v8 - v7 - v11;
      v63[2] = v14 + v17 - (v15 + v13);
      v63[3] = v9 - v11 + v10 - (v14 + v13 + v15);
      int v20 = v7 - v8;
      int v21 = v20 - v11;
      int v22 = v15 + v14 - v13;
      v63[4] = v19 - v10 - (v14 + v13) + v15;
      v63[5] = v22 + v20 - v11 - v10;
      int v23 = v20 + v11;
      int v24 = v20 + v11 - v10;
      int v25 = v18 + v11;
      v63[6] = v24 + v13 - (v15 + v14);
      v63[7] = v14 + v13 + v25 - v10 - v15;
      v63[8] = v24 - (v14 + v13) + v15;
      v63[9] = v22 + v25 - v10;
      v63[10] = v19 - v10 + v13 - (v15 + v14);
      v63[11] = v14 + v13 + v21 - v10 - v15;
      int v26 = v15 + v14 + v13;
      v63[12] = v26 + v17;
      v63[13] = v9 - v11 + v10 - v14 + v15 + v13;
      v63[14] = v14 + v12 - (v15 + v13);
      v63[15] = v16 - (v14 + v13 + v15);
      int v27 = v9 - v11 - v10;
      v63[16] = v27 + v13 - (v15 + v14);
      v63[17] = v14 + v13 - v15 - v12;
      int v28 = v11 - v9 - v10;
      int v29 = v9 + v11 - v10;
      v63[18] = v28 - (v14 + v13) + v15;
      v63[19] = v22 + v29;
      int v30 = v25 + v10;
      int v31 = v23 + v10;
      v63[20] = v14 + v25 + v10 - (v15 + v13);
      v63[21] = v31 - (v14 + v13 + v15);
      int v32 = v21 + v10;
      int v33 = v26 + v21 + v10;
      int v34 = v19 + v10;
      v63[22] = v33;
      v63[23] = v34 - v14 + v15 + v13;
      v63[24] = v14 + v32 - (v15 + v13);
      v63[25] = v34 - (v14 + v13 + v15);
      v63[26] = v26 + v30;
      v63[27] = v31 - v14 + v15 + v13;
      v63[28] = v28 + v13 - (v15 + v14);
      v63[29] = v14 + v13 + v29 - v15;
      v63[30] = v27 - (v14 + v13) + v15;
      v63[31] = v15 + v14 - (v12 + v13);
      uint64_t v35 = v4;
      uint64_t v4 = v62;
      int v36 = (int *)(v61 + 8 * v5);
LABEL_8:
      int v37 = 0;
      unint64_t v38 = v6 >> 1;
      int v39 = (signed int *)(v35 + 256 + 4 * (v6 >> 1));
      int v40 = (_DWORD *)((char *)v63 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v42 = *v40++;
        int v41 = v42;
        uint64_t v43 = 4 * v6;
        int v44 = *(_DWORD *)(v62 + 4 * v6);
        int v45 = *(_DWORD *)(v62 + ((4 * v6) | 4));
        BOOL v46 = v44 <= v45;
        if (v44 <= v45) {
          int v44 = *(_DWORD *)(v62 + ((4 * v6) | 4));
        }
        unsigned int v47 = v44 + v41;
        if (__OFADD__(v44, v41)) {
          unsigned int v47 = ((v44 + v41) >> 31) ^ 0x80000000;
        }
        *(v39 - 64) = v47;
        BOOL v48 = __OFSUB__(v44, v41);
        signed int v49 = v44 - v41;
        if (v48) {
          signed int v49 = (v49 >> 31) ^ 0x80000000;
        }
        *int v39 = v49;
        int v50 = (4 * v37) | (2 * v46);
        int v51 = *(_DWORD *)(v62 + (v43 | 8));
        int v52 = *(_DWORD *)(v62 + (v43 | 0xC));
        BOOL v53 = v51 <= v52;
        if (v51 > v52) {
          int v52 = v51;
        }
        int v37 = v50 | v53;
        unsigned int v54 = v52 - v41;
        if (__OFSUB__(v52, v41)) {
          unsigned int v54 = ((v52 - v41) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v35 + ((4 * v38) | 4)) = v54;
        BOOL v48 = __OFADD__(v52, v41);
        signed int v55 = v52 + v41;
        if (v48) {
          signed int v55 = (v55 >> 31) ^ 0x80000000;
        }
        v39[1] = v55;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v36++ = v37;
          BOOL v56 = v6 >= 0x7C;
          v6 += 4;
          if (v56) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v38 += 2;
        v39 += 2;
        BOOL v56 = v6 >= 0x7C;
        v6 += 4;
      }
      while (!v56);
      if (v37) {
        int *v36 = v37;
      }
LABEL_30:
      a3 += 7;
      ++v5;
      uint64_t v3 = v35;
    }
    while (v5 != v60);
    uint64_t v3 = v35;
    this = v59;
  }
  uint64_t v57 = 0;
  *((void *)this + 8) = v3;
  *((void *)this + 9) = v4;
  return v57;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R8C7(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  uint64_t v65 = *((void *)this + 5);
  if (!v65) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v64 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    int v63 = this;
    uint64_t v5 = 0;
    do
    {
      uint64_t v72 = v3;
      uint64_t v73 = v5;
      unint64_t v6 = 0;
      int v7 = *a3;
      int v8 = a3[1];
      int v9 = v8 + *a3;
      int v11 = a3[2];
      int v10 = a3[3];
      int v12 = v9 + v11 + v10;
      int v69 = v9 + v11;
      int v13 = a3[4];
      int v14 = a3[5];
      int v71 = v12 + v13;
      int v15 = a3[6];
      int v16 = a3[7];
      int v70 = v11 - v9;
      int v66 = v11 - v9 + v10;
      int v17 = v15 + v13;
      int v18 = v10 - (v9 + v11);
      int v19 = v16 + v15 + v13;
      int v20 = v9 - v11;
      v74[0] = v12 + v13 + v14 + v16 + v15;
      v74[1] = v15 + v13 + v66 - (v16 + v14);
      int v21 = v14 + v13;
      int v22 = v14 + v13 + v15;
      v74[2] = v14 + v18 - v19;
      v74[3] = v20 + v10 - v22 + v16;
      int v23 = v8 - v7;
      int v68 = v8 - v7 - v11;
      int v24 = v16 + v14 + v13;
      int v25 = v7 - v8;
      int v67 = v25 - v11;
      int v26 = v16 + v15 - v13 + v14;
      int v27 = v25 - v11 - v10;
      v74[4] = v15 + v68 - v10 - v24;
      v74[5] = v26 + v27;
      int v28 = v25 + v11;
      int v29 = v23 + v11;
      int v30 = v16 + v13;
      v74[6] = v28 - v10 - (v15 + v14) + v16 + v13;
      v74[7] = v14 + v13 + v29 - v10 - (v16 + v15);
      v74[8] = v15 + v28 - v10 - v24;
      v74[9] = v26 + v29 - v10;
      v74[10] = v68 - v10 - (v15 + v14) + v16 + v13;
      v74[11] = v14 + v13 + v27 - (v16 + v15);
      v74[12] = v19 + v14 + v18;
      v74[13] = v15 + v13 + v20 + v10 - (v16 + v14);
      v74[14] = v14 + v12 - v19;
      v74[15] = v66 - v22 + v16;
      int v31 = v20 - v10;
      v74[16] = v20 - v10 - (v15 + v14) + v30;
      v74[17] = v21 - (v15 + v16) - v12;
      int v32 = v70 - v10;
      int v33 = v69 - v10;
      v74[18] = v15 + v70 - v10 - v24;
      v74[19] = v26 + v69 - v10;
      int v34 = v29 + v10;
      int v35 = v28 + v10;
      v74[20] = v14 + v34 - v19;
      v74[21] = v28 + v10 - v22 + v16;
      int v36 = v67 + v10;
      int v37 = v19 + v14 + v67 + v10;
      int v38 = v68 + v10;
      v74[22] = v37;
      v74[23] = v17 + v38 - (v16 + v14);
      v74[24] = v14 + v36 - v19;
      v74[25] = v38 - v22 + v16;
      v74[26] = v19 + v14 + v34;
      v74[27] = v17 + v35 - (v16 + v14);
      v74[28] = v32 - (v15 + v14) + v30;
      v74[29] = v21 + v33 - (v16 + v15);
      v74[30] = v15 + v31 - v24;
      v74[31] = v14 - v71 + v16 + v15;
      uint64_t v39 = v4;
      uint64_t v4 = v72;
      int v40 = (int *)(v65 + 8 * v73);
LABEL_8:
      int v41 = 0;
      unint64_t v42 = v6 >> 1;
      uint64_t v43 = (signed int *)(v39 + 256 + 4 * (v6 >> 1));
      int v44 = (_DWORD *)((char *)v74 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v46 = *v44++;
        int v45 = v46;
        uint64_t v47 = 4 * v6;
        int v48 = *(_DWORD *)(v72 + 4 * v6);
        int v49 = *(_DWORD *)(v72 + ((4 * v6) | 4));
        BOOL v50 = v48 <= v49;
        if (v48 <= v49) {
          int v48 = *(_DWORD *)(v72 + ((4 * v6) | 4));
        }
        unsigned int v51 = v48 + v45;
        if (__OFADD__(v48, v45)) {
          unsigned int v51 = ((v48 + v45) >> 31) ^ 0x80000000;
        }
        *(v43 - 64) = v51;
        BOOL v52 = __OFSUB__(v48, v45);
        signed int v53 = v48 - v45;
        if (v52) {
          signed int v53 = (v53 >> 31) ^ 0x80000000;
        }
        *uint64_t v43 = v53;
        int v54 = (4 * v41) | (2 * v50);
        int v55 = *(_DWORD *)(v72 + (v47 | 8));
        int v56 = *(_DWORD *)(v72 + (v47 | 0xC));
        BOOL v57 = v55 <= v56;
        if (v55 > v56) {
          int v56 = v55;
        }
        int v41 = v54 | v57;
        unsigned int v58 = v56 - v45;
        if (__OFSUB__(v56, v45)) {
          unsigned int v58 = ((v56 - v45) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v39 + ((4 * v42) | 4)) = v58;
        BOOL v52 = __OFADD__(v56, v45);
        signed int v59 = v56 + v45;
        if (v52) {
          signed int v59 = (v59 >> 31) ^ 0x80000000;
        }
        v43[1] = v59;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v40++ = v41;
          BOOL v60 = v6 >= 0x7C;
          v6 += 4;
          if (v60) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v42 += 2;
        v43 += 2;
        BOOL v60 = v6 >= 0x7C;
        v6 += 4;
      }
      while (!v60);
      if (v41) {
        int *v40 = v41;
      }
LABEL_30:
      a3 += 8;
      uint64_t v5 = v73 + 1;
      uint64_t v3 = v39;
    }
    while (v73 + 1 != v64);
    uint64_t v3 = v39;
    this = v63;
  }
  uint64_t v61 = 0;
  *((void *)this + 8) = v3;
  *((void *)this + 9) = v4;
  return v61;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R9C7(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  uint64_t v68 = *((void *)this + 5);
  if (!v68) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v67 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    int v66 = this;
    uint64_t v5 = 0;
    do
    {
      uint64_t v82 = v3;
      uint64_t v83 = v5;
      unint64_t v6 = 0;
      int v7 = *a3;
      int v8 = a3[1];
      int v9 = v8 + *a3;
      int v11 = a3[2];
      int v10 = a3[3];
      int v74 = v9 + v11 + v10;
      int v77 = v9 + v11;
      int v13 = a3[6];
      int v12 = a3[7];
      int v15 = a3[4];
      int v14 = a3[5];
      int v16 = a3[8];
      int v80 = v12 + v13 + v14;
      int v81 = v74 + v15 + v16;
      int v78 = v11 - v9;
      int v73 = v11 - v9 + v10;
      int v79 = v12 + v14 + v16;
      int v17 = v13 + v15;
      int v18 = v10 - (v9 + v11);
      int v19 = v12 + v13 + v15;
      int v71 = v9 - v11;
      v84[0] = v81 + v80;
      v84[1] = v13 + v15 + v73 - v79;
      int v20 = v9 - v11 + v10;
      int v21 = v14 + v15;
      v84[2] = v16 + v14 + v18 - v19;
      v84[3] = v12 + v20 - (v16 + v14 + v15 + v13);
      int v22 = v8 - v7;
      int v23 = v7 - v8;
      int v76 = v22 - v11;
      int v24 = v22 - v11 - v10;
      int v25 = v12 + v14 + v15 + v16;
      int v75 = v12 + v14 + v15;
      int v72 = v23 - v11;
      int v26 = v23 - v11 - v10;
      int v27 = v12 + v13 - v15;
      v84[4] = v13 + v24 - v25;
      v84[5] = v27 + v16 + v14 + v26;
      int v69 = v23 + v11;
      int v70 = v27 + v16 + v14;
      int v28 = v22 + v11;
      int v29 = v23 + v11 - v10;
      int v30 = v16 + v13 + v14;
      int v31 = v12 + v15;
      v84[6] = v12 + v15 + v29 - v30;
      v84[7] = v14 + v15 + v28 - v10 - (v12 + v13) + v16;
      v84[8] = v29 - v75 + v16 + v13;
      v84[9] = v14 + v28 - v10 - v16 + v27;
      int v32 = v16 + v12 + v15;
      int v33 = v12 + v13 + v16;
      v84[10] = v24 - (v13 + v14) + v32;
      v84[11] = v21 + v26 - v33;
      v84[12] = v18 - v16 + v19 + v14;
      v84[13] = v17 + v20 - (v12 + v14) + v16;
      v84[14] = v14 + v74 - (v19 + v16);
      v84[15] = v73 - (v21 + v13) + v16 + v12;
      int v34 = v71 - v10;
      v84[16] = v31 + v71 - v10 - v30;
      v84[17] = v21 - (v13 + v12) - v74 + v16;
      int v35 = v78 - v10;
      int v36 = v13 + v78 - v10 - v25;
      int v37 = v77 - v10;
      v84[18] = v36;
      v84[19] = v70 + v77 - v10;
      int v38 = v69 + v10;
      int v39 = v28 + v10;
      v84[20] = v16 + v14 + v28 + v10 - v19;
      v84[21] = v12 + v69 + v10 - (v16 + v21 + v13);
      int v40 = v72 + v10;
      int v41 = v76 + v10;
      v84[22] = v16 + v14 + v19 + v40;
      v84[23] = v17 + v41 - v79;
      v84[24] = v14 + v40 - (v19 + v16);
      v84[25] = v41 - (v21 + v13) + v16 + v12;
      v84[26] = v39 - v16 + v19 + v14;
      v84[27] = v17 + v38 - (v12 + v14) + v16;
      v84[28] = v35 - (v13 + v14) + v32;
      v84[29] = v21 + v37 - v33;
      v84[30] = v34 - v75 + v16 + v13;
      v84[31] = v80 - v81;
      uint64_t v42 = v4;
      uint64_t v4 = v82;
      uint64_t v43 = (int *)(v68 + 8 * v83);
LABEL_8:
      int v44 = 0;
      unint64_t v45 = v6 >> 1;
      int v46 = (signed int *)(v42 + 256 + 4 * (v6 >> 1));
      uint64_t v47 = (_DWORD *)((char *)v84 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v49 = *v47++;
        int v48 = v49;
        uint64_t v50 = 4 * v6;
        int v51 = *(_DWORD *)(v82 + 4 * v6);
        int v52 = *(_DWORD *)(v82 + ((4 * v6) | 4));
        BOOL v53 = v51 <= v52;
        if (v51 <= v52) {
          int v51 = *(_DWORD *)(v82 + ((4 * v6) | 4));
        }
        unsigned int v54 = v51 + v48;
        if (__OFADD__(v51, v48)) {
          unsigned int v54 = ((v51 + v48) >> 31) ^ 0x80000000;
        }
        *(v46 - 64) = v54;
        BOOL v55 = __OFSUB__(v51, v48);
        signed int v56 = v51 - v48;
        if (v55) {
          signed int v56 = (v56 >> 31) ^ 0x80000000;
        }
        *int v46 = v56;
        int v57 = (4 * v44) | (2 * v53);
        int v58 = *(_DWORD *)(v82 + (v50 | 8));
        int v59 = *(_DWORD *)(v82 + (v50 | 0xC));
        BOOL v60 = v58 <= v59;
        if (v58 > v59) {
          int v59 = v58;
        }
        int v44 = v57 | v60;
        unsigned int v61 = v59 - v48;
        if (__OFSUB__(v59, v48)) {
          unsigned int v61 = ((v59 - v48) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v42 + ((4 * v45) | 4)) = v61;
        BOOL v55 = __OFADD__(v59, v48);
        signed int v62 = v59 + v48;
        if (v55) {
          signed int v62 = (v62 >> 31) ^ 0x80000000;
        }
        v46[1] = v62;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v43++ = v44;
          BOOL v63 = v6 >= 0x7C;
          v6 += 4;
          if (v63) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v45 += 2;
        v46 += 2;
        BOOL v63 = v6 >= 0x7C;
        v6 += 4;
      }
      while (!v63);
      if (v44) {
        *uint64_t v43 = v44;
      }
LABEL_30:
      a3 += 9;
      uint64_t v5 = v83 + 1;
      uint64_t v3 = v42;
    }
    while (v83 + 1 != v67);
    uint64_t v3 = v42;
    this = v66;
  }
  uint64_t v64 = 0;
  *((void *)this + 8) = v3;
  *((void *)this + 9) = v4;
  return v64;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R10C7(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  uint64_t v74 = *((void *)this + 5);
  if (!v74) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  uint64_t v5 = a3;
  if (!a3) {
    return 3;
  }
  uint64_t v73 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    int v72 = this;
    uint64_t v6 = 0;
    do
    {
      uint64_t v90 = v3;
      uint64_t v91 = v6;
      unint64_t v7 = 0;
      int v9 = *v5;
      int v8 = v5[1];
      int v10 = v8 + *v5;
      int v12 = v5[2];
      int v11 = v5[3];
      int v82 = v10 + v12 + v11;
      int v85 = v10 + v12;
      int v14 = v5[4];
      int v13 = v5[5];
      int v16 = v5[8];
      int v15 = v5[9];
      int v18 = v5[6];
      int v17 = v5[7];
      int v19 = v17 + v18;
      int v88 = v15 + v16 + v82 + v14;
      int v89 = v17 + v18 + v13;
      int v86 = v12 - v10;
      int v78 = v12 - v10 + v11;
      int v87 = v15 + v16 + v17 + v13;
      int v20 = v11 - (v10 + v12);
      int v21 = v17 + v18 + v14;
      int v77 = v10 - v12;
      v92[0] = v88 + v89;
      v92[1] = v18 + v14 + v78 - v87;
      int v22 = v10 - v12 + v11;
      int v23 = v13 + v14;
      int v84 = v15 + v16 + v13 + v14 + v18;
      v92[2] = v20 - v21 + v15 + v16 + v13;
      v92[3] = v17 + v22 - v84;
      int v24 = v8 - v9;
      int v25 = v9 - v8;
      int v83 = v24 - v12;
      int v26 = v24 - v12 - v11;
      int v81 = v17 + v13 + v14;
      int v27 = v17 + v18 - v14 + v13;
      int v79 = v25 - v12;
      int v28 = v25 - v12 - v11;
      v92[4] = v26 - (v81 + v16) + v15 + v18;
      v92[5] = v27 + v16 + v28 - v15;
      int v75 = v25 + v12;
      int v29 = v24 + v12;
      int v30 = v24 + v12 - v11;
      int v31 = v16 + v13 + v14;
      int v32 = v18 + v13;
      int v33 = v16 + v18 + v13;
      int v34 = v17 + v14;
      v92[6] = v17 + v14 + v75 - v11 - v33 + v15;
      v92[7] = v30 + v31 - (v17 + v18 + v15);
      int v80 = v15 + v16 + v18;
      v92[8] = v75 - v11 - v81 + v80;
      v92[9] = v27 + v30 - (v15 + v16);
      int v35 = v15 + v16 + v14;
      int v76 = v15 + v16 + v17 + v18;
      v92[10] = v35 + v17 + v26 - (v18 + v13);
      v92[11] = v13 + v14 + v28 - v76;
      int v36 = v15 + v13;
      int v37 = v18 + v14;
      int v38 = v15 + v17 + v13;
      v92[12] = v15 + v13 + v20 - v16 + v21;
      v92[13] = v16 + v37 + v22 - v38;
      int v39 = v15 + v23 + v18;
      v92[14] = v15 + v13 + v82 - (v21 + v16);
      v92[15] = v16 + v17 + v78 - v39;
      int v40 = v77 - v11;
      v92[16] = v34 + v77 - v11 - v33 + v15;
      v92[17] = v31 - (v18 + v17 + v15) - v82;
      int v41 = v86 - v11;
      int v42 = v86 - v11 - (v17 + v23 + v16) + v15 + v18;
      int v43 = v85 - v11;
      v92[18] = v42;
      v92[19] = v27 + v16 + v85 - v11 - v15;
      int v44 = v29 + v11;
      int v45 = v75 + v11;
      v92[20] = v29 + v11 - v21 + v15 + v16 + v13;
      v92[21] = v17 + v75 + v11 - v84;
      int v46 = v13 + v11 + v79;
      int v47 = v83 + v11;
      v92[22] = v46 + v19 + v35;
      v92[23] = v37 + v47 - v87;
      v92[24] = v46 + v15 - (v21 + v16);
      v92[25] = v16 + v17 + v47 - v39;
      v92[26] = v36 + v44 - v16 + v21;
      v92[27] = v16 + v37 + v45 - v38;
      v92[28] = v35 + v17 + v41 - v32;
      v92[29] = v23 + v43 - v76;
      v92[30] = v40 - v81 + v80;
      v92[31] = v89 - v88;
      uint64_t v48 = v4;
      uint64_t v4 = v90;
      int v49 = (int *)(v74 + 8 * v91);
LABEL_8:
      int v50 = 0;
      unint64_t v51 = v7 >> 1;
      int v52 = (signed int *)(v48 + 256 + 4 * (v7 >> 1));
      BOOL v53 = (_DWORD *)((char *)v92 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v55 = *v53++;
        int v54 = v55;
        uint64_t v56 = 4 * v7;
        int v57 = *(_DWORD *)(v90 + 4 * v7);
        int v58 = *(_DWORD *)(v90 + ((4 * v7) | 4));
        BOOL v59 = v57 <= v58;
        if (v57 <= v58) {
          int v57 = *(_DWORD *)(v90 + ((4 * v7) | 4));
        }
        unsigned int v60 = v57 + v54;
        if (__OFADD__(v57, v54)) {
          unsigned int v60 = ((v57 + v54) >> 31) ^ 0x80000000;
        }
        *(v52 - 64) = v60;
        BOOL v61 = __OFSUB__(v57, v54);
        signed int v62 = v57 - v54;
        if (v61) {
          signed int v62 = (v62 >> 31) ^ 0x80000000;
        }
        *int v52 = v62;
        int v63 = (4 * v50) | (2 * v59);
        int v64 = *(_DWORD *)(v90 + (v56 | 8));
        int v65 = *(_DWORD *)(v90 + (v56 | 0xC));
        BOOL v66 = v64 <= v65;
        if (v64 > v65) {
          int v65 = v64;
        }
        int v50 = v63 | v66;
        unsigned int v67 = v65 - v54;
        if (__OFSUB__(v65, v54)) {
          unsigned int v67 = ((v65 - v54) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v48 + ((4 * v51) | 4)) = v67;
        BOOL v61 = __OFADD__(v65, v54);
        signed int v68 = v65 + v54;
        if (v61) {
          signed int v68 = (v68 >> 31) ^ 0x80000000;
        }
        v52[1] = v68;
        if ((~(_BYTE)v7 & 0x3C) == 0)
        {
          *v49++ = v50;
          BOOL v69 = v7 >= 0x7C;
          v7 += 4;
          if (v69) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v51 += 2;
        v52 += 2;
        BOOL v69 = v7 >= 0x7C;
        v7 += 4;
      }
      while (!v69);
      if (v50) {
        *int v49 = v50;
      }
LABEL_30:
      v5 += 10;
      uint64_t v6 = v91 + 1;
      uint64_t v3 = v48;
    }
    while (v91 + 1 != v73);
    uint64_t v3 = v48;
    this = v72;
  }
  uint64_t v70 = 0;
  *((void *)this + 8) = v3;
  *((void *)this + 9) = v4;
  return v70;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R11C7(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  uint64_t v77 = *((void *)this + 5);
  if (!v77) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v76 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    int v75 = this;
    uint64_t v5 = 0;
    do
    {
      uint64_t v102 = v3;
      uint64_t v103 = v5;
      unint64_t v6 = 0;
      int v7 = *a3;
      int v8 = a3[1];
      int v9 = v8 + *a3;
      int v11 = a3[2];
      int v10 = a3[3];
      int v94 = v9 + v11 + v10;
      int v96 = v9 + v11;
      int v13 = a3[4];
      int v12 = a3[5];
      int v14 = a3[8];
      int v15 = a3[9];
      int v16 = a3[10];
      int v18 = a3[6];
      int v17 = a3[7];
      uint64_t v93 = a3;
      int v100 = v18 + v12 + v14 + v17;
      int v101 = v94 + v13;
      int v97 = v11 - v9;
      int v91 = v11 - v9 + v10;
      int v19 = v15 + v14;
      int v85 = v18 + v13;
      int v98 = v16 + v18 + v13;
      int v99 = v15 + v14 + v17 + v12;
      v104[0] = v100 + v16 + v15 + v94 + v13;
      v104[1] = v98 + v91 - v99;
      int v20 = v17 + v18;
      int v80 = v12 + v10 - (v9 + v11);
      int v81 = v17 + v18 + v13;
      int v86 = v9 - v11;
      int v79 = v9 - v11 + v10;
      int v83 = v12 + v13 + v18;
      int v21 = v16 + v15 + v14;
      int v95 = v21 + v83;
      v104[2] = v15 + v14 + v80 - (v16 + v81);
      v104[3] = v17 + v79 - (v21 + v83);
      int v22 = v8 - v7;
      int v23 = v7 - v8;
      int v92 = v22 - v11;
      int v24 = v22 - v11 - v10;
      int v25 = v17 + v12 + v13;
      int v84 = v25 + v14;
      int v82 = v17 + v18 - v13 + v14 + v12;
      int v89 = v23 - v11;
      int v90 = v21;
      int v26 = v23 - v11 - v10;
      v104[4] = v24 - (v25 + v14) + v16 + v15 + v18;
      v104[5] = v82 + v26 - v15 + v16;
      int v78 = v23 + v11;
      int v27 = v22 + v11;
      int v28 = v14 + v12 + v13;
      int v29 = v22 + v11 - v10 + v28 - (v17 + v18 + v15 + v16);
      int v30 = v15 + v17 + v13;
      int v31 = v16 + v14;
      int v32 = v16 + v14 + v18 + v12;
      v104[6] = v30 + v78 - v10 - v32;
      v104[7] = v29;
      int v87 = v15 + v14 + v18;
      int v88 = v16 + v25;
      v104[8] = v87 + v78 - v10 - (v16 + v25);
      v104[9] = v12 + v17 + v18 - v13 + v27 - v10 - v21;
      int v33 = v16 + v15 + v13;
      int v34 = v14 + v17;
      int v35 = v14 + v17 + v33;
      int v36 = v16 + v12 + v13;
      int v37 = v15 + v14 + v17 + v18;
      v104[10] = v24 - (v18 + v12) + v35;
      v104[11] = v36 + v26 - v37;
      int v38 = v15 + v81;
      int v39 = v16 + v15 + v17 + v12;
      int v40 = v14 + v85;
      v104[12] = v15 + v81 + v80 - (v16 + v14);
      v104[13] = v14 + v85 + v79 - v39;
      int v41 = v81 + v14;
      int v42 = v16 + v15 + v12;
      int v43 = v15 + v83;
      v104[14] = v94 - v41 + v42;
      v104[15] = v34 + v91 - (v15 + v83) + v16;
      int v44 = v86 - v10;
      v104[16] = v30 + v86 - v10 - v32;
      v104[17] = v28 - (v18 + v17 + v15 + v16 + v94);
      int v45 = v97 - v10;
      int v46 = v96 - v10;
      v104[18] = v97 - v10 - v84 + v16 + v15 + v18;
      v104[19] = v82 + v96 - v10 - v15 + v16;
      int v47 = v27 + v10 + v12;
      int v48 = v78 + v10;
      v104[20] = v19 + v47 - (v16 + v81);
      v104[21] = v17 + v78 + v10 - v95;
      int v49 = v89 + v10;
      int v50 = v92 + v10;
      v104[22] = v100 + v33 + v49;
      v104[23] = v98 + v50 - v99;
      v104[24] = v49 - v41 + v42;
      v104[25] = v34 + v50 - v43 + v16;
      v104[26] = v38 + v47 - v31;
      v104[27] = v40 + v48 - v39;
      v104[28] = v45 - (v18 + v12) + v35;
      v104[29] = v36 + v46 - v37;
      v104[30] = v87 + v44 - v88;
      v104[31] = v12 + v20 - v90 - v101;
      uint64_t v51 = v4;
      uint64_t v4 = v102;
      int v52 = (int *)(v77 + 8 * v103);
LABEL_8:
      int v53 = 0;
      unint64_t v54 = v6 >> 1;
      int v55 = (signed int *)(v51 + 256 + 4 * (v6 >> 1));
      uint64_t v56 = (_DWORD *)((char *)v104 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v58 = *v56++;
        int v57 = v58;
        uint64_t v59 = 4 * v6;
        int v60 = *(_DWORD *)(v102 + 4 * v6);
        int v61 = *(_DWORD *)(v102 + ((4 * v6) | 4));
        BOOL v62 = v60 <= v61;
        if (v60 <= v61) {
          int v60 = *(_DWORD *)(v102 + ((4 * v6) | 4));
        }
        unsigned int v63 = v60 + v57;
        if (__OFADD__(v60, v57)) {
          unsigned int v63 = ((v60 + v57) >> 31) ^ 0x80000000;
        }
        *(v55 - 64) = v63;
        BOOL v64 = __OFSUB__(v60, v57);
        signed int v65 = v60 - v57;
        if (v64) {
          signed int v65 = (v65 >> 31) ^ 0x80000000;
        }
        *int v55 = v65;
        int v66 = (4 * v53) | (2 * v62);
        int v67 = *(_DWORD *)(v102 + (v59 | 8));
        int v68 = *(_DWORD *)(v102 + (v59 | 0xC));
        BOOL v69 = v67 <= v68;
        if (v67 > v68) {
          int v68 = v67;
        }
        int v53 = v66 | v69;
        unsigned int v70 = v68 - v57;
        if (__OFSUB__(v68, v57)) {
          unsigned int v70 = ((v68 - v57) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v51 + ((4 * v54) | 4)) = v70;
        BOOL v64 = __OFADD__(v68, v57);
        signed int v71 = v68 + v57;
        if (v64) {
          signed int v71 = (v71 >> 31) ^ 0x80000000;
        }
        v55[1] = v71;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v52++ = v53;
          BOOL v72 = v6 >= 0x7C;
          v6 += 4;
          if (v72) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v54 += 2;
        v55 += 2;
        BOOL v72 = v6 >= 0x7C;
        v6 += 4;
      }
      while (!v72);
      if (v53) {
        *int v52 = v53;
      }
LABEL_30:
      a3 = v93 + 11;
      uint64_t v5 = v103 + 1;
      uint64_t v3 = v51;
    }
    while (v103 + 1 != v76);
    uint64_t v3 = v51;
    this = v75;
  }
  uint64_t v73 = 0;
  *((void *)this + 8) = v3;
  *((void *)this + 9) = v4;
  return v73;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R12C7(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  uint64_t v69 = *((void *)this + 5);
  if (!v69) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v68 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    int v67 = this;
    uint64_t v5 = 0;
    do
    {
      uint64_t v91 = v3;
      unint64_t v6 = 0;
      int v7 = *a3;
      int v8 = a3[1];
      int v9 = v8 + *a3;
      int v10 = a3[2];
      int v11 = a3[3];
      int v82 = v9 + v10 + v11;
      int v87 = v9 + v10;
      int v13 = a3[4];
      int v12 = a3[5];
      int v14 = a3[8];
      int v15 = a3[9];
      int v16 = a3[10];
      int v17 = a3[11];
      int v18 = a3[6];
      int v19 = a3[7];
      int v89 = v14 + v12 + v19 + v18;
      int v90 = v82 + v13;
      int v88 = v10 - v9;
      int v81 = v10 - v9 + v11;
      int v92 = v18 + v13;
      v93[0] = v89 + v16 + v15 + v17 + v82 + v13;
      v93[1] = v18 + v13 + v16 + v81 - (v15 + v14 + v19 + v12 + v17);
      int v72 = v12 + v11 - (v9 + v10);
      int v78 = v9 - v10;
      int v71 = v9 - v10 + v11;
      int v77 = v12 + v13 + v18;
      int v20 = v16 + v15 + v14;
      int v86 = v20 + v77;
      v93[2] = v72 + v15 + v14 - (v19 + v18 + v13 + v17 + v16);
      v93[3] = v17 + v19 + v71 - (v20 + v77);
      int v21 = v8 - v7;
      int v22 = v7 - v8;
      int v84 = v21 - v10;
      int v23 = v21 - v10 - v11;
      int v70 = v12 + v13;
      int v76 = v19 + v12 + v13 + v14;
      int v85 = v19 + v12 + v13;
      int v24 = v19 + v18 - v13;
      int v80 = v22 - v10;
      int v25 = v22 - v10 - v11;
      v93[4] = v23 - (v76 + v17) + v16 + v15 + v18;
      v93[5] = v17 + v16 + v14 + v12 + v24 + v25 - v15;
      int v74 = v22 + v10;
      int v75 = v21 + v10;
      int v26 = v21 + v10 - v11;
      int v27 = v15 + v19 + v13;
      int v28 = v16 + v14 + v18 + v12;
      v93[6] = v27 + v17 + v74 - v11 - v28;
      v93[7] = v12 + v13 + v14 + v26 - (v19 + v18 + v15 + v16 + v17);
      int v83 = v15 + v14 + v18;
      v93[8] = v74 - v11 - (v85 + v16) + v83 + v17;
      v93[9] = v12 + v24 + v26 - (v17 + v20);
      int v29 = v16 + v15 + v13;
      int v30 = v17 + v16 + v13;
      int v79 = v15 + v14 + v19 + v18;
      v93[10] = v23 + v14 + v19 - (v18 + v12 + v17) + v29;
      v93[11] = v12 + v25 - v79 + v30;
      int v31 = v19 + v18 + v13;
      int v73 = v15 + v31;
      int v32 = v16 + v15 + v19 + v12;
      v93[12] = v15 + v31 + v72 - (v17 + v16 + v14);
      v93[13] = v18 + v13 + v17 + v14 + v71 - v32;
      int v33 = v16 + v15 + v12;
      int v34 = v31 + v14;
      v93[14] = v82 - (v31 + v14) + v17 + v33;
      v93[15] = v19 + v16 + v14 + v81 - (v77 + v17 + v15);
      int v35 = v78 - v11;
      v93[16] = v27 + v78 - v11 - (v17 + v28);
      v93[17] = v70 - (v82 + v18 + v19 + v15 + v16) + v17 + v14;
      int v36 = v88 - v11;
      int v37 = v87 - v11;
      v93[18] = v88 - v11 - v76 + v17 + v16 + v15 + v18;
      v93[19] = v24 + v14 + v12 + v87 - v11 + v16 - (v17 + v15);
      int v38 = v75 + v11 + v12;
      int v39 = v38 + v15 + v14 - (v31 + v16);
      int v40 = v74 + v11;
      v93[20] = v39 + v17;
      v93[21] = v19 + v74 + v11 - (v17 + v86);
      int v41 = v80 + v11;
      int v42 = v84 + v11;
      v93[22] = v89 + v41 - v17 + v29;
      v93[23] = v18 + v42 - (v15 + v14 + v19 + v12) + v30;
      v93[24] = v41 - (v34 + v17) + v33;
      v93[25] = v42 - (v77 + v15) + v16 + v14 + v17 + v19;
      v93[26] = v73 + v38 - (v16 + v14) + v17;
      v93[27] = v92 + v14 + v40 - (v17 + v32);
      v93[28] = v36 - (v18 + v12) + v14 + v19 + v17 + v29;
      v93[29] = v16 + v70 + v37 - (v79 + v17);
      v93[30] = v35 + v83 - (v85 + v17 + v16);
      v93[31] = v17 + v12 + v19 + v18 - (v16 + v15 + v14) - v90;
      uint64_t v43 = v4;
      uint64_t v4 = v91;
      int v44 = (int *)(v69 + 8 * v5);
LABEL_8:
      int v45 = 0;
      unint64_t v46 = v6 >> 1;
      int v47 = (signed int *)(v43 + 256 + 4 * (v6 >> 1));
      int v48 = (_DWORD *)((char *)v93 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v50 = *v48++;
        int v49 = v50;
        uint64_t v51 = 4 * v6;
        int v52 = *(_DWORD *)(v91 + 4 * v6);
        int v53 = *(_DWORD *)(v91 + ((4 * v6) | 4));
        BOOL v54 = v52 <= v53;
        if (v52 <= v53) {
          int v52 = *(_DWORD *)(v91 + ((4 * v6) | 4));
        }
        unsigned int v55 = v52 + v49;
        if (__OFADD__(v52, v49)) {
          unsigned int v55 = ((v52 + v49) >> 31) ^ 0x80000000;
        }
        *(v47 - 64) = v55;
        BOOL v56 = __OFSUB__(v52, v49);
        signed int v57 = v52 - v49;
        if (v56) {
          signed int v57 = (v57 >> 31) ^ 0x80000000;
        }
        *int v47 = v57;
        int v58 = (4 * v45) | (2 * v54);
        int v59 = *(_DWORD *)(v91 + (v51 | 8));
        int v60 = *(_DWORD *)(v91 + (v51 | 0xC));
        BOOL v61 = v59 <= v60;
        if (v59 > v60) {
          int v60 = v59;
        }
        int v45 = v58 | v61;
        unsigned int v62 = v60 - v49;
        if (__OFSUB__(v60, v49)) {
          unsigned int v62 = ((v60 - v49) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v43 + ((4 * v46) | 4)) = v62;
        BOOL v56 = __OFADD__(v60, v49);
        signed int v63 = v60 + v49;
        if (v56) {
          signed int v63 = (v63 >> 31) ^ 0x80000000;
        }
        v47[1] = v63;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v44++ = v45;
          BOOL v64 = v6 >= 0x7C;
          v6 += 4;
          if (v64) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v46 += 2;
        v47 += 2;
        BOOL v64 = v6 >= 0x7C;
        v6 += 4;
      }
      while (!v64);
      if (v45) {
        *int v44 = v45;
      }
LABEL_30:
      a3 += 12;
      ++v5;
      uint64_t v3 = v43;
    }
    while (v5 != v68);
    uint64_t v3 = v43;
    this = v67;
  }
  uint64_t v65 = 0;
  *((void *)this + 8) = v3;
  *((void *)this + 9) = v4;
  return v65;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R13C7(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  uint64_t v62 = *((void *)this + 5);
  if (!v62) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v61 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    int v60 = this;
    uint64_t v5 = 0;
    do
    {
      uint64_t v84 = v3;
      unint64_t v6 = 0;
      int v7 = *a3;
      int v8 = a3[1];
      int v9 = v8 + *a3;
      int v10 = a3[2];
      int v11 = a3[3];
      int v78 = v9 + v10 + v11;
      int v76 = v9 + v10;
      int v12 = a3[4];
      int v13 = a3[5];
      int v14 = a3[8];
      int v15 = a3[9];
      int v17 = a3[10];
      int v16 = a3[11];
      int v18 = a3[6];
      int v19 = a3[7];
      int v81 = v10 - v9;
      int v74 = v10 - v9 + v11;
      int v71 = v19 + v13;
      int v82 = v15 + v14 + v19 + v13;
      int v79 = a3;
      int v20 = a3[12];
      int v83 = v19 + v18 + v13;
      v85[0] = v83 + v14 + v17 + v15 + v78 + v12 + v20 + v16;
      v85[1] = v18 + v12 + v17 + v74 - (v82 + v16 + v20);
      int v63 = v13 + v11 - (v9 + v10);
      int v21 = v13;
      int v69 = v9 - v10;
      int v64 = v9 - v10 + v11;
      int v66 = v13 + v12 + v18;
      int v75 = v17 + v15 + v14 + v66;
      v85[2] = v63 + v15 + v14 - (v19 + v18 + v12 + v20 + v16 + v17);
      v85[3] = v20 + v16 + v19 + v64 - v75;
      int v22 = v8 - v7;
      int v80 = v8 - v7 - v10;
      int v23 = v19 + v13 + v12;
      int v24 = v13 + v12;
      int v68 = v23 + v14;
      int v77 = v23;
      int v25 = v7 - v8;
      int v26 = v19 + v18 - v12;
      int v67 = v14 + v13;
      int v27 = v16 + v17 + v14 + v13 + v26;
      int v73 = v25 - v10;
      int v28 = v25 - v10 - v11;
      v85[4] = v80 - v11 - (v23 + v14 + v16) + v17 + v15 + v18 + v20;
      v85[5] = v27 + v28 - (v15 + v20);
      int v70 = v25 + v10;
      int v29 = v25 + v10 - v11;
      int v30 = v17 + v14 + v18 + v21;
      int v72 = v24;
      int v65 = v22 + v10;
      int v31 = v14 + v24;
      v85[6] = v16 + v15 + v19 + v12 + v29 - (v30 + v20);
      v85[7] = v14 + v24 + v22 + v10 - v11 - (v19 + v18 + v15 + v17 + v16) + v20;
      v85[8] = v15 + v14 + v18 + v16 + v29 - (v23 + v17 + v20);
      v85[9] = v21 + v26 + v22 + v10 - v11 - (v16 + v17 + v15 + v14) + v20;
      int v32 = v17 + v15 + v12;
      v85[10] = v80 - v11 + v14 + v19 - (v18 + v21 + v16) + v32 + v20;
      v85[11] = v24 + v16 + v17 + v28 - (v15 + v14 + v19 + v18 + v20);
      int v33 = v19 + v18 + v12;
      int v34 = v17 + v15 + v71;
      int v35 = v20 + v16 + v12;
      v85[12] = v33 + v15 + v63 - (v16 + v20 + v17 + v14);
      v85[13] = v14 + v18 + v64 - v34 + v35;
      v85[14] = v17 + v15 + v21 + v78 - (v33 + v14) + v20 + v16;
      v85[15] = v19 + v17 + v14 + v74 - (v66 + v20 + v16 + v15);
      v85[16] = v15 + v19 + v12 + v69 - v11 - (v16 + v30) + v20;
      v85[17] = v31 + v16 - v20 - (v78 + v18 + v19 + v15 + v17);
      v85[18] = v81 - v11 - v68 + v16 + v17 + v15 + v18 - v20;
      v85[19] = v26 + v67 + v76 - v11 + v17 - (v16 + v15) + v20;
      v85[20] = v15 + v67 + v65 + v11 - (v33 + v17) + v20 + v16;
      v85[21] = v19 + v70 + v11 - (v75 + v20 + v16);
      v85[22] = v83 + v14 + v73 + v11 + v32 - (v20 + v16);
      v85[23] = v17 + v18 + v80 + v11 - v82 + v35;
      v85[24] = v21 + v17 + v15 + v73 + v11 - (v33 + v14 + v20 + v16);
      v85[25] = v80 + v11 + v14 + v19 - (v66 + v15) + v17 + v20 + v16;
      v85[26] = v83 + v15 + v65 + v11 - (v17 + v14) + v35;
      v85[27] = v18 + v12 + v14 + v70 + v11 - (v16 + v20 + v34);
      v85[28] = v81 - v11 - (v18 + v21) + v14 + v19 + v16 + v32 - v20;
      v85[29] = v17 + v72 + v76 - v11 - (v15 + v14 + v19 + v18 + v16) + v20;
      v85[30] = v15 + v14 + v18 + v69 - v11 - (v77 + v16 + v17) + v20;
      v85[31] = v83 + v16 - (v20 + v17 + v15 + v14) - (v78 + v12);
      uint64_t v36 = v4;
      uint64_t v4 = v84;
      int v37 = (int *)(v62 + 8 * v5);
LABEL_8:
      int v38 = 0;
      unint64_t v39 = v6 >> 1;
      int v40 = (signed int *)(v36 + 256 + 4 * (v6 >> 1));
      int v41 = (_DWORD *)((char *)v85 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v43 = *v41++;
        int v42 = v43;
        uint64_t v44 = 4 * v6;
        int v45 = *(_DWORD *)(v84 + 4 * v6);
        int v46 = *(_DWORD *)(v84 + ((4 * v6) | 4));
        BOOL v47 = v45 <= v46;
        if (v45 <= v46) {
          int v45 = *(_DWORD *)(v84 + ((4 * v6) | 4));
        }
        unsigned int v48 = v45 + v42;
        if (__OFADD__(v45, v42)) {
          unsigned int v48 = ((v45 + v42) >> 31) ^ 0x80000000;
        }
        *(v40 - 64) = v48;
        BOOL v49 = __OFSUB__(v45, v42);
        signed int v50 = v45 - v42;
        if (v49) {
          signed int v50 = (v50 >> 31) ^ 0x80000000;
        }
        signed int *v40 = v50;
        int v51 = (4 * v38) | (2 * v47);
        int v52 = *(_DWORD *)(v84 + (v44 | 8));
        int v53 = *(_DWORD *)(v84 + (v44 | 0xC));
        BOOL v54 = v52 <= v53;
        if (v52 > v53) {
          int v53 = v52;
        }
        int v38 = v51 | v54;
        unsigned int v55 = v53 - v42;
        if (__OFSUB__(v53, v42)) {
          unsigned int v55 = ((v53 - v42) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v36 + ((4 * v39) | 4)) = v55;
        BOOL v49 = __OFADD__(v53, v42);
        signed int v56 = v53 + v42;
        if (v49) {
          signed int v56 = (v56 >> 31) ^ 0x80000000;
        }
        v40[1] = v56;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v37++ = v38;
          BOOL v57 = v6 >= 0x7C;
          v6 += 4;
          if (v57) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v39 += 2;
        v40 += 2;
        BOOL v57 = v6 >= 0x7C;
        v6 += 4;
      }
      while (!v57);
      if (v38) {
        *int v37 = v38;
      }
LABEL_30:
      a3 = v79 + 13;
      ++v5;
      uint64_t v3 = v36;
    }
    while (v5 != v61);
    uint64_t v3 = v36;
    this = v60;
  }
  uint64_t v58 = 0;
  *((void *)this + 8) = v3;
  *((void *)this + 9) = v4;
  return v58;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R6C8(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  uint64_t v83 = *((void *)this + 5);
  if (!v83) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v82 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v93 = v3;
      uint64_t v94 = v5;
      unint64_t v6 = 0;
      int v7 = *a3;
      int v8 = a3[1];
      int v9 = a3[2];
      int v10 = a3[3];
      int v12 = a3[4];
      int v11 = a3[5];
      int v95 = a3;
      int v13 = v8 + *a3;
      int v14 = *a3 - v8 - v9;
      int v15 = v14 + v10;
      int v91 = v14 + v10 - v12;
      int v16 = v13 - v9;
      int v17 = v13 - v9 - v10;
      int v92 = v17 - v12;
      int v18 = *a3 - v8 + v9;
      int v19 = v18 - v10;
      int v89 = v18 - v10 + v12;
      v96[1] = v91 + v11;
      v96[2] = v17 - v12 - v11;
      int v20 = v9 - (v8 + v7);
      int v84 = v20 - v10;
      int v90 = v20 - v10 + v12;
      int v21 = v8 - v7;
      int v22 = v21 - v9;
      int v23 = v21 - v9 - v10;
      int v87 = v23 - v12;
      v96[3] = v89 - v11;
      v96[4] = v90 - v11;
      v96[5] = v23 - v12 - v11;
      int v24 = v13 + v9;
      int v25 = v10 - (v13 + v9);
      int v88 = v25 - v12;
      int v26 = v21 + v9;
      int v27 = v26 + v10;
      int v85 = v26 + v10 + v12;
      v96[6] = v25 - v12 + v11;
      v96[7] = v85 + v11;
      int v28 = v13 + v9 + v10;
      int v86 = v12 - v28;
      int v29 = v26 - v10;
      int v30 = v26 - v10 - v12;
      v96[8] = v12 - v28 - v11;
      v96[9] = v30 - v11;
      int v31 = v20 + v10;
      int v32 = v20 + v10 - v12;
      int v33 = v22 + v10;
      int v34 = v22 + v10 + v12;
      v96[10] = v32 + v11;
      v96[11] = v34 + v11;
      int v35 = v13 - v9 + v10;
      int v36 = v18 + v10;
      int v37 = v16 + v10 + v12;
      int v38 = v18 + v10 - v12;
      v96[12] = v37 + v11;
      v96[13] = v38 + v11;
      int v39 = v24 - v10;
      int v40 = v14 - v10;
      int v41 = v24 - v10 - v12;
      int v42 = v40 + v12;
      v96[14] = v41 - v11;
      v96[15] = v40 + v12 - v11;
      int v43 = v19 - v12;
      int v44 = v17 + v12;
      v96[16] = v43 - v11;
      v96[17] = v17 + v12 - v11;
      int v45 = v15 + v12;
      int v46 = v28 - v12;
      v96[18] = v45 + v11;
      v96[19] = v28 - v12 + v11;
      int v47 = v27 - v12;
      int v48 = v25 + v12;
      v96[20] = v47 + v11;
      v96[21] = v48 + v11;
      int v49 = v23 + v12;
      v96[22] = v49 - v11;
      v96[23] = v84 - v12 - v11;
      v96[24] = v33 - v12 + v11;
      v96[25] = v31 + v12 + v11;
      int v50 = v28 + v12;
      v96[0] = v50 + v11;
      int v51 = v29 + v12;
      v96[26] = v51 - v11;
      v96[27] = -(v50 + v11);
      int v52 = v40 - v12;
      int v53 = v39 + v12;
      v96[28] = v52 - v11;
      v96[29] = v53 - v11;
      int v54 = v36 + v12;
      int v55 = v35 - v12;
      v96[30] = v54 + v11;
      v96[31] = v55 + v11;
      v96[32] = v44 + v11;
      v96[33] = v43 + v11;
      v96[34] = v46 - v11;
      v96[35] = v45 - v11;
      v96[36] = v48 - v11;
      v96[37] = v47 - v11;
      v96[38] = v84 - v12 + v11;
      v96[39] = v49 + v11;
      v96[40] = v31 + v12 - v11;
      v96[41] = v33 - v12 - v11;
      v96[42] = v11 - v50;
      v96[43] = v51 + v11;
      v96[44] = v53 + v11;
      v96[45] = v52 + v11;
      v96[46] = v55 - v11;
      v96[47] = v54 - v11;
      v96[48] = v91 - v11;
      v96[49] = v50 - v11;
      v96[50] = v89 + v11;
      v96[51] = v92 + v11;
      v96[52] = v87 + v11;
      v96[53] = v90 + v11;
      v96[54] = v85 - v11;
      v96[55] = v88 - v11;
      v96[56] = v30 + v11;
      v96[57] = v86 + v11;
      v96[58] = v34 - v11;
      v96[59] = v32 - v11;
      int v56 = v41 + v11;
      v96[60] = v38 - v11;
      v96[61] = v37 - v11;
      v96[62] = v42 + v11;
      uint64_t v57 = v4;
      uint64_t v4 = v93;
      v96[63] = v56;
      uint64_t v58 = (int *)(v83 + 16 * v94);
LABEL_8:
      int v59 = 0;
      unint64_t v60 = v6 >> 1;
      uint64_t v61 = (unsigned int *)(v57 + 4 * (v6 >> 1));
      uint64_t v62 = (_DWORD *)((char *)v96 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v64 = *v62++;
        int v63 = v64;
        uint64_t v65 = 4 * v6;
        int v66 = *(_DWORD *)(v93 + 4 * v6);
        int v67 = *(_DWORD *)(v93 + ((4 * v6) | 4));
        BOOL v68 = v66 <= v67;
        if (v66 <= v67) {
          int v66 = *(_DWORD *)(v93 + ((4 * v6) | 4));
        }
        unsigned int v69 = v66 + v63;
        if (__OFADD__(v66, v63)) {
          unsigned int v69 = ((v66 + v63) >> 31) ^ 0x80000000;
        }
        *uint64_t v61 = v69;
        BOOL v70 = __OFSUB__(v66, v63);
        signed int v71 = v66 - v63;
        if (v70) {
          signed int v71 = (v71 >> 31) ^ 0x80000000;
        }
        v61[128] = v71;
        int v72 = (4 * v59) | (2 * v68);
        int v73 = *(_DWORD *)(v93 + (v65 | 8));
        int v74 = *(_DWORD *)(v93 + (v65 | 0xC));
        BOOL v75 = v73 <= v74;
        if (v73 > v74) {
          int v74 = v73;
        }
        int v59 = v72 | v75;
        unsigned int v76 = v74 - v63;
        if (__OFSUB__(v74, v63)) {
          unsigned int v76 = ((v74 - v63) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v57 + ((4 * v60) | 4)) = v76;
        BOOL v70 = __OFADD__(v74, v63);
        signed int v77 = v74 + v63;
        if (v70) {
          signed int v77 = (v77 >> 31) ^ 0x80000000;
        }
        v61[129] = v77;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v58++ = v59;
          BOOL v78 = v6 >= 0xFC;
          v6 += 4;
          if (v78) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v60 += 2;
        v61 += 2;
        BOOL v78 = v6 >= 0xFC;
        v6 += 4;
      }
      while (!v78);
      if (v59) {
        *uint64_t v58 = v59;
      }
LABEL_30:
      a3 = v95 + 6;
      uint64_t v5 = v94 + 1;
      uint64_t v3 = v57;
    }
    while (v94 + 1 != v82);
  }
  else
  {
    uint64_t v57 = *((void *)this + 8);
  }
  uint64_t v79 = 0;
  *((void *)this + 8) = v57;
  *((void *)this + 9) = v4;
  return v79;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R7C8(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  uint64_t v76 = *((void *)this + 5);
  if (!v76) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v75 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v81 = v3;
      uint64_t v90 = v5;
      unint64_t v6 = 0;
      int v8 = *a3;
      int v7 = a3[1];
      int v9 = v7 + *a3;
      int v10 = a3[2];
      int v11 = a3[3];
      int v12 = v9 + v10;
      int v13 = v9 + v10 + v11;
      int v15 = a3[4];
      int v14 = a3[5];
      int v87 = v13 + v15;
      int v79 = v13 + v15 + v14;
      int v16 = a3[6];
      int v17 = *a3 - v7 - v10;
      int v77 = v17 + v11;
      int v89 = v17 + v11 - v15;
      int v18 = v9 - v10;
      int v19 = v9 - v10 - v11;
      int v20 = *a3 - v7 + v10;
      v91[0] = v79 + v16;
      v91[1] = v16 + v14 + v89;
      int v21 = v20 - v11;
      int v88 = v20 - v11 + v15;
      int v22 = v10 - v9;
      v91[2] = v19 - v15 - (v16 + v14);
      v91[3] = v88 - (v16 + v14);
      int v78 = v10 - v9 - v11;
      int v23 = v7 - v8;
      int v24 = v23 - v10;
      int v25 = v23 - v10 - v11;
      int v86 = v25 - v15;
      v91[4] = v78 + v15 - v14 + v16;
      v91[5] = v25 - v15 - v14 + v16;
      int v26 = v11 - (v9 + v10);
      int v85 = v26 - v15;
      int v27 = v23 + v10;
      int v28 = v27 + v11;
      int v83 = v27 + v11 + v15;
      v91[6] = v26 - v15 + v14 - v16;
      v91[7] = v83 + v14 - v16;
      int v84 = v15 - v13;
      int v29 = v27 - v11;
      int v80 = v27 - v11 - v15;
      v91[8] = v15 - v13 - v14 + v16;
      v91[9] = v80 - v14 + v16;
      int v30 = v22 + v11;
      int v82 = v22 + v11 - v15;
      int v31 = v24 + v11;
      int v32 = v24 + v11 + v15;
      v91[10] = v82 + v14 - v16;
      v91[11] = v32 + v14 - v16;
      int v33 = v18 + v11;
      int v34 = v20 + v11;
      int v35 = v18 + v11 + v15;
      int v36 = v20 + v11 - v15;
      v91[12] = v16 + v14 + v35;
      v91[13] = v16 + v14 + v36;
      int v37 = v12 - v11;
      int v38 = v17 - v11;
      int v39 = v12 - v11 - v15;
      int v40 = v38 + v15;
      v91[14] = v39 - (v16 + v14);
      v91[15] = v38 + v15 - (v16 + v14);
      v91[16] = v21 - v15 - (v16 + v14);
      v91[17] = v19 + v15 - (v16 + v14);
      int v41 = v13 - v15;
      v91[18] = v16 + v14 + v77 + v15;
      v91[19] = v16 + v14 + v41;
      int v42 = v26 + v15;
      v91[20] = v28 - v15 + v14 - v16;
      v91[21] = v42 + v14 - v16;
      int v43 = v25 + v15;
      v91[22] = v43 - v14 + v16;
      v91[23] = v78 - v15 - v14 + v16;
      int v44 = v30 + v15;
      v91[24] = v31 - v15 + v14 - v16;
      v91[25] = v44 + v14 - v16;
      int v45 = v29 + v15;
      v91[26] = v45 - v14 + v16;
      v91[27] = v16 - v79;
      int v46 = v38 - v15;
      int v47 = v37 + v15;
      v91[28] = v46 - (v16 + v14);
      v91[29] = v47 - (v16 + v14);
      int v48 = v34 + v15;
      int v49 = v33 - v15;
      v91[30] = v16 + v14 + v48;
      v91[31] = v16 + v14 + v49;
      v91[32] = v19 + v15 + v14 - v16;
      v91[33] = v21 - v15 + v14 - v16;
      v91[34] = v41 - v14 + v16;
      v91[35] = v77 + v15 - v14 + v16;
      v91[36] = v42 - (v16 + v14);
      v91[37] = v28 - v15 - (v16 + v14);
      v91[38] = v16 + v14 + v78 - v15;
      v91[39] = v16 + v14 + v43;
      v91[40] = v44 - (v16 + v14);
      v91[41] = v31 - v15 - (v16 + v14);
      v91[42] = v16 + v14 - v87;
      v91[43] = v16 + v14 + v45;
      v91[44] = v47 + v14 - v16;
      v91[45] = v46 + v14 - v16;
      v91[46] = v49 - v14 + v16;
      v91[47] = v48 - v14 + v16;
      v91[48] = v89 - v14 + v16;
      v91[49] = v87 - v14 + v16;
      v91[50] = v88 + v14 - v16;
      v91[51] = v19 - v15 + v14 - v16;
      v91[52] = v16 + v14 + v86;
      v91[53] = v16 + v14 + v78 + v15;
      v91[54] = v83 - (v16 + v14);
      v91[55] = v85 - (v16 + v14);
      v91[56] = v16 + v14 + v80;
      v91[57] = v16 + v14 + v84;
      v91[58] = v32 - (v16 + v14);
      v91[59] = v82 - (v16 + v14);
      v91[60] = v36 - v14 + v16;
      v91[61] = v35 - v14 + v16;
      v91[62] = v40 + v14 - v16;
      v91[63] = v39 + v14 - v16;
      uint64_t v50 = v4;
      uint64_t v4 = v81;
      int v51 = (int *)(v76 + 16 * v90);
LABEL_8:
      int v52 = 0;
      unint64_t v53 = v6 >> 1;
      int v54 = (unsigned int *)(v50 + 4 * (v6 >> 1));
      int v55 = (_DWORD *)((char *)v91 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v57 = *v55++;
        int v56 = v57;
        uint64_t v58 = 4 * v6;
        int v59 = *(_DWORD *)(v81 + 4 * v6);
        int v60 = *(_DWORD *)(v81 + ((4 * v6) | 4));
        BOOL v61 = v59 <= v60;
        if (v59 <= v60) {
          int v59 = *(_DWORD *)(v81 + ((4 * v6) | 4));
        }
        unsigned int v62 = v59 + v56;
        if (__OFADD__(v59, v56)) {
          unsigned int v62 = ((v59 + v56) >> 31) ^ 0x80000000;
        }
        *int v54 = v62;
        BOOL v63 = __OFSUB__(v59, v56);
        signed int v64 = v59 - v56;
        if (v63) {
          signed int v64 = (v64 >> 31) ^ 0x80000000;
        }
        v54[128] = v64;
        int v65 = (4 * v52) | (2 * v61);
        int v66 = *(_DWORD *)(v81 + (v58 | 8));
        int v67 = *(_DWORD *)(v81 + (v58 | 0xC));
        BOOL v68 = v66 <= v67;
        if (v66 > v67) {
          int v67 = v66;
        }
        int v52 = v65 | v68;
        unsigned int v69 = v67 - v56;
        if (__OFSUB__(v67, v56)) {
          unsigned int v69 = ((v67 - v56) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v50 + ((4 * v53) | 4)) = v69;
        BOOL v63 = __OFADD__(v67, v56);
        signed int v70 = v67 + v56;
        if (v63) {
          signed int v70 = (v70 >> 31) ^ 0x80000000;
        }
        v54[129] = v70;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v51++ = v52;
          BOOL v71 = v6 >= 0xFC;
          v6 += 4;
          if (v71) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v53 += 2;
        v54 += 2;
        BOOL v71 = v6 >= 0xFC;
        v6 += 4;
      }
      while (!v71);
      if (v52) {
        *int v51 = v52;
      }
LABEL_30:
      a3 += 7;
      uint64_t v5 = v90 + 1;
      uint64_t v3 = v50;
    }
    while (v90 + 1 != v75);
  }
  else
  {
    uint64_t v50 = *((void *)this + 8);
  }
  uint64_t v72 = 0;
  *((void *)this + 8) = v50;
  *((void *)this + 9) = v4;
  return v72;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R8C8(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  uint64_t v77 = *((void *)this + 5);
  if (!v77) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v76 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v99 = v3;
      uint64_t v100 = v5;
      unint64_t v6 = 0;
      int v7 = *a3;
      int v8 = a3[1];
      int v9 = v8 + *a3;
      int v11 = a3[2];
      int v10 = a3[3];
      int v12 = v9 + v11;
      int v13 = v9 + v11 + v10;
      int v14 = a3[4];
      int v15 = a3[5];
      int v95 = v13 + v14;
      int v82 = v13 + v14 + v15;
      int v17 = a3[6];
      int v16 = a3[7];
      int v18 = *a3 - v8 - v11;
      int v81 = v18 + v10;
      int v97 = v18 + v10 - v14;
      int v19 = v9 - v11;
      int v79 = v9 - v11 - v10;
      int v98 = v79 - v14;
      v101[0] = v16 + v17 + v82;
      v101[1] = v17 + v15 + v97 - v16;
      int v20 = v7 - v8 + v11;
      int v21 = v20 - v10;
      int v94 = v20 - v10 + v14;
      int v22 = v17 + v15 + v16;
      v101[2] = v79 - v14 - (v17 + v15) + v16;
      v101[3] = v94 - v22;
      int v23 = v11 - v9;
      int v80 = v11 - v9 - v10;
      int v96 = v80 + v14;
      int v24 = v8 - v7 - v11;
      int v25 = v24 - v10;
      int v93 = v24 - v10 - v14;
      v101[4] = v17 + v80 + v14 - (v16 + v15);
      v101[5] = v16 + v17 - v15 + v93;
      int v26 = v8 - v7 + v11;
      int v27 = v10 - v12;
      int v92 = v10 - v12 - v14;
      int v28 = v26 + v10;
      int v90 = v26 + v10 + v14;
      v101[6] = v92 + v15 - (v16 + v17);
      v101[7] = v90 - v17 + v16 + v15;
      int v29 = v26 - v10;
      int v88 = v26 - v10 - v14;
      int v89 = v14 - v13;
      v101[8] = v16 + v17 - v15 + v14 - v13;
      v101[9] = v17 + v88 - (v16 + v15);
      int v30 = v23 + v10;
      int v91 = v30 - v14;
      int v31 = v24 + v10;
      int v86 = v31 + v14;
      v101[10] = v30 - v14 - v17 + v16 + v15;
      v101[11] = v31 + v14 + v15 - (v16 + v17);
      int v78 = v19 + v10;
      int v87 = v19 + v10 + v14;
      int v32 = v20 + v10;
      int v85 = v32 - v14;
      int v33 = v16 + v17 + v15;
      v101[12] = v17 + v15 + v87 - v16;
      v101[13] = v33 + v32 - v14;
      int v34 = v12 - v10;
      int v35 = v18 - v10;
      int v83 = v35 + v14;
      int v84 = v12 - v10 - v14;
      v101[14] = v84 - v22;
      v101[15] = v35 + v14 - (v17 + v15) + v16;
      int v36 = v21 - v14;
      int v37 = v79 + v14;
      v101[16] = v36 - v22;
      v101[17] = v79 + v14 - (v17 + v15) + v16;
      int v38 = v81 + v14;
      int v39 = v13 - v14;
      v101[18] = v17 + v15 + v81 + v14 - v16;
      v101[19] = v33 + v39;
      int v40 = v28 - v14;
      int v41 = v27 + v14;
      v101[20] = v28 - v14 - v17 + v16 + v15;
      v101[21] = v41 + v15 - (v16 + v17);
      int v42 = v25 + v14;
      int v43 = v80 - v14;
      v101[22] = v16 + v17 - v15 + v42;
      v101[23] = v17 + v80 - v14 - (v16 + v15);
      int v44 = v31 - v14;
      int v45 = v30 + v14;
      v101[24] = v44 + v15 - (v16 + v17);
      v101[25] = v45 - v17 + v16 + v15;
      int v46 = v29 + v14;
      v101[26] = v17 + v46 - (v16 + v15);
      v101[27] = v16 + v17 - v82;
      int v47 = v35 - v14;
      int v48 = v34 + v14;
      v101[28] = v47 - (v17 + v15) + v16;
      v101[29] = v48 - v22;
      int v49 = v32 + v14;
      int v50 = v78 - v14;
      v101[30] = v33 + v49;
      v101[31] = v17 + v15 + v50 - v16;
      v101[32] = v37 + v15 - (v16 + v17);
      v101[33] = v36 - v17 + v16 + v15;
      v101[34] = v17 + v39 - (v16 + v15);
      v101[35] = v16 + v17 - v15 + v38;
      v101[36] = v41 - (v17 + v15) + v16;
      v101[37] = v40 - v22;
      v101[38] = v33 + v43;
      v101[39] = v17 + v15 + v42 - v16;
      v101[40] = v45 - v22;
      v101[41] = v44 - (v17 + v15) + v16;
      v101[42] = v17 + v15 - v16 - v95;
      v101[43] = v33 + v46;
      v101[44] = v48 - v17 + v16 + v15;
      v101[45] = v47 + v15 - (v16 + v17);
      v101[46] = v16 + v17 - v15 + v50;
      v101[47] = v17 + v49 - (v16 + v15);
      v101[48] = v16 + v17 - v15 + v97;
      v101[49] = v17 + v95 - (v16 + v15);
      v101[50] = v94 - v17 + v16 + v15;
      v101[51] = v98 + v15 - (v16 + v17);
      v101[52] = v17 + v15 + v93 - v16;
      v101[53] = v33 + v96;
      v101[54] = v90 - v22;
      v101[55] = v92 - (v17 + v15) + v16;
      v101[56] = v33 + v88;
      v101[57] = v17 + v15 + v89 - v16;
      v101[58] = v86 - (v17 + v15) + v16;
      v101[59] = v91 - v22;
      v101[60] = v17 + v85 - (v16 + v15);
      v101[61] = v16 + v17 - v15 + v87;
      v101[62] = v83 + v15 - (v16 + v17);
      v101[63] = v84 - v17 + v16 + v15;
      uint64_t v51 = v4;
      uint64_t v4 = v99;
      int v52 = (int *)(v77 + 16 * v100);
LABEL_8:
      int v53 = 0;
      unint64_t v54 = v6 >> 1;
      int v55 = (unsigned int *)(v51 + 4 * (v6 >> 1));
      int v56 = (_DWORD *)((char *)v101 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v58 = *v56++;
        int v57 = v58;
        uint64_t v59 = 4 * v6;
        int v60 = *(_DWORD *)(v99 + 4 * v6);
        int v61 = *(_DWORD *)(v99 + ((4 * v6) | 4));
        BOOL v62 = v60 <= v61;
        if (v60 <= v61) {
          int v60 = *(_DWORD *)(v99 + ((4 * v6) | 4));
        }
        unsigned int v63 = v60 + v57;
        if (__OFADD__(v60, v57)) {
          unsigned int v63 = ((v60 + v57) >> 31) ^ 0x80000000;
        }
        *int v55 = v63;
        BOOL v64 = __OFSUB__(v60, v57);
        signed int v65 = v60 - v57;
        if (v64) {
          signed int v65 = (v65 >> 31) ^ 0x80000000;
        }
        v55[128] = v65;
        int v66 = (4 * v53) | (2 * v62);
        int v67 = *(_DWORD *)(v99 + (v59 | 8));
        int v68 = *(_DWORD *)(v99 + (v59 | 0xC));
        BOOL v69 = v67 <= v68;
        if (v67 > v68) {
          int v68 = v67;
        }
        int v53 = v66 | v69;
        unsigned int v70 = v68 - v57;
        if (__OFSUB__(v68, v57)) {
          unsigned int v70 = ((v68 - v57) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v51 + ((4 * v54) | 4)) = v70;
        BOOL v64 = __OFADD__(v68, v57);
        signed int v71 = v68 + v57;
        if (v64) {
          signed int v71 = (v71 >> 31) ^ 0x80000000;
        }
        v55[129] = v71;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v52++ = v53;
          BOOL v72 = v6 >= 0xFC;
          v6 += 4;
          if (v72) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v54 += 2;
        v55 += 2;
        BOOL v72 = v6 >= 0xFC;
        v6 += 4;
      }
      while (!v72);
      if (v53) {
        *int v52 = v53;
      }
LABEL_30:
      a3 += 8;
      uint64_t v5 = v100 + 1;
      uint64_t v3 = v51;
    }
    while (v100 + 1 != v76);
  }
  else
  {
    uint64_t v51 = *((void *)this + 8);
  }
  uint64_t v73 = 0;
  *((void *)this + 8) = v51;
  *((void *)this + 9) = v4;
  return v73;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R9C8(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  uint64_t v68 = *((void *)this + 5);
  if (!v68) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v67 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v103 = v3;
      uint64_t v104 = v5;
      unint64_t v6 = 0;
      int v7 = *a3;
      int v8 = a3[1];
      int v9 = v8 + *a3;
      int v10 = a3[2];
      int v11 = a3[3];
      int v12 = v9 + v10;
      int v72 = v9 + v10 + v11;
      int v13 = a3[4];
      int v14 = a3[5];
      int v100 = v72 + v13;
      int v15 = a3[6];
      int v16 = a3[7];
      uint64_t v105 = a3;
      int v17 = a3[8];
      int v87 = *a3 - v8 - v10;
      int v81 = v87 + v11;
      int v101 = v87 + v11 - v13;
      int v18 = v9 - v10;
      int v78 = v9 - v10 - v11;
      int v102 = v78 - v13;
      v106[0] = v72 + v13 + v14 + v15 + v17 + v16;
      v106[1] = v15 + v14 + v101 - (v17 + v16);
      int v19 = v7 - v8 + v10;
      v106[2] = v16 + v78 - v13 - (v17 + v15 + v14);
      v106[3] = v19 - v11 + v13 - (v15 + v14 + v16) + v17;
      int v80 = v10 - v9 - v11;
      int v20 = v8 - v7;
      int v98 = v80 + v13;
      int v99 = v19 - v11 + v13;
      int v85 = v16 + v14 + v17;
      int v21 = v17 + v16 - v14 + v15;
      int v75 = v20 - v10 - v11;
      int v84 = v21;
      v106[4] = v15 + v80 + v13 - v85;
      v106[5] = v21 + v75 - v13;
      int v96 = v11 - (v9 + v10) - v13;
      int v97 = v75 - v13;
      int v22 = v20 + v10 + v11;
      int v94 = v22 + v13;
      v106[6] = v96 - (v16 + v15) + v17 + v14;
      v106[7] = v16 + v14 + v22 + v13 - (v17 + v15);
      int v77 = v20 + v10 - v11;
      int v92 = v77 - v13;
      int v93 = v13 - v72;
      v106[8] = v21 + v13 - v72;
      v106[9] = v15 + v77 - v13 - v85;
      int v73 = v10 - v9 + v11;
      int v95 = v73 - v13;
      int v23 = v20 - v10 + v11;
      int v90 = v23 + v13;
      v106[10] = v16 + v14 + v73 - v13 - (v17 + v15);
      v106[11] = v23 + v13 - (v16 + v15) + v17 + v14;
      int v76 = v18 + v11;
      int v91 = v18 + v11 + v13;
      int v74 = v19 + v11;
      int v89 = v19 + v11 - v13;
      int v83 = v17 + v16 + v14 + v15;
      v106[12] = v15 + v14 + v91 - (v17 + v16);
      v106[13] = v83 + v89;
      int v69 = v12 - v11;
      int v24 = v87 - v11;
      int v88 = v12 - v11 - v13;
      int v86 = v24 + v13;
      v106[14] = v88 - (v15 + v14 + v16) + v17;
      v106[15] = v16 + v24 + v13 - (v17 + v15 + v14);
      int v70 = v78 + v13;
      int v71 = v19 - v11 - v13;
      int v25 = v15 + v14 + v16 + v17;
      v106[16] = v71 - v25;
      v106[17] = v78 + v13 - (v15 + v14) + v17 + v16;
      int v82 = v81 + v13;
      int v26 = v72 - v13;
      int v27 = v16 + v15 + v14;
      v106[18] = v15 + v14 + v82 - v16 + v17;
      v106[19] = v72 - v13 - v17 + v27;
      int v79 = v22 - v13;
      int v28 = v22 - v13 - v15 + v17 + v16 + v14;
      int v29 = v11 - v12 + v13;
      int v30 = v16 + v15 + v17;
      v106[20] = v28;
      v106[21] = v29 + v14 - v30;
      int v31 = v75 + v13;
      int v32 = v80 - v13;
      v106[22] = v16 + v15 + v75 + v13 - (v17 + v14);
      v106[23] = v80 - v13 - (v16 + v14) + v17 + v15;
      int v33 = v23 - v13;
      int v34 = v73 + v13;
      v106[24] = v23 - v13 + v14 - v30;
      v106[25] = v73 + v13 - v15 + v17 + v16 + v14;
      int v35 = v77 + v13;
      v106[26] = v77 + v13 - (v16 + v14) + v17 + v15;
      v106[27] = v16 + v15 - v17 - (v72 + v13 + v14);
      int v36 = v24 - v13;
      int v37 = v69 + v13;
      v106[28] = v36 - (v15 + v14) + v17 + v16;
      v106[29] = v69 + v13 - v25;
      int v38 = v74 + v13;
      int v39 = v76 - v13;
      v106[30] = v38 - v17 + v27;
      v106[31] = v15 + v14 + v39 - v16 + v17;
      v106[32] = v70 + v14 - v30;
      v106[33] = v71 - v15 + v17 + v16 + v14;
      v106[34] = v26 - (v16 + v14) + v17 + v15;
      v106[35] = v16 + v15 + v82 - (v17 + v14);
      v106[36] = v29 - (v15 + v14) + v17 + v16;
      v106[37] = v79 - v25;
      v106[38] = v32 - v17 + v27;
      v106[39] = v15 + v14 + v31 - v16 + v17;
      v106[40] = v34 - v25;
      v106[41] = v33 - (v15 + v14) + v17 + v16;
      v106[42] = v15 + v14 - v16 - v100 + v17;
      v106[43] = v35 - v17 + v27;
      v106[44] = v37 - v15 + v17 + v16 + v14;
      v106[45] = v36 + v14 - v30;
      v106[46] = v16 + v15 + v39 - (v17 + v14);
      v106[47] = v38 - (v16 + v14) + v17 + v15;
      v106[48] = v84 + v101;
      v106[49] = v15 + v100 - v85;
      v106[50] = v16 + v14 + v99 - (v17 + v15);
      v106[51] = v102 - (v16 + v15) + v17 + v14;
      int v40 = v17 + v15 + v14;
      v106[52] = v15 + v14 + v97 - (v17 + v16);
      v106[53] = v83 + v98;
      int v41 = v15 + v14 + v16;
      v106[54] = v94 - v41 + v17;
      v106[55] = v16 + v96 - v40;
      v106[56] = v83 + v92;
      v106[57] = v15 + v14 + v93 - (v17 + v16);
      v106[58] = v16 + v90 - v40;
      v106[59] = v95 - v41 + v17;
      v106[60] = v15 + v89 - v85;
      v106[61] = v84 + v91;
      v106[62] = v86 - (v16 + v15) + v17 + v14;
      v106[63] = v16 + v14 + v88 - (v17 + v15);
      uint64_t v42 = v4;
      uint64_t v4 = v103;
      int v43 = (int *)(v68 + 16 * v104);
LABEL_8:
      int v44 = 0;
      unint64_t v45 = v6 >> 1;
      int v46 = (unsigned int *)(v42 + 4 * (v6 >> 1));
      int v47 = (_DWORD *)((char *)v106 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v49 = *v47++;
        int v48 = v49;
        uint64_t v50 = 4 * v6;
        int v51 = *(_DWORD *)(v103 + 4 * v6);
        int v52 = *(_DWORD *)(v103 + ((4 * v6) | 4));
        BOOL v53 = v51 <= v52;
        if (v51 <= v52) {
          int v51 = *(_DWORD *)(v103 + ((4 * v6) | 4));
        }
        unsigned int v54 = v51 + v48;
        if (__OFADD__(v51, v48)) {
          unsigned int v54 = ((v51 + v48) >> 31) ^ 0x80000000;
        }
        *int v46 = v54;
        BOOL v55 = __OFSUB__(v51, v48);
        signed int v56 = v51 - v48;
        if (v55) {
          signed int v56 = (v56 >> 31) ^ 0x80000000;
        }
        v46[128] = v56;
        int v57 = (4 * v44) | (2 * v53);
        int v58 = *(_DWORD *)(v103 + (v50 | 8));
        int v59 = *(_DWORD *)(v103 + (v50 | 0xC));
        BOOL v60 = v58 <= v59;
        if (v58 > v59) {
          int v59 = v58;
        }
        int v44 = v57 | v60;
        unsigned int v61 = v59 - v48;
        if (__OFSUB__(v59, v48)) {
          unsigned int v61 = ((v59 - v48) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v42 + ((4 * v45) | 4)) = v61;
        BOOL v55 = __OFADD__(v59, v48);
        signed int v62 = v59 + v48;
        if (v55) {
          signed int v62 = (v62 >> 31) ^ 0x80000000;
        }
        v46[129] = v62;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v43++ = v44;
          BOOL v63 = v6 >= 0xFC;
          v6 += 4;
          if (v63) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v45 += 2;
        v46 += 2;
        BOOL v63 = v6 >= 0xFC;
        v6 += 4;
      }
      while (!v63);
      if (v44) {
        *int v43 = v44;
      }
LABEL_30:
      a3 = v105 + 9;
      uint64_t v5 = v104 + 1;
      uint64_t v3 = v42;
    }
    while (v104 + 1 != v67);
  }
  else
  {
    uint64_t v42 = *((void *)this + 8);
  }
  uint64_t v64 = 0;
  *((void *)this + 8) = v42;
  *((void *)this + 9) = v4;
  return v64;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R10C8(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  uint64_t v71 = *((void *)this + 5);
  if (!v71) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v70 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v112 = v3;
      uint64_t v113 = v5;
      unint64_t v6 = 0;
      int v8 = *a3;
      int v7 = a3[1];
      int v9 = v7 + *a3;
      int v10 = a3[2];
      int v11 = a3[3];
      int v73 = v9 + v10 + v11;
      int v12 = a3[4];
      int v13 = a3[5];
      int v109 = v73 + v12;
      int v14 = a3[6];
      int v15 = a3[7];
      int v16 = a3[8];
      int v17 = a3[9];
      uint64_t v114 = a3;
      int v92 = *a3 - v7 - v10;
      int v90 = v92 + v11;
      int v110 = v92 + v11 - v12;
      int v86 = v9 - v10 - v11;
      int v111 = v86 - v12;
      v115[0] = v16 + v15 + v17 + v14 + v73 + v12 + v13;
      v115[1] = v14 + v13 + v110 - (v16 + v15) + v17;
      int v96 = v16 + v14 + v13;
      int v18 = v8 - v7 + v10;
      int v80 = v18 - v11;
      int v19 = v17 + v14 + v13 + v15;
      v115[2] = v15 + v86 - v12 - (v96 + v17);
      v115[3] = v16 + v18 - v11 + v12 - v19;
      int v20 = v7 - v8;
      int v88 = v10 - v9 - v11;
      int v107 = v88 + v12;
      int v108 = v18 - v11 + v12;
      int v102 = v15 + v13 + v16;
      int v84 = v20 - v10 - v11;
      int v98 = v16 + v15 - v13;
      v115[4] = v14 + v88 + v12 - (v102 + v17);
      v115[5] = v84 - v12 - v17 + v98 + v14;
      int v77 = v11 - (v9 + v10);
      int v105 = v77 - v12;
      int v106 = v84 - v12;
      int v21 = v17 + v16 + v13;
      int v22 = v20 + v10 + v11;
      int v101 = v22 + v12;
      v115[6] = v77 - v12 - (v15 + v14) + v21;
      v115[7] = v15 + v13 + v22 + v12 - (v16 + v14) + v17;
      int v104 = v12 - v73;
      int v82 = v20 + v10 - v11;
      int v100 = v82 - v12;
      v115[8] = v12 - v73 - v17 + v98 + v14;
      v115[9] = v14 + v82 - v12 - (v102 + v17);
      int v78 = v10 - v9 + v11;
      int v103 = v78 - v12;
      int v23 = v20 - v10 + v11;
      int v97 = v23 + v12;
      v115[10] = v15 + v13 + v78 - v12 - (v16 + v14) + v17;
      v115[11] = v23 + v12 - (v15 + v14) + v21;
      int v83 = v9 - v10 + v11;
      int v99 = v83 + v12;
      int v79 = v18 + v11;
      int v94 = v18 + v11 - v12;
      int v72 = v16 + v15 + v13;
      v115[12] = v14 + v13 + v83 + v12 - (v16 + v15) + v17;
      v115[13] = v17 + v14 + v72 + v94;
      int v75 = v9 + v10 - v11;
      int v95 = v75 - v12;
      int v24 = v92 - v11;
      int v93 = v24 + v12;
      v115[14] = v16 + v75 - v12 - v19;
      v115[15] = v15 + v24 + v12 - (v96 + v17);
      int v76 = v80 - v12;
      int v74 = v86 + v12;
      int v25 = v14 + v13 + v15 + v16;
      v115[16] = v80 - v12 - (v25 + v17);
      v115[17] = v16 + v15 + v86 + v12 - (v17 + v14 + v13);
      int v87 = v90 + v12;
      int v26 = v17 + v15 + v14 + v13;
      v115[18] = v90 + v12 - v15 + v21 + v14;
      v115[19] = v26 + v73 - v12 - v16;
      int v81 = v22 - v12;
      int v27 = v77 + v12;
      v115[20] = v72 + v17 + v22 - v12 - v14;
      v115[21] = v77 + v12 + v13 - (v15 + v14 + v16) + v17;
      int v85 = v84 + v12;
      int v28 = v88 - v12;
      int v29 = v17 + v15 + v13;
      v115[22] = v15 + v14 + v85 - v21;
      v115[23] = v16 + v14 + v88 - v12 - v29;
      int v30 = v23 - v12;
      int v31 = v78 + v12;
      v115[24] = v30 + v13 - (v15 + v14 + v16) + v17;
      v115[25] = v72 + v17 + v78 + v12 - v14;
      int v89 = v82 + v12;
      int v32 = v17 + v16;
      v115[26] = v16 + v14 + v82 + v12 - v29;
      v115[27] = v15 + v14 - (v17 + v16) - (v73 + v12 + v13);
      int v33 = v24 - v12;
      int v34 = v75 + v12;
      v115[28] = v16 + v15 + v24 - v12 - (v17 + v14 + v13);
      v115[29] = v75 + v12 - (v25 + v17);
      int v91 = v79 + v12;
      int v35 = v83 - v12;
      v115[30] = v26 + v79 + v12 - v16;
      v115[31] = v83 - v12 - v15 + v21 + v14;
      int v36 = v15 + v14 + v16 + v17;
      v115[32] = v74 + v13 - v36;
      v115[33] = v72 + v76 - (v17 + v14);
      int v37 = v17 + v16 + v14;
      int v38 = v73 - v12 - (v15 + v13) + v37;
      int v39 = v16 + v13;
      v115[34] = v38;
      v115[35] = v15 + v14 + v87 - (v16 + v13) + v17;
      int v40 = v17 + v16 + v15;
      v115[36] = v27 - (v14 + v13) + v40;
      v115[37] = v81 - v25 + v17;
      v115[38] = v15 + v14 + v13 + v28 - (v17 + v16);
      v115[39] = v96 + v85 - (v17 + v15);
      v115[40] = v31 - v25 + v17;
      v115[41] = v30 - (v14 + v13) + v40;
      v115[42] = v96 - (v15 + v17) - v109;
      v115[43] = v15 + v14 + v13 + v89 - (v17 + v16);
      v115[44] = v72 + v34 - (v17 + v14);
      v115[45] = v33 + v13 - v36;
      v115[46] = v15 + v14 + v35 - (v16 + v13) + v17;
      v115[47] = v91 - (v15 + v13) + v37;
      int v41 = v98 + v17 + v14;
      v115[48] = v41 + v110;
      v115[49] = v109 - v102 + v17 + v14;
      int v42 = v16 + v14 + v17;
      int v43 = v17 + v15 + v14;
      v115[50] = v15 + v13 + v108 - v42;
      v115[51] = v39 + v111 - v43;
      v115[52] = v14 + v13 + v106 - v40;
      v115[53] = v107 - v17 + v72 + v14;
      int v44 = v14 + v13 + v15;
      v115[54] = v101 - v44 + v32;
      v115[55] = v105 - v96 + v17 + v15;
      v115[56] = v100 - v17 + v72 + v14;
      v115[57] = v14 + v13 + v104 - v40;
      v115[58] = v97 - v96 + v17 + v15;
      v115[59] = v103 - v44 + v32;
      v115[60] = v94 - v102 + v17 + v14;
      v115[61] = v41 + v99;
      v115[62] = v39 + v93 - v43;
      v115[63] = v15 + v13 + v95 - v42;
      uint64_t v45 = v4;
      uint64_t v4 = v112;
      int v46 = (int *)(v71 + 16 * v113);
LABEL_8:
      int v47 = 0;
      unint64_t v48 = v6 >> 1;
      int v49 = (unsigned int *)(v45 + 4 * (v6 >> 1));
      uint64_t v50 = (_DWORD *)((char *)v115 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v52 = *v50++;
        int v51 = v52;
        uint64_t v53 = 4 * v6;
        int v54 = *(_DWORD *)(v112 + 4 * v6);
        int v55 = *(_DWORD *)(v112 + ((4 * v6) | 4));
        BOOL v56 = v54 <= v55;
        if (v54 <= v55) {
          int v54 = *(_DWORD *)(v112 + ((4 * v6) | 4));
        }
        unsigned int v57 = v54 + v51;
        if (__OFADD__(v54, v51)) {
          unsigned int v57 = ((v54 + v51) >> 31) ^ 0x80000000;
        }
        *int v49 = v57;
        BOOL v58 = __OFSUB__(v54, v51);
        signed int v59 = v54 - v51;
        if (v58) {
          signed int v59 = (v59 >> 31) ^ 0x80000000;
        }
        v49[128] = v59;
        int v60 = (4 * v47) | (2 * v56);
        int v61 = *(_DWORD *)(v112 + (v53 | 8));
        int v62 = *(_DWORD *)(v112 + (v53 | 0xC));
        BOOL v63 = v61 <= v62;
        if (v61 > v62) {
          int v62 = v61;
        }
        int v47 = v60 | v63;
        unsigned int v64 = v62 - v51;
        if (__OFSUB__(v62, v51)) {
          unsigned int v64 = ((v62 - v51) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v45 + ((4 * v48) | 4)) = v64;
        BOOL v58 = __OFADD__(v62, v51);
        signed int v65 = v62 + v51;
        if (v58) {
          signed int v65 = (v65 >> 31) ^ 0x80000000;
        }
        v49[129] = v65;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v46++ = v47;
          BOOL v66 = v6 >= 0xFC;
          v6 += 4;
          if (v66) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v48 += 2;
        v49 += 2;
        BOOL v66 = v6 >= 0xFC;
        v6 += 4;
      }
      while (!v66);
      if (v47) {
        *int v46 = v47;
      }
LABEL_30:
      a3 = v114 + 10;
      uint64_t v5 = v113 + 1;
      uint64_t v3 = v45;
    }
    while (v113 + 1 != v70);
  }
  else
  {
    uint64_t v45 = *((void *)this + 8);
  }
  uint64_t v67 = 0;
  *((void *)this + 8) = v45;
  *((void *)this + 9) = v4;
  return v67;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R11C8(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  uint64_t v69 = *((void *)this + 5);
  if (!v69) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v68 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v101 = v3;
      uint64_t v102 = v5;
      unint64_t v6 = 0;
      int v7 = *a3;
      int v8 = a3[1];
      int v9 = v8 + *a3;
      int v10 = a3[2];
      int v11 = a3[3];
      int v74 = v9 + v10 + v11;
      int v13 = a3[4];
      int v12 = a3[5];
      int v86 = v74 + v13 + v12;
      int v15 = a3[8];
      int v14 = a3[9];
      int v16 = a3[10];
      int v17 = a3[6];
      int v18 = a3[7];
      int v103 = a3;
      int v88 = *a3 - v8 - v10;
      int v104 = v88 + v11;
      int v99 = v88 + v11 - v13;
      int v19 = v16 + v14 + v12 + v17;
      v106[0] = v15 + v18 + v16 + v14 + v17 + v86;
      v106[1] = v99 - (v15 + v18) + v19;
      int v100 = v9 - v10 - v11 - v13;
      int v87 = v15 + v17 + v12;
      int v20 = v7 - v8 + v10;
      int v105 = v17 + v12 + v18;
      v106[2] = v18 + v100 - (v16 + v14 + v87);
      v106[3] = v15 + v20 - v11 + v13 - (v16 + v14 + v105);
      int v21 = v8 - v7;
      int v85 = v10 - v9 - v11;
      int v97 = v85 + v13 + v17;
      int v98 = v20 - v11 + v13;
      int v22 = v15 + v18 - v12 + v17;
      int v23 = v8 - v7 - v10;
      int v82 = v23 - v11;
      int v96 = v23 - v11 - v13;
      int v90 = v18 + v12 + v15;
      v106[4] = v97 - (v16 + v14 + v90);
      v106[5] = v22 + v96 - (v16 + v14);
      int v75 = v11 - (v9 + v10);
      int v24 = v16 + v14 + v12 + v15;
      int v25 = v16 + v14 + v12 + v18;
      int v26 = v21 + v10 + v11;
      v106[6] = v24 + v75 - v13 - (v18 + v17);
      v106[7] = v26 + v13 - (v15 + v17) + v25;
      int v80 = v21 + v10 - v11;
      int v94 = v17 + v80 - v13;
      v106[8] = v22 + v13 - v74 - (v16 + v14);
      v106[9] = v94 - (v16 + v14 + v90);
      int v77 = v10 - v9 + v11;
      int v95 = v77 - v13;
      int v73 = v23 + v11;
      int v93 = v23 + v11 + v13;
      v106[10] = v77 - v13 - (v15 + v17) + v25;
      v106[11] = v24 + v93 - (v18 + v17);
      int v84 = v9 - v10 + v11;
      v106[12] = v84 + v13 - (v15 + v18) + v19;
      v106[13] = v19 + v15 + v18 + v20 + v11 - v13;
      int v27 = v9 + v10 - v11;
      int v91 = v20 + v11 - v13;
      int v92 = v27 - v13;
      int v72 = v88 - v11;
      int v89 = v88 - v11 + v13;
      v106[14] = v15 + v27 - v13 - (v16 + v14 + v105);
      v106[15] = v18 + v89 - (v16 + v14 + v87);
      int v79 = v20 - v11 - v13;
      int v71 = v105 + v15 + v14;
      int v76 = v9 - v10 - v11 + v13;
      int v28 = v14 + v17 + v12;
      v106[16] = v79 - v71 + v16;
      v106[17] = v15 + v18 + v76 - v28 + v16;
      int v29 = v14 + v15 + v12;
      int v30 = v14 + v18 + v17 + v12;
      v106[18] = v29 + v17 + v104 + v13 - (v16 + v18);
      v106[19] = v30 + v74 - v13 - (v16 + v15);
      int v70 = v15 + v18 + v12;
      int v31 = v16 + v18 + v17 + v15;
      v106[20] = v70 + v14 + v26 - v13 - (v16 + v17);
      v106[21] = v14 + v12 + v75 + v13 - v31;
      int v83 = v82 + v13;
      int v32 = v14 + v18 + v12;
      v106[22] = v18 + v17 + v16 + v83 - v29;
      v106[23] = v15 + v17 + v85 - v13 - v32 + v16;
      int v78 = v77 + v13;
      v106[24] = v14 + v12 + v73 - v13 - v31;
      v106[25] = v70 + v14 + v78 - (v16 + v17);
      int v33 = v80 + v13;
      v106[26] = v15 + v17 + v80 + v13 - v32 + v16;
      v106[27] = v18 + v17 - (v14 + v15) - v86 + v16;
      int v34 = v27 + v13;
      v106[28] = v15 + v18 + v72 - v13 - v28 + v16;
      v106[29] = v34 - v71 + v16;
      int v81 = v20 + v11 + v13;
      v106[30] = v30 + v81 - (v16 + v15);
      v106[31] = v29 + v17 + v84 - v13 - (v16 + v18);
      int v35 = v16 + v14 + v18 + v17 + v15;
      v106[32] = v76 + v12 - v35;
      v106[33] = v70 + v79 - (v16 + v14 + v17);
      int v36 = v15 + v16 + v14 + v17;
      v106[34] = v74 - v13 - (v18 + v12) + v36;
      v106[35] = v18 + v17 + v104 + v13 - v15 + v16 + v14 - v12;
      int v37 = v15 + v18 + v16 + v14;
      v106[36] = v75 + v13 - (v17 + v12) + v37;
      v106[37] = v26 - v13 - (v105 + v15) + v16 + v14;
      int v38 = v14 + v15 + v16;
      v106[38] = v18 + v17 + v12 + v85 - v13 - v38;
      v106[39] = v87 + v83 - (v14 + v18 + v16);
      v106[40] = v78 - (v105 + v15) + v16 + v14;
      v106[41] = v73 - v13 - (v17 + v12) + v37;
      v106[42] = v87 - (v18 + v14 + v16) - (v74 + v13);
      v106[43] = v18 + v17 + v12 + v33 - v38;
      v106[44] = v70 + v34 - (v16 + v14 + v17);
      v106[45] = v72 - v13 + v12 - v35;
      v106[46] = v18 + v17 + v84 - v13 - v15 + v16 + v14 - v12;
      v106[47] = v81 - (v18 + v12) + v36;
      int v39 = v15 + v18 - v12 + v17 + v14;
      v106[48] = v39 + v99 - v16;
      v106[49] = v14 + v17 + v74 + v13 - (v16 + v90);
      int v40 = v16 + v15 + v12;
      int v41 = v15 + v17 + v14;
      v106[50] = v18 + v12 + v98 - v41 + v16;
      v106[51] = v100 - (v14 + v18 + v17) + v40;
      int v42 = v15 + v18 + v14;
      v106[52] = v17 + v12 + v96 - v42 + v16;
      v106[53] = v16 + v70 + v97 - v14;
      v106[54] = v14 + v15 + v26 + v13 - (v16 + v105);
      v106[55] = v14 + v18 + v75 - v13 - (v16 + v87);
      v106[56] = v16 + v70 + v94 - v14;
      v106[57] = v17 + v12 + v13 - v74 - v42 + v16;
      v106[58] = v14 + v18 + v93 - (v16 + v87);
      v106[59] = v14 + v15 + v95 - (v16 + v105);
      v106[60] = v14 + v17 + v91 - (v16 + v90);
      v106[61] = v39 + v84 + v13 - v16;
      v106[62] = v89 - (v14 + v18 + v17) + v40;
      v106[63] = v18 + v12 + v92 - v41 + v16;
      uint64_t v43 = v4;
      uint64_t v4 = v101;
      int v44 = (int *)(v69 + 16 * v102);
LABEL_8:
      int v45 = 0;
      unint64_t v46 = v6 >> 1;
      int v47 = (unsigned int *)(v43 + 4 * (v6 >> 1));
      unint64_t v48 = (_DWORD *)((char *)v106 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v50 = *v48++;
        int v49 = v50;
        uint64_t v51 = 4 * v6;
        int v52 = *(_DWORD *)(v101 + 4 * v6);
        int v53 = *(_DWORD *)(v101 + ((4 * v6) | 4));
        BOOL v54 = v52 <= v53;
        if (v52 <= v53) {
          int v52 = *(_DWORD *)(v101 + ((4 * v6) | 4));
        }
        unsigned int v55 = v52 + v49;
        if (__OFADD__(v52, v49)) {
          unsigned int v55 = ((v52 + v49) >> 31) ^ 0x80000000;
        }
        *int v47 = v55;
        BOOL v56 = __OFSUB__(v52, v49);
        signed int v57 = v52 - v49;
        if (v56) {
          signed int v57 = (v57 >> 31) ^ 0x80000000;
        }
        v47[128] = v57;
        int v58 = (4 * v45) | (2 * v54);
        int v59 = *(_DWORD *)(v101 + (v51 | 8));
        int v60 = *(_DWORD *)(v101 + (v51 | 0xC));
        BOOL v61 = v59 <= v60;
        if (v59 > v60) {
          int v60 = v59;
        }
        int v45 = v58 | v61;
        unsigned int v62 = v60 - v49;
        if (__OFSUB__(v60, v49)) {
          unsigned int v62 = ((v60 - v49) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v43 + ((4 * v46) | 4)) = v62;
        BOOL v56 = __OFADD__(v60, v49);
        signed int v63 = v60 + v49;
        if (v56) {
          signed int v63 = (v63 >> 31) ^ 0x80000000;
        }
        v47[129] = v63;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v44++ = v45;
          BOOL v64 = v6 >= 0xFC;
          v6 += 4;
          if (v64) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v46 += 2;
        v47 += 2;
        BOOL v64 = v6 >= 0xFC;
        v6 += 4;
      }
      while (!v64);
      if (v45) {
        *int v44 = v45;
      }
LABEL_30:
      a3 = v103 + 11;
      uint64_t v5 = v102 + 1;
      uint64_t v3 = v43;
    }
    while (v102 + 1 != v68);
  }
  else
  {
    uint64_t v43 = *((void *)this + 8);
  }
  uint64_t v65 = 0;
  *((void *)this + 8) = v43;
  *((void *)this + 9) = v4;
  return v65;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R12C8(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v119 = *MEMORY[0x263EF8340];
  uint64_t v68 = *((void *)this + 5);
  if (!v68) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v67 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v113 = v3;
      uint64_t v114 = v5;
      unint64_t v6 = 0;
      int v7 = *a3;
      int v8 = a3[1];
      int v9 = v8 + *a3;
      int v11 = a3[2];
      int v10 = a3[3];
      int v13 = a3[4];
      int v12 = a3[5];
      int v110 = v9 + v11 + v10 + v13;
      int v92 = v110 + v12;
      int v14 = a3[8];
      int v91 = a3[9];
      int v16 = a3[10];
      int v15 = a3[11];
      int v18 = a3[6];
      int v17 = a3[7];
      int v94 = *a3 - v8 - v11;
      int v115 = v94 + v10;
      int v111 = v94 + v10 - v13;
      int v19 = v16 + v91 + v12;
      v118[0] = v15 + v14 + v17 + v16 + v91 + v18 + v110 + v12;
      v118[1] = v111 - (v14 + v17) + v15 + v19 + v18;
      int v112 = v9 - v11 - v10 - v13;
      int v116 = v18 + v12;
      int v101 = v14 + v18 + v12;
      int v20 = v7 - v8 + v11;
      int v109 = v20 - v10 + v13;
      int v117 = v18 + v12 + v17;
      v118[2] = v15 + v17 + v112 - (v16 + v91 + v101);
      v118[3] = v15 + v14 + v109 - (v16 + v91 + v117);
      int v89 = v11 - v9 - v10;
      int v107 = v18 + v13 + v89;
      int v88 = v17 + v12;
      int v98 = v17 + v12 + v14;
      int v21 = v16 + v91 + v98;
      int v22 = v14 + v17 - v12 + v18;
      int v23 = v8 - v7 - v11;
      int v104 = v23 - v10 - v13;
      v118[4] = v107 + v15 - v21;
      v118[5] = v22 + v104 - (v16 + v91) + v15;
      int v79 = v10 - (v9 + v11);
      int v108 = v79 - v13;
      int v24 = v8 - v7 + v11;
      int v102 = v24 + v10 + v13;
      v118[6] = v79 - v13 - (v17 + v18) + v15 + v14 + v19;
      v118[7] = v102 - (v14 + v18) + v15 + v17 + v19;
      int v25 = v9 + v11 + v10;
      int v106 = v13 - v25;
      int v103 = v18 + v24 - v10 - v13;
      v118[8] = v22 + v13 - v25 - (v16 + v91 + v15);
      v118[9] = v103 - (v15 + v21);
      int v81 = v11 - v9 + v10;
      int v105 = v81 - v13;
      int v99 = v23 + v10 + v13;
      v118[10] = v17 + v81 - v13 - (v14 + v18 + v15) + v19;
      v118[11] = v14 + v99 - (v17 + v18 + v15) + v19;
      int v87 = v9 - v11 + v10;
      int v100 = v87 + v13;
      int v83 = v20 + v10;
      int v97 = v18 + v20 + v10 - v13;
      v118[12] = v87 + v13 - (v14 + v17 + v15) + v19 + v18;
      v118[13] = v97 + v14 + v17 - v15 + v19;
      int v77 = v9 + v11 - v10;
      int v96 = v77 - v13;
      int v72 = v17;
      int v73 = v94 - v10;
      int v95 = v94 - v10 + v13;
      v118[14] = v14 + v77 - v13 - (v15 + v16 + v91 + v117);
      v118[15] = v17 + v95 - (v15 + v16 + v91 + v101);
      int v78 = v9 - v11 - v10 + v13;
      int v26 = v18 + v12;
      int v76 = v20 - v10 - v13;
      v118[16] = v76 - (v117 + v14 + v91) + v15 + v16;
      v118[17] = v78 + v14 + v17 - (v18 + v12 + v91) + v15 + v16;
      int v80 = v115 + v13;
      int v27 = v12;
      int v28 = v91 + v14 + v12;
      int v75 = v25 - v13;
      int v86 = v17 + v18 + v12;
      v118[18] = v18 + v115 + v13 - (v17 + v16) + v28 + v15;
      v118[19] = v91 + v86 + v25 - v13 - (v16 + v14) + v15;
      int v74 = v24 + v10 - v13;
      int v70 = v14 + v17 + v12;
      int v71 = v79 + v13;
      int v29 = v16 + v17 + v18 + v14;
      v118[20] = v74 - (v18 + v16) + v70 + v91 + v15;
      v118[21] = v79 + v13 + v12 - v29 + v15 + v91;
      int v85 = v23 - v10 + v13;
      int v30 = v89 - v13;
      v118[22] = v17 + v18 + v85 - v28 + v15 + v16;
      v118[23] = v14 + v18 + v89 - v13 - (v91 + v88) + v15 + v16;
      int v90 = v23 + v10 - v13;
      int v31 = v81 + v13;
      v118[24] = v90 + v27 + v91 - (v15 + v29);
      v118[25] = v81 + v13 + v70 + v91 - (v18 + v15 + v16);
      int v82 = v24 - v10 + v13;
      int v69 = v17 + v18;
      v118[26] = v18 + v16 + v14 + v82 - (v91 + v88 + v15);
      v118[27] = v17 + v18 + v16 - (v91 + v14 + v15) - v92;
      int v93 = v73 - v13;
      int v32 = v14 + v17;
      int v33 = v77 + v13;
      v118[28] = v73 - v13 - v26 + v14 + v17 + v16 - (v15 + v91);
      v118[29] = v16 + v77 + v13 - (v117 + v14 + v91 + v15);
      int v84 = v83 + v13;
      int v34 = v87 - v13;
      v118[30] = v91 + v86 + v84 - (v15 + v16 + v14);
      v118[31] = v18 + v28 + v34 - (v17 + v15 + v16);
      int v35 = v16 + v91 + v15;
      int v36 = v16 + v91 + v17 + v18 + v14;
      v118[32] = v78 + v27 + v15 - v36;
      v118[33] = v70 + v15 + v76 - (v16 + v91 + v18);
      int v37 = v16 + v91 - v27;
      v118[34] = v35 + v75 - v88 + v14 + v18;
      v118[35] = v69 + v80 - v14 + v15 + v37;
      v118[36] = v35 + v71 - v26 + v32;
      v118[37] = v35 + v74 - (v117 + v14);
      int v38 = v26;
      int v39 = v26 + v85 - (v91 + v72 + v16);
      int v40 = v91 + v14 + v16;
      v118[38] = v86 + v30 - v40 + v15;
      v118[39] = v39 + v15 + v14;
      v118[40] = v31 + v16 + v91 - (v117 + v14 + v15);
      v118[41] = v90 - v38 + v32 + v16 + v91 - v15;
      v118[42] = v101 - (v91 + v72 + v16 + v15) - v110;
      v118[43] = v86 + v82 - (v15 + v40);
      v118[44] = v33 + v70 - (v18 + v35);
      v118[45] = v93 + v27 - (v15 + v36);
      v118[46] = v69 + v37 + v34 - (v15 + v14);
      v118[47] = v84 - v88 + v14 + v18 + v16 + v91 - v15;
      v118[48] = v22 + v91 + v111 - v16 + v15;
      v118[49] = v18 + v110 - (v16 + v98) + v15 + v91;
      int v41 = v14 + v18 + v91;
      v118[50] = v72 + v109 - v41 + v15 + v16 + v27;
      v118[51] = v14 + v112 - (v91 + v69) + v15 + v16 + v27;
      v118[52] = v18 + v104 - (v32 + v91) + v15 + v16 + v27;
      v118[53] = v107 + v32 - v91 + v15 + v16 + v27;
      v118[54] = v102 + v91 + v14 - (v117 + v16) + v15;
      v118[55] = v91 + v72 + v108 - (v16 + v101) + v15;
      v118[56] = v70 + v16 + v103 - (v15 + v91);
      v118[57] = v116 + v16 + v106 - (v32 + v91 + v15);
      v118[58] = v91 + v72 + v99 - (v15 + v16 + v101);
      v118[59] = v105 + v91 + v14 - (v117 + v15 + v16);
      v118[60] = v97 + v91 - (v15 + v16 + v98);
      v118[61] = v22 + v91 + v100 - (v15 + v16);
      v118[62] = v95 + v27 + v16 + v14 - (v91 + v69 + v15);
      v118[63] = v88 + v16 + v96 - (v41 + v15);
      uint64_t v42 = v4;
      uint64_t v4 = v113;
      uint64_t v43 = (int *)(v68 + 16 * v114);
LABEL_8:
      int v44 = 0;
      unint64_t v45 = v6 >> 1;
      unint64_t v46 = (unsigned int *)(v42 + 4 * (v6 >> 1));
      int v47 = (_DWORD *)((char *)v118 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v49 = *v47++;
        int v48 = v49;
        uint64_t v50 = 4 * v6;
        int v51 = *(_DWORD *)(v113 + 4 * v6);
        int v52 = *(_DWORD *)(v113 + ((4 * v6) | 4));
        BOOL v53 = v51 <= v52;
        if (v51 <= v52) {
          int v51 = *(_DWORD *)(v113 + ((4 * v6) | 4));
        }
        unsigned int v54 = v51 + v48;
        if (__OFADD__(v51, v48)) {
          unsigned int v54 = ((v51 + v48) >> 31) ^ 0x80000000;
        }
        *unint64_t v46 = v54;
        BOOL v55 = __OFSUB__(v51, v48);
        signed int v56 = v51 - v48;
        if (v55) {
          signed int v56 = (v56 >> 31) ^ 0x80000000;
        }
        v46[128] = v56;
        int v57 = (4 * v44) | (2 * v53);
        int v58 = *(_DWORD *)(v113 + (v50 | 8));
        int v59 = *(_DWORD *)(v113 + (v50 | 0xC));
        BOOL v60 = v58 <= v59;
        if (v58 > v59) {
          int v59 = v58;
        }
        int v44 = v57 | v60;
        unsigned int v61 = v59 - v48;
        if (__OFSUB__(v59, v48)) {
          unsigned int v61 = ((v59 - v48) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v42 + ((4 * v45) | 4)) = v61;
        BOOL v55 = __OFADD__(v59, v48);
        signed int v62 = v59 + v48;
        if (v55) {
          signed int v62 = (v62 >> 31) ^ 0x80000000;
        }
        v46[129] = v62;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v43++ = v44;
          BOOL v63 = v6 >= 0xFC;
          v6 += 4;
          if (v63) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v45 += 2;
        v46 += 2;
        BOOL v63 = v6 >= 0xFC;
        v6 += 4;
      }
      while (!v63);
      if (v44) {
        *uint64_t v43 = v44;
      }
LABEL_30:
      a3 += 12;
      uint64_t v5 = v114 + 1;
      uint64_t v3 = v42;
    }
    while (v114 + 1 != v67);
  }
  else
  {
    uint64_t v42 = *((void *)this + 8);
  }
  uint64_t v64 = 0;
  *((void *)this + 8) = v42;
  *((void *)this + 9) = v4;
  return v64;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R13C8(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v105 = *MEMORY[0x263EF8340];
  uint64_t v67 = *((void *)this + 5);
  if (!v67) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v66 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v99 = v3;
      uint64_t v100 = v5;
      unint64_t v6 = 0;
      int v7 = *a3;
      int v8 = a3[1];
      int v9 = v8 + *a3;
      int v10 = a3[2];
      int v11 = a3[3];
      int v13 = a3[10];
      int v12 = a3[11];
      int v14 = a3[12];
      int v16 = a3[6];
      int v15 = a3[7];
      int v18 = a3[8];
      int v17 = a3[9];
      int v103 = v18 + v15 + v16;
      int v85 = *a3 - v8 - v10;
      int v84 = v85 + v11;
      int v19 = a3[4];
      int v20 = a3[5];
      int v71 = a3;
      int v96 = v85 + v11 - v19;
      int v101 = v9 + v10;
      int v21 = v9 + v10 + v11;
      v104[0] = v103 + v17 + v13 + v14 + v12 + v21 + v19 + v20;
      v104[1] = v96 - (v18 + v15) + v17 + v16 + v13 + v14 + v12 + v20;
      int v22 = v9 - v10;
      int v82 = v9 - v10 - v11;
      int v97 = v82 - v19;
      int v81 = v13 + v17 + v18 + v16 + v20;
      int v23 = v7 - v8 + v10;
      int v95 = v23 - v11 + v19;
      int v102 = v16 + v20 + v15;
      v104[2] = v15 + v82 - v19 - v81 + v14 + v12;
      v104[3] = v14 + v12 + v18 + v95 - (v13 + v17 + v102);
      int v24 = v10 - v9;
      int v80 = v10 - v9 - v11;
      int v92 = v15 + v20 + v18;
      int v25 = v13 + v17 + v92;
      int v26 = v8 - v7;
      int v27 = v26 - v10;
      int v77 = v26 - v10 - v11;
      int v94 = v77 - v19;
      int v98 = v18 + v15 - v20;
      v104[4] = v16 + v12 + v80 + v19 - (v25 + v14);
      v104[5] = v98 + v16 + v12 + v77 - v19 - (v13 + v17 + v14);
      int v79 = v11 - (v9 + v10);
      int v28 = v13 + v17 + v20;
      int v29 = v26 + v10;
      int v91 = v12 + v19 + v29 + v11;
      v104[6] = v79 - v19 - (v15 + v16) + v12 + v18 + v28 - v14;
      v104[7] = v91 + v15 + v28 - (v18 + v16 + v14);
      int v89 = v16 + v29 - v11 - v19;
      v104[8] = v98 + v16 + v19 - v21 - (v13 + v17 + v12) + v14;
      v104[9] = v89 - (v12 + v25) + v14;
      int v72 = v24 + v11;
      int v93 = v24 + v11 - v19;
      int v88 = v27 + v11 + v19;
      v104[10] = v28 + v15 + v93 - (v18 + v16 + v12) + v14;
      v104[11] = v28 + v18 + v88 - (v15 + v16 + v12) + v14;
      int v90 = v22 + v11 + v19;
      int v87 = v23 + v11 - v19;
      v104[12] = v16 + v28 + v90 - (v18 + v15 + v14 + v12);
      v104[13] = v103 + v28 + v87 - (v14 + v12);
      int v68 = v85 - v11;
      int v86 = v85 - v11 + v19;
      v104[14] = v18 + v101 - v11 - v19 - (v12 + v14 + v13 + v17 + v102);
      v104[15] = v15 + v86 - (v12 + v14 + v81);
      int v73 = v82 + v19;
      int v30 = v14 + v12 + v13;
      v104[16] = v30 + v23 - v11 - v19 - (v102 + v18 + v17);
      v104[17] = v30 + v18 + v15 + v82 + v19 - (v16 + v20 + v17);
      int v83 = v17 + v18 + v16;
      int v31 = v14 + v12 + v20;
      v104[18] = v83 + v84 + v19 - (v13 + v15) + v31;
      v104[19] = v17 + v15 + v16 + v21 - v19 - (v13 + v18) + v31;
      int v70 = v29 + v11 - v19;
      int v74 = v18 + v15 + v20;
      v104[20] = v70 - v16 + v74 + v12 + v17 - (v14 + v13);
      v104[21] = v79 + v19 + v20 + v12 + v17 - (v13 + v103 + v14);
      int v78 = v77 + v19;
      int v32 = v17 + v15 + v20;
      v104[22] = v78 + v15 + v16 + v12 + v13 - (v20 + v14 + v17 + v18);
      v104[23] = v18 + v16 + v12 + v13 + v80 - v19 - (v32 + v14);
      v104[24] = v27 + v11 - v19 + v20 + v17 - (v12 + v13 + v103) + v14;
      v104[25] = v72 + v19 - v16 + v17 + v74 - (v12 + v13) + v14;
      int v76 = v29 - v11 + v19;
      v104[26] = v16 + v13 + v18 + v76 - (v32 + v12) + v14;
      v104[27] = v15 + v16 - (v17 + v18 + v12) - (v21 + v19 + v20) + v14 + v13;
      int v69 = v101 - v11 + v19;
      v104[28] = v68 - v19 - (v16 + v20) + v18 + v15 + v13 - (v12 + v17 + v14);
      v104[29] = v13 + v69 - (v102 + v18 + v17 + v12 + v14);
      int v75 = v23 + v11 + v19;
      int v33 = v15 + v16 + v20;
      v104[30] = v33 + v17 + v75 - (v12 + v14 + v13 + v18);
      v104[31] = v16 + v20 + v17 + v18 + v22 + v11 - v19 - (v15 + v12 + v13 + v14);
      int v34 = v13 + v17 + v103;
      _DWORD v104[32] = v73 - v34 + v31;
      v104[33] = v23 - v11 - v19 + v18 + v15 - (v16 + v13 + v17) + v31;
      int v35 = v14 + v12 - v20;
      v104[34] = v13 + v17 + v21 - v19 - (v15 + v20) + v18 + v16 + v14 + v12;
      v104[35] = v13 + v17 + v15 + v16 + v84 + v19 - v18 + v35;
      int v36 = v13 + v17 + v12;
      v104[36] = v36 + v18 + v15 + v79 + v19 - (v16 + v20 + v14);
      v104[37] = v70 + v36 - (v102 + v18 + v14);
      v104[38] = v33 + v12 + v80 - v19 - (v17 + v18 + v13 + v14);
      v104[39] = v16 + v20 + v12 + v18 + v78 - (v17 + v15 + v13 + v14);
      v104[40] = v72 + v19 + v13 + v17 - (v102 + v18 + v12) + v14;
      v104[41] = v27 + v11 - v19 - (v16 + v20) + v18 + v15 + v13 + v17 - v12 + v14;
      int v37 = v18 + v16 + v20;
      v104[42] = v37 - (v15 + v17 + v13 + v12) - (v21 + v19) + v14;
      v104[43] = v33 + v76 - (v12 + v17 + v18 + v13) + v14;
      v104[44] = v69 + v74 - (v16 + v14 + v36);
      v104[45] = v68 - v19 + v20 - (v12 + v14 + v34);
      v104[46] = v22 + v11 - v19 + v15 + v16 + v13 + v17 - (v20 + v18 + v14 + v12);
      v104[47] = v75 - (v15 + v20) + v18 + v16 + v13 + v17 - (v14 + v12);
      v104[48] = v103 + v17 + v96 - v13 + v35;
      v104[49] = v17 + v16 + v21 + v19 - (v13 + v92) + v14 + v12;
      int v38 = v14 + v12 + v20;
      int v39 = v17 + v15 + v16;
      v104[50] = v95 - v83 + v13 + v15 + v38;
      v104[51] = v97 - v39 + v13 + v18 + v38;
      int v40 = v18 + v15 + v17;
      v104[52] = v16 + v94 - (v40 + v14) + v12 + v13 + v20;
      v104[53] = v103 + v80 + v19 - (v17 + v14) + v12 + v13 + v20;
      v104[54] = v91 + v17 + v18 - (v102 + v14 + v13);
      v104[55] = v17 + v15 + v12 + v79 - v19 - (v13 + v37 + v14);
      v104[56] = v14 + v13 + v74 + v89 - (v12 + v17);
      v104[57] = v16 + v20 + v19 - v21 - (v40 + v12) + v14 + v13;
      v104[58] = v17 + v15 + v88 - (v12 + v13 + v37) + v14;
      v104[59] = v93 + v17 + v18 - (v102 + v12 + v13) + v14;
      v104[60] = v17 + v16 + v87 - (v12 + v14 + v13 + v92);
      v104[61] = v17 + v16 + v98 + v90 - (v12 + v13 + v14);
      v104[62] = v86 + v20 + v13 + v18 - (v39 + v12 + v14);
      v104[63] = v15 + v20 + v13 + v101 - v11 - v19 - (v83 + v12 + v14);
      uint64_t v41 = v4;
      uint64_t v4 = v99;
      uint64_t v42 = (int *)(v67 + 16 * v100);
LABEL_8:
      int v43 = 0;
      unint64_t v44 = v6 >> 1;
      unint64_t v45 = (unsigned int *)(v41 + 4 * (v6 >> 1));
      unint64_t v46 = (_DWORD *)((char *)v104 + (v6 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v48 = *v46++;
        int v47 = v48;
        uint64_t v49 = 4 * v6;
        int v50 = *(_DWORD *)(v99 + 4 * v6);
        int v51 = *(_DWORD *)(v99 + ((4 * v6) | 4));
        BOOL v52 = v50 <= v51;
        if (v50 <= v51) {
          int v50 = *(_DWORD *)(v99 + ((4 * v6) | 4));
        }
        unsigned int v53 = v50 + v47;
        if (__OFADD__(v50, v47)) {
          unsigned int v53 = ((v50 + v47) >> 31) ^ 0x80000000;
        }
        *unint64_t v45 = v53;
        BOOL v54 = __OFSUB__(v50, v47);
        signed int v55 = v50 - v47;
        if (v54) {
          signed int v55 = (v55 >> 31) ^ 0x80000000;
        }
        v45[128] = v55;
        int v56 = (4 * v43) | (2 * v52);
        int v57 = *(_DWORD *)(v99 + (v49 | 8));
        int v58 = *(_DWORD *)(v99 + (v49 | 0xC));
        BOOL v59 = v57 <= v58;
        if (v57 > v58) {
          int v58 = v57;
        }
        int v43 = v56 | v59;
        unsigned int v60 = v58 - v47;
        if (__OFSUB__(v58, v47)) {
          unsigned int v60 = ((v58 - v47) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v41 + ((4 * v44) | 4)) = v60;
        BOOL v54 = __OFADD__(v58, v47);
        signed int v61 = v58 + v47;
        if (v54) {
          signed int v61 = (v61 >> 31) ^ 0x80000000;
        }
        v45[129] = v61;
        if ((~(_BYTE)v6 & 0x3C) == 0)
        {
          *v42++ = v43;
          BOOL v62 = v6 >= 0xFC;
          v6 += 4;
          if (v62) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v44 += 2;
        v45 += 2;
        BOOL v62 = v6 >= 0xFC;
        v6 += 4;
      }
      while (!v62);
      if (v43) {
        *uint64_t v42 = v43;
      }
LABEL_30:
      a3 = v71 + 13;
      uint64_t v5 = v100 + 1;
      uint64_t v3 = v41;
    }
    while (v100 + 1 != v66);
  }
  else
  {
    uint64_t v41 = *((void *)this + 8);
  }
  uint64_t v63 = 0;
  *((void *)this + 8) = v41;
  *((void *)this + 9) = v4;
  return v63;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R6C9(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v157 = *MEMORY[0x263EF8340];
  uint64_t v59 = *((void *)this + 5);
  if (!v59) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v5 = *((unsigned __int16 *)this + 9);
  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v146 = 0u;
  uint64_t v58 = v5;
  if (v5)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v61 = v6;
      unint64_t v7 = 0;
      int v8 = a3[1];
      int v10 = a3[2];
      int v9 = a3[3];
      int v12 = a3[4];
      int v11 = a3[5];
      int v13 = v8 + *a3;
      int v14 = v13 + v10 + v9;
      int v15 = v8 - *a3;
      int v16 = v15 - v10 - v9;
      int v17 = *a3 - v8;
      int v18 = v17 - v10 - v9;
      int v60 = v15 - v10 + v9;
      int v78 = v16 - (v11 + v12);
      int v79 = v18 + v12 - v11;
      int v19 = v17 - v10 + v9;
      int v80 = v11 + v12 + v60;
      int v81 = v19 - v12 + v11;
      int v20 = v10 - v13 + v9;
      int v100 = v80;
      int v101 = v81;
      *(void *)&long long v146 = __PAIR64__(v80, v81);
      int v21 = v13 + v10 - v9;
      int v22 = v10 - v13 - v9;
      *(void *)&long long v149 = __PAIR64__(v80, v81);
      int v23 = v9 - (v13 + v10);
      int v24 = v13 - v10;
      int v25 = v13 - v10 + v9;
      int v98 = v78;
      int v99 = v79;
      int v26 = v24 - v9;
      *((void *)&v146 + 1) = __PAIR64__(v78, v79);
      int v27 = v17 + v10;
      int v28 = v15 + v10;
      int v29 = v27 - v9;
      *((void *)&v149 + 1) = __PAIR64__(v78, v79);
      int v30 = v28 - v9;
      int v31 = v27 + v9;
      int v32 = v28 + v9;
      int v84 = v31 - v12 + v11;
      unsigned int v85 = v11 + v12 + v32;
      int v96 = v84;
      unsigned int v97 = v85;
      unsigned int v142 = v85;
      *(void *)&long long v150 = __PAIR64__(v84, v85);
      int v143 = v84;
      unsigned int v83 = v30 - (v11 + v12);
      int v94 = v29 + v12 - v11;
      unsigned int v95 = v83;
      unsigned int v144 = v83;
      *((void *)&v150 + 1) = __PAIR64__(v94, v83);
      int v82 = v94;
      int v145 = v94;
      int v88 = v11 + v12 + v21;
      int v89 = v22 - v12 + v11;
      int v108 = v88;
      int v109 = v89;
      *(void *)&long long v148 = __PAIR64__(v88, v89);
      *(void *)&long long v151 = __PAIR64__(v88, v89);
      int v86 = v14 - (v11 + v12);
      int v87 = v20 + v12 - v11;
      int v106 = v86;
      int v107 = v87;
      *((void *)&v148 + 1) = __PAIR64__(v86, v87);
      *((void *)&v151 + 1) = __PAIR64__(v86, v87);
      int v92 = v11 - (v14 + v12);
      unsigned int v93 = v11 + v12 + v26;
      int v104 = v92;
      unsigned int v105 = v93;
      *(void *)&long long v147 = __PAIR64__(v92, v93);
      *(void *)&long long v152 = __PAIR64__(v92, v93);
      int v90 = v23 + v12 - v11;
      int v91 = v25 - (v11 + v12);
      int v102 = v90;
      int v103 = v91;
      *((void *)&v147 + 1) = __PAIR64__(v90, v91);
      *((void *)&v152 + 1) = __PAIR64__(v90, v91);
      int v64 = v21 - (v11 + v12);
      int v65 = v22 + v12 - v11;
      int v117 = v65;
      int v130 = v65;
      *(void *)&long long v153 = __PAIR64__(v64, v65);
      int v116 = v64;
      int v131 = v64;
      int v62 = v14 + v12 + v11;
      int v63 = v20 - v12 + v11;
      int v115 = v63;
      int v132 = v63;
      *((void *)&v153 + 1) = __PAIR64__(v62, v63);
      unsigned int v113 = v26 - (v11 + v12);
      int v114 = v62;
      int v133 = v62;
      int v68 = v12 - v11 - v14;
      unsigned int v69 = v113;
      unsigned int v126 = v113;
      *(void *)&long long v154 = __PAIR64__(v68, v113);
      int v111 = v11 + v12 + v25;
      int v112 = v68;
      int v127 = v68;
      int v66 = v23 - v12 + v11;
      int v67 = v111;
      int v128 = v111;
      *((void *)&v154 + 1) = __PAIR64__(v66, v111);
      int v110 = v66;
      int v129 = v66;
      int v72 = v60 - (v11 + v12);
      int v73 = v19 + v12 - v11;
      int v125 = v73;
      int v138 = v73;
      *(void *)&long long v155 = __PAIR64__(v72, v73);
      int v124 = v72;
      int v139 = v72;
      int v70 = v11 + v12 + v16;
      int v71 = v18 - v12 + v11;
      int v123 = v71;
      int v140 = v71;
      *((void *)&v155 + 1) = __PAIR64__(v70, v71);
      int v122 = v70;
      int v141 = v70;
      int v76 = v31 + v12 - v11;
      unsigned int v77 = v32 - (v11 + v12);
      unsigned int v121 = v77;
      unsigned int v134 = v77;
      *(void *)&long long v156 = __PAIR64__(v76, v77);
      int v120 = v76;
      int v135 = v76;
      int v74 = v29 - v12 + v11;
      unsigned int v75 = v11 + v12 + v30;
      unsigned int v119 = v75;
      unsigned int v136 = v75;
      *((void *)&v156 + 1) = __PAIR64__(v74, v75);
      int v118 = v74;
      uint64_t v33 = v4;
      uint64_t v4 = v3;
      int v137 = v74;
      int v34 = (int *)(v59 + 32 * v61);
LABEL_8:
      int v35 = 0;
      unint64_t v36 = v7 >> 1;
      int v37 = (unsigned int *)(v33 + 4 * (v7 >> 1));
      int v38 = (int *)((char *)&v62 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v40 = *v38++;
        int v39 = v40;
        uint64_t v41 = 4 * v7;
        int v42 = *(_DWORD *)(v4 + 4 * v7);
        int v43 = *(_DWORD *)(v4 + ((4 * v7) | 4));
        BOOL v44 = v42 <= v43;
        if (v42 <= v43) {
          int v42 = *(_DWORD *)(v4 + ((4 * v7) | 4));
        }
        unsigned int v45 = v42 + v39;
        if (__OFADD__(v42, v39)) {
          unsigned int v45 = ((v42 + v39) >> 31) ^ 0x80000000;
        }
        *int v37 = v45;
        BOOL v46 = __OFSUB__(v42, v39);
        signed int v47 = v42 - v39;
        if (v46) {
          signed int v47 = (v47 >> 31) ^ 0x80000000;
        }
        v37[256] = v47;
        int v48 = (4 * v35) | (2 * v44);
        int v49 = *(_DWORD *)(v4 + (v41 | 8));
        int v50 = *(_DWORD *)(v4 + (v41 | 0xC));
        BOOL v51 = v49 <= v50;
        if (v49 > v50) {
          int v50 = v49;
        }
        int v35 = v48 | v51;
        unsigned int v52 = v50 - v39;
        if (__OFSUB__(v50, v39)) {
          unsigned int v52 = ((v50 - v39) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v33 + ((4 * v36) | 4)) = v52;
        BOOL v46 = __OFADD__(v50, v39);
        signed int v53 = v50 + v39;
        if (v46) {
          signed int v53 = (v53 >> 31) ^ 0x80000000;
        }
        v37[257] = v53;
        if ((~(_BYTE)v7 & 0x3C) == 0)
        {
          *v34++ = v35;
          BOOL v54 = v7 >= 0x1FC;
          v7 += 4;
          if (v54) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v36 += 2;
        v37 += 2;
        BOOL v54 = v7 >= 0x1FC;
        v7 += 4;
      }
      while (!v54);
      if (v35) {
        int *v34 = v35;
      }
LABEL_30:
      a3 += 6;
      uint64_t v6 = v61 + 1;
      uint64_t v3 = v33;
    }
    while (v61 + 1 != v58);
  }
  else
  {
    uint64_t v33 = v3;
  }
  uint64_t v55 = 0;
  *((void *)this + 8) = v33;
  *((void *)this + 9) = v4;
  return v55;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R7C9(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v193 = *MEMORY[0x263EF8340];
  uint64_t v85 = *((void *)this + 5);
  if (!v85) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v5 = *((unsigned __int16 *)this + 9);
  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v182 = 0u;
  uint64_t v84 = v5;
  if (v5)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v102 = v3;
      uint64_t v104 = v6;
      unsigned int v105 = a3;
      unint64_t v7 = 0;
      int v8 = *a3;
      int v9 = a3[1];
      int v11 = a3[2];
      int v10 = a3[3];
      int v12 = a3[4];
      int v13 = a3[5];
      int v14 = a3[6];
      int v15 = v9 + *a3;
      int v16 = v13 + v12;
      int v17 = v10 - (v15 + v11);
      int v103 = v15 - v11 + v10;
      int v99 = v13 + v12 + v103;
      int v100 = v17 - v12 + v13;
      int v101 = v12 - v13 - (v15 + v11 + v10);
      int v146 = v100 + v14;
      int v147 = v99 - v14;
      int v94 = v15 + v11 - v10;
      int v95 = v15 - v11 - v10;
      int v98 = v95 - (v13 + v12);
      int v148 = v101 + v14;
      int v149 = v98 - v14;
      int v18 = v11 - v15 - v10;
      int v96 = v18 + v12 - v13;
      int v97 = v94 - (v13 + v12);
      int v152 = v97 - v14;
      int v153 = v96 + v14;
      int v162 = v98 - v14;
      int v19 = v15 + v11 + v10;
      int v20 = v19 + v12;
      int v21 = v19 + v12 + v13;
      int v163 = v101 + v14;
      int v22 = v11 - v15 + v10;
      int v164 = v99 - v14;
      int v23 = v22 - v12 + v13;
      int v24 = v9 - v8;
      int v165 = v100 + v14;
      int v25 = v9 - v8 - v11;
      int v26 = v8 - v9;
      int v166 = v96 + v14;
      int v27 = v26 - v11;
      int v28 = v26 + v11;
      int v167 = v97 - v14;
      int v29 = v24 + v11;
      int v30 = v24 + v11 + v10;
      int v150 = v21 - v14;
      int v151 = v23 + v14;
      int v168 = v23 + v14;
      int v93 = v30 - (v13 + v12);
      int v169 = v21 - v14;
      int v157 = v93 - v14;
      int v170 = v93 - v14;
      int v31 = v25 - v10;
      int v32 = v25 + v10;
      int v33 = v27 - v10;
      int v34 = v27 + v10;
      int v35 = v29 - v10;
      int v36 = v28 - v10;
      int v37 = v28 + v10;
      int v92 = v37 + v12 - v13;
      int v156 = v92 + v14;
      int v171 = v92 + v14;
      int v91 = v13 + v12 + v35;
      int v155 = v91 - v14;
      int v172 = v91 - v14;
      int v90 = v36 - v12 + v13;
      int v154 = v90 + v14;
      int v173 = v90 + v14;
      int v89 = v34 + v12 - v13;
      int v161 = v89 + v14;
      int v174 = v89 + v14;
      int v88 = v32 - (v13 + v12);
      int v160 = v88 - v14;
      int v175 = v88 - v14;
      int v38 = v33 - v12;
      int v39 = v33 + v12;
      int v40 = v34 - v12;
      int v41 = v36 + v12;
      int v42 = v37 - v12;
      int v43 = v22 + v12;
      int v44 = v18 - v12;
      int v45 = v17 + v12;
      int v159 = v38 + v13 + v14;
      int v176 = v159;
      int v46 = v16 + v31;
      int v158 = v16 + v31 - v14;
      int v177 = v158;
      int v87 = v16 + v30;
      int v133 = v16 + v30 + v14;
      int v178 = v133;
      int v86 = v42 + v13;
      int v132 = v42 + v13 - v14;
      int v179 = v132;
      int v47 = v39 - v13;
      int v48 = v40 + v13;
      int v49 = v41 - v13;
      int v50 = v43 - v13;
      int v51 = v13 - v20;
      int v52 = v35 - v16;
      int v131 = v35 - v16 + v14;
      int v180 = v131;
      int v130 = v41 - v13 - v14;
      int v181 = v130;
      int v53 = v31 - v16;
      int v54 = v16 + v32;
      int v55 = v19 - v16;
      int v56 = v16 + v94;
      int v57 = v103 - v16;
      int v58 = v16 + v95;
      int v137 = v48 - v14;
      LODWORD(v182) = v48 - v14;
      int v136 = v54 + v14;
      DWORD1(v182) = v54 + v14;
      int v135 = v47 - v14;
      DWORD2(v182) = v47 - v14;
      int v134 = v53 + v14;
      HIDWORD(v182) = v53 + v14;
      int v141 = v58 + v14;
      LODWORD(v183) = v58 + v14;
      int v140 = v51 - v14;
      DWORD1(v183) = v51 - v14;
      int v139 = v57 + v14;
      DWORD2(v183) = v57 + v14;
      int v138 = v45 - v13 - v14;
      HIDWORD(v183) = v138;
      int v145 = v44 + v13 - v14;
      LODWORD(v184) = v145;
      int v144 = v56 + v14;
      DWORD1(v184) = v56 + v14;
      int v143 = v50 - v14;
      DWORD2(v184) = v50 - v14;
      int v142 = v55 + v14;
      HIDWORD(v184) = v55 + v14;
      int v116 = v54 - v14;
      int v117 = v48 + v14;
      LODWORD(v185) = v48 + v14;
      DWORD1(v185) = v54 - v14;
      int v114 = v53 - v14;
      int v115 = v47 + v14;
      DWORD2(v185) = v47 + v14;
      HIDWORD(v185) = v53 - v14;
      int v120 = v86 + v14;
      int v121 = v87 - v14;
      LODWORD(v186) = v87 - v14;
      DWORD1(v186) = v86 + v14;
      int v118 = v49 + v14;
      int v119 = v52 - v14;
      DWORD2(v186) = v52 - v14;
      HIDWORD(v186) = v49 + v14;
      int v124 = v56 - v14;
      int v125 = v44 + v13 + v14;
      LODWORD(v187) = v125;
      DWORD1(v187) = v56 - v14;
      int v122 = v55 - v14;
      int v123 = v50 + v14;
      DWORD2(v187) = v50 + v14;
      HIDWORD(v187) = v55 - v14;
      int v128 = v51 + v14;
      int v129 = v58 - v14;
      LODWORD(v188) = v58 - v14;
      DWORD1(v188) = v51 + v14;
      int v126 = v45 - v13 + v14;
      int v127 = v57 - v14;
      DWORD2(v188) = v57 - v14;
      HIDWORD(v188) = v126;
      v106[2] = v97 + v14;
      v106[3] = v96 - v14;
      LODWORD(v189) = v96 - v14;
      DWORD1(v189) = v97 + v14;
      v106[0] = v21 + v14;
      v106[1] = v23 - v14;
      DWORD2(v189) = v23 - v14;
      HIDWORD(v189) = v21 + v14;
      v106[6] = v101 - v14;
      v106[7] = v98 + v14;
      LODWORD(v190) = v98 + v14;
      DWORD1(v190) = v101 - v14;
      DWORD2(v190) = v99 + v14;
      v106[4] = v100 - v14;
      v106[5] = v99 + v14;
      HIDWORD(v190) = v100 - v14;
      int v108 = v88 + v14;
      int v109 = v89 - v14;
      LODWORD(v191) = v89 - v14;
      DWORD1(v191) = v88 + v14;
      int v107 = v38 + v13 - v14;
      DWORD2(v191) = v107;
      v106[8] = v46 + v14;
      HIDWORD(v191) = v46 + v14;
      int v113 = v93 + v14;
      LODWORD(v192) = v93 + v14;
      int v112 = v92 - v14;
      DWORD1(v192) = v92 - v14;
      int v111 = v91 + v14;
      DWORD2(v192) = v91 + v14;
      int v110 = v90 - v14;
      uint64_t v59 = v4;
      uint64_t v4 = v102;
      HIDWORD(v192) = v110;
      int v60 = (int *)(v85 + 32 * v104);
LABEL_8:
      int v61 = 0;
      unint64_t v62 = v7 >> 1;
      int v63 = (unsigned int *)(v59 + 4 * (v7 >> 1));
      int v64 = (_DWORD *)((char *)v106 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v66 = *v64++;
        int v65 = v66;
        uint64_t v67 = 4 * v7;
        int v68 = *(_DWORD *)(v102 + 4 * v7);
        int v69 = *(_DWORD *)(v102 + ((4 * v7) | 4));
        BOOL v70 = v68 <= v69;
        if (v68 <= v69) {
          int v68 = *(_DWORD *)(v102 + ((4 * v7) | 4));
        }
        unsigned int v71 = v68 + v65;
        if (__OFADD__(v68, v65)) {
          unsigned int v71 = ((v68 + v65) >> 31) ^ 0x80000000;
        }
        *int v63 = v71;
        BOOL v72 = __OFSUB__(v68, v65);
        signed int v73 = v68 - v65;
        if (v72) {
          signed int v73 = (v73 >> 31) ^ 0x80000000;
        }
        v63[256] = v73;
        int v74 = (4 * v61) | (2 * v70);
        int v75 = *(_DWORD *)(v102 + (v67 | 8));
        int v76 = *(_DWORD *)(v102 + (v67 | 0xC));
        BOOL v77 = v75 <= v76;
        if (v75 > v76) {
          int v76 = v75;
        }
        int v61 = v74 | v77;
        unsigned int v78 = v76 - v65;
        if (__OFSUB__(v76, v65)) {
          unsigned int v78 = ((v76 - v65) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v59 + ((4 * v62) | 4)) = v78;
        BOOL v72 = __OFADD__(v76, v65);
        signed int v79 = v76 + v65;
        if (v72) {
          signed int v79 = (v79 >> 31) ^ 0x80000000;
        }
        v63[257] = v79;
        if ((~(_BYTE)v7 & 0x3C) == 0)
        {
          *v60++ = v61;
          BOOL v80 = v7 >= 0x1FC;
          v7 += 4;
          if (v80) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v62 += 2;
        v63 += 2;
        BOOL v80 = v7 >= 0x1FC;
        v7 += 4;
      }
      while (!v80);
      if (v61) {
        *int v60 = v61;
      }
LABEL_30:
      a3 = v105 + 7;
      uint64_t v6 = v104 + 1;
      uint64_t v3 = v59;
    }
    while (v104 + 1 != v84);
  }
  else
  {
    uint64_t v59 = v3;
  }
  uint64_t v81 = 0;
  *((void *)this + 8) = v59;
  *((void *)this + 9) = v4;
  return v81;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R8C9(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  uint64_t v82 = *((void *)this + 5);
  if (!v82) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v5 = *((unsigned __int16 *)this + 9);
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v104 = 0u;
  uint64_t v81 = v5;
  if (v5)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v100 = v3;
      uint64_t v101 = v6;
      unint64_t v7 = 0;
      int v8 = *a3;
      int v9 = a3[1];
      int v10 = v9 + *a3;
      int v12 = a3[2];
      int v11 = a3[3];
      int v13 = a3[4];
      int v14 = a3[5];
      int v15 = v10 + v12 + v11;
      int v16 = v15 + v13 + v14;
      int v18 = a3[6];
      int v17 = a3[7];
      uint64_t v102 = a3;
      int v19 = v12 - v10 + v11;
      int v99 = v19 - v13 + v14;
      int v20 = v10 + v12 - v11;
      v103[0] = v16 + v18 + v17;
      v103[1] = v99 - v18 - v17;
      int v21 = v14 + v13;
      int v98 = v20 - (v14 + v13);
      int v22 = v12 - v10 - v11;
      int v97 = v22 + v13 - v14;
      v103[2] = v98 + v18 - v17;
      v103[3] = v97 - v18 + v17;
      int v23 = v11 - (v10 + v12);
      int v92 = v23 - v13 + v14;
      int v24 = v10 - v12;
      int v25 = v24 + v11;
      int v89 = v14 + v13 + v24 + v11;
      v103[4] = v92 - v18 - v17;
      v103[5] = v89 + v18 + v17;
      int v87 = v13 - v14 - v15;
      int v26 = v24 - v11;
      int v88 = v24 - v11 - (v14 + v13);
      v103[6] = v87 - v18 + v17;
      v103[7] = v88 + v18 - v17;
      int v27 = v9 - v8;
      int v28 = v8 - v9;
      int v29 = v28 - v12 - v11;
      int v30 = v27 - v12 - v11;
      int v94 = v14 + v13 + v30;
      int v95 = v29 - v13 + v14;
      v103[8] = v94 + v18 + v17;
      v103[9] = v95 - v18 - v17;
      int v31 = v27 - v12 + v11;
      int v32 = v28 - v12 + v11;
      int v93 = v32 + v13 - v14;
      int v91 = v31 - (v14 + v13);
      v103[10] = v91 + v18 - v17;
      v103[11] = v93 - v18 + v17;
      int v33 = v28 + v12;
      int v34 = v27 + v12;
      int v35 = v33 - v11;
      int v85 = v33 - v11 - v13 + v14;
      int v36 = v34 - v11;
      int v86 = v14 + v13 + v34 - v11;
      v103[12] = v85 - v18 - v17;
      v103[13] = v86 + v18 + v17;
      int v37 = v33 + v11;
      int v38 = v34 + v11;
      int v83 = v37 + v13 - v14;
      int v84 = v38 - (v14 + v13);
      v103[14] = v83 - v18 + v17;
      v103[15] = v84 + v18 - v17;
      int v39 = v30 - (v14 + v13);
      int v40 = v29 + v13 - v14;
      v103[16] = v39 - v18 + v17;
      v103[17] = v40 + v18 - v17;
      int v41 = v14 + v13 + v31;
      int v42 = v32 - v13 + v14;
      v103[18] = v41 - v18 - v17;
      v103[19] = v42 + v18 + v17;
      int v43 = v35 + v13 - v14;
      int v44 = v36 - (v14 + v13);
      v103[20] = v43 + v18 - v17;
      v103[21] = v44 - v18 + v17;
      int v45 = v37 - v13 + v14;
      int v46 = v14 + v13 + v38;
      v103[22] = v45 + v18 + v17;
      v103[23] = v46 - v18 - v17;
      int v47 = v15 - (v14 + v13);
      int v48 = v19 + v13 - v14;
      int v96 = v48 + v18;
      v103[24] = v47 - v18 + v17;
      v103[25] = v48 + v18 - v17;
      int v49 = v14 + v13 + v20;
      int v50 = v22 - v13 + v14;
      v103[26] = v49 - v18 - v17;
      v103[27] = v50 + v18 + v17;
      int v51 = v23 + v13 - v14;
      int v52 = v25 - (v14 + v13);
      v103[28] = v51 + v18 - v17;
      v103[29] = v52 - v18 + v17;
      int v53 = v14 - (v15 + v13);
      int v90 = v21 + v26 - v18;
      v103[30] = v53 + v18 + v17;
      v103[31] = v90 - v17;
      v103[32] = v43 - v18 - v17;
      v103[33] = v44 + v18 + v17;
      v103[34] = v45 - v18 + v17;
      v103[35] = v46 + v18 - v17;
      v103[36] = v39 + v18 + v17;
      v103[37] = v40 - v18 - v17;
      v103[38] = v41 + v18 - v17;
      v103[39] = v42 - v18 + v17;
      v103[40] = v51 - v18 - v17;
      v103[41] = v52 + v18 + v17;
      int v54 = v21 + v26 + v18;
      v103[42] = v53 - v18 + v17;
      v103[43] = v54 - v17;
      int v55 = v48 - v18;
      v103[44] = v47 + v18 + v17;
      v103[45] = v55 - v17;
      v103[46] = v49 + v18 - v17;
      v103[47] = v50 - v18 + v17;
      v103[48] = v92 + v18 - v17;
      v103[49] = v89 - v18 + v17;
      v103[50] = v87 + v18 + v17;
      v103[51] = v88 - v18 - v17;
      v103[52] = v16 - v18 + v17;
      v103[53] = v99 + v18 - v17;
      v103[54] = v98 - v18 - v17;
      v103[55] = v97 + v18 + v17;
      v103[56] = v85 + v18 - v17;
      v103[57] = v86 - v18 + v17;
      v103[58] = v83 + v18 + v17;
      v103[59] = v84 - v18 - v17;
      v103[60] = v94 - v18 + v17;
      v103[61] = v95 + v18 - v17;
      v103[62] = v91 - v18 - v17;
      v103[63] = v93 + v18 + v17;
      v103[64] = v88 - v18 + v17;
      v103[65] = v87 + v18 - v17;
      v103[66] = v89 - v18 - v17;
      v103[67] = v92 + v18 + v17;
      v103[68] = v97 + v18 - v17;
      v103[69] = v98 - v18 + v17;
      v103[70] = v99 + v18 + v17;
      v103[71] = v16 - v18 - v17;
      v103[72] = v84 - v18 + v17;
      v103[73] = v83 + v18 - v17;
      v103[74] = v86 - v18 - v17;
      v103[75] = v85 + v18 + v17;
      v103[76] = v93 + v18 - v17;
      v103[77] = v91 - v18 + v17;
      v103[78] = v95 + v18 + v17;
      v103[79] = v94 - v18 - v17;
      v103[80] = v46 + v18 + v17;
      v103[81] = v45 - v18 - v17;
      v103[82] = v44 + v18 - v17;
      v103[83] = v43 - v18 + v17;
      LODWORD(v104) = v42 - v18 - v17;
      DWORD1(v104) = v41 + v18 + v17;
      DWORD2(v104) = v40 - v18 + v17;
      HIDWORD(v104) = v39 + v18 - v17;
      LODWORD(v105) = v54 + v17;
      DWORD1(v105) = v53 - v18 - v17;
      DWORD2(v105) = v52 + v18 - v17;
      HIDWORD(v105) = v51 - v18 + v17;
      LODWORD(v106) = v50 - v18 - v17;
      DWORD1(v106) = v49 + v18 + v17;
      DWORD2(v106) = v55 + v17;
      HIDWORD(v106) = v47 + v18 - v17;
      LODWORD(v107) = v42 + v18 - v17;
      DWORD1(v107) = v41 - v18 + v17;
      DWORD2(v107) = v40 + v18 + v17;
      HIDWORD(v107) = v39 - v18 - v17;
      LODWORD(v108) = v46 - v18 + v17;
      DWORD1(v108) = v45 + v18 - v17;
      DWORD2(v108) = v44 - v18 - v17;
      HIDWORD(v108) = v43 + v18 + v17;
      LODWORD(v109) = v50 + v18 - v17;
      DWORD1(v109) = v49 - v18 + v17;
      DWORD2(v109) = v96 + v17;
      HIDWORD(v109) = v47 - v18 - v17;
      LODWORD(v110) = v90 + v17;
      DWORD1(v110) = v53 + v18 - v17;
      DWORD2(v110) = v52 - v18 - v17;
      HIDWORD(v110) = v51 + v18 + v17;
      LODWORD(v111) = v97 - v18 - v17;
      DWORD1(v111) = v98 + v18 + v17;
      DWORD2(v111) = v99 - v18 + v17;
      HIDWORD(v111) = v16 + v18 - v17;
      LODWORD(v112) = v88 + v18 + v17;
      DWORD1(v112) = v87 - v18 - v17;
      DWORD2(v112) = v89 + v18 - v17;
      HIDWORD(v112) = v92 - v18 + v17;
      LODWORD(v113) = v93 - v18 - v17;
      DWORD1(v113) = v91 + v18 + v17;
      DWORD2(v113) = v95 - v18 + v17;
      HIDWORD(v113) = v94 + v18 - v17;
      LODWORD(v114) = v84 + v18 + v17;
      DWORD1(v114) = v83 - v18 - v17;
      DWORD2(v114) = v86 + v18 - v17;
      uint64_t v56 = v4;
      uint64_t v4 = v100;
      HIDWORD(v114) = v85 - v18 + v17;
      int v57 = (int *)(v82 + 32 * v101);
LABEL_8:
      int v58 = 0;
      unint64_t v59 = v7 >> 1;
      int v60 = (unsigned int *)(v56 + 4 * (v7 >> 1));
      int v61 = (_DWORD *)((char *)v103 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v63 = *v61++;
        int v62 = v63;
        uint64_t v64 = 4 * v7;
        int v65 = *(_DWORD *)(v100 + 4 * v7);
        int v66 = *(_DWORD *)(v100 + ((4 * v7) | 4));
        BOOL v67 = v65 <= v66;
        if (v65 <= v66) {
          int v65 = *(_DWORD *)(v100 + ((4 * v7) | 4));
        }
        unsigned int v68 = v65 + v62;
        if (__OFADD__(v65, v62)) {
          unsigned int v68 = ((v65 + v62) >> 31) ^ 0x80000000;
        }
        *int v60 = v68;
        BOOL v69 = __OFSUB__(v65, v62);
        signed int v70 = v65 - v62;
        if (v69) {
          signed int v70 = (v70 >> 31) ^ 0x80000000;
        }
        v60[256] = v70;
        int v71 = (4 * v58) | (2 * v67);
        int v72 = *(_DWORD *)(v100 + (v64 | 8));
        int v73 = *(_DWORD *)(v100 + (v64 | 0xC));
        BOOL v74 = v72 <= v73;
        if (v72 > v73) {
          int v73 = v72;
        }
        int v58 = v71 | v74;
        unsigned int v75 = v73 - v62;
        if (__OFSUB__(v73, v62)) {
          unsigned int v75 = ((v73 - v62) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v56 + ((4 * v59) | 4)) = v75;
        BOOL v69 = __OFADD__(v73, v62);
        signed int v76 = v73 + v62;
        if (v69) {
          signed int v76 = (v76 >> 31) ^ 0x80000000;
        }
        v60[257] = v76;
        if ((~(_BYTE)v7 & 0x3C) == 0)
        {
          *v57++ = v58;
          BOOL v77 = v7 >= 0x1FC;
          v7 += 4;
          if (v77) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v59 += 2;
        v60 += 2;
        BOOL v77 = v7 >= 0x1FC;
        v7 += 4;
      }
      while (!v77);
      if (v58) {
        *int v57 = v58;
      }
LABEL_30:
      a3 = v102 + 8;
      uint64_t v6 = v101 + 1;
      uint64_t v3 = v56;
    }
    while (v101 + 1 != v81);
  }
  else
  {
    uint64_t v56 = v3;
  }
  uint64_t v78 = 0;
  *((void *)this + 8) = v56;
  *((void *)this + 9) = v4;
  return v78;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R9C9(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  uint64_t v81 = *((void *)this + 5);
  if (!v81) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v5 = *((unsigned __int16 *)this + 9);
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v103 = 0u;
  uint64_t v80 = v5;
  if (v5)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v99 = v3;
      uint64_t v100 = v6;
      unint64_t v7 = 0;
      int v9 = *a3;
      int v8 = a3[1];
      int v10 = v8 + *a3;
      int v12 = a3[2];
      int v11 = a3[3];
      int v13 = v10 + v12 + v11;
      int v14 = a3[4];
      int v15 = a3[5];
      int v93 = v13 + v14;
      int v98 = v13 + v14 + v15;
      int v17 = a3[6];
      int v16 = a3[7];
      uint64_t v101 = a3;
      int v18 = a3[8];
      int v19 = v12 - v10 + v11;
      int v97 = v19 - v14 + v15;
      int v20 = v10 + v12 - v11;
      int v96 = v20 - (v15 + v14);
      int v21 = v12 - v10 - v11;
      v102[0] = v18 + v16 + v98 + v17;
      v102[1] = v97 - v17 - (v18 + v16);
      int v95 = v21 + v14 - v15;
      int v22 = v11 - (v10 + v12);
      v102[2] = v96 + v17 - (v18 + v16);
      v102[3] = v18 + v16 + v95 - v17;
      int v88 = v22 - v14 + v15;
      int v23 = v10 - v12;
      int v24 = v23 + v11;
      int v87 = v15 + v14 + v23 + v11;
      v102[4] = v88 - v17 - (v18 + v16);
      v102[5] = v18 + v16 + v87 + v17;
      int v85 = v14 - v15 - v13;
      int v25 = v23 - v11;
      int v86 = v25 - (v15 + v14);
      v102[6] = v18 + v16 + v85 - v17;
      v102[7] = v86 + v17 - (v18 + v16);
      int v26 = v8 - v9;
      int v27 = v9 - v8;
      int v28 = v26 - v12 - v11;
      int v91 = v15 + v14 + v28;
      int v29 = v27 - v12 - v11;
      int v92 = v29 - v14 + v15;
      v102[8] = v91 + v17 + v16 - v18;
      v102[9] = v92 - v17 - v16 + v18;
      int v30 = v26 - v12 + v11;
      int v90 = v30 - (v15 + v14);
      int v31 = v27 - v12 + v11;
      int v89 = v31 + v14 - v15;
      v102[10] = v90 + v17 - v16 + v18;
      v102[11] = v89 - v17 + v16 - v18;
      int v32 = v27 + v12;
      int v33 = v26 + v12;
      int v34 = v32 - v11;
      int v84 = v32 - v11 - v14 + v15;
      int v35 = v33 - v11;
      int v36 = v15 + v14 + v33 - v11;
      v102[12] = v84 - v17 - v16 + v18;
      v102[13] = v36 + v17 + v16 - v18;
      int v37 = v32 + v11;
      int v38 = v33 + v11;
      int v82 = v37 + v14 - v15;
      int v83 = v33 + v11 - (v15 + v14);
      v102[14] = v82 - v17 + v16 - v18;
      v102[15] = v83 + v17 - v16 + v18;
      int v39 = v28 - (v15 + v14);
      int v40 = v29 + v14 - v15;
      v102[16] = v18 + v16 + v39 - v17;
      v102[17] = v40 + v17 - (v18 + v16);
      int v41 = v15 + v14 + v30;
      int v42 = v31 - v14 + v15;
      v102[18] = v41 - v17 - (v18 + v16);
      v102[19] = v18 + v16 + v42 + v17;
      int v43 = v34 + v14 - v15;
      int v44 = v35 - (v15 + v14);
      v102[20] = v43 + v17 - (v18 + v16);
      v102[21] = v18 + v16 + v44 - v17;
      int v45 = v37 - v14 + v15;
      int v46 = v15 + v14 + v38;
      v102[22] = v18 + v16 + v45 + v17;
      v102[23] = v46 - v17 - (v18 + v16);
      int v47 = v13 - (v15 + v14);
      int v48 = v19 + v14 - v15;
      v102[24] = v47 - v17 + v16 - v18;
      v102[25] = v48 + v17 - v16 + v18;
      int v49 = v15 + v14 + v20;
      int v50 = v21 - v14 + v15;
      v102[26] = v49 - v17 - v16 + v18;
      v102[27] = v50 + v17 + v16 - v18;
      int v51 = v22 + v14 - v15;
      int v52 = v24 - (v15 + v14);
      v102[28] = v51 + v17 - v16 + v18;
      v102[29] = v52 - v17 + v16 - v18;
      int v53 = v15 - v93;
      int v54 = v15 + v14 + v25;
      int v94 = v15 - v93 + v17;
      v102[30] = v94 + v16 - v18;
      v102[31] = v54 - v17 - v16 + v18;
      v102[32] = v43 - v17 - (v18 + v16);
      v102[33] = v18 + v16 + v44 + v17;
      v102[34] = v18 + v16 + v45 - v17;
      v102[35] = v46 + v17 - (v18 + v16);
      v102[36] = v18 + v16 + v39 + v17;
      v102[37] = v40 - v17 - (v18 + v16);
      v102[38] = v41 + v17 - (v18 + v16);
      v102[39] = v18 + v16 + v42 - v17;
      v102[40] = v51 - v17 - v16 + v18;
      v102[41] = v52 + v17 + v16 - v18;
      v102[42] = v53 - v17 + v16 - v18;
      v102[43] = v54 + v17 - v16 + v18;
      v102[44] = v47 + v17 + v16 - v18;
      v102[45] = v48 - v17 - v16 + v18;
      v102[46] = v49 + v17 - v16 + v18;
      v102[47] = v50 - v17 + v16 - v18;
      v102[48] = v88 + v17 - (v18 + v16);
      v102[49] = v18 + v16 + v87 - v17;
      v102[50] = v18 + v16 + v85 + v17;
      v102[51] = v86 - v17 - (v18 + v16);
      v102[52] = v18 + v16 + v98 - v17;
      v102[53] = v97 + v17 - (v18 + v16);
      v102[54] = v96 - v17 - (v18 + v16);
      v102[55] = v18 + v16 + v95 + v17;
      v102[56] = v84 + v17 - v16 + v18;
      v102[57] = v36 - v17 + v16 - v18;
      v102[58] = v82 + v17 + v16 - v18;
      v102[59] = v83 - v17 - v16 + v18;
      v102[60] = v91 - v17 + v16 - v18;
      v102[61] = v92 + v17 - v16 + v18;
      v102[62] = v90 - v17 - v16 + v18;
      v102[63] = v89 + v17 + v16 - v18;
      v102[64] = v86 - v17 + v16 - v18;
      v102[65] = v85 + v17 - v16 + v18;
      v102[66] = v87 - v17 - v16 + v18;
      v102[67] = v88 + v17 + v16 - v18;
      v102[68] = v95 + v17 - v16 + v18;
      v102[69] = v96 - v17 + v16 - v18;
      v102[70] = v97 + v17 + v16 - v18;
      v102[71] = v98 - v17 - v16 + v18;
      v102[72] = v18 + v16 + v83 - v17;
      v102[73] = v82 + v17 - (v18 + v16);
      v102[74] = v36 - v17 - (v18 + v16);
      v102[75] = v18 + v16 + v84 + v17;
      v102[76] = v89 + v17 - (v18 + v16);
      v102[77] = v18 + v16 + v90 - v17;
      v102[78] = v18 + v16 + v92 + v17;
      v102[79] = v91 - v17 - (v18 + v16);
      v102[80] = v46 + v17 + v16 - v18;
      v102[81] = v45 - v17 - v16 + v18;
      v102[82] = v44 + v17 - v16 + v18;
      v102[83] = v43 - v17 + v16 - v18;
      LODWORD(v103) = v42 - v17 - v16 + v18;
      DWORD1(v103) = v41 + v17 + v16 - v18;
      DWORD2(v103) = v40 - v17 + v16 - v18;
      HIDWORD(v103) = v39 + v17 - v16 + v18;
      LODWORD(v104) = v18 + v16 + v54 + v17;
      DWORD1(v104) = v53 - v17 - (v18 + v16);
      DWORD2(v104) = v52 + v17 - (v18 + v16);
      HIDWORD(v104) = v18 + v16 + v51 - v17;
      LODWORD(v105) = v50 - v17 - (v18 + v16);
      DWORD1(v105) = v18 + v16 + v49 + v17;
      DWORD2(v105) = v18 + v16 + v48 - v17;
      HIDWORD(v105) = v47 + v17 - (v18 + v16);
      LODWORD(v106) = v42 + v17 - v16 + v18;
      DWORD1(v106) = v41 - v17 + v16 - v18;
      DWORD2(v106) = v40 + v17 + v16 - v18;
      HIDWORD(v106) = v39 - v17 - v16 + v18;
      LODWORD(v107) = v46 - v17 + v16 - v18;
      DWORD1(v107) = v45 + v17 - v16 + v18;
      DWORD2(v107) = v44 - v17 - v16 + v18;
      HIDWORD(v107) = v43 + v17 + v16 - v18;
      LODWORD(v108) = v50 + v17 - (v18 + v16);
      DWORD1(v108) = v18 + v16 + v49 - v17;
      DWORD2(v108) = v18 + v16 + v48 + v17;
      HIDWORD(v108) = v47 - v17 - (v18 + v16);
      LODWORD(v109) = v18 + v16 + v54 - v17;
      DWORD1(v109) = v94 - (v18 + v16);
      DWORD2(v109) = v52 - v17 - (v18 + v16);
      HIDWORD(v109) = v18 + v16 + v51 + v17;
      LODWORD(v110) = v95 - v17 - v16 + v18;
      DWORD1(v110) = v96 + v17 + v16 - v18;
      DWORD2(v110) = v97 - v17 + v16 - v18;
      HIDWORD(v110) = v98 + v17 - v16 + v18;
      LODWORD(v111) = v86 + v17 + v16 - v18;
      DWORD1(v111) = v85 - v17 - v16 + v18;
      DWORD2(v111) = v87 + v17 - v16 + v18;
      HIDWORD(v111) = v88 - v17 + v16 - v18;
      LODWORD(v112) = v89 - v17 - (v18 + v16);
      DWORD1(v112) = v18 + v16 + v90 + v17;
      DWORD2(v112) = v18 + v16 + v92 - v17;
      HIDWORD(v112) = v91 + v17 - (v18 + v16);
      LODWORD(v113) = v18 + v16 + v83 + v17;
      DWORD1(v113) = v82 - v17 - (v18 + v16);
      DWORD2(v113) = v36 + v17 - (v18 + v16);
      HIDWORD(v113) = v18 + v16 + v84 - v17;
      uint64_t v55 = v4;
      uint64_t v4 = v99;
      uint64_t v56 = (int *)(v81 + 32 * v100);
LABEL_8:
      int v57 = 0;
      unint64_t v58 = v7 >> 1;
      unint64_t v59 = (unsigned int *)(v55 + 4 * (v7 >> 1));
      int v60 = (_DWORD *)((char *)v102 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v62 = *v60++;
        int v61 = v62;
        uint64_t v63 = 4 * v7;
        int v64 = *(_DWORD *)(v99 + 4 * v7);
        int v65 = *(_DWORD *)(v99 + ((4 * v7) | 4));
        BOOL v66 = v64 <= v65;
        if (v64 <= v65) {
          int v64 = *(_DWORD *)(v99 + ((4 * v7) | 4));
        }
        unsigned int v67 = v64 + v61;
        if (__OFADD__(v64, v61)) {
          unsigned int v67 = ((v64 + v61) >> 31) ^ 0x80000000;
        }
        *unint64_t v59 = v67;
        BOOL v68 = __OFSUB__(v64, v61);
        signed int v69 = v64 - v61;
        if (v68) {
          signed int v69 = (v69 >> 31) ^ 0x80000000;
        }
        v59[256] = v69;
        int v70 = (4 * v57) | (2 * v66);
        int v71 = *(_DWORD *)(v99 + (v63 | 8));
        int v72 = *(_DWORD *)(v99 + (v63 | 0xC));
        BOOL v73 = v71 <= v72;
        if (v71 > v72) {
          int v72 = v71;
        }
        int v57 = v70 | v73;
        unsigned int v74 = v72 - v61;
        if (__OFSUB__(v72, v61)) {
          unsigned int v74 = ((v72 - v61) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v55 + ((4 * v58) | 4)) = v74;
        BOOL v68 = __OFADD__(v72, v61);
        signed int v75 = v72 + v61;
        if (v68) {
          signed int v75 = (v75 >> 31) ^ 0x80000000;
        }
        v59[257] = v75;
        if ((~(_BYTE)v7 & 0x3C) == 0)
        {
          *v56++ = v57;
          BOOL v76 = v7 >= 0x1FC;
          v7 += 4;
          if (v76) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v58 += 2;
        v59 += 2;
        BOOL v76 = v7 >= 0x1FC;
        v7 += 4;
      }
      while (!v76);
      if (v57) {
        *uint64_t v56 = v57;
      }
LABEL_30:
      a3 = v101 + 9;
      uint64_t v6 = v100 + 1;
      uint64_t v3 = v55;
    }
    while (v100 + 1 != v80);
  }
  else
  {
    uint64_t v55 = v3;
  }
  uint64_t v77 = 0;
  *((void *)this + 8) = v55;
  *((void *)this + 9) = v4;
  return v77;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R10C9(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v185 = *MEMORY[0x263EF8340];
  uint64_t v99 = *((void *)this + 5);
  if (!v99) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v5 = *((unsigned __int16 *)this + 9);
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v174 = 0u;
  uint64_t v98 = v5;
  if (v5)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v170 = v3;
      uint64_t v171 = v6;
      unint64_t v7 = 0;
      int v8 = *a3;
      int v9 = a3[1];
      int v10 = v9 + *a3;
      int v12 = a3[2];
      int v11 = a3[3];
      int v14 = a3[4];
      int v13 = a3[5];
      int v15 = v10 + v12 + v11;
      int v130 = v15 + v14;
      int v146 = v15 + v14 + v13;
      int v17 = a3[6];
      int v16 = a3[7];
      int v169 = v146 + v17;
      int v18 = a3[8];
      int v19 = a3[9];
      int v172 = a3;
      int v20 = v18 + v16;
      int v21 = v19 + v18 + v16;
      int v144 = v12 - v10 + v11;
      int v142 = v144 - v14 + v13;
      int v168 = v142 - v17;
      int v138 = v10 + v12 - v11;
      int v22 = v13 + v14;
      int v140 = v138 - (v13 + v14);
      int v167 = v140 + v17;
      v173[0] = v21 + v146 + v17;
      int v133 = v12 - v10 - v11;
      v173[1] = v142 - v17 - (v18 + v16) + v19;
      int v135 = v133 + v14 - v13;
      int v164 = v135 - v17;
      v173[2] = v140 + v17 - (v18 + v16) + v19;
      v173[3] = v21 + v135 - v17;
      int v136 = v11 - (v10 + v12);
      int v120 = v136 - v14 + v13;
      int v23 = v10 - v12;
      int v24 = v23 + v11;
      int v123 = v13 + v14 + v23 + v11;
      int v165 = v123 + v17;
      int v166 = v120 - v17;
      v173[4] = v120 - v17 - v21;
      v173[5] = v18 + v16 + v123 + v17 - v19;
      int v122 = v14 - v13 - v15;
      int v128 = v23 - v11;
      int v121 = v23 - v11 - (v13 + v14);
      int v161 = v121 + v17;
      v173[6] = v18 + v16 + v122 - v17 - v19;
      v173[7] = v121 + v17 - v21;
      int v25 = v9 - v8;
      int v26 = v8 - v9;
      int v27 = v25 - v12 - v11;
      int v127 = v13 + v14 + v27;
      int v162 = v127 + v17;
      int v163 = v122 - v17;
      int v28 = v19 + v16;
      int v29 = v26 - v12 - v11;
      int v126 = v29 - v14 + v13;
      int v160 = v126 - v17;
      int v30 = v19 + v18 - v16;
      v173[8] = v127 + v17 - v18 + v19 + v16;
      v173[9] = v30 + v126 - v17;
      int v31 = v25 - v12 + v11;
      int v32 = v26 - v12 + v11;
      int v125 = v32 + v14 - v13;
      int v157 = v125 - v17;
      int v124 = v31 - (v13 + v14);
      int v158 = v124 + v17;
      v173[10] = v30 + v124 + v17;
      v173[11] = v125 - v17 - v18 + v19 + v16;
      int v33 = v26 + v12;
      int v34 = v25 + v12;
      int v35 = v33 - v11;
      int v118 = v33 - v11 - v14 + v13;
      int v159 = v118 - v17;
      int v36 = v34 - v11;
      int v119 = v13 + v14 + v34 - v11;
      int v156 = v119 + v17;
      v173[12] = v18 + v118 - v17 - (v19 + v16);
      v173[13] = v119 + v17 + v16 - (v19 + v18);
      int v37 = v33 + v11;
      int v38 = v34 + v11;
      int v116 = v37 + v14 - v13;
      int v155 = v116 - v17;
      int v117 = v34 + v11 - (v13 + v14);
      int v154 = v117 + v17;
      v173[14] = v116 - v17 + v16 - (v19 + v18);
      v173[15] = v117 + v17 + v18 - (v19 + v16);
      int v112 = v27 - (v13 + v14);
      int v153 = v112 - v17;
      int v39 = v29 + v14 - v13;
      int v152 = v39 + v17;
      v173[16] = v18 + v16 + v112 - v17 - v19;
      v173[17] = v39 + v17 - v21;
      int v40 = v13 + v14 + v31;
      int v41 = v32 - v14 + v13;
      int v147 = v41 + v17;
      int v148 = v40 - v17;
      v173[18] = v40 - v17 - v21;
      v173[19] = v18 + v16 + v41 + v17 - v19;
      int v42 = v35 + v14 - v13;
      int v151 = v42 + v17;
      int v43 = v36 - (v13 + v14);
      int v150 = v43 - v17;
      v173[20] = v42 + v17 - (v18 + v16) + v19;
      v173[21] = v21 + v43 - v17;
      int v44 = v37 - v14 + v13;
      int v45 = v13 + v14 + v38;
      int v141 = v45 - v17;
      int v143 = v44 + v17;
      v173[22] = v21 + v44 + v17;
      v173[23] = v45 - v17 - (v18 + v16) + v19;
      int v46 = v15 - (v13 + v14);
      int v149 = v46 - v17;
      int v47 = v144 + v14 - v13;
      int v145 = v47 + v17;
      v173[24] = v46 - v17 + v16 - (v19 + v18);
      v173[25] = v18 + v47 + v17 - (v19 + v16);
      int v48 = v13 + v14 + v138;
      int v139 = v48 - v17;
      int v49 = v133 - v14 + v13;
      int v132 = v49 + v17;
      v173[26] = v18 + v48 - v17 - (v19 + v16);
      v173[27] = v49 + v17 + v16 - (v19 + v18);
      int v50 = v136 + v14 - v13;
      int v51 = v24 - (v13 + v14);
      int v134 = v51 - v17;
      int v137 = v50 + v17;
      v173[28] = v30 + v50 + v17;
      v173[29] = v51 - v17 - v18 + v19 + v16;
      int v52 = v13 - v130;
      int v53 = v22 + v128;
      int v131 = v52 + v17;
      int v129 = v53 - v17;
      v173[30] = v52 + v17 - v18 + v19 + v16;
      v173[31] = v30 + v53 - v17;
      int v114 = v43 + v17;
      int v115 = v42 - v17;
      v173[32] = v42 - v17 - v21;
      v173[33] = v18 + v16 + v43 + v17 - v19;
      int v109 = v44 - v17;
      int v105 = v45 + v17;
      v173[34] = v18 + v16 + v44 - v17 - v19;
      v173[35] = v45 + v17 - v21;
      int v113 = v112 + v17;
      int v110 = v39 - v17;
      v173[36] = v21 + v113;
      v173[37] = v39 - v17 - (v18 + v16) + v19;
      int v106 = v40 + v17;
      int v102 = v41 - v17;
      v173[38] = v40 + v17 - (v18 + v16) + v19;
      v173[39] = v21 + v41 - v17;
      int v111 = v50 - v17;
      int v108 = v51 + v17;
      v173[40] = v18 + v50 - v17 - (v19 + v16);
      v173[41] = v51 + v17 + v16 - (v19 + v18);
      int v104 = v52 - v17;
      int v54 = v52 - v17 + v16;
      int v55 = v16;
      int v101 = v53 + v17;
      v173[42] = v54 - (v19 + v18);
      v173[43] = v18 + v53 + v17 - (v19 + v16);
      int v107 = v46 + v17;
      int v103 = v47 - v17;
      v173[44] = v46 + v17 - v18 + v19 + v16;
      v173[45] = v30 + v47 - v17;
      int v100 = v48 + v17;
      int v56 = v49 - v17;
      v173[46] = v30 + v48 + v17;
      v173[47] = v49 - v17 - v18 + v19 + v16;
      int v57 = v120 + v17;
      int v58 = v123 - v17;
      v173[48] = v120 + v17 - (v18 + v16) + v19;
      v173[49] = v21 + v123 - v17;
      int v59 = v122 + v17;
      int v60 = v121 - v17;
      v173[50] = v21 + v122 + v17;
      v173[51] = v121 - v17 - (v18 + v16) + v19;
      int v61 = v146 - v17;
      int v62 = v142 + v17;
      v173[52] = v18 + v16 + v146 - v17 - v19;
      v173[53] = v142 + v17 - v21;
      int v63 = v140 - v17;
      int v64 = v135 + v17;
      v173[54] = v140 - v17 - v21;
      v173[55] = v18 + v16 + v135 + v17 - v19;
      int v65 = v118 + v17;
      int v66 = v119 - v17;
      v173[56] = v30 + v118 + v17;
      v173[57] = v119 - v17 - v18 + v19 + v16;
      int v67 = v116 + v17;
      int v68 = v117 - v17;
      v173[58] = v116 + v17 - v18 + v19 + v16;
      v173[59] = v30 + v117 - v17;
      int v69 = v127 - v17;
      int v70 = v126 + v17;
      v173[60] = v127 - v17 + v55 - (v19 + v18);
      v173[61] = v18 + v126 + v17 - v28;
      int v71 = v124 - v17;
      int v72 = v125 + v17;
      v173[62] = v71 + v18 - v28;
      v173[63] = v72 + v55 - (v19 + v18);
      v173[64] = v60 - v18 + v28;
      v173[65] = v30 + v59;
      v173[66] = v30 + v58;
      v173[67] = v57 - v18 + v28;
      v173[68] = v18 + v64 - v28;
      v173[69] = v63 + v55 - (v19 + v18);
      v173[70] = v62 + v55 - (v19 + v18);
      v173[71] = v18 + v61 - v28;
      v173[72] = v21 + v68;
      v173[73] = v67 - v20 + v19;
      v173[74] = v66 - v20 + v19;
      v173[75] = v21 + v65;
      v173[76] = v72 - v21;
      v173[77] = v20 + v71 - v19;
      v173[78] = v20 + v70 - v19;
      v173[79] = v69 - v21;
      v173[80] = v105 + v55 - (v19 + v18);
      v173[81] = v18 + v109 - v28;
      v173[82] = v114 + v18 - v28;
      v173[83] = v115 + v55 - (v19 + v18);
      LODWORD(v174) = v30 + v102;
      DWORD1(v174) = v106 - v18 + v28;
      DWORD2(v174) = v110 - v18 + v28;
      HIDWORD(v174) = v30 + v113;
      LODWORD(v175) = v20 + v101 - v19;
      DWORD1(v175) = v104 - v21;
      DWORD2(v175) = v108 - v21;
      HIDWORD(v175) = v20 + v111 - v19;
      LODWORD(v176) = v56 - v20 + v19;
      DWORD1(v176) = v21 + v100;
      DWORD2(v176) = v21 + v103;
      HIDWORD(v176) = v107 - v20 + v19;
      LODWORD(v177) = v18 + v147 - v28;
      DWORD1(v177) = v148 + v55 - (v19 + v18);
      DWORD2(v177) = v152 + v55 - (v19 + v18);
      HIDWORD(v177) = v153 + v18 - v28;
      LODWORD(v178) = v141 - v18 + v28;
      DWORD1(v178) = v30 + v143;
      DWORD2(v178) = v30 + v150;
      HIDWORD(v178) = v151 - v18 + v28;
      LODWORD(v179) = v132 - v21;
      DWORD1(v179) = v20 + v139 - v19;
      DWORD2(v179) = v20 + v145 - v19;
      HIDWORD(v179) = v149 - v21;
      LODWORD(v180) = v21 + v129;
      DWORD1(v180) = v131 - v20 + v19;
      DWORD2(v180) = v134 - v20 + v19;
      HIDWORD(v180) = v21 + v137;
      LODWORD(v181) = v30 + v164;
      DWORD1(v181) = v167 - v18 + v28;
      DWORD2(v181) = v168 - v18 + v28;
      HIDWORD(v181) = v30 + v169;
      LODWORD(v182) = v161 + v55 - (v19 + v18);
      DWORD1(v182) = v18 + v163 - v28;
      DWORD2(v182) = v18 + v165 - v28;
      HIDWORD(v182) = v166 + v55 - (v19 + v18);
      LODWORD(v183) = v157 - v20 + v19;
      DWORD1(v183) = v21 + v158;
      DWORD2(v183) = v21 + v160;
      HIDWORD(v183) = v162 - v20 + v19;
      LODWORD(v184) = v20 + v154 - v19;
      DWORD1(v184) = v155 - v21;
      DWORD2(v184) = v156 - v21;
      HIDWORD(v184) = v20 + v159 - v19;
      uint64_t v73 = v4;
      uint64_t v4 = v170;
      unsigned int v74 = (int *)(v99 + 32 * v171);
LABEL_8:
      int v75 = 0;
      unint64_t v76 = v7 >> 1;
      uint64_t v77 = (unsigned int *)(v73 + 4 * (v7 >> 1));
      uint64_t v78 = (_DWORD *)((char *)v173 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v80 = *v78++;
        int v79 = v80;
        uint64_t v81 = 4 * v7;
        int v82 = *(_DWORD *)(v170 + 4 * v7);
        int v83 = *(_DWORD *)(v170 + ((4 * v7) | 4));
        BOOL v84 = v82 <= v83;
        if (v82 <= v83) {
          int v82 = *(_DWORD *)(v170 + ((4 * v7) | 4));
        }
        unsigned int v85 = v82 + v79;
        if (__OFADD__(v82, v79)) {
          unsigned int v85 = ((v82 + v79) >> 31) ^ 0x80000000;
        }
        *uint64_t v77 = v85;
        BOOL v86 = __OFSUB__(v82, v79);
        signed int v87 = v82 - v79;
        if (v86) {
          signed int v87 = (v87 >> 31) ^ 0x80000000;
        }
        v77[256] = v87;
        int v88 = (4 * v75) | (2 * v84);
        int v89 = *(_DWORD *)(v170 + (v81 | 8));
        int v90 = *(_DWORD *)(v170 + (v81 | 0xC));
        BOOL v91 = v89 <= v90;
        if (v89 > v90) {
          int v90 = v89;
        }
        int v75 = v88 | v91;
        unsigned int v92 = v90 - v79;
        if (__OFSUB__(v90, v79)) {
          unsigned int v92 = ((v90 - v79) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v73 + ((4 * v76) | 4)) = v92;
        BOOL v86 = __OFADD__(v90, v79);
        signed int v93 = v90 + v79;
        if (v86) {
          signed int v93 = (v93 >> 31) ^ 0x80000000;
        }
        v77[257] = v93;
        if ((~(_BYTE)v7 & 0x3C) == 0)
        {
          *v74++ = v75;
          BOOL v94 = v7 >= 0x1FC;
          v7 += 4;
          if (v94) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v76 += 2;
        v77 += 2;
        BOOL v94 = v7 >= 0x1FC;
        v7 += 4;
      }
      while (!v94);
      if (v75) {
        *unsigned int v74 = v75;
      }
LABEL_30:
      a3 = v172 + 10;
      uint64_t v6 = v171 + 1;
      uint64_t v3 = v73;
    }
    while (v171 + 1 != v98);
  }
  else
  {
    uint64_t v73 = v3;
  }
  uint64_t v95 = 0;
  *((void *)this + 8) = v73;
  *((void *)this + 9) = v4;
  return v95;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R11C9(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  uint64_t v69 = *((void *)this + 5);
  if (!v69) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v5 = *((unsigned __int16 *)this + 9);
  long long v127 = 0u;
  long long v128 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v118 = 0u;
  uint64_t v68 = v5;
  if (v5)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v113 = v3;
      uint64_t v114 = v6;
      unint64_t v7 = 0;
      int v8 = *a3;
      int v9 = a3[1];
      int v10 = v9 + *a3;
      int v11 = a3[2];
      int v12 = a3[3];
      int v13 = a3[4];
      int v14 = a3[5];
      int v15 = v10 + v11 + v12;
      int v108 = v15;
      int v98 = v15 + v13;
      int v106 = v15 + v13 + v14;
      int v17 = a3[6];
      int v16 = a3[7];
      int v112 = v106 + v17;
      int v19 = a3[8];
      int v18 = a3[9];
      int v20 = v18 + v19 + v16;
      int v115 = a3;
      int v21 = a3[10];
      int v104 = v11 - v10 + v12;
      int v105 = v104 - v13 + v14;
      int v116 = v21 + v19 + v16;
      int v101 = v10 + v11 - v12;
      v117[0] = v21 + v20 + v106 + v17;
      int v22 = v14 + v13;
      v117[1] = v18 + v105 - v17 - v116;
      int v103 = v101 - (v14 + v13);
      int v100 = v11 - v10 - v12;
      int v102 = v100 + v13 - v14;
      v117[2] = v103 + v17 - (v19 + v16) + v21 + v18;
      v117[3] = v20 + v102 - v17 - v21;
      int v96 = v12 - (v10 + v11);
      int v90 = v96 - v13 + v14;
      int v111 = v90 - v17;
      int v23 = v10 - v11;
      int v88 = v14 + v13 + v23 + v12;
      int v110 = v88 + v17;
      v117[4] = v90 - v17 - v20 + v21;
      v117[5] = v19 + v16 + v88 + v17 - (v21 + v18);
      int v87 = v13 - v14 - v15;
      int v86 = v23 - v12 - (v14 + v13);
      v117[6] = v87 - v17 - v18 + v116;
      v117[7] = v86 + v17 - (v21 + v20);
      int v24 = v9 - v8;
      int v25 = v8 - v9;
      int v26 = v24 - v11 - v12;
      int v95 = v14 + v13 + v26;
      int v27 = v25 - v11 - v12;
      int v94 = v27 - v13 + v14;
      int v72 = v18 + v19 - v16 + v21;
      v117[8] = v18 + v16 + v95 + v17 - (v21 + v19);
      v117[9] = v72 + v94 - v17;
      int v28 = v24 - v11 + v12;
      int v93 = v28 - (v14 + v13);
      int v29 = v25 - v11 + v12;
      int v92 = v29 + v13 - v14;
      int v71 = v21 + v18 + v16;
      v117[10] = v18 + v19 + v93 + v17 - (v21 + v16);
      v117[11] = v92 - v17 - v19 + v71;
      int v30 = v25 + v11;
      int v31 = v24 + v11;
      int v32 = v30 - v12;
      int v85 = v30 - v12 - v13 + v14;
      int v84 = v14 + v13 + v31 - v12;
      v117[12] = v19 + v85 - v17 - (v18 + v16 + v21);
      v117[13] = v84 + v17 - (v18 + v19) + v21 + v16;
      int v33 = v30 + v12;
      int v34 = v31 + v12;
      int v82 = v33 + v13 - v14;
      int v83 = v31 + v12 - (v14 + v13);
      v117[14] = v82 - v17 + v16 - (v18 + v19 + v21);
      v117[15] = v83 + v17 - (v18 + v16) + v21 + v19;
      int v81 = v26 - (v14 + v13);
      int v79 = v27 + v13 - v14;
      int v109 = v79 + v17;
      v117[16] = v19 + v16 + v81 - v17 - (v21 + v18);
      v117[17] = v79 + v17 - v20 + v21;
      int v77 = v14 + v13 + v28;
      int v78 = v29 - v13 + v14;
      v117[18] = v77 - v17 - (v21 + v20);
      v117[19] = v78 + v17 - v18 + v116;
      int v35 = v32 + v13 - v14;
      int v36 = v31 - v12 - (v14 + v13);
      v117[20] = v18 + v35 + v17 - v116;
      v117[21] = v21 + v20 + v36 - v17;
      int v37 = v33 - v13 + v14;
      int v38 = v14 + v13 + v34;
      v117[22] = v20 + v37 + v17 - v21;
      v117[23] = v38 - v17 - (v19 + v16) + v21 + v18;
      int v76 = v108 - (v14 + v13);
      int v75 = v104 + v13 - v14;
      v117[24] = v76 - v17 - (v18 + v19) + v21 + v16;
      v117[25] = v19 + v75 + v17 - (v18 + v16 + v21);
      int v73 = v14 + v13 + v101;
      int v70 = v100 - v13 + v14;
      v117[26] = v73 - v17 - (v18 + v16) + v21 + v19;
      v117[27] = v70 + v17 + v16 - (v18 + v19 + v21);
      int v39 = v96 + v13 - v14;
      int v40 = v23 + v12 - (v14 + v13);
      v117[28] = v72 + v39 + v17;
      v117[29] = v18 + v16 + v40 - v17 - (v21 + v19);
      int v41 = v14 - v98;
      int v99 = v14 - v98 + v17;
      int v97 = v22 + v23 - v12 - v17;
      v117[30] = v99 - v19 + v71;
      v117[31] = v18 + v19 + v97 - (v21 + v16);
      v117[32] = v35 - v17 - v20 + v21;
      v117[33] = v19 + v16 + v36 + v17 - (v21 + v18);
      v117[34] = v37 - v17 - v18 + v116;
      v117[35] = v38 + v17 - (v21 + v20);
      int v80 = v79 - v17;
      v117[36] = v21 + v20 + v81 + v17;
      v117[37] = v18 + v80 - v116;
      v117[38] = v77 + v17 - (v19 + v16) + v21 + v18;
      v117[39] = v20 + v78 - v17 - v21;
      v117[40] = v19 + v39 - v17 - (v18 + v16 + v21);
      v117[41] = v40 + v17 - (v18 + v19) + v21 + v16;
      int v74 = v22 + v23 - v12 + v17;
      v117[42] = v41 - v17 + v16 - (v18 + v19 + v21);
      v117[43] = v74 - (v18 + v16) + v21 + v19;
      v117[44] = v18 + v16 + v76 + v17 - (v21 + v19);
      v117[45] = v72 + v75 - v17;
      v117[46] = v18 + v19 + v73 + v17 - (v21 + v16);
      v117[47] = v70 - v17 - v19 + v71;
      int v91 = v90 + v17;
      int v89 = v88 - v17;
      v117[48] = v18 + v91 - v116;
      v117[49] = v21 + v20 + v89;
      v117[50] = v20 + v87 + v17 - v21;
      v117[51] = v86 - v17 - (v19 + v16) + v21 + v18;
      int v107 = v106 - v17;
      v117[52] = v19 + v16 + v107 - (v21 + v18);
      v117[53] = v105 + v17 - v20 + v21;
      v117[54] = v103 - v17 - (v21 + v20);
      v117[55] = v102 + v17 - v18 + v116;
      v117[56] = v72 + v85 + v17;
      v117[57] = v18 + v16 + v84 - v17 - (v21 + v19);
      v117[58] = v82 + v17 - v19 + v71;
      v117[59] = v18 + v19 + v83 - v17 - (v21 + v16);
      v117[60] = v95 - v17 - (v18 + v19) + v21 + v16;
      v117[61] = v19 + v94 + v17 - (v18 + v16 + v21);
      v117[62] = v93 - v17 - (v18 + v16) + v21 + v19;
      v117[63] = v92 + v17 + v16 - (v18 + v19 + v21);
      v117[64] = v86 - v17 - v19 + v71;
      v117[65] = v18 + v19 + v87 + v17 - (v21 + v16);
      v117[66] = v72 + v89;
      v117[67] = v18 + v16 + v91 - (v21 + v19);
      v117[68] = v102 + v17 - (v18 + v16) + v21 + v19;
      int v42 = v18 + v19 + v21;
      v117[69] = v103 - v17 + v16 - v42;
      v117[70] = v105 + v17 - (v18 + v19) + v21 + v16;
      v117[71] = v19 + v107 - (v18 + v16 + v21);
      v117[72] = v20 + v83 - v17 - v21;
      v117[73] = v82 + v17 - (v19 + v16) + v21 + v18;
      v117[74] = v18 + v84 - v17 - v116;
      v117[75] = v21 + v20 + v85 + v17;
      v117[76] = v92 + v17 - (v21 + v20);
      v117[77] = v93 - v17 - v18 + v116;
      v117[78] = v19 + v16 + v94 + v17 - (v21 + v18);
      v117[79] = v95 - v17 - v20 + v21;
      v117[80] = v38 + v17 + v16 - v42;
      v117[81] = v37 - v17 - (v18 + v16) + v21 + v19;
      v117[82] = v36 + v17 + v19 - (v18 + v16 + v21);
      v117[83] = v35 - v17 - (v18 + v19) + v21 + v16;
      LODWORD(v118) = v18 + v19 + v78 - v17 - (v21 + v16);
      DWORD1(v118) = v77 + v17 - v19 + v71;
      DWORD2(v118) = v18 + v16 + v80 - (v21 + v19);
      HIDWORD(v118) = v72 + v81 + v17;
      LODWORD(v119) = v74 - v18 + v116;
      DWORD1(v119) = v41 - v17 - (v21 + v20);
      DWORD2(v119) = v40 + v17 - v20 + v21;
      HIDWORD(v119) = v19 + v16 + v39 - v17 - (v21 + v18);
      LODWORD(v120) = v70 - v17 - (v19 + v16) + v21 + v18;
      DWORD1(v120) = v20 + v73 + v17 - v21;
      DWORD2(v120) = v21 + v20 + v75 - v17;
      HIDWORD(v120) = v18 + v76 + v17 - v116;
      LODWORD(v121) = v78 + v17 - (v18 + v16) + v21 + v19;
      DWORD1(v121) = v77 - v17 + v16 - v42;
      DWORD2(v121) = v109 - (v18 + v19) + v21 + v16;
      HIDWORD(v121) = v81 - v17 + v19 - (v18 + v16 + v21);
      LODWORD(v122) = v38 - v17 - v19 + v71;
      DWORD1(v122) = v18 + v19 + v37 + v17 - (v21 + v16);
      DWORD2(v122) = v72 + v36 - v17;
      HIDWORD(v122) = v18 + v16 + v35 + v17 - (v21 + v19);
      LODWORD(v123) = v70 + v17 - (v21 + v20);
      DWORD1(v123) = v73 - v17 - v18 + v116;
      DWORD2(v123) = v19 + v16 + v75 + v17 - (v21 + v18);
      HIDWORD(v123) = v76 - v17 - v20 + v21;
      LODWORD(v124) = v20 + v97 - v21;
      DWORD1(v124) = v99 - (v19 + v16) + v21 + v18;
      DWORD2(v124) = v18 + v40 - v17 - v116;
      HIDWORD(v124) = v21 + v20 + v39 + v17;
      LODWORD(v125) = v18 + v19 + v102 - v17 - (v21 + v16);
      DWORD1(v125) = v103 + v17 - v19 + v71;
      DWORD2(v125) = v18 + v16 + v105 - v17 - (v21 + v19);
      HIDWORD(v125) = v72 + v112;
      LODWORD(v126) = v86 + v17 + v16 - v42;
      DWORD1(v126) = v87 - v17 - (v18 + v16) + v21 + v19;
      DWORD2(v126) = v19 + v110 - (v18 + v16 + v21);
      HIDWORD(v126) = v111 - (v18 + v19) + v21 + v16;
      LODWORD(v127) = v92 - v17 - (v19 + v16) + v21 + v18;
      DWORD1(v127) = v20 + v93 + v17 - v21;
      DWORD2(v127) = v21 + v20 + v94 - v17;
      HIDWORD(v127) = v18 + v95 + v17 - v116;
      LODWORD(v128) = v83 + v17 - v18 + v116;
      DWORD1(v128) = v82 - v17 - (v21 + v20);
      DWORD2(v128) = v84 + v17 - v20 + v21;
      HIDWORD(v128) = v19 + v16 + v85 - v17 - (v21 + v18);
      uint64_t v43 = v4;
      uint64_t v4 = v113;
      int v44 = (int *)(v69 + 32 * v114);
LABEL_8:
      int v45 = 0;
      unint64_t v46 = v7 >> 1;
      int v47 = (unsigned int *)(v43 + 4 * (v7 >> 1));
      int v48 = (_DWORD *)((char *)v117 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v50 = *v48++;
        int v49 = v50;
        uint64_t v51 = 4 * v7;
        int v52 = *(_DWORD *)(v113 + 4 * v7);
        int v53 = *(_DWORD *)(v113 + ((4 * v7) | 4));
        BOOL v54 = v52 <= v53;
        if (v52 <= v53) {
          int v52 = *(_DWORD *)(v113 + ((4 * v7) | 4));
        }
        unsigned int v55 = v52 + v49;
        if (__OFADD__(v52, v49)) {
          unsigned int v55 = ((v52 + v49) >> 31) ^ 0x80000000;
        }
        *int v47 = v55;
        BOOL v56 = __OFSUB__(v52, v49);
        signed int v57 = v52 - v49;
        if (v56) {
          signed int v57 = (v57 >> 31) ^ 0x80000000;
        }
        v47[256] = v57;
        int v58 = (4 * v45) | (2 * v54);
        int v59 = *(_DWORD *)(v113 + (v51 | 8));
        int v60 = *(_DWORD *)(v113 + (v51 | 0xC));
        BOOL v61 = v59 <= v60;
        if (v59 > v60) {
          int v60 = v59;
        }
        int v45 = v58 | v61;
        unsigned int v62 = v60 - v49;
        if (__OFSUB__(v60, v49)) {
          unsigned int v62 = ((v60 - v49) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v43 + ((4 * v46) | 4)) = v62;
        BOOL v56 = __OFADD__(v60, v49);
        signed int v63 = v60 + v49;
        if (v56) {
          signed int v63 = (v63 >> 31) ^ 0x80000000;
        }
        v47[257] = v63;
        if ((~(_BYTE)v7 & 0x3C) == 0)
        {
          *v44++ = v45;
          BOOL v64 = v7 >= 0x1FC;
          v7 += 4;
          if (v64) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v46 += 2;
        v47 += 2;
        BOOL v64 = v7 >= 0x1FC;
        v7 += 4;
      }
      while (!v64);
      if (v45) {
        *int v44 = v45;
      }
LABEL_30:
      a3 = v115 + 11;
      uint64_t v6 = v114 + 1;
      uint64_t v3 = v43;
    }
    while (v114 + 1 != v68);
  }
  else
  {
    uint64_t v43 = v3;
  }
  uint64_t v65 = 0;
  *((void *)this + 8) = v43;
  *((void *)this + 9) = v4;
  return v65;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R12C9(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  uint64_t v71 = *((void *)this + 5);
  if (!v71) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v5 = *((unsigned __int16 *)this + 9);
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v135 = 0u;
  uint64_t v70 = v5;
  if (v5)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v109 = v3;
      uint64_t v110 = v6;
      unint64_t v7 = 0;
      int v8 = *a3;
      int v9 = a3[1];
      int v10 = v9 + *a3;
      int v11 = a3[2];
      int v12 = a3[3];
      int v14 = a3[4];
      int v13 = a3[5];
      int v15 = v10 + v11 + v12;
      int v102 = v15;
      int v96 = v15 + v14;
      int v103 = v15 + v14 + v13;
      int v17 = a3[6];
      int v16 = a3[7];
      int v19 = a3[8];
      int v18 = a3[9];
      int v20 = v18 + v19 + v16;
      int v21 = a3[10];
      int v22 = a3[11];
      int v105 = a3;
      int v121 = v11 - v10 + v12;
      int v101 = v121 - v14 + v13;
      int v111 = v21 + v19 + v16;
      int v130 = v21 + v20 + v22;
      int v129 = v21 + v20;
      v134[0] = v130 + v103 + v17;
      v134[1] = v101 - v17 - v111 + v22 + v18;
      int v119 = v10 + v11 - v12;
      int v100 = v119 - (v13 + v14);
      int v132 = v22 + v19 + v16;
      int v117 = v19 + v16;
      int v114 = v11 - v10 - v12;
      int v99 = v114 + v14 - v13;
      int v131 = v20;
      v134[2] = v21 + v18 + v100 + v17 - v132;
      v134[3] = v20 + v99 - v17 - (v22 + v21);
      int v113 = v12 - (v10 + v11);
      int v90 = v113 - v14 + v13;
      int v108 = v90 - v17;
      int v127 = v22 + v20;
      int v23 = v10 - v11;
      int v98 = v23 + v12;
      int v87 = v13 + v14 + v23 + v12;
      int v107 = v87 + v17;
      int v116 = v21 + v18 + v22;
      v134[4] = v21 + v90 - v17 - (v22 + v20);
      v134[5] = v19 + v16 + v87 + v17 - v116;
      int v86 = v14 - v13 - v15;
      int v94 = v23 - v12;
      int v85 = v23 - v12 - (v13 + v14);
      v134[6] = v111 + v22 + v86 - v17 - v18;
      v134[7] = v85 + v17 - (v21 + v20) + v22;
      int v24 = v9 - v8;
      int v25 = v8 - v9;
      int v26 = v9 - v8 - v11;
      int v27 = v26 - v12;
      int v95 = v13 + v14 + v26 - v12;
      int v112 = v21 + v19;
      int v28 = v25 - v11 - v12;
      int v106 = v28 - v14 + v13 - v17;
      int v29 = v18 + v19;
      int v125 = v22 + v21 + v18 + v19 - v16;
      v134[8] = v18 + v16 + v95 + v17 - (v21 + v19) + v22;
      v134[9] = v125 + v106;
      int v30 = v26 + v12;
      int v92 = v30 - (v13 + v14);
      int v93 = v28 - v14 + v13;
      int v124 = v22 + v21 + v16;
      int v31 = v25 - v11 + v12;
      int v89 = v31 + v14 - v13;
      int v118 = v21 + v18 + v16;
      int v123 = v22 + v19;
      v134[10] = v18 + v19 + v92 + v17 - v124;
      v134[11] = v118 + v89 - v17 - (v22 + v19);
      int v32 = v25 + v11;
      int v33 = v24 + v11;
      int v84 = v32 - v12 - v14 + v13;
      int v126 = v19;
      int v128 = v18 + v16 + v21;
      int v34 = v33 - v12;
      int v83 = v13 + v14 + v33 - v12;
      v134[12] = v19 + v84 - v17 - (v128 + v22);
      v134[13] = v21 + v16 + v83 + v17 - (v22 + v18 + v19);
      int v35 = v32 + v12;
      int v36 = v33 + v12;
      int v82 = v32 + v12 + v14 - v13;
      int v81 = v33 + v12 - (v13 + v14);
      int v133 = v22 + v21 + v19;
      v134[14] = v82 - v17 - (v18 + v19 + v21) + v22 + v16;
      v134[15] = v81 + v17 - (v18 + v16) + v133;
      int v80 = v27 - (v13 + v14);
      int v78 = v28 + v14 - v13;
      int v104 = v78 + v17;
      v134[16] = v80 - v17 - (v21 + v18) + v132;
      v134[17] = v78 + v17 - v20 + v22 + v21;
      int v76 = v13 + v14 + v30;
      int v77 = v31 - v14 + v13;
      v134[18] = v76 - v17 - v130;
      v134[19] = v111 + v77 + v17 - (v22 + v18);
      int v37 = v32 - v12 + v14 - v13;
      int v38 = v34 - (v13 + v14);
      v134[20] = v18 + v37 + v17 - (v111 + v22);
      v134[21] = v21 + v20 + v38 - v17 - v22;
      int v39 = v35 - v14 + v13;
      int v40 = v13 + v14 + v36;
      v134[22] = v22 + v20 + v39 + v17 - v21;
      v134[23] = v116 + v40 - v17 - v117;
      int v75 = v102 - (v13 + v14);
      int v74 = v121 + v14 - v13;
      v134[24] = v75 - v17 - v29 + v124;
      v134[25] = v74 + v17 - v128 + v22 + v126;
      int v73 = v13 + v14 + v119;
      int v122 = v22 + v18 + v16;
      int v72 = v114 - v14 + v13;
      int v120 = v29 + v21 + v22;
      v134[26] = v112 + v73 - v17 - v122;
      v134[27] = v72 + v17 + v16 - v120;
      int v41 = v113 + v14 - v13;
      int v115 = v29 - v16 + v21;
      int v42 = v98 - (v13 + v14);
      v134[28] = v41 + v17 - v22 + v115;
      v134[29] = v18 + v16 + v42 - v17 - (v112 + v22);
      int v43 = v13 - v96;
      int v44 = v13 + v14 + v94;
      int v97 = v13 - v96 + v17;
      v134[30] = v118 + v22 + v97 - v126;
      v134[31] = v29 + v44 - v17 - (v21 + v16) + v22;
      v134[32] = v21 + v37 - v17 - v127;
      v134[33] = v117 + v38 + v17 - v116;
      v134[34] = v111 + v22 + v39 - v17 - v18;
      v134[35] = v40 + v17 - v129 + v22;
      int v79 = v78 - v17;
      v134[36] = v130 + v80 + v17;
      v134[37] = v79 - v111 + v22 + v18;
      v134[38] = v21 + v18 + v76 + v17 - v132;
      v134[39] = v131 + v77 - v17 - (v22 + v21);
      v134[40] = v126 + v41 - v17 - (v128 + v22);
      v134[41] = v21 + v16 + v42 + v17 - (v22 + v29);
      v134[42] = v43 - v17 - (v29 + v21) + v22 + v16;
      v134[43] = v44 + v17 - (v18 + v16) + v133;
      v134[44] = v18 + v16 + v75 + v17 - v112 + v22;
      v134[45] = v125 + v74 - v17;
      v134[46] = v29 + v73 + v17 - v124;
      v134[47] = v118 + v72 - v17 - v123;
      int v91 = v90 + v17;
      int v88 = v87 - v17;
      v134[48] = v18 + v91 - (v111 + v22);
      v134[49] = v129 + v88 - v22;
      v134[50] = v127 + v86 + v17 - v21;
      v134[51] = v116 + v85 - v17 - v117;
      v134[52] = v103 - v17 - (v21 + v18) + v132;
      v134[53] = v101 + v17 - v131 + v22 + v21;
      v134[54] = v100 - v17 - v130;
      v134[55] = v111 + v99 + v17 - (v22 + v18);
      v134[56] = v84 + v17 - v22 + v115;
      v134[57] = v18 + v16 + v83 - v17 - (v112 + v22);
      v134[58] = v118 + v22 + v82 + v17 - v126;
      v134[59] = v29 + v81 - v17 - (v21 + v16) + v22;
      v134[60] = v95 - v17 - v29 + v124;
      v134[61] = v93 + v17 - v128 + v123;
      v134[62] = v112 + v92 - v17 - v122;
      v134[63] = v89 + v17 + v16 - v120;
      v134[64] = v118 + v22 - v126 + v85 - v17;
      v134[65] = v29 + v86 + v17 - (v21 + v16) + v22;
      v134[66] = v88 - v22 + v115;
      v134[67] = v18 + v16 + v91 - (v112 + v22);
      v134[68] = v112 + v99 + v17 - v122;
      v134[69] = v100 - v17 + v16 - v120;
      v134[70] = v101 + v17 - v29 + v124;
      v134[71] = v103 - v17 - v128 + v123;
      v134[72] = v127 + v81 - v17 - v21;
      v134[73] = v116 + v82 + v17 - v117;
      v134[74] = v18 + v83 - v17 - (v111 + v22);
      v134[75] = v129 + v84 + v17 - v22;
      v134[76] = v89 + v17 - v130;
      v134[77] = v111 + v92 - v17 - (v22 + v18);
      v134[78] = v93 + v17 - (v21 + v18) + v132;
      v134[79] = v95 - v17 - v131 + v22 + v21;
      v134[80] = v40 + v17 - (v29 + v21) + v22 + v16;
      v134[81] = v39 - v17 - (v18 + v16) + v133;
      v134[82] = v38 + v17 + v126 - (v128 + v22);
      v134[83] = v21 + v16 + v37 - v17 - (v22 + v29);
      LODWORD(v135) = v29 + v77 - v17 - v124;
      DWORD1(v135) = v118 + v76 + v17 - v123;
      DWORD2(v135) = v18 + v16 + v79 - v112 + v22;
      HIDWORD(v135) = v125 + v80 + v17;
      LODWORD(v136) = v111 + v22 + v44 + v17 - v18;
      DWORD1(v136) = v43 - v17 - v129 + v22;
      DWORD2(v136) = v21 + v42 + v17 - v127;
      HIDWORD(v136) = v117 + v41 - v17 - v116;
      LODWORD(v137) = v21 + v18 + v72 - v17 - v132;
      DWORD1(v137) = v131 + v73 + v17 - (v22 + v21);
      DWORD2(v137) = v130 + v74 - v17;
      HIDWORD(v137) = v75 + v17 - v111 + v22 + v18;
      LODWORD(v138) = v112 + v77 + v17 - v122;
      DWORD1(v138) = v76 - v17 + v16 - v120;
      DWORD2(v138) = v104 - v29 + v124;
      HIDWORD(v138) = v80 - v17 - v128 + v123;
      LODWORD(v139) = v118 + v22 - v126 + v40 - v17;
      DWORD1(v139) = v29 + v39 + v17 - (v21 + v16) + v22;
      DWORD2(v139) = v38 - v17 - v22 + v115;
      HIDWORD(v139) = v18 + v16 + v37 + v17 - (v112 + v22);
      LODWORD(v140) = v72 + v17 - v130;
      DWORD1(v140) = v111 + v73 - v17 - (v22 + v18);
      DWORD2(v140) = v74 + v17 - (v21 + v18) + v132;
      HIDWORD(v140) = v75 - v17 - v131 + v22 + v21;
      LODWORD(v141) = v127 + v44 - v17 - v21;
      DWORD1(v141) = v116 + v97 - v117;
      DWORD2(v141) = v18 + v42 - v17 - (v111 + v22);
      HIDWORD(v141) = v129 + v41 + v17 - v22;
      LODWORD(v142) = v29 + v99 - v17 - v124;
      DWORD1(v142) = v118 + v100 + v17 - v123;
      DWORD2(v142) = v18 + v16 + v101 - v17 - v112 + v22;
      HIDWORD(v142) = v125 + v103 + v17;
      LODWORD(v143) = v85 + v17 - (v29 + v21) + v22 + v16;
      DWORD1(v143) = v86 - v17 - (v18 + v16) + v133;
      DWORD2(v143) = v126 + v107 - (v128 + v22);
      HIDWORD(v143) = v21 + v16 + v108 - (v22 + v29);
      LODWORD(v144) = v21 + v18 + v89 - v17 - v132;
      DWORD1(v144) = v131 + v92 + v17 - (v22 + v21);
      DWORD2(v144) = v130 + v106;
      HIDWORD(v144) = v95 + v17 - v111 + v22 + v18;
      LODWORD(v145) = v111 + v22 + v81 + v17 - v18;
      DWORD1(v145) = v82 - v17 - v129 + v22;
      DWORD2(v145) = v21 + v83 + v17 - v127;
      HIDWORD(v145) = v117 + v84 - v17 - v116;
      uint64_t v45 = v4;
      uint64_t v4 = v109;
      unint64_t v46 = (int *)(v71 + 32 * v110);
LABEL_8:
      int v47 = 0;
      unint64_t v48 = v7 >> 1;
      int v49 = (unsigned int *)(v45 + 4 * (v7 >> 1));
      int v50 = (_DWORD *)((char *)v134 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v52 = *v50++;
        int v51 = v52;
        uint64_t v53 = 4 * v7;
        int v54 = *(_DWORD *)(v109 + 4 * v7);
        int v55 = *(_DWORD *)(v109 + ((4 * v7) | 4));
        BOOL v56 = v54 <= v55;
        if (v54 <= v55) {
          int v54 = *(_DWORD *)(v109 + ((4 * v7) | 4));
        }
        unsigned int v57 = v54 + v51;
        if (__OFADD__(v54, v51)) {
          unsigned int v57 = ((v54 + v51) >> 31) ^ 0x80000000;
        }
        *int v49 = v57;
        BOOL v58 = __OFSUB__(v54, v51);
        signed int v59 = v54 - v51;
        if (v58) {
          signed int v59 = (v59 >> 31) ^ 0x80000000;
        }
        v49[256] = v59;
        int v60 = (4 * v47) | (2 * v56);
        int v61 = *(_DWORD *)(v109 + (v53 | 8));
        int v62 = *(_DWORD *)(v109 + (v53 | 0xC));
        BOOL v63 = v61 <= v62;
        if (v61 > v62) {
          int v62 = v61;
        }
        int v47 = v60 | v63;
        unsigned int v64 = v62 - v51;
        if (__OFSUB__(v62, v51)) {
          unsigned int v64 = ((v62 - v51) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v45 + ((4 * v48) | 4)) = v64;
        BOOL v58 = __OFADD__(v62, v51);
        signed int v65 = v62 + v51;
        if (v58) {
          signed int v65 = (v65 >> 31) ^ 0x80000000;
        }
        v49[257] = v65;
        if ((~(_BYTE)v7 & 0x3C) == 0)
        {
          *v46++ = v47;
          BOOL v66 = v7 >= 0x1FC;
          v7 += 4;
          if (v66) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v48 += 2;
        v49 += 2;
        BOOL v66 = v7 >= 0x1FC;
        v7 += 4;
      }
      while (!v66);
      if (v47) {
        *unint64_t v46 = v47;
      }
LABEL_30:
      a3 = v105 + 12;
      uint64_t v6 = v110 + 1;
      uint64_t v3 = v45;
    }
    while (v110 + 1 != v70);
  }
  else
  {
    uint64_t v45 = v3;
  }
  uint64_t v67 = 0;
  *((void *)this + 8) = v45;
  *((void *)this + 9) = v4;
  return v67;
}

uint64_t TailbiteConvCode::forwardViterbiMax_R13C9(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  uint64_t v203 = *MEMORY[0x263EF8340];
  uint64_t v78 = *((void *)this + 5);
  if (!v78) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 9);
  if (!v4) {
    return 4;
  }
  if (!a3) {
    return 3;
  }
  uint64_t v5 = *((unsigned __int16 *)this + 9);
  long long v202 = 0u;
  long long v201 = 0u;
  long long v200 = 0u;
  long long v199 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  long long v192 = 0u;
  uint64_t v77 = v5;
  if (v5)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v150 = v3;
      uint64_t v151 = v6;
      unint64_t v7 = 0;
      int v8 = *a3;
      int v9 = a3[1];
      int v10 = v9 + *a3;
      int v11 = a3[2];
      int v12 = a3[3];
      int v14 = a3[4];
      int v13 = a3[5];
      int v15 = v10 + v11 + v12;
      int v153 = v15;
      int v165 = v15 + v14;
      int v16 = a3[6];
      int v17 = a3[7];
      int v149 = v15 + v14 + v13 + v16;
      int v18 = a3[9];
      int v185 = a3[8];
      int v169 = v18 + v185 + v17;
      int v158 = v11 - v10 + v12;
      int v138 = v158 - v14 + v13;
      int v20 = a3[10];
      int v19 = a3[11];
      int v160 = v20 + v185 + v17;
      int v152 = a3;
      int v21 = a3[12];
      int v148 = v18 + v138 - v16;
      int v171 = v20 + v169 + v19;
      int v156 = v20 + v169;
      v191[0] = v171 + v21 + v149;
      v191[1] = v148 - v160 + v21 + v19;
      int v136 = v10 + v11 - v12;
      int v132 = v136 - (v13 + v14);
      int v186 = v20 + v18;
      int v181 = v19 + v185 + v17;
      int v135 = v11 - v10 - v12;
      int v129 = v135 + v14 - v13;
      v191[2] = v20 + v18 + v132 + v16 - v181 + v21;
      v191[3] = v21 + v169 + v129 - v16 - (v19 + v20);
      int v127 = v12 - (v10 + v11);
      int v115 = v127 - v14 + v13;
      int v189 = v19 + v169;
      int v190 = v21 + v20;
      int v22 = v20;
      int v23 = v10 - v11;
      int v125 = v23 + v12;
      int v113 = v13 + v14 + v23 + v12;
      int v147 = v113 + v16;
      int v162 = v20 + v18 + v19;
      int v170 = v185 + v17;
      int v180 = v21 + v185 + v17;
      v191[4] = v115 - v16 - (v19 + v169) + v21 + v20;
      v191[5] = v113 + v16 - v162 + v180;
      int v111 = v14 - v13 - v15;
      int v146 = v111 - v16;
      int v168 = v21 + v19 + v185 + v17;
      int v124 = v23 - v12;
      int v110 = v23 - v12 - (v13 + v14);
      v191[6] = v168 + v111 - v16 - v18 + v20;
      v191[7] = v110 + v16 - (v20 + v169) + v21 + v19;
      int v24 = v9 - v8;
      int v25 = v8 - v9;
      int v26 = v9 - v8 - v11;
      int v120 = v13 + v14 + v26 - v12;
      int v187 = v20 + v185;
      int v145 = v21 + v20 + v185;
      int v184 = v18 + v17;
      int v178 = v19 + v18 + v17;
      int v166 = v25 - v11 - v12;
      int v119 = v166 - v14 + v13;
      int v175 = v18 + v185 - v17;
      int v27 = v19 + v20;
      int v144 = v27 + v175;
      v191[8] = v178 + v120 + v16 - v145;
      v191[9] = v27 + v175 + v119 - v16 - v21;
      int v118 = v26 + v12 - (v13 + v14);
      int v164 = v27 + v21;
      int v28 = v17;
      int v143 = v27 + v21 + v17;
      int v29 = v25 - v11 + v12;
      int v116 = v29 + v14 - v13;
      int v188 = v186 + v17;
      int v179 = v21 + v19 + v185;
      v191[10] = v18 + v185 + v118 + v16 - v143;
      v191[11] = v186 + v17 + v116 - v16 - v179;
      int v30 = v25 + v11;
      int v31 = v24 + v11;
      int v98 = v30 - v12 - v14 + v13;
      int v32 = v18 + v17;
      int v173 = v18 + v17 + v22;
      int v183 = v173 + v19;
      int v133 = v173 + v19 + v21;
      int v33 = v31 - v12;
      int v97 = v13 + v14 + v31 - v12;
      int v182 = v19 + v18 + v185;
      int v174 = v22 + v28;
      v191[12] = v185 + v98 - v16 - v133;
      v191[13] = v22 + v28 + v97 + v16 - (v182 + v21);
      int v34 = v30 + v12;
      int v35 = v31 + v12;
      int v96 = v30 + v12 + v14 - v13;
      int v172 = v18 + v185 + v22;
      int v123 = v19 + v28;
      int v95 = v35 - (v13 + v14);
      int v177 = v27 + v185;
      int v121 = v21 + v32;
      v191[14] = v19 + v28 + v96 - v16 - (v21 + v172);
      v191[15] = v27 + v185 + v95 + v16 - (v21 + v32);
      int v108 = v26 - v12 - (v13 + v14);
      int v142 = v108 - v16;
      int v101 = v166 + v14 - v13;
      int v141 = v101 + v16;
      int v99 = v27;
      v191[16] = v181 + v108 - v16 - (v21 + v186);
      v191[17] = v27 + v101 + v16 - (v21 + v169);
      int v103 = v29 - v14 + v13;
      int v105 = v13 + v14 + v26 + v12;
      int v130 = v103 + v16;
      int v155 = v18;
      int v161 = v19 + v18;
      int v107 = v19 + v18 + v21;
      int v131 = v105 - v16;
      v191[18] = v105 - v16 - (v171 + v21);
      v191[19] = v160 + v103 + v16 - v107;
      int v36 = v30 - v12 + v14 - v13;
      int v167 = v160 + v19;
      int v100 = v160 + v19 + v21;
      int v37 = v33 - (v13 + v14);
      int v38 = v21 + v19;
      v191[20] = v18 + v36 + v16 - v100;
      v191[21] = v156 + v37 - v16 - (v21 + v19);
      int v39 = v34 - v14 + v13;
      int v40 = v13 + v14 + v35;
      v191[22] = v19 + v169 + v39 + v16 - v190;
      v191[23] = v162 + v40 - v16 - v180;
      int v90 = v153 - (v13 + v14);
      int v134 = v90 - v16;
      int v154 = v27 + v28;
      int v94 = v27 + v28 + v21;
      int v163 = v18 + v185;
      int v87 = v158 + v14 - v13;
      int v128 = v87 + v16;
      v191[24] = v94 + v90 - v16 - (v18 + v185);
      v191[25] = v87 + v16 - v173 + v179;
      int v83 = v13 + v14 + v136;
      int v126 = v83 - v16;
      int v81 = v135 - v14 + v13;
      int v122 = v81 + v16;
      v191[26] = v187 + v83 - v16 - v178 + v21;
      v191[27] = v81 + v16 - (v172 + v19) + v21 + v28;
      int v41 = v127 + v14 - v13;
      int v159 = v175 + v22;
      int v86 = v175 + v22 + v21;
      int v42 = v125 - (v13 + v14);
      v191[28] = v41 + v16 - v19 + v86;
      v191[29] = v32 + v42 - v16 - (v187 + v19) + v21;
      int v43 = v13 + v14 + v124;
      int v117 = v13 - v165 + v16 + v21 + v19;
      v191[30] = v188 - v185 + v117;
      v191[31] = v21 + v19 + v163 + v43 - v16 - (v22 + v28);
      int v137 = v19 + v169 + v21;
      v191[32] = v22 + v36 - v16 - v137;
      v191[33] = v170 + v37 + v16 - (v162 + v21);
      v191[34] = v160 + v19 + v39 - v16 - (v21 + v155);
      v191[35] = v19 + v40 + v16 - (v21 + v156);
      int v93 = v108 + v16;
      int v92 = v101 - v16;
      v191[36] = v171 + v108 + v16 - v21;
      v191[37] = v161 + v101 - v16 - (v21 + v160);
      int v89 = v105 + v16;
      int v85 = v103 - v16;
      int v44 = v27 + v21;
      v191[38] = v186 + v105 + v16 - v168;
      v191[39] = v169 + v103 - v16 - (v27 + v21);
      int v157 = v28;
      int v109 = v190 + v28;
      v191[40] = v41 - v16 - (v173 + v19) + v21 + v185;
      v191[41] = v42 + v16 - v182 + v190 + v28;
      int v104 = v21 + v19 + v28;
      int v106 = v21 + v27 + v185;
      v191[42] = v13 - v165 - v16 - v172 + v104;
      v191[43] = v43 + v16 - v184 + v106;
      int v91 = v90 + v16 + v155;
      int v88 = v87 - v16;
      int v102 = v175 + v22 + v21 + v19;
      v191[44] = v91 - v187 + v104;
      v191[45] = v102 + v88;
      int v84 = v83 + v16;
      int v82 = v81 - v16;
      int v80 = v19 + v185;
      v191[46] = v21 + v163 + v84 - (v27 + v28);
      v191[47] = v188 + v82 - (v19 + v185) + v21;
      int v114 = v113 - v16;
      v191[48] = v115 + v16 - (v160 + v19) + v21 + v155;
      v191[49] = v156 + v114 - v19 + v21;
      int v112 = v111 + v16;
      int v45 = v21 + v19 + v110 - v16;
      v191[50] = v19 + v169 + v112 - v22 + v21;
      v191[51] = v186 - v170 + v45;
      int v46 = v165 + v13 - v16;
      int v47 = v138 + v16;
      v191[52] = v168 + v46 - v186;
      v191[53] = v44 + v138 + v16 - v169;
      v191[54] = v132 - v16 - v171 + v21;
      v191[55] = v160 + v129 + v16 - v161 + v21;
      int v48 = v187 + v19;
      int v140 = v187 + v19 + v21;
      v191[56] = v175 + v22 + v98 + v16 - (v21 + v19);
      v191[57] = v184 + v97 - v16 - v140;
      int v49 = v19;
      int v139 = v188 + v19;
      int v176 = v19 + v175;
      int v79 = v19;
      v191[58] = v188 + v19 + v96 + v16 - (v21 + v185);
      v191[59] = v176 + v95 - v16 - v190;
      v191[60] = v99 + v157 + v120 - v16 - (v21 + v163);
      v191[61] = v19 + v185 + v119 + v16 - (v21 + v173);
      int v50 = v172 + v19;
      int v51 = v172 + v19 + v21;
      v191[62] = v187 + v118 - v16 - (v178 + v21);
      v191[63] = v116 + v16 + v157 - v51;
      v191[64] = v188 - v185 + v45;
      v191[65] = v38 + v163 + v112 - v174;
      v191[66] = v114 - v49 + v86;
      v191[67] = v184 + v115 + v16 - v48 + v21;
      v191[68] = v187 + v129 + v16 - v178 + v21;
      v191[69] = v132 - v16 - v50 + v21 + v157;
      v191[70] = v94 + v47 - v163;
      v191[71] = v46 - v173 + v179;
      v191[72] = v189 + v95 - v16 - v190;
      v191[73] = v162 + v96 + v16 - v180;
      v191[74] = v155 + v97 - v16 - v100;
      v191[75] = v156 + v98 + v16 - v38;
      v191[76] = v116 + v16 - (v171 + v21);
      v191[77] = v160 + v118 - v16 - v107;
      v191[78] = v181 + v119 + v16 - (v21 + v186);
      v191[79] = v99 + v120 - v16 - (v21 + v169);
      v191[80] = v123 + v40 + v16 - (v21 + v172);
      v191[81] = v177 + v39 - v16 - v121;
      v191[82] = v37 + v16 + v185 - v133;
      v191[83] = v174 + v36 - v16 - (v182 + v21);
      LODWORD(v192) = v163 + v85 - v143;
      DWORD1(v192) = v188 + v89 - v179;
      DWORD2(v192) = v178 + v92 - v145;
      HIDWORD(v192) = v144 + v93 - v21;
      LODWORD(v193) = v168 + v43 + v16 - v155 + v22;
      DWORD1(v193) = v13 - v165 - v16 - v156 + v38;
      DWORD2(v193) = v42 + v16 - v189 + v190;
      HIDWORD(v193) = v41 - v16 - v162 + v180;
      LODWORD(v194) = v186 + v82 - v181 + v21;
      DWORD1(v194) = v21 + v169 + v84 - v99;
      DWORD2(v194) = v171 + v21 + v88;
      HIDWORD(v194) = v91 - v160 + v38;
      LODWORD(v195) = v187 + v130 - (v178 + v21);
      DWORD1(v195) = v131 + v157 - v51;
      DWORD2(v195) = v154 + v141 - (v21 + v163);
      HIDWORD(v195) = v80 + v142 - (v21 + v173);
      LODWORD(v196) = v139 + v40 - v16 - (v21 + v185);
      DWORD1(v196) = v176 + v39 + v16 - v190;
      DWORD2(v196) = v159 + v37 - v16 - v38;
      HIDWORD(v196) = v184 + v36 + v16 - v140;
      LODWORD(v197) = v122 - v171 + v21;
      DWORD1(v197) = v160 + v126 - v161 + v21;
      DWORD2(v197) = v168 + v128 - v186;
      HIDWORD(v197) = v164 + v134 - v169;
      LODWORD(v198) = v189 + v43 - v16 - v22 + v21;
      DWORD1(v198) = v186 - v170 + v117;
      DWORD2(v198) = v42 - v16 - v167 + v21 + v155;
      HIDWORD(v198) = v156 + v41 + v16 - v79 + v21;
      LODWORD(v199) = v21 + v163 + v129 - v16 - v154;
      DWORD1(v199) = v188 + v132 + v16 - v80 + v21;
      DWORD2(v199) = v148 - v187 + v104;
      HIDWORD(v199) = v102 + v149;
      LODWORD(v200) = v110 + v16 - v172 + v104;
      DWORD1(v200) = v146 - v184 + v106;
      DWORD2(v200) = v147 - v183 + v21 + v185;
      HIDWORD(v200) = v115 - v16 - v182 + v109;
      LODWORD(v201) = v186 + v116 - v16 - v168;
      DWORD1(v201) = v169 + v118 + v16 - v164;
      DWORD2(v201) = v171 + v119 - v16 - v21;
      HIDWORD(v201) = v161 + v120 + v16 - (v21 + v160);
      LODWORD(v202) = v167 + v95 + v16 - (v21 + v155);
      DWORD1(v202) = v79 + v96 - v16 - (v21 + v156);
      DWORD2(v202) = v22 + v97 + v16 - v137;
      HIDWORD(v202) = v170 + v98 - v16 - (v162 + v21);
      uint64_t v52 = v4;
      uint64_t v4 = v150;
      uint64_t v53 = (int *)(v78 + 32 * v151);
LABEL_8:
      int v54 = 0;
      unint64_t v55 = v7 >> 1;
      BOOL v56 = (unsigned int *)(v52 + 4 * (v7 >> 1));
      unsigned int v57 = (_DWORD *)((char *)v191 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
      do
      {
        int v59 = *v57++;
        int v58 = v59;
        uint64_t v60 = 4 * v7;
        int v61 = *(_DWORD *)(v150 + 4 * v7);
        int v62 = *(_DWORD *)(v150 + ((4 * v7) | 4));
        BOOL v63 = v61 <= v62;
        if (v61 <= v62) {
          int v61 = *(_DWORD *)(v150 + ((4 * v7) | 4));
        }
        unsigned int v64 = v61 + v58;
        if (__OFADD__(v61, v58)) {
          unsigned int v64 = ((v61 + v58) >> 31) ^ 0x80000000;
        }
        *BOOL v56 = v64;
        BOOL v65 = __OFSUB__(v61, v58);
        signed int v66 = v61 - v58;
        if (v65) {
          signed int v66 = (v66 >> 31) ^ 0x80000000;
        }
        v56[256] = v66;
        int v67 = (4 * v54) | (2 * v63);
        int v68 = *(_DWORD *)(v150 + (v60 | 8));
        int v69 = *(_DWORD *)(v150 + (v60 | 0xC));
        BOOL v70 = v68 <= v69;
        if (v68 > v69) {
          int v69 = v68;
        }
        int v54 = v67 | v70;
        unsigned int v71 = v69 - v58;
        if (__OFSUB__(v69, v58)) {
          unsigned int v71 = ((v69 - v58) >> 31) ^ 0x80000000;
        }
        *(_DWORD *)(v52 + ((4 * v55) | 4)) = v71;
        BOOL v65 = __OFADD__(v69, v58);
        signed int v72 = v69 + v58;
        if (v65) {
          signed int v72 = (v72 >> 31) ^ 0x80000000;
        }
        v56[257] = v72;
        if ((~(_BYTE)v7 & 0x3C) == 0)
        {
          *v53++ = v54;
          BOOL v73 = v7 >= 0x1FC;
          v7 += 4;
          if (v73) {
            goto LABEL_30;
          }
          goto LABEL_8;
        }
        v55 += 2;
        v56 += 2;
        BOOL v73 = v7 >= 0x1FC;
        v7 += 4;
      }
      while (!v73);
      if (v54) {
        *uint64_t v53 = v54;
      }
LABEL_30:
      a3 = v152 + 13;
      uint64_t v6 = v151 + 1;
      uint64_t v3 = v52;
    }
    while (v151 + 1 != v77);
  }
  else
  {
    uint64_t v52 = v3;
  }
  uint64_t v74 = 0;
  *((void *)this + 8) = v52;
  *((void *)this + 9) = v4;
  return v74;
}

uint64_t TailbiteConvCode::forwardViterbiMax(TailbiteConvCode *this, unsigned int a2, int *a3)
{
  if (!a3) {
    return 3;
  }
  uint64_t v3 = *((void *)this + 5);
  if (!v3) {
    return 4;
  }
  uint64_t v4 = *((void *)this + 8);
  if (!v4) {
    return 4;
  }
  uint64_t v5 = *((void *)this + 9);
  if (!v5) {
    return 4;
  }
  if (!a2) {
    return 0;
  }
  int v6 = 0;
  do
  {
    uint64_t v7 = v5;
    uint64_t v5 = v4;
    if (*((_DWORD *)this + 2))
    {
      unsigned int v8 = 0;
      char v9 = 0;
      int v10 = (int *)(v3 + 4 * (*((_DWORD *)this + 13) * v6));
      while (2)
      {
        int v11 = 0;
        while (1)
        {
          if (*(int *)this < 1)
          {
            signed int v13 = 0;
          }
          else
          {
            unsigned __int16 v12 = 0;
            signed int v13 = 0;
            do
            {
              unsigned int v14 = *(_WORD *)(*((void *)this + 3) + 2 * v12) & (v8 >> 1);
              unsigned int v15 = v14 ^ (v14 >> 8) ^ ((v14 ^ (v14 >> 8)) >> 4);
              unsigned int v16 = v15 ^ (v15 >> 2) ^ ((v15 ^ (v15 >> 2)) >> 1);
              int v17 = a3[v12];
              unsigned int v18 = v13 + v17;
              if (__OFADD__(v13, v17)) {
                unsigned int v18 = ((v13 + v17) >> 31) ^ 0x80000000;
              }
              BOOL v19 = __OFSUB__(v13, v17);
              v13 -= v17;
              if (v19) {
                signed int v13 = (v13 >> 31) ^ 0x80000000;
              }
              if ((v16 & 1) == 0) {
                signed int v13 = v18;
              }
              ++v12;
            }
            while (*(_DWORD *)this > (int)v12);
          }
          unsigned int v20 = v8 >> 1;
          int v21 = *((_DWORD *)this + 3);
          int v22 = 2 * v11;
          int v23 = *(_DWORD *)(v5 + 4 * v8);
          int v24 = *(_DWORD *)(v5 + 4 * (v8 + 1));
          if (v23 <= v24)
          {
            unsigned int v27 = v24 + v13;
            if (__OFADD__(v24, v13)) {
              unsigned int v27 = ((v24 + v13) >> 31) ^ 0x80000000;
            }
            *(_DWORD *)(v7 + 4 * v20) = v27;
            BOOL v19 = __OFSUB__(v24, v13);
            signed int v26 = v24 - v13;
            unsigned int v28 = ((v24 - v13) >> 31) ^ 0x80000000;
            if (v19) {
              signed int v26 = v28;
            }
            v22 |= 1u;
          }
          else
          {
            unsigned int v25 = v23 + v13;
            if (__OFADD__(v23, v13)) {
              unsigned int v25 = ((v23 + v13) >> 31) ^ 0x80000000;
            }
            *(_DWORD *)(v7 + 4 * v20) = v25;
            BOOL v19 = __OFSUB__(v23, v13);
            signed int v26 = v23 - v13;
            if (v19) {
              signed int v26 = (v26 >> 31) ^ 0x80000000;
            }
          }
          uint64_t v29 = (unsigned __int16)(v21 + v20);
          *(_DWORD *)(v7 + 4 * v29) = v26;
          int v30 = *(_DWORD *)(v5 + 4 * (v8 + 2));
          int v31 = *(_DWORD *)(v5 + 4 * (v8 + 3));
          int v11 = 2 * v22;
          uint64_t v32 = v20 + 1;
          uint64_t v33 = (v29 + 1);
          unsigned int v34 = v31 - v13;
          if (__OFSUB__(v31, v13)) {
            unsigned int v34 = ((v31 - v13) >> 31) ^ 0x80000000;
          }
          unsigned int v35 = v31 + v13;
          if (__OFADD__(v31, v13)) {
            unsigned int v35 = ((v31 + v13) >> 31) ^ 0x80000000;
          }
          unsigned int v36 = v30 - v13;
          if (__OFSUB__(v30, v13)) {
            unsigned int v36 = ((v30 - v13) >> 31) ^ 0x80000000;
          }
          BOOL v19 = __OFADD__(v30, v13);
          signed int v37 = v30 + v13;
          if (v19) {
            signed int v37 = (v37 >> 31) ^ 0x80000000;
          }
          BOOL v38 = v30 <= v31;
          if (v30 > v31) {
            unsigned int v39 = v36;
          }
          else {
            unsigned int v39 = v34;
          }
          if (v38)
          {
            signed int v37 = v35;
            v11 |= 1u;
          }
          *(_DWORD *)(v7 + 4 * v32) = v39;
          *(_DWORD *)(v7 + 4 * v33) = v37;
          if ((v9 & 0x3F) == 0x3C) {
            break;
          }
          char v9 = v8 + 4;
          unsigned int v8 = (unsigned __int16)(v8 + 4);
          if (v8 >= *((_DWORD *)this + 2))
          {
            a3 += *(int *)this;
            if (v11) {
              *int v10 = v11 << -*((unsigned char *)this + 12);
            }
            goto LABEL_52;
          }
        }
        *v10++ = v11;
        char v9 = v8 + 4;
        unsigned int v8 = (unsigned __int16)(v8 + 4);
        if (v8 < *((_DWORD *)this + 2)) {
          continue;
        }
        break;
      }
    }
    a3 += *(int *)this;
LABEL_52:
    ++v6;
    uint64_t v4 = v7;
  }
  while (a2 > (unsigned __int16)v6);
  uint64_t v40 = 0;
  *((void *)this + 8) = v7;
  *((void *)this + 9) = v5;
  return v40;
}

uint64_t TailbiteConvCode::subtractMax(TailbiteConvCode *this, int *a2)
{
  uint64_t v2 = (int *)*((void *)this + 8);
  if (!v2) {
    return 4;
  }
  int v3 = *v2;
  *a2 = *v2;
  unint64_t v4 = *((unsigned int *)this + 2);
  if (v4 >= 2)
  {
    for (unint64_t i = 1; i < v4; ++i)
    {
      int v6 = v2[i];
      if (v6 > v3)
      {
        *a2 = v6;
        unint64_t v4 = *((unsigned int *)this + 2);
        int v3 = v6;
      }
    }
  }
  if (v3 == 0x7FFFFFFF) {
    return 5;
  }
  for (; v4; --v4)
  {
    signed int v8 = *v2 - *a2;
    if (__OFSUB__(*v2, *a2)) {
      signed int v8 = (v8 >> 31) ^ 0x80000000;
    }
    *v2++ = v8;
  }
  return 0;
}

uint64_t TailbiteConvCode::backtrackBestPathTailbite(TailbiteConvCode *this, unsigned __int8 *a2)
{
  if (!a2) {
    return 3;
  }
  uint64_t v2 = *((void *)this + 5);
  if (!v2) {
    return 4;
  }
  uint64_t v3 = *((void *)this + 8);
  if (!v3) {
    return 4;
  }
  unsigned int v4 = *((_DWORD *)this + 2);
  if (v4 < 2)
  {
    LOWORD(v5) = 0;
  }
  else
  {
    LOWORD(v5) = 0;
    for (unsigned __int16 i = 1; i < v4; ++i)
    {
      if (*(_DWORD *)(v3 + 4 * i) > *(_DWORD *)(v3 + 4 * (unsigned __int16)v5)) {
        LOWORD(v5) = i;
      }
    }
  }
  uint64_t v8 = *((unsigned __int16 *)this + 9);
  if (*((_WORD *)this + 9))
  {
    int v9 = ~(-1 << (*((_DWORD *)this + 1) - 1));
    int v10 = 2 * v8;
    int v11 = *((_DWORD *)this + 13);
    int v12 = v11 * (2 * v8 - 1);
    do
    {
      --v10;
      int v5 = (*(_DWORD *)(v2 + 4 * (v12 + ((unsigned __int16)(v5 & v9) >> 5))) >> ~(v5 & v9)) & 1 | (2 * (unsigned __int16)(v5 & v9));
      v12 -= v11;
    }
    while (v10 > (int)v8);
    uint64_t v13 = v8 - 1;
    do
    {
      int v5 = (unsigned __int16)v5;
      a2[v13] = ((unsigned __int16)v5 >> (*((_DWORD *)this + 1) - 1)) & 1;
      int v5 = (*(_DWORD *)(*((void *)this + 5)
                      + 4 * (*((_DWORD *)this + 13) * v13 + ((v5 & v9) >> 5))) >> ~(v5 & v9)) & 1 | (2 * (v5 & v9));
      unint64_t v14 = v13-- + 1;
    }
    while (v14 > 1);
  }
  return 0;
}

void TailbiteConvCode924::~TailbiteConvCode924(TailbiteConvCode **this)
{
  uint64_t v2 = *this;
  if (v2)
  {
    TailbiteConvCode::~TailbiteConvCode(v2);
    MEMORY[0x22A6A4700]();
  }
  uint64_t v3 = this[1];
  if (v3) {
    MEMORY[0x22A6A46F0](v3, 0x1000C80BDFB0063);
  }
}

void TailbiteConvCode924::Init(TailbiteConvCode924 *this, unsigned int a2, char a3)
{
  *((unsigned char *)this + 20) = a3;
  *((_WORD *)this + 9) = a2;
  *((unsigned char *)this + 21) = 0x39C / a2;
  *((_WORD *)this + 8) = (0x39C / a2) * (_WORD)a2;
  operator new[]();
}

void TranslationStage::~TranslationStage(PhaseDeviation **this)
{
  char v1 = *this;
  if (v1)
  {
    PhaseDeviation::~PhaseDeviation(v1);
    MEMORY[0x22A6A4700]();
  }
}

uint64_t TranslationStage::GetBlockTranslationPD(PhaseDeviation **a1, const __int16 *a2, int32x4_t *a3)
{
  if (!a2) {
    return 2;
  }
  int v6 = *a1;
  PhaseDeviation::doPhaseEstimation(*a1, a2, (const int (*)[4])&a3[1]);
  uint64_t v10 = 0;
  *((void *)v6 + 17) = a2;
  do
  {
    *(_DWORD *)((char *)v6 + v10 * 4 + 144) = a3[1].i32[v10];
    ++v10;
  }
  while (v10 != 4);
  PhaseDeviation::Calc1DWith2DSparseRefinement(*a1, 1, v7, v8, v9);
  int v11 = *((unsigned __int8 *)*a1 + 4);
  v12.i16[0] = *(_WORD *)*a1;
  v12.i16[2] = *((_WORD *)*a1 + 1);
  *((_DWORD *)a1 + 2) = -87163 * *((_DWORD *)*a1 + 4) + ((402 * *((_DWORD *)*a1 + 2) + 32) >> 6);
  a3[3].i32[0] = 3;
  if (v11)
  {
    int32x2_t v13 = (int32x2_t)a3[1].u64[1];
    v14.i64[0] = a3[1].i64[0];
    int32x2_t v15 = vneg_s32(vshr_n_s32(vadd_s32(vsra_n_s32((int32x2_t)vand_s8(v12, (int8x8_t)0xFFFF0000FFFFLL), vadd_s32(vsub_s32(v13, *(int32x2_t *)v14.i8), (int32x2_t)0x1000000010), 5uLL), (int32x2_t)0x2000000020), 6uLL));
    a3[2].u64[1] = (unint64_t)v15;
    a3[3].i8[4] = 0;
    v14.u64[1] = (unint64_t)v13;
    *a3 = vnegq_s32(*a3);
    a3[1] = vnegq_s32(v14);
    __int32 v16 = a3[2].i32[1];
    int v17 = v15.i32[1];
    int v18 = v15.i32[0];
    if (v16 < 0) {
      __int32 v19 = v16 + 0x4000;
    }
    else {
      __int32 v19 = v16 - 0x4000;
    }
    a3[2].i32[1] = v19;
  }
  else
  {
    int v18 = (((a3[1].i32[2] - a3[1].i32[0] + 16) >> 5) + v12.u16[0] + 32) >> 6;
    int v17 = (((a3[1].i32[3] - a3[1].i32[1] + 16) >> 5) + v12.u16[2] + 32) >> 6;
    a3[2].i32[2] = v18;
    a3[2].i32[3] = v17;
    a3[3].i8[4] = 1;
  }
  if (v18 >= 513)
  {
    if (v18 >= 1536) {
      int v21 = 1536;
    }
    else {
      int v21 = v18;
    }
    int v18 = v18 - ((v18 - v21 + 1023) & 0xFFFFFC00) - 1024;
    a3[2].i32[2] = v18;
  }
  if (v18 <= -513)
  {
    if (v18 <= -1536) {
      int v22 = -1536;
    }
    else {
      int v22 = v18;
    }
    a3[2].i32[2] = v18 + ((v22 - v18 + 1023) & 0xFFFFFC00) + 1024;
  }
  if (v17 >= 513)
  {
    if (v17 >= 1536) {
      int v23 = 1536;
    }
    else {
      int v23 = v17;
    }
    int v17 = v17 - ((v17 - v23 + 1023) & 0xFFFFFC00) - 1024;
    a3[2].i32[3] = v17;
  }
  if (v17 > -513) {
    return 0;
  }
  uint64_t result = 0;
  if (v17 <= -1536) {
    int v24 = -1536;
  }
  else {
    int v24 = v17;
  }
  a3[2].i32[3] = v17 + ((v24 - v17 + 1023) & 0xFFFFFC00) + 1024;
  return result;
}

uint64_t UVBlockConfig::downsampleAndPadd(UVBlockConfig *this, unsigned int a2)
{
  if (!*((unsigned char *)this + 16)) {
    return 5;
  }
  uint64_t v3 = *((void *)this + 30);
  if (!v3) {
    return 3;
  }
  if (a2 > 3) {
    return 2;
  }
  switch(a2)
  {
    case 0u:
      if (!*((void *)this + 6 * a2 + 8))
      {
        int v30 = *((unsigned __int16 *)this + 124);
        int v31 = (_DWORD *)((char *)this + 48 * a2);
        int v32 = *((unsigned __int16 *)this + 125);
        v31[20] = v32;
        v31[21] = v30;
        int v33 = *((unsigned __int16 *)this + 21);
        int v34 = v30 + 2 * v33;
        *((unsigned char *)this + 40) = 1;
        v31[18] = v32 + 2 * v33;
        v31[19] = v34;
        v31[22] = v34;
        v31[23] = 1;
        operator new[]();
      }
      int v35 = *((_DWORD *)this + 67);
      BOOL v36 = v35 == 1;
      if (v35 == 1) {
        unsigned __int16 v37 = HIWORD(*((_DWORD *)this + 65));
      }
      else {
        unsigned __int16 v37 = *((_DWORD *)this + 65);
      }
      if (v36) {
        unsigned __int16 v38 = *((_DWORD *)this + 65);
      }
      else {
        unsigned __int16 v38 = HIWORD(*((_DWORD *)this + 65));
      }
      convertUV2SignalSpace_Hx16W_N64(v3, *((unsigned __int16 *)this + 126), *((void *)this + 6 * a2 + 7), *((unsigned __int16 *)this + 24 * a2 + 44), *((unsigned __int16 *)this + 125), *((unsigned __int16 *)this + 124) >> 4, v38 | (v37 << 16), *((__int16 *)this + 132));
      break;
    case 1u:
      if (!*((void *)this + 6 * a2 + 8))
      {
        unsigned int v39 = *((unsigned __int16 *)this + 125);
        uint64_t v40 = (_DWORD *)((char *)this + 48 * a2);
        int v41 = (*((unsigned __int16 *)this + 124) >> 1) & 0x7FF8;
        v40[20] = v39 >> 1;
        v40[21] = v41;
        int v42 = 2 * *((unsigned __int16 *)this + 21);
        v40[18] = v42 + (v39 >> 1);
        v40[19] = v41 + v42;
        operator new[]();
      }
      int v5 = (char *)this + 48 * a2;
      uint64_t v6 = *((void *)v5 + 7);
      int v7 = *((_DWORD *)v5 + 22);
      int v43 = (char *)this + 48 * a2;
      uint64_t v44 = *((unsigned __int16 *)v43 + 40);
      unsigned int v45 = *((_DWORD *)v43 + 21);
      uint64_t v46 = *((unsigned __int16 *)this + 132);
      uint64_t v47 = *((unsigned int *)this + 65);
      int v48 = *((_DWORD *)this + 67);
      BOOL v49 = v48 == 1;
      if (v48 == 1) {
        __int16 v50 = *((_DWORD *)this + 65);
      }
      else {
        __int16 v50 = HIWORD(*((_DWORD *)this + 65));
      }
      if (v49) {
        LODWORD(v47) = (v47 | (unint64_t)(v46 << 32)) >> 16;
      }
      convertUVDownsample_2x2_2Hx16W_N64(v3, *((unsigned __int16 *)this + 126), v6, (unsigned __int16)v7, v44, (unsigned __int16)(v45 >> 3), ((int)((v47 + (((__int16)v47 >> 29) & 3)) << 16) >> 2) & 0xFFFF0000 | (unsigned __int16)((__int16)(v50 + ((v50 >> 29) & 3)) >> 2), (__int16)v46);
      break;
    case 2u:
      if (!*((void *)this + 6 * a2 + 8))
      {
        unsigned __int16 v11 = *((_WORD *)this + 125);
        int8x8_t v12 = (_DWORD *)((char *)this + 48 * a2);
        unsigned int v13 = (*((unsigned __int16 *)this + 124) / 3u) & 0x7FF8;
        v12[20] = v11 / 3u;
        v12[21] = v13;
        int v14 = 2 * *((unsigned __int16 *)this + 21);
        v12[18] = v14 + v11 / 3u;
        v12[19] = v13 + v14;
        operator new[]();
      }
      unsigned __int8 v8 = (char *)this + 48 * a2;
      uint64_t v9 = *((void *)v8 + 7);
      int v10 = *((_DWORD *)v8 + 22);
      int32x2_t v15 = (char *)this + 48 * a2;
      uint64_t v16 = *((unsigned __int16 *)v15 + 40);
      unsigned int v17 = *((_DWORD *)v15 + 21);
      int v18 = *((_DWORD *)this + 65);
      int v19 = *((_DWORD *)this + 67);
      BOOL v20 = v19 == 1;
      if (v19 == 1) {
        __int16 v21 = *((_DWORD *)this + 65);
      }
      else {
        __int16 v21 = HIWORD(*((_DWORD *)this + 65));
      }
      if (v20) {
        LOWORD(v18) = HIWORD(*((_DWORD *)this + 65));
      }
      convertUVDownsample_3x3_3Hx24W_N64(v3, *((unsigned __int16 *)this + 126), v9, (unsigned __int16)v10, v16, (unsigned __int16)(v17 >> 3), (unsigned __int16)(v21 / 9) | ((unsigned __int16)((__int16)v18 / 9) << 16), *((__int16 *)this + 132));
      break;
    case 3u:
      if (!*((void *)this + 6 * a2 + 8))
      {
        unsigned int v22 = *((unsigned __int16 *)this + 125);
        int v23 = (_DWORD *)((char *)this + 48 * a2);
        int v24 = (*((unsigned __int16 *)this + 124) >> 2) & 0x3FF8;
        v23[20] = v22 >> 2;
        v23[21] = v24;
        int v25 = 2 * *((unsigned __int16 *)this + 21);
        v23[18] = v25 + (v22 >> 2);
        v23[19] = v24 + v25;
        operator new[]();
      }
      int v26 = *((_DWORD *)this + 67);
      BOOL v27 = v26 == 1;
      if (v26 == 1) {
        unsigned __int16 v28 = HIWORD(*((_DWORD *)this + 65));
      }
      else {
        unsigned __int16 v28 = *((_DWORD *)this + 65);
      }
      if (v27) {
        unsigned __int16 v29 = *((_DWORD *)this + 65);
      }
      else {
        unsigned __int16 v29 = HIWORD(*((_DWORD *)this + 65));
      }
      convertUVDownsample_4x4_4Hx32W_N64(v3, *((unsigned __int16 *)this + 126), *((void *)this + 6 * a2 + 7), (unsigned __int16)*((_DWORD *)this + 12 * a2 + 22), *((unsigned __int16 *)this + 24 * a2 + 40), (unsigned __int16)(*((_DWORD *)this + 12 * a2 + 21) >> 3), v29 | (v28 << 16), *((__int16 *)this + 132));
      break;
    default:
      return 0;
  }
  return 0;
}

void UVBlockConfig::~UVBlockConfig(UVBlockConfig *this)
{
  CachedGrayBlockConfig::~CachedGrayBlockConfig(this);
  JUMPOUT(0x22A6A4700);
}

void UVPredistortBlockConfig::UVPredistortBlockConfig(uint64_t a1, uint64_t a2, __int16 a3, __int16 a4)
{
  __int16 v6 = 2 * a4;
  int v7 = (unsigned __int16)(2 * a4);
  uint64_t v8 = CachedGrayBlockConfig::CachedGrayBlockConfig(a1, a3, a4, 1, v7, 0, 0);
  *(void *)uint64_t v8 = &unk_26DD18190;
  *(_WORD *)(v8 + 264) = WORD2(a2);
  *(_DWORD *)(v8 + 260) = a2;
  *(_DWORD *)(v8 + 268) = 0;
  if (v7) {
    *(_WORD *)(a1 + 252) = v6;
  }
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)a1 = &unk_26DD18210;
  *(void *)(a1 + 280) = 10;
  *(_DWORD *)(a1 + 288) = 10;
  operator new[]();
}

void sub_228A5BB58(_Unwind_Exception *a1)
{
  uint64_t v3 = *((void *)v1 + 37);
  if (v3) {
    MEMORY[0x22A6A46F0](v3, 0x1000C80E0EAB150);
  }
  uint64_t v4 = *((void *)v1 + 34);
  if (v4) {
    MEMORY[0x22A6A46F0](v4, 0x1000C803E1C8BA9);
  }
  CachedGrayBlockConfig::~CachedGrayBlockConfig(v1);
  _Unwind_Resume(a1);
}

void UVPredistortBlockConfig::~UVPredistortBlockConfig(UVPredistortBlockConfig *this)
{
  *(void *)this = &unk_26DD18210;
  uint64_t v2 = *((void *)this + 43);
  if (v2) {
    MEMORY[0x22A6A46F0](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 40);
  if (v3) {
    MEMORY[0x22A6A46F0](v3, 0x1000C80E0EAB150);
  }
  uint64_t v4 = *((void *)this + 37);
  if (v4) {
    MEMORY[0x22A6A46F0](v4, 0x1000C80E0EAB150);
  }
  uint64_t v5 = *((void *)this + 34);
  if (v5) {
    MEMORY[0x22A6A46F0](v5, 0x1000C803E1C8BA9);
  }
  CachedGrayBlockConfig::~CachedGrayBlockConfig(this);
}

{
  uint64_t vars8;

  UVPredistortBlockConfig::~UVPredistortBlockConfig(this);
  JUMPOUT(0x22A6A4700);
}

uint64_t UVPredistortBlockConfig::Initialize(UVPredistortBlockConfig *this)
{
  uint64_t v2 = BlockConfigBase::resizeBlockConfigArray(this, 0xAu);
  if (!v2)
  {
    *((unsigned char *)this + 16) = 1;
    operator new[]();
  }
  return v2;
}

uint64_t UVPredistortBlockConfig::AddBlock(UVPredistortBlockConfig *this, uint64_t a2, int a3, int a4, float a5, float a6, float a7)
{
  unsigned int v10 = a2;
  uint64_t v12 = CachedGrayBlockConfig::AddBlock(this, a2, a3, a4);
  if (!v12)
  {
    unsigned int v17 = *((_DWORD *)this + 71);
    if (v17 == *((_DWORD *)this + 70)) {
      operator new[]();
    }
    int v18 = (float *)(*((void *)this + 34) + 12 * v17);
    *int v18 = a5;
    v18[1] = a6;
    v18[2] = a7;
    *((_DWORD *)this + 71) = v17 + 1;
    unsigned int v19 = *((unsigned __int16 *)this + 125) / v10;
    unsigned int v20 = *((unsigned __int16 *)this + 124) / v10;
    UVPredistortBlockConfig::calcHomography((UVPredistortBlockConfig *)&v30, (uint64_t)this, (*((unsigned char *)this + 32) - 1), 0x80u, 0x80u, v19, v20, v13, v14, v15, v16);
    v29[0] = v30;
    v29[1] = v31;
    *(void *)&double v21 = DMCVector<Homography>::Append((uint64_t)this + 296, (uint64_t)v29).n128_u64[0];
    UVPredistortBlockConfig::calcHomography((UVPredistortBlockConfig *)&v27, (uint64_t)this, (*((unsigned char *)this + 32) - 1), 0x1E0u, 0x1E0u, v19, v20, v21, v22, v23, v24);
    long long v30 = v27;
    long long v31 = v28;
    v26[0] = v27;
    v26[1] = v28;
    DMCVector<Homography>::Append((uint64_t)this + 320, (uint64_t)v26);
  }
  return v12;
}

void UVPredistortBlockConfig::calcHomography(UVPredistortBlockConfig *this, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, double a8, float a9, float a10, float a11)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a2 + 284) <= a3) {
    unsigned int v12 = 0;
  }
  else {
    unsigned int v12 = a3;
  }
  double v13 = (float *)(*(void *)(a2 + 272) + 12 * v12);
  float v14 = v13[1];
  if (v14 == 0.0 || (float v15 = *v13, *v13 == 0.0))
  {
    uint64_t v55 = 0;
    uint64_t v56 = 0x3F80000000000000;
    *(void *)&long long v57 = 0;
    *((void *)&v57 + 1) = 0x3F80000000000000;
    float v54 = 1.0;
    int v26 = &v54;
  }
  else
  {
    float v20 = v13[2];
    uint64_t v21 = *(void *)(*(void *)(a2 + 24) + 8 * a3);
    LOWORD(a9) = *(_WORD *)(v21 + 2);
    LOBYTE(a10) = *(unsigned char *)v21;
    float v22 = (float)LODWORD(a10);
    LOWORD(a11) = *(_WORD *)(v21 + 4);
    float v54 = *v13;
    LODWORD(v55) = 0;
    *((float *)&v55 + 1) = (float)LODWORD(a9) * v22;
    LODWORD(v56) = 0;
    *((float *)&v56 + 1) = v15;
    *(float *)&long long v57 = v22 * (float)LODWORD(a11);
    *(void *)((char *)&v57 + 4) = 0;
    HIDWORD(v57) = 1065353216;
    memset(v53, 0, sizeof(v53));
    float v23 = inv_3x3_float_matrix(v53, &v54);
    LOBYTE(v23) = *(unsigned char *)v21;
    float v48 = (float)LODWORD(v23);
    uint64_t v49 = 0;
    int v50 = 0;
    float v51 = (float)LODWORD(v23);
    long long v52 = xmmword_228A91DE0;
    memset(v47, 0, 36);
    inv_3x3_float_matrix(v47, &v48);
    uint64_t v41 = 1065353216;
    uint64_t v43 = 0x3F80000000000000;
    float v42 = (float)((float)a7 - (float)a5) * 0.5;
    float v44 = (float)((float)a6 - (float)a4) * 0.5;
    uint64_t v45 = 0;
    int v46 = 1065353216;
    __float2 v24 = __sincosf_stret((float)(v20 * 3.1415) / 180.0);
    __float2 v25 = __sincosf_stret((float)(v14 * 3.1415) / 180.0);
    v35[0] = v24.__cosval;
    v35[1] = v24.__sinval;
    v35[2] = 0.0;
    v35[3] = -v24.__sinval;
    v35[4] = v24.__cosval;
    long long v36 = xmmword_228A91DE0;
    long long v29 = xmmword_228A91DE0;
    long long v30 = xmmword_228A91DF0;
    float cosval = v25.__cosval;
    float v32 = -v25.__sinval;
    int v33 = 0;
    __float2 v34 = v25;
    v27[0] = v24.__cosval;
    v27[1] = -v24.__sinval;
    int16x8_t v27[2] = 0.0;
    __float2 v28 = v24;
    mul_3x3_float_matrices((uint64_t)v40, (float *)&v30, v35);
    mul_3x3_float_matrices((uint64_t)v38, v27, v40);
    v38[2] = 0.0;
    v38[5] = 0.0;
    v38[8] = 1.0;
    inv_3x3_float_matrix(v37, v38);
    mul_3x3_float_matrices((uint64_t)v40, &v48, (float *)&v41);
    mul_3x3_float_matrices((uint64_t)v39, v53, v40);
    mul_3x3_float_matrices((uint64_t)v40, v37, v39);
    mul_3x3_float_matrices((uint64_t)v39, &v54, v40);
    mul_3x3_float_matrices((uint64_t)v40, v47, v39);
    int v26 = v40;
  }
  Homography::Homography(this, v26);
}

__n128 DMCVector<Homography>::Append(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 12);
  if (v2 == *(_DWORD *)(a1 + 8)) {
    operator new[]();
  }
  uint64_t v3 = (_OWORD *)(*(void *)a1 + 32 * v2);
  __n128 result = *(__n128 *)a2;
  long long v5 = *(_OWORD *)(a2 + 16);
  _OWORD *v3 = *(_OWORD *)a2;
  v3[1] = v5;
  ++*(_DWORD *)(a1 + 12);
  return result;
}

uint64_t UVPredistortBlockConfig::ExtractBlock1stStage(uint64_t a1, unsigned int a2, uint64_t *a3, _WORD *a4, __int32 *a5)
{
  if (!a3) {
    return 3;
  }
  if (*(_DWORD *)(a1 + 32) <= a2) {
    return 2;
  }
  if (!*(unsigned char *)(a1 + 16) || !*(void *)(a1 + 344)) {
    return 5;
  }
  if (*(_DWORD *)(a1 + 284) <= a2) {
    unsigned int v10 = 0;
  }
  else {
    unsigned int v10 = a2;
  }
  uint64_t v11 = *(void *)(a1 + 272) + 12 * v10;
  if (*(float *)(v11 + 4) == 0.0 && *(float *)(v11 + 8) == 0.0)
  {
    return CachedGrayBlockConfig::ExtractBlock1stStage(a1, 0, a3, a4, a5);
  }
  else
  {
    int v13 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 72))(a1, **(unsigned __int8 **)(*(void *)(a1 + 24) + 8 * a2));
    if (*(_DWORD *)(a1 + 308) <= a2) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = a2;
    }
    uint64_t v15 = *(void *)(a1 + 296) + 32 * v14;
    long long v25 = *(_OWORD *)v15;
    uint64_t v26 = *(void *)(v15 + 16);
    uint64_t v16 = a1 + 48 * v13;
    uint64_t v17 = *(void *)(v16 + 64);
    uint64_t v18 = *(void *)(a1 + 344);
    if (v17) {
      BOOL v19 = v18 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    if (!v19)
    {
      int v20 = *(_DWORD *)(v16 + 88);
      int v21 = *(_DWORD *)(v16 + 76);
      if ((unsigned __int16)v21 <= (unsigned __int16)v20)
      {
        int v22 = *(_DWORD *)(v15 + 24);
        int v23 = *(_DWORD *)(v15 + 28);
        int v24 = *(_DWORD *)(v16 + 72);
        v31[4] = setZero_16x16_G;
        v31[1] = calculateRowTransforms_16_G;
        v31[0] = calculateColTransforms_16_G;
        v31[2] = invertPTBilinearX_16x16_G;
        v31[3] = invertPTBilinearY_16x16_G;
        if (v22)
        {
          if (!v23)
          {
            long long v27 = v25;
            uint64_t v28 = v26;
            int v29 = v22;
            int v30 = 0;
            InvertPTBilinearX_16Hx16W(v17, (unsigned __int16)v20, (unsigned __int16)v24, (unsigned __int16)v21, v18, 128, (uint64_t)&v27, 8u, 8u, (uint64_t)v31);
          }
        }
        else
        {
          long long v27 = v25;
          uint64_t v28 = v26;
          int v29 = 0;
          int v30 = v23;
          InvertPTBilinearY_16Hx16W(v17, (unsigned __int16)v20, (unsigned __int16)v24, (unsigned __int16)v21, v18, 128, (uint64_t)&v27, 8u, 8u, (uint64_t)v31);
        }
        uint64_t v18 = *(void *)(a1 + 344);
      }
    }
    uint64_t result = 0;
    *a3 = v18;
    *a4 = 128;
    *a5 = 1;
  }
  return result;
}

uint64_t UVPredistortBlockConfig::ExtractBlockReadStage(uint64_t a1, unsigned int a2, uint64_t *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8)
{
  if (!*(unsigned char *)(a1 + 16)) {
    return 5;
  }
  if (!a3) {
    return 3;
  }
  if (*(_DWORD *)(a1 + 32) <= a2) {
    return 2;
  }
  if (*(_DWORD *)(a1 + 284) <= a2) {
    unsigned int v16 = 0;
  }
  else {
    unsigned int v16 = a2;
  }
  uint64_t v17 = *(void *)(a1 + 272) + 12 * v16;
  if (*(float *)(v17 + 4) == 0.0 && *(float *)(v17 + 8) == 0.0)
  {
    return CachedGrayBlockConfig::ExtractBlockReadStage(a1, 0, a3, a4, a5, a6, a7, a8);
  }
  else
  {
    int v19 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 72))(a1, **(unsigned __int8 **)(*(void *)(a1 + 24) + 8 * a2));
    if (*(_DWORD *)(a1 + 332) <= a2) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = a2;
    }
    uint64_t v21 = *(void *)(a1 + 320) + 32 * v20;
    long long v31 = *(_OWORD *)v21;
    uint64_t v32 = *(void *)(v21 + 16);
    uint64_t v22 = a1 + 48 * v19;
    uint64_t v23 = *(void *)(v22 + 64);
    uint64_t v24 = *(void *)(a1 + 344);
    if (v23) {
      BOOL v25 = v24 == 0;
    }
    else {
      BOOL v25 = 1;
    }
    if (!v25)
    {
      int v26 = *(_DWORD *)(v22 + 88);
      int v27 = *(_DWORD *)(v22 + 76);
      if ((unsigned __int16)v27 <= (unsigned __int16)v26)
      {
        int v28 = *(_DWORD *)(v21 + 24);
        int v29 = *(_DWORD *)(v21 + 28);
        int v30 = *(_DWORD *)(v22 + 72);
        v37[4] = setZero_16x16_G;
        v37[1] = calculateRowTransforms_16_G;
        v37[0] = calculateColTransforms_16_G;
        v37[2] = invertPTBilinearX_16x16_G;
        v37[3] = invertPTBilinearY_16x16_G;
        if (v28)
        {
          if (!v29)
          {
            long long v33 = v31;
            uint64_t v34 = v32;
            int v35 = v28;
            int v36 = 0;
            InvertPTBilinearX_16Hx16W(v23, (unsigned __int16)v26, (unsigned __int16)v30, (unsigned __int16)v27, v24, 480, (uint64_t)&v33, 0x1Eu, 0x1Eu, (uint64_t)v37);
          }
        }
        else
        {
          long long v33 = v31;
          uint64_t v34 = v32;
          int v35 = 0;
          int v36 = v29;
          InvertPTBilinearY_16Hx16W(v23, (unsigned __int16)v26, (unsigned __int16)v30, (unsigned __int16)v27, v24, 480, (uint64_t)&v33, 0x1Eu, 0x1Eu, (uint64_t)v37);
        }
        uint64_t v24 = *(void *)(a1 + 344);
      }
    }
    uint64_t result = 0;
    *a3 = v24;
    *a4 = 480;
    *a5 = 480;
    *a6 = 240;
    *a7 = 240;
    *a8 = 1;
  }
  return result;
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x270F23D78]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x270F23D80]();
}

uint64_t CFDictionarySetInt64()
{
  return MEMORY[0x270F23DA8]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x270EE49E0]();
}

void CFRelease(CFTypeRef cf)
{
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x270EE7AA0]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x270EE7AA8](retstr, clock);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x270EE7D98](retstr, lhs, rhs);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x270EE7E08](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x270EE7E10](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x270EE7E38](retstr, *(void *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x270EE7EF8](retstr, start, duration);
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x270F23F20]();
}

uint64_t CUMainQueue()
{
  return MEMORY[0x270F23F58]();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EEA1A0](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1C8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA258](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x270EEA278](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x270F243B8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x270F243F8]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x270F244C0]();
}

uint64_t SecondsToUpTicks()
{
  return MEMORY[0x270F24688]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x270F24858]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__float cosval = v2;
  result.__sinval = v1;
  return result;
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}