@interface VGMLEspressoBuffer
- (BOOL)bindImage:(__CVBuffer *)a3;
- (BOOL)bindManagedBuffer;
- (BOOL)bindTensor:(id)a3;
- (BOOL)checkBufferAndIOSurfaceConsistency:(id)a3;
- (BOOL)copyBufferIntoIOSurface:(id)a3;
- (VGMLEspressoBuffer)initWithNetwork:(id *)a3 withLayerName:(id)a4 withMode:(int)a5;
- (const)getData;
- (const)getDimensions;
- (unint64_t)getSize;
@end

@implementation VGMLEspressoBuffer

- (VGMLEspressoBuffer)initWithNetwork:(id *)a3 withLayerName:(id)a4 withMode:(int)a5
{
  id v9 = a4;
  self->_network = a3;
  objc_storeStrong((id *)&self->_layerName, a4);
  self->_mode = a5;
  [(NSString *)self->_layerName UTF8String];
  espresso_network_query_blob_dimensions();

  return self;
}

- (BOOL)bindManagedBuffer
{
  return 1;
}

- (BOOL)bindTensor:(id)a3
{
  id v4 = a3;
  self->_buffer.data = (void *)[v4 getData];
  int8x16_t v6 = vextq_s8(*(int8x16_t *)&self->_dimensions[2], *(int8x16_t *)&self->_dimensions[2], 8uLL);
  int8x16_t v7 = vextq_s8(*(int8x16_t *)self->_dimensions, *(int8x16_t *)self->_dimensions, 8uLL);
  espresso_buffer_pack_tensor_shape();
  [(NSString *)self->_layerName UTF8String];
  espresso_network_bind_buffer();

  return 1;
}

- (BOOL)bindImage:(__CVBuffer *)a3
{
  return 1;
}

- (const)getDimensions
{
  return self->_dimensions;
}

- (unint64_t)getSize
{
  return self->_dimensions[1] * self->_dimensions[0] * self->_dimensions[2] * self->_dimensions[3];
}

- (const)getData
{
  return self->_buffer.data;
}

