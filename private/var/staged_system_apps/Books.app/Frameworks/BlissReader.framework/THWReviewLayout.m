@interface THWReviewLayout
- (BOOL)dependentsRelyOnSize;
- (BOOL)hasTitle;
- (BOOL)isCompactFlowPresentation;
- (BOOL)isExpanded;
- (BOOL)isExpandedOnly;
- (BOOL)isReflowablePresentation;
- (BOOL)p_haveAnswersBeenCheckedForAllQuestions;
- (BOOL)p_useCompactPadding;
- (BOOL)reviewSummaryShouldShowResults;
- (BOOL)stackedControlContainer:(id)a3 isHeightFlexibleForLayout:(id)a4;
- (BOOL)usePhoneLayout;
- (CGPoint)stackedControlContainerOrigin:(id)a3;
- (CGRect)controlsFrame;
- (CGRect)p_expandedWidgetLayoutFrame;
- (CGRect)p_expandedWidgetStageFrame;
- (CGRect)stageFrame;
- (CGSize)controlsSizeWithPanelWidth:(double)a3;
- (CGSize)maximumContentSize;
- (CGSize)minimumContentSize;
- (CGSize)p_expandedSize;
- (CGSize)questionAnswersLayoutSize:(id)a3;
- (CGSize)questionLayoutSize:(id)a3;
- (NSArray)questionStackedContainers;
- (NSArray)scrollableCanvasLayouts;
- (NSArray)stagePages;
- (NSMutableDictionary)questionNumberStorages;
- (THWPagedCanvasControlLayout)stageCanvasLayout;
- (THWReviewControlsLayout)controlsLayout;
- (THWReviewLayout)initWithInfo:(id)a3;
- (THWReviewSummaryLayout)summaryLayout;
- (THWWidgetLayoutDelegate)delegate;
- (TSUColor)disabledPrimaryColor;
- (TSUColor)primaryColor;
- (TSUIntegerKeyDictionary)dividerLayouts;
- (TSUIntegerKeyDictionary)questionLayouts;
- (UIEdgeInsets)stackedControlContainerInsets:(id)a3;
- (double)p_margin;
- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4;
- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4;
- (double)stackedControlContainerMinHeight:(id)a3;
- (double)stackedControlContainerWidth:(id)a3;
- (double)stageCornerRadius;
- (id)additionalLayouts;
- (id)childInfosForLayout;
- (id)computeLayoutGeometry;
- (id)controlContainerAdditionalChildLayouts:(id)a3;
- (id)controlContainerChildInfosForLayout:(id)a3;
- (id)infosForScrollablePage:(unint64_t)a3;
- (id)infosForStagePages:(_NSRange)a3;
- (id)layoutForQuestion:(id)a3;
- (id)layoutGeometryForLayout:(id)a3;
- (id)layoutGeometryFromProvider;
- (id)p_backgroundColorFill;
- (id)p_backgroundFill;
- (id)p_colorForStorage:(id)a3;
- (id)p_dataController;
- (id)p_dividerLayoutForPageIndex:(unint64_t)a3;
- (id)p_fallbackTextColorToContrastWidgetBackground;
- (id)p_labelColor;
- (id)p_paragraphStyleWithSize:(double)a3 bold:(BOOL)a4 indent:(double)a5;
- (id)p_questionAtPageIndex:(unint64_t)a3;
- (id)p_questionLayoutForPageIndex:(unint64_t)a3;
- (id)p_responseController;
- (id)questionNumberStorageAtPageIndex:(unint64_t)a3;
- (id)reviewSummaryCheckingParagraphStyleWithIndent:(double)a3;
- (id)reviewSummaryContext;
- (id)reviewSummaryInstructionalParagraphStyle;
- (id)reviewSummaryResultsParagraphStyle;
- (id)reviewSummaryTitleParagraphStyle;
- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4;
- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4;
- (id)summaryTitleStorage;
- (unint64_t)numberOfStagePages;
- (unint64_t)p_countCorrectAnswers;
- (unint64_t)p_initialQuestionIndex;
- (unint64_t)questionCount;
- (unint64_t)questionIndex;
- (unint64_t)questionLayoutMode:(id)a3;
- (unint64_t)reviewSummaryCorrectCount;
- (unint64_t)reviewSummaryQuestionCount;
- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4;
- (void)dealloc;
- (void)invalidateQuestionLayouts;
- (void)invalidateSize;
- (void)p_invalidateExternal;
- (void)p_updatePageLayouts;
- (void)setDelegate:(id)a3;
- (void)setQuestionIndex:(unint64_t)a3;
- (void)setQuestionStackedContainers:(id)a3;
- (void)setScrollableCanvasLayouts:(id)a3;
- (void)setStagePages:(id)a3;
- (void)updateChildrenFromInfo;
- (void)wasAddedToLayoutController:(id)a3;
@end

