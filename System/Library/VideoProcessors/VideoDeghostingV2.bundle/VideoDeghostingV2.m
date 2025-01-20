unint64_t sub_39EC(float *a1, float *a2)
{
  return (__PAIR64__(*a1 > *a2, *a1) - COERCE_UNSIGNED_INT(*a2)) >> 32;
}

uint64_t sub_5EF4(void *a1, void *a2, float a3)
{
  id v5 = a1;
  id v6 = a2;
  [v6 dist2ghost];
  float v8 = v7;
  [v5 dist2ghost];
  if (v8 > (float)(v9 + a3)) {
    goto LABEL_7;
  }
  [v6 dist2ghost];
  if (v10 != INFINITY)
  {
    [v6 dist2ghost];
    float v12 = v11;
    [v5 dist2ghost];
    if (vabds_f32(v12, v13) > a3) {
      goto LABEL_8;
    }
  }
  [v6 area];
  float v15 = v14;
  [v5 area];
  if (v15 < (float)(v16 + -256.0)
    || ([v6 area], float v18 = v17, objc_msgSend(v5, "area"), vabds_f32(v18, v19) <= 256.0)
    && ([v6 dist2opticalCenter], float v21 = v20, objc_msgSend(v5, "dist2opticalCenter"), v21 > v22))
  {
LABEL_7:
    uint64_t v23 = 1;
  }
  else
  {
LABEL_8:
    uint64_t v23 = 0;
  }

  return v23;
}

void sub_AD38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EDE0(uint64_t a1)
{
  v2 = *(void **)(a1 + 104);
}

