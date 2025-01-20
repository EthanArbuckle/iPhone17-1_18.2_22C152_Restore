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

  [(disparityDebugUtils *)self ApplyColorWheelAndWrite:Width height:Height data:BaseAddress fileFullPath:a4];
}

- (void)saveF32FPBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 scale:(float)a5
{
  v7 = sub_12D30(a4);
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
  v7 = sub_12D30(a4);
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
  v7 = sub_12D30(a4);
  if (v7)
  {
    v8 = v7;
    unsigned int v9 = [v6 width];
    unsigned int v10 = [v6 height];
    v11 = malloc_type_malloc(3 * v9, 0xE57BCB10uLL);
    v12 = (char *)malloc_type_malloc(2 * v9 * v10, 0x2CCF1F48uLL);
    fprintf(v8, "P6 %u %u 255\n", v9, v10);
    [(disparityDebugUtils *)self makeCoherent:v6];
    memset(v25, 0, 24);
    v25[3] = v9;
    v25[4] = v10;
    v25[5] = 1;
    v24 = v12;
    [v6 getBytes:v12 bytesPerRow:2 * v9 fromRegion:v25 mipmapLevel:0];
    if (v10)
    {
      int v13 = 0;
      uint64_t v14 = 2 * v9;
      do
      {
        if (v9)
        {
          uint64_t v15 = 0;
          unsigned int v16 = 2;
          do
          {
            _H0 = *(_WORD *)&v12[v15];
            __asm { FCVT            S0, H0 }
            char v23 = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            v11[v16 - 2] = v23;
            v11[v16 - 1] = v23;
            v11[v16] = v23;
            v16 += 3;
            v15 += 2;
          }
          while (v14 != v15);
        }
        fwrite(v11, 3uLL, v9, v8);
        ++v13;
        v12 += v14;
      }
      while (v13 != v10);
    }
    free(v11);
    free(v24);
    fclose(v8);
  }
}

- (void)saveF32Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  BaseAddress = (float *)CVPixelBufferGetBaseAddress(a3);
  unsigned int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  unsigned int v9 = malloc_type_malloc(4 * Width * Height, 0x56DD33FCuLL);
  unsigned int v10 = v9;
  if (Height)
  {
    int v11 = 0;
    for (int i = 0; i != Height; ++i)
    {
      uint64_t v13 = Width;
      int v14 = v11;
      if (Width)
      {
        do
        {
          int16x8_t v15 = vdupq_n_s16((int)(float)(BaseAddress[v14] * 255.0));
          v15.i16[3] = 255;
          *(_DWORD *)&v9[4 * v14++] = vmovn_s16(v15).u32[0];
          --v13;
        }
        while (v13);
      }
      v11 += Width;
    }
  }
  unsigned int v16 = +[NSString stringWithFormat:@"%s", a4];
  +[disparityDebugUtils createPathIfNeeded:v16];
  id v17 = v16;
  sub_132BC(Width, Height, 4 * Width, v10, (const char *)[v17 UTF8String]);
  free(v10);
}

- (void)saveU8Buffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  BaseAddress = (unsigned __int8 *)CVPixelBufferGetBaseAddress(a3);
  unsigned int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  unsigned int v10 = malloc_type_malloc(4 * Width * Height, 0x4E9F3C5uLL);
  int v11 = v10;
  if (Height)
  {
    int v12 = 0;
    int v13 = 0;
    for (int i = 0; i != Height; ++i)
    {
      uint64_t v15 = Width;
      int v16 = v12;
      int v17 = v13;
      if (Width)
      {
        do
        {
          int16x8_t v18 = vdupq_n_s16(BaseAddress[v16]);
          v18.i16[3] = 255;
          *(_DWORD *)&v10[4 * v17++] = vmovn_s16(v18).u32[0];
          ++v16;
          --v15;
        }
        while (v15);
      }
      v13 += Width;
      v12 += BytesPerRow;
    }
  }
  uint64_t v19 = +[NSString stringWithFormat:@"%s", a4];
  +[disparityDebugUtils createPathIfNeeded:v19];
  id v20 = v19;
  sub_132BC(Width, Height, 4 * Width, v11, (const char *)[v20 UTF8String]);
  free(v11);
}

- (void)saveVUYA4444Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 width];
  unsigned int v8 = [v6 height];
  unsigned int v9 = malloc_type_malloc(4 * v7 * v8, 0xCE17F4E7uLL);
  [(disparityDebugUtils *)self makeCoherent:v6];
  memset(v10, 0, 24);
  v10[3] = v7;
  v10[4] = v8;
  v10[5] = 1;
  [v6 getBytes:v9 bytesPerRow:4 * v7 fromRegion:v10 mipmapLevel:0];

  -[disparityDebugUtils convertVUYA444:rbs:ToRGBA:ofSize:](self, "convertVUYA444:rbs:ToRGBA:ofSize:", v9, 4 * v7, v9, (double)v7, (double)v8);
  sub_132BC(v7, v8, 4 * v7, v9, a4);
  free(v9);
}

- (void)saveVUYA4444Texture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 width];
  unsigned int v8 = [v6 height];
  unsigned int v9 = malloc_type_malloc(4 * v7 * v8, 0x307EB1D4uLL);
  [(disparityDebugUtils *)self makeCoherent:v6];
  memset(v10, 0, 24);
  v10[3] = v7;
  v10[4] = v8;
  v10[5] = 1;
  [v6 getBytes:v9 bytesPerRow:4 * v7 fromRegion:v10 mipmapLevel:0];

  [(disparityDebugUtils *)self WriteBinDataToFile:v9 length:4 * v7 * v8 fileFullPath:a4];
  free(v9);
}

- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4
{
}

- (void)saveVUYA4444PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)Width out_height:(unsigned int)Height AsBinaryFile:(const char *)a6
{
  unsigned int v9 = sub_12D30(a6);
  if (!v9) {
    return;
  }
  unsigned int v10 = v9;
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
  -[disparityDebugUtils convertVUYA444:rbs:ToRGBA:ofSize:](self, "convertVUYA444:rbs:ToRGBA:ofSize:", CVPixelBufferGetBaseAddress(a3), BytesPerRow, v14, (double)Width, (double)Height);
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  if (a4) {
    unsigned int v15 = a4;
  }
  else {
    unsigned int v15 = Width;
  }
  if (a5) {
    unsigned int v16 = a5;
  }
  else {
    unsigned int v16 = Height;
  }
  sub_132BC(v15, v16, 4 * Width, v14, a6);

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
  if (v7) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = Height;
  }
  [(disparityDebugUtils *)self convertRGB10A2ToRGBA8:BaseAddress rbs:BytesPerRow ToRGBA:v14 outWidth:v8 outHeight:v7];
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  sub_132BC(v8, v7, 4 * v8, v14, a6);

  free(v14);
}

