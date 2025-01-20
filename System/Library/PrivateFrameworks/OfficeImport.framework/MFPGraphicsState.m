@interface MFPGraphicsState
- (CGAffineTransform)pageTransform;
- (CGAffineTransform)worldTransform;
- (MFPGraphicsState)initWithDefaults;
- (MFPGraphicsState)initWithGraphicsState:(id)a3;
- (void)multiplyWorldTransformBy:(CGAffineTransform *)a3 order:(int)a4;
- (void)removeTransform:(CGAffineTransform *)a3;
- (void)setPageTransform:(CGAffineTransform *)a3;
- (void)setWorldTransform:(CGAffineTransform *)a3;
@end

@implementation MFPGraphicsState

- (MFPGraphicsState)initWithDefaults
{
  v7.receiver = self;
  v7.super_class = (Class)MFPGraphicsState;
  result = [(MFPGraphicsState *)&v7 init];
  if (result)
  {
    v3 = (_OWORD *)MEMORY[0x263F000D0];
    long long v4 = *MEMORY[0x263F000D0];
    long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&result->mPageTransform.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)&result->mPageTransform.c = v5;
    *(_OWORD *)&result->mPageTransform.a = v4;
    long long v6 = v3[1];
    *(_OWORD *)&result->mWorldTransform.a = *v3;
    *(_OWORD *)&result->mWorldTransform.c = v6;
    *(_OWORD *)&result->mWorldTransform.tx = v3[2];
  }
  return result;
}

- (MFPGraphicsState)initWithGraphicsState:(id)a3
{
  long long v4 = (char *)a3;
  v12.receiver = self;
  v12.super_class = (Class)MFPGraphicsState;
  long long v5 = [(MFPGraphicsState *)&v12 init];
  long long v6 = (MFPGraphicsState *)v5;
  if (v5)
  {
    long long v7 = *(_OWORD *)(v4 + 8);
    long long v8 = *(_OWORD *)(v4 + 24);
    *(_OWORD *)(v5 + 40) = *(_OWORD *)(v4 + 40);
    *(_OWORD *)(v5 + 24) = v8;
    *(_OWORD *)(v5 + 8) = v7;
    long long v9 = *(_OWORD *)(v4 + 56);
    long long v10 = *(_OWORD *)(v4 + 72);
    *(_OWORD *)(v5 + 88) = *(_OWORD *)(v4 + 88);
    *(_OWORD *)(v5 + 72) = v10;
    *(_OWORD *)(v5 + 56) = v9;
  }

  return v6;
}

- (void)removeTransform:(CGAffineTransform *)a3
{
  CurrentContext = UIGraphicsGetCurrentContext();
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v6.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v6.c = v5;
  *(_OWORD *)&v6.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformInvert(&transform, &v6);
  CGContextConcatCTM(CurrentContext, &transform);
}

- (CGAffineTransform)pageTransform
{
  long long v3 = *(_OWORD *)&self->d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self->ty;
  return self;
}

- (void)setPageTransform:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&self->mWorldTransform.c;
  v16[0] = *(_OWORD *)&self->mWorldTransform.a;
  v16[1] = v5;
  v16[2] = *(_OWORD *)&self->mWorldTransform.tx;
  [(MFPGraphicsState *)self removeTransform:v16];
  long long v6 = *(_OWORD *)&self->mPageTransform.c;
  v15[0] = *(_OWORD *)&self->mPageTransform.a;
  v15[1] = v6;
  v15[2] = *(_OWORD *)&self->mPageTransform.tx;
  [(MFPGraphicsState *)self removeTransform:v15];
  long long v7 = *(_OWORD *)&a3->a;
  long long v8 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mPageTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mPageTransform.c = v8;
  *(_OWORD *)&self->mPageTransform.a = v7;
  CurrentContext = UIGraphicsGetCurrentContext();
  long long v10 = *(_OWORD *)&self->mPageTransform.c;
  *(_OWORD *)&transform.a = *(_OWORD *)&self->mPageTransform.a;
  *(_OWORD *)&transform.c = v10;
  *(_OWORD *)&transform.tx = *(_OWORD *)&self->mPageTransform.tx;
  CGContextConcatCTM(CurrentContext, &transform);
  v11 = UIGraphicsGetCurrentContext();
  long long v12 = *(_OWORD *)&self->mWorldTransform.c;
  *(_OWORD *)&v13.a = *(_OWORD *)&self->mWorldTransform.a;
  *(_OWORD *)&v13.c = v12;
  *(_OWORD *)&v13.tx = *(_OWORD *)&self->mWorldTransform.tx;
  CGContextConcatCTM(v11, &v13);
}

