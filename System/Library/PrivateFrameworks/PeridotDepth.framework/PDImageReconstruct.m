@interface PDImageReconstruct
- (BOOL)pushFrames:(id)a3;
- (PDImageReconstruct)init;
- (__CVBuffer)createImageForBank:(unint64_t)a3 pixelFormat:(unsigned int)a4 normalizeByExposure:(BOOL)a5;
- (void)reset;
@end

@implementation PDImageReconstruct

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allMasks, 0);
  objc_storeStrong((id *)&self->_allImages, 0);
}

- (__CVBuffer)createImageForBank:(unint64_t)a3 pixelFormat:(unsigned int)a4 normalizeByExposure:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v7 = a3;
  if (a3 >= 8)
  {
    if (a3 == -1)
    {
      unint64_t v7 = 0;
      char v9 = 1;
      unint64_t v11 = 8;
      size_t v10 = 108;
    }
    else
    {
      if (a3 != -2)
      {
        peridot_depth_log("Requested to generate an image for an invalid bank: %lu", a3);
        return 0;
      }
      char v9 = 0;
      unint64_t v7 = 0;
      unint64_t v11 = 8;
      size_t v10 = 864;
    }
  }
  else
  {
    char v9 = 1;
    size_t v10 = 108;
    unint64_t v11 = 1;
  }
  if (a4 == 875704422 || a4 == 1278226534)
  {
    pixelBufferOut[0] = 0;
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFDictionaryRef BufferAttributes = (const __CFDictionary *)getBufferAttributes();
    if (CVPixelBufferCreate(v12, 0x54uLL, v10, 0x4C303066u, BufferAttributes, pixelBufferOut)) {
      v15 = 0;
    }
    else {
      v15 = pixelBufferOut[0];
    }
    LODWORD(v14) = 1.0;
    if (v5)
    {
      LODWORD(v14) = self->_exposure;
      double v14 = 1.0 / (double)*(unint64_t *)&v14;
      *(float *)&double v14 = v14;
    }
    int32x2_t v69 = *(int32x2_t *)&v14;
    CVPixelBufferLockBaseAddress(v15, 0);
    BaseAddress = (float32x4_t *)CVPixelBufferGetBaseAddress(v15);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(v15);
    bzero(BaseAddress, BytesPerRow * v10);
    if (v7 < v11)
    {
      float32x4_t v18 = (float32x4_t)vdupq_lane_s32(v69, 0);
      v19 = self->_bankImages[v7];
      if (v9)
      {
        do
        {
          uint64_t v20 = 0x3FFFFFFFFFFFDC90;
          v21 = BaseAddress + 10;
          do
          {
            float32x4_t v22 = vmlaq_f32(v21[-9], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9076]), v18);
            v21[-10] = vmlaq_f32(v21[-10], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9072]), v18);
            v21[-9] = v22;
            float32x4_t v23 = vmlaq_f32(v21[-7], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9084]), v18);
            v21[-8] = vmlaq_f32(v21[-8], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9080]), v18);
            v21[-7] = v23;
            float32x4_t v24 = vmlaq_f32(v21[-5], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9092]), v18);
            v21[-6] = vmlaq_f32(v21[-6], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9088]), v18);
            v21[-5] = v24;
            float32x4_t v25 = vmlaq_f32(v21[-3], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9100]), v18);
            v21[-4] = vmlaq_f32(v21[-4], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9096]), v18);
            v21[-3] = v25;
            float32x4_t v26 = vmlaq_f32(v21[-1], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9108]), v18);
            v21[-2] = vmlaq_f32(v21[-2], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9104]), v18);
            v21[-1] = v26;
            float32x4_t v27 = vmlaq_f32(v21[1], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9116]), v18);
            float32x4_t *v21 = vmlaq_f32(*v21, vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9112]), v18);
            v21[1] = v27;
            float32x4_t v28 = vmlaq_f32(v21[3], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9124]), v18);
            v21[2] = vmlaq_f32(v21[2], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9120]), v18);
            v21[3] = v28;
            float32x4_t v29 = vmlaq_f32(v21[5], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9132]), v18);
            v21[4] = vmlaq_f32(v21[4], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9128]), v18);
            v21[5] = v29;
            float32x4_t v30 = vmlaq_f32(v21[7], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9140]), v18);
            v21[6] = vmlaq_f32(v21[6], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9136]), v18);
            v21[7] = v30;
            float32x4_t v31 = vmlaq_f32(v21[9], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9148]), v18);
            v21[8] = vmlaq_f32(v21[8], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9144]), v18);
            v21[9] = v31;
            v21[10] = vmlaq_f32(v21[10], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v20 + 9152]), v18);
            v21 = (float32x4_t *)((char *)v21 + BytesPerRow);
            v20 += 84;
          }
          while (v20 * 4);
          ++v7;
          v19 += 108;
        }
        while (v7 != v11);
      }
      else
      {
        uint64_t v34 = (uint64_t)&BaseAddress[10] + 108 * BytesPerRow * v7;
        do
        {
          uint64_t v35 = 0x3FFFFFFFFFFFDC90;
          v36 = (float32x4_t *)v34;
          do
          {
            float32x4_t v37 = vmlaq_f32(v36[-9], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9076]), v18);
            v36[-10] = vmlaq_f32(v36[-10], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9072]), v18);
            v36[-9] = v37;
            float32x4_t v38 = vmlaq_f32(v36[-7], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9084]), v18);
            v36[-8] = vmlaq_f32(v36[-8], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9080]), v18);
            v36[-7] = v38;
            float32x4_t v39 = vmlaq_f32(v36[-5], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9092]), v18);
            v36[-6] = vmlaq_f32(v36[-6], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9088]), v18);
            v36[-5] = v39;
            float32x4_t v40 = vmlaq_f32(v36[-3], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9100]), v18);
            v36[-4] = vmlaq_f32(v36[-4], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9096]), v18);
            v36[-3] = v40;
            float32x4_t v41 = vmlaq_f32(v36[-1], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9108]), v18);
            v36[-2] = vmlaq_f32(v36[-2], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9104]), v18);
            v36[-1] = v41;
            float32x4_t v42 = vmlaq_f32(v36[1], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9116]), v18);
            float32x4_t *v36 = vmlaq_f32(*v36, vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9112]), v18);
            v36[1] = v42;
            float32x4_t v43 = vmlaq_f32(v36[3], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9124]), v18);
            v36[2] = vmlaq_f32(v36[2], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9120]), v18);
            v36[3] = v43;
            float32x4_t v44 = vmlaq_f32(v36[5], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9132]), v18);
            v36[4] = vmlaq_f32(v36[4], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9128]), v18);
            v36[5] = v44;
            float32x4_t v45 = vmlaq_f32(v36[7], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9140]), v18);
            v36[6] = vmlaq_f32(v36[6], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9136]), v18);
            v36[7] = v45;
            float32x4_t v46 = vmlaq_f32(v36[9], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9148]), v18);
            v36[8] = vmlaq_f32(v36[8], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9144]), v18);
            v36[9] = v46;
            v36[10] = vmlaq_f32(v36[10], vcvtq_f32_u32(*(uint32x4_t *)&(*v19)[v35 + 9152]), v18);
            v36 = (float32x4_t *)((char *)v36 + BytesPerRow);
            v35 += 84;
          }
          while (v35 * 4);
          ++v7;
          v19 += 108;
          v34 += 108 * BytesPerRow;
        }
        while (v7 != v11);
      }
    }
    if (a4 == 1278226534)
    {
      v33 = v15;
    }
    else
    {
      if (a4 != 875704422) {
        __assert_rtn("-[PDImageReconstruct createImageForBank:pixelFormat:normalizeByExposure:]", "PDImageReconstruct.mm", 253, "false");
      }
      uint64_t v47 = 0;
      float v48 = 0.0;
      v49 = BaseAddress;
      do
      {
        for (uint64_t i = 0; i != 84; ++i)
        {
          if (v48 < v49->f32[i]) {
            float v48 = v49->f32[i];
          }
        }
        ++v47;
        v49 = (float32x4_t *)((char *)v49 + BytesPerRow);
      }
      while (v47 != v10);
      pixelBufferOut[0] = 0;
      CFDictionaryRef v51 = (const __CFDictionary *)getBufferAttributes();
      if (CVPixelBufferCreate(v12, 0x54uLL, v10, 0x34323066u, v51, pixelBufferOut)) {
        v33 = 0;
      }
      else {
        v33 = pixelBufferOut[0];
      }
      CVPixelBufferLockBaseAddress(v33, 0);
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v33, 0);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v33, 0);
      uint64_t v54 = 0;
      float v55 = 255.0 / v48;
      v56 = BaseAddress;
      v57 = BaseAddressOfPlane;
      do
      {
        v61 = (float32x4_t *)((char *)BaseAddress + v54 * BytesPerRow);
        v62 = (int8x16_t *)&BaseAddressOfPlane[v54 * BytesPerRowOfPlane];
        if (v62 >= (int8x16_t *)&v61[21] || v61 >= (float32x4_t *)((char *)v62[5].i64 + 4))
        {
          *(int16x4_t *)v58.i8 = vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(*v61, v55)));
          v58.u64[1] = (unint64_t)vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[1], v55)));
          *(int16x4_t *)v59.i8 = vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[2], v55)));
          v59.u64[1] = (unint64_t)vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[3], v55)));
          int8x16_t *v62 = vuzp1q_s8(v58, v59);
          *(int16x4_t *)v58.i8 = vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[4], v55)));
          v58.u64[1] = (unint64_t)vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[5], v55)));
          *(int16x4_t *)v59.i8 = vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[6], v55)));
          v59.u64[1] = (unint64_t)vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[7], v55)));
          v62[1] = vuzp1q_s8(v58, v59);
          *(int16x4_t *)v58.i8 = vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[8], v55)));
          v58.u64[1] = (unint64_t)vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[9], v55)));
          *(int16x4_t *)v59.i8 = vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[10], v55)));
          v59.u64[1] = (unint64_t)vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[11], v55)));
          v62[2] = vuzp1q_s8(v58, v59);
          *(int16x4_t *)v58.i8 = vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[12], v55)));
          v58.u64[1] = (unint64_t)vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[13], v55)));
          *(int16x4_t *)v59.i8 = vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[14], v55)));
          v59.u64[1] = (unint64_t)vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[15], v55)));
          v62[3] = vuzp1q_s8(v58, v59);
          *(int16x4_t *)v58.i8 = vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[16], v55)));
          v58.u64[1] = (unint64_t)vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[17], v55)));
          *(int16x4_t *)v59.i8 = vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[18], v55)));
          v59.u64[1] = (unint64_t)vmovn_s32(vcvtq_s32_f32(vmulq_n_f32(v61[19], v55)));
          v62[4] = vuzp1q_s8(v58, v59);
          int16x8_t v60 = (int16x8_t)vcvtq_s32_f32(vmulq_n_f32(v61[20], v55));
          *(int16x4_t *)v60.i8 = vmovn_s32((int32x4_t)v60);
          v62[5].i32[0] = vmovn_s16(v60).u32[0];
        }
        else
        {
          for (uint64_t j = 0; j != 84; ++j)
            v57[j] = (int)(float)((float)(v56->f32[j] * 255.0) * (float)(1.0 / v48));
        }
        ++v54;
        v57 += BytesPerRowOfPlane;
        v56 = (float32x4_t *)((char *)v56 + BytesPerRow);
      }
      while (v54 != v10);
      size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(v33, 1uLL);
      size_t v66 = CVPixelBufferGetBytesPerRowOfPlane(v33, 1uLL);
      v67 = CVPixelBufferGetBaseAddressOfPlane(v33, 1uLL);
      memset(v67, 128, v66 * HeightOfPlane);
      CVPixelBufferUnlockBaseAddress(v15, 0);
      CVPixelBufferRelease(v15);
    }
    CVPixelBufferUnlockBaseAddress(v33, 0);
  }
  else
  {
    PixelBufferUtils::pixelFormatAsString(*(unint64_t *)&a4, (char *)pixelBufferOut);
    if (v71 >= 0) {
      v32 = pixelBufferOut;
    }
    else {
      v32 = (CVPixelBufferRef *)pixelBufferOut[0];
    }
    peridot_depth_log("Cannot create peridot image for pixel format '%s'", (const char *)v32);
    if (v71 < 0) {
      operator delete(pixelBufferOut[0]);
    }
    return 0;
  }
  return v33;
}