id sub_EE7C(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    v2 = [[RawMetaDataReader alloc] initWithMetaBuffer:v1];

    v3 = [(RawMetaDataReader *)v2 readMetaDataInfoFromSimulation:0];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id sub_EF00(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v9 = a1;
  if (v9)
  {
    if (+[RawMetaDataReader isOpticalCenterKeyV2Present:v9])
    {
      +[RawMetaDataReader readMetaDataFromDictionary:v9 andValidWidth:a2 andValidHeight:a3 andLightSource:a4 andKeyPoints:a5];
    }
    else
    {
      sub_EE7C(v9);
    float v10 = };
  }
  else
  {
    float v10 = 0;
  }

  return v10;
}

id sub_EFB0(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = v2;
  if (v2)
  {
    [v2 setObject:&off_3D358 forKeyedSubscript:@"LightMode"];
    [v3 setObject:&off_3D370 forKeyedSubscript:@"HomographyType"];
    [v3 setObject:&off_3D388 forKeyedSubscript:@"RepairFrameDelay"];
    if (v1) {
      [v3 setObject:v1 forKeyedSubscript:@"TuningParameters"];
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v3;
}

id sub_F0E8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = v4;
  if (v4)
  {
    [v4 setObject:&off_3D358 forKeyedSubscript:@"LightMode"];
    [v5 setObject:&off_3D370 forKeyedSubscript:@"HomographyType"];
    id v6 = +[NSNumber numberWithBool:a1];
    [v5 setObject:v6 forKeyedSubscript:@"DrawBoundingBox"];

    if (v3) {
      [v5 setObject:v3 forKeyedSubscript:@"TuningParameters"];
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }

  return v5;
}

CVImageBufferRef sub_F23C(const void *a1)
{
  id v1 = (opaqueCMSampleBuffer *)sub_F2FC(a1, kFigCaptureSampleBufferAttachedMediaKey_LightSourceMask);
  if (v1)
  {
    return CMSampleBufferGetImageBuffer(v1);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

void *sub_F2FC(const void *a1, void *a2)
{
  id v3 = a2;
  id v4 = CMGetAttachment(a1, kFigSampleBufferAttachmentKey_AttachedMedia, 0);
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 objectForKeyedSubscript:v3];

    if (!v6)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    id v6 = 0;
  }

  return v6;
}

CFTypeRef sub_F44C(const void *a1)
{
  id v1 = (opaqueCMSampleBuffer *)sub_F2FC(a1, kFigCaptureSampleBufferAttachedMediaKey_KeypointDescriptorData);
  if (v1 && (CMBlockBufferRef DataBuffer = CMSampleBufferGetDataBuffer(v1)) != 0)
  {
    CFTypeRef v3 = CMGetAttachment(DataBuffer, kCMBlockBufferAttachmentKey_CVDataBuffer, 0);
    if (v3)
    {
      IOSurface = (__IOSurface *)CVDataBufferGetIOSurface();
      IOSurfaceLock(IOSurface, 0, 0);
      BaseAddress = (char *)IOSurfaceGetBaseAddress(IOSurface);
      if (*(_DWORD *)BaseAddress == 1000)
      {
        uint64_t v6 = *((void *)BaseAddress + 2);
        uint64_t v7 = *((void *)BaseAddress + 3);
        *(_DWORD *)BaseAddress = 1;
        *(_OWORD *)(BaseAddress + 4) = 0uLL;
        *(void *)(BaseAddress + 20) = v6;
        *((_DWORD *)BaseAddress + 7) = 0;
        *((void *)BaseAddress + 4) = v7;
        *(_OWORD *)(BaseAddress + 40) = 0uLL;
      }
      IOSurfaceUnlock(IOSurface, 0, 0);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v3;
}

uint64_t sub_F674(__CVBuffer **a1, CMSampleBufferRef sbuf)
{
  if (a1)
  {
    if (sbuf && (CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(sbuf)) != 0)
    {
      id v5 = ImageBuffer;
      uint64_t v6 = CMGetAttachment(sbuf, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
      if (v6)
      {
        uint64_t v7 = (void *)v6;
        float v8 = sub_F2FC(sbuf, kFigCaptureSampleBufferAttachedMediaKey_LightSourceMask);
        id v9 = sub_F2FC(sbuf, kFigCaptureSampleBufferAttachedMediaKey_KeypointDescriptorData);
        size_t Width = CVPixelBufferGetWidth(v5);
        size_t Height = CVPixelBufferGetHeight(v5);
        uint64_t v12 = sub_EF00(v7, Width, Height, (uint64_t)v8, (uint64_t)v9);
        float v13 = a1[1];
        a1[1] = (__CVBuffer *)v12;

        *a1 = v5;
        return 0;
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return 4294954513;
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 4294954516;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 2;
  }
}

uint64_t sub_F900(uint64_t a1, uint64_t *a2, int a3)
{
  id obj = 0;
  if (!a1 || (*(_DWORD *)(a1 + 12) = 0, !a2) || (int v5 = *(_DWORD *)(a1 + 8), v5 >= 3))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v13 = 2;
    goto LABEL_21;
  }
  if (*((_DWORD *)a2 + 3) - 1 < v5) {
    int v5 = *((_DWORD *)a2 + 3) - 1;
  }
  if (v5 < 1)
  {
LABEL_20:
    uint64_t v13 = 0;
    goto LABEL_21;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 16 * v5;
  while (1)
  {
    uint64_t v10 = *a2;
    uint64_t v11 = *a2 + v7;
    uint64_t v12 = *(opaqueCMSampleBuffer **)(v11 + 24);
    if (!v12)
    {
      fig_log_get_emitter();
      goto LABEL_25;
    }
    if (!a3) {
      break;
    }
    uint64_t v13 = sub_F674(&v20, v12);
    if (v13)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_21;
    }
    CVImageBufferRef ImageBuffer = v20;
LABEL_17:
    uint64_t v17 = *(void *)a1 + v8;
    *(void *)uint64_t v17 = ImageBuffer;
    objc_storeStrong((id *)(v17 + 8), obj);
    ++*(_DWORD *)(a1 + 12);
    v8 += 16;
    v7 += 24;
    if (v9 == v8) {
      goto LABEL_20;
    }
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(*(CMSampleBufferRef *)(v11 + 24));
  if (ImageBuffer)
  {
    CFDictionaryRef v15 = *(const __CFDictionary **)(v10 + v7 + 32);
    if (v15)
    {
      if (*(unsigned char *)(v10 + v7 + 40))
      {
        CFDictionaryGetValue(v15, @"MetaData");
        CFDictionaryRef v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        CFDictionaryRef v15 = 0;
      }
    }
    id v16 = obj;
    id obj = v15;

    float v20 = ImageBuffer;
    if (!obj) {
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  fig_log_get_emitter();
  FigDebugAssert3();
  id v19 = obj;
  id obj = 0;

  float v20 = 0;
  fig_log_get_emitter();
LABEL_25:
  FigDebugAssert3();
  uint64_t v13 = 4294954516;
LABEL_21:

  return v13;
}

void sub_FC8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t sub_FCA8(uint64_t a1, int a2)
{
  if (a1)
  {
    id v4 = *(void **)a1;
    if (v4)
    {
      *(void *)a1 = 0;
      free(v4);
    }
    *(void *)(a1 + 8) = 0;
    int v5 = malloc_type_calloc(a2, 0x10uLL, 0xA0040AFF93C70uLL);
    *(void *)a1 = v5;
    if (v5)
    {
      uint64_t result = 0;
      *(_DWORD *)(a1 + 8) = a2;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 4294954510;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 2;
  }
  return result;
}

void sub_FDF4(char **a1)
{
  if (a1)
  {
    int v2 = *((_DWORD *)a1 + 2);
    CFTypeRef v3 = *a1;
    if (v2 < 1)
    {
      if (!v3)
      {
LABEL_8:
        a1[1] = 0;
        return;
      }
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      do
      {
        uint64_t v6 = *(void **)&v3[v4 + 8];
        *(void *)&v3[v4 + 8] = 0;

        CFTypeRef v3 = *a1;
        *(void *)&(*a1)[v4] = 0;
        ++v5;
        v4 += 16;
      }
      while (v5 < *((int *)a1 + 2));
    }
    *a1 = 0;
    free(v3);
    goto LABEL_8;
  }
}

id sub_FE7C(__CVBuffer *a1, void *a2, unsigned int a3)
{
  return sub_FE84(a1, a2, a3, 1);
}

id sub_FE84(__CVBuffer *a1, void *a2, unsigned int a3, int a4)
{
  id v7 = a2;
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  uint64_t v9 = 0;
  if (PixelFormatType > 1278226533)
  {
    if (PixelFormatType <= 1380401728)
    {
      switch(PixelFormatType)
      {
        case 1278226534:
          uint64_t v10 = 55;
          break;
        case 1278226536:
          uint64_t v10 = 25;
          break;
        case 1278226742:
          uint64_t v10 = 20;
          break;
        default:
          goto LABEL_36;
      }
      goto LABEL_35;
    }
    if (PixelFormatType != 1380401729)
    {
      if (PixelFormatType == 2016686640 || PixelFormatType == 2019963440)
      {
        BOOL v14 = a4 == 0;
        uint64_t v15 = 23;
        if (a4) {
          uint64_t v15 = 20;
        }
        uint64_t v16 = 63;
        uint64_t v17 = 60;
LABEL_23:
        if (!v14) {
          uint64_t v16 = v17;
        }
        if (a3) {
          uint64_t v10 = v16;
        }
        else {
          uint64_t v10 = v15;
        }
        goto LABEL_35;
      }
      goto LABEL_36;
    }
    BOOL v11 = a4 == 0;
    uint64_t v12 = 73;
    uint64_t v13 = 70;
LABEL_32:
    if (v11) {
      uint64_t v10 = v12;
    }
    else {
      uint64_t v10 = v13;
    }
LABEL_35:
    uint64_t v9 = [v7 bindPixelBufferToMTL2DTexture:a1 pixelFormat:v10 usage:7 plane:a3];
    goto LABEL_36;
  }
  if (PixelFormatType > 1111970368)
  {
    if (PixelFormatType == 1111970369)
    {
      BOOL v11 = a4 == 0;
      uint64_t v12 = 73;
      uint64_t v13 = 80;
    }
    else
    {
      if (PixelFormatType != 1278226481 && PixelFormatType != 1278226488) {
        goto LABEL_36;
      }
      BOOL v11 = a4 == 0;
      uint64_t v12 = 13;
      uint64_t v13 = 10;
    }
    goto LABEL_32;
  }
  if (PixelFormatType == 875704422 || PixelFormatType == 875704438)
  {
    BOOL v14 = a4 == 0;
    uint64_t v15 = 13;
    if (a4) {
      uint64_t v15 = 10;
    }
    uint64_t v16 = 33;
    uint64_t v17 = 30;
    goto LABEL_23;
  }
LABEL_36:

  return v9;
}

__CVBuffer *sub_10070(__CVBuffer *a1)
{
  size_t Width = CVPixelBufferGetWidth(a1);
  size_t Height = CVPixelBufferGetHeight(a1);
  PixelBuffer = (__CVBuffer *)CreatePixelBuffer();
  if (PixelBuffer)
  {
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
    size_t v6 = CVPixelBufferGetBytesPerRow(PixelBuffer);
    CVPixelBufferLockBaseAddress(a1, 1uLL);
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
    CVPixelBufferLockBaseAddress(PixelBuffer, 0);
    uint64_t v8 = CVPixelBufferGetBaseAddress(PixelBuffer);
    if (Height)
    {
      for (uint64_t i = 0; i != Height; ++i)
      {
        size_t v10 = Width;
        BOOL v11 = BaseAddress;
        for (j = v8; v10; --v10)
        {
          char v13 = *v11++;
          *j++ = v13;
        }
        v8 += v6;
        BaseAddress += BytesPerRow;
      }
    }
    CVPixelBufferUnlockBaseAddress(PixelBuffer, 0);
    CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return PixelBuffer;
}

uint64_t sub_101E4(__CVBuffer *a1, int a2)
{
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  uint64_t result = 0;
  if (PixelFormatType <= 796423729)
  {
    if (PixelFormatType > 762865199)
    {
      if (PixelFormatType > 792225327)
      {
        if (PixelFormatType > 796419631)
        {
          if (PixelFormatType != 796419632)
          {
            if (PixelFormatType != 796419634)
            {
              int v5 = 796423728;
              goto LABEL_38;
            }
LABEL_51:
            BOOL v12 = a2 == 0;
            uint64_t v13 = 547;
            uint64_t v14 = 529;
            goto LABEL_59;
          }
          goto LABEL_52;
        }
        if (PixelFormatType == 792225328) {
          goto LABEL_58;
        }
        int v7 = 792229424;
        goto LABEL_57;
      }
      if (PixelFormatType > 762869295)
      {
        if (PixelFormatType == 762869296) {
          goto LABEL_52;
        }
        unsigned __int16 v8 = 30258;
      }
      else
      {
        if (PixelFormatType == 762865200) {
          goto LABEL_52;
        }
        unsigned __int16 v8 = 26162;
      }
      int v6 = v8 | 0x2D780000;
LABEL_50:
      if (PixelFormatType != v6) {
        return result;
      }
      goto LABEL_51;
    }
    if (PixelFormatType <= 645428783)
    {
      if (PixelFormatType <= 645424687)
      {
        if (PixelFormatType != 641230384)
        {
          int v7 = 641234480;
          goto LABEL_57;
        }
LABEL_58:
        BOOL v12 = a2 == 0;
        uint64_t v13 = 540;
        uint64_t v14 = 520;
        goto LABEL_59;
      }
      if (PixelFormatType == 645424688) {
        goto LABEL_52;
      }
      unsigned __int16 v10 = 26162;
LABEL_42:
      int v6 = v10 | 0x26780000;
      goto LABEL_50;
    }
    if (PixelFormatType <= 758670895)
    {
      if (PixelFormatType == 645428784) {
        goto LABEL_52;
      }
      unsigned __int16 v10 = 30258;
      goto LABEL_42;
    }
    if (PixelFormatType == 758670896) {
      goto LABEL_58;
    }
    int v7 = 758674992;
LABEL_57:
    if (PixelFormatType != v7) {
      return result;
    }
    goto LABEL_58;
  }
  if (PixelFormatType > 2016686641)
  {
    if (PixelFormatType > 2084075055)
    {
      if (PixelFormatType <= 2088265265)
      {
        if (PixelFormatType != 2084075056)
        {
          int v5 = 2088265264;
LABEL_38:
          if (PixelFormatType != v5) {
            return result;
          }
          goto LABEL_52;
        }
        goto LABEL_58;
      }
      if (PixelFormatType == 2088265266) {
        goto LABEL_51;
      }
      if (PixelFormatType == 2088269360)
      {
LABEL_52:
        BOOL v12 = a2 == 0;
        uint64_t v13 = 546;
        uint64_t v14 = 528;
        goto LABEL_59;
      }
      int v6 = 2088269362;
      goto LABEL_50;
    }
    if (PixelFormatType > 2019963441)
    {
      if (PixelFormatType != 2019963442)
      {
        int v7 = 2084070960;
        goto LABEL_57;
      }
    }
    else if (PixelFormatType != 2016686642)
    {
      int v9 = 2019963440;
LABEL_65:
      if (PixelFormatType != v9) {
        return result;
      }
      BOOL v12 = a2 == 0;
      uint64_t v13 = 543;
      uint64_t v14 = 525;
      goto LABEL_59;
    }
    BOOL v12 = a2 == 0;
    uint64_t v13 = 544;
    uint64_t v14 = 526;
LABEL_59:
    if (v12) {
      return v13;
    }
    else {
      return v14;
    }
  }
  if (PixelFormatType > 1882468913)
  {
    if (PixelFormatType > 1885745713)
    {
      if (PixelFormatType != 1885745714)
      {
        int v9 = 2016686640;
        goto LABEL_65;
      }
    }
    else if (PixelFormatType != 1882468914)
    {
      int v11 = 1885745712;
      goto LABEL_45;
    }
    return 547;
  }
  if (PixelFormatType <= 875704437)
  {
    if (PixelFormatType == 796423730) {
      goto LABEL_51;
    }
    int v7 = 875704422;
    goto LABEL_57;
  }
  if (PixelFormatType == 875704438) {
    goto LABEL_58;
  }
  int v11 = 1882468912;
LABEL_45:
  if (PixelFormatType == v11) {
    return 546;
  }
  return result;
}

id sub_10550(__CVBuffer *a1, void *a2, int a3, int a4)
{
  id v7 = a2;
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a1);
  if (!IOSurface) {
    goto LABEL_10;
  }
  int v9 = IOSurface;
  int v26 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  uint64_t v10 = sub_101E4(a1, a3);
  if (v10)
  {
    uint64_t v11 = v10;
    size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(v9, 0);
    size_t HeightOfPlane = IOSurfaceGetHeightOfPlane(v9, 0);
    Elementsize_t Width = IOSurfaceGetElementWidth(v9);
    Elementsize_t Height = IOSurfaceGetElementHeight(v9);
    sub_1077C((uint64_t)v9, (uint64_t)&v19, 1);
    if (a4) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 7;
    }
    uint64_t v17 = [v7 bindIOSurfaceToMTL2DTexture:v9 pixelFormat:v11 usage:v16 width:WidthOfPlane / ElementWidth height:HeightOfPlane / ElementHeight plane:0];
    long long v31 = v23;
    long long v32 = v24;
    long long v33 = v25;
    int v34 = v26;
    long long v27 = v19;
    long long v28 = v20;
    long long v29 = v21;
    long long v30 = v22;
    IOSurfaceSetBulkAttachments2();
  }
  else
  {
LABEL_10:
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t sub_1077C(uint64_t a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a3) {
      IOSurfaceGetBulkAttachments();
    }
    return IOSurfaceSetBulkAttachments2();
  }
  else
  {
    fig_log_get_emitter();
    return FigDebugAssert3();
  }
}

__CVBuffer *sub_108B0(__CVBuffer *a1, __CVMetalTextureCache *a2, void *a3, int a4, int a5)
{
  id v9 = a3;
  CVMetalTextureRef image = 0;
  int v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = 0u;
  if (!a1)
  {
    CFDictionaryRef v18 = 0;
    goto LABEL_12;
  }
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(a1);
  if (IOSurface && (uint64_t v11 = (uint64_t)IOSurface, (v12 = sub_101E4(a1, a4)) != 0))
  {
    MTLPixelFormat v13 = v12;
    sub_1077C(v11, (uint64_t)&v20, 1);
    unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, 0);
    unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, 0);
    if (a5) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 2;
    }
    CFStringRef v37 = kCVMetalTextureUsage;
    uint64_t v17 = +[NSNumber numberWithUnsignedInteger:v16];
    v38 = v17;
    CFDictionaryRef v18 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];

    if (!CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, a2, a1, v18, v13, WidthOfPlane, HeightOfPlane, 0, &image))
    {
      CVMetalTextureGetTexture(image);
      a1 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
      if (a1)
      {
        long long v33 = v24;
        long long v34 = v25;
        long long v35 = v26;
        int v36 = v27;
        long long v29 = v20;
        long long v30 = v21;
        long long v31 = v22;
        long long v32 = v23;
        IOSurfaceSetBulkAttachments2();
      }
      goto LABEL_10;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    CFDictionaryRef v18 = 0;
  }
  a1 = 0;
LABEL_10:
  if (image) {
    CFRelease(image);
  }
LABEL_12:

  return a1;
}

FILE *sub_12D30(const char *a1)
{
  int v2 = +[NSString stringWithFormat:@"%s", a1];
  CFTypeRef v3 = [v2 stringByDeletingLastPathComponent];
  uint64_t v4 = +[NSFileManager defaultManager];
  id v10 = 0;
  unsigned __int8 v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v10];
  id v6 = v10;
  id v7 = v6;
  if (v5)
  {
    unsigned __int16 v8 = fopen(a1, "wb");
  }
  else
  {
    NSLog(@"Failed to create directory \"%@\". Error: %@", v3, v6);
    unsigned __int16 v8 = 0;
  }

  return v8;
}

FILE *sub_132BC(unsigned int a1, int a2, unsigned int a3, unsigned char *a4, const char *a5)
{
  uint64_t result = sub_12D30(a5);
  if (result)
  {
    id v10 = result;
    uint64_t v11 = malloc_type_malloc(3 * a1, 0x208AAB68uLL);
    if (v11)
    {
      uint64_t v12 = v11;
      fprintf(v10, "P6 %u %u 255\n", a1, a2);
      if (a2)
      {
        int v13 = 0;
        do
        {
          unsigned int v14 = a1;
          uint64_t v15 = v12;
          for (uint64_t i = a4; v14; --v14)
          {
            *uint64_t v15 = *i;
            v15[1] = i[1];
            v15[2] = i[2];
            i += 4;
            v15 += 3;
          }
          fwrite(v12, 3uLL, a1, v10);
          a4 += a3;
          ++v13;
        }
        while (v13 != a2);
      }
      free(v12);
    }
    return (FILE *)fclose(v10);
  }
  return result;
}

uint64_t sub_17640(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 != 1)
  {
    if (a1 == 2)
    {
      a1 = 0;
    }
    else
    {
      unsigned __int8 v5 = [v3 objectForKeyedSubscript:@"ExposureInfo"];
      id v6 = v5;
      a1 = 0;
      if (v4 && v5)
      {
        [v5 floatValue];
        a1 = v7 > 0.0083;
      }
    }
  }

  return a1;
}

double sub_176D4(uint64_t a1)
{
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  *(void *)&double result = 0xF00000000;
  *(void *)(a1 + 44) = 0xF00000000;
  *(_DWORD *)(a1 + 36) = 0;
  *(unsigned char *)(a1 + 55) = 1;
  *(_WORD *)(a1 + 56) = 256;
  return result;
}

float sub_17710()
{
  return 1.0;
}

id sub_17718(void *a1, void *a2, CGFloat a3, CGFloat a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, void *a9, CMTime *a10)
{
  id v16 = a1;
  id v17 = a2;
  id v18 = a9;
  long long v19 = &CFDataCreateWithBytesNoCopy_ptr;
  long long v20 = +[NSMutableDictionary dictionary];
  CMTime time = *a10;
  CFDictionaryRef v21 = CMTimeCopyAsDictionary(&time, kCFAllocatorDefault);
  [v20 setObject:v21 forKeyedSubscript:@"IspTimestamp"];

  id v22 = v17;
  id v23 = v16;
  id v24 = v18;
  id v25 = objc_alloc_init((Class)NSMutableDictionary);
  [v25 setObject:&off_3D3B8 forKeyedSubscript:@"GhostInfoVersion"];
  v47.x = a3;
  v47.y = a4;
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v47);
  [v25 setObject:DictionaryRepresentation forKeyedSubscript:@"EstimatedOpticalCenter"];
  [v25 setObject:v24 forKeyedSubscript:@"MetaData"];
  [v25 setObject:&__kCFBooleanFalse forKeyedSubscript:@"PipeReset"];
  [v25 setObject:v23 forKeyedSubscript:@"RepairMeta"];
  if (a8)
  {
    CFDictionaryRef v41 = DictionaryRepresentation;
    id v42 = v24;
    id v43 = v23;
    v44 = v20;
    id v27 = objc_alloc_init((Class)NSMutableArray);
    if ([v22 count])
    {
      unint64_t v28 = 0;
      do
      {
        long long v29 = [v22 objectAtIndexedSubscript:v28];
        id v30 = objc_alloc_init((Class)v19[138]);
        [v29 roi];
        CFDictionaryRef v31 = CGRectCreateDictionaryRepresentation(v48);
        long long v32 = v19;
        id v33 = [objc_alloc((Class)NSDictionary) initWithDictionary:v31];

        [v30 setObject:v33 forKeyedSubscript:@"GhostRect"];
        [v29 confidence];
        long long v34 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [v30 setObject:v34 forKeyedSubscript:@"GhostConfidence"];

        long long v35 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v29 trackID]);
        [v30 setObject:v35 forKeyedSubscript:@"GhostTrackID"];

        int v36 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v29 trackedCnt]);
        [v30 setObject:v36 forKeyedSubscript:@"GhostTrackCount"];

        [v29 ROIWSpatial];
        CFStringRef v37 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [v30 setObject:v37 forKeyedSubscript:@"GhostBlendingWeightsROIWSpatial"];

        [v29 ROIWStrongRepairInSpatial];
        v38 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [v30 setObject:v38 forKeyedSubscript:@"GhostBlendingWeightsROIWStrongRepairInSpatial"];

        [v29 ROIWOriginal];
        v39 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [v30 setObject:v39 forKeyedSubscript:@"GhostBlendingWeightsROIWOriginal"];

        [v27 addObject:v30];
        long long v19 = v32;

        ++v28;
      }
      while ((unint64_t)[v22 count] > v28);
    }
    [v25 setObject:v27 forKeyedSubscript:@"GhostsArray"];

    id v23 = v43;
    long long v20 = v44;
    id v24 = v42;
    CFDictionaryRef DictionaryRepresentation = v41;
  }

  [v20 setObject:v25 forKeyedSubscript:@"GhostsInfoMetaData"];

  return v20;
}

