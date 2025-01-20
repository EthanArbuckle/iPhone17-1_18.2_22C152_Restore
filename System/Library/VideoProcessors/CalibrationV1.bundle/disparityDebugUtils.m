@interface disparityDebugUtils
+ (void)createPathIfNeeded:(id)a3;
- (disparityDebugUtils)initWithMetalContext:(id)a3;
- (void)ApplyColorWheelAndWrite:(unsigned int)a3 height:(unsigned int)a4 data:(float *)a5 fileFullPath:(const char *)a6;
- (void)WriteBinDataToFile:(void *)a3 length:(unsigned int)a4 fileFullPath:(const char *)a5;
- (void)computeRobustMinMaxForF16DisparityBuffer:(__CVBuffer *)a3 WithDisparityScale:(float)a4 AndPercentile:(float)a5 OutSignalMin:(float *)a6 OutSignalMax:(float *)a7;
- (void)convertRGB10A2ToRGBA8:(char *)a3 rbs:(unint64_t)a4 ToRGBA:(char *)a5 outWidth:(unsigned int)a6 outHeight:(unsigned int)a7;
- (void)convertVUYA444:(char *)a3 rbs:(unint64_t)a4 ToRGBA:(char *)a5 ofSize:(CGSize)a6;
- (void)save32BGRAPixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4;
- (void)save420CVPixelBuffer:(__CVBuffer *)a3 to:(const char *)a4;
- (void)saveAccumulationFrom:(id)a3 asBinaryFiles:(const char *)a4 forSize:(CGSize)a5 costLineSize:(unsigned __int16)a6;
- (void)saveF16Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 scale:(float)a5;
- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4;
- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsGrayScalePPMFile:(const char *)a4 range:;
- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4;
- (void)saveF16DisparityBufferAsTurbo:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 WithDisparityScale:(float)a5 AndPercentile:(float)a6;
- (void)saveF16DisparityBufferAsTurbo:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 WithMin:(float)a5 WithMax:(float)a6;
- (void)saveF16DisparityTexture:(id)a3 AsBinaryFile:(const char *)a4;
- (void)saveF16DisparityTexture:(id)a3 AsPPMFile:(const char *)a4;
- (void)saveF16RGTexture:(id)a3 AsBinaryFile:(const char *)a4;
- (void)saveF16Texture:(id)a3 AsF32BinaryFile:(const char *)a4;
- (void)saveF16Texture:(id)a3 AsGrayScalePPMFile:(const char *)a4 range:;
- (void)saveF16Texture:(id)a3 AsPPMFile:(const char *)a4;
- (void)saveF32Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4;
- (void)saveF32DisparityBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4;
- (void)saveF32FPBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 scale:(float)a5;
- (void)saveF32Texture:(id)a3 AsF32BinaryFile:(const char *)a4;
- (void)saveLumaTexture:(id)a3 to:(const char *)a4;
- (void)saveNCCOutputFrom:(id)a3 asBinaryFiles:(const char *)a4;
- (void)savePixelBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4;
- (void)saveRGB10A2PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4;
- (void)saveRGB10A2PixelBuffer:(__CVBuffer *)a3 AsPPMFileWithAlpha:(const char *)a4;
- (void)saveRGB10A2PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFile:(const char *)a6;
- (void)saveRGB10A2PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFileWithAlpha:(const char *)a6;
- (void)saveRGB10A2Texture:(id)a3 AsPPMFile:(const char *)a4;
- (void)saveRGBA16FTexture:(id)a3 AsF32File:(const char *)a4;
- (void)saveRGBA16FTexture:(id)a3 AsPPMFile:(const char *)a4;
- (void)saveRGBA8Texture:(id)a3 AsBinaryFile:(const char *)a4;
- (void)saveRGBA8Texture:(id)a3 AsPPMFile:(const char *)a4;
- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4;
- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 AsPPMFileWithAlpha:(const char *)a4;
- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFile:(const char *)a6;
- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFileWithAlpha:(const char *)a6;
- (void)saveRGBATexture:(id)a3 AsPPMFile:(const char *)a4;
- (void)saveRGF16ShiftmapTexture:(id)a3 AsPPMFileSx:(id)a4 AsPPMFileSy:(id)a5;
- (void)saveRGF16Texture:(id)a3 AsF32BinaryFile0:(id)a4 AsF32BinaryFile1:(id)a5;
- (void)saveRgbaF32PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4;
- (void)saveU16Texture:(id)a3 AsPGMFile:(const char *)a4;
- (void)saveU8Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4;
- (void)saveU8Texture:(id)a3 AsPGMFile:(const char *)a4;
- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4;
- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4;
- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsBinaryFile:(const char *)a6;
- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFile:(const char *)a6;
- (void)saveVUYA4444Texture:(id)a3 AsBinaryFile:(const char *)a4;
- (void)saveVUYA4444Texture:(id)a3 AsPPMFile:(const char *)a4;
@end

@implementation disparityDebugUtils

- (disparityDebugUtils)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)disparityDebugUtils;
  v6 = [(disparityDebugUtils *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metalContext, a3);
  }

  return v7;
}

- (void)saveF32DisparityBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);

  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v9, Width, Height, (uint64_t)BaseAddress, (uint64_t)a4);
}

- (void)saveF32FPBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 scale:(float)a5
{
  objc_super v9 = sub_262E6D3FC(a4, a2, (uint64_t)a3, (uint64_t)a4, v5, v6);
  if (v9)
  {
    v10 = v9;
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    v15 = malloc_type_malloc(3 * Width, 0x45A6691EuLL);
    unsigned int v25 = Width;
    fprintf(v10, "P6 %u %u 255\n", Width, Height);
    int v24 = Height;
    if (Height)
    {
      int v16 = 0;
      size_t v17 = Width;
      uint64_t v18 = BytesPerRow & 0xFFFFFFFC;
      uint64_t v19 = 4 * Width;
      do
      {
        v20 = v10;
        if (v25)
        {
          uint64_t v21 = 0;
          unsigned int v22 = 2;
          do
          {
            char v23 = vcvtms_s32_f32(fmaxf(fminf(powf(*(float *)&BaseAddress[v21], a5) * 255.0, 255.0), 0.0));
            v15[v22 - 2] = v23;
            v15[v22 - 1] = v23;
            v15[v22] = v23;
            v22 += 3;
            v21 += 4;
          }
          while (v19 != v21);
        }
        v10 = v20;
        fwrite(v15, 3uLL, v17, v20);
        ++v16;
        BaseAddress += v18;
      }
      while (v16 != v24);
    }
    free(v15);
    fclose(v10);
  }
}

- (void)saveF16Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 scale:(float)a5
{
  objc_super v9 = sub_262E6D3FC(a4, a2, (uint64_t)a3, (uint64_t)a4, v5, v6);
  if (v9)
  {
    v10 = v9;
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    v15 = malloc_type_malloc(3 * Width, 0x38B1F978uLL);
    unsigned int v31 = Width;
    fprintf(v10, "P6 %u %u 255\n", Width, Height);
    int v30 = Height;
    if (Height)
    {
      int v16 = 0;
      size_t v17 = Width;
      uint64_t v18 = BytesPerRow & 0xFFFFFFFE;
      uint64_t v19 = 2 * Width;
      do
      {
        v20 = v10;
        if (v31)
        {
          uint64_t v21 = 0;
          unsigned int v22 = 2;
          do
          {
            _H0 = *(_WORD *)&BaseAddress[v21];
            __asm { FCVT            S0, H0; float }
            char v29 = vcvtms_s32_f32(fmaxf(fminf(powf(_S0, a5) * 255.0, 255.0), 0.0));
            v15[v22 - 2] = v29;
            v15[v22 - 1] = v29;
            v15[v22] = v29;
            v22 += 3;
            v21 += 2;
          }
          while (v19 != v21);
        }
        v10 = v20;
        fwrite(v15, 3uLL, v17, v20);
        ++v16;
        BaseAddress += v18;
      }
      while (v16 != v30);
    }
    free(v15);
    fclose(v10);
  }
}

- (void)saveF16Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  v12 = sub_262E6D3FC(a4, v7, v8, v9, v10, v11);
  if (v12)
  {
    uint64_t v18 = v12;
    unsigned int v19 = objc_msgSend_width(v6, v13, v14, v15, v16, v17);
    unsigned int v25 = objc_msgSend_height(v6, v20, v21, v22, v23, v24);
    v26 = malloc_type_malloc(3 * v19, 0xE57BCB10uLL);
    v27 = (char *)malloc_type_malloc(2 * v19 * v25, 0x2CCF1F48uLL);
    fprintf(v18, "P6 %u %u 255\n", v19, v25);
    objc_msgSend_makeCoherent_(self, v28, (uint64_t)v6, v29, v30, v31);
    memset(v45, 0, 24);
    v45[3] = v19;
    v45[4] = v25;
    v45[5] = 1;
    v44 = v27;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v32, (uint64_t)v27, 2 * v19, (uint64_t)v45, 0);
    if (v25)
    {
      int v33 = 0;
      uint64_t v34 = 2 * v19;
      do
      {
        if (v19)
        {
          uint64_t v35 = 0;
          unsigned int v36 = 2;
          do
          {
            _H0 = *(_WORD *)&v27[v35];
            __asm { FCVT            S0, H0 }
            char v43 = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            v26[v36 - 2] = v43;
            v26[v36 - 1] = v43;
            v26[v36] = v43;
            v36 += 3;
            v35 += 2;
          }
          while (v34 != v35);
        }
        fwrite(v26, 3uLL, v19, v18);
        ++v33;
        v27 += v34;
      }
      while (v33 != v25);
    }
    free(v26);
    free(v44);
    fclose(v18);
  }
}

