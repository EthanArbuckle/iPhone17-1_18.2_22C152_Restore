@interface TSDMutableLayoutGeometry
- (void)outsetBy:(CGSize)a3;
- (void)setSize:(CGSize)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)transformBy:(CGAffineTransform *)a3;
@end

@implementation TSDMutableLayoutGeometry

- (void)setSize:(CGSize)a3
{
  self->super.mSize = a3;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->super.mTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->super.mTransform.c = v4;
  *(_OWORD *)&self->super.mTransform.a = v3;
}

- (void)transformBy:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&self->super.mTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->super.mTransform.a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->super.mTransform.tx;
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v7.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v7.c = v5;
  *(_OWORD *)&v7.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v9, &t1, &v7);
  long long v6 = *(_OWORD *)&v9.c;
  *(_OWORD *)&self->super.mTransform.a = *(_OWORD *)&v9.a;
  *(_OWORD *)&self->super.mTransform.c = v6;
  *(_OWORD *)&self->super.mTransform.tx = *(_OWORD *)&v9.tx;
}

- (void)outsetBy:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = TSDMultiplySizeScalar(a3.width, a3.height, 2.0);
  self->super.mSize.double width = TSDAddSizes(self->super.mSize.width, self->super.mSize.height, v6);
  self->super.mSize.double height = v7;
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeTranslation(&v13, -width, -height);
  CGAffineTransform t1 = v13;
  long long v8 = *(_OWORD *)&self->super.mTransform.c;
  *(_OWORD *)&v10.a = *(_OWORD *)&self->super.mTransform.a;
  *(_OWORD *)&v10.c = v8;
  *(_OWORD *)&v10.tx = *(_OWORD *)&self->super.mTransform.tx;
  CGAffineTransformConcat(&v12, &t1, &v10);
  long long v9 = *(_OWORD *)&v12.c;
  *(_OWORD *)&self->super.mTransform.a = *(_OWORD *)&v12.a;
  *(_OWORD *)&self->super.mTransform.c = v9;
  *(_OWORD *)&self->super.mTransform.tx = *(_OWORD *)&v12.tx;
}

@end