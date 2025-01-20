@interface UIPageControl
+ (BOOL)doesOverrideMethod:(SEL)a3 inBaseClass:(Class)a4;
+ (id)_visualProviderForPageControl:(id)a3;
- (BOOL)_allowsDiscreteInteraction;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth;
- (BOOL)_flickToEndGestureEnabled;
- (BOOL)_implementsCustomCurrentPageImagesOverride;
- (BOOL)_implementsCustomPageImagesOverride;
- (BOOL)_isVertical;
- (BOOL)_prefersTargetPageForDiscreteInteraction;
- (BOOL)allowsContinuousInteraction;
- (BOOL)canBecomeFocused;
- (BOOL)defersCurrentPageDisplay;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hidesForSinglePage;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (BOOL)shouldTrack;
- (CAColorMatrix)_activePageIndicatorVibrantColorMatrix;
- (CAColorMatrix)_pageIndicatorVibrantColorMatrix;
- (CGAffineTransform)_activeTransformForTouchedPage;
- (CGAffineTransform)_targetTransformForTouchedPage;
- (CGRect)_indicatorFrameForPage:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSInteger)currentPage;
- (NSInteger)numberOfPages;
- (UIColor)currentPageIndicatorTintColor;
- (UIColor)pageIndicatorTintColor;
- (UIImage)currentPageIndicatorImageForPage:(NSInteger)page;
- (UIImage)indicatorImageForPage:(NSInteger)page;
- (UIImage)preferredCurrentPageIndicatorImage;
- (UIImage)preferredIndicatorImage;
- (UIPageControl)initWithCoder:(id)a3;
- (UIPageControl)initWithFrame:(CGRect)a3;
- (UIPageControlBackgroundStyle)backgroundStyle;
- (UIPageControlDirection)direction;
- (UIPageControlInteractionState)interactionState;
- (UIPageControlProgress)progress;
- (UIView)_platterBackgroundView;
- (UIVisualEffect)_platterEffect;
- (double)_customHorizontalPadding;
- (double)_customIndicatorSpacing;
- (double)_customVerticalPadding;
- (double)_indicatorOpacity;
- (int64_t)_displayedPage;
- (int64_t)previousPage;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_emitValueChanged;
- (void)_invalidateIndicators;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_setActivePageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3;
- (void)_setActiveTransformForTouchedPage:(CGAffineTransform *)a3;
- (void)_setAllowsDiscreteInteraction:(BOOL)a3;
- (void)_setCurrentPage:(int64_t)a3;
- (void)_setCustomHorizontalPadding:(double)a3;
- (void)_setCustomIndicatorSpacing:(double)a3;
- (void)_setCustomVerticalPadding:(double)a3;
- (void)_setFlickToEndGestureEnabled:(BOOL)a3;
- (void)_setIndicatorOpacity:(double)a3;
- (void)_setPage:(int64_t)a3 interactionState:(int64_t)a4;
- (void)_setPageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3;
- (void)_setPlatterBackgroundView:(id)a3;
- (void)_setPlatterEffect:(id)a3;
- (void)_setPreferredNumberOfVisibleIndicators:(unint64_t)a3;
- (void)_setPrefersTargetPageForDiscreteInteraction:(BOOL)a3;
- (void)_setTargetTransformForTouchedPage:(CGAffineTransform *)a3;
- (void)_setVertical:(BOOL)a3;
- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3;
- (void)_updateCurrentPage:(int64_t)a3 updateDisplayImmediately:(BOOL)a4;
- (void)_updateCurrentPageDisplayWithForceUpdate:(BOOL)a3;
- (void)_updateCurrentPageProgress;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)encodeWithCoder:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setAllowsContinuousInteraction:(BOOL)allowsContinuousInteraction;
- (void)setBackgroundStyle:(UIPageControlBackgroundStyle)backgroundStyle;
- (void)setCurrentPage:(NSInteger)currentPage;
- (void)setCurrentPageIndicatorImage:(UIImage *)image forPage:(NSInteger)page;
- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor;
- (void)setDefersCurrentPageDisplay:(BOOL)defersCurrentPageDisplay;
- (void)setDirection:(UIPageControlDirection)direction;
- (void)setHidesForSinglePage:(BOOL)hidesForSinglePage;
- (void)setIndicatorImage:(UIImage *)image forPage:(NSInteger)page;
- (void)setNumberOfPages:(NSInteger)numberOfPages;
- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor;
- (void)setPreferredCurrentPageIndicatorImage:(UIImage *)preferredCurrentPageIndicatorImage;
- (void)setPreferredIndicatorImage:(UIImage *)preferredIndicatorImage;
- (void)setPreviousPage:(int64_t)a3;
- (void)setProgress:(UIPageControlProgress *)progress;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)updateCurrentPageDisplay;
@end

