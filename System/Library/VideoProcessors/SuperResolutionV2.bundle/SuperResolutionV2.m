uint64_t sub_2A34(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t vars8;

  if (!a1) {
    return 0;
  }
  v2 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomLiteClearOutputTexture" constants:0];
  v3 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v2;

  if (*(void *)(a1 + 32))
  {
    v4 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomLiteTileCutKernel" constants:0];
    v5 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v4;

    if (*(void *)(a1 + 40))
    {
      v6 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomLiteTileMergeKernel" constants:0];
      v7 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v6;

      if (*(void *)(a1 + 48))
      {
        v8 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomLiteTilePasteKernel" constants:0];
        v9 = *(void **)(a1 + 56);
        *(void *)(a1 + 56) = v8;

        if (*(void *)(a1 + 56))
        {
          v10 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomLitePaste2xFullChromaKernel" constants:0];
          v11 = *(void **)(a1 + 96);
          *(void *)(a1 + 96) = v10;

          if (*(void *)(a1 + 96))
          {
            v12 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomLiteEnhanceTile" constants:0];
            v13 = *(void **)(a1 + 64);
            *(void *)(a1 + 64) = v12;

            if (*(void *)(a1 + 64))
            {
              v14 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomLiteComputeBlendingMask" constants:0];
              v15 = *(void **)(a1 + 80);
              *(void *)(a1 + 80) = v14;

              if (*(void *)(a1 + 80))
              {
                v16 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomLiteGaussian5RowGather" constants:0];
                v17 = *(void **)(a1 + 72);
                *(void *)(a1 + 72) = v16;

                if (*(void *)(a1 + 72))
                {
                  v18 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomLiteBlendEnhanced" constants:0];
                  v19 = *(void **)(a1 + 88);
                  *(void *)(a1 + 88) = v18;

                  if (*(void *)(a1 + 88)) {
                    return 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

__CVMetalTextureCache **sub_2F74(__CVMetalTextureCache **a1, __CVBuffer *a2, uint64_t a3)
{
  v3 = a1;
  if (a1)
  {
    v4 = a2;
    CVMetalTextureRef image = 0;
    if (a2)
    {
      v5 = (__CVMetalTextureCache **)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
      if (v5)
      {
        size_t v6 = 0;
        CFDictionaryRef v7 = 0;
        OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v4);
        CFStringRef v26 = kCVMetalTextureUsage;
        char v8 = 1;
        while (1)
        {
          uint64_t v9 = sub_4E14((uint64_t)v3, PixelFormatType, v6);
          if (!v9) {
            break;
          }
          MTLPixelFormat v10 = v9;
          char v29 = v8;
          CFDictionaryRef v11 = v7;
          unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(v4, v6);
          unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(v4, v6);
          v14 = v4;
          v15 = v3;
          unsigned int v16 = HeightOfPlane;
          CFStringRef v31 = v26;
          v17 = +[NSNumber numberWithUnsignedInteger:a3];
          v32 = v17;
          CFDictionaryRef v18 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];

          v19 = v15;
          v20 = v15[3];
          v4 = v14;
          CVReturn v21 = CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, v20, v14, v18, v10, WidthOfPlane, v16, v6, &image);
          CVMetalTextureRef v22 = image;
          if (v21) {
            goto LABEL_16;
          }
          v23 = CVMetalTextureGetTexture(image);
          [v5 setObject:v23 atIndexedSubscript:v6];

          v24 = [v5 objectAtIndexedSubscript:v6];

          CVMetalTextureRef v22 = image;
          if (!v24)
          {
LABEL_16:
            CFDictionaryRef v7 = v18;
            if (!v22) {
              goto LABEL_18;
            }
            goto LABEL_17;
          }
          if (image) {
            CFRelease(image);
          }
          size_t v6 = 1;
          CFDictionaryRef v7 = v18;
          char v8 = 0;
          v3 = v19;
          if (((((PixelFormatType - 1278226534) & 0xFFFFFFFD) != 0) & v29) == 0)
          {
            v3 = v5;
            v5 = v3;
            goto LABEL_12;
          }
        }
        CVMetalTextureRef v22 = image;
        if (image) {
LABEL_17:
        }
          CFRelease(v22);
LABEL_18:
        v3 = 0;
        CFDictionaryRef v18 = v7;
        goto LABEL_12;
      }
      v3 = 0;
    }
    else
    {
      v3 = 0;
      v5 = 0;
    }
    CFDictionaryRef v18 = 0;
LABEL_12:
  }

  return v3;
}

uint64_t sub_3204(uint64_t a1, __CVBuffer *a2, _WORD *a3, double a4)
{
  if (!a1) {
    return 0;
  }
  if (a2)
  {
    LOWORD(a4) = *a3;
    WORD2(a4) = a3[1];
    double v102 = a4;
    unsigned __int16 v105 = a3[3];
    size_t v5 = (unsigned __int16)a3[2];
    size_t v6 = (__int16 *)malloc_type_calloc(v5, 2uLL, 0x1000040BDFB0063uLL);
    if (v6)
    {
      CFDictionaryRef v7 = malloc_type_calloc(v105, 2uLL, 0x1000040BDFB0063uLL);
      if (v7)
      {
        char v8 = (short float *)malloc_type_calloc(v5 * v105, 2uLL, 0x1000040BDFB0063uLL);
        if (v8)
        {
          uint64_t v9 = malloc_type_calloc(v5 * v105, 2uLL, 0x1000040BDFB0063uLL);
          MTLPixelFormat v10 = v9;
          if (v9)
          {
            if (v5 >= 2)
            {
              uint64_t v11 = 0;
              LODWORD(v12) = v5 >> 1;
              if (v5 >> 1 <= 1) {
                uint64_t v12 = 1;
              }
              else {
                uint64_t v12 = v12;
              }
              int v13 = v5 - 1;
              do
              {
                float v14 = fminf(fmaxf((float)((float)v11 + 1.0) / (float)((float)v5 + 1.0), 0.0), 1.0);
                _S6 = (float)(v14 * v14) * (float)((float)(v14 * -2.0) + 3.0);
                __asm { FCVT            H6, S6 }
                v6[v11] = LOWORD(_S6);
                *(short float *)&v6[v13] = COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0)) - *(short float *)&_S6;
                ++v11;
                --v13;
              }
              while (v12 != v11);
            }
            if (v105 >= 2u)
            {
              uint64_t v19 = 0;
              LODWORD(v20) = v105 >> 1;
              if (v20 <= 1) {
                uint64_t v20 = 1;
              }
              else {
                uint64_t v20 = v20;
              }
              unsigned int v21 = v105 - 1;
              do
              {
                float v22 = fminf(fmaxf((float)((float)v19 + 1.0) / (float)((float)v105 + 1.0), 0.0), 1.0);
                _S6 = (float)(v22 * v22) * (float)((float)(v22 * -2.0) + 3.0);
                __asm { FCVT            H6, S6 }
                v7[v19] = LOWORD(_S6);
                *(short float *)&v7[v21] = COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0)) - *(short float *)&_S6;
                ++v19;
                --v21;
              }
              while (v20 != v19);
            }
            pixelBuffer = a2;
            if (v105)
            {
              uint64_t v24 = 0;
              if (v5 >= v105) {
                unsigned int v25 = v105;
              }
              else {
                unsigned int v25 = v5;
              }
              float v26 = (float)v25 + 1.0;
              uint64_t v27 = 2 * v5;
              v28 = v8;
              do
              {
                if (v5)
                {
                  size_t v29 = v5;
                  v30 = v28;
                  do
                  {
                    _D6 = sqrt((double)((v105 - v24) * (v105 - v24) + v29 * v29));
                    __asm
                    {
                      FCVT            H6, D6
                      FCVT            S6, H6
                    }
                    *(float *)&_D6 = fminf(fmaxf(*(float *)&_D6 / v26, 0.0), 1.0);
                    _D6 = 1.0
                        - (float)((float)(*(float *)&_D6 * *(float *)&_D6)
                                * (float)((float)(*(float *)&_D6 * -2.0) + 3.0));
                    __asm { FCVT            H6, D6 }
                    short float *v30 = *(short float *)&_D6;
                    __asm { FCMP            H6, #0 }
                    if (_ZF) {
                      _H6 = *v6;
                    }
                    *(_WORD *)v30++ = _H6;
                    --v29;
                  }
                  while (v29);
                }
                ++v24;
                v28 = (short float *)((char *)v28 + v27);
              }
              while (v24 != v105);
              uint64_t v34 = 0;
              int v35 = (v105 - 1) * v5;
              int v36 = v5 - 1;
              int v37 = v5 * v105 - 1;
              v38 = (short float *)v9;
              v39 = v8;
              do
              {
                if (v5)
                {
                  uint64_t v40 = 0;
                  int v41 = v37;
                  int v42 = v36;
                  do
                  {
                    short float v43 = v39[v40];
                    v38[v40] = v43;
                    short float v44 = v43 + v8[v42];
                    v38[v40] = v44;
                    short float v45 = v44 + v8[(v35 + v40)];
                    v38[v40] = v45;
                    v38[v40++] = v45 + v8[v41];
                    --v42;
                    --v41;
                  }
                  while (v5 != v40);
                }
                ++v34;
                v35 -= v5;
                v36 += v5;
                v37 -= v5;
                v39 = (short float *)((char *)v39 + v27);
                v38 = (short float *)((char *)v38 + v27);
              }
              while (v34 != v105);
              unint64_t v46 = v105;
            }
            else
            {
              unint64_t v46 = 0;
            }
            CVPixelBufferLockBaseAddress(a2, 0);
            BaseAddress = (char *)CVPixelBufferGetBaseAddress(a2);
            unsigned int BytesPerRow = CVPixelBufferGetBytesPerRow(a2);
            unint64_t v48 = 0;
            unsigned __int16 v49 = LOWORD(v102);
            int v50 = LOWORD(v102);
            uint64_t v51 = BytesPerRow >> 1;
            unsigned __int16 v52 = WORD2(v102);
            uint64_t v53 = WORD2(v102);
            unint64_t v103 = v51 * (unint64_t)WORD2(v102);
            size_t v54 = (v50 - v5);
            uint64_t v55 = v49;
            while (1)
            {
              for (unint64_t i = 0; i != 3; ++i)
              {
                if (v53)
                {
                  unint64_t v57 = 0;
                  v58 = &BaseAddress[2 * v103 * v48 + 2 * i * v55];
                  while (1)
                  {
                    LOWORD(_H1) = COERCE_UNSIGNED_INT(1.0);
                    if (v48 && v57 < v46) {
                      _H1 = *(short float *)&v7[v57];
                    }
                    if (v48 <= 1 && v57 >= v52 - v105) {
                      _H1 = *(short float *)&v7[~v57 + v52];
                    }
                    if (v55) {
                      break;
                    }
LABEL_92:
                    v58 += 2 * v51;
                    if (++v57 == v53) {
                      goto LABEL_93;
                    }
                  }
                  size_t v60 = 0;
                  BOOL v61 = v57 < v46 && i != 0;
                  BOOL v62 = v57 >= v46 || i > 1;
                  __asm { FCVT            S2, H1 }
                  unint64_t v65 = v57 * v5;
                  if (_CF) {
                    BOOL v66 = i != 0;
                  }
                  else {
                    BOOL v66 = 0;
                  }
                  int v67 = (~v57 + v52) * v5;
                  if (_CF) {
                    BOOL v68 = i > 1;
                  }
                  else {
                    BOOL v68 = 1;
                  }
                  while (2)
                  {
                    if (_H1 == COERCE_SHORT_FLOAT(COERCE_UNSIGNED_INT(1.0)))
                    {
                      _H3 = COERCE_UNSIGNED_INT(1.0);
                      if (i && v60 < v5) {
                        _H3 = v6[v60];
                      }
                      if (i <= 1 && v60 >= v54) {
                        _H3 = v6[~v60 + v50];
                      }
LABEL_88:
                      __asm { FCVT            S3, H3 }
                    }
                    else
                    {
                      char v70 = !v61;
                      if (v60 >= v5) {
                        char v70 = 1;
                      }
                      _S3 = _S2;
                      if ((v70 & 1) == 0)
                      {
                        _H3 = v8[v60 + v65];
                        __asm { FCVT            S3, H3 }
                        _H4 = v10[v60 + v65];
                        __asm { FCVT            S4, H4 }
                        _S3 = _S3 / _S4;
                      }
                      char v76 = v60 < v54 || v62;
                      if (v76)
                      {
                        __asm
                        {
                          FCVT            H3, S3
                          FCVT            S3, H3
                        }
                      }
                      else
                      {
                        int v79 = v57 * v5 + v50 + ~v60;
                        _H3 = v8[v79];
                        __asm { FCVT            S3, H3 }
                        _H4 = v10[v79];
                        __asm { FCVT            S4, H4 }
                        _S3 = _S3 / _S4;
                      }
                      char v84 = !v66;
                      if (v60 >= v5) {
                        char v84 = 1;
                      }
                      if (v84)
                      {
                        __asm
                        {
                          FCVT            H3, S3
                          FCVT            S3, H3
                        }
                      }
                      else
                      {
                        _H3 = v8[(v67 + v60)];
                        __asm { FCVT            S3, H3 }
                        _H4 = v10[(v67 + v60)];
                        __asm { FCVT            S4, H4 }
                        _S3 = _S3 / _S4;
                      }
                      char v91 = v60 < v54 || v68;
                      if (v91)
                      {
                        __asm { FCVT            H3, S3 }
                        goto LABEL_88;
                      }
                      unsigned int v94 = v67 + v50 + ~v60;
                      _H3 = v8[v94];
                      __asm { FCVT            S3, H3 }
                      _H4 = v10[v94];
                      __asm { FCVT            S4, H4 }
                      _S3 = _S3 / _S4;
                    }
                    __asm { FCVT            H3, S3 }
                    *(_WORD *)&v58[2 * v60++] = _H3;
                    if (v60 == v55) {
                      goto LABEL_92;
                    }
                    continue;
                  }
                }
LABEL_93:
                ;
              }
              if (++v48 == 3)
              {
                CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
                uint64_t v99 = 0;
                goto LABEL_96;
              }
            }
          }
          goto LABEL_102;
        }
LABEL_101:
        MTLPixelFormat v10 = 0;
LABEL_102:
        uint64_t v99 = 4294954510;
        goto LABEL_96;
      }
    }
    else
    {
      CFDictionaryRef v7 = 0;
    }
    char v8 = 0;
    goto LABEL_101;
  }
  size_t v6 = 0;
  CFDictionaryRef v7 = 0;
  char v8 = 0;
  MTLPixelFormat v10 = 0;
  uint64_t v99 = 4294954516;
LABEL_96:
  free(v6);
  free(v7);
  free(v8);
  free(v10);
  return v99;
}

void sub_381C(void *a1)
{
  if (a1)
  {
    v2 = (__CVMetalTextureCache *)a1[3];
    if (v2)
    {
      CVMetalTextureCacheFlush(v2, 0);
      v3 = (const void *)a1[3];
      if (v3) {
        CFRelease(v3);
      }
    }
    v4 = (const void *)a1[13];
    if (v4) {
      CFRelease(v4);
    }
    size_t v5 = (const void *)a1[21];
    if (v5) {
      CFRelease(v5);
    }
    size_t v6 = (void *)a1[17];
    a1[17] = 0;

    CFDictionaryRef v7 = (void *)a1[18];
    a1[18] = 0;

    char v8 = (void *)a1[16];
    a1[16] = 0;

    uint64_t v9 = (void *)a1[15];
    a1[15] = 0;

    MTLPixelFormat v10 = (void *)a1[19];
    a1[19] = 0;
  }
}

uint64_t sub_49F0(uint64_t a1, void *a2, void *a3, int a4, int a5, id *a6)
{
  id v11 = a2;
  id v12 = a3;
  int v13 = v12;
  if (!a1)
  {
LABEL_6:
    uint64_t v14 = 0;
    goto LABEL_7;
  }
  uint64_t v14 = 4294954516;
  if (v11 && v12)
  {
    uint64_t v15 = [*a6 computeCommandEncoder];
    if (!v15)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      uint64_t v14 = FigSignalErrorAt();
      goto LABEL_7;
    }
    unsigned int v16 = (void *)v15;
    id v17 = *(id *)(a1 + 64);
    [v16 setComputePipelineState:v17];
    [v16 setTexture:v11 atIndex:0];
    [v16 setTexture:v13 atIndex:1];
    [v16 setTexture:*(void *)(a1 + 144) atIndex:2];
    id v28 = v11;
    uint64_t v18 = a4;
    uint64_t v19 = a5;
    v38[0] = a4;
    v38[1] = a5;
    v38[2] = 1;
    v37[0] = [v17 threadExecutionWidth];
    v37[1] = (unint64_t)[v17 maxTotalThreadsPerThreadgroup] / v37[0];
    v37[2] = 1;
    [v16 dispatchThreads:v38 threadsPerThreadgroup:v37];
    id v20 = *(id *)(a1 + 80);

    [v16 setComputePipelineState:v20];
    [v16 setTexture:*(void *)(a1 + 144) atIndex:0];
    [v16 setTexture:*(void *)(a1 + 120) atIndex:1];
    uint64_t v26 = 2 * a4;
    uint64_t v27 = v13;
    uint64_t v21 = 2 * a5;
    v36[0] = v26;
    v36[1] = v21;
    v36[2] = 1;
    v35[0] = [v20 threadExecutionWidth];
    v35[1] = (unint64_t)[v20 maxTotalThreadsPerThreadgroup] / v35[0];
    v35[2] = 1;
    [v16 dispatchThreads:v36 threadsPerThreadgroup:v35];
    id v22 = *(id *)(a1 + 72);

    [v16 setComputePipelineState:v22];
    [v16 setTexture:*(void *)(a1 + 120) atIndex:0];
    [v16 setTexture:*(void *)(a1 + 128) atIndex:1];
    v34[0] = a4;
    v34[1] = v19;
    v34[2] = 1;
    v33[0] = [v22 threadExecutionWidth];
    v33[1] = (unint64_t)[v22 maxTotalThreadsPerThreadgroup] / v33[0];
    v33[2] = 1;
    [v16 dispatchThreads:v34 threadsPerThreadgroup:v33];
    id v23 = *(id *)(a1 + 72);

    [v16 setComputePipelineState:v23];
    [v16 setTexture:*(void *)(a1 + 128) atIndex:0];
    [v16 setTexture:*(void *)(a1 + 120) atIndex:1];
    v32[0] = v19;
    v32[1] = v18;
    id v11 = v28;
    v32[2] = 1;
    v31[0] = [v23 threadExecutionWidth];
    v31[1] = (unint64_t)[v23 maxTotalThreadsPerThreadgroup] / v31[0];
    v31[2] = 1;
    [v16 dispatchThreads:v32 threadsPerThreadgroup:v31];
    id v24 = *(id *)(a1 + 88);

    [v16 setComputePipelineState:v24];
    [v16 setTexture:v28 atIndex:0];
    [v16 setTexture:*(void *)(a1 + 144) atIndex:1];
    [v16 setTexture:*(void *)(a1 + 120) atIndex:2];
    [v16 setTexture:*(void *)(a1 + 136) atIndex:3];
    v30[0] = v26;
    v30[1] = v21;
    int v13 = v27;
    v30[2] = 1;
    v29[0] = [v24 threadExecutionWidth];
    v29[1] = (unint64_t)[v24 maxTotalThreadsPerThreadgroup] / v29[0];
    v29[2] = 1;
    [v16 dispatchThreads:v30 threadsPerThreadgroup:v29];
    [v16 endEncoding];

    goto LABEL_6;
  }
LABEL_7:

  return v14;
}

uint64_t sub_4E14(uint64_t result, int a2, int a3)
{
  if (result)
  {
    if (a2 > 1278226533)
    {
      if (a2 <= 1885745711)
      {
        switch(a2)
        {
          case 1278226534:
            return 55;
          case 1278226536:
            return 25;
          case 1751527984:
            BOOL v4 = a3 == 0;
            uint64_t v5 = 65;
            uint64_t v6 = 25;
            goto LABEL_25;
        }
        return 0;
      }
      if (a2 > 2084070959)
      {
        if (a2 != 2088265264)
        {
          int v3 = 2084070960;
LABEL_23:
          if (a2 == v3) {
            goto LABEL_24;
          }
          return 0;
        }
      }
      else if (a2 != 1885745712)
      {
        if (a2 == 2019963440)
        {
          BOOL v4 = a3 == 0;
          uint64_t v5 = 60;
          uint64_t v6 = 20;
          goto LABEL_25;
        }
        return 0;
      }
    }
    else if (a2 <= 762865199)
    {
      if (a2 == 641230384)
      {
LABEL_24:
        BOOL v4 = a3 == 0;
        uint64_t v5 = 30;
        uint64_t v6 = 10;
LABEL_25:
        if (v4) {
          return v6;
        }
        else {
          return v5;
        }
      }
      if (a2 != 645424688)
      {
        int v3 = 758670896;
        goto LABEL_23;
      }
    }
    else
    {
      if (a2 <= 796419631)
      {
        if (a2 != 762865200)
        {
          int v3 = 792225328;
          goto LABEL_23;
        }
        goto LABEL_28;
      }
      if (a2 != 796419632)
      {
        int v3 = 875704422;
        goto LABEL_23;
      }
    }
LABEL_28:
    if (a3) {
      return 589;
    }
    else {
      return 588;
    }
  }
  return result;
}

uint64_t sub_55D4(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardClearOutputTexture" constants:0];
  int v3 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v2;

  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardTileCutKernel" constants:0];
    uint64_t v5 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v4;

    if (*(void *)(a1 + 40))
    {
      uint64_t v6 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardTileMergeKernel" constants:0];
      CFDictionaryRef v7 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v6;

      if (*(void *)(a1 + 56))
      {
        uint64_t v8 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardTilePasteKernel" constants:0];
        uint64_t v9 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v8;

        if (*(void *)(a1 + 48)) {
          return 0;
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

void sub_586C(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (__CVMetalTextureCache *)a1[3];
    if (v2)
    {
      CVMetalTextureCacheFlush(v2, 0);
      int v3 = (const void *)a1[3];
      if (v3) {
        CFRelease(v3);
      }
    }
    uint64_t v4 = (const void *)a1[8];
    if (v4) {
      CFRelease(v4);
    }
    uint64_t v5 = (const void *)a1[10];
    if (v5) {
      CFRelease(v5);
    }
    uint64_t v6 = (const void *)a1[11];
    if (v6) {
      CFRelease(v6);
    }
    CFDictionaryRef v7 = (void *)a1[13];
    a1[13] = 0;
  }
}

uint64_t sub_6BC8(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardAssembleResidual" constants:0];
  int v3 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v2;

  if (*(void *)(a1 + 72))
  {
    uint64_t v4 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardReduceLowFreqDiffYUV" constants:0];
    uint64_t v5 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v4;

    if (*(void *)(a1 + 80))
    {
      uint64_t v6 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardGaussian3RowGatherXY" constants:0];
      CFDictionaryRef v7 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v6;

      if (*(void *)(a1 + 24))
      {
        uint64_t v8 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardGaussian5RowGather" constants:0];
        uint64_t v9 = *(void **)(a1 + 48);
        *(void *)(a1 + 48) = v8;

        if (*(void *)(a1 + 48))
        {
          uint64_t v10 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardGaussian9RowGatherXY" constants:0];
          id v11 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v10;

          if (*(void *)(a1 + 32))
          {
            uint64_t v12 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardGaussian11RowGatherXY" constants:0];
            int v13 = *(void **)(a1 + 40);
            *(void *)(a1 + 40) = v12;

            if (*(void *)(a1 + 40))
            {
              uint64_t v14 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardGaussian17RowGather" constants:0];
              uint64_t v15 = *(void **)(a1 + 56);
              *(void *)(a1 + 56) = v14;

              if (*(void *)(a1 + 56))
              {
                uint64_t v16 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardGaussian21RowGather" constants:0];
                id v17 = *(void **)(a1 + 64);
                *(void *)(a1 + 64) = v16;

                if (*(void *)(a1 + 64))
                {
                  uint64_t v18 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardYuv444To420" constants:0];
                  uint64_t v19 = *(void **)(a1 + 16);
                  *(void *)(a1 + 16) = v18;

                  if (*(void *)(a1 + 16))
                  {
                    uint64_t v20 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardComputeDetail" constants:0];
                    uint64_t v21 = *(void **)(a1 + 88);
                    *(void *)(a1 + 88) = v20;

                    if (*(void *)(a1 + 88))
                    {
                      uint64_t v22 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardMaxFilterH" constants:0];
                      id v23 = *(void **)(a1 + 96);
                      *(void *)(a1 + 96) = v22;

                      if (*(void *)(a1 + 96))
                      {
                        uint64_t v24 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardMaxFilterHxy" constants:0];
                        unsigned int v25 = *(void **)(a1 + 104);
                        *(void *)(a1 + 104) = v24;

                        if (*(void *)(a1 + 104))
                        {
                          uint64_t v26 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardComputeDetailGainMap" constants:0];
                          uint64_t v27 = *(void **)(a1 + 112);
                          *(void *)(a1 + 112) = v26;

                          if (*(void *)(a1 + 112))
                          {
                            uint64_t v28 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardDownsample2xLumaLUT" constants:0];
                            size_t v29 = *(void **)(a1 + 120);
                            *(void *)(a1 + 120) = v28;

                            if (*(void *)(a1 + 120))
                            {
                              uint64_t v30 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardUpsample2xAdjLumaGain" constants:0];
                              CFStringRef v31 = *(void **)(a1 + 128);
                              *(void *)(a1 + 128) = v30;

                              if (*(void *)(a1 + 128))
                              {
                                uint64_t v32 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardModulateStrength" constants:0];
                                v33 = *(void **)(a1 + 136);
                                *(void *)(a1 + 136) = v32;

                                if (*(void *)(a1 + 136))
                                {
                                  uint64_t v34 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardComputeLumaBlendingMask" constants:0];
                                  int v35 = *(void **)(a1 + 144);
                                  *(void *)(a1 + 144) = v34;

                                  if (*(void *)(a1 + 144))
                                  {
                                    uint64_t v36 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomStandardBlendEnhanced" constants:0];
                                    int v37 = *(void **)(a1 + 152);
                                    *(void *)(a1 + 152) = v36;

                                    if (*(void *)(a1 + 152)) {
                                      return 0;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

uint64_t sub_75D0(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = 4294954516;
  if (a2 && a3)
  {
    *(_DWORD *)(a1 + 288) = a2;
    *(_DWORD *)(a1 + 292) = a3;
    id v8 = objc_alloc_init((Class)MTLTextureDescriptor);
    uint64_t v4 = v8;
    if (!v8) {
      goto LABEL_21;
    }
    [v8 setWidth:a2];
    [v4 setHeight:a3];
    [v4 setPixelFormat:25];
    [v4 setUsage:3];
    uint64_t v9 = [*(id *)(a1 + 8) device];
    id v10 = [v9 newTextureWithDescriptor:v4];
    id v11 = *(void **)(a1 + 176);
    *(void *)(a1 + 176) = v10;

    if (!*(void *)(a1 + 176)) {
      goto LABEL_21;
    }
    uint64_t v12 = [*(id *)(a1 + 8) device];
    id v13 = [v12 newTextureWithDescriptor:v4];
    uint64_t v14 = *(void **)(a1 + 160);
    *(void *)(a1 + 160) = v13;

    if (!*(void *)(a1 + 160)) {
      goto LABEL_21;
    }
    uint64_t v15 = [*(id *)(a1 + 8) device];
    id v16 = [v15 newTextureWithDescriptor:v4];
    id v17 = *(void **)(a1 + 208);
    *(void *)(a1 + 208) = v16;

    if (!*(void *)(a1 + 208)) {
      goto LABEL_21;
    }
    uint64_t v18 = [*(id *)(a1 + 8) device];
    id v19 = [v18 newTextureWithDescriptor:v4];
    uint64_t v20 = *(void **)(a1 + 192);
    *(void *)(a1 + 192) = v19;

    if (!*(void *)(a1 + 192)) {
      goto LABEL_21;
    }
    uint64_t v21 = [*(id *)(a1 + 8) device];
    id v22 = [v21 newTextureWithDescriptor:v4];
    id v23 = *(void **)(a1 + 240);
    *(void *)(a1 + 240) = v22;

    if (!*(void *)(a1 + 240)) {
      goto LABEL_21;
    }
    [v4 setWidth:a3];
    [v4 setHeight:a2];
    uint64_t v24 = [*(id *)(a1 + 8) device];
    id v25 = [v24 newTextureWithDescriptor:v4];
    uint64_t v26 = *(void **)(a1 + 224);
    *(void *)(a1 + 224) = v25;

    if (!*(void *)(a1 + 224)) {
      goto LABEL_21;
    }
    uint64_t v27 = a2 >> 1;
    [v4 setWidth:v27];
    uint64_t v28 = a3 >> 1;
    [v4 setHeight:v28];
    [v4 setPixelFormat:65];
    size_t v29 = [*(id *)(a1 + 8) device];
    id v30 = [v29 newTextureWithDescriptor:v4];
    CFStringRef v31 = *(void **)(a1 + 184);
    *(void *)(a1 + 184) = v30;

    if (!*(void *)(a1 + 184)) {
      goto LABEL_21;
    }
    uint64_t v32 = [*(id *)(a1 + 8) device];
    id v33 = [v32 newTextureWithDescriptor:v4];
    uint64_t v34 = *(void **)(a1 + 168);
    *(void *)(a1 + 168) = v33;

    if (!*(void *)(a1 + 168)) {
      goto LABEL_21;
    }
    int v35 = [*(id *)(a1 + 8) device];
    id v36 = [v35 newTextureWithDescriptor:v4];
    int v37 = *(void **)(a1 + 216);
    *(void *)(a1 + 216) = v36;

    if (!*(void *)(a1 + 216)) {
      goto LABEL_21;
    }
    v38 = [*(id *)(a1 + 8) device];
    id v39 = [v38 newTextureWithDescriptor:v4];
    uint64_t v40 = *(void **)(a1 + 200);
    *(void *)(a1 + 200) = v39;

    if (!*(void *)(a1 + 200)) {
      goto LABEL_21;
    }
    int v41 = [*(id *)(a1 + 8) device];
    id v42 = [v41 newTextureWithDescriptor:v4];
    short float v43 = *(void **)(a1 + 248);
    *(void *)(a1 + 248) = v42;

    if (!*(void *)(a1 + 248)) {
      goto LABEL_21;
    }
    [v4 setWidth:v28];
    [v4 setHeight:v27];
    short float v44 = [*(id *)(a1 + 8) device];
    id v45 = [v44 newTextureWithDescriptor:v4];
    unint64_t v46 = *(void **)(a1 + 232);
    *(void *)(a1 + 232) = v45;

    if (!*(void *)(a1 + 232)) {
      goto LABEL_21;
    }
    v47 = [*(id *)(a1 + 8) device];
    id v48 = [v47 newBufferWithLength:1024 options:0];
    unsigned __int16 v49 = *(void **)(a1 + 256);
    *(void *)(a1 + 256) = v48;

    if (*(void *)(a1 + 256))
    {
      uint64_t v5 = 0;
    }
    else
    {
LABEL_21:
      fig_log_get_emitter();
      FigDebugAssert3();
      uint64_t v5 = FigSignalErrorAt();
    }
  }

  return v5;
}

uint64_t sub_8260(uint32x2_t *a1, void *a2, void *a3, void *a4, void *a5)
{
  if (a1)
  {
    id v10 = *(id *)&a1[2];
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v14 = a2;
    [v11 setComputePipelineState:v10];
    [v11 setTexture:v14 atIndex:0];

    [v11 setTexture:v13 atIndex:1];
    [v11 setTexture:v12 atIndex:2];

    unint64_t v15 = (unint64_t)[v10 threadExecutionWidth];
    unint64_t v16 = (unint64_t)[v10 maxTotalThreadsPerThreadgroup];
    uint32x2_t v17 = a1[36];
    unint64_t v18 = v16 / v15;

    uint32x2_t v19 = vshr_n_u32(v17, 1uLL);
    *(void *)&long long v20 = v19.u32[0];
    *((void *)&v20 + 1) = v19.u32[1];
    long long v23 = v20;
    uint64_t v24 = 1;
    v22[0] = v15;
    v22[1] = v18;
    v22[2] = 1;
    [v11 dispatchThreads:&v23 threadsPerThreadgroup:v22];
  }
  return 0;
}

uint64_t sub_8388(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = v21;
  if (a1)
  {
    uint64_t v23 = sub_8A94(a1, a2, a3, *(void **)(a1 + 224), *(void **)(a1 + 232), 5u, *(_DWORD *)(a1 + 288), *(_DWORD *)(a1 + 292), v21);
    if (v23
      || (uint64_t v23 = sub_8A94(a1, *(void **)(a1 + 224), *(void **)(a1 + 232), v16, v17, 5u, *(_DWORD *)(a1 + 292), *(_DWORD *)(a1 + 288), v22), v23))
    {
      uint64_t v29 = v23;
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_6;
    }
    id v24 = *(id *)(a1 + 72);
    [v22 setComputePipelineState:v24];
    [v22 setTexture:v16 atIndex:0];
    [v22 setTexture:v17 atIndex:1];
    [v22 setTexture:v18 atIndex:2];
    [v22 setTexture:v19 atIndex:3];
    [v22 setTexture:v20 atIndex:4];
    unint64_t v25 = (unint64_t)[v24 threadExecutionWidth];
    unint64_t v26 = (unint64_t)[v24 maxTotalThreadsPerThreadgroup];
    uint64_t v27 = *(void *)(a1 + 288);
    *(void *)&long long v28 = v27;
    *((void *)&v28 + 1) = HIDWORD(v27);
    long long v32 = v28;
    uint64_t v33 = 1;
    v31[0] = v25;
    v31[1] = v26 / v25;
    v31[2] = 1;
    [v22 dispatchThreads:&v32 threadsPerThreadgroup:v31];
  }
  uint64_t v29 = 0;
LABEL_6:

  return v29;
}

uint64_t sub_8608(uint32x2_t *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (a1)
  {
    uint64_t v15 = sub_8A94((uint64_t)a1, a2, a3, *(void **)&a1[28], *(void **)&a1[29], 0x11u, a1[36].u32[0], a1[36].u32[1], v13);
    if (v15
      || (uint64_t v15 = sub_8A94((uint64_t)a1, *(void **)&a1[28], *(void **)&a1[29], *(void **)&a1[30], *(void **)&a1[31], 0x11u, a1[36].u32[1], a1[36].u32[0], v14), v15)|| (uint64_t v15 = sub_8A94((uint64_t)a1, v11, v12, *(void **)&a1[28], *(void **)&a1[29], 5u, a1[36].u32[0], a1[36].u32[1],
                  v14),
          v15)
      || (uint64_t v15 = sub_8A94((uint64_t)a1, *(void **)&a1[28], *(void **)&a1[29], *(void **)&a1[26], *(void **)&a1[27], 5u, a1[36].u32[1], a1[36].u32[0], v14), v15)|| (uint64_t v15 = sub_8A94((uint64_t)a1, *(void **)&a1[26], *(void **)&a1[27], *(void **)&a1[28], *(void **)&a1[29], 0x11u, a1[36].u32[0], a1[36].u32[1],
                  v14),
          v15)
      || (uint64_t v15 = sub_8A94((uint64_t)a1, *(void **)&a1[28], *(void **)&a1[29], *(void **)&a1[26], *(void **)&a1[27], 0x11u, a1[36].u32[1], a1[36].u32[0], v14), v15))
    {
      uint64_t v19 = v15;
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_10;
    }
    id v16 = *(id *)&a1[10];
    [v14 setComputePipelineState:v16];
    [v14 setImageblockWidth:32 height:32];
    [v14 setTexture:*(void *)&a1[30] atIndex:0];
    [v14 setTexture:*(void *)&a1[26] atIndex:1];
    [v14 setTexture:v11 atIndex:2];
    [v14 setTexture:v11 atIndex:3];
    [v14 setTexture:*(void *)&a1[31] atIndex:4];
    [v14 setTexture:*(void *)&a1[27] atIndex:5];
    [v14 setTexture:v12 atIndex:6];
    [v14 setTexture:v12 atIndex:7];
    uint32x2_t v17 = vshr_n_u32(a1[36], 1uLL);
    *(void *)&long long v18 = v17.u32[0];
    *((void *)&v18 + 1) = v17.u32[1];
    long long v23 = v18;
    uint64_t v24 = 1;
    int64x2_t v21 = vdupq_n_s64(0x10uLL);
    uint64_t v22 = 1;
    [v14 dispatchThreads:&v23 threadsPerThreadgroup:&v21];
  }
  uint64_t v19 = 0;
LABEL_10:

  return v19;
}

uint64_t sub_8A94(uint64_t a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6, unsigned int a7, unsigned int a8, void *a9)
{
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a9;
  if (a1)
  {
    uint64_t v21 = sub_9C68(a1, v16, v18, a6, a7, a8, 1, v20);
    if (!v21) {
      uint64_t v21 = sub_9C68(a1, v17, v19, (a6 >> 1) + 1, a7 >> 1, a8 >> 1, 0, v20);
    }
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

uint64_t sub_8B90(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if (a1)
  {
    unint64_t v15 = *(unsigned int *)(a1 + 288);
    unint64_t v16 = *(unsigned int *)(a1 + 292);
    id v17 = *(id *)(a1 + 88);
    id v18 = a8;
    id v19 = a7;
    id v20 = a6;
    id v21 = a5;
    id v22 = a4;
    id v23 = a3;
    id v24 = a2;
    [v18 setComputePipelineState:v17];
    [v18 setImageblockWidth:32 height:32];
    [v18 setTexture:v22 atIndex:0];

    [v18 setTexture:v24 atIndex:1];
    [v18 setTexture:v20 atIndex:2];

    v31[0] = v15;
    v31[1] = v16;
    v31[2] = 1;
    int64x2_t v29 = vdupq_n_s64(0x20uLL);
    uint64_t v30 = 1;
    [v18 dispatchThreads:v31 threadsPerThreadgroup:&v29];
    [v18 setComputePipelineState:v17];

    [v18 setImageblockWidth:16 height:16];
    [v18 setTexture:v21 atIndex:0];

    [v18 setTexture:v23 atIndex:1];
    [v18 setTexture:v19 atIndex:2];

    v28[0] = v15 >> 1;
    v28[1] = v16 >> 1;
    v28[2] = 1;
    int64x2_t v26 = vdupq_n_s64(0x10uLL);
    uint64_t v27 = 1;
    [v18 dispatchThreads:v28 threadsPerThreadgroup:&v26];
  }
  return 0;
}

uint64_t sub_8D5C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  if (a1)
  {
    unint64_t v12 = *(unsigned int *)(a1 + 288);
    unint64_t v13 = *(unsigned int *)(a1 + 292);
    id v14 = *(id *)(a1 + 96);
    id v15 = a6;
    id v25 = a5;
    id v16 = a4;
    id v24 = a3;
    id v17 = a2;
    [v15 setComputePipelineState:v14];
    [v15 setTexture:v17 atIndex:0];

    [v15 setTexture:*(void *)(a1 + 224) atIndex:1];
    v33[0] = v12 >> 1;
    v33[1] = v13 >> 1;
    v33[2] = 1;
    v32[0] = [v14 threadExecutionWidth];
    v32[1] = (unint64_t)[v14 maxTotalThreadsPerThreadgroup] / v32[0];
    v32[2] = 1;
    [v15 dispatchThreads:v33 threadsPerThreadgroup:v32];
    id v18 = *(id *)(a1 + 96);

    [v15 setComputePipelineState:v18];
    [v15 setTexture:*(void *)(a1 + 224) atIndex:0];
    [v15 setTexture:v16 atIndex:1];

    v31[0] = v13 >> 1;
    v31[1] = v12 >> 1;
    v31[2] = 1;
    v30[0] = [v18 threadExecutionWidth];
    v30[1] = (unint64_t)[v18 maxTotalThreadsPerThreadgroup] / v30[0];
    v30[2] = 1;
    [v15 dispatchThreads:v31 threadsPerThreadgroup:v30];
    id v19 = *(id *)(a1 + 104);

    [v15 setComputePipelineState:v19];
    [v15 setTexture:v24 atIndex:0];

    [v15 setTexture:*(void *)(a1 + 232) atIndex:1];
    v29[0] = v12 >> 2;
    v29[1] = v13 >> 2;
    v29[2] = 1;
    v28[0] = [v19 threadExecutionWidth];
    v28[1] = (unint64_t)[v19 maxTotalThreadsPerThreadgroup] / v28[0];
    v28[2] = 1;
    [v15 dispatchThreads:v29 threadsPerThreadgroup:v28];
    id v20 = *(id *)(a1 + 104);

    [v15 setComputePipelineState:v20];
    [v15 setTexture:*(void *)(a1 + 232) atIndex:0];
    [v15 setTexture:v25 atIndex:1];

    unint64_t v21 = (unint64_t)[v20 threadExecutionWidth];
    unint64_t v22 = (unint64_t)[v20 maxTotalThreadsPerThreadgroup];

    v27[0] = v13 >> 2;
    v27[1] = v12 >> 2;
    v27[2] = 1;
    v26[0] = v21;
    v26[1] = v22 / v21;
    v26[2] = 1;
    [v15 dispatchThreads:v27 threadsPerThreadgroup:v26];
  }
  return 0;
}

uint64_t sub_9000(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  if (a1)
  {
    uint64_t v15 = a1 + 288;
    unint64_t v16 = *(unsigned int *)(a1 + 288);
    unint64_t v26 = *(unsigned int *)(a1 + 292);
    id v17 = *(id *)(a1 + 112);
    id v18 = a8;
    id v19 = a7;
    id v20 = a6;
    id v21 = a5;
    id v22 = a4;
    id v23 = a3;
    id v24 = a2;
    [v18 setComputePipelineState:v17];
    [v18 setImageblockWidth:32 height:32];
    [v18 setTexture:v24 atIndex:0];

    [v18 setTexture:v22 atIndex:1];
    [v18 setTexture:v20 atIndex:2];

    [v18 setBytes:v15 length:16 atIndex:0];
    v32[0] = v16;
    v32[1] = v26;
    v32[2] = 1;
    int64x2_t v30 = vdupq_n_s64(0x20uLL);
    uint64_t v31 = 1;
    [v18 dispatchThreads:v32 threadsPerThreadgroup:&v30];
    [v18 setComputePipelineState:v17];
    [v18 setImageblockWidth:16 height:16];
    [v18 setTexture:v23 atIndex:0];

    [v18 setTexture:v21 atIndex:1];
    [v18 setTexture:v19 atIndex:2];

    [v18 setBytes:v15 length:16 atIndex:0];
    v29[0] = v16 >> 1;
    v29[1] = v26 >> 1;
    v29[2] = 1;
    int64x2_t v27 = vdupq_n_s64(0x10uLL);
    uint64_t v28 = 1;
    [v18 dispatchThreads:v29 threadsPerThreadgroup:&v27];
  }
  return 0;
}

uint64_t sub_9200(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (!a1)
  {
    uint64_t v21 = 0;
    goto LABEL_6;
  }
  uint64_t v9 = *(void **)(a1 + 120);
  uint32x2_t v10 = *(uint32x2_t *)(a1 + 288);
  uint32x2_t v11 = vshr_n_u32(v10, 1uLL);
  *(uint32x2_t *)(a1 + 296) = v11;
  unsigned int v12 = v11.u32[1];
  unsigned int v13 = v11.i32[0];
  id v14 = v9;
  id v15 = a2;
  [v8 setComputePipelineState:v14];
  [v8 setTexture:v15 atIndex:0];

  [v8 setTexture:*(void *)(a1 + 240) atIndex:1];
  [v8 setBytes:a1 + 288 length:16 atIndex:0];
  [v8 setBuffer:*(void *)(a1 + 256) offset:0 atIndex:1];
  unint64_t v16 = (unint64_t)[v14 threadExecutionWidth];
  unint64_t v17 = (unint64_t)[v14 maxTotalThreadsPerThreadgroup];
  uint32x2_t v18 = vsra_n_u32((uint32x2_t)0x200000002, v10, 1uLL);
  *(void *)&long long v19 = v18.u32[0];
  *((void *)&v19 + 1) = v18.u32[1];
  long long v32 = v19;
  uint64_t v33 = 1;
  v31[0] = v16;
  v31[1] = v17 / v16;
  v31[2] = 1;
  [v8 dispatchThreads:&v32 threadsPerThreadgroup:v31];
  uint64_t v20 = sub_9C68(a1, *(void **)(a1 + 240), *(void **)(a1 + 224), 5, v13, v12, 1, v8);
  if (v20)
  {
    uint64_t v21 = v20;
    fig_log_get_emitter();
LABEL_9:
    FigDebugAssert3();
    goto LABEL_5;
  }
  uint64_t v21 = sub_9C68(a1, *(void **)(a1 + 224), *(void **)(a1 + 240), 5, v12, v13, 1, v8);
  if (v21)
  {
    fig_log_get_emitter();
    goto LABEL_9;
  }
  id v22 = *(id *)(a1 + 128);

  [v8 setComputePipelineState:v22];
  [v8 setTexture:*(void *)(a1 + 240) atIndex:0];
  [v8 setTexture:v7 atIndex:1];
  unint64_t v23 = (unint64_t)[v22 threadExecutionWidth];
  unint64_t v24 = (unint64_t)[v22 maxTotalThreadsPerThreadgroup];
  uint64_t v25 = *(void *)(a1 + 288);
  *(void *)&long long v26 = v25;
  *((void *)&v26 + 1) = HIDWORD(v25);
  long long v29 = v26;
  uint64_t v30 = 1;
  v28[0] = v23;
  v28[1] = v24 / v23;
  v28[2] = 1;
  [v8 dispatchThreads:&v29 threadsPerThreadgroup:v28];
  id v14 = v22;
LABEL_5:

LABEL_6:
  return v21;
}

uint64_t sub_94EC(uint32x2_t *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10)
{
  if (a1)
  {
    id v17 = *(id *)&a1[17];
    id v18 = a10;
    id v37 = a9;
    id v19 = a8;
    id v20 = a7;
    id v21 = a6;
    id v22 = a5;
    id v23 = a4;
    id v24 = a3;
    id v25 = a2;
    [v18 setComputePipelineState:v17];
    [v18 setTexture:v25 atIndex:0];

    [v18 setTexture:v23 atIndex:1];
    [v18 setTexture:v21 atIndex:2];

    [v18 setTexture:v19 atIndex:3];
    unint64_t v26 = (unint64_t)[v17 threadExecutionWidth];
    unint64_t v27 = (unint64_t)[v17 maxTotalThreadsPerThreadgroup];
    uint32x2_t v28 = a1[36];
    *(void *)&long long v29 = v28.u32[0];
    *((void *)&v29 + 1) = v28.u32[1];
    long long v42 = v29;
    uint64_t v43 = 1;
    v41[0] = v26;
    v41[1] = v27 / v26;
    v41[2] = 1;
    [v18 dispatchThreads:&v42 threadsPerThreadgroup:v41];
    [v18 setComputePipelineState:v17];
    [v18 setTexture:v24 atIndex:0];

    [v18 setTexture:v22 atIndex:1];
    [v18 setTexture:v20 atIndex:2];

    [v18 setTexture:v37 atIndex:3];
    unint64_t v30 = (unint64_t)[v17 threadExecutionWidth];
    unint64_t v31 = (unint64_t)[v17 maxTotalThreadsPerThreadgroup];
    uint32x2_t v32 = a1[36];
    unint64_t v33 = v31 / v30;

    uint32x2_t v34 = vshr_n_u32(v32, 1uLL);
    *(void *)&long long v29 = v34.u32[0];
    *((void *)&v29 + 1) = v34.u32[1];
    long long v39 = v29;
    uint64_t v40 = 1;
    v38[0] = v30;
    v38[1] = v33;
    v38[2] = 1;
    [v18 dispatchThreads:&v39 threadsPerThreadgroup:v38];
  }
  return 0;
}

uint64_t sub_970C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    id v16 = *(id *)(a1 + 144);
    [v15 setComputePipelineState:v16];
    [v15 setTexture:v11 atIndex:0];
    [v15 setTexture:v13 atIndex:1];
    unint64_t v17 = (unint64_t)[v16 threadExecutionWidth];
    unint64_t v18 = (unint64_t)[v16 maxTotalThreadsPerThreadgroup];
    uint64_t v19 = *(void *)(a1 + 288);
    *(void *)&long long v20 = v19;
    *((void *)&v20 + 1) = HIDWORD(v19);
    long long v32 = v20;
    uint64_t v33 = 1;
    v31[0] = v17;
    v31[1] = v18 / v17;
    v31[2] = 1;
    [v15 dispatchThreads:&v32 threadsPerThreadgroup:v31];
    uint64_t v21 = sub_9C68(a1, v13, *(void **)(a1 + 224), 5, *(_DWORD *)(a1 + 288), *(_DWORD *)(a1 + 292), 1, v15);
    if (v21
      || (uint64_t v21 = sub_9C68(a1, *(void **)(a1 + 224), v13, 5, *(_DWORD *)(a1 + 292), *(_DWORD *)(a1 + 288), 1, v15),
          v21))
    {
      uint64_t v25 = v21;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      id v22 = *(id *)(a1 + 152);

      [v15 setComputePipelineState:v22];
      [v15 setImageblockWidth:32 height:32];
      [v15 setTexture:v12 atIndex:0];
      [v15 setTexture:v11 atIndex:1];
      [v15 setTexture:v13 atIndex:2];
      [v15 setTexture:v14 atIndex:3];
      uint64_t v23 = *(void *)(a1 + 288);
      *(void *)&long long v24 = v23;
      *((void *)&v24 + 1) = HIDWORD(v23);
      long long v29 = v24;
      uint64_t v30 = 1;
      int64x2_t v27 = vdupq_n_s64(0x20uLL);
      uint64_t v28 = 1;
      [v15 dispatchThreads:&v29 threadsPerThreadgroup:&v27];
      uint64_t v25 = 0;
      id v16 = v22;
    }
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

void sub_9B50(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[20];
    a1[20] = 0;

    int v3 = (void *)a1[21];
    a1[21] = 0;

    uint64_t v4 = (void *)a1[22];
    a1[22] = 0;

    uint64_t v5 = (void *)a1[23];
    a1[23] = 0;

    uint64_t v6 = (void *)a1[28];
    a1[28] = 0;

    id v7 = (void *)a1[29];
    a1[29] = 0;

    id v8 = (void *)a1[30];
    a1[30] = 0;

    uint64_t v9 = (void *)a1[31];
    a1[31] = 0;

    uint32x2_t v10 = (void *)a1[26];
    a1[26] = 0;

    id v11 = (void *)a1[27];
    a1[27] = 0;

    id v12 = (void *)a1[24];
    a1[24] = 0;

    id v13 = (void *)a1[25];
    a1[25] = 0;

    id v14 = (void *)a1[32];
    a1[32] = 0;
  }
}

uint64_t sub_9C68(uint64_t a1, void *a2, void *a3, int a4, unsigned int a5, unsigned int a6, int a7, void *a8)
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a8;
  if (!a1) {
    goto LABEL_17;
  }
  if (a7)
  {
    switch(a4)
    {
      case 5:
        uint64_t v18 = 48;
        goto LABEL_16;
      case 21:
        uint64_t v18 = 64;
        goto LABEL_16;
      case 17:
        uint64_t v18 = 56;
LABEL_16:
        id v20 = *(id *)(a1 + v18);
        [v17 setComputePipelineState:v20];
        [v17 setTexture:v15 atIndex:0];
        [v17 setTexture:v16 atIndex:1];
        v23[0] = a5 >> 1;
        v23[1] = a6 >> 1;
        v23[2] = 1;
        v22[0] = [v20 threadExecutionWidth];
        v22[1] = (unint64_t)[v20 maxTotalThreadsPerThreadgroup] / v22[0];
        v22[2] = 1;
        [v17 dispatchThreads:v23 threadsPerThreadgroup:v22];

LABEL_17:
        uint64_t v19 = 0;
        goto LABEL_18;
    }
  }
  else
  {
    switch(a4)
    {
      case 3:
        uint64_t v18 = 24;
        goto LABEL_16;
      case 11:
        uint64_t v18 = 40;
        goto LABEL_16;
      case 9:
        uint64_t v18 = 32;
        goto LABEL_16;
    }
  }
  uint64_t v19 = 4294954516;
LABEL_18:

  return v19;
}

uint64_t sub_A758(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferClearOutputTexture" constants:0];
  int v3 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v2;

  if (!*(void *)(a1 + 32)) {
    goto LABEL_13;
  }
  uint64_t v4 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferTileCutKernel" constants:0];
  uint64_t v5 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = v4;

  if (!*(void *)(a1 + 40)) {
    goto LABEL_13;
  }
  uint64_t v6 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferTileCutInSlicesKernel" constants:0];
  id v7 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v6;

  if (!*(void *)(a1 + 48)) {
    goto LABEL_13;
  }
  uint64_t v8 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferTileMergeKernel" constants:0];
  uint64_t v9 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = v8;

  if (!*(void *)(a1 + 64)
    || ([*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferTilePasteKernel" constants:0], uint64_t v10 = objc_claimAutoreleasedReturnValue(), v11 = *(void **)(a1 + 56), *(void *)(a1 + 56) = v10, v11, !*(void *)(a1 + 56)))
  {
LABEL_13:
    fig_log_get_emitter();
    FigDebugAssert3();
    id v13 = 0;
LABEL_15:
    uint64_t v20 = FigSignalErrorAt();
    goto LABEL_11;
  }
  id v12 = objc_opt_new();
  id v13 = v12;
  if (!v12) {
    goto LABEL_14;
  }
  [v12 setNormalizedCoordinates:1];
  [v13 setMinFilter:1];
  [v13 setMagFilter:1];
  [v13 setSAddressMode:0];
  [v13 setTAddressMode:0];
  id v14 = [*(id *)(a1 + 8) device];
  id v15 = [v14 newSamplerStateWithDescriptor:v13];
  id v16 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v15;

  if (!*(void *)(a1 + 72)) {
    goto LABEL_14;
  }
  [v13 setNormalizedCoordinates:1];
  [v13 setMinFilter:2];
  [v13 setMagFilter:2];
  [v13 setSAddressMode:0];
  [v13 setTAddressMode:0];
  id v17 = [*(id *)(a1 + 8) device];
  id v18 = [v17 newSamplerStateWithDescriptor:v13];
  uint64_t v19 = *(void **)(a1 + 80);
  *(void *)(a1 + 80) = v18;

  if (!*(void *)(a1 + 80))
  {
LABEL_14:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_15;
  }
  uint64_t v20 = 0;
LABEL_11:

  return v20;
}

id sub_AC84(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3)
{
  if (a1)
  {
    int v3 = pixelBuffer;
    CVMetalTextureRef image = 0;
    if (pixelBuffer)
    {
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
      int v5 = PixelFormatType;
      OSType v6 = PixelFormatType - 1278226534;
      BOOL v8 = PixelFormatType == 706956392 || PixelFormatType == 707153000;
      id v9 = objc_alloc((Class)NSMutableArray);
      if ((v6 & 0xFFFFFFFD) == 0 || v5 == 642527336) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 2;
      }
      BOOL v38 = v8;
      unint64_t v34 = v11;
      if (v8) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = v11;
      }
      id v13 = [v9 initWithCapacity:v12];
      if (v13)
      {
        size_t v14 = 0;
        CFDictionaryRef v15 = 0;
        unsigned int v16 = 0;
        CFStringRef v35 = kCVMetalTextureUsage;
        int v33 = v5;
        while (1)
        {
          uint64_t v17 = sub_CB30(a1, v5, v14);
          if (!v17)
          {
            CFDictionaryRef textureAttributes = v15;
            goto LABEL_46;
          }
          MTLPixelFormat v18 = v17;
          unsigned int v37 = v16;
          unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(v3, v14);
          unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(v3, v14);
          CFStringRef v42 = v35;
          uint64_t v21 = +[NSNumber numberWithUnsignedInteger:a3];
          uint64_t v43 = v21;
          CFDictionaryRef textureAttributes = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];

          if (v5 == 707153000 || v5 == 706956392) {
            break;
          }
          if (CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, *(CVMetalTextureCacheRef *)(a1 + 24), v3, textureAttributes, v18, WidthOfPlane, HeightOfPlane, v14, &image))
          {
            goto LABEL_46;
          }
          long long v29 = CVMetalTextureGetTexture(image);
          [v13 setObject:v29 atIndexedSubscript:v37];

          uint64_t v30 = [v13 objectAtIndexedSubscript:v37];

          if (!v30) {
            goto LABEL_46;
          }
          unsigned int v16 = v37 + 1;
          if (image) {
            CFRelease(image);
          }
LABEL_36:
          if (v34 > ++v14 && v5 != 707153000)
          {
            CFDictionaryRef v15 = textureAttributes;
            if (v5 != 706956392) {
              continue;
            }
          }
          id v31 = v13;
          id v13 = v31;
          goto LABEL_40;
        }
        id v22 = v3;
        unint64_t v23 = 0;
        while (!CVMetalTextureCacheCreateTextureFromSliceOfImage())
        {
          long long v24 = CVMetalTextureGetTexture(image);
          uint64_t v25 = v37 + v23;
          objc_msgSend(v13, "setObject:atIndexedSubscript:", v24, v25, v23, &image);

          unint64_t v26 = [v13 objectAtIndexedSubscript:v25];

          if (!v26) {
            break;
          }
          if (image) {
            CFRelease(image);
          }
          int v27 = v23 + 1;
          BOOL v28 = v38;
          if (v23 >= 2) {
            BOOL v28 = 0;
          }
          ++v23;
          if (!v28)
          {
            unsigned int v16 = v37 + v27;
            int v3 = v22;
            int v5 = v33;
            goto LABEL_36;
          }
        }
      }
      else
      {
        CFDictionaryRef textureAttributes = 0;
      }
LABEL_46:
      if (image) {
        CFRelease(image);
      }
      id v31 = 0;
LABEL_40:
    }
    else
    {
      id v31 = 0;
      id v13 = 0;
    }
  }
  else
  {
    id v31 = 0;
  }

  return v31;
}

void sub_B034(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (__CVMetalTextureCache *)a1[3];
    if (v2)
    {
      CVMetalTextureCacheFlush(v2, 0);
      int v3 = (const void *)a1[3];
      if (v3) {
        CFRelease(v3);
      }
    }
    uint64_t v4 = (const void *)a1[12];
    if (v4) {
      CFRelease(v4);
    }
    int v5 = (const void *)a1[14];
    if (v5) {
      CFRelease(v5);
    }
    OSType v6 = (const void *)a1[15];
    if (v6) {
      CFRelease(v6);
    }
    id v7 = (void *)a1[20];
    a1[20] = 0;
  }
}

uint64_t sub_BFF8(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  OSType v6 = v5;
  if (a1)
  {
    memset(v43, 0, 32);
    memset(v42, 0, sizeof(v42));
    if ([v5 count] != (char *)&dword_0 + 2) {
      goto LABEL_8;
    }
    v7.i16[0] = *(_WORD *)(a3 + 28);
    v7.i16[2] = *(_WORD *)(a3 + 30);
    int32x2_t v40 = v7;
    v7.i16[0] = *(_WORD *)a3;
    v7.i16[2] = *(_WORD *)(a3 + 2);
    int32x2_t v38 = v7;
    v7.i16[0] = *(_WORD *)(a3 + 4);
    v7.i16[2] = *(_WORD *)(a3 + 6);
    int32x2_t v36 = v7;
    int v8 = *(_DWORD *)(a3 + 8);
    id v9 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v10 = (void *)a1[17];
    a1[17] = v9;

    if (a1[17])
    {
      int8x8_t v11 = vand_s8((int8x8_t)vadd_s32(vadd_s32(v38, v40), (int32x2_t)vmvn_s8((int8x8_t)v36)), (int8x8_t)0xFFFF0000FFFFLL);
      int8x8_t v12 = vand_s8((int8x8_t)vsub_s32(v38, v36), (int8x8_t)0xFFFF0000FFFFLL);
      unsigned int v39 = v11.i32[0] / (unsigned __int32)v12.i32[0];
      int v41 = v8;
      id v13 = (void *)a1[16];
      int v37 = v11.i32[1] / (unsigned __int32)v12.i32[1];
      size_t v14 = [v6 objectAtIndexedSubscript:0];
      CFDictionaryRef v15 = +[NSNumber numberWithLong:v14];
      unsigned int v16 = [v13 objectForKeyedSubscript:v15];
      FigCFDictionaryGetCGRectIfPresent();

      uint64_t v17 = (void *)a1[16];
      MTLPixelFormat v18 = [v6 objectAtIndexedSubscript:1];
      uint64_t v19 = +[NSNumber numberWithLong:v18];
      uint64_t v20 = [v17 objectForKeyedSubscript:v19];
      FigCFDictionaryGetCGRectIfPresent();

      uint64_t v34 = a1[17];
      CFStringRef v35 = (void *)a1[18];
      int v33 = [v6 objectAtIndexedSubscript:0];
      uint64_t v21 = (void *)a1[16];
      id v22 = [v6 objectAtIndexedSubscript:0];
      unint64_t v23 = +[NSNumber numberWithLong:v22];
      long long v24 = [v21 objectForKeyedSubscript:v23];
      uint64_t v25 = [v6 objectAtIndexedSubscript:1];
      unint64_t v26 = (void *)a1[16];
      int v27 = [v6 objectAtIndexedSubscript:1];
      BOOL v28 = +[NSNumber numberWithLong:v27];
      long long v29 = [v26 objectForKeyedSubscript:v28];
      WORD1(v32) = v37;
      LOWORD(v32) = v39;
      HIDWORD(v32) = v41;
      uint64_t v30 = (uint64_t)objc_msgSend(v35, "computeLocalHomographies:referencePixelBuffer:referenceMetadata:nonReferencePixelBuffer:nonReferenceMetadata:referenceNormalizedCropRectangle:nonReferenceNormalizedCropRectangle:computeLocalHomographiesConfig:tileCount:tileIndex:", v34, v33, v24, v25, v29, v43, v42, a1[11], v32);

      if (!v30)
      {
        if ([(id)a1[17] count] == (char *)&dword_0 + 1) {
          uint64_t v30 = 0;
        }
        else {
          uint64_t v30 = 4294954516;
        }
      }
    }
    else
    {
LABEL_8:
      uint64_t v30 = 4294954516;
    }
  }
  else
  {
    uint64_t v30 = 0;
  }

  return v30;
}

uint64_t sub_CB30(uint64_t result, int a2, int a3)
{
  if (result)
  {
    result = 25;
    if (a2 <= 796419631)
    {
      if (a2 > 706956391)
      {
        if (a2 > 758670895)
        {
          if (a2 != 758670896)
          {
            if (a2 != 762865200)
            {
              int v3 = 792225328;
              goto LABEL_19;
            }
            goto LABEL_28;
          }
LABEL_20:
          BOOL v5 = a3 == 0;
          uint64_t v6 = 30;
          uint64_t v7 = 10;
          goto LABEL_37;
        }
        if (a2 == 706956392) {
          return result;
        }
        int v4 = 707153000;
LABEL_33:
        if (a2 == v4) {
          return result;
        }
        return 0;
      }
      if (a2 <= 644376111)
      {
        if (a2 == 641230384) {
          goto LABEL_20;
        }
        int v4 = 642527336;
        goto LABEL_33;
      }
      if (a2 != 644376112)
      {
        int v8 = 645424688;
LABEL_27:
        if (a2 != v8) {
          return 0;
        }
        goto LABEL_28;
      }
LABEL_35:
      BOOL v5 = a3 == 0;
      uint64_t v6 = 65;
      uint64_t v7 = 25;
      goto LABEL_37;
    }
    if (a2 <= 1751527983)
    {
      if (a2 > 1278226533)
      {
        if (a2 == 1278226534) {
          return 55;
        }
        int v4 = 1278226536;
        goto LABEL_33;
      }
      if (a2 != 796419632)
      {
        int v3 = 875704422;
LABEL_19:
        if (a2 == v3) {
          goto LABEL_20;
        }
        return 0;
      }
    }
    else
    {
      if (a2 <= 2019963439)
      {
        if (a2 != 1751527984)
        {
          int v8 = 1885745712;
          goto LABEL_27;
        }
        goto LABEL_35;
      }
      if (a2 == 2019963440)
      {
        BOOL v5 = a3 == 0;
        uint64_t v6 = 60;
        uint64_t v7 = 20;
LABEL_37:
        if (v5) {
          return v7;
        }
        else {
          return v6;
        }
      }
      if (a2 != 2088265264)
      {
        int v3 = 2084070960;
        goto LABEL_19;
      }
    }
LABEL_28:
    if (a3) {
      return 589;
    }
    else {
      return 588;
    }
  }
  return result;
}

uint64_t sub_D0C8(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 8) computePipelineStateFor:@"DeepZoomTransferCopyOpticalFlowInputRGBFloat16" constants:0];
    int v3 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = v2;

    if (*(void *)(v1 + 16)
      && ([*(id *)(v1 + 8) computePipelineStateFor:@"DeepZoomTransferCopyOpticalFlowInputRGBUint8" constants:0], v4 = objc_claimAutoreleasedReturnValue(), BOOL v5 = *(void **)(v1 + 24), *(void *)(v1 + 24) = v4, v5, *(void *)(v1 + 24)))
    {
      uint64_t v6 = [*(id *)(v1 + 8) computePipelineStateFor:@"DeepZoomTransferCopyOpticalFlowOutput" constants:0];
      uint64_t v7 = *(void **)(v1 + 32);
      *(void *)(v1 + 32) = v6;

      if (*(void *)(v1 + 32)) {
        return 0;
      }
      else {
        return 4294954510;
      }
    }
    else
    {
      return 4294954510;
    }
  }
  return result;
}

uint64_t sub_D184(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  v12[0] = kCVPixelBufferMetalCompatibilityKey;
  v12[1] = kCVPixelBufferIOSurfaceCoreAnimationCompatibilityKey;
  v13[0] = &__kCFBooleanTrue;
  v13[1] = &__kCFBooleanTrue;
  v12[2] = kCVPixelBufferIOSurfacePropertiesKey;
  v13[2] = &__NSDictionary0__struct;
  CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
  uint64_t context = espresso_create_context();
  *(void *)(a1 + 56) = context;
  if (!context || (uint64_t plan = espresso_create_plan(), (*(void *)(a1 + 64) = plan) == 0))
  {
    BOOL v5 = 0;
    goto LABEL_17;
  }
  BOOL v5 = +[NSBundle bundleForClass:objc_opt_class()];
  if (!v5)
  {
LABEL_17:
    uint64_t v6 = 0;
    goto LABEL_18;
  }
  uint64_t v6 = sub_F8F4(a1, @"mrflownet-v2");
  if (v6)
  {
    id v7 = +[NSString stringWithFormat:@"%@/%@", @"/System/Library/ImagingNetworks/", v6];
    [v7 UTF8String];
    int v8 = espresso_plan_add_network();

    if (v8
      || espresso_network_query_quantization_info()
      || (*(void *)(a1 + 88) = 0x30000000400, *(_DWORD *)(a1 + 128) = 4, espresso_plan_build()))
    {
      uint64_t v10 = 4294954514;
    }
    else
    {
      uint64_t v9 = CVPixelBufferCreate(kCFAllocatorDefault, 0x400uLL, 0x300uLL, 0x42475241u, v2, (CVPixelBufferRef *)(a1 + 96));
      if (!v9)
      {
        uint64_t v9 = CVPixelBufferCreate(kCFAllocatorDefault, 0x400uLL, 0x300uLL, 0x42475241u, v2, (CVPixelBufferRef *)(a1 + 104));
        if (!v9) {
          uint64_t v9 = CVPixelBufferCreate(kCFAllocatorDefault, 0x100uLL, 0x180uLL, 0x4C303068u, v2, (CVPixelBufferRef *)(a1 + 112));
        }
      }
      uint64_t v10 = v9;
    }
    goto LABEL_13;
  }
LABEL_18:
  uint64_t v10 = 4294954510;
LABEL_13:

  return v10;
}

uint64_t sub_E204(uint64_t a1, __CVBuffer *a2, uint64_t a3, __CVBuffer *a4, void *a5, float64x2_t *a6, float64x2_t *a7, unsigned __int16 a8)
{
  id v14 = a5;
  if (!a1)
  {
    uint64_t v16 = 0;
    goto LABEL_27;
  }
  v78[0] = kCVPixelBufferMetalCompatibilityKey;
  v78[1] = kCVPixelBufferIOSurfaceCoreAnimationCompatibilityKey;
  v79[0] = &__kCFBooleanTrue;
  v79[1] = &__kCFBooleanTrue;
  v78[2] = kCVPixelBufferIOSurfacePropertiesKey;
  v79[2] = &__NSDictionary0__struct;
  CFDictionaryRef pixelBufferAttributes = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:3];
  CFDictionaryRef v15 = 0;
  uint64_t v16 = 4294954516;
  if (!a2 || !a3 || !a4 || !v14 || !a6 || !a7) {
    goto LABEL_24;
  }
  __n128 v73 = (__n128)matrix_identity_float3x3.columns[1];
  __n128 v74 = (__n128)matrix_identity_float3x3.columns[0];
  __n128 v72 = (__n128)matrix_identity_float3x3.columns[2];
  uint64_t v17 = [v14 objectForKeyedSubscript:kFigCaptureSampleBufferMetadata_StillImageProcessingMetadata];
  CFDictionaryRef v15 = [v17 objectForKeyedSubscript:kFigCaptureStillImageProcessingMetadataKey_RegistrationHomography];

  __n128 v77 = v74;
  __n128 v76 = v73;
  __n128 v75 = v72;
  if (v15)
  {
    unint64_t v65 = [v15 objectAtIndexedSubscript:0];
    [v65 floatValue];
    v77.n128_u64[0] = v18;
    v64 = [v15 objectAtIndexedSubscript:3];
    [v64 floatValue];
    v76.n128_u64[0] = v19;
    v63 = [v15 objectAtIndexedSubscript:6];
    [v63 floatValue];
    v75.n128_u64[0] = v20;
    BOOL v62 = [v15 objectAtIndexedSubscript:1];
    [v62 floatValue];
    unsigned __int32 v60 = v21;
    [v15 objectAtIndexedSubscript:4];
    id v22 = v66 = a2;
    [v22 floatValue];
    unsigned __int32 v61 = v23;
    [v15 objectAtIndexedSubscript:7];
    long long v24 = v68 = a7;
    [v24 floatValue];
    unsigned __int32 v59 = v25;
    [v15 objectAtIndexedSubscript:2];
    unint64_t v26 = v67 = a6;
    [v26 floatValue];
    unsigned __int32 v57 = v27;
    BOOL v28 = [v15 objectAtIndexedSubscript:5];
    [v28 floatValue];
    unsigned __int32 v58 = v29;
    [v15 objectAtIndexedSubscript:8];
    id v31 = v30 = v14;
    [v31 floatValue];
    __n128 v32 = v77;
    v32.n128_u32[1] = v60;
    v32.n128_u32[2] = v57;
    __n128 v77 = v32;
    __n128 v33 = v75;
    v33.n128_u32[1] = v59;
    v33.n128_u32[2] = v34;
    __n128 v75 = v33;
    __n128 v35 = v76;
    v35.n128_u32[1] = v61;
    v35.n128_u32[2] = v58;
    __n128 v76 = v35;

    id v14 = v30;
    a6 = v67;

    a7 = v68;
    a2 = v66;
  }
  size_t Width = CVPixelBufferGetWidth(a4);
  float64_t v69 = a7[1].f64[0];
  size_t Height = CVPixelBufferGetHeight(a4);
  v38.i64[0] = Width;
  v38.i64[1] = Height;
  v39.f64[0] = v69;
  v39.f64[1] = a7[1].f64[1];
  float64x2_t v40 = vmulq_f64(v39, vcvtq_f64_f32(vcvt_f32_f64(vcvtq_f64_u64(v38))));
  __asm { FMOV            V1.2D, #0.5 }
  uint32x2_t v46 = vcvt_n_u32_f32(vrnda_f32(vcvt_f32_f64(vmulq_f64(v40, _Q1))), 1uLL);
  if (v46.i32[0] < (unsigned __int32)v46.i32[1])
  {
    uint64_t v16 = 4294954516;
LABEL_24:
    uint64_t v55 = *(const void **)(a1 + 120);
    if (v55)
    {
      CFRelease(v55);
      *(void *)(a1 + 120) = 0;
    }
    goto LABEL_26;
  }
  float v47 = (float)v46.u32[1] / (float)v46.u32[0];
  unsigned int v48 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 96));
  int v50 = (CVPixelBufferRef *)(a1 + 120);
  unsigned __int16 v49 = *(__CVBuffer **)(a1 + 120);
  size_t v51 = ((v48 / *(_DWORD *)(a1 + 128) / a8) & 0xFFFFFFFE) * a8;
  float v52 = roundf((float)(v47 * (float)v51) * 0.5);
  size_t v53 = (float)(v52 + v52);
  if (v49)
  {
    if (CVPixelBufferGetWidth(v49) == v51 && CVPixelBufferGetHeight(*v50) == v53) {
      goto LABEL_17;
    }
    if (*v50)
    {
      CFRelease(*v50);
      *int v50 = 0;
    }
  }
  uint64_t v54 = CVPixelBufferCreate(kCFAllocatorDefault, v51, v53, 0x32433068u, pixelBufferAttributes, (CVPixelBufferRef *)(a1 + 120));
  if (v54)
  {
LABEL_29:
    uint64_t v16 = v54;
    goto LABEL_24;
  }
LABEL_17:
  uint64_t v54 = sub_FCD0(a1, a2, *(__CVBuffer **)(a1 + 96), a6, v74, v73, v72);
  if (v54) {
    goto LABEL_29;
  }
  uint64_t v54 = sub_FCD0(a1, a4, *(__CVBuffer **)(a1 + 104), a7, v77, v76, v75);
  if (v54) {
    goto LABEL_29;
  }
  if (espresso_network_bind_direct_cvpixelbuffer()
    || espresso_network_bind_direct_cvpixelbuffer()
    || espresso_network_bind_direct_cvpixelbuffer()
    || espresso_plan_execute_sync())
  {
    uint64_t v16 = 4294954514;
    goto LABEL_24;
  }
  uint64_t v16 = sub_10134(a1);
  if (v16) {
    goto LABEL_24;
  }
LABEL_26:

LABEL_27:
  return v16;
}

uint64_t sub_E728(uint64_t a1, uint64_t a2, unsigned int a3, unsigned __int16 a4, unsigned int a5, uint64_t a6, unsigned int a7, void *a8)
{
  id v15 = a8;
  int v67 = v15;
  if (a1)
  {
    uint64_t v16 = v15;
    uint64_t v17 = (unsigned __int16)a5;
    unsigned int v18 = HIWORD(a5);
    float v19 = 0.0;
    if (a5 >= 0x10000)
    {
      int v20 = 0;
      if (v18 <= 1) {
        int v21 = 1;
      }
      else {
        int v21 = HIWORD(a5);
      }
      uint64_t v22 = a6;
      do
      {
        if ((_WORD)a5)
        {
          uint64_t v23 = 0;
          do
          {
            _H0 = fabsl(*(short float *)(v22 + v23));
            __asm { FCVT            S0, H0 }
            if (v19 < _S0) {
              float v19 = _S0;
            }
            v23 += 4;
          }
          while (4 * (unsigned __int16)a5 != v23);
        }
        ++v20;
        v22 += a7 & 0xFFFFFFFE;
      }
      while (v20 != v21);
    }
    uint64_t v66 = a2;
    id v30 = [v15 dxPoints];
    uint64_t v31 = [v16 dyPoints];
    __n128 v33 = (void *)v31;
    uint64_t v34 = 4294954516;
    if (v30 && v31)
    {
      v35.f32[0] = (float)(unsigned __int16)a3;
      v35.f32[1] = (float)HIWORD(a3);
      __asm { FMOV            V1.2S, #1.0 }
      float16x4_t v37 = (float16x4_t)vdiv_f32(_D1, v35);
      float32x2_t v69 = (float32x2_t)v37;
      if (a5 >= 0x10000)
      {
        int v39 = 0;
        float v40 = (float)a4;
        float v41 = ceilf((float)(v19 * *(float *)v37.i32) * v40);
        uint64_t v68 = a7 >> 1;
        if (v18 <= 1) {
          unsigned int v18 = 1;
        }
        float32x2_t v38 = 0;
        *(void *)&long long v32 = 0;
        do
        {
          if (v17)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              v37.i32[0] = *(_DWORD *)(a6 + 4 * i);
              long long v70 = v32;
              float32x2_t v71 = (float32x2_t)vcvtq_f32_f16(v37).u64[0];
              int v43 = [v30 count];
              v37.i32[0] = 1.0;
              if (v43 < 2)
              {
                long long v32 = v70;
                float32x2_t v59 = v71;
              }
              else
              {
                float v44 = (float)(int)fabsf(v40 * vmul_f32(v69, v71).f32[0]) / v41;
                uint64_t v45 = (v43 - 2);
                while (1)
                {
                  uint32x2_t v46 = [v30 objectAtIndexedSubscript:v45];
                  [v46 floatValue];
                  float v48 = v47;

                  unsigned __int16 v49 = [v30 objectAtIndexedSubscript:v45 + 1];
                  [v49 floatValue];
                  float v51 = v50;

                  float v52 = [v33 objectAtIndexedSubscript:v45];
                  [v52 floatValue];
                  float v54 = v53;

                  uint64_t v55 = [v33 objectAtIndexedSubscript:v45 + 1];
                  [v55 floatValue];
                  float v57 = v56;

                  if (v44 > v48) {
                    break;
                  }
                  if (v45-- < 1)
                  {
                    long long v32 = v70;
                    float32x2_t v59 = v71;
                    v37.i32[0] = 1.0;
                    goto LABEL_33;
                  }
                }
                long long v32 = v70;
                if (v54 >= v57)
                {
                  *(float *)v37.i32 = v54;
                  float32x2_t v59 = v71;
                  if (v54 > v57)
                  {
                    float v61 = fminf(fmaxf((float)(v44 - v48) / (float)(v51 - v48), 0.0), 1.0);
                    *(float *)v37.i32 = v57
                                      + (float)((float)(v54 - v57)
                                              * (float)(1.0
                                                      - (float)((float)(v61 * v61) * (float)((float)(v61 * -2.0) + 3.0))));
                  }
                }
                else
                {
                  float v60 = fminf(fmaxf((float)(v44 - v48) / (float)(v51 - v48), 0.0), 1.0);
                  *(float *)v37.i32 = v54
                                    + (float)((float)(v57 - v54)
                                            * (float)((float)(v60 * v60) * (float)((float)(v60 * -2.0) + 3.0)));
                  float32x2_t v59 = v71;
                }
              }
LABEL_33:
              float32x2_t v38 = vmla_n_f32(v38, v59, *(float *)v37.i32);
              *(float *)&long long v32 = *(float *)&v32 + *(float *)v37.i32;
            }
          }
          a6 += 2 * v68;
          ++v39;
        }
        while (v39 != v18);
      }
      else
      {
        *(void *)&long long v32 = 0;
        float32x2_t v38 = 0;
      }
      simd_float3 v63 = matrix_identity_float3x3.columns[0];
      simd_float3 v62 = matrix_identity_float3x3.columns[1];
      __int32 v64 = matrix_identity_float3x3.columns[0].i32[3];
      if (fabsf(*(float *)&v32) > 1.0e-10)
      {
        *(float32x2_t *)&v63.u32[2] = vmul_f32(v69, vdiv_f32(v38, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v32, 0)));
        v62.i32[2] = v63.i32[3];
      }
      uint64_t v34 = 0;
      *(_DWORD *)(v66 + 8) = v63.i32[2];
      *(void *)uint64_t v66 = v63.i64[0];
      *(_DWORD *)(v66 + 24) = v62.i32[2];
      *(_DWORD *)(v66 + 12) = v64;
      *(void *)(v66 + 16) = v62.i64[0];
      *(simd_float3 *)(v66 + 28) = *(simd_float3 *)((char *)&matrix_identity_float3x3.columns[1] + 12);
      *(_DWORD *)(v66 + 44) = matrix_identity_float3x3.columns[2].i32[3];
    }
  }
  else
  {
    uint64_t v34 = 0;
  }

  return v34;
}

uint64_t sub_EAF0(uint64_t a1, float32x4_t *a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6, unsigned int a7, float a8)
{
  if (!a1) {
    return 0;
  }
  int v8 = 0;
  uint64_t v9 = 4294954516;
  if (!a2 || !a3 || !a4) {
    goto LABEL_60;
  }
  int8x8_t v12 = 0;
  id v13 = 0;
  id v14 = 0;
  id v15 = 0;
  if (!a7) {
    goto LABEL_53;
  }
  int v8 = 0;
  if (!a6 || a5 < 0x10000)
  {
LABEL_60:
    int8x8_t v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    goto LABEL_53;
  }
  int8x8_t v12 = 0;
  id v13 = 0;
  id v14 = 0;
  id v15 = 0;
  int v17 = (unsigned __int16)a5;
  if (!(_WORD)a5) {
    goto LABEL_53;
  }
  size_t v21 = 16 * a7;
  id v15 = (char *)malloc_type_malloc(v21, 0x1000040451B5BE8uLL);
  if (!v15)
  {
    int v8 = 0;
    int8x8_t v12 = 0;
    id v13 = 0;
    id v14 = 0;
LABEL_63:
    uint64_t v9 = 4294954510;
    goto LABEL_53;
  }
  id v14 = (char *)malloc_type_malloc(v21, 0x1000040451B5BE8uLL);
  if (!v14)
  {
    int v8 = 0;
    int8x8_t v12 = 0;
    id v13 = 0;
    goto LABEL_63;
  }
  int v24 = 0;
  int v25 = 0;
  int v26 = HIWORD(a5);
  if (HIWORD(a5) <= 1u) {
    int v26 = 1;
  }
  unsigned __int32 v27 = (id *)a1;
  do
  {
    unsigned int v28 = v25 * a6;
    int v29 = v17;
    do
    {
      unsigned int v30 = v28;
      uint64_t v31 = (long long *)(a3 + 16 * v28);
      long long v32 = *v31;
      if (COERCE_FLOAT(*((void *)v31 + 1)) >= a8)
      {
        __n128 v33 = (long long *)(a4 + 16 * v28);
        if (*((float *)v33 + 2) >= a8)
        {
          uint64_t v34 = &v15[16 * v24];
          LODWORD(v35) = *v31;
          HIDWORD(v35) = HIDWORD(*(void *)v34);
          *((_DWORD *)v34 + 2) = *((void *)v34 + 1);
          *(void *)uint64_t v34 = v35;
          DWORD1(v32) = *((_DWORD *)v31 + 1);
          *((_DWORD *)v34 + 2) = 1065353216;
          *(void *)uint64_t v34 = v32;
          long long v36 = *v33;
          float16x4_t v37 = &v14[16 * v24];
          long long v38 = *v33;
          DWORD1(v38) = HIDWORD(*(void *)v37);
          *((_DWORD *)v37 + 2) = *((void *)v37 + 1);
          *(void *)float16x4_t v37 = v38;
          DWORD1(v36) = *((_DWORD *)v33 + 1);
          *((_DWORD *)v37 + 2) = 1065353216;
          *(void *)float16x4_t v37 = v36;
          ++v24;
        }
      }
      unsigned int v28 = v30 + 1;
      --v29;
    }
    while (v29);
    ++v25;
  }
  while (v25 != v26);
  unsigned int v39 = a7;
  if (v24 != a7)
  {
    int v8 = 0;
    int8x8_t v12 = 0;
    id v13 = 0;
    uint64_t v9 = 4294954514;
    goto LABEL_53;
  }
  uint64_t v40 = 0;
  uint64_t v41 = 16 * a7;
  float32x2_t v42 = 0;
  float32x2_t v43 = 0;
  do
  {
    float32x2_t v42 = vadd_f32(v42, *(float32x2_t *)&v15[v40]);
    float32x2_t v43 = vadd_f32(v43, *(float32x2_t *)&v14[v40]);
    v40 += 16;
  }
  while (v41 != v40);
  v104 = a2;
  uint64_t v44 = 0;
  long long v45 = xmmword_17DE0;
  *(float *)v22.i32 = (float)a7;
  float32x2_t v46 = (float32x2_t)vdup_lane_s32(v22, 0);
  float32x2_t v47 = vdiv_f32(v42, v46);
  float32x2_t v48 = vdiv_f32(v43, v46);
  *(float *)&unsigned int v49 = -v47.f32[0];
  *(float *)&unsigned int v50 = -v47.f32[1];
  long long v51 = xmmword_17DE0;
  DWORD2(v51) = v49;
  float32x4_t v101 = (float32x4_t)v51;
  v23.i32[0] = 0;
  v23.i32[1] = 1.0;
  __asm { FMOV            V0.4S, #1.0 }
  v57.i64[1] = _Q0.i64[1];
  v57.i64[0] = __PAIR64__(v50, v49);
  float32x4_t v58 = (float32x4_t)v23;
  v58.i32[2] = v50;
  float32x4_t v100 = v58;
  *((float *)&v45 + 2) = -v48.f32[0];
  v23.i64[1] = COERCE_UNSIGNED_INT(-v48.f32[1]);
  simd_float3 v102 = v23;
  simd_float3 v103 = (simd_float3)v45;
  do
  {
    *(float32x4_t *)&v15[v44] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_17DE0, COERCE_FLOAT(*(_OWORD *)&v15[v44])), (float32x4_t)xmmword_17DF0, *(float32x2_t *)&v15[v44], 1), v57, *(float32x4_t *)&v15[v44], 2);
    _Q0.f32[1] = -v48.f32[1];
    _Q0.f32[0] = -v48.f32[0];
    *(float32x4_t *)&v14[v44] = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_17DE0, COERCE_FLOAT(*(_OWORD *)&v14[v44])), (float32x4_t)xmmword_17DF0, *(float32x2_t *)&v14[v44], 1), _Q0, *(float32x4_t *)&v14[v44], 2);
    v44 += 16;
  }
  while (v41 != v44);
  id v114 = 0;
  v111 = 0;
  int v59 = 0;
  uint64_t v60 = 0;
  *(_DWORD *)(a1 + 152) = 1;
  simd_float3 v106 = matrix_identity_float3x3.columns[1];
  simd_float3 v107 = matrix_identity_float3x3.columns[0];
  simd_float3 v105 = matrix_identity_float3x3.columns[2];
  memset(v119, 0, sizeof(v119));
  do
  {
    int32x4_t v117 = 0u;
    simd_float3 v118 = 0u;
    int32x4_t v116 = 0u;
    sub_103B0((uint64_t)v27, (uint64_t)v119, v39);
    if (v27[18])
    {
      uint64_t v61 = v60;
      id v13 = (char *)malloc_type_malloc(0x48uLL, 0x10000403E1C8BA9uLL);
      if (v13)
      {
        simd_float3 v62 = (char *)malloc_type_malloc(0x48uLL, 0x10000403E1C8BA9uLL);
        if (v62)
        {
          simd_float3 v63 = v62;
          __int32 v64 = (int *)v119;
          for (uint64_t i = 8; i != 80; i += 12)
          {
            int v66 = *v64++;
            int v67 = &v15[16 * v66];
            uint64_t v68 = &v13[i];
            *((_DWORD *)v68 - 2) = *(_DWORD *)v67;
            *((_DWORD *)v68 - 1) = *((_DWORD *)v67 + 1);
            *(_DWORD *)uint64_t v68 = 1065353216;
            float32x2_t v69 = &v14[16 * v66];
            long long v70 = &v62[i];
            *((_DWORD *)v70 - 2) = *(_DWORD *)v69;
            *((_DWORD *)v70 - 1) = *((_DWORD *)v69 + 1);
            *(_DWORD *)long long v70 = 1065353216;
          }
          uint64_t v9 = (uint64_t)[v27[18] computeHomography:&v116 referenceKeypoints:v13 nonReferenceKeypoints:v62 keypointsCount:6];
          free(v13);
          free(v63);
          uint64_t v60 = v61;
          if (v9) {
            goto LABEL_56;
          }
          goto LABEL_38;
        }
      }
      int8x8_t v12 = v114;
LABEL_58:
      uint64_t v9 = 4294954510;
      goto LABEL_52;
    }
    float32x2_t v71 = [v27[1] device];
    id v72 = [v71 newBufferWithLength:96 options:0];

    if (!v72)
    {
      int8x8_t v12 = 0;
      id v13 = 0;
      goto LABEL_58;
    }
    __n128 v73 = [v27[1] device];
    id v74 = [v73 newBufferWithLength:96 options:0];

    if (!v74)
    {
      v111 = 0;
      id v13 = 0;
      uint64_t v9 = 4294954510;
      int8x8_t v12 = v72;
      goto LABEL_52;
    }
    id v114 = v72;
    __n128 v75 = (char *)[v114 contents];
    id v76 = v74;
    __n128 v77 = (char *)[v76 contents];
    uint64_t v78 = 0;
    int v79 = (int *)v119;
    do
    {
      int v80 = *v79++;
      v81 = &v15[16 * v80];
      LODWORD(v82) = *(_OWORD *)v81;
      v83 = &v75[v78];
      *(_DWORD *)v83 = v82;
      HIDWORD(v82) = *((_DWORD *)v81 + 1);
      *(void *)v83 = v82;
      *((_DWORD *)v83 + 2) = 1065353216;
      char v84 = &v14[16 * v80];
      long long v85 = *(_OWORD *)v84;
      v86 = &v77[v78];
      *(_DWORD *)v86 = *(_OWORD *)v84;
      DWORD1(v85) = *((_DWORD *)v84 + 1);
      *(void *)v86 = v85;
      *((_DWORD *)v86 + 2) = 1065353216;
      v78 += 16;
    }
    while (v78 != 96);
    v111 = v76;
    uint64_t v9 = (uint64_t)[v27[17] computeHomography:&v116 referenceKeypoints:v114 nonReferenceKeypoints:v76 keypointsCount:6];
    unsigned int v39 = a7;
    if (v9)
    {
LABEL_56:
      int8x8_t v12 = v114;
      id v13 = 0;
      goto LABEL_52;
    }
LABEL_38:
    uint64_t v87 = 0;
    LODWORD(v88) = 0;
    float32x4_t v89 = (float32x4_t)vzip1q_s32(v116, v117);
    float32x4_t v90 = (float32x4_t)vzip2q_s32(vzip1q_s32(v116, (int32x4_t)v118), vdupq_lane_s32(*(int32x2_t *)v117.i8, 1));
    float32x4_t v91 = (float32x4_t)vzip2q_s32(v116, v117);
    v91.i32[2] = v118.i32[2];
    do
    {
      v89.i32[2] = v118.i32[0];
      float32x4_t v92 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v89, COERCE_FLOAT(*(_OWORD *)&v15[v87])), v90, *(float32x2_t *)&v15[v87], 1), v91, *(float32x4_t *)&v15[v87], 2);
      float32x4_t v93 = vsubq_f32(vdivq_f32(v92, (float32x4_t)vdupq_laneq_s32((int32x4_t)v92, 2)), *(float32x4_t *)&v14[v87]);
      float32x4_t v94 = vmulq_f32(v93, v93);
      if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v94, 2), vaddq_f32(v94, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v94.f32, 1))).f32[0]) >= 0.0067964)uint64_t v88 = v88; {
      else
      }
        uint64_t v88 = (v88 + 1);
      v87 += 16;
    }
    while (v41 != v87);
    unsigned __int32 v27 = (id *)a1;
    if (v88 > v60)
    {
      simd_float3 v106 = (simd_float3)v117;
      simd_float3 v107 = (simd_float3)v116;
      simd_float3 v105 = v118;
      if ((float)((float)v88 / (float)a7) > 0.95) {
        break;
      }
      uint64_t v60 = v88;
    }
    ++v59;
  }
  while (v59 != 50);
  uint64_t v95 = 0;
  v115.columns[0] = v107;
  v115.columns[1] = v106;
  v115.columns[2] = v105;
  int32x4_t v116 = 0u;
  int32x4_t v117 = 0u;
  simd_float3 v118 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v116 + v95 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v101, COERCE_FLOAT(*(_OWORD *)&v115.columns[v95])), v100, *(float32x2_t *)v115.columns[v95].f32, 1), (float32x4_t)xmmword_17E00, (float32x4_t)v115.columns[v95], 2);
    ++v95;
  }
  while (v95 != 3);
  int8x8_t v12 = v114;
  float32x4_t v113 = (float32x4_t)v116;
  float32x4_t v108 = (float32x4_t)v118;
  float32x4_t v110 = (float32x4_t)v117;
  v120.columns[2] = (simd_float3)xmmword_17E00;
  v120.columns[1] = v102;
  v120.columns[0] = v103;
  simd_float3x3 v121 = __invert_f3(v120);
  uint64_t v96 = 0;
  simd_float3x3 v115 = v121;
  int32x4_t v116 = 0u;
  int32x4_t v117 = 0u;
  simd_float3 v118 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v116 + v96 * 16) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v113, COERCE_FLOAT(*(_OWORD *)&v115.columns[v96])), v110, *(float32x2_t *)v115.columns[v96].f32, 1), v108, (float32x4_t)v115.columns[v96], 2);
    ++v96;
  }
  while (v96 != 3);
  id v13 = 0;
  uint64_t v9 = 0;
  float32x4_t v97 = vmulq_n_f32((float32x4_t)v117, 1.0 / v118.f32[2]);
  float32x4_t v98 = vmulq_n_f32((float32x4_t)v118, 1.0 / v118.f32[2]);
  float32x4_t *v104 = vmulq_n_f32((float32x4_t)v116, 1.0 / v118.f32[2]);
  v104[1] = v97;
  v104[2] = v98;