- (CGAffineTransform)worldTransform
{
  long long v3 = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].ty;
  return self;
}

- (void)setWorldTransform:(CGAffineTransform *)a3
{
  long long v5 = *(_OWORD *)&self->mWorldTransform.c;
  v11[0] = *(_OWORD *)&self->mWorldTransform.a;
  v11[1] = v5;
  v11[2] = *(_OWORD *)&self->mWorldTransform.tx;
  [(MFPGraphicsState *)self removeTransform:v11];
  long long v6 = *(_OWORD *)&a3->a;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->mWorldTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->mWorldTransform.c = v7;
  *(_OWORD *)&self->mWorldTransform.a = v6;
  CurrentContext = UIGraphicsGetCurrentContext();
  long long v9 = *(_OWORD *)&self->mWorldTransform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->mWorldTransform.a;
  *(_OWORD *)&v10.c = v9;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->mWorldTransform.tx;
  CGContextConcatCTM(CurrentContext, &v10);
}

- (void)multiplyWorldTransformBy:(CGAffineTransform *)a3 order:(int)a4
{
  p_mWorldTransform = &self->mWorldTransform;
  long long v7 = *(_OWORD *)&self->mWorldTransform.c;
  v23[0] = *(_OWORD *)&self->mWorldTransform.a;
  v23[1] = v7;
  v23[2] = *(_OWORD *)&self->mWorldTransform.tx;
  [(MFPGraphicsState *)self removeTransform:v23];
  if (a4)
  {
    long long v8 = *(_OWORD *)&p_mWorldTransform->c;
    v19[0] = *(_OWORD *)&p_mWorldTransform->a;
    v19[1] = v8;
    v19[2] = *(_OWORD *)&p_mWorldTransform->tx;
    long long v9 = *(_OWORD *)&a3->c;
    v18[0] = *(_OWORD *)&a3->a;
    v18[1] = v9;
    v18[2] = *(_OWORD *)&a3->tx;
    p_CGAffineTransform t1 = (CGAffineTransform *)v19;
    p_CGAffineTransform t2 = (CGAffineTransform *)v18;
  }
  else
  {
    long long v12 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v12;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    long long v13 = *(_OWORD *)&p_mWorldTransform->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&p_mWorldTransform->a;
    *(_OWORD *)&t2.c = v13;
    *(_OWORD *)&t2.tx = *(_OWORD *)&p_mWorldTransform->tx;
    p_CGAffineTransform t1 = &t1;
    p_CGAffineTransform t2 = &t2;
  }
  CGAffineTransformConcat(&v22, p_t1, p_t2);
  long long v14 = *(_OWORD *)&v22.c;
  *(_OWORD *)&p_mWorldTransform->a = *(_OWORD *)&v22.a;
  *(_OWORD *)&p_mWorldTransform->c = v14;
  *(_OWORD *)&p_mWorldTransform->tx = *(_OWORD *)&v22.tx;
  CurrentContext = UIGraphicsGetCurrentContext();
  long long v16 = *(_OWORD *)&p_mWorldTransform->c;
  *(_OWORD *)&v17.a = *(_OWORD *)&p_mWorldTransform->a;
  *(_OWORD *)&v17.c = v16;
  *(_OWORD *)&v17.tx = *(_OWORD *)&p_mWorldTransform->tx;
  CGContextConcatCTM(CurrentContext, &v17);
}

@end