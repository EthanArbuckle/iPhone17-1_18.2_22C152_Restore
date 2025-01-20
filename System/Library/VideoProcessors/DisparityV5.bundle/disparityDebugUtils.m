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

  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v9, Width, Height, (uint64_t)BaseAddress, (uint64_t)a4, v11, v12, v13);
}

- (void)saveF32FPBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 scale:(float)a5
{
  uint64_t v11 = sub_262ED5DCC(a4, a2, a5, (uint64_t)a3, (uint64_t)a4, v5, v6, v7, v8);
  if (v11)
  {
    uint64_t v12 = v11;
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    v17 = malloc_type_malloc(3 * Width, 0x45A6691EuLL);
    unsigned int v27 = Width;
    fprintf(v12, "P6 %u %u 255\n", Width, Height);
    int v26 = Height;
    if (Height)
    {
      int v18 = 0;
      size_t v19 = Width;
      uint64_t v20 = BytesPerRow & 0xFFFFFFFC;
      uint64_t v21 = 4 * Width;
      do
      {
        v22 = v12;
        if (v27)
        {
          uint64_t v23 = 0;
          unsigned int v24 = 2;
          do
          {
            char v25 = vcvtms_s32_f32(fmaxf(fminf(powf(*(float *)&BaseAddress[v23], a5) * 255.0, 255.0), 0.0));
            v17[v24 - 2] = v25;
            v17[v24 - 1] = v25;
            v17[v24] = v25;
            v24 += 3;
            v23 += 4;
          }
          while (v21 != v23);
        }
        uint64_t v12 = v22;
        fwrite(v17, 3uLL, v19, v22);
        ++v18;
        BaseAddress += v20;
      }
      while (v18 != v26);
    }
    free(v17);
    fclose(v12);
  }
}

- (void)saveF16Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 scale:(float)a5
{
  uint64_t v11 = sub_262ED5DCC(a4, a2, a5, (uint64_t)a3, (uint64_t)a4, v5, v6, v7, v8);
  if (v11)
  {
    uint64_t v12 = v11;
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    v17 = malloc_type_malloc(3 * Width, 0x38B1F978uLL);
    unsigned int v33 = Width;
    fprintf(v12, "P6 %u %u 255\n", Width, Height);
    int v32 = Height;
    if (Height)
    {
      int v18 = 0;
      size_t v19 = Width;
      uint64_t v20 = BytesPerRow & 0xFFFFFFFE;
      uint64_t v21 = 2 * Width;
      do
      {
        v22 = v12;
        if (v33)
        {
          uint64_t v23 = 0;
          unsigned int v24 = 2;
          do
          {
            _H0 = *(_WORD *)&BaseAddress[v23];
            __asm { FCVT            S0, H0; float }
            char v31 = vcvtms_s32_f32(fmaxf(fminf(powf(_S0, a5) * 255.0, 255.0), 0.0));
            v17[v24 - 2] = v31;
            v17[v24 - 1] = v31;
            v17[v24] = v31;
            v24 += 3;
            v23 += 2;
          }
          while (v21 != v23);
        }
        uint64_t v12 = v22;
        fwrite(v17, 3uLL, v19, v22);
        ++v18;
        BaseAddress += v20;
      }
      while (v18 != v32);
    }
    free(v17);
    fclose(v12);
  }
}

- (void)saveF16Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  v15 = sub_262ED5DCC(a4, v7, v14, v8, v9, v10, v11, v12, v13);
  if (v15)
  {
    unsigned int v24 = v15;
    unsigned int v25 = objc_msgSend_width(v6, v16, v17, v18, v19, v20, v21, v22, v23);
    unsigned int v34 = objc_msgSend_height(v6, v26, v27, v28, v29, v30, v31, v32, v33);
    v35 = malloc_type_malloc(3 * v25, 0xE57BCB10uLL);
    v36 = (char *)malloc_type_malloc(2 * v25 * v34, 0x2CCF1F48uLL);
    fprintf(v24, "P6 %u %u 255\n", v25, v34);
    objc_msgSend_makeCoherent_(self, v37, (uint64_t)v6, v38, v39, v40, v41, v42, v43);
    memset(v60, 0, 24);
    v60[3] = v25;
    v60[4] = v34;
    v60[5] = 1;
    v59 = v36;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v44, (uint64_t)v36, 2 * v25, (uint64_t)v60, 0, v45, v46, v47);
    if (v34)
    {
      int v48 = 0;
      uint64_t v49 = 2 * v25;
      do
      {
        if (v25)
        {
          uint64_t v50 = 0;
          unsigned int v51 = 2;
          do
          {
            _H0 = *(_WORD *)&v36[v50];
            __asm { FCVT            S0, H0 }
            char v58 = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            v35[v51 - 2] = v58;
            v35[v51 - 1] = v58;
            v35[v51] = v58;
            v51 += 3;
            v50 += 2;
          }
          while (v49 != v50);
        }
        fwrite(v35, 3uLL, v25, v24);
        ++v48;
        v36 += v49;
      }
      while (v48 != v34);
    }
    free(v35);
    free(v59);
    fclose(v24);
  }
}

- (void)saveF32Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
  unsigned int Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  uint64_t v9 = malloc_type_malloc(4 * Width * Height, 0x56DD33FCuLL);
  uint64_t v17 = v9;
  if (Height)
  {
    unsigned int v18 = 0;
    int v19 = 0;
    do
    {
      uint64_t v20 = Width;
      unsigned int v21 = v18;
      if (Width)
      {
        do
        {
          int16x8_t v22 = vdupq_n_s16((int)(float)(BaseAddress[v21] * 255.0));
          v22.i16[3] = 255;
          LODWORD(v16) = vmovn_s16(v22).u32[0];
          *((float *)v9 + v21++) = v16;
          --v20;
        }
        while (v20);
      }
      ++v19;
      v18 += Width;
    }
    while (v19 != Height);
  }
  float v23 = objc_msgSend_stringWithFormat_(NSString, v10, @"%s", v11, v12, v13, v14, v15, v16, a4);
  objc_msgSend_createPathIfNeeded_(disparityDebugUtils, v24, (uint64_t)v23, v25, v26, v27, v28, v29, v30);
  id v44 = v23;
  uint64_t v39 = (const char *)objc_msgSend_UTF8String(v44, v31, v32, v33, v34, v35, v36, v37, v38);
  sub_262ED6358(Width, (const char *)Height, 4 * Width, (uint64_t)v17, v39, v40, v41, v42, v43);
  free(v17);
}

- (void)saveU8Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a3);
  unsigned int Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  uint64_t v10 = malloc_type_malloc(4 * Width * Height, 0x4E9F3C5uLL);
  unsigned int v18 = v10;
  if (Height)
  {
    int v19 = 0;
    unsigned int v20 = 0;
    int v21 = 0;
    do
    {
      uint64_t v22 = Width;
      int v23 = v19;
      unsigned int v24 = v20;
      if (Width)
      {
        do
        {
          int16x8_t v25 = vdupq_n_s16(BaseAddress[v23]);
          v25.i16[3] = 255;
          LODWORD(v17) = vmovn_s16(v25).u32[0];
          *((float *)v10 + v24++) = v17;
          ++v23;
          --v22;
        }
        while (v22);
      }
      ++v21;
      v20 += Width;
      v19 += BytesPerRow;
    }
    while (v21 != Height);
  }
  uint64_t v26 = objc_msgSend_stringWithFormat_(NSString, v11, @"%s", v12, v13, v14, v15, v16, v17, a4);
  objc_msgSend_createPathIfNeeded_(disparityDebugUtils, v27, (uint64_t)v26, v28, v29, v30, v31, v32, v33);
  id v47 = v26;
  uint64_t v42 = (const char *)objc_msgSend_UTF8String(v47, v34, v35, v36, v37, v38, v39, v40, v41);
  sub_262ED6358(Width, (const char *)Height, 4 * Width, (uint64_t)v18, v42, v43, v44, v45, v46);
  free(v18);
}

- (void)saveVUYA4444Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v15 = objc_msgSend_width(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v24 = objc_msgSend_height(v6, v16, v17, v18, v19, v20, v21, v22, v23);
  int16x8_t v25 = malloc_type_malloc(4 * v15 * v24, 0xCE17F4E7uLL);
  objc_msgSend_makeCoherent_(self, v26, (uint64_t)v6, v27, v28, v29, v30, v31, v32);
  memset(v45, 0, 24);
  v45[3] = v15;
  v45[4] = v24;
  v45[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v33, (uint64_t)v25, 4 * v15, (uint64_t)v45, 0, v34, v35, v36);

  objc_msgSend_convertVUYA444_rbs_ToRGBA_ofSize_(self, v37, (uint64_t)v25, 4 * v15, (uint64_t)v25, v38, v39, v40, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)v15)), (double)v24);
  sub_262ED6358(v15, (const char *)v24, 4 * v15, (uint64_t)v25, a4, v41, v42, v43, v44);
  free(v25);
}

