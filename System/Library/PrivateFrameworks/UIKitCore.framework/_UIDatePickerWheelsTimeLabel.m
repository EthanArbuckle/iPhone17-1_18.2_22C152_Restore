@interface _UIDatePickerWheelsTimeLabel
+ (BOOL)supportsScribbleInteraction;
- (BOOL)_treatMinutesAsHoursForState:(unint64_t)a3;
- (BOOL)displaysTimeOfDayLabel;
- (BOOL)wheelsActive;
- (CGRect)combinedTextRectFromLabels;
- (CGRect)hourRect;
- (CGRect)minuteRect;
- (UILabel)hourLabel;
- (UILabel)minuteLabel;
- (UILabel)timeSeparatorLabel;
- (UIView)contentView;
- (_UIControlEventsGestureRecognizer)controlEventsGestureRecognizer;
- (_UIDatePickerWheelsTimeLabel)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4;
- (_UIDatePickerWheelsTimeLabelDelegate)wheelsDelegate;
- (id)_viewForHighlightedTouchAtPoint:(CGPoint)a3;
- (id)font;
- (int64_t)decrementBehaviour;
- (void)beginEditingWheels;
- (void)configureLabelsForHour:(id *)a3 minute:(id *)a4;
- (void)controlEventsGestureRecognizer:(id)a3 recognizedControlEvent:(unint64_t)a4 withEvent:(id)a5;
- (void)endEditingWheels;
- (void)pushCurrentStateIntoUI;
- (void)setContentHidden:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setHighlightedForTouch:(BOOL)a3;
- (void)setWheelsActive:(BOOL)a3;
- (void)setWheelsDelegate:(id)a3;
- (void)stateMachineUpdateFromState:(unint64_t)a3 toState:(unint64_t)a4;
- (void)updateHoursFromDatePicker:(int64_t)a3 wheelsChanged:(BOOL)a4;
- (void)updateMinutesFromDatePicker:(int64_t)a3 wheelsChanged:(BOOL)a4;
- (void)willBeginWritingInScribbleInteraction;
@end

@implementation _UIDatePickerWheelsTimeLabel

+ (BOOL)supportsScribbleInteraction
{
  return 0;
}

- (_UIDatePickerWheelsTimeLabel)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4
{
  v30.receiver = self;
  v30.super_class = (Class)_UIDatePickerWheelsTimeLabel;
  v4 = [(_UIDatePickerCalendarTimeLabel *)&v30 initWithTimeFormat:a3 minuteInterval:a4];
  if (v4)
  {
    v5 = (UIView *)objc_opt_new();
    [(UIView *)v4 bounds];
    -[UIView setFrame:](v5, "setFrame:");
    [(UIView *)v5 setUserInteractionEnabled:0];
    [(UIView *)v5 setAutoresizingMask:18];
    [(UIView *)v4 addSubview:v5];
    contentView = v4->_contentView;
    v4->_contentView = v5;
    v7 = v5;

    v8 = (UILabel *)objc_opt_new();
    [(UILabel *)v8 setTextAlignment:2];
    [(UILabel *)v8 setAdjustsFontForContentSizeCategory:1];
    v9 = +[UIColor labelColor];
    [(UILabel *)v8 setTextColor:v9];

    -[UILabel setShadowOffset:](v8, "setShadowOffset:", 0.0, 1.0);
    v10 = +[UIColor clearColor];
    [(UILabel *)v8 setShadowColor:v10];

    [(UIView *)v8 setHidden:1];
    [(UIView *)v7 addSubview:v8];
    hourLabel = v4->_hourLabel;
    v4->_hourLabel = v8;
    v12 = v8;

    v13 = (UILabel *)objc_opt_new();
    [(UILabel *)v13 setTextAlignment:1];
    [(UILabel *)v13 setAdjustsFontForContentSizeCategory:1];
    v14 = +[UIColor labelColor];
    [(UILabel *)v13 setTextColor:v14];

    -[UILabel setShadowOffset:](v13, "setShadowOffset:", 0.0, 1.0);
    v15 = +[UIColor clearColor];
    [(UILabel *)v13 setShadowColor:v15];

    [(UIView *)v13 setHidden:1];
    [(UIView *)v7 addSubview:v13];
    minuteLabel = v4->_minuteLabel;
    v4->_minuteLabel = v13;
    v17 = v13;

    v18 = (UILabel *)objc_opt_new();
    [(UILabel *)v18 setTextAlignment:1];
    [(UILabel *)v18 setAdjustsFontForContentSizeCategory:1];
    v19 = +[UIColor labelColor];
    [(UILabel *)v18 setTextColor:v19];

    [(UIView *)v18 setAlpha:0.0];
    [(UIView *)v18 sizeToFit];
    [(UIView *)v7 addSubview:v18];
    timeSeparatorLabel = v4->_timeSeparatorLabel;
    v4->_timeSeparatorLabel = v18;
    v21 = v18;

    v22 = (UILabel *)objc_opt_new();
    [(UILabel *)v22 setText:@"00"];
    -[UILabel setShadowOffset:](v22, "setShadowOffset:", 0.0, 1.0);
    v23 = +[UIColor clearColor];
    [(UILabel *)v22 setShadowColor:v23];

    [(UIView *)v22 setHidden:1];
    measurementLabel = v4->_measurementLabel;
    v4->_measurementLabel = v22;
    v25 = v22;

    uint64_t v26 = objc_opt_new();
    controlEventsGestureRecognizer = v4->_controlEventsGestureRecognizer;
    v4->_controlEventsGestureRecognizer = (_UIControlEventsGestureRecognizer *)v26;

    [(_UIControlEventsGestureRecognizer *)v4->_controlEventsGestureRecognizer setControlEventsDelegate:v4];
    v28 = [(UIView *)v4 layer];
    [v28 setHitTestsAsOpaque:1];
  }
  return v4;
}