- (void)saveF32Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
  unsigned int Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  uint64_t v9 = malloc_type_malloc(4 * Width * Height, 0x56DD33FCuLL);
  uint64_t v14 = v9;
  if (Height)
  {
    unsigned int v15 = 0;
    int v16 = 0;
    do
    {
      uint64_t v17 = Width;
      unsigned int v18 = v15;
      if (Width)
      {
        do
        {
          int16x8_t v19 = vdupq_n_s16((int)(float)(BaseAddress[v18] * 255.0));
          v19.i16[3] = 255;
          *((_DWORD *)v9 + v18++) = vmovn_s16(v19).u32[0];
          --v17;
        }
        while (v17);
      }
      ++v16;
      v15 += Width;
    }
    while (v16 != Height);
  }
  v20 = objc_msgSend_stringWithFormat_(NSString, v10, @"%s", v11, v12, v13, a4);
  objc_msgSend_createPathIfNeeded_(disparityDebugUtils, v21, (uint64_t)v20, v22, v23, v24);
  id v32 = v20;
  uint64_t v30 = (const char *)objc_msgSend_UTF8String(v32, v25, v26, v27, v28, v29);
  sub_262E6D988(Width, (const char *)Height, 4 * Width, (uint64_t)v14, v30, v31);
  free(v14);
}

- (void)saveU8Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a3);
  unsigned int Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  uint64_t v10 = malloc_type_malloc(4 * Width * Height, 0x4E9F3C5uLL);
  unsigned int v15 = v10;
  if (Height)
  {
    int v16 = 0;
    unsigned int v17 = 0;
    int v18 = 0;
    do
    {
      uint64_t v19 = Width;
      int v20 = v16;
      unsigned int v21 = v17;
      if (Width)
      {
        do
        {
          int16x8_t v22 = vdupq_n_s16(BaseAddress[v20]);
          v22.i16[3] = 255;
          *((_DWORD *)v10 + v21++) = vmovn_s16(v22).u32[0];
          ++v20;
          --v19;
        }
        while (v19);
      }
      ++v18;
      v17 += Width;
      v16 += BytesPerRow;
    }
    while (v18 != Height);
  }
  uint64_t v23 = objc_msgSend_stringWithFormat_(NSString, v11, @"%s", v12, v13, v14, a4);
  objc_msgSend_createPathIfNeeded_(disparityDebugUtils, v24, (uint64_t)v23, v25, v26, v27);
  id v35 = v23;
  int v33 = (const char *)objc_msgSend_UTF8String(v35, v28, v29, v30, v31, v32);
  sub_262E6D988(Width, (const char *)Height, 4 * Width, (uint64_t)v15, v33, v34);
  free(v15);
}

- (void)saveVUYA4444Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v12 = objc_msgSend_width(v6, v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_height(v6, v13, v14, v15, v16, v17);
  uint64_t v19 = malloc_type_malloc(4 * v12 * v18, 0xCE17F4E7uLL);
  objc_msgSend_makeCoherent_(self, v20, (uint64_t)v6, v21, v22, v23);
  memset(v28, 0, 24);
  v28[3] = v12;
  v28[4] = v18;
  v28[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v24, (uint64_t)v19, 4 * v12, (uint64_t)v28, 0);

  objc_msgSend_convertVUYA444_rbs_ToRGBA_ofSize_(self, v25, (uint64_t)v19, 4 * v12, (uint64_t)v19, v26, (double)v12, (double)v18);
  sub_262E6D988(v12, (const char *)v18, 4 * v12, (uint64_t)v19, a4, v27);
  free(v19);
}

- (void)saveVUYA4444Texture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v12 = objc_msgSend_width(v6, v7, v8, v9, v10, v11);
  unsigned int v18 = objc_msgSend_height(v6, v13, v14, v15, v16, v17);
  uint64_t v19 = malloc_type_malloc(4 * v12 * v18, 0x307EB1D4uLL);
  objc_msgSend_makeCoherent_(self, v20, (uint64_t)v6, v21, v22, v23);
  memset(v27, 0, 24);
  v27[3] = v12;
  v27[4] = v18;
  v27[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v24, (uint64_t)v19, 4 * v12, (uint64_t)v27, 0);

  objc_msgSend_WriteBinDataToFile_length_fileFullPath_(self, v25, (uint64_t)v19, 4 * v12 * v18, (uint64_t)a4, v26);
  free(v19);
}

- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4
{
}

- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsBinaryFile:(const char *)a6
{
  int Height = a5;
  unsigned int Width = a4;
  uint64_t v9 = sub_262E6D3FC(a6, a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, (uint64_t)a6);
  if (!v9) {
    return;
  }
  uint64_t v10 = v9;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  if (!Width)
  {
    unsigned int Width = CVPixelBufferGetWidth(a3);
    if (Height) {
      goto LABEL_4;
    }
LABEL_12:
    int Height = CVPixelBufferGetHeight(a3);
    goto LABEL_4;
  }
  if (!Height) {
    goto LABEL_12;
  }
LABEL_4:
  unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  if (Height)
  {
    uint64_t v13 = BaseAddress;
    do
    {
      fwrite(v13, 4uLL, Width, v10);
      v13 += BytesPerRow;
      --Height;
    }
    while (Height);
  }
  fclose(v10);

  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
}

- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
}

- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFile:(const char *)a6
{
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  unsigned int Width = CVPixelBufferGetWidth(a3);
  unsigned int Height = CVPixelBufferGetHeight(a3);
  unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  uint64_t v14 = malloc_type_malloc(4 * Width * Height, 0x10F0BD5AuLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  objc_msgSend_convertVUYA444_rbs_ToRGBA_ofSize_(self, v16, (uint64_t)BaseAddress, BytesPerRow, (uint64_t)v14, v17, (double)Width, (double)Height);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (a4) {
    unsigned int v19 = a4;
  }
  else {
    unsigned int v19 = Width;
  }
  if (a5) {
    int v20 = (const char *)a5;
  }
  else {
    int v20 = (const char *)Height;
  }
  sub_262E6D988(v19, v20, 4 * Width, (uint64_t)v14, a6, v18);

  free(v14);
}

- (void)saveRGB10A2PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
}

