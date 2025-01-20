@interface PaletteView
- (BOOL)dateStringVisible;
- (BOOL)dividerLineVisible;
- (BOOL)focusBannerVisible;
- (BOOL)hasContent;
- (BOOL)opaqueBackground;
- (BOOL)shouldHideInlineFocusBanner;
- (BOOL)suppressLayout;
- (BOOL)todayButtonVisible;
- (BOOL)useCustomDayFrames;
- (BOOL)weekdayHeaderFillsHalfWidth;
- (BOOL)weekdayHeaderMovedBeyondLeftEdge;
- (BOOL)weekdayHeaderVisible;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNContact)avatarContact;
- (DayNavigationViewController)dayScrubberController;
- (NSAttributedString)dateString;
- (PaletteView)initWithBarPalette:(id)a3;
- (PaletteViewDelegate)delegate;
- (UILabel)animatableDateLabel;
- (UILabel)dateLabel;
- (UIView)avatarView;
- (WeekDayInitialsHeaderView)dayInitialsHeaderView;
- (_UINavigationBarPalette)containingPalette;
- (double)extraPaletteHeight;
- (double)paletteTopMargin;
- (id)_generateWeekDayInitialsHeaderViewWithHorizontalSizeClass:(BOOL)a3;
- (id)newDateLabel;
- (id)todayButtonFont;
- (unint64_t)focusBannerPlacement;
- (void)_contentSizeCategoryChanged;
- (void)_focusConfigurationChanged;
- (void)_layoutDayInitialsView:(CGPoint)a3;
- (void)_localeChanged:(id)a3;
- (void)_updateFocusBanner;
- (void)_updateFocusBannerVisibility;
- (void)avatarTapped;
- (void)dealloc;
- (void)focusBannerViewToggled:(id)a3;
- (void)layoutSubviews;
- (void)removeAllContent;
- (void)safeAreaInsetsDidChange;
- (void)setAvatarContact:(id)a3;
- (void)setAvatarViewVisible:(BOOL)a3;
- (void)setDateString:(id)a3;
- (void)setDateStringVisible:(BOOL)a3;
- (void)setDayHeaderFrames:(id)a3;
- (void)setDayInitialsHeaderView:(id)a3;
- (void)setDayScrubberController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDividerLineVisible:(BOOL)a3;
- (void)setExtraPaletteHeight:(double)a3;
- (void)setFocusBannerPlacement:(unint64_t)a3;
- (void)setOpaqueBackground:(BOOL)a3;
- (void)setShouldHideInlineFocusBanner:(BOOL)a3;
- (void)setSuppressLayout:(BOOL)a3;
- (void)setTodayButtonVisible:(BOOL)a3;
- (void)setUseCustomDayFrames:(BOOL)a3;
- (void)setWeekdayHeaderFillsHalfWidth:(BOOL)a3;
- (void)setWeekdayHeaderMovedBeyondLeftEdge:(BOOL)a3;
- (void)setWeekdayHeaderVisible:(BOOL)a3;
- (void)todayTapped;
- (void)updateForChangeToTraitCollection:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PaletteView

- (void)_updateFocusBanner
{
  id v3 = [(PaletteView *)self delegate];
  -[EKUIFocusBannerView setOn:](self->_focusFilterBanner, "setOn:", [v3 focusFilterMode] == (id)1);
}

- (void)setDateString:(id)a3
{
  v4 = (NSAttributedString *)a3;
  if (!self->_dateLabel)
  {
    v5 = [(PaletteView *)self newDateLabel];
    dateLabel = self->_dateLabel;
    self->_dateLabel = v5;
  }
  if (!self->_animatableDateLabel)
  {
    v7 = [(PaletteView *)self newDateLabel];
    animatableDateLabel = self->_animatableDateLabel;
    self->_animatableDateLabel = v7;

    [(UILabel *)self->_animatableDateLabel setAlpha:0.0];
    [(PaletteView *)self addSubview:self->_animatableDateLabel];
  }
  [(UILabel *)self->_dateLabel setAttributedText:v4];
  [(UILabel *)self->_animatableDateLabel setAttributedText:v4];
  dateString = self->_dateString;
  self->_dateString = v4;
  v10 = v4;

  [(UILabel *)self->_dateLabel sizeToFit];
  [(UILabel *)self->_animatableDateLabel sizeToFit];
}

- (id)newDateLabel
{
  id v2 = objc_alloc_init((Class)UILabel);
  [v2 setAccessibilityIdentifier:@"current-month-year"];
  [v2 setUserInteractionEnabled:1];
  [v2 setShowsLargeContentViewer:1];
  id v3 = objc_opt_new();
  [v2 addInteraction:v3];

  return v2;
}