- (int64_t)decrementBehaviour
{
  return 1;
}

- (void)controlEventsGestureRecognizer:(id)a3 recognizedControlEvent:(unint64_t)a4 withEvent:(id)a5
{
  id v17 = a3;
  v7 = [(_UIDatePickerWheelsTimeLabel *)self wheelsDelegate];
  int v8 = [v7 wheelsTimeLabelShouldReceiveInteraction:self];

  v9 = v17;
  if (v8)
  {
    [v17 locationInView:self];
    double v12 = v10;
    double v13 = v11;
    if ((uint64_t)a4 <= 63)
    {
      if (a4 == 1)
      {
        v16 = -[_UIDatePickerWheelsTimeLabel _viewForHighlightedTouchAtPoint:](self, "_viewForHighlightedTouchAtPoint:", v10, v11);
        objc_storeWeak((id *)&self->_touchHighlightedView, v16);

        [(_UIDatePickerWheelsTimeLabel *)self setContentHidden:0];
      }
      else if (a4 != 16)
      {
        v9 = v17;
        if (a4 != 32) {
          goto LABEL_16;
        }
        v14 = self;
        uint64_t v15 = 0;
        goto LABEL_13;
      }
      v14 = self;
      uint64_t v15 = 1;
LABEL_13:
      [(_UIDatePickerWheelsTimeLabel *)v14 setHighlightedForTouch:v15];
      goto LABEL_15;
    }
    if (a4 == 64)
    {
      [(_UIDatePickerWheelsTimeLabel *)self setHighlightedForTouch:0];
      -[_UIDatePickerCalendarTimeLabel didTapInputLabelAtLocation:](self, "didTapInputLabelAtLocation:", v12, v13);
      goto LABEL_15;
    }
    v9 = v17;
    if (a4 == 128 || a4 == 256)
    {
      [(_UIDatePickerWheelsTimeLabel *)self setHighlightedForTouch:0];
      objc_storeWeak((id *)&self->_touchHighlightedView, 0);
      [(_UIDatePickerWheelsTimeLabel *)self setContentHidden:1];
LABEL_15:
      v9 = v17;
    }
  }
LABEL_16:
}

- (void)setHighlightedForTouch:(BOOL)a3
{
  if (self->_highlightedForTouch != a3)
  {
    BOOL v3 = a3;
    self->_highlightedForTouch = a3;
    id v4 = objc_loadWeakRetained((id *)&self->_touchHighlightedView);
    v5 = [v4 traitCollection];
    BOOL v6 = [v5 userInterfaceStyle] == 2;

    double v7 = dbl_186B935B0[v6];
    v9[1] = 3221225472;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[2] = ___UIDateLabelAnimateHighlight_block_invoke_1;
    v9[3] = &unk_1E52D9CD0;
    if (!v3) {
      double v7 = 1.0;
    }
    id v10 = v4;
    double v11 = v7;
    id v8 = v4;
    +[UIView animateWithDuration:327684 delay:v9 options:0 animations:0.47 completion:0.0];
  }
}