LABEL_52:
  int v8 = v111;
LABEL_53:
  free(v15);
  free(v14);
  free(v13);

  return v9;
}

uint64_t sub_F2E8(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    CFDictionaryRef v2 = *(__CVMetalTextureCache **)(result + 40);
    if (v2)
    {
      CVMetalTextureCacheFlush(v2, 0);
      int v3 = *(const void **)(v1 + 40);
      if (v3)
      {
        CFRelease(v3);
        *(void *)(v1 + 40) = 0;
      }
    }
    return sub_F344(v1);
  }
  return result;
}

uint64_t sub_F344(uint64_t result)
{
  if (!result) {
    return result;
  }
  uint64_t v1 = (void *)result;
  [*(id *)(result + 8) waitForIdle];
  if (v1[8])
  {
    if (espresso_plan_destroy()) {
      return 4294954514;
    }
    v1[8] = 0;
  }
  if (v1[7])
  {
    if (!espresso_context_destroy())
    {
      v1[7] = 0;
      goto LABEL_8;
    }
    return 4294954514;
  }
LABEL_8:
  CFDictionaryRef v2 = (const void *)v1[12];
  if (v2)
  {
    CFRelease(v2);
    v1[12] = 0;
  }
  int v3 = (const void *)v1[13];
  if (v3)
  {
    CFRelease(v3);
    v1[13] = 0;
  }
  uint64_t v4 = (const void *)v1[14];
  if (v4)
  {
    CFRelease(v4);
    v1[14] = 0;
  }
  result = v1[15];
  if (result)
  {
    CFRelease((CFTypeRef)result);
    result = 0;
    v1[15] = 0;
  }
  return result;
}

