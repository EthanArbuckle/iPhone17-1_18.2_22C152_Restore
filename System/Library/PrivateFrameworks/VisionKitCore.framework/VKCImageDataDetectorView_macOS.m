@interface VKCImageDataDetectorView_macOS
- (BOOL)highlightedElementContainsPoint:(CGPoint)a3;
- (BOOL)needsRotationOffsetForElementQuad:(id)a3 buttonQuad:(id)a4 isLTR:(BOOL)a5;
- (CGSize)buttonImageSizeFromQuad:(id)a3 baseline:(CGPoint *)a4 LTR:(BOOL)a5 finalIsLTR:(BOOL *)a6;
- (UITapGestureRecognizer)tapGR;
- (VKCBaseDataDetectorElement)highlightedElement;
- (VKCDataDetectorHighlightView)highlightView;
- (VKCImageDataDetectorViewHighlightButton)highlightButtonImageView;
- (VKCImageDataDetectorView_macOS)initWithFrame:(CGRect)a3;
- (VKEdgeDistance)edgeDistanceFromLine:(CGPoint *)a3 toRect:(CGRect)a4;
- (VKQuad)buttonQuad;
- (VKQuad)ddBottomQuad;
- (double)angleOfQuad:(id)a3 LTR:(BOOL)a4;
- (double)closestDistanceFromLine:(CGPoint *)a3 point:(CGPoint)a4 toRect:(CGRect)a5;
- (id)elementAtPoint:(CGPoint)a3;
- (id)pathForDataDetectorElement:(id)a3;
- (id)quadAddingButtonQuad:(id)a3 toElementQuad:(id)a4 LTR:(BOOL)a5;
- (id)setupButtonForElement:(id)a3;
- (void)setButtonQuad:(id)a3;
- (void)setDdBottomQuad:(id)a3;
- (void)setHighlightButtonImageView:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setHighlightedElement:(id)a3;
- (void)setTapGR:(id)a3;
- (void)updateHighlightForPoint:(CGPoint)a3;
@end

@implementation VKCImageDataDetectorView_macOS

- (VKCImageDataDetectorView_macOS)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VKCImageDataDetectorView_macOS;
  v3 = -[VKCImageDataDetectorView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VKCDataDetectorHighlightView);
    highlightView = v3->_highlightView;
    v3->_highlightView = v4;

    [(VKCImageDataDetectorView_macOS *)v3 addSubview:v3->_highlightView];
    v6 = objc_alloc_init(VKCImageDataDetectorViewHighlightButton);
    highlightButtonImageView = v3->_highlightButtonImageView;
    v3->_highlightButtonImageView = v6;

    [(VKCImageDataDetectorViewHighlightButton *)v3->_highlightButtonImageView setHidden:1];
    [(VKCImageDataDetectorView_macOS *)v3 addSubview:v3->_highlightButtonImageView];
  }
  return v3;
}

- (id)pathForDataDetectorElement:(id)a3
{
  v3 = [(VKCImageDataDetectorView *)self viewSpaceQuadsForDataDetectorElement:a3];
  v4 = objc_msgSend(v3, "vk_compactMap:", &__block_literal_global_38);
  v5 = objc_msgSend(MEMORY[0x1E4F427D0], "vk_groupAndRoundPaths:radius:offset:", v4, 4.0, 4.0);

  return v5;
}

- (BOOL)highlightedElementContainsPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(VKCImageDataDetectorView_macOS *)self highlightView];
  if (v6)
  {
    -[VKCImageDataDetectorView_macOS convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
    double v8 = v7;
    double v10 = v9;
    v11 = [v6 path];
    char v12 = objc_msgSend(v11, "containsPoint:", v8, v10);
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)updateHighlightForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!-[VKCImageDataDetectorView_macOS highlightedElementContainsPoint:](self, "highlightedElementContainsPoint:"))
  {
    uint64_t v6 = -[VKCImageDataDetectorView_macOS elementAtPoint:](self, "elementAtPoint:", x, y);
    id v10 = (id)v6;
    if (v6)
    {
      uint64_t v7 = v6;
      double v8 = self;
      uint64_t v9 = v7;
    }
    else
    {
      double v8 = self;
      uint64_t v9 = 0;
    }
    [(VKCImageDataDetectorView_macOS *)v8 setHighlightedElement:v9];
  }
}

