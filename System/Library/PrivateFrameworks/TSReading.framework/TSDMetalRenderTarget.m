@interface TSDMetalRenderTarget
- (CATransform3D)orthoProjectionWithVerticalFlip:(SEL)a3;
- (CGSize)size;
- (MTLRenderPassDescriptor)passDescriptor;
- (MTLTexture)texture;
- (NSArray)textures;
- (TSDMetalRenderTarget)initWithSize:(CGSize)a3 metalContext:(id)a4;
- (TSDMetalRenderTarget)initWithSize:(CGSize)a3 metalContext:(id)a4 numberOfAttachments:(unint64_t)a5;
- (id)textureAtAttachmentIndex:(unint64_t)a3;
- (void)setClearColor:(id)a3;
- (void)setClearColor:(id)a3 atAttachmentIndex:(unint64_t)a4;
- (void)setTextureLoadAction:(unint64_t)a3;
- (void)setTextureLoadAction:(unint64_t)a3 atAttachmentIndex:(unint64_t)a4;
@end

@implementation TSDMetalRenderTarget

- (TSDMetalRenderTarget)initWithSize:(CGSize)a3 metalContext:(id)a4
{
  return -[TSDMetalRenderTarget initWithSize:metalContext:numberOfAttachments:](self, "initWithSize:metalContext:numberOfAttachments:", a4, 1, a3.width, a3.height);
}

- (TSDMetalRenderTarget)initWithSize:(CGSize)a3 metalContext:(id)a4 numberOfAttachments:(unint64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)TSDMetalRenderTarget;
  v10 = [(TSDMetalRenderTarget *)&v30 init];
  v11 = v10;
  if (v10)
  {
    v10->_size.double width = width;
    v10->_size.double height = height;
    if (a5 >= 4) {
      unint64_t v12 = 4;
    }
    else {
      unint64_t v12 = a5;
    }
    v13 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", objc_msgSend(v9, "pixelFormat"), (unint64_t)width, (unint64_t)height, 0);
    [v13 setUsage:5];
    v14 = [MEMORY[0x263EFF980] array];
    uint64_t v15 = [MEMORY[0x263F129A0] renderPassDescriptor];
    passDescriptor = v11->_passDescriptor;
    v11->_passDescriptor = (MTLRenderPassDescriptor *)v15;

    if (v12)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        v18 = [v9 device];
        v19 = (void *)[v18 newTextureWithDescriptor:v13];

        [(NSArray *)v14 addObject:v19];
        v20 = [(MTLRenderPassDescriptor *)v11->_passDescriptor colorAttachments];
        v21 = [v20 objectAtIndexedSubscript:i];
        [v21 setTexture:v19];

        v22 = [(MTLRenderPassDescriptor *)v11->_passDescriptor colorAttachments];
        v23 = [v22 objectAtIndexedSubscript:i];
        [v23 setLoadAction:2];

        v24 = [(MTLRenderPassDescriptor *)v11->_passDescriptor colorAttachments];
        v25 = [v24 objectAtIndexedSubscript:i];
        [v25 setStoreAction:1];

        v26 = [(MTLRenderPassDescriptor *)v11->_passDescriptor colorAttachments];
        v27 = [v26 objectAtIndexedSubscript:i];
        objc_msgSend(v27, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
      }
    }
    textures = v11->_textures;
    v11->_textures = v14;
  }
  return v11;
}

- (void)setTextureLoadAction:(unint64_t)a3
{
  passDescriptor = self->_passDescriptor;
  if (passDescriptor)
  {
    id v6 = [(MTLRenderPassDescriptor *)passDescriptor colorAttachments];
    v5 = [v6 objectAtIndexedSubscript:0];
    [v5 setLoadAction:a3];
  }
}

- (void)setTextureLoadAction:(unint64_t)a3 atAttachmentIndex:(unint64_t)a4
{
  if (self->_passDescriptor && [(NSArray *)self->_textures count] > a4)
  {
    id v8 = [(MTLRenderPassDescriptor *)self->_passDescriptor colorAttachments];
    v7 = [v8 objectAtIndexedSubscript:a4];
    [v7 setLoadAction:a3];
  }
}

- (CATransform3D)orthoProjectionWithVerticalFlip:(SEL)a3
{
  if (a4)
  {
    double v4 = 0.0;
    double v5 = -1.0;
    double v6 = 1.0;
    double height = self->_size.height;
  }
  else
  {
    double height = 0.0;
    double v5 = -1.0;
    double v6 = 1.0;
    double v4 = self->_size.height;
  }
  TSDTransform3DMakeOrtho((uint64_t)retstr, 0.0, self->_size.width, height, v4, v5, v6);
  return result;
}

- (MTLTexture)texture
{
  return (MTLTexture *)[(TSDMetalRenderTarget *)self textureAtAttachmentIndex:0];
}

- (id)textureAtAttachmentIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_textures count] <= a3)
  {
    double v6 = [MEMORY[0x263F7C7F0] currentHandler];
    v7 = [NSString stringWithUTF8String:"-[TSDMetalRenderTarget textureAtAttachmentIndex:]"];
    id v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalRenderTarget.m"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 77, @"Attachment index %lu is out of bounds.", a3);

    double v5 = 0;
  }
  else
  {
    double v5 = [(NSArray *)self->_textures objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void)setClearColor:(id)a3
{
  passDescriptor = self->_passDescriptor;
  if (passDescriptor)
  {
    double var3 = a3.var3;
    double var2 = a3.var2;
    double var1 = a3.var1;
    double var0 = a3.var0;
    id v9 = [(MTLRenderPassDescriptor *)passDescriptor colorAttachments];
    id v8 = [v9 objectAtIndexedSubscript:0];
    objc_msgSend(v8, "setClearColor:", var0, var1, var2, var3);
  }
}

- (void)setClearColor:(id)a3 atAttachmentIndex:(unint64_t)a4
{
  if (self->_passDescriptor)
  {
    double var3 = a3.var3;
    double var2 = a3.var2;
    double var1 = a3.var1;
    double var0 = a3.var0;
    if ([(NSArray *)self->_textures count] > a4)
    {
      id v11 = [(MTLRenderPassDescriptor *)self->_passDescriptor colorAttachments];
      v10 = [v11 objectAtIndexedSubscript:a4];
      objc_msgSend(v10, "setClearColor:", var0, var1, var2, var3);
    }
  }
}

- (NSArray)textures
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (CGSize)size
{
  objc_copyStruct(v4, &self->_size, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (MTLRenderPassDescriptor)passDescriptor
{
  return (MTLRenderPassDescriptor *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passDescriptor, 0);

  objc_storeStrong((id *)&self->_textures, 0);
}

@end