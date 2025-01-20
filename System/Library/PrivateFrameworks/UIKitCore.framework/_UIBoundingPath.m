@interface _UIBoundingPath
+ (BOOL)supportsSecureCoding;
- (BOOL)isNonRectangular;
- (BOOL)validateForCoordinateSpace;
- (CGRect)_inscribedRectInBoundingPathAndRect:(CGRect)a3 byInsettingRect:(CGRect)a4 onEdges:(unint64_t)a5 withOptions:(unint64_t)a6;
- (CGRect)_inscribedRectInBoundingRect:(CGRect)a3 byInsettingRect:(CGRect)a4 onEdges:(unint64_t)a5;
- (CGRect)_largestInscribedRectInBoundingPathAndRect:(CGRect)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5;
- (CGRect)_largestInscribedRectInBoundingRect:(CGRect)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5;
- (CGRect)_rectTuckedAgainstEdge:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(double)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7;
- (CGRect)_rectTuckedAgainstEdge:(unint64_t)a3 ofBoundingRect:(CGRect)a4 withSize:(double)a5 minimumPadding:(double)a6;
- (CGRect)_rectTuckedInCorner:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(CGSize)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7;
- (CGRect)_rectTuckedInCorner:(unint64_t)a3 ofBoundingRect:(CGRect)a4 withSize:(CGSize)a5 minimumPadding:(double)a6;
- (UICoordinateSpace)coordinateSpace;
- (UIEdgeInsets)_centerEdgeInsetsOfBoundingPathAndRect:(CGRect)a3;
- (_UIBoundingPath)initWithCoder:(id)a3;
- (_UIBoundingPath)initWithCoordinateSpace:(id)a3;
- (id)_imageRepresentation;
- (id)boundingPathForCoordinateSpace:(id)a3;
- (id)boundingPathForCoordinateSpace:(id)a3 withCornerRadii:(UIRectCornerRadii)a4 orientation:(int64_t)a5 scale:(double)a6;
- (void)setCoordinateSpace:(id)a3;
@end

@implementation _UIBoundingPath

- (UICoordinateSpace)coordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  return (UICoordinateSpace *)WeakRetained;
}

