@interface CRLShapeLayoutHelperDefault
- (BOOL)shouldComputeSeparateClippedPathBounds;
- (CGRect)aliasedAlignmentFrameForScale:(double)a3;
- (CGRect)boundsOfLineEndForHead:(BOOL)a3 transform:(CGAffineTransform *)a4;
- (CGRect)computeClippedPathBoundsWithTransform:(CGAffineTransform *)a3;
- (CGRect)computePathBounds;
- (CRLShapeLayoutHelperDefault)initWithShapeLayout:(id)a3;
@end

@implementation CRLShapeLayoutHelperDefault

- (CRLShapeLayoutHelperDefault)initWithShapeLayout:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLShapeLayoutHelperDefault;
  v5 = [(CRLShapeLayoutHelperDefault *)&v11 init];
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
  p_shapeInfo = &self->_shapeInfo;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shapeInfo);
  id v4 = [WeakRetained headLineEnd];

  if (v4 && ![v4 isNone])
  {
    BOOL v7 = 1;
  }
  else
  {
    id v5 = objc_loadWeakRetained((id *)p_shapeInfo);
    v6 = [v5 tailLineEnd];

    BOOL v7 = v6 && ![v6 isNone];
  }

  return v7;
}

- (CGRect)computePathBounds
{
  p_shapeLayout = &self->_shapeLayout;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  id v5 = [WeakRetained stroke];

  id v6 = objc_loadWeakRetained((id *)p_shapeLayout);
  BOOL v7 = [v6 path];
  [v7 boundsIncludingCRLStroke:v5];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  id v16 = objc_loadWeakRetained((id *)p_shapeLayout);
  if ([v16 pathIsOpen])
  {
    unsigned int v17 = [v5 supportsWidth];

    if (v17)
    {
      long long v36 = *(_OWORD *)&CGAffineTransformIdentity.c;
      long long v37 = *(_OWORD *)&CGAffineTransformIdentity.a;
      long long v35 = v37;
      long long v38 = v36;
      long long v39 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      long long v34 = v39;
      [(CRLShapeLayoutHelperDefault *)self boundsOfLineEndForHead:1 transform:&v37];
      v45.origin.CGFloat x = v18;
      v45.origin.CGFloat y = v19;
      v45.size.CGFloat width = v20;
      v45.size.CGFloat height = v21;
      v40.origin.CGFloat x = v9;
      v40.origin.CGFloat y = v11;
      v40.size.CGFloat width = v13;
      v40.size.CGFloat height = v15;
      CGRect v41 = CGRectUnion(v40, v45);
      CGFloat x = v41.origin.x;
      CGFloat y = v41.origin.y;
      CGFloat width = v41.size.width;
      CGFloat height = v41.size.height;
      long long v37 = v35;
      long long v38 = v36;
      long long v39 = v34;
      [(CRLShapeLayoutHelperDefault *)self boundsOfLineEndForHead:0 transform:&v37];
      v46.origin.CGFloat x = v26;
      v46.origin.CGFloat y = v27;
      v46.size.CGFloat width = v28;
      v46.size.CGFloat height = v29;
      v42.origin.CGFloat x = x;
      v42.origin.CGFloat y = y;
      v42.size.CGFloat width = width;
      v42.size.CGFloat height = height;
      CGRect v43 = CGRectUnion(v42, v46);
      CGFloat v9 = v43.origin.x;
      CGFloat v11 = v43.origin.y;
      CGFloat v13 = v43.size.width;
      CGFloat v15 = v43.size.height;
    }
  }
  else
  {
  }
  double v30 = v9;
  double v31 = v11;
  double v32 = v13;
  double v33 = v15;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (CGRect)computeClippedPathBoundsWithTransform:(CGAffineTransform *)a3
{
  p_shapeLayout = &self->_shapeLayout;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  id v6 = [WeakRetained clippedPathForLineEnds];
  id v7 = [v6 copy];

  long long v8 = *(_OWORD *)&a3->c;
  v23[0] = *(_OWORD *)&a3->a;
  v23[1] = v8;
  v23[2] = *(_OWORD *)&a3->tx;
  [v7 transformUsingAffineTransform:v23];
  id v9 = objc_loadWeakRetained((id *)p_shapeLayout);
  double v10 = [v9 stroke];
  [v7 boundsIncludingCRLStroke:v10];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)boundsOfLineEndForHead:(BOOL)a3 transform:(CGAffineTransform *)a4
{
  BOOL v5 = a3;
  p_shapeLayout = &self->_shapeLayout;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  long long v8 = WeakRetained;
  if (v5) {
    [WeakRetained strokeHeadLineEnd];
  }
  else {
  id v9 = [WeakRetained strokeTailLineEnd];
  }
  CGFloat x = CGRectNull.origin.x;
  CGFloat y = CGRectNull.origin.y;
  CGFloat width = CGRectNull.size.width;
  CGFloat height = CGRectNull.size.height;

  if (v9 && ([v9 isNone] & 1) == 0)
  {
    id v14 = objc_loadWeakRetained((id *)p_shapeLayout);
    double v15 = v14;
    if (v5)
    {
      [v14 headLineEndPoint];
      double v17 = v16;
      double v19 = v18;

      id v20 = objc_loadWeakRetained((id *)p_shapeLayout);
      [v20 headLineEndAngle];
    }
    else
    {
      [v14 tailLineEndPoint];
      double v17 = v22;
      double v19 = v23;

      id v20 = objc_loadWeakRetained((id *)p_shapeLayout);
      [v20 tailLineEndAngle];
    }
    double v24 = v21;

    id v25 = objc_loadWeakRetained((id *)p_shapeLayout);
    [v25 lineEndScale:v5];
    double v27 = v26;

    id v28 = objc_loadWeakRetained((id *)p_shapeLayout);
    CGFloat v29 = [v28 stroke];
    long long v30 = *(_OWORD *)&a4->c;
    v39[0] = *(_OWORD *)&a4->a;
    v39[1] = v30;
    v39[2] = *(_OWORD *)&a4->tx;
    [v29 boundsForLineEnd:v9 atPoint:v39 atAngle:v17 withScale:v19 transform:v24];
    CGFloat x = v31;
    CGFloat y = v32;
    CGFloat width = v33;
    CGFloat height = v34;
  }
  double v35 = x;
  double v36 = y;
  double v37 = width;
  double v38 = height;
  result.size.CGFloat height = v38;
  result.size.CGFloat width = v37;
  result.origin.CGFloat y = v36;
  result.origin.CGFloat x = v35;
  return result;
}

- (CGRect)aliasedAlignmentFrameForScale:(double)a3
{
  CGFloat v61 = 0.0;
  CGFloat v62 = 0.0;
  CGFloat v59 = 0.0;
  CGFloat v60 = 0.0;
  p_shapeLayout = &self->_shapeLayout;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shapeLayout);
  id v57 = 0;
  id v58 = 0;
  [WeakRetained aliasPathForScale:&v58 adjustedStroke:&v57 adjustedPath:&v61 startDelta:&v59 endDelta:a3];
  id v7 = v58;
  id v8 = v57;

  id v9 = objc_loadWeakRetained((id *)p_shapeLayout);
  [v9 pathBounds];
  double v11 = v10;
  double v13 = v12;

  memset(&v56, 0, sizeof(v56));
  id v14 = objc_loadWeakRetained((id *)p_shapeLayout);
  double v15 = v14;
  if (v14) {
    [v14 transform];
  }
  else {
    memset(&v56, 0, sizeof(v56));
  }

  CGAffineTransform v54 = v56;
  CGAffineTransformTranslate(&v55, &v54, -v11, -v13);
  CGAffineTransform v56 = v55;
  id v16 = v7;
  id v17 = [v8 copy];
  CGAffineTransform v55 = v56;
  [v17 transformUsingAffineTransform:&v55];
  [v17 boundsIncludingCRLStroke:v16];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  id v26 = objc_loadWeakRetained((id *)p_shapeLayout);
  unsigned int v27 = [v26 pathIsOpen];

  if (v27)
  {
    CGAffineTransform v55 = v56;
    [(CRLShapeLayoutHelperDefault *)self boundsOfLineEndForHead:1 transform:&v55];
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;
    CGAffineTransformMakeTranslation(&v53, v61, v62);
    v63.origin.CGFloat x = v29;
    v63.origin.CGFloat y = v31;
    v63.size.CGFloat width = v33;
    v63.size.CGFloat height = v35;
    CGRect v70 = CGRectApplyAffineTransform(v63, &v53);
    v64.origin.CGFloat x = v19;
    v64.origin.CGFloat y = v21;
    v64.size.CGFloat width = v23;
    v64.size.CGFloat height = v25;
    CGRect v65 = CGRectUnion(v64, v70);
    CGFloat x = v65.origin.x;
    CGFloat y = v65.origin.y;
    CGFloat width = v65.size.width;
    CGFloat height = v65.size.height;
    CGAffineTransform v55 = v56;
    [(CRLShapeLayoutHelperDefault *)self boundsOfLineEndForHead:0 transform:&v55];
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    CGAffineTransformMakeTranslation(&v52, v59, v60);
    v66.origin.CGFloat x = v41;
    v66.origin.CGFloat y = v43;
    v66.size.CGFloat width = v45;
    v66.size.CGFloat height = v47;
    CGRect v71 = CGRectApplyAffineTransform(v66, &v52);
    v67.origin.CGFloat x = x;
    v67.origin.CGFloat y = y;
    v67.size.CGFloat width = width;
    v67.size.CGFloat height = height;
    CGRect v68 = CGRectUnion(v67, v71);
    CGFloat v19 = v68.origin.x;
    CGFloat v21 = v68.origin.y;
    CGFloat v23 = v68.size.width;
    CGFloat v25 = v68.size.height;
  }

  double v48 = v19;
  double v49 = v21;
  double v50 = v23;
  double v51 = v25;
  result.size.CGFloat height = v51;
  result.size.CGFloat width = v50;
  result.origin.CGFloat y = v49;
  result.origin.CGFloat x = v48;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shapeInfo);

  objc_destroyWeak((id *)&self->_shapeLayout);
}

@end