id sub_F3E8(uint64_t a1, __CVBuffer *a2, uint64_t a3)
{
  if (a1)
  {
    CVMetalTextureRef image = 0;
    if (a2)
    {
      id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
      if (v5)
      {
        signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
        int v7 = PixelFormatType;
        uint64_t v26 = 2;
        if (PixelFormatType > 1278226533)
        {
          if (PixelFormatType == 1278226536) {
            goto LABEL_10;
          }
          int v8 = 1278226534;
        }
        else
        {
          if (PixelFormatType == 843264104) {
            goto LABEL_10;
          }
          int v8 = 1111970369;
        }
        if (PixelFormatType != v8)
        {
LABEL_11:
          if (PixelFormatType == 640823400 || PixelFormatType == 642527336 || PixelFormatType == 641877825) {
            uint64_t v26 = 1;
          }
          size_t v9 = 0;
          CFDictionaryRef v10 = 0;
          CFStringRef v24 = kCVMetalTextureUsage;
          signed int v23 = PixelFormatType;
          while (1)
          {
            uint64_t v11 = sub_F6E4(a1, v7, v9);
            if (!v11) {
              break;
            }
            MTLPixelFormat v12 = v11;
            unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a2, v9);
            unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a2, v9);
            CFStringRef v28 = v24;
            id v15 = +[NSNumber numberWithUnsignedInteger:a3];
            int v29 = v15;
            CFDictionaryRef v16 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];

            CVReturn v17 = CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, *(CVMetalTextureCacheRef *)(a1 + 40), a2, v16, v12, WidthOfPlane, HeightOfPlane, v9, &image);
            CVMetalTextureRef v18 = image;
            if (v17) {
              goto LABEL_27;
            }
            float v19 = CVMetalTextureGetTexture(image);
            [v5 setObject:v19 atIndexedSubscript:v9];

            int v20 = [v5 objectAtIndexedSubscript:v9];

            CVMetalTextureRef v18 = image;
            if (!v20)
            {
LABEL_27:
              CFDictionaryRef v10 = v16;
              if (!v18) {
                goto LABEL_29;
              }
              goto LABEL_28;
            }
            if (image) {
              CFRelease(image);
            }
            ++v9;
            CFDictionaryRef v10 = v16;
            int v7 = v23;
            if (v26 == v9)
            {
              id v21 = v5;
              id v5 = v21;
              goto LABEL_23;
            }
          }
          CVMetalTextureRef v18 = image;
          if (image) {
LABEL_28:
          }
            CFRelease(v18);
LABEL_29:
          id v21 = 0;
          CFDictionaryRef v16 = v10;
          goto LABEL_23;
        }
