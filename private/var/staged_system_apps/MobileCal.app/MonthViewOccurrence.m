@interface MonthViewOccurrence
+ (double)compactOccurrenceHeight;
+ (double)verticalSpaceBetweenOccurrences;
+ (id)_blendColor:(id)a3 withColor:(id)a4 alpha:(double)a5;
+ (id)compactHourFont;
+ (id)compactTextFont;
+ (id)hourFont;
+ (id)textFont;
+ (void)clearCachedFonts;
- (BOOL)_showBackground;
- (BOOL)compact;
- (BOOL)drawBackgroundWithLayer;
- (BOOL)drawsEmpty;
- (BOOL)drawsTimeAtBottom;
- (BOOL)drawsTimeString;
- (BOOL)fadeLeftEdge;
- (BOOL)fadeRightEdge;
- (BOOL)hidden;
- (BOOL)isAllDay;
- (BOOL)isDeclined;
- (BOOL)isMultiDay;
- (BOOL)isNarrow;
- (BOOL)isPointInSymbol:(CGPoint)a3;
- (BOOL)isProposedTime;
- (BOOL)isSingleDay;
- (BOOL)isTentative;
- (BOOL)needsReply;
- (BOOL)selected;
- (BOOL)splitLeftEdge;
- (BOOL)splitRightEdge;
- (BOOL)textWraps;
- (CGPoint)_offsetForDotInFrame:(CGRect)a3 withDot:(id)a4;
- (CGPoint)_pointForDotInFrame:(CGRect)a3 withDot:(id)a4;
- (CGRect)intersectingRect:(CGRect)a3;
- (CGRect)isPointInView:(CGPoint)a3;
- (CGRect)occFrame;
- (CGRect)textFrameForFrame:(CGRect)a3;
- (CGRect)timeFrameForFrame:(CGRect)a3;
- (MonthViewOccurrence)initWithFrame:(CGRect)a3 occurrence:(id)a4 forDayRange:(_NSRange)a5 isCompact:(BOOL)a6 isMultiDay:(BOOL)a7;
- (MonthViewOccurrence)initWithFrame:(CGRect)a3 occurrence:(id)a4 forDayRange:(_NSRange)a5 isProposedTime:(BOOL)a6 isCompact:(BOOL)a7 isMultiDay:(BOOL)a8;
- (MonthViewOccurrence)parent;
- (NSString)endTimeString;
- (NSString)occurrenceString;
- (NSString)timeString;
- (UIColor)color;
- (UIEdgeInsets)_backgroundInsetsIgnoringSplitEdges:(BOOL)a3;
- (UIEdgeInsets)_textInsets;
- (UIEdgeInsets)backgroundInsets;
- (UIFont)font;
- (UIImage)dotImage;
- (UIInteraction)appEntityInteraction;
- (_NSRange)dayRange;
- (double)attributedTitleHeight;
- (double)backgroundAlpha;
- (double)firstWidth;
- (double)lineHeightAdjustmentOffsetY:(id)a3;
- (double)occAlpha;
- (double)radius;
- (double)startTime;
- (double)widthDrawingTime:(id)a3 textRect:(CGRect)a4;
- (id)_strikeColor;
- (id)_timeColor;
- (id)_timeString:(id)a3;
- (id)_titleColor;
- (id)attributedTime;
- (id)attributedTitle;
- (id)attributedTitleForLabel;
- (id)attributedTitleForWrappingLabel;
- (id)attributedTitleWithParagraphStyle:(id)a3;
- (id)backgroundImage;
- (id)description;
- (id)hourFont;
- (id)lengthForSorting;
- (id)occurrence;
- (id)pillImage;
- (unint64_t)backGroundCornerMask;
- (unint64_t)endRange;
- (unint64_t)gapBetweenBlock:(id)a3;
- (unint64_t)length;
- (unint64_t)startRange;
- (void)_drawBackgroundInFrame:(CGRect)a3;
- (void)_drawInFrame:(CGRect)a3 traitCollection:(id)a4;
- (void)_drawString:(id)a3 inTextRect:(CGRect)a4 withTrailingFade:(BOOL)a5;
- (void)_updateColorsForUserInterfaceStyle:(int64_t)a3;
- (void)_updateDotImage;
- (void)_updateDotImageView;
- (void)_updateFadeDirection;
- (void)_updateFadeVisibility;
- (void)_updateFadeWidth;
- (void)_updateOccurrenceBackgroundParameters;
- (void)_updateOccurrenceWithForce:(BOOL)a3;
- (void)_updateSubviewsIfNeeded;
- (void)_updateTimeStrings;
- (void)addFadeMaskForRect:(CGRect)a3 leftSide:(BOOL)a4 start:(double)a5 end:(double)a6 withContext:(CGContext *)a7;
- (void)addSegmentWithFrame:(CGRect)a3 splitLeftEdge:(BOOL)a4 splitRightEdge:(BOOL)a5 fadeLeftEdge:(BOOL)a6 fadeRightEdge:(BOOL)a7;
- (void)drawInFrame:(CGRect)a3 context:(CGContext *)a4 traitCollection:(id)a5;
- (void)loadViewsIfNeeded;
- (void)relayoutSubviews;
- (void)resetSegments;
- (void)setAlpha:(double)a3;
- (void)setAppEntityInteraction:(id)a3;
- (void)setColor:(id)a3;
- (void)setCompact:(BOOL)a3;
- (void)setDayRange:(_NSRange)a3;
- (void)setDotImage:(id)a3;
- (void)setDrawBackgroundWithLayer:(BOOL)a3;
- (void)setDrawsEmpty:(BOOL)a3;
- (void)setDrawsTimeString:(BOOL)a3;
- (void)setEndTimeString:(id)a3;
- (void)setFadeLeftEdge:(BOOL)a3;
- (void)setFadeRightEdge:(BOOL)a3;
- (void)setFirstWidth:(double)a3;
- (void)setFont:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIsProposedTime:(BOOL)a3;
- (void)setOccurrence:(id)a3;
- (void)setOccurrenceString:(id)a3;
- (void)setParent:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSplitLeftEdge:(BOOL)a3;
- (void)setSplitLeftEdge:(BOOL)a3 splitRightEdge:(BOOL)a4;
- (void)setSplitRightEdge:(BOOL)a3;
- (void)setTimeString:(id)a3;
- (void)updateBackgroundWithEdgeInsets:(UIEdgeInsets)a3 color:(id)a4 alpha:(double)a5 cornerMask:(unint64_t)a6;
- (void)updateView;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation MonthViewOccurrence

+ (void)clearCachedFonts
{
  v2 = (void *)qword_100216AF0;
  qword_100216AF0 = 0;

  v3 = (void *)qword_100216AF8;
  qword_100216AF8 = 0;

  v4 = (void *)qword_100216B08;
  qword_100216B08 = 0;

  v5 = (void *)qword_100216B00;
  qword_100216B00 = 0;

  qword_100216B10 = 0;
  qword_100216B18 = 0;
}

+ (id)textFont
{
  v2 = (void *)qword_100216AF0;
  if (!qword_100216AF0)
  {
    uint64_t v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    v4 = (void *)qword_100216AF0;
    qword_100216AF0 = v3;

    v2 = (void *)qword_100216AF0;
  }

  return v2;
}

+ (id)compactTextFont
{
  v2 = (void *)qword_100216AF8;
  if (!qword_100216AF8)
  {
    uint64_t v3 = +[UIFont cuik_preferredTightLeadingFontForTextStyle:UIFontTextStyleHeadline];
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:11.0];
    uint64_t v4 = [v3 fontWithSize:];
    v5 = (void *)qword_100216AF8;
    qword_100216AF8 = v4;

    v2 = (void *)qword_100216AF8;
  }

  return v2;
}

+ (id)hourFont
{
  v2 = (void *)qword_100216B00;
  if (!qword_100216B00)
  {
    uint64_t v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
    uint64_t v4 = (void *)qword_100216B00;
    qword_100216B00 = v3;

    v2 = (void *)qword_100216B00;
  }

  return v2;
}

+ (id)compactHourFont
{
  v2 = (void *)qword_100216B08;
  if (!qword_100216B08)
  {
    uint64_t v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption2];
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:11.0];
    uint64_t v4 = [v3 fontWithSize:];
    v5 = (void *)qword_100216B08;
    qword_100216B08 = v4;

    v2 = (void *)qword_100216B08;
  }

  return v2;
}

+ (double)compactOccurrenceHeight
{
  double result = *(double *)&qword_100216B18;
  if (*(double *)&qword_100216B18 == 0.0)
  {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:16.0];
    qword_100216B18 = *(void *)&result;
  }
  return result;
}

+ (double)verticalSpaceBetweenOccurrences
{
  double result = *(double *)&qword_100216B10;
  if (*(double *)&qword_100216B10 == 0.0)
  {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:3.0];
    qword_100216B10 = *(void *)&result;
  }
  return result;
}