- (void)saveVUYA4444Texture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v15 = objc_msgSend_width(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  unsigned int v24 = objc_msgSend_height(v6, v16, v17, v18, v19, v20, v21, v22, v23);
  int16x8_t v25 = malloc_type_malloc(4 * v15 * v24, 0x307EB1D4uLL);
  objc_msgSend_makeCoherent_(self, v26, (uint64_t)v6, v27, v28, v29, v30, v31, v32);
  memset(v42, 0, 24);
  v42[3] = v15;
  v42[4] = v24;
  v42[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v33, (uint64_t)v25, 4 * v15, (uint64_t)v42, 0, v34, v35, v36);

  objc_msgSend_WriteBinDataToFile_length_fileFullPath_(self, v37, (uint64_t)v25, 4 * v15 * v24, (uint64_t)a4, v38, v39, v40, v41);
  free(v25);
}

- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4
{
}

- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsBinaryFile:(const char *)a6
{
  int Height = a5;
  unsigned int Width = a4;
  uint64_t v12 = sub_262ED5DCC(a6, a2, v8, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, (uint64_t)a6, v6, v7);
  if (!v12) {
    return;
  }
  uint64_t v13 = v12;
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
    uint64_t v16 = BaseAddress;
    do
    {
      fwrite(v16, 4uLL, Width, v13);
      v16 += BytesPerRow;
      --Height;
    }
    while (Height);
  }
  fclose(v13);

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
  float v14 = malloc_type_malloc(4 * Width * Height, 0x10F0BD5AuLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  objc_msgSend_convertVUYA444_rbs_ToRGBA_ofSize_(self, v16, (uint64_t)BaseAddress, BytesPerRow, (uint64_t)v14, v17, v18, v19, COERCE_FLOAT(COERCE_UNSIGNED_INT64((double)Width)), (double)Height);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (a4) {
    unsigned int v24 = a4;
  }
  else {
    unsigned int v24 = Width;
  }
  if (a5) {
    int16x8_t v25 = (const char *)a5;
  }
  else {
    int16x8_t v25 = (const char *)Height;
  }
  sub_262ED6358(v24, v25, 4 * Width, (uint64_t)v14, a6, v20, v21, v22, v23);

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
  float v14 = malloc_type_malloc(4 * Width * Height, 0xC9F1BBE4uLL);
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
    objc_msgSend_convertRGB10A2ToRGBA8_rbs_ToRGBA_outWidth_outHeight_(self, v15, (uint64_t)BaseAddress, BytesPerRow, (uint64_t)v14, v8, v7, v17, v18);
  }
  else
  {
    unint64_t v7 = Height;
    objc_msgSend_convertRGB10A2ToRGBA8_rbs_ToRGBA_outWidth_outHeight_(self, v15, (uint64_t)BaseAddress, BytesPerRow, (uint64_t)v14, v8, Height, v17, v18);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  sub_262ED6358(v8, (const char *)v7, (4 * v8), (uint64_t)v14, a6, v19, v20, v21, v22);

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
  float v14 = malloc_type_malloc(4 * Width * Height, 0xF19A5099uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  if (v8) {
    size_t v8 = v8;
  }
  else {
    size_t v8 = Width;
  }
  if (a5)
  {
    objc_msgSend_convertRGB10A2ToRGBA8_rbs_ToRGBA_outWidth_outHeight_(self, v15, (uint64_t)BaseAddress, BytesPerRow, (uint64_t)v14, v8, a5, v17, v18);
  }
  else
  {
    a5 = Height;
    objc_msgSend_convertRGB10A2ToRGBA8_rbs_ToRGBA_outWidth_outHeight_(self, v15, (uint64_t)BaseAddress, BytesPerRow, (uint64_t)v14, v8, Height, v17, v18);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  uint64_t v27 = sub_262ED5DCC(a6, v19, v26, v20, v21, v22, v23, v24, v25);
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = (char *)malloc_type_malloc((4 * v8), 0xCF9B36E4uLL);
    if (v29)
    {
      uint64_t v30 = v29;
      fprintf(v28, "P7\nWIDTH %u\nHEIGHT %u\nDEPTH 4\nMAXVAL 255\nTUPLTYPE RGB_ALPHA\nENDHDR", v8, a5);
      if (a5)
      {
        int v31 = 0;
        float v32 = v14;
        do
        {
          if (v8)
          {
            uint64_t v33 = 0;
            int v34 = v8;
            do
            {
              uint64_t v35 = &v30[v33];
              char *v35 = v32[v33];
              v35[1] = v32[v33 + 1];
              v35[2] = v32[v33 + 2];
              v35[3] = v32[v33 + 3];
              v33 += 4;
              --v34;
            }
            while (v34);
          }
          fwrite(v30, 4uLL, v8, v28);
          v32 += (4 * v8);
          ++v31;
        }
        while (v31 != a5);
      }
      free(v30);
    }
    fclose(v28);
  }

  free(v14);
}

- (void)save420CVPixelBuffer:(__CVBuffer *)a3 to:(const char *)a4
{
  uint64_t v10 = sub_262ED5DCC(a4, a2, v8, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  if (v10)
  {
    uint64_t v11 = v10;
    unsigned int Width = CVPixelBufferGetWidth(a3);
    unsigned int Height = CVPixelBufferGetHeight(a3);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    unsigned int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    if (Height)
    {
      uint64_t v16 = BytesPerRowOfPlane;
      unsigned int v17 = Height;
      do
      {
        fwrite(BaseAddressOfPlane, 1uLL, Width, v11);
        BaseAddressOfPlane += v16;
        --v17;
      }
      while (v17);
    }
    float v18 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
    unsigned int v19 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
    if (Height)
    {
      unsigned int v20 = 0;
      uint64_t v21 = v19;
      do
      {
        fwrite(v18, 1uLL, Width, v11);
        v18 += v21;
        v20 += 2;
      }
      while (v20 < Height);
    }
    fclose(v11);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
}

- (void)saveLumaTexture:(id)a3 to:(const char *)a4
{
  id v6 = a3;
  unsigned int v15 = sub_262ED5DCC(a4, v7, v14, v8, v9, v10, v11, v12, v13);
  if (v15)
  {
    uint64_t v24 = v15;
    unsigned int v25 = objc_msgSend_width(v6, v16, v17, v18, v19, v20, v21, v22, v23);
    unsigned int v34 = objc_msgSend_height(v6, v26, v27, v28, v29, v30, v31, v32, v33);
    uint64_t v35 = malloc_type_malloc(v34 * v25, 0x620FB7E0uLL);
    objc_msgSend_makeCoherent_(self, v36, (uint64_t)v6, v37, v38, v39, v40, v41, v42);
    size_t v43 = v25;
    memset(v49, 0, 24);
    v49[3] = v25;
    v49[4] = v34;
    v49[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v44, (uint64_t)v35, v25, (uint64_t)v49, 0, v45, v46, v47);
    fwrite(v35, 1uLL, v34 * v25, v24);
    bzero(v35, v25);
    if (v34)
    {
      for (unsigned int i = 0; i < v34; i += 2)
        fwrite(v35, 1uLL, v43, v24);
    }
    free(v35);
    fclose(v24);
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
  unsigned int v15 = objc_msgSend_width(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v24 = objc_msgSend_height(v6, v16, v17, v18, v19, v20, v21, v22, v23);
  unsigned int v25 = malloc_type_malloc(4 * v15 * v24, 0xC2B60A0AuLL);
  objc_msgSend_makeCoherent_(self, v26, (uint64_t)v6, v27, v28, v29, v30, v31, v32);
  uint64_t v41 = objc_msgSend_width(v6, v33, v34, v35, v36, v37, v38, v39, v40);
  memset(v75, 0, 24);
  v75[3] = v15;
  v75[4] = v24;
  v75[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v42, (uint64_t)v25, 4 * v41, (uint64_t)v75, 0, v43, v44, v45);

  v53 = objc_msgSend_stringWithFormat_(NSString, v46, @"%s", v47, v48, v49, v50, v51, v52, a4);
  objc_msgSend_createPathIfNeeded_(disparityDebugUtils, v54, (uint64_t)v53, v55, v56, v57, v58, v59, v60);
  id v61 = v53;
  v70 = (const char *)objc_msgSend_UTF8String(v61, v62, v63, v64, v65, v66, v67, v68, v69);
  sub_262ED6358(v15, (const char *)v24, 4 * v15, (uint64_t)v25, v70, v71, v72, v73, v74);
  free(v25);
}

- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  uint64_t v11 = (char *)malloc_type_malloc(4 * (Width * Height), 0x100004052888210uLL);
  uint64_t v12 = v11;
  if (Height)
  {
    int v13 = 0;
    float v14 = v11;
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
  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v22, Width, Height, (uint64_t)v12, (uint64_t)a4, v23, v24, v25);

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
  float v14 = (char *)malloc_type_malloc(4 * Width * Height, 0x486BAFCBuLL);
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
            float v25 = (char *)&unk_262EEDED0
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
    sub_262ED6358(Width, (const char *)Height, 4 * Width, (uint64_t)v15, a4, v26, v27, v28, v29);
    free(v15);
  }
}

- (void)saveF16DisparityBufferAsTurbo:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 WithDisparityScale:(float)a5 AndPercentile:(float)a6
{
  uint64_t v19 = 0;
  objc_msgSend_computeRobustMinMaxForF16DisparityBuffer_WithDisparityScale_AndPercentile_OutSignalMin_OutSignalMax_(self, a2, (uint64_t)a3, (uint64_t)&v19 + 4, (uint64_t)&v19, v6, v7, v8, a5);
  *(float *)&double v13 = *(float *)&v19 * a5;
  objc_msgSend_saveF16DisparityBufferAsTurbo_AsPPMFile_WithMin_WithMax_(self, v14, (uint64_t)a3, (uint64_t)a4, v15, v16, v17, v18, *((float *)&v19 + 1) * a5, v13);
}

- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsGrayScalePPMFile:(const char *)a4 range:
{
  uint64_t v43 = v4;
  unsigned int Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (__int16 *)CVPixelBufferGetBaseAddress(a3);
  uint64_t v11 = (float *)malloc_type_malloc(4 * Height * Width, 0x100004052888210uLL);
  uint64_t v12 = (char *)v11;
  _H0 = *BaseAddress;
  __asm { FCVT            S8, H0 }
  if (Height)
  {
    int v19 = 0;
    uint64_t v20 = v11;
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
  BOOL v25 = *(float *)&v43 != 0.0;
  BOOL v26 = *((float *)&v43 + 1) != 0.0;
  BOOL v27 = v25 && v26;
  if (v25 && v26) {
    float v21 = *(float *)&v43;
  }
  uint64_t v28 = malloc_type_malloc(4 * Height * Width, 0xEEFFE344uLL);
  float v33 = v28;
  if (Height)
  {
    int v34 = 0;
    int v35 = 0;
    if (v27) {
      float v36 = *((float *)&v43 + 1);
    }
    else {
      float v36 = _S8;
    }
    float v32 = v36 - v21;
    uint64_t v37 = 4 * Width;
    uint64_t v38 = 4 * Width;
    uint64_t v39 = v12;
    do
    {
      if (Width)
      {
        uint64_t v40 = 0;
        do
        {
          char v41 = ~(int)((float)((float)(*(float *)&v39[v40] - v21) / v32) * 255.0);
          unsigned int v42 = v34 + v40;
          *((unsigned char *)v28 + v42) = v41;
          *((unsigned char *)v28 + v42 + 1) = v41;
          *((unsigned char *)v28 + v42 + 2) = v41;
          *((unsigned char *)v28 + v42 + 3) = -1;
          v40 += 4;
        }
        while (v38 != v40);
      }
      ++v35;
      v39 += v38;
      v34 += 4 * Width;
    }
    while (v35 != Height);
  }
  else
  {
    uint64_t v37 = 4 * Width;
  }
  sub_262ED6358(Width, (const char *)Height, v37, (uint64_t)v28, a4, v29, v30, v31, v32);
  free(v33);

  free(v12);
}

- (void)saveF16DisparityTexture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v15 = objc_msgSend_width(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  unsigned int v24 = objc_msgSend_height(v6, v16, v17, v18, v19, v20, v21, v22, v23);
  uint64_t v25 = v15;
  uint64_t v26 = 2 * v15;
  objc_msgSend_makeCoherent_(self, v27, (uint64_t)v6, v28, v29, v30, v31, v32, v33);
  int v34 = malloc_type_malloc(v26 * v24, 0x9A2D9640uLL);
  memset(v44, 0, 24);
  v44[3] = v25;
  v44[4] = v24;
  v44[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v35, (uint64_t)v34, v26, (uint64_t)v44, 0, v36, v37, v38);

  objc_msgSend_WriteBinDataToFile_length_fileFullPath_(self, v39, (uint64_t)v34, v26 * v24, (uint64_t)a4, v40, v41, v42, v43);
  free(v34);
}

- (void)saveF16Texture:(id)a3 AsGrayScalePPMFile:(const char *)a4 range:
{
  uint64_t v71 = v4;
  id v7 = a3;
  objc_msgSend_makeCoherent_(self, v8, (uint64_t)v7, v9, v10, v11, v12, v13, v14);
  unsigned int v23 = objc_msgSend_width(v7, v15, v16, v17, v18, v19, v20, v21, v22);
  uint64_t v32 = objc_msgSend_height(v7, v24, v25, v26, v27, v28, v29, v30, v31);
  float v33 = (char *)malloc_type_malloc(2 * v23 * v32, 0x1B666B80uLL);
  memset(v72, 0, 24);
  v72[3] = v23;
  v72[4] = v32;
  v72[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v7, v34, (uint64_t)v33, 2 * v23, (uint64_t)v72, 0, v35, v36, v37);
  float v38 = (float *)malloc_type_malloc(4 * v32 * v23, 0x100004052888210uLL);
  uint64_t v39 = (char *)v38;
  uint64_t v40 = 4 * v23;
  if (v32)
  {
    int v41 = 0;
    float v42 = 3.4028e38;
    float v43 = 1.1755e-38;
    uint64_t v44 = v38;
    float v45 = v33;
    do
    {
      if (v23)
      {
        for (uint64_t i = 0; i != v23; v44[i++] = _S1)
        {
          _H1 = *(_WORD *)&v45[2 * i];
          __asm { FCVT            S1, H1 }
          float v43 = fmaxf(v43, _S1);
          float v42 = fminf(v42, _S1);
        }
      }
      ++v41;
      v45 += 2 * v23;
      uint64_t v44 = (float *)((char *)v44 + v40);
    }
    while (v41 != v32);
  }
  else
  {
    float v43 = 1.1755e-38;
    float v42 = 3.4028e38;
  }
  BOOL v53 = *(float *)&v71 != 0.0;
  BOOL v54 = *((float *)&v71 + 1) != 0.0;
  BOOL v55 = v53 && v54;
  if (v53 && v54) {
    float v56 = *(float *)&v71;
  }
  else {
    float v56 = v42;
  }
  uint64_t v57 = malloc_type_malloc(4 * v32 * v23, 0xBD014032uLL);
  v62 = v57;
  if (v32)
  {
    int v63 = 0;
    int v64 = 0;
    if (v55) {
      float v65 = *((float *)&v71 + 1);
    }
    else {
      float v65 = v43;
    }
    float v61 = v65 - v56;
    uint64_t v66 = 4 * v23;
    uint64_t v67 = v39;
    do
    {
      if (v23)
      {
        uint64_t v68 = 0;
        do
        {
          char v69 = ~(int)((float)((float)(*(float *)&v67[v68] - v56) / v61) * 255.0);
          unsigned int v70 = v63 + v68;
          *((unsigned char *)v57 + v70) = v69;
          *((unsigned char *)v57 + v70 + 1) = v69;
          *((unsigned char *)v57 + v70 + 2) = v69;
          *((unsigned char *)v57 + v70 + 3) = -1;
          v68 += 4;
        }
        while (v40 != v68);
      }
      ++v64;
      v67 += v40;
      v63 += 4 * v23;
    }
    while (v64 != v32);
  }
  else
  {
    uint64_t v66 = 4 * v23;
  }
  sub_262ED6358(v23, (const char *)v32, v66, (uint64_t)v57, a4, v58, v59, v60, v61);
  free(v62);
  free(v33);
  free(v39);
}

- (void)ApplyColorWheelAndWrite:(unsigned int)a3 height:(unsigned int)a4 data:(float *)a5 fileFullPath:(const char *)a6
{
  uint64_t v8 = *(const char **)&a4;
  uint64_t v19 = (void **)sub_262EC5940(80, 30, 20, 20, 30, 0, 0, 1, 0.0);
  uint64_t v10 = malloc_type_malloc(4 * a3 * v8, 0xA525D3AAuLL);
  sub_262EC6098((uint64_t)v19, a3, (int)v8, a5, 4 * a3, 4, (uint64_t)v10, 4 * a3, v11, v12, v13, v14, 4);
  sub_262ED6358(a3, v8, 4 * a3, (uint64_t)v10, a6, v15, v16, v17, v18);
  free(v10);
  sub_262EC5F70(&v19);
}

- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4
{
  double v11 = sub_262ED5DCC(a4, a2, v8, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  if (v11)
  {
    double v12 = v11;
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    if (Height)
    {
      uint64_t v17 = BaseAddress;
      do
      {
        fwrite(v17, 2uLL, Width, v12);
        v17 += BytesPerRow;
        --Height;
      }
      while (Height);
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v12);
  }
  else
  {
    NSLog(&cfstr_CouldNotWriteS.isa, a4);
  }
}

- (void)saveU8Texture:(id)a3 AsPGMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v15 = objc_msgSend_width(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  unsigned int v24 = objc_msgSend_height(v6, v16, v17, v18, v19, v20, v21, v22, v23);
  unsigned int v25 = v24;
  size_t v26 = v15;
  uint64_t v27 = (char *)malloc_type_malloc(v24 * v15 + 4096, 0xEFD33B0CuLL);
  objc_msgSend_makeCoherent_(self, v28, (uint64_t)v6, v29, v30, v31, v32, v33, v34);
  memset(v50, 0, 24);
  v50[3] = v15;
  v50[4] = v24;
  v50[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v35, (uint64_t)v27, v15, (uint64_t)v50, 0, v36, v37, v38);
  uint64_t v47 = sub_262ED5DCC(a4, v39, v46, v40, v41, v42, v43, v44, v45);
  if (v47)
  {
    uint64_t v48 = v47;
    fprintf(v47, "P5 %u %u 255\n", v15, v24);
    if (v24)
    {
      uint64_t v49 = v27;
      do
      {
        fwrite(v49, 1uLL, v26, v48);
        v49 += v26;
        --v25;
      }
      while (v25);
    }
    fclose(v48);
  }
  free(v27);
}

- (void)saveU16Texture:(id)a3 AsPGMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v15 = objc_msgSend_width(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  unsigned int v24 = objc_msgSend_height(v6, v16, v17, v18, v19, v20, v21, v22, v23);
  unsigned int v25 = v24;
  uint64_t v26 = 2 * v15;
  uint64_t v27 = (char *)malloc_type_malloc(v26 * v24, 0xA470F0F9uLL);
  objc_msgSend_makeCoherent_(self, v28, (uint64_t)v6, v29, v30, v31, v32, v33, v34);
  memset(v53, 0, 24);
  v53[3] = v15;
  v53[4] = v24;
  v53[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v35, (uint64_t)v27, v26, (uint64_t)v53, 0, v36, v37, v38);
  uint64_t v47 = sub_262ED5DCC(a4, v39, v46, v40, v41, v42, v43, v44, v45);
  if (v47)
  {
    uint64_t v48 = v47;
    fprintf(v47, "P5 %u %u 65535\n", v15, v24);
    if (v24)
    {
      int v49 = 0;
      uint64_t v50 = 2 * v15;
      uint64_t v51 = v27;
      do
      {
        if (v15)
        {
          uint64_t v52 = 0;
          do
          {
            fprintf(v48, "%u ", *(unsigned __int16 *)&v51[v52]);
            v52 += 2;
          }
          while (v50 != v52);
        }
        fputc(10, v48);
        ++v49;
        v51 += v50;
      }
      while (v49 != v25);
    }
    fclose(v48);
  }
  free(v27);
}

- (void)saveF16RGTexture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v15 = objc_msgSend_width(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  unsigned int v24 = objc_msgSend_height(v6, v16, v17, v18, v19, v20, v21, v22, v23);
  uint64_t v25 = v15;
  uint64_t v26 = 4 * v15;
  objc_msgSend_makeCoherent_(self, v27, (uint64_t)v6, v28, v29, v30, v31, v32, v33);
  float v34 = malloc_type_malloc(v26 * v24, 0x251B8C2FuLL);
  memset(v44, 0, 24);
  v44[3] = v25;
  v44[4] = v24;
  v44[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v35, (uint64_t)v34, v26, (uint64_t)v44, 0, v36, v37, v38);

  objc_msgSend_WriteBinDataToFile_length_fileFullPath_(self, v39, (uint64_t)v34, v26 * v24, (uint64_t)a4, v40, v41, v42, v43);
  free(v34);
}

- (void)saveF16DisparityTexture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  uint64_t v15 = objc_msgSend_width(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v24 = objc_msgSend_height(v6, v16, v17, v18, v19, v20, v21, v22, v23);
  objc_msgSend_makeCoherent_(self, v25, (uint64_t)v6, v26, v27, v28, v29, v30, v31);
  uint64_t v32 = (char *)malloc_type_malloc((2 * v15 * v24), 0x5214660AuLL);
  float v33 = (char *)malloc_type_malloc(4 * (v15 * v24), 0x100004052888210uLL);
  memset(v52, 0, 24);
  v52[3] = v15;
  v52[4] = v24;
  v52[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v34, (uint64_t)v32, (2 * v15), (uint64_t)v52, 0, v35, v36, v37);
  if (v24)
  {
    int v38 = 0;
    uint64_t v39 = v33;
    uint64_t v40 = v32;
    do
    {
      if (v15)
      {
        uint64_t v41 = 0;
        do
        {
          _H0 = *(_WORD *)&v40[2 * v41];
          __asm { FCVT            S0, H0 }
          *(_DWORD *)&v39[4 * v41++] = _S0;
        }
        while (v15 != v41);
      }
      ++v38;
      v40 += 2 * v15;
      v39 += 4 * v15;
    }
    while (v38 != v24);
  }
  free(v32);
  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v48, v15, v24, (uint64_t)v33, (uint64_t)a4, v49, v50, v51);
  free(v33);
}

- (void)saveRGF16ShiftmapTexture:(id)a3 AsPPMFileSx:(id)a4 AsPPMFileSy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v82 = a5;
  uint64_t v18 = objc_msgSend_width(v8, v10, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v27 = objc_msgSend_height(v8, v19, v20, v21, v22, v23, v24, v25, v26);
  objc_msgSend_makeCoherent_(self, v28, (uint64_t)v8, v29, v30, v31, v32, v33, v34);
  uint64_t v35 = (__int16 *)malloc_type_malloc((2 * v27 * 4 * v18), 0x25F132BFuLL);
  uint64_t v36 = malloc_type_malloc(4 * (v18 * v27), 0x100004052888210uLL);
  float v37 = malloc_type_malloc(4 * (v18 * v27), 0x100004052888210uLL);
  memset(v83, 0, 24);
  v83[3] = v18;
  v83[4] = v27;
  v83[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v8, v38, (uint64_t)v35, (4 * v18), (uint64_t)v83, 0, v39, v40, v41);
  if (v27)
  {
    int v42 = 0;
    float v43 = v37;
    uint64_t v44 = v36;
    uint64_t v45 = v35;
    do
    {
      for (int i = v18; i; --i)
      {
        _H0 = *v45;
        __asm { FCVT            S0, H0 }
        *v44++ = _S0;
        LOWORD(_S0) = v45[1];
        __asm { FCVT            S0, H0 }
        *v43++ = _S0;
        v45 += 2;
      }
      ++v42;
    }
    while (v42 != v27);
  }
  free(v35);
  id v54 = v9;
  uint64_t v63 = objc_msgSend_UTF8String(v54, v55, v56, v57, v58, v59, v60, v61, v62);
  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v64, v18, v27, (uint64_t)v36, v63, v65, v66, v67);
  free(v36);
  id v68 = v82;
  uint64_t v77 = objc_msgSend_UTF8String(v68, v69, v70, v71, v72, v73, v74, v75, v76);
  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v78, v18, v27, (uint64_t)v37, v77, v79, v80, v81);
  free(v37);
}

- (void)saveRGF16Texture:(id)a3 AsF32BinaryFile0:(id)a4 AsF32BinaryFile1:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  uint64_t v20 = (const char *)objc_msgSend_UTF8String(v11, v12, v13, v14, v15, v16, v17, v18, v19);
  uint64_t v29 = sub_262ED5DCC(v20, v21, v28, v22, v23, v24, v25, v26, v27);
  id v30 = v10;
  uint64_t v39 = (const char *)objc_msgSend_UTF8String(v30, v31, v32, v33, v34, v35, v36, v37, v38);
  uint64_t v48 = sub_262ED5DCC(v39, v40, v47, v41, v42, v43, v44, v45, v46);
  __stream = v29;
  if (v29)
  {
    uint64_t v57 = v48;
    if (v48)
    {
      unsigned int v58 = objc_msgSend_width(v8, v49, v50, v51, v52, v53, v54, v55, v56);
      unsigned int v67 = objc_msgSend_height(v8, v59, v60, v61, v62, v63, v64, v65, v66);
      unint64_t v68 = 4 * v58;
      objc_msgSend_makeCoherent_(self, v69, (uint64_t)v8, v70, v71, v72, v73, v74, v75);
      float v76 = malloc_type_malloc(v68 * v67, 0x8751C6BFuLL);
      uint64_t v77 = v76;
      if (!v76)
      {
        FigDebugAssert3();
        id v82 = 0;
        v78 = 0;
        goto LABEL_15;
      }
      uint64_t v101 = (uint64_t)v76;
      v78 = malloc_type_malloc(4 * v58, 0x42074419uLL);
      if (v78)
      {
        id v82 = malloc_type_malloc(4 * v58, 0x6F308E3FuLL);
        if (v82)
        {
          id v100 = v30;
          id v84 = v11;
          memset(v103, 0, 24);
          v103[3] = v58;
          v103[4] = v67;
          v103[5] = 1;
          uint64_t v85 = v101;
          objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v8, v79, v101, 4 * v58, (uint64_t)v103, 0, v80, v81, v83);
          if (!v67)
          {
            uint64_t v77 = (void *)v101;
            id v11 = v84;
            id v30 = v100;
            goto LABEL_15;
          }
          v99 = v84;
          int v86 = 0;
          unint64_t v87 = v68 >> 1;
          do
          {
            if (v58)
            {
              uint64_t v88 = 0;
              v89 = v82;
              v90 = v78;
              do
              {
                _H0 = *(_WORD *)(v85 + 2 * v88);
                __asm { FCVT            S0, H0 }
                _H1 = *(_WORD *)(v85 + 2 * (v88 + 1));
                __asm { FCVT            S1, H1 }
                *v90++ = _S0;
                *v89++ = _S1;
                v88 += 2;
              }
              while (2 * v58 != v88);
            }
            fwrite(v78, 4uLL, v58, __stream);
            fwrite(v82, 4uLL, v58, v57);
            v85 += 2 * v87;
            ++v86;
          }
          while (v86 != v67);
          id v11 = v99;
          id v30 = v100;
        }
        else
        {
          FigDebugAssert3();
        }
      }
      else
      {
        FigDebugAssert3();
        id v82 = 0;
      }
      uint64_t v77 = (void *)v101;
LABEL_15:
      free(v78);
      free(v82);
      free(v77);
      fclose(__stream);
      fclose(v57);
    }
  }
}

