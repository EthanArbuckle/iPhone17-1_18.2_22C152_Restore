@interface _UIRectangularBoundingPath
+ (BOOL)supportsSecureCoding;
- (BOOL)_validateBoundingRect:(CGRect)a3 forCoordinateSpace:(id)a4;
- (BOOL)isNonRectangular;
- (BOOL)validateForCoordinateSpace;
- (CGRect)_inscribedRectInBoundingPathAndRect:(CGRect)a3 byInsettingRect:(CGRect)a4 onEdges:(unint64_t)a5 withOptions:(unint64_t)a6;
- (CGRect)_largestInscribedRectInBoundingPathAndRect:(CGRect)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5;
- (CGRect)_rectTuckedAgainstEdge:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(double)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7;
- (CGRect)_rectTuckedInCorner:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(CGSize)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7;
- (CGRect)boundingRect;
- (UIEdgeInsets)_centerEdgeInsetsOfBoundingPathAndRect:(CGRect)a3;
- (_UIRectangularBoundingPath)initWithCoder:(id)a3;
- (_UIRectangularBoundingPath)initWithCoordinateSpace:(id)a3 boundingRect:(CGRect)a4;
- (id)_imageRepresentation;
- (id)boundingPathForCoordinateSpace:(id)a3;
- (id)boundingPathForCoordinateSpace:(id)a3 withCornerRadii:(UIRectCornerRadii)a4 orientation:(int64_t)a5 scale:(double)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCoordinateSpace:(id)a3;
@end

@implementation _UIRectangularBoundingPath

- (BOOL)validateForCoordinateSpace
{
  v2 = self;
  p_boundingRect = &self->_boundingRect;
  v4 = [(_UIBoundingPath *)self coordinateSpace];
  LOBYTE(v2) = -[_UIRectangularBoundingPath _validateBoundingRect:forCoordinateSpace:](v2, "_validateBoundingRect:forCoordinateSpace:", v4, p_boundingRect->origin.x, p_boundingRect->origin.y, p_boundingRect->size.width, p_boundingRect->size.height);

  return (char)v2;
}

- (CGRect)_rectTuckedAgainstEdge:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(double)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7
{
  CGRect v15 = CGRectIntersection(a4, self->_boundingRect);
  -[_UIBoundingPath _rectTuckedAgainstEdge:ofBoundingRect:withSize:minimumPadding:](self, "_rectTuckedAgainstEdge:ofBoundingRect:withSize:minimumPadding:", a3, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height, a5, a7);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (_UIRectangularBoundingPath)initWithCoordinateSpace:(id)a3 boundingRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIRectangularBoundingPath;
  double v10 = [(_UIBoundingPath *)&v12 initWithCoordinateSpace:v9];
  if (v10)
  {
    v13.origin.double x = x;
    v13.origin.double y = y;
    v13.size.double width = width;
    v13.size.double height = height;
    if (CGRectIsNull(v13))
    {
      double x = *MEMORY[0x1E4F1DB28];
      double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    -[_UIRectangularBoundingPath _validateBoundingRect:forCoordinateSpace:](v10, "_validateBoundingRect:forCoordinateSpace:", v9, x, y, width, height);
    v10->_boundingRect.origin.double x = x;
    v10->_boundingRect.origin.double y = y;
    v10->_boundingRect.size.double width = width;
    v10->_boundingRect.size.double height = height;
  }

  return v10;
}

- (BOOL)_validateBoundingRect:(CGRect)a3 forCoordinateSpace:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  [v10 bounds];
  CGRect v25 = CGRectInset(v24, -0.001, -0.001);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  BOOL v11 = CGRectContainsRect(v25, v28);
  BOOL v12 = v11;
  if (_UIBoundingPathValidationAssertsEnabled)
  {
    if (!v11)
    {
      CGRect v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      v14 = NSStringFromCGRect(v26);
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIRectangularBoundingPath.m", 87, @"Bounding path likely out of sync with its coordinate space: The view's bounds must contain the bounding rect. Bounding rect: %@; coordinate space: %@",
        v14,
        v10);
    }
  }
  else if (!v11)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_validateBoundingRect_forCoordinateSpace____s_category)+ 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = v16;
        v27.origin.CGFloat x = x;
        v27.origin.CGFloat y = y;
        v27.size.CGFloat width = width;
        v27.size.CGFloat height = height;
        v18 = NSStringFromCGRect(v27);
        *(_DWORD *)buf = 138412546;
        v20 = v18;
        __int16 v21 = 2112;
        id v22 = v10;
        _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "Bounding path likely out of sync with its coordinate space: The view's bounds must contain the bounding rect. Bounding rect: %@; coordinate space: %@",
          buf,
          0x16u);
      }
    }
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIRectangularBoundingPath;
  id v4 = a3;
  [(_UIBoundingPath *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeCGRect:forKey:", @"boundingRect", self->_boundingRect.origin.x, self->_boundingRect.origin.y, self->_boundingRect.size.width, self->_boundingRect.size.height, v5.receiver, v5.super_class);
}

- (_UIRectangularBoundingPath)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIRectangularBoundingPath;
  objc_super v5 = [(_UIBoundingPath *)&v13 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    p_boundingRect = &v5->_boundingRect;
    [v4 decodeCGRectForKey:@"boundingRect"];
    *(void *)&p_boundingRect->origin.CGFloat x = v8;
    v6->_boundingRect.origin.CGFloat y = v9;
    v6->_boundingRect.size.CGFloat width = v10;
    v6->_boundingRect.size.CGFloat height = v11;
  }

  return v6;
}

