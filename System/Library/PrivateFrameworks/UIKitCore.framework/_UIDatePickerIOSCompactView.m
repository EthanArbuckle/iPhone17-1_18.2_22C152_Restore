@interface _UIDatePickerIOSCompactView
- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth;
- (BOOL)alignConstraintsToLayoutGuide;
- (BOOL)compactTimeLabel:(id)a3 shouldDismissForInteractionAtLocation:(CGPoint)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasDefaultSize;
- (BOOL)usesAutoLayout;
- (CGSize)_sizeThatFits:(CGSize)a3;
- (CGSize)defaultSize;
- (NSDictionary)overrideAttributes;
- (UIDatePicker)datePicker;
- (UIEdgeInsets)appliedInsetsToEdgeOfContent;
- (_UIDatePickerCompactDateLabel)dateView;
- (_UIDatePickerCompactTimeLabel)timeView;
- (_UIDatePickerDataModel)data;
- (_UIDatePickerIOSCompactView)initWithFrame:(CGRect)a3;
- (id)createDatePickerForCompactDateLabel:(id)a3;
- (id)createDatePickerForCompactTimeLabel:(id)a3;
- (int64_t)datePickerStyle;
- (void)_contentSizeCategoryDidChange:(id)a3 previousTraits:(id)a4;
- (void)_datePickerPresentation:(id)a3 didChangeActiveMode:(int64_t)a4;
- (void)_didReceivePanGestureRecognizer:(id)a3;
- (void)_reloadTimeViewTimeFormat;
- (void)_resignActiveComponentAnimated:(BOOL)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)_updateDateBeforeTimeValue;
- (void)_updateDateViewTextAlignment;
- (void)_updateEnabledStyling;
- (void)_updateUI;
- (void)compactDateLabelDidBeginEditing:(id)a3;
- (void)compactDateLabelDidEndEditing:(id)a3;
- (void)compactTimeLabel:(id)a3 didSelectTime:(id)a4;
- (void)compactTimeLabelDidBeginEditing:(id)a3;
- (void)compactTimeLabelDidEndEditing:(id)a3;
- (void)compactTimeLabelWillBecomeFirstResponder:(id)a3;
- (void)didChangeCalendar;
- (void)didChangeCompactStyleDelegate;
- (void)didChangeDateFrom:(id)a3 animated:(BOOL)a4;
- (void)didChangeLocale;
- (void)didChangeMaximumDate;
- (void)didChangeMinimumDate;
- (void)didChangeMinuteInterval;
- (void)didChangeMode;
- (void)didChangeRoundsToMinuteInterval;
- (void)didChangeTimeZone;
- (void)didReset;
- (void)displaySelectedDateAnimated:(BOOL)a3;
- (void)setActiveComponent:(int64_t)a3;
- (void)setContentHorizontalAlignment:(int64_t)a3;
- (void)setData:(id)a3;
- (void)setDatePicker:(id)a3;
- (void)setOverrideAttributes:(id)a3;
- (void)tintColorDidChange;
- (void)updateConstraints;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIDatePickerIOSCompactView

- (void)setContentHorizontalAlignment:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerIOSCompactView;
  [(UIControl *)&v4 setContentHorizontalAlignment:a3];
  [(_UIDatePickerOverlayPresentation *)self->_presentation setAlignment:[(UIControl *)self effectiveContentHorizontalAlignment]];
  [(UIView *)self setNeedsUpdateConstraints];
}

- (_UIDatePickerIOSCompactView)initWithFrame:(CGRect)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)_UIDatePickerIOSCompactView;
  v3 = -[UIControl initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    dateView = v3->_dateView;
    v3->_dateView = (_UIDatePickerCompactDateLabel *)v4;

    [(UIView *)v3->_dateView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIDatePickerCompactDateLabel *)v3->_dateView setDelegate:v3];
    v6 = [(_UIDatePickerIOSCompactView *)v3 data];
    v7 = [v6 effectiveCalendar];
    v8 = [(_UIDatePickerIOSCompactView *)v3 data];
    v9 = [v8 effectiveLocale];
    v10 = [(_UIDatePickerIOSCompactView *)v3 data];
    v11 = +[_UIDatePickerCalendarTimeFormat formatWithCalendar:locale:followsSystemHourCycle:](_UIDatePickerCalendarTimeFormat, "formatWithCalendar:locale:followsSystemHourCycle:", v7, v9, [v10 followsSystemHourCycle]);

    v12 = [_UIDatePickerCompactTimeLabel alloc];
    v13 = [(_UIDatePickerIOSCompactView *)v3 data];
    uint64_t v14 = -[_UIDatePickerCompactTimeLabel initWithTimeFormat:minuteInterval:](v12, "initWithTimeFormat:minuteInterval:", v11, [v13 minuteInterval]);
    timeView = v3->_timeView;
    v3->_timeView = (_UIDatePickerCompactTimeLabel *)v14;

    [(UIView *)v3->_timeView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(_UIDatePickerCompactTimeLabel *)v3->_timeView setSelectionDelegate:v3];
    v16 = [[_UIDatePickerOverlayPresentation alloc] initWithSourceView:v3];
    presentation = v3->_presentation;
    v3->_presentation = v16;

    [(_UIDatePickerOverlayPresentation *)v3->_presentation setIgnoresPassthroughOnSourceView:1];
    [(_UIDatePickerOverlayPresentation *)v3->_presentation setAlignment:[(UIControl *)v3 effectiveContentHorizontalAlignment]];
    [(_UIDatePickerOverlayPresentation *)v3->_presentation setDelegate:v3];
    [(_UIDatePickerCompactDateLabel *)v3->_dateView setOverlayPresentation:v3->_presentation];
    [(_UIDatePickerCompactTimeLabel *)v3->_timeView setOverlayPresentation:v3->_presentation];
    uint64_t v18 = objc_opt_new();
    timeViewLayoutGuide = v3->_timeViewLayoutGuide;
    v3->_timeViewLayoutGuide = (UILayoutGuide *)v18;

    [(UIView *)v3 addLayoutGuide:v3->_timeViewLayoutGuide];
    uint64_t v20 = objc_opt_new();
    contentLayoutGuide = v3->_contentLayoutGuide;
    v3->_contentLayoutGuide = (UILayoutGuide *)v20;

    [(UIView *)v3 addLayoutGuide:v3->_contentLayoutGuide];
    [(_UIDatePickerIOSCompactView *)v3 _updateDateBeforeTimeValue];
    [(UIView *)v3 setNeedsUpdateConstraints];
    v22 = [[UIPanGestureRecognizer alloc] initWithTarget:v3 action:sel__didReceivePanGestureRecognizer_];
    panGestureRecognizer = v3->_panGestureRecognizer;
    v3->_panGestureRecognizer = v22;

    [(UIPanGestureRecognizer *)v3->_panGestureRecognizer setDelegate:v3];
    [(UIView *)v3 addGestureRecognizer:v3->_panGestureRecognizer];
    v28[0] = objc_opt_class();
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    id v25 = [(UIView *)v3 registerForTraitChanges:v24 withAction:sel__contentSizeCategoryDidChange_previousTraits_];
  }
  return v3;
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerIOSCompactView;
  -[UIView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3) {
    [(_UIDatePickerIOSCompactView *)self _resignActiveComponentAnimated:0];
  }
}