@implementation THWReviewLayout

- (THWReviewLayout)initWithInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWReviewLayout;
  result = [(THWReviewLayout *)&v4 initWithInfo:a3];
  if (result) {
    result->_questionIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewLayout;
  [(THWContainerLayout *)&v3 dealloc];
}

- (void)p_invalidateExternal
{
  [(THWReviewLayout *)self invalidateFrame];

  [(THWReviewLayout *)self invalidateChildren];
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWWidgetLayoutDelegate *)a3;
  [(THWReviewLayout *)self p_invalidateExternal];
}

- (void)wasAddedToLayoutController:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWReviewLayout;
  [(THWReviewLayout *)&v4 wasAddedToLayoutController:a3];
  [(THWReviewLayout *)self p_invalidateExternal];
}

- (BOOL)isExpanded
{
  delegate = self->_delegate;
  if (delegate) {
    LOBYTE(delegate) = [(THWWidgetLayoutDelegate *)delegate widgetLayoutMode:self] == 1;
  }
  return (char)delegate;
}

- (BOOL)isCompactFlowPresentation
{
  objc_super v3 = [(THWReviewLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsCompactFlow:self];
}

- (BOOL)isReflowablePresentation
{
  objc_super v3 = [(THWReviewLayout *)self delegate];

  return [(THWWidgetLayoutDelegate *)v3 widgetLayoutIsReflowablePresentation:self];
}

- (CGRect)controlsFrame
{
  double x = self->_stageFrame.origin.x;
  double width = self->_stageFrame.size.width;
  double v4 = self->_stageFrame.origin.y + self->_stageFrame.size.height + 10.0;
  double v5 = 34.0;
  result.size.height = v5;
  result.size.double width = width;
  result.origin.y = v4;
  result.origin.double x = x;
  return result;
}

- (CGSize)controlsSizeWithPanelWidth:(double)a3
{
  double v3 = a3 + -24.0;
  double v4 = 34.0;
  result.height = v4;
  result.double width = v3;
  return result;
}

- (BOOL)hasTitle
{
  return objc_msgSend(objc_msgSend(-[THWReviewLayout info](self, "info"), "adornmentInfo"), "title") != 0;
}

- (id)p_colorForStorage:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = objc_msgSend(objc_msgSend(a3, "characterStyleAtCharIndex:effectiveRange:", 0, 0), "valueForProperty:", 18);
  if (!v4)
  {
    id v4 = objc_msgSend(objc_msgSend(a3, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0), "valueForProperty:", 18);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewLayout p_colorForStorage:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewLayout.m") lineNumber:207 description:@"TSWPParagraph style returned non-TSUColor"];
    }
  }
  return v4;
}

- (id)p_labelColor
{
  id result = [[[self info] adornmentInfo] title].containedStorage;
  if (result)
  {
    return [(THWReviewLayout *)self p_colorForStorage:result];
  }
  return result;
}

- (id)p_backgroundFill
{
  double v3 = +[NSNull null];
  id v4 = [[[self info] adornmentInfo] background];
  if (!v4) {
    return v3;
  }
  id v5 = [v4 style];

  return [v5 valueForProperty:516];
}

- (id)p_backgroundColorFill
{
  id v2 = [(THWReviewLayout *)self p_backgroundFill];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }

  return +[TSDColorFill whiteColor];
}

- (id)p_fallbackTextColorToContrastWidgetBackground
{
  id v3 = +[TSUColor blackColor];
  if (!objc_msgSend(objc_msgSend(-[THWReviewLayout info](self, "info"), "adornmentInfo"), "background")) {
    return v3;
  }
  [self p_backgroundColorFill].luminance;
  if (v4 >= 0.5) {
    return v3;
  }

  return +[TSUColor whiteColor];
}

- (TSUColor)primaryColor
{
  if ([(THWReviewLayout *)self isExpanded])
  {
    return (TSUColor *)+[TSUColor blackColor];
  }
  else
  {
    id result = self->_primaryColor;
    if (!result)
    {
      double v4 = [THWReviewLayout info](self, "info").primaryColor;
      self->_primaryColor = v4;
      if (!v4)
      {
        double v4 = [(THWReviewLayout *)self p_labelColor];
        if (!v4) {
          double v4 = [(THWReviewLayout *)self p_fallbackTextColorToContrastWidgetBackground];
        }
        self->_primaryColor = v4;
      }
      id v5 = v4;
      return self->_primaryColor;
    }
  }
  return result;
}

