@interface _UIDatePickerCompactTimeLabel
- (BOOL)adjustsFontSizeToFitWidth;
- (BOOL)isEnabled;
- (BOOL)isPassthroughInteractionEnabled;
- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (BOOL)tapInteractionControlledExternally;
- (BOOL)timeLabel:(id)a3 didReceiveText:(id)a4;
- (BOOL)timeLabelCanBecomeFirstResponder:(id)a3;
- (BOOL)timeLabelShouldSuppressSoftwareKeyboard:(id)a3;
- (CGRect)hourRect;
- (CGRect)minuteRect;
- (CGRect)timeOfDayRect;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDictionary)overrideAttributes;
- (UIButton)backgroundView;
- (UILabel)hourLabel;
- (UILabel)label;
- (UILabel)minuteLabel;
- (UILabel)timeOfDayLabel;
- (UIPointerInteraction)pointerInteraction;
- (UIView)inputBackgroundView;
- (_UIDatePickerCalendarTime)selectedTime;
- (_UIDatePickerCompactTimeLabel)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4;
- (_UIDatePickerCompactTimeLabelDelegate)selectionDelegate;
- (_UIDatePickerOverlayPresentation)overlayPresentation;
- (_UIPassthroughScrollInteraction)passthroughInteraction;
- (double)minimumScaleFactor;
- (id)_currentDateForInput;
- (id)_viewForInputScope:(int64_t)a3;
- (id)font;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (id)updateHoverLabelForAttributedString:(id)a3 ranges:(id *)a4;
- (int64_t)_inputScopeForPointerLocation:(CGPoint)a3;
- (int64_t)keyboardTypeForTimeLabel:(id)a3;
- (unint64_t)currentState;
- (void)_activateCompactLabelForGestureRecognizer:(id)a3;
- (void)_expandedComponentRectForHours:(CGRect *)a3 minuteRect:(CGRect *)a4 timeOfDayRect:(CGRect *)a5;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_reloadWithDate:(id)a3 notify:(BOOL)a4;
- (void)_updateEnabledStyling;
- (void)_updateHoverStateLabelsIfNeeded;
- (void)_updateInputFieldFromSelectedDateComponents;
- (void)_updateInputFieldLayoutForCurrentState;
- (void)_updateLayoutRectsForRanges:(id *)a3;
- (void)_updateSelectedDateComponentsFromInput;
- (void)_updateTextContentStorage;
- (void)_updateTimeFormatIfNeeded;
- (void)activateLabel;
- (void)applyTextAttributesForState:(unint64_t)a3 inputScope:(int64_t)a4 updater:(id)a5;
- (void)controlEventsGestureRecognizer:(id)a3 recognizedControlEvent:(unint64_t)a4 withEvent:(id)a5;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)pushCurrentStateIntoUI;
- (void)pushCurrentStateIntoUIAndNotify;
- (void)reloadWithCalendar:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5 displaysTimeZone:(BOOL)a6;
- (void)reloadWithDate:(id)a3;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setHighlightedForTouch:(BOOL)a3;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setOverlayPresentation:(id)a3;
- (void)setOverrideAttributes:(id)a3;
- (void)setPassthroughInteractionEnabled:(BOOL)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)setTapInteractionControlledExternally:(BOOL)a3;
- (void)stateMachineUpdateFromState:(unint64_t)a3 toState:(unint64_t)a4;
- (void)timeLabelDidBecomeFirstResponder:(id)a3;
- (void)timeLabelDidBeginEditing:(id)a3;
- (void)timeLabelDidEndEditing:(id)a3;
- (void)timeLabelDidFailToBecomeFirstResponder:(id)a3;
- (void)timeLabelDidResignFirstResponder:(id)a3;
- (void)timeLabelWillBecomeFirstResponder:(id)a3;
- (void)willBeginWritingInScribbleInteraction;
@end

@implementation _UIDatePickerCompactTimeLabel