- (void)saveRGB10A2PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFile:(const char *)a6
{
  LODWORD(v7) = a5;
  LODWORD(v8) = a4;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  unsigned int Width = CVPixelBufferGetWidth(a3);
  unsigned int Height = CVPixelBufferGetHeight(a3);
  unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  uint64_t v14 = malloc_type_malloc(4 * Width * Height, 0xC9F1BBE4uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  if (v8) {
    uint64_t v8 = v8;
  }
  else {
    uint64_t v8 = Width;
  }
  if (v7)
  {
    unint64_t v7 = v7;
    objc_msgSend_convertRGB10A2ToRGBA8_rbs_ToRGBA_outWidth_outHeight_(self, v15, (uint64_t)BaseAddress, BytesPerRow, (uint64_t)v14, v8, v7);
  }
  else
  {
    unint64_t v7 = Height;
    objc_msgSend_convertRGB10A2ToRGBA8_rbs_ToRGBA_outWidth_outHeight_(self, v15, (uint64_t)BaseAddress, BytesPerRow, (uint64_t)v14, v8, Height);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  sub_262E6D988(v8, (const char *)v7, (4 * v8), (uint64_t)v14, a6, v17);

  free(v14);
}

- (void)saveRGB10A2PixelBuffer:(__CVBuffer *)a3 AsPPMFileWithAlpha:(const char *)a4
{
}

- (void)saveRGB10A2PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFileWithAlpha:(const char *)a6
{
  LODWORD(v8) = a4;
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  unsigned int Width = CVPixelBufferGetWidth(a3);
  unsigned int Height = CVPixelBufferGetHeight(a3);
  unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  uint64_t v14 = malloc_type_malloc(4 * Width * Height, 0xF19A5099uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  if (v8) {
    size_t v8 = v8;
  }
  else {
    size_t v8 = Width;
  }
  if (a5)
  {
    objc_msgSend_convertRGB10A2ToRGBA8_rbs_ToRGBA_outWidth_outHeight_(self, v15, (uint64_t)BaseAddress, BytesPerRow, (uint64_t)v14, v8, a5);
  }
  else
  {
    a5 = Height;
    objc_msgSend_convertRGB10A2ToRGBA8_rbs_ToRGBA_outWidth_outHeight_(self, v15, (uint64_t)BaseAddress, BytesPerRow, (uint64_t)v14, v8, Height);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  uint64_t v22 = sub_262E6D3FC(a6, v17, v18, v19, v20, v21);
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = (char *)malloc_type_malloc((4 * v8), 0xCF9B36E4uLL);
    if (v24)
    {
      uint64_t v25 = v24;
      fprintf(v23, "P7\nWIDTH %u\nHEIGHT %u\nDEPTH 4\nMAXVAL 255\nTUPLTYPE RGB_ALPHA\nENDHDR", v8, a5);
      if (a5)
      {
        int v26 = 0;
        uint64_t v27 = v14;
        do
        {
          if (v8)
          {
            uint64_t v28 = 0;
            int v29 = v8;
            do
            {
              uint64_t v30 = &v25[v28];
              *uint64_t v30 = v27[v28];
              v30[1] = v27[v28 + 1];
              v30[2] = v27[v28 + 2];
              v30[3] = v27[v28 + 3];
              v28 += 4;
              --v29;
            }
            while (v29);
          }
          fwrite(v25, 4uLL, v8, v23);
          v27 += (4 * v8);
          ++v26;
        }
        while (v26 != a5);
      }
      free(v25);
    }
    fclose(v23);
  }

  free(v14);
}

- (void)save420CVPixelBuffer:(__CVBuffer *)a3 to:(const char *)a4
{
  unint64_t v7 = sub_262E6D3FC(a4, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  if (v7)
  {
    size_t v8 = v7;
    unsigned int Width = CVPixelBufferGetWidth(a3);
    unsigned int Height = CVPixelBufferGetHeight(a3);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    unsigned int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    if (Height)
    {
      uint64_t v13 = BytesPerRowOfPlane;
      unsigned int v14 = Height;
      do
      {
        fwrite(BaseAddressOfPlane, 1uLL, Width, v8);
        BaseAddressOfPlane += v13;
        --v14;
      }
      while (v14);
    }
    uint64_t v15 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
    unsigned int v16 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
    if (Height)
    {
      unsigned int v17 = 0;
      uint64_t v18 = v16;
      do
      {
        fwrite(v15, 1uLL, Width, v8);
        v15 += v18;
        v17 += 2;
      }
      while (v17 < Height);
    }
    fclose(v8);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
}

- (void)saveLumaTexture:(id)a3 to:(const char *)a4
{
  id v6 = a3;
  unsigned int v12 = sub_262E6D3FC(a4, v7, v8, v9, v10, v11);
  if (v12)
  {
    uint64_t v18 = v12;
    unsigned int v19 = objc_msgSend_width(v6, v13, v14, v15, v16, v17);
    unsigned int v25 = objc_msgSend_height(v6, v20, v21, v22, v23, v24);
    int v26 = malloc_type_malloc(v25 * v19, 0x620FB7E0uLL);
    objc_msgSend_makeCoherent_(self, v27, (uint64_t)v6, v28, v29, v30);
    size_t v31 = v19;
    memset(v34, 0, 24);
    v34[3] = v19;
    v34[4] = v25;
    v34[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v32, (uint64_t)v26, v19, (uint64_t)v34, 0);
    fwrite(v26, 1uLL, v25 * v19, v18);
    bzero(v26, v19);
    if (v25)
    {
      for (unsigned int i = 0; i < v25; i += 2)
        fwrite(v26, 1uLL, v31, v18);
    }
    free(v26);
    fclose(v18);
  }
}

- (void)convertVUYA444:(char *)a3 rbs:(unint64_t)a4 ToRGBA:(char *)a5 ofSize:(CGSize)a6
{
  unsigned int v6 = vcvtmd_u64_f64(a6.height);
  if (v6)
  {
    int v7 = 0;
    int v8 = 0;
    int v9 = 0;
    unsigned int v10 = vcvtmd_u64_f64(a6.width);
    do
    {
      if (v10)
      {
        uint64_t v11 = 0;
        do
        {
          int v12 = a3[(v8 + v11 + 3)];
          int v13 = a3[(v8 + v11)] - 128;
          int v14 = 74 * a3[(v8 + v11 + 2)] - 1152;
          int v15 = (v14 + 102 * v13) >> 6;
          if (v15 >= 255) {
            int v15 = 255;
          }
          int v16 = v15 & ~(v15 >> 31);
          int v17 = a3[(v8 + v11 + 1)] - 128;
          int v18 = (v14 - 51 * v13 - 25 * v17) >> 6;
          if (v18 >= 255) {
            int v18 = 255;
          }
          int v19 = v18 & ~(v18 >> 31);
          int v20 = (v14 + 129 * v17) >> 6;
          if (v20 >= 255) {
            int v20 = 255;
          }
          int v21 = v20 & ~(v20 >> 31);
          BOOL v22 = v12 == 255;
          if (v12 == 255) {
            char v23 = v16;
          }
          else {
            char v23 = -1;
          }
          if (!v22)
          {
            LOBYTE(v19) = 0;
            LOBYTE(v21) = 0;
          }
          int v24 = v7 + v11;
          a5[v24] = v23;
          a5[v24 + 1] = v19;
          a5[v24 + 2] = v21;
          a5[v24 + 3] = -1;
          v11 += 4;
        }
        while (4 * v10 != v11);
      }
      ++v9;
      v8 += a4;
      v7 += 4 * v10;
    }
    while (v9 != v6);
  }
}

- (void)convertRGB10A2ToRGBA8:(char *)a3 rbs:(unint64_t)a4 ToRGBA:(char *)a5 outWidth:(unsigned int)a6 outHeight:(unsigned int)a7
{
  if (a7)
  {
    int v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = a7;
    do
    {
      if (a6)
      {
        uint64_t v10 = 0;
        do
        {
          unsigned int v11 = *(_DWORD *)&a3[v8 * a4 + v10];
          uint64_t v12 = (v7 + v10);
          a5[v12] = v11 >> 2;
          a5[v12 | 1] = v11 >> 12;
          a5[v12 | 2] = v11 >> 22;
          a5[v12 | 3] = 85 * (v11 >> 30);
          v10 += 4;
        }
        while (4 * a6 != v10);
      }
      ++v8;
      v7 += 4 * a6;
    }
    while (v8 != v9);
  }
}

- (void)saveRGBATexture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v12 = objc_msgSend_width(v6, v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_height(v6, v13, v14, v15, v16, v17);
  int v19 = malloc_type_malloc(4 * v12 * v18, 0xC2B60A0AuLL);
  objc_msgSend_makeCoherent_(self, v20, (uint64_t)v6, v21, v22, v23);
  uint64_t v29 = objc_msgSend_width(v6, v24, v25, v26, v27, v28);
  memset(v48, 0, 24);
  v48[3] = v12;
  v48[4] = v18;
  v48[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v30, (uint64_t)v19, 4 * v29, (uint64_t)v48, 0);

  id v35 = objc_msgSend_stringWithFormat_(NSString, v31, @"%s", v32, v33, v34, a4);
  objc_msgSend_createPathIfNeeded_(disparityDebugUtils, v36, (uint64_t)v35, v37, v38, v39);
  id v40 = v35;
  v46 = (const char *)objc_msgSend_UTF8String(v40, v41, v42, v43, v44, v45);
  sub_262E6D988(v12, (const char *)v18, 4 * v12, (uint64_t)v19, v46, v47);
  free(v19);
}

- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  uint64_t v11 = (char *)malloc_type_malloc(4 * (Width * Height), 0x100004052888210uLL);
  unsigned int v12 = v11;
  if (Height)
  {
    int v13 = 0;
    uint64_t v14 = v11;
    do
    {
      if (Width)
      {
        uint64_t v15 = 0;
        do
        {
          _H0 = *(_WORD *)&BaseAddress[2 * v15];
          __asm { FCVT            S0, H0 }
          *(_DWORD *)&v14[4 * v15++] = _S0;
        }
        while (Width != v15);
      }
      ++v13;
      BaseAddress += BytesPerRow & 0xFFFFFFFE;
      v14 += 4 * Width;
    }
    while (v13 != Height);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v22, Width, Height, (uint64_t)v12, (uint64_t)a4);

  free(v12);
}

- (void)computeRobustMinMaxForF16DisparityBuffer:(__CVBuffer *)a3 WithDisparityScale:(float)a4 AndPercentile:(float)a5 OutSignalMin:(float *)a6 OutSignalMax:(float *)a7
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  unsigned int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  bzero(v37, 0x1000uLL);
  if (Height)
  {
    for (uint64_t i = 0; i != Height; ++i)
    {
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
      if (Width)
      {
        uint64_t v17 = &BaseAddress[BytesPerRow * i];
        uint64_t v18 = Width;
        do
        {
          __int16 v19 = *(_WORD *)v17;
          v17 += 2;
          _H0 = v19;
          __asm { FCVT            S0, H0 }
          unsigned int v26 = (float)((float)((float)(_S0 / a4) * 8.0) + 0.5);
          if (v26 >= 0x3FF) {
            unsigned int v26 = 1023;
          }
          ++v37[v26];
          --v18;
        }
        while (v18);
      }
    }
  }
  unint64_t v27 = 0;
  unsigned int v28 = 0;
  *a6 = 3.4028e38;
  *a7 = 1.1755e-38;
  float v29 = (float)(Height * Width);
  unsigned int v30 = (float)((float)(v29 * a5) + 0.5);
  unsigned int v31 = (float)((float)(v29 * (float)(1.0 - a5)) + 0.5);
  float v32 = *a6;
  float v33 = 1.1755e-38;
  while (1)
  {
    unsigned int v34 = v37[v27];
    v28 += v34;
    if (v32 == 3.4028e38 && v28 > v30)
    {
      float v32 = (float)((float)((float)v27 + -0.5) + (float)((float)(v28 - v30) / (float)v34)) * 0.125;
      *a6 = v32;
      float v33 = *a7;
    }
    if (v33 == 1.1755e-38 && v28 > v31) {
      break;
    }
    if (++v27 == 1024) {
      goto LABEL_23;
    }
  }
  *a7 = (float)((float)((float)v27 + -0.5) + (float)((float)(v28 - v31) / (float)v34)) * 0.125;
LABEL_23:

  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
}

- (void)saveF16DisparityBufferAsTurbo:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 WithMin:(float)a5 WithMax:(float)a6
{
  unsigned int Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  uint64_t v14 = (char *)malloc_type_malloc(4 * Width * Height, 0x486BAFCBuLL);
  if (v14)
  {
    uint64_t v15 = v14;
    if (Height)
    {
      uint64_t v16 = 0;
      do
      {
        if (Width)
        {
          uint64_t v17 = 0;
          uint64_t v18 = &v14[4 * Width * v16];
          do
          {
            _H3 = *(_WORD *)&BaseAddress[v17];
            __asm { FCVT            S3, H3 }
            uint64_t v25 = (char *)&unk_262E88DC0
                + 3
                * (int)(float)((float)((float)((float)(fmaxf(a5, fminf(a6, _S3)) - a5) / (float)(a6 - a5))
                                                   * 1024.0)
                                           + -0.49);
            *(_WORD *)uint64_t v18 = *(_WORD *)v25;
            v18[2] = v25[2];
            v18[3] = -1;
            v18 += 4;
            v17 += 2;
          }
          while (2 * Width != v17);
        }
        ++v16;
        BaseAddress += BytesPerRow & 0xFFFFFFFE;
      }
      while (v16 != Height);
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    sub_262E6D988(Width, (const char *)Height, 4 * Width, (uint64_t)v15, a4, v26);
    free(v15);
  }
}

- (void)saveF16DisparityBufferAsTurbo:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 WithDisparityScale:(float)a5 AndPercentile:(float)a6
{
  uint64_t v16 = 0;
  objc_msgSend_computeRobustMinMaxForF16DisparityBuffer_WithDisparityScale_AndPercentile_OutSignalMin_OutSignalMax_(self, a2, (uint64_t)a3, (uint64_t)&v16 + 4, (uint64_t)&v16, v6);
  *(float *)&double v11 = *((float *)&v16 + 1) * a5;
  *(float *)&double v12 = *(float *)&v16 * a5;
  objc_msgSend_saveF16DisparityBufferAsTurbo_AsPPMFile_WithMin_WithMax_(self, v13, (uint64_t)a3, (uint64_t)a4, v14, v15, v11, v12);
}

- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsGrayScalePPMFile:(const char *)a4 range:
{
  uint64_t v41 = v4;
  unsigned int Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (__int16 *)CVPixelBufferGetBaseAddress(a3);
  double v11 = (float *)malloc_type_malloc(4 * Height * Width, 0x100004052888210uLL);
  double v12 = (char *)v11;
  _H0 = *BaseAddress;
  __asm { FCVT            S8, H0 }
  if (Height)
  {
    int v19 = 0;
    int v20 = v11;
    float v21 = _S8;
    do
    {
      if (Width)
      {
        for (uint64_t i = 0; i != Width; v20[i++] = _S0)
        {
          _H0 = BaseAddress[i];
          __asm { FCVT            S0, H0 }
          _S8 = fmaxf(_S8, _S0);
          float v21 = fminf(v21, _S0);
        }
      }
      ++v19;
      BaseAddress = (__int16 *)((char *)BaseAddress + (BytesPerRow & 0xFFFFFFFE));
      v20 += Width;
    }
    while (v19 != Height);
  }
  else
  {
    float v21 = _S8;
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  BOOL v25 = *(float *)&v41 != 0.0;
  BOOL v26 = *((float *)&v41 + 1) != 0.0;
  BOOL v27 = v25 && v26;
  if (v25 && v26) {
    float v21 = *(float *)&v41;
  }
  unsigned int v28 = malloc_type_malloc(4 * Height * Width, 0xEEFFE344uLL);
  unsigned int v30 = v28;
  if (Height)
  {
    int v31 = 0;
    int v32 = 0;
    if (v27) {
      float v33 = *((float *)&v41 + 1);
    }
    else {
      float v33 = _S8;
    }
    float v34 = v33 - v21;
    uint64_t v35 = 4 * Width;
    uint64_t v36 = 4 * Width;
    uint64_t v37 = v12;
    do
    {
      if (Width)
      {
        uint64_t v38 = 0;
        do
        {
          char v39 = ~(int)((float)((float)(*(float *)&v37[v38] - v21) / v34) * 255.0);
          unsigned int v40 = v31 + v38;
          *((unsigned char *)v28 + v40) = v39;
          *((unsigned char *)v28 + v40 + 1) = v39;
          *((unsigned char *)v28 + v40 + 2) = v39;
          *((unsigned char *)v28 + v40 + 3) = -1;
          v38 += 4;
        }
        while (v36 != v38);
      }
      ++v32;
      v37 += v36;
      v31 += 4 * Width;
    }
    while (v32 != Height);
  }
  else
  {
    uint64_t v35 = 4 * Width;
  }
  sub_262E6D988(Width, (const char *)Height, v35, (uint64_t)v28, a4, v29);
  free(v30);

  free(v12);
}

- (void)saveF16DisparityTexture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v12 = objc_msgSend_width(v6, v7, v8, v9, v10, v11);
  unsigned int v18 = objc_msgSend_height(v6, v13, v14, v15, v16, v17);
  uint64_t v19 = v12;
  uint64_t v20 = 2 * v12;
  objc_msgSend_makeCoherent_(self, v21, (uint64_t)v6, v22, v23, v24);
  BOOL v25 = malloc_type_malloc(v20 * v18, 0x9A2D9640uLL);
  memset(v29, 0, 24);
  v29[3] = v19;
  v29[4] = v18;
  v29[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v26, (uint64_t)v25, v20, (uint64_t)v29, 0);

  objc_msgSend_WriteBinDataToFile_length_fileFullPath_(self, v27, (uint64_t)v25, v20 * v18, (uint64_t)a4, v28);
  free(v25);
}

- (void)saveF16Texture:(id)a3 AsGrayScalePPMFile:(const char *)a4 range:
{
  uint64_t v57 = v4;
  id v7 = a3;
  objc_msgSend_makeCoherent_(self, v8, (uint64_t)v7, v9, v10, v11);
  unsigned int v17 = objc_msgSend_width(v7, v12, v13, v14, v15, v16);
  uint64_t v23 = objc_msgSend_height(v7, v18, v19, v20, v21, v22);
  uint64_t v24 = (char *)malloc_type_malloc(2 * v17 * v23, 0x1B666B80uLL);
  memset(v58, 0, 24);
  v58[3] = v17;
  v58[4] = v23;
  v58[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v7, v25, (uint64_t)v24, 2 * v17, (uint64_t)v58, 0);
  BOOL v26 = (float *)malloc_type_malloc(4 * v23 * v17, 0x100004052888210uLL);
  BOOL v27 = (char *)v26;
  uint64_t v28 = 4 * v17;
  if (v23)
  {
    int v29 = 0;
    float v30 = 3.4028e38;
    float v31 = 1.1755e-38;
    int v32 = v26;
    float v33 = v24;
    do
    {
      if (v17)
      {
        for (uint64_t i = 0; i != v17; v32[i++] = _S1)
        {
          _H1 = *(_WORD *)&v33[2 * i];
          __asm { FCVT            S1, H1 }
          float v31 = fmaxf(v31, _S1);
          float v30 = fminf(v30, _S1);
        }
      }
      ++v29;
      v33 += 2 * v17;
      int v32 = (float *)((char *)v32 + v28);
    }
    while (v29 != v23);
  }
  else
  {
    float v31 = 1.1755e-38;
    float v30 = 3.4028e38;
  }
  BOOL v41 = *(float *)&v57 != 0.0;
  BOOL v42 = *((float *)&v57 + 1) != 0.0;
  BOOL v43 = v41 && v42;
  if (v41 && v42) {
    float v44 = *(float *)&v57;
  }
  else {
    float v44 = v30;
  }
  uint64_t v45 = malloc_type_malloc(4 * v23 * v17, 0xBD014032uLL);
  uint64_t v47 = v45;
  if (v23)
  {
    int v48 = 0;
    int v49 = 0;
    if (v43) {
      float v50 = *((float *)&v57 + 1);
    }
    else {
      float v50 = v31;
    }
    float v51 = v50 - v44;
    uint64_t v52 = 4 * v17;
    v53 = v27;
    do
    {
      if (v17)
      {
        uint64_t v54 = 0;
        do
        {
          char v55 = ~(int)((float)((float)(*(float *)&v53[v54] - v44) / v51) * 255.0);
          unsigned int v56 = v48 + v54;
          *((unsigned char *)v45 + v56) = v55;
          *((unsigned char *)v45 + v56 + 1) = v55;
          *((unsigned char *)v45 + v56 + 2) = v55;
          *((unsigned char *)v45 + v56 + 3) = -1;
          v54 += 4;
        }
        while (v28 != v54);
      }
      ++v49;
      v53 += v28;
      v48 += 4 * v17;
    }
    while (v49 != v23);
  }
  else
  {
    uint64_t v52 = 4 * v17;
  }
  sub_262E6D988(v17, (const char *)v23, v52, (uint64_t)v45, a4, v46);
  free(v47);
  free(v24);
  free(v27);
}

- (void)ApplyColorWheelAndWrite:(unsigned int)a3 height:(unsigned int)a4 data:(float *)a5 fileFullPath:(const char *)a6
{
  uint64_t v8 = *(const char **)&a4;
  uint64_t v16 = (void **)sub_262E6C854(80, 30, 20, 20, 30, 0, 0, 1, 0.0);
  uint64_t v10 = malloc_type_malloc(4 * a3 * v8, 0xA525D3AAuLL);
  sub_262E6CFAC((uint64_t)v16, a3, (int)v8, a5, 4 * a3, 4, (uint64_t)v10, 4 * a3, v11, v12, v13, v14, 4);
  sub_262E6D988(a3, v8, 4 * a3, (uint64_t)v10, a6, v15);
  free(v10);
  sub_262E6CE84(&v16);
}

- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4
{
  uint64_t v8 = sub_262E6D3FC(a4, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  if (v8)
  {
    uint64_t v9 = v8;
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    if (Height)
    {
      float v14 = BaseAddress;
      do
      {
        fwrite(v14, 2uLL, Width, v9);
        v14 += BytesPerRow;
        --Height;
      }
      while (Height);
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v9);
  }
  else
  {
    NSLog(&cfstr_CouldNotWriteS.isa, a4);
  }
}

- (void)saveU8Texture:(id)a3 AsPGMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v12 = objc_msgSend_width(v6, v7, v8, v9, v10, v11);
  unsigned int v18 = objc_msgSend_height(v6, v13, v14, v15, v16, v17);
  unsigned int v19 = v18;
  size_t v20 = v12;
  uint64_t v21 = (char *)malloc_type_malloc(v18 * v12 + 4096, 0xEFD33B0CuLL);
  objc_msgSend_makeCoherent_(self, v22, (uint64_t)v6, v23, v24, v25);
  memset(v35, 0, 24);
  v35[3] = v12;
  v35[4] = v18;
  v35[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v26, (uint64_t)v21, v12, (uint64_t)v35, 0);
  int v32 = sub_262E6D3FC(a4, v27, v28, v29, v30, v31);
  if (v32)
  {
    float v33 = v32;
    fprintf(v32, "P5 %u %u 255\n", v12, v18);
    if (v18)
    {
      float v34 = v21;
      do
      {
        fwrite(v34, 1uLL, v20, v33);
        v34 += v20;
        --v19;
      }
      while (v19);
    }
    fclose(v33);
  }
  free(v21);
}

- (void)saveU16Texture:(id)a3 AsPGMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v12 = objc_msgSend_width(v6, v7, v8, v9, v10, v11);
  unsigned int v18 = objc_msgSend_height(v6, v13, v14, v15, v16, v17);
  unsigned int v19 = v18;
  uint64_t v20 = 2 * v12;
  uint64_t v21 = (char *)malloc_type_malloc(v20 * v18, 0xA470F0F9uLL);
  objc_msgSend_makeCoherent_(self, v22, (uint64_t)v6, v23, v24, v25);
  memset(v38, 0, 24);
  v38[3] = v12;
  v38[4] = v18;
  v38[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v26, (uint64_t)v21, v20, (uint64_t)v38, 0);
  int v32 = sub_262E6D3FC(a4, v27, v28, v29, v30, v31);
  if (v32)
  {
    float v33 = v32;
    fprintf(v32, "P5 %u %u 65535\n", v12, v18);
    if (v18)
    {
      int v34 = 0;
      uint64_t v35 = 2 * v12;
      uint64_t v36 = v21;
      do
      {
        if (v12)
        {
          uint64_t v37 = 0;
          do
          {
            fprintf(v33, "%u ", *(unsigned __int16 *)&v36[v37]);
            v37 += 2;
          }
          while (v35 != v37);
        }
        fputc(10, v33);
        ++v34;
        v36 += v35;
      }
      while (v34 != v19);
    }
    fclose(v33);
  }
  free(v21);
}

- (void)saveF16RGTexture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v12 = objc_msgSend_width(v6, v7, v8, v9, v10, v11);
  unsigned int v18 = objc_msgSend_height(v6, v13, v14, v15, v16, v17);
  uint64_t v19 = v12;
  uint64_t v20 = 4 * v12;
  objc_msgSend_makeCoherent_(self, v21, (uint64_t)v6, v22, v23, v24);
  uint64_t v25 = malloc_type_malloc(v20 * v18, 0x251B8C2FuLL);
  memset(v29, 0, 24);
  v29[3] = v19;
  v29[4] = v18;
  v29[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v26, (uint64_t)v25, v20, (uint64_t)v29, 0);

  objc_msgSend_WriteBinDataToFile_length_fileFullPath_(self, v27, (uint64_t)v25, v20 * v18, (uint64_t)a4, v28);
  free(v25);
}

- (void)saveF16DisparityTexture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  uint64_t v12 = objc_msgSend_width(v6, v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_height(v6, v13, v14, v15, v16, v17);
  objc_msgSend_makeCoherent_(self, v19, (uint64_t)v6, v20, v21, v22);
  uint64_t v23 = (char *)malloc_type_malloc((2 * v12 * v18), 0x5214660AuLL);
  uint64_t v24 = (char *)malloc_type_malloc(4 * (v12 * v18), 0x100004052888210uLL);
  memset(v37, 0, 24);
  v37[3] = v12;
  v37[4] = v18;
  v37[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v25, (uint64_t)v23, (2 * v12), (uint64_t)v37, 0);
  if (v18)
  {
    int v26 = 0;
    BOOL v27 = v24;
    uint64_t v28 = v23;
    do
    {
      if (v12)
      {
        uint64_t v29 = 0;
        do
        {
          _H0 = *(_WORD *)&v28[2 * v29];
          __asm { FCVT            S0, H0 }
          *(_DWORD *)&v27[4 * v29++] = _S0;
        }
        while (v12 != v29);
      }
      ++v26;
      v28 += 2 * v12;
      v27 += 4 * v12;
    }
    while (v26 != v18);
  }
  free(v23);
  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v36, v12, v18, (uint64_t)v24, (uint64_t)a4);
  free(v24);
}

- (void)saveRGF16ShiftmapTexture:(id)a3 AsPPMFileSx:(id)a4 AsPPMFileSy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v58 = a5;
  uint64_t v15 = objc_msgSend_width(v8, v10, v11, v12, v13, v14);
  uint64_t v21 = objc_msgSend_height(v8, v16, v17, v18, v19, v20);
  objc_msgSend_makeCoherent_(self, v22, (uint64_t)v8, v23, v24, v25);
  int v26 = (__int16 *)malloc_type_malloc((2 * v21 * 4 * v15), 0x25F132BFuLL);
  BOOL v27 = malloc_type_malloc(4 * (v15 * v21), 0x100004052888210uLL);
  uint64_t v28 = malloc_type_malloc(4 * (v15 * v21), 0x100004052888210uLL);
  memset(v59, 0, 24);
  v59[3] = v15;
  v59[4] = v21;
  v59[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v8, v29, (uint64_t)v26, (4 * v15), (uint64_t)v59, 0);
  if (v21)
  {
    int v30 = 0;
    uint64_t v31 = v28;
    int v32 = v27;
    float v33 = v26;
    do
    {
      for (int i = v15; i; --i)
      {
        _H0 = *v33;
        __asm { FCVT            S0, H0 }
        *v32++ = _S0;
        LOWORD(_S0) = v33[1];
        __asm { FCVT            S0, H0 }
        *v31++ = _S0;
        v33 += 2;
      }
      ++v30;
    }
    while (v30 != v21);
  }
  free(v26);
  id v42 = v9;
  uint64_t v48 = objc_msgSend_UTF8String(v42, v43, v44, v45, v46, v47);
  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v49, v15, v21, (uint64_t)v27, v48);
  free(v27);
  id v50 = v58;
  uint64_t v56 = objc_msgSend_UTF8String(v50, v51, v52, v53, v54, v55);
  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v57, v15, v21, (uint64_t)v28, v56);
  free(v28);
}

