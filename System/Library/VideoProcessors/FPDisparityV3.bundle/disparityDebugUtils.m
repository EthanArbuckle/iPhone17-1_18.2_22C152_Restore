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
- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)Width out_height:(unsigned int)Height AsBinaryFile:(const char *)a6;
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

  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v9, Width, Height, BaseAddress, a4);
}

- (void)saveF32FPBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 scale:(float)a5
{
  v7 = sub_262F0D3AC(a4, a2);
  if (v7)
  {
    v8 = v7;
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    v13 = malloc_type_malloc(3 * Width, 0x45A6691EuLL);
    unsigned int v23 = Width;
    fprintf(v8, "P6 %u %u 255\n", Width, Height);
    int v22 = Height;
    if (Height)
    {
      int v14 = 0;
      size_t v15 = Width;
      uint64_t v16 = BytesPerRow & 0xFFFFFFFC;
      uint64_t v17 = 4 * Width;
      do
      {
        v18 = v8;
        if (v23)
        {
          uint64_t v19 = 0;
          unsigned int v20 = 2;
          do
          {
            char v21 = vcvtms_s32_f32(fmaxf(fminf(powf(*(float *)&BaseAddress[v19], a5) * 255.0, 255.0), 0.0));
            v13[v20 - 2] = v21;
            v13[v20 - 1] = v21;
            v13[v20] = v21;
            v20 += 3;
            v19 += 4;
          }
          while (v17 != v19);
        }
        v8 = v18;
        fwrite(v13, 3uLL, v15, v18);
        ++v14;
        BaseAddress += v16;
      }
      while (v14 != v22);
    }
    free(v13);
    fclose(v8);
  }
}

- (void)saveF16Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 scale:(float)a5
{
  v7 = sub_262F0D3AC(a4, a2);
  if (v7)
  {
    v8 = v7;
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    v13 = malloc_type_malloc(3 * Width, 0x38B1F978uLL);
    unsigned int v29 = Width;
    fprintf(v8, "P6 %u %u 255\n", Width, Height);
    int v28 = Height;
    if (Height)
    {
      int v14 = 0;
      size_t v15 = Width;
      uint64_t v16 = BytesPerRow & 0xFFFFFFFE;
      uint64_t v17 = 2 * Width;
      do
      {
        v18 = v8;
        if (v29)
        {
          uint64_t v19 = 0;
          unsigned int v20 = 2;
          do
          {
            _H0 = *(_WORD *)&BaseAddress[v19];
            __asm { FCVT            S0, H0; float }
            char v27 = vcvtms_s32_f32(fmaxf(fminf(powf(_S0, a5) * 255.0, 255.0), 0.0));
            v13[v20 - 2] = v27;
            v13[v20 - 1] = v27;
            v13[v20] = v27;
            v20 += 3;
            v19 += 2;
          }
          while (v17 != v19);
        }
        v8 = v18;
        fwrite(v13, 3uLL, v15, v18);
        ++v14;
        BaseAddress += v16;
      }
      while (v14 != v28);
    }
    free(v13);
    fclose(v8);
  }
}

- (void)saveF16Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  v8 = sub_262F0D3AC(a4, v7);
  if (v8)
  {
    v11 = v8;
    unsigned int v12 = objc_msgSend_width(v6, v9, v10);
    unsigned int v15 = objc_msgSend_height(v6, v13, v14);
    uint64_t v16 = malloc_type_malloc(3 * v12, 0xE57BCB10uLL);
    uint64_t v17 = (char *)malloc_type_malloc(2 * v12 * v15, 0x2CCF1F48uLL);
    fprintf(v11, "P6 %u %u 255\n", v12, v15);
    objc_msgSend_makeCoherent_(self, v18, (uint64_t)v6);
    memset(v32, 0, 24);
    v32[3] = v12;
    v32[4] = v15;
    v32[5] = 1;
    v31 = v17;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v19, (uint64_t)v17, 2 * v12, v32, 0);
    if (v15)
    {
      int v20 = 0;
      uint64_t v21 = 2 * v12;
      do
      {
        if (v12)
        {
          uint64_t v22 = 0;
          unsigned int v23 = 2;
          do
          {
            _H0 = *(_WORD *)&v17[v22];
            __asm { FCVT            S0, H0 }
            char v30 = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            v16[v23 - 2] = v30;
            v16[v23 - 1] = v30;
            v16[v23] = v30;
            v23 += 3;
            v22 += 2;
          }
          while (v21 != v22);
        }
        fwrite(v16, 3uLL, v12, v11);
        ++v20;
        v17 += v21;
      }
      while (v20 != v15);
    }
    free(v16);
    free(v31);
    fclose(v11);
  }
}

- (void)saveF32Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
  unsigned int Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  objc_super v9 = malloc_type_malloc(4 * Width * Height, 0x56DD33FCuLL);
  v11 = v9;
  if (Height)
  {
    int v12 = 0;
    int v13 = 0;
    do
    {
      uint64_t v14 = Width;
      int v15 = v12;
      if (Width)
      {
        do
        {
          int16x8_t v16 = vdupq_n_s16((int)(float)(BaseAddress[v15] * 255.0));
          v16.i16[3] = 255;
          *(_DWORD *)&v9[4 * v15++] = vmovn_s16(v16).u32[0];
          --v14;
        }
        while (v14);
      }
      ++v13;
      v12 += Width;
    }
    while (v13 != Height);
  }
  uint64_t v17 = objc_msgSend_stringWithFormat_(NSString, v10, @"%s", a4);
  objc_msgSend_createPathIfNeeded_(disparityDebugUtils, v18, (uint64_t)v17);
  id v22 = v17;
  uint64_t v21 = (const char *)objc_msgSend_UTF8String(v22, v19, v20);
  sub_262F0D938(Width, (const char *)Height, 4 * Width, v11, v21);
  free(v11);
}

- (void)saveU8Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a3);
  unsigned int Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  uint64_t v10 = malloc_type_malloc(4 * Width * Height, 0x4E9F3C5uLL);
  int v12 = v10;
  if (Height)
  {
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    do
    {
      uint64_t v16 = Width;
      int v17 = v13;
      int v18 = v14;
      if (Width)
      {
        do
        {
          int16x8_t v19 = vdupq_n_s16(BaseAddress[v17]);
          v19.i16[3] = 255;
          *(_DWORD *)&v10[4 * v18++] = vmovn_s16(v19).u32[0];
          ++v17;
          --v16;
        }
        while (v16);
      }
      ++v15;
      v14 += Width;
      v13 += BytesPerRow;
    }
    while (v15 != Height);
  }
  uint64_t v20 = objc_msgSend_stringWithFormat_(NSString, v11, @"%s", a4);
  objc_msgSend_createPathIfNeeded_(disparityDebugUtils, v21, (uint64_t)v20);
  id v25 = v20;
  v24 = (const char *)objc_msgSend_UTF8String(v25, v22, v23);
  sub_262F0D938(Width, (const char *)Height, 4 * Width, v12, v24);
  free(v12);
}

- (void)saveVUYA4444Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v9 = objc_msgSend_width(v6, v7, v8);
  uint64_t v12 = objc_msgSend_height(v6, v10, v11);
  int v13 = malloc_type_malloc(4 * v9 * v12, 0xCE17F4E7uLL);
  objc_msgSend_makeCoherent_(self, v14, (uint64_t)v6);
  memset(v17, 0, 24);
  v17[3] = v9;
  v17[4] = v12;
  v17[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v15, (uint64_t)v13, 4 * v9, v17, 0);

  objc_msgSend_convertVUYA444_rbs_ToRGBA_ofSize_(self, v16, (uint64_t)v13, 4 * v9, v13, (double)v9, (double)v12);
  sub_262F0D938(v9, (const char *)v12, 4 * v9, v13, a4);
  free(v13);
}