- (id)_titleColor
{
  if (qword_100216B40 != -1) {
    dispatch_once(&qword_100216B40, &stru_1001D5CE8);
  }
  if ((*((unsigned char *)self + 56) & 0x10) != 0)
  {
    if (*((unsigned char *)self + 72))
    {
      uint64_t v3 = (void *)qword_100216B38;
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if (*((unsigned char *)self + 72))
  {
    id v4 = +[UIColor whiteColor];
LABEL_12:
    v5 = v4;
    goto LABEL_13;
  }
  if ((self->_invitationType - 3) <= 1)
  {
    uint64_t v3 = (void *)qword_100216B28;
LABEL_11:
    id v4 = v3;
    goto LABEL_12;
  }
  if ((*((unsigned char *)self + 56) & 8) != 0)
  {
    if ((*((unsigned char *)self + 56) & 0x20) != 0)
    {
LABEL_24:
      uint64_t v3 = (void *)qword_100216B20;
      goto LABEL_11;
    }
LABEL_8:
    uint64_t v3 = (void *)qword_100216B30;
    goto LABEL_11;
  }
  if (!self->_compact && (*((unsigned char *)self + 56) & 1) == 0 && (*((unsigned char *)self + 56) & 2) == 0) {
    goto LABEL_24;
  }
  cachedTitleColors = self->_cachedTitleColors;
  if (!cachedTitleColors)
  {
    v8 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    v9 = self->_cachedTitleColors;
    self->_cachedTitleColors = v8;

    v10 = CUIKTextColorForCalendarColorForStyle();
    [(NSMutableArray *)self->_cachedTitleColors setObject:v10 atIndexedSubscript:0];

    v11 = CUIKTextColorForCalendarColorForStyle();
    [(NSMutableArray *)self->_cachedTitleColors setObject:v11 atIndexedSubscript:1];

    cachedTitleColors = self->_cachedTitleColors;
  }
  v12 = +[UITraitCollection currentTraitCollection];
  v5 = -[NSMutableArray objectAtIndexedSubscript:](cachedTitleColors, "objectAtIndexedSubscript:", [v12 userInterfaceStyle] == (id)2);

LABEL_13:

  return v5;
}

- (id)_timeColor
{
  if (qword_100216B60 != -1) {
    dispatch_once(&qword_100216B60, &stru_1001D5D08);
  }
  if (*((unsigned char *)self + 72))
  {
    id v4 = +[UIColor whiteColor];
    goto LABEL_8;
  }
  if ((self->_invitationType - 3) <= 1)
  {
    uint64_t v3 = (void *)qword_100216B50;
LABEL_6:
    id v4 = v3;
LABEL_8:
    v5 = v4;
    goto LABEL_16;
  }
  if (!self->_compact && (*((unsigned char *)self + 56) & 1) == 0 && (*((unsigned char *)self + 56) & 2) == 0)
  {
    uint64_t v3 = (void *)qword_100216B48;
    goto LABEL_6;
  }
  cachedTimeColors = self->_cachedTimeColors;
  if (!cachedTimeColors)
  {
    v7 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    v8 = self->_cachedTimeColors;
    self->_cachedTimeColors = v7;

    v9 = CUIKSecondaryTextColorForCalendarColorForStyle();
    [(NSMutableArray *)self->_cachedTimeColors setObject:v9 atIndexedSubscript:0];

    v10 = CUIKSecondaryTextColorForCalendarColorForStyle();
    [(NSMutableArray *)self->_cachedTimeColors setObject:v10 atIndexedSubscript:1];

    cachedTimeColors = self->_cachedTimeColors;
  }
  v11 = +[UITraitCollection currentTraitCollection];
  v5 = -[NSMutableArray objectAtIndexedSubscript:](cachedTimeColors, "objectAtIndexedSubscript:", [v11 userInterfaceStyle] == (id)2);

LABEL_16:

  return v5;
}

- (id)_strikeColor
{
  if (qword_100216B70 != -1) {
    dispatch_once(&qword_100216B70, &stru_1001D5D28);
  }
  if (*((unsigned char *)self + 72))
  {
    id v3 = +[UIColor whiteColor];
  }
  else
  {
    id v3 = (id)qword_100216B68;
  }

  return v3;
}

- (MonthViewOccurrence)initWithFrame:(CGRect)a3 occurrence:(id)a4 forDayRange:(_NSRange)a5 isProposedTime:(BOOL)a6 isCompact:(BOOL)a7 isMultiDay:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v18 = a4;
  v43.receiver = self;
  v43.super_class = (Class)MonthViewOccurrence;
  v19 = -[MonthViewOccurrence initWithFrame:](&v43, "initWithFrame:", x, y, width, height);
  v20 = v19;
  if (v19)
  {
    v19->_dayRange.NSUInteger location = location;
    v19->_dayRange.NSUInteger length = length;
    if (v8) {
      char v21 = 2;
    }
    else {
      char v21 = 0;
    }
    *((unsigned char *)v19 + 56) = *((unsigned char *)v19 + 56) & 0xFD | v21;
    v19->_cachedEndRange = v19->_dayRange.location + v19->_dayRange.length - 1;
    v19->_isProposedTime = a6;
    if (v9) {
      +[MonthViewOccurrence compactTextFont];
    }
    else {
    v22 = +[MonthViewOccurrence textFont];
    }
    objc_storeStrong((id *)&v20->_font, v22);

    v20->_compact = v9;
    [(MonthViewOccurrence *)v20 setOccurrence:v18];
    v23 = (CALayer *)objc_alloc_init((Class)CALayer);
    glowLayer = v20->_glowLayer;
    v20->_glowLayer = v23;

    id v42 = v18;
    id v25 = +[UIColor clearColor];
    -[CALayer setBackgroundColor:](v20->_glowLayer, "setBackgroundColor:", [v25 CGColor]);

    id v26 = +[UIColor blackColor];
    -[CALayer setShadowColor:](v20->_glowLayer, "setShadowColor:", [v26 CGColor]);

    -[CALayer setShadowOffset:](v20->_glowLayer, "setShadowOffset:", CGSizeZero.width, CGSizeZero.height);
    [(CALayer *)v20->_glowLayer setShadowRadius:6.0];
    LODWORD(v27) = 1032805417;
    [(CALayer *)v20->_glowLayer setShadowOpacity:v27];
    v28 = [(MonthViewOccurrence *)v20 layer];
    [v28 addSublayer:v20->_glowLayer];

    v41 = [(MonthViewOccurrence *)v20 layer];
    [v41 setValue:&__kCFBooleanTrue forKeyPath:@"separatedOptions.enableContext"];
    [v41 setNeedsDisplay];
    v29 = (CAGradientLayer *)objc_alloc_init((Class)CAGradientLayer);
    gradientLayer = v20->_gradientLayer;
    v20->_gradientLayer = v29;

    v40 = +[UIColor whiteColor];
    id v31 = [v40 colorWithAlphaComponent:1.0];
    v44[0] = [v31 CGColor];
    v32 = +[UIColor whiteColor];
    id v33 = [v32 colorWithAlphaComponent:1.0];
    v44[1] = [v33 CGColor];
    v34 = +[UIColor whiteColor];
    id v35 = [v34 colorWithAlphaComponent:0.0];
    v44[2] = [v35 CGColor];
    v36 = +[UIColor whiteColor];
    id v37 = [v36 colorWithAlphaComponent:0.0];
    v44[3] = [v37 CGColor];
    v38 = +[NSArray arrayWithObjects:v44 count:4];
    [(CAGradientLayer *)v20->_gradientLayer setColors:v38];

    id v18 = v42;
    v20->_occAlpha = 1.0;
  }
  return v20;
}

- (MonthViewOccurrence)initWithFrame:(CGRect)a3 occurrence:(id)a4 forDayRange:(_NSRange)a5 isCompact:(BOOL)a6 isMultiDay:(BOOL)a7
{
  return -[MonthViewOccurrence initWithFrame:occurrence:forDayRange:isProposedTime:isCompact:isMultiDay:](self, "initWithFrame:occurrence:forDayRange:isProposedTime:isCompact:isMultiDay:", a4, a5.location, a5.length, 0, a6, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)description
{
  if (self->_occurrence)
  {
    v10.receiver = self;
    v10.super_class = (Class)MonthViewOccurrence;
    id v3 = [(MonthViewOccurrence *)&v10 description];
    id v4 = [(EKEvent *)self->_occurrence title];
    v5 = [(EKEvent *)self->_occurrence startCalendarDate];
    v6 = [(EKEvent *)self->_occurrence endCalendarDate];
    v7 = +[NSString stringWithFormat:@"%@ '%@' %@ to %@", v3, v4, v5, v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MonthViewOccurrence;
    id v3 = [(MonthViewOccurrence *)&v9 description];
    v7 = +[NSString stringWithFormat:@"%@ - no occurrence set", v3];
  }

  return v7;
}

- (void)loadViewsIfNeeded
{
  if (!self->_backgroundImageView)
  {
    id v3 = (UIImageView *)objc_opt_new();
    backgroundImageView = self->_backgroundImageView;
    self->_backgroundImageView = v3;

    [(MonthViewOccurrence *)self addSubview:self->_backgroundImageView];
    if ((*((unsigned char *)self + 56) & 8) != 0)
    {
      v7 = (UIImageView *)objc_opt_new();
      dotImageView = self->_dotImageView;
      self->_dotImageView = v7;

      char v9 = *((unsigned char *)self + 56);
      objc_super v10 = [(MonthViewOccurrence *)self occurrence];
      v11 = v10;
      if ((v9 & 0x20) != 0) {
        [v10 CUIK_symbolColor];
      }
      else {
      v12 = [v10 CUIK_disabledSymbolColor];
      }

      [(UIImageView *)self->_dotImageView setTintColor:v12];
      [(MonthViewOccurrence *)self addSubview:self->_dotImageView];
    }
    else if (*((unsigned char *)self + 56))
    {
      v5 = (UIImageView *)objc_opt_new();
      v6 = self->_dotImageView;
      self->_dotImageView = v5;

      [(MonthViewOccurrence *)self addSubview:self->_dotImageView];
    }
    v13 = (TrailingFadeLabel *)objc_opt_new();
    titleLabel = self->_titleLabel;
    self->_titleLabel = v13;

    [(MonthViewOccurrence *)self addSubview:self->_titleLabel];
    v15 = (UILabel *)objc_opt_new();
    wrappingTitleLabel = self->_wrappingTitleLabel;
    self->_wrappingTitleLabel = v15;

    [(MonthViewOccurrence *)self addSubview:self->_wrappingTitleLabel];
    v17 = (UILabel *)objc_opt_new();
    timeLabel = self->_timeLabel;
    self->_timeLabel = v17;

    [(MonthViewOccurrence *)self addSubview:self->_timeLabel];
    [(MonthViewOccurrence *)self _updateSubviewsIfNeeded];
    [(MonthViewOccurrence *)self frame];
    -[MonthViewOccurrence setFrame:](self, "setFrame:");
  }
}

- (void)willMoveToSuperview:(id)a3
{
  if (a3)
  {
    [(MonthViewOccurrence *)self _updateOccurrenceWithForce:0];
    [(MonthViewOccurrence *)self loadViewsIfNeeded];
    [(MonthViewOccurrence *)self relayoutSubviews];
  }
}

- (id)attributedTitleWithParagraphStyle:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  [v5 setObject:self->_font forKeyedSubscript:NSFontAttributeName];
  [v5 setObject:v4 forKeyedSubscript:NSParagraphStyleAttributeName];

  v6 = [(MonthViewOccurrence *)self _titleColor];
  [v5 setObject:v6 forKeyedSubscript:NSForegroundColorAttributeName];

  if ((self->_invitationType - 3) <= 1) {
    [v5 setObject:&off_1001DC758 forKeyedSubscript:NSStrikethroughStyleAttributeName];
  }
  id v7 = objc_alloc((Class)NSAttributedString);
  BOOL v8 = [(MonthViewOccurrence *)self occurrenceString];
  id v9 = [v7 initWithString:v8 attributes:v5];

  return v9;
}

- (double)attributedTitleHeight
{
  if (!self->_cachedTitleHeights)
  {
    id v3 = (NSMutableDictionary *)objc_opt_new();
    cachedTitleHeights = self->_cachedTitleHeights;
    self->_cachedTitleHeights = v3;
  }
  v5 = [(MonthViewOccurrence *)self occurrenceString];
  unsigned int v6 = [(MonthViewOccurrence *)self textWraps];
  [(UIFont *)self->_font pointSize];
  BOOL v8 = +[NSString stringWithFormat:@"%@ %b %f", v5, v6, v7];

  id v9 = [(NSMutableDictionary *)self->_cachedTitleHeights objectForKeyedSubscript:v8];

  if (!v9)
  {
    objc_super v10 = [(MonthViewOccurrence *)self attributedTitle];
    [v10 size];
    v12 = +[NSNumber numberWithDouble:v11];
    [(NSMutableDictionary *)self->_cachedTitleHeights setObject:v12 forKeyedSubscript:v8];
  }
  v13 = [(NSMutableDictionary *)self->_cachedTitleHeights objectForKeyedSubscript:v8];
  [v13 doubleValue];
  double v15 = v14;

  return v15;
}

- (id)attributedTitle
{
  id v3 = objc_alloc_init((Class)NSMutableParagraphStyle);
  if (self->_compact)
  {
    if ([(MonthViewOccurrence *)self textWraps]) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = 2;
    }
  }
  else
  {
    uint64_t v4 = 4;
  }
  [v3 setLineBreakMode:v4];
  v5 = [(MonthViewOccurrence *)self attributedTitleWithParagraphStyle:v3];

  return v5;
}

- (id)attributedTitleForLabel
{
  id v3 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v3 setLineBreakMode:2];
  uint64_t v4 = [(MonthViewOccurrence *)self attributedTitleWithParagraphStyle:v3];

  return v4;
}

- (id)attributedTitleForWrappingLabel
{
  id v3 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v3 setLineBreakMode:4];
  uint64_t v4 = [(MonthViewOccurrence *)self attributedTitleWithParagraphStyle:v3];

  return v4;
}