- (id)_viewForHighlightedTouchAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (![(_UIDatePickerCalendarTimeLabel *)self inputScope]) {
    goto LABEL_6;
  }
  BOOL v6 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  [v6 frame];
  v13.CGFloat x = x;
  v13.CGFloat y = y;
  BOOL v7 = CGRectContainsPoint(v15, v13);

  if (v7)
  {
    id v8 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
    goto LABEL_7;
  }
  v9 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
  [v9 frame];
  v14.CGFloat x = x;
  v14.CGFloat y = y;
  BOOL v10 = CGRectContainsPoint(v16, v14);

  if (v10)
  {
    id v8 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
  }
  else
  {
LABEL_6:
    id v8 = [(_UIDatePickerWheelsTimeLabel *)self contentView];
  }
LABEL_7:
  return v8;
}

- (void)setContentHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  int v6 = [v5 isHidden];

  if (v6 != v3)
  {
    BOOL v7 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
    [v7 setHidden:v3];

    id v8 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
    [v8 setHidden:v3];

    double v9 = 0.1;
    if (v3) {
      double v9 = 0.14;
    }
    double v10 = 0.12;
    if (v3) {
      double v10 = 0.0;
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49___UIDatePickerWheelsTimeLabel_setContentHidden___block_invoke;
    v12[3] = &unk_1E52D9FC0;
    v12[4] = self;
    BOOL v13 = v3;
    +[UIView animateWithDuration:4 delay:v12 options:0 animations:v9 completion:v10];
    double v11 = [(_UIDatePickerWheelsTimeLabel *)self wheelsDelegate];
    [v11 wheelsTimeLabel:self didChangeVisibility:v3 ^ 1];
  }
}

- (void)setFont:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  [v5 setFont:v4];

  int v6 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
  [v6 setFont:v4];

  BOOL v7 = [v4 fontDescriptor];
  uint64_t v18 = *(void *)off_1E52D6B70;
  uint64_t v8 = *(void *)off_1E52D6BA0;
  v15[0] = *(void *)off_1E52D6BA8;
  v15[1] = v8;
  v16[0] = &unk_1ED3F6C90;
  v16[1] = &unk_1ED3F6CA8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  id v17 = v9;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v19[0] = v10;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  double v12 = [v7 fontDescriptorByAddingAttributes:v11];

  BOOL v13 = [off_1E52D39B8 fontWithDescriptor:v12 size:0.0];

  CGPoint v14 = [(_UIDatePickerWheelsTimeLabel *)self timeSeparatorLabel];
  [v14 setFont:v13];

  [(UILabel *)self->_measurementLabel setFont:v4];
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (id)font
{
  v2 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  BOOL v3 = [v2 font];

  return v3;
}