- (TSUColor)disabledPrimaryColor
{
  if ([(THWReviewLayout *)self isExpanded])
  {
    return (TSUColor *)+[TSUColor grayColor];
  }
  else
  {
    if (!self->_disabledPrimaryColor)
    {
      double v4 = [(THWReviewLayout *)self primaryColor];
      if (v4)
      {
        id v5 = (CGColor *)[(TSUColor *)v4 CGColor];
        CGFloat Alpha = CGColorGetAlpha(v5);
        CopyWithCGFloat Alpha = CGColorCreateCopyWithAlpha(v5, Alpha * 0.4);
        self->_disabledPrimaryColor = (TSUColor *)[objc_alloc((Class)TSUColor) initWithCGColor:CopyWithAlpha];
        CGColorRelease(CopyWithAlpha);
      }
    }
    return self->_disabledPrimaryColor;
  }
}

- (CGSize)minimumContentSize
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "canvas"), "documentRoot");
  [TSUDynamicCast bookDescription].bookIsPaginatedForLandscape;
  double v3 = 768.0;
  double v4 = 704.0;
  result.height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)maximumContentSize
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "canvas"), "documentRoot");
  unsigned int v3 = [TSUDynamicCast bookDescription].bookIsPaginatedForLandscape;
  double v4 = 768.0;
  if (v3) {
    double v4 = 1024.0;
  }
  double v5 = 1004.0;
  if (v3) {
    double v5 = 748.0;
  }
  result.height = v5;
  result.double width = v4;
  return result;
}

- (CGSize)p_expandedSize
{
  [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutBounds];
  double v4 = v3;
  double v6 = v5;
  [(THWReviewLayout *)self minimumContentSize];
  double v8 = v7;
  [(THWReviewLayout *)self maximumContentSize];
  if (v4 < v9) {
    double v9 = v4;
  }
  if (v8 >= v9) {
    double v9 = v8;
  }
  if (v6 < v10) {
    double v10 = v6;
  }
  result.height = v10;
  result.double width = v9;
  return result;
}

- (CGRect)p_expandedWidgetLayoutFrame
{
  [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutBounds];
  result.size.height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)p_expandedWidgetStageFrame
{
  [(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutBounds];
  result.size.height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.double x = v2;
  return result;
}

- (id)layoutGeometryFromProvider
{
  if ([(THWReviewLayout *)self isExpanded])
  {
    id v3 = objc_alloc((Class)TSDLayoutGeometry);
    [(THWReviewLayout *)self p_expandedWidgetLayoutFrame];
    id v4 = [v3 initWithFrame:];
    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)THWReviewLayout;
    return [(THWReviewLayout *)&v6 layoutGeometryFromProvider];
  }
}

- (void)updateChildrenFromInfo
{
  if (!self->_stageCanvasLayout) {
    self->_stageCanvasLayout = [(THWControlLayout *)[THWPagedCanvasControlLayout alloc] initWithTag:0];
  }
  if (!self->_controlsLayout)
  {
    id v3 = [[THWReviewControlsLayout alloc] initWithDelegate:self];
    self->_controlsLayout = v3;
    [(THWReviewControlsLayout *)v3 setTag:1];
  }
  [(THWReviewLayout *)self p_updatePageLayouts];
  if (self->_questionIndex == 0x7FFFFFFFFFFFFFFFLL) {
    self->_questionIndedouble x = [(THWReviewLayout *)self p_initialQuestionIndex];
  }
  v4.receiver = self;
  v4.super_class = (Class)THWReviewLayout;
  [(THWContainerLayout *)&v4 updateChildrenFromInfo];
}

- (BOOL)isExpandedOnly
{
  [self info].parentInfo;
  double v2 = (void *)TSUProtocolCast();

  return [v2 isExpandedOnly];
}

- (unint64_t)questionLayoutMode:(id)a3
{
  if (![(THWReviewLayout *)self isExpanded]) {
    return 0;
  }
  unsigned int v4 = [[self layoutController] isCompactWidth];
  if (objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "isCompactHeight")) {
    return 2;
  }
  else {
    return v4;
  }
}

- (CGSize)questionLayoutSize:(id)a3
{
  objc_opt_class();
  unsigned int v4 = (void *)TSUDynamicCast();
  objc_opt_class();
  [v4 parent];
  uint64_t v5 = TSUDynamicCast();
  [(THWReviewLayout *)self stackedControlContainerWidth:v5];
  double v7 = v6;
  [(THWReviewLayout *)self stackedControlContainerMinHeight:v5];
  double v9 = v8;
  [(THWReviewLayout *)self stackedControlContainerInsets:v5];
  double v12 = v7 - v10 - v11;
  double v15 = v9 - v13 - v14;
  double v16 = v12;
  result.height = v15;
  result.double width = v16;
  return result;
}

- (CGSize)questionAnswersLayoutSize:(id)a3
{
  objc_opt_class();
  unsigned int v4 = (void *)TSUDynamicCast();
  objc_opt_class();
  [v4 parent];
  uint64_t v5 = (void *)TSUDynamicCast();
  [(THWReviewLayout *)self stackedControlContainerWidth:v5];
  double v7 = v6;
  [(THWReviewLayout *)self stackedControlContainerInsets:v5];
  double v9 = v8;
  double v11 = v10;
  [v5 heightForFlexibleChildLayout:v4];
  double v13 = v12;
  double v14 = v7 - v9 - v11;
  result.height = v13;
  result.double width = v14;
  return result;
}

