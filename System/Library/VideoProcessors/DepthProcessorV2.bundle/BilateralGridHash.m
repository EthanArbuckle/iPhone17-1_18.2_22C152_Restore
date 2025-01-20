@interface BilateralGridHash
- (BOOL)_hashMapFindKey:(unint64_t)a3 to:(unsigned int *)a4;
- (BilateralGridHash)initWithWidth:(unsigned int)a3 height:(unsigned int)a4 maxHashTableSize:(unint64_t)a5;
- (const)blur_indices:(int)a3 n_blur_indices:(int *)a4;
- (const)blur_table;
- (const)coord_indices;
- (const)coord_table;
- (const)hash_matrix;
- (const)hash_table;
- (const)interp_indices;
- (const)interp_pad;
- (const)interp_table;
- (int)_addHashKeyAtX:(unsigned int)a3 Y:(unsigned int)a4 key:(unint64_t)a5;
- (int)_computeBilateralSpace:(__CVBuffer *)a3 sigma_s:(unsigned int)a4 sigma_r_luma:(unsigned int)a5 sigma_r_chroma:(unsigned int)a6;
- (int)create:(__CVBuffer *)a3 sigma_s:(int)a4 sigma_r_luma:(int)a5 sigma_r_chroma:(int)a6;
- (int)sigma_r_chroma;
- (int)sigma_r_luma;
- (int)sigma_s;
- (unsigned)countDims;
- (unsigned)hashTableSize;
- (unsigned)height;
- (unsigned)width;
- (void)_hashMapAddKey:(unint64_t)a3 andValue:(unsigned int)a4;
- (void)blur:(const float *)a3 pout:(float *)a4;
- (void)blur_n:(float *)a3;
- (void)blur_ones:(float *)a3;
- (void)clear;
- (void)computeBlurIndices;
- (void)computeCoordIndices;
- (void)computeInterpIndices;
- (void)dealloc;
- (void)normalize:(const float *)a3 pout:(float *)a4;
- (void)normalize_blur:(const float *)a3 pout:(float *)a4;
- (void)releaseResources;
- (void)slice:(const float *)a3 outPixelBuffer:(__CVBuffer *)a4;
- (void)slice_trilinear:(__CVBuffer *)a3 pin:(const float *)a4 pout:(__CVBuffer *)a5;
- (void)splat:(__CVBuffer *)a3 pout:(float *)a4;
- (void)splat_ones:(float *)a3;
- (void)splat_w_mul_x:(__CVBuffer *)a3 inPixelBuffer:(__CVBuffer *)a4 pout:(float *)a5;
@end

@implementation BilateralGridHash

- (unsigned)hashTableSize
{
  return self->_hash_table_size;
}

- (unsigned)countDims
{
  return self->_n_dims;
}

- (unsigned)width
{
  return self->_width;
}

- (unsigned)height
{
  return self->_height;
}

- (int)sigma_s
{
  return self->_sigma_s;
}

- (int)sigma_r_luma
{
  return self->_sigma_r_luma;
}

- (int)sigma_r_chroma
{
  return self->_sigma_r_chroma;
}

