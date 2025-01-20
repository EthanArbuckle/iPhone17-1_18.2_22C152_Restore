@interface FxTexture
- (BOOL)_verifyImage;
- (BOOL)isInputImage;
- (FxTexture)init;
- (FxTexture)initWithInfo:(id *)a3 textureId:(unsigned int)a4 andTarget:(unsigned int)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)target;
- (unsigned)textureId;
- (void)bind;
- (void)createData:(unsigned int)a3 withType:(unsigned int)a4;
- (void)dealloc;
- (void)disable;
- (void)enable;
- (void)getTextureCoords:(double *)a3 right:(double *)a4 bottom:(double *)a5 top:(double *)a6;
- (void)setAsActiveTexture;
- (void)setData:(void *)a3;
- (void)setIsInputImage:(BOOL)a3;
- (void)setTarget:(unsigned int)a3;
- (void)setTextureId:(unsigned int)a3;
@end

@implementation FxTexture

- (FxTexture)init
{
  v5.receiver = self;
  v5.super_class = (Class)FxTexture;
  result = [(FxImage *)&v5 init];
  if (result)
  {
    v3 = result;
    v4 = (FxTexturePriv *)malloc_type_calloc(1uLL, 0xCuLL, 0x100004005A209FEuLL);
    v3->_texturePriv = v4;
    if (v4) {
      return v3;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (FxTexture)initWithInfo:(id *)a3 textureId:(unsigned int)a4 andTarget:(unsigned int)a5
{
  long long v7 = *(_OWORD *)&a3->var6;
  v14[2] = *(_OWORD *)&a3->var4;
  v14[3] = v7;
  double var8 = a3->var8;
  long long v8 = *(_OWORD *)&a3->var2;
  v14[0] = *(_OWORD *)&a3->var0;
  v14[1] = v8;
  v13.receiver = self;
  v13.super_class = (Class)FxTexture;
  v9 = [(FxImage *)&v13 initWithInfo:v14];
  v10 = v9;
  if (v9)
  {
    texturePriv = v9->_texturePriv;
    if (texturePriv
      || (texturePriv = (FxTexturePriv *)malloc_type_calloc(1uLL, 0xCuLL, 0x100004005A209FEuLL),
          (v10->_texturePriv = texturePriv) != 0))
    {
      texturePriv->var0 = a4;
      texturePriv->var1 = a5;
      texturePriv->var2 = 0;
    }
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [FxTexture alloc];
  if (self)
  {
    [(FxImage *)self imageInfo];
  }
  else
  {
    uint64_t v10 = 0;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
  }
  return [(FxTexture *)v4 initWithInfo:&v6 textureId:[(FxTexture *)self textureId] andTarget:[(FxTexture *)self target]];
}

- (void)dealloc
{
  texturePriv = self->_texturePriv;
  if (texturePriv) {
    free(texturePriv);
  }
  v4.receiver = self;
  v4.super_class = (Class)FxTexture;
  [(FxImage *)&v4 dealloc];
}

- (void)setData:(void *)a3
{
}

- (void)setTextureId:(unsigned int)a3
{
  self->_texturePriv->var0 = a3;
}

- (void)setTarget:(unsigned int)a3
{
  self->_texturePriv->var1 = a3;
}

- (void)setIsInputImage:(BOOL)a3
{
  self->_texturePriv->var2 = a3;
}

- (BOOL)isInputImage
{
  return self->_texturePriv->var2;
}

- (void)createData:(unsigned int)a3 withType:(unsigned int)a4
{
  objc_super v5 = malloc_type_malloc(4 * [(FxImage *)self width] * [(FxImage *)self height], 0xAE3DFB61uLL);
  [(FxTexture *)self bind];
  return v5;
}

- (unsigned)textureId
{
  return self->_texturePriv->var0;
}

- (unsigned)target
{
  return self->_texturePriv->var1;
}

- (void)bind
{
}

- (void)enable
{
}

- (void)disable
{
}

- (void)setAsActiveTexture
{
}

- (void)getTextureCoords:(double *)a3 right:(double *)a4 bottom:(double *)a5 top:(double *)a6
{
  unint64_t v11 = [(FxImage *)self dod];
  int v12 = v11;
  unint64_t v14 = v13;
  unint64_t v15 = HIDWORD(v11);
  if ([(FxTexture *)self isInputImage])
  {
    if (a3) {
      *a3 = 0.0;
    }
    if (a5) {
      *a5 = 0.0;
    }
    if (a4) {
      *a4 = (double)((int)v14 - v12);
    }
    if (a6)
    {
      LODWORD(v16) = HIDWORD(v14) - v15;
LABEL_18:
      *a6 = (double)(int)v16;
    }
  }
  else
  {
    if (a3) {
      *a3 = (double)v12;
    }
    if (a4) {
      *a4 = (double)(int)v14;
    }
    if (a5) {
      *a5 = (double)(int)v15;
    }
    if (a6)
    {
      unint64_t v16 = HIDWORD(v14);
      goto LABEL_18;
    }
  }
}

- (BOOL)_verifyImage
{
  v6.receiver = self;
  v6.super_class = (Class)FxTexture;
  BOOL v3 = [(FxImage *)&v6 _verifyImage];
  if (v3)
  {
    texturePriv = self->_texturePriv;
    if (texturePriv) {
      LOBYTE(v3) = texturePriv->var1 != 0;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

@end