- (void)saveRGF16Texture:(id)a3 AsF32BinaryFile0:(id)a4 AsF32BinaryFile1:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  uint64_t v17 = (const char *)objc_msgSend_UTF8String(v11, v12, v13, v14, v15, v16);
  uint64_t v23 = sub_262E6D3FC(v17, v18, v19, v20, v21, v22);
  id v24 = v10;
  int v30 = (const char *)objc_msgSend_UTF8String(v24, v25, v26, v27, v28, v29);
  uint64_t v36 = sub_262E6D3FC(v30, v31, v32, v33, v34, v35);
  __stream = v23;
  if (v23)
  {
    id v42 = v36;
    if (v36)
    {
      unsigned int v43 = objc_msgSend_width(v8, v37, v38, v39, v40, v41);
      unsigned int v49 = objc_msgSend_height(v8, v44, v45, v46, v47, v48);
      unint64_t v50 = 4 * v43;
      objc_msgSend_makeCoherent_(self, v51, (uint64_t)v8, v52, v53, v54);
      uint64_t v55 = malloc_type_malloc(v50 * v49, 0x8751C6BFuLL);
      uint64_t v56 = v55;
      if (!v55)
      {
        FigDebugAssert3();
        v59 = 0;
        uint64_t v57 = 0;
        goto LABEL_15;
      }
      uint64_t v77 = (uint64_t)v55;
      uint64_t v57 = malloc_type_malloc(4 * v43, 0x42074419uLL);
      if (v57)
      {
        v59 = malloc_type_malloc(4 * v43, 0x6F308E3FuLL);
        if (v59)
        {
          id v76 = v24;
          id v60 = v11;
          memset(v79, 0, 24);
          v79[3] = v43;
          v79[4] = v49;
          v79[5] = 1;
          uint64_t v61 = v77;
          objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v8, v58, v77, 4 * v43, (uint64_t)v79, 0);
          if (!v49)
          {
            uint64_t v56 = (void *)v77;
            id v11 = v60;
            id v24 = v76;
            goto LABEL_15;
          }
          v75 = v60;
          int v62 = 0;
          unint64_t v63 = v50 >> 1;
          do
          {
            if (v43)
            {
              uint64_t v64 = 0;
              v65 = v59;
              v66 = v57;
              do
              {
                _H0 = *(_WORD *)(v61 + 2 * v64);
                __asm { FCVT            S0, H0 }
                _H1 = *(_WORD *)(v61 + 2 * (v64 + 1));
                __asm { FCVT            S1, H1 }
                *v66++ = _S0;
                *v65++ = _S1;
                v64 += 2;
              }
              while (2 * v43 != v64);
            }
            fwrite(v57, 4uLL, v43, __stream);
            fwrite(v59, 4uLL, v43, v42);
            v61 += 2 * v63;
            ++v62;
          }
          while (v62 != v49);
          id v11 = v75;
          id v24 = v76;
        }
        else
        {
          FigDebugAssert3();
        }
      }
      else
      {
        FigDebugAssert3();
        v59 = 0;
      }
      uint64_t v56 = (void *)v77;
LABEL_15:
      free(v57);
      free(v59);
      free(v56);
      fclose(__stream);
      fclose(v42);
    }
  }
}