- (void)willMoveToSuperview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerIOSCompactView;
  -[UIView willMoveToSuperview:](&v5, sel_willMoveToSuperview_);
  if (!a3) {
    [(_UIDatePickerIOSCompactView *)self _resignActiveComponentAnimated:0];
  }
}

- (void)_contentSizeCategoryDidChange:(id)a3 previousTraits:(id)a4
{
  id v5 = a4;
  v6 = [(UIView *)self traitCollection];
  v7 = [v6 preferredContentSizeCategory];
  int IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v7);

  v9 = [v5 preferredContentSizeCategory];

  LODWORD(v5) = UIContentSizeCategoryIsAccessibilityCategory(v9);
  if (IsAccessibilityCategory != v5)
  {
    [(UIView *)self setNeedsUpdateConstraints];
  }
}

- (void)_updateDateBeforeTimeValue
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (!self->_layoutFormatter)
  {
    v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    layoutFormatter = self->_layoutFormatter;
    self->_layoutFormatter = v3;
  }
  id v5 = [(_UIDatePickerDataModel *)self->_data effectiveLocale];
  [(NSDateFormatter *)self->_layoutFormatter setLocale:v5];

  v6 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  [(NSDateFormatter *)self->_layoutFormatter setCalendar:v6];

  v7 = [(_UIDatePickerDataModel *)self->_data timeZone];
  [(NSDateFormatter *)self->_layoutFormatter setTimeZone:v7];

  [(NSDateFormatter *)self->_layoutFormatter setLocalizedDateFormatFromTemplate:@"jy"];
  uint64_t v20 = [(NSDateFormatter *)self->_layoutFormatter dateFormat];
  objc_msgSend(MEMORY[0x1E4F28C10], "_componentsFromFormatString:");
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    BOOL v21 = 0;
    uint64_t v11 = *(void *)v23;
    uint64_t v12 = *MEMORY[0x1E4F1C380];
    uint64_t v13 = *MEMORY[0x1E4F1C390];
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v16 = [v15 objectForKeyedSubscript:v12];
        char v17 = [v16 BOOLValue];

        if ((v17 & 1) == 0)
        {
          uint64_t v18 = [v15 objectForKeyedSubscript:v13];
          uint64_t v19 = [v18 characterAtIndex:0] - 72;
          if (v19 <= 0x31)
          {
            if (v19 == 49)
            {
              BOOL v21 = 1;
            }
            else if (((1 << v19) & 0x900000009) != 0)
            {
              if (self->_dateOnLeadingSide != v21) {
                [(UIView *)self setNeedsUpdateConstraints];
              }
              self->_dateOnLeadingSide = v21;

              goto LABEL_20;
            }
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_20:
}

- (void)_updateUI
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (!self->_dateFormatterMedium)
  {
    v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatterMedium = self->_dateFormatterMedium;
    self->_dateFormatterMedium = v3;

    [(NSDateFormatter *)self->_dateFormatterMedium setDateStyle:2];
    [(NSDateFormatter *)self->_dateFormatterMedium setTimeStyle:0];
    [(NSDateFormatter *)self->_dateFormatterMedium setFormattingContext:2];
  }
  id v5 = [(_UIDatePickerDataModel *)self->_data effectiveLocale];
  [(NSDateFormatter *)self->_dateFormatterMedium setLocale:v5];

  v6 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  [(NSDateFormatter *)self->_dateFormatterMedium setCalendar:v6];

  v7 = [(_UIDatePickerDataModel *)self->_data timeZone];
  [(NSDateFormatter *)self->_dateFormatterMedium setTimeZone:v7];

  if (!self->_dateFormatterShort)
  {
    id v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatterShort = self->_dateFormatterShort;
    self->_dateFormatterShort = v8;

    [(NSDateFormatter *)self->_dateFormatterShort setDateStyle:1];
    [(NSDateFormatter *)self->_dateFormatterShort setTimeStyle:0];
    [(NSDateFormatter *)self->_dateFormatterShort setFormattingContext:2];
  }
  uint64_t v10 = [(_UIDatePickerDataModel *)self->_data effectiveLocale];
  [(NSDateFormatter *)self->_dateFormatterShort setLocale:v10];

  uint64_t v11 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  [(NSDateFormatter *)self->_dateFormatterShort setCalendar:v11];

  uint64_t v12 = [(_UIDatePickerDataModel *)self->_data timeZone];
  [(NSDateFormatter *)self->_dateFormatterShort setTimeZone:v12];

  uint64_t v13 = self->_dateFormatterMedium;
  uint64_t v14 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  v15 = [(NSDateFormatter *)v13 stringForObjectValue:v14];
  v23[0] = v15;
  v16 = self->_dateFormatterShort;
  char v17 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  uint64_t v18 = [(NSDateFormatter *)v16 stringForObjectValue:v17];
  v23[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  uint64_t v20 = [(_UIDatePickerIOSCompactView *)self dateView];
  [v20 setTitles:v19];

  [(_UIDatePickerCompactTimeLabel *)self->_timeView setTapInteractionControlledExternally:(*(unsigned char *)&self->_flags >> 1) & 1];
  [(_UIDatePickerCompactDateLabel *)self->_dateView setTapInteractionControlledExternally:(*(unsigned char *)&self->_flags >> 1) & 1];
  [(UIGestureRecognizer *)self->_panGestureRecognizer setEnabled:(*(unsigned char *)&self->_flags & 2) == 0];
  [(_UIDatePickerIOSCompactView *)self _reloadTimeViewTimeFormat];
  timeView = self->_timeView;
  long long v22 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  [(_UIDatePickerCompactTimeLabel *)timeView reloadWithDate:v22];

  [(_UIDatePickerIOSCompactView *)self _updateEnabledStyling];
}

- (void)_updateEnabledStyling
{
  uint64_t v3 = *(unsigned char *)&self->_flags & 1;
  uint64_t v4 = [(_UIDatePickerIOSCompactView *)self timeView];
  [v4 setEnabled:v3];

  id v5 = [(_UIDatePickerIOSCompactView *)self dateView];
  [v5 setEnabled:v3];

  [(UIView *)self setUserInteractionEnabled:v3];
}

- (void)_updateDateViewTextAlignment
{
  UIControlContentHorizontalAlignment v3 = [(UIControl *)self effectiveContentHorizontalAlignment];
  uint64_t v4 = 1;
  unint64_t v5 = *((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000;
  switch(v3)
  {
    case UIControlContentHorizontalAlignmentLeft:
      uint64_t v4 = 0;
      break;
    case UIControlContentHorizontalAlignmentRight:
      uint64_t v4 = 2;
      break;
    case UIControlContentHorizontalAlignmentLeading:
      uint64_t v4 = v5 >> 18;
      break;
    case UIControlContentHorizontalAlignmentTrailing:
      uint64_t v4 = (v5 >> 18) ^ 2;
      break;
    default:
      break;
  }
  id v6 = [(_UIDatePickerIOSCompactView *)self dateView];
  [v6 setTextAlignment:v4];
}

- (BOOL)alignConstraintsToLayoutGuide
{
  return 0;
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerIOSCompactView;
  [(UIView *)&v5 tintColorDidChange];
  [(_UIDatePickerIOSCompactView *)self _updateEnabledStyling];
  UIControlContentHorizontalAlignment v3 = [(UIView *)self tintColor];
  uint64_t v4 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v4 setTintColor:v3];
}

- (void)updateConstraints
{
  v224[5] = *MEMORY[0x1E4F143B8];
  v205.receiver = self;
  v205.super_class = (Class)_UIDatePickerIOSCompactView;
  [(UIView *)&v205 updateConstraints];
  if (self->_dateTimeConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
  }
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(UIView *)self traitCollection];
  objc_super v5 = +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", [v4 userInterfaceIdiom]);

  [v5 compactLabelButtonSpacing];
  double v7 = v6;
  id v8 = &OBJC_IVAR____UITileLayer_pendingDeferredOffscreenSetNeedsDisplay;
  v204 = (void *)v3;
  v179 = v5;
  switch([(_UIDatePickerDataModel *)self->_data datePickerMode])
  {
    case 0:
      [(UIView *)self->_dateView removeFromSuperview];
      [(UIView *)self addSubview:self->_timeView];
      [(_UIDatePickerCompactTimeLabel *)self->_timeView setAdjustsFontSizeToFitWidth:1];
      [(_UIDatePickerCompactTimeLabel *)self->_timeView setMinimumScaleFactor:0.8];
      v200 = [(UIView *)self->_timeView topAnchor];
      v194 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
      v190 = [v200 constraintEqualToAnchor:v194];
      v213[0] = v190;
      v186 = [(UIView *)self->_timeView bottomAnchor];
      v180 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
      uint64_t v9 = [v186 constraintEqualToAnchor:v180];
      v213[1] = v9;
      uint64_t v10 = [(UIView *)self->_timeView leadingAnchor];
      uint64_t v11 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
      [v10 constraintEqualToAnchor:v11];
      v13 = uint64_t v12 = (void *)v3;
      v213[2] = v13;
      uint64_t v14 = [(UIView *)self->_timeView trailingAnchor];
      v15 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
      v16 = [v14 constraintEqualToAnchor:v15];
      v213[3] = v16;
      char v17 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v18 = v213;
      goto LABEL_11;
    case 1:
      [(UIView *)self addSubview:self->_dateView];
      [(UIView *)self->_timeView removeFromSuperview];
      [(_UIDatePickerCompactDateLabel *)self->_dateView setAdjustsFontSizeToFitWidth:1];
      [(_UIDatePickerCompactDateLabel *)self->_dateView setMinimumScaleFactor:0.8];
      [(_UIDatePickerIOSCompactView *)self _updateDateViewTextAlignment];
      v200 = [(UIView *)self->_dateView topAnchor];
      v194 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
      v190 = [v200 constraintEqualToAnchor:v194];
      v214[0] = v190;
      v186 = [(UIView *)self->_dateView bottomAnchor];
      v180 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
      uint64_t v9 = [v186 constraintEqualToAnchor:v180];
      v214[1] = v9;
      uint64_t v10 = [(UIView *)self->_dateView leadingAnchor];
      uint64_t v11 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
      [v10 constraintEqualToAnchor:v11];
      v13 = uint64_t v12 = (void *)v3;
      v214[2] = v13;
      uint64_t v14 = [(UIView *)self->_dateView trailingAnchor];
      v15 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
      v16 = [v14 constraintEqualToAnchor:v15];
      v214[3] = v16;
      char v17 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v18 = v214;
      goto LABEL_11;
    case 2:
      p_dateView = &self->_dateView;
      [(UIView *)self addSubview:self->_dateView];
      p_timeView = &self->_timeView;
      [(UIView *)self addSubview:self->_timeView];
      [(_UIDatePickerCompactDateLabel *)self->_dateView setAdjustsFontSizeToFitWidth:0];
      [(_UIDatePickerCompactDateLabel *)self->_dateView setMinimumScaleFactor:0.0];
      [(_UIDatePickerCompactTimeLabel *)self->_timeView setAdjustsFontSizeToFitWidth:0];
      [(_UIDatePickerCompactTimeLabel *)self->_timeView setMinimumScaleFactor:0.0];
      [(_UIDatePickerIOSCompactView *)self _updateDateViewTextAlignment];
      long long v22 = [(UIView *)self traitCollection];
      long long v23 = [v22 preferredContentSizeCategory];
      BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v23);

      if (IsAccessibilityCategory)
      {
        switch([(UIControl *)self contentHorizontalAlignment])
        {
          case UIControlContentHorizontalAlignmentCenter:
          case UIControlContentHorizontalAlignmentFill:
            v157 = [(UIView *)*p_dateView centerXAnchor];
            uint64_t v154 = [(UILayoutGuide *)self->_contentLayoutGuide centerXAnchor];
            v191 = [v157 constraintEqualToAnchor:v154];
            v223[0] = v191;
            long long v25 = [(UIView *)*p_timeView centerXAnchor];
            v181 = [(UILayoutGuide *)self->_contentLayoutGuide centerXAnchor];
            v187 = v25;
            v175 = [v25 constraintEqualToAnchor:v181];
            v223[1] = v175;
            v26 = [(UIView *)*p_dateView leadingAnchor];
            v168 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
            v172 = v26;
            v164 = [v26 constraintGreaterThanOrEqualToAnchor:v168];
            v223[2] = v164;
            uint64_t v27 = [(UIView *)*p_dateView trailingAnchor];
            uint64_t v28 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
            v160 = v27;
            v29 = [v27 constraintLessThanOrEqualToAnchor:v28];
            v223[3] = v29;
            v30 = [(UIView *)*p_timeView leadingAnchor];
            v31 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
            v32 = [v30 constraintGreaterThanOrEqualToAnchor:v31];
            v223[4] = v32;
            v33 = [(UIView *)*p_timeView trailingAnchor];
            v34 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
            v35 = [v33 constraintLessThanOrEqualToAnchor:v34];
            v223[5] = v35;
            v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v223 count:6];
            [v204 addObjectsFromArray:v36];

            v37 = (void *)v28;
            v38 = (void *)v154;

            p_timeView = &self->_timeView;
            v39 = v157;

            p_dateView = &self->_dateView;
            goto LABEL_37;
          case UIControlContentHorizontalAlignmentLeft:
            v117 = [(UIView *)*p_dateView rightAnchor];
            v118 = [(UILayoutGuide *)self->_contentLayoutGuide rightAnchor];
            v39 = [v117 constraintEqualToAnchor:v118];

            LODWORD(v119) = 1132003328;
            [v39 setPriority:v119];
            v38 = [(UIView *)*p_dateView leftAnchor];
            v191 = [(UILayoutGuide *)self->_contentLayoutGuide leftAnchor];
            v187 = objc_msgSend(v38, "constraintEqualToAnchor:");
            v222[0] = v187;
            v120 = [(UIView *)*p_dateView rightAnchor];
            [(UILayoutGuide *)self->_contentLayoutGuide rightAnchor];
            v175 = v181 = v120;
            v172 = objc_msgSend(v120, "constraintLessThanOrEqualToAnchor:");
            v222[1] = v172;
            v121 = [(UIView *)*p_timeView leftAnchor];
            v164 = [(UILayoutGuide *)self->_contentLayoutGuide leftAnchor];
            v168 = v121;
            v160 = [v121 constraintEqualToAnchor:v164];
            v222[2] = v160;
            v37 = [(UIView *)*p_timeView rightAnchor];
            v29 = [(UILayoutGuide *)self->_contentLayoutGuide rightAnchor];
            v30 = [v37 constraintLessThanOrEqualToAnchor:v29];
            v222[3] = v30;
            v122 = (void *)MEMORY[0x1E4F1C978];
            v123 = v222;
            goto LABEL_32;
          case UIControlContentHorizontalAlignmentRight:
            v124 = [(UIView *)*p_dateView leftAnchor];
            v125 = [(UILayoutGuide *)self->_contentLayoutGuide leftAnchor];
            v39 = [v124 constraintEqualToAnchor:v125];

            LODWORD(v126) = 1132003328;
            [v39 setPriority:v126];
            v38 = [(UIView *)*p_dateView leftAnchor];
            v191 = [(UILayoutGuide *)self->_contentLayoutGuide leftAnchor];
            v187 = objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:");
            v221[0] = v187;
            v127 = [(UIView *)*p_dateView rightAnchor];
            [(UILayoutGuide *)self->_contentLayoutGuide rightAnchor];
            v175 = v181 = v127;
            v172 = objc_msgSend(v127, "constraintEqualToAnchor:");
            v221[1] = v172;
            v128 = [(UIView *)*p_timeView leftAnchor];
            v164 = [(UILayoutGuide *)self->_contentLayoutGuide leftAnchor];
            v168 = v128;
            v160 = [v128 constraintGreaterThanOrEqualToAnchor:v164];
            v221[2] = v160;
            v37 = [(UIView *)*p_timeView rightAnchor];
            v29 = [(UILayoutGuide *)self->_contentLayoutGuide rightAnchor];
            v30 = [v37 constraintEqualToAnchor:v29];
            v221[3] = v30;
            v122 = (void *)MEMORY[0x1E4F1C978];
            v123 = v221;
LABEL_32:
            uint64_t v129 = 4;
            goto LABEL_36;
          case UIControlContentHorizontalAlignmentLeading:
            v130 = [(UIView *)*p_dateView trailingAnchor];
            v131 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
            v39 = [v130 constraintEqualToAnchor:v131];

            LODWORD(v132) = 1132003328;
            [v39 setPriority:v132];
            v38 = [(UIView *)*p_dateView leadingAnchor];
            v191 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
            v187 = objc_msgSend(v38, "constraintEqualToAnchor:");
            v220[0] = v187;
            v133 = [(UIView *)*p_dateView trailingAnchor];
            [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
            v175 = v181 = v133;
            v172 = objc_msgSend(v133, "constraintLessThanOrEqualToAnchor:");
            v220[1] = v172;
            v220[2] = v39;
            v134 = [(UIView *)*p_timeView leadingAnchor];
            v164 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
            v168 = v134;
            v160 = [v134 constraintEqualToAnchor:v164];
            v220[3] = v160;
            v37 = [(UIView *)*p_timeView trailingAnchor];
            v29 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
            v30 = [v37 constraintLessThanOrEqualToAnchor:v29];
            v220[4] = v30;
            v122 = (void *)MEMORY[0x1E4F1C978];
            v123 = v220;
            goto LABEL_35;
          case UIControlContentHorizontalAlignmentTrailing:
            v135 = [(UIView *)*p_timeView leadingAnchor];
            v136 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
            v39 = [v135 constraintEqualToAnchor:v136];

            LODWORD(v137) = 1132003328;
            [v39 setPriority:v137];
            v38 = [(UIView *)*p_dateView leadingAnchor];
            v191 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
            v187 = objc_msgSend(v38, "constraintGreaterThanOrEqualToAnchor:");
            v219[0] = v187;
            v138 = [(UIView *)*p_dateView trailingAnchor];
            [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
            v175 = v181 = v138;
            v172 = objc_msgSend(v138, "constraintEqualToAnchor:");
            v219[1] = v172;
            v219[2] = v39;
            v139 = [(UIView *)*p_timeView leadingAnchor];
            v164 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
            v168 = v139;
            v160 = [v139 constraintGreaterThanOrEqualToAnchor:v164];
            v219[3] = v160;
            v37 = [(UIView *)*p_timeView trailingAnchor];
            v29 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
            v30 = [v37 constraintEqualToAnchor:v29];
            v219[4] = v30;
            v122 = (void *)MEMORY[0x1E4F1C978];
            v123 = v219;
LABEL_35:
            uint64_t v129 = 5;
LABEL_36:
            v31 = [v122 arrayWithObjects:v123 count:v129];
            [v204 addObjectsFromArray:v31];
LABEL_37:

            break;
          default:
            break;
        }
        if (self->_dateOnLeadingSide) {
          v140 = (void **)p_dateView;
        }
        else {
          v140 = (void **)p_timeView;
        }
        v141 = *v140;
        if (self->_dateOnLeadingSide) {
          v142 = (id *)p_timeView;
        }
        else {
          v142 = (id *)p_dateView;
        }
        id v143 = *v142;
        id v144 = v141;
        v203 = [v144 topAnchor];
        v199 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
        v193 = [v203 constraintEqualToAnchor:v199];
        v218[0] = v193;
        v145 = [v143 topAnchor];
        v146 = [v144 bottomAnchor];
        v147 = [v145 constraintEqualToAnchor:v146 constant:v7];
        v218[1] = v147;
        v148 = [v143 bottomAnchor];
        v149 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
        v150 = [v148 constraintEqualToAnchor:v149];
        v218[2] = v150;
        v151 = [MEMORY[0x1E4F1C978] arrayWithObjects:v218 count:3];
        [v204 addObjectsFromArray:v151];

        id v8 = &OBJC_IVAR____UITileLayer_pendingDeferredOffscreenSetNeedsDisplay;
      }
      else
      {
        v189 = [(UIView *)*p_dateView topAnchor];
        v183 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
        v177 = [v189 constraintEqualToAnchor:v183];
        v224[0] = v177;
        v173 = [(UIView *)*p_dateView bottomAnchor];
        v169 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
        v165 = [v173 constraintEqualToAnchor:v169];
        v224[1] = v165;
        v161 = [(UIView *)*p_timeView topAnchor];
        v74 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
        [v161 constraintEqualToAnchor:v74];
        v75 = v202 = &self->_timeView;
        v224[2] = v75;
        v76 = [(UIView *)self->_timeView bottomAnchor];
        v77 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
        v78 = [v76 constraintEqualToAnchor:v77];
        v224[3] = v78;
        v196 = &self->_dateView;
        v79 = [(UIView *)self->_dateView heightAnchor];
        v80 = [(UIView *)self->_timeView heightAnchor];
        v81 = [v79 constraintEqualToAnchor:v80];
        v224[4] = v81;
        v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:v224 count:5];
        [v204 addObjectsFromArray:v82];

        v184 = [(UILayoutGuide *)self->_timeViewLayoutGuide widthAnchor];
        v83 = [(UIView *)self->_timeView widthAnchor];
        v84 = [v184 constraintEqualToAnchor:v83];
        v217[0] = v84;
        v85 = [(UILayoutGuide *)self->_timeViewLayoutGuide topAnchor];
        v86 = [(UIView *)self->_timeView topAnchor];
        v87 = [v85 constraintEqualToAnchor:v86];
        v217[1] = v87;
        v88 = [(UILayoutGuide *)self->_timeViewLayoutGuide bottomAnchor];
        v89 = [(UIView *)self->_timeView bottomAnchor];
        v90 = [v88 constraintEqualToAnchor:v89];
        v217[2] = v90;
        v91 = [MEMORY[0x1E4F1C978] arrayWithObjects:v217 count:3];
        [v204 addObjectsFromArray:v91];

        timeView = self->_timeView;
        if (self->_dateOnLeadingSide)
        {
          v93 = [(UIView *)timeView trailingAnchor];
          v94 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
          v155 = [v93 constraintEqualToAnchor:v94];

          LODWORD(v95) = 1132003328;
          [v155 setPriority:v95];
          v185 = [(UILayoutGuide *)self->_timeViewLayoutGuide leadingAnchor];
          v178 = [(UIView *)*v196 trailingAnchor];
          v174 = [v185 constraintEqualToAnchor:v178 constant:v7];
          v216[0] = v174;
          v166 = [(UIView *)*v202 leadingAnchor];
          v170 = [(_UIDatePickerCompactDateLabel *)*v196 backgroundView];
          v162 = [v170 trailingAnchor];
          v158 = [v166 constraintEqualToAnchor:v162 constant:v7];
          v216[1] = v158;
          v197 = [(UIView *)*v196 leadingAnchor];
          v152 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
          v96 = [v197 constraintEqualToAnchor:v152];
          v216[2] = v96;
          v97 = [(UIView *)*v202 trailingAnchor];
          v98 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
          v99 = [v97 constraintLessThanOrEqualToAnchor:v98];
          v216[3] = v99;
          v100 = [(UILayoutGuide *)self->_timeViewLayoutGuide trailingAnchor];
          v101 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
          v102 = [v100 constraintLessThanOrEqualToAnchor:v101];
          v103 = v155;
          v216[4] = v102;
          v216[5] = v155;
          v104 = [MEMORY[0x1E4F1C978] arrayWithObjects:v216 count:6];
          [v204 addObjectsFromArray:v104];

          v105 = v166;
        }
        else
        {
          v106 = [(UIView *)timeView leadingAnchor];
          v107 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
          v156 = [v106 constraintEqualToAnchor:v107];

          LODWORD(v108) = 1132003328;
          [v156 setPriority:v108];
          v185 = [(UIView *)*v196 leadingAnchor];
          v178 = [(UILayoutGuide *)self->_timeViewLayoutGuide trailingAnchor];
          v174 = [v185 constraintEqualToAnchor:v178 constant:v7];
          v215[0] = v174;
          v171 = [(_UIDatePickerCompactDateLabel *)*v196 backgroundView];
          v167 = [v171 leadingAnchor];
          v163 = [(UIView *)*v202 trailingAnchor];
          v159 = [v167 constraintEqualToAnchor:v163 constant:v7];
          v215[1] = v159;
          v198 = [(UIView *)*v196 trailingAnchor];
          v153 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
          v109 = [v198 constraintEqualToAnchor:v153];
          v215[2] = v109;
          v110 = [(UIView *)*v202 leadingAnchor];
          v111 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
          v112 = [v110 constraintGreaterThanOrEqualToAnchor:v111];
          v215[3] = v112;
          v113 = [(UILayoutGuide *)self->_timeViewLayoutGuide leadingAnchor];
          v114 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
          v115 = [v113 constraintGreaterThanOrEqualToAnchor:v114];
          v103 = v156;
          v215[4] = v115;
          v215[5] = v156;
          v116 = [MEMORY[0x1E4F1C978] arrayWithObjects:v215 count:6];
          [v204 addObjectsFromArray:v116];

          v105 = v171;
        }

        id v8 = &OBJC_IVAR____UITileLayer_pendingDeferredOffscreenSetNeedsDisplay;
      }
      break;
    case 3:
      [(UIView *)self->_dateView removeFromSuperview];
      [(UIView *)self addSubview:self->_timeView];
      [(_UIDatePickerCompactTimeLabel *)self->_timeView setAdjustsFontSizeToFitWidth:1];
      [(_UIDatePickerCompactTimeLabel *)self->_timeView setMinimumScaleFactor:0.8];
      v200 = [(UIView *)self->_timeView topAnchor];
      v194 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
      v190 = [v200 constraintEqualToAnchor:v194];
      v212[0] = v190;
      v186 = [(UIView *)self->_timeView bottomAnchor];
      v180 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
      uint64_t v9 = [v186 constraintEqualToAnchor:v180];
      v212[1] = v9;
      uint64_t v10 = [(UIView *)self->_timeView leadingAnchor];
      uint64_t v11 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
      [v10 constraintEqualToAnchor:v11];
      v13 = uint64_t v12 = (void *)v3;
      v212[2] = v13;
      uint64_t v14 = [(UIView *)self->_timeView trailingAnchor];
      v15 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
      v16 = [v14 constraintEqualToAnchor:v15];
      v212[3] = v16;
      char v17 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v18 = v212;
LABEL_11:
      v40 = [v17 arrayWithObjects:v18 count:4];
      [v12 addObjectsFromArray:v40];

      id v8 = &OBJC_IVAR____UITileLayer_pendingDeferredOffscreenSetNeedsDisplay;
      break;
    default:
      dateTimeConstraints = self->_dateTimeConstraints;
      self->_dateTimeConstraints = 0;

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unsupported mode for date picker style UIDatePickerStyleCompact."];
      break;
  }
  BOOL v41 = [(_UIDatePickerIOSCompactView *)self alignConstraintsToLayoutGuide];
  BOOL v42 = v41;
  [(_UIDatePickerOverlayPresentation *)self->_presentation setOverlayAnchor:v41];
  if (v42)
  {
    v43 = [(UIView *)self layoutMarginsGuide];
    v192 = [v43 leadingAnchor];

    v44 = [(UIView *)self layoutMarginsGuide];
    v188 = [v44 trailingAnchor];

    v45 = [(UIView *)self layoutMarginsGuide];
    v201 = [v45 leftAnchor];

    v46 = [(UIView *)self layoutMarginsGuide];
    v195 = [v46 rightAnchor];

    v47 = [(UIView *)self layoutMarginsGuide];
    v48 = [v47 topAnchor];

    v49 = [(UIView *)self layoutMarginsGuide];
    v182 = [v49 centerXAnchor];

    v50 = [(UIView *)self layoutMarginsGuide];
    uint64_t v51 = [v50 centerYAnchor];
  }
  else
  {
    v192 = [(UIView *)self leadingAnchor];
    v188 = [(UIView *)self trailingAnchor];
    v201 = [(UIView *)self leftAnchor];
    v195 = [(UIView *)self rightAnchor];
    v48 = [(UIView *)self topAnchor];
    v182 = [(UIView *)self centerXAnchor];
    uint64_t v51 = [(UIView *)self centerYAnchor];
  }
  v52 = v204;
  uint64_t v53 = v8[282];
  v54 = [*(id *)((char *)&self->super.super.super.super.isa + v53) topAnchor];
  v55 = [v54 constraintEqualToAnchor:v48];

  LODWORD(v56) = 1132003328;
  [v55 setPriority:v56];
  v57 = [*(id *)((char *)&self->super.super.super.super.isa + v53) centerYAnchor];
  v176 = (void *)v51;
  v58 = [v57 constraintEqualToAnchor:v51];
  v211[0] = v58;
  v59 = [*(id *)((char *)&self->super.super.super.super.isa + v53) topAnchor];
  v60 = [v59 constraintGreaterThanOrEqualToAnchor:v48];
  v211[1] = v60;
  v211[2] = v55;
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v211 count:3];
  [v204 addObjectsFromArray:v61];

  switch([(UIControl *)self effectiveContentHorizontalAlignment])
  {
    case UIControlContentHorizontalAlignmentCenter:
    case UIControlContentHorizontalAlignmentFill:
      v62 = [*(id *)((char *)&self->super.super.super.super.isa + v53) leftAnchor];
      v63 = [v62 constraintGreaterThanOrEqualToAnchor:v201];
      v210[0] = v63;
      v64 = [*(id *)((char *)&self->super.super.super.super.isa + v53) rightAnchor];
      v65 = [v64 constraintLessThanOrEqualToAnchor:v195];
      v210[1] = v65;
      v66 = [*(id *)((char *)&self->super.super.super.super.isa + v53) centerXAnchor];
      v67 = [v66 constraintEqualToAnchor:v182];
      v210[2] = v67;
      v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v210 count:3];
      v69 = [v204 arrayByAddingObjectsFromArray:v68];
      v70 = self->_dateTimeConstraints;
      self->_dateTimeConstraints = v69;

      v52 = v204;
      goto LABEL_22;
    case UIControlContentHorizontalAlignmentLeft:
      v62 = [*(id *)((char *)&self->super.super.super.super.isa + v53) leftAnchor];
      v63 = [v62 constraintEqualToAnchor:v201];
      v209[0] = v63;
      v64 = [*(id *)((char *)&self->super.super.super.super.isa + v53) rightAnchor];
      v65 = [v64 constraintLessThanOrEqualToAnchor:v195];
      v209[1] = v65;
      v71 = (void *)MEMORY[0x1E4F1C978];
      v72 = v209;
      goto LABEL_21;
    case UIControlContentHorizontalAlignmentRight:
      v62 = [*(id *)((char *)&self->super.super.super.super.isa + v53) leftAnchor];
      v63 = [v62 constraintGreaterThanOrEqualToAnchor:v201];
      v208[0] = v63;
      v64 = [*(id *)((char *)&self->super.super.super.super.isa + v53) rightAnchor];
      v65 = [v64 constraintEqualToAnchor:v195];
      v208[1] = v65;
      v71 = (void *)MEMORY[0x1E4F1C978];
      v72 = v208;
      goto LABEL_21;
    case UIControlContentHorizontalAlignmentLeading:
      v62 = [*(id *)((char *)&self->super.super.super.super.isa + v53) leadingAnchor];
      v63 = [v62 constraintEqualToAnchor:v192];
      v207[0] = v63;
      v64 = [*(id *)((char *)&self->super.super.super.super.isa + v53) trailingAnchor];
      v65 = [v64 constraintLessThanOrEqualToAnchor:v188];
      v207[1] = v65;
      v71 = (void *)MEMORY[0x1E4F1C978];
      v72 = v207;
      goto LABEL_21;
    case UIControlContentHorizontalAlignmentTrailing:
      v62 = [*(id *)((char *)&self->super.super.super.super.isa + v53) leadingAnchor];
      v63 = [v62 constraintGreaterThanOrEqualToAnchor:v192];
      v206[0] = v63;
      v64 = [*(id *)((char *)&self->super.super.super.super.isa + v53) trailingAnchor];
      v65 = [v64 constraintEqualToAnchor:v188];
      v206[1] = v65;
      v71 = (void *)MEMORY[0x1E4F1C978];
      v72 = v206;