- (void)setHighlightedElement:(id)a3
{
  v5 = (VKCBaseDataDetectorElement *)a3;
  p_highlightedElement = &self->_highlightedElement;
  if (self->_highlightedElement != v5)
  {
    objc_storeStrong((id *)&self->_highlightedElement, a3);
    uint64_t v7 = [(VKCImageDataDetectorView_macOS *)self highlightView];
    [v7 setHidden:*p_highlightedElement == 0];
    if (*p_highlightedElement)
    {
      double v8 = -[VKCImageDataDetectorView_macOS setupButtonForElement:](self, "setupButtonForElement:");
      uint64_t v9 = [v8 ddBottomQuad];
      [v9 sideLength];
      if (v10 >= v11) {
        double v10 = v11;
      }
      [(UIView *)self vk_windowLengthFromViewLength:v10];
      BOOL v13 = v12 < 6.0;
      v14 = [v8 combinedElementHighlightPath];
      v15 = [v8 buttonQuad];
      [(VKCImageDataDetectorView_macOS *)self setButtonQuad:v15];

      v16 = [v8 ddBottomQuad];
      [(VKCImageDataDetectorView_macOS *)self setDdBottomQuad:v16];

      [v14 bounds];
      objc_msgSend(v7, "setFrame:");
      [v7 frame];
      CGFloat v18 = -v17;
      [v7 frame];
      CGAffineTransformMakeTranslation(&v22, v18, -v19);
      objc_msgSend(v14, "vk_applyTransform:", &v22);
      [v7 setPath:v14];
      [v7 setHideDashedLine:v13];
    }
    else
    {
      v20 = [(VKCImageDataDetectorView_macOS *)self highlightButtonImageView];
      [v20 setHidden:1];

      v21 = [(VKCImageDataDetectorView_macOS *)self highlightView];
      [v21 setPath:0];

      [(VKCImageDataDetectorView_macOS *)self setButtonQuad:0];
    }
  }
}

- (id)elementAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (-[VKCImageDataDetectorView_macOS highlightedElementContainsPoint:](self, "highlightedElementContainsPoint:")) {
    [(VKCImageDataDetectorView_macOS *)self highlightedElement];
  }
  else {
  uint64_t v6 = -[VKCImageDataDetectorView closestElementToPoint:maxDistance:](self, "closestElementToPoint:maxDistance:", x, y, 0.0);
  }
  return v6;
}