- (BilateralGridHash)initWithWidth:(unsigned int)a3 height:(unsigned int)a4 maxHashTableSize:(unint64_t)a5
{
  v23.receiver = self;
  v23.super_class = (Class)BilateralGridHash;
  v8 = [(BilateralGridHash *)&v23 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_12;
  }
  v8->_n_dims = 0;
  v8->_width = a3;
  size_t v10 = a4 * a3;
  v8->_height = a4;
  v8->_sigma_s = 0;
  *(void *)&v8->_sigma_r_luma = 0;
  v8->_max_hash_table_size = a5;
  v8->_hash_table_size = 0;
  v11 = (unsigned int *)malloc_type_calloc(v10, 4uLL, 0x100004052888210uLL);
  v9->_hash_matrix_data = v11;
  if (!v11) {
    goto LABEL_14;
  }
  v12 = ($69A9110356A13E7EEDB7CF5BC87805D4 *)malloc_type_malloc(24 * a5, 0x1000040504FFAC1uLL);
  v9->_hash_table = v12;
  if (!v12) {
    goto LABEL_14;
  }
  v13 = (unsigned int *)malloc_type_malloc(40 * a5, 0x100004052888210uLL);
  v9->_blur_indices = v13;
  if (!v13) {
    goto LABEL_14;
  }
  v14 = (unsigned int *)malloc_type_malloc(4 * a5 + 4, 0x100004052888210uLL);
  v9->_coord_indices = v14;
  if (!v14) {
    goto LABEL_14;
  }
  v15 = (unsigned int *)malloc_type_malloc(4 * v10, 0x100004052888210uLL);
  v9->_coord_table = v15;
  if (!v15) {
    goto LABEL_14;
  }
  v16 = (unsigned int *)malloc_type_malloc(4 * a5, 0x100004052888210uLL);
  v9->_coord_indices_off = v16;
  if (!v16) {
    goto LABEL_14;
  }
  v17 = (unsigned int *)malloc_type_malloc(4 * a5 + 4, 0x100004052888210uLL);
  v9->_interp_indices = v17;
  if (!v17) {
    goto LABEL_14;
  }
  v18 = (unsigned int *)malloc_type_malloc(20 * a5, 0x100004052888210uLL);
  v9->_interp_table = v18;
  if (v18
    && (v19 = (char *)malloc_type_malloc(5 * a5, 0x100004077774924uLL), (v9->_interp_pad = v19) != 0)
    && (v20 = sub_262E99F10(a5), (v9->_hash_map = (BGHashMapContext *)v20) != 0))
  {
LABEL_12:
    v21 = v9;
  }
  else
  {
LABEL_14:
    FigDebugAssert3();
    FigSignalErrorAt();
    v21 = 0;
  }

  return v21;
}

- (void)releaseResources
{
  hash_matrix_data = self->_hash_matrix_data;
  if (hash_matrix_data)
  {
    self->_hash_matrix_data = 0;
    free(hash_matrix_data);
  }
  hash_table = self->_hash_table;
  if (hash_table)
  {
    self->_hash_table = 0;
    free(hash_table);
  }
  blur_indices = self->_blur_indices;
  if (blur_indices)
  {
    self->_blur_indices = 0;
    free(blur_indices);
  }
  coord_indices = self->_coord_indices;
  if (coord_indices)
  {
    self->_coord_indices = 0;
    free(coord_indices);
  }
  coord_table = self->_coord_table;
  if (coord_table)
  {
    self->_coord_table = 0;
    free(coord_table);
  }
  coord_indices_off = self->_coord_indices_off;
  if (coord_indices_off)
  {
    self->_coord_indices_off = 0;
    free(coord_indices_off);
  }
  interp_indices = self->_interp_indices;
  if (interp_indices)
  {
    self->_interp_indices = 0;
    free(interp_indices);
  }
  interp_table = self->_interp_table;
  if (interp_table)
  {
    self->_interp_table = 0;
    free(interp_table);
  }
  interp_pad = self->_interp_pad;
  if (interp_pad)
  {
    self->_interp_pad = 0;
    free(interp_pad);
  }
  hash_map = self->_hash_map;

  sub_262E99FA0(hash_map);
}

- (void)dealloc
{
  objc_msgSend_releaseResources(self, a2, v2, v3, v4, v5);
  v7.receiver = self;
  v7.super_class = (Class)BilateralGridHash;
  [(BilateralGridHash *)&v7 dealloc];
}

- (void)clear
{
  *(void *)&self->_sigma_r_luma = 0;
  self->_sigma_s = 0;
  self->_hash_table_size = 0;
  sub_262E99FF4((uint64_t)self->_hash_map);
}