LABEL_21:
      v66 = [v71 arrayWithObjects:v72 count:2];
      v73 = [v204 arrayByAddingObjectsFromArray:v66];
      v67 = self->_dateTimeConstraints;
      self->_dateTimeConstraints = v73;
LABEL_22:

      break;
    default:
      break;
  }
  if (self->_dateTimeConstraints) {
    objc_msgSend(MEMORY[0x1E4F5B268], "activateConstraints:");
  }
}

- (void)_didReceivePanGestureRecognizer:(id)a3
{
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return self->_panGestureRecognizer != a3 || self->_activeComponent != 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return self->_panGestureRecognizer == a3;
}

- (void)compactTimeLabel:(id)a3 didSelectTime:(id)a4
{
  id v23 = a4;
  objc_super v5 = [_UIDatePickerCalendarDay alloc];
  double v6 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  double v7 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  id v8 = [(_UIDatePickerCalendarDay *)v5 initWithDate:v6 calendar:v7];

  long long v22 = v8;
  uint64_t v9 = [(_UIDatePickerCalendarDateComponent *)v8 components];
  uint64_t v10 = [v23 components];
  id v11 = v9;
  uint64_t v12 = objc_opt_new();
  for (uint64_t i = 1; i != 64; ++i)
  {
    uint64_t v14 = [v11 valueForComponent:1 << i];
    uint64_t v15 = [v10 valueForComponent:1 << i];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL && v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v21 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v20 = objc_msgSend(NSString, "stringWithUTF8String:", "NSDateComponents * _Nonnull _UIDatePickerCombinedDateComponents(NSDateComponents * _Nonnull __strong, NSDateComponents * _Nonnull __strong)");
      [v21 handleFailureInFunction:v20, @"_UIDatePickerCalendarDateComponent.h", 68, @"Error combining %@ and %@. Both components contain values for NSCalendarUnit %lu", v11, v10, 1 << i file lineNumber description];

LABEL_9:
      [v12 setValue:v14 forComponent:1 << i];
      continue;
    }
    if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_9;
    }
    uint64_t v14 = v15;
    if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_9;
    }
  }

  char v17 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  [v12 setCalendar:v17];

  uint64_t v18 = [v12 date];
  [(_UIDatePickerDataModel *)self->_data setDate:v18];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  [WeakRetained _emitValueChanged];
}

