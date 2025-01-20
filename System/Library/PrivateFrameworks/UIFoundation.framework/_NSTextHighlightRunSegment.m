@interface _NSTextHighlightRunSegment
- (BOOL)anyRunHasBottomBorderOnPoint:(CGPoint)a3 withLeftCornerExtensionDistance:(double *)a4 withRightCornerExtensionDistance:(double *)a5;
- (BOOL)anyRunHasTopBorderOnPoint:(CGPoint)a3 withLeftCornerExtensionDistance:(double *)a4 withRightCornerExtensionDistance:(double *)a5;
- (BOOL)doesAnySegmentHaveBottomBorderOnPoint:(CGPoint)a3 withLeftCornerExtensionDistance:(double *)a4 withRightCornerExtensionDistance:(double *)a5;
- (BOOL)doesAnySegmentHaveTopBorderOnPoint:(CGPoint)a3 withLeftCornerExtensionDistance:(double *)a4 withRightCornerExtensionDistance:(double *)a5;
- (BOOL)isLastSegmentOfRun;
- (BOOL)isSecondFromLastSegmentOfRun;
- (BOOL)nextSegmentInCurrentRunIsOnPoint:(CGPoint)a3 withLeftCornerExtensionDistance:(double *)a4 withRightCornerExtensionDistance:(double *)a5;
- (BOOL)previousSegmentInCurrentRunIsOnPoint:(CGPoint)a3 withLeftCornerExtensionDistance:(double *)a4 withRightCornerExtensionDistance:(double *)a5;
- (CGPath)createBottomLeftCornerExtensionWithRadius:(double)a3;
- (CGPath)createBottomRightCornerExtensionWithRadius:(double)a3;
- (CGPath)createCornerExtensionWithOrigin:(CGPoint)a3 radius:(double)a4 firstPoint:(CGPoint)a5 secondPoint:(CGPoint)a6 arcCenter:(CGPoint)a7 startAngle:(double)a8 endAngle:(double)a9;
- (CGPath)createTopLeftCornerExtensionWithRadius:(double)a3;
- (CGPath)createTopRightCornerExtensionWithRadius:(double)a3;
- (CGPoint)bottomLeftCornerPoint;
- (CGPoint)bottomRightCornerPoint;
- (CGPoint)topLeftCornerPoint;
- (CGPoint)topRightCornerPoint;
- (id)description;
- (id)nextSegment;
- (uint64_t)calculateCGPath;
- (uint64_t)initWithTextSegmentFrame:(double)a3 withRun:(double)a4;
- (uint64_t)needsLeftOutset;
- (uint64_t)needsRightOutset;
- (void)_calculateHighlightSegmentShape;
- (void)cornerOutset;
- (void)cornerRadius;
- (void)prevSegment;
- (void)setTextRange:(uint64_t)a1;
@end

@implementation _NSTextHighlightRunSegment

- (uint64_t)initWithTextSegmentFrame:(double)a3 withRun:(double)a4
{
  v11 = a2;
  if (a1)
  {
    v19.receiver = (id)a1;
    v19.super_class = (Class)_NSTextHighlightRunSegment;
    v12 = (id *)objc_msgSendSuper2(&v19, sel_init);
    a1 = (uint64_t)v12;
    if (v12)
    {
      id v13 = objc_storeWeak(v12 + 2, v11);
      if (v11) {
        v14 = (void *)v11[7];
      }
      else {
        v14 = 0;
      }
      *(void *)(a1 + 24) = [v14 count];

      *(double *)(a1 + 96) = a3;
      *(double *)(a1 + 104) = a4;
      *(double *)(a1 + 112) = a5;
      *(double *)(a1 + 120) = a6;
      *(double *)(a1 + 128) = a3;
      *(double *)(a1 + 136) = a4;
      *(double *)(a1 + 144) = a5;
      *(double *)(a1 + 152) = a6;
      *(_OWORD *)(a1 + 32) = 0u;
      *(_OWORD *)(a1 + 48) = 0u;
      uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
      v16 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v15;

      if (*(double *)(a1 + 112) == 0.0)
      {
        -[_NSTextHighlightRunSegment cornerOutset](a1);
        *(double *)(a1 + 144) = v17 + v17;
      }
    }
  }

  return a1;
}