LABEL_10:
        uint64_t v26 = 1;
        goto LABEL_11;
      }
      id v21 = 0;
    }
    else
    {
      id v21 = 0;
      id v5 = 0;
    }
    CFDictionaryRef v16 = 0;
LABEL_23:

    goto LABEL_24;
  }
  id v21 = 0;
LABEL_24:

  return v21;
}

uint64_t sub_F6E4(uint64_t result, int a2, int a3)
{
  if (result)
  {
    result = 80;
    if (a2 > 843264103)
    {
      if (a2 > 1751527983)
      {
        if (a2 > 2019963439)
        {
          if (a2 == 2019963440)
          {
            BOOL v5 = a3 == 0;
            uint64_t v6 = 60;
            uint64_t v7 = 20;
LABEL_41:
            if (v5) {
              return v7;
            }
            else {
              return v6;
            }
          }
          if (a2 != 2088265264)
          {
            int v4 = 2084070960;
            goto LABEL_29;
          }
          goto LABEL_34;
        }
        if (a2 == 1751527984)
        {
LABEL_38:
          BOOL v5 = a3 == 0;
          uint64_t v6 = 65;
          uint64_t v7 = 25;
          goto LABEL_41;
        }
        int v3 = 1885745712;
        goto LABEL_33;
      }
      if (a2 > 1111970368)
      {
        if (a2 == 1111970369) {
          return result;
        }
        if (a2 == 1278226534) {
          return 55;
        }
        if (a2 != 1278226536) {
          return 0;
        }
        return 25;
      }
      if (a2 == 843264104) {
        return 65;
      }
      int v4 = 875704422;
    }
    else
    {
      if (a2 <= 645424687)
      {
        if (a2 > 641877824)
        {
          if (a2 == 641877825) {
            return result;
          }
          if (a2 != 642527336)
          {
            if (a2 != 644376112) {
              return 0;
            }
            goto LABEL_38;
          }
          return 25;
        }
        if (a2 != 640823400)
        {
          int v4 = 641230384;
          goto LABEL_29;
        }
        return 65;
      }
      if (a2 > 762865199)
      {
        if (a2 != 762865200)
        {
          if (a2 == 792225328)
          {
LABEL_30:
            BOOL v5 = a3 == 0;
            uint64_t v6 = 30;
            uint64_t v7 = 10;
            goto LABEL_41;
          }
          int v3 = 796419632;
LABEL_33:
          if (a2 != v3) {
            return 0;
          }
        }
LABEL_34:
        if (a3) {
          return 589;
        }
        else {
          return 588;
        }
      }
      if (a2 == 645424688) {
        goto LABEL_34;
      }
      int v4 = 758670896;
    }
LABEL_29:
    if (a2 == v4) {
      goto LABEL_30;
    }
    return 0;
  }
  return result;
}