- (PaletteView)initWithBarPalette:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  v12.receiver = self;
  v12.super_class = (Class)PaletteView;
  v5 = -[PaletteView initWithFrame:](&v12, "initWithFrame:");
  if (v5)
  {
    v6 = +[UIColor clearColor];
    [(PaletteView *)v5 setBackgroundColor:v6];

    id v7 = objc_storeWeak((id *)&v5->_containingPalette, v4);
    [v4 setClipsToBounds:0];

    [(PaletteView *)v5 setPreservesSuperviewLayoutMargins:1];
    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v5 selector:"_localeChanged:" name:CUIKLocaleChangedNotification object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v5 selector:"_contentSizeCategoryChanged" name:UIContentSizeCategoryDidChangeNotification object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v5 selector:"_focusConfigurationChanged" name:CUIKCalendarModelFocusModeConfigurationChangedNotification object:0];
  }
  return v5;
}

- (void)layoutSubviews
{
  v98.receiver = self;
  v98.super_class = (Class)PaletteView;
  [(PaletteView *)&v98 layoutSubviews];
  if ([(PaletteView *)self suppressLayout]) {
    return;
  }
  [(PaletteView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PaletteView *)self traitCollection];
  id v12 = [v11 userInterfaceIdiom];

  [(PaletteView *)self paletteTopMargin];
  double v14 = v13;
  if (v12) {
    double v15 = 37.0;
  }
  else {
    double v15 = 28.0;
  }
  int IsLeftToRight = CalInterfaceIsLeftToRight();
  [(PaletteView *)self safeAreaInsets];
  double v18 = v17;
  double v20 = v19;
  [(PaletteView *)self safeAreaInsets];
  if (IsLeftToRight) {
    double v23 = v22;
  }
  else {
    double v23 = v21;
  }
  if (IsLeftToRight) {
    double v24 = v18;
  }
  else {
    double v24 = v20;
  }
  double v25 = v23 + 16.0;
  double v26 = v24 + 20.0;
  avatarView = self->_avatarView;
  if (avatarView && self->_avatarViewVisible)
  {
    [(EKUILabeledAvatarView *)avatarView frame];
    int v28 = CalInterfaceIsLeftToRight();
    double v29 = v8 - v25 - v15;
    if (v28) {
      double v29 = v26;
    }
    -[EKUILabeledAvatarView setFrame:](self->_avatarView, "setFrame:", v29, v14, v15, v15);
  }
  if (self->_dateStringVisible)
  {
    [(UILabel *)self->_dateLabel sizeToFit];
    v30 = self->_avatarView;
    double v94 = v25;
    double v96 = v4;
    if (v30 && self->_avatarViewVisible)
    {
      double v31 = v10;
      [(EKUILabeledAvatarView *)v30 frame];
      double MaxX = CGRectGetMaxX(v99);
      [(UILabel *)self->_dateLabel frame];
      double v34 = v33;
      double v36 = v35;
      if (!v12)
      {
        [(EKUILabeledAvatarView *)self->_avatarView frame];
        double v14 = CGRectGetMaxY(v100) - v36 + -1.2;
      }
      if (CalInterfaceIsLeftToRight())
      {
        double v37 = MaxX + 8.0;
LABEL_28:
        -[UILabel setFrame:](self->_dateLabel, "setFrame:", v37, v14, v34, v36, *(void *)&v94, *(void *)&v96);
        -[UILabel setFrame:](self->_animatableDateLabel, "setFrame:", v37, v14, v34, v36);
        v102.origin.x = v37;
        v102.origin.y = v14;
        v102.size.width = v34;
        v102.size.height = v36;
        double v41 = CGRectGetMaxY(v102) + 7.0;
        if (v6 < v41) {
          double v6 = v41;
        }
        double v10 = v31;
        double v25 = v95;
        double v4 = v97;
        goto LABEL_31;
      }
      [(EKUILabeledAvatarView *)self->_avatarView frame];
      double v40 = CGRectGetMinX(v101) + -8.0;
    }
    else
    {
      double v31 = v10;
      [(UILabel *)self->_dateLabel frame];
      double v34 = v38;
      double v36 = v39;
      if (CalInterfaceIsLeftToRight())
      {
        double v37 = v26;
        goto LABEL_28;
      }
      double v40 = v8 - v25;
    }
    double v37 = v40 - v34;
    goto LABEL_28;
  }
LABEL_31:
  if (self->_todayButtonVisible)
  {
    [(UIButton *)self->_todayButton sizeToFit];
    [(UIButton *)self->_todayButton frame];
    double v43 = v42;
    double v45 = v44;
    if (CalInterfaceIsLeftToRight())
    {
      [(PaletteView *)self frame];
      double v26 = v46 - v43 - v25;
    }
    [(UILabel *)self->_dateLabel frame];
    -[UIButton setFrame:](self->_todayButton, "setFrame:", v26, CGRectGetMidY(v103) + v45 * -0.5, v43, v45);
  }
  if ([(PaletteView *)self weekdayHeaderFillsHalfWidth])
  {
    double v4 = v4 + -3.0;
    double v8 = v8 / 1.96;
  }
  CGFloat v47 = 0.0;
  if ([(PaletteView *)self weekdayHeaderMovedBeyondLeftEdge]) {
    double v48 = v8;
  }
  else {
    double v48 = 0.0;
  }
  if ([(PaletteView *)self weekdayHeaderVisible])
  {
    -[PaletteView _layoutDayInitialsView:](self, "_layoutDayInitialsView:", 0.0, v6);
    [(WeekDayInitialsHeaderView *)self->_dayInitialsHeaderView frame];
    CGFloat v50 = v49;
    double v6 = v51;
    CGFloat v47 = v52;
    CGFloat v54 = v53;
  }
  else
  {
    CGFloat v54 = 0.0;
    CGFloat v50 = 0.0;
  }
  v55 = [(PaletteView *)self dayScrubberController];
  v56 = [v55 view];

  if (v56)
  {
    double v57 = v4 - v48;
    [v56 sizeThatFits:v8, v10];
    CGFloat v58 = v6;
    double v60 = v59;
    double v61 = v8;
    double v62 = v10;
    double v64 = v63;
    v104.origin.x = v50;
    v104.origin.y = v58;
    v104.size.width = v47;
    v104.size.height = v54;
    CGFloat MaxY = CGRectGetMaxY(v104);
    double v66 = v64;
    double v10 = v62;
    double v8 = v61;
    [v56 setFrame:v57 MaxY:v60 v66];
  }
  if (![(PaletteView *)self focusBannerVisible]) {
    goto LABEL_58;
  }
  -[EKUIFocusBannerView sizeThatFits:](self->_focusFilterBanner, "sizeThatFits:", v8, 0.0);
  double v68 = v67;
  double v70 = v69;
  if ((id)[(PaletteView *)self focusBannerPlacement] != (id)1)
  {
    -[EKUIFocusBannerView setBounds:](self->_focusFilterBanner, "setBounds:", CGPointZero.x, CGPointZero.y, v68, v70);
    [(PaletteView *)self bounds];
    double MidX = CGRectGetMidX(v105);
    if (self->_dateStringVisible) {
      [(UILabel *)self->_dateLabel frame];
    }
    else {
      [(PaletteView *)self bounds];
    }
    double MidY = CGRectGetMidY(*(CGRect *)&v72);
    if (CalInterfaceIsLeftToRight())
    {
      uint64_t v77 = 8;
      [(UILabel *)self->_dateLabel frame];
      double v78 = CGRectGetMaxX(v106);
      [(EKUIFocusBannerView *)self->_focusFilterBanner frame];
      if (v78 > MidX + CGRectGetWidth(v107) * -0.5)
      {
        v79 = &OBJC_IVAR___PaletteView__todayButton;
LABEL_56:
        v81 = *(Class *)((char *)&self->super.super.super.isa + v77);
        id v82 = *(id *)((char *)&self->super.super.super.isa + *v79);
        id v83 = v81;
        [v83 frame];
        double v84 = CGRectGetMaxX(v110);
        [v82 frame];
        CGFloat v86 = v85;
        CGFloat v88 = v87;
        CGFloat v90 = v89;
        CGFloat v92 = v91;

        v111.origin.x = v86;
        v111.origin.y = v88;
        v111.size.width = v90;
        v111.size.height = v92;
        double MidX = v84 + (CGRectGetMinX(v111) - v84) * 0.5;
      }
    }
    else
    {
      [(EKUIFocusBannerView *)self->_focusFilterBanner frame];
      CGFloat v80 = MidX + CGRectGetWidth(v108) * 0.5;
      [(UILabel *)self->_dateLabel frame];
      if (v80 > CGRectGetMinX(v109))
      {
        uint64_t v77 = 24;
        v79 = &OBJC_IVAR___PaletteView__dateLabel;
        goto LABEL_56;
      }
    }
    -[EKUIFocusBannerView setCenter:](self->_focusFilterBanner, "setCenter:", MidX, MidY);
    goto LABEL_58;
  }
  -[EKUIFocusBannerView setFrame:](self->_focusFilterBanner, "setFrame:", 0.0, v10 - v70, v8, v70);
LABEL_58:
  if (self->_dividerLineVisible)
  {
    CalOnePixelInPoints();
    -[UIView setFrame:](self->_dividerLine, "setFrame:", 0.0, v10 - v93, v8, v93);
  }
}