- (void)saveRGB10A2PixelBuffer:(__CVBuffer *)a3 AsPPMFileWithAlpha:(const char *)a4
{
}

- (void)saveRGB10A2PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFileWithAlpha:(const char *)a6
{
  LODWORD(v7) = a5;
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
  if (v7) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = Height;
  }
  [(disparityDebugUtils *)self convertRGB10A2ToRGBA8:BaseAddress rbs:BytesPerRow ToRGBA:v14 outWidth:v8 outHeight:v7];
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  unsigned int v16 = sub_12D30(a6);
  if (v16)
  {
    int v17 = v16;
    int16x8_t v18 = (char *)malloc_type_malloc((4 * v8), 0xCF9B36E4uLL);
    if (v18)
    {
      uint64_t v19 = v18;
      fprintf(v17, "P7\nWIDTH %u\nHEIGHT %u\nDEPTH 4\nMAXVAL 255\nTUPLTYPE RGB_ALPHA\nENDHDR", v8, v7);
      if (v7)
      {
        int v20 = 0;
        char v21 = v14;
        do
        {
          if (v8)
          {
            uint64_t v22 = 0;
            int v23 = v8;
            do
            {
              v24 = &v19[v22];
              char *v24 = v21[v22];
              v24[1] = v21[v22 + 1];
              v24[2] = v21[v22 + 2];
              v24[3] = v21[v22 + 3];
              v22 += 4;
              --v23;
            }
            while (v23);
          }
          fwrite(v19, 4uLL, v8, v17);
          v21 += (4 * v8);
          ++v20;
        }
        while (v20 != v7);
      }
      free(v19);
    }
    fclose(v17);
  }

  free(v14);
}

- (void)save420CVPixelBuffer:(__CVBuffer *)a3 to:(const char *)a4
{
  id v5 = sub_12D30(a4);
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
  uint64_t v7 = sub_12D30(a4);
  if (v7)
  {
    size_t v8 = v7;
    unsigned int v9 = [v6 width];
    unsigned int v10 = [v6 height];
    uint64_t v11 = malloc_type_malloc(v10 * v9, 0x620FB7E0uLL);
    [(disparityDebugUtils *)self makeCoherent:v6];
    size_t v12 = v9;
    memset(v14, 0, 24);
    v14[3] = v9;
    v14[4] = v10;
    v14[5] = 1;
    [v6 getBytes:v11 bytesPerRow:v9 fromRegion:v14 mipmapLevel:0];
    fwrite(v11, 1uLL, v10 * v9, v8);
    bzero(v11, v9);
    if (v10)
    {
      for (unsigned int i = 0; i < v10; i += 2)
        fwrite(v11, 1uLL, v12, v8);
    }
    free(v11);
    fclose(v8);
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
  unsigned int v7 = [v6 width];
  unsigned int v8 = [v6 height];
  uint64_t v9 = malloc_type_malloc(4 * v7 * v8, 0xC2B60A0AuLL);
  [(disparityDebugUtils *)self makeCoherent:v6];
  memset(v12, 0, 24);
  v12[3] = v7;
  v12[4] = v8;
  v12[5] = 1;
  objc_msgSend(v6, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v9, 4 * (void)objc_msgSend(v6, "width"), v12, 0);

  uint64_t v10 = +[NSString stringWithFormat:@"%s", a4];
  +[disparityDebugUtils createPathIfNeeded:v10];
  id v11 = v10;
  sub_132BC(v7, v8, 4 * v7, v9, (const char *)[v11 UTF8String]);
  free(v9);
}

- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  id v11 = (char *)malloc_type_malloc(4 * (Width * Height), 0x100004052888210uLL);
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
  [(disparityDebugUtils *)self ApplyColorWheelAndWrite:Width height:Height data:v12 fileFullPath:a4];

  free(v12);
}

