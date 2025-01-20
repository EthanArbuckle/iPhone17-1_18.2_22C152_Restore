@interface MTLGPUDebugTexture
- (MTLGPUDebugTexture)initWithTexture:(id)a3 heap:(id)a4 device:(id)a5;
- (MTLGPUDebugTexture)initWithTextureView:(id)a3 parentBuffer:(id)a4 heap:(id)a5 device:(id)a6;
- (MTLGPUDebugTexture)initWithTextureView:(id)a3 parentTexture:(id)a4 heap:(id)a5 device:(id)a6;
- (MTLTextureSPI)baseObject;
- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7;
- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8;
- (unint64_t)gpuIdentifier;
- (unint64_t)handleForOffset:(unint64_t)a3;
- (unint64_t)length;
- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4;
- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5;
@end

@implementation MTLGPUDebugTexture

- (MTLGPUDebugTexture)initWithTexture:(id)a3 heap:(id)a4 device:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)MTLGPUDebugTexture;
  v5 = [(MTLToolsResource *)&v7 initWithBaseObject:a3 parent:a5 heap:a4];
  InitResourceIdentifier(v5);
  return v5;
}

- (MTLGPUDebugTexture)initWithTextureView:(id)a3 parentBuffer:(id)a4 heap:(id)a5 device:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugTexture;
  v6 = [(MTLToolsTexture *)&v8 initWithBaseObject:a3 parent:a6 buffer:a4];
  InitResourceIdentifier(v6);
  return v6;
}

- (MTLGPUDebugTexture)initWithTextureView:(id)a3 parentTexture:(id)a4 heap:(id)a5 device:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)MTLGPUDebugTexture;
  v6 = [(MTLToolsTexture *)&v8 initWithBaseObject:a3 parent:a6 parentTexture:a4];
  InitResourceIdentifier(v6);
  return v6;
}

- (unint64_t)length
{
  return 0;
}

- (unint64_t)handleForOffset:(unint64_t)a3
{
  return 0;
}

- (MTLTextureSPI)baseObject
{
  return (MTLTextureSPI *)self->super.super.super._baseObject;
}

- (unint64_t)gpuIdentifier
{
  return self->_identifier;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3
{
  id result = (id)[(MTLToolsObject *)self->super.super.super._baseObject newTextureViewWithPixelFormat:a3];
  if (result)
  {
    id v5 = result;
    v6 = [[MTLGPUDebugTexture alloc] initWithTextureView:result parentTexture:self heap:[(MTLToolsResource *)self heap] device:self->super.super.super._device];

    return v6;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6
{
  id result = (id)-[MTLToolsObject newTextureViewWithPixelFormat:textureType:levels:slices:](self->super.super.super._baseObject, "newTextureViewWithPixelFormat:textureType:levels:slices:", a3, a4, a5.location, a5.length, a6.location, a6.length);
  if (result)
  {
    id v8 = result;
    v9 = [[MTLGPUDebugTexture alloc] initWithTextureView:result parentTexture:self heap:[(MTLToolsResource *)self heap] device:self->super.super.super._device];

    return v9;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7
{
  id result = (id)-[MTLToolsObject newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:](self->super.super.super._baseObject, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7);
  if (result)
  {
    id v9 = result;
    v10 = [[MTLGPUDebugTexture alloc] initWithTextureView:result parentTexture:self heap:[(MTLToolsResource *)self heap] device:self->super.super.super._device];

    return v10;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  id result = (id)[(MTLToolsObject *)self->super.super.super._baseObject newTextureViewWithPixelFormat:a3 resourceIndex:a4];
  if (result)
  {
    id v6 = result;
    objc_super v7 = [[MTLGPUDebugTexture alloc] initWithTextureView:result parentTexture:self heap:[(MTLToolsResource *)self heap] device:self->super.super.super._device];

    return v7;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 resourceIndex:(unint64_t)a7
{
  id result = (id)-[MTLToolsObject newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:](self->super.super.super._baseObject, "newTextureViewWithPixelFormat:textureType:levels:slices:resourceIndex:", a3, a4, a5.location, a5.length, a6.location, a6.length, a7);
  if (result)
  {
    id v9 = result;
    v10 = [[MTLGPUDebugTexture alloc] initWithTextureView:result parentTexture:self heap:[(MTLToolsResource *)self heap] device:self->super.super.super._device];

    return v10;
  }
  return result;
}

- (id)newTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 levels:(_NSRange)a5 slices:(_NSRange)a6 swizzle:(id)a7 resourceIndex:(unint64_t)a8
{
  id result = (id)-[MTLToolsObject newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:](self->super.super.super._baseObject, "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:resourceIndex:", a3, a4, a5.location, a5.length, a6.location, a6.length, *(unsigned int *)&a7, a8);
  if (result)
  {
    id v10 = result;
    v11 = [[MTLGPUDebugTexture alloc] initWithTextureView:result parentTexture:self heap:[(MTLToolsResource *)self heap] device:self->super.super.super._device];

    return v11;
  }
  return result;
}

- (id)newCompressedTextureViewWithPixelFormat:(unint64_t)a3 textureType:(unint64_t)a4 level:(unint64_t)a5 slice:(unint64_t)a6
{
  id result = (id)[(MTLToolsObject *)self->super.super.super._baseObject newCompressedTextureViewWithPixelFormat:a3 textureType:a4 level:a5 slice:a6];
  if (result)
  {
    id v8 = result;
    id v9 = [[MTLGPUDebugTexture alloc] initWithTextureView:result parentTexture:self heap:[(MTLToolsResource *)self heap] device:self->super.super.super._device];

    return v9;
  }
  return result;
}

- (void)useWithComputeEncoder:(id)a3 usage:(unint64_t)a4
{
}

- (void)useWithRenderEncoder:(id)a3 usage:(unint64_t)a4 stages:(optional<unsigned long>)a5
{
}

@end