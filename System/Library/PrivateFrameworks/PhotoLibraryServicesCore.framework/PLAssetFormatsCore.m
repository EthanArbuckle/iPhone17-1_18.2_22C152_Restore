@interface PLAssetFormatsCore
+ (BOOL)formatSizeIsShortSide:(int64_t)a3;
+ (CGRect)centeredRectForSourceSize:(CGSize)a3 destinationSize:(CGSize)a4;
+ (CGSize)scaledSizeForSize:(CGSize)a3 format:(int64_t)a4 capLength:(BOOL)a5;
+ (CGSize)sizeForFormat:(int64_t)a3;
+ (int64_t)masterThumbnailFormat;
+ (int64_t)wildcatStackFormat;
@end

@implementation PLAssetFormatsCore

+ (int64_t)masterThumbnailFormat
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__PLAssetFormatsCore_masterThumbnailFormat__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (masterThumbnailFormat_s_onceToken != -1) {
    dispatch_once(&masterThumbnailFormat_s_onceToken, v3);
  }
  return masterThumbnailFormat_s_format;
}

void __43__PLAssetFormatsCore_masterThumbnailFormat__block_invoke(uint64_t a1)
{
  v2 = +[PLFormatChooser defaultFormatChooser];
  v3 = [v2 masterThumbnailFormat];
  unsigned int v4 = [v3 formatID];

  uint64_t v5 = v4;
  if (v4 != 5003)
  {
    if (v4 == 5005)
    {
      uint64_t v5 = 5005;
    }
    else
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 32), *(void *)(a1 + 40), @"PLAssetFormatsCore.m", 174, @"Master thumb format %lu does not map to any DCIM formats", v5);

      uint64_t v5 = 5003;
    }
  }
  masterThumbnailFormat_s_format = v5;
}

+ (int64_t)wildcatStackFormat
{
  if (*(double *)&PLPhysicalScreenScale_screenScale <= 1.0) {
    return 4040;
  }
  else {
    return 4140;
  }
}

+ (BOOL)formatSizeIsShortSide:(int64_t)a3
{
  return a3 == 5003 || a3 == 5005;
}

+ (CGRect)centeredRectForSourceSize:(CGSize)a3 destinationSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = PLScaledSizeWithinSizeCore(a3.width, a3.height, a4.width, a4.height);
  double v8 = v7;
  double v9 = floor((width - v6) * 0.5);
  double v10 = floor((height - v7) * 0.5);
  result.size.double height = v8;
  result.size.double width = v6;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

+ (CGSize)scaledSizeForSize:(CGSize)a3 format:(int64_t)a4 capLength:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  if (objc_msgSend(a1, "formatSizeIsShortSide:"))
  {
    [a1 sizeForFormat:a4];
    if (v10 < v11) {
      double v10 = v11;
    }
    if (v5) {
      uint64_t v12 = 5 * (int)v10;
    }
    else {
      uint64_t v12 = 0x7FFFFFFFLL;
    }
    double v13 = PLScaleDimensionsForThumbnailCore((int)v10, (int)v10, v12, 2, (uint64_t)width, (uint64_t)height);
  }
  else
  {
    +[PLAssetFormatsCore sizeForFormat:a4];
    double v13 = PLScaledSizeWithinSizeCore(width, height, v15, v16);
  }
  result.double height = v14;
  result.double width = v13;
  return result;
}

+ (CGSize)sizeForFormat:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (a3 <= 4039)
  {
    switch(a3)
    {
      case 1095:
        double v4 = 75.0;
        goto LABEL_18;
      case 1096:
        double v4 = 150.0;
        goto LABEL_18;
      case 3039:
        double v4 = 120.0;
        double v3 = 160.0;
        break;
    }
  }
  else if (a3 > 5002)
  {
    if (a3 == 5003)
    {
      double v4 = 256.0;
      goto LABEL_18;
    }
    if (a3 == 5005)
    {
      double v4 = 360.0;
      goto LABEL_18;
    }
  }
  else
  {
    if (a3 == 4040)
    {
      double v4 = 166.0;
      goto LABEL_18;
    }
    if (a3 == 4140)
    {
      double v4 = 332.0;
LABEL_18:
      double v3 = v4;
    }
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

@end