- (void)saveVUYA4444Texture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v9 = objc_msgSend_width(v6, v7, v8);
  unsigned int v12 = objc_msgSend_height(v6, v10, v11);
  int v13 = malloc_type_malloc(4 * v9 * v12, 0x307EB1D4uLL);
  objc_msgSend_makeCoherent_(self, v14, (uint64_t)v6);
  memset(v17, 0, 24);
  v17[3] = v9;
  v17[4] = v12;
  v17[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v15, (uint64_t)v13, 4 * v9, v17, 0);

  objc_msgSend_WriteBinDataToFile_length_fileFullPath_(self, v16, (uint64_t)v13, 4 * v9 * v12, a4);
  free(v13);
}

- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4
{
}

- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)Width out_height:(unsigned int)Height AsBinaryFile:(const char *)a6
{
  unsigned int v9 = sub_262F0D3AC(a6, a2);
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
    size_t Height = CVPixelBufferGetHeight(a3);
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
    int v13 = BaseAddress;
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
  int v14 = malloc_type_malloc(4 * Width * Height, 0x10F0BD5AuLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  objc_msgSend_convertVUYA444_rbs_ToRGBA_ofSize_(self, v16, (uint64_t)BaseAddress, BytesPerRow, v14, (double)Width, (double)Height);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (a4) {
    unsigned int v17 = a4;
  }
  else {
    unsigned int v17 = Width;
  }
  if (a5) {
    int v18 = (const char *)a5;
  }
  else {
    int v18 = (const char *)Height;
  }
  sub_262F0D938(v17, v18, 4 * Width, v14, a6);

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
  int v14 = malloc_type_malloc(4 * Width * Height, 0xC9F1BBE4uLL);
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
    objc_msgSend_convertRGB10A2ToRGBA8_rbs_ToRGBA_outWidth_outHeight_(self, v15, (uint64_t)BaseAddress, BytesPerRow, v14, v8, v7);
  }
  else
  {
    unint64_t v7 = Height;
    objc_msgSend_convertRGB10A2ToRGBA8_rbs_ToRGBA_outWidth_outHeight_(self, v15, (uint64_t)BaseAddress, BytesPerRow, v14, v8, Height);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  sub_262F0D938(v8, (const char *)v7, 4 * v8, v14, a6);

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
  int v14 = malloc_type_malloc(4 * Width * Height, 0xF19A5099uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(a3);
  if (v8) {
    size_t v8 = v8;
  }
  else {
    size_t v8 = Width;
  }
  if (a5)
  {
    objc_msgSend_convertRGB10A2ToRGBA8_rbs_ToRGBA_outWidth_outHeight_(self, v15, (uint64_t)BaseAddress, BytesPerRow, v14, v8, a5);
  }
  else
  {
    a5 = Height;
    objc_msgSend_convertRGB10A2ToRGBA8_rbs_ToRGBA_outWidth_outHeight_(self, v15, (uint64_t)BaseAddress, BytesPerRow, v14, v8, Height);
  }
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  int v18 = sub_262F0D3AC(a6, v17);
  if (v18)
  {
    int16x8_t v19 = v18;
    uint64_t v20 = (char *)malloc_type_malloc((4 * v8), 0xCF9B36E4uLL);
    if (v20)
    {
      uint64_t v21 = v20;
      fprintf(v19, "P7\nWIDTH %u\nHEIGHT %u\nDEPTH 4\nMAXVAL 255\nTUPLTYPE RGB_ALPHA\nENDHDR", v8, a5);
      if (a5)
      {
        int v22 = 0;
        uint64_t v23 = v14;
        do
        {
          if (v8)
          {
            uint64_t v24 = 0;
            int v25 = v8;
            do
            {
              v26 = &v21[v24];
              char *v26 = v23[v24];
              v26[1] = v23[v24 + 1];
              v26[2] = v23[v24 + 2];
              v26[3] = v23[v24 + 3];
              v24 += 4;
              --v25;
            }
            while (v25);
          }
          fwrite(v21, 4uLL, v8, v19);
          v23 += (4 * v8);
          ++v22;
        }
        while (v22 != a5);
      }
      free(v21);
    }
    fclose(v19);
  }

  free(v14);
}

- (void)save420CVPixelBuffer:(__CVBuffer *)a3 to:(const char *)a4
{
  id v5 = sub_262F0D3AC(a4, a2);
  if (v5)
  {
    id v6 = v5;
    unsigned int Width = CVPixelBufferGetWidth(a3);
    unsigned int Height = CVPixelBufferGetHeight(a3);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    unsigned int BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    if (Height)
    {
      uint64_t v11 = BytesPerRowOfPlane;
      unsigned int v12 = Height;
      do
      {
        fwrite(BaseAddressOfPlane, 1uLL, Width, v6);
        BaseAddressOfPlane += v11;
        --v12;
      }
      while (v12);
    }
    int v13 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
    unsigned int v14 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
    if (Height)
    {
      unsigned int v15 = 0;
      uint64_t v16 = v14;
      do
      {
        fwrite(v13, 1uLL, Width, v6);
        v13 += v16;
        v15 += 2;
      }
      while (v15 < Height);
    }
    fclose(v6);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
}

- (void)saveLumaTexture:(id)a3 to:(const char *)a4
{
  id v6 = a3;
  size_t v8 = sub_262F0D3AC(a4, v7);
  if (v8)
  {
    uint64_t v11 = v8;
    unsigned int v12 = objc_msgSend_width(v6, v9, v10);
    unsigned int v15 = objc_msgSend_height(v6, v13, v14);
    uint64_t v16 = malloc_type_malloc(v15 * v12, 0x620FB7E0uLL);
    objc_msgSend_makeCoherent_(self, v17, (uint64_t)v6);
    size_t v18 = v12;
    memset(v21, 0, 24);
    v21[3] = v12;
    v21[4] = v15;
    v21[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v19, (uint64_t)v16, v12, v21, 0);
    fwrite(v16, 1uLL, v15 * v12, v11);
    bzero(v16, v12);
    if (v15)
    {
      for (unsigned int i = 0; i < v15; i += 2)
        fwrite(v16, 1uLL, v18, v11);
    }
    free(v16);
    fclose(v11);
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
  unsigned int v9 = objc_msgSend_width(v6, v7, v8);
  uint64_t v12 = objc_msgSend_height(v6, v10, v11);
  int v13 = malloc_type_malloc(4 * v9 * v12, 0xC2B60A0AuLL);
  objc_msgSend_makeCoherent_(self, v14, (uint64_t)v6);
  uint64_t v17 = objc_msgSend_width(v6, v15, v16);
  memset(v26, 0, 24);
  v26[3] = v9;
  v26[4] = v12;
  v26[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v18, (uint64_t)v13, 4 * v17, v26, 0);

  int v20 = objc_msgSend_stringWithFormat_(NSString, v19, @"%s", a4);
  objc_msgSend_createPathIfNeeded_(disparityDebugUtils, v21, (uint64_t)v20);
  id v22 = v20;
  int v25 = (const char *)objc_msgSend_UTF8String(v22, v23, v24);
  sub_262F0D938(v9, (const char *)v12, 4 * v9, v13, v25);
  free(v13);
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
    int v14 = v11;
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
  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v22, Width, Height, v12, a4);

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
  int v14 = malloc_type_malloc(4 * Width * Height, 0x486BAFCBuLL);
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
            int v25 = (char *)&unk_262F137A0
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
    sub_262F0D938(Width, (const char *)Height, 4 * Width, v15, a4);
    free(v15);
  }
}

- (void)saveF16DisparityBufferAsTurbo:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 WithDisparityScale:(float)a5 AndPercentile:(float)a6
{
  uint64_t v13 = 0;
  objc_msgSend_computeRobustMinMaxForF16DisparityBuffer_WithDisparityScale_AndPercentile_OutSignalMin_OutSignalMax_(self, a2, (uint64_t)a3, (char *)&v13 + 4, &v13);
  *(float *)&double v10 = *((float *)&v13 + 1) * a5;
  *(float *)&double v11 = *(float *)&v13 * a5;
  objc_msgSend_saveF16DisparityBufferAsTurbo_AsPPMFile_WithMin_WithMax_(self, v12, (uint64_t)a3, a4, v10, v11);
}

- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsGrayScalePPMFile:(const char *)a4 range:
{
  uint64_t v40 = v4;
  unsigned int Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (__int16 *)CVPixelBufferGetBaseAddress(a3);
  double v11 = (float *)malloc_type_malloc(4 * Height * Width, 0x100004052888210uLL);
  uint64_t v12 = (char *)v11;
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
  BOOL v25 = *(float *)&v40 != 0.0;
  BOOL v26 = *((float *)&v40 + 1) != 0.0;
  BOOL v27 = v25 && v26;
  if (v25 && v26) {
    float v21 = *(float *)&v40;
  }
  unsigned int v28 = malloc_type_malloc(4 * Height * Width, 0xEEFFE344uLL);
  float v29 = v28;
  if (Height)
  {
    int v30 = 0;
    int v31 = 0;
    if (v27) {
      float v32 = *((float *)&v40 + 1);
    }
    else {
      float v32 = _S8;
    }
    float v33 = v32 - v21;
    unsigned int v34 = 4 * Width;
    uint64_t v35 = 4 * Width;
    v36 = v12;
    do
    {
      if (Width)
      {
        uint64_t v37 = 0;
        do
        {
          char v38 = ~(int)((float)((float)(*(float *)&v36[v37] - v21) / v33) * 255.0);
          int v39 = v30 + v37;
          v28[v39] = v38;
          v28[v39 + 1] = v38;
          v28[v39 + 2] = v38;
          v28[v39 + 3] = -1;
          v37 += 4;
        }
        while (v35 != v37);
      }
      ++v31;
      v36 += v35;
      v30 += 4 * Width;
    }
    while (v31 != Height);
  }
  else
  {
    unsigned int v34 = 4 * Width;
  }
  sub_262F0D938(Width, (const char *)Height, v34, v28, a4);
  free(v29);

  free(v12);
}

- (void)saveF16DisparityTexture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v9 = objc_msgSend_width(v6, v7, v8);
  unsigned int v12 = objc_msgSend_height(v6, v10, v11);
  uint64_t v13 = v9;
  uint64_t v14 = 2 * v9;
  objc_msgSend_makeCoherent_(self, v15, (uint64_t)v6);
  uint64_t v16 = malloc_type_malloc(v14 * v12, 0x9A2D9640uLL);
  memset(v19, 0, 24);
  v19[3] = v13;
  v19[4] = v12;
  v19[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v17, (uint64_t)v16, v14, v19, 0);

  objc_msgSend_WriteBinDataToFile_length_fileFullPath_(self, v18, (uint64_t)v16, v14 * v12, a4);
  free(v16);
}

- (void)saveF16Texture:(id)a3 AsGrayScalePPMFile:(const char *)a4 range:
{
  uint64_t v47 = v4;
  id v7 = a3;
  objc_msgSend_makeCoherent_(self, v8, (uint64_t)v7);
  unsigned int v11 = objc_msgSend_width(v7, v9, v10);
  uint64_t v14 = objc_msgSend_height(v7, v12, v13);
  uint64_t v15 = (char *)malloc_type_malloc(2 * v11 * v14, 0x1B666B80uLL);
  memset(v48, 0, 24);
  v48[3] = v11;
  v48[4] = v14;
  v48[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v7, v16, (uint64_t)v15, 2 * v11, v48, 0);
  uint64_t v17 = (float *)malloc_type_malloc(4 * v14 * v11, 0x100004052888210uLL);
  uint64_t v18 = (char *)v17;
  uint64_t v19 = 4 * v11;
  if (v14)
  {
    int v20 = 0;
    float v21 = 3.4028e38;
    float v22 = 1.1755e-38;
    char v23 = v17;
    uint64_t v24 = v15;
    do
    {
      if (v11)
      {
        for (uint64_t i = 0; i != v11; v23[i++] = _S1)
        {
          _H1 = *(_WORD *)&v24[2 * i];
          __asm { FCVT            S1, H1 }
          float v22 = fmaxf(v22, _S1);
          float v21 = fminf(v21, _S1);
        }
      }
      ++v20;
      v24 += 2 * v11;
      char v23 = (float *)((char *)v23 + v19);
    }
    while (v20 != v14);
  }
  else
  {
    float v22 = 1.1755e-38;
    float v21 = 3.4028e38;
  }
  BOOL v32 = *(float *)&v47 != 0.0;
  BOOL v33 = *((float *)&v47 + 1) != 0.0;
  BOOL v34 = v32 && v33;
  if (v32 && v33) {
    float v35 = *(float *)&v47;
  }
  else {
    float v35 = v21;
  }
  v36 = malloc_type_malloc(4 * v14 * v11, 0xBD014032uLL);
  uint64_t v37 = v36;
  if (v14)
  {
    int v38 = 0;
    int v39 = 0;
    if (v34) {
      float v40 = *((float *)&v47 + 1);
    }
    else {
      float v40 = v22;
    }
    float v41 = v40 - v35;
    unsigned int v42 = 4 * v11;
    v43 = v18;
    do
    {
      if (v11)
      {
        uint64_t v44 = 0;
        do
        {
          char v45 = ~(int)((float)((float)(*(float *)&v43[v44] - v35) / v41) * 255.0);
          int v46 = v38 + v44;
          v36[v46] = v45;
          v36[v46 + 1] = v45;
          v36[v46 + 2] = v45;
          v36[v46 + 3] = -1;
          v44 += 4;
        }
        while (v19 != v44);
      }
      ++v39;
      v43 += v19;
      v38 += 4 * v11;
    }
    while (v39 != v14);
  }
  else
  {
    unsigned int v42 = 4 * v11;
  }
  sub_262F0D938(v11, (const char *)v14, v42, v36, a4);
  free(v37);
  free(v15);
  free(v18);
}

- (void)ApplyColorWheelAndWrite:(unsigned int)a3 height:(unsigned int)a4 data:(float *)a5 fileFullPath:(const char *)a6
{
  uint64_t v8 = *(const char **)&a4;
  uint64_t v15 = (void **)sub_262EFAC78(80, 30, 20, 20, 30, 0, 0, 1, 0.0);
  uint64_t v10 = malloc_type_malloc(4 * a3 * v8, 0xA525D3AAuLL);
  sub_262EFB3D0((uint64_t)v15, a3, (int)v8, a5, 4 * a3, 4, (uint64_t)v10, 4 * a3, v11, v12, v13, v14, 4);
  sub_262F0D938(a3, v8, 4 * a3, v10, a6);
  free(v10);
  sub_262EFB2A8(&v15);
}

- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4
{
  id v6 = sub_262F0D3AC(a4, a2);
  if (v6)
  {
    id v7 = v6;
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
    if (Height)
    {
      double v12 = BaseAddress;
      do
      {
        fwrite(v12, 2uLL, Width, v7);
        v12 += BytesPerRow;
        --Height;
      }
      while (Height);
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v7);
  }
  else
  {
    NSLog(&cfstr_CouldNotWriteS.isa, a4);
  }
}

- (void)saveU8Texture:(id)a3 AsPGMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v9 = objc_msgSend_width(v6, v7, v8);
  unsigned int v12 = objc_msgSend_height(v6, v10, v11);
  unsigned int v13 = v12;
  size_t v14 = v9;
  uint64_t v15 = (char *)malloc_type_malloc(v12 * v9 + 4096, 0xEFD33B0CuLL);
  objc_msgSend_makeCoherent_(self, v16, (uint64_t)v6);
  memset(v22, 0, 24);
  v22[3] = v9;
  v22[4] = v12;
  v22[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v17, (uint64_t)v15, v9, v22, 0);
  uint64_t v19 = sub_262F0D3AC(a4, v18);
  if (v19)
  {
    int v20 = v19;
    fprintf(v19, "P5 %u %u 255\n", v9, v12);
    if (v12)
    {
      float v21 = v15;
      do
      {
        fwrite(v21, 1uLL, v14, v20);
        v21 += v14;
        --v13;
      }
      while (v13);
    }
    fclose(v20);
  }
  free(v15);
}