float32x2_t sub_17B6C(float32x2_t a1, float32x2_t a2)
{
  return vadd_f32(vsub_f32(a2, a1), a2);
}

void sub_17B78(void *a1)
{
  id v39 = a1;
  if ([v39 count])
  {
    uint64_t v1 = 0;
    int v2 = 0;
    unsigned int v3 = 1;
    uint64_t v4 = v39;
    do
    {
      unsigned __int8 v5 = v2;
      int v2 = [v4 objectAtIndexedSubscript:v1];

      id v6 = [v2 trackIDsAfterMerge];

      if (!v6)
      {
        float v7 = +[NSMutableArray array];
        [v2 setTrackIDsAfterMerge:v7];

        unsigned __int16 v8 = [v2 trackIDsAfterMerge];
        id v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v2 trackID]);
        [v8 addObject:v9];
      }
      uint64_t v1 = v3;
      BOOL v10 = (unint64_t)[v39 count] > v3++;
      uint64_t v4 = v39;
    }
    while (v10);
  }
  else
  {
    int v2 = 0;
    uint64_t v4 = v39;
  }
  uint64_t v11 = 0;
  do
  {
    unsigned int v12 = [v4 count];
    if (!v12) {
      break;
    }
    unint64_t v13 = 0;
    char v14 = 0;
    do
    {
      uint64_t v15 = v2;
      int v2 = [v39 objectAtIndexedSubscript:v13];

      [v2 bbox];
      float64x2_t v42 = vcvtq_f64_f32(*(float32x2_t *)v16.f32);
      float64x2_t v43 = vcvt_hight_f64_f32(v16);
      if (++v13 < v12)
      {
        unsigned int v17 = v13;
        id v18 = v39;
        do
        {
          long long v19 = v11;
          uint64_t v20 = v17;
          uint64_t v11 = objc_msgSend(v18, "objectAtIndexedSubscript:", v17, v35);

          [v11 bbox];
          CGFloat v22 = v21;
          CGFloat v24 = v23;
          CGFloat v26 = v25;
          CGFloat v28 = v27;
          v45.origin.CGFloat x = v42.f64[0];
          v45.size.CGFloat width = v43.f64[0];
          v45.origin.CGFloat y = v42.f64[1];
          v45.size.CGFloat height = v43.f64[1];
          v48.origin.CGFloat x = v22;
          v48.origin.CGFloat y = v24;
          v48.size.CGFloat width = v25;
          v48.size.CGFloat height = v27;
          CGRect v46 = CGRectIntersection(v45, v48);
          CGFloat x = v46.origin.x;
          CGFloat y = v46.origin.y;
          CGFloat height = v46.size.height;
          CGFloat width = v46.size.width;
          v46.origin.CGFloat x = v42.f64[0];
          v46.size.CGFloat width = v43.f64[0];
          v46.origin.CGFloat y = v42.f64[1];
          v46.size.CGFloat height = v43.f64[1];
          v49.origin.CGFloat x = v22;
          v49.origin.CGFloat y = v24;
          v49.size.CGFloat width = v26;
          v49.size.CGFloat height = v28;
          CGRect v47 = CGRectUnion(v46, v49);
          CGFloat v37 = v47.size.width;
          CGFloat v38 = v47.origin.x;
          long long v35 = *(_OWORD *)&v47.origin.y;
          CGFloat v36 = v47.size.height;
          v47.origin.CGFloat x = x;
          v47.origin.CGFloat y = y;
          v47.size.CGFloat height = height;
          v47.size.CGFloat width = width;
          if (!CGRectIsNull(v47))
          {
            --v17;
            [v39 removeObjectAtIndex:v20];
            --v12;
            CFDictionaryRef v31 = [v2 trackIDsAfterMerge];
            long long v32 = [v11 trackIDsAfterMerge];
            [v31 addObjectsFromArray:v32];

            v33.f64[0] = v38;
            *(void *)&v33.f64[1] = v35;
            v34.f64[0] = v37;
            v34.f64[1] = v36;
            char v14 = 1;
            float64x2_t v42 = v33;
            float64x2_t v43 = v34;
          }
          ++v17;
          id v18 = v39;
        }
        while (v17 < v12);
      }
      objc_msgSend(v2, "setBbox:", *(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v42), v43).i64, v35);
    }
    while (v13 < v12);
    uint64_t v4 = v39;
  }
  while ((v14 & 1) != 0);
}

