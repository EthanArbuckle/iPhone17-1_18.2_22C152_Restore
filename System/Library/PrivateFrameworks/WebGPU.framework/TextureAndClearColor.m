@interface TextureAndClearColor
- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor;
- (MTLTexture)texture;
- (TextureAndClearColor)initWithTexture:(id)a3;
- (unint64_t)depthPlane;
- (void)setClearColor:(id)a3;
- (void)setDepthPlane:(unint64_t)a3;
- (void)setTexture:(id)a3;
@end

@implementation TextureAndClearColor

- (TextureAndClearColor)initWithTexture:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TextureAndClearColor;
  v6 = [(TextureAndClearColor *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_texture, a3);
    *(_OWORD *)&v7->_clearColor.blue = 0u;
    *(_OWORD *)&v7->_clearColor.red = 0u;
    v8 = v7;
  }

  return v7;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
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

- (void)setClearColor:(id)a3
{
  self->_clearColor = ($3ED934EFF50B3E737D3D4A62C605F33B)a3;
}

- (unint64_t)depthPlane
{
  return self->_depthPlane;
}

- (void)setDepthPlane:(unint64_t)a3
{
  self->_depthPlane = a3;
}

- (void).cxx_destruct
{
}

@end