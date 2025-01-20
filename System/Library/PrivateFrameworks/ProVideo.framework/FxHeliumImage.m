@interface FxHeliumImage
- (FxHeliumImage)initWithInfo:(id *)a3;
- (FxHeliumImage)initWithInfo:(id *)a3 andHeliumNode:(void *)a4;
- (FxHeliumImage)initWithInfo:(id *)a3 andHeliumRef:(const void *)a4;
- (HGRef<HGNode>)heliumRef;
- (unint64_t)imageType;
- (void)dealloc;
- (void)heliumNode;
- (void)setHeliumNode:(void *)a3;
- (void)setHeliumRef:(const void *)a3;
@end

@implementation FxHeliumImage

- (FxHeliumImage)initWithInfo:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var6;
  v7[2] = *(_OWORD *)&a3->var4;
  v7[3] = v3;
  double var8 = a3->var8;
  long long v4 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v4;
  v6.receiver = self;
  v6.super_class = (Class)FxHeliumImage;
  if ([(FxImage *)&v6 initWithInfo:v7]) {
    operator new();
  }
  return 0;
}

- (FxHeliumImage)initWithInfo:(id *)a3 andHeliumNode:(void *)a4
{
  long long v4 = *(_OWORD *)&a3->var6;
  v8[2] = *(_OWORD *)&a3->var4;
  v8[3] = v4;
  double var8 = a3->var8;
  long long v5 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = v5;
  v7.receiver = self;
  v7.super_class = (Class)FxHeliumImage;
  if ([(FxImage *)&v7 initWithInfo:v8]) {
    operator new();
  }
  return 0;
}

- (FxHeliumImage)initWithInfo:(id *)a3 andHeliumRef:(const void *)a4
{
  long long v4 = *(_OWORD *)&a3->var6;
  v8[2] = *(_OWORD *)&a3->var4;
  v8[3] = v4;
  double var8 = a3->var8;
  long long v5 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = v5;
  v7.receiver = self;
  v7.super_class = (Class)FxHeliumImage;
  if ([(FxImage *)&v7 initWithInfo:v8]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  heliumImagePriv = self->_heliumImagePriv;
  if (heliumImagePriv)
  {
    if (*heliumImagePriv) {
      (*(void (**)(void, SEL))(*(void *)*heliumImagePriv + 24))(*heliumImagePriv, a2);
    }
    MEMORY[0x1BA9BFBA0](heliumImagePriv, 0x20C4093837F09);
  }
  v4.receiver = self;
  v4.super_class = (Class)FxHeliumImage;
  [(FxImage *)&v4 dealloc];
}

- (void)setHeliumNode:(void *)a3
{
  if (a3)
  {
    (*(void (**)(void *, SEL))(*(void *)a3 + 16))(a3, a2);
    heliumImagePriv = (void **)self->_heliumImagePriv;
    objc_super v6 = *heliumImagePriv;
    if (*heliumImagePriv == a3)
    {
      (*(void (**)(void *))(*(void *)a3 + 24))(a3);
      return;
    }
  }
  else
  {
    heliumImagePriv = (void **)self->_heliumImagePriv;
    objc_super v6 = *heliumImagePriv;
    if (!*heliumImagePriv) {
      return;
    }
  }
  if (v6) {
    (*(void (**)(void *))(*(void *)v6 + 24))(v6);
  }
  void *heliumImagePriv = a3;
}

- (void)heliumNode
{
  return *(void **)self->_heliumImagePriv;
}

- (void)setHeliumRef:(const void *)a3
{
  heliumImagePriv = self->_heliumImagePriv;
  uint64_t v4 = *heliumImagePriv;
  uint64_t v5 = *(void *)a3;
  if (*heliumImagePriv != *(void *)a3)
  {
    if (v4)
    {
      (*(void (**)(void, SEL))(*(void *)v4 + 24))(*heliumImagePriv, a2);
      uint64_t v5 = *(void *)a3;
    }
    void *heliumImagePriv = v5;
    if (v5)
    {
      objc_super v7 = *(void (**)(void))(*(void *)v5 + 16);
      v7();
    }
  }
}

- (HGRef<HGNode>)heliumRef
{
  heliumImagePriv = (HGRef<HGNode> *)self->_heliumImagePriv;
  v4.var0 = heliumImagePriv->var0;
  *v2 = heliumImagePriv->var0;
  if (v4.var0) {
    return (HGRef<HGNode>)(*(uint64_t (**)(void))(*(void *)v4.var0 + 16))();
  }
  return v4;
}

- (unint64_t)imageType
{
  return 3;
}

@end