- (void)cornerOutset
{
  if (a1)
  {
    v2 = (id *)(a1 + 16);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v4 = WeakRetained;
    if (WeakRetained) {
      WeakRetained = (void *)WeakRetained[7];
    }
    uint64_t v5 = [WeakRetained count];

    if (v5)
    {
      id v6 = objc_loadWeakRetained(v2);
      -[_NSTextHighlightRun cornerOutset]((uint64_t)v6);
    }
    else
    {
      uint64_t v9 = 0;
      id v7 = objc_loadWeakRetained(v2);
      [(_NSTextHighlightRun *)(uint64_t)v7 getMetricsForTextSize:(double *)&v9 cornerRadius:*(double *)(a1 + 144) cornerOutset:*(double *)(a1 + 152)];
    }
  }
}

- (void)cornerRadius
{
  if (a1)
  {
    if (*(double *)(a1 + 112) == 0.0)
    {
      -[_NSTextHighlightRunSegment cornerOutset](a1);
    }
    else
    {
      double v2 = *(double *)(a1 + 144);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      double v4 = -[_NSTextHighlightRun cornerRadius]((uint64_t)WeakRetained);
      double v5 = v4 + v4;

      if (v2 >= v5)
      {
        id v6 = objc_loadWeakRetained((id *)(a1 + 16));
        -[_NSTextHighlightRun cornerRadius]((uint64_t)v6);
      }
    }
  }
}

- (uint64_t)needsLeftOutset
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (*(void *)(a1 + 24))
    {
      return 1;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
      uint64_t v1 = WeakRetained && WeakRetained[32] || *(double *)(v1 + 112) == 0.0;
    }
  }
  return v1;
}

- (uint64_t)needsRightOutset
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (-[_NSTextHighlightRunSegment isLastSegmentOfRun](a1))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 16));
      uint64_t v1 = WeakRetained && WeakRetained[33] || *(double *)(v1 + 112) == 0.0;
    }
    else
    {
      return 1;
    }
  }
  return v1;
}

- (BOOL)isLastSegmentOfRun
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = *(void *)(a1 + 24);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  v3 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = (void *)WeakRetained[7];
  }
  BOOL v4 = v1 == [WeakRetained count] - 1;

  return v4;
}

- (BOOL)isSecondFromLastSegmentOfRun
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = *(void *)(a1 + 24);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  v3 = WeakRetained;
  if (WeakRetained) {
    id WeakRetained = (void *)WeakRetained[7];
  }
  BOOL v4 = v1 == [WeakRetained count] - 2;

  return v4;
}

- (CGPoint)bottomLeftCornerPoint
{
  double x = self->_highlightFrame.origin.x;
  double v3 = self->_highlightFrame.origin.y + self->_highlightFrame.size.height;
  result.y = v3;
  result.double x = x;
  return result;
}

- (CGPoint)bottomRightCornerPoint
{
  double v2 = self->_highlightFrame.origin.x + self->_highlightFrame.size.width;
  double v3 = self->_highlightFrame.origin.y + self->_highlightFrame.size.height;
  result.y = v3;
  result.double x = v2;
  return result;
}

- (CGPoint)topRightCornerPoint
{
  double y = self->_highlightFrame.origin.y;
  double v3 = self->_highlightFrame.origin.x + self->_highlightFrame.size.width;
  result.double y = y;
  result.double x = v3;
  return result;
}

- (CGPoint)topLeftCornerPoint
{
  double x = self->_highlightFrame.origin.x;
  double y = self->_highlightFrame.origin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)prevSegment
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (a1[3])
    {
      id WeakRetained = objc_loadWeakRetained(a1 + 2);
      double v3 = WeakRetained;
      if (WeakRetained) {
        id WeakRetained = (void *)WeakRetained[7];
      }
      uint64_t v1 = [WeakRetained objectAtIndex:v1[3] - 1];
    }
    else
    {
      uint64_t v1 = 0;
    }
  }

  return v1;
}

- (id)nextSegment
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = a1[3];
    id WeakRetained = objc_loadWeakRetained(a1 + 2);
    BOOL v4 = WeakRetained;
    if (WeakRetained) {
      id WeakRetained = (void *)WeakRetained[7];
    }
    uint64_t v5 = [WeakRetained count] - 1;

    if (v2 == (id)v5)
    {
      uint64_t v1 = 0;
    }
    else
    {
      id v6 = objc_loadWeakRetained(v1 + 2);
      id v7 = v6;
      if (v6) {
        id v6 = (void *)v6[7];
      }
      uint64_t v1 = [v6 objectAtIndex:(char *)v1[3] + 1];
    }
  }

  return v1;
}