- (id)attributedTime
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(MonthViewOccurrence *)self _timeColor];
  [v3 setObject:v4 forKeyedSubscript:NSForegroundColorAttributeName];

  if (self->_compact) {
    +[MonthViewOccurrence compactHourFont];
  }
  else {
  v5 = +[MonthViewOccurrence hourFont];
  }
  [v3 setObject:v5 forKeyedSubscript:NSFontAttributeName];

  id v6 = objc_alloc((Class)NSAttributedString);
  uint64_t v7 = [(MonthViewOccurrence *)self timeString];
  id v8 = [v6 initWithString:v7 attributes:v3];

  return v8;
}

- (id)pillImage
{
  if (qword_100216B80 != -1) {
    dispatch_once(&qword_100216B80, &stru_1001D5D48);
  }
  if (*((unsigned char *)self + 72))
  {
    id v3 = [&stru_1001D6918 stringByAppendingString:@"Selected"];
  }
  else
  {
    id v3 = &stru_1001D6918;
  }
  uint64_t v4 = +[UITraitCollection currentTraitCollection];
  id v5 = [v4 userInterfaceStyle];

  if (v5 == (id)1)
  {
    CFStringRef v6 = @"Light";
  }
  else
  {
    if (v5 != (id)2) {
      goto LABEL_11;
    }
    CFStringRef v6 = @"Dark";
  }
  uint64_t v7 = [(__CFString *)v3 stringByAppendingString:v6];

  id v3 = (__CFString *)v7;
LABEL_11:
  id v8 = [(id)qword_100216B78 objectForKeyedSubscript:self->_color];
  if (!v8)
  {
    id v8 = objc_opt_new();
    [(id)qword_100216B78 setObject:v8 forKeyedSubscript:self->_color];
  }
  id v9 = [v8 objectForKeyedSubscript:v3];
  if (!v9)
  {
    if (*((unsigned char *)self + 72))
    {
      objc_super v10 = +[UIColor whiteColor];
    }
    else
    {
      objc_super v10 = self->_color;
    }
    double v11 = v10;
    if (qword_100216B90 != -1) {
      dispatch_once(&qword_100216B90, &stru_1001D5D68);
    }
    v12 = objc_opt_new();
    [v12 setScale:*(double *)&qword_100216B88];
    [v12 setOpaque:0];
    [v12 setPreferredRange:1];
    id v13 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v12 format:1.0];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100120F00;
    v21[3] = &unk_1001D5D90;
    uint64_t v23 = 0;
    uint64_t v24 = 0;
    v22 = v11;
    __asm { FMOV            V0.2D, #1.0 }
    long long v25 = _Q0;
    v19 = v11;
    id v9 = [v13 imageWithActions:v21];
    [v8 setObject:v9 forKeyedSubscript:v3];
  }

  return v9;
}

- (id)backgroundImage
{
  if (qword_100216BA0 != -1) {
    dispatch_once(&qword_100216BA0, &stru_1001D5DB0);
  }
  if (*((unsigned char *)self + 72))
  {
    id v3 = [&stru_1001D6918 stringByAppendingString:@"Selected"];
  }
  else
  {
    id v3 = &stru_1001D6918;
  }
  int v4 = self->_invitationType - 1;
  if (v4 <= 3)
  {
    uint64_t v5 = [(__CFString *)v3 stringByAppendingString:*(&off_1001D5E10 + v4)];

    id v3 = (__CFString *)v5;
  }
  if ((*((unsigned char *)self + 56) & 8) != 0) {
    id v6 = [(__CFString *)v3 stringByAppendingString:@"Reminder"];
  }
  uint64_t v7 = +[UITraitCollection currentTraitCollection];
  id v8 = [v7 userInterfaceStyle];

  if (v8 == (id)1)
  {
    CFStringRef v9 = @"Light";
  }
  else
  {
    if (v8 != (id)2) {
      goto LABEL_15;
    }
    CFStringRef v9 = @"Dark";
  }
  uint64_t v10 = [(__CFString *)v3 stringByAppendingString:v9];

  id v3 = (__CFString *)v10;
LABEL_15:
  double v11 = [(id)qword_100216B98 objectForKeyedSubscript:self->_color];
  if (!v11)
  {
    double v11 = objc_opt_new();
    [(id)qword_100216B98 setObject:v11 forKeyedSubscript:self->_color];
  }
  v12 = [v11 objectForKeyedSubscript:v3];
  if (!v12)
  {
    int invitationType = self->_invitationType;
    if ((invitationType - 3) < 2)
    {
      v17 = +[UIColor colorWithWhite:0.8 alpha:1.0];
    }
    else
    {
      if (invitationType == 1)
      {
        id v18 = objc_opt_class();
        color = self->_color;
        v20 = +[UIColor whiteColor];
        double v14 = [v18 _blendColor:color withColor:v20 alpha:0.89];

        if ((*((unsigned char *)self + 72) & 1) == 0)
        {
          char v21 = objc_opt_class();
          v22 = self->_color;
          uint64_t v23 = +[UIColor whiteColor];
          uint64_t v24 = [v21 _blendColor:v22 withColor:v23 alpha:0.34];

LABEL_31:
          EKUIScaleFactor();
          CUIKCreateStripedUIImage();
          id v25 = (id)objc_claimAutoreleasedReturnValue();
          v12 = [v25 resizableImageWithCapInsets:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
LABEL_36:

          [v11 setObject:v12 forKeyedSubscript:v3];
          goto LABEL_37;
        }
        goto LABEL_29;
      }
      if (invitationType == 2)
      {
        +[UIColor colorWithWhite:dbl_1001C17F0[(*((unsigned char *)self + 72) & 1) == 0] alpha:1.0];
        double v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
        if ((*((unsigned char *)self + 72) & 1) == 0)
        {
          double v15 = 0.85;
          double v16 = 1.0;
LABEL_30:
          uint64_t v24 = +[UIColor colorWithWhite:v15 alpha:v16];
          goto LABEL_31;
        }
LABEL_29:
        double v16 = 0.15;
        double v15 = 1.0;
        goto LABEL_30;
      }
      if (*((unsigned char *)self + 56) & 8) != 0 && (*((unsigned char *)self + 72))
      {
        v17 = +[UIColor systemGray2Color];
      }
      else
      {
        v17 = self->_color;
      }
    }
    id v26 = v17;
    if (qword_100216BB0 != -1) {
      dispatch_once(&qword_100216BB0, &stru_1001D5DD0);
    }
    uint64_t v24 = objc_opt_new();
    [v24 setScale:*(double *)&qword_100216BA8];
    [v24 setOpaque:0];
    [v24 setPreferredRange:1];
    id v25 = [objc_alloc((Class)UIGraphicsImageRenderer) initWithSize:v24 format:1.0];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10012145C;
    v35[3] = &unk_1001D5D90;
    double v14 = v26;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    v36 = v14;
    __asm { FMOV            V0.2D, #1.0 }
    long long v39 = _Q0;
    v12 = [v25 imageWithActions:v35];

    goto LABEL_36;
  }
LABEL_37:
  if (CalInterfaceIsLeftToRight())
  {
    id v32 = v12;
  }
  else
  {
    id v32 = [v12 imageFlippedForRightToLeftLayoutDirection];
  }
  id v33 = v32;

  return v33;
}

+ (id)_blendColor:(id)a3 withColor:(id)a4 alpha:(double)a5
{
  double v7 = 1.0 - a5;
  id v8 = a4;
  id v9 = a3;
  [v9 redComponent];
  double v11 = v10;
  [v8 redComponent];
  double v13 = v7 * v12 + a5 * v11;
  [v9 greenComponent];
  double v15 = v14;
  [v8 greenComponent];
  double v17 = v7 * v16 + a5 * v15;
  [v9 blueComponent];
  double v19 = v18;

  [v8 blueComponent];
  double v21 = v20;

  return +[UIColor colorWithRed:v13 green:v17 blue:v7 * v21 + a5 * v19 alpha:1.0];
}

- (void)_drawBackgroundInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_splitLeftEdge)
  {
    BOOL splitRightEdge = self->_splitRightEdge;
    CurrentContext = UIGraphicsGetCurrentContext();
    if (splitRightEdge)
    {
      int v10 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    CurrentContext = UIGraphicsGetCurrentContext();
  }
  CGContextSaveGState(CurrentContext);
  if (self->_splitLeftEdge)
  {
    uint64_t v11 = 0;
  }
  else if (CalTimeDirectionIsLeftToRight())
  {
    uint64_t v11 = 5;
  }
  else
  {
    uint64_t v11 = 10;
  }
  if (!self->_splitRightEdge)
  {
    if (CalTimeDirectionIsLeftToRight()) {
      v11 |= 0xAuLL;
    }
    else {
      v11 |= 5uLL;
    }
  }
  double v12 = 4.0;
  if (*((unsigned char *)self + 56))
  {
    if (self->_compact) {
      double v12 = height * 0.5;
    }
    else {
      double v12 = 6.0;
    }
  }
  double v13 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v11, x, y, width, height, v12, v12);
  [v13 addClip];

  int v10 = 1;
LABEL_19:
  if ([(MonthViewOccurrence *)self _showBackground])
  {
    double v14 = [(MonthViewOccurrence *)self backgroundImage];
    [(MonthViewOccurrence *)self backgroundAlpha];
    [v14 drawInRect:0 blendMode:x y:y width:width height:height alpha:v15];
  }
  if (v10) {
    CGContextRestoreGState(CurrentContext);
  }
  if (![(MonthViewOccurrence *)self isNarrow]
    && (*((unsigned char *)self + 56) & 8) == 0
    && !self->_compact
    && (*((unsigned char *)self + 72) & 1) == 0
    && (*((unsigned char *)self + 56) & 1) == 0
    && !self->_splitLeftEdge)
  {
    int IsLeftToRight = CalInterfaceIsLeftToRight();
    double v17 = x;
    double v18 = y;
    double v19 = width;
    double v20 = height;
    if (IsLeftToRight)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v17);
      CalRoundToScreenScale();
      double v23 = MinX + v22;
    }
    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v17);
      CalRoundToScreenScale();
      double v23 = MaxX + v25 * -2.0;
    }
    CGContextSaveGState(CurrentContext);
    id v39 = [(MonthViewOccurrence *)self hourFont];
    [(MonthViewOccurrence *)self lineHeightAdjustmentOffsetY:v39];
    double v27 = v26;
    v41.origin.double x = x;
    v41.origin.double y = y;
    v41.size.double width = width;
    v41.size.double height = height;
    double MinY = CGRectGetMinY(v41);
    CalRoundToScreenScale();
    double v30 = v27 + MinY + v29 * 0.5;
    CalRoundToScreenScale();
    double v32 = v31;
    v42.origin.double x = x;
    v42.origin.double y = y;
    v42.size.double width = width;
    v42.size.double height = height;
    double v33 = CGRectGetHeight(v42);
    CalRoundToScreenScale();
    double v35 = v33 + v34 * -2.0 + -0.5;
    CalRoundToScreenScale();
    uint64_t v37 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v23, v30, v32, v35, v36);
    [v37 addClip];
    uint64_t v38 = [(MonthViewOccurrence *)self pillImage];
    [v38 drawInRect:0 blendMode:v23 blendMode:v30 blendMode:v32 blendMode:v35 alpha:1.0];

    CGContextRestoreGState(CurrentContext);
  }
}

- (id)hourFont
{
  return +[MonthViewOccurrence hourFont];
}

- (double)lineHeightAdjustmentOffsetY:(id)a3
{
  font = self->_font;
  id v4 = a3;
  [(UIFont *)font ascender];
  CalCeilToScreenScale();
  double v6 = v5;
  [v4 ascender];

  CalCeilToScreenScale();
  return v6 - v7;
}