- (id)setupButtonForElement:(id)a3
{
  v69[4] = *MEMORY[0x1E4F143B8];
  v4 = [(VKCImageDataDetectorView *)self viewSpaceQuadsForDataDetectorElement:a3];
  v5 = [v4 lastObject];
  [v5 bottomLeft];
  double v7 = v6;
  double v9 = v8;
  [v5 bottomRight];
  double v12 = VKMAngleOfLine(v7, v9, v10, v11);
  [v5 bottomLeft];
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  [v5 bottomRight];
  v69[0] = v14;
  v69[1] = v16;
  v69[2] = v17;
  v69[3] = v18;
  char v68 = 0;
  [(VKCImageDataDetectorView_macOS *)self buttonImageSizeFromQuad:v5 baseline:v69 LTR:1 finalIsLTR:&v68];
  double v20 = v19;
  [v5 bottomLeft];
  double v22 = v21;
  double v24 = v23;
  [v5 topLeft];
  double v26 = VKMMidpointOnLineSegment(v22, v24, v25);
  double v28 = v27;
  [v5 bottomRight];
  double v30 = v29;
  double v32 = v31;
  [v5 topRight];
  double v34 = VKMMidpointOnLineSegment(v30, v32, v33);
  double v36 = VKMPointByExtendingLineFromPoints(v26, v28, v34, v35, v20 * 0.5);
  double v38 = v37;
  v39 = [(VKCImageDataDetectorView_macOS *)self highlightButtonImageView];
  double v40 = VKMRectWithCenterAndSize(v36, v38, v20);
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  objc_msgSend(v39, "setFrame:");
  [v39 setHidden:0];
  [v39 setRotation:v12];
  v47 = -[VKQuad initWithRect:]([VKQuad alloc], "initWithRect:", v40, v42, v44, v46);
  v48 = [(VKQuad *)v47 quadFromRotatingAroundCentroidWithAngle:v12];
  if ([(VKCImageDataDetectorView_macOS *)self needsRotationOffsetForElementQuad:v5 buttonQuad:v48 isLTR:1])
  {
    double v49 = v12 + 3.14159265;
    [v39 setRotation:v49];
    uint64_t v50 = [(VKQuad *)v47 quadFromRotatingAroundCentroidWithAngle:v49];

    v48 = (void *)v50;
  }
  v51 = [(VKCImageDataDetectorView_macOS *)self quadAddingButtonQuad:v48 toElementQuad:v5 LTR:1];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __56__VKCImageDataDetectorView_macOS_setupButtonForElement___block_invoke;
  v65[3] = &unk_1E6BF3EB8;
  id v66 = v51;
  v67 = self;
  id v52 = v51;
  v53 = objc_msgSend(v4, "vk_map:", v65);
  v54 = [(VKCImageBaseOverlayView *)self recognitionResult];
  [v54 imageSize];
  double v57 = VKMAspectRatio(v55, v56);

  v58 = objc_msgSend(MEMORY[0x1E4F427D0], "vk_roundAndGroupNormalizedQuadsForHighlight:aspectRatio:expansionScale:radiusToAvgHeightRatio:", v53, v57, 0.2, 0.02);
  [(VKCImageDataDetectorView_macOS *)self bounds];
  memset(&v64, 0, sizeof(v64));
  CGAffineTransformMakeScale(&v64, v59, v60);
  CGAffineTransform v63 = v64;
  objc_msgSend(v58, "vk_applyTransform:", &v63);
  v61 = objc_alloc_init(VKCImageDataDetectorViewQuadInfo);
  [(VKCImageDataDetectorViewQuadInfo *)v61 setButtonQuad:v48];
  [(VKCImageDataDetectorViewQuadInfo *)v61 setDdBottomQuad:v5];
  [(VKCImageDataDetectorViewQuadInfo *)v61 setCombinedElementHighlightPath:v58];

  return v61;
}

- (BOOL)needsRotationOffsetForElementQuad:(id)a3 buttonQuad:(id)a4 isLTR:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  double v9 = v8;
  if (v5)
  {
    [v8 bottomLeft];
    double v11 = v10;
    double v13 = v12;
    [v7 bottomLeft];
    double v16 = VKMDistance(v11, v13, v14, v15);
    [v9 bottomLeft];
    double v18 = v17;
    double v20 = v19;

    [v7 bottomRight];
  }
  else
  {
    [v8 bottomRight];
    double v24 = v23;
    double v26 = v25;
    [v7 bottomRight];
    double v16 = VKMDistance(v24, v26, v27, v28);
    [v9 bottomRight];
    double v18 = v29;
    double v20 = v30;

    [v7 bottomLeft];
  }
  double v31 = v21;
  double v32 = v22;

  return v16 > VKMDistance(v18, v20, v31, v32);
}

- (double)angleOfQuad:(id)a3 LTR:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = v5;
  if (v4)
  {
    [v5 bottomLeft];
    double v8 = v7;
    double v10 = v9;
    [v6 bottomRight];
  }
  else
  {
    [v5 bottomRight];
    double v8 = v13;
    double v10 = v14;
    [v6 bottomLeft];
  }
  double v15 = v11;
  double v16 = v12;

  return VKMAngleOfLine(v8, v10, v15, v16);
}

