@interface PXGMetalRenderPassState
- ($3BA783FF50B239963188BE194EBFFEBA)textureInfos;
- (MTLBuffer)spriteIndexesMetalBuffer;
- (MTLBuffer)spriteTextureInfosMetalBuffer;
- (MTLDevice)device;
- (PXGMetalRenderPassState)initWithDevice:(id)a3 capacity:(int64_t)a4;
- (id)description;
- (int64_t)capacity;
- (unsigned)spriteIndexes;
@end

@implementation PXGMetalRenderPassState

- ($3BA783FF50B239963188BE194EBFFEBA)textureInfos
{
  return self->_textureInfos;
}

- (unsigned)spriteIndexes
{
  return self->_spriteIndexes;
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (PXGMetalRenderPassState)initWithDevice:(id)a3 capacity:(int64_t)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGMetalRenderPassState;
  v8 = [(PXGMetalRenderPassState *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_capacity = a4;
    uint64_t v10 = [v7 newBufferWithLength:4 * a4 options:0];
    spriteIndexesMetalBuffer = v9->_spriteIndexesMetalBuffer;
    v9->_spriteIndexesMetalBuffer = (MTLBuffer *)v10;

    uint64_t v12 = [v7 newBufferWithLength:a4 << 6 options:0];
    spriteTextureInfosMetalBuffer = v9->_spriteTextureInfosMetalBuffer;
    v9->_spriteTextureInfosMetalBuffer = (MTLBuffer *)v12;

    v14 = v9->_spriteIndexesMetalBuffer;
    if (!v14 || !v9->_spriteTextureInfosMetalBuffer)
    {
      v15 = 0;
      goto LABEL_7;
    }
    v9->_spriteIndexes = (unsigned int *)[(MTLBuffer *)v14 contents];
    v9->_textureInfos = ($3BA783FF50B239963188BE194EBFFEBA *)[(MTLBuffer *)v9->_spriteTextureInfosMetalBuffer contents];
  }
  v15 = v9;
LABEL_7:

  return v15;
}

- (MTLBuffer)spriteTextureInfosMetalBuffer
{
  return self->_spriteTextureInfosMetalBuffer;
}

- (MTLBuffer)spriteIndexesMetalBuffer
{
  return self->_spriteIndexesMetalBuffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_spriteTextureInfosMetalBuffer, 0);
  objc_storeStrong((id *)&self->_spriteIndexesMetalBuffer, 0);
}

- (MTLDevice)device
{
  return self->_device;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@:%p; capacity:%ld>", v5, self, self->_capacity];

  return v6;
}

@end