- (BOOL)checkBufferAndIOSurfaceConsistency:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 pixelFormat];
  uint64_t v6 = [v4 width];
  uint64_t v7 = [v4 height];
  uint64_t v8 = VGGetChannelsFromPixelFormat(v5);
  id v9 = v4;
  uint64_t v10 = [v9 baseAddress];
  BOOL v11 = v10 != 0;
  if (!v10)
  {
    v12 = __VGLogSharedInstance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_260C8D000, v12, OS_LOG_TYPE_ERROR, " IOSurface provided for VGMLEspresso buffer output is empty. ", (uint8_t *)&v20, 2u);
    }
  }
  if (v8 != self->_dimensions[0])
  {
    v13 = __VGLogSharedInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      unint64_t v14 = self->_dimensions[0];
      int v20 = 134218240;
      uint64_t v21 = v8;
      __int16 v22 = 2048;
      unint64_t v23 = v14;
      _os_log_impl(&dword_260C8D000, v13, OS_LOG_TYPE_ERROR, " IOSurface channels %zu != %zu ", (uint8_t *)&v20, 0x16u);
    }

    BOOL v11 = 0;
  }
  if (v7 != self->_dimensions[1])
  {
    v15 = __VGLogSharedInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      unint64_t v16 = self->_dimensions[1];
      int v20 = 134218240;
      uint64_t v21 = v7;
      __int16 v22 = 2048;
      unint64_t v23 = v16;
      _os_log_impl(&dword_260C8D000, v15, OS_LOG_TYPE_ERROR, " IOSurface height %zu != %zu ", (uint8_t *)&v20, 0x16u);
    }

    BOOL v11 = 0;
  }
  if (v6 != self->_dimensions[2])
  {
    v17 = __VGLogSharedInstance();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      unint64_t v18 = self->_dimensions[2];
      int v20 = 134218240;
      uint64_t v21 = v6;
      __int16 v22 = 2048;
      unint64_t v23 = v18;
      _os_log_impl(&dword_260C8D000, v17, OS_LOG_TYPE_ERROR, " IOSurface width %zu != %zu ", (uint8_t *)&v20, 0x16u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)copyBufferIntoIOSurface:(id)a3
{
  id v4 = a3;
  data = (char *)self->_buffer.data;
  id v47 = v4;
  uint64_t v6 = [v4 count];
  if (v6)
  {
    uint64_t v7 = 0;
    BOOL v8 = 1;
    do
    {
      if (v8)
      {
        id v9 = [v47 objectAtIndexedSubscript:v7];
        BOOL v8 = [(VGMLEspressoBuffer *)self checkBufferAndIOSurfaceConsistency:v9];
      }
      else
      {
        BOOL v8 = 0;
      }
      ++v7;
    }
    while (v6 != v7);
    if (!v8)
    {
      v19 = __VGLogSharedInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_260C8D000, v19, OS_LOG_TYPE_ERROR, " IOSurface(s) not consistent with the espresso output buffer. ", (uint8_t *)&buf, 2u);
      }

      BOOL v17 = 0;
      goto LABEL_32;
    }
  }
  uint64_t v10 = [v47 objectAtIndexedSubscript:0];
  int v11 = [v10 pixelFormat];

  v12 = [v47 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 width];

  unint64_t v14 = [v47 objectAtIndexedSubscript:0];
  uint64_t v46 = [v14 height];

  uint64_t v15 = VGGetChannelsFromPixelFormat(v11);
  vImagePixelCount v16 = v15 * v13;
  BOOL v17 = 1;
  if (v11 <= 1278226535)
  {
    if (v11 != 843264102)
    {
      int v18 = 843264104;
LABEL_17:
      if (v11 != v18) {
        goto LABEL_32;
      }
      goto LABEL_18;
    }
  }
  else
  {
    if (v11 == 1278226536)
    {
LABEL_18:
      if (v6)
      {
        uint64_t v44 = v6;
        v45 = data;
        uint64_t v20 = 0;
        uint64_t v43 = 4 * v13 * v15 * v46;
        uint64_t v21 = 4 * v13 * v15;
        do
        {
          __int16 v22 = objc_msgSend(v47, "objectAtIndexedSubscript:", v20, v43, v44);
          [v22 lockWithOptions:0 seed:0];

          if (v46)
          {
            uint64_t v23 = 0;
            uint64_t v24 = v45;
            do
            {
              id v25 = [v47 objectAtIndexedSubscript:v20];
              uint64_t v26 = [v25 baseAddress];
              v27 = [v47 objectAtIndexedSubscript:v20];
              v28 = (void *)(v26 + [v27 bytesPerRow] * v23);

              buf.data = v28;
              buf.height = 1;
              buf.width = v16;
              buf.rowBytes = 2 * v16;
              src.data = v24;
              src.height = 1;
              src.width = v16;
              src.rowBytes = 4 * v16;
              vImageConvert_PlanarFtoPlanar16F(&src, &buf, 0);
              ++v23;
              v24 += v21;
            }
            while (v46 != v23);
          }
          v29 = [v47 objectAtIndexedSubscript:v20];
          [v29 unlockWithOptions:0 seed:0];

          ++v20;
          v45 += v43;
        }
        while (v20 != v44);
LABEL_31:
        BOOL v17 = 1;
        goto LABEL_32;
      }
      goto LABEL_32;
    }
    if (v11 != 1380410945)
    {
      int v18 = 1380411457;
      goto LABEL_17;
    }
  }
  if (v6)
  {
    uint64_t v30 = v6;
    uint64_t v31 = 0;
    size_t v32 = 4 * v16;
    uint64_t v33 = 4 * v13 * v46 * v15;
    do
    {
      v34 = [v47 objectAtIndexedSubscript:v31];
      [v34 lockWithOptions:0 seed:0];

      if (v46)
      {
        uint64_t v35 = 0;
        v36 = data;
        do
        {
          id v37 = [v47 objectAtIndexedSubscript:v31];
          uint64_t v38 = [v37 baseAddress];
          v39 = [v47 objectAtIndexedSubscript:v31];
          v40 = (void *)(v38 + [v39 bytesPerRow] * v35);

          memcpy(v40, v36, v32);
          ++v35;
          v36 += v32;
        }
        while (v46 != v35);
      }
      v41 = [v47 objectAtIndexedSubscript:v31];
      [v41 unlockWithOptions:0 seed:0];

      ++v31;
      data += v33;
    }
    while (v31 != v30);
    goto LABEL_31;
  }
LABEL_32:

  return v17;
}

- (void).cxx_destruct
{
}

@end