id sub_F8F4(uint64_t a1, void *a2)
{
  id v31 = a2;
  if (a1)
  {
    int v3 = +[NSMutableArray array];
    if (v3)
    {
      int v4 = +[NSFileManager defaultManager];
      id v5 = [v4 contentsOfDirectoryAtPath:@"/System/Library/ImagingNetworks/" error:0];

      if (v5)
      {
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v5 = v5;
        id v6 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v37 != v8) {
                objc_enumerationMutation(v5);
              }
              CFDictionaryRef v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              if ([v10 hasSuffix:@".net"]) {
                [v3 addObject:v10];
              }
            }
            id v7 = [v5 countByEnumeratingWithState:&v36 objects:v41 count:16];
          }
          while (v7);
        }

        uint64_t v11 = (void *)FigCapturePlatformIdentifierString();
        if (v11)
        {
          ModelSpecificName = (void *)FigCaptureGetModelSpecificName();
          if (ModelSpecificName)
          {
            id v13 = +[NSString stringWithFormat:@"^.+(\\.|_)(%@|%@)(\\.|_).+$", v11, ModelSpecificName];
            if (FigCapturePlatformGetVariant() == 3)
            {
              id v14 = +[NSString stringWithFormat:@"^.+(\\.|_)(%@G|%@)(\\.|_).+$", v11, ModelSpecificName];
            }
            else
            {
              id v14 = v13;
            }
            id v15 = v14;
            id v16 = [objc_alloc((Class)NSRegularExpression) initWithPattern:v13 options:1 error:0];
            id v17 = [objc_alloc((Class)NSRegularExpression) initWithPattern:v15 options:1 error:0];
            CVMetalTextureRef v18 = v17;
            id v19 = 0;
            if (v16 && v17)
            {
              long long v34 = 0u;
              long long v35 = 0u;
              long long v32 = 0u;
              long long v33 = 0u;
              id obj = v3;
              id v19 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
              if (v19)
              {
                unsigned __int32 v27 = v15;
                CFStringRef v28 = v13;
                int v29 = v11;
                uint64_t v20 = *(void *)v33;
                while (2)
                {
                  for (j = 0; j != v19; j = (char *)j + 1)
                  {
                    if (*(void *)v33 != v20) {
                      objc_enumerationMutation(obj);
                    }
                    int32x2_t v22 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
                    if ([v22 hasSuffix:@".bundle"]) {
                      signed int v23 = v18;
                    }
                    else {
                      signed int v23 = v16;
                    }
                    id v24 = v23;
                    if ([v22 hasPrefix:v31]
                      && objc_msgSend(v24, "numberOfMatchesInString:options:range:", v22, 0, 0, objc_msgSend(v22, "length")))
                    {
                      id v19 = v22;

                      goto LABEL_34;
                    }
                  }
                  id v19 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
                  if (v19) {
                    continue;
                  }
                  break;
                }
LABEL_34:
                id v13 = v28;
                uint64_t v11 = v29;
                id v15 = v27;
              }
            }
            goto LABEL_36;
          }
          id v13 = 0;
          id v15 = 0;
          id v16 = 0;
          CVMetalTextureRef v18 = 0;
        }
        else
        {
          id v13 = 0;
          id v15 = 0;
          id v16 = 0;
          CVMetalTextureRef v18 = 0;
          ModelSpecificName = 0;
        }