- (uint64_t)calculateCGPath
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 _calculateHighlightSegmentShape];
    uint64_t v2 = *(void *)(v1 + 56);
    uint64_t v11 = *(void *)(v1 + 48);
    uint64_t v12 = v11;
    uint64_t v13 = v2;
    uint64_t v14 = v2;
    uint64_t v3 = *(void *)(v1 + 32);
    uint64_t v15 = *(void *)(v1 + 40);
    uint64_t v16 = v15;
    uint64_t v17 = v3;
    uint64_t v18 = v3;
    uint64_t v7 = 0;
    double v8 = &v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v10 = 0;
    uint64_t v10 = CGPathCreateWithUnevenCornersRoundedRect();
    id v4 = *(id *)(v1 + 64);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45___NSTextHighlightRunSegment_calculateCGPath__block_invoke;
    v6[3] = &unk_1E55C6D40;
    v6[4] = &v7;
    [v4 enumerateObjectsUsingBlock:v6];

    uint64_t v1 = v8[3];
    _Block_object_dispose(&v7, 8);
  }
  return v1;
}

- (void)_calculateHighlightSegmentShape
{
  -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
  if (self)
  {
    self->_bottomLeftCornerRadius = v3;
    -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
    self->_bottomRightCornerRadius = v4;
    -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
    self->_topRightCornerRadius = v5;
    -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
    self->_topLeftCornerRadius = v6;
    if (!-[_NSTextHighlightRunSegment needsLeftOutset]((uint64_t)self))
    {
      self->_topLeftCornerRadius = 0.0;
      self->_bottomLeftCornerRadius = 0.0;
      if (-[_NSTextHighlightRunSegment needsRightOutset]((uint64_t)self)) {
        goto LABEL_5;
      }
LABEL_8:
      self->_topRightCornerRadius = 0.0;
      self->_bottomRightCornerRadius = 0.0;
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_run);
LABEL_4:
    self->_highlightFrame.origin.double x = self->_highlightFrame.origin.x
                                   - -[_NSTextHighlightRun cornerOutset]((uint64_t)WeakRetained);

    id v8 = objc_loadWeakRetained((id *)&self->_run);
    self->_highlightFrame.size.width = -[_NSTextHighlightRun cornerOutset]((uint64_t)v8)
                                     + self->_highlightFrame.size.width;

    if (-[_NSTextHighlightRunSegment needsRightOutset]((uint64_t)self))
    {
LABEL_5:
      id v9 = objc_loadWeakRetained((id *)&self->_run);
LABEL_6:
      self->_highlightFrame.size.width = -[_NSTextHighlightRun cornerOutset]((uint64_t)v9)
                                       + self->_highlightFrame.size.width;

      goto LABEL_9;
    }
    goto LABEL_8;
  }
  -[_NSTextHighlightRunSegment cornerRadius](0);
  -[_NSTextHighlightRunSegment cornerRadius](0);
  -[_NSTextHighlightRunSegment cornerRadius](0);
  id WeakRetained = 0;
  if (-[_NSTextHighlightRunSegment needsLeftOutset](0)) {
    goto LABEL_4;
  }
  id v9 = 0;
  if (-[_NSTextHighlightRunSegment needsRightOutset](0)) {
    goto LABEL_6;
  }
LABEL_9:
  uint64_t v53 = 0;
  double v52 = 0.0;
  [(_NSTextHighlightRunSegment *)self topRightCornerPoint];
  if (!-[_NSTextHighlightRunSegment doesAnySegmentHaveBottomBorderOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:](self, "doesAnySegmentHaveBottomBorderOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:", &v53, &v52))goto LABEL_26; {
  if (v52 >= 0.0)
  }
    double v10 = v52;
  else {
    double v10 = -v52;
  }
  -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
  if (v10 >= v11 || v52 >= 0.0)
  {
    double v12 = 0.0;
    if (self) {
      goto LABEL_18;
    }
  }
  else if (self)
  {
    double v12 = v52 * -0.5;
LABEL_18:
    self->_topRightCornerRadius = v12;
    id v13 = objc_loadWeakRetained((id *)&self->_run);
    uint64_t v14 = v13;
    if (v13 && *((unsigned char *)v13 + 33)) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  uint64_t v14 = 0;
LABEL_20:
  if (-[_NSTextHighlightRunSegment isLastSegmentOfRun]((uint64_t)self))
  {

    goto LABEL_26;
  }
LABEL_22:
  double v15 = v52;

  if (v15 > 0.0)
  {
    double v16 = v52 * 0.5;
    -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
    if (v16 < v17) {
      double v17 = v16;
    }
    uint64_t v18 = [(_NSTextHighlightRunSegment *)self createTopRightCornerExtensionWithRadius:v17];
    [(NSMutableArray *)self->_cornerExtensions addObject:v18];
    CFRelease(v18);
  }
LABEL_26:
  uint64_t v50 = 0;
  double v51 = 0.0;
  [(_NSTextHighlightRunSegment *)self topLeftCornerPoint];
  if (!-[_NSTextHighlightRunSegment doesAnySegmentHaveBottomBorderOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:](self, "doesAnySegmentHaveBottomBorderOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:", &v51, &v50))goto LABEL_46; {
  if (v51 >= 0.0)
  }
    double v19 = v51;
  else {
    double v19 = -v51;
  }
  -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
  double v20 = v51;
  if (v19 < v21 && v51 < 0.0)
  {
    if (self)
    {
      double v22 = v51 * 0.5;
      goto LABEL_35;
    }
LABEL_88:
    v24 = 0;
    if (v51 >= 0.0) {
      double v23 = v51;
    }
    else {
      double v23 = -v51;
    }
    goto LABEL_41;
  }
  double v22 = 0.0;
  if (!self) {
    goto LABEL_88;
  }
LABEL_35:
  self->_topLeftCornerRadius = v22;
  if (v20 >= 0.0) {
    double v23 = v20;
  }
  else {
    double v23 = -v20;
  }
  v24 = objc_loadWeakRetained((id *)&self->_run);
  if ((!v24 || !v24[32]) && !self->_segmentIndex)
  {

    goto LABEL_46;
  }
LABEL_41:

  if (v23 > 0.0)
  {
    double v25 = v23 * 0.5;
    -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
    if (v25 < v26) {
      double v26 = v25;
    }
    v27 = [(_NSTextHighlightRunSegment *)self createTopLeftCornerExtensionWithRadius:v26];
    [(NSMutableArray *)self->_cornerExtensions addObject:v27];
    CFRelease(v27);
  }
LABEL_46:
  double v48 = 0.0;
  uint64_t v49 = 0;
  [(_NSTextHighlightRunSegment *)self bottomRightCornerPoint];
  if (!-[_NSTextHighlightRunSegment doesAnySegmentHaveTopBorderOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:](self, "doesAnySegmentHaveTopBorderOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:", &v49, &v48))goto LABEL_63; {
  if (v48 >= 0.0)
  }
    double v28 = v48;
  else {
    double v28 = -v48;
  }
  -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
  if (v28 >= v29 || v48 >= 0.0)
  {
    double v30 = 0.0;
    if (self) {
      goto LABEL_55;
    }
  }
  else if (self)
  {
    double v30 = v48 * -0.5;
LABEL_55:
    self->_bottomRightCornerRadius = v30;
    id v31 = objc_loadWeakRetained((id *)&self->_run);
    v32 = v31;
    if (v31 && *((unsigned char *)v31 + 33)) {
      goto LABEL_59;
    }
    goto LABEL_57;
  }
  v32 = 0;
LABEL_57:
  if (-[_NSTextHighlightRunSegment isLastSegmentOfRun]((uint64_t)self))
  {

    goto LABEL_63;
  }
LABEL_59:
  double v33 = v48;

  if (v33 > 0.0)
  {
    double v34 = v48 * 0.5;
    -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
    if (v34 < v35) {
      double v35 = v34;
    }
    v36 = [(_NSTextHighlightRunSegment *)self createBottomRightCornerExtensionWithRadius:v35];
    [(NSMutableArray *)self->_cornerExtensions addObject:v36];
    CFRelease(v36);
  }
LABEL_63:
  double v47 = 0.0;
  [(_NSTextHighlightRunSegment *)self bottomLeftCornerPoint];
  if (!-[_NSTextHighlightRunSegment doesAnySegmentHaveTopBorderOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:](self, "doesAnySegmentHaveTopBorderOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:", &v47, &v46))return; {
  if (v47 >= 0.0)
  }
    double v37 = v47;
  else {
    double v37 = -v47;
  }
  -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
  double v38 = v47;
  if (v37 < v39 && v47 < 0.0)
  {
    if (self)
    {
      double v40 = v47 * 0.5;
      goto LABEL_72;
    }
LABEL_92:
    v42 = 0;
    if (v47 >= 0.0) {
      double v41 = v47;
    }
    else {
      double v41 = -v47;
    }
    goto LABEL_78;
  }
  double v40 = 0.0;
  if (!self) {
    goto LABEL_92;
  }
LABEL_72:
  self->_bottomLeftCornerRadius = v40;
  if (v38 >= 0.0) {
    double v41 = v38;
  }
  else {
    double v41 = -v38;
  }
  v42 = objc_loadWeakRetained((id *)&self->_run);
  if ((!v42 || !v42[32]) && !self->_segmentIndex)
  {

    return;
  }
LABEL_78:

  if (v41 > 0.0)
  {
    double v43 = v41 * 0.5;
    -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
    if (v43 < v44) {
      double v44 = v43;
    }
    v45 = [(_NSTextHighlightRunSegment *)self createBottomLeftCornerExtensionWithRadius:v44];
    [(NSMutableArray *)self->_cornerExtensions addObject:v45];
    CFRelease(v45);
  }
}

- (CGPath)createCornerExtensionWithOrigin:(CGPoint)a3 radius:(double)a4 firstPoint:(CGPoint)a5 secondPoint:(CGPoint)a6 arcCenter:(CGPoint)a7 startAngle:(double)a8 endAngle:(double)a9
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v11 = a5.y;
  CGFloat v12 = a5.x;
  CGFloat v13 = a3.y;
  CGFloat v14 = a3.x;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v12, v11);
  CGPathAddLineToPoint(Mutable, 0, v14, v13);
  CGPathAddLineToPoint(Mutable, 0, x, y);
  CGPathAddArc(Mutable, 0, a7.x, a7.y, a4, a8, a9, 0);
  CGPathCloseSubpath(Mutable);
  double v16 = (CGPath *)MEMORY[0x192FAD390](Mutable);
  CFRelease(Mutable);
  return v16;
}

