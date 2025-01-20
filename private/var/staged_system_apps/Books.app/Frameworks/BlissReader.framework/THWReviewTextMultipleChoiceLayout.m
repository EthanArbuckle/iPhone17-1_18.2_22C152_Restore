@interface THWReviewTextMultipleChoiceLayout
- (BOOL)dependentsRelyOnSize;
- (BOOL)imageIsAtSide;
- (BOOL)p_contentIsScrollable;
- (CGRect)answersFrame;
- (CGRect)contentFrame;
- (CGRect)imageFrame;
- (CGSize)answersSize;
- (CGSize)contentSize;
- (CGSize)imageSize;
- (CGSize)minContentSize;
- (CGSize)p_answersSizeForWidth:(double)a3;
- (CGSize)p_maxSizeWithImageSize:(CGSize)a3;
- (Class)repClassOverride;
- (NSArray)answerLayouts;
- (THWReviewQuestion)question;
- (THWReviewQuestionLayoutDelegate)delegate;
- (THWReviewTextMultipleChoiceLayout)initWithQuestion:(id)a3 index:(unint64_t)a4 delegate:(id)a5;
- (THWStackedControlContainer)answerStack;
- (UIEdgeInsets)stackedControlContainerInsets:(id)a3;
- (double)p_answersHeightForWidth:(double)a3;
- (double)p_binSearchAnswersWidth:(double)a3 maxWidth:(double)a4 naturalWidth:(double)a5 height:(double)a6;
- (double)reviewTextAnswerLayoutWidth:(id)a3;
- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4;
- (double)stackedControlContainerMinHeight:(id)a3;
- (double)stackedControlContainerWidth:(id)a3;
- (id)childInfosForLayout;
- (id)computeLayoutGeometry;
- (id)controlContainerAdditionalChildLayouts:(id)a3;
- (id)controlContainerChildInfosForLayout:(id)a3;
- (id)dependentLayouts;
- (id)layoutForChoiceIndex:(unint64_t)a3;
- (id)layoutGeometryForLayout:(id)a3;
- (id)reviewTextAnswerLayoutListLabelParagraphStyle:(id)a3;
- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4;
- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4;
- (int)p_imagePlacement;
- (unint64_t)questionIndex;
- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4;
- (unsigned)stackedControlContainerVerticalAlignment:(id)a3;
- (void)dealloc;
- (void)invalidateSize;
- (void)p_invalidateCachedGeometry;
- (void)p_setupAnswerLayouts;
@end

@implementation THWReviewTextMultipleChoiceLayout

- (THWReviewTextMultipleChoiceLayout)initWithQuestion:(id)a3 index:(unint64_t)a4 delegate:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)THWReviewTextMultipleChoiceLayout;
  v8 = [(THWReviewTextMultipleChoiceLayout *)&v11 initWithInfo:0];
  v9 = v8;
  if (v8)
  {
    [(THWReviewTextMultipleChoiceLayout *)v8 p_invalidateCachedGeometry];
    v9->_questionIndex = a4;
    v9->_question = (THWReviewQuestion *)a3;
    v9->_answerStack = [[THWStackedControlContainer alloc] initWithDelegate:v9];
    v9->_delegate = (THWReviewQuestionLayoutDelegate *)a5;
    [(THWReviewTextMultipleChoiceLayout *)v9 p_setupAnswerLayouts];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextMultipleChoiceLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (void)invalidateSize
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextMultipleChoiceLayout;
  [(THWReviewTextMultipleChoiceLayout *)&v3 invalidateSize];
  [(THWReviewTextMultipleChoiceLayout *)self p_invalidateCachedGeometry];
}

- (void)p_invalidateCachedGeometry
{
  CGSize v2 = CGSizeZero;
  self->_answersSize = CGSizeZero;
  self->_imageSize = v2;
  self->_contentSize = v2;
  CGPoint origin = CGRectNull.origin;
  CGSize size = CGRectNull.size;
  self->_imageFrame.CGPoint origin = CGRectNull.origin;
  self->_imageFrame.CGSize size = size;
  self->_answersFrame.CGPoint origin = origin;
  self->_answersFrame.CGSize size = size;
  self->_contentFrame.CGPoint origin = origin;
  self->_contentFrame.CGSize size = size;
}

