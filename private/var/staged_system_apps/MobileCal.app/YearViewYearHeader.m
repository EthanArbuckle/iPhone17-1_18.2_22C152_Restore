@interface YearViewYearHeader
+ (double)headerDaySpacingForWindowSize:(CGSize)a3;
+ (double)headerYInsetForWindowSize:(CGSize)a3;
+ (double)heightForWindowSize:(CGSize)a3;
+ (double)middleHeightForWindowSize:(CGSize)a3;
+ (id)_headerBackgroundColor;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKCalendarDate)calendarDate;
- (UIFont)overlayLegendFont;
- (UIFont)yearNumberFont;
- (YearViewYearHeader)initWithCalendarDate:(id)a3;
- (double)heightBetweenLineAndNumber;
- (double)overlayLegendLineLength;
- (double)overlayLegendMonthBaseline;
- (double)overlayLegendMonthLineThickness;
- (double)overlayLegendRightInset;
- (double)overlayLegendSpacing;
- (double)overlayLegendYearBaseline;
- (double)overlayLegendYearLineThickness;
- (double)yearNumberHeaderFontSize;
- (double)yearNumberKerning;
- (id)_thinLineColor;
- (id)_yearString;
- (void)_initializeThinLine;
- (void)_layoutOverlayLegend;
- (void)_layoutThinLine;
- (void)_layoutYearNumber;
- (void)_reloadYearNumberLabel;
- (void)_removeOverlayLegend;
- (void)_updateOverlayLegend;
- (void)layoutSubviews;
- (void)localeChanged;
- (void)setCalendarDate:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation YearViewYearHeader

- (YearViewYearHeader)initWithCalendarDate:(id)a3
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)YearViewYearHeader;
  v7 = [(YearViewYearHeader *)&v16 init];
  if (v7)
  {
    if (!v6)
    {
      v12 = +[NSAssertionHandler currentHandler];
      [v12 handleFailureInMethod:a2 object:v7 file:@"YearViewYearHeader.m" lineNumber:40 description:@"'calendarDate' must not be nil"];
    }
    objc_storeStrong((id *)&v7->_calendarDate, a3);
    v8 = [(id)objc_opt_class() _headerBackgroundColor];
    [(YearViewYearHeader *)v7 setBackgroundColor:v8];

    [(YearViewYearHeader *)v7 _reloadYearNumberLabel];
    [(YearViewYearHeader *)v7 _initializeThinLine];
    [(YearViewYearHeader *)v7 _updateOverlayLegend];
    objc_initWeak(&location, v7);
    uint64_t v17 = objc_opt_class();
    v9 = +[NSArray arrayWithObjects:&v17 count:1];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10007FEF0;
    v13[3] = &unk_1001D2620;
    objc_copyWeak(&v14, &location);
    id v10 = [(YearViewYearHeader *)v7 registerForTraitChanges:v9 withHandler:v13];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = objc_opt_class();
  EKUICurrentWindowSize();
  [v4 heightForWindowSize:];
  double v6 = v5;
  if (CUIKCurrentLocaleRequiresIndianLanguageAdjustments()) {
    double v7 = v6 + 15.0;
  }
  else {
    double v7 = v6;
  }
  double v8 = width;
  result.height = v7;
  result.CGFloat width = v8;
  return result;
}

- (void)layoutSubviews
{
  v3 = [(YearViewYearHeader *)self window];

  if (v3)
  {
    v4.receiver = self;
    v4.super_class = (Class)YearViewYearHeader;
    [(YearViewYearHeader *)&v4 layoutSubviews];
    [(YearViewYearHeader *)self _layoutYearNumber];
    [(YearViewYearHeader *)self _layoutThinLine];
    [(YearViewYearHeader *)self _layoutOverlayLegend];
  }
  else
  {
    self->_layoutWhenJoiningViewHierarchy = 1;
  }
}

- (void)willMoveToWindow:(id)a3
{
  if (a3)
  {
    if (self->_layoutWhenJoiningViewHierarchy)
    {
      id v4 = a3;
      EKUIPushFallbackSizingContextWithViewHierarchy();
      [(YearViewYearHeader *)self layoutSubviews];
      EKUIPopFallbackSizingContextWithViewHierarchy();

      self->_layoutWhenJoiningViewHierarchy = 0;
    }
  }
}

