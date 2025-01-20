@interface THWReviewImageMultipleChoiceLayout
- (BOOL)dependentsRelyOnSize;
- (CGRect)contentFrame;
- (CGRect)p_frameForChoiceIndex:(unint64_t)a3;
- (CGSize)minContentSize;
- (CGSize)p_imageSize;
- (Class)repClassOverride;
- (NSArray)answerLayouts;
- (THWReviewImageMultipleChoiceLayout)initWithQuestion:(id)a3 index:(unint64_t)a4 delegate:(id)a5;
- (THWReviewQuestion)question;
- (THWReviewQuestionLayoutDelegate)delegate;
- (id)additionalLayouts;
- (id)childInfosForLayout;
- (id)computeLayoutGeometry;
- (id)dependentLayouts;
- (id)layoutForChoiceIndex:(unint64_t)a3;
- (id)layoutGeometryForLayout:(id)a3;
- (unint64_t)columnCount;
- (unint64_t)questionIndex;
- (unint64_t)rowCount;
- (void)dealloc;
- (void)invalidateSize;
- (void)p_layoutContentFrame;
- (void)p_setupAnswerLayouts;
@end

@implementation THWReviewImageMultipleChoiceLayout

- (THWReviewImageMultipleChoiceLayout)initWithQuestion:(id)a3 index:(unint64_t)a4 delegate:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)THWReviewImageMultipleChoiceLayout;
  v8 = [(THWReviewImageMultipleChoiceLayout *)&v12 initWithInfo:0];
  v9 = v8;
  if (v8)
  {
    CGSize size = CGRectNull.size;
    v8->_contentFrame.origin = CGRectNull.origin;
    v8->_contentFrame.CGSize size = size;
    v8->_questionIndex = a4;
    v8->_question = (THWReviewQuestion *)a3;
    v9->_delegate = (THWReviewQuestionLayoutDelegate *)a5;
    [(THWReviewImageMultipleChoiceLayout *)v9 p_setupAnswerLayouts];
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewImageMultipleChoiceLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)childInfosForLayout
{
  return 0;
}

- (id)dependentLayouts
{
  id v3 = +[NSMutableArray array];
  v5.receiver = self;
  v5.super_class = (Class)THWReviewImageMultipleChoiceLayout;
  [v3 addObjectsFromArray:[&v5 dependentLayouts]];
  [(THWReviewImageMultipleChoiceLayout *)self addDescendentLayoutsToArray:v3];
  return v3;
}

