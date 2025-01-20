@interface BKFlowingBookLayoutConfiguration
+ (BOOL)spreadPagesAllowedWithViewportSize:(CGSize)a3 fontSizeIndex:(int64_t)a4;
+ (id)_fontSizeCache;
- (BCSemanticLayoutOptions)options;
- (BKFlowingBookFontSizeConfiguration)fontSizeConfiguration;
- (BKFlowingBookLayoutConfiguration)initWithViewController:(id)a3;
- (BKFlowingBookLayoutConfiguration)initWithViewController:(id)a3 provider:(id)a4;
- (BOOL)_contentHasSpreadPages;
- (BOOL)_manageSafeAreaInsets;
- (BOOL)_shouldLayoutRectInsetContentRectBySafeAreaInsets;
- (BOOL)_useCompactStrings;
- (BOOL)allowsScrollMode;
- (BOOL)contentHasSpreadPages;
- (BOOL)disableContentSpreadPages;
- (BOOL)hasSpreadPages;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFlowingBookLayoutConfiguration:(id)a3;
- (BOOL)isScroll;
- (BOOL)noAutoHyphenation;
- (BOOL)noJustification;
- (BOOL)pageLabelOnLeft;
- (BOOL)showingTOC;
- (BOOL)tocHasSpreadPages;
- (BOOL)usePaginationLineGrid;
- (BOOL)wantTranslucentToolbars;
- (CGRect)bookCoverRect;
- (CGRect)bottomBackgoundBarFrame;
- (CGRect)bottomFullWidthToolbarFrame;
- (CGRect)bottomLeftToolbarFrame;
- (CGRect)bottomRightToolbarFrame;
- (CGRect)contentContainerFrame;
- (CGRect)footerFrame;
- (CGRect)headerFrame;
- (CGRect)hiddenBottomLeftToolbarFrame;
- (CGRect)hiddenBottomRightToolbarFrame;
- (CGRect)insetContentViewFromContentContainerFrame:(CGRect)a3 isPrimary:(BOOL)a4;
- (CGRect)insetTOCorCoverViewFromContentContainerFrame:(CGRect)a3;
- (CGRect)leftContentContainerFrameForTwoUp;
- (CGRect)rightContentContainerFrameForTwoUp;
- (CGRect)scrubberFrame;
- (CGRect)topLeftToolbarFrame;
- (CGRect)topRightToolbarFrame;
- (CGSize)__layoutSizeForSpreadPages:(BOOL)a3;
- (CGSize)contentLayoutSize;
- (CGSize)layoutSize;
- (ContentStyle)style;
- (NSString)lastPageInChapterString;
- (UIEdgeInsets)bookCoverEdgeInsets;
- (UIEdgeInsets)contentInsets;
- (UIEdgeInsets)upsellContentInsets;
- (double)_averageCharacterWidth;
- (double)_calculatedWidthOfFontFamily:(id)a3 size:(double)a4;
- (double)_calculatedWidthOfFontFamily:(id)a3 size:(double)a4 cache:(id)a5 key:(id)a6;
- (double)_charactersPerLineForContentWidth:(double)a3 columns:(unint64_t)a4;
- (double)_charactersPerLineForContentWidthRaw:(double)a3;
- (double)_contentWidthForAvailableWidth:(double)a3 columns:(unint64_t)a4;
- (double)_fontSizeAdjustmentForFontFamily:(id)a3;
- (double)_fontSizeWithCurrentStyle;
- (double)_gutterWidthWithSpreadPages:(BOOL)a3;
- (double)_scrubberFrameHorizontalOriginY;
- (double)_scrubberLength;
- (double)_semanticSideInsetWithSpreadPages:(BOOL)a3;
- (double)be_pageLength;
- (double)bookmarkHotspotDimension;
- (double)charactersPerLine;
- (double)compactFontSize;
- (double)fontSize;
- (double)footerToolbarHeight;
- (double)gutterWidth;
- (double)headerToolbarHeight;
- (double)lineHeightAll:(double)a3;
- (double)noteGlyphPadding;
- (double)noteSideLength;
- (double)overrideFontSize;
- (double)pageLabelVerticalOffset;
- (double)regularFontSize;
- (double)scrubberCalloutWidth;
- (double)scrubberHeight;
- (double)scrubberLeftRightInset;
- (double)scrubberVerticalInset;
- (double)scrubberWidth;
- (double)semanticSideInset;
- (double)snapshotArtificialGutterWidth;
- (double)toolbarButtonMargin;
- (id)_cacheKeyForFontFamily:(id)a3 size:(double)a4;
- (id)_sampleCorpus;
- (id)backToPageWithPageTitle:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)goToPageWithPageTitle:(id)a3;
- (id)pluralPagesLeftInChapterWithRemainingPageCount:(unint64_t)a3;
- (id)singularPagesLeftInChapterWithRemainingPageCount:(unint64_t)a3;
- (int64_t)scrubberStyle;
- (unint64_t)layout;
- (void)invalidate;
- (void)setDisableContentSpreadPages:(BOOL)a3;
- (void)setFontSizeConfiguration:(id)a3;
- (void)setLargeSizeFactor:(double)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setOptions:(id)a3;
- (void)setOverrideFontSize:(double)a3;
- (void)setShowingTOC:(BOOL)a3;
- (void)setStyle:(id)a3;
@end

@implementation BKFlowingBookLayoutConfiguration

- (BKFlowingBookLayoutConfiguration)initWithViewController:(id)a3
{
  return [(BKFlowingBookLayoutConfiguration *)self initWithViewController:a3 provider:0];
}

- (BKFlowingBookLayoutConfiguration)initWithViewController:(id)a3 provider:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[BKFlowingBookPlistConfigurationEnvironment alloc] initWithViewController:v7];
  [(BKFlowingBookPlistConfigurationEnvironment *)v8 setOverrideProvider:v6];

  v9 = [[BKFlowingBookFontSizeConfiguration alloc] initWithViewController:v7 configurationEnvironment:v8];
  [(BKFlowingBookPlistConfigurationEnvironment *)v8 setFontSizeConfiguration:v9];
  v10 = [(BKFlowingBookLayoutConfiguration *)self initWithViewController:v7 configurationEnvironment:v8];

  if (v10)
  {
    objc_storeStrong((id *)&v10->_fontSizeConfiguration, v9);
    uint64_t v11 = +[BCSemanticLayoutOptions current];
    options = v10->_options;
    v10->_options = (BCSemanticLayoutOptions *)v11;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)BKFlowingBookLayoutConfiguration;
  id v5 = -[BKFlowingBookLayoutConfiguration copyWithZone:](&v15, "copyWithZone:");
  if (v5)
  {
    [(BKFlowingBookLayoutConfiguration *)self overrideFontSize];
    *((void *)v5 + 4) = v6;
    *((void *)v5 + 3) = [(BKFlowingBookLayoutConfiguration *)self layout];
    *((unsigned char *)v5 + 17) = self->_contentHasSpreadPages;
    *((unsigned char *)v5 + 19) = self->_disableContentSpreadPages;
    *((unsigned char *)v5 + 18) = [(BKFlowingBookLayoutConfiguration *)self showingTOC];
    id v7 = [(BKFlowingBookLayoutConfiguration *)self style];
    id v8 = [v7 copyWithZone:a3];
    v9 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v8;

    objc_storeStrong((id *)v5 + 5, self->_options);
    id v10 = [(BKFlowingBookFontSizeConfiguration *)self->_fontSizeConfiguration copyWithZone:a3];
    uint64_t v11 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v10;

    objc_opt_class();
    v12 = [v5 environment];
    v13 = BUDynamicCast();

    [v13 setFontSizeConfiguration:self->_fontSizeConfiguration];
  }
  return v5;
}

