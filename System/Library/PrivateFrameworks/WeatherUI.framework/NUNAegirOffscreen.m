@interface NUNAegirOffscreen
- (MTLRenderPassDescriptor)renderPassDescriptor;
- (MTLTexture)texture0;
- (MTLTexture)texture1;
- (NUNAegirOffscreen)initWithDevice:(id)a3 width:(int)a4 height:(int)a5 pixelFormat0:(unint64_t)a6 pixelFormat1:(unint64_t)a7 mipmaps:(int)a8 loadAction:(unint64_t)a9 clearColor0:(id)a10 clearColor1:(id)a11;
- (NUNAegirOffscreen)initWithDevice:(id)a3 width:(int)a4 height:(int)a5 texture0:(id)a6 texture1:(id)a7 loadAction:(unint64_t)a8 clearColor0:(id)a9 clearColor1:(id)a10;
- (int)height;
- (int)width;
- (void)setHeight:(int)a3;
- (void)setRenderPassDescriptor:(id)a3;
- (void)setTexture0:(id)a3;
- (void)setTexture1:(id)a3;
- (void)setWidth:(int)a3;
@end

@implementation NUNAegirOffscreen

- (NUNAegirOffscreen)initWithDevice:(id)a3 width:(int)a4 height:(int)a5 texture0:(id)a6 texture1:(id)a7 loadAction:(unint64_t)a8 clearColor0:(id)a9 clearColor1:(id)a10
{
  double var3 = a10.var3;
  double var2 = a10.var2;
  double var1 = a10.var1;
  double var0 = a10.var0;
  double v14 = a9.var3;
  double v15 = a9.var2;
  double v16 = a9.var1;
  double v17 = a9.var0;
  id v23 = a6;
  id v24 = a7;
  v36.receiver = self;
  v36.super_class = (Class)NUNAegirOffscreen;
  v25 = [(NUNAegirOffscreen *)&v36 init];
  v26 = v25;
  if (v25)
  {
    v25->_width = a4;
    v25->_height = a5;
    id v27 = v23;
    id v28 = v24;
    v29 = (MTLRenderPassDescriptor *)objc_opt_new();
    v30 = [(MTLRenderPassDescriptor *)v29 colorAttachments];
    v31 = v30;
    if (v27)
    {
      v32 = [v30 objectAtIndexedSubscript:0];
      objc_msgSend(v32, "setClearColor:", v17, v16, v15, v14);
      [v32 setStoreAction:1];
      [v32 setLoadAction:a8];
      [v32 setTexture:v27];
    }
    if (v28)
    {
      v33 = [v31 objectAtIndexedSubscript:1];
      objc_msgSend(v33, "setClearColor:", var0, var1, var2, var3);
      [v33 setStoreAction:1];
      [v33 setLoadAction:a8];
      [v33 setTexture:v28];
    }
    renderPassDescriptor = v26->_renderPassDescriptor;
    v26->_renderPassDescriptor = v29;
  }
  return v26;
}

- (NUNAegirOffscreen)initWithDevice:(id)a3 width:(int)a4 height:(int)a5 pixelFormat0:(unint64_t)a6 pixelFormat1:(unint64_t)a7 mipmaps:(int)a8 loadAction:(unint64_t)a9 clearColor0:(id)a10 clearColor1:(id)a11
{
  uint64_t v14 = *(void *)&a5;
  uint64_t v15 = *(void *)&a4;
  double var3 = a11.var3;
  double var2 = a11.var2;
  double var1 = a11.var1;
  double var0 = a11.var0;
  double v20 = a10.var3;
  double v21 = a10.var2;
  double v22 = a10.var1;
  double v23 = a10.var0;
  id v25 = a3;
  v26 = _NUNAegirCreateTexture(v25, v15, v14, a8, a6);
  id v27 = _NUNAegirCreateTexture(v25, v15, v14, a8, a7);
  id v28 = -[NUNAegirOffscreen initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:](self, "initWithDevice:width:height:texture0:texture1:loadAction:clearColor0:clearColor1:", v25, v15, v14, v26, v27, a9, v23, v22, v21, v20, var0, var1, var2, var3);

  return v28;
}

- (MTLTexture)texture0
{
  v2 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
  v3 = [v2 objectAtIndexedSubscript:0];
  v4 = [v3 texture];

  return (MTLTexture *)v4;
}

- (void)setTexture0:(id)a3
{
  renderPassDescriptor = self->_renderPassDescriptor;
  id v4 = a3;
  id v6 = [(MTLRenderPassDescriptor *)renderPassDescriptor colorAttachments];
  v5 = [v6 objectAtIndexedSubscript:0];
  [v5 setTexture:v4];
}

- (MTLTexture)texture1
{
  v2 = [(MTLRenderPassDescriptor *)self->_renderPassDescriptor colorAttachments];
  v3 = [v2 objectAtIndexedSubscript:1];
  id v4 = [v3 texture];

  return (MTLTexture *)v4;
}

- (void)setTexture1:(id)a3
{
  renderPassDescriptor = self->_renderPassDescriptor;
  id v4 = a3;
  id v6 = [(MTLRenderPassDescriptor *)renderPassDescriptor colorAttachments];
  v5 = [v6 objectAtIndexedSubscript:1];
  [v5 setTexture:v4];
}

- (int)width
{
  return self->_width;
}

- (void)setWidth:(int)a3
{
  self->_width = a3;
}

- (int)height
{
  return self->_height;
}

- (void)setHeight:(int)a3
{
  self->_height = a3;
}

- (MTLRenderPassDescriptor)renderPassDescriptor
{
  return self->_renderPassDescriptor;
}

- (void)setRenderPassDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end