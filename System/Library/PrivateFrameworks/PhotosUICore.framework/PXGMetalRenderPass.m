@interface PXGMetalRenderPass
- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)renderSize;
- (CGRect)renderRect;
- (MTLRenderPassDescriptor)renderPassDescriptor;
- (PXGEffect)offscreenKernelEffect;
- (PXGMetalCaptureSpriteTexture)captureSpriteTexture;
- (PXGMetalRenderPass)init;
- (double)drawingScale;
- (float)captureSpriteZPosition;
- (float)maxZ;
- (float)minZ;
- (id)description;
- (int64_t)drawCalls;
- (unint64_t)pixelFormat;
- (void)setCaptureSpriteTexture:(id)a3;
- (void)setCaptureSpriteZPosition:(float)a3;
- (void)setClearColor:(id)a3;
- (void)setDrawCalls:(int64_t)a3;
- (void)setDrawingScale:(double)a3;
- (void)setMaxZ:(float)a3;
- (void)setMinZ:(float)a3;
- (void)setOffscreenKernelEffect:(id)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setRenderPassDescriptor:(id)a3;
- (void)setRenderRect:(CGRect)a3;
- (void)setRenderSize:(id *)a3;
@end

@implementation PXGMetalRenderPass

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (MTLRenderPassDescriptor)renderPassDescriptor
{
  return self->_renderPassDescriptor;
}

- (PXGMetalCaptureSpriteTexture)captureSpriteTexture
{
  return self->_captureSpriteTexture;
}

- (void)setRenderRect:(CGRect)a3
{
  self->_renderRect = a3;
}

- (void)setRenderPassDescriptor:(id)a3
{
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (void)setDrawCalls:(int64_t)a3
{
  self->_drawCalls = a3;
}

- (CGRect)renderRect
{
  double x = self->_renderRect.origin.x;
  double y = self->_renderRect.origin.y;
  double width = self->_renderRect.size.width;
  double height = self->_renderRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXGEffect)offscreenKernelEffect
{
  return self->_offscreenKernelEffect;
}

- (float)minZ
{
  return self->_minZ;
}

- (float)maxZ
{
  return self->_maxZ;
}

- (PXGMetalRenderPass)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGMetalRenderPass;
  CGRect result = [(PXGMetalRenderPass *)&v3 init];
  if (result)
  {
    result->_drawingScale = 1.0;
    *(int32x2_t *)&result->_minZ = vdup_n_s32(0x7FC00000u);
  }
  return result;
}

- (double)drawingScale
{
  return self->_drawingScale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offscreenKernelEffect, 0);
  objc_storeStrong((id *)&self->_captureSpriteTexture, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
}

- (int64_t)drawCalls
{
  return self->_drawCalls;
}

- (void)setMaxZ:(float)a3
{
  self->_maxZ = a3;
}

- (void)setMinZ:(float)a3
{
  self->_minZ = a3;
}

- (void)setDrawingScale:(double)a3
{
  self->_drawingScale = a3;
}

- (void)setOffscreenKernelEffect:(id)a3
{
}

- (void)setClearColor:(id)a3
{
  self->_clearColor = ($3ED934EFF50B3E737D3D4A62C605F33B)a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor
{
  double red = self->_clearColor.red;
  double green = self->_clearColor.green;
  double blue = self->_clearColor.blue;
  double alpha = self->_clearColor.alpha;
  result.var3 = alpha;
  result.var2 = blue;
  result.var1 = green;
  result.var0 = red;
  return result;
}

- (void)setRenderSize:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_renderSize.depth = a3->var2;
  *(_OWORD *)&self->_renderSize.double width = v3;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)renderSize
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = ($E8CF8C4D35898297CF58D66FCEA3D064)self[3];
  return self;
}

- (void)setCaptureSpriteZPosition:(float)a3
{
  self->_captureSpriteZPosition = a3;
}

- (float)captureSpriteZPosition
{
  return self->_captureSpriteZPosition;
}

- (void)setCaptureSpriteTexture:(id)a3
{
}

- (id)description
{
  long long v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PXGMetalRenderPass *)self captureSpriteTexture];
  v7 = [(PXGMetalRenderPass *)self offscreenKernelEffect];
  v8 = [v3 stringWithFormat:@"<%@:%p captureTexture:%@ effect:%@ drawingScale:%.2f sprites:(%.6f < z <= %.6f) drawCalls:%ld>", v5, self, v6, v7, *(void *)&self->_drawingScale, self->_minZ, self->_maxZ, self->_drawCalls];

  return v8;
}

@end