- (BOOL)weekdayHeaderMovedBeyondLeftEdge
{
  return self->_weekdayHeaderMovedBeyondLeftEdge;
}

- (BOOL)weekdayHeaderFillsHalfWidth
{
  return self->_weekdayHeaderFillsHalfWidth;
}

- (BOOL)suppressLayout
{
  return self->_suppressLayout;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_todayButtonVisible || self->_dateStringVisible)
  {
    [(PaletteView *)self paletteTopMargin];
    double v7 = v6;
    -[UIButton sizeThatFits:](self->_todayButton, "sizeThatFits:", width, height);
    double v9 = v8;
    -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", width, height);
    if (v9 >= v10) {
      double v11 = v9;
    }
    else {
      double v11 = v10;
    }
    double v12 = v7 + v11 + 7.0;
  }
  else
  {
    double v12 = 0.0;
  }
  if ([(PaletteView *)self weekdayHeaderVisible])
  {
    -[WeekDayInitialsHeaderView sizeThatFits:](self->_dayInitialsHeaderView, "sizeThatFits:", width, height);
    double v12 = v12 + v13;
  }
  double v14 = [(PaletteView *)self dayScrubberController];
  double v15 = [v14 view];

  if (v15)
  {
    [v15 sizeThatFits:width, height];
    double v12 = v12 + v16;
  }
  if ([(PaletteView *)self focusBannerVisible]
    && (id)[(PaletteView *)self focusBannerPlacement] == (id)1)
  {
    -[EKUIFocusBannerView sizeThatFits:](self->_focusFilterBanner, "sizeThatFits:", width, 0.0);
    double v12 = v12 + v17;
  }
  [(PaletteView *)self extraPaletteHeight];
  double v19 = v12 + v18;

  double v20 = width;
  double v21 = v19;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (BOOL)weekdayHeaderVisible
{
  return self->_weekdayHeaderVisible;
}