@implementation UIPageControl

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UIPageControl;
  [(UIView *)&v3 layoutSubviews];
  [(_UIPageControlVisualProvider *)self->_visualProvider layoutSubviews];
}

- (NSInteger)numberOfPages
{
  return self->_numberOfPages;
}

- (UIPageControlProgress)progress
{
  return self->_progress;
}

- (UIPageControlBackgroundStyle)backgroundStyle
{
  return self->_backgroundStyle;
}

- (double)_customHorizontalPadding
{
  return self->_horizontalPadding;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return (objc_opt_isKindOfClass() & 1) != 0 || (unint64_t)(self->_direction - 3) < 2;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return (unint64_t)(self->_direction - 5) < 0xFFFFFFFFFFFFFFFELL;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIPageControl;
  [(UIView *)&v4 setSemanticContentAttribute:a3];
  [(_UIPageControlVisualProvider *)self->_visualProvider didUpdateLayoutDirection];
}

- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIPageControl;
  -[UIView _traitCollectionDidChangeInternal:](&v5, sel__traitCollectionDidChangeInternal_);
  [(_UIPageControlVisualProvider *)self->_visualProvider traitCollectionDidChangeOnSubtree:a3->var0];
}

- (BOOL)allowsContinuousInteraction
{
  return (*(unsigned char *)&self->_pageControlFlags & 4) != 0
      && [(_UIPageControlVisualProvider *)self->_visualProvider supportsContinuousInteraction];
}

- (BOOL)_allowsDiscreteInteraction
{
  return (*(unsigned char *)&self->_pageControlFlags >> 3) & 1;
}

- (void)setNumberOfPages:(NSInteger)numberOfPages
{
  NSInteger v3 = numberOfPages & ~(numberOfPages >> 63);
  if (self->_numberOfPages == v3) {
    return;
  }
  self->_numberOfPages = v3;
  [(_UIPageControlVisualProvider *)self->_visualProvider didUpdateNumberOfPages];
  if ([(UIPageControl *)self currentPage] >= v3)
  {
    NSInteger v5 = v3 - 1;
    goto LABEL_6;
  }
  if ([(UIPageControl *)self currentPage] < 0)
  {
    NSInteger v5 = 0;
LABEL_6:
    [(UIPageControl *)self _updateCurrentPage:v5 updateDisplayImmediately:0];
  }
  [(UIPageControl *)self _updateCurrentPageDisplayWithForceUpdate:1];
  if ([(UIPageControl *)self hidesForSinglePage]) {
    [(UIView *)self setHidden:(unint64_t)v3 < 2];
  }
  [(UIView *)self setNeedsLayout];
}

- (NSInteger)currentPage
{
  return self->_currentPage;
}

- (void)_updateCurrentPageDisplayWithForceUpdate:(BOOL)a3
{
  if (a3 || [(UIPageControl *)self defersCurrentPageDisplay])
  {
    visualProvider = self->_visualProvider;
    [(_UIPageControlVisualProvider *)visualProvider updateDisplayedPageToCurrentPage];
  }
}