- (void)saveRGBA8Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v15 = objc_msgSend_width(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  uint64_t v24 = objc_msgSend_height(v6, v16, v17, v18, v19, v20, v21, v22, v23);
  uint64_t v25 = malloc_type_malloc(4 * v15 * v24, 0xE184E057uLL);
  if (v25)
  {
    uint64_t v33 = v25;
    objc_msgSend_makeCoherent_(self, v26, (uint64_t)v6, v27, v28, v29, v30, v31, v32);
    memset(v42, 0, 24);
    v42[3] = v15;
    v42[4] = v24;
    v42[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v34, (uint64_t)v33, 4 * v15, (uint64_t)v42, 0, v35, v36, v37);
    sub_262ED6358(v15, (const char *)v24, 4 * v15, (uint64_t)v33, a4, v38, v39, v40, v41);
    free(v33);
  }
  else
  {
    NSLog(&cfstr_CouldNotAlloca_3.isa);
  }
}

- (void)saveRGBA8Texture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v15 = objc_msgSend_width(v6, v7, v8, v9, v10, v11, v12, v13, v14);
  unsigned int v24 = objc_msgSend_height(v6, v16, v17, v18, v19, v20, v21, v22, v23);
  float v32 = malloc_type_malloc(4 * v15 * v24, 0xFBE724B0uLL);
  if (v32 && (uint64_t v34 = sub_262ED5DCC(a4, v25, v33, v26, v27, v28, v29, v30, v31)) != 0)
  {
    uint64_t v42 = v34;
    objc_msgSend_makeCoherent_(self, v35, (uint64_t)v6, v36, v37, v38, v39, v40, v41);
    memset(v47, 0, 24);
    v47[3] = v15;
    v47[4] = v24;
    v47[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v43, (uint64_t)v32, 4 * v15, (uint64_t)v47, 0, v44, v45, v46);
    fwrite(v32, 4 * v15 * v24, 1uLL, v42);
    fclose(v42);
  }
  else
  {
    FigDebugAssert3();
  }
  free(v32);
}