- (_UIDatePickerCompactTimeLabel)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4
{
  v82[8] = *MEMORY[0x1E4F143B8];
  v81.receiver = self;
  v81.super_class = (Class)_UIDatePickerCompactTimeLabel;
  v4 = [(_UIDatePickerCalendarTimeLabel *)&v81 initWithTimeFormat:a3 minuteInterval:a4];
  v5 = v4;
  if (v4)
  {
    v4->_enabled = 1;
    v6 = objc_opt_new();
    [v6 setUserInteractionEnabled:0];
    v7 = [(UIView *)v5 traitCollection];
    v8 = _UIDatePickerFontWithMonospacedNumbers(@"UICTFontTextStyleBody", (uint64_t)v7);
    [v6 setFont:v8];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 setAdjustsFontForContentSizeCategory:1];
    v9 = +[UIColor labelColor];
    [v6 setTextColor:v9];

    LODWORD(v10) = 1148846080;
    [v6 setContentHuggingPriority:0 forAxis:v10];
    LODWORD(v11) = 1148846080;
    [v6 setContentCompressionResistancePriority:0 forAxis:v11];
    objc_storeStrong((id *)&v5->_label, v6);
    v12 = [(UIView *)v5 traitCollection];
    v80 = +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", [v12 userInterfaceIdiom]);

    [v80 compactLabelCornerRadius];
    -[UIView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
    v78 = [v80 compactLabelBackgroundButtonConfiguration];
    v13 = +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:");
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v13 setConfigurationUpdateHandler:&__block_literal_global_24_1];
    [v13 setPreferredBehavioralStyle:1];
    [(UIView *)v5 addSubview:v13];
    objc_storeStrong((id *)&v5->_backgroundView, v13);
    v14 = objc_opt_new();
    [v14 _setContinuousCornerRadius:4.0];
    [v14 setUserInteractionEnabled:0];
    objc_storeStrong((id *)&v5->_inputBackgroundView, v14);
    v76 = v14;
    [v13 addSubview:v14];
    [v13 addSubview:v6];
    v15 = objc_opt_new();
    v16 = [(UIView *)v5 traitCollection];
    v17 = _UIDatePickerFontWithMonospacedNumbers(@"UICTFontTextStyleBody", (uint64_t)v16);
    [v15 setFont:v17];

    [v15 setAdjustsFontForContentSizeCategory:1];
    [v15 setHidden:1];
    objc_storeStrong((id *)&v5->_hourLabel, v15);
    v18 = objc_opt_new();
    v19 = [(UIView *)v5 traitCollection];
    v20 = _UIDatePickerFontWithMonospacedNumbers(@"UICTFontTextStyleBody", (uint64_t)v19);
    [v18 setFont:v20];

    [v18 setAdjustsFontForContentSizeCategory:1];
    [v18 setHidden:1];
    objc_storeStrong((id *)&v5->_minuteLabel, v18);
    v21 = objc_opt_new();
    v22 = [(UIView *)v5 traitCollection];
    v23 = _UIDatePickerFontWithMonospacedNumbers(@"UICTFontTextStyleBody", (uint64_t)v22);
    [v21 setFont:v23];

    [v21 setAdjustsFontForContentSizeCategory:1];
    [v21 setHidden:1];
    objc_storeStrong((id *)&v5->_timeOfDayLabel, v21);
    v75 = v15;
    [v13 addSubview:v15];
    v74 = v18;
    [v13 addSubview:v18];
    v73 = v21;
    [v13 addSubview:v21];
    v24 = [[UIPointerInteraction alloc] initWithDelegate:v5];
    pointerInteraction = v5->_pointerInteraction;
    v5->_pointerInteraction = v24;

    [(UIView *)v5 addInteraction:v5->_pointerInteraction];
    [(_UIDatePickerCompactTimeLabel *)v5 _updateEnabledStyling];
    [v80 compactLabelBackgroundPadding];
    double v27 = v26;
    double v29 = v28;
    v63 = (void *)MEMORY[0x1E4F5B268];
    v72 = [(UIView *)v5 topAnchor];
    v71 = [v6 topAnchor];
    v70 = [v72 constraintEqualToAnchor:v71 constant:-v29];
    v82[0] = v70;
    v69 = [(UIView *)v5 leadingAnchor];
    v68 = [v6 leadingAnchor];
    v67 = [v69 constraintEqualToAnchor:v68 constant:-v27];
    v82[1] = v67;
    v66 = [(UIView *)v5 bottomAnchor];
    v65 = [v6 bottomAnchor];
    v64 = [v66 constraintEqualToAnchor:v65 constant:v29];
    v82[2] = v64;
    v62 = [(UIView *)v5 trailingAnchor];
    v79 = v6;
    v61 = [v6 trailingAnchor];
    v60 = [v62 constraintEqualToAnchor:v61 constant:v27];
    v82[3] = v60;
    v59 = [v13 leadingAnchor];
    v58 = [(UIView *)v5 leadingAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v82[4] = v57;
    v56 = [v13 trailingAnchor];
    v30 = [(UIView *)v5 trailingAnchor];
    v31 = [v56 constraintEqualToAnchor:v30];
    v82[5] = v31;
    v32 = [v13 topAnchor];
    v33 = [(UIView *)v5 topAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    v82[6] = v34;
    v77 = v13;
    v35 = [v13 bottomAnchor];
    v36 = [(UIView *)v5 bottomAnchor];
    v37 = [v35 constraintEqualToAnchor:v36];
    v82[7] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:8];
    [v63 activateConstraints:v38];

    [(_UIDatePickerCalendarTimeLabel *)v5 setDelegate:v5];
    v39 = objc_opt_new();
    [v39 setControlEventsDelegate:v5];
    [v39 setDelegate:v5];
    [(UIView *)v5 addGestureRecognizer:v39];
    uint64_t v40 = objc_opt_new();
    formatter = v5->_formatter;
    v5->_formatter = (NSDateFormatter *)v40;

    [(NSDateFormatter *)v5->_formatter setLenient:1];
    v42 = NSString;
    v43 = [(_UIDatePickerCalendarTimeLabel *)v5 timeFormat];
    v44 = [v43 hourFormat];
    v45 = [v42 stringWithFormat:@"%@~~mm", v44];

    v46 = [(_UIDatePickerCalendarTimeLabel *)v5 timeFormat];
    uint64_t v47 = [v46 clockLayout];

    if (v47)
    {
      uint64_t v48 = [v45 stringByAppendingString:@"~~a"];

      v45 = (void *)v48;
    }
    [(NSDateFormatter *)v5->_formatter setDateFormat:v45];
    id v49 = objc_alloc((Class)off_1E52D2EB8);
    v50 = objc_msgSend(v49, "initWithSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    [v50 setLineFragmentPadding:0.0];
    uint64_t v51 = objc_opt_new();
    textContentStorage = v5->_textContentStorage;
    v5->_textContentStorage = (NSTextContentStorage *)v51;

    v53 = [[_UITextKit2LayoutController alloc] initWithTextView:0 textContentStorage:v5->_textContentStorage textContainer:v50];
    textLayoutController = v5->_textLayoutController;
    v5->_textLayoutController = (_UITextLayoutController *)v53;
  }
  return v5;
}

- (CGRect)hourRect
{
  p_hourRect = &self->_hourRect;
  [(UIView *)self bounds];
  CGFloat x = p_hourRect->origin.x;
  CGFloat width = p_hourRect->size.width;
  double Height = CGRectGetHeight(v9);
  double v6 = 0.0;
  double v7 = x;
  double v8 = width;
  result.size.height = Height;
  result.size.CGFloat width = v8;
  result.origin.y = v6;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGRect)minuteRect
{
  p_minuteRect = &self->_minuteRect;
  [(UIView *)self bounds];
  CGFloat x = p_minuteRect->origin.x;
  CGFloat width = p_minuteRect->size.width;
  double Height = CGRectGetHeight(v9);
  double v6 = 0.0;
  double v7 = x;
  double v8 = width;
  result.size.height = Height;
  result.size.CGFloat width = v8;
  result.origin.y = v6;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGRect)timeOfDayRect
{
  p_timeOfDayRect = &self->_timeOfDayRect;
  [(UIView *)self bounds];
  CGFloat x = p_timeOfDayRect->origin.x;
  CGFloat width = p_timeOfDayRect->size.width;
  double Height = CGRectGetHeight(v9);
  double v6 = 0.0;
  double v7 = x;
  double v8 = width;
  result.size.height = Height;
  result.size.CGFloat width = v8;
  result.origin.y = v6;
  result.origin.CGFloat x = v7;
  return result;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  v5 = [(_UIDatePickerCompactTimeLabel *)self label];
  [v5 setFont:v4];

  [(_UIDatePickerCompactTimeLabel *)self _updateTextContentStorage];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (id)font
{
  v2 = [(_UIDatePickerCompactTimeLabel *)self label];
  v3 = [v2 font];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  [(_UIDatePickerCompactTimeLabel *)self _updateEnabledStyling];
}

- (void)_updateEnabledStyling
{
  [(UIView *)self setUserInteractionEnabled:[(_UIDatePickerCompactTimeLabel *)self isEnabled]];
  BOOL v3 = [(_UIDatePickerCompactTimeLabel *)self isEnabled];
  id v4 = [(_UIDatePickerCompactTimeLabel *)self backgroundView];
  [v4 setEnabled:v3];

  [(_UIDatePickerCompactTimeLabel *)self pushCurrentStateIntoUI];
}

- (BOOL)adjustsFontSizeToFitWidth
{
  v2 = [(_UIDatePickerCompactTimeLabel *)self label];
  char v3 = [v2 adjustsFontSizeToFitWidth];

  return v3;
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(_UIDatePickerCompactTimeLabel *)self label];
  [v5 setAdjustsFontSizeToFitWidth:v3];

  [(UIView *)self invalidateIntrinsicContentSize];
}

- (double)minimumScaleFactor
{
  v2 = [(_UIDatePickerCompactTimeLabel *)self label];
  [v2 minimumScaleFactor];
  double v4 = v3;

  return v4;
}

- (void)setMinimumScaleFactor:(double)a3
{
  v5 = [(_UIDatePickerCompactTimeLabel *)self label];
  [v5 setMinimumScaleFactor:a3];

  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)setOverrideAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_overrideAttributes, a3);
  [(_UIDatePickerCompactTimeLabel *)self pushCurrentStateIntoUI];
}

- (void)applyTextAttributesForState:(unint64_t)a3 inputScope:(int64_t)a4 updater:(id)a5
{
  id v8 = a5;
  if (a3 <= 0xA && ((1 << a3) & 0x602) != 0)
  {
    -[_UIDatePickerCalendarTimeLabel applyTextAttributesForState:inputScope:updater:](&v18, sel_applyTextAttributesForState_inputScope_updater_, a3, a4, v8, v17.receiver, v17.super_class, self, _UIDatePickerCompactTimeLabel);
  }
  else
  {
    switch(a4)
    {
      case 0:
        -[_UIDatePickerCalendarTimeLabel applyTextAttributesForState:inputScope:updater:](&v17, sel_applyTextAttributesForState_inputScope_updater_, a3, 0, v8, self, _UIDatePickerCompactTimeLabel, v18.receiver, v18.super_class);
        break;
      case 1:
        CGRect v9 = +[UIColor systemWhiteColor];
        (*((void (**)(id, void *, void, void, void))v8 + 2))(v8, v9, 0, 0, 0);
        goto LABEL_13;
      case 2:
        CGRect v9 = +[UIColor labelColor];
        double v10 = +[UIColor systemWhiteColor];
        double v11 = (void (*)(id, void *, void *, void *, void *))*((void *)v8 + 2);
        id v12 = v8;
        v13 = v9;
        v14 = v10;
        v15 = 0;
        goto LABEL_10;
      case 3:
        CGRect v9 = +[UIColor labelColor];
        double v10 = +[UIColor systemWhiteColor];
        double v11 = (void (*)(id, void *, void *, void *, void *))*((void *)v8 + 2);
        id v12 = v8;
        v13 = v9;
        v14 = 0;
        v15 = v10;
LABEL_10:
        v16 = 0;
        goto LABEL_12;
      case 4:
        CGRect v9 = +[UIColor labelColor];
        double v10 = +[UIColor systemWhiteColor];
        double v11 = (void (*)(id, void *, void *, void *, void *))*((void *)v8 + 2);
        id v12 = v8;
        v13 = v9;
        v14 = 0;
        v15 = 0;
        v16 = v10;
LABEL_12:
        v11(v12, v13, v14, v15, v16);

LABEL_13:
        break;
      default:
        break;
    }
  }
}