- (void)_setAllowsDiscreteInteraction:(BOOL)a3
{
  char pageControlFlags = (char)self->_pageControlFlags;
  if (((((pageControlFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 8;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char pageControlFlags = pageControlFlags & 0xF7 | v4;
    [(_UIPageControlVisualProvider *)self->_visualProvider didUpdateInteractionTypeAvailability];
  }
}

- (UIPageControlDirection)direction
{
  return self->_direction;
}

- (void)setAllowsContinuousInteraction:(BOOL)allowsContinuousInteraction
{
  char pageControlFlags = (char)self->_pageControlFlags;
  if (((((pageControlFlags & 4) == 0) ^ allowsContinuousInteraction) & 1) == 0)
  {
    if (allowsContinuousInteraction) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char pageControlFlags = pageControlFlags & 0xFB | v4;
    [(_UIPageControlVisualProvider *)self->_visualProvider didUpdateInteractionTypeAvailability];
  }
}

- (BOOL)hidesForSinglePage
{
  return *(unsigned char *)&self->_pageControlFlags & 1;
}

- (void)_setFlickToEndGestureEnabled:(BOOL)a3
{
  char pageControlFlags = (char)self->_pageControlFlags;
  if (((((pageControlFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 16;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char pageControlFlags = pageControlFlags & 0xEF | v4;
  }
}

- (BOOL)_prefersTargetPageForDiscreteInteraction
{
  return (*(unsigned char *)&self->_pageControlFlags >> 5) & 1;
}

- (UIPageControl)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIPageControl;
  NSInteger v3 = -[UIControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v4 = v3;
  if (v3)
  {
    v3->_currentPage = 0;
    [(UIView *)v3 setAutoresizingMask:2];
    uint64_t v5 = [(id)objc_opt_class() _visualProviderForPageControl:v4];
    visualProvider = v4->_visualProvider;
    v4->_visualProvider = (_UIPageControlVisualProvider *)v5;

    [(_UIPageControlVisualProvider *)v4->_visualProvider prepare];
  }
  return v4;
}

+ (id)_visualProviderForPageControl:(id)a3
{
  id v3 = a3;
  int v4 = dyld_program_sdk_at_least();
  uint64_t v5 = off_1E52D5958;
  if (!v4) {
    uint64_t v5 = off_1E52D5A60;
  }
  v6 = (void *)[objc_alloc(*v5) initWithPageControl:v3];

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[_UIPageControlVisualProvider sizeThatFits:](self->_visualProvider, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)_customVerticalPadding
{
  return self->_verticalPadding;
}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor
{
  uint64_t v5 = currentPageIndicatorTintColor;
  if (self->_currentPageIndicatorTintColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_currentPageIndicatorTintColor, currentPageIndicatorTintColor);
    [(_UIPageControlVisualProvider *)self->_visualProvider didUpdateCurrentPageIndicatorTintColor];
    [(UIView *)self setNeedsLayout];
    uint64_t v5 = v6;
  }
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor
{
  v6 = pageIndicatorTintColor;
  uint64_t v5 = [(UIPageControl *)self pageIndicatorTintColor];

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_pageIndicatorTintColor, pageIndicatorTintColor);
    [(_UIPageControlVisualProvider *)self->_visualProvider didUpdatePageIndicatorTintColor];
    [(UIView *)self setNeedsLayout];
  }
}

- (UIColor)pageIndicatorTintColor
{
  return self->_pageIndicatorTintColor;
}

- (UIColor)currentPageIndicatorTintColor
{
  return self->_currentPageIndicatorTintColor;
}

- (CGRect)_indicatorFrameForPage:(int64_t)a3
{
  [(_UIPageControlVisualProvider *)self->_visualProvider indicatorFrameForPage:a3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setCurrentPage:(NSInteger)currentPage
{
}

- (UIVisualEffect)_platterEffect
{
  return self->__platterEffect;
}

- (CGSize)intrinsicContentSize
{
  [(_UIPageControlVisualProvider *)self->_visualProvider intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_setCustomVerticalPadding:(double)a3
{
  self->_verticalPadding = a3;
  *(unsigned char *)&self->_custom |= 1u;
  [(_UIPageControlVisualProvider *)self->_visualProvider didUpdateCustomLayoutValues];
}

- (void)_setCustomHorizontalPadding:(double)a3
{
  self->_horizontalPadding = a3;
  *(unsigned char *)&self->_custom |= 2u;
  [(_UIPageControlVisualProvider *)self->_visualProvider didUpdateCustomLayoutValues];
}

- (CGSize)sizeForNumberOfPages:(NSInteger)pageCount
{
  if (pageCount < 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"-[UIPageControl sizeForNumberOfPages:] must not be called with a negative number"];
  }
  visualProvider = self->_visualProvider;
  [(_UIPageControlVisualProvider *)visualProvider sizeForNumberOfPages:pageCount];
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)_setCustomIndicatorSpacing:(double)a3
{
  self->_indicatorSpacing = a3;
  *(unsigned char *)&self->_custom |= 4u;
  [(_UIPageControlVisualProvider *)self->_visualProvider didUpdateCustomLayoutValues];
}

- (void)_updateCurrentPage:(int64_t)a3 updateDisplayImmediately:(BOOL)a4
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v5 = (uint64_t)fmax(fmin((double)a3, (double)(self->_numberOfPages - 1)), 0.0);
    int64_t currentPage = self->_currentPage;
    if (currentPage != v5)
    {
      BOOL v7 = a4;
      self->_previousPage = currentPage;
      self->_int64_t currentPage = v5;
      objc_super v8 = [(UIPageControl *)self progress];
      [v8 _didChangeCurrentPage];

      if (v7)
      {
        [(UIPageControl *)self _updateCurrentPageDisplayWithForceUpdate:1];
      }
    }
  }
}

- (void)_setPreferredNumberOfVisibleIndicators:(unint64_t)a3
{
  self->_preferredNumberOfVisibleIndicators = a3;
  [(_UIPageControlVisualProvider *)self->_visualProvider didUpdateCustomLayoutValues];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)UIPageControl;
  [(UIView *)&v3 didMoveToWindow];
  [(UIPageControlProgress *)self->_progress _pageControlDidMoveToWindow];
}

- (void)setIndicatorImage:(UIImage *)image forPage:(NSInteger)page
{
  objc_super v8 = image;
  if (page < 0 || [(UIPageControl *)self numberOfPages] <= page)
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIPageControl.m", 344, @"Page (%ld) must be within 0 and %ld.", page, -[UIPageControl numberOfPages](self, "numberOfPages"));
  }
  [(_UIPageControlVisualProvider *)self->_visualProvider setCustomIndicatorImage:v8 forPage:page];
}

- (void)setHidesForSinglePage:(BOOL)hidesForSinglePage
{
  char pageControlFlags = (char)self->_pageControlFlags;
  if (((((pageControlFlags & 1) == 0) ^ hidesForSinglePage) & 1) == 0)
  {
    BOOL v4 = hidesForSinglePage;
    *(unsigned char *)&self->_char pageControlFlags = pageControlFlags & 0xFE | hidesForSinglePage;
    if ([(UIPageControl *)self numberOfPages] <= 1)
    {
      [(UIView *)self setHidden:v4];
    }
  }
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

+ (BOOL)doesOverrideMethod:(SEL)a3 inBaseClass:(Class)a4
{
  IMP MethodImplementation = class_getMethodImplementation((Class)a1, a3);
  return MethodImplementation != class_getMethodImplementation(a4, a3);
}

- (BOOL)_implementsCustomPageImagesOverride
{
  double v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return [v2 doesOverrideMethod:sel__pageIndicatorImageForPage_ inBaseClass:v3];
}

- (BOOL)_implementsCustomCurrentPageImagesOverride
{
  double v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return [v2 doesOverrideMethod:sel__pageIndicatorCurrentImageForPage_ inBaseClass:v3];
}

- (UIPageControl)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIPageControl;
  int64_t v5 = [(UIControl *)&v12 initWithCoder:v4];
  double v6 = v5;
  if (v5)
  {
    v5->_int64_t currentPage = 0;
    uint64_t v7 = [(id)objc_opt_class() _visualProviderForPageControl:v5];
    visualProvider = v6->_visualProvider;
    v6->_visualProvider = (_UIPageControlVisualProvider *)v7;

    [(_UIPageControlVisualProvider *)v6->_visualProvider prepare];
    if ([v4 containsValueForKey:@"UINumberOfPages"]) {
      -[UIPageControl setNumberOfPages:](v6, "setNumberOfPages:", [v4 decodeIntegerForKey:@"UINumberOfPages"]);
    }
    if ([v4 containsValueForKey:@"UICurrentPage"]) {
      -[UIPageControl setCurrentPage:](v6, "setCurrentPage:", [v4 decodeIntegerForKey:@"UICurrentPage"]);
    }
    if ([v4 containsValueForKey:@"UIHideForSinglePage"]) {
      -[UIPageControl setHidesForSinglePage:](v6, "setHidesForSinglePage:", [v4 decodeBoolForKey:@"UIHideForSinglePage"]);
    }
    if ([v4 containsValueForKey:@"UIDefersCurrentPageDisplay"]) {
      -[UIPageControl setDefersCurrentPageDisplay:](v6, "setDefersCurrentPageDisplay:", [v4 decodeBoolForKey:@"UIDefersCurrentPageDisplay"]);
    }
    if ([v4 containsValueForKey:@"UICurrentPageIndicatorTintColor"])
    {
      v9 = [v4 decodeObjectForKey:@"UICurrentPageIndicatorTintColor"];
      [(UIPageControl *)v6 setCurrentPageIndicatorTintColor:v9];
    }
    if ([v4 containsValueForKey:@"UIPageIndicatorTintColor"])
    {
      v10 = [v4 decodeObjectForKey:@"UIPageIndicatorTintColor"];
      [(UIPageControl *)v6 setPageIndicatorTintColor:v10];
    }
  }

  return v6;
}

- (void)dealloc
{
  [(_UIPageControlVisualProvider *)self->_visualProvider teardownPageControl];
  v3.receiver = self;
  v3.super_class = (Class)UIPageControl;
  [(UIView *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIPageControl;
  [(UIControl *)&v9 encodeWithCoder:v4];
  if ([(UIPageControl *)self numberOfPages]) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UIPageControl numberOfPages](self, "numberOfPages"), @"UINumberOfPages");
  }
  if (([(UIPageControl *)self currentPage] & 0x8000000000000000) == 0) {
    objc_msgSend(v4, "encodeInteger:forKey:", -[UIPageControl currentPage](self, "currentPage"), @"UICurrentPage");
  }
  if ([(UIPageControl *)self hidesForSinglePage]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[UIPageControl hidesForSinglePage](self, "hidesForSinglePage"), @"UIHideForSinglePage");
  }
  int64_t v5 = [(UIPageControl *)self currentPageIndicatorTintColor];

  if (v5)
  {
    double v6 = [(UIPageControl *)self currentPageIndicatorTintColor];
    [v4 encodeObject:v6 forKey:@"UICurrentPageIndicatorTintColor"];
  }
  uint64_t v7 = [(UIPageControl *)self pageIndicatorTintColor];

  if (v7)
  {
    objc_super v8 = [(UIPageControl *)self pageIndicatorTintColor];
    [v4 encodeObject:v8 forKey:@"UIPageIndicatorTintColor"];
  }
}

- (void)_populateArchivedSubviews:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIPageControl;
  id v4 = a3;
  [(UIView *)&v5 _populateArchivedSubviews:v4];
  -[_UIPageControlVisualProvider pruneArchivedSubviews:](self->_visualProvider, "pruneArchivedSubviews:", v4, v5.receiver, v5.super_class);
}

- (BOOL)shouldTrack
{
  if ([(_UIPageControlVisualProvider *)self->_visualProvider shouldDisableTouchTracking]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIPageControl;
  return [(UIControl *)&v4 shouldTrack];
}

- (void)_setCurrentPage:(int64_t)a3
{
}

- (void)_setPage:(int64_t)a3 interactionState:(int64_t)a4
{
}

- (int64_t)_displayedPage
{
  return [(_UIPageControlVisualProvider *)self->_visualProvider displayedPage];
}

- (BOOL)defersCurrentPageDisplay
{
  return (*(unsigned char *)&self->_pageControlFlags >> 1) & 1;
}

- (void)setDefersCurrentPageDisplay:(BOOL)defersCurrentPageDisplay
{
  if (defersCurrentPageDisplay) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char pageControlFlags = *(unsigned char *)&self->_pageControlFlags & 0xFD | v3;
}

- (void)updateCurrentPageDisplay
{
}

- (void)setBackgroundStyle:(UIPageControlBackgroundStyle)backgroundStyle
{
  if (self->_backgroundStyle != backgroundStyle)
  {
    self->_backgroundStyle = backgroundStyle;
    [(_UIPageControlVisualProvider *)self->_visualProvider didUpdateBackgroundStyle];
  }
}

- (void)setDirection:(UIPageControlDirection)direction
{
  if (self->_direction != direction)
  {
    self->_direction = direction;
    [(_UIPageControlVisualProvider *)self->_visualProvider didUpdateLayoutDirection];
  }
}

- (UIPageControlInteractionState)interactionState
{
  return [(_UIPageControlVisualProvider *)self->_visualProvider interactionState];
}

- (UIImage)preferredIndicatorImage
{
  return [(_UIPageControlVisualProvider *)self->_visualProvider preferredIndicatorImage];
}

- (void)setPreferredIndicatorImage:(UIImage *)preferredIndicatorImage
{
}

- (UIImage)indicatorImageForPage:(NSInteger)page
{
  if (page < 0 || [(UIPageControl *)self numberOfPages] <= page)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIPageControl.m", 338, @"Page (%ld) must be within 0 and %ld.", page, -[UIPageControl numberOfPages](self, "numberOfPages"));
  }
  visualProvider = self->_visualProvider;
  return (UIImage *)[(_UIPageControlVisualProvider *)visualProvider customIndicatorImageForPage:page];
}

- (UIImage)preferredCurrentPageIndicatorImage
{
  return [(_UIPageControlVisualProvider *)self->_visualProvider preferredActiveIndicatorImage];
}

- (void)setPreferredCurrentPageIndicatorImage:(UIImage *)preferredCurrentPageIndicatorImage
{
}

- (UIImage)currentPageIndicatorImageForPage:(NSInteger)page
{
  if (page < 0 || [(UIPageControl *)self numberOfPages] <= page)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIPageControl.m", 362, @"Page (%ld) must be within 0 and %ld.", page, -[UIPageControl numberOfPages](self, "numberOfPages"));
  }
  visualProvider = self->_visualProvider;
  return (UIImage *)[(_UIPageControlVisualProvider *)visualProvider customActiveIndicatorImageForPage:page];
}

- (void)setCurrentPageIndicatorImage:(UIImage *)image forPage:(NSInteger)page
{
  objc_super v8 = image;
  if (page < 0 || [(UIPageControl *)self numberOfPages] <= page)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIPageControl.m", 368, @"Page (%ld) must be within 0 and %ld.", page, -[UIPageControl numberOfPages](self, "numberOfPages"));
  }
  [(_UIPageControlVisualProvider *)self->_visualProvider setCustomActiveIndicatorImage:v8 forPage:page];
}

- (void)setProgress:(UIPageControlProgress *)progress
{
  objc_super v5 = progress;
  if (dyld_program_sdk_at_least())
  {
    double v6 = [(UIPageControlProgress *)v5 pageControl];

    if (v6 != self)
    {
      uint64_t v7 = [(UIPageControlProgress *)v5 pageControl];
      [v7 setProgress:0];
    }
    [(UIPageControlProgress *)self->_progress setPageControl:0];
    [(UIPageControlProgress *)v5 setPageControl:self];
    objc_storeStrong((id *)&self->_progress, progress);
    [(_UIPageControlVisualProvider *)self->_visualProvider didUpdatePageProgress];
  }
  else
  {
    objc_super v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("PageControl", &setProgress____s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)objc_super v9 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "-[UIPageControl setProgress:] called with an invalid object. THIS IS A CLIENT BUG.", v9, 2u);
    }
  }
}