+ (double)heightForWindowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [objc_opt_class() headerYInsetForWindowSize:a3.width, a3.height];
  double v6 = v5;
  [objc_opt_class() middleHeightForWindowSize:width height:height];
  double v8 = v7;
  [objc_opt_class() headerDaySpacingForWindowSize:width height:height];
  return v6 + v8 + v9;
}

- (void)setCalendarDate:(id)a3
{
  double v5 = (EKCalendarDate *)a3;
  p_calendarDate = &self->_calendarDate;
  if (self->_calendarDate != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_calendarDate, a3);
    [(YearViewYearHeader *)self _reloadYearNumberLabel];
    p_calendarDate = (EKCalendarDate **)[(YearViewYearHeader *)self _updateOverlayLegend];
    double v5 = v7;
  }

  _objc_release_x1(p_calendarDate, v5);
}

- (void)localeChanged
{
  [(YearViewYearHeader *)self _reloadYearNumberLabel];

  [(YearViewYearHeader *)self _updateOverlayLegend];
}

+ (id)_headerBackgroundColor
{
  return +[UIColor systemBackgroundColor];
}

- (id)_thinLineColor
{
  if (qword_100216708 != -1) {
    dispatch_once(&qword_100216708, &stru_1001D38A0);
  }
  v2 = (void *)qword_100216700;

  return v2;
}

- (void)_initializeThinLine
{
  if (self->_thinLine)
  {
    v2 = kCalUILogHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "The thin line already been initialized.", v8, 2u);
    }
  }
  else
  {
    id v4 = (UIView *)objc_alloc_init((Class)UIView);
    thinLine = self->_thinLine;
    self->_thinLine = v4;

    double v6 = [(YearViewYearHeader *)self _thinLineColor];
    [(UIView *)self->_thinLine setBackgroundColor:v6];

    double v7 = self->_thinLine;
    [(YearViewYearHeader *)self addSubview:v7];
  }
}

- (void)_reloadYearNumberLabel
{
  if (!self->_yearNumber)
  {
    v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    yearNumber = self->_yearNumber;
    self->_yearNumber = v3;

    double v5 = [(id)objc_opt_class() _headerBackgroundColor];
    [(UILabel *)self->_yearNumber setBackgroundColor:v5];

    [(YearViewYearHeader *)self addSubview:self->_yearNumber];
  }
  id v6 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v6 setAlignment:0];
  double v7 = [(YearViewYearHeader *)self calendarDate];
  double v8 = [v7 date];
  if (CUIKNSDateIsThisYear()) {
    CalendarAppTintColor();
  }
  else {
  double v9 = +[UIColor labelColor];
  }

  v22[0] = NSFontAttributeName;
  id v10 = [(YearViewYearHeader *)self yearNumberFont];
  v23[0] = v10;
  v23[1] = v6;
  v22[1] = NSParagraphStyleAttributeName;
  v22[2] = NSForegroundColorAttributeName;
  v23[2] = v9;
  v22[3] = NSKernAttributeName;
  [(YearViewYearHeader *)self yearNumberKerning];
  *(float *)&double v11 = v11;
  v12 = +[NSNumber numberWithFloat:v11];
  v23[3] = v12;
  v13 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

  id v14 = [(YearViewYearHeader *)self _yearString];
  id v15 = [objc_alloc((Class)NSAttributedString) initWithString:v14 attributes:v13];
  [(UILabel *)self->_yearNumber setAttributedText:v15];
  [(UILabel *)self->_yearNumber sizeToFit];
  [(UILabel *)self->_yearNumber frame];
  double v17 = v16;
  double v19 = v18;
  [(UILabel *)self->_yearNumber bounds];
  CGFloat v20 = CGRectGetWidth(v24) + 10.0;
  [(UILabel *)self->_yearNumber bounds];
  -[UILabel setFrame:](self->_yearNumber, "setFrame:", v17, v19, v20, CGRectGetHeight(v25));
  v21 = [(id)objc_opt_class() _headerBackgroundColor];
  [(UILabel *)self->_yearNumber setBackgroundColor:v21];

  [(YearViewYearHeader *)self setNeedsLayout];
  [(YearViewYearHeader *)self setNeedsDisplay];
}