LABEL_45:
        id v19 = 0;
LABEL_36:
        id v25 = v19;

        goto LABEL_37;
      }
      id v13 = 0;
      id v15 = 0;
      id v16 = 0;
      CVMetalTextureRef v18 = 0;
    }
    else
    {
      id v13 = 0;
      id v15 = 0;
      id v16 = 0;
      CVMetalTextureRef v18 = 0;
      id v5 = 0;
    }
    ModelSpecificName = 0;
    uint64_t v11 = 0;
    goto LABEL_45;
  }
  id v25 = 0;
LABEL_37:

  return v25;
}

uint64_t sub_FCD0(uint64_t a1, __CVBuffer *a2, __CVBuffer *a3, float64x2_t *a4, __n128 a5, __n128 a6, __n128 a7)
{
  if (!a1) {
    return 0;
  }
  id v7 = 0;
  __n128 v45 = 0u;
  __n128 v46 = 0u;
  long long v43 = 0u;
  __n128 v44 = 0u;
  long long v42 = 0u;
  uint64_t v8 = 4294954516;
  if (a2)
  {
    CFDictionaryRef v10 = 0;
    uint64_t v11 = 0;
    if (a3)
    {
      id v7 = sub_F3E8(a1, a2, 1);
      if ([v7 count] == (char *)&dword_0 + 2)
      {
        CFDictionaryRef v10 = sub_F3E8(a1, a3, 2);
        if ([v10 count] == (char *)&dword_0 + 1)
        {
          id v14 = [*(id *)(a1 + 8) commandQueue];
          uint64_t v11 = [v14 commandBuffer];

          if (!v11)
          {
            fig_log_get_emitter();
            FigDebugAssert3();
            uint64_t v8 = FigSignalErrorAt();
            goto LABEL_13;
          }
          uint64_t v15 = [v11 computeCommandEncoder];
          if (v15)
          {
            id v16 = (void *)v15;
            LOWORD(v43) = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 120)) * *(_WORD *)(a1 + 128);
            WORD1(v43) = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 120)) * *(_WORD *)(a1 + 128);
            float32x2_t v17 = vcvt_f32_f64(a4[1]);
            *(float32x2_t *)&long long v42 = vcvt_f32_f64(*a4);
            *((float32x2_t *)&v42 + 1) = v17;
            __n128 v44 = a5;
            __n128 v45 = a6;
            __n128 v46 = a7;
            OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
            OSType v19 = CVPixelBufferGetPixelFormatType(a3);
            if (PixelFormatType == 1111970369 || v19 == 641877825)
            {
              [v16 setComputePipelineState:*(void *)(a1 + 24)];
              CFStringRef v28 = [v7 objectAtIndexedSubscript:0];
              [v16 setTexture:v28 atIndex:0];

              int v29 = [v7 objectAtIndexedSubscript:1];
              [v16 setTexture:v29 atIndex:1];

              unsigned int v30 = [v10 objectAtIndexedSubscript:0];
              [v16 setTexture:v30 atIndex:2];

              [v16 setBytes:&v42 length:80 atIndex:0];
              signed int v23 = [v10 objectAtIndexedSubscript:0];
              id v31 = [v23 width];
              id v25 = [v10 objectAtIndexedSubscript:0];
              v41[0] = v31;
              v41[1] = [v25 height];
              v41[2] = 1;
              int64x2_t v39 = vdupq_n_s64(0x20uLL);
              uint64_t v40 = 1;
              uint64_t v26 = v41;
              unsigned __int32 v27 = &v39;
            }
            else
            {
              [v16 setComputePipelineState:*(void *)(a1 + 16)];
              uint64_t v20 = [v7 objectAtIndexedSubscript:0];
              [v16 setTexture:v20 atIndex:0];

              id v21 = [v7 objectAtIndexedSubscript:1];
              [v16 setTexture:v21 atIndex:1];

              int32x2_t v22 = [v10 objectAtIndexedSubscript:0];
              [v16 setTexture:v22 atIndex:2];

              [v16 setBytes:&v42 length:80 atIndex:0];
              signed int v23 = [v10 objectAtIndexedSubscript:0];
              id v24 = [v23 width];
              id v25 = [v10 objectAtIndexedSubscript:0];
              v38[0] = v24;
              v38[1] = (unint64_t)[v25 height] / 3;
              v38[2] = 1;
              int64x2_t v36 = vdupq_n_s64(0x20uLL);
              uint64_t v37 = 1;
              uint64_t v26 = v38;
              unsigned __int32 v27 = &v36;
            }
            [v16 dispatchThreads:v26 threadsPerThreadgroup:v27];

            [v16 endEncoding];
            [v11 commit];
            [v11 waitUntilScheduled];

            uint64_t v8 = 0;
            goto LABEL_13;
          }
          goto LABEL_18;
        }
      }
      else
      {
        CFDictionaryRef v10 = 0;
      }
      uint64_t v11 = 0;