- (void)compactTimeLabelDidBeginEditing:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  [WeakRetained _emitBeginEditing];
}

- (void)compactTimeLabelDidEndEditing:(id)a3
{
  timeView = self->_timeView;
  objc_super v5 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  [(_UIDatePickerCompactTimeLabel *)timeView reloadWithDate:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  [WeakRetained _emitEndEditing];
}

- (void)compactTimeLabelWillBecomeFirstResponder:(id)a3
{
  if ([(_UIDatePickerOverlayPresentation *)self->_presentation activeMode] == 2)
  {
    presentation = self->_presentation;
    [(_UIDatePickerOverlayPresentation *)presentation dismissPresentationAnimated:1];
  }
}

- (BOOL)compactTimeLabel:(id)a3 shouldDismissForInteractionAtLocation:(CGPoint)a4
{
  objc_msgSend(a3, "convertPoint:toView:", self, a4.x, a4.y);
  objc_super v5 = -[UIControl hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
    id v8 = [WeakRetained _compactStyleDelegate];
    BOOL v6 = v8 == 0;
  }
  return v6;
}

- (void)compactDateLabelDidBeginEditing:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  [WeakRetained _emitBeginEditing];
}

- (void)compactDateLabelDidEndEditing:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  [WeakRetained _emitEndEditing];
}

