@interface CRLShapeLayoutHelperFreehandDrawing
- (BOOL)shouldComputeSeparateClippedPathBounds;
- (CGRect)aliasedAlignmentFrameForScale:(double)a3;
- (CGRect)boundsOfLineEndForHead:(BOOL)a3 transform:(CGAffineTransform *)a4;
- (CGRect)computeClippedPathBoundsWithTransform:(CGAffineTransform *)a3;
- (CGRect)computePathBounds;
- (CGRect)p_computePathBoundsWithTransform:(CGAffineTransform *)a3;
- (CRLShapeLayoutHelperFreehandDrawing)initWithShapeLayout:(id)a3;
- (id)p_possibleCopyOfPathUsingTransform:(CGAffineTransform *)a3;
@end

@implementation CRLShapeLayoutHelperFreehandDrawing

- (CRLShapeLayoutHelperFreehandDrawing)initWithShapeLayout:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLShapeLayoutHelperFreehandDrawing;
  v5 = [(CRLShapeLayoutHelperFreehandDrawing *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_shapeLayout, v4);
    v7 = (objc_class *)objc_opt_class();
    v8 = [v4 info];
    v9 = sub_10024715C(v7, v8);
    objc_storeWeak((id *)&v6->_shapeInfo, v9);
  }
  return v6;
}

- (BOOL)shouldComputeSeparateClippedPathBounds
{
  return 0;
}

- (CGRect)computePathBounds
{
  long long v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v7[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v7[1] = v2;
  v7[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(CRLShapeLayoutHelperFreehandDrawing *)self p_computePathBoundsWithTransform:v7];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)computeClippedPathBoundsWithTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v3;
  v8[2] = *(_OWORD *)&a3->tx;
  [(CRLShapeLayoutHelperFreehandDrawing *)self p_computePathBoundsWithTransform:v8];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)p_computePathBoundsWithTransform:(CGAffineTransform *)a3
{
  p_shapeLayout = &self->_shapeLayout;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  double v7 = [WeakRetained stroke];

  if (v7 && ![v7 isNullStroke])
  {
    id v18 = objc_loadWeakRetained((id *)p_shapeLayout);
    v9 = [v18 pencilKitStrokes];

    if (v9)
    {
      long long v19 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v36.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v36.c = v19;
      *(_OWORD *)&v36.tx = *(_OWORD *)&a3->tx;
      if (CGAffineTransformIsIdentity(&v36))
      {
        id v20 = v9;
      }
      else
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1004BCAF8;
        v32[3] = &unk_1014D65D0;
        long long v27 = *(_OWORD *)&a3->c;
        long long v33 = *(_OWORD *)&a3->a;
        long long v34 = v27;
        long long v35 = *(_OWORD *)&a3->tx;
        [v9 crl_arrayByTransformingWithBlock:v32];
        id v20 = (id)objc_claimAutoreleasedReturnValue();
      }
      v22 = v20;
      +[CRLPencilKitInkStroke boundsOfStrokes:v20];
    }
    else
    {
      long long v21 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v36.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v36.c = v21;
      *(_OWORD *)&v36.tx = *(_OWORD *)&a3->tx;
      v22 = [(CRLShapeLayoutHelperFreehandDrawing *)self p_possibleCopyOfPathUsingTransform:&v36];
      [v22 bounds];
    }
    double v11 = v23;
    double v13 = v24;
    double v15 = v25;
    double v17 = v26;
  }
  else
  {
    long long v8 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v36.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v36.c = v8;
    *(_OWORD *)&v36.tx = *(_OWORD *)&a3->tx;
    v9 = [(CRLShapeLayoutHelperFreehandDrawing *)self p_possibleCopyOfPathUsingTransform:&v36];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }

  double v28 = v11;
  double v29 = v13;
  double v30 = v15;
  double v31 = v17;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)p_possibleCopyOfPathUsingTransform:(CGAffineTransform *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  double v5 = [WeakRetained path];

  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformIsIdentity(&v10))
  {
    id v7 = [v5 copy];

    long long v8 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v10.c = v8;
    *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
    [v7 transformUsingAffineTransform:&v10];
    double v5 = v7;
  }

  return v5;
}

- (CGRect)boundsOfLineEndForHead:(BOOL)a3 transform:(CGAffineTransform *)a4
{
  double x = CGRectNull.origin.x;
  double y = CGRectNull.origin.y;
  double width = CGRectNull.size.width;
  double height = CGRectNull.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)aliasedAlignmentFrameForScale:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  [WeakRetained alignmentFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shapeInfo);

  objc_destroyWeak((id *)&self->_shapeLayout);
}

@end