- (VKEdgeDistance)edgeDistanceFromLine:(CGPoint *)a3 toRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  -[VKCImageDataDetectorView_macOS closestDistanceFromLine:point:toRect:](self, "closestDistanceFromLine:point:toRect:", a3->x, a3->y, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v11 = v10;
  -[VKCImageDataDetectorView_macOS closestDistanceFromLine:point:toRect:](self, "closestDistanceFromLine:point:toRect:", a3, a3[1].x, a3[1].y, x, y, width, height);
  double v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (double)closestDistanceFromLine:(CGPoint *)a3 point:(CGPoint)a4 toRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v9 = a4.y;
  CGFloat v10 = a4.x;
  v32[4] = *(double *)MEMORY[0x1E4F143B8];
  v33.CGFloat x = v10;
  v33.CGFloat y = v9;
  BOOL v12 = CGRectContainsPoint(a5, v33);
  double result = -1.0;
  if (v12)
  {
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    CGFloat MinX = CGRectGetMinX(v35);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v36);
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    CGFloat MaxX = CGRectGetMaxX(v37);
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    CGFloat v22 = CGRectGetMinY(v38);
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    CGFloat v14 = CGRectGetMinX(v39) + 0.00001;
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    CGFloat MaxY = CGRectGetMaxY(v40);
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.CGFloat width = width;
    v41.size.CGFloat height = height;
    CGFloat v16 = CGRectGetMaxX(v41) + 0.00001;
    v42.origin.CGFloat x = x;
    v42.origin.CGFloat y = y;
    v42.size.CGFloat width = width;
    v42.size.CGFloat height = height;
    v32[0] = MaxX;
    v32[1] = v22;
    v32[2] = MinX;
    v32[3] = MinY;
    CGFloat v28 = v16;
    CGFloat v29 = CGRectGetMaxY(v42);
    CGFloat v30 = v14;
    CGFloat v31 = MaxY;
    v27[0] = MinX;
    v27[1] = MinY;
    v27[2] = v14;
    v27[3] = MaxY;
    v26[0] = MaxX;
    v26[1] = v22;
    v26[2] = v16;
    v26[3] = v29;
    VKMDistanceFromLineToLineAtPoint(&a3->x, v32);
    double v18 = v17;
    VKMDistanceFromLineToLineAtPoint(&a3->x, &v28);
    if (v18 >= v19) {
      double v20 = v19;
    }
    else {
      double v20 = v18;
    }
    VKMDistanceFromLineToLineAtPoint(&a3->x, v27);
    if (v20 >= v21) {
      double v20 = v21;
    }
    VKMDistanceFromLineToLineAtPoint(&a3->x, v26);
    if (v20 < result) {
      return v20;
    }
  }
  return result;
}

- (CGSize)buttonImageSizeFromQuad:(id)a3 baseline:(CGPoint *)a4 LTR:(BOOL)a5 finalIsLTR:(BOOL *)a6
{
  BOOL v7 = a5;
  *a6 = a5;
  [a3 sideLength];
  double v12 = v10;
  double v13 = v11;
  if (v7) {
    double v14 = v11;
  }
  else {
    double v14 = v10;
  }
  [(UIView *)self vk_viewPointRatioFromWindow];
  double v16 = VKMClamp(v14, v15 * 12.0, v15 * 32.0);
  [(VKCImageDataDetectorView_macOS *)self bounds];
  -[VKCImageDataDetectorView_macOS edgeDistanceFromLine:toRect:](self, "edgeDistanceFromLine:toRect:", a4);
  if (v7)
  {
    if (v17 >= 12.0)
    {
      if (v17 < v16) {
        double v16 = v17;
      }
    }
    else if (v18 > 12.0)
    {
      double v16 = VKMClamp(v13, 12.0, 32.0);
      *a6 = 0;
    }
  }
  else if (v18 < 12.0 && v17 > 12.0)
  {
    double v16 = VKMClamp(v12, 12.0, 32.0);
    *a6 = 1;
  }
  double v20 = v16;
  double v21 = v16;
  result.CGFloat height = v21;
  result.CGFloat width = v20;
  return result;
}