- (void)saveRGBA8Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v12 = objc_msgSend_width(v6, v7, v8, v9, v10, v11);
  uint64_t v18 = objc_msgSend_height(v6, v13, v14, v15, v16, v17);
  uint64_t v19 = malloc_type_malloc(4 * v12 * v18, 0xE184E057uLL);
  if (v19)
  {
    id v24 = v19;
    objc_msgSend_makeCoherent_(self, v20, (uint64_t)v6, v21, v22, v23);
    memset(v27, 0, 24);
    v27[3] = v12;
    v27[4] = v18;
    v27[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v25, (uint64_t)v24, 4 * v12, (uint64_t)v27, 0);
    sub_262E6D988(v12, (const char *)v18, 4 * v12, (uint64_t)v24, a4, v26);
    free(v24);
  }
  else
  {
    NSLog(&cfstr_CouldNotAlloca_2.isa);
  }
}

- (void)saveRGBA8Texture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v12 = objc_msgSend_width(v6, v7, v8, v9, v10, v11);
  unsigned int v18 = objc_msgSend_height(v6, v13, v14, v15, v16, v17);
  id v24 = malloc_type_malloc(4 * v12 * v18, 0xFBE724B0uLL);
  if (v24 && (uint64_t v25 = sub_262E6D3FC(a4, v19, v20, v21, v22, v23)) != 0)
  {
    int v30 = v25;
    objc_msgSend_makeCoherent_(self, v26, (uint64_t)v6, v27, v28, v29);
    memset(v32, 0, 24);
    v32[3] = v12;
    v32[4] = v18;
    v32[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v31, (uint64_t)v24, 4 * v12, (uint64_t)v32, 0);
    fwrite(v24, 4 * v12 * v18, 1uLL, v30);
    fclose(v30);
  }
  else
  {
    FigDebugAssert3();
  }
  free(v24);
}

