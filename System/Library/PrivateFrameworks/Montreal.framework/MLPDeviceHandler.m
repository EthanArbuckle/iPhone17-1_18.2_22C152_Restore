@interface MLPDeviceHandler
- (MLPDeviceHandler)initWithDataLayout:(id)a3;
- (MTLCommandQueue)commandQueue;
- (MTLDevice)device;
- (float)uniformRandWithParamA:(float)a3 paramB:(float)a4;
- (id).cxx_construct;
- (id)biasVectorWithLength:(unint64_t)a3 stdDev:(float)a4 values:(const void *)a5;
- (id)deduceDevice;
- (id)imageBatchFromMatrix:(id)a3 m2iKernel:(id)a4 cmdBuf:(id)a5 width:(unint64_t)a6 height:(unint64_t)a7 channels:(unint64_t)a8;
- (id)imageFromData:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 featureChannels:(unint64_t)a6;
- (id)imageFromMatrix:(id)a3 m2iKernel:(id)a4 cmdBuf:(id)a5 width:(unint64_t)a6 height:(unint64_t)a7 featureChannels:(unint64_t)a8;
- (id)matrixFromImages:(id)a3 i2mKernel:(id)a4 cmdBuf:(id)a5;
- (id)matrixToVector:(id)a3;
- (id)matrixWithRows:(unint64_t)a3 columns:(unint64_t)a4 cmdBuf:(id)a5;
- (id)tempMatrixFromImages:(id)a3 i2mKernel:(id)a4 cmdBuf:(id)a5;
- (id)tempMatrixWithRows:(unint64_t)a3 columns:(unint64_t)a4 cmdBuf:(id)a5;
- (id)vectorWithLength:(unint64_t)a3 cmdBuf:(id)a4;
- (id)weightMatrixFixedRowBytesWithRows:(unint64_t)a3 columns:(unint64_t)a4;
- (id)weightMatrixWithRows:(unint64_t)a3 columns:(unint64_t)a4 stdDev:(float)a5 initialValues:(const void *)a6 columnMajor:(BOOL)a7;
- (unint64_t)dataLayout;
@end

@implementation MLPDeviceHandler

- (MLPDeviceHandler)initWithDataLayout:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MLPDeviceHandler;
  v5 = [(MLPDeviceHandler *)&v26 init];
  v8 = v5;
  if (!v5) {
    goto LABEL_11;
  }
  unsigned int v9 = 1;
  v5->weightSeed.__x_[0] = 1;
  uint64_t v10 = 3;
  uint64_t v11 = 1;
  do
  {
    int v12 = 1812433253 * (v9 ^ (v9 >> 30));
    unsigned int v9 = v12 + v11;
    *((_DWORD *)&v5->super.isa + v10) = v10 + v12 - 2;
    ++v11;
    ++v10;
  }
  while (v10 != 626);
  v5->weightSeed.__i_ = 0;
  v5->_dataLayout = 1;
  if (objc_msgSend_isEqualToString_(v4, v6, (uint64_t)MLPModelTrainerDataLayoutFeatureChannelsxHeightxWidth, v7))
  {
    uint64_t v16 = 1;
LABEL_8:
    v8->_dataLayout = v16;
    goto LABEL_9;
  }
  if (objc_msgSend_isEqualToString_(v4, v13, (uint64_t)MLPModelTrainerDataLayoutHeightxWidthxFeatureChannels, v15))
  {
    uint64_t v16 = 0;
    goto LABEL_8;
  }
LABEL_9:
  v18 = objc_msgSend_deduceDevice(v8, v13, v14, v15);
  if (!v18)
  {
    objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E4F1CA00], v17, *MEMORY[0x1E4F1C3B8], @"Could not find metal device", 0);
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v25);
  }
  objc_storeStrong((id *)&v8->_device, v18);
  uint64_t v22 = objc_msgSend_newCommandQueue(v18, v19, v20, v21);
  commandQueue = v8->_commandQueue;
  v8->_commandQueue = (MTLCommandQueue *)v22;