- (BOOL)isAllDay
{
  return *((unsigned char *)self + 56) & 1;
}

- (BOOL)isSingleDay
{
  return self->_dayRange.length == 1;
}

- (BOOL)isMultiDay
{
  return (*((unsigned __int8 *)self + 56) >> 1) & 1;
}

- (UIEdgeInsets)backgroundInsets
{
  [(MonthViewOccurrence *)self _backgroundInsetsIgnoringSplitEdges:0];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)_backgroundInsetsIgnoringSplitEdges:(BOOL)a3
{
  double bottom = UIEdgeInsetsZero.bottom;
  if (a3)
  {
    BOOL compact = self->_compact;
    if (self->_compact) {
      double left = 2.0;
    }
    else {
      double left = 4.0;
    }
    goto LABEL_13;
  }
  if (self->_splitLeftEdge)
  {
    double left = UIEdgeInsetsZero.left;
  }
  else if (self->_compact)
  {
    double left = 2.0;
  }
  else
  {
    double left = 4.0;
  }
  if (!self->_splitRightEdge)
  {
    BOOL compact = self->_compact;
LABEL_13:
    if (compact) {
      double right = 2.0;
    }
    else {
      double right = 4.0;
    }
    goto LABEL_16;
  }
  double right = UIEdgeInsetsZero.right;
LABEL_16:
  char IsLeftToRight = CalTimeDirectionIsLeftToRight();
  double top = 0.0;
  if (IsLeftToRight) {
    double v9 = right;
  }
  else {
    double v9 = left;
  }
  if (IsLeftToRight) {
    double v10 = bottom;
  }
  else {
    double v10 = 0.0;
  }
  if (IsLeftToRight) {
    double v11 = left;
  }
  else {
    double v11 = right;
  }
  if (IsLeftToRight) {
    double top = UIEdgeInsetsZero.top;
  }
  result.double right = v9;
  result.double bottom = v10;
  result.double left = v11;
  result.double top = top;
  return result;
}

- (CGPoint)_offsetForDotInFrame:(CGRect)a3 withDot:(id)a4
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  [(MonthViewOccurrence *)self backgroundInsets];
  if (IsLeftToRight) {
    double v13 = v11;
  }
  else {
    double v13 = v12;
  }
  [v9 size];
  double v15 = v14;
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.double height = height;
    double v16 = CGRectGetWidth(v21);
    [v9 size];
    double v13 = v16 - v17 - v13;
  }

  double v18 = v13;
  double v19 = height * 0.5 - v15 * 0.5;
  result.CGFloat y = v19;
  result.CGFloat x = v18;
  return result;
}

- (CGPoint)_pointForDotInFrame:(CGRect)a3 withDot:(id)a4
{
  -[MonthViewOccurrence _offsetForDotInFrame:withDot:](self, "_offsetForDotInFrame:withDot:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  CalRoundPointToScreenScale();
  result.CGFloat y = v5;
  result.CGFloat x = v4;
  return result;
}

- (UIEdgeInsets)_textInsets
{
  [(MonthViewOccurrence *)self _backgroundInsetsIgnoringSplitEdges:1];
  double v4 = v3;
  CalRoundToScreenScale();
  double v6 = v4 + v5 * 2.0 + 3.0;
  dotImage = self->_dotImage;
  if (dotImage && ((*((unsigned char *)self + 56) & 1) == 0 || !self->_splitLeftEdge))
  {
    [(UIImage *)dotImage size];
    double v6 = v4 + v8 + 4.0;
  }
  double bottom = UIEdgeInsetsZero.bottom;
  if (self->_compact)
  {
    if ((*((unsigned char *)self + 56) & 1) != 0 && self->_splitLeftEdge)
    {
      double v6 = 5.0;
      double v10 = 2.0;
    }
    else
    {
      double v11 = self->_dotImage;
      if (v11) {
        double v10 = 3.0;
      }
      else {
        double v10 = 2.0;
      }
      if (!v11) {
        double v6 = 4.0;
      }
    }
  }
  else
  {
    double v10 = 7.0;
  }
  char IsLeftToRight = CalInterfaceIsLeftToRight();
  double top = 0.0;
  if (IsLeftToRight) {
    double v14 = v10;
  }
  else {
    double v14 = v6;
  }
  if (IsLeftToRight) {
    double v15 = bottom;
  }
  else {
    double v15 = 0.0;
  }
  if (IsLeftToRight) {
    double v16 = v6;
  }
  else {
    double v16 = v10;
  }
  if (IsLeftToRight) {
    double top = UIEdgeInsetsZero.top;
  }
  result.double right = v14;
  result.double bottom = v15;
  result.double left = v16;
  result.double top = top;
  return result;
}

- (id)_timeString:(id)a3
{
  id v3 = a3;
  double v4 = [v3 date];
  double v5 = +[NSTimeZone calendarTimeZone];
  double v6 = +[EKCalendarDate calendarDateWithDate:v4 timeZone:v5];

  if ((CUIKShow24Hours() & 1) != 0 || [v6 hour] != (id)12 || objc_msgSend(v6, "minute"))
  {
    double v7 = [v3 date];
    uint64_t v8 = CUIKStringForTime();
  }
  else
  {
    double v7 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"Noon" value:&stru_1001D6918 table:0];
  }
  id v9 = (void *)v8;

  return v9;
}

- (double)widthDrawingTime:(id)a3 textRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  double v10 = [(MonthViewOccurrence *)self _timeColor];
  [v10 set];

  double v11 = [(MonthViewOccurrence *)self hourFont];
  [(MonthViewOccurrence *)self lineHeightAdjustmentOffsetY:v11];
  CalRoundToScreenScale();
  double v13 = v12;
  CalCeilToScreenScale();
  double v15 = v14;
  if (CalInterfaceIsLeftToRight()) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 0;
  }
  [v9 _legacy_drawInRect:v11 withFont:2 lineBreakMode:v16 alignment:x width:v13];
  double v18 = v17;

  double v19 = x;
  if (CalInterfaceIsLeftToRight())
  {
    v24.origin.double x = x;
    v24.origin.CGFloat y = y;
    v24.size.double width = width;
    v24.size.CGFloat height = height;
    double v19 = CGRectGetMaxX(v24) - v18;
  }
  if ((self->_invitationType - 3) <= 1)
  {
    v25.origin.double x = v19;
    v25.origin.CGFloat y = v13;
    v25.size.double width = v18;
    v25.size.CGFloat height = v15;
    CGRectGetMinX(v25);
    v26.origin.double x = v19;
    v26.origin.CGFloat y = v13;
    v26.size.double width = v18;
    v26.size.CGFloat height = v15;
    CGRectGetMaxX(v26);
    double v20 = [(MonthViewOccurrence *)self _strikeColor];
    [v20 set];

    v27.origin.double x = x;
    v27.origin.CGFloat y = y;
    v27.size.double width = width;
    v27.size.CGFloat height = height;
    CGRectGetMidY(v27);
    CalRoundRectToScreenScale();
    UIRectFillUsingBlendMode(v28, kCGBlendModeNormal);
  }
  CalCeilToScreenScale();
  double v22 = v21;

  return v22;
}

- (void)setDrawsTimeString:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 72);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 72) = v3 & 0xFD | v4;
    [(MonthViewOccurrence *)self _updateTimeStrings];
  }
}

- (BOOL)drawsTimeString
{
  if ((*((unsigned char *)self + 72) & 2) != 0) {
    return 1;
  }
  else {
    return [(MonthViewOccurrence *)self drawsTimeAtBottom];
  }
}

- (void)drawInFrame:(CGRect)a3 context:(CGContext *)a4 traitCollection:(id)a5
{
}

- (void)addFadeMaskForRect:(CGRect)a3 leftSide:(BOOL)a4 start:(double)a5 end:(double)a6 withContext:(CGContext *)a7
{
  BOOL v10 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
  uint64_t v16 = CGBitmapContextCreate(0, (unint64_t)width, (unint64_t)height, 8uLL, 0, DeviceGray, 0);
  double v17 = +[UIColor colorWithWhite:1.0 alpha:1.0];
  double v18 = +[UIColor colorWithWhite:0.0 alpha:1.0];
  id v19 = v17;
  v33[0] = [v19 CGColor];
  id v20 = v19;
  v33[1] = [v20 CGColor];
  id v21 = v18;
  v33[2] = [v21 CGColor];
  id v22 = v21;
  v33[3] = [v22 CGColor];
  CFArrayRef v23 = +[NSArray arrayWithObjects:v33 count:4];
  locations[0] = 0.0;
  locations[1] = 1.0 - a5 / width;
  locations[2] = 1.0 - a6 / width;
  locations[3] = 1.0;
  CGRect v24 = CGGradientCreateWithColors(DeviceGray, v23, locations);
  if (v10)
  {
    CGFloat v25 = CGPointZero.x;
    CGFloat v26 = CGPointZero.y;
    CGFloat v27 = 0.0;
    CGRect v28 = v16;
    double v29 = v24;
    CGFloat v30 = width;
  }
  else
  {
    CGFloat v30 = CGPointZero.x;
    CGFloat v27 = CGPointZero.y;
    CGFloat v26 = 0.0;
    CGRect v28 = v16;
    double v29 = v24;
    CGFloat v25 = width;
  }
  CGContextDrawLinearGradient(v28, v29, *(CGPoint *)&v30, *(CGPoint *)&v25, 0);
  CGGradientRelease(v24);
  CGColorSpaceRelease(DeviceGray);
  Image = CGBitmapContextCreateImage(v16);
  CGContextRelease(v16);
  CGContextSaveGState(a7);
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.double width = width;
  v34.size.double height = height;
  CGContextClipToMask(a7, v34, Image);
  CGImageRelease(Image);
}

- (void)_drawString:(id)a3 inTextRect:(CGRect)a4 withTrailingFade:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  [v13 boundingRectWithSize:1 options:0 context:1.79769313e308 height];
  if (v5 && v11 > width || [(MonthViewOccurrence *)self fadeLeftEdge])
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    -[MonthViewOccurrence addFadeMaskForRect:leftSide:start:end:withContext:](self, "addFadeMaskForRect:leftSide:start:end:withContext:", CalInterfaceIsLeftToRight() ^ 1, CurrentContext, x, y, width, height, 14.0, 2.0);
    [v13 drawInRect:x, y, width, height];
    CGContextRestoreGState(CurrentContext);
  }
  else
  {
    [v13 drawInRect:x, y, width, height];
  }
}