- (DayNavigationViewController)dayScrubberController
{
  return self->_dayScrubberController;
}

- (double)paletteTopMargin
{
  double v3 = +[UIScreen mainScreen];
  [v3 bounds];
  double v5 = v4;

  double v6 = [(PaletteView *)self traitCollection];
  if ([v6 horizontalSizeClass] == (id)1)
  {
    [(PaletteView *)self bounds];
    BOOL v8 = v7 <= v5 + 1.0;
  }
  else
  {
    BOOL v8 = 0;
  }

  double v9 = [(PaletteView *)self traitCollection];
  id v10 = [v9 userInterfaceIdiom];

  if (v10) {
    int v11 = v8;
  }
  else {
    int v11 = 1;
  }
  double result = 16.0;
  if (v11) {
    return 6.0;
  }
  return result;
}

- (double)extraPaletteHeight
{
  return self->_extraPaletteHeight;
}

- (void)_layoutDayInitialsView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  dayInitialsHeaderView = self->_dayInitialsHeaderView;
  [(PaletteView *)self bounds];
  -[WeekDayInitialsHeaderView sizeThatFits:](dayInitialsHeaderView, "sizeThatFits:", v7, v8);
  int v11 = self->_dayInitialsHeaderView;

  -[WeekDayInitialsHeaderView setFrame:](v11, "setFrame:", x, y, v9, v10);
}

- (BOOL)focusBannerVisible
{
  unint64_t v3 = [(PaletteView *)self focusBannerPlacement];
  if (v3)
  {
    unint64_t v4 = v3;
    double v5 = [(PaletteView *)self delegate];
    id v6 = [v5 focusFilterMode];

    LOBYTE(v3) = v6 && (v4 != 2 || ![(PaletteView *)self shouldHideInlineFocusBanner]);
  }
  return v3;
}

- (unint64_t)focusBannerPlacement
{
  return self->_focusBannerPlacement;
}

- (PaletteViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PaletteViewDelegate *)WeakRetained;
}