LABEL_11:
  return v8;
}

- (id)deduceDevice
{
  id v2 = MTLCreateSystemDefaultDevice();

  return v2;
}

- (id)weightMatrixFixedRowBytesWithRows:(unint64_t)a3 columns:(unint64_t)a4
{
  unint64_t v5 = 4 * a4;
  v6 = objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(MEMORY[0x1E4F35640], a2, a3, a4, 4 * a4, 268435488);
  uint64_t v10 = objc_msgSend_device(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_rows(v6, v11, v12, v13);
  uint64_t v16 = objc_msgSend_newBufferWithLength_options_(v10, v15, v14 * v5, 0);

  id v17 = objc_alloc(MEMORY[0x1E4F35618]);
  v19 = objc_msgSend_initWithBuffer_descriptor_(v17, v18, (uint64_t)v16, (uint64_t)v6);
  id v20 = v16;
  v24 = objc_msgSend_contents(v20, v21, v22, v23);
  size_t v28 = objc_msgSend_length(v20, v25, v26, v27);
  bzero(v24, v28);

  return v19;
}

- (id)weightMatrixWithRows:(unint64_t)a3 columns:(unint64_t)a4 stdDev:(float)a5 initialValues:(const void *)a6 columnMajor:(BOOL)a7
{
  BOOL v8 = a7;
  uint64_t v14 = objc_msgSend_rowBytesForColumns_dataType_(MEMORY[0x1E4F35640], a2, a4, 268435488);
  unint64_t v98 = a3;
  unint64_t v103 = a4;
  uint64_t v16 = objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(MEMORY[0x1E4F35640], v15, a3, a4, v14, 268435488);
  v100 = self;
  id v20 = objc_msgSend_device(self, v17, v18, v19);
  uint64_t v24 = objc_msgSend_rows(v16, v21, v22, v23);
  uint64_t v26 = objc_msgSend_newBufferWithLength_options_(v20, v25, v24 * v14, 0);

  id v27 = objc_alloc(MEMORY[0x1E4F35618]);
  uint64_t v29 = objc_msgSend_initWithBuffer_descriptor_(v27, v28, (uint64_t)v26, (uint64_t)v16);
  id v30 = v26;
  v37 = objc_msgSend_contents(v30, v31, v32, v33);
  v96 = v30;
  id v97 = (id)v29;
  if (a6)
  {
    unint64_t v38 = v103 * v98;
    if (v103 * v98)
    {
      if (v38 >> 62) {
        sub_19E13D694();
      }
      v39 = operator new(4 * v38);
      bzero(v39, 4 * v38);
    }
    else
    {
      v39 = 0;
    }
    size_t v73 = objc_msgSend_length(v30, v34, v35, v36);
    bzero(v37, v73);
    id v74 = v30;
    uint64_t v78 = objc_msgSend_contents(v74, v75, v76, v77, v26, v30);
    if (v98)
    {
      unint64_t v82 = v98;
      if (!v8) {
        unint64_t v82 = v103;
      }
      if (v103)
      {
        uint64_t v83 = v78;
        uint64_t v84 = 0;
        uint64_t v85 = 4 * v82;
        if (v8)
        {
          do
          {
            unint64_t v86 = v103;
            uint64_t v87 = v83;
            v88 = a6;
            do
            {
              *(_DWORD *)(v87 + v84 * objc_msgSend_rowBytes(v16, v79, v80, v81)) = *v88;
              v88 = (_DWORD *)((char *)v88 + v85);
              v87 += 4;
              --v86;
            }
            while (v86);
            ++v84;
            a6 = (char *)a6 + 4;
          }
          while (v84 != v98);
        }
        else
        {
          do
          {
            unint64_t v89 = v103;
            uint64_t v90 = v83;
            v91 = (int *)a6;
            do
            {
              uint64_t v92 = objc_msgSend_rowBytes(v16, v79, v80, v81);
              int v93 = *v91++;
              *(_DWORD *)(v90 + v84 * v92) = v93;
              v90 += 4;
              --v89;
            }
            while (v89);
            ++v84;
            a6 = (char *)a6 + v85;
          }
          while (v84 != v98);
        }
      }
    }
    if (v39) {
      operator delete(v39);
    }
  }
  else if (a5 <= 0.0)
  {
    size_t v94 = objc_msgSend_length(v30, v34, v35, v36);
    bzero(v37, v94);
  }
  else
  {
    size_t v40 = objc_msgSend_length(v30, v34, v35, v36);
    bzero(v37, v40);
    id v41 = v30;
    uint64_t v101 = objc_msgSend_contents(v41, v42, v43, v44, v26, v30);
    if (v98 && v103)
    {
      uint64_t v102 = 0;
      int v48 = 0;
      p_weightSeed = &v100->weightSeed;
      int8x8_t v50 = (int8x8_t)vdup_n_s32(0x9D2C5680);
      int8x8_t v51 = (int8x8_t)vdup_n_s32(0xEFC60000);
      __asm { FMOV            V13.2S, #-1.0 }
      do
      {
        for (uint64_t i = 0; i != v103; ++i)
        {
          uint64_t v59 = objc_msgSend_rowBytes(v16, v45, v46, v47);
          if (v48)
          {
            int v48 = 0;
            float v58 = v7;
          }
          else
          {
            unint64_t v60 = v100->weightSeed.__i_;
            unsigned int v61 = p_weightSeed->__x_[v60];
            do
            {
              unint64_t v62 = (v60 + 1) % 0x270;
              uint64_t v63 = v62;
              unsigned int v64 = p_weightSeed->__x_[(v60 + 397) % 0x270] ^ ((p_weightSeed->__x_[v62] & 0x7FFFFFFE | v61 & 0x80000000) >> 1) ^ ((int)(p_weightSeed->__x_[v62] << 31) >> 31) & 0x9908B0DF;
              p_weightSeed->__x_[v60] = v64;
              if (v62 < 0x26F) {
                unint64_t v60 = v62 + 1;
              }
              else {
                unint64_t v60 = v62 - 623;
              }
              if (v62 >= 0xE3) {
                uint64_t v65 = -227;
              }
              else {
                uint64_t v65 = 397;
              }
              unsigned int v61 = p_weightSeed->__x_[v60];
              unsigned int v66 = p_weightSeed->__x_[v65 + v62] ^ ((v61 & 0x7FFFFFFE | p_weightSeed->__x_[v62] & 0x80000000) >> 1) ^ ((int)(v61 << 31) >> 31) & 0x9908B0DF;
              p_weightSeed->__x_[v63] = v66;
              int32x2_t v67 = (int32x2_t)veor_s8((int8x8_t)vshr_n_u32((uint32x2_t)__PAIR64__(v64, v66), 0xBuLL), (int8x8_t)__PAIR64__(v64, v66));
              int32x2_t v68 = (int32x2_t)veor_s8(vand_s8((int8x8_t)vshl_n_s32(v67, 7uLL), v50), (int8x8_t)v67);
              int8x8_t v69 = veor_s8(vand_s8((int8x8_t)vshl_n_s32(v68, 0xFuLL), v51), (int8x8_t)v68);
              float32x2_t v70 = vmla_f32(_D13, vcvt_f32_u32((uint32x2_t)veor_s8((int8x8_t)vshr_n_u32((uint32x2_t)v69, 0x12uLL), v69)), (float32x2_t)0x3000000030000000);
              float v71 = vaddv_f32(vmul_f32(v70, v70));
            }
            while (v71 > 1.0 || v71 == 0.0);
            v100->weightSeed.__i_ = v60;
            float32x2_t v99 = v70;
            float v72 = sqrtf((float)(logf(v71) * -2.0) / v71);
            float v7 = v72 * v99.f32[0];
            float v58 = vmuls_lane_f32(v72, v99, 1);
            int v48 = 1;
          }
          *(float *)(v101 + v59 * v102 + 4 * i) = v58 * a5;
        }
        ++v102;
      }
      while (v102 != v98);
    }
  }

  return v97;
}

- (id)biasVectorWithLength:(unint64_t)a3 stdDev:(float)a4 values:(const void *)a5
{
  unint64_t v7 = a3;
  LODWORD(v41) = 0;
  *((float *)&v41 + 1) = a4;
  char v42 = 0;
  uint64_t v9 = objc_msgSend_vectorDescriptorWithLength_dataType_(MEMORY[0x1E4F35998], a2, a3, 268435488, v41);
  uint64_t v11 = objc_msgSend_vectorBytesForLength_dataType_(MEMORY[0x1E4F35998], v10, v7, 268435488);
  uint64_t v15 = objc_msgSend_device(self, v12, v13, v14);
  id v17 = objc_msgSend_newBufferWithLength_options_(v15, v16, v11, 0);

  id v18 = objc_alloc(MEMORY[0x1E4F35990]);
  id v20 = objc_msgSend_initWithBuffer_descriptor_(v18, v19, (uint64_t)v17, (uint64_t)v9);
  id v21 = v17;
  uint64_t v25 = objc_msgSend_contents(v21, v22, v23, v24);
  uint64_t v29 = (float *)v25;
  if (a5)
  {
    if (v7)
    {
      unint64_t v30 = 0;
      if (v7 < 8) {
        goto LABEL_8;
      }
      if ((unint64_t)(v25 - (void)a5) < 0x20) {
        goto LABEL_8;
      }
      unint64_t v30 = v7 & 0xFFFFFFFFFFFFFFF8;
      v31 = (long long *)((char *)a5 + 16);
      uint64_t v32 = (_OWORD *)(v25 + 16);
      unint64_t v33 = v7 & 0xFFFFFFFFFFFFFFF8;
      do
      {
        long long v34 = *v31;
        *(v32 - 1) = *(v31 - 1);
        *uint64_t v32 = v34;
        v31 += 2;
        v32 += 2;
        v33 -= 8;
      }
      while (v33);
      if (v30 != v7)
      {
LABEL_8:
        uint64_t v35 = (_DWORD *)(v25 + 4 * v30);
        uint64_t v36 = (int *)((char *)a5 + 4 * v30);
        unint64_t v37 = v7 - v30;
        do
        {
          int v38 = *v36++;
          *v35++ = v38;
          --v37;
        }
        while (v37);
      }
    }
  }
  else if (a4 <= 0.0)
  {
    size_t v39 = objc_msgSend_length(v21, v26, v27, v28);
    bzero(v29, v39);
  }
  else
  {
    for (; v7; --v7)
      *v29++ = sub_19E238C94((uint64_t)&v41, (uint64_t)&self->weightSeed, (float *)&v41);
  }

  return v20;
}

- (id)imageFromData:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 featureChannels:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v12 = objc_msgSend_imageDescriptorWithChannelFormat_width_height_featureChannels_(MEMORY[0x1E4F35578], v11, 4, a4, a5, a6);
  id v13 = objc_alloc(MEMORY[0x1E4F35530]);
  id v17 = objc_msgSend_device(self, v14, v15, v16);
  uint64_t v19 = objc_msgSend_initWithDevice_imageDescriptor_(v13, v18, (uint64_t)v17, (uint64_t)v12);

  id v20 = v10;
  uint64_t v24 = objc_msgSend_bytes(v20, v21, v22, v23);
  uint64_t v28 = objc_msgSend_dataLayout(self, v25, v26, v27);
  objc_msgSend_writeBytes_dataLayout_imageIndex_(v19, v29, v24, v28, 0);

  return v19;
}

- (id)imageFromMatrix:(id)a3 m2iKernel:(id)a4 cmdBuf:(id)a5 width:(unint64_t)a6 height:(unint64_t)a7 featureChannels:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v17 = objc_msgSend_imageDescriptorWithChannelFormat_width_height_featureChannels_(MEMORY[0x1E4F35578], v16, 4, a6, a7, a8);
  uint64_t v19 = objc_msgSend_temporaryImageWithCommandBuffer_imageDescriptor_(MEMORY[0x1E4F35978], v18, (uint64_t)v15, (uint64_t)v17);
  objc_msgSend_encodeToCommandBuffer_sourceMatrix_destinationImage_(v14, v20, (uint64_t)v15, (uint64_t)v13, v19);

  return v19;
}