- (void)_gestureRecognizerFailed:(id)a3
{
}

- (void)controlEventsGestureRecognizer:(id)a3 recognizedControlEvent:(unint64_t)a4 withEvent:(id)a5
{
  id v16 = a3;
  [v16 locationInView:self];
  if ((uint64_t)a4 <= 63)
  {
    switch(a4)
    {
      case 1uLL:
        double v11 = v7;
        double v12 = v8;
        v13 = [v16 activeTouch];
        char v14 = [v13 _isPointerTouch];

        if (v14) {
          -[_UIDatePickerCompactTimeLabel _viewForInputScope:](self, "_viewForInputScope:", -[_UIDatePickerCompactTimeLabel _inputScopeForPointerLocation:](self, "_inputScopeForPointerLocation:", v11, v12));
        }
        else {
        v15 = [(_UIDatePickerCompactTimeLabel *)self label];
        }
        objc_storeWeak((id *)&self->_touchHighlightedView, v15);

        break;
      case 0x10uLL:
        break;
      case 0x20uLL:
        CGRect v9 = self;
        uint64_t v10 = 0;
        goto LABEL_17;
      default:
        goto LABEL_18;
    }
    CGRect v9 = self;
    uint64_t v10 = 1;
LABEL_17:
    [(_UIDatePickerCompactTimeLabel *)v9 setHighlightedForTouch:v10];
    goto LABEL_18;
  }
  if (a4 == 64)
  {
    [(_UIDatePickerCompactTimeLabel *)self _activateCompactLabelForGestureRecognizer:v16];
LABEL_13:
    [(_UIDatePickerCompactTimeLabel *)self setHighlightedForTouch:0];
    objc_storeWeak((id *)&self->_touchHighlightedView, 0);
    goto LABEL_18;
  }
  if (a4 == 128 || a4 == 256) {
    goto LABEL_13;
  }
LABEL_18:
}

- (void)setHighlightedForTouch:(BOOL)a3
{
  char flags = (char)self->_flags;
  if (((((flags & 4) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    if (a3) {
      char v5 = 4;
    }
    else {
      char v5 = 0;
    }
    *(unsigned char *)&self->_char flags = flags & 0xFB | v5;
    id v6 = objc_loadWeakRetained((id *)&self->_touchHighlightedView);
    double v7 = [v6 traitCollection];
    BOOL v8 = [v7 userInterfaceStyle] == 2;
    if (v4) {
      double v9 = dbl_186B935B0[v8];
    }
    else {
      double v9 = 1.0;
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = ___UIDateLabelAnimateHighlight_block_invoke_0;
    v11[3] = &unk_1E52D9CD0;
    id v12 = v6;
    double v13 = v9;
    id v10 = v6;
    +[UIView animateWithDuration:327684 delay:v11 options:0 animations:0.47 completion:0.0];
  }
}

- (void)_updateHoverStateLabelsIfNeeded
{
  switch(self->_highlightedScope)
  {
    case 0:
    case 1:
      double v3 = [(_UIDatePickerCompactTimeLabel *)self hourLabel];
      BOOL v4 = v3;
      uint64_t v5 = 1;
      goto LABEL_4;
    case 2:
      double v3 = [(_UIDatePickerCompactTimeLabel *)self hourLabel];
      BOOL v4 = v3;
      uint64_t v5 = 0;
LABEL_4:
      [v3 setHidden:v5];

      id v6 = [(_UIDatePickerCompactTimeLabel *)self minuteLabel];
      double v7 = v6;
      uint64_t v8 = 1;
      goto LABEL_6;
    case 3:
      double v9 = [(_UIDatePickerCompactTimeLabel *)self hourLabel];
      [v9 setHidden:1];

      id v6 = [(_UIDatePickerCompactTimeLabel *)self minuteLabel];
      double v7 = v6;
      uint64_t v8 = 0;
LABEL_6:
      [v6 setHidden:v8];

      id v10 = [(_UIDatePickerCompactTimeLabel *)self timeOfDayLabel];
      id v14 = v10;
      uint64_t v11 = 1;
      goto LABEL_8;
    case 4:
      id v12 = [(_UIDatePickerCompactTimeLabel *)self hourLabel];
      [v12 setHidden:1];

      double v13 = [(_UIDatePickerCompactTimeLabel *)self minuteLabel];
      [v13 setHidden:1];

      id v10 = [(_UIDatePickerCompactTimeLabel *)self timeOfDayLabel];
      id v14 = v10;
      uint64_t v11 = 0;
LABEL_8:
      [v10 setHidden:v11];

      break;
    default:
      return;
  }
}

- (id)updateHoverLabelForAttributedString:(id)a3 ranges:(id *)a4
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)[a3 mutableCopy];
  [(_UIDatePickerCompactTimeLabel *)self _updateHoverStateLabelsIfNeeded];
  int64_t highlightedScope = self->_highlightedScope;
  switch(highlightedScope)
  {
    case 4:
      NSUInteger location = a4->var2.location;
      a4 = ($31C3D19CB42A65A48B615288A5B34F74 *)((char *)a4 + 32);
      p_length = &a4->var0.length;
      id v16 = objc_msgSend(v6, "attributedSubstringFromRange:", location, a4->var0.length);
      objc_super v17 = [(_UIDatePickerCompactTimeLabel *)self timeOfDayLabel];
      [v17 setAttributedText:v16];

      uint64_t v23 = *(void *)off_1E52D2048;
      uint64_t v11 = +[UIColor clearColor];
      v24 = v11;
      id v12 = (void *)MEMORY[0x1E4F1C9E8];
      double v13 = &v24;
      id v14 = &v23;
      break;
    case 3:
      NSUInteger v18 = a4->var1.location;
      a4 = ($31C3D19CB42A65A48B615288A5B34F74 *)((char *)a4 + 16);
      p_length = &a4->var0.length;
      v19 = objc_msgSend(v6, "attributedSubstringFromRange:", v18, a4->var0.length);
      v20 = [(_UIDatePickerCompactTimeLabel *)self minuteLabel];
      [v20 setAttributedText:v19];

      uint64_t v25 = *(void *)off_1E52D2048;
      uint64_t v11 = +[UIColor clearColor];
      double v26 = v11;
      id v12 = (void *)MEMORY[0x1E4F1C9E8];
      double v13 = &v26;
      id v14 = &v25;
      break;
    case 2:
      p_length = &a4->var0.length;
      double v9 = objc_msgSend(v6, "attributedSubstringFromRange:", a4->var0.location, a4->var0.length);
      id v10 = [(_UIDatePickerCompactTimeLabel *)self hourLabel];
      [v10 setAttributedText:v9];

      uint64_t v27 = *(void *)off_1E52D2048;
      uint64_t v11 = +[UIColor clearColor];
      v28[0] = v11;
      id v12 = (void *)MEMORY[0x1E4F1C9E8];
      double v13 = (void **)v28;
      id v14 = &v27;
      break;
    default:
      goto LABEL_8;
  }
  v21 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:1];
  objc_msgSend(v6, "setAttributes:range:", v21, a4->var0.location, *p_length);

LABEL_8:
  return v6;
}

- (void)pushCurrentStateIntoUI
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v3 = [(_UIDatePickerCalendarTimeLabel *)self attributedTextWithRanges:&v15];
  BOOL v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(_UIDatePickerCompactTimeLabel *)self overrideAttributes];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [v4 length];
    uint64_t v8 = [(_UIDatePickerCompactTimeLabel *)self overrideAttributes];
    objc_msgSend(v4, "addAttributes:range:", v8, 0, v7);
  }
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    long long v11 = v15;
    long long v12 = v16;
    long long v13 = v17;
    long long v14 = v18;
    uint64_t v9 = [(_UIDatePickerCompactTimeLabel *)self updateHoverLabelForAttributedString:v4 ranges:&v11];

    BOOL v4 = (void *)v9;
  }
  id v10 = [(_UIDatePickerCompactTimeLabel *)self label];
  [v10 setAttributedText:v4];

  long long v11 = v15;
  long long v12 = v16;
  long long v13 = v17;
  long long v14 = v18;
  [(_UIDatePickerCompactTimeLabel *)self _updateLayoutRectsForRanges:&v11];
  [(_UIDatePickerCompactTimeLabel *)self _updateInputFieldLayoutForCurrentState];
}

