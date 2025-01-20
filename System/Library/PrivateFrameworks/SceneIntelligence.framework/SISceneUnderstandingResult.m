@interface SISceneUnderstandingResult
+ (CGSize)outputDimensions;
- ($FD4688982923A924290ECB669CAF1EC2)labelsTensor;
- ($FD4688982923A924290ECB669CAF1EC2)normalsTensor;
- ($FD4688982923A924290ECB669CAF1EC2)probabilitiesTensor;
- (CGSize)resolution;
- (SISceneUnderstandingResult)initWithModel:(id)a3;
- (_SITensorDim)labelTensorDimensions;
- (_SITensorDim)normalTensorDimensions;
- (_SITensorDim)probabilitiesTensorDimensions;
- (int64_t)writeLabels:(__CVBuffer *)a3;
- (int64_t)writeNormals:(__CVBuffer *)a3 orientation:(int64_t)a4;
- (int64_t)writeProbabilities:(__CVBuffer *)a3;
- (void)dealloc;
@end

@implementation SISceneUnderstandingResult

+ (CGSize)outputDimensions
{
  double v2 = 256.0;
  double v3 = 192.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- ($FD4688982923A924290ECB669CAF1EC2)labelsTensor
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->_labelsTensor;
}

- ($FD4688982923A924290ECB669CAF1EC2)normalsTensor
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->_normalsTensor;
}

- ($FD4688982923A924290ECB669CAF1EC2)probabilitiesTensor
{
  return ($FD4688982923A924290ECB669CAF1EC2 *)&self->_probabilitiesTensor;
}

- (SISceneUnderstandingResult)initWithModel:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SISceneUnderstandingResult;
  v5 = [(SISceneUnderstandingResult *)&v14 init];
  if (v5)
  {
    int8x16_t v6 = 0uLL;
    int8x16_t v7 = 0uLL;
    if (v4)
    {
      [v4 labelTensorDimensions];
      int8x16_t v7 = 0u;
      int8x16_t v6 = 0u;
    }
    int8x16_t v19 = vextq_s8(v6, v6, 8uLL);
    int8x16_t v20 = vextq_s8(v7, v7, 8uLL);
    espresso_buffer_pack_tensor_shape();
    v5->_labelsTensor.data = malloc_type_malloc(0, 0xDA899A75uLL);
    v5->_labelsTensor.storage_type = 65568;
    int8x16_t v8 = 0uLL;
    int8x16_t v9 = 0uLL;
    if (v4)
    {
      [v4 normalTensorDimensions];
      int8x16_t v9 = 0u;
      int8x16_t v8 = 0u;
    }
    int8x16_t v17 = vextq_s8(v8, v8, 8uLL);
    int8x16_t v18 = vextq_s8(v9, v9, 8uLL);
    espresso_buffer_pack_tensor_shape();
    v5->_normalsTensor.data = malloc_type_malloc(0, 0xEFB61280uLL);
    v5->_normalsTensor.storage_type = 65568;
    int8x16_t v10 = 0uLL;
    int8x16_t v11 = 0uLL;
    if (v4)
    {
      [v4 probabilitiesTensorDimensions];
      int8x16_t v11 = 0u;
      int8x16_t v10 = 0u;
    }
    int8x16_t v15 = vextq_s8(v10, v10, 8uLL);
    int8x16_t v16 = vextq_s8(v11, v11, 8uLL);
    espresso_buffer_pack_tensor_shape();
    v5->_probabilitiesTensor.data = malloc_type_malloc(0, 0x5D2612BCuLL);
    v5->_probabilitiesTensor.storage_type = 65568;
    v5->_resolution = (CGSize)vcvtq_f64_u64((uint64x2_t)0);
    v12 = v5;
  }

  return v5;
}

- (void)dealloc
{
  free(self->_labelsTensor.data);
  free(self->_normalsTensor.data);
  free(self->_probabilitiesTensor.data);
  v3.receiver = self;
  v3.super_class = (Class)SISceneUnderstandingResult;
  [(SISceneUnderstandingResult *)&v3 dealloc];
}

