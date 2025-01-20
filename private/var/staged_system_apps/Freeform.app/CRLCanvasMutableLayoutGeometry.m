@interface CRLCanvasMutableLayoutGeometry
- (void)outsetBy:(CGSize)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)transformBy:(CGAffineTransform *)a3;
@end

@implementation CRLCanvasMutableLayoutGeometry

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v4[0] = *(_OWORD *)&a3->a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&a3->tx;
  [(CRLCanvasLayoutGeometry *)self i_setTransform:v4];
}

- (void)transformBy:(CGAffineTransform *)a3
{
  [(CRLCanvasLayoutGeometry *)self transform];
  long long v5 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v6.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v6.c = v5;
  *(_OWORD *)&v6.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v8, &t1, &v6);
  [(CRLCanvasLayoutGeometry *)self i_setTransform:&v8];
}

- (void)outsetBy:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CRLCanvasLayoutGeometry *)self size];
  double v7 = v6;
  double v9 = v8;
  double v10 = sub_1000646A4(width, height, 2.0);
  [(CRLCanvasLayoutGeometry *)self i_setSize:sub_100064698(v7, v9, v10)];
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, -width, -height);
  [(CRLCanvasLayoutGeometry *)self transform];
  CGAffineTransform v11 = v14;
  CGAffineTransformConcat(&v13, &v11, &t2);
  [(CRLCanvasLayoutGeometry *)self i_setTransform:&v13];
}

@end