- (CGRect)textFrameForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double x = a3.origin.x;
  double width = a3.size.width;
  double y = a3.origin.y;
  if (self->_compact)
  {
    +[MonthViewOccurrence compactOccurrenceHeight];
    if (height < v7) {
      double height = v7;
    }
  }
  [(MonthViewOccurrence *)self _textInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if ([(EKEvent *)self->_occurrence isAllDay]
    || (double v16 = v9 + v13, self->_compact) && ![(MonthViewOccurrence *)self textWraps])
  {
    double v17 = [(MonthViewOccurrence *)self attributedTitle];
    [v17 size];

    CalRoundToScreenScale();
    double v9 = v18;
    CalRoundToScreenScale();
    double v13 = v19;
    double v16 = v9 + v19;
  }
  if ([(MonthViewOccurrence *)self textWraps])
  {
    CalRoundToScreenScale();
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0);
    double v9 = v20;
    double v21 = height - (v13 + v20);
    +[MonthViewOccurrence compactOccurrenceHeight];
    double v23 = v22;
    +[MonthViewOccurrence verticalSpaceBetweenOccurrences];
    double v25 = v24 + v23 * 2.0;
    if (v21 >= v25) {
      double v26 = v25;
    }
    else {
      double v26 = v21;
    }
  }
  else
  {
    double v26 = height - v16;
  }
  double v27 = width - (v11 + v15);
  double v28 = x + v11;
  double v29 = y + v9;
  result.size.double height = v26;
  result.size.double width = v27;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (CGRect)timeFrameForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MonthViewOccurrence *)self _textInsets];
  double v8 = x + v7;
  double v11 = width - (v7 + v10);
  double v13 = y + v9 + height - (v9 + v12);
  +[MonthViewOccurrence compactOccurrenceHeight];
  double v15 = v13 - v14;
  +[MonthViewOccurrence compactOccurrenceHeight];
  double v17 = v16;
  double v18 = v8;
  double v19 = v15;
  double v20 = v11;
  result.size.double height = v17;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (void)_drawInFrame:(CGRect)a3 traitCollection:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  [(MonthViewOccurrence *)self _updateOccurrenceWithForce:0];
  double v10 = +[UITraitCollection currentTraitCollection];
  +[UITraitCollection setCurrentTraitCollection:v9];
  id v11 = [v9 userInterfaceStyle];
  if (v11 != self->_lastUserInterfaceStyle)
  {
    self->_lastUserInterfaceStyle = (int64_t)v11;
    [(MonthViewOccurrence *)self _updateColorsForUserInterfaceStyle:v11];
    [(MonthViewOccurrence *)self _updateDotImage];
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  if ([(MonthViewOccurrence *)self fadeLeftEdge]
    || [(MonthViewOccurrence *)self fadeRightEdge])
  {
    if ([(MonthViewOccurrence *)self fadeLeftEdge] && (CalInterfaceIsLeftToRight() & 1) != 0)
    {
      uint64_t v13 = 1;
    }
    else if ([(MonthViewOccurrence *)self fadeRightEdge])
    {
      uint64_t v13 = CalInterfaceIsLeftToRight() ^ 1;
    }
    else
    {
      uint64_t v13 = 0;
    }
    -[MonthViewOccurrence addFadeMaskForRect:leftSide:start:end:withContext:](self, "addFadeMaskForRect:leftSide:start:end:withContext:", v13, CurrentContext, x, y, width, height, 8.0, 0.0);
  }
  [(MonthViewOccurrence *)self backgroundInsets];
  -[MonthViewOccurrence _drawBackgroundInFrame:](self, "_drawBackgroundInFrame:", x + v17, y + v14, width - (v17 + v15), height - (v14 + v16));
  unsigned __int8 v18 = [(MonthViewOccurrence *)self isNarrow];
  unsigned __int8 v19 = v18;
  dotImage = self->_dotImage;
  if (!dotImage) {
    goto LABEL_21;
  }
  if ((*((unsigned char *)self + 56) & 1) == 0)
  {
    if (v18) {
      goto LABEL_39;
    }
    goto LABEL_20;
  }
  if (self->_splitLeftEdge) {
    char v21 = 1;
  }
  else {
    char v21 = v18;
  }
  if ((v21 & 1) == 0)
  {
LABEL_20:
    -[MonthViewOccurrence _pointForDotInFrame:withDot:](self, "_pointForDotInFrame:withDot:", self->_dotImage, x, y, width, height);
    -[UIImage drawAtPoint:blendMode:alpha:](dotImage, "drawAtPoint:blendMode:alpha:", 0);
  }
LABEL_21:
  if ((v19 & 1) == 0)
  {
    -[MonthViewOccurrence textFrameForFrame:](self, "textFrameForFrame:", x, y, width, height);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    if ([(MonthViewOccurrence *)self drawsTimeString]
      && ![(EKEvent *)self->_occurrence isAllDay])
    {
      double v59 = v29;
      if (self->_endTimeString)
      {
        CGFloat v30 = [(MonthViewOccurrence *)self endTimeString];
        -[MonthViewOccurrence widthDrawingTime:textRect:](self, "widthDrawingTime:textRect:", v30, v23, v25, v27, v29);
        double v32 = v31;

        double v27 = v27 - v32;
        int IsLeftToRight = CalInterfaceIsLeftToRight();
        double v34 = -0.0;
        if (!IsLeftToRight) {
          double v34 = v32;
        }
        double v23 = v23 + v34;
      }
      if (self->_timeString)
      {
        double v29 = v59;
        if ([(MonthViewOccurrence *)self drawsTimeAtBottom])
        {
          -[MonthViewOccurrence timeFrameForFrame:](self, "timeFrameForFrame:", x, y, width, height);
          double v36 = v35;
          double v38 = v37;
          double v40 = v39;
          double v42 = v41;
          +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:1.0];
          double v44 = v38 + v43;
          v45 = [(MonthViewOccurrence *)self attributedTime];
          -[MonthViewOccurrence _drawString:inTextRect:withTrailingFade:](self, "_drawString:inTextRect:withTrailingFade:", v45, 0, v36, v44, v40, v42);
        }
        else
        {
          v46 = [(MonthViewOccurrence *)self timeString];
          -[MonthViewOccurrence widthDrawingTime:textRect:](self, "widthDrawingTime:textRect:", v46, v23, v25, v27, v59);
          double v48 = v47;

          double v27 = v27 - v48;
          int v49 = CalInterfaceIsLeftToRight();
          double v50 = -0.0;
          if (!v49) {
            double v50 = v48;
          }
          double v23 = v23 + v50;
        }
      }
      else
      {
        double v29 = v59;
      }
    }
    v51 = [(MonthViewOccurrence *)self attributedTitle];
    if ([(MonthViewOccurrence *)self textWraps]) {
      [v51 drawWithRect:33 options:0 context:v23 v25, v27, v29];
    }
    else {
      -[MonthViewOccurrence _drawString:inTextRect:withTrailingFade:](self, "_drawString:inTextRect:withTrailingFade:", v51, self->_compact, v23, v25, v27, v29);
    }
  }
LABEL_39:
  subOccurrences = self->_subOccurrences;
  if (subOccurrences)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v53 = subOccurrences;
    id v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v54)
    {
      id v55 = v54;
      uint64_t v56 = *(void *)v61;
      do
      {
        for (i = 0; i != v55; i = (char *)i + 1)
        {
          if (*(void *)v61 != v56) {
            objc_enumerationMutation(v53);
          }
          v58 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          [v58 occFrame];
          [v58 _drawInFrame:v9];
        }
        id v55 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v60 objects:v64 count:16];
      }
      while (v55);
    }
  }
  if ([(MonthViewOccurrence *)self fadeLeftEdge]
    || [(MonthViewOccurrence *)self fadeRightEdge])
  {
    CGContextRestoreGState(CurrentContext);
  }
  +[UITraitCollection setCurrentTraitCollection:v10];
}

- (void)_updateOccurrenceWithForce:(BOOL)a3
{
  BOOL v5 = [(MonthViewOccurrence *)self occurrence];
  if (v5 && (a3 || !self->_updateOccurrenceHasBeenCalled))
  {
    id v11 = v5;
    [(MonthViewOccurrence *)self _updateOccurrenceBackgroundParameters];
    [(MonthViewOccurrence *)self _updateColorsForUserInterfaceStyle:self->_lastUserInterfaceStyle];
    [(MonthViewOccurrence *)self _updateDotImage];
    double v6 = [(EKEvent *)self->_occurrence title];
    if (v6)
    {
      CUIKDisplayedTitleForEvent();
      double v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      occurrenceString = self->_occurrenceString;
      self->_occurrenceString = v7;
    }
    else
    {
      occurrenceString = +[NSBundle bundleForClass:objc_opt_class()];
      id v9 = [occurrenceString localizedStringForKey:@"Untitled event" value:@"New Event" table:0];
      double v10 = self->_occurrenceString;
      self->_occurrenceString = v9;
    }
    [(MonthViewOccurrence *)self _updateTimeStrings];
    [(MonthViewOccurrence *)self _updateSubviewsIfNeeded];
    self->_updateOccurrenceHasBeenCalled = 1;

    BOOL v5 = v11;
  }
}

- (void)_updateSubviewsIfNeeded
{
  if (self->_backgroundImageView)
  {
    if ([(MonthViewOccurrence *)self _showBackground])
    {
      char v3 = [(MonthViewOccurrence *)self backgroundImage];
      [(UIImageView *)self->_backgroundImageView setImage:v3];
    }
    else
    {
      [(UIImageView *)self->_backgroundImageView setImage:0];
    }
    [(UIImageView *)self->_backgroundImageView setClipsToBounds:1];
    unint64_t v4 = [(MonthViewOccurrence *)self backGroundCornerMask];
    BOOL v5 = [(UIImageView *)self->_backgroundImageView layer];
    [v5 setMaskedCorners:v4];

    [(MonthViewOccurrence *)self backgroundAlpha];
    -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:");
    [(MonthViewOccurrence *)self _updateDotImageView];
    double v6 = [(MonthViewOccurrence *)self attributedTitleForLabel];
    [(TrailingFadeLabel *)self->_titleLabel setAttributedText:v6];

    double v7 = [(MonthViewOccurrence *)self attributedTitleForWrappingLabel];
    [(UILabel *)self->_wrappingTitleLabel setAttributedText:v7];

    if (self->_timeString)
    {
      id v8 = [(MonthViewOccurrence *)self attributedTime];
      [(UILabel *)self->_timeLabel setAttributedText:v8];
    }
  }
}

- (void)_updateDotImageView
{
  [(UIImageView *)self->_dotImageView setImage:self->_dotImage];
  dotImageView = self->_dotImageView;

  [(UIImageView *)dotImageView sizeToFit];
}

- (BOOL)_showBackground
{
  if (*((unsigned char *)self + 72) & 1) != 0 || self->_compact || (*((unsigned char *)self + 56)) {
    LOBYTE(v2) = 1;
  }
  else {
    return (*((unsigned __int8 *)self + 56) >> 1) & 1;
  }
  return v2;
}

- (BOOL)isNarrow
{
  BOOL v3 = [(MonthViewOccurrence *)self compact];
  if (v3)
  {
    double height = self->_occFrame.size.height;
    +[MonthViewOccurrence compactOccurrenceHeight];
    LOBYTE(v3) = height < v5;
  }
  return v3;
}

- (BOOL)textWraps
{
  BOOL v3 = [(MonthViewOccurrence *)self compact];
  if (v3)
  {
    double height = self->_occFrame.size.height;
    +[MonthViewOccurrence compactOccurrenceHeight];
    LOBYTE(v3) = height > v5 + v5;
  }
  return v3;
}

- (BOOL)drawsTimeAtBottom
{
  BOOL v3 = [(MonthViewOccurrence *)self compact];
  if (v3)
  {
    BOOL v3 = [(MonthViewOccurrence *)self textWraps];
    if (v3)
    {
      double height = self->_occFrame.size.height;
      +[MonthViewOccurrence compactOccurrenceHeight];
      LOBYTE(v3) = height > v5 * 2.5;
    }
  }
  return v3;
}

- (double)radius
{
  [(MonthViewOccurrence *)self bounds];
  double v4 = fmin(v3 * 0.5, 4.0);
  if ((*((unsigned char *)self + 56) & 1) != 0 && self->_compact && ![(MonthViewOccurrence *)self isNarrow])
  {
    [(MonthViewOccurrence *)self bounds];
    return v5 * 0.5;
  }
  return v4;
}