- (BOOL)usePhoneLayout
{
  if ([(THWWidgetLayoutDelegate *)self->_delegate widgetLayoutMode:self] != 1) {
    return 0;
  }
  if (objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "isCompactWidth")) {
    return 1;
  }
  id v4 = [(THWReviewLayout *)self layoutController];

  return [v4 isCompactHeight];
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  if ([a3 tag] != &dword_4) {
    return 0;
  }
  id v5 = +[NSMutableArray array];
  id v6 = [a3 index];
  if (![(THWReviewLayout *)self usePhoneLayout])
  {
    id v7 = [(THWReviewLayout *)self questionNumberStorageAtPageIndex:v6];
    if (v7) {
      [v5 addObject:v7];
    }
  }
  id v8 = [self p_questionAtPageIndex:v6].prompt;
  if (v8) {
    [v5 addObject:v8];
  }
  return v5;
}

- (id)controlContainerAdditionalChildLayouts:(id)a3
{
  if ([a3 tag] == &dword_4)
  {
    id v5 = [a3 index];
    id v6 = +[NSMutableArray array];
    id v7 = [(THWReviewLayout *)self p_dividerLayoutForPageIndex:v5];
    if (v7) {
      [v6 addObject:v7];
    }
    id v8 = [(THWReviewLayout *)self p_questionLayoutForPageIndex:v5];
    if (v8) {
      [v6 addObject:v8];
    }
    return v6;
  }
  if ([a3 tag] != (char *)&dword_4 + 1)
  {
    if ([a3 tag] == (char *)&dword_0 + 2)
    {
      id v11 = [a3 index];
      if (v11 < (id)[(NSArray *)self->_scrollableCanvasLayouts count])
      {
        id v12 = [(NSArray *)self->_scrollableCanvasLayouts objectAtIndexedSubscript:v11];
        return +[NSArray arrayWithObjects:&v12 count:1];
      }
    }
    return 0;
  }
  summaryLayout = self->_summaryLayout;
  if (!summaryLayout)
  {
    summaryLayout = [[THWReviewSummaryLayout alloc] initWithDelegate:self];
    self->_summaryLayout = summaryLayout;
    if (!summaryLayout) {
      return 0;
    }
  }

  return +[NSArray arrayWithObject:summaryLayout];
}

- (double)stackedControlContainerWidth:(id)a3
{
  return CGRectGetWidth(self->_stageFrame);
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
  unsigned int v3 = [(THWReviewLayout *)self p_useCompactPadding];
  double v4 = 13.0;
  if (v3) {
    double v4 = 7.0;
  }
  double v5 = 15.0;
  double v6 = 15.0;
  double v7 = v4;
  result.right = v6;
  result.bottom = v7;
  result.left = v5;
  result.top = v4;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  id v6 = [a3 index];
  objc_opt_class();
  [a4 info];
  uint64_t v7 = TSUDynamicCast();
  if (!v7)
  {
    objc_opt_class();
    if (!TSUDynamicCast()) {
      return 0.0;
    }
    goto LABEL_6;
  }
  id v8 = (id)v7;
  id v9 = [self info].questionAtIndex:v6;
  if ([(THWReviewLayout *)self questionNumberStorageAtPageIndex:v6] != v8)
  {
    id v10 = [v9 prompt];
    double result = 0.0;
    if (v10 != v8) {
      return result;
    }
LABEL_6:
    BOOL v12 = ![(THWReviewLayout *)self p_useCompactPadding];
    double result = 14.0;
    double v13 = 7.0;
    goto LABEL_8;
  }
  BOOL v12 = ![(THWReviewLayout *)self usePhoneLayout];
  double result = 5.0;
  double v13 = 0.0;
LABEL_8:
  if (!v12) {
    return v13;
  }
  return result;
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
  objc_opt_class();
  id result = (id)TSUDynamicCast();
  if (result)
  {
    [(THWReviewLayout *)self p_useCompactPadding];
    id v6 = objc_alloc((Class)TSDLayoutGeometry);
    TSDRectWithSize();
    id v7 = [v6 initWithFrame:];
    return v7;
  }
  return result;
}

- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4
{
  return 0;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  return 0;
}

- (BOOL)stackedControlContainer:(id)a3 isHeightFlexibleForLayout:(id)a4
{
  return TSUProtocolCast() != 0;
}

- (double)stackedControlContainerMinHeight:(id)a3
{
  return self->_stageFrame.size.height;
}

