@interface NUPixelFormat
+ (BOOL)supportsPacked10BitsFormats;
+ (BOOL)supportsRenderingToCompressedFormats;
+ (BOOL)supportsUniversalCompressionFormats;
+ (NUPixelFormat)A2RGB10;
+ (NUPixelFormat)ARGB8;
+ (NUPixelFormat)BGRA8;
+ (NUPixelFormat)R16;
+ (NUPixelFormat)R16h;
+ (NUPixelFormat)R32f;
+ (NUPixelFormat)R8;
+ (NUPixelFormat)RG16;
+ (NUPixelFormat)RGBA16;
+ (NUPixelFormat)RGBA8;
+ (NUPixelFormat)RGBAf;
+ (NUPixelFormat)RGBAh;
+ (NUPixelFormat)X2RGB10;
+ (NUPixelFormat)YCC10f420;
+ (NUPixelFormat)YCC10f420p;
+ (NUPixelFormat)sRGB10XR;
+ (NUPixelFormat)sRGBA8;
+ (id)pixelFormatForCIFormat:(int)a3;
+ (id)pixelFormatForCVPixelFormat:(unsigned int)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)chromaSubsampling;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPixelFormat:(id)a3;
- (BOOL)isYCC;
- (BOOL)supportsExtendedRange;
- (NSString)name;
- (int)CIFormat;
- (int64_t)alignedRowBytesForWidth:(int64_t)a3;
- (int64_t)bitsPerComponent;
- (int64_t)bytesPerChroma;
- (int64_t)bytesPerLuma;
- (int64_t)bytesPerPixel;
- (int64_t)numberOfComponents;
- (unint64_t)hash;
- (unint64_t)metalFormat;
- (unsigned)CVPixelFormat;
- (void)nu_updateDigest:(id)a3;
@end

@implementation NUPixelFormat

- (void).cxx_destruct
{
}

- (int64_t)bytesPerChroma
{
  return self->_bytesPerChroma;
}

- (int64_t)bytesPerLuma
{
  return self->_bytesPerLuma;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)chromaSubsampling
{
  int64_t height = self->_chromaSubsampling.height;
  int64_t width = self->_chromaSubsampling.width;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (BOOL)isYCC
{
  return self->_isYCC;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)supportsExtendedRange
{
  return self->_supportsExtendedRange;
}

- (unint64_t)metalFormat
{
  return self->_metalFormat;
}

- (unsigned)CVPixelFormat
{
  return self->_CVPixelFormat;
}

- (int)CIFormat
{
  return self->_CIFormat;
}

- (int64_t)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (int64_t)bytesPerPixel
{
  return self->_bytesPerPixel;
}

- (int64_t)numberOfComponents
{
  return self->_numberOfComponents;
}

- (void)nu_updateDigest:(id)a3
{
  id v4 = a3;
  [v4 addString:@"NUPixelFormat<"];
  [v4 addString:self->_name];
  [v4 addString:@">"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(NUPixelFormat *)self isEqualToPixelFormat:v4];

  return v5;
}

- (BOOL)isEqualToPixelFormat:(id)a3
{
  return [(NSString *)self->_name isEqualToString:*((void *)a3 + 7)];
}

- (unint64_t)hash
{
  return 0x1A9B5EB30F2175 * [(NSString *)self->_name hash];
}

- (int64_t)alignedRowBytesForWidth:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 <= 0)
  {
    v6 = NUAssertLogger_10287();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "width > 0");
      *(_DWORD *)buf = 138543362;
      v23 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v9 = NUAssertLogger_10287();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        v16 = [v14 callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v23 = v13;
        __int16 v24 = 2114;
        v25 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v23 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NUPixelFormat alignedRowBytesForWidth:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPixelFormat.m", 399, @"Invalid parameter not satisfying: %s", v18, v19, v20, v21, (uint64_t)"width > 0");
  }
  int64_t v4 = [(NUPixelFormat *)self bytesPerPixel];

  return +[NUImageUtilities alignedRowBytesForWidth:a3 bytesPerPixel:v4];
}