- (void)computeRobustMinMaxForF16DisparityBuffer:(__CVBuffer *)a3 WithDisparityScale:(float)a4 AndPercentile:(float)a5 OutSignalMin:(float *)a6 OutSignalMax:(float *)a7
{
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
        int v17 = &BaseAddress[BytesPerRow * i];
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
  int Height = CVPixelBufferGetHeight(a3);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(a3);
  int v14 = malloc_type_malloc(4 * Width * Height, 0x486BAFCBuLL);
  if (v14)
  {
    uint64_t v15 = v14;
    if (Height)
    {
      for (uint64_t i = 0; i != Height; ++i)
      {
        if (Width)
        {
          uint64_t v17 = 0;
          uint64_t v18 = &v14[4 * Width * i];
          do
          {
            _H3 = *(_WORD *)&BaseAddress[v17];
            __asm { FCVT            S3, H3 }
            v25 = (char *)&unk_2D600
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
        BaseAddress += BytesPerRow & 0xFFFFFFFE;
      }
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    sub_132BC(Width, Height, 4 * Width, v15, a4);
    free(v15);
  }
}

- (void)saveF16DisparityBufferAsTurbo:(__CVBuffer *)a3 AsPPMFile:(const char *)a4 WithDisparityScale:(float)a5 AndPercentile:(float)a6
{
  uint64_t v12 = 0;
  -[disparityDebugUtils computeRobustMinMaxForF16DisparityBuffer:WithDisparityScale:AndPercentile:OutSignalMin:OutSignalMax:](self, "computeRobustMinMaxForF16DisparityBuffer:WithDisparityScale:AndPercentile:OutSignalMin:OutSignalMax:", a3, (char *)&v12 + 4, &v12);
  *(float *)&double v10 = *((float *)&v12 + 1) * a5;
  *(float *)&double v11 = *(float *)&v12 * a5;
  [(disparityDebugUtils *)self saveF16DisparityBufferAsTurbo:a3 AsPPMFile:a4 WithMin:v10 WithMax:v11];
}

- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsGrayScalePPMFile:(const char *)a4 range:
{
  uint64_t v40 = v4;
  unsigned int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
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
  sub_132BC(Width, Height, v34, v28, a4);
  free(v29);

  free(v12);
}

- (void)saveF16DisparityTexture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 width];
  unsigned int v8 = [v6 height];
  uint64_t v9 = v7;
  uint64_t v10 = 2 * v7;
  [(disparityDebugUtils *)self makeCoherent:v6];
  double v11 = malloc_type_malloc(v10 * v8, 0x9A2D9640uLL);
  memset(v12, 0, 24);
  v12[3] = v9;
  v12[4] = v8;
  v12[5] = 1;
  [v6 getBytes:v11 bytesPerRow:v10 fromRegion:v12 mipmapLevel:0];

  [(disparityDebugUtils *)self WriteBinDataToFile:v11 length:v10 * v8 fileFullPath:a4];
  free(v11);
}

- (void)saveF16Texture:(id)a3 AsGrayScalePPMFile:(const char *)a4 range:
{
  uint64_t v41 = v4;
  id v7 = a3;
  [(disparityDebugUtils *)self makeCoherent:v7];
  unsigned int v8 = [v7 width];
  unsigned int v9 = [v7 height];
  uint64_t v10 = (char *)malloc_type_malloc(2 * v8 * v9, 0x1B666B80uLL);
  memset(v42, 0, 24);
  v42[3] = v8;
  v42[4] = v9;
  v42[5] = 1;
  [v7 getBytes:v10 bytesPerRow:2 * v8 fromRegion:v42 mipmapLevel:0];
  double v11 = (float *)malloc_type_malloc(4 * v9 * v8, 0x100004052888210uLL);
  uint64_t v12 = (char *)v11;
  uint64_t v13 = 4 * v8;
  if (v9)
  {
    int v14 = 0;
    float v15 = 3.4028e38;
    float v16 = 1.1755e-38;
    uint64_t v17 = v11;
    uint64_t v18 = v10;
    do
    {
      if (v8)
      {
        for (uint64_t i = 0; i != v8; v17[i++] = _S1)
        {
          _H1 = *(_WORD *)&v18[2 * i];
          __asm { FCVT            S1, H1 }
          float v16 = fmaxf(v16, _S1);
          float v15 = fminf(v15, _S1);
        }
      }
      ++v14;
      v18 += 2 * v8;
      uint64_t v17 = (float *)((char *)v17 + v13);
    }
    while (v14 != v9);
  }
  else
  {
    float v16 = 1.1755e-38;
    float v15 = 3.4028e38;
  }
  BOOL v26 = *(float *)&v41 != 0.0;
  BOOL v27 = *((float *)&v41 + 1) != 0.0;
  BOOL v28 = v26 && v27;
  if (v26 && v27) {
    float v29 = *(float *)&v41;
  }
  else {
    float v29 = v15;
  }
  int v30 = malloc_type_malloc(4 * v9 * v8, 0xBD014032uLL);
  int v31 = v30;
  if (v9)
  {
    int v32 = 0;
    int v33 = 0;
    if (v28) {
      float v34 = *((float *)&v41 + 1);
    }
    else {
      float v34 = v16;
    }
    float v35 = v34 - v29;
    unsigned int v36 = 4 * v8;
    uint64_t v37 = v12;
    do
    {
      if (v8)
      {
        uint64_t v38 = 0;
        do
        {
          char v39 = ~(int)((float)((float)(*(float *)&v37[v38] - v29) / v35) * 255.0);
          int v40 = v32 + v38;
          v30[v40] = v39;
          v30[v40 + 1] = v39;
          v30[v40 + 2] = v39;
          v30[v40 + 3] = -1;
          v38 += 4;
        }
        while (v13 != v38);
      }
      ++v33;
      v37 += v13;
      v32 += 4 * v8;
    }
    while (v33 != v9);
  }
  else
  {
    unsigned int v36 = 4 * v8;
  }
  sub_132BC(v8, v9, v36, v30, a4);
  free(v31);
  free(v10);
  free(v12);
}

- (void)ApplyColorWheelAndWrite:(unsigned int)a3 height:(unsigned int)a4 data:(float *)a5 fileFullPath:(const char *)a6
{
  float v15 = (void **)sub_1A944(80, 30, 20, 20, 30, 0, 0, 1, 0.0);
  uint64_t v10 = malloc_type_malloc(4 * a3 * a4, 0xA525D3AAuLL);
  sub_1B09C((uint64_t)v15, a3, a4, a5, 4 * a3, 4, (uint64_t)v10, 4 * a3, v11, v12, v13, v14, 4);
  sub_132BC(a3, a4, 4 * a3, v10, a6);
  free(v10);
  sub_1AF74(&v15);
}

- (void)saveF16DisparityBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4
{
  id v6 = sub_12D30(a4);
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
    NSLog(@"Could not write %s", a4);
  }
}

- (void)saveU8Texture:(id)a3 AsPGMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 width];
  unsigned int v8 = [v6 height];
  unsigned int v9 = v8;
  size_t v10 = v7;
  double v11 = (char *)malloc_type_malloc(v8 * v7 + 4096, 0xEFD33B0CuLL);
  [(disparityDebugUtils *)self makeCoherent:v6];
  memset(v15, 0, 24);
  v15[3] = v7;
  v15[4] = v8;
  v15[5] = 1;
  [v6 getBytes:v11 bytesPerRow:v7 fromRegion:v15 mipmapLevel:0];
  double v12 = sub_12D30(a4);
  if (v12)
  {
    double v13 = v12;
    fprintf(v12, "P5 %u %u 255\n", v7, v8);
    if (v8)
    {
      float v14 = v11;
      do
      {
        fwrite(v14, 1uLL, v10, v13);
        v14 += v10;
        --v9;
      }
      while (v9);
    }
    fclose(v13);
  }
  free(v11);
}

