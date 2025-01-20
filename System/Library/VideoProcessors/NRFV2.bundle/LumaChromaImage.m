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
  v28.receiver = self;
  v28.super_class = (Class)LumaChromaImage;
  v13 = [(LumaChromaImage *)&v28 init];
  if (!v13) {
    goto LABEL_7;
  }
  uint64_t MetalLumaFormat = objc_msgSend_getMetalLumaFormat_(LumaChromaImage, v11, (uint64_t)a4, v12);
  uint64_t MetalChromaFormat = objc_msgSend_getMetalChromaFormat_(LumaChromaImage, v15, (uint64_t)a4, v16);
  uint64_t v19 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(v10, v18, (uint64_t)a4, MetalLumaFormat, 7, 0, a5);
  lumaTex = v13->lumaTex;
  v13->lumaTex = (MTLTexture *)v19;

  if (!v13->lumaTex) {
    goto LABEL_7;
  }
  uint64_t v22 = objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(v10, v21, (uint64_t)a4, MetalChromaFormat, 7, 1, a6);
  chromaTex = v13->chromaTex;
  v13->chromaTex = (MTLTexture *)v22;

  if (v13->chromaTex)
  {
    v13->pixelBuffer = a4;
  }
  else
  {
LABEL_7:
    FigDebugAssert3();
    int v27 = FigSignalErrorAt();
    v24 = 0;
    if (v27) {
      goto LABEL_6;
    }
  }
  v24 = v13;
LABEL_6:
  v25 = v24;

  return v25;
}

+ (int)bindYCbCrMetalTextureWithMetalContext:(id)a3 pixelBuffer:(__CVBuffer *)a4 pixelFormat:(unint64_t)a5 textureToBind:(id *)a6 alignmentFactor:(unint64_t)a7
{
  id v11 = a3;
  if (a5 && CVPixelBufferGetIOSurface(a4) && !IOSurfaceGetBulkAttachments())
  {
    IOSurfaceSetBulkAttachments2();
    objc_msgSend_bindPixelBufferToMTL2DTexture_pixelFormat_usage_plane_alignmentFactor_(v11, v12, (uint64_t)a4, a5, 1, 0, a7);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      IOSurfaceSetBulkAttachments2();
      if (a6)
      {
        id v13 = v13;
        int v14 = 0;
        *a6 = v13;
      }
      else
      {
        int v14 = 0;
      }
    }
    else
    {
      FigDebugAssert3();
      int v14 = FigSignalErrorAt();
    }
  }
  else
  {
    FigDebugAssert3();
    int v14 = FigSignalErrorAt();
    id v13 = 0;
  }

  return v14;
}

- (int)bindYCbCrTexture:(id)a3 alignmentFactor:(unint64_t)a4
{
  id v8 = a3;
  pixelBuffer = self->pixelBuffer;
  if (pixelBuffer)
  {
    uint64_t MetalYCbCrFormat = objc_msgSend_getMetalYCbCrFormat_(LumaChromaImage, v6, (uint64_t)pixelBuffer, v7);
    id v11 = self->pixelBuffer;
    id v17 = 0;
    int v13 = objc_msgSend_bindYCbCrMetalTextureWithMetalContext_pixelBuffer_pixelFormat_textureToBind_alignmentFactor_(LumaChromaImage, v12, (uint64_t)v8, (uint64_t)v11, MetalYCbCrFormat, &v17, a4);
    id v14 = v17;
    id v15 = v17;
    if (v13)
    {
      FigDebugAssert3();
    }
    else
    {
      objc_storeStrong((id *)&self->yCbCrTex, v14);
      if (self->yCbCrTex)
      {
        int v13 = 0;
      }
      else
      {
        FigDebugAssert3();
        int v13 = FigSignalErrorAt();
      }
    }
  }
  else
  {
    FigDebugAssert3();
    int v13 = FigSignalErrorAt();
    id v15 = 0;
  }

  return v13;
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
  if (PixelFormatType > 796419631)
  {
    if (PixelFormatType > 1885745711)
    {
      if (PixelFormatType <= 2084070959)
      {
        if (PixelFormatType != 1885745712)
        {
          if (PixelFormatType == 2019963440) {
            return 576;
          }
          return 0;
        }
        return 588;
      }
      if (PixelFormatType != 2084070960 && PixelFormatType != 2084075056)
      {
        int v4 = 2088265264;
        goto LABEL_17;
      }
      return 10;
    }
    if (PixelFormatType > 875704437)
    {
      if (PixelFormatType != 875704438)
      {
        if (PixelFormatType == 1751527984) {
          return 25;
        }
        return 0;
      }
      return 10;
    }
    if (PixelFormatType == 796419632) {
      return 588;
    }
    int v5 = 875704422;
LABEL_30:
    if (PixelFormatType != v5) {
      return 0;
    }
    return 10;
  }
  if (PixelFormatType <= 758674991)
  {
    if (PixelFormatType > 645424687)
    {
      if (PixelFormatType == 645424688) {
        return 588;
      }
      int v5 = 758670896;
    }
    else
    {
      if (PixelFormatType == 641230384) {
        return 10;
      }
      int v5 = 641234480;
    }
    goto LABEL_30;
  }
  if (PixelFormatType > 792225327)
  {
    if (PixelFormatType == 792225328) {
      return 10;
    }
    int v5 = 792229424;
    goto LABEL_30;
  }
  if (PixelFormatType != 758674992)
  {
    int v4 = 762865200;
LABEL_17:
    if (PixelFormatType != v4) {
      return 0;
    }
    return 588;
  }
  return 10;
}

+ (unint64_t)getMetalChromaFormat:(__CVBuffer *)a3
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (PixelFormatType > 796419631)
  {
    if (PixelFormatType > 1885745711)
    {
      if (PixelFormatType <= 2084070959)
      {
        if (PixelFormatType != 1885745712)
        {
          if (PixelFormatType == 2019963440) {
            return 578;
          }
          return 0;
        }
        return 589;
      }
      if (PixelFormatType != 2084070960 && PixelFormatType != 2084075056)
      {
        int v4 = 2088265264;
        goto LABEL_17;
      }
      return 30;
    }
    if (PixelFormatType > 875704437)
    {
      if (PixelFormatType != 875704438)
      {
        if (PixelFormatType == 1751527984) {
          return 65;
        }
        return 0;
      }
      return 30;
    }
    if (PixelFormatType == 796419632) {
      return 589;
    }
    int v5 = 875704422;
LABEL_30:
    if (PixelFormatType != v5) {
      return 0;
    }
    return 30;
  }
  if (PixelFormatType <= 758674991)
  {
    if (PixelFormatType > 645424687)
    {
      if (PixelFormatType == 645424688) {
        return 589;
      }
      int v5 = 758670896;
    }
    else
    {
      if (PixelFormatType == 641230384) {
        return 30;
      }
      int v5 = 641234480;
    }
    goto LABEL_30;
  }
  if (PixelFormatType > 792225327)
  {
    if (PixelFormatType == 792225328) {
      return 30;
    }
    int v5 = 792229424;
    goto LABEL_30;
  }
  if (PixelFormatType != 758674992)
  {
    int v4 = 762865200;
LABEL_17:
    if (PixelFormatType != v4) {
      return 0;
    }
    return 589;
  }
  return 30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->yCbCrTex, 0);
  objc_storeStrong((id *)&self->chromaTex, 0);

  objc_storeStrong((id *)&self->lumaTex, 0);
}

@end