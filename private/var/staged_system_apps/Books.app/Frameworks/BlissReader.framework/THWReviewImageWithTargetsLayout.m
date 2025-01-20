@interface THWReviewImageWithTargetsLayout
- (BOOL)dependentsRelyOnSize;
- (CGPoint)draggablePlacardLayout:(id)a3 originForSize:(CGSize)a4;
- (CGPoint)p_drawerPositionForImagePlacard:(id)a3 withSize:(CGSize)a4;
- (CGPoint)p_drawerPositionForPlacard:(id)a3 withSize:(CGSize)a4;
- (CGPoint)p_drawerPositionForTextPlacard:(id)a3 withSize:(CGSize)a4;
- (CGPoint)p_positionForTargetAtIndex:(unint64_t)a3;
- (CGRect)drawerFrame;
- (CGRect)imageFrame;
- (CGSize)p_drawerFrameSize;
- (CGSize)p_placardImageSize;
- (CGSize)placardTextSize;
- (Class)repClassOverride;
- (NSMutableArray)placardLayouts;
- (NSMutableArray)targetLayouts;
- (THWReviewImageWithTargetsLayout)initWithQuestion:(id)a3 index:(unint64_t)a4 delegate:(id)a5;
- (THWReviewQuestion)question;
- (THWReviewQuestionLayoutDelegate)delegate;
- (UIEdgeInsets)draggablePlacardLayoutInsets:(id)a3;
- (UIEdgeInsets)draggablePlacardLayoutTextInsets:(id)a3;
- (double)draggablePlacardLayoutTextHeight:(id)a3;
- (double)draggablePlacardLayoutTextMaxWidth:(id)a3;
- (double)p_placardHorzPadding;
- (double)p_placardImagePadding;
- (double)p_placardVertPadding;
- (id)additionalLayouts;
- (id)childInfosForLayout;
- (id)dependentLayouts;
- (id)layoutForChoiceIndex:(unint64_t)a3;
- (id)layoutForTargetIndex:(unint64_t)a3;
- (id)layoutGeometryForLayout:(id)a3;
- (id)p_responseController;
- (int)placardArrowPlacementforTarget:(unint64_t)a3;
- (unint64_t)questionIndex;
- (void)dealloc;
- (void)invalidateSize;
- (void)p_calculateTextPlacardNumRows:(unint64_t *)a3 numCols:(unint64_t *)a4 rowHeight:(double *)a5 colWidth:(double *)a6 lasRowNeedsCentering:(BOOL *)a7;
- (void)p_setupFrames;
- (void)p_setupPlacardLayouts;
- (void)updateChildrenFromInfo;
- (void)updatePlacardLayouts;
@end

@implementation THWReviewImageWithTargetsLayout

- (THWReviewImageWithTargetsLayout)initWithQuestion:(id)a3 index:(unint64_t)a4 delegate:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)THWReviewImageWithTargetsLayout;
  v8 = [(THWReviewImageWithTargetsLayout *)&v13 initWithInfo:0];
  v9 = v8;
  if (v8)
  {
    CGPoint origin = CGRectNull.origin;
    CGSize size = CGRectNull.size;
    v8->_imageFrame.CGPoint origin = CGRectNull.origin;
    v8->_imageFrame.CGSize size = size;
    v8->_drawerFrame.CGPoint origin = origin;
    v8->_drawerFrame.CGSize size = size;
    v8->_placardTextSize = CGSizeZero;
    v8->_questionIndex = a4;
    v8->_question = (THWReviewQuestion *)a3;
    v9->_delegate = (THWReviewQuestionLayoutDelegate *)a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageWithTargetsLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)childInfosForLayout
{
  id result = [(THWReviewQuestion *)[(THWReviewImageWithTargetsLayout *)self question] imageInfo];
  if (result)
  {
    return +[NSArray arrayWithObject:result];
  }
  return result;
}