- (void)saveU16Texture:(id)a3 AsPGMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v9 = objc_msgSend_width(v6, v7, v8);
  unsigned int v12 = objc_msgSend_height(v6, v10, v11);
  unsigned int v13 = v12;
  uint64_t v14 = 2 * v9;
  uint64_t v15 = (char *)malloc_type_malloc(v14 * v12, 0xA470F0F9uLL);
  objc_msgSend_makeCoherent_(self, v16, (uint64_t)v6);
  memset(v25, 0, 24);
  v25[3] = v9;
  v25[4] = v12;
  v25[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v17, (uint64_t)v15, v14, v25, 0);
  uint64_t v19 = sub_262F0D3AC(a4, v18);
  if (v19)
  {
    int v20 = v19;
    fprintf(v19, "P5 %u %u 65535\n", v9, v12);
    if (v12)
    {
      int v21 = 0;
      uint64_t v22 = 2 * v9;
      char v23 = v15;
      do
      {
        if (v9)
        {
          uint64_t v24 = 0;
          do
          {
            fprintf(v20, "%u ", *(unsigned __int16 *)&v23[v24]);
            v24 += 2;
          }
          while (v22 != v24);
        }
        fputc(10, v20);
        ++v21;
        v23 += v22;
      }
      while (v21 != v13);
    }
    fclose(v20);
  }
  free(v15);
}