- (void)relayoutSubviews
{
  [(MonthViewOccurrence *)self frame];
  if (v3 != 0.0)
  {
    double v4 = [(MonthViewOccurrence *)self occurrence];

    if (v4)
    {
      p_wrappingTitleLabel = &self->_wrappingTitleLabel;
      [(UILabel *)self->_wrappingTitleLabel alpha];
      BOOL v7 = v6 > 0.0;
      [(MonthViewOccurrence *)self bounds];
      CalRoundToScreenScale();
      double v9 = v8;
      +[MonthViewOccurrence compactOccurrenceHeight];
      if (v9 >= v10)
      {
        if (self->_dotImage) {
          [(UIImageView *)self->_dotImageView setAlpha:1.0];
        }
        if ([(MonthViewOccurrence *)self textWraps])
        {
          [(UILabel *)*p_wrappingTitleLabel setAlpha:1.0];
          p_titleLabel = (id *)&self->_titleLabel;
          BOOL v7 = 1;
        }
        else
        {
          [(TrailingFadeLabel *)self->_titleLabel setAlpha:1.0];
          p_titleLabel = (id *)&self->_wrappingTitleLabel;
        }
        double v11 = 0.0;
        [*p_titleLabel setAlpha:0.0];
        unsigned int v14 = [(MonthViewOccurrence *)self drawsTimeAtBottom];
        p_timeLabel = &self->_timeLabel;
        if (v14) {
          double v11 = 1.0;
        }
      }
      else
      {
        double v11 = 0.0;
        [(TrailingFadeLabel *)self->_titleLabel setAlpha:0.0];
        [(UIImageView *)self->_dotImageView setAlpha:0.0];
        [(UILabel *)self->_timeLabel setAlpha:0.0];
        p_timeLabel = &self->_wrappingTitleLabel;
      }
      [(UILabel *)*p_timeLabel setAlpha:v11];
      [(MonthViewOccurrence *)self backgroundInsets];
      double v16 = v15;
      double v18 = v17;
      [(MonthViewOccurrence *)self bounds];
      double v20 = v19 - v16 - v18;
      [(MonthViewOccurrence *)self bounds];
      -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:", v16, 0.0, v20);
      [(MonthViewOccurrence *)self radius];
      double v22 = v21;
      double v23 = [(UIImageView *)self->_backgroundImageView layer];
      [v23 setCornerRadius:v22];

      [(MonthViewOccurrence *)self bounds];
      -[UIView setFrame:](self->_backgroundView, "setFrame:");
      [(MonthViewOccurrence *)self bounds];
      -[MonthViewOccurrence _pointForDotInFrame:withDot:](self, "_pointForDotInFrame:withDot:", self->_dotImage);
      double v25 = v24;
      double v27 = v26;
      [(UIImage *)self->_dotImage size];
      double v29 = v25 + v28 * 0.5;
      [(UIImage *)self->_dotImage size];
      -[UIImageView setCenter:](self->_dotImageView, "setCenter:", v29, v27 + v30 * 0.5);
      BOOL v31 = (*((unsigned char *)self + 56) & 1) != 0 && self->_splitLeftEdge;
      [(UIImageView *)self->_dotImageView setHidden:v31];
      double v32 = [(MonthViewOccurrence *)self occurrenceString];

      if (v32)
      {
        [(MonthViewOccurrence *)self bounds];
        -[MonthViewOccurrence textFrameForFrame:](self, "textFrameForFrame:");
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        double v40 = v39;
        +[MonthViewOccurrence compactOccurrenceHeight];
        double v42 = v41;
        [(TrailingFadeLabel *)self->_titleLabel frame];
        if (v38 == v44 && v42 == v43)
        {
          v63.origin.double x = v34;
          v63.origin.double y = v36;
          v63.size.double width = v38;
          v63.size.double height = v42;
          double MidX = CGRectGetMidX(v63);
          v64.origin.double x = v34;
          v64.origin.double y = v36;
          v64.size.double width = v38;
          v64.size.double height = v42;
          -[TrailingFadeLabel setCenter:](self->_titleLabel, "setCenter:", MidX, CGRectGetMidY(v64));
        }
        else
        {
          -[TrailingFadeLabel setFrame:](self->_titleLabel, "setFrame:", v34, v36, v38, v42);
        }
        v46 = *p_wrappingTitleLabel;
        if (v7)
        {
          [(UILabel *)v46 setHidden:0];
          [(UILabel *)*p_wrappingTitleLabel setNumberOfLines:0];
          [(UILabel *)*p_wrappingTitleLabel sizeToFit];
          [(UILabel *)*p_wrappingTitleLabel setNumberOfLines:2];
          [(UILabel *)*p_wrappingTitleLabel frame];
          if (v47 <= v40)
          {
            [(UILabel *)*p_wrappingTitleLabel frame];
            double v40 = v49;
            CalRoundToScreenScale();
          }
          else
          {
            double v48 = -1.5;
          }
          +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:0 shouldScaleForSmallerSizes:v48];
          -[UILabel setFrame:](*p_wrappingTitleLabel, "setFrame:", v34, v50, v38, v40);
        }
        else
        {
          [(UILabel *)v46 setHidden:1];
        }
      }
      if (self->_timeString)
      {
        [(MonthViewOccurrence *)self bounds];
        -[MonthViewOccurrence timeFrameForFrame:](self, "timeFrameForFrame:");
        double v52 = v51;
        double v54 = v53;
        double v56 = v55;
        double v58 = v57;
        [(UILabel *)self->_timeLabel frame];
        if (v56 == v60 && v58 == v59)
        {
          v65.origin.double x = v52;
          v65.origin.double y = v54;
          v65.size.double width = v56;
          v65.size.double height = v58;
          double v61 = CGRectGetMidX(v65);
          v66.origin.double x = v52;
          v66.origin.double y = v54;
          v66.size.double width = v56;
          v66.size.double height = v58;
          -[UILabel setCenter:](self->_timeLabel, "setCenter:", v61, CGRectGetMidY(v66));
        }
        else
        {
          -[UILabel setFrame:](self->_timeLabel, "setFrame:", v52, v54, v56, v58);
        }
      }
      [(MonthViewOccurrence *)self _updateFadeWidth];
      [(MonthViewOccurrence *)self _updateFadeVisibility];
      [(MonthViewOccurrence *)self _updateFadeDirection];
    }
  }
}

- (void)_updateFadeWidth
{
  [(MonthViewOccurrence *)self bounds];
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
  [(MonthViewOccurrence *)self bounds];
  double v4 = -8.0 / v3;
  [(MonthViewOccurrence *)self bounds];
  v11[0] = &off_1001DCCB0;
  double v5 = v4 + 1.0;
  double v7 = -0.0 / v6;
  double v8 = +[NSNumber numberWithDouble:v5];
  v11[1] = v8;
  double v9 = +[NSNumber numberWithDouble:v7 + 1.0];
  v11[2] = v9;
  v11[3] = &off_1001DCCC0;
  double v10 = +[NSArray arrayWithObjects:v11 count:4];
  [(CAGradientLayer *)self->_gradientLayer setLocations:v10];

  [(CAGradientLayer *)self->_gradientLayer setNeedsDisplay];
}

- (void)_updateFadeDirection
{
  if ([(MonthViewOccurrence *)self fadeLeftEdge] && (CalInterfaceIsLeftToRight() & 1) != 0
    || [(MonthViewOccurrence *)self fadeRightEdge] && !CalInterfaceIsLeftToRight())
  {
    double v3 = 1.0;
    double v4 = 0.0;
  }
  else
  {
    double v3 = 0.0;
    double v4 = 1.0;
  }
  -[CAGradientLayer setStartPoint:](self->_gradientLayer, "setStartPoint:", v3, 0.0);
  gradientLayer = self->_gradientLayer;

  -[CAGradientLayer setEndPoint:](gradientLayer, "setEndPoint:", v4, 0.0);
}

- (void)_updateFadeVisibility
{
  if ([(MonthViewOccurrence *)self fadeLeftEdge]
    || [(MonthViewOccurrence *)self fadeRightEdge])
  {
    gradientLayer = self->_gradientLayer;
    double v4 = [(MonthViewOccurrence *)self layer];
    id v6 = v4;
    double v5 = gradientLayer;
  }
  else
  {
    double v4 = [(MonthViewOccurrence *)self layer];
    id v6 = v4;
    double v5 = 0;
  }
  [v4 setMask:v5];
}

- (unint64_t)backGroundCornerMask
{
  if (self->_splitLeftEdge)
  {
    unint64_t v3 = 0;
    unint64_t result = 0;
    if (self->_splitRightEdge) {
      return result;
    }
    goto LABEL_3;
  }
  if (CalTimeDirectionIsLeftToRight()) {
    unint64_t v3 = 5;
  }
  else {
    unint64_t v3 = 10;
  }
  unint64_t result = v3;
  if (!self->_splitRightEdge)
  {
LABEL_3:
    if (CalTimeDirectionIsLeftToRight()) {
      return v3 | 0xA;
    }
    else {
      return v3 | 5;
    }
  }
  return result;
}

- (double)backgroundAlpha
{
  double result = 1.0;
  if ((*((unsigned char *)self + 72) & 1) == 0)
  {
    unsigned int v4 = [(MonthViewOccurrence *)self isNarrow];
    double result = 0.25;
    if (v4)
    {
      double v5 = [(MonthViewOccurrence *)self traitCollection];
      id v6 = [v5 userInterfaceStyle];

      double result = 0.699999988;
      if (v6 != (id)2) {
        return 0.5;
      }
    }
  }
  return result;
}

- (void)setDrawBackgroundWithLayer:(BOOL)a3
{
  if (self->_drawBackgroundWithLayer != a3)
  {
    BOOL v3 = a3;
    self->_drawBackgroundWithLayer = a3;
    if (a3)
    {
      double v5 = (UIView *)objc_opt_new();
      backgroundView = self->_backgroundView;
      self->_backgroundView = v5;

      p_backgroundImageView = &self->_backgroundImageView;
      [(MonthViewOccurrence *)self insertSubview:self->_backgroundView belowSubview:self->_backgroundImageView];
    }
    else
    {
      [(UIView *)self->_backgroundView removeFromSuperview];
      p_backgroundImageView = &self->_backgroundImageView;
    }
    double v8 = *p_backgroundImageView;
    [(UIImageView *)v8 setHidden:v3];
  }
}

- (void)updateBackgroundWithEdgeInsets:(UIEdgeInsets)a3 color:(id)a4 alpha:(double)a5 cornerMask:(unint64_t)a6
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v13 = a4;
  [(MonthViewOccurrence *)self bounds];
  -[UIView setFrame:](self->_backgroundView, "setFrame:", left + v14, top + v15, v16 - (left + right), v17 - (top + bottom));
  [(UIView *)self->_backgroundView setBackgroundColor:v13];

  [(UIView *)self->_backgroundView setAlpha:a5];
  [(UIView *)self->_backgroundView setClipsToBounds:1];
  double v18 = [(UIView *)self->_backgroundView layer];
  [v18 setMaskedCorners:a6];

  [(MonthViewOccurrence *)self radius];
  double v20 = v19;
  id v21 = [(UIView *)self->_backgroundView layer];
  [v21 setCornerRadius:v20];
}

- (void)_updateOccurrenceBackgroundParameters
{
  uint64_t v3 = [(MonthViewOccurrence *)self occurrence];
  self->_int invitationType = 0;
  id v7 = (id)v3;
  int v4 = CUIKEventParticipantStatusForDisplay();
  if ((v4 - 1) >= 3)
  {
    double v5 = [(MonthViewOccurrence *)self occurrence];
    id v6 = [v5 status];

    if (v6 != (id)3) {
      goto LABEL_5;
    }
    int v4 = 4;
  }
  self->_int invitationType = v4;
LABEL_5:
}

