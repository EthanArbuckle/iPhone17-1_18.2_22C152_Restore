@interface THWReviewSummaryLayout
- (BOOL)stackedControlContainer:(id)a3 autoGrowHorizontallyTextLayout:(id)a4;
- (CGPoint)stackedControlContainerOrigin:(id)a3;
- (Class)repClassOverride;
- (THWReviewSummaryLayout)initWithDelegate:(id)a3;
- (THWReviewSummaryLayoutDelegate)delegate;
- (THWStackedControlContainer)checkingStack;
- (THWStackedControlContainer)resultStack;
- (TSWPStorage)checkingAnswerStorage;
- (TSWPStorage)instructionalStorage;
- (TSWPStorage)summaryStorage;
- (UIEdgeInsets)stackedControlContainerInsets:(id)a3;
- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4;
- (double)stackedControlContainerMinHeight:(id)a3;
- (double)stackedControlContainerWidth:(id)a3;
- (id)checkingLayout;
- (id)checkingWPLayout;
- (id)childInfosForLayout;
- (id)controlContainerChildInfosForLayout:(id)a3;
- (id)dependentLayouts;
- (id)instructionalWPLayout;
- (id)resultsLayout;
- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4;
- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4;
- (id)storageWithStyle:(id)a3 string:(id)a4;
- (id)summaryWPLayout;
- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4;
- (unsigned)stackedControlContainerVerticalAlignment:(id)a3;
- (void)dealloc;
- (void)invalidateSize;
- (void)p_updateStorages;
- (void)validate;
@end

@implementation THWReviewSummaryLayout

- (THWReviewSummaryLayout)initWithDelegate:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)THWReviewSummaryLayout;
  v4 = [(THWReviewSummaryLayout *)&v9 initWithInfo:0];
  v5 = v4;
  if (v4)
  {
    v4->_delegate = (THWReviewSummaryLayoutDelegate *)a3;
    v6 = [[THWStackedControlContainer alloc] initWithDelegate:v4];
    v5->_resultStack = v6;
    [(THWControlContainer *)v6 setTag:7];
    v7 = [[THWStackedControlContainer alloc] initWithDelegate:v5];
    v5->_checkingStack = v7;
    [(THWControlContainer *)v7 setTag:6];
    [(THWReviewSummaryLayout *)v5 p_updateStorages];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewSummaryLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (id)checkingLayout
{
  id v3 = [(THWReviewSummaryLayout *)self layoutController];
  checkingStack = self->_checkingStack;

  return [v3 layoutForInfo:checkingStack childOfLayout:self];
}

- (id)resultsLayout
{
  id v3 = [(THWReviewSummaryLayout *)self layoutController];
  resultStack = self->_resultStack;

  return [v3 layoutForInfo:resultStack childOfLayout:self];
}

- (id)checkingWPLayout
{
  objc_opt_class();
  [layoutController layoutForInfo:self->_checkingAnswerStorage childOfLayout:[self checkingLayout]];

  return (id)TSUDynamicCast();
}

- (id)summaryWPLayout
{
  objc_opt_class();
  [layoutController layoutForInfo:self->_summaryStorage childOfLayout:[resultsLayout layoutController]];

  return (id)TSUDynamicCast();
}

- (id)instructionalWPLayout
{
  objc_opt_class();
  [layoutController layoutForInfo:self->_instructionalStorage childOfLayout:[resultsLayout layoutController]];

  return (id)TSUDynamicCast();
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (id)childInfosForLayout
{
  return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_resultStack, self->_checkingStack, 0);
}

- (id)dependentLayouts
{
  id v3 = +[NSMutableArray array];
  v5.receiver = self;
  v5.super_class = (Class)THWReviewSummaryLayout;
  [v3 addObjectsFromArray:[&v5 dependentLayouts]];
  [(THWReviewSummaryLayout *)self addDescendentLayoutsToArray:v3];
  return v3;
}

- (void)validate
{
  [(THWReviewSummaryLayout *)self invalidateFrame];
  v3.receiver = self;
  v3.super_class = (Class)THWReviewSummaryLayout;
  [(THWReviewSummaryLayout *)&v3 validate];
}

- (void)invalidateSize
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewSummaryLayout;
  [(THWReviewSummaryLayout *)&v3 invalidateSize];
  [self.summaryWPLayout invalidateSize];
  [self instructionalWPLayout].invalidateSize;
  [self checkingWPLayout].invalidateSize;
}