- (id)createDatePickerForCompactTimeLabel:(id)a3
{
  uint64_t v4 = [(_UIDatePickerIOSCompactView *)self data];
  objc_super v5 = [v4 createDatePickerRepresentingDataModelForMode:0 style:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  double v7 = [WeakRetained tintColor];
  [v5 setTintColor:v7];

  return v5;
}

- (id)createDatePickerForCompactDateLabel:(id)a3
{
  uint64_t v4 = [(_UIDatePickerIOSCompactView *)self data];
  objc_super v5 = [v4 createDatePickerRepresentingDataModelForMode:1 style:3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  double v7 = [WeakRetained tintColor];
  [v5 setTintColor:v7];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67___UIDatePickerIOSCompactView_createDatePickerForCompactDateLabel___block_invoke;
  v10[3] = &unk_1E52DB038;
  v10[4] = self;
  id v8 = +[UIAction actionWithHandler:v10];
  [v5 addAction:v8 forControlEvents:0x2000];

  return v5;
}

- (void)didChangeCompactStyleDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  id v6 = [WeakRetained _compactStyleDelegate];

  if (v6)
  {
    if (objc_opt_respondsToSelector()) {
      char v4 = 2;
    }
    else {
      char v4 = 0;
    }
    char v5 = *(unsigned char *)&self->_flags & 0xFD | v4;
  }
  else
  {
    char v5 = *(unsigned char *)&self->_flags & 0xFD;
  }
  *(unsigned char *)&self->_flags = v5;
  [(_UIDatePickerIOSCompactView *)self _updateUI];
}

- (void)_datePickerPresentation:(id)a3 didChangeActiveMode:(int64_t)a4
{
  if (a4 == 1) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = a4 == 2;
  }
  if (v4 != self->_activeComponent)
  {
    self->_activeComponent = v4;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      p_datePicker = &self->_datePicker;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
      id v6 = [WeakRetained _compactStyleDelegate];
      id v7 = objc_loadWeakRetained((id *)p_datePicker);
      [v6 _datePicker:v7 didSelectComponent:v4];
    }
  }
}