void sub_17E84(void *a1, int a2)
{
  id v3 = a1;
  [v3 commit];
  if (a2) {
    [v3 waitUntilCompleted];
  }
  else {
    [v3 waitUntilScheduled];
  }
}

BOOL sub_17EE4(void *a1, int a2, float a3)
{
  id v5 = a1;
  if ((unint64_t)[v5 count] >= 2 * a2)
  {
    BOOL v17 = 1;
  }
  else
  {
    float v6 = a3 * 4.0;
    if ([v5 count])
    {
      unint64_t v7 = 0;
      do
      {
        unsigned __int16 v8 = objc_msgSend(v5, "objectAtIndexedSubscript:", v7, v19);
        [v8 bbox];
        long long v19 = v9;

        _V1.S[2] = DWORD2(v19);
        _S0 = HIDWORD(v19);
        __asm { FMLA            S9, S0, V1.S[2] }
        ++v7;
      }
      while (v7 < (unint64_t)[v5 count]);
    }
    else
    {
      _S9 = 0.0;
    }
    BOOL v17 = _S9 >= v6;
  }

  return v17;
}

void sub_194B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

float *sub_1A944(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, float a9)
{
  BOOL v17 = (float *)malloc_type_malloc(0x18uLL, 0x10200405AF6BDC9uLL);
  if (a2 < 0) {
    sub_28074();
  }
  if (a3 < 0) {
    sub_280A0();
  }
  if (a4 < 0) {
    sub_280CC();
  }
  if (a5 < 0) {
    sub_280F8();
  }
  if (a6 < 0) {
    sub_28124();
  }
  if (a7 < 0) {
    sub_28150();
  }
  int v18 = a2 * a1;
  uint64_t v19 = (a2 * a1 / 100);
  int v20 = a3 * a1;
  int v21 = a3 * a1 / 100;
  v104[0] = v19;
  v104[1] = v21;
  int v22 = a4 * a1;
  int v23 = a4 * a1 / 100;
  int v24 = a5 * a1;
  int v25 = a5 * a1 / 100;
  v104[2] = v23;
  v104[3] = v25;
  int v26 = a6 * a1;
  int v27 = a6 * a1 / 100;
  int v28 = a7 * a1;
  int v29 = a7 * a1 / 100;
  v104[4] = v27;
  v104[5] = v29;
  int v30 = v21 + v19 + v23 + v25;
  if ((v30 + v27 + v29 < 0) ^ __OFADD__(v30, v27 + v29) | (v30 + v27 + v29 == 0)) {
    sub_2817C();
  }
  CFDictionaryRef v31 = v17;
  int v101 = v24;
  int v102 = v22;
  int v99 = v28;
  int v100 = v26;
  *((_DWORD *)v17 + 2) = v30 + v27 + v29;
  unsigned int v32 = v30 + v27 + v29;
  *(void *)BOOL v17 = malloc_type_malloc(3 * v32, 0x100004033FC2DF1uLL);
  *((_DWORD *)v31 + 3) = a8;
  if (v18 < 100)
  {
    unsigned int v38 = 0;
    int v36 = v32;
  }
  else
  {
    int v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 1;
    int v36 = v32;
    do
    {
      if (v34 >= *((int *)v31 + 2)) {
        sub_281A8();
      }
      ++v34;
      CGFloat v37 = (unsigned char *)(*(void *)v31 + v35);
      *(v37 - 1) = 0;
      *CGFloat v37 = v33 / (int)v19;
      v37[1] = -1;
      v35 += 3;
      v33 += 255;
    }
    while (v19 != v34);
    unsigned int v38 = v18 / 100;
  }
  if (v20 >= 100)
  {
    int v39 = 0;
    uint64_t v40 = 0;
    uint64_t v41 = v38;
    uint64_t v42 = 3 * v38;
    do
    {
      if (v41 + v40 >= *((int *)v31 + 2)) {
        sub_281A8();
      }
      uint64_t v43 = *(void *)v31 + v42;
      *(_WORD *)uint64_t v43 = -256;
      *(unsigned char *)(v43 + 2) = ~(v39 / v21);
      v42 += 3;
      ++v40;
      v39 += 255;
    }
    while (v21 != v40);
    unsigned int v38 = v41 + v40;
  }
  if (v102 >= 100)
  {
    int v44 = 0;
    int v45 = 0;
    uint64_t v46 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v45)) {
        sub_281A8();
      }
      uint64_t v47 = *(void *)v31 + v46;
      *(unsigned char *)uint64_t v47 = v44 / v23;
      *(_WORD *)(v47 + 1) = 255;
      ++v45;
      v46 += 3;
      v44 += 255;
    }
    while (v23 != v45);
    v38 += v45;
  }
  if (v101 >= 100)
  {
    int v48 = 0;
    int v49 = 0;
    uint64_t v50 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v49)) {
        sub_281A8();
      }
      uint64_t v51 = *(void *)v31 + v50;
      *(unsigned char *)uint64_t v51 = -1;
      *(_WORD *)(v51 + 1) = ~(v48 / v25);
      ++v49;
      v50 += 3;
      v48 += 255;
    }
    while (v25 != v49);
    v38 += v49;
  }
  if (v100 >= 100)
  {
    int v52 = 0;
    int v53 = 0;
    uint64_t v54 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v53)) {
        sub_281A8();
      }
      uint64_t v55 = *(void *)v31 + v54;
      *(_WORD *)uint64_t v55 = 255;
      *(unsigned char *)(v55 + 2) = v52 / v27;
      ++v53;
      v54 += 3;
      v52 += 255;
    }
    while (v27 != v53);
    v38 += v53;
  }
  if (v99 >= 100)
  {
    int v56 = 0;
    int v57 = 0;
    uint64_t v58 = 3 * v38;
    do
    {
      if (*((_DWORD *)v31 + 2) <= (signed int)(v38 + v57)) {
        sub_281A8();
      }
      uint64_t v59 = *(void *)v31 + v58;
      *(unsigned char *)uint64_t v59 = ~(v56 / v29);
      *(_WORD *)(v59 + 1) = -256;
      ++v57;
      v58 += 3;
      v56 += 255;
    }
    while (v29 != v57);
  }
  if (a8 < 0 && v36 > 1)
  {
    uint64_t v60 = 0;
    uint64_t v61 = v36 >> 1;
    int v62 = v19 + v21 + v23 + v25 + v27 + v29 - 1;
    do
    {
      v63 = (__int16 *)(*(void *)v31 + v60);
      uint64_t v64 = *(void *)v31 + 3 * v62;
      char v65 = *((unsigned char *)v63 + 2);
      __int16 v66 = *v63;
      char v67 = *(unsigned char *)(v64 + 2);
      __int16 *v63 = *(_WORD *)v64;
      *((unsigned char *)v63 + 2) = v67;
      *(_WORD *)uint64_t v64 = v66;
      *(unsigned char *)(v64 + 2) = v65;
      --v62;
      v60 += 3;
      --v61;
    }
    while (v61);
  }
  if (a8 >= 0) {
    int v68 = a8;
  }
  else {
    int v68 = -a8;
  }
  unsigned int v69 = v68 - 1;
  LODWORD(v70) = 6 - v68;
  if (a8 >= 0) {
    uint64_t v70 = v69;
  }
  else {
    uint64_t v70 = v70;
  }
  if ((int)v70 >= 1)
  {
    int v71 = 0;
    v72 = v104;
    do
    {
      int v73 = v71;
      int v75 = *v72++;
      int v74 = v75;
      v71 += v75;
      --v70;
    }
    while (v70);
    if (v71 > 0)
    {
      v76 = *(__int16 **)v31;
      int v77 = v36 - 1;
      if (v71 != 1)
      {
        int v78 = 0;
        v79 = (__int16 *)((char *)v76 + 3 * (v71 - 1));
        int v80 = v73 + v74 - 2;
        v81 = *(__int16 **)v31;
        do
        {
          char v82 = *((unsigned char *)v81 + 2);
          __int16 v83 = *v81;
          char v84 = *((unsigned char *)v79 + 2);
          __int16 *v81 = *v79;
          *((unsigned char *)v81 + 2) = v84;
          __int16 *v79 = v83;
          *((unsigned char *)v79 + 2) = v82;
          v81 = (__int16 *)((char *)v81 + 3);
          v79 = (__int16 *)((char *)v79 - 3);
          BOOL v85 = ++v78 < v80--;
        }
        while (v85);
      }
      if (v71 < v77)
      {
        v86 = (__int16 *)((char *)v76 + 3 * v77);
        v87 = (__int16 *)((char *)v76 + 3 * v71);
        int v88 = v19 + v21 + v23 + v25 + v27 + v29 - 2;
        do
        {
          char v89 = *((unsigned char *)v87 + 2);
          __int16 v90 = *v87;
          char v91 = *((unsigned char *)v86 + 2);
          __int16 *v87 = *v86;
          *((unsigned char *)v87 + 2) = v91;
          __int16 *v86 = v90;
          *((unsigned char *)v86 + 2) = v89;
          v87 = (__int16 *)((char *)v87 + 3);
          v86 = (__int16 *)((char *)v86 - 3);
          BOOL v85 = ++v71 < v88--;
        }
        while (v85);
      }
      if (v36 >= 2)
      {
        int v92 = 0;
        v93 = (__int16 *)((char *)v76 + 3 * (v36 - 1));
        int v94 = v19 + v21 + v23 + v25 + v27 + v29 - 2;
        do
        {
          char v95 = *((unsigned char *)v76 + 2);
          __int16 v96 = *v76;
          char v97 = *((unsigned char *)v93 + 2);
          __int16 *v76 = *v93;
          *((unsigned char *)v76 + 2) = v97;
          __int16 *v93 = v96;
          *((unsigned char *)v93 + 2) = v95;
          v76 = (__int16 *)((char *)v76 + 3);
          v93 = (__int16 *)((char *)v93 - 3);
          BOOL v85 = ++v92 < v94--;
        }
        while (v85);
      }
    }
  }
  v31[4] = a9;
  return v31;
}