- (void)saveF16RGTexture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v9 = objc_msgSend_width(v6, v7, v8);
  unsigned int v12 = objc_msgSend_height(v6, v10, v11);
  uint64_t v13 = v9;
  uint64_t v14 = 4 * v9;
  objc_msgSend_makeCoherent_(self, v15, (uint64_t)v6);
  uint64_t v16 = malloc_type_malloc(v14 * v12, 0x251B8C2FuLL);
  memset(v19, 0, 24);
  v19[3] = v13;
  v19[4] = v12;
  v19[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v17, (uint64_t)v16, v14, v19, 0);

  objc_msgSend_WriteBinDataToFile_length_fileFullPath_(self, v18, (uint64_t)v16, v14 * v12, a4);
  free(v16);
}

- (void)saveF16DisparityTexture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_width(v6, v7, v8);
  uint64_t v12 = objc_msgSend_height(v6, v10, v11);
  objc_msgSend_makeCoherent_(self, v13, (uint64_t)v6);
  uint64_t v14 = (char *)malloc_type_malloc((2 * v9 * v12), 0x5214660AuLL);
  uint64_t v15 = (char *)malloc_type_malloc(4 * (v9 * v12), 0x100004052888210uLL);
  memset(v28, 0, 24);
  v28[3] = v9;
  v28[4] = v12;
  v28[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v16, (uint64_t)v14, (2 * v9), v28, 0);
  if (v12)
  {
    int v17 = 0;
    uint64_t v18 = v15;
    uint64_t v19 = v14;
    do
    {
      if (v9)
      {
        uint64_t v20 = 0;
        do
        {
          _H0 = *(_WORD *)&v19[2 * v20];
          __asm { FCVT            S0, H0 }
          *(_DWORD *)&v18[4 * v20++] = _S0;
        }
        while (v9 != v20);
      }
      ++v17;
      v19 += 2 * v9;
      v18 += 4 * v9;
    }
    while (v17 != v12);
  }
  free(v14);
  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v27, v9, v12, v15, a4);
  free(v15);
}

- (void)saveRGF16ShiftmapTexture:(id)a3 AsPPMFileSx:(id)a4 AsPPMFileSy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v43 = a5;
  uint64_t v12 = objc_msgSend_width(v8, v10, v11);
  uint64_t v15 = objc_msgSend_height(v8, v13, v14);
  objc_msgSend_makeCoherent_(self, v16, (uint64_t)v8);
  int v17 = (__int16 *)malloc_type_malloc((2 * v15 * 4 * v12), 0x25F132BFuLL);
  uint64_t v18 = malloc_type_malloc(4 * (v12 * v15), 0x100004052888210uLL);
  uint64_t v19 = malloc_type_malloc(4 * (v12 * v15), 0x100004052888210uLL);
  memset(v44, 0, 24);
  v44[3] = v12;
  v44[4] = v15;
  v44[5] = 1;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v8, v20, (uint64_t)v17, (4 * v12), v44, 0);
  if (v15)
  {
    int v21 = 0;
    uint64_t v22 = v19;
    char v23 = v18;
    uint64_t v24 = v17;
    do
    {
      for (int i = v12; i; --i)
      {
        _H0 = *v24;
        __asm { FCVT            S0, H0 }
        *v23++ = _S0;
        LOWORD(_S0) = v24[1];
        __asm { FCVT            S0, H0 }
        *v22++ = _S0;
        v24 += 2;
      }
      ++v21;
    }
    while (v21 != v15);
  }
  free(v17);
  id v33 = v9;
  uint64_t v36 = objc_msgSend_UTF8String(v33, v34, v35);
  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v37, v12, v15, v18, v36);
  free(v18);
  id v38 = v43;
  uint64_t v41 = objc_msgSend_UTF8String(v38, v39, v40);
  objc_msgSend_ApplyColorWheelAndWrite_height_data_fileFullPath_(self, v42, v12, v15, v19, v41);
  free(v19);
}