- (void)pushCurrentStateIntoUIAndNotify
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerCompactTimeLabel;
  [(_UIDatePickerCalendarTimeLabel *)&v4 pushCurrentStateIntoUIAndNotify];
  double v3 = [(_UIDatePickerCompactTimeLabel *)self selectionDelegate];
  [v3 compactTimeLabel:self didSelectTime:self->_selectedTime];
}

- (void)stateMachineUpdateFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  self->_currentState = a4;
  v5.receiver = self;
  v5.super_class = (Class)_UIDatePickerCompactTimeLabel;
  -[_UIDatePickerCalendarTimeLabel stateMachineUpdateFromState:toState:](&v5, sel_stateMachineUpdateFromState_toState_, a3);
  [(_UIDatePickerCompactTimeLabel *)self _updateTimeFormatIfNeeded];
  [(_UIDatePickerCompactTimeLabel *)self _updateInputFieldLayoutForCurrentState];
}

- (void)_updateTimeFormatIfNeeded
{
  unint64_t v3 = self->_currentState - 2;
  objc_super v4 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  int v5 = [v4 forceDoubleDigitHours];

  if (v3 < 7 != v5)
  {
    *(unsigned char *)&self->_flags |= 2u;
    uint64_t v6 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
    uint64_t v7 = [v6 withForceDoubleDigitHours:v3 < 7];

    v9[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58___UIDatePickerCompactTimeLabel__updateTimeFormatIfNeeded__block_invoke;
    v10[3] = &unk_1E52D9F98;
    v10[4] = self;
    id v11 = v7;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58___UIDatePickerCompactTimeLabel__updateTimeFormatIfNeeded__block_invoke_2;
    v9[3] = &unk_1E52DC3A0;
    id v8 = v7;
    +[UIView animateWithDuration:v10 animations:v9 completion:0.25];
  }
}

- (void)_updateInputFieldLayoutForCurrentState
{
  switch([(_UIDatePickerCompactTimeLabel *)self currentState])
  {
    case 2uLL:
    case 6uLL:
      unint64_t v3 = [(_UIDatePickerCompactTimeLabel *)self label];
      [v3 frame];
      uint64_t v5 = v4;
      uint64_t v7 = v6;
      uint64_t v9 = v8;
      uint64_t v11 = v10;

      goto LABEL_8;
    case 3uLL:
    case 7uLL:
      uint64_t v12 = 552;
      goto LABEL_7;
    case 4uLL:
    case 8uLL:
      uint64_t v12 = 584;
      goto LABEL_7;
    case 5uLL:
      uint64_t v12 = 616;
LABEL_7:
      v19 = (uint64_t *)((char *)self + v12);
      uint64_t v5 = *v19;
      uint64_t v7 = v19[1];
      uint64_t v9 = v19[2];
      uint64_t v11 = v19[3];
LABEL_8:
      uint64_t v18 = [(UIView *)self tintColor];
      break;
    default:
      long long v13 = [(_UIDatePickerCompactTimeLabel *)self label];
      [v13 frame];
      uint64_t v5 = v14;
      uint64_t v7 = v15;
      uint64_t v9 = v16;
      uint64_t v11 = v17;

      uint64_t v18 = +[UIColor clearColor];
      break;
  }
  v20 = (void *)v18;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __71___UIDatePickerCompactTimeLabel__updateInputFieldLayoutForCurrentState__block_invoke;
  v22[3] = &unk_1E52DA520;
  v22[4] = self;
  v22[5] = v5;
  v22[6] = v7;
  v22[7] = v9;
  v22[8] = v11;
  +[UIView performWithoutAnimation:v22];
  v21 = [(_UIDatePickerCompactTimeLabel *)self inputBackgroundView];
  [v21 setBackgroundColor:v20];
}

- (void)_updateTextContentStorage
{
  v16[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(_UIDatePickerCompactTimeLabel *)self label];
  uint64_t v4 = [v3 attributedText];
  uint64_t v5 = [v4 string];

  uint64_t v6 = [(_UIDatePickerCompactTimeLabel *)self label];
  [v6 _stringDrawingOptions];

  uint64_t v15 = *(void *)off_1E52D2040;
  uint64_t v7 = [(_UIDatePickerCompactTimeLabel *)self label];
  uint64_t v8 = [v7 font];
  v16[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  uint64_t v10 = (void *)[v9 mutableCopy];

  uint64_t v11 = [(_UIDatePickerCompactTimeLabel *)self overrideAttributes];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    long long v13 = [(_UIDatePickerCompactTimeLabel *)self overrideAttributes];
    [v10 addEntriesFromDictionary:v13];
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v10];
  [(NSTextContentStorage *)self->_textContentStorage setAttributedString:v14];
}

- (void)_updateLayoutRectsForRanges:(id *)a3
{
  [(_UIDatePickerCompactTimeLabel *)self _updateTextContentStorage];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61___UIDatePickerCompactTimeLabel__updateLayoutRectsForRanges___block_invoke;
  aBlock[3] = &unk_1E5303AE8;
  aBlock[4] = self;
  uint64_t v5 = (double (**)(void *, NSUInteger, NSUInteger))_Block_copy(aBlock);
  self->_hourRect.origin.CGFloat x = v5[2](v5, a3->var0.location, a3->var0.length);
  self->_hourRect.origin.y = v6;
  self->_hourRect.size.CGFloat width = v7;
  self->_hourRect.size.height = v8;
  self->_minuteRect.origin.CGFloat x = v5[2](v5, a3->var1.location, a3->var1.length);
  self->_minuteRect.origin.y = v9;
  self->_minuteRect.size.CGFloat width = v10;
  self->_minuteRect.size.height = v11;
  self->_timeOfDayRect.origin.CGFloat x = v5[2](v5, a3->var2.location, a3->var2.length);
  self->_timeOfDayRect.origin.y = v12;
  self->_timeOfDayRect.size.CGFloat width = v13;
  self->_timeOfDayRect.size.height = v14;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61___UIDatePickerCompactTimeLabel__updateLayoutRectsForRanges___block_invoke_2;
  v15[3] = &unk_1E52D9F70;
  v15[4] = self;
  +[UIView performWithoutAnimation:v15];
}

- (id)_currentDateForInput
{
  unint64_t v3 = NSString;
  uint64_t v4 = [(_UIDatePickerCalendarTimeLabel *)self hourText];
  uint64_t v5 = [(_UIDatePickerCalendarTimeLabel *)self minuteText];
  CGFloat v6 = [v3 stringWithFormat:@"%@~~%@", v4, v5];

  CGFloat v7 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  uint64_t v8 = [v7 clockLayout];

  if (v8)
  {
    CGFloat v9 = [(_UIDatePickerCalendarTimeLabel *)self timeOfDayText];
    uint64_t v10 = [v6 stringByAppendingFormat:@"~~%@", v9];

    CGFloat v6 = (void *)v10;
  }
  CGFloat v11 = [(NSDateFormatter *)self->_formatter dateFromString:v6];

  return v11;
}

- (void)_activateCompactLabelForGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIDatePickerCompactTimeLabel *)self overlayPresentation];
  if ([v5 activeMode] == 1) {
    int v6 = ![(UIView *)self isFirstResponder];
  }
  else {
    int v6 = 0;
  }
  CGFloat v7 = [v4 activeTouch];
  if ([v7 _isPointerTouch])
  {
    uint64_t v8 = +[UIDevice currentDevice];
    int v9 = [v8 _isHardwareKeyboardAvailable];

    if (v9)
    {
      if (v6) {
        [v5 dismissPresentationAnimated:1];
      }
      [v4 locationInView:self];
      -[_UIDatePickerCalendarTimeLabel didTapInputLabelAtLocation:](self, "didTapInputLabelAtLocation:");
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __75___UIDatePickerCompactTimeLabel__activateCompactLabelForGestureRecognizer___block_invoke;
      v11[3] = &unk_1E52DC3A0;
      void v11[4] = self;
      [v5 activateEmptyPresentationWithMode:1 onDismiss:v11];
      uint64_t v10 = [(_UIDatePickerCompactTimeLabel *)self backgroundView];
      [v10 setSelected:1];

      goto LABEL_14;
    }
  }
  else
  {
  }
  if (v6)
  {
    [v5 dismissPresentationAnimated:1];
  }
  else if (![(_UIDatePickerCalendarTimeLabel *)self scribbleInteractionIsActive])
  {
    [(_UIDatePickerCompactTimeLabel *)self activateLabel];
  }