- (id)imageBatchFromMatrix:(id)a3 m2iKernel:(id)a4 cmdBuf:(id)a5 width:(unint64_t)a6 height:(unint64_t)a7 channels:(unint64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  uint64_t v19 = objc_msgSend_rows(v13, v16, v17, v18);
  uint64_t v22 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v20, v19, v21);
  for (uint64_t i = objc_msgSend_imageDescriptorWithChannelFormat_width_height_featureChannels_(MEMORY[0x1E4F35578], v23, 4, a6, a7, a8);
  {
    uint64_t v26 = objc_msgSend_temporaryImageWithCommandBuffer_imageDescriptor_(MEMORY[0x1E4F35978], v24, (uint64_t)v15, (uint64_t)i);
    objc_msgSend_addObject_(v22, v27, (uint64_t)v26, v28);
  }
  objc_msgSend_encodeBatchToCommandBuffer_sourceMatrix_destinationImages_(v14, v24, (uint64_t)v15, (uint64_t)v13, v22);

  return v22;
}

- (id)tempMatrixWithRows:(unint64_t)a3 columns:(unint64_t)a4 cmdBuf:(id)a5
{
  id v7 = a5;
  uint64_t v9 = objc_msgSend_rowBytesForColumns_dataType_(MEMORY[0x1E4F35640], v8, a4, 268435488);
  uint64_t v11 = objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(MEMORY[0x1E4F35640], v10, a3, a4, v9, 268435488);
  id v13 = objc_msgSend_temporaryMatrixWithCommandBuffer_matrixDescriptor_(MEMORY[0x1E4F35980], v12, (uint64_t)v7, (uint64_t)v11);

  return v13;
}

