@interface ARGB16F
@end

@implementation ARGB16F

vImage_Error __vImageGaussianBlur_ARGB16F_block_invoke(uint64_t a1, uint64_t a2, vImage_Buffer *dest)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(double *)(a1 + 32) == 0.0)
  {
    size_t v8 = (*(_DWORD *)(a2 + 4) + 7) >> 3;
    vImageCopyBuffer(*(const vImage_Buffer **)(a1 + 40), dest, v8, 0x10u);
    size_t rowBytes = dest->rowBytes;
    data = (char *)dest->data;
    vImagePixelCount height = dest->height;
    backgroundColor.data = (char *)dest->data + *(void *)(a1 + 56) * v8 + *(void *)(a1 + 64) * rowBytes;
    *(_OWORD *)&backgroundColor.vImagePixelCount height = *(_OWORD *)(a1 + 72);
    backgroundColor.size_t rowBytes = rowBytes;
    if ((char *)backgroundColor.data + backgroundColor.height * rowBytes > &data[height * rowBytes]) {
      __break(1u);
    }
    return vImageCopyBuffer(&backgroundColor, *(const vImage_Buffer **)(a1 + 48), v8, 0x10u);
  }
  else
  {
    unint64_t v5 = (2 * (unint64_t)fmax(ceilf(*(float *)(a1 + 88) * 3.0), 1.0)) | 1;
    v6 = (float *)((char *)&v12 - ((4 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    make1DGaussianKernel(v5, v6, *(float *)(a1 + 88));
    backgroundColor.data = 0;
    vImageConvolve_ARGB16F(*(const vImage_Buffer **)(a1 + 40), dest, 0, 0, 0, v6, 1u, v5, (const uint16_t *)&backgroundColor, 0x1018u);
    return vImageConvolve_ARGB16F(dest, *(const vImage_Buffer **)(a1 + 48), 0, *(void *)(a1 + 56), *(void *)(a1 + 64), v6, v5, 1u, (const uint16_t *)&backgroundColor, 0x1018u);
  }
}

uint64_t __vImageGaussianBlur_ARGB16F_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __vImageGaussianBlur_ARGB16F_block_invoke_3;
  v7[3] = &__block_descriptor_103_e79_v24__0r__vImage_CGImageFormat_II__CGColorSpace_II_di_8r__vImage_Buffer__vQQQ_16l;
  v7[4] = a3;
  char v13 = *(unsigned char *)(a1 + 100);
  long long v4 = *(_OWORD *)(a1 + 40);
  __int16 v14 = *(_WORD *)(a1 + 101);
  int v12 = *(_DWORD *)(a1 + 96);
  long long v5 = *(_OWORD *)(a1 + 56);
  long long v8 = v4;
  long long v9 = v5;
  long long v10 = *(_OWORD *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 88);
  return [v3 accessData:v7];
}

vImage_Error __vImageGaussianBlur_ARGB16F_block_invoke_3(uint64_t a1, int a2, vImage_Buffer *dest)
{
  v3 = dest;
  v16[2] = *MEMORY[0x1E4F143B8];
  v6 = *(const vImage_Buffer **)(a1 + 32);
  long long v5 = *(const vImage_Buffer **)(a1 + 40);
  v16[0] = v6;
  v16[1] = dest;
  if (*(unsigned char *)(a1 + 100)) {
    vImageScale_ARGB16F(v5, dest, 0, 0x1030u);
  }
  else {
    vImageCopyBuffer(v5, dest, (*(_DWORD *)(*(void *)(a1 + 48) + 4) + 7) >> 3, 0x10u);
  }
  if (*(unsigned char *)(a1 + 101))
  {
    vImageRotate90_ARGB16F(v3, v6, 2u, 0, 0x10u);
    uint64_t v7 = 1;
    long long v8 = v3;
    v3 = (vImage_Buffer *)v6;
  }
  else
  {
    uint64_t v7 = 0;
    long long v8 = v6;
  }
  if (*(unsigned char *)(a1 + 102))
  {
    unint64_t v9 = (2 * (unint64_t)fmax(ceilf(*(float *)(a1 + 96) * 3.0), 1.0)) | 1;
    long long v10 = (float *)((char *)&desta - ((4 * v9 + 15) & 0xFFFFFFFFFFFFFFF0));
    make1DGaussianKernel(v9, v10, *(float *)(a1 + 96));
    *(void *)vImage_Buffer backgroundColor = 0;
    vImageConvolve_ARGB16F(v3, v8, 0, 0, 0, v10, 1u, v9, backgroundColor, 0x1018u);
    uint64_t v11 = (const vImage_Buffer *)v16[v7];
    v3 = (vImage_Buffer *)v16[v7 ^ 1];
    desta.data = v3->data;
    *(int8x16_t *)&desta.vImagePixelCount height = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
    desta.size_t rowBytes = v3->rowBytes;
    vImageConvolve_ARGB16F(v11, &desta, 0, *(void *)(a1 + 72), *(void *)(a1 + 80), v10, v9, 1u, backgroundColor, 0x1018u);
  }
  memset(&desta, 0, sizeof(desta));
  desta.data = v3->data;
  *(int8x16_t *)&desta.vImagePixelCount height = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
  desta.size_t rowBytes = v3->rowBytes;
  int v12 = *(const vImage_Buffer **)(a1 + 88);
  if (*(unsigned char *)(a1 + 100)) {
    return vImageScale_ARGB16F(&desta, v12, 0, 0x1030u);
  }
  else {
    return vImageCopyBuffer(&desta, v12, (*(_DWORD *)(*(void *)(a1 + 48) + 4) + 7) >> 3, 0x10u);
  }
}

uint64_t __vImageSaturate_ARGB16F_block_invoke()
{
  return 1;
}

vImage_Error __vImageSaturate_ARGB16F_block_invoke_2(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ((a2[4] & 0x1F) != 1
    || *a2 != 32
    || ((v3 = *(int64x2_t *)(a3 + 8), v3.i64[0]) ? (BOOL v4 = v3.i64[1] == 0) : (BOOL v4 = 1), v4))
  {
    __break(1u);
  }
  float v5 = *(double *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)a3 + *(void *)(a1 + 40) * ((a2[1] + 7) >> 3);
  float matrix = (float)(v5 * 0.9278) + 0.0722;
  float v13 = (float)(v5 * -0.0722) + 0.0722;
  float v14 = v13;
  int v15 = 0;
  float32x2_t v16 = vmla_n_f32((float32x2_t)vdup_n_s32(0x3F371759u), (float32x2_t)0x3E91D14EBF371759, v5);
  __int32 v17 = v16.i32[0];
  int v18 = 0;
  float32x2_t v8 = vmla_n_f32((float32x2_t)vdup_n_s32(0x3E59B3D0u), (float32x2_t)0x3F498C7EBE59B3D0, v5);
  __int32 v19 = v8.i32[0];
  float32x2_t v20 = v8;
  uint64_t v22 = 0;
  uint64_t v21 = 0;
  int v23 = 1065353216;
  size_t v9 = *(void *)(a3 + 24);
  dest.data = (void *)(v7 + v6 * v9);
  *(int64x2_t *)&dest.vImagePixelCount height = vsubq_s64(v3, *(int64x2_t *)(a1 + 56));
  dest.size_t rowBytes = v9;
  return vImageMatrixMultiply_ARGBFFFF(&dest, &dest, &matrix, 0, 0, 0x10u);
}

uint64_t __vImageSaturate_ARGB16F_block_invoke_3()
{
  return 1;
}

uint64_t __vImageSaturate_ARGB16F_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64x2_t v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __vImageSaturate_ARGB16F_block_invoke_5;
  v6[3] = &__block_descriptor_80_e79_v24__0r__vImage_CGImageFormat_II__CGColorSpace_II_di_8r__vImage_Buffer__vQQQ_16l;
  v6[4] = a2;
  v6[5] = a3;
  long long v4 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = v4;
  return [v3 accessData:v6];
}