- (void)setOpaqueBackground:(BOOL)a3
{
  self->_opaqueBackground = a3;
}

- (BOOL)hasContent
{
  if ([(PaletteView *)self weekdayHeaderVisible]) {
    return 1;
  }
  unint64_t v4 = [(PaletteView *)self dayScrubberController];
  if (v4
    || [(PaletteView *)self todayButtonVisible]
    || [(PaletteView *)self dateStringVisible])
  {
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = [(PaletteView *)self focusBannerVisible];
  }

  return v3;
}

- (void)setTodayButtonVisible:(BOOL)a3
{
  if (self->_todayButtonVisible != a3)
  {
    BOOL v3 = a3;
    todayButton = self->_todayButton;
    if (v3)
    {
      if (!todayButton)
      {
        id v6 = +[UIButton buttonWithType:1];
        double v7 = self->_todayButton;
        self->_todayButton = v6;

        double v8 = self->_todayButton;
        double v9 = +[NSBundle bundleForClass:objc_opt_class()];
        double v10 = [v9 localizedStringForKey:@"Today" value:&stru_1001D6918 table:0];
        [(UIButton *)v8 setTitle:v10 forState:0];

        [(UIButton *)self->_todayButton addTarget:self action:"todayTapped" forControlEvents:64];
        [(UIButton *)self->_todayButton setPointerInteractionEnabled:1];
        int v11 = [(PaletteView *)self todayButtonFont];
        double v12 = [(UIButton *)self->_todayButton titleLabel];
        [v12 setFont:v11];

        [(UIButton *)self->_todayButton setShowsLargeContentViewer:1];
        double v13 = self->_todayButton;
        double v14 = objc_opt_new();
        [(UIButton *)v13 addInteraction:v14];

        [(UIButton *)self->_todayButton setAccessibilityIdentifier:@"today-button"];
        todayButton = self->_todayButton;
      }
      [(PaletteView *)self addSubview:todayButton];
    }
    else
    {
      [(UIButton *)self->_todayButton removeFromSuperview];
    }
    self->_todayButtonVisible = v3;
  }
}

- (void)setDividerLineVisible:(BOOL)a3
{
  if (self->_dividerLineVisible != a3)
  {
    self->_dividerLineVisible = a3;
    dividerLine = self->_dividerLine;
    if (a3)
    {
      if (!dividerLine)
      {
        double v5 = (UIView *)objc_alloc_init((Class)UIView);
        id v6 = self->_dividerLine;
        self->_dividerLine = v5;

        double v7 = +[UIColor separatorColor];
        [(UIView *)self->_dividerLine setBackgroundColor:v7];

        dividerLine = self->_dividerLine;
      }
      [(PaletteView *)self addSubview:dividerLine];
    }
    else
    {
      double v8 = self->_dividerLine;
      [(UIView *)v8 removeFromSuperview];
    }
  }
}

- (void)setDateStringVisible:(BOOL)a3
{
  if (self->_dateStringVisible != a3)
  {
    dateLabel = self->_dateLabel;
    if (a3)
    {
      if (!dateLabel)
      {
        id v6 = [(PaletteView *)self newDateLabel];
        double v7 = self->_dateLabel;
        self->_dateLabel = v6;
      }
      if (!self->_animatableDateLabel)
      {
        double v8 = [(PaletteView *)self newDateLabel];
        animatableDateLabel = self->_animatableDateLabel;
        self->_animatableDateLabel = v8;

        [(UILabel *)self->_animatableDateLabel setAlpha:0.0];
        [(PaletteView *)self addSubview:self->_animatableDateLabel];
      }
      double v10 = self->_dateLabel;
      if (self->_dateString)
      {
        [(UILabel *)self->_dateLabel setAttributedText:self->_dateString];
        [(UILabel *)self->_animatableDateLabel setAttributedText:self->_dateString];
        double v10 = self->_dateLabel;
      }
      [(PaletteView *)self addSubview:v10];
    }
    else
    {
      [(UILabel *)dateLabel removeFromSuperview];
    }
    self->_dateStringVisible = a3;
  }
}