- (id)matrixWithRows:(unint64_t)a3 columns:(unint64_t)a4 cmdBuf:(id)a5
{
  unint64_t v5 = objc_msgSend_weightMatrixWithRows_columns_stdDev_initialValues_columnMajor_(self, a2, a3, a4, 0, 0, 0.0);

  return v5;
}

- (id)tempMatrixFromImages:(id)a3 i2mKernel:(id)a4 cmdBuf:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_count(v8, v11, v12, v13);
  uint64_t v17 = objc_msgSend_objectAtIndexedSubscript_(v8, v15, 0, v16);
  uint64_t v21 = objc_msgSend_featureChannels(v17, v18, v19, v20);
  uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(v8, v22, 0, v23);
  uint64_t v28 = objc_msgSend_width(v24, v25, v26, v27);
  v31 = objc_msgSend_objectAtIndexedSubscript_(v8, v29, 0, v30);
  uint64_t v35 = v28 * v21 * objc_msgSend_height(v31, v32, v33, v34);

  unint64_t v37 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(self, v36, v14, v35, v10);
  objc_msgSend_encodeBatchToCommandBuffer_sourceImages_destinationMatrix_(v9, v38, (uint64_t)v10, (uint64_t)v8, v37);

  return v37;
}

- (id)matrixFromImages:(id)a3 i2mKernel:(id)a4 cmdBuf:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = objc_msgSend_count(v8, v11, v12, v13);
  uint64_t v17 = objc_msgSend_objectAtIndexedSubscript_(v8, v15, 0, v16);
  uint64_t v21 = objc_msgSend_featureChannels(v17, v18, v19, v20);
  uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(v8, v22, 0, v23);
  uint64_t v28 = objc_msgSend_width(v24, v25, v26, v27);
  v31 = objc_msgSend_objectAtIndexedSubscript_(v8, v29, 0, v30);
  uint64_t v35 = v28 * v21 * objc_msgSend_height(v31, v32, v33, v34);

  unint64_t v37 = objc_msgSend_matrixWithRows_columns_cmdBuf_(self, v36, v14, v35, v10);
  objc_msgSend_encodeBatchToCommandBuffer_sourceImages_destinationMatrix_(v9, v38, (uint64_t)v10, (uint64_t)v8, v37);

  return v37;
}