- (void)saveRgbaF32PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  uint64_t v11 = sub_262ED5DCC(a4, a2, v8, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  if (v11)
  {
    uint64_t v12 = v11;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    unsigned int v15 = malloc_type_malloc(4 * Width, 0x537B33C4uLL);
    BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    fprintf(v12, "P6 %u %u 255\n", Width, Height);
    if (Height)
    {
      int v18 = 0;
      uint64_t v19 = BytesPerRow >> 2;
      do
      {
        if (Width)
        {
          uint64_t v20 = 0;
          unsigned int v21 = 2;
          do
          {
            v15[v21 - 2] = vcvtms_s32_f32(BaseAddress[v20] * 255.0);
            v15[v21 - 1] = vcvtms_s32_f32(BaseAddress[(v20 + 1)] * 255.0);
            v15[v21] = vcvtms_s32_f32(BaseAddress[(v20 + 2)] * 255.0);
            v21 += 3;
            v20 += 4;
          }
          while (4 * Width != v20);
        }
        fwrite(v15, 3uLL, Width, v12);
        BaseAddress += v19;
        ++v18;
      }
      while (v18 != Height);
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v12);
    free(v15);
  }
  else
  {
    NSLog(&cfstr_CouldNotCreate_0.isa, a4);
  }
}