- (void)saveRGF16Texture:(id)a3 AsF32BinaryFile0:(id)a4 AsF32BinaryFile1:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  uint64_t v14 = (const char *)objc_msgSend_UTF8String(v11, v12, v13);
  uint64_t v16 = sub_262F0D3AC(v14, v15);
  id v17 = v10;
  uint64_t v20 = (const char *)objc_msgSend_UTF8String(v17, v18, v19);
  uint64_t v22 = sub_262F0D3AC(v20, v21);
  __stream = v16;
  if (v16)
  {
    BOOL v25 = v22;
    if (v22)
    {
      unsigned int v26 = objc_msgSend_width(v8, v23, v24);
      unsigned int v29 = objc_msgSend_height(v8, v27, v28);
      unint64_t v30 = 4 * v26;
      objc_msgSend_makeCoherent_(self, v31, (uint64_t)v8);
      BOOL v32 = malloc_type_malloc(v30 * v29, 0x8751C6BFuLL);
      id v33 = v32;
      if (!v32)
      {
        FigDebugAssert3();
        uint64_t v36 = 0;
        BOOL v34 = 0;
        goto LABEL_15;
      }
      uint64_t v54 = (uint64_t)v32;
      BOOL v34 = malloc_type_malloc(4 * v26, 0x42074419uLL);
      if (v34)
      {
        uint64_t v36 = malloc_type_malloc(4 * v26, 0x6F308E3FuLL);
        if (v36)
        {
          id v53 = v17;
          id v37 = v11;
          memset(v56, 0, 24);
          v56[3] = v26;
          v56[4] = v29;
          v56[5] = 1;
          uint64_t v38 = v54;
          objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v8, v35, v54, 4 * v26, v56, 0);
          if (!v29)
          {
            id v33 = (void *)v54;
            id v11 = v37;
            id v17 = v53;
            goto LABEL_15;
          }
          v52 = v37;
          int v39 = 0;
          unint64_t v40 = v30 >> 1;
          do
          {
            if (v26)
            {
              uint64_t v41 = 0;
              unsigned int v42 = v36;
              id v43 = v34;
              do
              {
                _H0 = *(_WORD *)(v38 + 2 * v41);
                __asm { FCVT            S0, H0 }
                _H1 = *(_WORD *)(v38 + 2 * (v41 + 1));
                __asm { FCVT            S1, H1 }
                *v43++ = _S0;
                *v42++ = _S1;
                v41 += 2;
              }
              while (2 * v26 != v41);
            }
            fwrite(v34, 4uLL, v26, __stream);
            fwrite(v36, 4uLL, v26, v25);
            v38 += 2 * v40;
            ++v39;
          }
          while (v39 != v29);
          id v11 = v52;
          id v17 = v53;
        }
        else
        {
          FigDebugAssert3();
        }
      }
      else
      {
        FigDebugAssert3();
        uint64_t v36 = 0;
      }
      id v33 = (void *)v54;
LABEL_15:
      free(v34);
      free(v36);
      free(v33);
      fclose(__stream);
      fclose(v25);
    }
  }
}

- (void)saveRGBA8Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v9 = objc_msgSend_width(v6, v7, v8);
  uint64_t v12 = objc_msgSend_height(v6, v10, v11);
  uint64_t v13 = malloc_type_malloc(4 * v9 * v12, 0xE184E057uLL);
  if (v13)
  {
    uint64_t v15 = v13;
    objc_msgSend_makeCoherent_(self, v14, (uint64_t)v6);
    memset(v17, 0, 24);
    v17[3] = v9;
    v17[4] = v12;
    v17[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v16, (uint64_t)v15, 4 * v9, v17, 0);
    sub_262F0D938(v9, (const char *)v12, 4 * v9, v15, a4);
    free(v15);
  }
  else
  {
    NSLog(&cfstr_CouldNotAlloca_2.isa);
  }
}

- (void)saveRGBA8Texture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v9 = objc_msgSend_width(v6, v7, v8);
  unsigned int v12 = objc_msgSend_height(v6, v10, v11);
  uint64_t v14 = malloc_type_malloc(4 * v9 * v12, 0xFBE724B0uLL);
  if (v14 && (uint64_t v15 = sub_262F0D3AC(a4, v13)) != 0)
  {
    id v17 = v15;
    objc_msgSend_makeCoherent_(self, v16, (uint64_t)v6);
    memset(v19, 0, 24);
    v19[3] = v9;
    v19[4] = v12;
    v19[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v18, (uint64_t)v14, 4 * v9, v19, 0);
    fwrite(v14, 4 * v9 * v12, 1uLL, v17);
    fclose(v17);
  }
  else
  {
    FigDebugAssert3();
  }
  free(v14);
}

- (void)saveRgbaF32PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  id v6 = sub_262F0D3AC(a4, a2);
  if (v6)
  {
    id v7 = v6;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    id v10 = malloc_type_malloc(4 * Width, 0x537B33C4uLL);
    BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    fprintf(v7, "P6 %u %u 255\n", Width, Height);
    if (Height)
    {
      int v13 = 0;
      uint64_t v14 = BytesPerRow >> 2;
      do
      {
        if (Width)
        {
          uint64_t v15 = 0;
          unsigned int v16 = 2;
          do
          {
            v10[v16 - 2] = vcvtms_s32_f32(BaseAddress[v15] * 255.0);
            v10[v16 - 1] = vcvtms_s32_f32(BaseAddress[(v15 + 1)] * 255.0);
            v10[v16] = vcvtms_s32_f32(BaseAddress[(v15 + 2)] * 255.0);
            v16 += 3;
            v15 += 4;
          }
          while (4 * Width != v15);
        }
        fwrite(v10, 3uLL, Width, v7);
        BaseAddress += v14;
        ++v13;
      }
      while (v13 != Height);
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v7);
    free(v10);
  }
  else
  {
    NSLog(&cfstr_CouldNotCreate_5.isa, a4);
  }
}

- (void)save32BGRAPixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  id v5 = sub_262F0D3AC(a4, a2);
  if (v5)
  {
    id v6 = v5;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    unsigned int v9 = malloc_type_malloc(4 * Width, 0x2527136FuLL);
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    fprintf(v6, "P6 %u %u 255\n", Width, Height);
    if (Height)
    {
      for (int i = 0; i != Height; ++i)
      {
        if (Width)
        {
          uint64_t v13 = 0;
          unsigned int v14 = 2;
          do
          {
            v9[v14 - 2] = BaseAddress[(v13 + 2)];
            v9[v14 - 1] = BaseAddress[(v13 + 1)];
            v9[v14] = BaseAddress[v13];
            v14 += 3;
            v13 += 4;
          }
          while (4 * Width != v13);
        }
        fwrite(v9, 3uLL, Width, v6);
        BaseAddress += BytesPerRow;
      }
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    fclose(v6);
    free(v9);
  }
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  CVPixelBufferGetWidth(a3);
  CVPixelBufferGetHeight(a3);

  MEMORY[0x270F9A6D0](self, sel_saveRGBAF16PixelBuffer_out_width_out_height_AsPPMFile_, a3);
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFile:(const char *)a6
{
  id v10 = sub_262F0D3AC(a6, a2);
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
    NSLog(&cfstr_CouldNotCreate_5.isa, a6);
  }
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 AsPPMFileWithAlpha:(const char *)a4
{
  CVPixelBufferGetWidth(a3);
  CVPixelBufferGetHeight(a3);

  MEMORY[0x270F9A6D0](self, sel_saveRGBAF16PixelBuffer_out_width_out_height_AsPPMFileWithAlpha_, a3);
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFileWithAlpha:(const char *)a6
{
  id v10 = sub_262F0D3AC(a6, a2);
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
    NSLog(&cfstr_CouldNotCreate_5.isa, a6);
  }
}

- (void)saveF16Texture:(id)a3 AsF32BinaryFile:(const char *)a4
{
  id v6 = a3;
  uint64_t v8 = sub_262F0D3AC(a4, v7);
  if (v8)
  {
    uint64_t v11 = v8;
    unsigned int v12 = objc_msgSend_width(v6, v9, v10);
    unsigned int v15 = objc_msgSend_height(v6, v13, v14);
    uint64_t v16 = 2 * v12;
    uint64_t v17 = malloc_type_malloc(4 * v12, 0x100004052888210uLL);
    unsigned int v18 = (char *)malloc_type_malloc(v16 * v15, 0xE83D517EuLL);
    objc_msgSend_makeCoherent_(self, v19, (uint64_t)v6);
    memset(v30, 0, 24);
    v30[3] = v12;
    v30[4] = v15;
    v30[5] = 1;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v20, (uint64_t)v18, v16, v30, 0);
    if (v15)
    {
      int v21 = 0;
      uint64_t v22 = v18;
      do
      {
        if (v12)
        {
          for (uint64_t i = 0; i != v12; v17[i++] = _S0)
          {
            _H0 = *(_WORD *)&v22[2 * i];
            __asm { FCVT            S0, H0 }
          }
        }
        fwrite(v17, 4uLL, v12, v11);
        ++v21;
        v22 += v16;
      }
      while (v21 != v15);
    }
    free(v17);
    free(v18);
    fclose(v11);
  }
}