LABEL_18:
      uint64_t v8 = 4294954514;
    }
  }
  else
  {
    CFDictionaryRef v10 = 0;
    uint64_t v11 = 0;
  }
LABEL_13:

  return v8;
}

uint64_t sub_10134(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  CFDictionaryRef v2 = *(__CVBuffer **)(a1 + 112);
  if (!v2 || !*(void *)(a1 + 120))
  {
    int v3 = 0;
    int v4 = 0;
    id v6 = 0;
    uint64_t v14 = 4294954516;
    goto LABEL_9;
  }
  int v3 = sub_F3E8(a1, v2, 1);
  if ([v3 count] != (char *)&dword_0 + 1)
  {
    int v4 = 0;
    goto LABEL_13;
  }
  int v4 = sub_F3E8(a1, *(__CVBuffer **)(a1 + 120), 2);
  if ([v4 count] != (char *)&dword_0 + 1)
  {
LABEL_13:
    id v6 = 0;
LABEL_14:
    uint64_t v14 = 4294954514;
    goto LABEL_9;
  }
  id v5 = [*(id *)(a1 + 8) commandQueue];
  id v6 = [v5 commandBuffer];

  if (!v6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v14 = FigSignalErrorAt();
    goto LABEL_9;
  }
  id v7 = [v6 computeCommandEncoder];
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = v7;
  [v7 setComputePipelineState:*(void *)(a1 + 32)];
  size_t v9 = [v3 objectAtIndexedSubscript:0];
  [v8 setTexture:v9 atIndex:0];

  CFDictionaryRef v10 = [v4 objectAtIndexedSubscript:0];
  [v8 setTexture:v10 atIndex:1];

  uint64_t v11 = [v4 objectAtIndexedSubscript:0];
  id v12 = [v11 width];
  id v13 = [v4 objectAtIndexedSubscript:0];
  v18[0] = v12;
  v18[1] = [v13 height];
  v18[2] = 1;
  int64x2_t v16 = vdupq_n_s64(0x20uLL);
  uint64_t v17 = 1;
  [v8 dispatchThreads:v18 threadsPerThreadgroup:&v16];

  [v8 endEncoding];
  [v6 commit];
  [v6 waitUntilScheduled];

  uint64_t v14 = 0;
LABEL_9:

  return v14;
}

uint64_t sub_103B0(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a1)
  {
    for (uint64_t i = 0; i != 6; ++i)
    {
      unsigned int v4 = *(_DWORD *)(a1 + 152);
      unsigned int v5 = 277803737 * ((v4 >> ((v4 >> 28) + 4)) ^ v4);
      unsigned int v6 = 747796405 * v4 - 1403630843;
      *(_DWORD *)(a1 + 152) = v6;
      unsigned int v7 = (v5 ^ (v5 >> 22)) % a3;
      if (i)
      {
        while (1)
        {
          uint64_t v8 = 0;
          while (*(_DWORD *)(a2 + 4 * v8) != v7)
          {
            if (i == ++v8) {
              goto LABEL_9;
            }
          }
          unsigned int v9 = 277803737 * ((v6 >> ((v6 >> 28) + 4)) ^ v6);
          unsigned int v6 = 747796405 * v6 - 1403630843;
          *(_DWORD *)(a1 + 152) = v6;
          unsigned int v7 = (v9 ^ (v9 >> 22)) % a3;
        }
      }
LABEL_9:
      *(_DWORD *)(a2 + 4 * i) = v7;
    }
  }
  return 0;
}