- (id)_yearString
{
  v3 = +[NSCalendar currentCalendar];
  id v4 = [v3 calendarIdentifier];
  unsigned int v5 = [NSCalendarIdentifierJapanese isEqualToString:v4];

  if (!v5) {
    goto LABEL_4;
  }
  id v6 = [(YearViewYearHeader *)self calendarDate];
  double v7 = [v6 date];
  id v8 = [v3 component:2 fromDate:v7];

  double v9 = [(YearViewYearHeader *)self calendarDate];
  id v10 = [v9 calendarDateForEndOfYear];

  double v11 = [v10 date];
  id v12 = [v3 component:2 fromDate:v11];

  if (v8 == v12)
  {

LABEL_4:
    self->_showingMultiEraYear = 0;
    id v10 = [(YearViewYearHeader *)self calendarDate];
    v13 = [v10 date];
    id v14 = CUIKStringForYear();
    goto LABEL_6;
  }
  self->_showingMultiEraYear = 1;
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  id v15 = [v13 localizedStringForKey:@"%@ / %@" value:&stru_1001D6918 table:0];
  double v16 = [(YearViewYearHeader *)self calendarDate];
  double v17 = [v16 date];
  double v18 = CUIKStringForYear();
  double v19 = [v10 date];
  CGFloat v20 = CUIKStringForYear();
  id v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v18, v20);

LABEL_6:

  return v14;
}

- (void)_updateOverlayLegend
{
  v3 = CUIKGetOverlayCalendar();
  BOOL v4 = v3 != 0;

  if (self->_showingOverlayLegend == v4)
  {
    if (!v3) {
      goto LABEL_12;
    }
  }
  else
  {
    self->_showingOverlayLegend = v4;
    if (!v3)
    {
      [(YearViewYearHeader *)self _removeOverlayLegend];
      goto LABEL_12;
    }
    unsigned int v5 = (UIView *)objc_opt_new();
    overlayLegendYearStartLine = self->_overlayLegendYearStartLine;
    self->_overlayLegendYearStartLine = v5;

    double v7 = CalendarAppTintColor();
    [(UIView *)self->_overlayLegendYearStartLine setBackgroundColor:v7];

    [(YearViewYearHeader *)self addSubview:self->_overlayLegendYearStartLine];
    id v8 = (UIView *)objc_opt_new();
    overlayLegendMonthStartLine = self->_overlayLegendMonthStartLine;
    self->_overlayLegendMonthStartLine = v8;

    id v10 = CalendarAppTintColor();
    [(UIView *)self->_overlayLegendMonthStartLine setBackgroundColor:v10];

    [(YearViewYearHeader *)self addSubview:self->_overlayLegendMonthStartLine];
    double v11 = (UILabel *)objc_opt_new();
    overlayLegendYearStartLabel = self->_overlayLegendYearStartLabel;
    self->_overlayLegendYearStartLabel = v11;

    v13 = +[UIColor systemGrayColor];
    [(UILabel *)self->_overlayLegendYearStartLabel setTextColor:v13];

    id v14 = [(YearViewYearHeader *)self overlayLegendFont];
    [(UILabel *)self->_overlayLegendYearStartLabel setFont:v14];

    [(YearViewYearHeader *)self addSubview:self->_overlayLegendYearStartLabel];
    id v15 = (UILabel *)objc_opt_new();
    overlayLegendMonthStartLabel = self->_overlayLegendMonthStartLabel;
    self->_overlayLegendMonthStartLabel = v15;

    double v17 = +[UIColor systemGrayColor];
    [(UILabel *)self->_overlayLegendMonthStartLabel setTextColor:v17];

    double v18 = [(YearViewYearHeader *)self overlayLegendFont];
    [(UILabel *)self->_overlayLegendMonthStartLabel setFont:v18];

    [(YearViewYearHeader *)self addSubview:self->_overlayLegendMonthStartLabel];
  }
  double v19 = CUIKGetOverlayCalendar();
  CGFloat v20 = [(EKCalendarDate *)self->_calendarDate date];
  v21 = [v19 components:24 fromDate:v20];
  if ([v21 day] != (id)1
    || [v21 month] != (id)1
    || [v21 isLeapMonth])
  {
    uint64_t v22 = [v19 dateByAddingUnit:4 value:1 toDate:v20 options:1024];

    CGFloat v20 = (void *)v22;
  }
  v23 = +[CUIKDateStrings overlayYearStringForDate:v20 inCalendar:v19];
  [(UILabel *)self->_overlayLegendYearStartLabel setText:v23];

  CGRect v24 = +[CUIKDateStrings overlayFirstDayOfLunarMonthLocalizedStringInCalendar:v19];
  [(UILabel *)self->_overlayLegendMonthStartLabel setText:v24];

LABEL_12:

  [(YearViewYearHeader *)self setNeedsLayout];
}