- (id)childInfosForLayout
{
  id v3 = [self info].childInfos;
  if (![(THWReviewLayout *)self isExpanded]
    && objc_msgSend(-[THWReviewLayout info](self, "info"), "adornmentInfo"))
  {
    id v3 = objc_msgSend(objc_msgSend(-[THWReviewLayout info](self, "info"), "adornmentInfo"), "interleavedInfosWithInfos:", v3);
  }
  if (v3) {
    return v3;
  }

  return +[NSArray array];
}

- (id)infosForStagePages:(_NSRange)a3
{
  stagePages = self->_stagePages;
  if (!stagePages) {
    return 0;
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a3.location + a3.length > [(NSArray *)stagePages count]) {
    return 0;
  }
  id v8 = self->_stagePages;

  return -[NSArray subarrayWithRange:](v8, "subarrayWithRange:", location, length);
}

- (id)infosForScrollablePage:(unint64_t)a3
{
  if ([(NSArray *)self->_questionStackedContainers count] <= a3) {
    return 0;
  }
  id v6 = [(NSArray *)self->_questionStackedContainers objectAtIndexedSubscript:a3];
  return +[NSArray arrayWithObjects:&v6 count:1];
}

- (id)layoutForQuestion:(id)a3
{
  id v4 = [[self info] indexOfQuestion:a3];

  return [(THWReviewLayout *)self p_questionLayoutForPageIndex:v4];
}

- (id)additionalLayouts
{
  id v3 = +[NSMutableArray array];
  id v4 = v3;
  if (self->_stageCanvasLayout) {
    [v3 addObject:];
  }
  if (self->_controlsLayout && ![(THWReviewLayout *)self isExpanded]) {
    [v4 addObject:self->_controlsLayout];
  }
  return v4;
}

- (id)computeLayoutGeometry
{
  v20.receiver = self;
  v20.super_class = (Class)THWReviewLayout;
  id v3 = [(THWReviewLayout *)&v20 computeLayoutGeometry];
  if ([(THWReviewLayout *)self isExpanded])
  {
    [(THWReviewLayout *)self p_expandedWidgetStageFrame];
    self->_stageFrame.origin.double x = v4;
    self->_stageFrame.origin.double y = v5;
    self->_stageFrame.size.double width = v6;
    self->_stageFrame.size.height = v7;
    self->_stageCornerRadius = 0.0;
    if ([(THWReviewLayout *)self isExpanded])
    {
      char v8 = objc_opt_respondsToSelector();
      double v9 = 0.0;
      double v10 = 0.0;
      if (v8)
      {
        -[THWWidgetLayoutDelegate expandedHeightForPanel:allowDefault:](self->_delegate, "expandedHeightForPanel:allowDefault:", 0, 1, 0.0);
        double v10 = v11;
        [(THWWidgetLayoutDelegate *)self->_delegate expandedHeightForPanel:1 allowDefault:1];
        double v9 = fmax(v12, 54.0);
      }
      self->_stageFrame.origin.double y = v10 + self->_stageFrame.origin.y;
      self->_stageFrame.size.height = self->_stageFrame.size.height - (v9 + v10);
    }
  }
  else
  {
    id v13 = [[self info] stageGeometry];
    [v13 frame];
    self->_stageFrame.origin.double x = v14;
    self->_stageFrame.origin.double y = v15;
    self->_stageFrame.size.double width = v16;
    self->_stageFrame.size.height = v17;
    [v13 cornerRadius];
    self->_stageCornerRadius = v18;
  }
  return v3;
}

- (unint64_t)numberOfStagePages
{
  unint64_t result = (unint64_t)[-[THWReviewLayout info](self, "info") questions count];
  if (result > 1) {
    ++result;
  }
  return result;
}

- (void)setQuestionIndex:(unint64_t)a3
{
  if (self->_questionIndex != a3)
  {
    self->_questionIndedouble x = a3;
    [(THWReviewLayout *)self invalidateChildren];
  }
}

- (unint64_t)questionCount
{
  id v2 = [[self info] questions];

  return (unint64_t)[v2 count];
}

- (BOOL)dependentsRelyOnSize
{
  return 1;
}

- (void)invalidateSize
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewLayout;
  [(THWReviewLayout *)&v3 invalidateSize];
  [(THWReviewLayout *)self invalidateQuestionLayouts];
}

- (void)invalidateQuestionLayouts
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v3 = [(TSUIntegerKeyDictionary *)self->_questionLayouts allValues];
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      CGFloat v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v7) invalidateSize];
        CGFloat v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v5);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [(TSUIntegerKeyDictionary *)self->_dividerLayouts allValues];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) invalidateSize];
        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v10);
  }
}