- (void)saveRgbaF32PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  uint64_t v8 = sub_262E6D3FC(a4, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  if (v8)
  {
    uint64_t v9 = v8;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    unsigned int v12 = malloc_type_malloc(4 * Width, 0x537B33C4uLL);
    BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    fprintf(v9, "P6 %u %u 255\n", Width, Height);
    if (Height)
    {
      int v15 = 0;
      uint64_t v16 = BytesPerRow >> 2;
      do
      {
        if (Width)
        {
          uint64_t v17 = 0;
          unsigned int v18 = 2;
          do
          {
            v12[v18 - 2] = vcvtms_s32_f32(BaseAddress[v17] * 255.0);
            v12[v18 - 1] = vcvtms_s32_f32(BaseAddress[(v17 + 1)] * 255.0);
            v12[v18] = vcvtms_s32_f32(BaseAddress[(v17 + 2)] * 255.0);
            v18 += 3;
            v17 += 4;
          }
          while (4 * Width != v17);
        }
        fwrite(v12, 3uLL, Width, v9);
        BaseAddress += v16;
        ++v15;
      }
      while (v15 != Height);
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v9);
    free(v12);
  }
  else
  {
    NSLog(&cfstr_CouldNotCreate_0.isa, a4);
  }
}

- (void)save32BGRAPixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  id v7 = sub_262E6D3FC(a4, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  if (v7)
  {
    uint64_t v8 = v7;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    uint64_t v11 = malloc_type_malloc(4 * Width, 0x2527136FuLL);
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    fprintf(v8, "P6 %u %u 255\n", Width, Height);
    if (Height)
    {
      for (int i = 0; i != Height; ++i)
      {
        if (Width)
        {
          uint64_t v15 = 0;
          unsigned int v16 = 2;
          do
          {
            v11[v16 - 2] = BaseAddress[(v15 + 2)];
            v11[v16 - 1] = BaseAddress[(v15 + 1)];
            v11[v16] = BaseAddress[v15];
            v16 += 3;
            v15 += 4;
          }
          while (4 * Width != v15);
        }
        fwrite(v11, 3uLL, Width, v8);
        BaseAddress += BytesPerRow;
      }
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v8);
    free(v11);
  }
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);

  MEMORY[0x270F9A6D0](self, sel_saveRGBAF16PixelBuffer_out_width_out_height_AsPPMFile_, a3, Width, Height, a4);
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFile:(const char *)a6
{
  uint64_t v10 = sub_262E6D3FC(a6, a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, (uint64_t)a6);
  if (v10)
  {
    uint64_t v11 = v10;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    unsigned int v12 = malloc_type_malloc(3 * a4, 0x6BCC2493uLL);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    fprintf(v11, "P6 %u %u 255\n", a4, a5);
    if (a5)
    {
      int v15 = 0;
      uint64_t v16 = BytesPerRow >> 1;
      do
      {
        if (a4)
        {
          uint64_t v17 = 0;
          unsigned int v18 = 2;
          do
          {
            _H0 = *(_WORD *)&BaseAddress[2 * v17];
            __asm { FCVT            S0, H0 }
            v12[v18 - 2] = vcvtms_s32_f32(_S0 * 255.0);
            LOWORD(_S0) = *(_WORD *)&BaseAddress[2 * (v17 + 1)];
            __asm { FCVT            S0, H0 }
            v12[v18 - 1] = vcvtms_s32_f32(_S0 * 255.0);
            LOWORD(_S0) = *(_WORD *)&BaseAddress[2 * (v17 + 2)];
            __asm { FCVT            S0, H0 }
            v12[v18] = vcvtms_s32_f32(_S0 * 255.0);
            v18 += 3;
            v17 += 4;
          }
          while (4 * a4 != v17);
        }
        fwrite(v12, 3uLL, a4, v11);
        BaseAddress += 2 * v16;
        ++v15;
      }
      while (v15 != a5);
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v11);
    free(v12);
  }
  else
  {
    NSLog(&cfstr_CouldNotCreate_0.isa, a6);
  }
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 AsPPMFileWithAlpha:(const char *)a4
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);

  MEMORY[0x270F9A6D0](self, sel_saveRGBAF16PixelBuffer_out_width_out_height_AsPPMFileWithAlpha_, a3, Width, Height, a4);
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFileWithAlpha:(const char *)a6
{
  uint64_t v10 = sub_262E6D3FC(a6, a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, (uint64_t)a6);
  if (v10)
  {
    uint64_t v11 = v10;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    unsigned int v12 = malloc_type_malloc(4 * a4, 0x7263A86CuLL);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    fprintf(v11, "P7\nWIDTH %u\nHEIGHT %u\nDEPTH 4\nMAXVAL 255\nTUPLTYPE RGB_ALPHA\nENDHDR", a4, a5);
    if (a5)
    {
      int v15 = 0;
      uint64_t v16 = BytesPerRow >> 1;
      do
      {
        if (a4)
        {
          uint64_t v17 = 0;
          do
          {
            _H0 = *(_WORD *)&BaseAddress[2 * v17];
            __asm { FCVT            S0, H0 }
            v12[v17] = vcvtms_s32_f32(_S0 * 255.0);
            LOWORD(_S0) = *(_WORD *)&BaseAddress[2 * (v17 + 1)];
            __asm { FCVT            S0, H0 }
            v12[(v17 + 1)] = vcvtms_s32_f32(_S0 * 255.0);
            LOWORD(_S0) = *(_WORD *)&BaseAddress[2 * (v17 + 2)];
            __asm { FCVT            S0, H0 }
            v12[(v17 + 2)] = vcvtms_s32_f32(_S0 * 255.0);
            LOWORD(_S0) = *(_WORD *)&BaseAddress[2 * (v17 + 3)];
            __asm { FCVT            S0, H0 }
            v12[(v17 + 3)] = vcvtms_s32_f32(_S0 * 255.0);
            v17 += 4;
          }
          while (4 * a4 != v17);
        }
        fwrite(v12, 4uLL, a4, v11);
        BaseAddress += 2 * v16;
        ++v15;
      }
      while (v15 != a5);
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v11);
    free(v12);
  }
  else
  {
    NSLog(&cfstr_CouldNotCreate_0.isa, a6);
  }
}

- (void)saveF16Texture:(id)a3 AsF32BinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v12 = sub_262E6D3FC(a4, v7, v8, v9, v10, v11);
  if (v12)
  {
    unsigned int v18 = v12;
    unsigned int v19 = objc_msgSend_width(v6, v13, v14, v15, v16, v17);
    unsigned int v25 = objc_msgSend_height(v6, v20, v21, v22, v23, v24);
    uint64_t v26 = 2 * v19;
    uint64_t v27 = malloc_type_malloc(4 * v19, 0x100004052888210uLL);
    uint64_t v28 = (char *)malloc_type_malloc(v26 * v25, 0xE83D517EuLL);
    objc_msgSend_makeCoherent_(self, v29, (uint64_t)v6, v30, v31, v32);
    memset(v43, 0, 24);
    v43[3] = v19;
    v43[4] = v25;
    v43[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v33, (uint64_t)v28, v26, (uint64_t)v43, 0);
    if (v25)
    {
      int v34 = 0;
      uint64_t v35 = v28;
      do
      {
        if (v19)
        {
          for (uint64_t i = 0; i != v19; v27[i++] = _S0)
          {
            _H0 = *(_WORD *)&v35[2 * i];
            __asm { FCVT            S0, H0 }
          }
        }
        fwrite(v27, 4uLL, v19, v18);
        ++v34;
        v35 += v26;
      }
      while (v34 != v25);
    }
    free(v27);
    free(v28);
    fclose(v18);
  }
}

