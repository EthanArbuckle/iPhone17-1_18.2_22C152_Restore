@interface LumaChromaImage
+ (int)bindYCbCrMetalTextureWithMetalContext:(id)a3 pixelBuffer:(__CVBuffer *)a4 pixelFormat:(unint64_t)a5 textureToBind:(id *)a6 alignmentFactor:(unint64_t)a7;
+ (unint64_t)getMetalChromaFormat:(__CVBuffer *)a3;
+ (unint64_t)getMetalLumaFormat:(__CVBuffer *)a3;
+ (unint64_t)getMetalYCbCrFormat:(__CVBuffer *)a3;
- (LumaChromaImage)initWithContext:(id)a3 pixelBuffer:(__CVBuffer *)a4 lumaAlignmentFactor:(unint64_t)a5 chromaAlignmentFactor:(unint64_t)a6;
- (int)bindYCbCrTexture:(id)a3 alignmentFactor:(unint64_t)a4;
@end

@implementation LumaChromaImage

- (LumaChromaImage)initWithContext:(id)a3 pixelBuffer:(__CVBuffer *)a4 lumaAlignmentFactor:(unint64_t)a5 chromaAlignmentFactor:(unint64_t)a6
{
  id v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)LumaChromaImage;
  v11 = [(LumaChromaImage *)&v22 init];
  if (!v11) {
    goto LABEL_7;
  }
  unint64_t v12 = +[LumaChromaImage getMetalLumaFormat:a4];
  unint64_t v13 = +[LumaChromaImage getMetalChromaFormat:a4];
  uint64_t v14 = [v10 bindPixelBufferToMTL2DTexture:a4 pixelFormat:v12 usage:7 plane:0 alignmentFactor:a5];
  lumaTex = v11->lumaTex;
  v11->lumaTex = (MTLTexture *)v14;

  if (!v11->lumaTex) {
    goto LABEL_7;
  }
  uint64_t v16 = [v10 bindPixelBufferToMTL2DTexture:a4 pixelFormat:v13 usage:7 plane:1 alignmentFactor:a6];
  chromaTex = v11->chromaTex;
  v11->chromaTex = (MTLTexture *)v16;

  if (v11->chromaTex)
  {
    v11->pixelBuffer = a4;
  }
  else
  {
LABEL_7:
    FigDebugAssert3();
    int v21 = FigSignalErrorAt();
    v18 = 0;
    if (v21) {
      goto LABEL_6;
    }
  }
  v18 = v11;
LABEL_6:
  v19 = v18;

  return v19;
}

+ (int)bindYCbCrMetalTextureWithMetalContext:(id)a3 pixelBuffer:(__CVBuffer *)a4 pixelFormat:(unint64_t)a5 textureToBind:(id *)a6 alignmentFactor:(unint64_t)a7
{
  id v11 = a3;
  if (a5 && CVPixelBufferGetIOSurface(a4) && !IOSurfaceGetBulkAttachments())
  {
    IOSurfaceSetBulkAttachments2();
    unint64_t v12 = [v11 bindPixelBufferToMTL2DTexture:a4 pixelFormat:a5 usage:1 plane:0 alignmentFactor:a7];
    if (v12)
    {
      IOSurfaceSetBulkAttachments2();
      if (a6)
      {
        objc_storeStrong(a6, v12);
        LODWORD(a6) = 0;
      }
    }
    else
    {
      FigDebugAssert3();
      LODWORD(a6) = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    LODWORD(a6) = FigSignalErrorAt();
    unint64_t v12 = 0;
  }

  return (int)a6;
}

- (int)bindYCbCrTexture:(id)a3 alignmentFactor:(unint64_t)a4
{
  id v6 = a3;
  id obj = 0;
  if (!self->pixelBuffer) {
    goto LABEL_8;
  }
  int v7 = +[LumaChromaImage bindYCbCrMetalTextureWithMetalContext:pixelBuffer:pixelFormat:textureToBind:alignmentFactor:](LumaChromaImage, "bindYCbCrMetalTextureWithMetalContext:pixelBuffer:pixelFormat:textureToBind:alignmentFactor:", v6, self->pixelBuffer, +[LumaChromaImage getMetalYCbCrFormat:](LumaChromaImage, "getMetalYCbCrFormat:"), &obj, a4);
  if (v7)
  {
    int v8 = v7;
    FigDebugAssert3();
    goto LABEL_5;
  }
  objc_storeStrong((id *)&self->yCbCrTex, obj);
  if (!self->yCbCrTex)
  {
LABEL_8:
    FigDebugAssert3();
    int v8 = FigSignalErrorAt();
    goto LABEL_5;
  }
  int v8 = 0;
LABEL_5:

  return v8;
}

+ (unint64_t)getMetalYCbCrFormat:(__CVBuffer *)a3
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType > 1885745711)
  {
    if (PixelFormatType == 2088265264) {
      return 594;
    }
    if (PixelFormatType == 2019963440) {
      return 591;
    }
    int v4 = 1885745712;
  }
  else
  {
    if (PixelFormatType == 645424688 || PixelFormatType == 762865200) {
      return 594;
    }
    int v4 = 796419632;
  }
  if (PixelFormatType != v4) {
    return 0;
  }
  return 594;
}