- (id)quadAddingButtonQuad:(id)a3 toElementQuad:(id)a4 LTR:(BOOL)a5
{
  BOOL v5 = a5;
  v67[4] = *(double *)MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a3;
  [v7 topLeft];
  double v10 = v9;
  double v12 = v11;
  [v7 topRight];
  double v14 = v13;
  double v16 = v15;
  [v7 bottomLeft];
  double v18 = v17;
  double v20 = v19;
  [v7 bottomRight];
  double v22 = v21;
  double v24 = v23;

  if (v5) {
    double v25 = v20;
  }
  else {
    double v25 = v24;
  }
  if (v5) {
    double v26 = v18;
  }
  else {
    double v26 = v22;
  }
  v67[0] = v26;
  v67[1] = v25;
  double v52 = v20;
  double v53 = v18;
  if (v5)
  {
    double v20 = v24;
    double v18 = v22;
    double v27 = v12;
  }
  else
  {
    double v27 = v16;
  }
  if (v5) {
    double v28 = v10;
  }
  else {
    double v28 = v14;
  }
  double v56 = v12;
  double v57 = v10;
  double v54 = v16;
  double v55 = v14;
  if (v5) {
    double v12 = v16;
  }
  v67[2] = v18;
  v67[3] = v20;
  if (v5) {
    double v10 = v14;
  }
  v66[0] = v28;
  v66[1] = v27;
  v66[2] = v10;
  v66[3] = v12;
  if (v5)
  {
    [v8 bottomRight];
    uint64_t v62 = v29;
    uint64_t v63 = v30;
    [v8 topRight];
  }
  else
  {
    [v8 bottomLeft];
    uint64_t v62 = v33;
    uint64_t v63 = v34;
    [v8 topLeft];
  }
  uint64_t v35 = v31;
  uint64_t v36 = v32;

  uint64_t v60 = 0;
  uint64_t v61 = 0;
  double v58 = 0.0;
  double v59 = 0.0;
  uint64_t v64 = v35;
  uint64_t v65 = v36;
  VKMIntersectionOfLines(v67, (double *)&v62, (double *)&v60, (double *)&v61, &v58, 1, 1);
  double v37 = VKMDistance(v18, v20, v58, v59);
  VKMIntersectionOfLines(v66, (double *)&v62, (double *)&v60, (double *)&v61, &v58, 1, 1);
  double v38 = VKMDistance(v10, v12, v58, v59);
  if (v5)
  {
    double v40 = v56;
    double v39 = v57;
    double v41 = VKMPointByExtendingLineFromPoints(v57, v56, v55, v54, v38);
    double v43 = v42;
    double v44 = v53;
    double v45 = v37;
    double v46 = v52;
    double v22 = VKMPointByExtendingLineFromPoints(v53, v52, v22, v24, v45);
    double v24 = v47;
  }
  else
  {
    double v43 = v54;
    double v41 = v55;
    double v39 = VKMPointByExtendingLineFromPoints(v55, v54, v57, v56, v38);
    double v40 = v48;
    double v44 = VKMPointByExtendingLineFromPoints(v22, v24, v53, v52, v37);
    double v46 = v49;
  }
  uint64_t v50 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:]([VKQuad alloc], "initWithBottomLeft:bottomRight:topLeft:topRight:", v44, v46, v22, v24, v39, v40, v41, v43);
  return v50;
}

- (VKCBaseDataDetectorElement)highlightedElement
{
  return self->_highlightedElement;
}

- (VKCDataDetectorHighlightView)highlightView
{
  return self->_highlightView;
}

- (void)setHighlightView:(id)a3
{
}

- (VKQuad)buttonQuad
{
  return self->_buttonQuad;
}

- (void)setButtonQuad:(id)a3
{
}

- (VKQuad)ddBottomQuad
{
  return self->_ddBottomQuad;
}

- (void)setDdBottomQuad:(id)a3
{
}

- (UITapGestureRecognizer)tapGR
{
  return self->_tapGR;
}

- (void)setTapGR:(id)a3
{
}

- (VKCImageDataDetectorViewHighlightButton)highlightButtonImageView
{
  return self->_highlightButtonImageView;
}

- (void)setHighlightButtonImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightButtonImageView, 0);
  objc_storeStrong((id *)&self->_tapGR, 0);
  objc_storeStrong((id *)&self->_ddBottomQuad, 0);
  objc_storeStrong((id *)&self->_buttonQuad, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_highlightedElement, 0);
}

@end