- (void)_removeOverlayLegend
{
  [(UIView *)self->_overlayLegendYearStartLine removeFromSuperview];
  [(UIView *)self->_overlayLegendMonthStartLine removeFromSuperview];
  [(UILabel *)self->_overlayLegendYearStartLabel removeFromSuperview];
  [(UILabel *)self->_overlayLegendMonthStartLabel removeFromSuperview];
  overlayLegendYearStartLine = self->_overlayLegendYearStartLine;
  self->_overlayLegendYearStartLine = 0;

  overlayLegendMonthStartLine = self->_overlayLegendMonthStartLine;
  self->_overlayLegendMonthStartLine = 0;

  overlayLegendYearStartLabel = self->_overlayLegendYearStartLabel;
  self->_overlayLegendYearStartLabel = 0;

  overlayLegendMonthStartLabel = self->_overlayLegendMonthStartLabel;
  self->_overlayLegendMonthStartLabel = 0;
}

- (void)_layoutThinLine
{
  [(YearViewYearHeader *)self bounds];
  double v4 = v3;
  CalRoundToScreenScale();
  double v6 = v5;
  CalOnePixelInPoints();
  CalRoundToScreenScale();
  double v8 = v7;
  [(UILabel *)self->_yearNumber frame];
  double MaxY = CGRectGetMaxY(v13);
  [(YearViewYearHeader *)self heightBetweenLineAndNumber];
  thinLine = self->_thinLine;

  -[UIView setFrame:](thinLine, "setFrame:", v6, MaxY + v10, v4 - v6, v8);
}