- (id)dependentLayouts
{
  id v3 = +[NSMutableArray array];
  v5.receiver = self;
  v5.super_class = (Class)THWReviewImageWithTargetsLayout;
  [v3 addObjectsFromArray:[&v5 dependentLayouts]];
  [(THWReviewImageWithTargetsLayout *)self addDescendentLayoutsToArray:v3];
  return v3;
}

- (void)updateChildrenFromInfo
{
  [(THWReviewImageWithTargetsLayout *)self p_setupPlacardLayouts];
  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageWithTargetsLayout;
  [(THWContainerLayout *)&v3 updateChildrenFromInfo];
}

- (id)additionalLayouts
{
  objc_super v3 = +[NSMutableArray arrayWithArray:[(THWReviewImageWithTargetsLayout *)self targetLayouts]];
  [(NSMutableArray *)v3 addObjectsFromArray:[(THWReviewImageWithTargetsLayout *)self placardLayouts]];
  return v3;
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (void)invalidateSize
{
  v5.receiver = self;
  v5.super_class = (Class)THWReviewImageWithTargetsLayout;
  [(THWReviewImageWithTargetsLayout *)&v5 invalidateSize];
  CGPoint origin = CGRectNull.origin;
  CGSize size = CGRectNull.size;
  self->_imageFrame.CGPoint origin = CGRectNull.origin;
  self->_imageFrame.CGSize size = size;
  self->_drawerFrame.CGPoint origin = origin;
  self->_drawerFrame.CGSize size = size;
  self->_placardTextSize = CGSizeZero;
}

- (CGSize)p_drawerFrameSize
{
  [self geometry].frame
  TSDRectWithSize();
  double v4 = v3;
  double v6 = v5;
  v7 = (char *)[(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self];
  if (v7 != (unsigned char *)&dword_0 + 2)
  {
    [(THWReviewImageWithTargetsLayout *)self p_placardHorzPadding];
    double v6 = v8 + 68.0;
  }
  if (objc_msgSend(-[NSMutableArray objectAtIndex:](self->_placardLayouts, "objectAtIndex:", 0), "contentImage"))
  {
    [(THWReviewImageWithTargetsLayout *)self p_placardImageSize];
    double v10 = v9;
    double v12 = v11;
    [(THWReviewImageWithTargetsLayout *)self p_placardImagePadding];
    if (v7 == (unsigned char *)&dword_0 + 2)
    {
      double v4 = floor(v13 + v13 + (v10 + 10.0) * 3.0);
    }
    else if (v7)
    {
      double v19 = floor(v13 + (v12 + 10.0) * 2.0);
      if (v6 < v19) {
        double v6 = v19;
      }
    }
  }
  else
  {
    uint64_t v14 = [(NSArray *)[(THWReviewQuestion *)[(THWReviewImageWithTargetsLayout *)self question] choices] count];
    uint64_t v15 = v14;
    double v16 = (double)v14;
    if (v7 == (unsigned char *)&dword_0 + 2)
    {
      double v17 = ceil(v16 / 3.0);
      double v18 = 80.0;
    }
    else
    {
      double v18 = 185.0;
      double v17 = (double)v14;
    }
    [(THWReviewImageWithTargetsLayout *)self p_placardHorzPadding];
    double v21 = (double)(uint64_t)v17;
    double v22 = (v4 + v20) / v21 - v20;
    if (v7 != (unsigned char *)&dword_0 + 2 && v22 < v18 && v15 >= 3)
    {
      double v21 = (double)(uint64_t)ceil(v16 * 0.5);
      double v22 = (v4 + v20) / v21 - v20;
    }
    if (v22 >= v18) {
      double v22 = v18;
    }
    double v4 = -(v20 - v21 * (v20 + v22));
  }
  double v24 = v4;
  double v25 = v6;
  result.height = v25;
  result.width = v24;
  return result;
}

- (void)p_setupFrames
{
  p_imageFrame = &self->_imageFrame;
  if (CGRectIsNull(self->_imageFrame) || CGRectIsNull(self->_drawerFrame))
  {
    [self geometry].frame
    TSDRectWithSize();
    double v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(THWReviewImageWithTargetsLayout *)self p_drawerFrameSize];
    CGFloat v13 = v12;
    p_drawerFrame = &self->_drawerFrame;
    TSUClamp();
    self->_drawerFrame.origin.x = 0.0;
    self->_drawerFrame.origin.y = 0.0;
    self->_drawerFrame.size.width = v13;
    self->_drawerFrame.size.height = v15;
    double v16 = [(THWReviewImageWithTargetsLayout *)self question];
    CGFloat v17 = v5;
    CGFloat v18 = v7;
    if (v16) {
      [(THWReviewQuestion *)v16 imageSize];
    }
    double v19 = (char *)[(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self];
    [(THWReviewImageWithTargetsLayout *)self p_placardVertPadding];
    double v44 = v20;
    TSDRectWithSize();
    THIntegralCenterRectInRect(v21, v22, v23, v24, v17, v7, v9, v11);
    p_imageFrame->origin.x = v25;
    p_imageFrame->origin.y = v26;
    p_imageFrame->size.width = v27;
    p_imageFrame->size.height = v28;
    TSDRectWithSize();
    THIntegralCenterRectInRect(v29, v30, v31, v32, v17, v7, v9, v11);
    p_drawerFrame->origin.x = v33;
    self->_drawerFrame.origin.y = v34;
    self->_drawerFrame.size.width = v35;
    self->_drawerFrame.size.height = v36;
    if (v19 == (unsigned char *)&dword_0 + 2)
    {
      double Width = CGRectGetWidth(*(CGRect *)&v33);
      double v38 = Width + CGRectGetWidth(*p_imageFrame);
      v45.origin.x = v17;
      v45.origin.y = v18;
      v45.size.width = v9;
      v45.size.height = v11;
      double v39 = CGRectGetWidth(v45);
      double v40 = floor((v39 - v38) / 3.0);
      if (v40 <= 15.0)
      {
        p_drawerFrame->origin.x = 0.0;
        double v41 = v39 - CGRectGetWidth(*p_imageFrame);
      }
      else
      {
        p_drawerFrame->origin.x = v40;
        v46.origin.y = self->_drawerFrame.origin.y;
        v46.size.width = self->_drawerFrame.size.width;
        v46.size.height = self->_drawerFrame.size.height;
        v46.origin.x = v40;
        double v41 = v40 + CGRectGetMaxX(v46);
      }
      p_imageFrame->origin.x = v41;
    }
    else
    {
      double Height = CGRectGetHeight(*p_imageFrame);
      v47.origin.x = p_drawerFrame->origin.x;
      v47.origin.y = self->_drawerFrame.origin.y;
      v47.size.width = self->_drawerFrame.size.width;
      v47.size.height = self->_drawerFrame.size.height;
      double v43 = v44 + Height + CGRectGetHeight(v47);
      v48.origin.x = v17;
      v48.origin.y = v18;
      v48.size.width = v9;
      v48.size.height = v11;
      v49.origin.y = floor((CGRectGetHeight(v48) - v43) * 0.5);
      p_imageFrame->origin.y = v49.origin.y;
      v49.origin.x = p_imageFrame->origin.x;
      v49.size.width = p_imageFrame->size.width;
      v49.size.height = p_imageFrame->size.height;
      self->_drawerFrame.origin.y = v44 + CGRectGetMaxY(v49);
    }
  }
}

- (CGRect)imageFrame
{
  [(THWReviewImageWithTargetsLayout *)self p_setupFrames];
  double x = self->_imageFrame.origin.x;
  double y = self->_imageFrame.origin.y;
  double width = self->_imageFrame.size.width;
  double height = self->_imageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)drawerFrame
{
  [(THWReviewImageWithTargetsLayout *)self p_setupFrames];
  double x = self->_drawerFrame.origin.x;
  double y = self->_drawerFrame.origin.y;
  double width = self->_drawerFrame.size.width;
  double height = self->_drawerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGPoint)p_positionForTargetAtIndex:(unint64_t)a3
{
  id v4 = [(THWReviewQuestion *)[(THWReviewImageWithTargetsLayout *)self question] choiceAtIndex:a3];
  if (v4)
  {
    double v5 = v4;
    [(THWReviewImageWithTargetsLayout *)self imageFrame];
    objc_msgSend(objc_msgSend(v5, "targetRegion"), "bounds");
    TSDCenterOfRect();
    double v6 = [(THWReviewImageWithTargetsLayout *)self question];
    if (!v6 || ([(THWReviewQuestion *)v6 imageSize], v7 == 0.0)) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewImageWithTargetsLayout p_positionForTargetAtIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewImageWithTargetsLayout.m") lineNumber:323 description:@"Invalid image width."];
    }
    else {
      TSDMultiplyPointScalar();
    }
    TSDAddPoints();
  }
  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (int)placardArrowPlacementforTarget:(unint64_t)a3
{
  unsigned int v3 = [(-[THWReviewImageWithTargetsLayout question](self, "question")) choiceAtIndex:a3].placardPlacement- 1;
  if (v3 > 3) {
    return 0;
  }
  else {
    return dword_345250[v3];
  }
}

- (void)updatePlacardLayouts
{
  id v3 = [(THWReviewImageWithTargetsLayout *)self p_responseController];
  id v4 = [v3 newTemporateReviewResponseMOC];
  id v5 = [v3 responseForQuestionID:[-[THWReviewImageWithTargetsLayout question](self, "question") questionID] temporaryMOC:v4];
  objc_opt_class();
  [v5 answerState];
  double v6 = (void *)TSUDynamicCast();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  placardLayouts = self->_placardLayouts;
  id v8 = [(NSMutableArray *)placardLayouts countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(placardLayouts);
        }
        double v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        [v12 invalidateFrame];
        if ([v12 placement] != 2)
        {
          if (v6) {
            uint64_t v13 = [v6 targetForPlacard:[v12 index]];
          }
          else {
            uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
          }
          [v12 setPlacement:v13 != 0x7FFFFFFFFFFFFFFFLL];
        }
      }
      id v9 = [(NSMutableArray *)placardLayouts countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (id)layoutGeometryForLayout:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc((Class)TSDLayoutGeometry);
    [(THWReviewImageWithTargetsLayout *)self imageFrame];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    -[THWReviewImageWithTargetsLayout p_positionForTargetAtIndex:](self, "p_positionForTargetAtIndex:", [a3 index]);
    id v5 = objc_alloc((Class)TSDLayoutGeometry);
    TSDRectWithOriginAndSize();
  }
  id v6 = [v5 initWithFrame:];

  return v6;
}

- (id)layoutForChoiceIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_placardLayouts count] <= a3) {
    return 0;
  }
  placardLayouts = self->_placardLayouts;

  return [(NSMutableArray *)placardLayouts objectAtIndex:a3];
}