- (void)saveNCCOutputFrom:(id)a3 asBinaryFiles:(const char *)a4
{
  id v6 = a3;
  objc_msgSend_waitForIdle(self->_metalContext, v7, v8, v9, v10, v11);
  objc_msgSend_makeCoherent_(self, v12, (uint64_t)v6, v13, v14, v15);
  uint64_t v21 = objc_msgSend_width(v6, v16, v17, v18, v19, v20);
  uint64_t v27 = objc_msgSend_height(v6, v22, v23, v24, v25, v26);
  unsigned int v33 = objc_msgSend_bufferBytesPerRow(v6, v28, v29, v30, v31, v32);
  int v34 = (char *)malloc_type_malloc(v33 * v27, 0x658C957BuLL);
  int32x2_t v35 = vabd_s32(vdup_n_s32(v33), (int32x2_t)vshl_u32((uint32x2_t)vdup_n_s32(v21), (uint32x2_t)0x400000003));
  unsigned __int8 v36 = vcgt_u32((uint32x2_t)vdup_lane_s32(v35, 1), (uint32x2_t)v35).u8[0];
  uint64_t v37 = @"f32";
  if (v36) {
    uint64_t v37 = @"f16";
  }
  uint64_t v38 = v37;
  memset(v159, 0, 24);
  v159[3] = v21;
  size_t v153 = v21;
  v159[4] = v27;
  v159[5] = 1;
  id v146 = v6;
  uint64_t v150 = v33;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v39, (uint64_t)v34, v33, (uint64_t)v159, 0);
  uint64_t v44 = objc_msgSend_stringWithFormat_(NSString, v40, @"%s_L_%dx%d.%@", v41, v42, v43, a4, v21, v27, v38);
  unsigned int v49 = objc_msgSend_stringWithFormat_(NSString, v45, @"%s_R_%dx%d.%@", v46, v47, v48, a4, v21, v27, v38);
  uint64_t v54 = objc_msgSend_stringWithFormat_(NSString, v50, @"%s_C_%dx%d.%@", v51, v52, v53, a4, v21, v27, v38);
  uint64_t v152 = v21;
  v157 = a4;
  v59 = objc_msgSend_stringWithFormat_(NSString, v55, @"%s_F_%dx%d.%@", v56, v57, v58, a4, v21, v27, v38);
  id v145 = v44;
  v65 = (const char *)objc_msgSend_UTF8String(v145, v60, v61, v62, v63, v64);
  v71 = sub_262E6D3FC(v65, v66, v67, v68, v69, v70);
  id v72 = v49;
  v78 = (const char *)objc_msgSend_UTF8String(v72, v73, v74, v75, v76, v77);
  v84 = sub_262E6D3FC(v78, v79, v80, v81, v82, v83);
  id v85 = v54;
  v91 = (const char *)objc_msgSend_UTF8String(v85, v86, v87, v88, v89, v90);
  v156 = sub_262E6D3FC(v91, v92, v93, v94, v95, v96);
  id v97 = v59;
  v103 = (const char *)objc_msgSend_UTF8String(v97, v98, v99, v100, v101, v102);
  v109 = sub_262E6D3FC(v103, v104, v105, v106, v107, v108);
  v110 = 0;
  v154 = v109;
  __stream = v71;
  id v147 = 0;
  if (v71)
  {
    v111 = v84;
    if (v84)
    {
      v112 = v146;
      if (!v156 || !v109) {
        goto LABEL_34;
      }
      id v141 = v97;
      id v142 = v85;
      id v143 = v72;
      v151 = (const char *)v27;
      v144 = v34;
      uint64_t v113 = 4;
      if (v36) {
        uint64_t v113 = 2;
      }
      size_t __size = v113;
      char v114 = 1;
      if ((v36 & 1) == 0) {
        char v114 = 2;
      }
      size_t v115 = v153 << v114;
      v116 = (char *)malloc_type_malloc(v153 << v114, 0xC1004B0FuLL);
      v117 = (char *)malloc_type_malloc(v115, 0xC203B6DuLL);
      v118 = (char *)malloc_type_malloc(v115, 0x769BED74uLL);
      v123 = (char *)malloc_type_malloc(v115, 0x1C0FB887uLL);
      if (v36)
      {
        id v147 = 0;
        v110 = 0;
        if (!v151) {
          goto LABEL_23;
        }
      }
      else
      {
        objc_msgSend_stringWithFormat_(NSString, v119, @"%s_L_%dx%d.ppm", v120, v121, v122, v157, v152, v151);
        id v147 = (id)objc_claimAutoreleasedReturnValue();
        v110 = malloc_type_malloc((4 * v152 * v151), 0xD910200EuLL);
        if (!v151)
        {
LABEL_23:
          if ((v36 & 1) == 0)
          {
            id v133 = v147;
            v139 = (const char *)objc_msgSend_UTF8String(v133, v134, v135, v136, v137, v138);
            sub_262E6D988(v152, v151, (4 * v152), (uint64_t)v110, v139, v140);
          }
          if (v116) {
            free(v116);
          }
          v112 = v146;
          id v97 = v141;
          if (v117) {
            free(v117);
          }
          id v72 = v143;
          if (v118) {
            free(v118);
          }
          id v85 = v142;
          if (v123) {
            free(v123);
          }
          int v34 = v144;
LABEL_34:
          if (!v34) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
      }
      int v124 = 0;
      int v125 = 0;
      v126 = v144;
      unsigned __int8 v148 = v36;
      do
      {
        int v158 = v125;
        if (v152)
        {
          uint64_t v127 = 0;
          uint64_t v128 = 0;
          do
          {
            uint64_t v129 = (v128 + 1);
            uint64_t v130 = (v128 + 2);
            uint64_t v131 = (v128 + 3);
            if (v36)
            {
              *(_WORD *)&v116[v127] = *(_WORD *)&v126[2 * v128];
              *(_WORD *)&v117[v127] = *(_WORD *)&v126[2 * v129];
              *(_WORD *)&v118[v127] = *(_WORD *)&v126[2 * v130];
              *(_WORD *)&v123[v127] = *(_WORD *)&v126[2 * v131];
            }
            else
            {
              *(_DWORD *)&v116[v128] = *(_DWORD *)&v126[4 * v128];
              *(_DWORD *)&v117[v128] = *(_DWORD *)&v126[4 * v129];
              *(_DWORD *)&v118[v128] = *(_DWORD *)&v126[4 * v130];
              *(_DWORD *)&v123[v128] = *(_DWORD *)&v126[4 * v131];
              float v132 = fmaxf(fminf(*(float *)&v126[4 * v128] * 25500.0, 255.0), 0.0);
              v110[(v124 + v128 + 2)] = (int)v132;
              v110[(v124 + v128 + 1)] = (int)v132;
              v110[(v124 + v128)] = (int)v132;
              v110[(v124 + v128 + 3)] = -1;
            }
            v128 += 4;
            v127 += 2;
          }
          while (4 * v153 != v128);
        }
        fwrite(v116, __size, v153, __stream);
        fwrite(v117, __size, v153, v111);
        fwrite(v118, __size, v153, v156);
        unsigned __int8 v36 = v148;
        fwrite(v123, __size, v153, v154);
        v126 += v150;
        int v125 = v158 + 1;
        v124 += 4 * v152;
      }
      while (v158 + 1 != v151);
      goto LABEL_23;
    }
  }
  else
  {
    v111 = v84;
  }
  v112 = v146;
  if (v34) {
LABEL_35:
  }
    free(v34);
LABEL_36:
  if (v110) {
    free(v110);
  }
  if (__stream) {
    fclose(__stream);
  }
  if (v111) {
    fclose(v111);
  }
  if (v156) {
    fclose(v156);
  }
  if (v154) {
    fclose(v154);
  }
}

- (void)savePixelBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  uint64_t v10 = objc_msgSend_stringWithFormat_(NSString, v6, @"%s.%c%c%c%c", v7, v8, v9, a4, HIBYTE(PixelFormatType), BYTE2(PixelFormatType), BYTE1(PixelFormatType), PixelFormatType);
  objc_msgSend_createPathIfNeeded_(disparityDebugUtils, v11, (uint64_t)v10, v12, v13, v14);
  id v20 = v10;
  objc_msgSend_UTF8String(v20, v15, v16, v17, v18, v19);
  WritePixelBufferToFile();
}

- (void)WriteBinDataToFile:(void *)a3 length:(unsigned int)a4 fileFullPath:(const char *)a5
{
  uint64_t v8 = sub_262E6D3FC(a5, a2, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5, v5);
  if (v8)
  {
    uint64_t v9 = v8;
    fwrite(a3, 1uLL, a4, v8);
    fclose(v9);
  }
}

+ (void)createPathIfNeeded:(id)a3
{
  id v6 = objc_msgSend_stringByDeletingLastPathComponent(a3, a2, (uint64_t)a3, v3, v4, v5);
  uint64_t v12 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v7, v8, v9, v10, v11);
  id v17 = 0;
  char DirectoryAtPath_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v12, v13, (uint64_t)v6, 1, 0, (uint64_t)&v17);
  id v15 = v17;
  uint64_t v16 = v15;
  if ((DirectoryAtPath_withIntermediateDirectories_attributes_error & 1) == 0) {
    NSLog(&cfstr_FailedToCreate.isa, v6, v15);
  }
}

- (void)saveAccumulationFrom:(id)a3 asBinaryFiles:(const char *)a4 forSize:(CGSize)a5 costLineSize:(unsigned __int16)a6
{
  unsigned int v127 = a6;
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  objc_msgSend_waitForIdle(self->_metalContext, v11, v12, v13, v14, v15);
  objc_msgSend_makeCoherent_(self, v16, (uint64_t)v10, v17, v18, v19);
  size_t v135 = width;
  id v20 = (char *)malloc_type_malloc(4 * v135, 0x100004052888210uLL);
  uint64_t v21 = (char *)malloc_type_malloc(4 * v135, 0x100004052888210uLL);
  uint64_t v22 = (char *)malloc_type_malloc(4 * v135, 0x100004052888210uLL);
  uint64_t v23 = (char *)malloc_type_malloc(4 * v135, 0x100004052888210uLL);
  id v125 = v10;
  uint64_t v29 = objc_msgSend_contents(v125, v24, v25, v26, v27, v28);
  int v34 = objc_msgSend_stringWithFormat_(NSString, v30, @"%s_L.f32", v31, v32, v33, a4);
  uint64_t v39 = objc_msgSend_stringWithFormat_(NSString, v35, @"%s_R.f32", v36, v37, v38, a4);
  uint64_t v44 = objc_msgSend_stringWithFormat_(NSString, v40, @"%s_C.f32", v41, v42, v43, a4);
  objc_msgSend_stringWithFormat_(NSString, v45, @"%s_W.f32", v46, v47, v48, a4);
  id v133 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(NSString, v49, @"%s_L.ppm", v50, v51, v52, a4);
  id v126 = (id)objc_claimAutoreleasedReturnValue();
  id v124 = v34;
  uint64_t v58 = (const char *)objc_msgSend_UTF8String(v124, v53, v54, v55, v56, v57);
  uint64_t v64 = sub_262E6D3FC(v58, v59, v60, v61, v62, v63);
  id v65 = v39;
  v71 = (const char *)objc_msgSend_UTF8String(v65, v66, v67, v68, v69, v70);
  uint64_t v77 = sub_262E6D3FC(v71, v72, v73, v74, v75, v76);
  id v78 = v44;
  v84 = (const char *)objc_msgSend_UTF8String(v78, v79, v80, v81, v82, v83);
  float v132 = sub_262E6D3FC(v84, v85, v86, v87, v88, v89);
  id v90 = v133;
  uint64_t v96 = (const char *)objc_msgSend_UTF8String(v90, v91, v92, v93, v94, v95);
  uint64_t v102 = sub_262E6D3FC(v96, v97, v98, v99, v100, v101);
  v103 = v64;
  v104 = 0;
  uint64_t v130 = v102;
  uint64_t v131 = v77;
  if (!v103 || !v77)
  {
LABEL_12:
    uint64_t v105 = v132;
    goto LABEL_13;
  }
  uint64_t v105 = v132;
  if (v132 && v102)
  {
    __stream = v103;
    id v123 = v90;
    uint64_t v106 = malloc_type_malloc(4 * height * v135, 0x1E49E871uLL);
    unsigned int v107 = width;
    v104 = v106;
    unsigned int v128 = height;
    if (height)
    {
      int v108 = 0;
      int v109 = 0;
      do
      {
        int v134 = v109;
        if (v107)
        {
          uint64_t v110 = 0;
          do
          {
            float v111 = *(float *)(v29 + 4 * v110);
            *(float *)&v20[v110] = v111;
            float v112 = fmaxf(fminf(v111 * 25500.0, 255.0), 0.0);
            v104[(v108 + v110 + 2)] = (int)v112;
            v104[(v108 + v110 + 1)] = (int)v112;
            v104[(v108 + v110)] = (int)v112;
            v104[(v108 + v110 + 3)] = -1;
            *(_DWORD *)&v21[v110] = *(_DWORD *)(v29 + 4 * (v110 + 1));
            *(_DWORD *)&v22[v110] = *(_DWORD *)(v29 + 4 * (v110 + 2));
            *(_DWORD *)&v23[v110] = *(_DWORD *)(v29 + 4 * (v110 + 3));
            v110 += 4;
          }
          while (4 * v135 != v110);
        }
        fwrite(v20, 4uLL, v135, __stream);
        fwrite(v21, 4uLL, v135, v131);
        fwrite(v22, 4uLL, v135, v132);
        fwrite(v23, 4uLL, v135, v130);
        unsigned int v107 = width;
        v29 += 4 * v127;
        int v109 = v134 + 1;
        v108 += 4 * v135;
      }
      while (v134 + 1 != v128);
    }
    uint64_t v113 = 4 * v107;
    unsigned int v114 = v107;
    id v115 = v126;
    uint64_t v121 = (const char *)objc_msgSend_UTF8String(v115, v116, v117, v118, v119, v120);
    sub_262E6D988(v114, (const char *)v128, v113, (uint64_t)v104, v121, v122);
    id v90 = v123;
    v103 = __stream;
    goto LABEL_12;
  }
LABEL_13:
  if (v103) {
    fclose(v103);
  }
  if (v131) {
    fclose(v131);
  }
  if (v105) {
    fclose(v105);
  }
  if (v130) {
    fclose(v130);
  }
  free(v104);
  free(v20);
  free(v21);
  free(v22);
  free(v23);
}

