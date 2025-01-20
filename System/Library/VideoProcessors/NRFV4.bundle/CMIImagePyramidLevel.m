@interface CMIImagePyramidLevel
- (MTLTexture)texture;
- (void)dealloc;
- (void)setTexture:(id)a3;
@end

@implementation CMIImagePyramidLevel

- (void)dealloc
{
  FigMetalDecRef();
  v3.receiver = self;
  v3.super_class = (Class)CMIImagePyramidLevel;
  [(CMIImagePyramidLevel *)&v3 dealloc];
}

- (void)setTexture:(id)a3
{
  v4 = (MTLTexture *)a3;
  FigMetalDecRef();
  texture = self->_texture;
  self->_texture = v4;
}

- (MTLTexture)texture
{
  return self->_texture;
}

- (void).cxx_destruct
{
}

@end