- (id)boundingPathForCoordinateSpace:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    CGRect v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"_UIRectangularBoundingPath.m", 57, @"Invalid parameter not satisfying: %@", @"coordinateSpace != nil" object file lineNumber description];
  }
  v6 = [(_UIBoundingPath *)self coordinateSpace];
  if (!v6)
  {
    CGRect v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"_UIRectangularBoundingPath.m" lineNumber:59 description:@"The bounding path's coordinate space cannot be nil"];
  }
  [v5 bounds];
  objc_msgSend(v6, "convertRect:fromCoordinateSpace:", v5);
  CGRect v31 = CGRectIntersection(v30, self->_boundingRect);
  double x = v31.origin.x;
  double y = v31.origin.y;
  double width = v31.size.width;
  double height = v31.size.height;
  if (CGRectIsNull(v31)
    || (v32.origin.x = x, v32.origin.y = y, v32.size.width = width, v32.size.double height = height, CGRectIsEmpty(v32)))
  {
    CGFloat v11 = [_UIRectangularBoundingPath alloc];
    double v12 = *MEMORY[0x1E4F1DB28];
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    id v16 = v5;
  }
  else
  {
    objc_msgSend(v6, "convertRect:toCoordinateSpace:", v5, x, y, width, height);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    CGFloat v11 = [_UIRectangularBoundingPath alloc];
    id v16 = v5;
    double v12 = v18;
    double v13 = v20;
    double v14 = v22;
    double v15 = v24;
  }
  CGRect v25 = -[_UIRectangularBoundingPath initWithCoordinateSpace:boundingRect:](v11, "initWithCoordinateSpace:boundingRect:", v16, v12, v13, v14, v15);

  return v25;
}

- (id)boundingPathForCoordinateSpace:(id)a3 withCornerRadii:(UIRectCornerRadii)a4 orientation:(int64_t)a5 scale:(double)a6
{
  double topRight = a4.topRight;
  double bottomRight = a4.bottomRight;
  double bottomLeft = a4.bottomLeft;
  double topLeft = a4.topLeft;
  if (a4.topLeft == 0.0 && a4.bottomLeft == 0.0 && a4.bottomRight == 0.0 && a4.topRight == 0.0)
  {
    double v13 = (_UIComplexBoundingPath *)a3;
    double v14 = [(_UIRectangularBoundingPath *)self boundingPathForCoordinateSpace:v13];
  }
  else
  {
    id v15 = a3;
    id v16 = [_UIComplexBoundingPath alloc];
    double v17 = [(_UIBoundingPath *)self coordinateSpace];
    double v13 = [(_UIComplexBoundingPath *)v16 initWithRectangularCoordinateSpace:v17 orientation:a5 scale:a6];

    double v14 = -[_UIComplexBoundingPath boundingPathForCoordinateSpace:withCornerRadii:orientation:scale:](v13, "boundingPathForCoordinateSpace:withCornerRadii:orientation:scale:", v15, a5, topLeft, bottomLeft, bottomRight, topRight, a6);
  }
  return v14;
}

- (void)setCoordinateSpace:(id)a3
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  id v8 = a3;
  -[_UIRectangularBoundingPath _validateBoundingRect:forCoordinateSpace:](self, "_validateBoundingRect:forCoordinateSpace:", v8, x, y, width, height);
  v9.receiver = self;
  v9.super_class = (Class)_UIRectangularBoundingPath;
  [(_UIBoundingPath *)&v9 setCoordinateSpace:v8];
}

- (BOOL)isNonRectangular
{
  return 0;
}