void sub_1AF74(void ***a1)
{
  if (a1)
  {
    free(**a1);
    free(*a1);
    *a1 = 0;
  }
}

uint64_t sub_1AFB4(uint64_t a1, int a2, float a3, double a4, double a5, float a6)
{
  if (a3 < 0.0 || a3 > 1.0) {
    sub_281D4();
  }
  int v7 = *(_DWORD *)(a1 + 8);
  float v8 = *(float *)(a1 + 16);
  if (v8 != 0.0)
  {
    float v9 = v8 / 6.28318531;
    a3 = v9 + a3;
    float v10 = 1.0;
    if (a3 < 0.0)
    {
LABEL_9:
      a3 = a3 + v10;
      goto LABEL_10;
    }
    if (a3 > 1.0)
    {
      float v10 = -1.0;
      goto LABEL_9;
    }
  }
LABEL_10:
  float v11 = a3 * (float)(v7 - 1);
  int v12 = (int)v11;
  int v13 = ((int)v11 + 1) % v7;
  *(float *)&unsigned int v14 = (float)(int)v11;
  float v15 = v11 - *(float *)&v14;
  LOBYTE(v14) = *(unsigned char *)(*(void *)a1 + 3 * v12 + a2);
  LOBYTE(a6) = *(unsigned char *)(*(void *)a1 + 3 * v13 + a2);
  return (int)(float)((float)((float)(v15 * (float)((float)LODWORD(a6) / 255.0))
                                          + (float)((float)(1.0 - v15) * (float)((float)v14 / 255.0)))
                                  * 255.0);
}