- (void)saveU16Texture:(id)a3 AsPGMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 width];
  unsigned int v8 = [v6 height];
  unsigned int v9 = v8;
  uint64_t v10 = 2 * v7;
  double v11 = (char *)malloc_type_malloc(v10 * v8, 0xA470F0F9uLL);
  [(disparityDebugUtils *)self makeCoherent:v6];
  memset(v18, 0, 24);
  v18[3] = v7;
  v18[4] = v8;
  v18[5] = 1;
  [v6 getBytes:v11 bytesPerRow:v10 fromRegion:v18 mipmapLevel:0];
  double v12 = sub_12D30(a4);
  if (v12)
  {
    double v13 = v12;
    fprintf(v12, "P5 %u %u 65535\n", v7, v8);
    if (v8)
    {
      int v14 = 0;
      uint64_t v15 = 2 * v7;
      float v16 = v11;
      do
      {
        if (v7)
        {
          uint64_t v17 = 0;
          do
          {
            fprintf(v13, "%u ", *(unsigned __int16 *)&v16[v17]);
            v17 += 2;
          }
          while (v15 != v17);
        }
        fputc(10, v13);
        ++v14;
        v16 += v15;
      }
      while (v14 != v9);
    }
    fclose(v13);
  }
  free(v11);
}

- (void)saveF16RGTexture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 width];
  unsigned int v8 = [v6 height];
  uint64_t v9 = v7;
  uint64_t v10 = 4 * v7;
  [(disparityDebugUtils *)self makeCoherent:v6];
  double v11 = malloc_type_malloc(v10 * v8, 0x251B8C2FuLL);
  memset(v12, 0, 24);
  v12[3] = v9;
  v12[4] = v8;
  v12[5] = 1;
  [v6 getBytes:v11 bytesPerRow:v10 fromRegion:v12 mipmapLevel:0];

  [(disparityDebugUtils *)self WriteBinDataToFile:v11 length:v10 * v8 fileFullPath:a4];
  free(v11);
}

- (void)saveF16DisparityTexture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  id v7 = [v6 width];
  id v8 = [v6 height];
  [(disparityDebugUtils *)self makeCoherent:v6];
  uint64_t v9 = (char *)malloc_type_malloc((2 * v7 * v8), 0x5214660AuLL);
  uint64_t v10 = (char *)malloc_type_malloc(4 * (v7 * v8), 0x100004052888210uLL);
  memset(v21, 0, 24);
  v21[3] = v7;
  v21[4] = v8;
  v21[5] = 1;
  [v6 getBytes:v9 bytesPerRow:(2 * v7) fromRegion:v21 mipmapLevel:0];
  if (v8)
  {
    int v11 = 0;
    double v12 = v10;
    double v13 = v9;
    do
    {
      if (v7)
      {
        uint64_t v14 = 0;
        do
        {
          _H0 = *(_WORD *)&v13[2 * v14];
          __asm { FCVT            S0, H0 }
          *(_DWORD *)&v12[4 * v14++] = _S0;
        }
        while (v7 != v14);
      }
      ++v11;
      v13 += 2 * v7;
      v12 += 4 * v7;
    }
    while (v11 != v8);
  }
  free(v9);
  [(disparityDebugUtils *)self ApplyColorWheelAndWrite:v7 height:v8 data:v10 fileFullPath:a4];
  free(v10);
}

- (void)saveRGF16ShiftmapTexture:(id)a3 AsPPMFileSx:(id)a4 AsPPMFileSy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v29 = a5;
  id v10 = [v8 width];
  id v11 = [v8 height];
  [(disparityDebugUtils *)self makeCoherent:v8];
  double v12 = (__int16 *)malloc_type_malloc((2 * v11 * 4 * v10), 0x25F132BFuLL);
  double v13 = malloc_type_malloc(4 * (v10 * v11), 0x100004052888210uLL);
  uint64_t v14 = malloc_type_malloc(4 * (v10 * v11), 0x100004052888210uLL);
  memset(v30, 0, 24);
  v30[3] = v10;
  v30[4] = v11;
  v30[5] = 1;
  [v8 getBytes:v12 bytesPerRow:(4 * v10) fromRegion:v30 mipmapLevel:0];
  if (v11)
  {
    int v15 = 0;
    float v16 = v14;
    uint64_t v17 = v13;
    uint64_t v18 = v12;
    do
    {
      for (int i = (int)v10; i; --i)
      {
        _H0 = *v18;
        __asm { FCVT            S0, H0 }
        *v17++ = _S0;
        LOWORD(_S0) = v18[1];
        __asm { FCVT            S0, H0 }
        *v16++ = _S0;
        v18 += 2;
      }
      ++v15;
    }
    while (v15 != v11);
  }
  free(v12);
  id v27 = v9;
  -[disparityDebugUtils ApplyColorWheelAndWrite:height:data:fileFullPath:](self, "ApplyColorWheelAndWrite:height:data:fileFullPath:", v10, v11, v13, [v27 UTF8String]);
  free(v13);
  id v28 = v29;
  -[disparityDebugUtils ApplyColorWheelAndWrite:height:data:fileFullPath:](self, "ApplyColorWheelAndWrite:height:data:fileFullPath:", v10, v11, v14, [v28 UTF8String]);
  free(v14);
}

- (void)saveRGF16Texture:(id)a3 AsF32BinaryFile0:(id)a4 AsF32BinaryFile1:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  double v12 = sub_12D30((const char *)[v11 UTF8String]);
  id v13 = v10;
  uint64_t v14 = sub_12D30((const char *)[v13 UTF8String]);
  __stream = v12;
  if (v12)
  {
    int v15 = v14;
    if (v14)
    {
      unsigned int v16 = [v8 width];
      unsigned int v17 = [v8 height];
      unint64_t v18 = 4 * v16;
      [(disparityDebugUtils *)self makeCoherent:v8];
      int v19 = (char *)malloc_type_malloc(v18 * v17, 0x8751C6BFuLL);
      int v20 = v19;
      if (!v19)
      {
        FigDebugAssert3();
        BOOL v22 = 0;
        float v21 = 0;
        goto LABEL_15;
      }
      int v40 = v19;
      float v21 = malloc_type_malloc(4 * v16, 0x42074419uLL);
      if (v21)
      {
        BOOL v22 = malloc_type_malloc(4 * v16, 0x6F308E3FuLL);
        if (v22)
        {
          id v39 = v13;
          id v23 = v11;
          memset(v42, 0, 24);
          v42[3] = v16;
          v42[4] = v17;
          v42[5] = 1;
          int v24 = v40;
          [v8 getBytes:v40 bytesPerRow:4 * v16 fromRegion:v42 mipmapLevel:0];
          if (!v17)
          {
            int v20 = v40;
            id v11 = v23;
            id v13 = v39;
            goto LABEL_15;
          }
          uint64_t v38 = v23;
          int v25 = 0;
          unint64_t v26 = v18 >> 1;
          do
          {
            if (v16)
            {
              uint64_t v27 = 0;
              id v28 = v22;
              id v29 = v21;
              do
              {
                _H0 = *(_WORD *)&v24[2 * v27];
                __asm { FCVT            S0, H0 }
                _H1 = *(_WORD *)&v24[2 * (v27 + 1)];
                __asm { FCVT            S1, H1 }
                *v29++ = _S0;
                *v28++ = _S1;
                v27 += 2;
              }
              while (2 * v16 != v27);
            }
            fwrite(v21, 4uLL, v16, __stream);
            fwrite(v22, 4uLL, v16, v15);
            v24 += 2 * v26;
            ++v25;
          }
          while (v25 != v17);
          id v11 = v38;
          id v13 = v39;
        }
        else
        {
          FigDebugAssert3();
        }
      }
      else
      {
        FigDebugAssert3();
        BOOL v22 = 0;
      }
      int v20 = v40;
LABEL_15:
      free(v21);
      free(v22);
      free(v20);
      fclose(__stream);
      fclose(v15);
    }
  }
}

