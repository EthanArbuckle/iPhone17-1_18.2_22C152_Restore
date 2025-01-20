@interface _UICalendarHeaderView
- (BOOL)isExpanded;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (_UICalendarDataModel)dataModel;
- (_UICalendarHeaderView)initWithDataModel:(id)a3 delegate:(id)a4;
- (_UICalendarHeaderViewDelegate)delegate;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)_adjustMonth:(id)a3;
- (void)_setupDateFormatter;
- (void)_setupViewHierarchy;
- (void)_updateFont;
- (void)_updateMonthButtonEnablement;
- (void)_updateMonthButtonVisibility;
- (void)_updateMonthYearLabel;
- (void)didMoveToWindow;
- (void)didUpdateCalendar;
- (void)didUpdateLocale;
- (void)didUpdateTimeZone;
- (void)didUpdateVisibleMonth;
- (void)layoutSubviews;
- (void)setDataModel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
@end

@implementation _UICalendarHeaderView

- (_UICalendarHeaderView)initWithDataModel:(id)a3 delegate:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UICalendarHeaderView;
  v9 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    objc_storeStrong((id *)&v10->_dataModel, a3);
    -[UIView setLayoutMargins:](v10, "setLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    [(UIView *)v10 setPreservesSuperviewLayoutMargins:1];
    [(_UICalendarHeaderView *)v10 _setupDateFormatter];
    [(_UICalendarHeaderView *)v10 _setupViewHierarchy];
    [(_UICalendarHeaderView *)v10 _updateMonthYearLabel];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    id v12 = [(UIView *)v10 registerForTraitChanges:v11 withAction:sel__updateFont];
  }
  return v10;
}

- (void)_setupDateFormatter
{
  id v11 = [(_UICalendarDataModel *)self->_dataModel effectiveCalendar];
  v3 = [(_UICalendarDataModel *)self->_dataModel effectiveLocale];
  v4 = [(_UICalendarDataModel *)self->_dataModel effectiveTimeZone];
  v5 = (NSDateFormatter *)objc_opt_new();
  [(NSDateFormatter *)v5 setFormattingContext:2];
  [(NSDateFormatter *)v5 setCalendar:v11];
  [(NSDateFormatter *)v5 setLocale:v3];
  [(NSDateFormatter *)v5 setTimeZone:v4];
  [(NSDateFormatter *)v5 setLocalizedDateFormatFromTemplate:@"MMMMy"];
  longFormatter = self->_longFormatter;
  self->_longFormatter = v5;
  id v7 = v5;

  id v8 = (NSDateFormatter *)objc_opt_new();
  [(NSDateFormatter *)v8 setFormattingContext:2];
  [(NSDateFormatter *)v8 setCalendar:v11];
  [(NSDateFormatter *)v8 setLocale:v3];
  v9 = [v11 timeZone];
  [(NSDateFormatter *)v8 setTimeZone:v9];

  [(NSDateFormatter *)v8 setLocalizedDateFormatFromTemplate:@"MMMy"];
  shortFormatter = self->_shortFormatter;
  self->_shortFormatter = v8;
}

