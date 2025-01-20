@interface THWReviewTextMultipleChoiceLayoutHelper
- (CGPoint)stackedControlContainerOrigin:(id)a3;
- (CGSize)answerStackSize;
- (CGSize)answerStackSizeForWidth:(double)a3;
- (NSArray)answerLayouts;
- (THWReviewQuestion)question;
- (THWReviewTextMultipleChoiceLayoutHelper)initWithQuestion:(id)a3;
- (UIEdgeInsets)stackedControlContainerInsets:(id)a3;
- (double)answerLayoutWidth;
- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4;
- (id)controlContainerAdditionalChildLayouts:(id)a3;
- (id)controlContainerChildInfosForLayout:(id)a3;
- (id)reviewTextAnswerLayoutListLabelParagraphStyle:(id)a3;
- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4;
- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4;
- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4;
- (unsigned)stackedControlContainerVerticalAlignment:(id)a3;
- (void)_setupAnswerLayouts;
- (void)dealloc;
- (void)setAnswerLayoutWidth:(double)a3;
- (void)setAnswerStackSize:(CGSize)a3;
@end

@implementation THWReviewTextMultipleChoiceLayoutHelper

- (THWReviewTextMultipleChoiceLayoutHelper)initWithQuestion:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THWReviewTextMultipleChoiceLayoutHelper;
  v4 = [(THWReviewTextMultipleChoiceLayoutHelper *)&v6 init];
  if (v4)
  {
    v4->_question = (THWReviewQuestion *)a3;
    [(THWReviewTextMultipleChoiceLayoutHelper *)v4 _setupAnswerLayouts];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextMultipleChoiceLayoutHelper;
  [(THWReviewTextMultipleChoiceLayoutHelper *)&v3 dealloc];
}

- (CGSize)answerStackSizeForWidth:(double)a3
{
  [(THWReviewTextMultipleChoiceLayoutHelper *)self answerLayoutWidth];
  if (v5 != a3)
  {
    uint64_t v14 = 0;
    v15 = (double *)&v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    uint64_t v10 = 0;
    v11 = (double *)&v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    [(THWReviewTextMultipleChoiceLayoutHelper *)self setAnswerLayoutWidth:a3];
    objc_super v6 = [[THWStackedControlContainer alloc] initWithDelegate:self];
    v18 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_157F3C;
    v9[3] = &unk_459F50;
    v9[4] = v6;
    v9[5] = &v10;
    v9[6] = &v14;
    +[TSDLayoutController temporaryLayoutControllerForInfos:useInBlock:](TSDLayoutController, "temporaryLayoutControllerForInfos:useInBlock:", +[NSArray arrayWithObjects:&v18 count:1], v9);

    -[THWReviewTextMultipleChoiceLayoutHelper setAnswerStackSize:](self, "setAnswerStackSize:", v15[3], v11[3]);
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  [(THWReviewTextMultipleChoiceLayoutHelper *)self answerStackSize];
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  return 0;
}

- (id)controlContainerAdditionalChildLayouts:(id)a3
{
  return [(THWReviewTextMultipleChoiceLayoutHelper *)self answerLayouts];
}

- (CGPoint)stackedControlContainerOrigin:(id)a3
{
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  result.double y = y;
  result.double x = x;
  return result;
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

- (unsigned)stackedControlContainerVerticalAlignment:(id)a3
{
  return 1;
}

- (id)reviewTextAnswerLayoutListLabelParagraphStyle:(id)a3
{
  double v3 = [(THWReviewTextMultipleChoiceLayoutHelper *)self question];

  return [(THWReviewQuestion *)v3 choiceNumberStyle];
}

- (void)_setupAnswerLayouts
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
        v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v3);
          }
          uint64_t v10 = [[THWReviewTextAnswerLayout alloc] initWithChoice:*(void *)(*((void *)&v11 + 1) + 8 * (void)v9) index:(char *)v9 + v7 delegate:self];
          [(NSMutableArray *)v4 addObject:v10];

          v9 = (char *)v9 + 1;
        }
        while (v6 != v9);
        id v6 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        v7 += (uint64_t)v9;
      }
      while (v6);
    }
    self->_answerLayouts = (NSArray *)[(NSMutableArray *)v4 copy];
  }
}

- (THWReviewQuestion)question
{
  return self->_question;
}

- (NSArray)answerLayouts
{
  return self->_answerLayouts;
}

- (double)answerLayoutWidth
{
  return self->_answerLayoutWidth;
}

- (void)setAnswerLayoutWidth:(double)a3
{
  self->_answerLayoutWidth = a3;
}

- (CGSize)answerStackSize
{
  double width = self->_answerStackSize.width;
  double height = self->_answerStackSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAnswerStackSize:(CGSize)a3
{
  self->_answerStackSize = a3;
}

@end