- (int64_t)writeNormals:(__CVBuffer *)a3 orientation:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  unint64_t width = self->_normalsTensor.width;
  unint64_t height = self->_normalsTensor.height;
  unint64_t stride_channels = self->_normalsTensor.stride_channels;
  kdebug_trace();
  IOSurface = CVPixelBufferGetIOSurface(a3);
  IOSurfaceLock(IOSurface, 0, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(IOSurface);
  buffer = IOSurface;
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(IOSurface);
  unint64_t v30 = height;
  if (height)
  {
    uint64_t v14 = 0;
    data = (char *)self->_normalsTensor.data;
    int8x16_t v16 = &data[8 * stride_channels];
    int8x16_t v17 = &data[4 * stride_channels];
    int8x16_t v18 = BaseAddress + 8;
    uint64_t v28 = 4 * (BytesPerRow >> 2);
    uint64_t v29 = 4 * width;
    do
    {
      uint64_t v31 = v14;
      if (width)
      {
        uint64_t v19 = 0;
        int8x16_t v20 = v18;
        do
        {
          v13.i32[0] = *(_DWORD *)&data[4 * v19];
          v13.i32[1] = *(_DWORD *)&v17[4 * v19];
          v13.i32[2] = *(_DWORD *)&v16[4 * v19];
          float32x4_t v21 = vnegq_f32(v13);
          float32x4_t v13 = vmulq_f32(v13, v13);
          v13.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32((int32x4_t)v13, 2), vadd_f32(*(float32x2_t *)v13.f32, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v13.f32, 1))).u32[0];
          float32x2_t v22 = vrsqrte_f32((float32x2_t)v13.u32[0]);
          float32x2_t v23 = vmul_f32(v22, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v22, v22)));
          *(float32x2_t *)v13.f32 = vmul_f32(v23, vrsqrts_f32((float32x2_t)v13.u32[0], vmul_f32(v23, v23)));
          float32x4_t v24 = vmulq_n_f32(v21, v13.f32[0]);
          switch(a4)
          {
            case 0:
              break;
            case 1:
              float32x4_t v13 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.f32, 1);
              v13.f32[1] = -v24.f32[0];
              goto LABEL_9;
            case 2:
              v13.f32[0] = -v24.f32[1];
              float32x4_t v13 = (float32x4_t)vzip1q_s32((int32x4_t)v13, (int32x4_t)v24);
              goto LABEL_9;
            case 3:
              float32x4_t v13 = vnegq_f32(v24);
LABEL_9:
              v13.i32[2] = v24.i32[2];
              float32x4_t v24 = v13;
              break;
            default:
              float32x4_t v32 = v24;
              v25 = __SceneIntelligenceLogSharedInstance();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136380931;
                v34 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Features/SceneUnderstanding/SIScene"
                      "Understanding.mm";
                __int16 v35 = 1025;
                int v36 = 190;
                _os_log_impl(&dword_21B697000, v25, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Unknown orientation! ***", buf, 0x12u);
              }

              float32x4_t v24 = v32;
              break;
          }
          *((void *)v20 - 1) = v24.i64[0];
          *int8x16_t v20 = v24.i32[2];
          v20[1] = 1065353216;
          ++v19;
          v20 += 4;
        }
        while (width != v19);
      }
      uint64_t v14 = v31 + 1;
      v16 += v29;
      v17 += v29;
      data += v29;
      int8x16_t v18 = (_DWORD *)((char *)v18 + v28);
    }
    while (v31 + 1 != v30);
  }
  IOSurfaceUnlock(buffer, 0, 0);
  kdebug_trace();
  return 0;
}

- (int64_t)writeProbabilities:(__CVBuffer *)a3
{
  unint64_t width = self->_probabilitiesTensor.width;
  unint64_t height = self->_probabilitiesTensor.height;
  kdebug_trace();
  IOSurface = CVPixelBufferGetIOSurface(a3);
  IOSurfaceLock(IOSurface, 0, 0);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(IOSurface);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(IOSurface);
  if (height)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    data = self->_probabilitiesTensor.data;
    float32x4_t v13 = (float *)self->_labelsTensor.data;
    unint64_t stride_channels = self->_probabilitiesTensor.stride_channels;
    unsigned int channels_low = LOBYTE(self->_probabilitiesTensor.channels);
    uint64_t v16 = 4 * (BytesPerRow >> 2);
    do
    {
      uint64_t v17 = v10;
      int8x16_t v18 = BaseAddress;
      for (unint64_t i = width; i; --i)
      {
        LODWORD(BytesPerRow) = llroundf(v13[v17]);
        if (channels_low <= BytesPerRow) {
          size_t BytesPerRow = 0;
        }
        size_t BytesPerRow = v17 + BytesPerRow * stride_channels;
        *v18++ = data[BytesPerRow];
        ++v17;
      }
      ++v11;
      BaseAddress += v16;
      v10 += width;
    }
    while (v11 != height);
  }
  IOSurfaceUnlock(IOSurface, 0, 0);
  kdebug_trace();
  return 0;
}

- (int64_t)writeLabels:(__CVBuffer *)a3
{
  unint64_t width = self->_labelsTensor.width;
  unint64_t height = self->_labelsTensor.height;
  kdebug_trace();
  IOSurface = CVPixelBufferGetIOSurface(a3);
  IOSurfaceLock(IOSurface, 0, 0);
  BaseAddress = IOSurfaceGetBaseAddress(IOSurface);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(IOSurface);
  if (height)
  {
    uint64_t v10 = 0;
    data = (float *)self->_labelsTensor.data;
    do
    {
      v12 = data;
      float32x4_t v13 = BaseAddress;
      for (unint64_t i = width; i; --i)
      {
        float v15 = *v12++;
        *v13++ = llroundf(v15);
      }
      ++v10;
      BaseAddress += BytesPerRow;
      data += width;
    }
    while (v10 != height);
  }
  IOSurfaceUnlock(IOSurface, 0, 0);
  kdebug_trace();
  return 0;
}

- (CGSize)resolution
{
  double width = self->_resolution.width;
  double height = self->_resolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (_SITensorDim)labelTensorDimensions
{
  long long v3 = *(_OWORD *)self[17].value;
  *(_OWORD *)retstr->value = *(_OWORD *)&self[16].value[2];
  *(_OWORD *)&retstr->value[2] = v3;
  return self;
}

- (_SITensorDim)normalTensorDimensions
{
  long long v3 = *(_OWORD *)self[18].value;
  *(_OWORD *)retstr->value = *(_OWORD *)&self[17].value[2];
  *(_OWORD *)&retstr->value[2] = v3;
  return self;
}

- (_SITensorDim)probabilitiesTensorDimensions
{
  long long v3 = *(_OWORD *)self[19].value;
  *(_OWORD *)retstr->value = *(_OWORD *)&self[18].value[2];
  *(_OWORD *)&retstr->value[2] = v3;
  return self;
}

@end