- (void)saveRGBA8Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 width];
  unsigned int v8 = [v6 height];
  id v9 = malloc_type_malloc(4 * v7 * v8, 0xE184E057uLL);
  if (v9)
  {
    id v10 = v9;
    [(disparityDebugUtils *)self makeCoherent:v6];
    memset(v11, 0, 24);
    v11[3] = v7;
    v11[4] = v8;
    v11[5] = 1;
    [v6 getBytes:v10 bytesPerRow:4 * v7 fromRegion:v11 mipmapLevel:0];
    sub_132BC(v7, v8, 4 * v7, v10, a4);
    free(v10);
  }
  else
  {
    NSLog(@"Could not allocate rgbaImagesData");
  }
}

- (void)saveRGBA8Texture:(id)a3 AsBinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 width];
  unsigned int v8 = [v6 height];
  id v9 = malloc_type_malloc(4 * v7 * v8, 0xFBE724B0uLL);
  if (v9 && (id v10 = sub_12D30(a4)) != 0)
  {
    id v11 = v10;
    [(disparityDebugUtils *)self makeCoherent:v6];
    memset(v12, 0, 24);
    v12[3] = v7;
    v12[4] = v8;
    v12[5] = 1;
    [v6 getBytes:v9 bytesPerRow:4 * v7 fromRegion:v12 mipmapLevel:0];
    fwrite(v9, 4 * v7 * v8, 1uLL, v11);
    fclose(v11);
  }
  else
  {
    FigDebugAssert3();
  }
  free(v9);
}

- (void)saveRgbaF32PixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  id v6 = sub_12D30(a4);
  if (v6)
  {
    unsigned int v7 = v6;
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
    NSLog(@"Could not create %s", a4);
  }
}

- (void)save32BGRAPixelBuffer:(__CVBuffer *)a3 AsPPMFile:(const char *)a4
{
  id v5 = sub_12D30(a4);
  if (v5)
  {
    id v6 = v5;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    unsigned int Width = CVPixelBufferGetWidth(a3);
    int Height = CVPixelBufferGetHeight(a3);
    id v9 = malloc_type_malloc(4 * Width, 0x2527136FuLL);
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
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);

  [(disparityDebugUtils *)self saveRGBAF16PixelBuffer:a3 out_width:Width out_height:Height AsPPMFile:a4];
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFile:(const char *)a6
{
  id v10 = sub_12D30(a6);
  if (v10)
  {
    id v11 = v10;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    double v12 = malloc_type_malloc(3 * a4, 0x6BCC2493uLL);
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
    NSLog(@"Could not create %s", a6);
  }
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 AsPPMFileWithAlpha:(const char *)a4
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);

  [(disparityDebugUtils *)self saveRGBAF16PixelBuffer:a3 out_width:Width out_height:Height AsPPMFileWithAlpha:a4];
}

- (void)saveRGBAF16PixelBuffer:(__CVBuffer *)a3 out_width:(unsigned int)a4 out_height:(unsigned int)a5 AsPPMFileWithAlpha:(const char *)a6
{
  id v10 = sub_12D30(a6);
  if (v10)
  {
    id v11 = v10;
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    double v12 = malloc_type_malloc(4 * a4, 0x7263A86CuLL);
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
    NSLog(@"Could not create %s", a6);
  }
}

- (void)saveF16Texture:(id)a3 AsF32BinaryFile:(const char *)a4
{
  id v6 = a3;
  unsigned int v7 = sub_12D30(a4);
  if (v7)
  {
    unsigned int v8 = v7;
    unsigned int v9 = [v6 width];
    unsigned int v10 = [v6 height];
    uint64_t v11 = 2 * v9;
    double v12 = malloc_type_malloc(4 * v9, 0x100004052888210uLL);
    uint64_t v13 = (char *)malloc_type_malloc(v11 * v10, 0xE83D517EuLL);
    [(disparityDebugUtils *)self makeCoherent:v6];
    memset(v23, 0, 24);
    v23[3] = v9;
    v23[4] = v10;
    v23[5] = 1;
    [v6 getBytes:v13 bytesPerRow:v11 fromRegion:v23 mipmapLevel:0];
    if (v10)
    {
      int v14 = 0;
      int v15 = v13;
      do
      {
        if (v9)
        {
          for (uint64_t i = 0; i != v9; v12[i++] = _S0)
          {
            _H0 = *(_WORD *)&v15[2 * i];
            __asm { FCVT            S0, H0 }
          }
        }
        fwrite(v12, 4uLL, v9, v8);
        ++v14;
        v15 += v11;
      }
      while (v14 != v10);
    }
    free(v12);
    free(v13);
    fclose(v8);
  }
}