- (BOOL)pushFrames:(id)a3
{
  uint64_t v3 = ((uint64_t (*)(PDImageReconstruct *, SEL, id))MEMORY[0x270FA5388])(self, a2, a3);
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = v4;
  v36 = (unsigned char *)[v5 bytes];
  unint64_t v6 = [v5 length];
  uint64_t v47 = 0;
  BOOL v7 = 1;
  v45[0] = 0;
  v45[1] = 0;
  if (v6)
  {
    do
    {
      unint64_t v44 = 0;
      if ((PeridotSuperFrame::loadFromBuffer((PeridotSuperFrame *)v45, v36, v6, &v44) & 1) == 0)
      {
        BOOL v7 = 0;
        goto LABEL_31;
      }
      uint64_t v8 = 0;
      unint64_t v35 = v6 - v44;
      v36 += v44;
      uint64_t v39 = v45[0];
      uint64_t v42 = v46 - 8032;
      uint64_t v43 = v46;
      uint64_t v41 = v46 + 896;
      while (v8 != v39)
      {
        char v9 = &v45[v8];
        uint64_t v10 = v9[227];
        if (*(unsigned __int8 *)(v10 + 50) >= 3u)
        {
          uint64_t v11 = v9[3];
          float32x4_t v38 = (unsigned char *)v9[115];
          char v37 = v38[2];
          int v40 = *(_DWORD *)(v10 + 36) + *(_DWORD *)(v10 + 36) * *(unsigned __int8 *)(v10 + 3);
          int v12 = *(_DWORD *)(v3 + 40);
          if (v12 && v40 != v12) {
            peridot_depth_log("Not all frames have same exposure time");
          }
          unint64_t v13 = 0;
          *(_DWORD *)(v3 + 40) = v40;
          int v14 = v38[5];
          int v15 = v38[6];
          uint64_t v16 = v41;
          uint64_t v17 = v42;
          do
          {
            float32x4_t v18 = (char *)(v11 + v13 + 4);
            v19 = (char *)(v11 + v13 + 32);
            uint64_t v20 = (unsigned __int16 *)(v11 + 2 * v13 + 60);
            uint64_t v21 = v43 + 9280 * v8 + 640 * v13;
            if (v13 >= 0xE)
            {
              char v28 = 0;
              uint64_t v29 = 0;
              float32x4_t v30 = (_DWORD *)(v21 - 8008);
              do
              {
                if ((*v20 >> v29))
                {
                  uint64_t v31 = (v14 + *v18 + dword_2591211E0[v29]);
                  if (v31 <= 0x53)
                  {
                    unsigned int v32 = v15 + *v19 + dword_259121210[v29];
                    if (v32 <= 0x6B)
                    {
                      v33 = (unsigned char *)(*(void *)(v3 + 32) + 9072 * (v37 - 1) + 84 * v32 + v31);
                      if (!*v33)
                      {
                        unsigned char *v33 = 1;
                        *(_DWORD *)(*(void *)(v3 + 24) + 36288 * (v37 - 1) + 336 * v32 + 4 * v31) = (*v30 >> v28) & 3 | (4 * *(unsigned __int16 *)(v17 + 2 * v29));
                      }
                    }
                  }
                }
                ++v29;
                v28 += 2;
              }
              while (v29 != 12);
            }
            else
            {
              char v22 = 0;
              uint64_t v23 = 0;
              float32x4_t v24 = (_DWORD *)(v21 + 920);
              do
              {
                if ((*v20 >> v23))
                {
                  uint64_t v25 = (v14 + *v18 + dword_2591211E0[v23]);
                  if (v25 <= 0x53)
                  {
                    unsigned int v26 = v15 + *v19 + dword_259121210[v23];
                    if (v26 <= 0x6B)
                    {
                      float32x4_t v27 = (unsigned char *)(*(void *)(v3 + 32) + 9072 * (v37 - 1) + 84 * v26 + v25);
                      if (!*v27)
                      {
                        *float32x4_t v27 = 1;
                        *(_DWORD *)(*(void *)(v3 + 24) + 36288 * (v37 - 1) + 336 * v26 + 4 * v25) = (*v24 >> v22) & 3 | (4 * *(unsigned __int16 *)(v16 + 2 * v23));
                      }
                    }
                  }
                }
                ++v23;
                v22 += 2;
              }
              while (v23 != 12);
            }
            ++v13;
            v17 += 640;
            v16 += 640;
          }
          while (v13 != 28);
        }
        ++v8;
        v42 += 9280;
        v41 += 9280;
      }
      unint64_t v6 = v35;
    }
    while (v35);
    BOOL v7 = 1;
  }
LABEL_31:
  if (v47) {
    MEMORY[0x25A2D62A0](v47, 0x1000C801E9FC43BLL);
  }

  return v7;
}

- (void)reset
{
  self->_exposure = 0;
}

- (PDImageReconstruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)PDImageReconstruct;
  v2 = [(PDImageReconstruct *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF990] dataWithLength:290304];
    allImages = v2->_allImages;
    v2->_allImages = (NSMutableData *)v3;

    v2->_bankImages = (unsigned int (*)[108][84])[(NSMutableData *)v2->_allImages mutableBytes];
    uint64_t v5 = [MEMORY[0x263EFF990] dataWithLength:72576];
    allMasks = v2->_allMasks;
    v2->_allMasks = (NSMutableData *)v5;

    v2->_bankMasks = (BOOL (*)[108][84])[(NSMutableData *)v2->_allMasks mutableBytes];
    [(PDImageReconstruct *)v2 reset];
  }
  return v2;
}

@end