LABEL_14:
}

- (void)activateLabel
{
  unint64_t v3 = [(_UIDatePickerCompactTimeLabel *)self overlayPresentation];
  if ([(UIView *)self isFirstResponder]) {
    [(_UIDatePickerCalendarTimeLabel *)self resignFirstResponder];
  }
  [(_UIDatePickerCalendarTimeLabel *)self beginEditingWheels];
  if ([(_UIDatePickerCompactTimeLabel *)self tapInteractionControlledExternally])
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46___UIDatePickerCompactTimeLabel_activateLabel__block_invoke;
    v12[3] = &unk_1E52DC3A0;
    v12[4] = self;
    [v3 activateEmptyPresentationWithMode:1 onDismiss:v12];
  }
  else
  {
    id v4 = [(_UIDatePickerCompactTimeLabel *)self selectionDelegate];
    [v4 compactTimeLabelDidBeginEditing:self];

    uint64_t v5 = [(_UIDatePickerCompactTimeLabel *)self selectionDelegate];
    int v6 = [v5 createDatePickerForCompactTimeLabel:self];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46___UIDatePickerCompactTimeLabel_activateLabel__block_invoke_2;
    v11[3] = &unk_1E52DB038;
    void v11[4] = self;
    CGFloat v7 = +[UIAction actionWithHandler:v11];
    [v6 addAction:v7 forControlEvents:0x2000];

    uint64_t v8 = [v3 sourceView];
    [(UIView *)self bounds];
    objc_msgSend(v8, "convertRect:fromView:", self);
    objc_msgSend(v3, "setSourceRect:");

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46___UIDatePickerCompactTimeLabel_activateLabel__block_invoke_3;
    v10[3] = &unk_1E52DC3A0;
    v10[4] = self;
    [v3 presentDatePicker:v6 onDismiss:v10];
    int v9 = [(_UIDatePickerCompactTimeLabel *)self backgroundView];
    [v9 setSelected:1];
  }
}

- (CGSize)intrinsicContentSize
{
  -[_UIDatePickerCompactTimeLabel sizeThatFits:](self, "sizeThatFits:", INFINITY, INFINITY);
  [(UIView *)self alignmentRectInsets];
  UICeilToViewScale(self);
  double v4 = v3;
  UICeilToViewScale(self);
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.CGFloat width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4 = [(UIView *)self traitCollection];
  double v5 = +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", [v4 userInterfaceIdiom]);

  [v5 compactLabelBackgroundPadding];
  double v6 = [(NSTextContentStorage *)self->_textContentStorage attributedString];
  uint64_t v7 = [v6 length];

  -[_UITextLayoutController boundingRectForCharacterRange:](self->_textLayoutController, "boundingRectForCharacterRange:", 0, v7);
  UICeilToViewScale(self);
  double v9 = v8;
  UICeilToViewScale(self);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.CGFloat width = v12;
  return result;
}

- (void)reloadWithCalendar:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5 displaysTimeZone:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v23 = a3;
  id v10 = a4;
  if ([(UIView *)self isFirstResponder])
  {
    *(unsigned char *)&self->_flags &= ~1u;
    [(_UIDatePickerCalendarTimeLabel *)self resignFirstResponder];
  }
  double v11 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  uint64_t v12 = [v11 forceDoubleDigitHours];

  double v13 = [[_UIDatePickerCalendarTimeFormat alloc] initWithCalendar:v23 locale:v10 followsSystemHourCycle:v7 forceDoubleDigitHours:v12 displaysTimeZone:v6];
  [(_UIDatePickerCalendarTimeLabel *)self setTimeFormat:v13];

  [(NSDateFormatter *)self->_formatter setCalendar:v23];
  if (v10)
  {
    [(NSDateFormatter *)self->_formatter setLocale:v10];
  }
  else
  {
    CGFloat v14 = [v23 locale];
    [(NSDateFormatter *)self->_formatter setLocale:v14];
  }
  uint64_t v15 = [v23 timeZone];
  [(NSDateFormatter *)self->_formatter setTimeZone:v15];

  uint64_t v16 = NSString;
  uint64_t v17 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  uint64_t v18 = [v17 hourFormat];
  v19 = [v16 stringWithFormat:@"%@~~mm", v18];

  v20 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  uint64_t v21 = [v20 clockLayout];

  if (v21)
  {
    uint64_t v22 = [v19 stringByAppendingString:@"~~a"];

    v19 = (void *)v22;
  }
  [(NSDateFormatter *)self->_formatter setDateFormat:v19];
  [(_UIDatePickerCompactTimeLabel *)self pushCurrentStateIntoUI];
}

- (void)reloadWithDate:(id)a3
{
}

- (void)_reloadWithDate:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  [v7 setTimeZoneReferenceDate:v6];

  double v8 = [_UIDatePickerCalendarTime alloc];
  double v9 = [(NSDateFormatter *)self->_formatter calendar];
  id v10 = [(_UIDatePickerCalendarDateComponent *)v8 initWithDate:v6 calendar:v9];

  selectedTime = self->_selectedTime;
  self->_selectedTime = v10;

  [(_UIDatePickerCompactTimeLabel *)self _updateInputFieldFromSelectedDateComponents];
  if (v4)
  {
    [(_UIDatePickerCompactTimeLabel *)self pushCurrentStateIntoUIAndNotify];
  }
}

- (void)willBeginWritingInScribbleInteraction
{
  id v2 = [(_UIDatePickerCompactTimeLabel *)self label];
  [v2 setAttributedText:0];
}