- (BOOL)isEqualToFlowingBookLayoutConfiguration:(id)a3
{
  v4 = a3;
  id v5 = v4;
  if (self->_overrideFontSize == *((double *)v4 + 4)
    && self->_layout == v4[3]
    && self->_contentHasSpreadPages == *((unsigned __int8 *)v4 + 17)
    && self->_disableContentSpreadPages == *((unsigned __int8 *)v4 + 19)
    && self->_showingTOC == *((unsigned __int8 *)v4 + 18)
    && ((style = self->_style, style == (ContentStyle *)v5[1]) || -[ContentStyle isEqual:](style, "isEqual:")))
  {
    options = self->_options;
    if (options == (BCSemanticLayoutOptions *)v5[5]) {
      unsigned __int8 v8 = 1;
    }
    else {
      unsigned __int8 v8 = -[BCSemanticLayoutOptions isEqual:](options, "isEqual:");
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BKFlowingBookLayoutConfiguration *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v7.receiver = self,
          v7.super_class = (Class)BKFlowingBookLayoutConfiguration,
          [(BKFlowingBookLayoutConfiguration *)&v7 isEqual:v4]))
    {
      BOOL v5 = [(BKFlowingBookLayoutConfiguration *)self isEqualToFlowingBookLayoutConfiguration:v4];
    }
    else
    {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (void)invalidate
{
  v5.receiver = self;
  v5.super_class = (Class)BKFlowingBookLayoutConfiguration;
  [(BKFlowingBookLayoutConfiguration *)&v5 invalidate];
  v3 = +[NSUserDefaults standardUserDefaults];
  self->_useOldFontStepsAndSpacing = [v3 BOOLForKey:@"BKUseOldFontStepsAndSpacing"];

  [(BKFlowingBookLayoutConfiguration *)self fontSize];
  if (v4 > 0.0) {
    self->_contentHasSpreadPages = [(BKFlowingBookLayoutConfiguration *)self _contentHasSpreadPages];
  }
}

+ (id)_fontSizeCache
{
  if (qword_22B548 != -1) {
    dispatch_once(&qword_22B548, &stru_1DB788);
  }
  v2 = (void *)qword_22B540;

  return v2;
}

- (double)semanticSideInset
{
  BOOL v3 = [(BKFlowingBookLayoutConfiguration *)self contentHasSpreadPages];

  [(BKFlowingBookLayoutConfiguration *)self _semanticSideInsetWithSpreadPages:v3];
  return result;
}

- (double)_semanticSideInsetWithSpreadPages:(BOOL)a3
{
  BOOL v3 = a3;
  if ((char *)[(BKFlowingBookLayoutConfiguration *)self layout] == (char *)&dword_0 + 3) {
    return 0.0;
  }
  [(BKFlowingBookLayoutConfiguration *)self _gutterWidthWithSpreadPages:v3];
  double v7 = v6;
  if ((char *)[(BKFlowingBookLayoutConfiguration *)self layout] != (char *)&dword_0 + 2
    && [(BKFlowingBookLayoutConfiguration *)self _manageSafeAreaInsets])
  {
    unsigned __int8 v8 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v8 safeAreaInsets];
    double v10 = v9;
    double v12 = v11;

    if (v10 >= v12) {
      double v13 = v10;
    }
    else {
      double v13 = v12;
    }
    double v7 = v7 + v13;
  }
  return ceil(v7);
}

- (double)compactFontSize
{
  v2 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v2 size];
  double v4 = round(sqrt(v3 + -19.3649167) + 16.0);

  return v4;
}

- (double)regularFontSize
{
  v2 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v2 size];
  double v4 = round(sqrt(v3 + -28.8790582) + 20.0);

  return v4;
}

- (double)lineHeightAll:(double)a3
{
  return a3 * 1.4;
}

- (double)_fontSizeWithCurrentStyle
{
  [(BKFlowingBookLayoutConfiguration *)self fontSize];
  double v4 = fmax(v3, 0.1);
  if (v4 > 20.0) {
    double v4 = 20.0;
  }
  if (v3 <= 0.0) {
    double v5 = 1.0;
  }
  else {
    double v5 = v4;
  }
  [(BCSemanticLayoutOptions *)self->_options fontScale];
  return v6 * v5;
}

- (double)_averageCharacterWidth
{
  if ([(BKFlowingBookLayoutConfiguration *)self isScroll])
  {
    double v3 = +[BKFlowingBookLayoutConfiguration _fontSizeCache];
    double v4 = [(BKFlowingBookLayoutConfiguration *)self style];
    double v5 = [v4 fontFamily];

    id v6 = [v5 length];
    [(BKFlowingBookLayoutConfiguration *)self _fontSizeWithCurrentStyle];
    double v8 = v7;
    if (v6)
    {
      double v9 = +[NSString stringWithFormat:@"A:%@:%.2f", v5, *(void *)&v7];
      objc_opt_class();
      double v10 = [v3 objectForKeyedSubscript:v9];
      double v11 = BUDynamicCast();

      if (v11)
      {
        [v11 doubleValue];
        double v13 = v12;
      }
      else
      {
        objc_super v15 = [(BKFlowingBookLayoutConfiguration *)self style];
        v16 = [v15 fontFamily];
        [(BKFlowingBookLayoutConfiguration *)self _calculatedWidthOfFontFamily:v16 size:v3 cache:v9 key:v8];
        double v18 = v17;

        v19 = [(BKFlowingBookLayoutConfiguration *)self _sampleCorpus];
        double v13 = v18 / (double)(unint64_t)[v19 length];

        if (v13 <= 0.0)
        {
          v20 = +[BCSemanticLayoutOptions logger];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            sub_1376A8(v20);
          }

          double v13 = 6.0;
        }
        v21 = +[NSNumber numberWithDouble:v13];
        [v3 setObject:v21 forKeyedSubscript:v9];
      }
    }
    else
    {
      double v13 = v7 * 0.4;
    }

LABEL_16:
    return v13;
  }
  [(BKFlowingBookLayoutConfiguration *)self _fontSizeWithCurrentStyle];
  double v13 = v14 * 0.4;
  if (v14 * 0.4 <= 0.0)
  {
    double v3 = +[BCSemanticLayoutOptions logger];
    double v13 = 6.0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_1376A8(v3);
    }
    goto LABEL_16;
  }
  return v13;
}

- (double)_charactersPerLineForContentWidthRaw:(double)a3
{
  [(BKFlowingBookLayoutConfiguration *)self _averageCharacterWidth];
  return a3 / v4;
}

- (double)_contentWidthForAvailableWidth:(double)a3 columns:(unint64_t)a4
{
  [(BKFlowingBookLayoutConfiguration *)self _semanticSideInsetWithSpreadPages:a4 > 1];
  return a3 - v6 * (double)(a4 + 1);
}

- (double)_charactersPerLineForContentWidth:(double)a3 columns:(unint64_t)a4
{
  [(BKFlowingBookLayoutConfiguration *)self _contentWidthForAvailableWidth:a4 columns:a3];
  double v6 = v5;
  -[BKFlowingBookLayoutConfiguration _charactersPerLineForContentWidthRaw:](self, "_charactersPerLineForContentWidthRaw:");
  double v8 = v7;
  double v9 = [(BKFlowingBookLayoutConfiguration *)self style];

  if (v9)
  {
    double v10 = [(BKFlowingBookLayoutConfiguration *)self style];
    double v11 = [v10 fontFamily];
    [(BKFlowingBookLayoutConfiguration *)self _fontSizeAdjustmentForFontFamily:v11];
    double v8 = v8 * v12;
  }
  double v13 = +[BCSemanticLayoutOptions logger];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_1376EC(v13, v8, v6);
  }

  return v8;
}