- (void)_layoutYearNumber
{
  [(UILabel *)self->_yearNumber frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = 0.0;
  if ((CalInterfaceIsLeftToRight() & 1) == 0)
  {
    [(YearViewYearHeader *)self bounds];
    double MaxX = CGRectGetMaxX(v17);
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.double width = v8;
    v18.size.double height = v10;
    double v11 = MaxX - CGRectGetWidth(v18);
  }
  CGRect v13 = objc_opt_class();
  EKUICurrentWindowSize();
  [v13 headerYInsetForWindowSize:];
  yearNumber = self->_yearNumber;

  -[UILabel setFrame:](yearNumber, "setFrame:", v11, v14, v8, v10);
}

- (void)_layoutOverlayLegend
{
  if (self->_showingOverlayLegend)
  {
    [(UILabel *)self->_overlayLegendYearStartLabel sizeToFit];
    [(UILabel *)self->_overlayLegendMonthStartLabel sizeToFit];
    [(YearViewYearHeader *)self overlayLegendLineLength];
    double v4 = v3;
    int IsLeftToRight = CalInterfaceIsLeftToRight();
    [(YearViewYearHeader *)self bounds];
    double v91 = v4;
    if (IsLeftToRight)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v6);
      [(YearViewYearHeader *)self overlayLegendRightInset];
      double v12 = MaxX - v11;
      [(UILabel *)self->_overlayLegendYearStartLabel frame];
      double Width = CGRectGetWidth(v92);
      [(UILabel *)self->_overlayLegendMonthStartLabel frame];
      double v14 = v12 - fmax(Width, CGRectGetWidth(v93));
      [(YearViewYearHeader *)self overlayLegendSpacing];
      double v89 = v14 - v15 - v4;
      double v16 = v14;
      [(UIView *)self->_thinLine frame];
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v6);
      [(YearViewYearHeader *)self overlayLegendSpacing];
      double v23 = MinX + v22;
      [(UILabel *)self->_overlayLegendYearStartLabel frame];
      double v24 = CGRectGetWidth(v94);
      [(UILabel *)self->_overlayLegendMonthStartLabel frame];
      double v25 = v23 + fmax(v24, CGRectGetWidth(v95));
      [(YearViewYearHeader *)self overlayLegendSpacing];
      double v27 = v25 - v26;
      [(UILabel *)self->_overlayLegendYearStartLabel frame];
      double v16 = v27 - CGRectGetWidth(v96);
      [(YearViewYearHeader *)self overlayLegendSpacing];
      double v29 = v25 - v28;
      [(UILabel *)self->_overlayLegendMonthStartLabel frame];
      double v14 = v29 - CGRectGetWidth(v97);
      [(UIView *)self->_thinLine frame];
    }
    double MinY = CGRectGetMinY(*(CGRect *)&v17);
    [(UILabel *)self->_overlayLegendYearStartLabel frame];
    double v32 = v31;
    double v34 = v33;
    [(YearViewYearHeader *)self overlayLegendYearBaseline];
    double v36 = MinY - v35;
    [(UILabel *)self->_overlayLegendYearStartLabel _firstLineBaselineOffsetFromBoundsTop];
    CGFloat v38 = v36 - v37;
    -[UILabel setFrame:](self->_overlayLegendYearStartLabel, "setFrame:", v16, v36 - v37, v32, v34);
    [(UILabel *)self->_overlayLegendMonthStartLabel frame];
    double v40 = v39;
    double v42 = v41;
    [(YearViewYearHeader *)self overlayLegendMonthBaseline];
    double v44 = MinY - v43;
    [(UILabel *)self->_overlayLegendMonthStartLabel _firstLineBaselineOffsetFromBoundsTop];
    CGFloat v46 = v44 - v45;
    -[UILabel setFrame:](self->_overlayLegendMonthStartLabel, "setFrame:", v14, v46, v40, v42);
    v98.origin.CGFloat x = v16;
    v98.origin.CGFloat y = v38;
    v98.size.double width = v32;
    v98.size.CGFloat height = v34;
    CGRectGetMidY(v98);
    [(YearViewYearHeader *)self overlayLegendYearLineThickness];
    CalRoundToScreenScale();
    double v48 = v47;
    [(YearViewYearHeader *)self overlayLegendYearLineThickness];
    -[UIView setFrame:](self->_overlayLegendYearStartLine, "setFrame:", v90, v48, v91, v49);
    v99.origin.CGFloat x = v14;
    v99.origin.CGFloat y = v46;
    v99.size.double width = v40;
    v99.size.CGFloat height = v42;
    CGRectGetMidY(v99);
    [(YearViewYearHeader *)self overlayLegendMonthLineThickness];
    CalRoundToScreenScale();
    double v51 = v50;
    [(YearViewYearHeader *)self overlayLegendMonthLineThickness];
    -[UIView setFrame:](self->_overlayLegendMonthStartLine, "setFrame:", v90, v51, v91, v52);
    if (self->_showingMultiEraYear)
    {
      [(UILabel *)self->_overlayLegendYearStartLabel frame];
      CGFloat v54 = v53;
      CGFloat v56 = v55;
      CGFloat v58 = v57;
      CGFloat v60 = v59;
      [(UIView *)self->_overlayLegendYearStartLine frame];
      v107.origin.CGFloat x = v61;
      v107.origin.CGFloat y = v62;
      v107.size.double width = v63;
      v107.size.CGFloat height = v64;
      v100.origin.CGFloat x = v54;
      v100.origin.CGFloat y = v56;
      v100.size.double width = v58;
      v100.size.CGFloat height = v60;
      CGRect v101 = CGRectUnion(v100, v107);
      CGFloat x = v101.origin.x;
      CGFloat y = v101.origin.y;
      CGFloat v67 = v101.size.width;
      CGFloat height = v101.size.height;
      [(UIView *)self->_overlayLegendMonthStartLine frame];
      v108.origin.CGFloat x = v69;
      v108.origin.CGFloat y = v70;
      v108.size.double width = v71;
      v108.size.CGFloat height = v72;
      v102.origin.CGFloat x = x;
      v102.origin.CGFloat y = y;
      v102.size.double width = v67;
      v102.size.CGFloat height = height;
      CGRect v103 = CGRectUnion(v102, v108);
      CGFloat v73 = v103.origin.x;
      CGFloat v74 = v103.origin.y;
      CGFloat v75 = v103.size.width;
      CGFloat v76 = v103.size.height;
      [(UILabel *)self->_overlayLegendMonthStartLabel frame];
      v109.origin.CGFloat x = v77;
      v109.origin.CGFloat y = v78;
      v109.size.double width = v79;
      v109.size.CGFloat height = v80;
      v104.origin.CGFloat x = v73;
      v104.origin.CGFloat y = v74;
      v104.size.double width = v75;
      v104.size.CGFloat height = v76;
      CGRect v105 = CGRectUnion(v104, v109);
      CGFloat v81 = v105.origin.x;
      CGFloat v82 = v105.origin.y;
      CGFloat v83 = v105.size.width;
      CGFloat v84 = v105.size.height;
      [(UILabel *)self->_yearNumber frame];
      v110.origin.CGFloat x = v85;
      v110.origin.CGFloat y = v86;
      v110.size.double width = v87;
      v110.size.CGFloat height = v88;
      v106.origin.CGFloat x = v81;
      v106.origin.CGFloat y = v82;
      v106.size.double width = v83;
      v106.size.CGFloat height = v84;
      if (CGRectIntersectsRect(v106, v110))
      {
        [(YearViewYearHeader *)self _removeOverlayLegend];
        self->_showingOverlayLegend = 0;
      }
    }
  }
}