+ (NUPixelFormat)YCC10f420p
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E258];
  *(_DWORD *)(v2 + 16) = 1885745712;
  *(void *)(v2 + 40) = 10;
  *(_OWORD *)(v2 + 24) = xmmword_1A9A72D70;
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"YCC10f420p";

  *(_WORD *)(v2 + 8) = 256;
  *(void *)(v2 + 48) = 508;
  *(_OWORD *)(v2 + 64) = xmmword_1A9A72D80;
  *(int64x2_t *)(v2 + 80) = vdupq_n_s64(2uLL);

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)YCC10f420
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E250];
  *(_DWORD *)(v2 + 16) = 2019963440;
  *(void *)(v2 + 40) = 10;
  *(int64x2_t *)(v2 + 24) = vdupq_n_s64(3uLL);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"YCC10f420";

  *(_WORD *)(v2 + 8) = 256;
  *(void *)(v2 + 48) = 505;
  *(_OWORD *)(v2 + 64) = xmmword_1A9A72D80;
  *(int64x2_t *)(v2 + 80) = vdupq_n_s64(2uLL);

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)sRGB10XR
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E2E0];
  *(_DWORD *)(v2 + 16) = 1999843442;
  *(void *)(v2 + 40) = 10;
  *(_OWORD *)(v2 + 24) = xmmword_1A9A72D90;
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"sRGB10XR";

  *(unsigned char *)(v2 + 8) = 1;
  *(void *)(v2 + 48) = 555;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)A2RGB10
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E268];
  *(_DWORD *)(v2 + 16) = 1815162994;
  *(void *)(v2 + 40) = 10;
  *(int64x2_t *)(v2 + 24) = vdupq_n_s64(4uLL);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"A2RGB10";

  *(unsigned char *)(v2 + 8) = 0;
  *(void *)(v2 + 48) = 94;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)X2RGB10
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E2D8];
  *(_DWORD *)(v2 + 16) = 1815162994;
  *(void *)(v2 + 40) = 10;
  *(_OWORD *)(v2 + 24) = xmmword_1A9A72D90;
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"RGB10";

  *(unsigned char *)(v2 + 8) = 0;
  *(void *)(v2 + 48) = 94;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)R32f
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E310];
  *(_DWORD *)(v2 + 16) = 1278226534;
  *(void *)(v2 + 40) = 32;
  *(_OWORD *)(v2 + 24) = xmmword_1A9A72DA0;
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"R32f";

  *(unsigned char *)(v2 + 8) = 1;
  *(void *)(v2 + 48) = 55;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)R16h
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E318];
  *(_DWORD *)(v2 + 16) = 1278226536;
  *(void *)(v2 + 40) = 16;
  *(_OWORD *)(v2 + 24) = xmmword_1A9A72DB0;
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"R16h";

  *(unsigned char *)(v2 + 8) = 1;
  *(void *)(v2 + 48) = 25;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)R16
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E2B8];
  *(_DWORD *)(v2 + 16) = 1278226742;
  *(void *)(v2 + 40) = 16;
  *(_OWORD *)(v2 + 24) = xmmword_1A9A72DB0;
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"R16";

  *(unsigned char *)(v2 + 8) = 0;
  *(void *)(v2 + 48) = 20;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)R8
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E2C0];
  *(_DWORD *)(v2 + 16) = 1278226488;
  *(void *)(v2 + 40) = 8;
  *(int64x2_t *)(v2 + 24) = vdupq_n_s64(1uLL);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"R8";

  *(unsigned char *)(v2 + 8) = 0;
  *(void *)(v2 + 48) = 10;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)RGBAh
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E300];
  *(_DWORD *)(v2 + 16) = 1380411457;
  *(void *)(v2 + 40) = 16;
  *(_OWORD *)(v2 + 24) = xmmword_1A9A72DC0;
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"RGBAh";

  *(unsigned char *)(v2 + 8) = 1;
  *(void *)(v2 + 48) = 115;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)RGBAf
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E2F8];
  *(_DWORD *)(v2 + 16) = 1380410945;
  *(void *)(v2 + 40) = 32;
  *(_OWORD *)(v2 + 24) = xmmword_1A9A72DD0;
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"RGBAf";

  *(unsigned char *)(v2 + 8) = 1;
  *(void *)(v2 + 48) = 125;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)RG16
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E2C8];
  *(_DWORD *)(v2 + 16) = 843264310;
  *(void *)(v2 + 40) = 16;
  *(int64x2_t *)(v2 + 24) = vdupq_n_s64(4uLL);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"RG16";

  *(unsigned char *)(v2 + 8) = 0;
  *(void *)(v2 + 48) = 60;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)RGBA16
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E2E8];
  *(_DWORD *)(v2 + 16) = 1647719521;
  *(void *)(v2 + 40) = 16;
  *(_OWORD *)(v2 + 24) = xmmword_1A9A72DC0;
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"RGBA16";

  *(unsigned char *)(v2 + 8) = 0;
  *(void *)(v2 + 48) = 110;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)sRGBA8
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E2F0];
  *(_DWORD *)(v2 + 16) = 1380401729;
  *(void *)(v2 + 40) = 8;
  *(int64x2_t *)(v2 + 24) = vdupq_n_s64(4uLL);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"sRGBA8";

  *(unsigned char *)(v2 + 8) = 0;
  *(void *)(v2 + 48) = 71;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)RGBA8
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E2F0];
  *(_DWORD *)(v2 + 16) = 1380401729;
  *(void *)(v2 + 40) = 8;
  *(int64x2_t *)(v2 + 24) = vdupq_n_s64(4uLL);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"RGBA8";

  *(unsigned char *)(v2 + 8) = 0;
  *(void *)(v2 + 48) = 70;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)BGRA8
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E280];
  *(_DWORD *)(v2 + 16) = 1111970369;
  *(void *)(v2 + 40) = 8;
  *(int64x2_t *)(v2 + 24) = vdupq_n_s64(4uLL);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"BGRA8";

  *(unsigned char *)(v2 + 8) = 0;
  *(void *)(v2 + 48) = 80;

  return (NUPixelFormat *)(id)v2;
}