- (double)charactersPerLine
{
  double v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v3 size];
  double v5 = v4;

  [(BKFlowingBookLayoutConfiguration *)self _charactersPerLineForContentWidth:1 columns:v5];
  return result;
}

- (double)noteGlyphPadding
{
  double v3 = 0.0;
  if (![(BKFlowingBookLayoutConfiguration *)self isScroll])
  {
    double v4 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v4 safeAreaInsets];
    double v3 = v5;
    double v7 = v6;

    if (v3 < v7) {
      double v3 = v7;
    }
  }
  [(BKFlowingBookLayoutConfiguration *)self semanticSideInset];
  double v9 = v8 - v3;
  [(BKFlowingBookLayoutConfiguration *)self noteSideLength];
  return floor((v9 - v10) * 0.5);
}

- (double)scrubberHeight
{
  [(BKFlowingBookLayoutConfiguration *)self _scrubberLength];
  return result;
}

- (double)_scrubberLength
{
  int64_t v3 = [(BKFlowingBookLayoutConfiguration *)self scrubberStyle];
  options = self->_options;
  if (v3 == 1)
  {
    [(BCSemanticLayoutOptions *)options scrollerScrubberHeight];
  }
  else
  {
    [(BCSemanticLayoutOptions *)options classicScrubberHeight];
    double v6 = v5;
    double v7 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v7 size];
    double v9 = v8;

    double result = fmax(v6, 44.0);
    if (v9 <= 800.0) {
      return v6;
    }
  }
  return result;
}

- (double)scrubberWidth
{
  if ((char *)[(BKFlowingBookLayoutConfiguration *)self scrubberStyle] == (char *)&dword_0 + 1)
  {
    [(BKFlowingBookLayoutConfiguration *)self _scrubberLength];
  }
  else
  {
    options = self->_options;
    [(BCSemanticLayoutOptions *)options scrubberWidth];
  }
  return result;
}

- (double)_scrubberFrameHorizontalOriginY
{
  int64_t v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [(BKFlowingBookLayoutConfiguration *)self scrubberHeight];
  double v5 = v4;
  [v3 size];
  double v7 = v6 - v5;
  [v3 safeAreaInsets];
  double v9 = v7 - v8;
  [(BKFlowingBookLayoutConfiguration *)self footerToolbarHeight];
  double v11 = v9 - v10;
  double v12 = [(BKFlowingBookLayoutConfiguration *)self environment];
  double v13 = [v12 overrideProvider];
  unsigned int v14 = [v13 isScrubberDisabled];

  if (v14)
  {
    double v11 = v5 + v11;
  }
  else
  {
    objc_super v15 = [(BKFlowingBookLayoutConfiguration *)self environment];
    if ([v15 isCompactHeight])
    {
    }
    else
    {
      v16 = [(BKFlowingBookLayoutConfiguration *)self environment];
      unsigned int v17 = [v16 isCompactWidth];

      if (!v17) {
        goto LABEL_9;
      }
    }
    double v18 = round(v5 * 0.5 + v11);
    if ((char *)[(BKFlowingBookLayoutConfiguration *)self layout] == (char *)&dword_0 + 3) {
      double v11 = v18 + -10.0;
    }
    else {
      double v11 = v18;
    }
  }
LABEL_9:

  return v11;
}

- (UIEdgeInsets)contentInsets
{
  int64_t v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  [(BKFlowingBookLayoutConfiguration *)self headerToolbarHeight];
  double v9 = v5 + v8;
  if ((char *)[(BKFlowingBookLayoutConfiguration *)self layout] == (char *)&dword_0 + 3)
  {
    [(BKFlowingBookLayoutConfiguration *)self noteSideLength];
    double v9 = v9 + v10;
  }
  if ((char *)[(BKFlowingBookLayoutConfiguration *)self layout] == (char *)&dword_0 + 2)
  {
    [(BKFlowingBookLayoutConfiguration *)self scrubberHeight];
    double v12 = v7 + v11;
    [(BKFlowingBookLayoutConfiguration *)self footerToolbarHeight];
    double v14 = v12 + v13;
  }
  else
  {
    [v3 size];
    double v16 = v15;
    [(BKFlowingBookLayoutConfiguration *)self _scrubberFrameHorizontalOriginY];
    double v14 = v16 - v17;
  }
  [(BKFlowingBookLayoutConfiguration *)self semanticSideInset];
  double v19 = v18;

  double v20 = v9;
  double v21 = v19;
  double v22 = v14;
  double v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (BOOL)_shouldLayoutRectInsetContentRectBySafeAreaInsets
{
  return 0;
}

- (CGRect)insetContentViewFromContentContainerFrame:(CGRect)a3 isPrimary:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(BKFlowingBookLayoutConfiguration *)self contentInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v17 size];
  double v19 = v18;

  if (width < v19)
  {
    [(BKFlowingBookLayoutConfiguration *)self gutterWidth];
    double v21 = v20 * 0.5;
    if (v4) {
      double v16 = v21;
    }
    else {
      double v12 = v21;
    }
  }
  double v22 = x + v12;
  double v23 = y + v10;
  double v24 = width - (v16 + v12);
  double v25 = height - (v10 + v14);
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (BOOL)pageLabelOnLeft
{
  int64_t v3 = +[UIApplication sharedApplication];
  BOOL v4 = [v3 userInterfaceLayoutDirection] != 0;

  return [(BKFlowingBookLayoutConfiguration *)self isScroll] ^ v4;
}

- (BOOL)tocHasSpreadPages
{
  if ((isPhone() & 1) != 0 || [(BKFlowingBookLayoutConfiguration *)self isScroll])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    BOOL v4 = [(BKFlowingBookLayoutConfiguration *)self environment];
    if ([v4 isLandscape])
    {
      double v5 = [(BKFlowingBookLayoutConfiguration *)self environment];
      unsigned int v3 = [v5 isCompactWidth] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)setDisableContentSpreadPages:(BOOL)a3
{
  self->_disableContentSpreadPages = a3;
  [(BKFlowingBookLayoutConfiguration *)self invalidate];
}

+ (BOOL)spreadPagesAllowedWithViewportSize:(CGSize)a3 fontSizeIndex:(int64_t)a4
{
  BOOL v4 = a3.width > 896.0;
  if (a3.height <= 500.0) {
    BOOL v4 = 0;
  }
  BOOL v5 = a4 < 2 && v4;
  if (a3.width <= a3.height) {
    return v5;
  }
  else {
    return v4;
  }
}

- (BOOL)_manageSafeAreaInsets
{
  return 1;
}

- (BOOL)_contentHasSpreadPages
{
  if ([(BKFlowingBookLayoutConfiguration *)self isScroll]) {
    return 0;
  }
  if ([(BKFlowingBookLayoutConfiguration *)self disableContentSpreadPages]) {
    return 0;
  }
  unsigned int v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  unsigned __int8 v4 = [v3 isCompactWidth];

  if (v4) {
    return 0;
  }
  double v6 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v6 size];
  double v8 = v7;

  [(BKFlowingBookLayoutConfiguration *)self _charactersPerLineForContentWidth:1 columns:v8];
  double v10 = v9;
  [(BCSemanticLayoutOptions *)self->_options minCPLForSpreadPages];
  return v10 >= v11;
}

- (BOOL)noJustification
{
  [(BKFlowingBookLayoutConfiguration *)self charactersPerLine];
  return v2 < 35.0;
}

- (BOOL)noAutoHyphenation
{
  [(BKFlowingBookLayoutConfiguration *)self charactersPerLine];
  return v2 > 75.0;
}