- (void)save32BGRAPixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  uint64_t v10 = sub_262ED5DCC(a4, a2, v8, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  if (v10)
  {
    uint64_t v11 = v10;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    float v14 = malloc_type_malloc(4 * Width, 0x2527136FuLL);
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    fprintf(v11, "P6 %u %u 255\n", Width, Height);
    if (Height)
    {
      for (int i = 0; i != Height; ++i)
      {
        if (Width)
        {
          uint64_t v18 = 0;
          unsigned int v19 = 2;
          do
          {
            v14[v19 - 2] = BaseAddress[(v18 + 2)];
            v14[v19 - 1] = BaseAddress[(v18 + 1)];
            v14[v19] = BaseAddress[v18];
            v19 += 3;
            v18 += 4;
          }
          while (4 * Width != v18);
        }
        fwrite(v14, 3uLL, Width, v11);
        BaseAddress += BytesPerRow;
      }
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v11);
    free(v14);
  }
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);

  MEMORY[0x270F9A6D0](self, sel_saveRGBAF16PixelBuffer_out_width_out_height_AsPPMFile_, a3, Width, Height, a4, v9, v10, v11);
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFile:(const char *)a6
{
  uint64_t v13 = sub_262ED5DCC(a6, a2, v8, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, (uint64_t)a6, v6, v7);
  if (v13)
  {
    float v14 = v13;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    unsigned int v15 = malloc_type_malloc(3 * a4, 0x6BCC2493uLL);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    fprintf(v14, "P6 %u %u 255\n", a4, a5);
    if (a5)
    {
      int v18 = 0;
      uint64_t v19 = BytesPerRow >> 1;
      do
      {
        if (a4)
        {
          uint64_t v20 = 0;
          unsigned int v21 = 2;
          do
          {
            _H0 = *(_WORD *)&BaseAddress[2 * v20];
            __asm { FCVT            S0, H0 }
            v15[v21 - 2] = vcvtms_s32_f32(_S0 * 255.0);
            LOWORD(_S0) = *(_WORD *)&BaseAddress[2 * (v20 + 1)];
            __asm { FCVT            S0, H0 }
            v15[v21 - 1] = vcvtms_s32_f32(_S0 * 255.0);
            LOWORD(_S0) = *(_WORD *)&BaseAddress[2 * (v20 + 2)];
            __asm { FCVT            S0, H0 }
            v15[v21] = vcvtms_s32_f32(_S0 * 255.0);
            v21 += 3;
            v20 += 4;
          }
          while (4 * a4 != v20);
        }
        fwrite(v15, 3uLL, a4, v14);
        BaseAddress += 2 * v19;
        ++v18;
      }
      while (v18 != a5);
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v14);
    free(v15);
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

  MEMORY[0x270F9A6D0](self, sel_saveRGBAF16PixelBuffer_out_width_out_height_AsPPMFileWithAlpha_, a3, Width, Height, a4, v9, v10, v11);
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFileWithAlpha:(const char *)a6
{
  uint64_t v13 = sub_262ED5DCC(a6, a2, v8, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, (uint64_t)a6, v6, v7);
  if (v13)
  {
    float v14 = v13;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    unsigned int v15 = malloc_type_malloc(4 * a4, 0x7263A86CuLL);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    fprintf(v14, "P7\nWIDTH %u\nHEIGHT %u\nDEPTH 4\nMAXVAL 255\nTUPLTYPE RGB_ALPHA\nENDHDR", a4, a5);
    if (a5)
    {
      int v18 = 0;
      uint64_t v19 = BytesPerRow >> 1;
      do
      {
        if (a4)
        {
          uint64_t v20 = 0;
          do
          {
            _H0 = *(_WORD *)&BaseAddress[2 * v20];
            __asm { FCVT            S0, H0 }
            v15[v20] = vcvtms_s32_f32(_S0 * 255.0);
            LOWORD(_S0) = *(_WORD *)&BaseAddress[2 * (v20 + 1)];
            __asm { FCVT            S0, H0 }
            v15[(v20 + 1)] = vcvtms_s32_f32(_S0 * 255.0);
            LOWORD(_S0) = *(_WORD *)&BaseAddress[2 * (v20 + 2)];
            __asm { FCVT            S0, H0 }
            v15[(v20 + 2)] = vcvtms_s32_f32(_S0 * 255.0);
            LOWORD(_S0) = *(_WORD *)&BaseAddress[2 * (v20 + 3)];
            __asm { FCVT            S0, H0 }
            v15[(v20 + 3)] = vcvtms_s32_f32(_S0 * 255.0);
            v20 += 4;
          }
          while (4 * a4 != v20);
        }
        fwrite(v15, 4uLL, a4, v14);
        BaseAddress += 2 * v19;
        ++v18;
      }
      while (v18 != a5);
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v14);
    free(v15);
  }
  else
  {
    NSLog(&cfstr_CouldNotCreate_0.isa, a6);
  }
}

- (void)saveF16Texture:(id)a3 AsF32BinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v15 = sub_262ED5DCC(a4, v7, v14, v8, v9, v10, v11, v12, v13);
  if (v15)
  {
    unsigned int v24 = v15;
    unsigned int v25 = objc_msgSend_width(v6, v16, v17, v18, v19, v20, v21, v22, v23);
    unsigned int v34 = objc_msgSend_height(v6, v26, v27, v28, v29, v30, v31, v32, v33);
    uint64_t v35 = 2 * v25;
    uint64_t v36 = malloc_type_malloc(4 * v25, 0x100004052888210uLL);
    uint64_t v37 = (char *)malloc_type_malloc(v35 * v34, 0xE83D517EuLL);
    objc_msgSend_makeCoherent_(self, v38, (uint64_t)v6, v39, v40, v41, v42, v43, v44);
    memset(v58, 0, 24);
    v58[3] = v25;
    v58[4] = v34;
    v58[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v45, (uint64_t)v37, v35, (uint64_t)v58, 0, v46, v47, v48);
    if (v34)
    {
      int v49 = 0;
      uint64_t v50 = v37;
      do
      {
        if (v25)
        {
          for (uint64_t i = 0; i != v25; v36[i++] = _S0)
          {
            _H0 = *(_WORD *)&v50[2 * i];
            __asm { FCVT            S0, H0 }
          }
        }
        fwrite(v36, 4uLL, v25, v24);
        ++v49;
        v50 += v35;
      }
      while (v49 != v34);
    }
    free(v36);
    free(v37);
    fclose(v24);
  }
}

- (void)saveNCCOutputFrom:(id)a3 asBinaryFiles:(const char *)a4
{
  id v6 = a3;
  objc_msgSend_waitForIdle(self->_metalContext, v7, v8, v9, v10, v11, v12, v13, v14);
  objc_msgSend_makeCoherent_(self, v15, (uint64_t)v6, v16, v17, v18, v19, v20, v21);
  uint64_t v30 = objc_msgSend_width(v6, v22, v23, v24, v25, v26, v27, v28, v29);
  uint64_t v39 = objc_msgSend_height(v6, v31, v32, v33, v34, v35, v36, v37, v38);
  unsigned int v48 = objc_msgSend_bufferBytesPerRow(v6, v40, v41, v42, v43, v44, v45, v46, v47);
  int v49 = (char *)malloc_type_malloc(v48 * v39, 0x658C957BuLL);
  int32x2_t v50 = vabd_s32(vdup_n_s32(v48), (int32x2_t)vshl_u32((uint32x2_t)vdup_n_s32(v30), (uint32x2_t)0x400000003));
  unsigned __int8 v51 = vcgt_u32((uint32x2_t)vdup_lane_s32(v50, 1), (uint32x2_t)v50).u8[0];
  uint64_t v52 = @"f32";
  if (v51) {
    uint64_t v52 = @"f16";
  }
  uint64_t v53 = v52;
  memset(v222, 0, 24);
  v222[3] = v30;
  size_t v216 = v30;
  v222[4] = v39;
  v222[5] = 1;
  id v209 = v6;
  uint64_t v213 = v48;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v54, (uint64_t)v49, v48, (uint64_t)v222, 0, v55, v56, v57);
  uint64_t v65 = objc_msgSend_stringWithFormat_(NSString, v58, @"%s_L_%dx%d.%@", v59, v60, v61, v62, v63, v64, a4, v30, v39, v53);
  uint64_t v73 = objc_msgSend_stringWithFormat_(NSString, v66, @"%s_R_%dx%d.%@", v67, v68, v69, v70, v71, v72, a4, v30, v39, v53);
  uint64_t v81 = objc_msgSend_stringWithFormat_(NSString, v74, @"%s_C_%dx%d.%@", v75, v76, v77, v78, v79, v80, a4, v30, v39, v53);
  uint64_t v215 = v30;
  v220 = a4;
  v89 = objc_msgSend_stringWithFormat_(NSString, v82, @"%s_F_%dx%d.%@", v83, v84, v85, v86, v87, v88, a4, v30, v39, v53);
  id v208 = v65;
  v98 = (const char *)objc_msgSend_UTF8String(v208, v90, v91, v92, v93, v94, v95, v96, v97);
  v107 = sub_262ED5DCC(v98, v99, v106, v100, v101, v102, v103, v104, v105);
  id v108 = v73;
  v117 = (const char *)objc_msgSend_UTF8String(v108, v109, v110, v111, v112, v113, v114, v115, v116);
  v126 = sub_262ED5DCC(v117, v118, v125, v119, v120, v121, v122, v123, v124);
  id v127 = v81;
  v136 = (const char *)objc_msgSend_UTF8String(v127, v128, v129, v130, v131, v132, v133, v134, v135);
  v219 = sub_262ED5DCC(v136, v137, v144, v138, v139, v140, v141, v142, v143);
  id v145 = v89;
  v154 = (const char *)objc_msgSend_UTF8String(v145, v146, v147, v148, v149, v150, v151, v152, v153);
  v163 = sub_262ED5DCC(v154, v155, v162, v156, v157, v158, v159, v160, v161);
  v164 = 0;
  v217 = v163;
  __stream = v107;
  id v210 = 0;
  if (v107)
  {
    v165 = v126;
    if (v126)
    {
      v166 = v209;
      if (!v219 || !v163) {
        goto LABEL_34;
      }
      id v204 = v145;
      id v205 = v127;
      id v206 = v108;
      v214 = (const char *)v39;
      v207 = v49;
      uint64_t v167 = 4;
      if (v51) {
        uint64_t v167 = 2;
      }
      size_t __size = v167;
      char v168 = 1;
      if ((v51 & 1) == 0) {
        char v168 = 2;
      }
      size_t v169 = v216 << v168;
      v170 = (char *)malloc_type_malloc(v216 << v168, 0xC1004B0FuLL);
      v171 = (char *)malloc_type_malloc(v169, 0xC203B6DuLL);
      v172 = (char *)malloc_type_malloc(v169, 0x769BED74uLL);
      v179 = (char *)malloc_type_malloc(v169, 0x1C0FB887uLL);
      if (v51)
      {
        id v210 = 0;
        v164 = 0;
        if (!v214) {
          goto LABEL_23;
        }
      }
      else
      {
        objc_msgSend_stringWithFormat_(NSString, v173, @"%s_L_%dx%d.ppm", v174, v175, v176, v177, v178, v180, v220, v215, v214);
        id v210 = (id)objc_claimAutoreleasedReturnValue();
        v164 = malloc_type_malloc((4 * v215 * v214), 0xD910200EuLL);
        if (!v214)
        {
LABEL_23:
          if ((v51 & 1) == 0)
          {
            id v190 = v210;
            v199 = (const char *)objc_msgSend_UTF8String(v190, v191, v192, v193, v194, v195, v196, v197, v198);
            sub_262ED6358(v215, v214, (4 * v215), (uint64_t)v164, v199, v200, v201, v202, v203);
          }
          if (v170) {
            free(v170);
          }
          v166 = v209;
          id v145 = v204;
          if (v171) {
            free(v171);
          }
          id v108 = v206;
          if (v172) {
            free(v172);
          }
          id v127 = v205;
          if (v179) {
            free(v179);
          }
          int v49 = v207;
LABEL_34:
          if (!v49) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
      }
      int v181 = 0;
      int v182 = 0;
      v183 = v207;
      unsigned __int8 v211 = v51;
      do
      {
        int v221 = v182;
        if (v215)
        {
          uint64_t v184 = 0;
          uint64_t v185 = 0;
          do
          {
            uint64_t v186 = (v185 + 1);
            uint64_t v187 = (v185 + 2);
            uint64_t v188 = (v185 + 3);
            if (v51)
            {
              *(_WORD *)&v170[v184] = *(_WORD *)&v183[2 * v185];
              *(_WORD *)&v171[v184] = *(_WORD *)&v183[2 * v186];
              *(_WORD *)&v172[v184] = *(_WORD *)&v183[2 * v187];
              *(_WORD *)&v179[v184] = *(_WORD *)&v183[2 * v188];
            }
            else
            {
              *(_DWORD *)&v170[v185] = *(_DWORD *)&v183[4 * v185];
              *(_DWORD *)&v171[v185] = *(_DWORD *)&v183[4 * v186];
              *(_DWORD *)&v172[v185] = *(_DWORD *)&v183[4 * v187];
              *(_DWORD *)&v179[v185] = *(_DWORD *)&v183[4 * v188];
              float v189 = fmaxf(fminf(*(float *)&v183[4 * v185] * 25500.0, 255.0), 0.0);
              v164[(v181 + v185 + 2)] = (int)v189;
              v164[(v181 + v185 + 1)] = (int)v189;
              v164[(v181 + v185)] = (int)v189;
              v164[(v181 + v185 + 3)] = -1;
            }
            v185 += 4;
            v184 += 2;
          }
          while (4 * v216 != v185);
        }
        fwrite(v170, __size, v216, __stream);
        fwrite(v171, __size, v216, v165);
        fwrite(v172, __size, v216, v219);
        unsigned __int8 v51 = v211;
        fwrite(v179, __size, v216, v217);
        v183 += v213;
        int v182 = v221 + 1;
        v181 += 4 * v215;
      }
      while (v221 + 1 != v214);
      goto LABEL_23;
    }
  }
  else
  {
    v165 = v126;
  }
  v166 = v209;
  if (v49) {
LABEL_35:
  }
    free(v49);
LABEL_36:
  if (v164) {
    free(v164);
  }
  if (__stream) {
    fclose(__stream);
  }
  if (v165) {
    fclose(v165);
  }
  if (v219) {
    fclose(v219);
  }
  if (v217) {
    fclose(v217);
  }
}

- (void)savePixelBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  uint64_t v13 = objc_msgSend_stringWithFormat_(NSString, v6, @"%s.%c%c%c%c", v7, v8, v9, v10, v11, v12, a4, HIBYTE(PixelFormatType), BYTE2(PixelFormatType), BYTE1(PixelFormatType), PixelFormatType);
  objc_msgSend_createPathIfNeeded_(disparityDebugUtils, v14, (uint64_t)v13, v15, v16, v17, v18, v19, v20);
  id v29 = v13;
  objc_msgSend_UTF8String(v29, v21, v22, v23, v24, v25, v26, v27, v28);
  WritePixelBufferToFile();
}