- (id)vectorWithLength:(unint64_t)a3 cmdBuf:(id)a4
{
  unint64_t v5 = objc_msgSend_vectorDescriptorWithLength_dataType_(MEMORY[0x1E4F35998], a2, a3, 268435488);
  id v6 = objc_alloc(MEMORY[0x1E4F35990]);
  id v10 = objc_msgSend_device(self, v7, v8, v9);
  uint64_t v12 = objc_msgSend_initWithDevice_descriptor_(v6, v11, (uint64_t)v10, (uint64_t)v5);

  return v12;
}

- (id)matrixToVector:(id)a3
{
  id v3 = a3;
  unint64_t v7 = objc_msgSend_rowBytes(v3, v4, v5, v6);
  uint64_t v11 = objc_msgSend_rows(v3, v8, v9, v10);
  uint64_t v13 = objc_msgSend_vectorDescriptorWithLength_dataType_(MEMORY[0x1E4F35998], v12, v11 * (v7 >> 2), 268435488);
  id v14 = objc_alloc(MEMORY[0x1E4F35990]);
  uint64_t v18 = objc_msgSend_data(v3, v15, v16, v17);
  uint64_t v20 = objc_msgSend_initWithBuffer_descriptor_(v14, v19, (uint64_t)v18, (uint64_t)v13);

  return v20;
}