+ (NUPixelFormat)ARGB8
{
  uint64_t v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = *MEMORY[0x1E4F1E278];
  *(_DWORD *)(v2 + 16) = 32;
  *(void *)(v2 + 40) = 8;
  *(int64x2_t *)(v2 + 24) = vdupq_n_s64(4uLL);
  v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = @"ARGB8";

  *(unsigned char *)(v2 + 8) = 0;
  *(void *)(v2 + 48) = 0;

  return (NUPixelFormat *)(id)v2;
}

+ (id)pixelFormatForCVPixelFormat:(unsigned int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)a3 > 1278226535)
  {
    if ((int)a3 <= 1647719520)
    {
      if ((int)a3 > 1380401728)
      {
        switch(a3)
        {
          case 0x52474241u:
            int64_t v4 = [a1 RGBA8];
            goto LABEL_48;
          case 0x52476641u:
            int64_t v4 = [a1 RGBAf];
            goto LABEL_48;
          case 0x52476841u:
            int64_t v4 = [a1 RGBAh];
            goto LABEL_48;
        }
        goto LABEL_43;
      }
      if (a3 != 1278226536)
      {
        if (a3 != 1278226742) {
          goto LABEL_43;
        }
LABEL_36:
        int64_t v4 = [a1 R16];
        goto LABEL_48;
      }
LABEL_34:
      int64_t v4 = [a1 R16h];
      goto LABEL_48;
    }
    if ((int)a3 > 1751411058)
    {
      if (a3 != 1751411059)
      {
        if (a3 == 1885745712)
        {
          int64_t v4 = [a1 YCC10f420p];
          goto LABEL_48;
        }
        if (a3 == 2019963440)
        {
          int64_t v4 = [a1 YCC10f420];
          goto LABEL_48;
        }
        goto LABEL_43;
      }
      goto LABEL_34;
    }
    if (a3 == 1647719521)
    {
      int64_t v4 = [a1 RGBA16];
      goto LABEL_48;
    }
    int v5 = 1717856627;
    goto LABEL_30;
  }
  if ((int)a3 > 826487093)
  {
    if ((int)a3 <= 1111970368)
    {
      if (a3 != 826487094)
      {
        if (a3 == 843264310)
        {
          int64_t v4 = [a1 RG16];
          goto LABEL_48;
        }
        goto LABEL_43;
      }
      goto LABEL_36;
    }
    if (a3 == 1111970369)
    {
      int64_t v4 = [a1 BGRA8];
      goto LABEL_48;
    }
    if (a3 != 1278226488)
    {
      int v5 = 1278226534;
LABEL_30:
      if (a3 != v5) {
        goto LABEL_43;
      }
LABEL_35:
      int64_t v4 = [a1 R32f];
      goto LABEL_48;
    }
LABEL_21:
    int64_t v4 = [a1 R8];
    goto LABEL_48;
  }
  if ((int)a3 <= 826486885)
  {
    if (a3 == 32)
    {
      int64_t v4 = [a1 ARGB8];
      goto LABEL_48;
    }
    if (a3 != 826486840) {
      goto LABEL_43;
    }
    goto LABEL_21;
  }
  if (a3 == 826486886) {
    goto LABEL_35;
  }
  if (a3 == 826486888) {
    goto LABEL_34;
  }
