@interface PXGTextureDataColorLookupCube
- (BOOL)shouldCache;
- (NSData)data;
- (PXGTextureDataColorLookupCube)init;
- (PXGTextureDataColorLookupCube)initWithData:(id)a3 edgeSize:(int64_t)a4 pixelFormat:(unint64_t)a5;
- (double)center;
- (id)createTextureWithContext:(id)a3;
- (id)textureData;
- (unint64_t)pixelFormat;
@end

@implementation PXGTextureDataColorLookupCube

- (PXGTextureDataColorLookupCube)initWithData:(id)a3 edgeSize:(int64_t)a4 pixelFormat:(unint64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXGTextureDataColorLookupCube;
  v10 = [(PXGTextureDataColorLookupCube *)&v13 init];
  v11 = v10;
  if (v10)
  {
    [(PXGColorLookupCube *)v10 setEdgeSize:a4];
    v11->_pixelFormat = a5;
    objc_storeStrong((id *)&v11->_data, a3);
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_texture, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (NSData)data
{
  return self->_data;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (double)center
{
  int v2 = [a1 edgeSize];
  uint64_t v3 = [a1[6] bytes];
  uint64_t v5 = 0;
  if (v2 >= 1) {
    int v6 = v2 - 1;
  }
  else {
    int v6 = v2;
  }
  uint64_t v7 = (uint64_t)v6 >> 1;
  float32x4_t v8 = 0uLL;
  int8x16_t v9 = (int8x16_t)vdupq_n_s32(0x4B400000u);
  float32x4_t v10 = (float32x4_t)vdupq_n_s32(0xCB400000);
  float32x4_t v11 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  char v12 = 1;
  do
  {
    uint64_t v13 = 0;
    char v14 = v12;
    uint64_t v15 = v3 + 4 * (v2 * v2) * (v5 + v7);
    char v16 = 1;
    do
    {
      uint64_t v17 = 0;
      char v18 = v16;
      uint64_t v19 = v15 + 4 * (v13 + v7) * v2;
      char v20 = 1;
      do
      {
        char v21 = v20;
        v4.i32[0] = *(_DWORD *)(v19 + 4 * (v17 + v7));
        float32x4_t v4 = vdivq_f32(vaddq_f32((float32x4_t)vorrq_s8((int8x16_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v4.f32)), v9), v10), v11);
        float32x4_t v8 = vaddq_f32(v8, v4);
        uint64_t v17 = 1;
        char v20 = 0;
      }
      while ((v21 & 1) != 0);
      char v16 = 0;
      uint64_t v13 = 1;
    }
    while ((v18 & 1) != 0);
    char v12 = 0;
    uint64_t v5 = 1;
  }
  while ((v14 & 1) != 0);
  v22.i64[0] = 0x3E0000003E000000;
  v22.i64[1] = 0x3E0000003E000000;
  *(void *)&double result = vmulq_f32(v8, v22).u64[0];
  return result;
}

- (id)textureData
{
  return self->_data;
}

- (id)createTextureWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 device];
  device = self->_device;

  if (v5 == device)
  {
    char v12 = self->_texture;
  }
  else
  {
    uint64_t v7 = [(PXGTextureDataColorLookupCube *)self data];
    int64_t v8 = [(PXGColorLookupCube *)self edgeSize];
    uint64_t v9 = [(PXGTextureDataColorLookupCube *)self pixelFormat];
    uint64_t v10 = PXGBytesPerPixelForMetalPixelFormat(v9) * v8;
    id v11 = objc_alloc_init(MEMORY[0x263F12A50]);
    [v11 setTextureType:7];
    [v11 setWidth:v8];
    [v11 setHeight:v8];
    [v11 setDepth:v8];
    [v11 setPixelFormat:v9];
    [v11 setUsage:1];
    [v11 setResourceOptions:0];
    char v12 = (MTLTexture *)[v4 newTextureWithDescriptor:v11];
    memset(v17, 0, 24);
    id v13 = v7;
    v17[3] = v8;
    v17[4] = v8;
    v17[5] = v8;
    objc_msgSend(v4, "copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:", objc_msgSend(v13, "bytes", 0, 0, 0), v12, v17, objc_msgSend(v13, "length"), v10, v10 * v8);
    char v14 = [v4 device];
    uint64_t v15 = self->_device;
    self->_device = v14;

    objc_storeStrong((id *)&self->_texture, v12);
  }

  return v12;
}

- (BOOL)shouldCache
{
  return 0;
}

- (PXGTextureDataColorLookupCube)init
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGColorLookupCube.m", 446, @"%s is not available as initializer", "-[PXGTextureDataColorLookupCube init]");

  abort();
}

@end