- (CGPath)createTopRightCornerExtensionWithRadius:(double)a3
{
  [(_NSTextHighlightRunSegment *)self topRightCornerPoint];
  return -[_NSTextHighlightRunSegment createCornerExtensionWithOrigin:radius:firstPoint:secondPoint:arcCenter:startAngle:endAngle:](self, "createCornerExtensionWithOrigin:radius:firstPoint:secondPoint:arcCenter:startAngle:endAngle:", v5 + a3, v6 + a3, 0x400921FB54442D18, 0x4012D97C7F3321D2);
}

- (CGPath)createTopLeftCornerExtensionWithRadius:(double)a3
{
  [(_NSTextHighlightRunSegment *)self topLeftCornerPoint];
  return -[_NSTextHighlightRunSegment createCornerExtensionWithOrigin:radius:firstPoint:secondPoint:arcCenter:startAngle:endAngle:](self, "createCornerExtensionWithOrigin:radius:firstPoint:secondPoint:arcCenter:startAngle:endAngle:", v5 - a3, v6 + a3, 0x4012D97C7F3321D2, 0);
}

- (CGPath)createBottomLeftCornerExtensionWithRadius:(double)a3
{
  [(_NSTextHighlightRunSegment *)self bottomLeftCornerPoint];
  return -[_NSTextHighlightRunSegment createCornerExtensionWithOrigin:radius:firstPoint:secondPoint:arcCenter:startAngle:endAngle:](self, "createCornerExtensionWithOrigin:radius:firstPoint:secondPoint:arcCenter:startAngle:endAngle:", v5 - a3, v6 - a3, 0, 0x3FF921FB54442D18);
}