- (CGRect)_rectTuckedAgainstEdge:(unint64_t)a3 ofBoundingRect:(CGRect)a4 withSize:(double)a5 minimumPadding:(double)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (CGRectIsNull(a4)) {
    goto LABEL_2;
  }
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGRect v28 = CGRectInset(v27, a6, a6);
  if (v28.size.width < 0.0) {
    goto LABEL_2;
  }
  CGFloat v22 = v28.size.height;
  if (v28.size.height < 0.0) {
    goto LABEL_2;
  }
  CGFloat v23 = v28.origin.x;
  CGFloat v24 = v28.origin.y;
  CGFloat v25 = v28.size.width;
  switch(a3)
  {
    case 1uLL:
      double MinX = CGRectGetMinX(v28);
      v29.origin.CGFloat x = v23;
      v29.origin.CGFloat y = v24;
      v29.size.CGFloat width = v25;
      v29.size.CGFloat height = v22;
      double MinY = CGRectGetMinY(v29);
      goto LABEL_11;
    case 2uLL:
      double MinX = CGRectGetMinX(v28);
      goto LABEL_13;
    case 4uLL:
      double MinX = CGRectGetMinX(v28);
      v30.origin.CGFloat x = v23;
      v30.origin.CGFloat y = v24;
      v30.size.CGFloat width = v25;
      v30.size.CGFloat height = v22;
      double MinY = CGRectGetMaxY(v30) - a5;
LABEL_11:
      v31.origin.CGFloat x = v23;
      v31.origin.CGFloat y = v24;
      v31.size.CGFloat width = v25;
      v31.size.CGFloat height = v22;
      double v17 = a5;
      a5 = CGRectGetWidth(v31);
      break;
    case 8uLL:
      double MinX = CGRectGetMaxX(v28) - a5;
LABEL_13:
      v32.origin.CGFloat x = v23;
      v32.origin.CGFloat y = v24;
      v32.size.CGFloat width = v25;
      v32.size.CGFloat height = v22;
      double MinY = CGRectGetMinY(v32);
      v33.origin.CGFloat x = v23;
      v33.origin.CGFloat y = v24;
      v33.size.CGFloat width = v25;
      v33.size.CGFloat height = v22;
      double v17 = CGRectGetHeight(v33);
      break;
    default:
      a5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      double MinX = *MEMORY[0x1E4F1DB20];
      double MinY = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIBoundingPath.m", 403, @"Invalid UIRectEdge value (%ld)", a3);

      break;
  }
  v34.origin.CGFloat x = MinX;
  v34.origin.CGFloat y = MinY;
  v34.size.CGFloat width = a5;
  v34.size.CGFloat height = v17;
  if (CGRectIsNull(v34)) {
    goto LABEL_2;
  }
  v35.origin.CGFloat x = v23;
  v35.origin.CGFloat y = v24;
  v35.size.CGFloat width = v25;
  v35.size.CGFloat height = v22;
  CGRect v36 = CGRectInset(v35, -0.01, -0.01);
  v38.origin.CGFloat x = MinX;
  v38.origin.CGFloat y = MinY;
  v38.size.CGFloat width = a5;
  v38.size.CGFloat height = v17;
  if (!CGRectContainsRect(v36, v38))
  {
LABEL_2:
    double MinX = *MEMORY[0x1E4F1DB20];
    double MinY = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    a5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v18 = MinX;
  double v19 = MinY;
  double v20 = a5;
  double v21 = v17;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)_inscribedRectInBoundingRect:(CGRect)a3 byInsettingRect:(CGRect)a4 onEdges:(unint64_t)a5
{
  char v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  if (CGRectIsNull(a4)) {
    goto LABEL_12;
  }
  CGFloat rect = v10;
  if ((v5 & 2) != 0)
  {
    v27.origin.double x = v13;
    v27.origin.double y = v12;
    v27.size.double width = v11;
    v27.size.double height = v10;
    double MinX = CGRectGetMinX(v27);
    v28.origin.double x = x;
    v28.origin.double y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    double v17 = fmax(MinX - CGRectGetMinX(v28), 0.0);
    double x = x + v17;
    double width = width - v17;
    if ((v5 & 8) == 0)
    {
LABEL_4:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
LABEL_9:
      v31.origin.double x = v13;
      v31.origin.double y = v12;
      v31.size.double width = v11;
      v31.size.double height = rect;
      double MinY = CGRectGetMinY(v31);
      v32.origin.double x = x;
      v32.origin.double y = y;
      v32.size.double width = width;
      v32.size.double height = height;
      double v20 = fmax(MinY - CGRectGetMinY(v32), 0.0);
      double y = y + v20;
      double height = height - v20;
      if ((v5 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_10;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_4;
  }
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  double MaxX = CGRectGetMaxX(v29);
  v30.origin.double x = v13;
  v30.origin.double y = v12;
  v30.size.double width = v11;
  v30.size.double height = rect;
  double width = width - fmax(MaxX - CGRectGetMaxX(v30), 0.0);
  if (v5) {
    goto LABEL_9;
  }
LABEL_5:
  if ((v5 & 4) == 0)
  {
LABEL_6:
    CGFloat v14 = v11;
    CGFloat v15 = rect;
    goto LABEL_11;
  }
LABEL_10:
  v33.origin.double x = x;
  v33.origin.double y = y;
  v33.size.double width = width;
  v33.size.double height = height;
  double MaxY = CGRectGetMaxY(v33);
  v34.origin.double x = v13;
  v34.origin.double y = v12;
  v34.size.double width = v11;
  CGFloat v14 = v11;
  CGFloat v15 = rect;
  v34.size.double height = rect;
  double height = height - fmax(MaxY - CGRectGetMaxY(v34), 0.0);
LABEL_11:
  v35.origin.double x = v13;
  v35.origin.double y = v12;
  v35.size.double width = v14;
  v35.size.double height = v15;
  v37.origin.double x = x;
  v37.origin.double y = y;
  v37.size.double width = width;
  v37.size.double height = height;
  if (!CGRectContainsRect(v35, v37))
  {
LABEL_12:
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void).cxx_destruct
{
}

- (_UIBoundingPath)initWithCoordinateSpace:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIBoundingPath;
  v6 = [(_UIBoundingPath *)&v9 init];
  if (v6)
  {
    if (!v5)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, v6, @"_UIBoundingPath.m", 181, @"Invalid parameter not satisfying: %@", @"coordinateSpace != nil" object file lineNumber description];
    }
    objc_storeWeak((id *)&v6->_coordinateSpace, v5);
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIBoundingPath)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIBoundingPath;
  return [(_UIBoundingPath *)&v4 init];
}

- (BOOL)validateForCoordinateSpace
{
  return 0;
}

- (id)boundingPathForCoordinateSpace:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  [v5 handleFailureInMethod:a2, self, @"_UIBoundingPath.m", 196, @"%@ must provide a concrete implementation of %@", v7, v8 object file lineNumber description];

  return 0;
}