- (void)_updateCurrentPageProgress
{
}

- (BOOL)_flickToEndGestureEnabled
{
  return (*(unsigned char *)&self->_pageControlFlags & 0x30) == 16;
}

- (double)_customIndicatorSpacing
{
  return self->_indicatorSpacing;
}

- (void)_setVertical:(BOOL)a3
{
}

- (BOOL)_isVertical
{
  return self->_direction == 3;
}

- (double)_indicatorOpacity
{
  [(_UIPageControlVisualProvider *)self->_visualProvider indicatorOpacity];
  return result;
}

- (void)_setIndicatorOpacity:(double)a3
{
}

- (void)_setPlatterBackgroundView:(id)a3
{
  id v6 = a3;
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    objc_super v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIPageControl.m" lineNumber:549 description:@"This may only be used by SpringBoard."];
  }
  *(unsigned char *)&self->_custom = *(unsigned char *)&self->_custom & 0xF7 | (8 * (v6 != 0));
  [(_UIPageControlVisualProvider *)self->_visualProvider setBackgroundView:v6];
}

- (UIView)_platterBackgroundView
{
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"UIPageControl.m" lineNumber:556 description:@"This may only be used by SpringBoard."];
  }
  if ((*(unsigned char *)&self->_custom & 8) != 0)
  {
    objc_super v4 = [(_UIPageControlVisualProvider *)self->_visualProvider backgroundView];
  }
  else
  {
    objc_super v4 = 0;
  }
  return (UIView *)v4;
}