- (CGPath)createBottomRightCornerExtensionWithRadius:(double)a3
{
  [(_NSTextHighlightRunSegment *)self bottomRightCornerPoint];
  return -[_NSTextHighlightRunSegment createCornerExtensionWithOrigin:radius:firstPoint:secondPoint:arcCenter:startAngle:endAngle:](self, "createCornerExtensionWithOrigin:radius:firstPoint:secondPoint:arcCenter:startAngle:endAngle:", v5 + a3, v6 - a3, 0x3FF921FB54442D18, 0x400921FB54442D18);
}

- (BOOL)doesAnySegmentHaveBottomBorderOnPoint:(CGPoint)a3 withLeftCornerExtensionDistance:(double *)a4 withRightCornerExtensionDistance:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  if (!self)
  {
LABEL_4:
    return -[_NSTextHighlightRunSegment previousSegmentInCurrentRunIsOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:](self, "previousSegmentInCurrentRunIsOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:");
  }
  segmentIndedouble x = self->_segmentIndex;
  if (segmentIndex == 1)
  {
    if (-[_NSTextHighlightRunSegment previousSegmentInCurrentRunIsOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:](self, "previousSegmentInCurrentRunIsOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:", a4, a5, a3.x, a3.y))
    {
      return 1;
    }
  }
  else if (segmentIndex)
  {
    goto LABEL_4;
  }

  return -[_NSTextHighlightRunSegment anyRunHasBottomBorderOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:](self, "anyRunHasBottomBorderOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:", a4, a5, x, y);
}