- (void)saveNCCOutputFrom:(id)a3 asBinaryFiles:(const char *)a4
{
  id v6 = a3;
  [(FigMetalContext *)self->_metalContext waitForIdle];
  [(disparityDebugUtils *)self makeCoherent:v6];
  id v7 = [v6 width];
  id v8 = [v6 height];
  unsigned int v9 = [v6 bufferBytesPerRow];
  unsigned int v10 = (char *)malloc_type_malloc(v9 * v8, 0x658C957BuLL);
  int32x2_t v11 = vabd_s32(vdup_n_s32(v9), (int32x2_t)vshl_u32((uint32x2_t)vdup_n_s32(v7), (uint32x2_t)0x400000003));
  unsigned __int8 v12 = vcgt_u32((uint32x2_t)vdup_lane_s32(v11, 1), (uint32x2_t)v11).u8[0];
  uint64_t v13 = @"f32";
  if (v12) {
    uint64_t v13 = @"f16";
  }
  int v14 = v13;
  size_t v56 = v7;
  id v49 = v6;
  uint64_t v53 = v9;
  objc_msgSend(v6, "getBytes:bytesPerRow:fromRegion:mipmapLevel:", v10);
  int v15 = +[NSString stringWithFormat:@"%s_L_%dx%d.%@", a4, v7, v8, v14];
  uint64_t v16 = +[NSString stringWithFormat:@"%s_R_%dx%d.%@", a4, v7, v8, v14];
  uint64_t v17 = +[NSString stringWithFormat:@"%s_C_%dx%d.%@", a4, v7, v8, v14];
  id v55 = v7;
  v60 = a4;
  unsigned int v18 = +[NSString stringWithFormat:@"%s_F_%dx%d.%@", a4, v7, v8, v14];
  id v48 = v15;
  int v19 = sub_12D30((const char *)[v48 UTF8String]);
  id v20 = v16;
  float v21 = sub_12D30((const char *)[v20 UTF8String]);
  id v22 = v17;
  v59 = sub_12D30((const char *)[v22 UTF8String]);
  id v23 = v18;
  int v24 = sub_12D30((const char *)[v23 UTF8String]);
  int v25 = 0;
  v57 = v24;
  __stream = v19;
  id v50 = 0;
  if (v19)
  {
    unint64_t v26 = v21;
    if (v21)
    {
      uint64_t v27 = v49;
      if (!v59 || !v24) {
        goto LABEL_34;
      }
      id v44 = v23;
      id v45 = v22;
      id v46 = v20;
      id v54 = v8;
      v47 = v10;
      uint64_t v28 = 4;
      if (v12) {
        uint64_t v28 = 2;
      }
      size_t __size = v28;
      char v29 = 1;
      if ((v12 & 1) == 0) {
        char v29 = 2;
      }
      size_t v30 = v56 << v29;
      int v31 = (char *)malloc_type_malloc(v56 << v29, 0xC1004B0FuLL);
      int v32 = (char *)malloc_type_malloc(v30, 0xC203B6DuLL);
      int v33 = (char *)malloc_type_malloc(v30, 0x769BED74uLL);
      float v34 = (char *)malloc_type_malloc(v30, 0x1C0FB887uLL);
      if (v12)
      {
        id v50 = 0;
        int v25 = 0;
        if (!v54) {
          goto LABEL_23;
        }
      }
      else
      {
        id v50 = +[NSString stringWithFormat:@"%s_L_%dx%d.ppm", v60, v55, v54];
        int v25 = malloc_type_malloc((4 * v55 * v54), 0xD910200EuLL);
        if (!v54)
        {
LABEL_23:
          if ((v12 & 1) == 0) {
            sub_132BC(v55, (int)v54, 4 * v55, v25, (const char *)[v50 UTF8String]);
          }
          if (v31) {
            free(v31);
          }
          uint64_t v27 = v49;
          id v23 = v44;
          if (v32) {
            free(v32);
          }
          id v20 = v46;
          if (v33) {
            free(v33);
          }
          id v22 = v45;
          if (v34) {
            free(v34);
          }
          unsigned int v10 = v47;
LABEL_34:
          if (!v10) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }
      }
      int v35 = 0;
      int v36 = 0;
      uint64_t v37 = v47;
      unsigned __int8 v51 = v12;
      do
      {
        int v61 = v36;
        if (v55)
        {
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          do
          {
            uint64_t v40 = (v39 + 1);
            uint64_t v41 = (v39 + 2);
            uint64_t v42 = (v39 + 3);
            if (v12)
            {
              *(_WORD *)&v31[v38] = *(_WORD *)&v37[2 * v39];
              *(_WORD *)&v32[v38] = *(_WORD *)&v37[2 * v40];
              *(_WORD *)&v33[v38] = *(_WORD *)&v37[2 * v41];
              *(_WORD *)&v34[v38] = *(_WORD *)&v37[2 * v42];
            }
            else
            {
              *(_DWORD *)&v31[v39] = *(_DWORD *)&v37[4 * v39];
              *(_DWORD *)&v32[v39] = *(_DWORD *)&v37[4 * v40];
              *(_DWORD *)&v33[v39] = *(_DWORD *)&v37[4 * v41];
              *(_DWORD *)&v34[v39] = *(_DWORD *)&v37[4 * v42];
              float v43 = fmaxf(fminf(*(float *)&v37[4 * v39] * 25500.0, 255.0), 0.0);
              v25[(v35 + v39 + 2)] = (int)v43;
              v25[(v35 + v39 + 1)] = (int)v43;
              v25[(v35 + v39)] = (int)v43;
              v25[(v35 + v39 + 3)] = -1;
            }
            v39 += 4;
            v38 += 2;
          }
          while (4 * v56 != v39);
        }
        fwrite(v31, __size, v56, __stream);
        fwrite(v32, __size, v56, v26);
        fwrite(v33, __size, v56, v59);
        unsigned __int8 v12 = v51;
        fwrite(v34, __size, v56, v57);
        v37 += v53;
        int v36 = v61 + 1;
        v35 += 4 * v55;
      }
      while (v61 + 1 != v54);
      goto LABEL_23;
    }
  }
  else
  {
    unint64_t v26 = v21;
  }
  uint64_t v27 = v49;
  if (v10) {
LABEL_35:
  }
    free(v10);
LABEL_36:
  if (v25) {
    free(v25);
  }
  if (__stream) {
    fclose(__stream);
  }
  if (v26) {
    fclose(v26);
  }
  if (v59) {
    fclose(v59);
  }
  if (v57) {
    fclose(v57);
  }
}