- (void)setFocusBannerPlacement:(unint64_t)a3
{
  self->_unint64_t focusBannerPlacement = a3;
  unsigned int v4 = [(PaletteView *)self focusBannerVisible];
  double v5 = [(EKUIFocusBannerView *)self->_focusFilterBanner superview];
  BOOL v6 = v5 == 0;

  if (((v4 ^ v6) & 1) == 0)
  {
    focusFilterBanner = self->_focusFilterBanner;
    if (v4)
    {
      if (!focusFilterBanner)
      {
        double v8 = (EKUIFocusBannerView *)objc_alloc_init((Class)EKUIFocusBannerView);
        double v9 = self->_focusFilterBanner;
        self->_focusFilterBanner = v8;

        [(EKUIFocusBannerView *)self->_focusFilterBanner setAutoresizingMask:0];
        [(EKUIFocusBannerView *)self->_focusFilterBanner setDelegate:self];
        focusFilterBanner = self->_focusFilterBanner;
      }
      [(PaletteView *)self addSubview:focusFilterBanner];
      [(PaletteView *)self _updateFocusBanner];
    }
    else
    {
      [(EKUIFocusBannerView *)self->_focusFilterBanner removeFromSuperview];
    }
  }
  unint64_t focusBannerPlacement = self->_focusBannerPlacement;
  BOOL v11 = focusBannerPlacement != 1;
  [(EKUIFocusBannerView *)self->_focusFilterBanner setShowDividers:focusBannerPlacement == 1];
  [(EKUIFocusBannerView *)self->_focusFilterBanner setLayout:v11];
  double v12 = self->_focusFilterBanner;

  [(EKUIFocusBannerView *)v12 setDisallowAccessibilityTextSizes:v11];
}

- (void)setWeekdayHeaderVisible:(BOOL)a3
{
  if (self->_weekdayHeaderVisible != a3)
  {
    self->_weekdayHeaderVisible = a3;
    dayInitialsHeaderView = self->_dayInitialsHeaderView;
    if (a3)
    {
      if (!dayInitialsHeaderView)
      {
        double v5 = [(PaletteView *)self _generateWeekDayInitialsHeaderViewWithHorizontalSizeClass:EKUICurrentWindowInterfaceParadigm_SupportsLargeWeekdayNamesInNavigationPalette()];
        BOOL v6 = self->_dayInitialsHeaderView;
        self->_dayInitialsHeaderView = v5;

        dayInitialsHeaderView = self->_dayInitialsHeaderView;
      }
      [(PaletteView *)self addSubview:dayInitialsHeaderView];
    }
    else
    {
      [(WeekDayInitialsHeaderView *)self->_dayInitialsHeaderView removeFromSuperview];
    }
    double v7 = self->_dayInitialsHeaderView;
    [(WeekDayInitialsHeaderView *)v7 sizeToFit];
  }
}

- (void)setWeekdayHeaderFillsHalfWidth:(BOOL)a3
{
  self->_weekdayHeaderFillsHalfWidth = a3;
}

- (void)setUseCustomDayFrames:(BOOL)a3
{
  self->_useCustomDayFrames = a3;
  -[WeekDayInitialsHeaderView setUseCustomDayFrames:](self->_dayInitialsHeaderView, "setUseCustomDayFrames:");
}

- (void)setDayScrubberController:(id)a3
{
  double v5 = (DayNavigationViewController *)a3;
  p_dayScrubberController = &self->_dayScrubberController;
  dayScrubberController = self->_dayScrubberController;
  double v38 = v5;
  if (dayScrubberController != v5)
  {
    if (dayScrubberController)
    {
      double v8 = [(DayNavigationViewController *)dayScrubberController view];
      [v8 frame];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;

      double v17 = [(PaletteView *)self superview];
      [v17 frame];
      double v19 = v10 + v18;

      double v20 = [(PaletteView *)self superview];
      [v20 frame];
      double v22 = v12 + v21;

      double v23 = [(DayNavigationViewController *)*p_dayScrubberController view];
      [v23 setFrame:v19, v22, v14, v16];

      [(DayNavigationViewController *)*p_dayScrubberController removeFromParentViewController];
      double v24 = [(DayNavigationViewController *)*p_dayScrubberController view];
      [v24 removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_dayScrubberController, a3);
    if (*p_dayScrubberController)
    {
      double v25 = [(PaletteView *)self window];
      if (v25) {
        EKUIPushFallbackSizingContextWithViewHierarchy();
      }
      [(DayNavigationViewController *)*p_dayScrubberController removeFromParentViewController];
      double v26 = [(DayNavigationViewController *)*p_dayScrubberController view];
      [v26 removeFromSuperview];

      v27 = [(DayNavigationViewController *)*p_dayScrubberController view];
      [(PaletteView *)self addSubview:v27];

      int v28 = [(DayNavigationViewController *)*p_dayScrubberController view];
      [v28 sizeToFit];

      double v29 = [(DayNavigationViewController *)*p_dayScrubberController view];
      [v29 frame];
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;

      [(PaletteView *)self bounds];
      double Width = CGRectGetWidth(v40);
      double v37 = [(DayNavigationViewController *)*p_dayScrubberController view];
      [v37 setFrame:v31, v33, Width, v35];

      [(PaletteView *)self safeAreaInsets];
      -[DayNavigationViewController setPaletteSafeAreaInsets:](*p_dayScrubberController, "setPaletteSafeAreaInsets:");
      if (v25) {
        EKUIPopFallbackSizingContextWithViewHierarchy();
      }
    }
  }
}

- (_UINavigationBarPalette)containingPalette
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containingPalette);

  return (_UINavigationBarPalette *)WeakRetained;
}