- (CGRect)_inscribedRectInBoundingPathAndRect:(CGRect)a3 byInsettingRect:(CGRect)a4 onEdges:(unint64_t)a5 withOptions:(unint64_t)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  CGRect v20 = CGRectIntersection(a3, self->_boundingRect);
  -[_UIBoundingPath _inscribedRectInBoundingRect:byInsettingRect:onEdges:](self, "_inscribedRectInBoundingRect:byInsettingRect:onEdges:", a5, v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, x, y, width, height);
  CGFloat v12 = v21.origin.x;
  CGFloat v13 = v21.origin.y;
  double v14 = v21.size.width;
  double v15 = v21.size.height;
  if (CGRectIsNull(v21) || v14 <= 0.0 || v15 <= 0.0)
  {
    CGFloat v12 = *MEMORY[0x1E4F1DB20];
    CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)_largestInscribedRectInBoundingPathAndRect:(CGRect)a3 withCenter:(CGPoint)a4 aspectRatio:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  CGRect v17 = CGRectIntersection(a3, self->_boundingRect);
  -[_UIBoundingPath _largestInscribedRectInBoundingRect:withCenter:aspectRatio:](self, "_largestInscribedRectInBoundingRect:withCenter:aspectRatio:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height, x, y, a5);
  CGFloat v9 = v18.origin.x;
  CGFloat v10 = v18.origin.y;
  double width = v18.size.width;
  double height = v18.size.height;
  if (CGRectIsNull(v18) || width <= 0.0 || height <= 0.0)
  {
    CGFloat v9 = *MEMORY[0x1E4F1DB20];
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  double v13 = v9;
  double v14 = v10;
  double v15 = width;
  double v16 = height;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_rectTuckedInCorner:(unint64_t)a3 ofBoundingPathAndRect:(CGRect)a4 withSize:(CGSize)a5 cornerRadii:(UIRectCornerRadii)a6 minimumPadding:(double)a7
{
  double height = a5.height;
  double width = a5.width;
  CGRect v16 = CGRectIntersection(a4, self->_boundingRect);
  -[_UIBoundingPath _rectTuckedInCorner:ofBoundingRect:withSize:minimumPadding:](self, "_rectTuckedInCorner:ofBoundingRect:withSize:minimumPadding:", a3, v16.origin.x, v16.origin.y, v16.size.width, v16.size.height, width, height, a7);
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (UIEdgeInsets)_centerEdgeInsetsOfBoundingPathAndRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[_UIRectangularBoundingPath _inscribedRectInBoundingPathAndRect:byInsettingRect:onEdges:withOptions:](self, "_inscribedRectInBoundingPathAndRect:byInsettingRect:onEdges:withOptions:", 15, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat v7 = v25.origin.x;
  CGFloat v8 = v25.origin.y;
  CGFloat v9 = v25.size.width;
  CGFloat v10 = v25.size.height;
  if (CGRectIsNull(v25))
  {
    double v11 = INFINITY;
    double v12 = INFINITY;
    double v13 = INFINITY;
    double v14 = INFINITY;
  }
  else
  {
    v26.origin.CGFloat x = v7;
    v26.origin.CGFloat y = v8;
    v26.size.CGFloat width = v9;
    v26.size.CGFloat height = v10;
    CGFloat v23 = v8;
    CGFloat rect = v7;
    double MinY = CGRectGetMinY(v26);
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double v11 = MinY - CGRectGetMinY(v27);
    v28.origin.CGFloat x = v7;
    v28.origin.CGFloat y = v23;
    v28.size.CGFloat width = v9;
    v28.size.CGFloat height = v10;
    double MinX = CGRectGetMinX(v28);
    v29.origin.CGFloat x = x;
    v29.origin.CGFloat y = y;
    v29.size.CGFloat width = width;
    v29.size.CGFloat height = height;
    double v22 = MinX - CGRectGetMinX(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v30);
    v31.origin.CGFloat x = v7;
    v31.origin.CGFloat y = v23;
    v31.size.CGFloat width = v9;
    v31.size.CGFloat height = v10;
    double v16 = MaxY - CGRectGetMaxY(v31);
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v32);
    v33.origin.CGFloat y = v23;
    v33.origin.CGFloat x = rect;
    v33.size.CGFloat width = v9;
    v33.size.CGFloat height = v10;
    CGFloat v18 = CGRectGetMaxX(v33);
    double v13 = v16;
    double v12 = v22;
    double v14 = MaxX - v18;
  }
  double v19 = v11;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v19;
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(_UIBoundingPath *)self coordinateSpace];
  v6 = NSStringFromCGRect(self->_boundingRect);
  CGFloat v7 = [v3 stringWithFormat:@"<%@: %p coordinateSpace=%@ boundingRect=%@>", v4, self, v5, v6];;

  return v7;
}

- (id)_imageRepresentation
{
  v3 = [(_UIBoundingPath *)self coordinateSpace];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  CGFloat v8 = objc_alloc_init(UIGraphicsImageRendererFormat);
  [(UIGraphicsImageRendererFormat *)v8 setOpaque:1];
  [(UIGraphicsImageRendererFormat *)v8 setPreferredRange:2];
  CGFloat v9 = -[UIGraphicsImageRenderer initWithSize:format:]([UIGraphicsImageRenderer alloc], "initWithSize:format:", v8, v5, v7);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50___UIRectangularBoundingPath__imageRepresentation__block_invoke;
  v12[3] = &unk_1E52ECB28;
  *(double *)&v12[5] = v5;
  *(double *)&v12[6] = v7;
  v12[4] = self;
  CGFloat v10 = [(UIGraphicsImageRenderer *)v9 imageWithActions:v12];

  return v10;
}

- (CGRect)boundingRect
{
  double x = self->_boundingRect.origin.x;
  double y = self->_boundingRect.origin.y;
  double width = self->_boundingRect.size.width;
  double height = self->_boundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

@end