- (id)storageWithStyle:(id)a3 string:(id)a4
{
  id v6 = [(THWReviewSummaryLayoutDelegate *)self->_delegate reviewSummaryContext];
  id v7 = [objc_alloc((Class)TSSStylesheet) initWithContext:v6];
  v8 = [THWPStorage alloc];
  if (!a4) {
    a4 = @" ";
  }
  objc_super v9 = [(THWPStorage *)v8 initWithContext:v6 string:a4 kind:3 stylesheet:v7 paragraphStyle:a3 listStyle:+[TSWPListStyle defaultStyleWithContext:v6] section:0 columnStyle:0];

  return v9;
}

- (void)p_updateStorages
{
  if (!self->_summaryStorage) {
    self->_summaryStorage = (TSWPStorage *)[(THWReviewSummaryLayout *)self storageWithStyle:[(THWReviewSummaryLayoutDelegate *)self->_delegate reviewSummaryResultsParagraphStyle] string:0];
  }
  if (!self->_instructionalStorage) {
    self->_instructionalStorage = (TSWPStorage *)[(THWReviewSummaryLayout *)self storageWithStyle:[(THWReviewSummaryLayoutDelegate *)self->_delegate reviewSummaryInstructionalParagraphStyle] string:0];
  }
  if (!self->_checkingAnswerStorage) {
    self->_checkingAnswerStorage = (TSWPStorage *)-[THWReviewSummaryLayout storageWithStyle:string:](self, "storageWithStyle:string:", -[THWReviewSummaryLayoutDelegate reviewSummaryCheckingParagraphStyleWithIndent:](self->_delegate, "reviewSummaryCheckingParagraphStyleWithIndent:", 40.0), [(id)THBundle() localizedStringForKey:@"Checking Answers…" value:&stru_46D7E8 table:0]);
  }
  id v3 = [(THWReviewSummaryLayoutDelegate *)self->_delegate reviewSummaryQuestionCount];
  id v4 = [(THWReviewSummaryLayoutDelegate *)self->_delegate reviewSummaryCorrectCount];
  -[TSWPStorage replaceCharactersInRange:withString:undoTransaction:](self->_summaryStorage, "replaceCharactersInRange:withString:undoTransaction:", 0, -[TSWPStorage length](self->_summaryStorage, "length"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"%lu out of %lu Answers Correct" value:&stru_46D7E8 table:0], v4, v3), 0);
  if (v4 == v3) {
    CFStringRef v5 = @"Congratulations!\nYou’ve successfully completed this review.";
  }
  else {
    CFStringRef v5 = @"Go back to review incorrect answers and try again, or start over and clear all answers.";
  }
  -[TSWPStorage replaceCharactersInRange:withString:undoTransaction:](self->_instructionalStorage, "replaceCharactersInRange:withString:undoTransaction:", 0, -[TSWPStorage length](self->_instructionalStorage, "length"), [(id)THBundle() localizedStringForKey:v5 value:&stru_46D7E8 table:0], 0);

  [(THWReviewSummaryLayout *)self invalidateChildren];
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  if ([a3 tag] == (char *)&dword_4 + 2)
  {
    checkingAnswerStorage = self->_checkingAnswerStorage;
    return +[NSArray arrayWithObject:checkingAnswerStorage];
  }
  else if ([a3 tag] == (char *)&dword_4 + 3)
  {
    return +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", self->_summaryStorage, self->_instructionalStorage, 0);
  }
  else
  {
    return 0;
  }
}

- (double)stackedControlContainerWidth:(id)a3
{
  id v3 = [(THWReviewSummaryLayout *)self geometry];

  [v3 size];
  return result;
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
  double v3 = 13.0;
  double v4 = 15.0;
  double v5 = 13.0;
  double v6 = 15.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  return 25.0;
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
  return 2;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  return 0;
}

- (unsigned)stackedControlContainerVerticalAlignment:(id)a3
{
  return 1;
}

- (double)stackedControlContainerMinHeight:(id)a3
{
  [self geometry:@"geometry" a3] size;
  return v3;
}

- (BOOL)stackedControlContainer:(id)a3 autoGrowHorizontallyTextLayout:(id)a4
{
  return 1;
}

- (THWReviewSummaryLayoutDelegate)delegate
{
  return self->_delegate;
}

- (TSWPStorage)summaryStorage
{
  return self->_summaryStorage;
}

- (TSWPStorage)instructionalStorage
{
  return self->_instructionalStorage;
}

- (TSWPStorage)checkingAnswerStorage
{
  return self->_checkingAnswerStorage;
}

- (THWStackedControlContainer)resultStack
{
  return self->_resultStack;
}

- (THWStackedControlContainer)checkingStack
{
  return self->_checkingStack;
}

@end