uint64_t sub_1B09C(uint64_t result, int a2, int a3, float *a4, int a5, int a6, uint64_t a7, int a8, double a9, double a10, double a11, float a12, int a13)
{
  if (a3 >= 1)
  {
    int v13 = a4;
    uint64_t v14 = result;
    uint64_t v15 = 0;
    uint64_t v16 = a6;
    float v17 = 1.1755e-38;
    float v18 = 3.4028e38;
    uint64_t v19 = a4;
    uint64_t v20 = a2;
    do
    {
      uint64_t v21 = a2;
      int v22 = v19;
      if (a2 >= 1)
      {
        do
        {
          *(float *)&a10 = *v22;
          if (*v22 < v18) {
            float v18 = *v22;
          }
          if (*(float *)&a10 > v17) {
            float v17 = *v22;
          }
          int v22 = (float *)((char *)v22 + a6);
          --v21;
        }
        while (v21);
      }
      ++v15;
      uint64_t v19 = (float *)((char *)v19 + a5);
    }
    while (v15 != a3);
    uint64_t v23 = 0;
    float v24 = v17 - v18;
    uint64_t v35 = a8;
    int v25 = (unsigned char *)(a7 + 1);
    uint64_t v36 = a3;
    uint64_t v37 = a5;
    do
    {
      int v26 = v13;
      int v27 = v25;
      if (a2 >= 1)
      {
        do
        {
          float v28 = fmaxf(fminf((float)(*v26 - v18) / v24, 1.0), 0.0);
          *(v27 - 1) = sub_1AFB4(v14, 0, v28, a10, a11, a12);
          *int v27 = sub_1AFB4(v14, 1, v28, v29, v30, v31);
          double result = sub_1AFB4(v14, 2, v28, v32, v33, v34);
          v27[1] = result;
          v27[2] = -1;
          v27 += a13;
          int v26 = (float *)((char *)v26 + v16);
          --v20;
        }
        while (v20);
      }
      ++v23;
      uint64_t v20 = a2;
      v25 += v35;
      int v13 = (float *)((char *)v13 + v37);
    }
    while (v23 != v36);
  }
  return result;
}

uint64_t sub_1B254(__int16 *a1)
{
  if (!a1) {
    return 5;
  }
  if (*a1 >= 1)
  {
    uint64_t v1 = 0;
    uint64_t v2 = (unsigned __int16)*a1;
    do
    {
      uint64_t v3 = 0;
      uint64_t v4 = (float *)&a1[2 * v1];
      float v5 = 1.0 - v4[1030];
      float v6 = 1.0 - v4[1244];
      float v7 = v4[2144];
      float v8 = v4[1184];
      do
      {
        float32x2_t v9 = vsub_f32(*(float32x2_t *)&a1[16 * v1 + 28], *(float32x2_t *)&a1[2 * v3 + 28]);
        float v10 = 1.0 - fminf(fmaxf(sqrtf(vaddv_f32(vmul_f32(v9, v9))) * 0.0078125, 0.0), 1.0);
        float v11 = (float *)&a1[v3];
        if (v8 < (float)(*(float *)&a1[v3 + 2368] * v10)) {
          float v8 = *(float *)&a1[v3 + 2368] * v10;
        }
        if (v7 < (float)(v11[2144] * v10)) {
          float v7 = v11[2144] * v10;
        }
        if (v6 < (float)((float)(1.0 - v11[1244]) * v10)) {
          float v6 = (float)(1.0 - v11[1244]) * v10;
        }
        float v12 = (float)(1.0 - v11[1030]) * v10;
        if (v5 < v12) {
          float v5 = v12;
        }
        v3 += 2;
      }
      while (2 * v2 != v3);
      int v13 = (float *)&a1[2 * v1];
      v13[490] = v8;
      v13[2084] = v7;
      v13[790] = 1.0 - v6;
      v13[970] = 1.0 - v5;
      ++v1;
    }
    while (v1 != v2);
  }
  return 0;
}