- (void)saveNCCOutputFrom:(id)a3 asBinaryFiles:(const char *)a4
{
  id v6 = a3;
  objc_msgSend_waitForIdle(self->_metalContext, v7, v8);
  objc_msgSend_makeCoherent_(self, v9, (uint64_t)v6);
  uint64_t v12 = objc_msgSend_width(v6, v10, v11);
  uint64_t v15 = objc_msgSend_height(v6, v13, v14);
  unsigned int v18 = objc_msgSend_bufferBytesPerRow(v6, v16, v17);
  uint64_t v19 = (char *)malloc_type_malloc(v18 * v15, 0x658C957BuLL);
  int32x2_t v20 = vabd_s32(vdup_n_s32(v18), (int32x2_t)vshl_u32((uint32x2_t)vdup_n_s32(v12), (uint32x2_t)0x400000003));
  unsigned __int8 v21 = vcgt_u32((uint32x2_t)vdup_lane_s32(v20, 1), (uint32x2_t)v20).u8[0];
  uint64_t v22 = @"f32";
  if (v21) {
    uint64_t v22 = @"f16";
  }
  char v23 = v22;
  size_t v91 = v12;
  id v84 = v6;
  uint64_t v88 = v18;
  objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v24, (uint64_t)v19);
  unsigned int v26 = objc_msgSend_stringWithFormat_(NSString, v25, @"%s_L_%dx%d.%@", a4, v12, v15, v23);
  uint64_t v28 = objc_msgSend_stringWithFormat_(NSString, v27, @"%s_R_%dx%d.%@", a4, v12, v15, v23);
  unint64_t v30 = objc_msgSend_stringWithFormat_(NSString, v29, @"%s_C_%dx%d.%@", a4, v12, v15, v23);
  uint64_t v90 = v12;
  v95 = a4;
  BOOL v32 = objc_msgSend_stringWithFormat_(NSString, v31, @"%s_F_%dx%d.%@", a4, v12, v15, v23);
  id v83 = v26;
  uint64_t v35 = (const char *)objc_msgSend_UTF8String(v83, v33, v34);
  id v37 = sub_262F0D3AC(v35, v36);
  id v38 = v28;
  uint64_t v41 = (const char *)objc_msgSend_UTF8String(v38, v39, v40);
  id v43 = sub_262F0D3AC(v41, v42);
  id v44 = v30;
  uint64_t v47 = (const char *)objc_msgSend_UTF8String(v44, v45, v46);
  v94 = sub_262F0D3AC(v47, v48);
  id v49 = v32;
  v52 = (const char *)objc_msgSend_UTF8String(v49, v50, v51);
  uint64_t v54 = sub_262F0D3AC(v52, v53);
  v55 = 0;
  v92 = v54;
  __stream = v37;
  id v85 = 0;
  if (v37)
  {
    v56 = v43;
    if (v43)
    {
      v57 = v84;
      if (!v94 || !v54) {
        goto LABEL_34;
      }
      id v79 = v49;
      id v80 = v44;
      id v81 = v38;
      v89 = (const char *)v15;
      v82 = v19;
      uint64_t v58 = 4;
      if (v21) {
        uint64_t v58 = 2;
      }
      size_t __size = v58;
      char v59 = 1;
      if ((v21 & 1) == 0) {
        char v59 = 2;
      }
      size_t v60 = v91 << v59;
      v61 = (char *)malloc_type_malloc(v91 << v59, 0xC1004B0FuLL);
      v62 = (char *)malloc_type_malloc(v60, 0xC203B6DuLL);
      v63 = (char *)malloc_type_malloc(v60, 0x769BED74uLL);
      v65 = (char *)malloc_type_malloc(v60, 0x1C0FB887uLL);
      if (v21)
      {
        id v85 = 0;
        v55 = 0;
        if (!v89) {
          goto LABEL_23;
        }
      }
      else
      {
        objc_msgSend_stringWithFormat_(NSString, v64, @"%s_L_%dx%d.ppm", v95, v90, v89);
        id v85 = (id)objc_claimAutoreleasedReturnValue();
        v55 = malloc_type_malloc((4 * v90 * v89), 0xD910200EuLL);
        if (!v89)
        {
LABEL_23:
          if ((v21 & 1) == 0)
          {
            id v75 = v85;
            v78 = (const char *)objc_msgSend_UTF8String(v75, v76, v77);
            sub_262F0D938(v90, v89, 4 * v90, v55, v78);
          }
          if (v61) {
            free(v61);
          }
          v57 = v84;
          id v49 = v79;
          if (v62) {
            free(v62);
          }
          id v38 = v81;
          if (v63) {
            free(v63);
          }
          id v44 = v80;
          if (v65) {
            free(v65);
          }
          uint64_t v19 = v82;
LABEL_34:
          if (!v19) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
      }
      int v66 = 0;
      int v67 = 0;
      v68 = v82;
      unsigned __int8 v86 = v21;
      do
      {
        int v96 = v67;
        if (v90)
        {
          uint64_t v69 = 0;
          uint64_t v70 = 0;
          do
          {
            uint64_t v71 = (v70 + 1);
            uint64_t v72 = (v70 + 2);
            uint64_t v73 = (v70 + 3);
            if (v21)
            {
              *(_WORD *)&v61[v69] = *(_WORD *)&v68[2 * v70];
              *(_WORD *)&v62[v69] = *(_WORD *)&v68[2 * v71];
              *(_WORD *)&v63[v69] = *(_WORD *)&v68[2 * v72];
              *(_WORD *)&v65[v69] = *(_WORD *)&v68[2 * v73];
            }
            else
            {
              *(_DWORD *)&v61[v70] = *(_DWORD *)&v68[4 * v70];
              *(_DWORD *)&v62[v70] = *(_DWORD *)&v68[4 * v71];
              *(_DWORD *)&v63[v70] = *(_DWORD *)&v68[4 * v72];
              *(_DWORD *)&v65[v70] = *(_DWORD *)&v68[4 * v73];
              float v74 = fmaxf(fminf(*(float *)&v68[4 * v70] * 25500.0, 255.0), 0.0);
              v55[(v66 + v70 + 2)] = (int)v74;
              v55[(v66 + v70 + 1)] = (int)v74;
              v55[(v66 + v70)] = (int)v74;
              v55[(v66 + v70 + 3)] = -1;
            }
            v70 += 4;
            v69 += 2;
          }
          while (4 * v91 != v70);
        }
        fwrite(v61, __size, v91, __stream);
        fwrite(v62, __size, v91, v56);
        fwrite(v63, __size, v91, v94);
        unsigned __int8 v21 = v86;
        fwrite(v65, __size, v91, v92);
        v68 += v88;
        int v67 = v96 + 1;
        v66 += 4 * v90;
      }
      while (v96 + 1 != v89);
      goto LABEL_23;
    }
  }
  else
  {
    v56 = v43;
  }
  v57 = v84;
  if (v19) {
LABEL_35:
  }
    free(v19);
LABEL_36:
  if (v55) {
    free(v55);
  }
  if (__stream) {
    fclose(__stream);
  }
  if (v56) {
    fclose(v56);
  }
  if (v94) {
    fclose(v94);
  }
  if (v92) {
    fclose(v92);
  }
}