- (void)setActiveComponent:(int64_t)a3
{
  if (self->_activeComponent != a3)
  {
    self->_activeComponent = a3;
    if (a3 == 2)
    {
      uint64_t v3 = 568;
    }
    else
    {
      if (a3 != 1)
      {
        if (!a3) {
          [(_UIDatePickerIOSCompactView *)self _resignActiveComponentAnimated:1];
        }
        return;
      }
      uint64_t v3 = 560;
    }
    [*(id *)((char *)&self->super.super.super.super.isa + v3) activateLabel];
  }
}

- (void)_resignActiveComponentAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  self->_activeComponent = 0;
  if ([(_UIDatePickerOverlayPresentation *)self->_presentation activeMode])
  {
    presentation = self->_presentation;
    [(_UIDatePickerOverlayPresentation *)presentation dismissPresentationAnimated:v3];
  }
}

- (NSDictionary)overrideAttributes
{
  return [(_UIDatePickerCompactDateLabel *)self->_dateView overrideAttributes];
}

- (void)setOverrideAttributes:(id)a3
{
  dateView = self->_dateView;
  id v5 = a3;
  [(_UIDatePickerCompactDateLabel *)dateView setOverrideAttributes:v5];
  [(_UIDatePickerCompactTimeLabel *)self->_timeView setOverrideAttributes:v5];
}