void sub_1D1E8(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1DE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1EAC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1EFF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1F990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1FBF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_20218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

unsigned char *sub_20DA8(uint64_t a1)
{
  double result = [*(id *)(a1 + 32) contents];
  result[9536] = 1;
  return result;
}

BOOL sub_23A34(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 count])
  {
    unint64_t v5 = 0;
    do
    {
      [v3 extendBBox];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      uint64_t v14 = [v4 objectAtIndexedSubscript:v5];
      [v14 extendBBox];
      v22.origin.CGFloat x = v15;
      v22.origin.CGFloat y = v16;
      v22.size.CGFloat width = v17;
      v22.size.CGFloat height = v18;
      v21.origin.CGFloat x = v7;
      v21.origin.CGFloat y = v9;
      v21.size.CGFloat width = v11;
      v21.size.CGFloat height = v13;
      BOOL v19 = CGRectIntersectsRect(v21, v22);

      if (v19) {
        break;
      }
      ++v5;
    }
    while ((unint64_t)[v4 count] > v5);
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

void sub_273DC(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == &dword_4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_276F4(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] == &dword_4)
  {
    [v2 GPUEndTime];
    [v2 GPUStartTime];
  }
  else
  {
    [v2 status];
  }
  if (gGMFigKTraceEnabled == 1) {
    kdebug_trace();
  }
}

void sub_28074()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 83, "rangeBC >= 0");
}

void sub_280A0()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 84, "rangeCG >= 0");
}

void sub_280CC()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 85, "rangeGY >= 0");
}

void sub_280F8()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 86, "rangeYR >= 0");
}

void sub_28124()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 87, "rangeRM >= 0");
}

void sub_28150()
{
  __assert_rtn("createColorsWheel_", "FigColorsWheel.c", 88, "rangeMB >= 0");
}

void sub_2817C()
{
}

void sub_281A8()
{
  __assert_rtn("setColorsWheelComponent_", "FigColorsWheel.c", 75, "(k >= 0) && (k < ColorsWheelContext_countColorsTransitions(ctx))");
}