- (BOOL)doesAnySegmentHaveTopBorderOnPoint:(CGPoint)a3 withLeftCornerExtensionDistance:(double *)a4 withRightCornerExtensionDistance:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  if (!-[_NSTextHighlightRunSegment isLastSegmentOfRun]((uint64_t)self))
  {
    BOOL SegmentOf = -[_NSTextHighlightRunSegment isSecondFromLastSegmentOfRun]((uint64_t)self);
    BOOL v11 = -[_NSTextHighlightRunSegment nextSegmentInCurrentRunIsOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:](self, "nextSegmentInCurrentRunIsOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:", a4, a5, x, y);
    if (!SegmentOf || v11) {
      return SegmentOf || v11;
    }
  }

  return -[_NSTextHighlightRunSegment anyRunHasTopBorderOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:](self, "anyRunHasTopBorderOnPoint:withLeftCornerExtensionDistance:withRightCornerExtensionDistance:", a4, a5, x, y);
}

- (BOOL)anyRunHasBottomBorderOnPoint:(CGPoint)a3 withLeftCornerExtensionDistance:(double *)a4 withRightCornerExtensionDistance:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  if (!self)
  {
    BOOL v11 = 0;
    goto LABEL_6;
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_run);
  BOOL v11 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_6:
    id v12 = 0;
    goto LABEL_4;
  }
  id v12 = objc_loadWeakRetained(WeakRetained + 5);
LABEL_4:
  -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
  BOOL v14 = [(_NSTextHighlightCluster *)(uint64_t)v12 topNeighborExistsAtPoint:(uint64_t)a5 withinDistance:x withLeftCornerExtensionDistance:y withRightCornerExtensionDistance:v13];

  return v14;
}

- (BOOL)anyRunHasTopBorderOnPoint:(CGPoint)a3 withLeftCornerExtensionDistance:(double *)a4 withRightCornerExtensionDistance:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  if (!self)
  {
    BOOL v11 = 0;
    goto LABEL_6;
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_run);
  BOOL v11 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_6:
    id v12 = 0;
    goto LABEL_4;
  }
  id v12 = objc_loadWeakRetained(WeakRetained + 5);
LABEL_4:
  -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
  BOOL v14 = [(_NSTextHighlightCluster *)(uint64_t)v12 bottomNeighborExistsAtPoint:(uint64_t)a5 withinDistance:x withLeftCornerExtensionDistance:y withRightCornerExtensionDistance:v13];

  return v14;
}