- (void)_updateInputFieldFromSelectedDateComponents
{
  formatter = self->_formatter;
  BOOL v4 = [(_UIDatePickerCalendarDateComponent *)self->_selectedTime date];
  id v15 = [(NSDateFormatter *)formatter stringFromDate:v4];

  double v5 = [v15 componentsSeparatedByString:@"~~"];
  if ([(UIView *)self isFirstResponder]
    || [(_UIDatePickerCompactTimeLabel *)self currentState] == 9)
  {
    *(unsigned char *)&self->_flags |= 1u;
  }
  else
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
    [(_UIDatePickerCalendarTimeLabel *)self setHourText:v6];

    BOOL v7 = [v5 objectAtIndexedSubscript:1];
    [(_UIDatePickerCalendarTimeLabel *)self setMinuteText:v7];

    [(_UIDatePickerCalendarTimeLabel *)self _roundInputToClosestIntervalIfNeeded];
  }
  double v8 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  uint64_t v9 = [v8 clockLayout];

  if (v9)
  {
    id v10 = [v5 objectAtIndexedSubscript:2];
    double v11 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
    uint64_t v12 = [v11 PMSymbol];
    BOOL v13 = [v10 compare:v12 options:1] == 0;

    CGFloat v14 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
    [v14 setIsPM:v13];
  }
  [(_UIDatePickerCompactTimeLabel *)self pushCurrentStateIntoUI];
}

- (void)_updateSelectedDateComponentsFromInput
{
  id v7 = [(_UIDatePickerCompactTimeLabel *)self _currentDateForInput];
  double v3 = [_UIDatePickerCalendarTime alloc];
  BOOL v4 = [(NSDateFormatter *)self->_formatter calendar];
  double v5 = [(_UIDatePickerCalendarDateComponent *)v3 initWithDate:v7 calendar:v4];

  if ([(_UIDatePickerCalendarDateComponent *)v5 isEqual:self->_selectedTime])
  {
    [(_UIDatePickerCompactTimeLabel *)self _updateInputFieldFromSelectedDateComponents];
  }
  else
  {
    objc_storeStrong((id *)&self->_selectedTime, v5);
    [(_UIDatePickerCompactTimeLabel *)self _updateInputFieldFromSelectedDateComponents];
    id v6 = [(_UIDatePickerCompactTimeLabel *)self selectionDelegate];
    [v6 compactTimeLabel:self didSelectTime:v5];
  }
}

- (BOOL)isPassthroughInteractionEnabled
{
  return self->_passthroughInteraction != 0;
}

- (void)setPassthroughInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  passthroughInteraction = self->_passthroughInteraction;
  if (v3)
  {
    if (!passthroughInteraction)
    {
      id v6 = (_UIPassthroughScrollInteraction *)objc_opt_new();
      id v7 = self->_passthroughInteraction;
      self->_passthroughInteraction = v6;

      [(_UIPassthroughScrollInteraction *)self->_passthroughInteraction setDelegate:self];
      [(_UIPassthroughScrollInteraction *)self->_passthroughInteraction setEatsTouches:0];
      double v8 = self->_passthroughInteraction;
      [(UIView *)self addInteraction:v8];
    }
  }
  else if (passthroughInteraction)
  {
    -[UIView removeInteraction:](self, "removeInteraction:");
    uint64_t v9 = self->_passthroughInteraction;
    self->_passthroughInteraction = 0;
  }
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  double v8 = -[UIView hitTest:withEvent:](self, "hitTest:withEvent:", a5);

  if (v8) {
    return 0;
  }
  id v10 = [(_UIDatePickerCompactTimeLabel *)self selectionDelegate];
  char v11 = objc_msgSend(v10, "compactTimeLabel:shouldDismissForInteractionAtLocation:", self, x, y);

  return v11;
}

- (BOOL)timeLabel:(id)a3 didReceiveText:(id)a4
{
  id v5 = a4;
  if ([v5 length] == 1)
  {
    id v6 = [(NSDateFormatter *)self->_formatter AMSymbol];
    id v7 = [(NSDateFormatter *)self->_formatter PMSymbol];
    unint64_t v8 = [v6 length];
    unint64_t v9 = [v7 length];
    if (v8 >= v9) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v10)
    {
      unint64_t v11 = 0;
      while (1)
      {
        int v12 = [v6 characterAtIndex:v11];
        int v13 = [v7 characterAtIndex:v11];
        if (v12 != v13) {
          break;
        }
        ++v11;
        unint64_t v14 = [v6 length];
        unint64_t v15 = [v7 length];
        if (v14 >= v15) {
          unint64_t v16 = v15;
        }
        else {
          unint64_t v16 = v14;
        }
        int v17 = v12;
        if (v11 >= v16) {
          goto LABEL_16;
        }
      }
      int v17 = v13;
    }
    else
    {
      int v17 = 0;
      int v12 = 0;
    }
LABEL_16:
    unsigned __int16 v33 = v12;
    __int16 v32 = v17;
    v19 = objc_opt_new();
    if (v12 != v17)
    {
      v20 = [NSString stringWithCharacters:&v33 length:1];
      uint64_t v21 = [v20 localizedLowercaseString];
      [v19 addCharactersInString:v21];

      uint64_t v22 = [v20 localizedUppercaseString];
      [v19 addCharactersInString:v22];
    }
    id v23 = objc_opt_new();
    if (v33 != v17)
    {
      v24 = [NSString stringWithCharacters:&v32 length:1];
      uint64_t v25 = [v24 localizedLowercaseString];
      [v23 addCharactersInString:v25];

      double v26 = [v24 localizedUppercaseString];
      [v23 addCharactersInString:v26];
    }
    uint64_t v27 = [v5 characterAtIndex:0];
    if ([v19 characterIsMember:v27])
    {
      double v28 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
      double v29 = v28;
      uint64_t v30 = 0;
    }
    else
    {
      if (![v23 characterIsMember:v27])
      {
        BOOL v18 = 0;
        goto LABEL_26;
      }
      double v28 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
      double v29 = v28;
      uint64_t v30 = 1;
    }
    [v28 setIsPM:v30];

    [(_UIDatePickerCompactTimeLabel *)self _updateSelectedDateComponentsFromInput];
    BOOL v18 = 1;
LABEL_26:

    goto LABEL_27;
  }
  BOOL v18 = 0;
LABEL_27:

  return v18;
}

- (int64_t)keyboardTypeForTimeLabel:(id)a3
{
  return 4;
}

- (BOOL)timeLabelShouldSuppressSoftwareKeyboard:(id)a3
{
  return 1;
}

- (BOOL)timeLabelCanBecomeFirstResponder:(id)a3
{
  return 1;
}

- (void)timeLabelWillBecomeFirstResponder:(id)a3
{
  id v4 = [(_UIDatePickerCompactTimeLabel *)self selectionDelegate];
  [v4 compactTimeLabelWillBecomeFirstResponder:self];
}

- (void)timeLabelDidBecomeFirstResponder:(id)a3
{
}

- (void)timeLabelDidFailToBecomeFirstResponder:(id)a3
{
}

- (void)timeLabelDidResignFirstResponder:(id)a3
{
  id v4 = [(_UIDatePickerCompactTimeLabel *)self overlayPresentation];
  char v5 = [v4 isPresentingOverlay];

  if ((v5 & 1) == 0)
  {
    id v6 = [(_UIDatePickerCompactTimeLabel *)self overlayPresentation];
    [v6 dismissPresentationAnimated:1];
  }
  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)&self->_flags &= ~1u;
    [(_UIDatePickerCompactTimeLabel *)self _updateInputFieldFromSelectedDateComponents];
  }
  [(_UIDatePickerCompactTimeLabel *)self _updateHoverStateLabelsIfNeeded];
  [(_UIDatePickerCompactTimeLabel *)self setPassthroughInteractionEnabled:0];
}

- (void)timeLabelDidBeginEditing:(id)a3
{
  id v4 = [(_UIDatePickerCompactTimeLabel *)self selectionDelegate];
  [v4 compactTimeLabelDidBeginEditing:self];
}