- (id)additionalLayouts
{
  return self->_answerLayouts;
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (void)invalidateSize
{
  v4.receiver = self;
  v4.super_class = (Class)THWReviewImageMultipleChoiceLayout;
  [(THWReviewImageMultipleChoiceLayout *)&v4 invalidateSize];
  CGSize size = CGRectNull.size;
  self->_contentFrame.origin = CGRectNull.origin;
  self->_contentFrame.CGSize size = size;
  self->_rowCount = 0;
  self->_columnCount = 0;
}

- (CGSize)minContentSize
{
  [(THWReviewQuestionLayoutDelegate *)self->_delegate questionAnswersLayoutSize:self];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)p_layoutContentFrame
{
  [(THWReviewImageMultipleChoiceLayout *)self minContentSize];
  double v4 = v3;
  double v6 = v5;
  v7 = (char *)[(THWReviewQuestionLayoutDelegate *)self->_delegate questionLayoutMode:self];
  unint64_t v8 = [(NSArray *)[(THWReviewQuestion *)self->_question choices] count];
  [(THWReviewImageMultipleChoiceLayout *)self p_imageSize];
  double v11 = v9;
  if (v8 < 2)
  {
    uint64_t v12 = 1;
    self->_rowCount = 1;
    goto LABEL_17;
  }
  if (v8 == 2)
  {
    if (v7 == (unsigned char *)&dword_0 + 2 || !v7 && (double v9 = v4 / (v9 * 2.0 + 6.0), v9 >= v6 / (v10 * 2.0 + 6.0)))
    {
      self->_rowCount = 1;
      uint64_t v12 = 2;
    }
    else
    {
      self->_rowCount = 2;
      uint64_t v12 = 1;
    }
LABEL_17:
    self->_columnCount = v12;
    if ((unint64_t)(v7 - 1) >= 2) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v8 >= 9)
  {
    unint64_t v13 = v8 + 1;
    if (v7 != (unsigned char *)&dword_0 + 1)
    {
      self->_rowCount = v13 / 3;
      uint64_t v12 = 3;
      goto LABEL_17;
    }
    unint64_t v14 = v13 >> 1;
    goto LABEL_20;
  }
  if (v7 != (unsigned char *)&dword_0 + 1)
  {
    self->_rowCount = 2;
    uint64_t v12 = (v8 + 1) >> 1;
    goto LABEL_17;
  }
  double v9 = v9 / v10;
  if (v11 / v10 <= 1.5)
  {
    unint64_t v14 = (v8 + 1) >> 1;
LABEL_20:
    self->_rowCount = v14;
    unint64_t v15 = 2;
    goto LABEL_21;
  }
  self->_rowCount = v8;
  unint64_t v15 = 1;
LABEL_21:
  self->_columnCount = v15;
LABEL_22:
  -[THWReviewQuestionLayoutDelegate questionLayoutSize:](self->_delegate, "questionLayoutSize:", self, v9);
LABEL_23:
  TSDShrinkSizeToFitInSize();
  p_contentFrame = &self->_contentFrame;
  TSDRectWithSize();
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  TSDRectWithSize();
  THIntegralCenterRectInRect(v18, v20, v22, v24, v25, v26, v27, v28);
  p_contentFrame->origin.x = v29;
  p_contentFrame->origin.y = v30;
  p_contentFrame->size.width = v31;
  p_contentFrame->size.height = v32;
}

- (CGRect)contentFrame
{
  p_contentFrame = &self->_contentFrame;
  if (CGRectIsNull(self->_contentFrame)) {
    [(THWReviewImageMultipleChoiceLayout *)self p_layoutContentFrame];
  }
  double x = p_contentFrame->origin.x;
  double y = p_contentFrame->origin.y;
  double width = p_contentFrame->size.width;
  double height = p_contentFrame->size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unint64_t)rowCount
{
  if (CGRectIsNull(self->_contentFrame)) {
    [(THWReviewImageMultipleChoiceLayout *)self p_layoutContentFrame];
  }
  return self->_rowCount;
}

- (unint64_t)columnCount
{
  if (CGRectIsNull(self->_contentFrame)) {
    [(THWReviewImageMultipleChoiceLayout *)self p_layoutContentFrame];
  }
  return self->_columnCount;
}

- (id)computeLayoutGeometry
{
  [(THWReviewImageMultipleChoiceLayout *)self contentFrame];
  id v2 = objc_alloc((Class)TSDLayoutGeometry);
  TSDRectWithSize();
  id v3 = [v2 initWithFrame:];

  return v3;
}

- (id)layoutGeometryForLayout:(id)a3
{
  double v4 = (void *)TSUProtocolCast();
  if (!v4) {
    return 0;
  }
  double v5 = v4;
  if ([v4 tag]) {
    return 0;
  }
  -[THWReviewImageMultipleChoiceLayout p_frameForChoiceIndex:](self, "p_frameForChoiceIndex:", [v5 index]);
  id v11 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v7, v8, v9, v10];

  return v11;
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
    NSUInteger v3 = [(NSArray *)[(THWReviewQuestion *)self->_question choices] count];
    double v4 = +[NSMutableArray arrayWithCapacity:v3];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        double v6 = [(THWControlLayout *)[THWButtonControlLayout alloc] initWithTag:0 index:i];
        [(NSMutableArray *)v4 addObject:v6];
      }
    }
    self->_answerLayouts = (NSArray *)[(NSMutableArray *)v4 copy];
  }
}

- (CGSize)p_imageSize
{
  CGFloat width = CGSizeZero.width;
  CGFloat height = CGSizeZero.height;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v4 = [(THWReviewQuestion *)self->_question choices];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) contentImage];
        if (v9)
        {
          [v9 size];
          CGFloat width = v10;
          CGFloat height = v11;
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
  double v12 = width;
  double v13 = height;
  result.CGFloat height = v13;
  result.CGFloat width = v12;
  return result;
}

- (CGRect)p_frameForChoiceIndex:(unint64_t)a3
{
  [(THWReviewImageMultipleChoiceLayout *)self contentFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [(THWReviewImageMultipleChoiceLayout *)self rowCount];
  uint64_t v14 = [(THWReviewImageMultipleChoiceLayout *)self columnCount];
  float v15 = (v10 + (double)(unint64_t)(v14 - 1) * -6.0) / (double)(unint64_t)v14;
  float v16 = floorf(v15);
  ldiv_t v17 = ldiv(a3, v14);
  double v18 = v6 + (double)(unint64_t)v17.rem * (v16 + 6.0);
  if (v17.quot + 1 >= v13)
  {
    NSUInteger v19 = [(NSArray *)[(THWReviewQuestion *)self->_question choices] count];
    double v20 = v18 + floorf(v16 * 0.5);
    if (v14 * v13 != v19) {
      double v18 = v20;
    }
  }
  float v21 = (v12 + (double)(v13 - 1) * -6.0) / (double)v13;
  double v22 = floorf(v21);
  double v23 = v8 + (double)(unint64_t)v17.quot * (v22 + 6.0);
  double v24 = v18;
  double v25 = v16;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v25;
  result.origin.double y = v23;
  result.origin.double x = v24;
  return result;
}

- (unint64_t)questionIndex
{
  return self->_questionIndex;
}

- (THWReviewQuestion)question
{
  return self->_question;
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