- (void)_setupViewHierarchy
{
  v3 = [(UIView *)self traitCollection];
  v4 = _UICalendarViewGetPlatformMetrics([v3 userInterfaceIdiom]);

  v5 = [v4 nextPreviousMonthButtonConfiguration];
  v6 = [(UIView *)self traitCollection];
  id v7 = ((void (**)(void, void *))v5)[2](v5, v6);

  id v8 = +[UIImage systemImageNamed:@"chevron.backward"];
  [v7 setImage:v8];

  v9 = +[UIButton buttonWithConfiguration:v7 primaryAction:0];
  [v9 addTarget:self action:sel__adjustMonth_ forControlEvents:0x2000];
  [(UIView *)self addSubview:v9];
  objc_storeStrong((id *)&self->_previousMonthButton, v9);
  v10 = +[UIImage systemImageNamed:@"chevron.forward"];
  [v7 setImage:v10];

  id v11 = +[UIButton buttonWithConfiguration:v7 primaryAction:0];
  [v11 addTarget:self action:sel__adjustMonth_ forControlEvents:0x2000];
  [(UIView *)self addSubview:v11];
  objc_storeStrong((id *)&self->_nextMonthButton, v11);
  id v12 = [v4 monthYearButtonConfiguration];
  v13 = [(UIView *)self traitCollection];
  objc_super v14 = ((void (**)(void, void *))v12)[2](v12, v13);

  v15 = +[UIButton buttonWithConfiguration:v14 primaryAction:0];
  v16 = [(UIView *)self traitCollection];
  objc_msgSend(v15, "setEnabled:", objc_msgSend(v16, "userInterfaceIdiom") != 5);

  [(UIView *)self addSubview:v15];
  objc_storeStrong((id *)&self->_monthYearButton, v15);
  objc_initWeak(&location, self);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __44___UICalendarHeaderView__setupViewHierarchy__block_invoke;
  v21 = &unk_1E52DDB60;
  objc_copyWeak(&v22, &location);
  v17 = +[UIAction actionWithHandler:&v18];
  objc_msgSend(v15, "addAction:forControlEvents:", v17, 0x2000, v18, v19, v20, v21);

  [v9 setPreferredBehavioralStyle:1];
  [v11 setPreferredBehavioralStyle:1];
  [v15 setPreferredBehavioralStyle:1];
  [v9 setPointerInteractionEnabled:1];
  [v11 setPointerInteractionEnabled:1];
  [v15 setPointerInteractionEnabled:1];
  [(_UICalendarHeaderView *)self _updateFont];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)didUpdateCalendar
{
  [(_UICalendarHeaderView *)self _setupDateFormatter];
  [(_UICalendarHeaderView *)self _updateMonthYearLabel];
}

- (void)didUpdateLocale
{
  [(_UICalendarHeaderView *)self _setupDateFormatter];
  [(_UICalendarHeaderView *)self _updateMonthYearLabel];
}

- (void)didUpdateTimeZone
{
  [(_UICalendarHeaderView *)self _setupDateFormatter];
  [(_UICalendarHeaderView *)self _updateMonthYearLabel];
}