- (void)savePixelBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  id v7 = objc_msgSend_stringWithFormat_(NSString, v6, @"%s.%c%c%c%c", a4, HIBYTE(PixelFormatType), BYTE2(PixelFormatType), BYTE1(PixelFormatType), PixelFormatType);
  objc_msgSend_createPathIfNeeded_(disparityDebugUtils, v8, (uint64_t)v7);
  id v11 = v7;
  objc_msgSend_UTF8String(v11, v9, v10);
  WritePixelBufferToFile();
}

- (void)WriteBinDataToFile:(void *)a3 length:(unsigned int)a4 fileFullPath:(const char *)a5
{
  id v7 = sub_262F0D3AC(a5, a2);
  if (v7)
  {
    uint64_t v8 = v7;
    fwrite(a3, 1uLL, a4, v7);
    fclose(v8);
  }
}

+ (void)createPathIfNeeded:(id)a3
{
  v3 = objc_msgSend_stringByDeletingLastPathComponent(a3, a2, (uint64_t)a3);
  id v6 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v4, v5);
  id v11 = 0;
  char v8 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v6, v7, (uint64_t)v3, 1, 0, &v11);
  id v9 = v11;
  uint64_t v10 = v9;
  if ((v8 & 1) == 0) {
    NSLog(&cfstr_FailedToCreate.isa, v3, v9);
  }
}

- (void)saveAccumulationFrom:(id)a3 asBinaryFiles:(const char *)a4 forSize:(CGSize)a5 costLineSize:(unsigned __int16)a6
{
  unsigned int v71 = a6;
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  objc_msgSend_waitForIdle(self->_metalContext, v11, v12);
  objc_msgSend_makeCoherent_(self, v13, (uint64_t)v10);
  size_t v79 = width;
  uint64_t v14 = (char *)malloc_type_malloc(4 * v79, 0x100004052888210uLL);
  uint64_t v15 = (char *)malloc_type_malloc(4 * v79, 0x100004052888210uLL);
  uint64_t v16 = (char *)malloc_type_malloc(4 * v79, 0x100004052888210uLL);
  uint64_t v17 = (char *)malloc_type_malloc(4 * v79, 0x100004052888210uLL);
  id v69 = v10;
  uint64_t v20 = objc_msgSend_contents(v69, v18, v19);
  uint64_t v22 = objc_msgSend_stringWithFormat_(NSString, v21, @"%s_L.f32", a4);
  uint64_t v24 = objc_msgSend_stringWithFormat_(NSString, v23, @"%s_R.f32", a4);
  unsigned int v26 = objc_msgSend_stringWithFormat_(NSString, v25, @"%s_C.f32", a4);
  objc_msgSend_stringWithFormat_(NSString, v27, @"%s_W.f32", a4);
  id v77 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(NSString, v28, @"%s_L.ppm", a4);
  id v70 = (id)objc_claimAutoreleasedReturnValue();
  id v68 = v22;
  int v31 = (const char *)objc_msgSend_UTF8String(v68, v29, v30);
  id v33 = sub_262F0D3AC(v31, v32);
  id v34 = v24;
  id v37 = (const char *)objc_msgSend_UTF8String(v34, v35, v36);
  int v39 = sub_262F0D3AC(v37, v38);
  id v40 = v26;
  id v43 = (const char *)objc_msgSend_UTF8String(v40, v41, v42);
  v76 = sub_262F0D3AC(v43, v44);
  id v45 = v77;
  v48 = (const char *)objc_msgSend_UTF8String(v45, v46, v47);
  v50 = sub_262F0D3AC(v48, v49);
  uint64_t v51 = v33;
  v52 = 0;
  float v74 = v50;
  id v75 = v39;
  if (!v51 || !v39)
  {
LABEL_12:
    id v53 = v76;
    goto LABEL_13;
  }
  id v53 = v76;
  if (v76 && v50)
  {
    __stream = v51;
    id v67 = v45;
    uint64_t v54 = malloc_type_malloc(4 * height * v79, 0x1E49E871uLL);
    unsigned int v55 = width;
    v52 = v54;
    unsigned int v72 = height;
    if (height)
    {
      int v56 = 0;
      int v57 = 0;
      do
      {
        int v78 = v57;
        if (v55)
        {
          uint64_t v58 = 0;
          do
          {
            float v59 = *(float *)(v20 + 4 * v58);
            *(float *)&v14[v58] = v59;
            float v60 = fmaxf(fminf(v59 * 25500.0, 255.0), 0.0);
            v52[(v56 + v58 + 2)] = (int)v60;
            v52[(v56 + v58 + 1)] = (int)v60;
            v52[(v56 + v58)] = (int)v60;
            v52[(v56 + v58 + 3)] = -1;
            *(_DWORD *)&v15[v58] = *(_DWORD *)(v20 + 4 * (v58 + 1));
            *(_DWORD *)&v16[v58] = *(_DWORD *)(v20 + 4 * (v58 + 2));
            *(_DWORD *)&v17[v58] = *(_DWORD *)(v20 + 4 * (v58 + 3));
            v58 += 4;
          }
          while (4 * v79 != v58);
        }
        fwrite(v14, 4uLL, v79, __stream);
        fwrite(v15, 4uLL, v79, v75);
        fwrite(v16, 4uLL, v79, v76);
        fwrite(v17, 4uLL, v79, v74);
        unsigned int v55 = width;
        v20 += 4 * v71;
        int v57 = v78 + 1;
        v56 += 4 * v79;
      }
      while (v78 + 1 != v72);
    }
    unsigned int v61 = 4 * v55;
    unsigned int v62 = v55;
    id v63 = v70;
    int v66 = (const char *)objc_msgSend_UTF8String(v63, v64, v65);
    sub_262F0D938(v62, (const char *)v72, v61, v52, v66);
    id v45 = v67;
    uint64_t v51 = __stream;
    goto LABEL_12;
  }
LABEL_13:
  if (v51) {
    fclose(v51);
  }
  if (v75) {
    fclose(v75);
  }
  if (v53) {
    fclose(v53);
  }
  if (v74) {
    fclose(v74);
  }
  free(v52);
  free(v14);
  free(v15);
  free(v16);
  free(v17);
}