+ (unint64_t)getMetalLumaFormat:(__CVBuffer *)a3
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType <= 795371055)
  {
    if (PixelFormatType > 758674991)
    {
      if (PixelFormatType <= 762865199)
      {
        if (PixelFormatType == 758674992) {
          return 10;
        }
        int v5 = 761816624;
LABEL_33:
        if (PixelFormatType != v5) {
          return 0;
        }
        return 25;
      }
      if (PixelFormatType == 762865200) {
        return 588;
      }
      if (PixelFormatType == 792225328) {
        return 10;
      }
      int v4 = 792229424;
    }
    else if (PixelFormatType <= 644376111)
    {
      if (PixelFormatType == 641230384) {
        return 10;
      }
      int v4 = 641234480;
    }
    else
    {
      if (PixelFormatType == 644376112) {
        return 25;
      }
      if (PixelFormatType == 645424688) {
        return 588;
      }
      int v4 = 758670896;
    }
LABEL_29:
    if (PixelFormatType == v4) {
      return 10;
    }
    return 0;
  }
  if (PixelFormatType > 1885745711)
  {
    if (PixelFormatType <= 2084075055)
    {
      if (PixelFormatType != 1885745712)
      {
        if (PixelFormatType == 2019963440) {
          return 576;
        }
        int v4 = 2084070960;
        goto LABEL_29;
      }
      return 588;
    }
    if (PixelFormatType != 2084075056)
    {
      if (PixelFormatType != 2087216688)
      {
        int v6 = 2088265264;
        goto LABEL_25;
      }
      return 25;
    }
    return 10;
  }
  if (PixelFormatType > 875704421)
  {
    if (PixelFormatType == 875704422 || PixelFormatType == 875704438) {
      return 10;
    }
    int v5 = 1751527984;
    goto LABEL_33;
  }
  if (PixelFormatType != 795371056)
  {
    int v6 = 796419632;
LABEL_25:
    if (PixelFormatType == v6) {
      return 588;
    }
    return 0;
  }
  return 25;
}

+ (unint64_t)getMetalChromaFormat:(__CVBuffer *)a3
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType <= 795371055)
  {
    if (PixelFormatType > 758674991)
    {
      if (PixelFormatType <= 762865199)
      {
        if (PixelFormatType == 758674992) {
          return 30;
        }
        int v5 = 761816624;
LABEL_33:
        if (PixelFormatType != v5) {
          return 0;
        }
        return 65;
      }
      if (PixelFormatType == 762865200) {
        return 589;
      }
      if (PixelFormatType == 792225328) {
        return 30;
      }
      int v4 = 792229424;
    }
    else if (PixelFormatType <= 644376111)
    {
      if (PixelFormatType == 641230384) {
        return 30;
      }
      int v4 = 641234480;
    }
    else
    {
      if (PixelFormatType == 644376112) {
        return 65;
      }
      if (PixelFormatType == 645424688) {
        return 589;
      }
      int v4 = 758670896;
    }
LABEL_29:
    if (PixelFormatType == v4) {
      return 30;
    }
    return 0;
  }
  if (PixelFormatType > 1885745711)
  {
    if (PixelFormatType <= 2084075055)
    {
      if (PixelFormatType != 1885745712)
      {
        if (PixelFormatType == 2019963440) {
          return 578;
        }
        int v4 = 2084070960;
        goto LABEL_29;
      }
      return 589;
    }
    if (PixelFormatType != 2084075056)
    {
      if (PixelFormatType != 2087216688)
      {
        int v6 = 2088265264;
        goto LABEL_25;
      }
      return 65;
    }
    return 30;
  }
  if (PixelFormatType > 875704421)
  {
    if (PixelFormatType == 875704422 || PixelFormatType == 875704438) {
      return 30;
    }
    int v5 = 1751527984;
    goto LABEL_33;
  }
  if (PixelFormatType != 795371056)
  {
    int v6 = 796419632;
LABEL_25:
    if (PixelFormatType == v6) {
      return 589;
    }
    return 0;
  }
  return 65;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->yCbCrTex, 0);
  objc_storeStrong((id *)&self->chromaTex, 0);

  objc_storeStrong((id *)&self->lumaTex, 0);
}

@end