- (void)_reloadTimeViewTimeFormat
{
  [(_UIDatePickerCalendarTimeLabel *)self->_timeView setMinuteInterval:[(_UIDatePickerDataModel *)self->_data minuteInterval]];
  [(_UIDatePickerCalendarTimeLabel *)self->_timeView setRoundsToMinuteInterval:[(_UIDatePickerDataModel *)self->_data roundsToMinuteInterval]];
  timeView = self->_timeView;
  id v7 = [(_UIDatePickerDataModel *)self->_data effectiveCalendar];
  int64_t v4 = [(_UIDatePickerDataModel *)self->_data effectiveLocale];
  BOOL v5 = [(_UIDatePickerDataModel *)self->_data followsSystemHourCycle];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  -[_UIDatePickerCompactTimeLabel reloadWithCalendar:locale:followsSystemHourCycle:displaysTimeZone:](timeView, "reloadWithCalendar:locale:followsSystemHourCycle:displaysTimeZone:", v7, v4, v5, [WeakRetained _displaysTimeZone]);
}

- (void)setData:(id)a3
{
  BOOL v5 = (_UIDatePickerDataModel *)a3;
  if (self->_data != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_data, a3);
    if ([(_UIDatePickerIOSCompactView *)self datePickerStyle] == 2)
    {
      if (dyld_program_sdk_at_least()) {
        uint64_t v6 = 5;
      }
      else {
        uint64_t v6 = 4;
      }
    }
    else
    {
      uint64_t v6 = 5;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
    [WeakRetained setContentHorizontalAlignment:v6];

    [(_UIDatePickerIOSCompactView *)self didChangeMinuteInterval];
    [(_UIDatePickerIOSCompactView *)self didChangeRoundsToMinuteInterval];
    [(_UIDatePickerIOSCompactView *)self didChangeCompactStyleDelegate];
    [(_UIDatePickerIOSCompactView *)self _updateUI];
    BOOL v5 = v8;
  }
}