- (BOOL)previousSegmentInCurrentRunIsOnPoint:(CGPoint)a3 withLeftCornerExtensionDistance:(double *)a4 withRightCornerExtensionDistance:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  double v10 = -[_NSTextHighlightRunSegment prevSegment]((id *)&self->super.isa);

  if (!v10) {
    return 0;
  }
  if (self)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_run);
    id v12 = WeakRetained;
    if (WeakRetained)
    {
      double v13 = (id *)objc_loadWeakRetained(WeakRetained + 5);
      BOOL v14 = v13;
      if (v13)
      {
        id v15 = objc_loadWeakRetained(v13 + 3);
        goto LABEL_6;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
    id v12 = 0;
  }
  id v15 = 0;
LABEL_6:
  -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
  double v17 = v16;
  -[_NSTextHighlightRunSegment prevSegment]((id *)&self->super.isa);
  uint64_t v18 = (double *)objc_claimAutoreleasedReturnValue();
  double v19 = v18;
  if (v18)
  {
    double v20 = v18[16];
    double v21 = v18[17];
    double v22 = v18[18];
    double v23 = v18[19];
  }
  else
  {
    double v21 = 0.0;
    double v22 = 0.0;
    double v23 = 0.0;
    double v20 = 0.0;
  }
  char v24 = objc_msgSend(v15, "isPoint:withinHorizontalDistance:onRect:leftDistance:rightDistance:", a4, a5, x, y, v17, v20, v21, v22, v23);

  return (v24 & 1) != 0;
}

- (BOOL)nextSegmentInCurrentRunIsOnPoint:(CGPoint)a3 withLeftCornerExtensionDistance:(double *)a4 withRightCornerExtensionDistance:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  double v10 = -[_NSTextHighlightRunSegment nextSegment]((id *)&self->super.isa);

  if (!v10) {
    return 0;
  }
  if (self)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_run);
    id v12 = WeakRetained;
    if (WeakRetained)
    {
      double v13 = (id *)objc_loadWeakRetained(WeakRetained + 5);
      BOOL v14 = v13;
      if (v13)
      {
        id v15 = objc_loadWeakRetained(v13 + 3);
        goto LABEL_6;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
    id v12 = 0;
  }
  id v15 = 0;
LABEL_6:
  -[_NSTextHighlightRunSegment cornerRadius]((uint64_t)self);
  double v17 = v16;
  -[_NSTextHighlightRunSegment nextSegment]((id *)&self->super.isa);
  uint64_t v18 = (double *)objc_claimAutoreleasedReturnValue();
  double v19 = v18;
  if (v18)
  {
    double v20 = v18[16];
    double v21 = v18[17];
    double v22 = v18[18];
    double v23 = v18[19];
  }
  else
  {
    double v21 = 0.0;
    double v22 = 0.0;
    double v23 = 0.0;
    double v20 = 0.0;
  }
  char v24 = objc_msgSend(v15, "isPoint:withinHorizontalDistance:onRect:leftDistance:rightDistance:", a4, a5, x, y, v17, v20, v21, v22, v23);

  return (v24 & 1) != 0;
}

- (id)description
{
  p_isa = (id *)&self->super.isa;
  double v3 = NSString;
  [(_NSTextHighlightRunSegment *)self topLeftCornerPoint];
  uint64_t v5 = v4;
  [p_isa topLeftCornerPoint];
  uint64_t v7 = v6;
  [p_isa topRightCornerPoint];
  uint64_t v9 = v8;
  [p_isa topRightCornerPoint];
  uint64_t v11 = v10;
  [p_isa bottomLeftCornerPoint];
  uint64_t v13 = v12;
  [p_isa bottomLeftCornerPoint];
  uint64_t v15 = v14;
  [p_isa bottomRightCornerPoint];
  uint64_t v17 = v16;
  [p_isa bottomRightCornerPoint];
  double v19 = objc_msgSend(v3, "stringWithFormat:", @"(%.02f,%.02f)\t-------\t(%.02f,%.02f)\n\t\t\t | \t\t\t | \n\t\t\t | \t\t\t | \n(%.02f,%.02f)\t-------\t(%.02f,%.02f)", v5, v7, v9, v11, v13, v15, v17, v18);
  double v20 = NSString;
  if (p_isa)
  {
    id v21 = p_isa[3];
    p_isa = (id *)objc_loadWeakRetained(p_isa + 2);
  }
  else
  {
    id v21 = 0;
  }
  double v22 = [v20 stringWithFormat:@"_NSTextHighlightRunSegment\n\tSegment Index:%lu\nCorners:\n%@\n%@", v21, v19, p_isa];

  return v22;
}

- (void)setTextRange:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textRange, 0);
  objc_storeStrong((id *)&self->_cornerExtensions, 0);

  objc_destroyWeak((id *)&self->_run);
}

@end