- (CGRect)hourRect
{
  v2 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)minuteRect
{
  v2 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)pushCurrentStateIntoUI
{
  long long v64 = 0u;
  memset(v63, 0, sizeof(v63));
  double v3 = [(_UIDatePickerCalendarTimeLabel *)self attributedTextWithRanges:v63];
  double v4 = [v3 attributedSubstringFromRange:v64];
  double v5 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  [v5 setAttributedText:v4];

  double v6 = [v3 attributedSubstringFromRange:v63[1]];
  double v7 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
  [v7 setAttributedText:v6];

  double v8 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  [(UIView *)self bounds];
  double x = self->_hoursReferenceFrame.origin.x;
  double y = self->_hoursReferenceFrame.origin.y;
  double width = self->_hoursReferenceFrame.size.width;
  double height = self->_hoursReferenceFrame.size.height;
  objc_msgSend(v8, "textRectForBounds:limitedToNumberOfLines:", 1);
  double v14 = fmax(width, v13);

  CGRect v15 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
  [(UIView *)self bounds];
  double v16 = self->_minutesReferenceFrame.origin.y;
  double v17 = self->_minutesReferenceFrame.size.width;
  double v18 = self->_minutesReferenceFrame.size.height;
  objc_msgSend(v15, "textRectForBounds:limitedToNumberOfLines:", 1);
  double v20 = fmax(v17, v19);

  v21 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  objc_msgSend(v21, "setFrame:", x, y, v14, height);

  double v22 = round(self->_minutesReferenceFrame.origin.x + (self->_minutesReferenceFrame.size.width - v20) * 0.5);
  v23 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
  objc_msgSend(v23, "setFrame:", v22, v16, v20, v18);

  uint64_t v24 = v64;
  if ((unint64_t)v64 >= *(void *)&v63[1]) {
    v25 = (char *)&v63[1] + 8;
  }
  else {
    v25 = (char *)&v64 + 8;
  }
  uint64_t v26 = *(void *)v25;
  if ((unint64_t)v64 >= *(void *)&v63[1]) {
    uint64_t v27 = *(void *)&v63[1];
  }
  else {
    uint64_t v27 = v64;
  }
  if ((unint64_t)v64 <= *(void *)&v63[1]) {
    uint64_t v24 = *(void *)&v63[1];
  }
  v28 = objc_msgSend(v3, "attributedSubstringFromRange:", v26 + v27, v24 - (v26 + v27));
  v29 = [(_UIDatePickerWheelsTimeLabel *)self timeSeparatorLabel];
  [v29 setAttributedText:v28];

  objc_super v30 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  [v30 frame];
  double MinX = CGRectGetMinX(v65);
  v32 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
  [v32 frame];
  double v33 = CGRectGetMinX(v66);

  if (MinX < v33)
  {
    v43 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
    [v43 frame];
    CGFloat v36 = v44;
    CGFloat v38 = v45;
    CGFloat v40 = v46;
    CGFloat v42 = v47;

    [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
  }
  else
  {
    v34 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
    [v34 frame];
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;

    [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  v48 = };
  [v48 frame];
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  CGFloat v54 = v53;
  CGFloat v56 = v55;

  v67.origin.double x = v36;
  v67.origin.double y = v38;
  v67.size.double width = v40;
  v67.size.double height = v42;
  double MaxX = CGRectGetMaxX(v67);
  v68.origin.double x = v36;
  v68.origin.double y = v38;
  v68.size.double width = v40;
  v68.size.double height = v42;
  double MinY = CGRectGetMinY(v68);
  v69.origin.double x = v50;
  v69.origin.double y = v52;
  v69.size.double width = v54;
  v69.size.double height = v56;
  double v57 = CGRectGetMinX(v69);
  v70.origin.double x = v36;
  v70.origin.double y = v38;
  v70.size.double width = v40;
  v70.size.double height = v42;
  double v58 = v57 - CGRectGetMaxX(v70);
  v71.origin.double x = v36;
  v71.origin.double y = v38;
  v71.size.double width = v40;
  v71.size.double height = v42;
  double v59 = CGRectGetHeight(v71);
  v60 = [(_UIDatePickerWheelsTimeLabel *)self timeSeparatorLabel];
  objc_msgSend(v60, "setFrame:", MaxX, MinY, v58, v59);
}

- (BOOL)displaysTimeOfDayLabel
{
  return 0;
}

- (void)stateMachineUpdateFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDatePickerWheelsTimeLabel;
  -[_UIDatePickerCalendarTimeLabel stateMachineUpdateFromState:toState:](&v6, sel_stateMachineUpdateFromState_toState_, a3);
  [(_UIDatePickerWheelsTimeLabel *)self setContentHidden:a4 - 10 < 0xFFFFFFFFFFFFFFF8];
}

- (void)beginEditingWheels
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerWheelsTimeLabel;
  [(_UIDatePickerCalendarTimeLabel *)&v3 beginEditingWheels];
  [(_UIDatePickerWheelsTimeLabel *)self setWheelsActive:1];
}

- (void)endEditingWheels
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerWheelsTimeLabel;
  [(_UIDatePickerCalendarTimeLabel *)&v3 endEditingWheels];
  [(_UIDatePickerWheelsTimeLabel *)self setWheelsActive:0];
}

- (void)updateHoursFromDatePicker:(int64_t)a3 wheelsChanged:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  uint64_t v8 = [v7 clock];

  if (v8)
  {
    if (v8 == 3)
    {
      if (!a3) {
        a3 = 24;
      }
    }
    else if (v8 == 1)
    {
      int64_t v9 = a3 % 0xCuLL;
      if (a3 <= 11) {
        int64_t v9 = a3;
      }
      if (v9) {
        a3 = v9;
      }
      else {
        a3 = 12;
      }
    }
  }
  else if (a3 >= 12)
  {
    a3 %= 0xCuLL;
  }
  double v10 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  [v10 setHourValue:a3];

  if (v4)
  {
    [(_UIDatePickerCalendarTimeLabel *)self wheelChanged];
  }
  else
  {
    [(_UIDatePickerWheelsTimeLabel *)self pushCurrentStateIntoUI];
  }
}

- (void)updateMinutesFromDatePicker:(int64_t)a3 wheelsChanged:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  [v7 setMinuteValue:a3];

  if (v4)
  {
    [(_UIDatePickerCalendarTimeLabel *)self wheelChanged];
  }
  else
  {
    [(_UIDatePickerWheelsTimeLabel *)self pushCurrentStateIntoUI];
  }
}