- (int64_t)datePickerStyle
{
  return 2;
}

- (void)didChangeMode
{
  [(_UIDatePickerIOSCompactView *)self _updateUI];
  [(UIView *)self setNeedsUpdateConstraints];
  [(_UIDatePickerIOSCompactView *)self _resignActiveComponentAnimated:1];
}

- (void)didChangeLocale
{
  [(_UIDatePickerIOSCompactView *)self _updateUI];
  [(_UIDatePickerIOSCompactView *)self _updateDateBeforeTimeValue];
  id v4 = [(_UIDatePickerDataModel *)self->_data locale];
  BOOL v3 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v3 setLocale:v4];
}

- (void)didChangeTimeZone
{
  [(_UIDatePickerIOSCompactView *)self _updateUI];
  [(_UIDatePickerIOSCompactView *)self _updateDateBeforeTimeValue];
  id v4 = [(_UIDatePickerDataModel *)self->_data timeZone];
  BOOL v3 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v3 setTimeZone:v4];
}

- (void)didChangeCalendar
{
  [(_UIDatePickerIOSCompactView *)self _updateUI];
  [(_UIDatePickerIOSCompactView *)self _updateDateBeforeTimeValue];
  id v4 = [(_UIDatePickerDataModel *)self->_data calendar];
  BOOL v3 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v3 setCalendar:v4];
}

- (void)didChangeDateFrom:(id)a3 animated:(BOOL)a4
{
  BOOL v5 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  uint64_t v6 = [(_UIDatePickerIOSCompactView *)self timeView];
  id v7 = [v6 timeFormat];
  [v7 setTimeZoneReferenceDate:v5];

  [(_UIDatePickerIOSCompactView *)self _updateUI];
  id v9 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  id v8 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v8 setDate:v9];
}

- (void)displaySelectedDateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  BOOL v5 = [(_UIDatePickerDataModel *)self->_data effectiveDate];
  [v6 setDate:v5 animated:v3];
}

- (void)didChangeMinimumDate
{
  id v4 = [(_UIDatePickerDataModel *)self->_data minimumDate];
  BOOL v3 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v3 setMinimumDate:v4];
}

- (void)didChangeMaximumDate
{
  id v4 = [(_UIDatePickerDataModel *)self->_data maximumDate];
  BOOL v3 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v3 setMaximumDate:v4];
}

- (void)didChangeMinuteInterval
{
  int64_t v3 = [(_UIDatePickerDataModel *)self->_data minuteInterval];
  id v4 = [(_UIDatePickerIOSCompactView *)self timeView];
  [v4 setMinuteInterval:v3];

  int64_t v5 = [(_UIDatePickerDataModel *)self->_data minuteInterval];
  id v6 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v6 setMinuteInterval:v5];
}

- (void)didChangeRoundsToMinuteInterval
{
  BOOL v3 = [(_UIDatePickerDataModel *)self->_data roundsToMinuteInterval];
  id v4 = [(_UIDatePickerIOSCompactView *)self timeView];
  [v4 setRoundsToMinuteInterval:v3];

  BOOL v5 = [(_UIDatePickerDataModel *)self->_data roundsToMinuteInterval];
  id v6 = [(_UIDatePickerOverlayPresentation *)self->_presentation activeDatePicker];
  [v6 setRoundsToMinuteInterval:v5];
}

- (void)didReset
{
  [(_UIDatePickerIOSCompactView *)self _updateUI];
  [(_UIDatePickerIOSCompactView *)self _updateDateBeforeTimeValue];
}

- (UIEdgeInsets)appliedInsetsToEdgeOfContent
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return 0;
}

- (BOOL)usesAutoLayout
{
  return 1;
}

- (void)_setEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
  [(_UIDatePickerIOSCompactView *)self _updateEnabledStyling];
}

- (CGSize)_sizeThatFits:(CGSize)a3
{
  double v3 = *MEMORY[0x1E4F1DB30];
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)defaultSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)hasDefaultSize
{
  return 0;
}

- (UIDatePicker)datePicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_datePicker);
  return (UIDatePicker *)WeakRetained;
}

- (void)setDatePicker:(id)a3
{
}

- (_UIDatePickerDataModel)data
{
  return self->_data;
}

- (_UIDatePickerCompactDateLabel)dateView
{
  return self->_dateView;
}

- (_UIDatePickerCompactTimeLabel)timeView
{
  return self->_timeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeView, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_destroyWeak((id *)&self->_datePicker);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_dateTimeConstraints, 0);
  objc_storeStrong((id *)&self->_layoutFormatter, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_timeViewLayoutGuide, 0);
  objc_storeStrong((id *)&self->_dateFormatterShort, 0);
  objc_storeStrong((id *)&self->_dateFormatterMedium, 0);
}

@end