- (void)WriteBinDataToFile:(void *)a3 length:(unsigned int)a4 fileFullPath:(const char *)a5
{
  uint64_t v11 = sub_262ED5DCC(a5, a2, v8, (uint64_t)a3, *(uint64_t *)&a4, (uint64_t)a5, v5, v6, v7);
  if (v11)
  {
    float v12 = v11;
    fwrite(a3, 1uLL, a4, v11);
    fclose(v12);
  }
}

+ (void)createPathIfNeeded:(id)a3
{
  uint64_t v9 = objc_msgSend_stringByDeletingLastPathComponent(a3, a2, (uint64_t)a3, v3, v4, v5, v6, v7, v8);
  uint64_t v18 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v10, v11, v12, v13, v14, v15, v16, v17);
  id v26 = 0;
  char DirectoryAtPath_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v18, v19, (uint64_t)v9, 1, 0, (uint64_t)&v26, v20, v21, v22);
  id v24 = v26;
  uint64_t v25 = v24;
  if ((DirectoryAtPath_withIntermediateDirectories_attributes_error & 1) == 0) {
    NSLog(&cfstr_FailedToCreate.isa, v9, v24);
  }
}

- (void)saveAccumulationFrom:(id)a3 asBinaryFiles:(const char *)a4 forSize:(CGSize)a5 costLineSize:(unsigned __int16)a6
{
  unsigned int v181 = a6;
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  objc_msgSend_waitForIdle(self->_metalContext, v11, v12, v13, v14, v15, v16, v17, v18);
  objc_msgSend_makeCoherent_(self, v19, (uint64_t)v10, v20, v21, v22, v23, v24, v25);
  size_t v189 = width;
  id v26 = (char *)malloc_type_malloc(4 * v189, 0x100004052888210uLL);
  uint64_t v27 = (char *)malloc_type_malloc(4 * v189, 0x100004052888210uLL);
  float v28 = (char *)malloc_type_malloc(4 * v189, 0x100004052888210uLL);
  id v29 = (char *)malloc_type_malloc(4 * v189, 0x100004052888210uLL);
  id v179 = v10;
  uint64_t v38 = objc_msgSend_contents(v179, v30, v31, v32, v33, v34, v35, v36, v37);
  uint64_t v46 = objc_msgSend_stringWithFormat_(NSString, v39, @"%s_L.f32", v40, v41, v42, v43, v44, v45, a4);
  uint64_t v54 = objc_msgSend_stringWithFormat_(NSString, v47, @"%s_R.f32", v48, v49, v50, v51, v52, v53, a4);
  uint64_t v62 = objc_msgSend_stringWithFormat_(NSString, v55, @"%s_C.f32", v56, v57, v58, v59, v60, v61, a4);
  objc_msgSend_stringWithFormat_(NSString, v63, @"%s_W.f32", v64, v65, v66, v67, v68, v69, a4);
  id v187 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(NSString, v70, @"%s_L.ppm", v71, v72, v73, v74, v75, v76, a4);
  id v180 = (id)objc_claimAutoreleasedReturnValue();
  id v178 = v46;
  uint64_t v85 = (const char *)objc_msgSend_UTF8String(v178, v77, v78, v79, v80, v81, v82, v83, v84);
  uint64_t v94 = sub_262ED5DCC(v85, v86, v93, v87, v88, v89, v90, v91, v92);
  id v95 = v54;
  uint64_t v104 = (const char *)objc_msgSend_UTF8String(v95, v96, v97, v98, v99, v100, v101, v102, v103);
  uint64_t v113 = sub_262ED5DCC(v104, v105, v112, v106, v107, v108, v109, v110, v111);
  id v114 = v62;
  uint64_t v123 = (const char *)objc_msgSend_UTF8String(v114, v115, v116, v117, v118, v119, v120, v121, v122);
  uint64_t v186 = sub_262ED5DCC(v123, v124, v131, v125, v126, v127, v128, v129, v130);
  id v132 = v187;
  uint64_t v141 = (const char *)objc_msgSend_UTF8String(v132, v133, v134, v135, v136, v137, v138, v139, v140);
  uint64_t v150 = sub_262ED5DCC(v141, v142, v149, v143, v144, v145, v146, v147, v148);
  uint64_t v151 = v94;
  uint64_t v152 = 0;
  uint64_t v184 = v150;
  uint64_t v185 = v113;
  if (!v151 || !v113)
  {
LABEL_12:
    float v153 = v186;
    goto LABEL_13;
  }
  float v153 = v186;
  if (v186 && v150)
  {
    __stream = v151;
    id v177 = v132;
    v154 = malloc_type_malloc(4 * height * v189, 0x1E49E871uLL);
    unsigned int v155 = width;
    uint64_t v152 = v154;
    unsigned int v182 = height;
    if (height)
    {
      int v156 = 0;
      int v157 = 0;
      do
      {
        int v188 = v157;
        if (v155)
        {
          uint64_t v158 = 0;
          do
          {
            float v159 = *(float *)(v38 + 4 * v158);
            *(float *)&v26[v158] = v159;
            float v160 = fmaxf(fminf(v159 * 25500.0, 255.0), 0.0);
            v152[(v156 + v158 + 2)] = (int)v160;
            v152[(v156 + v158 + 1)] = (int)v160;
            v152[(v156 + v158)] = (int)v160;
            v152[(v156 + v158 + 3)] = -1;
            *(_DWORD *)&v27[v158] = *(_DWORD *)(v38 + 4 * (v158 + 1));
            *(_DWORD *)&v28[v158] = *(_DWORD *)(v38 + 4 * (v158 + 2));
            *(_DWORD *)&v29[v158] = *(_DWORD *)(v38 + 4 * (v158 + 3));
            v158 += 4;
          }
          while (4 * v189 != v158);
        }
        fwrite(v26, 4uLL, v189, __stream);
        fwrite(v27, 4uLL, v189, v185);
        fwrite(v28, 4uLL, v189, v186);
        fwrite(v29, 4uLL, v189, v184);
        unsigned int v155 = width;
        v38 += 4 * v181;
        int v157 = v188 + 1;
        v156 += 4 * v189;
      }
      while (v188 + 1 != v182);
    }
    uint64_t v161 = 4 * v155;
    unsigned int v162 = v155;
    id v163 = v180;
    v172 = (const char *)objc_msgSend_UTF8String(v163, v164, v165, v166, v167, v168, v169, v170, v171);
    sub_262ED6358(v162, (const char *)v182, v161, (uint64_t)v152, v172, v173, v174, v175, v176);
    id v132 = v177;
    uint64_t v151 = __stream;
    goto LABEL_12;
  }
LABEL_13:
  if (v151) {
    fclose(v151);
  }
  if (v185) {
    fclose(v185);
  }
  if (v153) {
    fclose(v153);
  }
  if (v184) {
    fclose(v184);
  }
  free(v152);
  free(v26);
  free(v27);
  free(v28);
  free(v29);
}