- (void)didUpdateVisibleMonth
{
  [(_UICalendarHeaderView *)self _updateMonthYearLabel];
  [(_UICalendarHeaderView *)self _updateMonthButtonEnablement];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_UICalendarHeaderView;
  [(UIView *)&v4 didMoveToWindow];
  v3 = [(UIView *)self window];

  if (v3) {
    [(UIView *)self setNeedsLayout];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UICalendarHeaderView;
  [(UIView *)&v3 tintColorDidChange];
  if (self->_expanded) {
    [(_UICalendarHeaderView *)self _updateMonthYearLabel];
  }
}

- (void)_updateMonthYearLabel
{
  v13[2] = *MEMORY[0x1E4F143B8];
  monthYearButton = self->_monthYearButton;
  longFormatter = self->_longFormatter;
  v5 = [(_UICalendarDataModel *)self->_dataModel visibleMonth];
  v6 = [v5 date];
  id v7 = [(NSDateFormatter *)longFormatter stringFromDate:v6];
  v13[0] = v7;
  shortFormatter = self->_shortFormatter;
  v9 = [(_UICalendarDataModel *)self->_dataModel visibleMonth];
  v10 = [v9 date];
  id v11 = [(NSDateFormatter *)shortFormatter stringFromDate:v10];
  v13[1] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [(_UICalendarHeaderTitleButton *)monthYearButton updateTitles:v12 isExpanded:self->_expanded];

  [(UIView *)self setNeedsLayout];
}

- (void)_updateFont
{
  objc_super v3 = [(_UICalendarDataModel *)self->_dataModel fontDesign];
  [(_UICalendarHeaderTitleButton *)self->_monthYearButton setFontDesign:v3];

  [(UIView *)self invalidateIntrinsicContentSize];
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v47.receiver = self;
  v47.super_class = (Class)_UICalendarHeaderView;
  [(UIView *)&v47 layoutSubviews];
  [(UIView *)self bounds];
  if (v3 != 0.0)
  {
    objc_super v4 = [(UIView *)self traitCollection];
    v5 = _UICalendarViewGetPlatformMetrics([v4 userInterfaceIdiom]);

    BOOL v6 = [(UIView *)self _shouldReverseLayoutDirection];
    id v7 = [v5 headerViewInsetsForLayoutMargins];
    [(UIView *)self directionalLayoutMargins];
    double v8 = v7[2](v7);
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    CGSize v15 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    slice.size = v15;
    [(UIView *)self bounds];
    if (v6) {
      double v20 = v14;
    }
    else {
      double v20 = v10;
    }
    if (v6) {
      double v21 = v10;
    }
    else {
      double v21 = v14;
    }
    double v22 = v20 + v16;
    double v23 = v8 + v17;
    double v24 = v18 - (v20 + v21);
    double v25 = v19 - (v8 + v12);
    v45.origin.double x = v20 + v16;
    v45.origin.y = v8 + v17;
    v45.size.width = v24;
    v45.size.height = v25;
    if (v6) {
      CGRectEdge v26 = CGRectMinXEdge;
    }
    else {
      CGRectEdge v26 = CGRectMaxXEdge;
    }
    previousMonthButton = self->_previousMonthButton;
    [(UIView *)self bounds];
    -[UIButton sizeThatFits:](previousMonthButton, "sizeThatFits:", v28, v29);
    CGFloat v31 = v30;
    double v33 = v32;
    nextMonthButton = self->_nextMonthButton;
    [(UIView *)self bounds];
    -[UIButton sizeThatFits:](nextMonthButton, "sizeThatFits:", v35, v36);
    CGFloat v38 = v37;
    double v40 = v39;
    v48.origin.double x = v22;
    v48.origin.y = v23;
    v48.size.width = v24;
    v48.size.height = v25;
    CGRectDivide(v48, &slice, &v45, v38, v26);
    CGRect v49 = CGRectInset(slice, 0.0, (slice.size.height - v40) * 0.5);
    -[UIButton setFrame:](self->_nextMonthButton, "setFrame:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
    [v5 headerViewInterMonthButtonSpacing];
    if (v41 > 0.0) {
      CGRectDivide(v45, &slice, &v45, v41, v26);
    }
    CGRectDivide(v45, &slice, &v45, v31, v26);
    CGRect v50 = CGRectInset(slice, 0.0, (slice.size.height - v33) * 0.5);
    -[UIButton setFrame:](self->_previousMonthButton, "setFrame:", v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
    -[_UICalendarHeaderTitleButton sizeThatFits:](self->_monthYearButton, "sizeThatFits:", v45.size.width, v45.size.height);
    double v43 = v42;
    if (v6) {
      double x = CGRectGetMaxX(v45) - v42;
    }
    else {
      double x = v45.origin.x;
    }
    -[UIButton setFrame:](self->_monthYearButton, "setFrame:", x, 0.0, v43, v45.size.height);
  }
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(UIView *)self traitCollection];
  id v7 = _UICalendarViewGetPlatformMetrics([v6 userInterfaceIdiom]);

  double v8 = [v7 headerViewIntrinsicLayoutMarginsForProposedLayoutMargins];
  [(UIView *)self layoutMargins];
  double v9 = v8[2](v8);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = [(UIButton *)self->_nextMonthButton configuration];
  [v16 contentInsets];
  double v18 = v11 + v15 - v17;

  double v19 = v9 + v13;
  double v20 = width - v18;
  -[_UICalendarHeaderTitleButton sizeThatFits:](self->_monthYearButton, "sizeThatFits:", width - v18, height);
  double v22 = v21;
  double v24 = v23;
  -[UIButton sizeThatFits:](self->_previousMonthButton, "sizeThatFits:", v20, height);
  double v26 = v25;
  double v28 = v27;
  [v7 headerViewInterMonthButtonSpacing];
  double v30 = fmax(width - (v20 - (v22 + v29 + v26 + v26)), width);

  double v31 = v30;
  double v32 = fmax(v19 + v24, v28);
  result.double height = v32;
  result.double width = v31;
  return result;
}

- (void)_adjustMonth:(id)a3
{
  nextMonthButton = self->_nextMonthButton;
  BOOL v6 = [(_UICalendarHeaderView *)self delegate];
  id v7 = v6;
  if (nextMonthButton == a3) {
    [v6 headerViewDidStepForward:self];
  }
  else {
    [v6 headerViewDidStepBackward:self];
  }
}

- (void)setExpanded:(BOOL)a3
{
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(_UICalendarHeaderView *)self isExpanded] != a3
    && [(UIControl *)self->_monthYearButton isEnabled])
  {
    self->_expanded = v5;
    BOOL v7 = [(UIView *)self _shouldReverseLayoutDirection];
    memset(&v15, 0, sizeof(v15));
    if (v5)
    {
      double v8 = 1.57079633;
      if (v7) {
        double v8 = -1.57079633;
      }
      CGAffineTransformMakeRotation(&v15, v8);
    }
    else
    {
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v15.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v15.c = v9;
      *(_OWORD *)&v15.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    CGAffineTransform v13 = v15;
    v12[2] = __46___UICalendarHeaderView_setExpanded_animated___block_invoke;
    v12[3] = &unk_1E52E7900;
    v12[4] = self;
    BOOL v14 = v5;
    double v10 = _Block_copy(v12);
    double v11 = v10;
    if (v4) {
      +[UIView animateWithDuration:0 delay:v10 options:0 animations:0.25 completion:0.0];
    }
    else {
      (*((void (**)(void *))v10 + 2))(v10);
    }
  }
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  BOOL v5 = +[_UIPointerSettingsDomain rootSettings];
  BOOL v6 = [v5 navigationAndToolbarSettings];

  BOOL v7 = self->_monthYearButton;
  [(UIView *)v7 bounds];
  double Height = CGRectGetHeight(v21);
  [v6 buttonMinimumHeight];
  double v10 = fmax((v9 - Height) * 0.5, 0.0);
  [(UIView *)v7 frame];
  CGRect v23 = CGRectInset(v22, -4.0, -v10);
  double x = v23.origin.x;
  double y = v23.origin.y;
  double width = v23.size.width;
  double v14 = v23.size.height;
  CGAffineTransform v15 = [[UITargetedPreview alloc] initWithView:v7];

  double v16 = +[UIPointerEffect effectWithPreview:v15];
  double v17 = +[UIPointerShape shapeWithRoundedRect:](UIPointerShape, "shapeWithRoundedRect:", x, y, width, v14);
  double v18 = +[UIPointerStyle styleWithEffect:v16 shape:v17];

  return v18;
}

- (void)_updateMonthButtonEnablement
{
  double v3 = [(_UICalendarDataModel *)self->_dataModel availableDateRange];
  BOOL v4 = [(_UICalendarDataModel *)self->_dataModel visibleMonth];
  BOOL v5 = [v4 previousMonth];
  uint64_t v6 = objc_msgSend(v3, "_ui_containsMonth:", v5);

  BOOL v7 = [(_UICalendarDataModel *)self->_dataModel availableDateRange];
  double v8 = [(_UICalendarDataModel *)self->_dataModel visibleMonth];
  double v9 = [v8 nextMonth];
  uint64_t v10 = objc_msgSend(v7, "_ui_containsMonth:", v9);

  [(UIButton *)self->_previousMonthButton setEnabled:v6];
  nextMonthButton = self->_nextMonthButton;
  [(UIButton *)nextMonthButton setEnabled:v10];
}

- (void)_updateMonthButtonVisibility
{
  if (self->_expanded) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  [(UIView *)self->_previousMonthButton setAlpha:v3];
  nextMonthButton = self->_nextMonthButton;
  [(UIView *)nextMonthButton setAlpha:v3];
}

- (_UICalendarHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UICalendarHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UICalendarDataModel)dataModel
{
  return self->_dataModel;
}

- (void)setDataModel:(id)a3
{
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextMonthButton, 0);
  objc_storeStrong((id *)&self->_previousMonthButton, 0);
  objc_storeStrong((id *)&self->_monthYearButton, 0);
  objc_storeStrong((id *)&self->_shortFormatter, 0);
  objc_storeStrong((id *)&self->_longFormatter, 0);
}

@end