- (BOOL)_treatMinutesAsHoursForState:(unint64_t)a3
{
  return 0;
}

- (void)willBeginWritingInScribbleInteraction
{
  objc_super v3 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  [v3 setAttributedText:0];

  id v4 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
  [v4 setAttributedText:0];
}

- (void)configureLabelsForHour:(id *)a3 minute:(id *)a4
{
  int64_t var2 = a3->var2;
  uint64_t v8 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  [v8 setTextAlignment:var2];

  measurementLabel = self->_measurementLabel;
  [(UIView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  CGFloat v17 = v16;
  [(UIView *)self _currentScreenScale];
  $A7DAFEFF4FDF007120A996603470390F v37 = *a3;
  self->_hoursReferenceFrame.origin.double x = _labelFrame(measurementLabel, (uint64_t)&v37, v11, v13, v15, v17, v18);
  self->_hoursReferenceFrame.origin.double y = v19;
  self->_hoursReferenceFrame.size.double width = v20;
  self->_hoursReferenceFrame.size.double height = v21;
  int64_t v22 = a4->var2;
  v23 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
  [v23 setTextAlignment:v22];

  uint64_t v24 = self->_measurementLabel;
  [(UIView *)self bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  CGFloat v32 = v31;
  [(UIView *)self _currentScreenScale];
  $A7DAFEFF4FDF007120A996603470390F v37 = *a4;
  self->_minutesReferenceFrame.origin.double x = _labelFrame(v24, (uint64_t)&v37, v26, v28, v30, v32, v33);
  self->_minutesReferenceFrame.origin.double y = v34;
  self->_minutesReferenceFrame.size.double width = v35;
  self->_minutesReferenceFrame.size.double height = v36;
  [(_UIDatePickerWheelsTimeLabel *)self pushCurrentStateIntoUI];
}

- (CGRect)combinedTextRectFromLabels
{
  objc_super v3 = [(_UIDatePickerWheelsTimeLabel *)self hourLabel];
  [(UIView *)self bounds];
  CGFloat x = self->_hoursReferenceFrame.origin.x;
  CGFloat y = self->_hoursReferenceFrame.origin.y;
  double width = self->_hoursReferenceFrame.size.width;
  CGFloat height = self->_hoursReferenceFrame.size.height;
  objc_msgSend(v3, "textRectForBounds:limitedToNumberOfLines:", 1);
  double v9 = fmax(width, v8);

  double v10 = [(_UIDatePickerWheelsTimeLabel *)self minuteLabel];
  [(UIView *)self bounds];
  CGFloat v11 = self->_minutesReferenceFrame.origin.x;
  CGFloat v12 = self->_minutesReferenceFrame.origin.y;
  double v14 = self->_minutesReferenceFrame.size.width;
  CGFloat v13 = self->_minutesReferenceFrame.size.height;
  objc_msgSend(v10, "textRectForBounds:limitedToNumberOfLines:", 1);
  double v16 = fmax(v14, v15);

  CGFloat v17 = x;
  CGFloat v18 = y;
  double v19 = v9;
  CGFloat v20 = height;
  CGFloat v21 = v11;
  CGFloat v22 = v12;
  double v23 = v16;
  CGFloat v24 = v13;
  return CGRectUnion(*(CGRect *)&v17, *(CGRect *)&v21);
}

- (_UIControlEventsGestureRecognizer)controlEventsGestureRecognizer
{
  return self->_controlEventsGestureRecognizer;
}

- (_UIDatePickerWheelsTimeLabelDelegate)wheelsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wheelsDelegate);
  return (_UIDatePickerWheelsTimeLabelDelegate *)WeakRetained;
}

- (void)setWheelsDelegate:(id)a3
{
}

- (BOOL)wheelsActive
{
  return self->_wheelsActive;
}

- (void)setWheelsActive:(BOOL)a3
{
  self->_wheelsActive = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UILabel)hourLabel
{
  return self->_hourLabel;
}

- (UILabel)minuteLabel
{
  return self->_minuteLabel;
}

- (UILabel)timeSeparatorLabel
{
  return self->_timeSeparatorLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeSeparatorLabel, 0);
  objc_storeStrong((id *)&self->_minuteLabel, 0);
  objc_storeStrong((id *)&self->_hourLabel, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_destroyWeak((id *)&self->_wheelsDelegate);
  objc_storeStrong((id *)&self->_controlEventsGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_touchHighlightedView);
  objc_storeStrong((id *)&self->_measurementLabel, 0);
}

@end