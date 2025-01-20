@interface PTRenderEffectOutput
- (MTLTexture)effectDepth;
- (MTLTexture)effectRGBA;
- (PTRenderEffectOutput)initWithEffectRGBA:(id)a3 effectDepth:(id)a4;
@end

@implementation PTRenderEffectOutput

- (PTRenderEffectOutput)initWithEffectRGBA:(id)a3 effectDepth:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PTRenderEffectOutput;
  v9 = [(PTRenderEffectOutput *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_effectRGBA, a3);
    objc_storeStrong((id *)&v10->_effectDepth, a4);
    v11 = v10;
  }

  return v10;
}

- (MTLTexture)effectRGBA
{
  return (MTLTexture *)objc_getProperty(self, a2, 8, 1);
}

- (MTLTexture)effectDepth
{
  return (MTLTexture *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectDepth, 0);

  objc_storeStrong((id *)&self->_effectRGBA, 0);
}

@end