- (id)boundingPathForCoordinateSpace:(id)a3 withCornerRadii:(UIRectCornerRadii)a4 orientation:(int64_t)a5 scale:(double)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a5, a4.topLeft, a4.bottomLeft, a4.bottomRight, a4.topRight, a6);
  objc_super v9 = (objc_class *)objc_opt_class();
  CGFloat v10 = NSStringFromClass(v9);
  CGFloat v11 = NSStringFromSelector(a2);
  [v8 handleFailureInMethod:a2, self, @"_UIBoundingPath.m", 203, @"%@ must provide a concrete implementation of %@", v10, v11 object file lineNumber description];

  return 0;
}

- (BOOL)isNonRectangular
{
  return 0;
}

- (CGRect)_inscribedRectInBoundingPathAndRect:(CGRect)a3 byInsettingRect:(CGRect)a4 onEdges:(unint64_t)a5 withOptions:(unint64_t)a6
{
  double v6 = *MEMORY[0x1E4F1DB20];
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (CGRect)_largestInscribedRectInBoundingPathAndRect:(CGRect)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5
{
  double v5 = *MEMORY[0x1E4F1DB20];
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)_rectTuckedInCorner:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(CGSize)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7
{
  double v7 = *MEMORY[0x1E4F1DB20];
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)_rectTuckedAgainstEdge:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(double)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7
{
  double v7 = *MEMORY[0x1E4F1DB20];
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)_largestInscribedRectInBoundingRect:(CGRect)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5
{
  _UIBoundingPathLargestInscribedRectWithAspectRatioAndCenter(a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.x, a4.y);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)_rectTuckedInCorner:(unint64_t)a3 ofBoundingRect:(CGRect)a4 withSize:(CGSize)a5 minimumPadding:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  CGFloat v9 = a4.size.height;
  CGFloat v10 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (CGRectIsNull(a4)
    || (v60.origin.CGFloat x = x,
        v60.origin.CGFloat y = y,
        v60.size.double width = v10,
        v60.size.double height = v9,
        CGRect v61 = CGRectInset(v60, a6, a6),
        CGFloat v43 = v61.origin.y,
        v61.size.width < 0.0)
    || v61.size.height < 0.0)
  {
    double v19 = *MEMORY[0x1E4F1DB20];
    double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    CGFloat v14 = v61.size.width;
    CGFloat v41 = v61.origin.x;
    CGFloat rect = v61.size.height;
    double v15 = _UIDirectionVectorForCorner(a3);
    uint64_t v39 = v16;
    double v40 = v15;
    uint64_t v54 = 0;
    v55 = (CGRect *)&v54;
    uint64_t v56 = 0x4010000000;
    v57 = &unk_186D7DBA7;
    long long v58 = 0u;
    long long v59 = 0u;
    double v17 = (CGRect *)MEMORY[0x1E4F1DB20];
    switch(a3)
    {
      case 1uLL:
        v62.origin.CGFloat x = x;
        v62.origin.CGFloat y = y;
        v62.size.double width = v10;
        v62.size.double height = v9;
        double MinX = CGRectGetMinX(v62);
        goto LABEL_8;
      case 2uLL:
        v63.origin.CGFloat x = x;
        v63.origin.CGFloat y = y;
        v63.size.double width = v10;
        v63.size.double height = v9;
        double MinX = CGRectGetMaxX(v63) - width;
LABEL_8:
        v64.origin.CGFloat x = x;
        v64.origin.CGFloat y = y;
        v64.size.double width = v10;
        v64.size.double height = v9;
        double MinY = CGRectGetMinY(v64);
        goto LABEL_13;
      case 4uLL:
        v65.origin.CGFloat x = x;
        v65.origin.CGFloat y = y;
        v65.size.double width = v10;
        v65.size.double height = v9;
        double MinX = CGRectGetMinX(v65);
        goto LABEL_12;
      case 8uLL:
        v66.origin.CGFloat x = x;
        v66.origin.CGFloat y = y;
        v66.size.double width = v10;
        v66.size.double height = v9;
        double MinX = CGRectGetMaxX(v66) - width;
LABEL_12:
        v67.origin.CGFloat x = x;
        v67.origin.CGFloat y = y;
        v67.size.double width = v10;
        v67.size.double height = v9;
        double MinY = CGRectGetMaxY(v67) - height;
LABEL_13:
        double v26 = width;
        double v27 = height;
        break;
      default:
        double v24 = [MEMORY[0x1E4F28B00] currentHandler];
        CGFloat v25 = objc_msgSend(NSString, "stringWithUTF8String:", "CGRect _rectWithSizeInCornerOfBoundingRect(const CGSize, const UIRectCorner, const CGRect)");
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"_UIBoundingPath.m", 319, @"Invalid UIRectCorner value (%ld)", a3);

        double MinX = v17->origin.x;
        double MinY = v17->origin.y;
        double v26 = v17->size.width;
        double v27 = v17->size.height;
        break;
    }
    *(double *)&long long v58 = MinX;
    *((double *)&v58 + 1) = MinY;
    *(double *)&long long v59 = v26;
    *((double *)&v59 + 1) = v27;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v45 = __78___UIBoundingPath__rectTuckedInCorner_ofBoundingRect_withSize_minimumPadding___block_invoke;
    v46 = &unk_1E52F1C68;
    v47 = &v54;
    double v48 = v40;
    uint64_t v49 = v39;
    CGFloat v50 = v41;
    CGFloat v51 = v43;
    CGFloat v52 = v14;
    CGFloat v53 = rect;
    __78___UIBoundingPath__rectTuckedInCorner_ofBoundingRect_withSize_minimumPadding___block_invoke((uint64_t)v44, v55[1].origin.x, v55[1].origin.y);
    if (width > 0.0 || height > 0.0)
    {
      v45((uint64_t)v44, v55[1].origin.x, v55[1].origin.y + v55[1].size.height);
      v45((uint64_t)v44, v55[1].origin.x + v55[1].size.width, v55[1].origin.y + v55[1].size.height);
      v45((uint64_t)v44, v55[1].origin.x + v55[1].size.width, v55[1].origin.y);
    }
    if (CGRectIsNull(v55[1])) {
      goto LABEL_20;
    }
    CGFloat v28 = v55[1].origin.x;
    CGFloat v29 = v55[1].origin.y;
    v68.origin.CGFloat x = v41;
    CGFloat v30 = v55[1].size.width;
    CGFloat v31 = v55[1].size.height;
    v68.origin.CGFloat y = v43;
    v68.size.double width = v14;
    v68.size.double height = rect;
    CGRect v69 = CGRectInset(v68, -0.01, -0.01);
    v71.origin.CGFloat x = v28;
    v71.origin.CGFloat y = v29;
    v71.size.double width = v30;
    v71.size.double height = v31;
    if (!CGRectContainsRect(v69, v71))
    {
LABEL_20:
      p_double height = &v17->size.height;
      p_double width = &v17->size.width;
      p_CGFloat y = &v17->origin.y;
    }
    else
    {
      double v17 = v55 + 1;
      p_CGFloat y = &v55[1].origin.y;
      p_double width = &v55[1].size.width;
      p_double height = &v55[1].size.height;
    }
    double v22 = *p_height;
    double v21 = *p_width;
    double v20 = *p_y;
    double v19 = v17->origin.x;
    _Block_object_dispose(&v54, 8);
  }
  double v35 = v19;
  double v36 = v20;
  double v37 = v21;
  double v38 = v22;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.CGFloat y = v36;
  result.origin.CGFloat x = v35;
  return result;
}

- (UIEdgeInsets)_centerEdgeInsetsOfBoundingPathAndRect:(CGRect)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (id)_imageRepresentation
{
  v2 = objc_alloc_init(UIImage);
  return v2;
}

- (void)setCoordinateSpace:(id)a3
{
}

@end