- (void)saveF32Texture:(id)a3 AsF32BinaryFile:(const char *)a4
{
  id v6 = a3;
  uint64_t v22 = sub_262ED5DCC(a4, v7, v14, v8, v9, v10, v11, v12, v13);
  if (v22)
  {
    unsigned int v24 = objc_msgSend_width(v6, v15, v16, v17, v18, v19, v20, v21, v23);
    unsigned int v33 = objc_msgSend_height(v6, v25, v26, v27, v28, v29, v30, v31, v32);
    size_t v34 = v24;
    size_t v35 = 4 * v24;
    uint64_t v36 = (char *)malloc_type_malloc(v35, 0x100004052888210uLL);
    if (v36)
    {
      uint64_t v43 = (char *)malloc_type_malloc((v35 * v33) & 0xFFFFFFFC, 0x3A8A47EAuLL);
      if (v43)
      {
        objc_msgSend_makeCoherent_(self, v37, (uint64_t)v6, v38, v39, v40, v41, v42, v44);
        memset(v52, 0, 24);
        v52[3] = v34;
        v52[4] = v33;
        v52[5] = 1;
        objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v45, (uint64_t)v43, v35 & 0xFFFFFFFC, (uint64_t)v52, 0, v46, v47, v48);
        if (v33)
        {
          int v49 = 0;
          uint64_t v50 = v43;
          do
          {
            if (v34)
            {
              uint64_t v51 = 0;
              do
              {
                *(_DWORD *)&v36[v51] = *(_DWORD *)&v50[v51];
                v51 += 4;
              }
              while (v35 != v51);
            }
            fwrite(v36, 4uLL, v34, v22);
            ++v49;
            v50 += v35 & 0xFFFFFFFC;
          }
          while (v49 != v33);
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
      uint64_t v43 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v43 = 0;
    uint64_t v36 = 0;
  }
  free(v36);
  free(v43);
  fclose(v22);
}

- (void)saveRGBA16FTexture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  uint64_t v15 = sub_262ED5DCC(a4, v7, v14, v8, v9, v10, v11, v12, v13);
  if (v15)
  {
    unsigned int v24 = v15;
    unsigned int v25 = objc_msgSend_width(v6, v16, v17, v18, v19, v20, v21, v22, v23);
    unsigned int v34 = objc_msgSend_height(v6, v26, v27, v28, v29, v30, v31, v32, v33);
    size_t v35 = malloc_type_malloc(3 * v25, 0x83FFD161uLL);
    uint64_t v36 = (char *)malloc_type_malloc(8 * v25 * v34, 0x32C1A2B9uLL);
    fprintf(v24, "P6 %u %u 255\n", v25, v34);
    objc_msgSend_makeCoherent_(self, v37, (uint64_t)v6, v38, v39, v40, v41, v42, v43);
    memset(v63, 0, 24);
    v63[3] = v25;
    v63[4] = v34;
    v63[5] = 1;
    id v62 = v6;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v44, (uint64_t)v36, 8 * v25, (uint64_t)v63, 0, v45, v46, v47);
    if (v34)
    {
      int v48 = 0;
      int v49 = v36;
      do
      {
        if (v25)
        {
          uint64_t v50 = 0;
          unsigned int v51 = 2;
          do
          {
            _H0 = *(_WORD *)&v49[2 * v50];
            __asm { FCVT            S0, H0 }
            char v58 = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            LOWORD(_S0) = *(_WORD *)&v49[2 * (v50 + 1)];
            __asm { FCVT            S0, H0 }
            char v60 = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            LOWORD(_S0) = *(_WORD *)&v49[2 * (v50 + 2)];
            __asm { FCVT            S0, H0 }
            v35[v51 - 2] = v58;
            v35[v51 - 1] = v60;
            v35[v51] = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            v51 += 3;
            v50 += 4;
          }
          while (4 * v25 != v50);
        }
        fwrite(v35, 3uLL, v25, v24);
        v49 += 8 * v25;
        ++v48;
      }
      while (v48 != v34);
    }
    free(v35);
    free(v36);
    fclose(v24);
    id v6 = v62;
  }
}