- (id)layoutGeometryForLayout:(id)a3
{
  id v5 = (void *)TSUProtocolCast();
  if (v5)
  {
    uint64_t v6 = v5;
    switch((unint64_t)[v5 tag])
    {
      case 0uLL:
        id v7 = objc_alloc((Class)TSDLayoutGeometry);
        double x = self->_stageFrame.origin.x;
        double y = self->_stageFrame.origin.y;
        double width = self->_stageFrame.size.width;
        double height = self->_stageFrame.size.height;
        goto LABEL_11;
      case 1uLL:
        id v13 = objc_alloc((Class)TSDLayoutGeometry);
        [(THWReviewLayout *)self controlsFrame];
        goto LABEL_9;
      case 2uLL:
        id v14 = objc_alloc((Class)TSDLayoutGeometry);
        double v15 = (double)(unint64_t)[v6 index];
        p_stageFrame = &self->_stageFrame;
        double x = CGRectGetWidth(*p_stageFrame) * v15;
        double width = p_stageFrame->size.width;
        double height = p_stageFrame->size.height;
        double y = 0.0;
        id v7 = v14;
        goto LABEL_11;
      case 3uLL:
      case 5uLL:
        id v7 = objc_alloc((Class)TSDLayoutGeometry);
        double width = self->_stageFrame.size.width;
        double height = self->_stageFrame.size.height;
        double x = 0.0;
        double y = 0.0;
        goto LABEL_11;
      default:
        return 0;
    }
  }
  if (self->_summaryLayout != a3) {
    return 0;
  }
  id v13 = objc_alloc((Class)TSDLayoutGeometry);
  TSDRectWithSize();
LABEL_9:
  id v7 = v13;
LABEL_11:
  id v17 = [v7 initWithFrame:x, y, width, height];

  return v17;
}

- (BOOL)reviewSummaryShouldShowResults
{
  return [(THWReviewLayout *)self p_haveAnswersBeenCheckedForAllQuestions];
}

- (unint64_t)reviewSummaryQuestionCount
{
  id v2 = [[self info] questions];

  return (unint64_t)[v2 count];
}

- (unint64_t)reviewSummaryCorrectCount
{
  return [(THWReviewLayout *)self p_countCorrectAnswers];
}

- (id)p_paragraphStyleWithSize:(double)a3 bold:(BOOL)a4 indent:(double)a5
{
  BOOL v6 = a4;
  id v9 = objc_alloc_init((Class)TSSPropertyMap);
  [v9 setBoolValue:v6 forProperty:19];
  *(float *)&double v10 = a3;
  [v9 setFloatValue:17 forProperty:v10];
  [v9 setIntValue:2 forProperty:86];
  *(float *)&a5 = a5;
  LODWORD(v11) = LODWORD(a5);
  [v9 setFloatValue:81 forProperty:v11];
  LODWORD(v12) = LODWORD(a5);
  [v9 setFloatValue:80 forProperty:v12];
  [v9 setIntValue:0 forProperty:21];
  [v9 setIntValue:0 forProperty:22];
  [v9 setObject:[TSWPLineSpacing lineSpacing] forProperty:85];
  id v13 = [[self info] questionNumberStyle];
  id v14 = objc_msgSend(objc_msgSend(v13, "stylesheet"), "variationOfStyle:propertyMap:", v13, v9);

  return v14;
}

- (id)reviewSummaryResultsParagraphStyle
{
  return [(THWReviewLayout *)self p_paragraphStyleWithSize:1 bold:28.0 indent:0.0];
}

- (id)reviewSummaryCheckingParagraphStyleWithIndent:(double)a3
{
  return [(THWReviewLayout *)self p_paragraphStyleWithSize:0 bold:24.0 indent:a3];
}

- (id)reviewSummaryInstructionalParagraphStyle
{
  return [(THWReviewLayout *)self p_paragraphStyleWithSize:0 bold:21.0 indent:0.0];
}

- (id)reviewSummaryTitleParagraphStyle
{
  return [(THWReviewLayout *)self p_paragraphStyleWithSize:1 bold:14.0 indent:0.0];
}

- (id)reviewSummaryContext
{
  id v2 = [(THWReviewLayout *)self info];

  return [v2 context];
}

- (double)p_margin
{
  id v2 = [(THWReviewLayout *)self info];

  [v2 contentPadding];
  return result;
}

- (BOOL)p_useCompactPadding
{
  if (![(THWReviewLayout *)self isExpanded]
    || !objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "isCompactWidth"))
  {
    return 0;
  }
  id v3 = [(THWReviewLayout *)self layoutController];

  return [v3 isCompactHeight];
}

- (id)p_questionAtPageIndex:(unint64_t)a3
{
  id v4 = [(THWReviewLayout *)self info];

  return [v4 questionAtIndex:a3];
}