uint64_t sub_105F4(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferAssembleResidual" constants:0];
  int v3 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = v2;

  if (*(void *)(a1 + 72))
  {
    uint64_t v4 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferAssembleSlicesResidual" constants:0];
    unsigned int v5 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v4;

    if (*(void *)(a1 + 80))
    {
      uint64_t v6 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferReduceLowFreqDiffYUV" constants:0];
      unsigned int v7 = *(void **)(a1 + 88);
      *(void *)(a1 + 88) = v6;

      if (*(void *)(a1 + 88))
      {
        uint64_t v8 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferGaussian3RowGatherXY" constants:0];
        unsigned int v9 = *(void **)(a1 + 32);
        *(void *)(a1 + 32) = v8;

        if (*(void *)(a1 + 32))
        {
          uint64_t v10 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferGaussian3RowGather" constants:0];
          uint64_t v11 = *(void **)(a1 + 48);
          *(void *)(a1 + 48) = v10;

          if (*(void *)(a1 + 48))
          {
            uint64_t v12 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferGaussian3RowGather" constants:0];
            id v13 = *(void **)(a1 + 48);
            *(void *)(a1 + 48) = v12;

            if (*(void *)(a1 + 48))
            {
              uint64_t v14 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferGaussian5RowGather" constants:0];
              uint64_t v15 = *(void **)(a1 + 56);
              *(void *)(a1 + 56) = v14;

              if (*(void *)(a1 + 56))
              {
                uint64_t v16 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferGaussian15RowGatherXY" constants:0];
                uint64_t v17 = *(void **)(a1 + 40);
                *(void *)(a1 + 40) = v16;

                if (*(void *)(a1 + 40))
                {
                  uint64_t v18 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferGaussian29RowGather" constants:0];
                  OSType v19 = *(void **)(a1 + 64);
                  *(void *)(a1 + 64) = v18;

                  if (*(void *)(a1 + 64))
                  {
                    uint64_t v20 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferYuv444To420" constants:0];
                    id v21 = *(void **)(a1 + 16);
                    *(void *)(a1 + 16) = v20;

                    if (*(void *)(a1 + 16))
                    {
                      uint64_t v22 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferYuv444SlicesTo420" constants:0];
                      signed int v23 = *(void **)(a1 + 24);
                      *(void *)(a1 + 24) = v22;

                      if (*(void *)(a1 + 24))
                      {
                        uint64_t v24 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferDownsample" constants:0];
                        id v25 = *(void **)(a1 + 96);
                        *(void *)(a1 + 96) = v24;

                        if (*(void *)(a1 + 96))
                        {
                          uint64_t v26 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferUpsample" constants:0];
                          unsigned __int32 v27 = *(void **)(a1 + 104);
                          *(void *)(a1 + 104) = v26;

                          if (*(void *)(a1 + 104))
                          {
                            uint64_t v28 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferComputeLumaBlendingMask" constants:0];
                            int v29 = *(void **)(a1 + 112);
                            *(void *)(a1 + 112) = v28;

                            if (*(void *)(a1 + 112))
                            {
                              uint64_t v30 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferModulateMasks" constants:0];
                              id v31 = *(void **)(a1 + 120);
                              *(void *)(a1 + 120) = v30;

                              if (*(void *)(a1 + 120))
                              {
                                uint64_t v32 = [*(id *)(a1 + 8) computePipelineStateFor:@"DeepZoomTransferBlendEnhanced" constants:0];
                                long long v33 = *(void **)(a1 + 128);
                                *(void *)(a1 + 128) = v32;

                                if (*(void *)(a1 + 128)) {
                                  return 0;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

uint64_t sub_10EEC(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = 4294954516;
  if (a2 && a3)
  {
    if (((a3 | a2) & 0xF) != 0)
    {
      uint64_t v4 = 0;
    }
    else
    {
      *(_DWORD *)(a1 + 288) = a2;
      *(_DWORD *)(a1 + 292) = a3;
      *(_DWORD *)(a1 + 312) = a2 >> 2;
      *(_DWORD *)(a1 + 316) = a3 >> 2;
      id v8 = objc_alloc_init((Class)MTLTextureDescriptor);
      uint64_t v4 = v8;
      if (!v8) {
        goto LABEL_26;
      }
      [v8 setWidth:a2];
      [v4 setHeight:a3];
      [v4 setPixelFormat:25];
      [v4 setUsage:3];
      unsigned int v9 = [*(id *)(a1 + 8) device];
      id v10 = [v9 newTextureWithDescriptor:v4];
      uint64_t v11 = *(void **)(a1 + 152);
      *(void *)(a1 + 152) = v10;

      if (!*(void *)(a1 + 152)) {
        goto LABEL_26;
      }
      uint64_t v12 = [*(id *)(a1 + 8) device];
      id v13 = [v12 newTextureWithDescriptor:v4];
      uint64_t v14 = *(void **)(a1 + 136);
      *(void *)(a1 + 136) = v13;

      if (!*(void *)(a1 + 136)) {
        goto LABEL_26;
      }
      uint64_t v15 = [*(id *)(a1 + 8) device];
      id v16 = [v15 newTextureWithDescriptor:v4];
      uint64_t v17 = *(void **)(a1 + 184);
      *(void *)(a1 + 184) = v16;

      if (!*(void *)(a1 + 184)) {
        goto LABEL_26;
      }
      uint64_t v18 = [*(id *)(a1 + 8) device];
      id v19 = [v18 newTextureWithDescriptor:v4];
      uint64_t v20 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v19;

      if (!*(void *)(a1 + 168)) {
        goto LABEL_26;
      }
      id v21 = [*(id *)(a1 + 8) device];
      id v22 = [v21 newTextureWithDescriptor:v4];
      signed int v23 = *(void **)(a1 + 216);
      *(void *)(a1 + 216) = v22;

      if (!*(void *)(a1 + 216)) {
        goto LABEL_26;
      }
      uint64_t v24 = [*(id *)(a1 + 8) device];
      id v25 = [v24 newTextureWithDescriptor:v4];
      uint64_t v26 = *(void **)(a1 + 224);
      *(void *)(a1 + 224) = v25;

      if (!*(void *)(a1 + 224)) {
        goto LABEL_26;
      }
      [v4 setWidth:a3];
      [v4 setHeight:a2];
      unsigned __int32 v27 = [*(id *)(a1 + 8) device];
      id v28 = [v27 newTextureWithDescriptor:v4];
      int v29 = *(void **)(a1 + 200);
      *(void *)(a1 + 200) = v28;

      if (!*(void *)(a1 + 200)) {
        goto LABEL_26;
      }
      uint64_t v30 = a2 >> 1;
      [v4 setWidth:v30];
      uint64_t v31 = a3 >> 1;
      [v4 setHeight:v31];
      [v4 setPixelFormat:65];
      uint64_t v32 = [*(id *)(a1 + 8) device];
      id v33 = [v32 newTextureWithDescriptor:v4];
      long long v34 = *(void **)(a1 + 160);
      *(void *)(a1 + 160) = v33;

      if (!*(void *)(a1 + 160)) {
        goto LABEL_26;
      }
      long long v35 = [*(id *)(a1 + 8) device];
      id v36 = [v35 newTextureWithDescriptor:v4];
      uint64_t v37 = *(void **)(a1 + 144);
      *(void *)(a1 + 144) = v36;

      if (!*(void *)(a1 + 144)) {
        goto LABEL_26;
      }
      long long v38 = [*(id *)(a1 + 8) device];
      id v39 = [v38 newTextureWithDescriptor:v4];
      uint64_t v40 = *(void **)(a1 + 192);
      *(void *)(a1 + 192) = v39;

      if (!*(void *)(a1 + 192)) {
        goto LABEL_26;
      }
      uint64_t v41 = [*(id *)(a1 + 8) device];
      id v42 = [v41 newTextureWithDescriptor:v4];
      long long v43 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = v42;

      if (!*(void *)(a1 + 176)) {
        goto LABEL_26;
      }
      __n128 v44 = [*(id *)(a1 + 8) device];
      id v45 = [v44 newTextureWithDescriptor:v4];
      __n128 v46 = *(void **)(a1 + 232);
      *(void *)(a1 + 232) = v45;

      if (!*(void *)(a1 + 232)) {
        goto LABEL_26;
      }
      [v4 setWidth:v31];
      [v4 setHeight:v30];
      float32x2_t v47 = [*(id *)(a1 + 8) device];
      id v48 = [v47 newTextureWithDescriptor:v4];
      unsigned int v49 = *(void **)(a1 + 208);
      *(void *)(a1 + 208) = v48;

      if (!*(void *)(a1 + 208)) {
        goto LABEL_26;
      }
      [v4 setWidth:*(unsigned int *)(a1 + 312)];
      [v4 setHeight:*(unsigned int *)(a1 + 316)];
      [v4 setPixelFormat:25];
      unsigned int v50 = [*(id *)(a1 + 8) device];
      id v51 = [v50 newTextureWithDescriptor:v4];
      float v52 = *(void **)(a1 + 240);
      *(void *)(a1 + 240) = v51;

      if (!*(void *)(a1 + 240)) {
        goto LABEL_26;
      }
      float v53 = [*(id *)(a1 + 8) device];
      id v54 = [v53 newTextureWithDescriptor:v4];
      uint64_t v55 = *(void **)(a1 + 248);
      *(void *)(a1 + 248) = v54;

      if (!*(void *)(a1 + 248)) {
        goto LABEL_26;
      }
      float v56 = [*(id *)(a1 + 8) device];
      id v57 = [v56 newTextureWithDescriptor:v4];
      float32x4_t v58 = *(void **)(a1 + 256);
      *(void *)(a1 + 256) = v57;

      if (*(void *)(a1 + 256))
      {
        uint64_t v5 = 0;
      }
      else
      {
LABEL_26:
        fig_log_get_emitter();
        FigDebugAssert3();
        uint64_t v5 = FigSignalErrorAt();
      }
    }
  }

  return v5;
}

uint64_t sub_11BA0(uint32x2_t *a1, void *a2, void *a3, void *a4, void *a5)
{
  if (a1)
  {
    id v10 = *(id *)&a1[3];
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    id v14 = a2;
    [v11 setComputePipelineState:v10];
    uint64_t v15 = [v14 objectAtIndexedSubscript:0];
    [v11 setTexture:v15 atIndex:0];

    id v16 = [v14 objectAtIndexedSubscript:1];
    [v11 setTexture:v16 atIndex:1];

    uint64_t v17 = [v14 objectAtIndexedSubscript:2];

    [v11 setTexture:v17 atIndex:2];
    [v11 setTexture:v13 atIndex:3];

    [v11 setTexture:v12 atIndex:4];
    unint64_t v18 = (unint64_t)[v10 threadExecutionWidth];
    unint64_t v19 = (unint64_t)[v10 maxTotalThreadsPerThreadgroup];
    uint32x2_t v20 = a1[36];
    unint64_t v21 = v19 / v18;

    uint32x2_t v22 = vshr_n_u32(v20, 1uLL);
    *(void *)&long long v23 = v22.u32[0];
    *((void *)&v23 + 1) = v22.u32[1];
    long long v26 = v23;
    uint64_t v27 = 1;
    v25[0] = v18;
    v25[1] = v21;
    v25[2] = 1;
    [v11 dispatchThreads:&v26 threadsPerThreadgroup:v25];
  }
  return 0;
}

uint64_t sub_11D30(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v35 = a7;
  id v19 = a8;
  id v20 = a9;
  unint64_t v21 = v20;
  if (a1)
  {
    int v39 = 1065353216;
    uint64_t v22 = sub_12E9C(a1, a2, a3, *(void **)(a1 + 200), *(void **)(a1 + 208), 5u, *(_DWORD *)(a1 + 288), *(_DWORD *)(a1 + 292), v20);
    if (v22
      || (uint64_t v22 = sub_12E9C(a1, *(void **)(a1 + 200), *(void **)(a1 + 208), v16, v17, 5u, *(_DWORD *)(a1 + 292), *(_DWORD *)(a1 + 288), v21), v22))
    {
      uint64_t v33 = v22;
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_9;
    }
    if ([v18 count] == (char *)&dword_0 + 3)
    {
      id v23 = *(id *)(a1 + 80);
      [v21 setComputePipelineState:v23];
      [v21 setTexture:v16 atIndex:0];
      [v21 setTexture:v17 atIndex:1];
      uint64_t v24 = [v18 objectAtIndexedSubscript:0];
      [v21 setTexture:v24 atIndex:2];

      id v25 = [v18 objectAtIndexedSubscript:1];
      [v21 setTexture:v25 atIndex:3];

      long long v26 = [v18 objectAtIndexedSubscript:2];
      [v21 setTexture:v26 atIndex:4];
      uint64_t v27 = 6;
      uint64_t v28 = 5;
    }
    else
    {
      id v23 = *(id *)(a1 + 72);
      [v21 setComputePipelineState:v23];
      [v21 setTexture:v16 atIndex:0];
      [v21 setTexture:v17 atIndex:1];
      long long v26 = [v18 objectAtIndexedSubscript:0];
      [v21 setTexture:v26 atIndex:2];
      uint64_t v27 = 4;
      uint64_t v28 = 3;
    }

    [v21 setTexture:v35 atIndex:v28];
    [v21 setTexture:v19 atIndex:v27];
    [v21 setBytes:&v39 length:4 atIndex:0];
    unint64_t v29 = (unint64_t)[v23 threadExecutionWidth];
    unint64_t v30 = (unint64_t)[v23 maxTotalThreadsPerThreadgroup];
    uint64_t v31 = *(void *)(a1 + 288);
    *(void *)&long long v32 = v31;
    *((void *)&v32 + 1) = HIDWORD(v31);
    long long v37 = v32;
    uint64_t v38 = 1;
    v36[0] = v29;
    v36[1] = v30 / v29;
    v36[2] = 1;
    [v21 dispatchThreads:&v37 threadsPerThreadgroup:v36];
  }
  uint64_t v33 = 0;
LABEL_9:

  return v33;
}

uint64_t sub_120B8(uint32x2_t *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = v19;
  if (a1)
  {
    uint64_t v21 = sub_12E9C((uint64_t)a1, a2, a3, *(void **)&a1[25], *(void **)&a1[26], 0x1Du, a1[36].u32[0], a1[36].u32[1], v19);
    if (v21
      || (uint64_t v21 = sub_12E9C((uint64_t)a1, *(void **)&a1[25], *(void **)&a1[26], *(void **)&a1[27], *(void **)&a1[29], 0x1Du, a1[36].u32[1], a1[36].u32[0], v20), v21)|| (uint64_t v21 = sub_12E9C((uint64_t)a1, v15, v16, *(void **)&a1[25], *(void **)&a1[26], 5u, a1[36].u32[0], a1[36].u32[1],
                  v20),
          v21)
      || (uint64_t v21 = sub_12E9C((uint64_t)a1, *(void **)&a1[25], *(void **)&a1[26], *(void **)&a1[23], *(void **)&a1[24], 5u, a1[36].u32[1], a1[36].u32[0], v20), v21)|| (uint64_t v21 = sub_12E9C((uint64_t)a1, *(void **)&a1[23], *(void **)&a1[24], *(void **)&a1[25], *(void **)&a1[26], 0x1Du, a1[36].u32[0], a1[36].u32[1],
                  v20),
          v21)
      || (uint64_t v21 = sub_12E9C((uint64_t)a1, *(void **)&a1[25], *(void **)&a1[26], *(void **)&a1[23], *(void **)&a1[24], 0x1Du, a1[36].u32[1], a1[36].u32[0], v20), v21))
    {
      uint64_t v27 = v21;
      fig_log_get_emitter();
      FigDebugAssert3();
      goto LABEL_10;
    }
    id v22 = *(id *)&a1[11];
    [v20 setComputePipelineState:v22];
    [v20 setTexture:*(void *)&a1[27] atIndex:0];
    [v20 setTexture:*(void *)&a1[23] atIndex:1];
    [v20 setTexture:v15 atIndex:2];
    [v20 setTexture:v17 atIndex:3];
    [v20 setTexture:*(void *)&a1[29] atIndex:4];
    [v20 setTexture:*(void *)&a1[24] atIndex:5];
    [v20 setTexture:v16 atIndex:6];
    [v20 setTexture:v18 atIndex:7];
    unint64_t v23 = (unint64_t)[v22 threadExecutionWidth];
    unint64_t v24 = (unint64_t)[v22 maxTotalThreadsPerThreadgroup];
    uint32x2_t v25 = vshr_n_u32(a1[36], 1uLL);
    *(void *)&long long v26 = v25.u32[0];
    *((void *)&v26 + 1) = v25.u32[1];
    long long v30 = v26;
    uint64_t v31 = 1;
    v29[0] = v23;
    v29[1] = v24 / v23;
    v29[2] = 1;
    [v20 dispatchThreads:&v30 threadsPerThreadgroup:v29];
  }
  uint64_t v27 = 0;
LABEL_10:

  return v27;
}

uint64_t sub_12570(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1)
  {
    uint64_t v40 = 0;
    goto LABEL_8;
  }
  *(void *)(a1 + 296) = *(void *)(a1 + 312);
  id v10 = *(id *)(a1 + 96);
  [v9 setComputePipelineState:v10];
  [v9 setTexture:v7 atIndex:0];
  [v9 setTexture:*(void *)(a1 + 216) atIndex:1];
  [v9 setBytes:a1 + 288 length:32 atIndex:0];
  unint64_t v11 = (unint64_t)[v10 threadExecutionWidth];
  unint64_t v12 = (unint64_t)[v10 maxTotalThreadsPerThreadgroup];
  uint64_t v13 = *(void *)(a1 + 312);
  *(void *)&long long v14 = v13;
  *((void *)&v14 + 1) = HIDWORD(v13);
  long long v62 = v14;
  uint64_t v63 = 1;
  v61[0] = v11;
  v61[1] = v12 / v11;
  v61[2] = 1;
  [v9 dispatchThreads:&v62 threadsPerThreadgroup:v61];
  id v15 = *(id *)(a1 + 96);

  [v9 setComputePipelineState:v15];
  [v9 setTexture:v8 atIndex:0];
  [v9 setTexture:*(void *)(a1 + 224) atIndex:1];
  [v9 setBytes:a1 + 288 length:32 atIndex:0];
  unint64_t v16 = (unint64_t)[v15 threadExecutionWidth];
  unint64_t v17 = (unint64_t)[v15 maxTotalThreadsPerThreadgroup];
  uint64_t v18 = *(void *)(a1 + 312);
  *(void *)&long long v14 = v18;
  *((void *)&v14 + 1) = HIDWORD(v18);
  long long v59 = v14;
  uint64_t v60 = 1;
  v58[0] = v16;
  v58[1] = v17 / v16;
  v58[2] = 1;
  [v9 dispatchThreads:&v59 threadsPerThreadgroup:v58];
  id v19 = *(id *)(a1 + 112);

  [v9 setComputePipelineState:v19];
  [v9 setTexture:*(void *)(a1 + 216) atIndex:0];
  [v9 setTexture:*(void *)(a1 + 240) atIndex:1];
  unint64_t v20 = (unint64_t)[v19 threadExecutionWidth];
  unint64_t v21 = (unint64_t)[v19 maxTotalThreadsPerThreadgroup];
  uint64_t v22 = *(void *)(a1 + 312);
  *(void *)&long long v14 = v22;
  *((void *)&v14 + 1) = HIDWORD(v22);
  long long v56 = v14;
  uint64_t v57 = 1;
  v55[0] = v20;
  v55[1] = v21 / v20;
  v55[2] = 1;
  [v9 dispatchThreads:&v56 threadsPerThreadgroup:v55];
  uint64_t v23 = sub_12D3C(a1, *(void **)(a1 + 240), *(void **)(a1 + 200), 5, *(_DWORD *)(a1 + 312), *(_DWORD *)(a1 + 316), 1, v9);
  if (v23
    || (uint64_t v23 = sub_12D3C(a1, *(void **)(a1 + 200), *(void **)(a1 + 240), 5, *(_DWORD *)(a1 + 316), *(_DWORD *)(a1 + 312), 1, v9), v23))
  {
    uint64_t v40 = v23;
    fig_log_get_emitter();
LABEL_12:
    FigDebugAssert3();
    goto LABEL_7;
  }
  id v24 = *(id *)(a1 + 112);

  [v9 setComputePipelineState:v24];
  [v9 setTexture:*(void *)(a1 + 224) atIndex:0];
  [v9 setTexture:*(void *)(a1 + 248) atIndex:1];
  unint64_t v25 = (unint64_t)[v24 threadExecutionWidth];
  unint64_t v26 = (unint64_t)[v24 maxTotalThreadsPerThreadgroup];
  uint64_t v27 = *(void *)(a1 + 312);
  *(void *)&long long v28 = v27;
  *((void *)&v28 + 1) = HIDWORD(v27);
  long long v53 = v28;
  uint64_t v54 = 1;
  v52[0] = v25;
  v52[1] = v26 / v25;
  v52[2] = 1;
  [v9 dispatchThreads:&v53 threadsPerThreadgroup:v52];
  id v29 = *(id *)(a1 + 120);

  [v9 setComputePipelineState:v29];
  [v9 setTexture:*(void *)(a1 + 240) atIndex:0];
  [v9 setTexture:*(void *)(a1 + 248) atIndex:1];
  [v9 setTexture:*(void *)(a1 + 256) atIndex:2];
  unint64_t v30 = (unint64_t)[v29 threadExecutionWidth];
  unint64_t v31 = (unint64_t)[v29 maxTotalThreadsPerThreadgroup];
  uint64_t v32 = *(void *)(a1 + 312);
  *(void *)&long long v28 = v32;
  *((void *)&v28 + 1) = HIDWORD(v32);
  long long v50 = v28;
  uint64_t v51 = 1;
  v49[0] = v30;
  v49[1] = v31 / v30;
  v49[2] = 1;
  [v9 dispatchThreads:&v50 threadsPerThreadgroup:v49];
  *(void *)(a1 + 304) = *(void *)(a1 + 288);
  id v19 = *(id *)(a1 + 104);

  [v9 setComputePipelineState:v19];
  [v9 setTexture:*(void *)(a1 + 256) atIndex:0];
  [v9 setTexture:*(void *)(a1 + 216) atIndex:1];
  unint64_t v33 = (unint64_t)[v19 threadExecutionWidth];
  unint64_t v34 = (unint64_t)[v19 maxTotalThreadsPerThreadgroup];
  uint64_t v35 = *(void *)(a1 + 288);
  *(void *)&long long v28 = v35;
  *((void *)&v28 + 1) = HIDWORD(v35);
  long long v47 = v28;
  uint64_t v48 = 1;
  v46[0] = v33;
  v46[1] = v34 / v33;
  v46[2] = 1;
  [v9 dispatchThreads:&v47 threadsPerThreadgroup:v46];
  uint64_t v36 = sub_12D3C(a1, *(void **)(a1 + 216), *(void **)(a1 + 200), 3, *(_DWORD *)(a1 + 288), *(_DWORD *)(a1 + 292), 1, v9);
  if (v36
    || (uint64_t v36 = sub_12D3C(a1, *(void **)(a1 + 200), *(void **)(a1 + 216), 3, *(_DWORD *)(a1 + 292), *(_DWORD *)(a1 + 288), 1, v9), v36))
  {
    uint64_t v40 = v36;
    fig_log_get_emitter();
    goto LABEL_12;
  }
  id v37 = *(id *)(a1 + 128);

  [v9 setComputePipelineState:v37];
  [v9 setImageblockWidth:32 height:32];
  [v9 setTexture:v7 atIndex:0];
  [v9 setTexture:v8 atIndex:1];
  [v9 setTexture:*(void *)(a1 + 216) atIndex:2];
  [v9 setTexture:v8 atIndex:3];
  uint64_t v38 = *(void *)(a1 + 288);
  *(void *)&long long v39 = v38;
  *((void *)&v39 + 1) = HIDWORD(v38);
  long long v44 = v39;
  uint64_t v45 = 1;
  int64x2_t v42 = vdupq_n_s64(0x20uLL);
  uint64_t v43 = 1;
  [v9 dispatchThreads:&v44 threadsPerThreadgroup:&v42];
  uint64_t v40 = 0;
  id v19 = v37;
LABEL_7:

LABEL_8:
  return v40;
}

void sub_12C48(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[17];
    a1[17] = 0;

    int v3 = (void *)a1[18];
    a1[18] = 0;

    uint64_t v4 = (void *)a1[19];
    a1[19] = 0;

    uint64_t v5 = (void *)a1[20];
    a1[20] = 0;

    uint64_t v6 = (void *)a1[25];
    a1[25] = 0;

    id v7 = (void *)a1[26];
    a1[26] = 0;

    id v8 = (void *)a1[27];
    a1[27] = 0;

    id v9 = (void *)a1[28];
    a1[28] = 0;

    id v10 = (void *)a1[29];
    a1[29] = 0;

    unint64_t v11 = (void *)a1[23];
    a1[23] = 0;

    unint64_t v12 = (void *)a1[24];
    a1[24] = 0;

    uint64_t v13 = (void *)a1[21];
    a1[21] = 0;

    long long v14 = (void *)a1[22];
    a1[22] = 0;

    id v15 = (void *)a1[30];
    a1[30] = 0;

    unint64_t v16 = (void *)a1[31];
    a1[31] = 0;

    unint64_t v17 = (void *)a1[32];
    a1[32] = 0;
  }
}

uint64_t sub_12D3C(uint64_t a1, void *a2, void *a3, int a4, unsigned int a5, unsigned int a6, int a7, void *a8)
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a8;
  if (!a1) {
    goto LABEL_15;
  }
  if (a7)
  {
    switch(a4)
    {
      case 3:
        uint64_t v18 = 48;
        goto LABEL_14;
      case 29:
        uint64_t v18 = 64;
        goto LABEL_14;
      case 5:
        uint64_t v18 = 56;
LABEL_14:
        id v20 = *(id *)(a1 + v18);
        [v17 setComputePipelineState:v20];
        [v17 setTexture:v15 atIndex:0];
        [v17 setTexture:v16 atIndex:1];
        v23[0] = a5 >> 1;
        v23[1] = a6 >> 1;
        v23[2] = 1;
        v22[0] = [v20 threadExecutionWidth];
        v22[1] = (unint64_t)[v20 maxTotalThreadsPerThreadgroup] / v22[0];
        v22[2] = 1;
        [v17 dispatchThreads:v23 threadsPerThreadgroup:v22];

LABEL_15:
        uint64_t v19 = 0;
        goto LABEL_16;
    }
  }
  else
  {
    if (a4 == 15)
    {
      uint64_t v18 = 40;
      goto LABEL_14;
    }
    if (a4 == 3)
    {
      uint64_t v18 = 32;
      goto LABEL_14;
    }
  }
  uint64_t v19 = 4294954516;
LABEL_16:

  return v19;
}

uint64_t sub_12E9C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, unsigned int a6, unsigned int a7, unsigned int a8, void *a9)
{
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a9;
  if (a1)
  {
    uint64_t v21 = sub_12D3C(a1, v16, v18, a6, a7, a8, 1, v20);
    if (!v21) {
      uint64_t v21 = sub_12D3C(a1, v17, v19, (a6 >> 1) + 1, a7 >> 1, a8 >> 1, 0, v20);
    }
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v22 = 0;
  }

  return v22;
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return _CVMetalTextureCacheCreate(allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return _CVMetalTextureCacheCreateTextureFromImage(allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex, textureOut);
}

uint64_t CVMetalTextureCacheCreateTextureFromSliceOfImage()
{
  return _CVMetalTextureCacheCreateTextureFromSliceOfImage();
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return _CVMetalTextureGetTexture(image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferCreate(allocator, width, height, pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferGetAttributes()
{
  return _CVPixelBufferGetAttributes();
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBaseAddress(pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBytesPerRow(pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetHeightOfPlane(pixelBuffer, planeIndex);
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

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return _CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags);
}

uint64_t FigCFDictionaryGetCGRectIfPresent()
{
  return _FigCFDictionaryGetCGRectIfPresent();
}

uint64_t FigCaptureGetModelSpecificName()
{
  return _FigCaptureGetModelSpecificName();
}

uint64_t FigCapturePlatformGetVariant()
{
  return _FigCapturePlatformGetVariant();
}

uint64_t FigCapturePlatformIdentifierString()
{
  return _FigCapturePlatformIdentifierString();
}

uint64_t FigDebugAssert3()
{
  return _FigDebugAssert3();
}

uint64_t FigGetCFPreferenceNumberWithDefault()
{
  return _FigGetCFPreferenceNumberWithDefault();
}

uint64_t FigSignalErrorAt()
{
  return _FigSignalErrorAt();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  return ___invert_f3(a1);
}

uint64_t espresso_context_destroy()
{
  return _espresso_context_destroy();
}

uint64_t espresso_create_context()
{
  return _espresso_create_context();
}

uint64_t espresso_create_plan()
{
  return _espresso_create_plan();
}

uint64_t espresso_network_bind_direct_cvpixelbuffer()
{
  return _espresso_network_bind_direct_cvpixelbuffer();
}

uint64_t espresso_network_query_quantization_info()
{
  return _espresso_network_query_quantization_info();
}

uint64_t espresso_plan_add_network()
{
  return _espresso_plan_add_network();
}

uint64_t espresso_plan_build()
{
  return _espresso_plan_build();
}

uint64_t espresso_plan_destroy()
{
  return _espresso_plan_destroy();
}

uint64_t espresso_plan_execute_sync()
{
  return _espresso_plan_execute_sync();
}

uint64_t fig_log_get_emitter()
{
  return _fig_log_get_emitter();
}

void free(void *a1)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
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

id objc_msgSend_computeCommandEncoder(void *a1, const char *a2, ...)
{
  return [a1 computeCommandEncoder];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dxPoints(void *a1, const char *a2, ...)
{
  return [a1 dxPoints];
}

id objc_msgSend_dyPoints(void *a1, const char *a2, ...)
{
  return [a1 dyPoints];
}

id objc_msgSend_endEncoding(void *a1, const char *a2, ...)
{
  return [a1 endEncoding];
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishProcessing];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_maxTotalThreadsPerThreadgroup(void *a1, const char *a2, ...)
{
  return [a1 maxTotalThreadsPerThreadgroup];
}

id objc_msgSend_modelInputBindingNames(void *a1, const char *a2, ...)
{
  return [a1 modelInputBindingNames];
}

id objc_msgSend_modelInputPixelFormats(void *a1, const char *a2, ...)
{
  return [a1 modelInputPixelFormats];
}

id objc_msgSend_modelInputSizes(void *a1, const char *a2, ...)
{
  return [a1 modelInputSizes];
}

id objc_msgSend_modelInputSlicesCount(void *a1, const char *a2, ...)
{
  return [a1 modelInputSlicesCount];
}

id objc_msgSend_modelNetworkBaseName(void *a1, const char *a2, ...)
{
  return [a1 modelNetworkBaseName];
}

id objc_msgSend_modelOutputBindingNames(void *a1, const char *a2, ...)
{
  return [a1 modelOutputBindingNames];
}

id objc_msgSend_modelOutputPixelFormats(void *a1, const char *a2, ...)
{
  return [a1 modelOutputPixelFormats];
}

id objc_msgSend_modelOutputSizes(void *a1, const char *a2, ...)
{
  return [a1 modelOutputSizes];
}

id objc_msgSend_modelOutputSlicesCount(void *a1, const char *a2, ...)
{
  return [a1 modelOutputSlicesCount];
}

id objc_msgSend_newCommandQueue(void *a1, const char *a2, ...)
{
  return [a1 newCommandQueue];
}

id objc_msgSend_purgeResources(void *a1, const char *a2, ...)
{
  return [a1 purgeResources];
}

id objc_msgSend_threadExecutionWidth(void *a1, const char *a2, ...)
{
  return [a1 threadExecutionWidth];
}

id objc_msgSend_tileOverlap(void *a1, const char *a2, ...)
{
  return [a1 tileOverlap];
}

id objc_msgSend_tileSize(void *a1, const char *a2, ...)
{
  return [a1 tileSize];
}

id objc_msgSend_useFlowWeightedAverage(void *a1, const char *a2, ...)
{
  return [a1 useFlowWeightedAverage];
}

id objc_msgSend_waitForIdle(void *a1, const char *a2, ...)
{
  return [a1 waitForIdle];
}

id objc_msgSend_waitUntilScheduled(void *a1, const char *a2, ...)
{
  return [a1 waitUntilScheduled];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}