- (void)saveRGBA16FTexture:(id)a3 AsF32File:(const char *)a4
{
  id v6 = a3;
  uint64_t v15 = sub_262ED5DCC(a4, v7, v14, v8, v9, v10, v11, v12, v13);
  if (v15)
  {
    unsigned int v24 = v15;
    unsigned int v25 = objc_msgSend_width(v6, v16, v17, v18, v19, v20, v21, v22, v23);
    unsigned int v34 = objc_msgSend_height(v6, v26, v27, v28, v29, v30, v31, v32, v33);
    size_t v35 = malloc_type_malloc(16 * v25, 0x100004052888210uLL);
    uint64_t v36 = (char *)malloc_type_malloc(8 * v25 * v34, 0x5DEDB4EEuLL);
    objc_msgSend_makeCoherent_(self, v37, (uint64_t)v6, v38, v39, v40, v41, v42, v43);
    memset(v58, 0, 24);
    v58[3] = v25;
    v58[4] = v34;
    v58[5] = 1;
    uint64_t v57 = v36;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v44, (uint64_t)v36, 8 * v25, (uint64_t)v58, 0, v45, v46, v47);
    if (v34)
    {
      for (int i = 0; i != v34; ++i)
      {
        if (v25)
        {
          uint64_t v50 = 0;
          do
          {
            _H0 = *(_WORD *)&v36[2 * (v50 + 2)];
            __asm { FCVT            S0, H0 }
            v48.i32[0] = *(_DWORD *)&v36[2 * v50];
            float16x4_t v48 = (float16x4_t)vcvtq_f32_f16(v48).u64[0];
            *(float16x4_t *)&v35[v50] = v48;
            v35[(v50 + 2)] = _S0;
            v35[(v50 + 3)] = 0;
            v50 += 4;
          }
          while (4 * v25 != v50);
        }
        fwrite(v35, 0x10uLL, v25, v24);
        v36 += 8 * v25;
      }
    }
    free(v35);
    free(v57);
    fclose(v24);
  }
}

- (void)saveRGB10A2Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  uint64_t v15 = sub_262ED5DCC(a4, v7, v14, v8, v9, v10, v11, v12, v13);
  if (v15)
  {
    unsigned int v24 = v15;
    if (objc_msgSend_pixelFormat(v6, v16, v17, v18, v19, v20, v21, v22, v23) == 90)
    {
      unsigned int v33 = objc_msgSend_width(v6, v25, v26, v27, v28, v29, v30, v31, v32);
      unsigned int v42 = objc_msgSend_height(v6, v34, v35, v36, v37, v38, v39, v40, v41);
      float v43 = malloc_type_malloc(3 * v33, 0xF0F0E241uLL);
      float v44 = (char *)malloc_type_malloc(4 * v33 * v42, 0x40BD4609uLL);
      fprintf(v24, "P6 %u %u 255\n", v33, v42);
      objc_msgSend_makeCoherent_(self, v45, (uint64_t)v6, v46, v47, v48, v49, v50, v51);
      memset(v62, 0, 24);
      v62[3] = v33;
      v62[4] = v42;
      v62[5] = 1;
      float v61 = v44;
      objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v52, (uint64_t)v44, 4 * v33, (uint64_t)v62, 0, v53, v54, v55);
      if (v42)
      {
        int v56 = 0;
        uint64_t v57 = 4 * v33;
        do
        {
          if (v33)
          {
            uint64_t v58 = 0;
            unsigned int v59 = 2;
            do
            {
              unsigned int v60 = *(_DWORD *)&v44[v58];
              v43[v59 - 2] = vcvtms_s32_f32((float)((float)(v60 & 0x3FF) / 1023.0) * 255.0);
              v43[v59 - 1] = vcvtms_s32_f32((float)((float)((v60 >> 10) & 0x3FF) / 1023.0) * 255.0);
              v43[v59] = vcvtms_s32_f32((float)((float)((v60 >> 20) & 0x3FF) / 1023.0) * 255.0);
              v59 += 3;
              v58 += 4;
            }
            while (v57 != v58);
          }
          fwrite(v43, 3uLL, v33, v24);
          ++v56;
          v44 += v57;
        }
        while (v56 != v42);
      }
      free(v43);
      free(v61);
      fclose(v24);
    }
  }
}

- (void).cxx_destruct
{
}

@end