- (CGSize)minContentSize
{
  [(THWReviewQuestionLayoutDelegate *)self->_delegate questionAnswersLayoutSize:self];
  result.height = v3;
  result.width = v2;
  return result;
}

- (int)p_imagePlacement
{
  int v3 = [(THWReviewQuestion *)[(THWReviewTextMultipleChoiceLayout *)self question] imagePlacement];
  v4 = (char *)[(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self];
  if (v4 == (unsigned char *)&dword_0 + 2) {
    return 2;
  }
  if (v4 == (unsigned char *)&dword_0 + 1) {
    return 1;
  }
  return v3;
}

- (BOOL)imageIsAtSide
{
  unsigned int v3 = [(THWReviewTextMultipleChoiceLayout *)self p_imagePlacement];
  v4 = [(THWReviewQuestion *)[(THWReviewTextMultipleChoiceLayout *)self question] imageInfo];
  BOOL v6 = v3 == 2 || v3 == 4;
  return v4 && v6;
}

- (double)p_answersHeightForWidth:(double)a3
{
  [(THWReviewTextMultipleChoiceLayout *)self p_answersSizeForWidth:a3];
  return v3;
}

- (CGSize)p_answersSizeForWidth:(double)a3
{
  v4 = [[THWReviewTextMultipleChoiceLayoutHelper alloc] initWithQuestion:[(THWReviewTextMultipleChoiceLayout *)self question]];
  [(THWReviewTextMultipleChoiceLayoutHelper *)v4 answerStackSizeForWidth:a3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)p_binSearchAnswersWidth:(double)a3 maxWidth:(double)a4 naturalWidth:(double)a5 height:(double)a6
{
  if (a4 - a3 < 1.0) {
    return a4;
  }
  [(THWReviewTextMultipleChoiceLayout *)self p_answersSizeForWidth:(a3 + a4) * 0.5];
  if (v13 > a6 && v12 < a5)
  {
    double v15 = (a3 + a4) * 0.5;
    double v16 = a4;
  }
  else
  {
    double v15 = a3;
    double v16 = (a3 + a4) * 0.5;
  }

  [(THWReviewTextMultipleChoiceLayout *)self p_binSearchAnswersWidth:v15 maxWidth:v16 naturalWidth:a5 height:a6];
  return result;
}

- (CGSize)p_maxSizeWithImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(THWReviewTextMultipleChoiceLayout *)self minContentSize];
  double v6 = v5 * 0.5;
  if (width <= v6) {
    double v6 = width;
  }
  else {
    double height = v6 / (width / height);
  }
  double v7 = height;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (BOOL)p_contentIsScrollable
{
  double v3 = (char *)[(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self];
  BOOL result = [(THWReviewQuestionLayoutDelegate *)self->_delegate isExpanded];
  if ((unint64_t)(v3 - 1) >= 2) {
    return 0;
  }
  return result;
}

- (CGSize)answersSize
{
  p_answersSize = &self->_answersSize;
  double width = self->_answersSize.width;
  double height = self->_answersSize.height;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    [(THWReviewTextMultipleChoiceLayout *)self minContentSize];
    double v8 = v7;
    double v10 = v9;
    [(THWReviewQuestion *)[(THWReviewTextMultipleChoiceLayout *)self question] imageSize];
    double v12 = v11;
    unsigned int v13 = [(THWReviewTextMultipleChoiceLayout *)self p_contentIsScrollable];
    unsigned int v14 = [(THWReviewTextMultipleChoiceLayout *)self imageIsAtSide];
    double v15 = v8;
    if (v13)
    {
      if (v14)
      {
        double v15 = v8 - v12 + -15.0 >= 150.0 ? v8 - v12 + -15.0 : 150.0;
        [(THWReviewTextMultipleChoiceLayout *)self p_answersSizeForWidth:1.79769313e308];
        if (v16 > v15)
        {
          double v17 = v8 * 0.5;
          if (v12 < v8 * 0.5) {
            double v17 = v12;
          }
          double v18 = v8 - v17 + -15.0;
          if (v16 >= v18) {
            double v15 = v18;
          }
          else {
            double v15 = v16;
          }
        }
      }
    }
    else if (v14)
    {
      double v15 = v8 - v12 + -15.0;
      if ([(THWReviewQuestionLayoutDelegate *)self->_delegate isExpanded])
      {
        if (v15 < 150.0) {
          double v15 = 150.0;
        }
        [(THWReviewTextMultipleChoiceLayout *)self p_answersHeightForWidth:v15];
        if (v19 > v10)
        {
          double v20 = fmin(v12, 150.0);
          [(THWReviewTextMultipleChoiceLayout *)self p_answersSizeForWidth:1.79769313e308];
          if (v15 >= v8 + -15.0 - v20) {
            double v22 = v15;
          }
          else {
            double v22 = v8 + -15.0 - v20;
          }
          [(THWReviewTextMultipleChoiceLayout *)self p_binSearchAnswersWidth:v15 maxWidth:v22 naturalWidth:v21 height:v10];
          double v15 = ceil(v23);
        }
      }
    }
    [(THWReviewTextMultipleChoiceLayout *)self p_answersSizeForWidth:v15];
    double width = v24 + 2.0;
    p_answersSize->double width = width;
    p_answersSize->double height = height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)imageSize
{
  [(THWReviewQuestion *)[(THWReviewTextMultipleChoiceLayout *)self question] imageSize];
  double v4 = v3;
  double v6 = v5;
  p_imageSize = &self->_imageSize;
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    if (![(THWReviewQuestion *)[(THWReviewTextMultipleChoiceLayout *)self question] imageInfo]
      || v4 == 0.0
      || v6 == 0.0)
    {
      double width = p_imageSize->width;
      double height = self->_imageSize.height;
    }
    else
    {
      [(THWReviewQuestion *)[(THWReviewTextMultipleChoiceLayout *)self question] imageSize];
      double v12 = v11;
      double v14 = v13;
      double v15 = v11 / v13;
      [(THWReviewTextMultipleChoiceLayout *)self minContentSize];
      double v17 = v16;
      double v19 = v18;
      [(THWReviewTextMultipleChoiceLayout *)self answersSize];
      double v21 = v20;
      double v23 = v22;
      if ([(THWReviewQuestionLayoutDelegate *)[(THWReviewTextMultipleChoiceLayout *)self delegate] isExpanded])
      {
        if ([(THWReviewTextMultipleChoiceLayout *)self imageIsAtSide])
        {
          if ([(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self] == (char *)&dword_0 + 2)
          {
            -[THWReviewTextMultipleChoiceLayout p_maxSizeWithImageSize:](self, "p_maxSizeWithImageSize:", v12, v14);
            double v12 = v24;
            double v14 = v25;
          }
          else
          {
            double v12 = v17 - v21 + -15.0;
            double v14 = v12 / v15;
          }
        }
        else
        {
          double v26 = fmax(v19 - v23 + -6.0, 150.0);
          if (v14 > v26)
          {
            double v14 = v26;
            double v12 = v15 * v26;
          }
        }
      }
      if (v12 > v17)
      {
        double v14 = v17 / v15;
        double v12 = v17;
      }
      if (v14 > v19)
      {
        if ([(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self] == (char *)&dword_0 + 2)
        {
          -[THWReviewTextMultipleChoiceLayout p_maxSizeWithImageSize:](self, "p_maxSizeWithImageSize:", v12, v14);
          double v12 = v27;
          double v14 = v28;
        }
        else
        {
          double v12 = v19 * v15;
          double v14 = v19;
        }
      }
      [(THWReviewQuestion *)[(THWReviewTextMultipleChoiceLayout *)self question] imageSize];
      double v29 = width / v15;
      if (v12 <= width)
      {
        double v29 = v14;
        double width = v12;
      }
      if (v29 > height) {
        double width = v15 * height;
      }
      else {
        double height = v29;
      }
      p_imageSize->double width = width;
      self->_imageSize.double height = height;
    }
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)contentSize
{
  p_contentSize = &self->_contentSize;
  double height = self->_contentSize.height;
  if (self->_contentSize.width == CGSizeZero.width && height == CGSizeZero.height)
  {
    [(THWReviewTextMultipleChoiceLayout *)self minContentSize];
    p_contentSize->double width = v6;
    p_contentSize->double height = v7;
    [(THWReviewTextMultipleChoiceLayout *)self imageSize];
    double v9 = v8;
    [(THWReviewTextMultipleChoiceLayout *)self answersSize];
    double v11 = v10;
    switch([(THWReviewTextMultipleChoiceLayout *)self p_imagePlacement])
    {
      case 1:
      case 3:
        double height = v9 + v11 + 6.0;
        if (p_contentSize->height >= height) {
          double height = p_contentSize->height;
        }
        goto LABEL_15;
      case 2:
      case 4:
        double v12 = p_contentSize->height;
        if (v12 < v11) {
          double v12 = v11;
        }
        if (v12 >= v9) {
          double height = v12;
        }
        else {
          double height = v9;
        }
LABEL_15:
        p_contentSize->double height = height;
        break;
      default:
        double height = p_contentSize->height;
        break;
    }
  }
  double width = p_contentSize->width;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGRect)imageFrame
{
  p_imageFrame = &self->_imageFrame;
  if (CGRectIsNull(self->_imageFrame))
  {
    CGSize size = CGRectZero.size;
    CGPoint origin = CGRectZero.origin;
    p_imageFrame->CGPoint origin = CGRectZero.origin;
    p_imageFrame->CGSize size = size;
    double v4 = [(THWReviewQuestion *)[(THWReviewTextMultipleChoiceLayout *)self question] imageInfo];
    [(THWReviewTextMultipleChoiceLayout *)self imageSize];
    double v6 = v5;
    double v8 = v7;
    [(THWReviewTextMultipleChoiceLayout *)self answersSize];
    if (v4 && v6 > 0.0 && v8 > 0.0)
    {
      double v11 = v9;
      double v12 = v10;
      double v13 = [(THWReviewTextMultipleChoiceLayout *)self delegate];
      TSDRectWithSize();
      p_imageFrame->origin.double x = v14;
      p_imageFrame->origin.double y = v15;
      p_imageFrame->size.double width = v16;
      p_imageFrame->size.double height = v17;
      [(THWReviewTextMultipleChoiceLayout *)self minContentSize];
      TSDRectWithSize();
      TSDCenterRectOverRect();
      p_imageFrame->size.double width = v20;
      p_imageFrame->size.double height = v21;
      if (v18 < 0.0) {
        double v18 = 0.0;
      }
      if (v19 < 0.0) {
        double v19 = 0.0;
      }
      p_imageFrame->origin.double x = v18;
      p_imageFrame->origin.double y = v19;
      [(THWReviewTextMultipleChoiceLayout *)self contentSize];
      double v23 = v22;
      double v25 = v24;
      uint64_t v26 = [(THWReviewTextMultipleChoiceLayout *)self p_imagePlacement];
      switch((int)v26)
      {
        case 0:
        case 3:
        case 4:
          [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewTextMultipleChoiceLayout imageFrame]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewTextMultipleChoiceLayout.m") lineNumber:442 description:@"Unsupported image placement: %d" v26];
          p_imageFrame->CGPoint origin = origin;
          p_imageFrame->CGSize size = size;
          break;
        case 1:
          p_imageFrame->origin.double y = 0.0;
          if ([(THWReviewQuestionLayoutDelegate *)v13 isExpanded])
          {
            double v32 = v25 - v8 - v12 + -6.0;
            if (v32 < 0.0) {
              double v32 = 0.0;
            }
            p_imageFrame->origin.double y = p_imageFrame->origin.y + v32 * 0.25;
          }
          break;
        case 2:
          p_imageFrame->origin.double x = v23 - p_imageFrame->size.width;
          if ([(THWReviewQuestionLayoutDelegate *)v13 isExpanded])
          {
            double v31 = v23 - v6 - v11 + -15.0;
            if (v31 < 0.0) {
              double v31 = 0.0;
            }
            p_imageFrame->origin.double x = p_imageFrame->origin.x + v31 * -0.25;
          }
          break;
        default:
          break;
      }
    }
    TSDRoundedRect();
    p_imageFrame->origin.double x = x;
    p_imageFrame->origin.double y = y;
    p_imageFrame->size.double width = width;
    p_imageFrame->size.double height = height;
  }
  else
  {
    double x = p_imageFrame->origin.x;
    double y = p_imageFrame->origin.y;
    double width = p_imageFrame->size.width;
    double height = p_imageFrame->size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)answersFrame
{
  p_answersFrame = &self->_answersFrame;
  if (CGRectIsNull(self->_answersFrame))
  {
    [(THWReviewTextMultipleChoiceLayout *)self answersSize];
    double v5 = v4;
    TSDRectWithSize();
    p_answersFrame->origin.double x = v6;
    p_answersFrame->origin.double y = v7;
    p_answersFrame->size.double width = v8;
    p_answersFrame->size.double height = v9;
    [(THWReviewTextMultipleChoiceLayout *)self minContentSize];
    TSDRectWithSize();
    TSDCenterRectOverRect();
    p_answersFrame->size.double width = v12;
    p_answersFrame->size.double height = v13;
    if (v10 < 0.0) {
      double v10 = 0.0;
    }
    if (v11 < 0.0) {
      double v11 = 0.0;
    }
    p_answersFrame->origin.double x = v10;
    p_answersFrame->origin.double y = v11;
    if ([(THWReviewQuestion *)[(THWReviewTextMultipleChoiceLayout *)self question] imageInfo])
    {
      [(THWReviewTextMultipleChoiceLayout *)self imageFrame];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      [(THWReviewTextMultipleChoiceLayout *)self imageSize];
      double v23 = v22;
      [(THWReviewTextMultipleChoiceLayout *)self contentSize];
      double v25 = v24;
      double v27 = v26;
      uint64_t v28 = [(THWReviewTextMultipleChoiceLayout *)self p_imagePlacement];
      switch((int)v28)
      {
        case 0:
        case 3:
        case 4:
          [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THWReviewTextMultipleChoiceLayout answersFrame]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewTextMultipleChoiceLayout.m"] lineNumber:492 description:[NSString stringWithFormat:@"Unsupported image placement: %d", v28];
          break;
        case 1:
          v39.origin.double x = v15;
          v39.origin.double y = v17;
          v39.size.double width = v19;
          v39.size.double height = v21;
          v40.origin.double y = CGRectGetMaxY(v39) + 6.0;
          p_answersFrame->origin.double y = v40.origin.y;
          v40.origin.double x = p_answersFrame->origin.x;
          v40.size.double width = p_answersFrame->size.width;
          v40.size.double height = p_answersFrame->size.height;
          double v37 = (v27 - CGRectGetMaxY(v40)) * 0.5;
          if (v37 < 0.0) {
            double v37 = 0.0;
          }
          CGFloat v38 = p_answersFrame->origin.y + v37;
          p_answersFrame->origin.double x = (v25 - v5) * 0.5;
          p_answersFrame->origin.double y = v38;
          break;
        case 2:
          double v33 = v25 - v5 - v23 + -15.0;
          double v34 = v33 * 0.5;
          BOOL v35 = v33 < 0.0;
          double v36 = 0.0;
          if (!v35) {
            double v36 = v34;
          }
          p_answersFrame->origin.double x = v36;
          break;
        default:
          break;
      }
    }
    TSDRoundedRect();
    p_answersFrame->origin.double x = x;
    p_answersFrame->origin.double y = y;
    p_answersFrame->size.double width = width;
    p_answersFrame->size.double height = height;
  }
  else
  {
    double x = p_answersFrame->origin.x;
    double y = p_answersFrame->origin.y;
    double width = p_answersFrame->size.width;
    double height = p_answersFrame->size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)contentFrame
{
  p_contentFrame = &self->_contentFrame;
  if (CGRectIsNull(self->_contentFrame))
  {
    [(THWReviewTextMultipleChoiceLayout *)self contentSize];
    TSDRectWithSize();
    p_contentFrame->origin.double x = v4;
    p_contentFrame->origin.double y = v5;
    p_contentFrame->size.double width = v6;
    p_contentFrame->size.double height = v7;
    [(THWReviewTextMultipleChoiceLayout *)self minContentSize];
    TSDRectWithSize();
    TSDCenterRectOverRect();
    p_contentFrame->size.double width = width;
    p_contentFrame->size.double height = height;
    if (x < 0.0) {
      double x = 0.0;
    }
    if (y < 0.0) {
      double y = 0.0;
    }
    p_contentFrame->origin.double x = x;
    p_contentFrame->origin.double y = y;
  }
  else
  {
    double x = p_contentFrame->origin.x;
    double y = p_contentFrame->origin.y;
    double width = p_contentFrame->size.width;
    double height = p_contentFrame->size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)childInfosForLayout
{
  double v3 = +[NSMutableArray arrayWithObject:self->_answerStack];
  CGFloat v4 = [(THWReviewQuestion *)[(THWReviewTextMultipleChoiceLayout *)self question] imageInfo];
  if (v4) {
    [(NSMutableArray *)v3 addObject:v4];
  }
  return v3;
}

- (id)dependentLayouts
{
  id v3 = +[NSMutableArray array];
  v5.receiver = self;
  v5.super_class = (Class)THWReviewTextMultipleChoiceLayout;
  [v3 addObjectsFromArray:[self dependentLayouts]];
  if (self->_answerLayouts) {
    [v3 addObjectsFromArray:];
  }
  [(THWReviewTextMultipleChoiceLayout *)self addDescendentLayoutsToArray:v3];
  return v3;
}

- (id)computeLayoutGeometry
{
  [(THWReviewTextMultipleChoiceLayout *)self contentSize];
  id v2 = objc_alloc((Class)TSDLayoutGeometry);
  TSDRectWithSize();
  id v3 = [v2 initWithFrame:];

  return v3;
}

- (id)layoutGeometryForLayout:(id)a3
{
  objc_opt_class();
  id result = (id)TSUDynamicCast();
  if (result)
  {
    [(THWReviewTextMultipleChoiceLayout *)self imageFrame];
    id v9 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v5, v6, v7, v8];
    return v9;
  }
  return result;
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  return 0;
}

- (id)controlContainerAdditionalChildLayouts:(id)a3
{
  return self->_answerLayouts;
}

- (double)stackedControlContainerWidth:(id)a3
{
  [(THWReviewTextMultipleChoiceLayout *)self answersFrame];
  return v3;
}

- (UIEdgeInsets)stackedControlContainerInsets:(id)a3
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

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  return 20.0;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4
{
  return 0.0;
}

- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4
{
  return 0.0;
}

- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4
{
  return 0.0;
}

- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4
{
  return 0;
}

- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4
{
  return 0;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  return 0;
}

- (double)stackedControlContainerMinHeight:(id)a3
{
  [(THWReviewTextMultipleChoiceLayout *)self answersSize];
  double v5 = v4;
  [(THWReviewTextMultipleChoiceLayout *)self minContentSize];
  if (v5 >= v6) {
    return v6;
  }
  else {
    return v5;
  }
}

- (unsigned)stackedControlContainerVerticalAlignment:(id)a3
{
  return 1;
}

- (double)reviewTextAnswerLayoutWidth:(id)a3
{
  [(THWReviewTextMultipleChoiceLayout *)self answersFrame];
  return v3;
}

- (id)reviewTextAnswerLayoutListLabelParagraphStyle:(id)a3
{
  return [(THWReviewQuestion *)self->_question choiceNumberStyle];
}

- (id)layoutForChoiceIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_answerLayouts count] <= a3) {
    return 0;
  }
  answerLayouts = self->_answerLayouts;

  return [(NSArray *)answerLayouts objectAtIndex:a3];
}

- (void)p_setupAnswerLayouts
{
  if (!self->_answerLayouts)
  {
    double v3 = [(THWReviewQuestion *)self->_question choices];
    double v4 = +[NSMutableArray arrayWithCapacity:[(NSArray *)v3 count]];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v3);
          }
          double v10 = [[THWReviewTextAnswerLayout alloc] initWithChoice:*(void *)(*((void *)&v11 + 1) + 8 * i) index:(char *)i + v7 delegate:self];
          [(NSMutableArray *)v4 addObject:v10];
        }
        id v6 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        v7 += (uint64_t)i;
      }
      while (v6);
    }
    self->_answerLayouts = (NSArray *)[(NSMutableArray *)v4 copy];
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

- (THWStackedControlContainer)answerStack
{
  return self->_answerStack;
}

- (NSArray)answerLayouts
{
  return self->_answerLayouts;
}

- (THWReviewQuestionLayoutDelegate)delegate
{
  return self->_delegate;
}

@end