- (void)savePixelBuffer:(__CVBuffer *)a3 AsBinaryFile:(const char *)a4
{
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  id v6 = +[NSString stringWithFormat:@"%s.%c%c%c%c", a4, HIBYTE(PixelFormatType), BYTE2(PixelFormatType), BYTE1(PixelFormatType), PixelFormatType];
  +[disparityDebugUtils createPathIfNeeded:v6];
  id v7 = v6;
  [v7 UTF8String];
  WritePixelBufferToFile();
}

- (void)WriteBinDataToFile:(void *)a3 length:(unsigned int)a4 fileFullPath:(const char *)a5
{
  id v7 = sub_12D30(a5);
  if (v7)
  {
    id v8 = v7;
    fwrite(a3, 1uLL, a4, v7);
    fclose(v8);
  }
}

+ (void)createPathIfNeeded:(id)a3
{
  v3 = [a3 stringByDeletingLastPathComponent];
  uint64_t v4 = +[NSFileManager defaultManager];
  id v8 = 0;
  unsigned __int8 v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v8];
  id v6 = v8;
  id v7 = v6;
  if ((v5 & 1) == 0) {
    NSLog(@"Failed to create directory \"%@\". Error: %@", v3, v6);
  }
}

- (void)saveAccumulationFrom:(id)a3 asBinaryFiles:(const char *)a4 forSize:(CGSize)a5 costLineSize:(unsigned __int16)a6
{
  unsigned int v39 = a6;
  double height = a5.height;
  double width = a5.width;
  id v10 = a3;
  [(FigMetalContext *)self->_metalContext waitForIdle];
  [(disparityDebugUtils *)self makeCoherent:v10];
  size_t v47 = width;
  int32x2_t v11 = (char *)malloc_type_malloc(4 * v47, 0x100004052888210uLL);
  unsigned __int8 v12 = (char *)malloc_type_malloc(4 * v47, 0x100004052888210uLL);
  uint64_t v13 = (char *)malloc_type_malloc(4 * v47, 0x100004052888210uLL);
  int v14 = (char *)malloc_type_malloc(4 * v47, 0x100004052888210uLL);
  id v37 = v10;
  int v15 = (float *)[v37 contents];
  uint64_t v16 = +[NSString stringWithFormat:@"%s_L.f32", a4];
  uint64_t v17 = +[NSString stringWithFormat:@"%s_R.f32", a4];
  unsigned int v18 = +[NSString stringWithFormat:@"%s_C.f32", a4];
  id v45 = +[NSString stringWithFormat:@"%s_W.f32", a4];
  id v38 = +[NSString stringWithFormat:@"%s_L.ppm", a4];
  id v36 = v16;
  int v19 = sub_12D30((const char *)[v36 UTF8String]);
  id v20 = v17;
  float v21 = sub_12D30((const char *)[v20 UTF8String]);
  id v22 = v18;
  id v44 = sub_12D30((const char *)[v22 UTF8String]);
  id v23 = v45;
  int v24 = sub_12D30((const char *)[v23 UTF8String]);
  int v25 = v19;
  unint64_t v26 = 0;
  uint64_t v42 = v24;
  float v43 = v21;
  if (!v25 || !v21)
  {
LABEL_12:
    uint64_t v27 = v44;
    goto LABEL_13;
  }
  uint64_t v27 = v44;
  if (v44 && v24)
  {
    __stream = v25;
    id v35 = v23;
    uint64_t v28 = malloc_type_malloc(4 * height * v47, 0x1E49E871uLL);
    unsigned int v29 = width;
    unint64_t v26 = v28;
    int v40 = height;
    if (height)
    {
      int v30 = 0;
      int v31 = 0;
      do
      {
        int v46 = v31;
        if (v29)
        {
          uint64_t v32 = 0;
          do
          {
            float v33 = v15[v32];
            *(float *)&v11[v32] = v33;
            float v34 = fmaxf(fminf(v33 * 25500.0, 255.0), 0.0);
            v26[(v30 + v32 + 2)] = (int)v34;
            v26[(v30 + v32 + 1)] = (int)v34;
            v26[(v30 + v32)] = (int)v34;
            v26[(v30 + v32 + 3)] = -1;
            *(float *)&v12[v32] = v15[(v32 + 1)];
            *(float *)&v13[v32] = v15[(v32 + 2)];
            *(float *)&v14[v32] = v15[(v32 + 3)];
            v32 += 4;
          }
          while (4 * v47 != v32);
        }
        fwrite(v11, 4uLL, v47, __stream);
        fwrite(v12, 4uLL, v47, v43);
        fwrite(v13, 4uLL, v47, v44);
        fwrite(v14, 4uLL, v47, v42);
        unsigned int v29 = width;
        v15 += v39;
        int v31 = v46 + 1;
        v30 += 4 * v47;
      }
      while (v46 + 1 != v40);
    }
    sub_132BC(v29, v40, 4 * v29, v26, (const char *)[v38 UTF8String]);
    id v23 = v35;
    int v25 = __stream;
    goto LABEL_12;
  }
LABEL_13:
  if (v25) {
    fclose(v25);
  }
  if (v43) {
    fclose(v43);
  }
  if (v27) {
    fclose(v27);
  }
  if (v42) {
    fclose(v42);
  }
  free(v26);
  free(v11);
  free(v12);
  free(v13);
  free(v14);
}