- (void)_updateDotImage
{
  if (qword_100216BC0 != -1) {
    dispatch_once(&qword_100216BC0, &stru_1001D5DF0);
  }
  if (self->_compact
    && +[CompactMonthWeekView usesRoundedRectInsteadOfCircle])
  {
    dotImage = self->_dotImage;
    self->_dotImage = 0;
  }
  else
  {
    int v4 = [(MonthViewOccurrence *)self occurrence];
    double v5 = [v4 image];

    if (v5 && [v5 type] == (id)1)
    {
      id v6 = +[CUIKSemiConstantCache sharedInstance];
      id v7 = [v5 name];
      double v8 = [v6 symbolImage:v7 forFont:self->_font];
      double v9 = self->_dotImage;
      self->_dotImage = v8;

      double v10 = self->_dotImage;
      double v11 = +[UIColor systemBackgroundColor];
      double v12 = [(UIImage *)v10 flattenedImageWithColor:v11];
      id v13 = self->_dotImage;
      self->_dotImage = v12;
    }
    else
    {
      char v14 = *((unsigned char *)self + 56);
      double v15 = [(MonthViewOccurrence *)self occurrence];
      double v16 = [(MonthViewOccurrence *)self occurrence];
      double v17 = [v15 CUIK_symbolName:[v16 isAllDay]];

      if ((v14 & 8) != 0)
      {
        if (*((unsigned char *)self + 72))
        {
          double v28 = +[UIColor systemWhiteColor];
        }
        else
        {
          char v24 = *((unsigned char *)self + 56);
          double v25 = [(MonthViewOccurrence *)self occurrence];
          double v26 = v25;
          if ((v24 & 0x20) != 0) {
            [v25 CUIK_symbolColor];
          }
          else {
          double v28 = [v25 CUIK_disabledSymbolColor];
          }
        }
        [(UIFont *)self->_font pointSize];
        double v30 = +[UIImageSymbolConfiguration configurationWithPointSize:7 weight:2 scale:v29 + -1.0];
        BOOL v31 = +[UIImage systemImageNamed:v17 withConfiguration:v30];
        double v32 = self->_dotImage;
        self->_dotImage = v31;

        double v33 = [(UIImage *)self->_dotImage flattenedImageWithColor:v28];
        double v34 = self->_dotImage;
        self->_dotImage = v33;
      }
      else if (v17 && self->_color)
      {
        double v18 = [(MonthViewOccurrence *)self occurrence];
        [v18 status];

        double v19 = [(MonthViewOccurrence *)self occurrence];
        CUIKEventDisplaysAsDeclined();

        double v20 = [(MonthViewOccurrence *)self traitCollection];
        [v20 userInterfaceStyle];
        id v21 = [(MonthViewOccurrence *)self occurrence];
        [v21 needsResponse];
        double v22 = [(MonthViewOccurrence *)self occurrence];
        [v22 isReminderIntegrationEvent];
        double v23 = CUIKColorBarColor();

        if (*((unsigned char *)self + 72)) {
          +[UIColor systemWhiteColor];
        }
        else {
        double v35 = +[UIColor systemBackgroundColor];
        }
        v43[0] = v35;
        v43[1] = v23;
        double v36 = +[NSArray arrayWithObjects:v43 count:2];
        double v37 = +[UIImageSymbolConfiguration configurationWithPaletteColors:v36];

        [(UIFont *)self->_font pointSize];
        double v38 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 2);
        double v39 = [v37 configurationByApplyingConfiguration:v38];
        double v40 = +[UIImage systemImageNamed:v17 withConfiguration:v39];
        double v41 = self->_dotImage;
        self->_dotImage = v40;
      }
      else
      {
        double v27 = self->_dotImage;
        self->_dotImage = 0;
      }
    }
    if (self->_dotImageView)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100123FF0;
      block[3] = &unk_1001D2740;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_updateTimeStrings
{
  timeString = self->_timeString;
  self->_timeString = 0;

  endTimeString = self->_endTimeString;
  self->_endTimeString = 0;

  if ([(MonthViewOccurrence *)self isSingleDay])
  {
    id v11 = [(EKEvent *)self->_occurrence startCalendarDate];
    -[MonthViewOccurrence _timeString:](self, "_timeString:");
    double v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_timeString;
    self->_timeString = v5;
  }
  else
  {
    if (self->_splitRightEdge) {
      return;
    }
    id v11 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v11 localizedStringForKey:@"ends %@" value:&stru_1001D6918 table:0];
    id v7 = [(EKEvent *)self->_occurrence endCalendarDate];
    double v8 = [(MonthViewOccurrence *)self _timeString:v7];
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v8);
    double v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    double v10 = self->_endTimeString;
    self->_endTimeString = v9;
  }
}

- (void)setSelected:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 72);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 72) = v3 & 0xFE | a3;
    [(MonthViewOccurrence *)self _updateColorsForUserInterfaceStyle:self->_lastUserInterfaceStyle];
    [(MonthViewOccurrence *)self _updateDotImage];
  }
}

- (BOOL)selected
{
  p_parent = &self->_parent;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  if (!WeakRetained) {
    return *((unsigned char *)self + 72) & 1;
  }
  id v5 = objc_loadWeakRetained((id *)p_parent);
  unsigned __int8 v6 = [v5 selected];

  return v6;
}

- (void)_updateColorsForUserInterfaceStyle:(int64_t)a3
{
  int v4 = self->_occurrence;
  double v9 = v4;
  if ((*((unsigned char *)self + 56) & 4) != 0)
  {
    id v7 = CUIKBirthdayMonthCalendarColor();
    if (!v7)
    {
LABEL_8:
      id v7 = +[UIColor secondaryLabelColor];
    }
  }
  else
  {
    if ((*((unsigned char *)self + 56) & 8) != 0)
    {
      id v5 = CUIKIntegrationEventBackgroundColor();
      id v7 = CUIKAdjustedColorForColor();
    }
    else
    {
      id v5 = [(EKEvent *)v4 calendar];
      unsigned __int8 v6 = [v5 displayColor];
      id v7 = CUIKAdjustedColorForColor();
    }
    if (!v7) {
      goto LABEL_8;
    }
  }
  p_color = &self->_color;
  if (!*p_color || (objc_msgSend(v7, "isEqual:") & 1) == 0) {
    objc_storeStrong((id *)p_color, v7);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_occFrame = &self->_occFrame;
  if (!CGRectEqualToRect(a3, self->_occFrame))
  {
    double v9 = p_occFrame->size.height;
    if (width == p_occFrame->size.width && height == v9)
    {
      p_occFrame->origin.double x = x;
      p_occFrame->origin.double y = y;
      p_occFrame->size.double width = width;
      p_occFrame->size.double height = height;
      v22.origin.double x = x;
      v22.origin.double y = y;
      v22.size.double width = width;
      v22.size.double height = height;
      double MidX = CGRectGetMidX(v22);
      v23.origin.double x = x;
      v23.origin.double y = y;
      v23.size.double width = width;
      v23.size.double height = height;
      CGFloat MidY = CGRectGetMidY(v23);
      v20.receiver = self;
      v20.super_class = (Class)MonthViewOccurrence;
      -[MonthViewOccurrence setCenter:](&v20, "setCenter:", MidX, MidY);
      glowLayer = self->_glowLayer;
      [(MonthViewOccurrence *)self bounds];
      -[CALayer setFrame:](glowLayer, "setFrame:");
    }
    else
    {
      if (self->_color)
      {
        if (self->_compact)
        {
          +[MonthViewOccurrence compactOccurrenceHeight];
          BOOL v12 = v9 >= v11;
          +[MonthViewOccurrence compactOccurrenceHeight];
          if (((v12 ^ (height < v13)) & 1) == 0)
          {
            p_occFrame->origin.double x = x;
            p_occFrame->origin.double y = y;
            p_occFrame->size.double width = width;
            p_occFrame->size.double height = height;
            char v14 = [(MonthViewOccurrence *)self backgroundImage];
            [(UIImageView *)self->_backgroundImageView setImage:v14];

            [(MonthViewOccurrence *)self backgroundAlpha];
            -[UIImageView setAlpha:](self->_backgroundImageView, "setAlpha:");
          }
        }
      }
      p_occFrame->origin.double x = x;
      p_occFrame->origin.double y = y;
      p_occFrame->size.double width = width;
      p_occFrame->size.double height = height;
      double v15 = [(MonthViewOccurrence *)self layer];
      [v15 setFrame:CGRectMake(x, y, width, height)];

      double v16 = self->_glowLayer;
      [(MonthViewOccurrence *)self bounds];
      -[CALayer setFrame:](v16, "setFrame:");
      [(MonthViewOccurrence *)self relayoutSubviews];
    }
  }
}

- (CGRect)occFrame
{
  double x = self->_occFrame.origin.x;
  double y = self->_occFrame.origin.y;
  double width = self->_occFrame.size.width;
  double height = self->_occFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAlpha:(double)a3
{
  self->_occAlpha = a3;
  v3.receiver = self;
  v3.super_class = (Class)MonthViewOccurrence;
  -[MonthViewOccurrence setAlpha:](&v3, "setAlpha:");
}

- (double)occAlpha
{
  return self->_occAlpha;
}

- (void)setOccurrence:(id)a3
{
  id v5 = (EKEvent *)a3;
  p_occurrence = &self->_occurrence;
  if (self->_occurrence != v5)
  {
    objc_super v20 = v5;
    objc_storeStrong((id *)p_occurrence, a3);
    *((unsigned char *)self + 56) = *((unsigned char *)self + 56) & 0xFE | [(EKEvent *)v20 isAllDay];
    id v7 = [(EKEvent *)v20 calendar];
    *((unsigned char *)self + 56) = *((unsigned char *)self + 56) & 0xFB | (4 * ([v7 type] == (id)4));

    if ([(EKEvent *)v20 isReminderIntegrationEvent]) {
      char v8 = 8;
    }
    else {
      char v8 = 0;
    }
    *((unsigned char *)self + 56) = *((unsigned char *)self + 56) & 0xF7 | v8;
    unsigned int v9 = [(EKEvent *)v20 completed];
    char v10 = 0;
    if (v9) {
      char v11 = 16;
    }
    else {
      char v11 = 0;
    }
    *((unsigned char *)self + 56) = *((unsigned char *)self + 56) & 0xEF | v11;
    if ((*((unsigned char *)self + 56) & 8) != 0)
    {
      if ([(EKEvent *)v20 CUIK_reminderShouldBeEditable]) {
        char v10 = 32;
      }
      else {
        char v10 = 0;
      }
    }
    *((unsigned char *)self + 56) = *((unsigned char *)self + 56) & 0xDF | v10;
    BOOL v12 = [(EKEvent *)v20 calendar];
    if ([v12 isHolidayCalendar]) {
      char v13 = 64;
    }
    else {
      char v13 = 0;
    }
    *((unsigned char *)self + 56) = *((unsigned char *)self + 56) & 0xBF | v13;

    if ((*((unsigned char *)self + 56) & 4) != 0)
    {
      *((unsigned char *)self + 56) |= 4u;
    }
    else
    {
      char v14 = [(EKEvent *)v20 calendar];
      double v15 = [v14 source];
      double v16 = [v15 appGroupIdentifier];
      if ([v16 isEqualToString:EKSourceBirthdaysAppGroupID])
      {
        double v17 = [(EKEvent *)v20 calendar];
        double v18 = [v17 externalID];
        if ([v18 isEqualToString:EKBirthdayCalendarExternalIdentifier]) {
          char v19 = 4;
        }
        else {
          char v19 = 0;
        }
        *((unsigned char *)self + 56) = *((unsigned char *)self + 56) & 0xFB | v19;
      }
      else
      {
        *((unsigned char *)self + 56) &= ~4u;
      }
    }
    id v5 = v20;
  }

  _objc_release_x1(p_occurrence, v5);
}

- (id)occurrence
{
  return self->_occurrence;
}

- (void)updateView
{
}

- (void)setSplitLeftEdge:(BOOL)a3 splitRightEdge:(BOOL)a4
{
  BOOL splitRightEdge = self->_splitRightEdge;
  self->_splitLeftEdge = a3;
  self->_BOOL splitRightEdge = a4;
  if (splitRightEdge != a4) {
    [(MonthViewOccurrence *)self _updateTimeStrings];
  }
}

- (id)lengthForSorting
{
  return +[NSNumber numberWithUnsignedInteger:self->_dayRange.length];
}

- (unint64_t)length
{
  return self->_dayRange.length;
}

- (unint64_t)startRange
{
  return self->_dayRange.location;
}

- (unint64_t)endRange
{
  return self->_cachedEndRange;
}

- (unint64_t)gapBetweenBlock:(id)a3
{
  int v4 = (MonthViewOccurrence *)a3;
  unint64_t v5 = [(MonthViewOccurrence *)self startRange];
  if (v5 <= [(MonthViewOccurrence *)v4 endRange])
  {
    unint64_t v7 = [(MonthViewOccurrence *)v4 startRange];
    unint64_t v8 = [(MonthViewOccurrence *)self endRange];
    unsigned __int8 v6 = v4;
    if (v7 <= v8)
    {
      unint64_t v10 = -1;
      goto LABEL_6;
    }
  }
  else
  {
    unsigned __int8 v6 = self;
    self = v4;
  }
  unsigned int v9 = [(MonthViewOccurrence *)v6 startRange];
  unint64_t v10 = v9 - (unsigned char *)[(MonthViewOccurrence *)self endRange];
LABEL_6:

  return v10;
}

- (double)startTime
{
  BOOL v2 = [(MonthViewOccurrence *)self occurrence];
  objc_super v3 = [v2 startDate];
  [v3 timeIntervalSinceReferenceDate];
  double v5 = v4;

  return v5;
}

- (void)addSegmentWithFrame:(CGRect)a3 splitLeftEdge:(BOOL)a4 splitRightEdge:(BOOL)a5 fadeLeftEdge:(BOOL)a6 fadeRightEdge:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_subOccurrences)
  {
    double v16 = [MonthViewOccurrence alloc];
    double v17 = [(MonthViewOccurrence *)self occurrence];
    objc_super v20 = -[MonthViewOccurrence initWithFrame:occurrence:forDayRange:isCompact:isMultiDay:](v16, "initWithFrame:occurrence:forDayRange:isCompact:isMultiDay:", v17, self->_dayRange.location, self->_dayRange.length, [(MonthViewOccurrence *)self compact], (*((unsigned __int8 *)self + 56) >> 1) & 1, x, y, width, height);

    [(MonthViewOccurrence *)v20 setParent:self];
    [(MonthViewOccurrence *)v20 setHidden:[(MonthViewOccurrence *)self hidden]];
    [(MonthViewOccurrence *)v20 setSplitLeftEdge:v10 splitRightEdge:v9];
    [(MonthViewOccurrence *)v20 setFadeLeftEdge:v8];
    [(MonthViewOccurrence *)v20 setFadeRightEdge:v7];
    [(NSMutableArray *)self->_subOccurrences addObject:v20];
  }
  else
  {
    double v18 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    subOccurrences = self->_subOccurrences;
    self->_subOccurrences = v18;

    -[MonthViewOccurrence setFrame:](self, "setFrame:", x, y, width, height);
    self->_splitLeftEdge = v10;
    self->_BOOL splitRightEdge = v9;
    [(MonthViewOccurrence *)self setFadeLeftEdge:v8];
    [(MonthViewOccurrence *)self setFadeRightEdge:v7];
  }
}

