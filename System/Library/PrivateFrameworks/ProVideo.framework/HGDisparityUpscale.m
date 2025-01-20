@interface HGDisparityUpscale
- (HGDisparityUpscale)initWithDevice:(id)a3 disparitySize:(CGSize)a4 colorSize:(CGSize)a5 portraitUtil:(id)a6;
- (id)newTextureArrayFromTexture:(id)a3;
- (id)upscaleDisparity:(id)a3 inRGBA:(id)a4 commandBuffer:(id)a5;
- (void)dealloc;
@end

@implementation HGDisparityUpscale

- (HGDisparityUpscale)initWithDevice:(id)a3 disparitySize:(CGSize)a4 colorSize:(CGSize)a5 portraitUtil:(id)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v8 = a4.height;
  CGFloat v9 = a4.width;
  v12.receiver = self;
  v12.super_class = (Class)HGDisparityUpscale;
  result = [(HGDisparityUpscale *)&v12 init];
  if (result)
  {
    result->_colorSize.CGFloat width = width;
    result->_colorSize.CGFloat height = height;
    result->_depthSize.CGFloat width = v9;
    result->_depthSize.CGFloat height = v8;
    result->_device = (MTLDevice *)a3;
    result->_depthTex = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)HGDisparityUpscale;
  [(HGDisparityUpscale *)&v3 dealloc];
}

- (id)newTextureArrayFromTexture:(id)a3
{
  if ([a3 textureType] == 3) {
    return 0;
  }
  uint64_t v5 = [a3 pixelFormat];

  return (id)objc_msgSend(a3, "newTextureViewWithPixelFormat:textureType:levels:slices:", v5, 3, 0, 1, 0, 1);
}

- (id)upscaleDisparity:(id)a3 inRGBA:(id)a4 commandBuffer:(id)a5
{
  CGFloat v9 = (void *)[MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:25 width:(unint64_t)self->_colorSize.width height:(unint64_t)self->_colorSize.height mipmapped:0];
  [v9 setUsage:19];
  self->_depthTex = (MTLTexture *)[(MTLDevice *)self->_device newTextureWithDescriptor:v9];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F35548]) initWithDevice:self->_device];
  [v10 encodeToCommandBuffer:a5 sourceTexture:a3 destinationTexture:self->_depthTex];
  id v11 = [(HGDisparityUpscale *)self newTextureArrayFromTexture:a3];
  id v12 = [(HGDisparityUpscale *)self newTextureArrayFromTexture:a4];
  id v13 = [(HGDisparityUpscale *)self newTextureArrayFromTexture:self->_depthTex];

  return self->_depthTex;
}

@end