- (id)layoutForTargetIndex:(unint64_t)a3
{
  if ((unint64_t)[(NSMutableArray *)self->_targetLayouts count] <= a3) {
    return 0;
  }
  targetLayouts = self->_targetLayouts;

  return [(NSMutableArray *)targetLayouts objectAtIndex:a3];
}

- (void)p_calculateTextPlacardNumRows:(unint64_t *)a3 numCols:(unint64_t *)a4 rowHeight:(double *)a5 colWidth:(double *)a6 lasRowNeedsCentering:(BOOL *)a7
{
  uint64_t v13 = (char *)[(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self];
  [(THWReviewImageWithTargetsLayout *)self drawerFrame];
  double v15 = v14;
  double v17 = v16;
  unint64_t v18 = [(NSArray *)[(THWReviewQuestion *)[(THWReviewImageWithTargetsLayout *)self question] choices] count];
  [(THWReviewImageWithTargetsLayout *)self p_placardHorzPadding];
  double v20 = v19;
  [(THWReviewImageWithTargetsLayout *)self p_placardVertPadding];
  if (v13 == (unsigned char *)&dword_0 + 2)
  {
    unint64_t v21 = v18 + 2;
    double v22 = (double)v18;
    BOOL v23 = (v18 + 2 > 5) & v18;
    unint64_t v18 = (v18 + 2) / 3;
    unint64_t v24 = vcvtpd_u64_f64(v22 / (double)(v21 / 3));
  }
  else if (v18 == 2)
  {
    BOOL v23 = 0;
    if (v15 > v17) {
      unint64_t v24 = 1;
    }
    else {
      unint64_t v24 = 2;
    }
    if (v15 <= v17) {
      unint64_t v18 = 1;
    }
    else {
      unint64_t v18 = 2;
    }
  }
  else if ((v15 + v20) / (double)v18 - v20 >= 185.0)
  {
    BOOL v23 = 0;
    unint64_t v24 = 1;
  }
  else
  {
    unint64_t v25 = v18 - 3;
    uint64_t v26 = 3;
    if (v18 == 9) {
      uint64_t v27 = 3;
    }
    else {
      uint64_t v27 = 1;
    }
    if (v18 != 9) {
      uint64_t v26 = v18;
    }
    BOOL v28 = v18 & 1;
    if (v25 <= 5) {
      unint64_t v24 = 2;
    }
    else {
      unint64_t v24 = v27;
    }
    if (v25 <= 5) {
      unint64_t v18 = (v18 + 1) >> 1;
    }
    else {
      unint64_t v18 = v26;
    }
    BOOL v23 = v25 <= 5 && v28;
  }
  TSDFloorForMainScreen();
  uint64_t v30 = v29;
  if (v13 != (unsigned char *)&dword_0 + 2)
  {
    TSDFloorForMainScreen();
    if (!a3) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  uint64_t v31 = 0x4041000000000000;
  if (a3) {
LABEL_30:
  }
    *a3 = v24;
LABEL_31:
  if (a4) {
    *a4 = v18;
  }
  if (a5) {
    *(void *)a5 = v31;
  }
  if (a6) {
    *(void *)a6 = v30;
  }
  if (a7) {
    *a7 = v23;
  }
}

- (CGSize)placardTextSize
{
  p_placardTextSize = &self->_placardTextSize;
  double width = self->_placardTextSize.width;
  double height = self->_placardTextSize.height;
  double v5 = CGSizeZero.height;
  if (width == CGSizeZero.width && height == v5)
  {
    [(THWReviewImageWithTargetsLayout *)self drawerFrame];
    double v9 = v8;
    double v11 = v10;
    NSUInteger v12 = [(NSArray *)[(THWReviewQuestion *)[(THWReviewImageWithTargetsLayout *)self question] choices] count];
    double width = CGSizeZero.width;
    double height = v5;
    if (v12 <= 9)
    {
      if (v12 >= 2)
      {
        NSUInteger v17 = v12;
        uint64_t v18 = 1;
        double v15 = 0.0;
        double v16 = 0.0;
        -[THWReviewImageWithTargetsLayout p_calculateTextPlacardNumRows:numCols:rowHeight:colWidth:lasRowNeedsCentering:](self, "p_calculateTextPlacardNumRows:numCols:rowHeight:colWidth:lasRowNeedsCentering:", &v18, &v17, &v15, &v16, 0, CGSizeZero.width, v5);
        uint64_t v13 = (char *)[(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self];
        double v14 = 185.0;
        if (v13 == (unsigned char *)&dword_0 + 2) {
          double v14 = 80.0;
        }
        if (v16 < v14) {
          double v14 = v16;
        }
        double width = v14 + -10.0;
        double height = v15 + -10.0;
        if (v15 >= 34.0) {
          double height = 24.0;
        }
        p_placardTextSize->double width = width;
        p_placardTextSize->double height = height;
      }
      else
      {
        double width = v9;
        double height = v11;
      }
    }
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)p_drawerPositionForTextPlacard:(id)a3 withSize:(CGSize)a4
{
  [(THWReviewImageWithTargetsLayout *)self drawerFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  NSUInteger v14 = [(NSArray *)[(THWReviewQuestion *)[(THWReviewImageWithTargetsLayout *)self question] choices] count];
  if (v14 - 10 > 0xFFFFFFFFFFFFFFF6)
  {
    if (v14 == 1)
    {
      TSDCenterOfRect();
      CGFloat x = v17;
    }
    else
    {
      NSUInteger v30 = v14;
      uint64_t v31 = 1;
      char v29 = 0;
      uint64_t v27 = 0;
      double v28 = 0.0;
      [(THWReviewImageWithTargetsLayout *)self p_calculateTextPlacardNumRows:&v31 numCols:&v30 rowHeight:&v27 colWidth:&v28 lasRowNeedsCentering:&v29];
      double v18 = v28;
      [(THWReviewImageWithTargetsLayout *)self p_placardHorzPadding];
      double v20 = (v18 + v19) * 0.5;
      unint64_t v21 = (unint64_t)[a3 index];
      if (v30) {
        unint64_t v22 = v21 / v30;
      }
      else {
        unint64_t v22 = 0;
      }
      [(THWReviewImageWithTargetsLayout *)self p_placardVertPadding];
      if (v22 + 1 == v31) {
        double v23 = v20;
      }
      else {
        double v23 = 0.0;
      }
      [(THWReviewImageWithTargetsLayout *)self p_placardHorzPadding];
      v33.origin.CGFloat x = v7;
      v33.origin.double y = v9;
      v33.size.double width = v11;
      v33.size.double height = v13;
      CGRectGetHeight(v33);
      TSDFloorForMainScreen();
      CGFloat x = v24;
      TSDFloorForMainScreen();
      double y = v25;
    }
  }
  else
  {
    CGFloat x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  double v26 = x;
  result.double y = y;
  result.CGFloat x = v26;
  return result;
}

- (CGPoint)p_drawerPositionForImagePlacard:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  unint64_t v8 = [(NSArray *)[(THWReviewQuestion *)[(THWReviewImageWithTargetsLayout *)self question] choices] count];
  [(THWReviewImageWithTargetsLayout *)self drawerFrame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  unint64_t v17 = (unint64_t)[a3 index];
  [(THWReviewImageWithTargetsLayout *)self p_placardImagePadding];
  double v19 = v18;
  if ([(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self])
  {
    unint64_t v20 = (v8 + 2) / 3;
    unint64_t v21 = vcvtpd_u64_f64((double)v8 / (double)v20);
    double v22 = (double)(v17 % v21);
    if (v21) {
      unint64_t v23 = v17 / v21;
    }
    else {
      unint64_t v23 = 0;
    }
    if (v21) {
      double v24 = v22;
    }
    else {
      double v24 = 0.0;
    }
    double v25 = width + v19;
    double v26 = height + v19;
    double v27 = -(v19 - (double)v21 * v25);
    double v41 = -(v19 - (double)v20 * v26);
    double v42 = v24;
    if (((v8 + 2 > 5) & v8 & (v23 + 1 == v20)) != 0) {
      double v28 = v25 * 0.5;
    }
    else {
      double v28 = 0.0;
    }
    v44.origin.CGFloat x = v10;
    v44.origin.double y = v12;
    v44.size.double width = v14;
    v44.size.double height = v16;
    double v29 = floor((CGRectGetWidth(v44) - v27) * 0.5);
    v45.origin.CGFloat x = v10;
    v45.origin.double y = v12;
    v45.size.double width = v14;
    v45.size.double height = v16;
    double v30 = v28 + CGRectGetMinX(v45) + v29;
    v46.origin.CGFloat x = v10;
    v46.origin.double y = v12;
    v46.size.double width = v14;
    v46.size.double height = v16;
    double v31 = floor((CGRectGetHeight(v46) - v41) * 0.5);
    v47.origin.CGFloat x = v10;
    v47.origin.double y = v12;
    v47.size.double width = v14;
    v47.size.double height = v16;
    CGFloat v32 = CGRectGetMinY(v47) + v31;
    double v33 = v30 + floor(v25) * v42;
    double v34 = v32 + floor(v26) * (double)v23;
  }
  else
  {
    double v35 = width + v19;
    v48.origin.CGFloat x = v10;
    v48.origin.double y = v12;
    v48.size.double width = v14;
    v48.size.double height = v16;
    double v36 = floor((CGRectGetWidth(v48) - -(v19 - (double)v8 * v35)) * 0.5);
    v49.origin.CGFloat x = v10;
    v49.origin.double y = v12;
    v49.size.double width = v14;
    v49.size.double height = v16;
    double v37 = CGRectGetMinX(v49) + v36;
    v50.origin.CGFloat x = v10;
    v50.origin.double y = v12;
    v50.size.double width = v14;
    v50.size.double height = v16;
    double v38 = floor((CGRectGetHeight(v50) - height) * 0.5);
    v51.origin.CGFloat x = v10;
    v51.origin.double y = v12;
    v51.size.double width = v14;
    v51.size.double height = v16;
    double v34 = CGRectGetMinY(v51) + v38;
    double v39 = floor(v35);
    double v40 = 0.0;
    if (v8) {
      double v40 = (double)(v17 % v8);
    }
    double v33 = v37 + v39 * v40;
  }
  result.double y = v34;
  result.CGFloat x = v33;
  return result;
}

- (CGPoint)p_drawerPositionForPlacard:(id)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if ([a3 contentStorage])
  {
    -[THWReviewImageWithTargetsLayout p_drawerPositionForTextPlacard:withSize:](self, "p_drawerPositionForTextPlacard:withSize:", a3, width, height);
  }
  else if ([a3 contentImage])
  {
    -[THWReviewImageWithTargetsLayout p_drawerPositionForImagePlacard:withSize:](self, "p_drawerPositionForImagePlacard:withSize:", a3, width, height);
  }
  else
  {
    double x = CGPointZero.x;
    double y = CGPointZero.y;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)p_responseController
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWReviewImageWithTargetsLayout layoutController](self, "layoutController"), "canvas"), "documentRoot");

  return (id)TSUDynamicCast();
}

- (CGPoint)draggablePlacardLayout:(id)a3 originForSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  unint64_t v8 = [(THWReviewImageWithTargetsLayout *)self question];
  id v9 = [(THWReviewImageWithTargetsLayout *)self p_responseController];
  id v10 = [v9 newTemporateReviewResponseMOC];
  id v11 = [v9 responseForQuestionID:[v8 questionID] temporaryMOC:v10];
  objc_opt_class();
  [v11 answerState];
  CGFloat v12 = (void *)TSUDynamicCast();
  if (v12 && (id v13 = objc_msgSend(v12, "targetForPlacard:", objc_msgSend(a3, "index")), v13 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    id v20 = v13;
    double x = CGPointZero.x;
    double y = CGPointZero.y;
    [(THWReviewImageWithTargetsLayout *)self p_positionForTargetAtIndex:v13];
    double v22 = v21;
    double v24 = v23;
    id v25 = [(THWReviewQuestion *)[(THWReviewImageWithTargetsLayout *)self question] choiceAtIndex:v20];
    switch([v25 placardPlacement])
    {
      case 0u:
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewImageWithTargetsLayout draggablePlacardLayout:originForSize:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewImageWithTargetsLayout.m"), 703, @"Invalid placardPlacement: %d", objc_msgSend(v25, "placardPlacement"));
        break;
      case 1u:
        double x = v22 + width * -0.5;
        double y = v24 - height + -33.0;
        break;
      case 2u:
        double x = v22 + 33.0;
        goto LABEL_11;
      case 3u:
        double x = v22 + width * -0.5;
        double v26 = 33.0;
        goto LABEL_12;
      case 4u:
        double x = v22 - width + -33.0;
LABEL_11:
        double v26 = height * -0.5;
LABEL_12:
        double y = v24 + v26;
        break;
      default:
        break;
    }
  }
  else
  {
    -[THWReviewImageWithTargetsLayout p_drawerPositionForPlacard:withSize:](self, "p_drawerPositionForPlacard:withSize:", a3, width, height);
    double x = v14;
    double y = v16;
  }

  double v18 = x;
  double v19 = y;
  result.double y = v19;
  result.double x = v18;
  return result;
}

- (UIEdgeInsets)draggablePlacardLayoutInsets:(id)a3
{
  double v3 = 5.0;
  double v4 = 5.0;
  double v5 = 5.0;
  double v6 = 5.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)draggablePlacardLayoutTextInsets:(id)a3
{
  double v3 = 5.0;
  double v4 = 15.0;
  double v5 = 5.0;
  double v6 = 15.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)draggablePlacardLayoutTextMaxWidth:(id)a3
{
  id v5 = [(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self];
  unsigned int v6 = [a3 placement];
  if (v6)
  {
    BOOL v7 = v6 == 2 || v5 == 0;
    double result = 80.0;
    if (v7) {
      return 185.0;
    }
  }
  else
  {
    [(THWReviewImageWithTargetsLayout *)self placardTextSize];
  }
  return result;
}

- (double)draggablePlacardLayoutTextHeight:(id)a3
{
  [(THWReviewImageWithTargetsLayout *)self placardTextSize];
  return v3;
}

- (double)p_placardImagePadding
{
  id v3 = [(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self];
  double result = 9.0;
  if (!v3)
  {
    NSUInteger v5 = [(NSArray *)[(THWReviewQuestion *)[(THWReviewImageWithTargetsLayout *)self question] choices] count];
    double result = 9.0;
    if (v5 < 5) {
      return 14.0;
    }
  }
  return result;
}

- (CGSize)p_placardImageSize
{
  if ([(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self])
  {
    double v3 = 43.0;
  }
  else
  {
    NSUInteger v4 = [(NSArray *)[(THWReviewQuestion *)[(THWReviewImageWithTargetsLayout *)self question] choices] count];
    double v3 = 43.0;
    if (v4 < 5) {
      double v3 = 58.0;
    }
  }
  double v5 = v3;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (double)p_placardHorzPadding
{
  v2 = (char *)[(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self];
  double result = 15.0;
  if (v2 == (unsigned char *)&dword_0 + 2) {
    return 10.0;
  }
  return result;
}

- (double)p_placardVertPadding
{
  v2 = (char *)[(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self];
  double result = 15.0;
  if (v2 == (unsigned char *)&dword_0 + 2) {
    return 10.0;
  }
  return result;
}

- (void)p_setupPlacardLayouts
{
  if (!self->_placardLayouts || !self->_targetLayouts)
  {
    double v3 = [(THWReviewQuestion *)[(THWReviewImageWithTargetsLayout *)self question] choices];
    NSUInteger v4 = [(NSArray *)v3 count];

    self->_placardLayouts = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v4];
    self->_targetLayouts = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v4];
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        id v6 = [(NSArray *)v3 objectAtIndex:i];
        BOOL v7 = [[THWReviewDraggablePlacardLayout alloc] initWithIndex:i choice:v6 delegate:self];
        id v8 = [v6 contentType];
        if ([v8 isEqualToString:TSWReviewChoiceDescriptionContentTypeTextValue])
        {
          -[THWReviewDraggablePlacardLayout setContentStorage:](v7, "setContentStorage:", [v6 contentStorage]);
        }
        else if ([v8 isEqualToString:TSWReviewChoiceDescriptionContentTypeImageValue])
        {
          -[THWReviewDraggablePlacardLayout setContentImage:](v7, "setContentImage:", [v6 contentImage]);
        }
        [(NSMutableArray *)self->_placardLayouts addObject:v7];

        id v9 = [[THWReviewDragTargetLayout alloc] initWithIndex:i];
        [(NSMutableArray *)self->_targetLayouts addObject:v9];
      }
    }
    [(THWReviewImageWithTargetsLayout *)self updatePlacardLayouts];
  }
}

- (unint64_t)questionIndex
{
  return self->_questionIndex;
}

- (THWReviewQuestion)question
{
  return self->_question;
}

- (THWReviewQuestionLayoutDelegate)delegate
{
  return self->_delegate;
}

- (NSMutableArray)placardLayouts
{
  return self->_placardLayouts;
}

- (NSMutableArray)targetLayouts
{
  return self->_targetLayouts;
}

@end