- (void)_setPrefersTargetPageForDiscreteInteraction:(BOOL)a3
{
  BOOL v3 = a3;
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIPageControl.m" lineNumber:567 description:@"This may only be used by SpringBoard."];
  }
  if (v3) {
    char v6 = 32;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_char pageControlFlags = *(unsigned char *)&self->_pageControlFlags & 0xDF | v6;
  visualProvider = self->_visualProvider;
  [(_UIPageControlVisualProvider *)visualProvider didUpdateInteractionTypeAvailability];
}

- (CGAffineTransform)_activeTransformForTouchedPage
{
  double result = (CGAffineTransform *)self->_visualProvider;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result activeTransformForTouchedPage];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)_setActiveTransformForTouchedPage:(CGAffineTransform *)a3
{
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIPageControl.m" lineNumber:579 description:@"This may only be used by SpringBoard."];
  }
  long long v6 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->tx;
  [(_UIPageControlVisualProvider *)self->_visualProvider setActiveTransformForTouchedPage:v8];
}

- (CGAffineTransform)_targetTransformForTouchedPage
{
  double result = (CGAffineTransform *)self->_visualProvider;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result targetTransformForTouchedPage];
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)_setTargetTransformForTouchedPage:(CGAffineTransform *)a3
{
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIPageControl.m" lineNumber:590 description:@"This may only be used by SpringBoard."];
  }
  long long v6 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->tx;
  [(_UIPageControlVisualProvider *)self->_visualProvider setTargetTransformForTouchedPage:v8];
}