- (void)resetSegments
{
  self->_subOccurrences = 0;
  _objc_release_x1();
}

- (CGRect)intersectingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(MonthViewOccurrence *)self frame];
  v45.origin.CGFloat x = v8;
  v45.origin.CGFloat y = v9;
  v45.size.CGFloat width = v10;
  v45.size.CGFloat height = v11;
  double v33 = x;
  double v34 = y;
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  double v35 = width;
  double v36 = height;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  if (CGRectIntersectsRect(v42, v45))
  {
    [(MonthViewOccurrence *)self frame];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
  }
  else
  {
    subOccurrences = self->_subOccurrences;
    if (subOccurrences)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v21 = subOccurrences;
      id v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v38;
        CGFloat v25 = CGRectZero.origin.y;
        CGFloat v26 = CGRectZero.size.width;
        CGFloat v27 = CGRectZero.size.height;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            [*(id *)(*((void *)&v37 + 1) + 8 * i) intersectingRect:v33, v34, v35, v36, *(void *)&v33, *(void *)&v34, *(void *)&v35, *(void *)&v36, (void)v37];
            CGFloat v13 = v43.origin.x;
            CGFloat v15 = v43.origin.y;
            CGFloat v17 = v43.size.width;
            CGFloat v19 = v43.size.height;
            v46.origin.CGFloat x = CGRectZero.origin.x;
            v46.origin.CGFloat y = v25;
            v46.size.CGFloat width = v26;
            v46.size.CGFloat height = v27;
            if (!CGRectEqualToRect(v43, v46))
            {

              goto LABEL_15;
            }
          }
          id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v37 objects:v41 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
    }
    CGFloat v13 = CGRectZero.origin.x;
    CGFloat v15 = CGRectZero.origin.y;
    CGFloat v17 = CGRectZero.size.width;
    CGFloat v19 = CGRectZero.size.height;
  }
LABEL_15:
  double v29 = v13;
  double v30 = v15;
  double v31 = v17;
  double v32 = v19;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (CGRect)isPointInView:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MonthViewOccurrence *)self frame];
  double v27 = x;
  double v28 = y;
  v34.CGFloat x = x;
  v34.CGFloat y = y;
  if (CGRectContainsPoint(v35, v34))
  {
    [(MonthViewOccurrence *)self frame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
  }
  else
  {
    subOccurrences = self->_subOccurrences;
    if (subOccurrences)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      CGFloat v15 = subOccurrences;
      id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v30;
        CGFloat v19 = CGRectZero.origin.y;
        CGFloat width = CGRectZero.size.width;
        CGFloat height = CGRectZero.size.height;
        while (2)
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v30 != v18) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v29 + 1) + 8 * i) isPointInView:v27 v28 *(void *)&v27 *(void *)&v28 v29];
            CGFloat v7 = v36.origin.x;
            CGFloat v9 = v36.origin.y;
            CGFloat v11 = v36.size.width;
            CGFloat v13 = v36.size.height;
            v38.origin.CGFloat x = CGRectZero.origin.x;
            v38.origin.CGFloat y = v19;
            v38.size.CGFloat width = width;
            v38.size.CGFloat height = height;
            if (!CGRectEqualToRect(v36, v38))
            {

              goto LABEL_15;
            }
          }
          id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }
    }
    CGFloat v7 = CGRectZero.origin.x;
    CGFloat v9 = CGRectZero.origin.y;
    CGFloat v11 = CGRectZero.size.width;
    CGFloat v13 = CGRectZero.size.height;
  }
LABEL_15:
  double v23 = v7;
  double v24 = v9;
  double v25 = v11;
  double v26 = v13;
  result.size.CGFloat height = v26;
  result.size.CGFloat width = v25;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v23;
  return result;
}

- (BOOL)isPointInSymbol:(CGPoint)a3
{
  if (!self->_dotImage) {
    return 0;
  }
  double x = a3.x;
  -[MonthViewOccurrence _pointForDotInFrame:withDot:](self, "_pointForDotInFrame:withDot:", self->_occFrame.origin.x, self->_occFrame.origin.y, self->_occFrame.size.width, self->_occFrame.size.height);
  double v6 = v5;
  if (!CalInterfaceIsLeftToRight()) {
    return x >= v6;
  }
  [(UIImage *)self->_dotImage size];
  return x <= v6 + v7;
}

- (BOOL)isTentative
{
  return self->_invitationType == 1;
}

- (BOOL)needsReply
{
  return self->_invitationType == 2;
}

- (BOOL)isDeclined
{
  return self->_invitationType == 3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (BOOL)drawsEmpty
{
  return self->_drawsEmpty;
}

- (void)setDrawsEmpty:(BOOL)a3
{
  self->_drawsEmptCGFloat y = a3;
}

- (BOOL)splitLeftEdge
{
  return self->_splitLeftEdge;
}

- (void)setSplitLeftEdge:(BOOL)a3
{
  self->_splitLeftEdge = a3;
}

- (BOOL)splitRightEdge
{
  return self->_splitRightEdge;
}

- (void)setSplitRightEdge:(BOOL)a3
{
  self->_BOOL splitRightEdge = a3;
}

- (BOOL)fadeLeftEdge
{
  return self->_fadeLeftEdge;
}

- (void)setFadeLeftEdge:(BOOL)a3
{
  self->_fadeLeftEdge = a3;
}

- (BOOL)fadeRightEdge
{
  return self->_fadeRightEdge;
}

- (void)setFadeRightEdge:(BOOL)a3
{
  self->_fadeRightEdge = a3;
}

- (double)firstWidth
{
  return self->_firstWidth;
}

- (void)setFirstWidth:(double)a3
{
  self->_firstWidth = a3;
}

- (_NSRange)dayRange
{
  p_dayRange = &self->_dayRange;
  NSUInteger location = self->_dayRange.location;
  NSUInteger length = p_dayRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setDayRange:(_NSRange)a3
{
  self->_dayRange = a3;
}

- (BOOL)isProposedTime
{
  return self->_isProposedTime;
}

- (void)setIsProposedTime:(BOOL)a3
{
  self->_isProposedTime = a3;
}

- (MonthViewOccurrence)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (MonthViewOccurrence *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (UIInteraction)appEntityInteraction
{
  return self->_appEntityInteraction;
}

- (void)setAppEntityInteraction:(id)a3
{
}

- (BOOL)drawBackgroundWithLayer
{
  return self->_drawBackgroundWithLayer;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (UIImage)dotImage
{
  return self->_dotImage;
}

- (void)setDotImage:(id)a3
{
}

- (NSString)occurrenceString
{
  return self->_occurrenceString;
}

- (void)setOccurrenceString:(id)a3
{
}

- (NSString)timeString
{
  return self->_timeString;
}

- (void)setTimeString:(id)a3
{
}

- (NSString)endTimeString
{
  return self->_endTimeString;
}

- (void)setEndTimeString:(id)a3
{
}

- (BOOL)compact
{
  return self->_compact;
}

- (void)setCompact:(BOOL)a3
{
  self->_BOOL compact = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimeString, 0);
  objc_storeStrong((id *)&self->_timeString, 0);
  objc_storeStrong((id *)&self->_occurrenceString, 0);
  objc_storeStrong((id *)&self->_dotImage, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_appEntityInteraction, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_cachedTitleHeights, 0);
  objc_storeStrong((id *)&self->_cachedTimeColors, 0);
  objc_storeStrong((id *)&self->_cachedTitleColors, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_wrappingTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_dotImageView, 0);
  objc_storeStrong((id *)&self->_glowLayer, 0);
  objc_storeStrong((id *)&self->_subOccurrences, 0);

  objc_storeStrong((id *)&self->_occurrence, 0);
}

@end