- (void)saveF32Texture:(id)a3 AsF32BinaryFile:(const char *)a4
{
  id v6 = a3;
  uint64_t v17 = sub_262E6D3FC(a4, v7, v8, v9, v10, v11);
  if (v17)
  {
    unsigned int v18 = objc_msgSend_width(v6, v12, v13, v14, v15, v16);
    unsigned int v24 = objc_msgSend_height(v6, v19, v20, v21, v22, v23);
    size_t v25 = v18;
    size_t v26 = 4 * v18;
    uint64_t v27 = (char *)malloc_type_malloc(v26, 0x100004052888210uLL);
    if (v27)
    {
      uint64_t v32 = (char *)malloc_type_malloc((v26 * v24) & 0xFFFFFFFC, 0x3A8A47EAuLL);
      if (v32)
      {
        objc_msgSend_makeCoherent_(self, v28, (uint64_t)v6, v29, v30, v31);
        memset(v37, 0, 24);
        v37[3] = v25;
        v37[4] = v24;
        v37[5] = 1;
        objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v33, (uint64_t)v32, v26 & 0xFFFFFFFC, (uint64_t)v37, 0);
        if (v24)
        {
          int v34 = 0;
          int32x2_t v35 = v32;
          do
          {
            if (v25)
            {
              uint64_t v36 = 0;
              do
              {
                *(_DWORD *)&v27[v36] = *(_DWORD *)&v35[v36];
                v36 += 4;
              }
              while (v26 != v36);
            }
            fwrite(v27, 4uLL, v25, v17);
            ++v34;
            v35 += v26 & 0xFFFFFFFC;
          }
          while (v34 != v24);
        }
      }
      else
      {
        FigDebugAssert3();
      }
    }
    else
    {
      FigDebugAssert3();
      uint64_t v32 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v32 = 0;
    uint64_t v27 = 0;
  }
  free(v27);
  free(v32);
  fclose(v17);
}

- (void)saveRGBA16FTexture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  uint64_t v12 = sub_262E6D3FC(a4, v7, v8, v9, v10, v11);
  if (v12)
  {
    unsigned int v18 = v12;
    unsigned int v19 = objc_msgSend_width(v6, v13, v14, v15, v16, v17);
    unsigned int v25 = objc_msgSend_height(v6, v20, v21, v22, v23, v24);
    size_t v26 = malloc_type_malloc(3 * v19, 0x83FFD161uLL);
    uint64_t v27 = (char *)malloc_type_malloc(8 * v19 * v25, 0x32C1A2B9uLL);
    fprintf(v18, "P6 %u %u 255\n", v19, v25);
    objc_msgSend_makeCoherent_(self, v28, (uint64_t)v6, v29, v30, v31);
    memset(v48, 0, 24);
    v48[3] = v19;
    v48[4] = v25;
    v48[5] = 1;
    id v47 = v6;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v32, (uint64_t)v27, 8 * v19, (uint64_t)v48, 0);
    if (v25)
    {
      int v33 = 0;
      int v34 = v27;
      do
      {
        if (v19)
        {
          uint64_t v35 = 0;
          unsigned int v36 = 2;
          do
          {
            _H0 = *(_WORD *)&v34[2 * v35];
            __asm { FCVT            S0, H0 }
            char v43 = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            LOWORD(_S0) = *(_WORD *)&v34[2 * (v35 + 1)];
            __asm { FCVT            S0, H0 }
            char v45 = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            LOWORD(_S0) = *(_WORD *)&v34[2 * (v35 + 2)];
            __asm { FCVT            S0, H0 }
            v26[v36 - 2] = v43;
            v26[v36 - 1] = v45;
            v26[v36] = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            v36 += 3;
            v35 += 4;
          }
          while (4 * v19 != v35);
        }
        fwrite(v26, 3uLL, v19, v18);
        v34 += 8 * v19;
        ++v33;
      }
      while (v33 != v25);
    }
    free(v26);
    free(v27);
    fclose(v18);
    id v6 = v47;
  }
}

- (void)saveRGBA16FTexture:(id)a3 AsF32File:(const char *)a4
{
  id v6 = a3;
  uint64_t v12 = sub_262E6D3FC(a4, v7, v8, v9, v10, v11);
  if (v12)
  {
    unsigned int v18 = v12;
    unsigned int v19 = objc_msgSend_width(v6, v13, v14, v15, v16, v17);
    unsigned int v25 = objc_msgSend_height(v6, v20, v21, v22, v23, v24);
    size_t v26 = malloc_type_malloc(16 * v19, 0x100004052888210uLL);
    uint64_t v27 = (char *)malloc_type_malloc(8 * v19 * v25, 0x5DEDB4EEuLL);
    objc_msgSend_makeCoherent_(self, v28, (uint64_t)v6, v29, v30, v31);
    memset(v43, 0, 24);
    v43[3] = v19;
    v43[4] = v25;
    v43[5] = 1;
    uint64_t v42 = v27;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v32, (uint64_t)v27, 8 * v19, (uint64_t)v43, 0);
    if (v25)
    {
      for (int i = 0; i != v25; ++i)
      {
        if (v19)
        {
          uint64_t v35 = 0;
          do
          {
            _H0 = *(_WORD *)&v27[2 * (v35 + 2)];
            __asm { FCVT            S0, H0 }
            v33.i32[0] = *(_DWORD *)&v27[2 * v35];
            float16x4_t v33 = (float16x4_t)vcvtq_f32_f16(v33).u64[0];
            *(float16x4_t *)&v26[v35] = v33;
            v26[(v35 + 2)] = _S0;
            v26[(v35 + 3)] = 0;
            v35 += 4;
          }
          while (4 * v19 != v35);
        }
        fwrite(v26, 0x10uLL, v19, v18);
        v27 += 8 * v19;
      }
    }
    free(v26);
    free(v42);
    fclose(v18);
  }
}

- (void)saveRGB10A2Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  uint64_t v12 = sub_262E6D3FC(a4, v7, v8, v9, v10, v11);
  if (v12)
  {
    unsigned int v18 = v12;
    if (objc_msgSend_pixelFormat(v6, v13, v14, v15, v16, v17) == 90)
    {
      unsigned int v24 = objc_msgSend_width(v6, v19, v20, v21, v22, v23);
      unsigned int v30 = objc_msgSend_height(v6, v25, v26, v27, v28, v29);
      uint64_t v31 = malloc_type_malloc(3 * v24, 0xF0F0E241uLL);
      uint64_t v32 = (char *)malloc_type_malloc(4 * v24 * v30, 0x40BD4609uLL);
      fprintf(v18, "P6 %u %u 255\n", v24, v30);
      objc_msgSend_makeCoherent_(self, v33, (uint64_t)v6, v34, v35, v36);
      memset(v44, 0, 24);
      v44[3] = v24;
      v44[4] = v30;
      v44[5] = 1;
      char v43 = v32;
      objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v37, (uint64_t)v32, 4 * v24, (uint64_t)v44, 0);
      if (v30)
      {
        int v38 = 0;
        uint64_t v39 = 4 * v24;
        do
        {
          if (v24)
          {
            uint64_t v40 = 0;
            unsigned int v41 = 2;
            do
            {
              unsigned int v42 = *(_DWORD *)&v32[v40];
              v31[v41 - 2] = vcvtms_s32_f32((float)((float)(v42 & 0x3FF) / 1023.0) * 255.0);
              v31[v41 - 1] = vcvtms_s32_f32((float)((float)((v42 >> 10) & 0x3FF) / 1023.0) * 255.0);
              v31[v41] = vcvtms_s32_f32((float)((float)((v42 >> 20) & 0x3FF) / 1023.0) * 255.0);
              v41 += 3;
              v40 += 4;
            }
            while (v39 != v40);
          }
          fwrite(v31, 3uLL, v24, v18);
          ++v38;
          v32 += v39;
        }
        while (v38 != v30);
      }
      free(v31);
      free(v43);
      fclose(v18);
    }
  }
}

- (void).cxx_destruct
{
}

@end