- (void)p_updatePageLayouts
{
  id v3 = [(THWReviewLayout *)self numberOfStagePages];
  if ((void *)[(NSArray *)self->_stagePages count] != v3)
  {

    self->_stagePages = 0;
    self->_scrollableCanvasLayouts = 0;

    self->_questionStackedContainers = 0;
    if (v3)
    {
      id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v3];
      id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v3];
      id v15 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v3];
      id v6 = [[-[THWReviewLayout info](self, "info") questions] count];
      if (v6)
      {
        unint64_t v7 = (unint64_t)v6;
        for (uint64_t i = 0; i != v7; ++i)
        {
          id v9 = [[THWControlContainer alloc] initWithDelegate:self];
          [(THWControlContainer *)v9 setTag:2];
          [(THWControlContainer *)v9 setIndex:i];
          [v4 addObject:v9];

          double v10 = objc_alloc_init(THWScrollableCanvasControlLayout);
          [(THWControlLayout *)v10 setTag:3];
          [(THWControlLayout *)v10 setIndex:i];
          [v5 addObject:v10];

          double v11 = [[THWStackedControlContainer alloc] initWithDelegate:self];
          [(THWControlContainer *)v11 setTag:4];
          [(THWControlContainer *)v11 setIndex:i];
          [v15 addObject:v11];
        }
        if (v7 > 1)
        {
          double v12 = [[THWControlContainer alloc] initWithDelegate:self];
          [(THWControlContainer *)v12 setTag:2];
          [(THWControlContainer *)v12 setIndex:v7];
          [v4 addObject:v12];

          id v13 = objc_alloc_init(THWScrollableCanvasControlLayout);
          [(THWControlLayout *)v13 setTag:3];
          [(THWControlLayout *)v13 setIndex:v7];
          [v5 addObject:v13];

          id v14 = [[THWControlContainer alloc] initWithDelegate:self];
          [(THWControlContainer *)v14 setTag:5];
          [v15 addObject:v14];
        }
      }
      self->_stagePages = (NSArray *)[v4 copy];
      self->_scrollableCanvasLayouts = (NSArray *)[v5 copy];
      self->_questionStackedContainers = (NSArray *)[v15 copy];
    }
  }
}

- (id)questionNumberStorageAtPageIndex:(unint64_t)a3
{
  id v5 = [(THWReviewLayout *)self info];
  id v6 = [[v5 questions] count];
  if ((uint64_t)v6 < 2) {
    return 0;
  }
  id v7 = v6;
  id v8 = +[NSNumber numberWithUnsignedInteger:a3];
  id v9 = (THWPStorage *)[(NSMutableDictionary *)self->_questionNumberStorages objectForKey:v8];
  if (!v9)
  {
    if (!self->_questionNumberStorages) {
      self->_questionNumberStorages = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    }
    double v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", [(id)THBundle() localizedStringForKey:@"Question %lu of %lu" value:&stru_46D7E8 table:0], a3 + 1, v7);
    id v11 = [v5 questionNumberStyle];
    id v12 = [v5 context];
    id v13 = [objc_alloc((Class)TSSStylesheet) initWithContext:v12];
    id v9 = [[THWPStorage alloc] initWithContext:v12 string:v10 kind:3 stylesheet:v13 paragraphStyle:v11 listStyle:+[TSWPListStyle defaultStyleWithContext:v12] section:0 columnStyle:0];

    [(NSMutableDictionary *)self->_questionNumberStorages setObject:v9 forKey:v8];
  }
  return v9;
}

- (id)summaryTitleStorage
{
  id result = self->_summaryTitleStorage;
  if (!result)
  {
    id result = -[THWReviewSummaryLayout storageWithStyle:string:](-[THWReviewLayout summaryLayout](self, "summaryLayout"), "storageWithStyle:string:", -[THWReviewSummaryLayoutDelegate reviewSummaryTitleParagraphStyle](-[THWReviewSummaryLayout delegate](-[THWReviewLayout summaryLayout](self, "summaryLayout"), "delegate"), "reviewSummaryTitleParagraphStyle"), [(id)THBundle() localizedStringForKey:@"Summary" value:&stru_46D7E8 table:0]);
    self->_summaryTitleStorage = (TSWPStorage *)result;
  }
  return result;
}

- (id)p_questionLayoutForPageIndex:(unint64_t)a3
{
  questionLayouts = self->_questionLayouts;
  if (questionLayouts)
  {
    id v6 = [(TSUIntegerKeyDictionary *)questionLayouts objectForKey:a3];
    if (v6) {
      return v6;
    }
  }
  else
  {
    self->_questionLayouts = (TSUIntegerKeyDictionary *)objc_alloc_init((Class)TSUIntegerKeyDictionary);
  }
  id v7 = [(THWReviewLayout *)self p_questionAtPageIndex:a3];
  id v8 = (objc_class *)[v7 layoutClass];
  if (!v8) {
    return 0;
  }
  id v6 = [[v8 alloc] initWithQuestion:v7 index:a3 delegate:self];
  if (v6) {
    [(TSUIntegerKeyDictionary *)self->_questionLayouts setObject:v6 forKey:a3];
  }
  return v6;
}