- (double)snapshotArtificialGutterWidth
{
  unsigned int v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v3 size];
  if (BCViewportSize() == 1)
  {
    unsigned __int8 v4 = [(BKFlowingBookLayoutConfiguration *)self environment];
    unsigned int v5 = [v4 isCompactHeight];

    double result = 22.0;
    if (v5) {
      return 27.0;
    }
  }
  else
  {

    return 22.0;
  }
  return result;
}

- (void)setLargeSizeFactor:(double)a3
{
  id v4 = [(BKFlowingBookLayoutConfiguration *)self bookEnvironment];
  [v4 setLargeSizeFactor:a3];
}

- (void)setLayout:(unint64_t)a3
{
  if (self->_layout != a3)
  {
    unsigned int v5 = [(BKFlowingBookLayoutConfiguration *)self allowsScrollMode];
    if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = a3;
    }
    if (v5) {
      uint64_t v6 = a3;
    }
    self->_layout = v6;
    BOOL v7 = [(BKFlowingBookLayoutConfiguration *)self isScroll];
    double v8 = [(BKFlowingBookLayoutConfiguration *)self bookEnvironment];
    [v8 setScroll:v7];

    [(BKFlowingBookLayoutConfiguration *)self invalidate];
  }
}

- (void)setOverrideFontSize:(double)a3
{
  if (vabdd_f64(self->_overrideFontSize, a3) > 0.00001)
  {
    self->_overrideFontSize = a3;
    unsigned int v5 = [(BKFlowingBookLayoutConfiguration *)self bookEnvironment];
    [v5 setFontSize:a3];

    [(BKFlowingBookLayoutConfiguration *)self invalidate];
  }
}

- (ContentStyle)style
{
  return self->_style;
}

- (id)_sampleCorpus
{
  return @"The quick brown fox jumped over the lazy dog. The sphinx of black the quartz judge my vow.";
}

- (double)_calculatedWidthOfFontFamily:(id)a3 size:(double)a4
{
  uint64_t v6 = (__CFString *)a3;
  if ([(__CFString *)v6 isEqualToString:@"ui-serif"])
  {
    CFStringRef v7 = @".AppleSystemUIFontSerif";
  }
  else
  {
    if (![(__CFString *)v6 isEqualToString:@"system-ui"]) {
      goto LABEL_6;
    }
    CFStringRef v7 = @".AppleSystemUIFont";
  }

  uint64_t v6 = (__CFString *)v7;
LABEL_6:
  double v8 = +[UIFont fontWithName:v6 size:a4];
  if (v8)
  {
    double v9 = [(BKFlowingBookLayoutConfiguration *)self _sampleCorpus];
    NSAttributedStringKey v22 = NSFontAttributeName;
    double v23 = v8;
    double v10 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    [v9 boundingRectWithSize:1 options:v10 attributes:0 context:1.79769313e308 1.79769313e308];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v24.origin.double x = v12;
    v24.origin.double y = v14;
    v24.size.double width = v16;
    v24.size.double height = v18;
    double Width = CGRectGetWidth(v24);
  }
  else
  {
    double v20 = +[BCSemanticLayoutOptions logger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_137774((uint64_t)v6, v20);
    }

    double Width = 0.0;
  }

  return Width;
}

- (id)_cacheKeyForFontFamily:(id)a3 size:(double)a4
{
  return +[NSString stringWithFormat:@"%@:%.2f", a3, *(void *)&a4];
}

- (double)_calculatedWidthOfFontFamily:(id)a3 size:(double)a4 cache:(id)a5 key:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_opt_class();
  double v13 = [v11 objectForKeyedSubscript:v10];
  CGFloat v14 = BUDynamicCast();

  if (v14)
  {
    [v14 doubleValue];
    double v16 = v15;
  }
  else
  {
    [(BKFlowingBookLayoutConfiguration *)self _calculatedWidthOfFontFamily:v10 size:a4];
    double v16 = v17;
    CGFloat v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v11 setObject:v18 forKeyedSubscript:v12];
  }
  return v16;
}

- (double)_fontSizeAdjustmentForFontFamily:(id)a3
{
  id v4 = a3;
  [(BKFlowingBookLayoutConfiguration *)self _fontSizeWithCurrentStyle];
  double v6 = v5;
  CFStringRef v7 = +[BKFlowingBookLayoutConfiguration _fontSizeCache];
  double v8 = [(BKFlowingBookLayoutConfiguration *)self _cacheKeyForFontFamily:v4 size:v6];
  objc_opt_class();
  double v9 = [v7 objectForKeyedSubscript:v8];
  id v10 = BUDynamicCast();

  if (v10)
  {
    [v10 doubleValue];
    double v12 = v11;
  }
  else
  {
    if ([v4 length])
    {
      double v13 = [(BKFlowingBookLayoutConfiguration *)self _cacheKeyForFontFamily:@".AppleSystemUIFontSerif" size:v6];
      [(BKFlowingBookLayoutConfiguration *)self _calculatedWidthOfFontFamily:@".AppleSystemUIFontSerif" size:v7 cache:v13 key:v6];
      double v15 = v14;
      [(BKFlowingBookLayoutConfiguration *)self _calculatedWidthOfFontFamily:v4 size:v6];
      double v17 = fabs(v16);
      BOOL v18 = fabs(v15) < 0.00000011920929 || v17 < 0.00000011920929;
      double v19 = v16 / v15;
      if (v18) {
        double v12 = 1.0;
      }
      else {
        double v12 = v19;
      }
    }
    else
    {
      double v12 = 1.0;
    }
    double v20 = +[BCSemanticLayoutOptions logger];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 138412802;
      id v24 = v4;
      __int16 v25 = 2048;
      double v26 = v6;
      __int16 v27 = 2048;
      double v28 = v12;
      _os_log_debug_impl(&dword_0, v20, OS_LOG_TYPE_DEBUG, "Font factor for [%@] at %.2f is %.2f", (uint8_t *)&v23, 0x20u);
    }

    double v21 = +[NSNumber numberWithDouble:v12];
    [v7 setObject:v21 forKeyedSubscript:v8];
  }
  return v12;
}