- (float)uniformRandWithParamA:(float)a3 paramB:(float)a4
{
  unint64_t i = self->weightSeed.__i_;
  unint64_t v5 = i;
  unint64_t v6 = (i + 1) % 0x270;
  LODWORD(i) = self->weightSeed.__x_[(i + 397) % 0x270] ^ ((self->weightSeed.__x_[v6] & 0x7FFFFFFE | self->weightSeed.__x_[i] & 0x80000000) >> 1) ^ ((int)(self->weightSeed.__x_[v6] << 31) >> 31) & 0x9908B0DF;
  self->weightSeed.__x_[v5] = i;
  int v7 = ((i ^ (i >> 11)) << 7) & 0x9D2C5680 ^ i ^ (i >> 11);
  self->weightSeed.__i_ = v6;
  return a3
       + (float)((float)((float)(a4 - a3) * 2.3283e-10)
               * (float)((v7 << 15) & 0xEFC60000 ^ v7 ^ (((v7 << 15) & 0xEFC60000 ^ v7) >> 18)));
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 2512, 1);
}

- (MTLCommandQueue)commandQueue
{
  return (MTLCommandQueue *)objc_getProperty(self, a2, 2520, 1);
}

- (unint64_t)dataLayout
{
  return self->_dataLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (id).cxx_construct
{
  unsigned int v2 = 5489;
  *((_DWORD *)self + 2) = 5489;
  uint64_t v3 = 1;
  for (uint64_t i = 3; i != 626; ++i)
  {
    int v5 = 1812433253 * (v2 ^ (v2 >> 30));
    unsigned int v2 = v5 + v3;
    *((_DWORD *)self + i) = i + v5 - 2;
    ++v3;
  }
  *((void *)self + 313) = 0;
  return self;
}

@end