- (void)saveF32Texture:(id)a3 AsF32BinaryFile:(const char *)a4
{
  id v6 = a3;
  id v10 = sub_262F0D3AC(a4, v7);
  if (v10)
  {
    unsigned int v11 = objc_msgSend_width(v6, v8, v9);
    unsigned int v14 = objc_msgSend_height(v6, v12, v13);
    size_t v15 = v11;
    size_t v16 = 4 * v11;
    uint64_t v17 = (char *)malloc_type_malloc(v16, 0x100004052888210uLL);
    if (v17)
    {
      uint64_t v19 = (char *)malloc_type_malloc((v16 * v14) & 0xFFFFFFFC, 0x3A8A47EAuLL);
      if (v19)
      {
        objc_msgSend_makeCoherent_(self, v18, (uint64_t)v6);
        memset(v24, 0, 24);
        v24[3] = v15;
        v24[4] = v14;
        v24[5] = 1;
        objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v20, (uint64_t)v19, v16 & 0xFFFFFFFC, v24, 0);
        if (v14)
        {
          int v21 = 0;
          uint64_t v22 = v19;
          do
          {
            if (v15)
            {
              uint64_t v23 = 0;
              do
              {
                *(_DWORD *)&v17[v23] = *(_DWORD *)&v22[v23];
                v23 += 4;
              }
              while (v16 != v23);
            }
            fwrite(v17, 4uLL, v15, v10);
            ++v21;
            v22 += v16 & 0xFFFFFFFC;
          }
          while (v21 != v14);
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
      uint64_t v19 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v19 = 0;
    uint64_t v17 = 0;
  }
  free(v17);
  free(v19);
  fclose(v10);
}

- (void)saveRGBA16FTexture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  char v8 = sub_262F0D3AC(a4, v7);
  if (v8)
  {
    unsigned int v11 = v8;
    unsigned int v12 = objc_msgSend_width(v6, v9, v10);
    unsigned int v15 = objc_msgSend_height(v6, v13, v14);
    size_t v16 = malloc_type_malloc(3 * v12, 0x83FFD161uLL);
    uint64_t v17 = (char *)malloc_type_malloc(8 * v12 * v15, 0x32C1A2B9uLL);
    fprintf(v11, "P6 %u %u 255\n", v12, v15);
    objc_msgSend_makeCoherent_(self, v18, (uint64_t)v6);
    memset(v35, 0, 24);
    v35[3] = v12;
    v35[4] = v15;
    v35[5] = 1;
    id v34 = v6;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v19, (uint64_t)v17, 8 * v12, v35, 0);
    if (v15)
    {
      int v20 = 0;
      int v21 = v17;
      do
      {
        if (v12)
        {
          uint64_t v22 = 0;
          unsigned int v23 = 2;
          do
          {
            _H0 = *(_WORD *)&v21[2 * v22];
            __asm { FCVT            S0, H0 }
            char v30 = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            LOWORD(_S0) = *(_WORD *)&v21[2 * (v22 + 1)];
            __asm { FCVT            S0, H0 }
            char v32 = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            LOWORD(_S0) = *(_WORD *)&v21[2 * (v22 + 2)];
            __asm { FCVT            S0, H0 }
            v16[v23 - 2] = v30;
            v16[v23 - 1] = v32;
            v16[v23] = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            v23 += 3;
            v22 += 4;
          }
          while (4 * v12 != v22);
        }
        fwrite(v16, 3uLL, v12, v11);
        v21 += 8 * v12;
        ++v20;
      }
      while (v20 != v15);
    }
    free(v16);
    free(v17);
    fclose(v11);
    id v6 = v34;
  }
}

- (void)saveRGBA16FTexture:(id)a3 AsF32File:(const char *)a4
{
  id v6 = a3;
  char v8 = sub_262F0D3AC(a4, v7);
  if (v8)
  {
    unsigned int v11 = v8;
    unsigned int v12 = objc_msgSend_width(v6, v9, v10);
    unsigned int v15 = objc_msgSend_height(v6, v13, v14);
    size_t v16 = malloc_type_malloc(16 * v12, 0x100004052888210uLL);
    uint64_t v17 = (char *)malloc_type_malloc(8 * v12 * v15, 0x5DEDB4EEuLL);
    objc_msgSend_makeCoherent_(self, v18, (uint64_t)v6);
    memset(v30, 0, 24);
    v30[3] = v12;
    v30[4] = v15;
    v30[5] = 1;
    unsigned int v29 = v17;
    objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v19, (uint64_t)v17, 8 * v12, v30, 0);
    if (v15)
    {
      for (int i = 0; i != v15; ++i)
      {
        if (v12)
        {
          uint64_t v22 = 0;
          do
          {
            _H0 = *(_WORD *)&v17[2 * (v22 + 2)];
            __asm { FCVT            S0, H0 }
            v20.i32[0] = *(_DWORD *)&v17[2 * v22];
            float16x4_t v20 = (float16x4_t)vcvtq_f32_f16(v20).u64[0];
            *(float16x4_t *)&v16[v22] = v20;
            v16[(v22 + 2)] = _S0;
            v16[(v22 + 3)] = 0;
            v22 += 4;
          }
          while (4 * v12 != v22);
        }
        fwrite(v16, 0x10uLL, v12, v11);
        v17 += 8 * v12;
      }
    }
    free(v16);
    free(v29);
    fclose(v11);
  }
}

- (void)saveRGB10A2Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  char v8 = sub_262F0D3AC(a4, v7);
  if (v8)
  {
    unsigned int v11 = v8;
    if (objc_msgSend_pixelFormat(v6, v9, v10) == 90)
    {
      unsigned int v14 = objc_msgSend_width(v6, v12, v13);
      unsigned int v17 = objc_msgSend_height(v6, v15, v16);
      unsigned int v18 = malloc_type_malloc(3 * v14, 0xF0F0E241uLL);
      uint64_t v19 = (char *)malloc_type_malloc(4 * v14 * v17, 0x40BD4609uLL);
      fprintf(v11, "P6 %u %u 255\n", v14, v17);
      objc_msgSend_makeCoherent_(self, v20, (uint64_t)v6);
      memset(v28, 0, 24);
      v28[3] = v14;
      v28[4] = v17;
      v28[5] = 1;
      BOOL v27 = v19;
      objc_msgSend_getBytes_bytesPerRow_fromRegion_mipmapLevel_(v6, v21, (uint64_t)v19, 4 * v14, v28, 0);
      if (v17)
      {
        int v22 = 0;
        uint64_t v23 = 4 * v14;
        do
        {
          if (v14)
          {
            uint64_t v24 = 0;
            unsigned int v25 = 2;
            do
            {
              unsigned int v26 = *(_DWORD *)&v19[v24];
              v18[v25 - 2] = vcvtms_s32_f32((float)((float)(v26 & 0x3FF) / 1023.0) * 255.0);
              v18[v25 - 1] = vcvtms_s32_f32((float)((float)((v26 >> 10) & 0x3FF) / 1023.0) * 255.0);
              v18[v25] = vcvtms_s32_f32((float)((float)((v26 >> 20) & 0x3FF) / 1023.0) * 255.0);
              v25 += 3;
              v24 += 4;
            }
            while (v23 != v24);
          }
          fwrite(v18, 3uLL, v14, v11);
          ++v22;
          v19 += v23;
        }
        while (v22 != v17);
      }
      free(v18);
      free(v27);
      fclose(v11);
    }
  }
}

- (void).cxx_destruct
{
}

@end