- (void)timeLabelDidEndEditing:(id)a3
{
  id v4 = [(_UIDatePickerCompactTimeLabel *)self selectionDelegate];
  [v4 compactTimeLabelDidEndEditing:self];
}

- (void)_expandedComponentRectForHours:(CGRect *)a3 minuteRect:(CGRect *)a4 timeOfDayRect:(CGRect *)a5
{
  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  memset(&v82, 0, sizeof(v82));
  unint64_t v9 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  uint64_t v10 = [v9 clockLayout];

  if (v10)
  {
    double MinX = CGRectGetMinX(self->_timeOfDayRect);
    if (MinX >= CGRectGetMinX(self->_hourRect))
    {
      [(_UIDatePickerCompactTimeLabel *)self hourRect];
      CGFloat v59 = v58;
      CGFloat v61 = v60;
      CGFloat v63 = v62;
      CGFloat v65 = v64;
      [(_UIDatePickerCompactTimeLabel *)self minuteRect];
      v100.origin.CGFloat x = v66;
      v100.origin.CGFloat y = v67;
      v100.size.CGFloat width = v68;
      v100.size.CGFloat height = v69;
      v92.origin.CGFloat x = v59;
      v92.origin.CGFloat y = v61;
      v92.size.CGFloat width = v63;
      v92.size.CGFloat height = v65;
      CGRect v93 = CGRectUnion(v92, v100);
      CGFloat x = v93.origin.x;
      CGFloat y = v93.origin.y;
      CGFloat width = v93.size.width;
      CGFloat height = v93.size.height;
      CGFloat v74 = CGRectGetWidth(v93) * 0.5;
      v94.origin.CGFloat x = x;
      v94.origin.CGFloat y = y;
      v94.size.CGFloat width = width;
      v94.size.CGFloat height = height;
      CGRectDivide(v94, &remainder, &slice, v74, CGRectMinXEdge);
      [(_UIDatePickerCompactTimeLabel *)self timeOfDayRect];
      v101.origin.CGFloat x = v75;
      v101.origin.CGFloat y = v76;
      v101.size.CGFloat width = v77;
      v101.size.CGFloat height = v78;
      CGRect v95 = CGRectUnion(slice, v101);
      CGFloat v33 = v95.origin.x;
      CGFloat v34 = v95.origin.y;
      CGFloat v35 = v95.size.width;
      CGFloat v36 = v95.size.height;
      double v37 = CGRectGetWidth(v95) * 0.5;
      p_CGRect slice = &slice;
      v39 = &v82;
    }
    else
    {
      [(_UIDatePickerCompactTimeLabel *)self timeOfDayRect];
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      [(_UIDatePickerCompactTimeLabel *)self hourRect];
      v97.origin.CGFloat x = v20;
      v97.origin.CGFloat y = v21;
      v97.size.CGFloat width = v22;
      v97.size.CGFloat height = v23;
      v85.origin.CGFloat x = v13;
      v85.origin.CGFloat y = v15;
      v85.size.CGFloat width = v17;
      v85.size.CGFloat height = v19;
      CGRect v86 = CGRectUnion(v85, v97);
      CGFloat v24 = v86.origin.x;
      CGFloat v25 = v86.origin.y;
      CGFloat v26 = v86.size.width;
      CGFloat v27 = v86.size.height;
      CGFloat v28 = CGRectGetWidth(v86) * 0.5;
      v87.origin.CGFloat x = v24;
      v87.origin.CGFloat y = v25;
      v87.size.CGFloat width = v26;
      v87.size.CGFloat height = v27;
      CGRectDivide(v87, &v82, &remainder, v28, CGRectMinXEdge);
      [(_UIDatePickerCompactTimeLabel *)self minuteRect];
      v98.origin.CGFloat x = v29;
      v98.origin.CGFloat y = v30;
      v98.size.CGFloat width = v31;
      v98.size.CGFloat height = v32;
      CGRect v88 = CGRectUnion(remainder, v98);
      CGFloat v33 = v88.origin.x;
      CGFloat v34 = v88.origin.y;
      CGFloat v35 = v88.size.width;
      CGFloat v36 = v88.size.height;
      double v37 = CGRectGetWidth(v88) * 0.5;
      p_CGRect slice = &remainder;
      v39 = &slice;
    }
    v96.origin.CGFloat x = v33;
    v96.origin.CGFloat y = v34;
    v96.size.CGFloat width = v35;
    v96.size.CGFloat height = v36;
    CGRectDivide(v96, p_slice, v39, v37, CGRectMinXEdge);
    if (a3) {
      goto LABEL_8;
    }
  }
  else
  {
    [(_UIDatePickerCompactTimeLabel *)self hourRect];
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    [(_UIDatePickerCompactTimeLabel *)self minuteRect];
    v99.origin.CGFloat x = v48;
    v99.origin.CGFloat y = v49;
    v99.size.CGFloat width = v50;
    v99.size.CGFloat height = v51;
    v89.origin.CGFloat x = v41;
    v89.origin.CGFloat y = v43;
    v89.size.CGFloat width = v45;
    v89.size.CGFloat height = v47;
    CGRect v90 = CGRectUnion(v89, v99);
    CGFloat v52 = v90.origin.x;
    CGFloat v53 = v90.origin.y;
    CGFloat v54 = v90.size.width;
    CGFloat v55 = v90.size.height;
    CGFloat v56 = CGRectGetWidth(v90) * 0.5;
    v91.origin.CGFloat x = v52;
    v91.origin.CGFloat y = v53;
    v91.size.CGFloat width = v54;
    v91.size.CGFloat height = v55;
    CGRectDivide(v91, &remainder, &slice, v56, CGRectMinXEdge);
    CGSize v57 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v82.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v82.CGSize size = v57;
    if (a3)
    {
LABEL_8:
      CGSize size = remainder.size;
      a3->origin = remainder.origin;
      a3->CGSize size = size;
    }
  }
  if (a4)
  {
    CGSize v80 = slice.size;
    a4->origin = slice.origin;
    a4->CGSize size = v80;
  }
  if (a5)
  {
    CGSize v81 = v82.size;
    a5->origin = v82.origin;
    a5->CGSize size = v81;
  }
}

- (int64_t)_inputScopeForPointerLocation:(CGPoint)a3
{
  if (self->_currentState - 2 > 7) {
    return 1;
  }
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  memset(&v8, 0, sizeof(v8));
  memset(&v7, 0, sizeof(v7));
  memset(&v6, 0, sizeof(v6));
  [(_UIDatePickerCompactTimeLabel *)self _expandedComponentRectForHours:&v8 minuteRect:&v7 timeOfDayRect:&v6];
  v9.CGFloat x = x;
  v9.CGFloat y = y;
  if (CGRectContainsPoint(v8, v9)) {
    return 2;
  }
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  if (CGRectContainsPoint(v7, v10)) {
    return 3;
  }
  v11.CGFloat x = x;
  v11.CGFloat y = y;
  if (CGRectContainsPoint(v6, v11)) {
    return 4;
  }
  else {
    return 0;
  }
}