- (int)create:(__CVBuffer *)a3 sigma_s:(int)a4 sigma_r_luma:(int)a5 sigma_r_chroma:(int)a6
{
  if (a4 <= 0) {
    goto LABEL_11;
  }
  uint64_t v6 = *(void *)&a5;
  if (a5 <= 0) {
    goto LABEL_11;
  }
  uint64_t v7 = *(void *)&a6;
  if (a6 <= 0) {
    goto LABEL_11;
  }
  uint64_t v8 = *(void *)&a4;
  objc_msgSend_clear(self, a2, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a6);
  int result = objc_msgSend__computeBilateralSpace_sigma_s_sigma_r_luma_sigma_r_chroma_(self, v11, (uint64_t)a3, v8, v6, v7);
  if (!result) {
    return result;
  }
  unsigned int width = self->_width;
  unsigned int height = self->_height;
  self->_hash_table_size = 0;
  hash_matrix_data = self->_hash_matrix_data;
  if (hash_matrix_data) {
    bzero(hash_matrix_data, 4 * height * width);
  }
  else {
LABEL_11:
  }
    FigDebugAssert3();

  return FigSignalErrorAt();
}

- (void)splat:(__CVBuffer *)a3 pout:(float *)a4
{
  if (a3 && a4 && self->_hash_matrix_data)
  {
    unsigned int v9 = objc_msgSend_hashTableSize(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
    int v15 = objc_msgSend_width(self, v10, v11, v12, v13, v14);
    int v21 = objc_msgSend_height(self, v16, v17, v18, v19, v20);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    size_t v23 = CVPixelBufferGetBytesPerRow(a3);
    bzero(a4, 4 * v9);
    if (v21)
    {
      int v24 = 0;
      for (int i = 0; i != v21; ++i)
      {
        if (v15)
        {
          uint64_t v26 = 0;
          hash_matrix_data = self->_hash_matrix_data;
          do
          {
            uint64_t v28 = hash_matrix_data[(v24 + v26)];
            a4[v28] = *(float *)(v23 + 4 * v26++) + a4[v28];
          }
          while (v15 != v26);
        }
        v23 += BytesPerRow;
        v24 += v15;
      }
    }
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)splat_w_mul_x:(__CVBuffer *)a3 inPixelBuffer:(__CVBuffer *)a4 pout:(float *)a5
{
  if (a3 && a4 && a5 && self->_hash_matrix_data)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    if (PixelFormatType == 1278226534 || PixelFormatType == 1717855600 || PixelFormatType == 1717856627)
    {
      unsigned int v36 = objc_msgSend_hashTableSize(self, v10, v11, v12, v13, v14);
      int v20 = objc_msgSend_width(self, v15, v16, v17, v18, v19);
      int v26 = objc_msgSend_height(self, v21, v22, v23, v24, v25);
      CVPixelBufferLockBaseAddress(a3, 0);
      CVPixelBufferLockBaseAddress(a4, 0);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      size_t v28 = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      BaseAddressOfPlane = (float *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      v30 = (float *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      bzero(a5, 4 * v36);
      if (v26)
      {
        int v31 = 0;
        for (int i = 0; i != v26; ++i)
        {
          if (v20)
          {
            uint64_t v33 = 0;
            hash_matrix_data = self->_hash_matrix_data;
            do
            {
              uint64_t v35 = hash_matrix_data[(v31 + v33)];
              a5[v35] = a5[v35] + (float)(BaseAddressOfPlane[v33] * v30[v33]);
              ++v33;
            }
            while (v20 != v33);
          }
          BaseAddressOfPlane = (float *)((char *)BaseAddressOfPlane + BytesPerRowOfPlane);
          v30 = (float *)((char *)v30 + v28);
          v31 += v20;
        }
      }
      CVPixelBufferUnlockBaseAddress(a3, 0);
      CVPixelBufferUnlockBaseAddress(a4, 0);
      return;
    }
  }
  else
  {
    FigDebugAssert3();
  }

  FigSignalErrorAt();
}

- (void)slice:(const float *)a3 outPixelBuffer:(__CVBuffer *)a4
{
  if (a3 && a4 && self->_hash_matrix_data)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a4);
    if (PixelFormatType == 1278226534 || PixelFormatType == 1717855600 || PixelFormatType == 1717856627)
    {
      int v13 = objc_msgSend_width(self, v8, v9, v10, v11, v12);
      int v19 = objc_msgSend_height(self, v14, v15, v16, v17, v18);
      CVPixelBufferLockBaseAddress(a4, 0);
      size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
      BaseAddressOfPlane = (float *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
      if (v19)
      {
        int v22 = 0;
        for (int i = 0; i != v19; ++i)
        {
          if (v13)
          {
            uint64_t v24 = 0;
            hash_matrix_data = self->_hash_matrix_data;
            do
            {
              BaseAddressOfPlane[v24] = a3[hash_matrix_data[(v22 + v24)]];
              ++v24;
            }
            while (v13 != v24);
          }
          BaseAddressOfPlane = (float *)((char *)BaseAddressOfPlane + BytesPerRowOfPlane);
          v22 += v13;
        }
      }
      CVPixelBufferUnlockBaseAddress(a4, 0);
      return;
    }
  }
  else
  {
    FigDebugAssert3();
  }

  FigSignalErrorAt();
}

- (void)slice_trilinear:(__CVBuffer *)a3 pin:(const float *)a4 pout:(__CVBuffer *)a5
{
  if (a3 && a4 && a5 && self->_hash_matrix_data && self->_interp_indices && self->_interp_table && self->_interp_pad)
  {
    int v10 = objc_msgSend_width(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, v5);
    int v16 = objc_msgSend_height(self, v11, v12, v13, v14, v15);
    CVPixelBufferLockBaseAddress(a3, 0);
    CVPixelBufferLockBaseAddress(a5, 0);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    size_t v18 = CVPixelBufferGetBytesPerRowOfPlane(a5, 0);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    int v20 = (float *)CVPixelBufferGetBaseAddressOfPlane(a5, 0);
    if (v16)
    {
      for (unsigned int i = 0; i != v16; ++i)
      {
        if (v10)
        {
          uint64_t v23 = 0;
          float sigma_s = (float)self->_sigma_s;
          float sigma_r_luma = (float)self->_sigma_r_luma;
          float v26 = (float)((float)i / sigma_s) - (float)(int)(float)((float)i / sigma_s);
          hash_matrix_data = self->_hash_matrix_data;
          interp_indices = self->_interp_indices;
          do
          {
            LOBYTE(v21) = BaseAddressOfPlane[v23];
            float v29 = (float)((float)v23 / sigma_s) - (float)(int)(float)((float)v23 / sigma_s);
            uint64_t v30 = hash_matrix_data[i * v10 + v23];
            uint64_t v31 = interp_indices[v30];
            float v21 = (float)((float)LODWORD(v21) / sigma_r_luma) - (float)(int)(float)((float)LODWORD(v21) / sigma_r_luma);
            uint64_t v32 = interp_indices[(v30 + 1)];
            float v33 = (float)((float)(1.0 - v29) * (float)(1.0 - v26)) * (float)(1.0 - v21);
            float v34 = a4[v30] * v33;
            if (v31 < v32)
            {
              uint64_t v35 = &self->_interp_table[v31];
              unsigned int v36 = &self->_interp_pad[v31];
              uint64_t v37 = v32 - v31;
              do
              {
                unsigned int v39 = *v35++;
                uint64_t v38 = v39;
                LOBYTE(v39) = *v36++;
                char v40 = v39;
                if (v39) {
                  float v41 = (float)((float)v23 / sigma_s)
                }
                      - (float)(int)(float)((float)v23 / sigma_s);
                else {
                  float v41 = 1.0 - v29;
                }
                if ((v40 & 2) != 0) {
                  float v42 = (float)((float)i / sigma_s) - (float)(int)(float)((float)i / sigma_s);
                }
                else {
                  float v42 = 1.0 - v26;
                }
                float v43 = v41 * v42;
                if ((v40 & 4) != 0) {
                  float v44 = v21;
                }
                else {
                  float v44 = 1.0 - v21;
                }
                float v45 = v44 * v43;
                float v34 = v34 + (float)(v45 * a4[v38]);
                float v33 = v33 + v45;
                --v37;
              }
              while (v37);
            }
            v20[v23++] = v34 / v33;
          }
          while (v23 != v10);
        }
        BaseAddressOfPlane += BytesPerRowOfPlane;
        int v20 = (float *)((char *)v20 + v18);
      }
    }
    CVPixelBufferUnlockBaseAddress(a3, 0);
    CVPixelBufferUnlockBaseAddress(a5, 0);
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)blur:(const float *)a3 pout:(float *)a4
{
  if (a3 && a4 && self->_hash_table && self->_blur_indices)
  {
    int v9 = objc_msgSend_countDims(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
    unsigned int v15 = objc_msgSend_hashTableSize(self, v10, v11, v12, v13, v14);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = a4;
      size_t v18 = a3;
      do
      {
        float v19 = *v18++;
        *v17++ = v19 * (float)(2 * v9);
        --v16;
      }
      while (v16);
      hash_table = self->_hash_table;
      do
      {
        if (v16) {
          unint64_t var4 = hash_table[v16 - 1].var4;
        }
        else {
          unint64_t var4 = 0;
        }
        unint64_t v22 = hash_table[v16].var4;
        if (var4 < v22)
        {
          float v23 = a4[v16];
          uint64_t v24 = &self->_blur_indices[var4];
          unint64_t v25 = v22 - var4;
          do
          {
            int v26 = *v24++;
            float v23 = a3[v26] + v23;
            a4[v16] = v23;
            --v25;
          }
          while (v25);
        }
        ++v16;
      }
      while (v16 != v15);
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)normalize:(const float *)a3 pout:(float *)a4
{
  if (a3 && (uint64_t v6 = a4) != 0 && self->_hash_table)
  {
    uint64_t v8 = a3;
    unsigned int v9 = objc_msgSend_hashTableSize(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
    if (v9)
    {
      uint64_t v10 = v9;
      p_var1 = &self->_hash_table->var1;
      do
      {
        float v12 = *v8++;
        float v13 = v12;
        unsigned int v14 = *p_var1;
        p_var1 += 6;
        *v6++ = v13 / (float)v14;
        --v10;
      }
      while (v10);
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)normalize_blur:(const float *)a3 pout:(float *)a4
{
  if (a3 && (uint64_t v6 = a4) != 0 && self->_hash_table)
  {
    uint64_t v8 = a3;
    unsigned int v9 = objc_msgSend_hashTableSize(self, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
    if (v9)
    {
      uint64_t v10 = v9;
      p_var2 = &self->_hash_table->var2;
      do
      {
        float v12 = *v8++;
        float v13 = v12;
        unsigned int v14 = *p_var2;
        p_var2 += 6;
        *v6++ = v13 / (float)v14;
        --v10;
      }
      while (v10);
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)splat_ones:(float *)a3
{
  if (a3 && self->_hash_table)
  {
    uint64_t v7 = a3;
    unsigned int v8 = objc_msgSend_hashTableSize(self, a2, (uint64_t)a3, v3, v4, v5);
    if (v8)
    {
      uint64_t v9 = v8;
      p_var1 = &self->_hash_table->var1;
      do
      {
        unsigned int v11 = *p_var1;
        p_var1 += 6;
        *v7++ = (float)v11;
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)blur_ones:(float *)a3
{
  if (a3 && self->_hash_table)
  {
    uint64_t v7 = a3;
    unsigned int v8 = objc_msgSend_hashTableSize(self, a2, (uint64_t)a3, v3, v4, v5);
    if (v8)
    {
      uint64_t v9 = v8;
      p_var2 = &self->_hash_table->var2;
      do
      {
        unsigned int v11 = *p_var2;
        p_var2 += 6;
        *v7++ = (float)v11;
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)blur_n:(float *)a3
{
  if (a3 && self->_hash_table)
  {
    uint64_t v7 = a3;
    unsigned int v8 = objc_msgSend_hashTableSize(self, a2, (uint64_t)a3, v3, v4, v5);
    if (v8)
    {
      uint64_t v9 = v8;
      p_var3 = &self->_hash_table->var3;
      do
      {
        unsigned int v11 = *p_var3;
        p_var3 += 6;
        *v7++ = (float)v11;
        --v9;
      }
      while (v9);
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (const)blur_indices:(int)a3 n_blur_indices:(int *)a4
{
  if (a4 && (hash_table = self->_hash_table) != 0 && (blur_indices = self->_blur_indices) != 0)
  {
    if (a3 < 1) {
      unsigned int var4 = 0;
    }
    else {
      unsigned int var4 = hash_table[a3 - 1].var4;
    }
    *a4 = hash_table[a3].var4 - var4;
    return &blur_indices[var4];
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    return 0;
  }
}

- (const)hash_table
{
  return self->_hash_table;
}

- (const)hash_matrix
{
  return self->_hash_matrix_data;
}

- (const)blur_table
{
  return self->_blur_indices;
}

- (const)coord_indices
{
  return self->_coord_indices;
}

- (const)coord_table
{
  return self->_coord_table;
}

- (const)interp_indices
{
  return self->_interp_indices;
}

- (const)interp_table
{
  return self->_interp_table;
}

- (const)interp_pad
{
  return self->_interp_pad;
}

- (int)_computeBilateralSpace:(__CVBuffer *)a3 sigma_s:(unsigned int)a4 sigma_r_luma:(unsigned int)a5 sigma_r_chroma:(unsigned int)a6
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  if (a3)
  {
    self->_n_dims = 5;
    self->_float sigma_s = a4;
    self->_float sigma_r_luma = a5;
    self->_sigma_r_chroma = a6;
    unsigned int Width = CVPixelBufferGetWidth(a3);
    unsigned int Height = CVPixelBufferGetHeight(a3);
    CVPixelBufferLockBaseAddress(a3, 0);
    size_t BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    size_t v45 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    v50 = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
    if (Height >= 2)
    {
      int v46 = 0;
      unsigned int v43 = Height >> 1;
      unsigned int v14 = Width >> 1;
      if (Width >> 1 <= 1) {
        unsigned int v14 = 1;
      }
      uint64_t v47 = 2 * v14;
      unsigned int v15 = a4;
      unsigned int v44 = Width;
      while (Width < 2)
      {
LABEL_14:
        BaseAddressOfPlane += 2 * BytesPerRowOfPlane;
        unsigned int Width = v44;
        v50 += v45;
        if (++v46 == v43)
        {
          int v13 = 0;
          goto LABEL_21;
        }
      }
      uint64_t v16 = 0;
      uint64_t v17 = (2 * v46);
      unsigned int v49 = v17 / v15;
      size_t v18 = &BaseAddressOfPlane[BytesPerRowOfPlane];
      unsigned int v19 = (v17 | 1) / v15;
      while (1)
      {
        unsigned int v20 = BaseAddressOfPlane[v16];
        unsigned int v21 = BaseAddressOfPlane[v16 + 1];
        unsigned int v22 = v18[v16];
        unsigned int v23 = v18[v16 + 1];
        unsigned int v24 = v50[v16] / a6;
        unsigned int v25 = v50[v16 + 1] / a6;
        v52[0] = v16 / v15;
        v52[1] = v49;
        v52[2] = v20 / a5;
        v52[3] = v24;
        v52[4] = v25;
        v53[0] = ((int)v16 + 1) / v15;
        v53[1] = v49;
        v53[2] = v21 / a5;
        v53[3] = v24;
        v53[4] = v25;
        v54[0] = v52[0];
        v54[1] = v19;
        v54[2] = v22 / a5;
        v54[3] = v24;
        v54[4] = v25;
        v55[0] = v53[0];
        v55[1] = v19;
        v55[2] = v23 / a5;
        v55[3] = v24;
        v55[4] = v25;
        unint64_t v26 = sub_262EAE900((uint64_t)v52, 5);
        int v29 = objc_msgSend__addHashKeyAtX_Y_key_(self, v27, v16, v17, v26, v28);
        if (v29)
        {
          int v13 = v29;
          goto LABEL_20;
        }
        unint64_t v30 = sub_262EAE900((uint64_t)v53, 5);
        int v33 = objc_msgSend__addHashKeyAtX_Y_key_(self, v31, v16 + 1, v17, v30, v32);
        if (v33)
        {
          int v13 = v33;
          goto LABEL_20;
        }
        unint64_t v34 = sub_262EAE900((uint64_t)v54, 5);
        int v37 = objc_msgSend__addHashKeyAtX_Y_key_(self, v35, v16, v17 | 1, v34, v36);
        if (v37)
        {
          int v13 = v37;
          goto LABEL_20;
        }
        unint64_t v38 = sub_262EAE900((uint64_t)v55, 5);
        int v41 = objc_msgSend__addHashKeyAtX_Y_key_(self, v39, v16 + 1, v17 | 1, v38, v40);
        if (v41) {
          break;
        }
        v16 += 2;
        unsigned int v15 = a4;
        if (v47 == v16) {
          goto LABEL_14;
        }
      }
      int v13 = v41;
LABEL_20:
      FigDebugAssert3();
    }
    else
    {
      int v13 = 0;
    }
LABEL_21:
    CVPixelBufferUnlockBaseAddress(a3, 0);
    return v13;
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
}

- (void)computeBlurIndices
{
  if (self->_hash_table && self->_blur_indices)
  {
    int v7 = objc_msgSend_countDims(self, a2, v2, v3, v4, v5);
    unsigned int v13 = objc_msgSend_hashTableSize(self, v8, v9, v10, v11, v12);
    if (v13)
    {
      uint64_t v14 = 0;
      unsigned int v15 = 0;
      uint64_t v30 = v13;
      do
      {
        hash_table = self->_hash_table;
        uint64_t v17 = &hash_table[v14];
        long long v31 = 2 * v7 * v17->var1;
        if (v7)
        {
          unsigned int v18 = 0;
          uint64_t var0 = v17->var0.var0;
          do
          {
            uint64_t v20 = 0;
            char v21 = 1;
            do
            {
              char v22 = v21;
              uint64_t v23 = sub_262EAE92C(var0, v18, dword_262EB9A90[v20]);
              if (v23 != -1)
              {
                unsigned int v32 = 0;
                if (objc_msgSend__hashMapFindKey_to_(self, v24, v23, (uint64_t)&v32, v25, v26))
                {
                  self->_blur_indices[v15] = v32;
                  v27.i32[1] = 1;
                  v27.i32[0] = self->_hash_table[v32].var1;
                  *((void *)&v28 + 1) = *((void *)&v31 + 1);
                  *(int32x2_t *)&long long v28 = vadd_s32(v27, *(int32x2_t *)&v31);
                  long long v31 = v28;
                  ++v15;
                }
              }
              char v21 = 0;
              uint64_t v20 = 1;
            }
            while ((v22 & 1) != 0);
            ++v18;
          }
          while (v18 != v7);
        }
        int v29 = &hash_table[v14];
        *(void *)&v29->var2 = v31;
        v29->unsigned int var4 = v15;
        ++v14;
      }
      while (v14 != v30);
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)computeCoordIndices
{
  int v7 = objc_msgSend_width(self, a2, v2, v3, v4, v5);
  int v13 = objc_msgSend_height(self, v8, v9, v10, v11, v12);
  unsigned int v19 = objc_msgSend_hashTableSize(self, v14, v15, v16, v17, v18);
  if (self->_hash_matrix_data
    && (unsigned int v20 = v19, (v21 = self->_coord_indices_off) != 0)
    && self->_coord_indices
    && self->_hash_table)
  {
    bzero(v21, 4 * v20);
    coord_indices = self->_coord_indices;
    unsigned int v23 = 0;
    if (v20)
    {
      p_var1 = &self->_hash_table->var1;
      uint64_t v25 = v20;
      uint64_t v26 = self->_coord_indices;
      do
      {
        *v26++ = v23;
        unsigned int v27 = *p_var1;
        p_var1 += 6;
        v23 += v27;
        --v25;
      }
      while (v25);
    }
    coord_indices[v20] = v23;
    if (v13)
    {
      int v28 = 0;
      for (int i = 0; i != v13; ++i)
      {
        if (v7)
        {
          uint64_t v30 = 0;
          hash_matrix_data = self->_hash_matrix_data;
          coord_table = self->_coord_table;
          coord_indices_off = self->_coord_indices_off;
          do
          {
            uint64_t v34 = hash_matrix_data[(v28 + v30)];
            coord_table[coord_indices_off[v34] + coord_indices[v34]] = (unsigned __int16)v30 | (i << 16);
            ++coord_indices_off[v34];
            ++v30;
          }
          while (v7 != v30);
        }
        v28 += v7;
      }
    }
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
  }
}

- (void)computeInterpIndices
{
  unsigned int v7 = objc_msgSend_hashTableSize(self, a2, v2, v3, v4, v5);
  if (v7)
  {
    uint64_t v8 = 0;
    unsigned int v9 = 0;
    uint64_t v10 = v7;
    do
    {
      self->_interp_indices[v8] = v9;
      unint64_t var0 = self->_hash_table[v8].var0.var0;
      for (int i = 1; i != 8; ++i)
      {
        unint64_t v13 = sub_262EAE968(i);
        unsigned int v18 = 0;
        if (objc_msgSend__hashMapFindKey_to_(self, v14, v13 + var0, (uint64_t)&v18, v15, v16))
        {
          interp_pad = self->_interp_pad;
          self->_interp_table[v9] = v18;
          interp_pad[v9++] = i;
        }
      }
      ++v8;
    }
    while (v8 != v10);
  }
  else
  {
    uint64_t v10 = 0;
    unsigned int v9 = 0;
  }
  self->_interp_indices[v10] = v9;
}

- (BOOL)_hashMapFindKey:(unint64_t)a3 to:(unsigned int *)a4
{
  if (a4)
  {
    hash_map = self->_hash_map;
    return sub_262E9A05C((uint64_t)hash_map, a3, a4);
  }
  else
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    return 0;
  }
}

- (void)_hashMapAddKey:(unint64_t)a3 andValue:(unsigned int)a4
{
}

- (int)_addHashKeyAtX:(unsigned int)a3 Y:(unsigned int)a4 key:(unint64_t)a5
{
  if (self->_hash_matrix_data && self->_hash_table)
  {
    unsigned int v18 = 0;
    if (objc_msgSend__hashMapFindKey_to_(self, a2, a5, (uint64_t)&v18, a5, v5))
    {
      int result = 0;
      hash_table = self->_hash_table;
      self->_hash_matrix_data[a3 + self->_width * a4] = v18;
      ++hash_table[v18].var1;
    }
    else
    {
      unint64_t hash_table_size = self->_hash_table_size;
      if (self->_max_hash_table_size <= hash_table_size)
      {
        return -12786;
      }
      else
      {
        uint64_t v16 = self->_hash_table;
        self->_unint64_t hash_table_size = hash_table_size + 1;
        uint64_t v17 = &v16[hash_table_size];
        v17->var0.unint64_t var0 = a5;
        *(_OWORD *)&v17->var1 = xmmword_262EB9A80;
        self->_hash_matrix_data[a3 + self->_width * a4] = hash_table_size;
        objc_msgSend__hashMapAddKey_andValue_(self, v10, a5, hash_table_size, v11, v12);
        return 0;
      }
    }
  }
  else
  {
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
  return result;
}

@end