void sub_281D4()
{
  __assert_rtn("ColorsWheelContext_computeColorComponent", "FigColorsWheel.c", 159, "(v >= 0.f) && (v <= 1.f)");
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return _CGPointCreateDictionaryRepresentation(point);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return _CGPointMakeWithDictionaryRepresentation(dict, point);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return _CGRectCreateDictionaryRepresentation(a1);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return _CGRectMakeWithDictionaryRepresentation(dict, rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return _CGSizeMakeWithDictionaryRepresentation(dict, size);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return _CMGetAttachment(target, key, attachmentModeOut);
}

CMBlockBufferRef CMSampleBufferGetDataBuffer(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetDataBuffer(sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetImageBuffer(sbuf);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return _CMTimeCopyAsDictionary(time, allocator);
}

uint64_t CVDataBufferGetIOSurface()
{
  return _CVDataBufferGetIOSurface();
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return _CVMetalTextureCacheCreate(allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return _CVMetalTextureCacheCreateTextureFromImage(allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex, textureOut);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return _CVMetalTextureGetTexture(image);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBaseAddress(pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBytesPerRow(pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetHeightOfPlane(pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetIOSurface(pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPixelFormatType(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetWidthOfPlane(pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return _CVPixelBufferLockBaseAddress(pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return _CVPixelBufferRetain(texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return _CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags);
}

uint64_t CreatePixelBuffer()
{
  return _CreatePixelBuffer();
}

uint64_t FigCFArrayGetFloatAtIndex()
{
  return _FigCFArrayGetFloatAtIndex();
}

uint64_t FigCFDictionaryGetFloatIfPresent()
{
  return _FigCFDictionaryGetFloatIfPresent();
}

uint64_t FigCFDictionaryGetIntIfPresent()
{
  return _FigCFDictionaryGetIntIfPresent();
}

uint64_t FigDebugAssert3()
{
  return _FigDebugAssert3();
}

uint64_t FigSignalErrorAt()
{
  return _FigSignalErrorAt();
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBaseAddress(buffer);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return _IOSurfaceGetBulkAttachments();
}

size_t IOSurfaceGetElementHeight(IOSurfaceRef buffer)
{
  return _IOSurfaceGetElementHeight(buffer);
}

size_t IOSurfaceGetElementWidth(IOSurfaceRef buffer)
{
  return _IOSurfaceGetElementWidth(buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetHeightOfPlane(buffer, planeIndex);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetWidthOfPlane(buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceLock(buffer, options, seed);
}

uint64_t IOSurfaceSetBulkAttachments2()
{
  return _IOSurfaceSetBulkAttachments2();
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceUnlock(buffer, options, seed);
}

void NSLog(NSString *format, ...)
{
}

uint64_t WritePixelBufferToFile()
{
  return _WritePixelBufferToFile();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  return ___invert_f3(a1);
}

void bzero(void *a1, size_t a2)
{
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

uint64_t fig_log_get_emitter()
{
  return _fig_log_get_emitter();
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

float powf(float a1, float a2)
{
  return _powf(a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

id objc_msgSend_GPUEndTime(void *a1, const char *a2, ...)
{
  return [a1 GPUEndTime];
}

id objc_msgSend_GPUStartTime(void *a1, const char *a2, ...)
{
  return [a1 GPUStartTime];
}

id objc_msgSend_LSIsHighRisk(void *a1, const char *a2, ...)
{
  return [a1 LSIsHighRisk];
}

id objc_msgSend_LSTrackID(void *a1, const char *a2, ...)
{
  return [a1 LSTrackID];
}

id objc_msgSend_LSTrackingMatched(void *a1, const char *a2, ...)
{
  return [a1 LSTrackingMatched];
}

id objc_msgSend_LSTrackingVote(void *a1, const char *a2, ...)
{
  return [a1 LSTrackingVote];
}

id objc_msgSend_ROIWOriginal(void *a1, const char *a2, ...)
{
  return [a1 ROIWOriginal];
}

id objc_msgSend_ROIWSpatial(void *a1, const char *a2, ...)
{
  return [a1 ROIWSpatial];
}

id objc_msgSend_ROIWStrongRepairInSpatial(void *a1, const char *a2, ...)
{
  return [a1 ROIWStrongRepairInSpatial];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__allocateMetalBuffers(void *a1, const char *a2, ...)
{
  return [a1 _allocateMetalBuffers];
}

id objc_msgSend__compileShaders(void *a1, const char *a2, ...)
{
  return [a1 _compileShaders];
}

id objc_msgSend__resetDetectionResults(void *a1, const char *a2, ...)
{
  return [a1 _resetDetectionResults];
}

id objc_msgSend__resetIntermediateVariables(void *a1, const char *a2, ...)
{
  return [a1 _resetIntermediateVariables];
}

id objc_msgSend__spatialMitigate(void *a1, const char *a2, ...)
{
  return [a1 _spatialMitigate];
}

id objc_msgSend__temporalMitigate(void *a1, const char *a2, ...)
{
  return [a1 _temporalMitigate];
}

id objc_msgSend__temporalMitigateWithFuture(void *a1, const char *a2, ...)
{
  return [a1 _temporalMitigateWithFuture];
}

id objc_msgSend_area(void *a1, const char *a2, ...)
{
  return [a1 area];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bbox(void *a1, const char *a2, ...)
{
  return [a1 bbox];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bufferBytesPerRow(void *a1, const char *a2, ...)
{
  return [a1 bufferBytesPerRow];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_commandBuffer(void *a1, const char *a2, ...)
{
  return [a1 commandBuffer];
}

id objc_msgSend_commandQueue(void *a1, const char *a2, ...)
{
  return [a1 commandQueue];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_computeBlendingWeights(void *a1, const char *a2, ...)
{
  return [a1 computeBlendingWeights];
}

id objc_msgSend_computeBlendingWeightsWithFuture(void *a1, const char *a2, ...)
{
  return [a1 computeBlendingWeightsWithFuture];
}

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_cvMetalTextureCacheRef(void *a1, const char *a2, ...)
{
  return [a1 cvMetalTextureCacheRef];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultOpticalCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultOpticalCenter];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_detectAndTrack(void *a1, const char *a2, ...)
{
  return [a1 detectAndTrack];
}

id objc_msgSend_detectedGreenGhostInfo(void *a1, const char *a2, ...)
{
  return [a1 detectedGreenGhostInfo];
}

id objc_msgSend_detectionResult(void *a1, const char *a2, ...)
{
  return [a1 detectionResult];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_differenceOfGaussianAndLumaFeature(void *a1, const char *a2, ...)
{
  return [a1 differenceOfGaussianAndLumaFeature];
}

id objc_msgSend_differenceOfGaussianAndLumaFeaturePredictedLocation(void *a1, const char *a2, ...)
{
  return [a1 differenceOfGaussianAndLumaFeaturePredictedLocation];
}

id objc_msgSend_differenceOfGaussianAndLumaFeatureReflection(void *a1, const char *a2, ...)
{
  return [a1 differenceOfGaussianAndLumaFeatureReflection];
}

id objc_msgSend_dist2ghost(void *a1, const char *a2, ...)
{
  return [a1 dist2ghost];
}

id objc_msgSend_dist2opticalCenter(void *a1, const char *a2, ...)
{
  return [a1 dist2opticalCenter];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_estOpticalCenter(void *a1, const char *a2, ...)
{
  return [a1 estOpticalCenter];
}

id objc_msgSend_estOpticalCenterConsecutiveValidFrameCnt(void *a1, const char *a2, ...)
{
  return [a1 estOpticalCenterConsecutiveValidFrameCnt];
}

id objc_msgSend_estOpticalCenterIsAvailable(void *a1, const char *a2, ...)
{
  return [a1 estOpticalCenterIsAvailable];
}

id objc_msgSend_extendBBox(void *a1, const char *a2, ...)
{
  return [a1 extendBBox];
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishProcessing];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_generateLocationFromBBox(void *a1, const char *a2, ...)
{
  return [a1 generateLocationFromBBox];
}

id objc_msgSend_getDevice(void *a1, const char *a2, ...)
{
  return [a1 getDevice];
}

id objc_msgSend_getFrameIndexInQueue(void *a1, const char *a2, ...)
{
  return [a1 getFrameIndexInQueue];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_index2RoiArray(void *a1, const char *a2, ...)
{
  return [a1 index2RoiArray];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isPredictedFromPast(void *a1, const char *a2, ...)
{
  return [a1 isPredictedFromPast];
}

id objc_msgSend_isReflectedLS(void *a1, const char *a2, ...)
{
  return [a1 isReflectedLS];
}

id objc_msgSend_isTracked(void *a1, const char *a2, ...)
{
  return [a1 isTracked];
}

id objc_msgSend_isTrajectoryPruningPassed(void *a1, const char *a2, ...)
{
  return [a1 isTrajectoryPruningPassed];
}

id objc_msgSend_keyPointsList(void *a1, const char *a2, ...)
{
  return [a1 keyPointsList];
}

id objc_msgSend_kpIsFromHW(void *a1, const char *a2, ...)
{
  return [a1 kpIsFromHW];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lightSourceMask(void *a1, const char *a2, ...)
{
  return [a1 lightSourceMask];
}

id objc_msgSend_lowSaliencyCnt(void *a1, const char *a2, ...)
{
  return [a1 lowSaliencyCnt];
}

id objc_msgSend_lsHasBeenUsedForTrackingGhost(void *a1, const char *a2, ...)
{
  return [a1 lsHasBeenUsedForTrackingGhost];
}

id objc_msgSend_lumaFeatureVectorPredictedLocation(void *a1, const char *a2, ...)
{
  return [a1 lumaFeatureVectorPredictedLocation];
}

id objc_msgSend_lumaFeatureVectorReflection(void *a1, const char *a2, ...)
{
  return [a1 lumaFeatureVectorReflection];
}

id objc_msgSend_matchedLS(void *a1, const char *a2, ...)
{
  return [a1 matchedLS];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_metaDictionary(void *a1, const char *a2, ...)
{
  return [a1 metaDictionary];
}

id objc_msgSend_metalContext(void *a1, const char *a2, ...)
{
  return [a1 metalContext];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_params(void *a1, const char *a2, ...)
{
  return [a1 params];
}

id objc_msgSend_pixelFormat(void *a1, const char *a2, ...)
{
  return [a1 pixelFormat];
}

id objc_msgSend_predictedFromPastCnt(void *a1, const char *a2, ...)
{
  return [a1 predictedFromPastCnt];
}

id objc_msgSend_prevFrameAllLSCnt(void *a1, const char *a2, ...)
{
  return [a1 prevFrameAllLSCnt];
}

id objc_msgSend_prevFrameMatchedLSCnt(void *a1, const char *a2, ...)
{
  return [a1 prevFrameMatchedLSCnt];
}

id objc_msgSend_prevFrameMergedGhosts(void *a1, const char *a2, ...)
{
  return [a1 prevFrameMergedGhosts];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_processDetection(void *a1, const char *a2, ...)
{
  return [a1 processDetection];
}

id objc_msgSend_processRepair(void *a1, const char *a2, ...)
{
  return [a1 processRepair];
}

id objc_msgSend_purgeResources(void *a1, const char *a2, ...)
{
  return [a1 purgeResources];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_repair(void *a1, const char *a2, ...)
{
  return [a1 repair];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetIntermediateVariables(void *a1, const char *a2, ...)
{
  return [a1 resetIntermediateVariables];
}

id objc_msgSend_resetState(void *a1, const char *a2, ...)
{
  return [a1 resetState];
}

id objc_msgSend_roi(void *a1, const char *a2, ...)
{
  return [a1 roi];
}

id objc_msgSend_roiClusterCnt(void *a1, const char *a2, ...)
{
  return [a1 roiClusterCnt];
}

id objc_msgSend_setDefaultControllerConfig(void *a1, const char *a2, ...)
{
  return [a1 setDefaultControllerConfig];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_temporalDetectionMatched(void *a1, const char *a2, ...)
{
  return [a1 temporalDetectionMatched];
}

id objc_msgSend_temporalDetectionVote(void *a1, const char *a2, ...)
{
  return [a1 temporalDetectionVote];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_trackID(void *a1, const char *a2, ...)
{
  return [a1 trackID];
}

id objc_msgSend_trackIDsAfterMerge(void *a1, const char *a2, ...)
{
  return [a1 trackIDsAfterMerge];
}

id objc_msgSend_trackedCnt(void *a1, const char *a2, ...)
{
  return [a1 trackedCnt];
}

id objc_msgSend_waitForIdle(void *a1, const char *a2, ...)
{
  return [a1 waitForIdle];
}

id objc_msgSend_waitUntilCompleted(void *a1, const char *a2, ...)
{
  return [a1 waitUntilCompleted];
}

id objc_msgSend_waitUntilScheduled(void *a1, const char *a2, ...)
{
  return [a1 waitUntilScheduled];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}