- (void)saveF32Texture:(id)a3 AsF32BinaryFile:(const char *)a4
{
  id v6 = a3;
  id v7 = sub_12D30(a4);
  if (v7)
  {
    unsigned int v8 = [v6 width];
    unsigned int v9 = [v6 height];
    size_t v10 = v8;
    size_t v11 = 4 * v8;
    unsigned __int8 v12 = (char *)malloc_type_malloc(v11, 0x100004052888210uLL);
    if (v12)
    {
      uint64_t v13 = (char *)malloc_type_malloc((v11 * v9) & 0xFFFFFFFC, 0x3A8A47EAuLL);
      if (v13)
      {
        [(disparityDebugUtils *)self makeCoherent:v6];
        memset(v17, 0, 24);
        v17[3] = v10;
        v17[4] = v9;
        v17[5] = 1;
        [v6 getBytes:v13 bytesPerRow:v11 & 0xFFFFFFFC fromRegion:v17 mipmapLevel:0];
        if (v9)
        {
          int v14 = 0;
          int v15 = v13;
          do
          {
            if (v10)
            {
              uint64_t v16 = 0;
              do
              {
                *(_DWORD *)&v12[v16] = *(_DWORD *)&v15[v16];
                v16 += 4;
              }
              while (v11 != v16);
            }
            fwrite(v12, 4uLL, v10, v7);
            ++v14;
            v15 += v11 & 0xFFFFFFFC;
          }
          while (v14 != v9);
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
      uint64_t v13 = 0;
    }
  }
  else
  {
    FigDebugAssert3();
    uint64_t v13 = 0;
    unsigned __int8 v12 = 0;
  }
  free(v12);
  free(v13);
  fclose(v7);
}

- (void)saveRGBA16FTexture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  id v7 = sub_12D30(a4);
  if (v7)
  {
    unsigned int v8 = v7;
    unsigned int v9 = [v6 width];
    unsigned int v10 = [v6 height];
    size_t v11 = malloc_type_malloc(3 * v9, 0x83FFD161uLL);
    unsigned __int8 v12 = (char *)malloc_type_malloc(8 * v9 * v10, 0x32C1A2B9uLL);
    fprintf(v8, "P6 %u %u 255\n", v9, v10);
    [(disparityDebugUtils *)self makeCoherent:v6];
    memset(v28, 0, 24);
    v28[3] = v9;
    v28[4] = v10;
    v28[5] = 1;
    id v27 = v6;
    [v6 getBytes:v12 bytesPerRow:8 * v9 fromRegion:v28 mipmapLevel:0];
    if (v10)
    {
      int v13 = 0;
      int v14 = v12;
      do
      {
        if (v9)
        {
          uint64_t v15 = 0;
          unsigned int v16 = 2;
          do
          {
            _H0 = *(_WORD *)&v14[2 * v15];
            __asm { FCVT            S0, H0 }
            char v23 = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            LOWORD(_S0) = *(_WORD *)&v14[2 * (v15 + 1)];
            __asm { FCVT            S0, H0 }
            char v25 = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            LOWORD(_S0) = *(_WORD *)&v14[2 * (v15 + 2)];
            __asm { FCVT            S0, H0 }
            v11[v16 - 2] = v23;
            v11[v16 - 1] = v25;
            v11[v16] = vcvtms_s32_f32(fmaxf(fminf(_S0, 1.0), 0.0) * 255.0);
            v16 += 3;
            v15 += 4;
          }
          while (4 * v9 != v15);
        }
        fwrite(v11, 3uLL, v9, v8);
        v14 += 8 * v9;
        ++v13;
      }
      while (v13 != v10);
    }
    free(v11);
    free(v12);
    fclose(v8);
    id v6 = v27;
  }
}

- (void)saveRGBA16FTexture:(id)a3 AsF32File:(const char *)a4
{
  id v6 = a3;
  id v7 = sub_12D30(a4);
  if (v7)
  {
    unsigned int v8 = v7;
    unsigned int v9 = [v6 width];
    unsigned int v10 = [v6 height];
    size_t v11 = malloc_type_malloc(16 * v9, 0x100004052888210uLL);
    unsigned __int8 v12 = (char *)malloc_type_malloc(8 * v9 * v10, 0x5DEDB4EEuLL);
    [(disparityDebugUtils *)self makeCoherent:v6];
    memset(v23, 0, 24);
    v23[3] = v9;
    v23[4] = v10;
    v23[5] = 1;
    id v22 = v12;
    [v6 getBytes:v12 bytesPerRow:8 * v9 fromRegion:v23 mipmapLevel:0];
    if (v10)
    {
      for (int i = 0; i != v10; ++i)
      {
        if (v9)
        {
          uint64_t v15 = 0;
          do
          {
            _H0 = *(_WORD *)&v12[2 * (v15 + 2)];
            __asm { FCVT            S0, H0 }
            v13.i32[0] = *(_DWORD *)&v12[2 * v15];
            float16x4_t v13 = (float16x4_t)vcvtq_f32_f16(v13).u64[0];
            *(float16x4_t *)&v11[v15] = v13;
            v11[(v15 + 2)] = _S0;
            v11[(v15 + 3)] = 0;
            v15 += 4;
          }
          while (4 * v9 != v15);
        }
        fwrite(v11, 0x10uLL, v9, v8);
        v12 += 8 * v9;
      }
    }
    free(v11);
    free(v22);
    fclose(v8);
  }
}

- (void)saveRGB10A2Texture:(id)a3 AsPPMFile:(const char *)a4
{
  id v6 = a3;
  id v7 = sub_12D30(a4);
  if (v7)
  {
    unsigned int v8 = v7;
    if ([v6 pixelFormat] == (char *)&stru_20.maxprot + 2)
    {
      unsigned int v9 = [v6 width];
      unsigned int v10 = [v6 height];
      size_t v11 = malloc_type_malloc(3 * v9, 0xF0F0E241uLL);
      unsigned __int8 v12 = (char *)malloc_type_malloc(4 * v9 * v10, 0x40BD4609uLL);
      fprintf(v8, "P6 %u %u 255\n", v9, v10);
      [(disparityDebugUtils *)self makeCoherent:v6];
      memset(v19, 0, 24);
      v19[3] = v9;
      v19[4] = v10;
      v19[5] = 1;
      unsigned int v18 = v12;
      [v6 getBytes:v12 bytesPerRow:4 * v9 fromRegion:v19 mipmapLevel:0];
      if (v10)
      {
        int v13 = 0;
        uint64_t v14 = 4 * v9;
        do
        {
          if (v9)
          {
            uint64_t v15 = 0;
            unsigned int v16 = 2;
            do
            {
              unsigned int v17 = *(_DWORD *)&v12[v15];
              v11[v16 - 2] = vcvtms_s32_f32((float)((float)(v17 & 0x3FF) / 1023.0) * 255.0);
              v11[v16 - 1] = vcvtms_s32_f32((float)((float)((v17 >> 10) & 0x3FF) / 1023.0) * 255.0);
              v11[v16] = vcvtms_s32_f32((float)((float)((v17 >> 20) & 0x3FF) / 1023.0) * 255.0);
              v16 += 3;
              v15 += 4;
            }
            while (v14 != v15);
          }
          fwrite(v11, 3uLL, v9, v8);
          ++v13;
          v12 += v14;
        }
        while (v13 != v10);
      }
      free(v11);
      free(v18);
      fclose(v8);
    }
  }
}

- (void).cxx_destruct
{
}

@end