- (void)setDayHeaderFrames:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    [(PaletteView *)self layoutSubviews];
    self->_useCustomDayFrames = 1;
    id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
    double v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    double v10 = sub_10001E450;
    double v11 = &unk_1001D53D8;
    if (CalTimeDirectionIsLeftToRight()) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 2;
    }
    double v12 = self;
    id v13 = v5;
    id v7 = v5;
    [v4 enumerateObjectsWithOptions:v6 usingBlock:&v8];
    -[WeekDayInitialsHeaderView setDayFrames:](self->_dayInitialsHeaderView, "setDayFrames:", v7, v8, v9, v10, v11, v12);
  }
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PaletteView;
  -[PaletteView willMoveToWindow:](&v5, "willMoveToWindow:");
  if (a3) {
    [(PaletteView *)self _focusConfigurationChanged];
  }
}

- (void)setShouldHideInlineFocusBanner:(BOOL)a3
{
  if (self->_shouldHideInlineFocusBanner != a3)
  {
    self->_shouldHideInlineFocusBanner = a3;
    [(PaletteView *)self _updateFocusBannerVisibility];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setAvatarViewVisible:(BOOL)a3
{
  self->_avatarViewVisible = a3;
  avatarView = self->_avatarView;
  if (avatarView)
  {
    [(EKUILabeledAvatarView *)avatarView setAlpha:(double)a3];
    [(PaletteView *)self setNeedsLayout];
    [(PaletteView *)self layoutIfNeeded];
  }
}

- (NSAttributedString)dateString
{
  return self->_dateString;
}

- (void)_updateFocusBannerVisibility
{
  [(PaletteView *)self setFocusBannerPlacement:[(PaletteView *)self focusBannerPlacement]];
  [(PaletteView *)self _updateFocusBanner];
  [(PaletteView *)self setNeedsLayout];

  [(PaletteView *)self layoutIfNeeded];
}

- (id)_generateWeekDayInitialsHeaderViewWithHorizontalSizeClass:(BOOL)a3
{
  BOOL v3 = off_1001D1C30;
  if (!a3) {
    BOOL v3 = off_1001D1988;
  }
  id v4 = objc_alloc_init(*v3);

  return v4;
}

- (void)_focusConfigurationChanged
{
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PaletteView;
  [(PaletteView *)&v4 dealloc];
}

- (void)safeAreaInsetsDidChange
{
  [(PaletteView *)self safeAreaInsets];
  dayScrubberController = self->_dayScrubberController;

  -[DayNavigationViewController setPaletteSafeAreaInsets:](dayScrubberController, "setPaletteSafeAreaInsets:");
}

- (void)setWeekdayHeaderMovedBeyondLeftEdge:(BOOL)a3
{
  self->_weekdayHeaderMovedBeyondLeftEdge = a3;
}

- (void)removeAllContent
{
  [(PaletteView *)self setWeekdayHeaderVisible:0];
  [(PaletteView *)self setDayScrubberController:0];
  [(PaletteView *)self setWeekdayHeaderFillsHalfWidth:0];
  [(PaletteView *)self setWeekdayHeaderMovedBeyondLeftEdge:0];
  [(PaletteView *)self setExtraPaletteHeight:0.0];
  [(PaletteView *)self setTodayButtonVisible:0];
  [(PaletteView *)self setDateStringVisible:0];
  [(PaletteView *)self setDateString:0];

  [(PaletteView *)self setFocusBannerPlacement:0];
}

- (void)focusBannerViewToggled:(id)a3
{
  if ([a3 on]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = [(PaletteView *)self delegate];
  [v5 setFocusFilterMode:v4];
}

- (void)setExtraPaletteHeight:(double)a3
{
  if (self->_extraPaletteHeight != a3) {
    self->_extraPaletteHeight = a3;
  }
}

- (void)updateForChangeToTraitCollection:(id)a3
{
  id v9 = a3;
  [(PaletteView *)self setWeekdayHeaderVisible:0];
  dayInitialsHeaderView = self->_dayInitialsHeaderView;
  self->_dayInitialsHeaderView = 0;

  self->_weekdayHeaderFillsHalfdouble Width = 0;
  self->_weekdayHeaderMovedBeyondLeftEdge = 0;
  if (v9)
  {
    BOOL v5 = [v9 horizontalSizeClass] == (id)2 && [v9 verticalSizeClass] == (id)2;
    uint64_t v6 = [(PaletteView *)self _generateWeekDayInitialsHeaderViewWithHorizontalSizeClass:v5];
    id v7 = self->_dayInitialsHeaderView;
    self->_dayInitialsHeaderView = v6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[PaletteView setAvatarViewVisible:](self, "setAvatarViewVisible:", [WeakRetained paletteShouldShowAvatarView]);
}

- (void)setAvatarContact:(id)a3
{
  id v4 = a3;
  avatarView = self->_avatarView;
  id v9 = v4;
  if (!avatarView)
  {
    uint64_t v6 = (EKUILabeledAvatarView *)[objc_alloc((Class)EKUILabeledAvatarView) initWithPlacement:0 options:0];
    id v7 = self->_avatarView;
    self->_avatarView = v6;

    id v8 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"avatarTapped"];
    [(EKUILabeledAvatarView *)self->_avatarView addGestureRecognizer:v8];
    [(PaletteView *)self addSubview:self->_avatarView];

    id v4 = v9;
    avatarView = self->_avatarView;
  }
  [(EKUILabeledAvatarView *)avatarView setContact:v4];
}

- (UIView)avatarView
{
  return (UIView *)self->_avatarView;
}

- (void)todayTapped
{
  id v3 = [(PaletteView *)self delegate];
  [v3 paletteTodayButtonTapped:self];
}

- (void)avatarTapped
{
  id v3 = [(PaletteView *)self delegate];
  [v3 paletteAvatarViewTapped:self];
}

- (void)_localeChanged:(id)a3
{
  dayInitialsHeaderView = self->_dayInitialsHeaderView;
  if (self->_weekdayHeaderVisible)
  {
    [(WeekDayInitialsHeaderView *)self->_dayInitialsHeaderView setNeedsDisplay];
  }
  else
  {
    self->_dayInitialsHeaderView = 0;
    _objc_release_x1(self, dayInitialsHeaderView);
  }
}

- (void)_contentSizeCategoryChanged
{
  id v3 = [(PaletteView *)self todayButtonFont];
  id v4 = [(UIButton *)self->_todayButton titleLabel];
  [v4 setFont:v3];

  todayButton = self->_todayButton;

  [(UIButton *)todayButton sizeToFit];
}

- (id)todayButtonFont
{
  id v2 = [(PaletteView *)self traitCollection];
  id v3 = +[EKUIConstrainedFontUtilities constrainedFontForTextStyle:UIFontTextStyleSubheadline minimumContentSizeCategory:UIContentSizeCategoryLarge maximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge traitCollection:v2];

  return v3;
}

- (BOOL)useCustomDayFrames
{
  return self->_useCustomDayFrames;
}

- (BOOL)todayButtonVisible
{
  return self->_todayButtonVisible;
}

- (BOOL)dateStringVisible
{
  return self->_dateStringVisible;
}

- (BOOL)dividerLineVisible
{
  return self->_dividerLineVisible;
}

- (BOOL)opaqueBackground
{
  return self->_opaqueBackground;
}

- (BOOL)shouldHideInlineFocusBanner
{
  return self->_shouldHideInlineFocusBanner;
}

- (CNContact)avatarContact
{
  return self->_avatarContact;
}

- (void)setSuppressLayout:(BOOL)a3
{
  self->_suppressLayout = a3;
}

- (WeekDayInitialsHeaderView)dayInitialsHeaderView
{
  return self->_dayInitialsHeaderView;
}

- (void)setDayInitialsHeaderView:(id)a3
{
}

- (UILabel)animatableDateLabel
{
  return self->_animatableDateLabel;
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayInitialsHeaderView, 0);
  objc_destroyWeak((id *)&self->_containingPalette);
  objc_storeStrong((id *)&self->_avatarContact, 0);
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_dayScrubberController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_focusFilterBanner, 0);
  objc_storeStrong((id *)&self->_dividerLine, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_todayButton, 0);
  objc_storeStrong((id *)&self->_animatableDateLabel, 0);

  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end