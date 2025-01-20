@interface RBSymbolShapeLayer
- (RBSymbolShapeLayer)initWithLayer:(id)a3;
- (id).cxx_construct;
- (void)setRBPath:(uint64_t)a3;
@end

@implementation RBSymbolShapeLayer

- (RBSymbolShapeLayer)initWithLayer:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)RBSymbolShapeLayer;
  v4 = -[RBSymbolShapeLayer initWithLayer:](&v12, sel_initWithLayer_);
  v5 = v4;
  if (v4)
  {
    v6 = (uint64_t *)((char *)a3 + 32);
    p_uint64_t info = &v4->_rbPath._p.info;
    uint64_t info = (uint64_t)v4->_rbPath._p.info;
    if (info != *v6)
    {
      uint64_t callbacks = (uint64_t)v5->_rbPath._p.callbacks;
LABEL_5:
      RBPathRelease(info, callbacks);
      void *p_info = RBPathRetain(*v6, v6[1]);
      v5->_rbPath._p.uint64_t callbacks = v10;
      return v5;
    }
    uint64_t callbacks = (uint64_t)v5->_rbPath._p.callbacks;
    if (callbacks != v6[1]) {
      goto LABEL_5;
    }
  }
  return v5;
}

- (void)setRBPath:(uint64_t)a3
{
  if (!a1 || (RBPathEqualToPath((uint64_t)a2, a3, *(void *)(a1 + 32), *(void **)(a1 + 40)) & 1) != 0) {
    return;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if ((const CGPath *)v6 == a2)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7 == a3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
  }
  RBPathRelease(v6, v7);
  *(void *)(a1 + 32) = RBPathRetain((uint64_t)a2, a3);
  *(void *)(a1 + 40) = v8;
LABEL_7:
  CGPathRef v9 = RBPathCopyCGPath(a2, a3);
  [(id)a1 setPath:v9];
  if (v9)
  {
    CFRelease(v9);
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = RBPathEmpty;
  return self;
}

@end