- (void)setStyle:(id)a3
{
  double v5 = (ContentStyle *)a3;
  p_style = &self->_style;
  if (self->_style != v5)
  {
    objc_storeStrong((id *)&self->_style, a3);
    [(ContentStyle *)v5 setOverrideProvider:self];
    CFStringRef v7 = +[BCSemanticLayoutOptions logger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = *p_style;
      int v9 = 138412290;
      id v10 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Style changed to:%@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (double)fontSize
{
  double overrideFontSize = self->_overrideFontSize;
  if (overrideFontSize <= 0.0)
  {
    [(ContentStyle *)self->_style fontSize];
    double v5 = v4;
    double v6 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v6 size];
    +[BKFlowingBookFontSizeConfiguration fontSizeFactorForViewportSize:useOldFontStepsAndSpacing:](BKFlowingBookFontSizeConfiguration, "fontSizeFactorForViewportSize:useOldFontStepsAndSpacing:", self->_useOldFontStepsAndSpacing);
    double overrideFontSize = v7 * v5;
  }
  return overrideFontSize;
}

- (id)description
{
  v18.receiver = self;
  v18.super_class = (Class)BKFlowingBookLayoutConfiguration;
  unsigned int v3 = [(BKFlowingBookLayoutConfiguration *)&v18 description];
  [(BKFlowingBookLayoutConfiguration *)self contentInsets];
  v17[0] = v4;
  v17[1] = v5;
  v17[2] = v6;
  v17[3] = v7;
  double v8 = +[NSValue valueWithBytes:v17 objCType:"{UIEdgeInsets=dddd}"];
  [(BKFlowingBookLayoutConfiguration *)self gutterWidth];
  int v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  id v10 = +[NSNumber numberWithBool:[(BKFlowingBookLayoutConfiguration *)self isScroll]];
  [(BKFlowingBookLayoutConfiguration *)self fontSize];
  double v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  if ([(BKFlowingBookLayoutConfiguration *)self contentHasSpreadPages]) {
    CFStringRef v12 = @"YES";
  }
  else {
    CFStringRef v12 = @"NO";
  }
  if ([(BKFlowingBookLayoutConfiguration *)self noJustification]) {
    CFStringRef v13 = @"YES";
  }
  else {
    CFStringRef v13 = @"NO";
  }
  if ([(BKFlowingBookLayoutConfiguration *)self noAutoHyphenation]) {
    CFStringRef v14 = @"YES";
  }
  else {
    CFStringRef v14 = @"NO";
  }
  double v15 = +[NSString stringWithFormat:@"%@\nBCFlowingBookLayoutConfiguration: contentInsets:%@ gutterWidth:%@ isScroll:%@ fontSize:%@ contentHasSpreadPages:%@ noJustification:%@ noAutoHyphenation:%@", v3, v8, v9, v10, v11, v12, v13, v14];

  return v15;
}

- (double)headerToolbarHeight
{
  double v2 = [(BKFlowingBookLayoutConfiguration *)self environment];
  unsigned int v3 = [v2 overrideProvider];
  [v3 topBarHeight];
  double v5 = v4;

  return v5;
}

- (double)noteSideLength
{
  return 32.0;
}

- (double)footerToolbarHeight
{
  double v2 = [(BKFlowingBookLayoutConfiguration *)self environment];
  unsigned int v3 = [v2 overrideProvider];
  [v3 bottomBarHeight];
  double v5 = v4;

  return v5;
}

- (double)scrubberLeftRightInset
{
  if ((char *)[(BKFlowingBookLayoutConfiguration *)self layout] == (char *)&dword_0 + 3)
  {
    [(BKFlowingBookLayoutConfiguration *)self toolbarButtonMargin];
  }
  else
  {
    [(BKFlowingBookLayoutConfiguration *)self contentInsets];
    return v4;
  }
  return result;
}

- (double)scrubberVerticalInset
{
  return 16.0;
}

- (double)toolbarButtonMargin
{
  return 20.0;
}

- (UIEdgeInsets)bookCoverEdgeInsets
{
  unsigned int v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  unsigned int v4 = [v3 isCompactHeight];

  double v5 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v5 statusBarHeight];
  double v7 = v6;
  [(BKFlowingBookLayoutConfiguration *)self headerToolbarHeight];
  double v9 = v8;
  [(BKFlowingBookLayoutConfiguration *)self footerToolbarHeight];
  double v11 = v10;

  if (v4) {
    double v12 = 18.0;
  }
  else {
    double v12 = 32.0;
  }
  double v13 = 82.0;
  if (v4) {
    double v13 = 38.0;
  }
  double v14 = v7 + v12 + v9;
  double v15 = v11 + v12;
  result.right = v15;
  result.bottom = v12;
  result.left = v14;
  result.top = v13;
  return result;
}

- (CGRect)contentContainerFrame
{
  unsigned int v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v3 size];
  double v5 = v4;
  double v6 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v6 size];
  double v8 = v7;

  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = v5;
  double v12 = v8;
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGRect)leftContentContainerFrameForTwoUp
{
  unsigned int v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v3 size];
  double v5 = v4 * 0.5;
  double v6 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v6 size];
  double v8 = v7;

  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = v5;
  double v12 = v8;
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGRect)rightContentContainerFrameForTwoUp
{
  if ([(BKFlowingBookLayoutConfiguration *)self hasSpreadPages])
  {
    unsigned int v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v3 size];
    double x = v4 * 0.5;
    double v6 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v6 size];
    double width = v7 * 0.5;
    double v9 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v9 size];
    CGFloat height = v10;

    double y = 0.0;
  }
  else
  {
    double x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v13 = x;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.double width = v14;
  result.origin.double y = y;
  result.origin.double x = v13;
  return result;
}

- (UIEdgeInsets)upsellContentInsets
{
  unsigned int v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;

  if ([(BKFlowingBookLayoutConfiguration *)self isScroll])
  {
    [(BKFlowingBookLayoutConfiguration *)self headerToolbarHeight];
    double v9 = v5 + v8;
    [(BKFlowingBookLayoutConfiguration *)self footerToolbarHeight];
    double v11 = v7 + v10;
    [(BKFlowingBookLayoutConfiguration *)self scrubberHeight];
    double v13 = v11 + v12 * 0.5;
    double v14 = 0.0;
    double v15 = 0.0;
    double v16 = v9;
  }
  else
  {
    [(BKFlowingBookLayoutConfiguration *)self contentInsets];
    _UIEdgeInsetsAdd(15);
  }
  result.right = v15;
  result.bottom = v13;
  result.left = v14;
  result.top = v16;
  return result;
}

- (double)gutterWidth
{
  BOOL v3 = [(BKFlowingBookLayoutConfiguration *)self contentHasSpreadPages];

  [(BKFlowingBookLayoutConfiguration *)self _gutterWidthWithSpreadPages:v3];
  return result;
}

- (double)_gutterWidthWithSpreadPages:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v5 size];
  double v7 = v6;

  [(BCSemanticLayoutOptions *)self->_options sideInsetFactor];
  double v9 = v7 * v8;
  if (v3)
  {
    double v10 = +[UIScreen mainScreen];
    [v10 scale];
    +[AEAnnotationMarker imageSizeForScale:](AEAnnotationMarker, "imageSizeForScale:");
    double v12 = v11;

    if (v12 + 6.0 >= v9 * 0.666666667) {
      double v9 = v12 + 6.0;
    }
    else {
      double v9 = v9 * 0.666666667;
    }
  }
  double v13 = ceil(v9);
  if ([(BKFlowingBookLayoutConfiguration *)self isScroll])
  {
    double v14 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v14 safeAreaInsetsAdjustingForNotch:0];
    double v16 = v15;
    double v18 = v17;

    if (v16 >= v18) {
      double v18 = v16;
    }
    [(BKFlowingBookLayoutConfiguration *)self _averageCharacterWidth];
    double v20 = v19;
    [(BCSemanticLayoutOptions *)self->_options minCPLForSpreadPages];
    double v22 = floor((v7 + v18 * -2.0 - v20 * (v21 + 5.0)) * 0.5);
    if (v13 < v22) {
      return v22;
    }
  }
  return v13;
}