- (id)p_responseController
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "canvas"), "documentRoot");

  return (id)TSUDynamicCast();
}

- (id)p_dataController
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWReviewLayout layoutController](self, "layoutController"), "canvas"), "documentRoot");

  return (id)TSUDynamicCast();
}

- (unint64_t)p_countCorrectAnswers
{
  id v3 = [(THWReviewLayout *)self p_responseController];
  id v4 = [v3 newTemporateReviewResponseMOC];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [[self info:0] questions];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v3, "responseForQuestionID:temporaryMOC:", objc_msgSend(v11, "questionID"), v4), "userHasCheckedAnswer")&& objc_msgSend(v11, "evaluateAnswerWithResponseController:updateScore:choiceBlock:", v3, 0, 0) == 6)
        {
          ++v8;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)p_haveAnswersBeenCheckedForAllQuestions
{
  id v3 = [(THWReviewLayout *)self p_responseController];
  id v4 = [v3 newTemporateReviewResponseMOC];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [[self info] questions];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v3 responseForQuestionID:[v10 questionID] temporaryMOC:v4];
        if (objc_msgSend(objc_msgSend(v11, "answerState"), "hasUserSelected")
          && ([v11 userHasCheckedAnswer] & 1) == 0)
        {
          if ([v10 type] != 2) {
            goto LABEL_15;
          }
          objc_opt_class();
          [v11 answerState];
          id v12 = (void *)TSUDynamicCast();
          if (!v12)
          {
            [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWReviewLayout p_haveAnswersBeenCheckedForAllQuestions]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Review/THWReviewLayout.m") lineNumber:1125 description:@"invalid nil value for '%s'", "matchingAnswerState"];
LABEL_15:
            BOOL v14 = 0;
            goto LABEL_16;
          }
          id v13 = [v12 numSelectedTargets];
          if (v13 == objc_msgSend(objc_msgSend(v10, "choices"), "count")) {
            goto LABEL_15;
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_16:

  return v14;
}

- (unint64_t)p_initialQuestionIndex
{
  id v3 = [(THWReviewLayout *)self p_dataController];
  id v4 = [v3 newTemporaryReviewDataMOC];
  id v5 = [v3 reviewWidgetDataForWidgetID:[-[THWReviewLayout info](self, "info") reviewID] temporaryMOC:v4];
  if (v5)
  {
    id v6 = [v5 currentPage];
    if (v6 >= (id)[(THWReviewLayout *)self numberOfStagePages]) {
      unint64_t v7 = 0;
    }
    else {
      unint64_t v7 = (unint64_t)v6;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)p_dividerLayoutForPageIndex:(unint64_t)a3
{
  dividerLayouts = self->_dividerLayouts;
  if (dividerLayouts)
  {
    id v6 = (THWReviewDividerLayout *)[(TSUIntegerKeyDictionary *)dividerLayouts objectForKey:a3];
    if (v6) {
      return v6;
    }
  }
  else
  {
    self->_dividerLayouts = (TSUIntegerKeyDictionary *)objc_alloc_init((Class)TSUIntegerKeyDictionary);
  }
  id v6 = objc_alloc_init(THWReviewDividerLayout);
  if (v6) {
    [(TSUIntegerKeyDictionary *)self->_dividerLayouts setObject:v6 forKey:a3];
  }
  return v6;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (CGRect)stageFrame
{
  double x = self->_stageFrame.origin.x;
  double y = self->_stageFrame.origin.y;
  double width = self->_stageFrame.size.width;
  double height = self->_stageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)stageCornerRadius
{
  return self->_stageCornerRadius;
}

- (unint64_t)questionIndex
{
  return self->_questionIndex;
}

- (THWReviewSummaryLayout)summaryLayout
{
  return self->_summaryLayout;
}

- (THWReviewControlsLayout)controlsLayout
{
  return self->_controlsLayout;
}

- (NSArray)stagePages
{
  return self->_stagePages;
}

- (void)setStagePages:(id)a3
{
}

- (NSArray)scrollableCanvasLayouts
{
  return self->_scrollableCanvasLayouts;
}

- (void)setScrollableCanvasLayouts:(id)a3
{
}

- (NSArray)questionStackedContainers
{
  return self->_questionStackedContainers;
}

- (void)setQuestionStackedContainers:(id)a3
{
}

- (THWPagedCanvasControlLayout)stageCanvasLayout
{
  return self->_stageCanvasLayout;
}

- (TSUIntegerKeyDictionary)questionLayouts
{
  return self->_questionLayouts;
}

- (NSMutableDictionary)questionNumberStorages
{
  return self->_questionNumberStorages;
}

- (TSUIntegerKeyDictionary)dividerLayouts
{
  return self->_dividerLayouts;
}

@end