- (CAColorMatrix)_pageIndicatorVibrantColorMatrix
{
  double result = (CAColorMatrix *)self->_visualProvider;
  if (result) {
    return (CAColorMatrix *)[(CAColorMatrix *)result pageIndicatorVibrantColorMatrix];
  }
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m42 = 0u;
  *(_OWORD *)&retstr->m15 = 0u;
  *(_OWORD *)&retstr->m24 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  return result;
}

- (void)_setPageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3
{
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIPageControl.m" lineNumber:601 description:@"This may only be used by SpringBoard."];
  }
  long long v6 = *(_OWORD *)&a3->m33;
  v9[2] = *(_OWORD *)&a3->m24;
  v9[3] = v6;
  v9[4] = *(_OWORD *)&a3->m42;
  long long v7 = *(_OWORD *)&a3->m15;
  v9[0] = *(_OWORD *)&a3->m11;
  v9[1] = v7;
  [(_UIPageControlVisualProvider *)self->_visualProvider setPageIndicatorVibrantColorMatrix:v9];
}

- (CAColorMatrix)_activePageIndicatorVibrantColorMatrix
{
  double result = (CAColorMatrix *)self->_visualProvider;
  if (result) {
    return (CAColorMatrix *)[(CAColorMatrix *)result activePageIndicatorVibrantColorMatrix];
  }
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m42 = 0u;
  *(_OWORD *)&retstr->m15 = 0u;
  *(_OWORD *)&retstr->m24 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  return result;
}