LABEL_43:
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_224_10398);
  }
  v6 = (void *)_NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    v8 = v6;
    v9 = NUStringForTypeCode(a3);
    int v10 = 138412290;
    v11 = v9;
    _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Unknown pixel format: '%@'", (uint8_t *)&v10, 0xCu);
  }
  int64_t v4 = 0;
LABEL_48:

  return v4;
}

+ (id)pixelFormatForCIFormat:(int)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (*MEMORY[0x1E4F1E278] == a3)
  {
    v3 = [a1 ARGB8];
  }
  else if (*MEMORY[0x1E4F1E280] == a3)
  {
    v3 = [a1 BGRA8];
  }
  else if (*MEMORY[0x1E4F1E2F0] == a3)
  {
    v3 = [a1 RGBA8];
  }
  else if (*MEMORY[0x1E4F1E2E8] == a3)
  {
    v3 = [a1 RGBA16];
  }
  else if (*MEMORY[0x1E4F1E2F8] == a3)
  {
    v3 = [a1 RGBAf];
  }
  else if (*MEMORY[0x1E4F1E300] == a3)
  {
    v3 = [a1 RGBAh];
  }
  else if (*MEMORY[0x1E4F1E2C8] == a3)
  {
    v3 = [a1 RG16];
  }
  else if (*MEMORY[0x1E4F1E260] == a3)
  {
    v3 = [a1 R16];
  }
  else
  {
    if (*MEMORY[0x1E4F1E288] != a3)
    {
      int v5 = NUAssertLogger_10287();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = [NSString stringWithFormat:@"Unknown format passed to NUPixelFormat -pixelFormatForCIFormat"];
        *(_DWORD *)uint64_t v21 = 138543362;
        *(void *)&v21[4] = v6;
        _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v21, 0xCu);
      }
      specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
      v8 = NUAssertLogger_10287();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v9)
        {
          uint64_t v12 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
          v13 = (void *)MEMORY[0x1E4F29060];
          id v14 = v12;
          id v15 = [v13 callStackSymbols];
          v16 = [v15 componentsJoinedByString:@"\n"];
          *(_DWORD *)uint64_t v21 = 138543618;
          *(void *)&v21[4] = v12;
          __int16 v22 = 2114;
          v23 = v16;
          _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v21, 0x16u);
        }
      }
      else if (v9)
      {
        int v10 = [MEMORY[0x1E4F29060] callStackSymbols];
        v11 = [v10 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v21 = 138543362;
        *(void *)&v21[4] = v11;
        _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v21, 0xCu);
      }
      _NUAssertFailHandler((uint64_t)"+[NUPixelFormat pixelFormatForCIFormat:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUPixelFormat.m", 94, @"Unknown format passed to NUPixelFormat -pixelFormatForCIFormat", v17, v18, v19, v20, *(uint64_t *)v21);
    }
    v3 = [a1 R8];
  }

  return v3;
}

+ (BOOL)supportsRenderingToCompressedFormats
{
  return 1;
}

+ (BOOL)supportsUniversalCompressionFormats
{
  if (supportsUniversalCompressionFormats_onceToken != -1) {
    dispatch_once(&supportsUniversalCompressionFormats_onceToken, &__block_literal_global_10409);
  }
  return supportsUniversalCompressionFormats_supportsUniversalCompressionFormats;
}

void __52__NUPixelFormat_supportsUniversalCompressionFormats__block_invoke()
{
  id v1 = (id)MGCopyAnswer();
  v0 = [v1 objectForKeyedSubscript:@"universal-buffer-compression"];
  supportsUniversalCompressionFormats_supportsUniversalCompressionFormats = [v0 BOOLValue];
}

+ (BOOL)supportsPacked10BitsFormats
{
  return 1;
}

@end