- (CGRect)bookCoverRect
{
  if ([(BKFlowingBookLayoutConfiguration *)self configurationHasABookCover])
  {
    [(BKFlowingBookLayoutConfiguration *)self bookCoverEdgeInsets];
    CGFloat v4 = v3;
    [(BKFlowingBookLayoutConfiguration *)self bookCoverEdgeInsets];
    CGFloat v6 = v5;
    double v7 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v7 size];
    double v9 = v8 * 0.5;
    [(BKFlowingBookLayoutConfiguration *)self bookCoverEdgeInsets];
    CGFloat v11 = v9 + v10 * -2.0;
    double v12 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v12 size];
    double v14 = v13;
    [(BKFlowingBookLayoutConfiguration *)self bookCoverEdgeInsets];
    double v16 = v15;
    [(BKFlowingBookLayoutConfiguration *)self bookCoverEdgeInsets];
    v26.size.CGFloat height = v14 - (v16 + v17);
    v26.origin.CGFloat x = v4;
    v26.origin.CGFloat y = v6;
    v26.size.CGFloat width = v11;
    CGRect v27 = CGRectIntegral(v26);
    CGFloat x = v27.origin.x;
    CGFloat y = v27.origin.y;
    CGFloat width = v27.size.width;
    CGFloat height = v27.size.height;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v22 = x;
  double v23 = y;
  double v24 = width;
  double v25 = height;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)headerFrame
{
  double v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v3 safeAreaInsets];
  double v5 = v4;
  CGFloat v6 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v6 size];
  double v8 = v7;
  [(BKFlowingBookLayoutConfiguration *)self headerToolbarHeight];
  double v10 = v9;

  double v11 = 0.0;
  double v12 = v5;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)topLeftToolbarFrame
{
  if ([(BKFlowingBookLayoutConfiguration *)self configurationHasATopLeftToolbar])
  {
    [(BKFlowingBookLayoutConfiguration *)self headerFrame];
    CGFloat x = v3;
    CGFloat y = v5;
    CGFloat height = v7;
    [(BKFlowingBookLayoutConfiguration *)self headerFrame];
    double width = round(v9 * 0.5);
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v11 = x;
  double v12 = y;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.double width = width;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)topRightToolbarFrame
{
  [(BKFlowingBookLayoutConfiguration *)self headerFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  if ([(BKFlowingBookLayoutConfiguration *)self configurationHasATopLeftToolbar])
  {
    v15.origin.CGFloat x = v4;
    v15.origin.CGFloat y = v6;
    v15.size.double width = v8;
    v15.size.CGFloat height = v10;
    double v8 = round(CGRectGetWidth(v15) * 0.5);
    CGFloat v4 = v8;
  }
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.double width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)footerFrame
{
  double v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v3 safeAreaInsets];
  double v5 = v4;

  [(BKFlowingBookLayoutConfiguration *)self footerToolbarHeight];
  double v7 = v6;
  double v8 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v8 size];
  double v10 = v9;
  double v12 = v11;

  if (![(BKFlowingBookLayoutConfiguration *)self isScroll])
  {
    double v13 = [(BKFlowingBookLayoutConfiguration *)self environment];
    if ([v13 isCompactWidth])
    {
    }
    else
    {
      double v14 = [(BKFlowingBookLayoutConfiguration *)self environment];
      unsigned int v15 = [v14 isCompactHeight];

      if (!v15)
      {
        [(BKFlowingBookLayoutConfiguration *)self scrubberFrame];
        double v17 = (v12 + CGRectGetMidY(v21) - v7) * 0.5;
        goto LABEL_6;
      }
    }
  }
  [(BKFlowingBookLayoutConfiguration *)self footerToolbarHeight];
  double v17 = v12 - v16 - v5;
LABEL_6:
  double v18 = 0.0;
  double v19 = v10;
  double v20 = v7;
  result.size.CGFloat height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)bottomLeftToolbarFrame
{
  if ([(BKFlowingBookLayoutConfiguration *)self configurationHasABottomLeftToolbar])
  {
    [(BKFlowingBookLayoutConfiguration *)self footerFrame];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(BKFlowingBookLayoutConfiguration *)self contentInsets];
    double v12 = v11;
    [(BKFlowingBookLayoutConfiguration *)self toolbarButtonMargin];
    CGFloat v14 = v12 - v13;
    v23.origin.CGFloat x = v4;
    v23.origin.CGFloat y = v6;
    v23.size.double width = v8;
    v23.size.CGFloat height = v10;
    CGFloat v15 = CGRectGetWidth(v23) * 0.5 - v12;
    [(BKFlowingBookLayoutConfiguration *)self gutterWidth];
    CGFloat v17 = v15 - v16 * 0.5;
    [(BKFlowingBookLayoutConfiguration *)self toolbarButtonMargin];
    CGFloat v19 = v17 + v18 * 2.0;
    v24.origin.CGFloat x = v4;
    v24.origin.CGFloat y = v6;
    v24.size.double width = v8;
    v24.size.CGFloat height = v10;
    CGFloat Height = CGRectGetHeight(v24);
    v25.origin.CGFloat x = v4;
    v25.origin.CGFloat y = v6;
    v25.size.double width = v8;
    v25.size.CGFloat height = v10;
    CGFloat MinX = CGRectGetMinX(v25);
    v26.origin.CGFloat x = v4;
    v26.origin.CGFloat y = v6;
    v26.size.double width = v8;
    v26.size.CGFloat height = v10;
    CGFloat MinY = CGRectGetMinY(v26);
    v27.origin.CGFloat y = 0.0;
    v27.origin.CGFloat x = v14;
    v27.size.double width = v19;
    v27.size.CGFloat height = Height;
    CGRect v28 = CGRectOffset(v27, MinX, MinY);
    return CGRectIntegral(v28);
  }
  else
  {
    result.origin.CGFloat x = CGRectZero.origin.x;
    result.origin.CGFloat y = CGRectZero.origin.y;
    result.size.double width = CGRectZero.size.width;
    result.size.CGFloat height = CGRectZero.size.height;
  }
  return result;
}