- (id)_viewForInputScope:(int64_t)a3
{
  if (a3 == 4)
  {
    BOOL v3 = [(_UIDatePickerCompactTimeLabel *)self timeOfDayLabel];
  }
  else if (a3 == 3)
  {
    BOOL v3 = [(_UIDatePickerCompactTimeLabel *)self minuteLabel];
  }
  else
  {
    if (a3 == 2) {
      [(_UIDatePickerCompactTimeLabel *)self hourLabel];
    }
    else {
    BOOL v3 = [(_UIDatePickerCompactTimeLabel *)self label];
    }
  }
  return v3;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a4;
  if ([v6 _pointerType] == 1)
  {
    CGRect v7 = [(_UIDatePickerCompactTimeLabel *)self label];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    double v16 = @"UIDatePicker.time.all.pencil";
LABEL_10:
    double v24 = v9;
    double v25 = v11;
    double v26 = v13;
    double v27 = v15;
LABEL_11:
    CGFloat v28 = +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v16, v24, v25, v26, v27, v30, v31);
    goto LABEL_12;
  }
  if (self->_currentState - 2 >= 8)
  {
    CGFloat v19 = [(_UIDatePickerCompactTimeLabel *)self label];
    [v19 frame];
    double v9 = v20;
    double v11 = v21;
    double v13 = v22;
    double v15 = v23;

    double v16 = @"UIDatePicker.time.all";
    goto LABEL_10;
  }
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    [v6 location];
    int64_t v17 = -[_UIDatePickerCompactTimeLabel _inputScopeForPointerLocation:](self, "_inputScopeForPointerLocation:");
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v30 = *MEMORY[0x1E4F1DB28];
    long long v31 = v18;
    switch(v17)
    {
      case 4:
        [(_UIDatePickerCompactTimeLabel *)self _expandedComponentRectForHours:0 minuteRect:0 timeOfDayRect:&v30];
        double v16 = @"UIDatePicker.time.timeOfDay";
        goto LABEL_18;
      case 3:
        [(_UIDatePickerCompactTimeLabel *)self _expandedComponentRectForHours:0 minuteRect:&v30 timeOfDayRect:0];
        double v16 = @"UIDatePicker.time.minute";
        goto LABEL_18;
      case 2:
        [(_UIDatePickerCompactTimeLabel *)self _expandedComponentRectForHours:&v30 minuteRect:0 timeOfDayRect:0];
        double v16 = @"UIDatePicker.time.hour";
LABEL_18:
        double v25 = *((double *)&v30 + 1);
        double v24 = *(double *)&v30;
        double v27 = *((double *)&v31 + 1);
        double v26 = *(double *)&v31;
        goto LABEL_11;
    }
  }
  CGFloat v28 = 0;
LABEL_12:

  return v28;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a4;
  id v6 = [v5 identifier];
  int v7 = [v6 isEqual:@"UIDatePicker.time.all"];

  if (v7)
  {
    uint64_t v8 = [(_UIDatePickerCompactTimeLabel *)self label];
LABEL_9:
    double v15 = (_UIDatePickerCompactTimeLabel *)v8;
    double v16 = [[UITargetedPreview alloc] initWithView:v8];
    int64_t v17 = +[UIPointerEffect effectWithPreview:v16];
    [(UIView *)v15 frame];
    CGRect v41 = CGRectInset(v40, -4.0, -4.0);
    double x = v41.origin.x;
    double y = v41.origin.y;
    double width = v41.size.width;
    double height = v41.size.height;
LABEL_10:

    double v22 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", x, y, width, height, 4.0);
    double v23 = +[UIPointerStyle styleWithEffect:v17 shape:v22];

    goto LABEL_11;
  }
  double v9 = [v5 identifier];
  int v10 = [v9 isEqual:@"UIDatePicker.time.hour"];

  if (v10)
  {
    uint64_t v8 = [(_UIDatePickerCompactTimeLabel *)self hourLabel];
    goto LABEL_9;
  }
  double v11 = [v5 identifier];
  int v12 = [v11 isEqual:@"UIDatePicker.time.minute"];

  if (v12)
  {
    uint64_t v8 = [(_UIDatePickerCompactTimeLabel *)self minuteLabel];
    goto LABEL_9;
  }
  double v13 = [v5 identifier];
  int v14 = [v13 isEqual:@"UIDatePicker.time.timeOfDay"];

  if (v14)
  {
    uint64_t v8 = [(_UIDatePickerCompactTimeLabel *)self timeOfDayLabel];
    goto LABEL_9;
  }
  double v25 = [v5 identifier];
  int v26 = [v25 isEqual:@"UIDatePicker.time.all.pencil"];

  if (v26)
  {
    double v15 = self;
    double v16 = (UITargetedPreview *)objc_opt_new();
    [(UIView *)v15 bounds];
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    CGFloat v35 = [(UIView *)v15 layer];
    [v35 cornerRadius];
    double v37 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v28, v30, v32, v34, v36);
    [(UITargetedPreview *)v16 setShadowPath:v37];

    v38 = [[UITargetedPreview alloc] initWithView:v15 parameters:v16];
    int64_t v17 = +[UIPointerEffect effectWithPreview:v38];
    [(UIView *)v15 frame];
    CGRect v43 = CGRectInset(v42, 5.0, 5.0);
    double x = v43.origin.x;
    double y = v43.origin.y;
    double width = v43.size.width;
    double height = v43.size.height;

    goto LABEL_10;
  }
  double v23 = 0;
LABEL_11:

  return v23;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v15 = a4;
  id v6 = [v15 identifier];
  char v7 = [v6 isEqual:@"UIDatePicker.time.all"];

  if (v7)
  {
    int64_t v8 = 1;
  }
  else
  {
    double v9 = [v15 identifier];
    char v10 = [v9 isEqual:@"UIDatePicker.time.hour"];

    if (v10)
    {
      int64_t v8 = 2;
    }
    else
    {
      double v11 = [v15 identifier];
      char v12 = [v11 isEqual:@"UIDatePicker.time.minute"];

      if (v12)
      {
        int64_t v8 = 3;
      }
      else
      {
        double v13 = [v15 identifier];
        int v14 = [v13 isEqual:@"UIDatePicker.time.timeOfDay"];

        if (!v14) {
          goto LABEL_10;
        }
        int64_t v8 = 4;
      }
    }
  }
  self->_int64_t highlightedScope = v8;
LABEL_10:
  [(_UIDatePickerCompactTimeLabel *)self pushCurrentStateIntoUI];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  self->_int64_t highlightedScope = 1;
  [(_UIDatePickerCompactTimeLabel *)self pushCurrentStateIntoUI];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (_UIDatePickerCompactTimeLabelDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);
  return (_UIDatePickerCompactTimeLabelDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (_UIDatePickerOverlayPresentation)overlayPresentation
{
  return self->_overlayPresentation;
}

- (void)setOverlayPresentation:(id)a3
{
}

- (_UIDatePickerCalendarTime)selectedTime
{
  return self->_selectedTime;
}

- (BOOL)tapInteractionControlledExternally
{
  return self->_tapInteractionControlledExternally;
}

- (void)setTapInteractionControlledExternally:(BOOL)a3
{
  self->_tapInteractionControlledExternalldouble y = a3;
}

- (NSDictionary)overrideAttributes
{
  return self->_overrideAttributes;
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (UILabel)label
{
  return self->_label;
}

- (UILabel)hourLabel
{
  return self->_hourLabel;
}

- (UILabel)minuteLabel
{
  return self->_minuteLabel;
}

- (UILabel)timeOfDayLabel
{
  return self->_timeOfDayLabel;
}

- (UIButton)backgroundView
{
  return self->_backgroundView;
}

- (UIView)inputBackgroundView
{
  return self->_inputBackgroundView;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (_UIPassthroughScrollInteraction)passthroughInteraction
{
  return self->_passthroughInteraction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passthroughInteraction, 0);
  objc_storeStrong((id *)&self->_inputBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_timeOfDayLabel, 0);
  objc_storeStrong((id *)&self->_minuteLabel, 0);
  objc_storeStrong((id *)&self->_hourLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_overrideAttributes, 0);
  objc_storeStrong((id *)&self->_selectedTime, 0);
  objc_storeStrong((id *)&self->_overlayPresentation, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_destroyWeak((id *)&self->_touchHighlightedView);
  objc_storeStrong((id *)&self->_textContentStorage, 0);
  objc_storeStrong((id *)&self->_textLayoutController, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
}

@end