void *__vImageSaturate_ARGB16F_block_invoke_5(void *result, uint64_t a2, void *a3)
{
  uint64_t v3 = result[4];
  if (*(_DWORD *)v3 == *(_DWORD *)a2
    && (int v4 = *(_DWORD *)(v3 + 4), v4 == *(_DWORD *)(a2 + 4))
    && *(void *)(v3 + 8) == *(void *)(a2 + 8)
    && *(_DWORD *)(v3 + 16) == *(_DWORD *)(a2 + 16)
    && (float v5 = (void *)result[5], v6 = v5[1], v6 == a3[1])
    && (uint64_t v7 = v5[2], v7 == a3[2])
    && (size_t v8 = v5[3], v8 == a3[3]))
  {
    size_t v9 = (v4 + 7) >> 3;
    uint64_t v10 = result[9];
    vImagePixelCount v11 = v6 - result[8];
    size_t v12 = result[6] * v9;
    size_t v13 = result[7] * v8;
    src.data = (void *)(*v5 + v13 + v12);
    src.vImagePixelCount height = v11;
    src.width = v7 - v10;
    src.size_t rowBytes = v8;
    v14.data = (void *)(*a3 + v13 + v12);
    v14.vImagePixelCount height = v11;
    v14.width = v7 - v10;
    v14.size_t rowBytes = v8;
    return (void *)vImageCopyBuffer(&src, &v14, v9, 0x10u);
  }
  else
  {
    __break(1u);
  }
  return result;
}

@end