- (CGRect)bottomRightToolbarFrame
{
  [(BKFlowingBookLayoutConfiguration *)self contentInsets];
  double v4 = v3;
  [(BKFlowingBookLayoutConfiguration *)self footerFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if ([(BKFlowingBookLayoutConfiguration *)self configurationHasABottomLeftToolbar])
  {
    [(BKFlowingBookLayoutConfiguration *)self footerFrame];
    double v14 = v13;
    [(BKFlowingBookLayoutConfiguration *)self gutterWidth];
    double v16 = (v15 + v14) * 0.5;
    [(BKFlowingBookLayoutConfiguration *)self toolbarButtonMargin];
    CGFloat v18 = v16 - v17;
    v25.origin.CGFloat x = v6;
    v25.origin.CGFloat y = v8;
    v25.size.double width = v10;
    v25.size.CGFloat height = v12;
    CGFloat MinY = CGRectGetMinY(v25);
    v26.origin.CGFloat x = v6;
    v26.origin.CGFloat y = v8;
    v26.size.double width = v10;
    v26.size.CGFloat height = v12;
    CGFloat v20 = CGRectGetWidth(v26) * 0.5 - v4;
    [(BKFlowingBookLayoutConfiguration *)self gutterWidth];
    CGFloat v22 = v20 - v21 * 0.5;
    [(BKFlowingBookLayoutConfiguration *)self toolbarButtonMargin];
    CGFloat v24 = v22 + v23 * 2.0;
    v27.origin.CGFloat x = v6;
    v27.origin.CGFloat y = v8;
    v27.size.double width = v10;
    v27.size.CGFloat height = v12;
    v28.size.CGFloat height = CGRectGetHeight(v27);
    v28.origin.CGFloat x = v18;
    v28.origin.CGFloat y = MinY;
    v28.size.double width = v24;
    return CGRectIntegral(v28);
  }
  else
  {
    [(BKFlowingBookLayoutConfiguration *)self bottomFullWidthToolbarFrame];
  }
  return result;
}

- (CGRect)bottomFullWidthToolbarFrame
{
  [(BKFlowingBookLayoutConfiguration *)self contentInsets];
  double v4 = v3;
  double v6 = v5;
  [(BKFlowingBookLayoutConfiguration *)self footerFrame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  if ([(BKFlowingBookLayoutConfiguration *)self isScroll])
  {
    v33.origin.CGFloat x = v8;
    v33.origin.CGFloat y = v10;
    v33.size.CGFloat width = v12;
    v33.size.CGFloat height = v14;
    CGFloat MinX = CGRectGetMinX(v33);
    v34.origin.CGFloat x = v8;
    v34.origin.CGFloat y = v10;
    v34.size.CGFloat width = v12;
    v34.size.CGFloat height = v14;
    CGFloat MinY = CGRectGetMinY(v34);
    double v17 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v17 size];
    CGFloat width = v18;
    v35.origin.CGFloat x = v8;
    v35.origin.CGFloat y = v10;
    v35.size.CGFloat width = v12;
    v35.size.CGFloat height = v14;
    CGFloat Height = CGRectGetHeight(v35);
  }
  else
  {
    [(BKFlowingBookLayoutConfiguration *)self toolbarButtonMargin];
    CGFloat v22 = v4 - v21;
    v36.origin.CGFloat x = v8;
    v36.origin.CGFloat y = v10;
    v36.size.CGFloat width = v12;
    v36.size.CGFloat height = v14;
    CGFloat v23 = CGRectGetWidth(v36) - v4 - v6;
    [(BKFlowingBookLayoutConfiguration *)self toolbarButtonMargin];
    CGFloat v25 = v23 + v24 * 2.0;
    v37.origin.CGFloat x = v8;
    v37.origin.CGFloat y = v10;
    v37.size.CGFloat width = v12;
    v37.size.CGFloat height = v14;
    CGFloat v26 = CGRectGetHeight(v37);
    v38.origin.CGFloat x = v8;
    v38.origin.CGFloat y = v10;
    v38.size.CGFloat width = v12;
    v38.size.CGFloat height = v14;
    CGFloat v27 = CGRectGetMinX(v38);
    v39.origin.CGFloat x = v8;
    v39.origin.CGFloat y = v10;
    v39.size.CGFloat width = v12;
    v39.size.CGFloat height = v14;
    CGFloat v28 = CGRectGetMinY(v39);
    v40.origin.CGFloat y = 0.0;
    v40.origin.CGFloat x = v22;
    v40.size.CGFloat width = v25;
    v40.size.CGFloat height = v26;
    CGRect v41 = CGRectOffset(v40, v27, v28);
    CGFloat MinX = v41.origin.x;
    CGFloat MinY = v41.origin.y;
    CGFloat width = v41.size.width;
    CGFloat Height = v41.size.height;
  }
  double v29 = MinX;
  double v30 = MinY;
  double v31 = width;
  double v32 = Height;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (CGRect)bottomBackgoundBarFrame
{
  [(BKFlowingBookLayoutConfiguration *)self footerFrame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v11 size];
  double v13 = v12;
  v19.origin.CGFloat x = v4;
  v19.origin.CGFloat y = v6;
  v19.size.CGFloat width = v8;
  v19.size.CGFloat height = v10;
  double v14 = v13 - CGRectGetMinY(v19);

  double v15 = v4;
  double v16 = v6;
  double v17 = v8;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)hiddenBottomLeftToolbarFrame
{
  [(BKFlowingBookLayoutConfiguration *)self bottomLeftToolbarFrame];
  CGFloat v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (![(BKFlowingBookLayoutConfiguration *)self isScroll])
  {
    v16.origin.CGFloat x = v4;
    v16.origin.CGFloat y = v6;
    v16.size.CGFloat width = v8;
    v16.size.CGFloat height = v10;
    if (!CGRectIsEmpty(v16))
    {
      [(BKFlowingBookLayoutConfiguration *)self scrubberHeight];
      double v6 = v6 + v11 * -0.5;
    }
  }
  double v12 = v4;
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)hiddenBottomRightToolbarFrame
{
  [(BKFlowingBookLayoutConfiguration *)self bottomRightToolbarFrame];
  CGFloat v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (![(BKFlowingBookLayoutConfiguration *)self isScroll])
  {
    v16.origin.CGFloat x = v4;
    v16.origin.CGFloat y = v6;
    v16.size.CGFloat width = v8;
    v16.size.CGFloat height = v10;
    if (!CGRectIsEmpty(v16))
    {
      [(BKFlowingBookLayoutConfiguration *)self scrubberHeight];
      double v6 = v6 + v11 * -0.5;
    }
  }
  double v12 = v4;
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (int64_t)scrubberStyle
{
  return 0;
}

- (CGRect)scrubberFrame
{
  double v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [(BKFlowingBookLayoutConfiguration *)self _scrubberFrameHorizontalOriginY];
  [(BKFlowingBookLayoutConfiguration *)self layout];
  [(BKFlowingBookLayoutConfiguration *)self headerToolbarHeight];
  [(BKFlowingBookLayoutConfiguration *)self footerToolbarHeight];
  [(BKFlowingBookLayoutConfiguration *)self scrubberLeftRightInset];
  [(BKFlowingBookLayoutConfiguration *)self scrubberVerticalInset];
  [(BKFlowingBookLayoutConfiguration *)self scrubberWidth];
  [(BKFlowingBookLayoutConfiguration *)self scrubberHeight];
  BKScrubberFrame();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (double)scrubberCalloutWidth
{
  double v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  unsigned int v4 = [v3 isCompactWidth];

  if (!v4) {
    return 403.0;
  }
  if ([(BKFlowingBookLayoutConfiguration *)self isScroll])
  {
    double v5 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v5 size];
    double v7 = v6 + -60.0;
    double v8 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v8 safeAreaInsets];
    double v10 = v7 - v9;
    double v11 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v11 safeAreaInsets];
    double v13 = v10 - v12;
  }
  else
  {
    [(BKFlowingBookLayoutConfiguration *)self scrubberFrame];
    return v14;
  }
  return v13;
}

- (double)bookmarkHotspotDimension
{
  return 66.0;
}

- (BOOL)wantTranslucentToolbars
{
  return (char *)[(BKFlowingBookLayoutConfiguration *)self layout] == (char *)&dword_0 + 2;
}

- (BOOL)_useCompactStrings
{
  double v3 = [(BKFlowingBookLayoutConfiguration *)self environment];
  if ([v3 isCompactWidth])
  {

LABEL_8:
    LOBYTE(v7) = 1;
    return v7;
  }
  [(BKFlowingBookLayoutConfiguration *)self contentLayoutSize];
  double v5 = v4;
  double v6 = kIMConfigurationSize_megaPhone;

  if (v5 <= v6) {
    goto LABEL_8;
  }
  int v7 = isPhone();
  if (v7)
  {
    LOBYTE(v7) = [(BKFlowingBookLayoutConfiguration *)self contentHasSpreadPages];
  }
  return v7;
}

- (NSString)lastPageInChapterString
{
  unsigned int v2 = [(BKFlowingBookLayoutConfiguration *)self _useCompactStrings];
  double v3 = AEBundle();
  double v4 = v3;
  if (v2) {
    CFStringRef v5 = @"Last page";
  }
  else {
    CFStringRef v5 = @"Last page in this chapter";
  }
  double v6 = [v3 localizedStringForKey:v5 value:&stru_1DF0D8 table:0];

  return (NSString *)v6;
}

- (id)singularPagesLeftInChapterWithRemainingPageCount:(unint64_t)a3
{
  double v4 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:a3 usesGroupingSeparator:0];
  LODWORD(self) = [(BKFlowingBookLayoutConfiguration *)self _useCompactStrings];
  CFStringRef v5 = AEBundle();
  double v6 = v5;
  if (self) {
    CFStringRef v7 = @"%@ page left";
  }
  else {
    CFStringRef v7 = @"%@ page left in this chapter";
  }
  double v8 = [v5 localizedStringForKey:v7 value:&stru_1DF0D8 table:0];

  double v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4);

  return v9;
}