- (EKCalendarDate)calendarDate
{
  return self->_calendarDate;
}

- (UIFont)yearNumberFont
{
  return self->_yearNumberFont;
}

- (double)yearNumberKerning
{
  return self->_yearNumberKerning;
}

- (UIFont)overlayLegendFont
{
  return self->_overlayLegendFont;
}

- (double)overlayLegendRightInset
{
  return self->_overlayLegendRightInset;
}

- (double)overlayLegendYearBaseline
{
  return self->_overlayLegendYearBaseline;
}

- (double)overlayLegendMonthBaseline
{
  return self->_overlayLegendMonthBaseline;
}

- (double)overlayLegendSpacing
{
  return self->_overlayLegendSpacing;
}

- (double)overlayLegendLineLength
{
  return self->_overlayLegendLineLength;
}

- (double)overlayLegendYearLineThickness
{
  return self->_overlayLegendYearLineThickness;
}

- (double)overlayLegendMonthLineThickness
{
  return self->_overlayLegendMonthLineThickness;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayLegendFont, 0);
  objc_storeStrong((id *)&self->_yearNumberFont, 0);
  objc_storeStrong((id *)&self->_calendarDate, 0);
  objc_storeStrong((id *)&self->_overlayLegendMonthStartLabel, 0);
  objc_storeStrong((id *)&self->_overlayLegendYearStartLabel, 0);
  objc_storeStrong((id *)&self->_overlayLegendMonthStartLine, 0);
  objc_storeStrong((id *)&self->_overlayLegendYearStartLine, 0);
  objc_storeStrong((id *)&self->_thinLine, 0);

  objc_storeStrong((id *)&self->_yearNumber, 0);
}

+ (double)headerYInsetForWindowSize:(CGSize)a3
{
  return 0.0;
}

+ (double)middleHeightForWindowSize:(CGSize)a3
{
  return 0.0;
}

+ (double)headerDaySpacingForWindowSize:(CGSize)a3
{
  return 0.0;
}

- (double)yearNumberHeaderFontSize
{
  return 0.0;
}

- (double)heightBetweenLineAndNumber
{
  return 0.0;
}

@end