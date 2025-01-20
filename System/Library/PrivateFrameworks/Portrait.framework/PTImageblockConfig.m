@interface PTImageblockConfig
+ ($3CC19D079FD0B010EE84973AA846B91B)adjustScissorRectToImageBlocks:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threads;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerGroup;
- (PTImageblockConfig)initWithPTTexture:(id)a3;
- (PTImageblockConfig)initWithPTTexture:(id)a3 outRect:;
- (PTImageblockConfig)initWithPTTexture:(id)a3 scissorRect:(id *)a4;
- (PTImageblockConfig)initWithTexture:(id)a3;
- (PTImageblockConfig)initWithTextureSize:(PTImageblockConfig *)self scissorRect:(SEL)a2 outRect:(id *)a3;
- (__n128)scissorRectOffset;
- (uint64_t)outOffset;
- (unint64_t)imageblockSize;
@end

@implementation PTImageblockConfig

- (PTImageblockConfig)initWithTexture:(id)a3
{
  memset(v9, 0, sizeof(v9));
  id v4 = a3;
  __int16 v5 = [v4 width];
  __int16 v6 = [v4 height];

  LOWORD(v8) = v5;
  HIWORD(v8) = v6;
  return [(PTImageblockConfig *)self initWithTextureSize:v8 scissorRect:v9 outRect:0.0];
}

- (PTImageblockConfig)initWithPTTexture:(id)a3
{
  memset(v9, 0, sizeof(v9));
  id v4 = a3;
  __int16 v5 = [v4 width];
  __int16 v6 = [v4 height];

  LOWORD(v8) = v5;
  HIWORD(v8) = v6;
  return [(PTImageblockConfig *)self initWithTextureSize:v8 scissorRect:v9 outRect:0.0];
}

- (PTImageblockConfig)initWithPTTexture:(id)a3 scissorRect:(id *)a4
{
  id v6 = a3;
  __int16 v7 = [v6 width];
  __int16 v8 = [v6 height];

  LOWORD(v11) = v7;
  HIWORD(v11) = v8;
  long long v9 = *(_OWORD *)&a4->var2;
  v12[0] = *(_OWORD *)&a4->var0;
  v12[1] = v9;
  return [(PTImageblockConfig *)self initWithTextureSize:v11 scissorRect:v12 outRect:0.0];
}

- (PTImageblockConfig)initWithPTTexture:(id)a3 outRect:
{
  double v4 = v3;
  memset(v11, 0, sizeof(v11));
  id v6 = a3;
  __int16 v7 = [v6 width];
  __int16 v8 = [v6 height];

  LOWORD(v10) = v7;
  HIWORD(v10) = v8;
  return [(PTImageblockConfig *)self initWithTextureSize:v10 scissorRect:v11 outRect:v4];
}

- (PTImageblockConfig)initWithTextureSize:(PTImageblockConfig *)self scissorRect:(SEL)a2 outRect:(id *)a3
{
  uint16x4_t v5 = v4;
  uint64_t v6 = v3;
  unsigned int v7 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PTImageblockConfig;
  __int16 v8 = [(PTImageblockConfig *)&v27 init];
  long long v9 = v8;
  if (v8)
  {
    *((void *)v8 + 3) = 16;
    *(int64x2_t *)(v8 + 56) = vdupq_n_s64(0x10uLL);
    *((void *)v8 + 9) = 1;
    if (*(void *)(v6 + 16) && *(void *)(v6 + 24))
    {
      int64x2_t v25 = 0u;
      long long v26 = 0u;
      long long v10 = *(_OWORD *)(v6 + 16);
      v24[0] = *(_OWORD *)v6;
      v24[1] = v10;
      +[PTImageblockConfig adjustScissorRectToImageBlocks:v24];
      int32x2_t v11 = vmovn_s64(v25);
      *((_WORD *)v9 + 5) = v11.i16[2];
      *((_WORD *)v9 + 4) = v11.i16[0];
      long long v12 = v26;
    }
    else
    {
      int8x16_t v13 = (int8x16_t)vmovl_u16(v5);
      int32x2_t v14 = (int32x2_t)vextq_s8(v13, v13, 8uLL).u64[0];
      int32x2_t v15 = vceqz_s32(v14);
      if (vorr_s8((int8x8_t)v15, (int8x8_t)vdup_lane_s32(v15, 1)).u8[0])
      {
        *((void *)v8 + 4) = (unsigned __int16)v7;
        *((void *)v8 + 5) = HIWORD(v7);
LABEL_9:
        *((void *)v9 + 6) = 1;
        v22 = v9;
        goto LABEL_10;
      }
      int32x2_t v16 = (int32x2_t)vand_s8(*(int8x8_t *)v13.i8, (int8x8_t)0xF0000000FLL);
      int32x2_t v17 = vneg_s32(v16);
      *((_WORD *)v8 + 7) = v17.i16[2];
      *((_WORD *)v8 + 6) = v17.i16[0];
      int8x8_t v18 = (int8x8_t)vdup_n_s32(0xFFF0u);
      int8x8_t v19 = vand_s8(*(int8x8_t *)v13.i8, v18);
      *((_WORD *)v8 + 9) = v19.i16[2];
      *((_WORD *)v8 + 8) = v19.i16[0];
      int8x8_t v20 = vand_s8((int8x8_t)vadd_s32(vadd_s32(v14, v16), (int32x2_t)0xF0000000FLL), v18);
      *(void *)&long long v21 = v20.u32[0];
      *((void *)&v21 + 1) = v20.u32[1];
      long long v12 = v21;
    }
    *((_OWORD *)v9 + 2) = v12;
    goto LABEL_9;
  }
LABEL_10:

  return (PTImageblockConfig *)v9;
}

+ ($3CC19D079FD0B010EE84973AA846B91B)adjustScissorRectToImageBlocks:(SEL)a3
{
  v4.i32[0] = a4->var0;
  v4.i32[1] = a4->var1;
  uint32x2_t v5 = (uint32x2_t)vand_s8(v4, (int8x8_t)0xF0000000FLL);
  unint64_t v6 = a4->var1 - v5.u32[1];
  retstr->var0 = a4->var0 - v5.u32[0];
  retstr->var1 = v6;
  *(int8x16_t *)&retstr->var2 = vandq_s8((int8x16_t)vaddq_s64((int64x2_t)vaddw_u32(*(uint64x2_t *)&a4->var2, v5), vdupq_n_s64(0xFuLL)), (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFFF0));
  return result;
}

- (__n128)scissorRectOffset
{
  LOWORD(v1) = *(_WORD *)(a1 + 8);
  WORD2(v1) = *(_WORD *)(a1 + 10);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (uint64_t)outOffset
{
  return *(void *)(a1 + 12);
}

- (unint64_t)imageblockSize
{
  return self->_imageblockSize;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threads
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 32);
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)threadsPerGroup
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 56);
  return self;
}

@end