- (void)_setActivePageIndicatorVibrantColorMatrix:(CAColorMatrix *)a3
{
  if ((_UIApplicationProcessIsSpringBoard() & 1) == 0
    && (_UIApplicationProcessIsControlCenterHostApp() & 1) == 0
    && (_UIApplicationProcessIsUIKitester() & 1) == 0)
  {
    objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIPageControl.m" lineNumber:612 description:@"This may only be used by SpringBoard."];
  }
  long long v6 = *(_OWORD *)&a3->m33;
  v9[2] = *(_OWORD *)&a3->m24;
  v9[3] = v6;
  v9[4] = *(_OWORD *)&a3->m42;
  long long v7 = *(_OWORD *)&a3->m15;
  v9[0] = *(_OWORD *)&a3->m11;
  v9[1] = v7;
  [(_UIPageControlVisualProvider *)self->_visualProvider setActivePageIndicatorVibrantColorMatrix:v9];
}

- (void)_setPlatterEffect:(id)a3
{
  objc_storeStrong((id *)&self->__platterEffect, a3);
  id v5 = a3;
  [(_UIPageControlVisualProvider *)self->_visualProvider didUpdateBackgroundEffect];
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (void)_emitValueChanged
{
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIPageControl;
  id v6 = a3;
  [(UIControl *)&v7 endTrackingWithTouch:v6 withEvent:a4];
  -[_UIPageControlVisualProvider didEndTrackingWithTouch:](self->_visualProvider, "didEndTrackingWithTouch:", v6, v7.receiver, v7.super_class);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [v4 view];
  BOOL v6 = v5 == self
    || ![v4 _isGestureType:0]
    || [v4 numberOfTouchesRequired] != 1
    || [v4 numberOfTapsRequired] != 1;

  return v6;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (int64_t)previousPage
{
  return self->_previousPage;
}

- (void)setPreviousPage:(int64_t)a3
{
  self->_previousPage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__platterEffect, 0);
  objc_storeStrong((id *)&self->_currentPageIndicatorTintColor, 0);
  objc_storeStrong((id *)&self->_pageIndicatorTintColor, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_visualProvider, 0);
}

- (void)_invalidateIndicators
{
}

@end