- (id)pluralPagesLeftInChapterWithRemainingPageCount:(unint64_t)a3
{
  double v4 = +[NSNumberFormatter imaxLocalizedUnsignedInteger:a3 usesGroupingSeparator:0];
  LODWORD(self) = [(BKFlowingBookLayoutConfiguration *)self _useCompactStrings];
  CFStringRef v5 = AEBundle();
  double v6 = v5;
  if (self) {
    CFStringRef v7 = @"%@ pages left";
  }
  else {
    CFStringRef v7 = @"%@ pages left in this chapter";
  }
  double v8 = [v5 localizedStringForKey:v7 value:&stru_1DF0D8 table:0];

  double v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4);

  return v9;
}

- (id)backToPageWithPageTitle:(id)a3
{
  id v4 = a3;
  LODWORD(self) = [(BKFlowingBookLayoutConfiguration *)self _useCompactStrings];
  CFStringRef v5 = AEBundle();
  double v6 = v5;
  if (self) {
    CFStringRef v7 = @"Back to p.%@";
  }
  else {
    CFStringRef v7 = @"Back to page %@";
  }
  double v8 = [v5 localizedStringForKey:v7 value:&stru_1DF0D8 table:0];

  double v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4);

  return v9;
}

- (id)goToPageWithPageTitle:(id)a3
{
  id v4 = a3;
  LODWORD(self) = [(BKFlowingBookLayoutConfiguration *)self _useCompactStrings];
  CFStringRef v5 = AEBundle();
  double v6 = v5;
  if (self) {
    CFStringRef v7 = @"Go to p.%@";
  }
  else {
    CFStringRef v7 = @"Go to page %@";
  }
  double v8 = [v5 localizedStringForKey:v7 value:&stru_1DF0D8 table:0];

  double v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v4);

  return v9;
}

- (double)pageLabelVerticalOffset
{
  return 18.0;
}

- (BOOL)hasSpreadPages
{
  if ([(BKFlowingBookLayoutConfiguration *)self showingTOC])
  {
    return [(BKFlowingBookLayoutConfiguration *)self tocHasSpreadPages];
  }
  else
  {
    return [(BKFlowingBookLayoutConfiguration *)self contentHasSpreadPages];
  }
}

- (BOOL)allowsScrollMode
{
  return 1;
}

- (BOOL)isScroll
{
  return [(BKFlowingBookLayoutConfiguration *)self allowsScrollMode]
      && ((char *)[(BKFlowingBookLayoutConfiguration *)self layout] == (char *)&dword_0 + 2
       || (char *)[(BKFlowingBookLayoutConfiguration *)self layout] == (char *)&dword_0 + 3);
}

- (BOOL)usePaginationLineGrid
{
  unsigned int v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"BKEpubPaginationLineGridEnabled"];

  return v3;
}

- (CGSize)__layoutSizeForSpreadPages:(BOOL)a3
{
  BOOL v3 = a3;
  [(BKFlowingBookLayoutConfiguration *)self contentContainerFrame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(BKFlowingBookLayoutConfiguration *)self contentInsets];
  double v14 = v6 + v13;
  double v16 = v8 + v15;
  double v18 = v10 - (v13 + v17);
  double Height = v12 - (v15 + v19);
  if ([(BKFlowingBookLayoutConfiguration *)self _shouldLayoutRectInsetContentRectBySafeAreaInsets])
  {
    double v21 = [(BKFlowingBookLayoutConfiguration *)self environment];
    [v21 safeAreaInsets];
    double v14 = v14 + v22;
    double v16 = v16 + v23;
    double v18 = v18 - (v22 + v24);
    double Height = Height - (v23 + v25);
  }
  if (v3)
  {
    v32.origin.CGFloat x = v14;
    v32.origin.CGFloat y = v16;
    v32.size.CGFloat width = v18;
    v32.size.CGFloat height = Height;
    double Width = CGRectGetWidth(v32);
    [(BKFlowingBookLayoutConfiguration *)self gutterWidth];
    double v28 = round((Width - v27) * 0.5);
    v33.origin.CGFloat x = v14;
    v33.origin.CGFloat y = v16;
    v33.size.CGFloat width = v18;
    v33.size.CGFloat height = Height;
    double Height = CGRectGetHeight(v33);
    double v18 = v28;
  }
  double v29 = v18;
  double v30 = Height;
  result.CGFloat height = v30;
  result.CGFloat width = v29;
  return result;
}

- (CGSize)layoutSize
{
  BOOL v3 = [(BKFlowingBookLayoutConfiguration *)self hasSpreadPages];

  [(BKFlowingBookLayoutConfiguration *)self __layoutSizeForSpreadPages:v3];
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- (CGSize)contentLayoutSize
{
  [(BKFlowingBookLayoutConfiguration *)self __layoutSizeForSpreadPages:[(BKFlowingBookLayoutConfiguration *)self contentHasSpreadPages]];
  CGFloat v5 = v3;
  CGFloat v6 = v4;
  if (*(double *)&qword_22B550 != v3 || *(double *)&qword_22B558 != v4)
  {
    qword_22B550 = *(void *)&v3;
    qword_22B558 = *(void *)&v4;
    double v8 = BKSemanticLayoutInternalLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v16.CGFloat width = v5;
      v16.CGFloat height = v6;
      double v9 = NSStringFromCGSize(v16);
      int v12 = 138412546;
      double v13 = v9;
      __int16 v14 = 2112;
      double v15 = self;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "contentLayoutSize: %@. %@", (uint8_t *)&v12, 0x16u);
    }
  }
  double v10 = v5;
  double v11 = v6;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (CGRect)insetTOCorCoverViewFromContentContainerFrame:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(BKFlowingBookLayoutConfiguration *)self environment];
  [v8 safeAreaInsets];
  double v10 = v9;
  double v12 = v11;

  [(BKFlowingBookLayoutConfiguration *)self headerToolbarHeight];
  double v14 = v10 + v13;
  [(BKFlowingBookLayoutConfiguration *)self footerToolbarHeight];
  double v16 = v12 + v15;
  double v17 = x + 0.0;
  double v18 = y + v14;
  double v19 = height - (v14 + v16);
  double v20 = width;
  result.size.double height = v19;
  result.size.CGFloat width = v20;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (double)overrideFontSize
{
  return self->_overrideFontSize;
}

- (BOOL)showingTOC
{
  return self->_showingTOC;
}

- (void)setShowingTOC:(BOOL)a3
{
  self->_showingTOC = a3;
}

- (BOOL)disableContentSpreadPages
{
  return self->_disableContentSpreadPages;
}

- (BOOL)contentHasSpreadPages
{
  return self->_contentHasSpreadPages;
}

- (BCSemanticLayoutOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BKFlowingBookFontSizeConfiguration)fontSizeConfiguration
{
  return self->_fontSizeConfiguration;
}

- (void)setFontSizeConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontSizeConfiguration, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_style, 0);
}

- (double)be_pageLength
{
  [(BKFlowingBookLayoutConfiguration *)self contentLayoutSize];
  double v4 = v3;
  double v6 = v5;
  switch([(BKFlowingBookLayoutConfiguration *)self layout])
  {
    case 0uLL:
    case 4uLL:
      double v7 = _AEBookPluginsPageTurnLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        double v8 = +[NSNumber numberWithUnsignedInteger:[(BKFlowingBookLayoutConfiguration *)self layout]];
        int v10 = 138412290;
        double v11 = v8;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Unexpected layout configuration %@ -- returning pageLength for paginated layout", (uint8_t *)&v10, 0xCu);
      }
      break;
    case 1uLL:
    case 3uLL:
      return v4;
    case 2uLL:
      double v4 = v6;
      break;
    default:
      double v4 = 0.0;
      break;
  }
  return v4;
}

@end