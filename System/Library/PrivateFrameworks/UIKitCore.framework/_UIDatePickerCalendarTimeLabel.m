@interface _UIDatePickerCalendarTimeLabel
+ (BOOL)supportsScribbleInteraction;
- (BOOL)_canChangeFirstResponder:(id)a3 toResponder:(id)a4;
- (BOOL)_digits:(unint64_t *)a3 fromText:(id)a4 count:(int64_t *)a5;
- (BOOL)_pointIsInsideHourSide:(CGPoint)a3;
- (BOOL)_suppressSoftwareKeyboard;
- (BOOL)_treatMinutesAsHoursForState:(unint64_t)a3;
- (BOOL)allowsTextInput;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)displaysTimeOfDayLabel;
- (BOOL)hasText;
- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4;
- (BOOL)indirectScribbleInteraction:(id)a3 shouldDelayFocusForElement:(id)a4;
- (BOOL)isSingleLineDocument;
- (BOOL)processTapOutside;
- (BOOL)resignFirstResponder;
- (BOOL)roundsToMinuteInterval;
- (BOOL)scribbleInteractionIsActive;
- (CGRect)hourRect;
- (CGRect)minuteRect;
- (CGRect)timeOfDayRect;
- (NSAttributedString)attributedText;
- (NSNumberFormatter)inputFormatter;
- (NSString)hourText;
- (NSString)minuteText;
- (NSString)text;
- (NSString)timeOfDayText;
- (UIFont)font;
- (_UIDatePickerCalendarTimeFormat)timeFormat;
- (_UIDatePickerCalendarTimeLabel)initWithFrame:(CGRect)a3;
- (_UIDatePickerCalendarTimeLabel)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4;
- (_UIDatePickerCalendarTimeLabelDelegate)delegate;
- (_UIDatePickerCalendarTimeLabelStateMachineContext)stateContext;
- (_UIDatePickerCalendarTimeValueStore)inputValue;
- (id)attributedTextWithRanges:(id *)a3;
- (id)inputView;
- (id)keyCommands;
- (int64_t)decrementBehaviour;
- (int64_t)editingInteractionConfiguration;
- (int64_t)inputScope;
- (int64_t)keyboardType;
- (int64_t)minuteInterval;
- (unint64_t)insertedDigitCount;
- (void)_resetTextInput;
- (void)_roundInputToClosestIntervalIfNeeded;
- (void)_stateMachineSendEvent:(unint64_t)a3;
- (void)_uiTest_becomeFirstResponder;
- (void)_uiTest_resignFirstResponder;
- (void)applyTextAttributesForState:(unint64_t)a3 inputScope:(int64_t)a4 updater:(id)a5;
- (void)beginEditingWheels;
- (void)deleteBackward;
- (void)didReceiveDownArrowKey:(id)a3;
- (void)didReceiveLeftArrowKey:(id)a3;
- (void)didReceiveRightArrowKey:(id)a3;
- (void)didReceiveUpArrowKey:(id)a3;
- (void)didTapInputLabelAtLocation:(CGPoint)a3;
- (void)endEditingWheels;
- (void)indirectScribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4;
- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6;
- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)indirectScribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)insertText:(id)a3;
- (void)layoutSubviews;
- (void)pushCurrentStateIntoUIAndNotify;
- (void)setAllowsTextInput:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setHourText:(id)a3;
- (void)setInputFormatter:(id)a3;
- (void)setInputScope:(int64_t)a3;
- (void)setInsertedDigitCount:(unint64_t)a3;
- (void)setMinuteInterval:(int64_t)a3;
- (void)setMinuteText:(id)a3;
- (void)setRoundsToMinuteInterval:(BOOL)a3;
- (void)setTimeFormat:(id)a3;
- (void)stateMachineUpdateFromState:(unint64_t)a3 toState:(unint64_t)a4;
- (void)tintColorDidChange;
- (void)wheelChanged;
@end

@implementation _UIDatePickerCalendarTimeLabel

- (_UIDatePickerCalendarTimeLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  v10 = +[_UIDatePickerCalendarTimeFormat formatWithCalendar:v8 locale:v9 followsSystemHourCycle:1];
  v11 = [(_UIDatePickerCalendarTimeLabel *)self initWithTimeFormat:v10 minuteInterval:1];

  if (v11) {
    -[UIView setFrame:](v11, "setFrame:", x, y, width, height);
  }
  return v11;
}

- (_UIDatePickerCalendarTimeLabel)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4
{
  id v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_UIDatePickerCalendarTimeLabel;
  v8 = -[UIView initWithFrame:](&v26, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v9 = v8;
  if (v8)
  {
    [(UIView *)v8 setUserInteractionEnabled:1];
    [(UIView *)v9 setFocusEffect:0];
    objc_initWeak(&location, v9);
    v10 = [_UIDatePickerCalendarTimeLabelStateMachineContext alloc];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __68___UIDatePickerCalendarTimeLabel_initWithTimeFormat_minuteInterval___block_invoke;
    v23 = &unk_1E52DC218;
    objc_copyWeak(&v24, &location);
    uint64_t v11 = [(_UIDatePickerCalendarTimeLabelStateMachineContext *)v10 initWithUpdateHandler:&v20];
    stateContext = v9->_stateContext;
    v9->_stateContext = (_UIDatePickerCalendarTimeLabelStateMachineContext *)v11;

    objc_storeStrong((id *)&v9->_timeFormat, a3);
    v13 = [_UIDatePickerCalendarTimeValueStore alloc];
    uint64_t v14 = [(_UIDatePickerCalendarTimeValueStore *)v13 initWithTimeFormat:v7 minuteInterval:a4 decrementBehaviour:[(_UIDatePickerCalendarTimeLabel *)v9 decrementBehaviour]];
    inputValue = v9->_inputValue;
    v9->_inputValue = (_UIDatePickerCalendarTimeValueStore *)v14;

    v9->_roundsToMinuteInterval = 1;
    v16 = objc_opt_new();
    [v16 setNumberStyle:1];
    objc_storeStrong((id *)&v9->_inputFormatter, v16);
    if ([(id)objc_opt_class() supportsScribbleInteraction])
    {
      v17 = [[UIIndirectScribbleInteraction alloc] initWithDelegate:v9];
      [(UIView *)v9 addInteraction:v17];
      scribbleInteraction = v9->_scribbleInteraction;
      v9->_scribbleInteraction = v17;
    }
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)_UIDatePickerCalendarTimeLabel;
  [(UIView *)&v8 layoutSubviews];
  [(UIView *)self bounds];
  if (v4 != self->_lastSize.width || v3 != self->_lastSize.height)
  {
    [(UIView *)self bounds];
    self->_lastSize.double width = v6;
    self->_lastSize.double height = v7;
    [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUI];
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  double v3 = [(_UIDatePickerCalendarTimeLabel *)self delegate];

  if (!v3) {
    return 1;
  }
  double v4 = [(_UIDatePickerCalendarTimeLabel *)self delegate];
  char v5 = [v4 timeLabelCanBecomeFirstResponder:self];

  return v5;
}

- (int64_t)editingInteractionConfiguration
{
  return 0;
}

- (void)_uiTest_becomeFirstResponder
{
}

- (void)_uiTest_resignFirstResponder
{
}

- (BOOL)becomeFirstResponder
{
  double v3 = [(_UIDatePickerCalendarTimeLabel *)self delegate];
  [v3 timeLabelWillBecomeFirstResponder:self];
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerCalendarTimeLabel;
  if ([(UIView *)&v7 becomeFirstResponder]) {
    [(_UIDatePickerCalendarTimeLabel *)self _stateMachineSendEvent:11];
  }
  BOOL v4 = [(UIView *)self isFirstResponder];
  if (v4)
  {
    char v5 = [(_UIDatePickerCalendarTimeLabel *)self stateContext];
    [v5 setIsFirstResponder:1];

    [v3 timeLabelDidBecomeFirstResponder:self];
  }
  else
  {
    [v3 timeLabelDidFailToBecomeFirstResponder:self];
  }

  return v4;
}

- (BOOL)resignFirstResponder
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDatePickerCalendarTimeLabel;
  [(UIResponder *)&v7 resignFirstResponder];
  [(_UIDatePickerCalendarTimeLabel *)self _stateMachineSendEvent:12];
  BOOL v3 = [(UIView *)self isFirstResponder];
  if (!v3)
  {
    BOOL v4 = [(_UIDatePickerCalendarTimeLabel *)self stateContext];
    [v4 setIsFirstResponder:0];

    char v5 = [(_UIDatePickerCalendarTimeLabel *)self delegate];
    [v5 timeLabelDidResignFirstResponder:self];
  }
  return !v3;
}

- (CGRect)hourRect
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)minuteRect
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerCalendarTimeLabel;
  [(UIView *)&v3 tintColorDidChange];
  [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUI];
}

- (BOOL)_pointIsInsideHourSide:(CGPoint)a3
{
  double x = a3.x;
  [(_UIDatePickerCalendarTimeLabel *)self hourRect];
  double v6 = v5;
  [(_UIDatePickerCalendarTimeLabel *)self minuteRect];
  if (v6 >= v7)
  {
    [(_UIDatePickerCalendarTimeLabel *)self minuteRect];
    double MaxX = CGRectGetMaxX(v13);
    [(_UIDatePickerCalendarTimeLabel *)self hourRect];
    return x >= (MaxX + CGRectGetMinX(v14)) * 0.5;
  }
  else
  {
    [(_UIDatePickerCalendarTimeLabel *)self hourRect];
    double v8 = CGRectGetMaxX(v11);
    [(_UIDatePickerCalendarTimeLabel *)self minuteRect];
    return x < (v8 + CGRectGetMinX(v12)) * 0.5;
  }
}

- (void)didTapInputLabelAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(UIView *)self isFirstResponder])
  {
    if (!-[_UIDatePickerCalendarTimeLabel _pointIsInsideHourSide:](self, "_pointIsInsideHourSide:", x, y)) {
      goto LABEL_8;
    }
LABEL_7:
    double v6 = self;
    uint64_t v7 = 2;
    goto LABEL_9;
  }
  [(_UIDatePickerCalendarTimeLabel *)self hourRect];
  v9.double x = x;
  v9.double y = y;
  if (CGRectContainsPoint(v12, v9)) {
    goto LABEL_7;
  }
  [(_UIDatePickerCalendarTimeLabel *)self minuteRect];
  v10.double x = x;
  v10.double y = y;
  if (CGRectContainsPoint(v13, v10))
  {
LABEL_8:
    double v6 = self;
    uint64_t v7 = 3;
    goto LABEL_9;
  }
  [(_UIDatePickerCalendarTimeLabel *)self timeOfDayRect];
  v11.double x = x;
  v11.double y = y;
  if (CGRectContainsPoint(v14, v11))
  {
    double v6 = self;
    uint64_t v7 = 4;
LABEL_9:
    [(_UIDatePickerCalendarTimeLabel *)v6 _stateMachineSendEvent:v7];
    return;
  }
  [(_UIDatePickerCalendarTimeLabel *)self processTapOutside];
}

- (UIFont)font
{
  return 0;
}

- (NSString)text
{
  objc_super v3 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  double v4 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  uint64_t v5 = [v4 hourValue];
  double v6 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  uint64_t v7 = [v6 minuteValue];
  double v8 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  CGPoint v9 = objc_msgSend(v3, "localizedTimeStringWithHours:minutes:isPM:", v5, v7, objc_msgSend(v8, "isPM"));

  return (NSString *)v9;
}

- (void)applyTextAttributesForState:(unint64_t)a3 inputScope:(int64_t)a4 updater:(id)a5
{
  v15 = a5;
  double v8 = [(UIView *)self traitCollection];
  CGPoint v9 = +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", [v8 userInterfaceIdiom]);

  if (a3 == 9)
  {
    CGPoint v10 = [v9 compactLabelTextColorForEditingState:0];
    CGPoint v11 = [v10 colorWithAlphaComponent:0.25];
    CGRect v12 = (void (*)(void))v15[2];
LABEL_3:
    v12();
  }
  else
  {
    switch([(_UIDatePickerCalendarTimeLabel *)self inputScope])
    {
      case 0:
        CGRect v13 = v9;
        uint64_t v14 = 0;
        goto LABEL_8;
      case 1:
        CGRect v13 = v9;
        uint64_t v14 = 1;
LABEL_8:
        CGPoint v10 = [v13 compactLabelTextColorForEditingState:v14];
        ((void (*)(void *, void *, void, void, void))v15[2])(v15, v10, 0, 0, 0);
        break;
      case 2:
      case 3:
        CGPoint v10 = [v9 compactLabelTextColorForEditingState:0];
        CGPoint v11 = [v9 compactLabelTextColorForEditingState:1];
        CGRect v12 = (void (*)(void))v15[2];
        goto LABEL_3;
      default:
        CGPoint v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2 object:self file:@"_UIDatePickerCalendarTimeLabel.m" lineNumber:290 description:@"Unknown case."];
        break;
    }
  }
}

- (id)attributedTextWithRanges:(id *)a3
{
  _NSRange v44 = (_NSRange)0;
  _NSRange v45 = (_NSRange)0;
  _NSRange v42 = (_NSRange)0;
  _NSRange v43 = (_NSRange)0;
  uint64_t v5 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  double v6 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  uint64_t v7 = [v6 hourValue];
  double v8 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  uint64_t v9 = [v8 minuteValue];
  CGPoint v10 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  CGPoint v11 = objc_msgSend(v5, "localizedTimeStringWithHours:minutes:isPM:ranges:", v7, v9, objc_msgSend(v10, "isPM"), &v42);

  uint64_t v12 = [v11 length];
  uint64_t v13 = [(_UIDatePickerCalendarTimeLabel *)self insertedDigitCount];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v11];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___UIDatePickerCalendarTimeLabel_attributedTextWithRanges___block_invoke;
  aBlock[3] = &unk_1E52DC240;
  id v40 = v11;
  id v15 = v14;
  id v41 = v15;
  id v16 = v11;
  v17 = (void (**)(void *, uint64_t, NSUInteger, NSUInteger))_Block_copy(aBlock);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __59___UIDatePickerCalendarTimeLabel_attributedTextWithRanges___block_invoke_2;
  v31[3] = &unk_1E52DC268;
  id v18 = v15;
  id v32 = v18;
  uint64_t v33 = 0;
  uint64_t v34 = v12;
  _NSRange v35 = v42;
  _NSRange v36 = v43;
  _NSRange v37 = v44;
  _NSRange v38 = v45;
  v19 = _Block_copy(v31);
  uint64_t v20 = [(_UIDatePickerCalendarTimeLabel *)self stateContext];
  -[_UIDatePickerCalendarTimeLabel applyTextAttributesForState:inputScope:updater:](self, "applyTextAttributesForState:inputScope:updater:", [v20 currentState], -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"), v19);

  if (v13 >= 1)
  {
    int64_t v21 = [(_UIDatePickerCalendarTimeLabel *)self inputScope];
    switch(v21)
    {
      case 3:
        v17[2](v17, v13, v43.location, v43.length);
        break;
      case 2:
        v17[2](v17, v13, v42.location, v42.length);
        break;
      case 1:
        v17[2](v17, v13, v43.location, v43.length);
        if ((unint64_t)v13 >= 2) {
          uint64_t v22 = v13 - 2;
        }
        else {
          uint64_t v22 = 0;
        }
        v17[2](v17, v22, v42.location, v42.length);
        break;
    }
  }
  v23 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  if ([v23 wantsDoubleDigitHours]) {
    goto LABEL_16;
  }
  id v24 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  if (([v24 forceDoubleDigitHours] & 1) == 0)
  {

LABEL_16:
    goto LABEL_17;
  }
  v25 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  unint64_t v26 = [v25 hourValue];

  if (v26 <= 9) {
    v17[2](v17, 1, v42.location, v42.length);
  }
LABEL_17:
  if (a3)
  {
    _NSRange v27 = v43;
    a3->var0 = v42;
    a3->var1 = v27;
    _NSRange v28 = v45;
    a3->var2 = v44;
    a3->var3 = v28;
  }
  id v29 = v18;

  return v29;
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)[(_UIDatePickerCalendarTimeLabel *)self attributedTextWithRanges:0];
}

- (void)setTimeFormat:(id)a3
{
  double v8 = (_UIDatePickerCalendarTimeFormat *)a3;
  if (self->_timeFormat != v8)
  {
    objc_storeStrong((id *)&self->_timeFormat, a3);
    unint64_t v5 = [(_UIDatePickerCalendarTimeValueStore *)self->_inputValue digitsInScope:1];
    double v6 = [[_UIDatePickerCalendarTimeValueStore alloc] initWithTimeFormat:v8 minuteInterval:[(_UIDatePickerCalendarTimeLabel *)self minuteInterval] decrementBehaviour:[(_UIDatePickerCalendarTimeLabel *)self decrementBehaviour]];
    [(_UIDatePickerCalendarTimeValueStore *)v6 setDigits:v5 count:0 inScope:1 append:0];
    [(_UIDatePickerCalendarTimeValueStore *)v6 setIsPM:[(_UIDatePickerCalendarTimeValueStore *)self->_inputValue isPM]];
    inputValue = self->_inputValue;
    self->_inputValue = v6;

    [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUI];
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (int64_t)minuteInterval
{
  double v2 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  int64_t v3 = [v2 minuteInterval];

  return v3;
}

- (void)setMinuteInterval:(int64_t)a3
{
  unint64_t v5 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  [v5 setMinuteInterval:a3];

  [(_UIDatePickerCalendarTimeLabel *)self _roundInputToClosestIntervalIfNeeded];
}

- (int64_t)decrementBehaviour
{
  return 0;
}

- (void)setInputScope:(int64_t)a3
{
  if (self->_inputScope != a3)
  {
    self->_inputScope = a3;
    [(_UIDatePickerCalendarTimeLabel *)self _resetTextInput];
    [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUI];
  }
}

- (void)setAllowsTextInput:(BOOL)a3
{
  if (self->_allowsTextInput != a3)
  {
    self->_allowsTextInput = a3;
    [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUI];
  }
}

- (void)setInsertedDigitCount:(unint64_t)a3
{
  unint64_t v5 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  unint64_t v6 = objc_msgSend(v5, "digitsInScope:", -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"));

  unint64_t v7 = 0;
  do
  {
    ++v7;
    BOOL v8 = v6 > 9;
    v6 /= 0xAuLL;
  }
  while (v8);
  switch([(_UIDatePickerCalendarTimeLabel *)self inputScope])
  {
    case 0:
    case 1:
      uint64_t v9 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
      int v10 = [v9 wantsDoubleDigitHours];

      BOOL v11 = v10 == 0;
      unint64_t v12 = 3;
      goto LABEL_7;
    case 2:
      uint64_t v13 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
      int v14 = [v13 wantsDoubleDigitHours];

      BOOL v11 = v14 == 0;
      unint64_t v12 = 1;
LABEL_7:
      if (!v11) {
        ++v12;
      }
      break;
    case 3:
      unint64_t v12 = 2;
      break;
    case 4:
      unint64_t v12 = 1;
      break;
    default:
      unint64_t v12 = 0;
      break;
  }
  if (v7 > v12) {
    unint64_t v12 = v7;
  }
  if (v12 >= a3) {
    unint64_t v12 = a3;
  }
  self->_insertedDigitCount = v12;
}

- (BOOL)processTapOutside
{
  int64_t v3 = [(_UIDatePickerCalendarTimeLabel *)self stateContext];
  double v4 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  char v5 = [v3 currentSateCanTransitionWithEvents:v4];

  [(_UIDatePickerCalendarTimeLabel *)self _stateMachineSendEvent:0];
  return v5;
}

- (void)_stateMachineSendEvent:(unint64_t)a3
{
  id v6 = [(_UIDatePickerCalendarTimeLabel *)self stateContext];
  char v5 = (uint64_t *)[v6 currentStateRef];
  handleEvent(_UIDatePickerCalendarTimeLabelStateMachineSpec, *v5, a3, (uint64_t)[(_UIDatePickerCalendarTimeLabel *)self stateContext], v5);
}

- (void)stateMachineUpdateFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  BOOL v7 = -[_UIDatePickerCalendarTimeLabel _treatMinutesAsHoursForState:](self, "_treatMinutesAsHoursForState:");
  switch(a4)
  {
    case 1uLL:
      BOOL v8 = self;
      uint64_t v9 = 0;
      goto LABEL_7;
    case 2uLL:
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
      BOOL v8 = self;
      uint64_t v9 = 1;
      goto LABEL_7;
    case 3uLL:
    case 7uLL:
      BOOL v8 = self;
      uint64_t v9 = 2;
      goto LABEL_7;
    case 4uLL:
    case 8uLL:
      BOOL v8 = self;
      uint64_t v9 = 3;
      goto LABEL_7;
    case 5uLL:
      BOOL v8 = self;
      uint64_t v9 = 4;
LABEL_7:
      [(_UIDatePickerCalendarTimeLabel *)v8 setInputScope:v9];
      break;
    case 0xBuLL:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"_UIDatePickerCalendarTimeLabelStateCount should never be reached. This is a UIKit bug."];
      break;
    default:
      break;
  }
  if (a3 != a4)
  {
    [(_UIDatePickerCalendarTimeLabel *)self _resetTextInput];
    BOOL v10 = a4 == 1 && v7;
    if (v10
      && ![(_UIDatePickerCalendarTimeLabel *)self _treatMinutesAsHoursForState:1])
    {
      BOOL v11 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
      uint64_t v12 = [v11 minuteValue];
      uint64_t v13 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
      [v13 setHourValue:v12];

      int v14 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
      [v14 setMinuteValue:0];
    }
    unint64_t v15 = a4 - 2;
    if (a3 - 2 >= 8)
    {
      if (v15 <= 7)
      {
        id v16 = [(_UIDatePickerCalendarTimeLabel *)self delegate];
        [v16 timeLabelDidBeginEditing:self];
        goto LABEL_20;
      }
    }
    else if (v15 >= 8)
    {
      [(_UIDatePickerCalendarTimeLabel *)self _roundInputToClosestIntervalIfNeeded];
      id v16 = [(_UIDatePickerCalendarTimeLabel *)self delegate];
      [v16 timeLabelDidEndEditing:self];
LABEL_20:
    }
  }
  id v19 = (id)objc_opt_new();
  [v19 addIndex:8];
  [v19 addIndex:1];
  v17 = [(_UIDatePickerCalendarTimeLabel *)self stateContext];
  uint64_t v18 = [v17 currentSateCanTransitionWithEvents:v19];

  [(_UIDatePickerCalendarTimeLabel *)self setAllowsTextInput:v18];
  if (v18 && ![(UIView *)self isFirstResponder])
  {
    [(_UIDatePickerCalendarTimeLabel *)self becomeFirstResponder];
  }
  else if ((a4 == 10 || a4 == 1) && [(UIView *)self isFirstResponder])
  {
    [(_UIDatePickerCalendarTimeLabel *)self resignFirstResponder];
  }
  [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUI];
}

- (void)setRoundsToMinuteInterval:(BOOL)a3
{
  if (self->_roundsToMinuteInterval != a3)
  {
    self->_roundsToMinuteInterval = a3;
    [(_UIDatePickerCalendarTimeLabel *)self _roundInputToClosestIntervalIfNeeded];
  }
}

- (void)_roundInputToClosestIntervalIfNeeded
{
  if ([(_UIDatePickerCalendarTimeLabel *)self roundsToMinuteInterval])
  {
    int64_t v3 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
    int v4 = [v3 roundToMinuteInterval];

    if (v4)
    {
      char v5 = [(UIView *)self window];

      if (v5)
      {
        [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUIAndNotify];
      }
      else
      {
        [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUI];
      }
    }
  }
}

- (void)beginEditingWheels
{
}

- (void)wheelChanged
{
}

- (void)endEditingWheels
{
}

- (BOOL)_digits:(unint64_t *)a3 fromText:(id)a4 count:(int64_t *)a5
{
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  id v10 = v8;
  BOOL v11 = [v9 invertedSet];
  uint64_t v12 = [v10 rangeOfCharacterFromSet:v11];
  int v14 = v10;
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = v12;
    id v16 = v10;
    do
    {
      int v14 = objc_msgSend(v16, "stringByReplacingCharactersInRange:withString:", v15, v13, &stru_1ED0E84C0);

      uint64_t v15 = [v14 rangeOfCharacterFromSet:v11];
      id v16 = v14;
    }
    while (v15 != 0x7FFFFFFFFFFFFFFFLL);
  }

  if (a5)
  {
    id v17 = v14;
    int64_t v18 = 0;
    if ([v17 length])
    {
      uint64_t v19 = 0;
      do
      {
        ++v18;
        uint64_t v20 = [v17 rangeOfComposedCharacterSequenceAtIndex:v19];
        uint64_t v19 = v20 + v21;
      }
      while (v20 + v21 < (unint64_t)[v17 length]);
    }

    *a5 = v18;
  }
  uint64_t v22 = [v14 length];
  if (v22)
  {
    v23 = [(_UIDatePickerCalendarTimeLabel *)self inputFormatter];
    id v24 = [v23 numberFromString:v14];
    *a3 = [v24 unsignedIntegerValue];
  }
  return v22 != 0;
}

- (BOOL)_treatMinutesAsHoursForState:(unint64_t)a3
{
  if ((a3 == 9 || a3 == 6)
    && [(_UIDatePickerCalendarTimeLabel *)self insertedDigitCount] <= 2
    && [(_UIDatePickerCalendarTimeLabel *)self insertedDigitCount])
  {
    int v4 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
    unint64_t v5 = [v4 minuteValue];

    id v6 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
    unint64_t v7 = [v6 clock];

    char v8 = v5 < 0xD;
    if (v7 > 1) {
      char v8 = v7 - 2;
    }
    if (v7 - 2 >= 2) {
      return v8;
    }
    else {
      return v5 < 0x19;
    }
  }
  else
  {
    return 0;
  }
}

- (void)setHourText:(id)a3
{
  id v4 = a3;
  if ([(UIView *)self isFirstResponder])
  {
    if (os_variant_has_internal_diagnostics())
    {
      char v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)BOOL v11 = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Externally modifying the hourText value of _UIDatePickerCalendarTimeLabel while it is first responder results in undefined behavior. This will become a hard assert in the future.", v11, 2u);
      }
    }
    else
    {
      unint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setHourText____s_category) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Externally modifying the hourText value of _UIDatePickerCalendarTimeLabel while it is first responder results in undefined behavior. This will become a hard assert in the future.", buf, 2u);
      }
    }
  }
  uint64_t v9 = 0;
  if ([(_UIDatePickerCalendarTimeLabel *)self _digits:&v9 fromText:v4 count:0])
  {
    uint64_t v5 = v9;
    id v6 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
    [v6 setHourValue:v5];

    [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUI];
  }
}

- (NSString)hourText
{
  int64_t v3 = [(_UIDatePickerCalendarTimeLabel *)self stateContext];
  BOOL v4 = -[_UIDatePickerCalendarTimeLabel _treatMinutesAsHoursForState:](self, "_treatMinutesAsHoursForState:", [v3 currentState]);
  uint64_t v5 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  id v6 = v5;
  if (v4) {
    uint64_t v7 = [v5 minuteValue];
  }
  else {
    uint64_t v7 = [v5 hourValue];
  }
  uint64_t v8 = v7;

  uint64_t v9 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  id v10 = [v9 hourFormatter];
  BOOL v11 = [NSNumber numberWithUnsignedInteger:v8];
  uint64_t v12 = [v10 stringFromNumber:v11];

  return (NSString *)v12;
}

- (void)setMinuteText:(id)a3
{
  id v4 = a3;
  if ([(UIView *)self isFirstResponder])
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)BOOL v11 = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Externally modifying the minuteText value of _UIDatePickerCalendarTimeLabel while it is first responder results in undefined behavior. This will become a hard assert in the future.", v11, 2u);
      }
    }
    else
    {
      uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setMinuteText____s_category) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Externally modifying the minuteText value of _UIDatePickerCalendarTimeLabel while it is first responder results in undefined behavior. This will become a hard assert in the future.", buf, 2u);
      }
    }
  }
  uint64_t v9 = 0;
  if ([(_UIDatePickerCalendarTimeLabel *)self _digits:&v9 fromText:v4 count:0])
  {
    uint64_t v5 = v9;
    id v6 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
    [v6 setMinuteValue:v5];

    [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUI];
  }
}

- (NSString)minuteText
{
  int64_t v3 = [(_UIDatePickerCalendarTimeLabel *)self stateContext];
  if (-[_UIDatePickerCalendarTimeLabel _treatMinutesAsHoursForState:](self, "_treatMinutesAsHoursForState:", [v3 currentState]))
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
    uint64_t v4 = [v5 minuteValue];
  }
  id v6 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  uint64_t v7 = [v6 minuteFormatter];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v4];
  uint64_t v9 = [v7 stringFromNumber:v8];

  return (NSString *)v9;
}

- (NSString)timeOfDayText
{
  int64_t v3 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
  uint64_t v4 = [v3 clockLayout];

  if (v4)
  {
    uint64_t v5 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
    char v6 = [v5 isPM];
    uint64_t v7 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
    uint64_t v8 = v7;
    if (v6) {
      [v7 PMSymbol];
    }
    else {
    uint64_t v9 = [v7 AMSymbol];
    }
  }
  else
  {
    uint64_t v9 = &stru_1ED0E84C0;
  }
  return (NSString *)v9;
}

- (void)pushCurrentStateIntoUIAndNotify
{
  [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUI];
  id v4 = [(_UIDatePickerCalendarTimeLabel *)self delegate];
  int64_t v3 = [(_UIDatePickerCalendarTimeLabel *)self text];
  [v4 timeLabel:self didUpdateText:v3];
}

- (void)_resetTextInput
{
}

- (BOOL)displaysTimeOfDayLabel
{
  return 1;
}

- (id)keyCommands
{
  v18[4] = *MEMORY[0x1E4F143B8];
  double v2 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputUpArrow" modifierFlags:0 action:sel_didReceiveUpArrowKey_];
  v18[0] = v2;
  int64_t v3 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputDownArrow" modifierFlags:0 action:sel_didReceiveDownArrowKey_];
  v18[1] = v3;
  id v4 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputLeftArrow" modifierFlags:0 action:sel_didReceiveLeftArrowKey_];
  v18[2] = v4;
  uint64_t v5 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputRightArrow" modifierFlags:0 action:sel_didReceiveRightArrowKey_];
  v18[3] = v5;
  char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "setWantsPriorityOverSystemBehavior:", 1, (void)v13);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  return v7;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_didReceiveLeftArrowKey_ == a3 || sel_didReceiveRightArrowKey_ == a3)
  {
    unsigned __int8 v8 = 1;
  }
  else if (sel_didReceiveUpArrowKey_ == a3 || sel_didReceiveDownArrowKey_ == a3)
  {
    unsigned __int8 v8 = (unint64_t)[(_UIDatePickerCalendarTimeLabel *)self inputScope] > 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)_UIDatePickerCalendarTimeLabel;
    unsigned __int8 v8 = [(UIView *)&v11 canPerformAction:a3 withSender:v6];
  }

  return v8;
}

- (void)didReceiveUpArrowKey:(id)a3
{
  id v4 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  objc_msgSend(v4, "incrementDigitForScope:", -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"));

  [(_UIDatePickerCalendarTimeLabel *)self _resetTextInput];
  [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUIAndNotify];
}

- (void)didReceiveDownArrowKey:(id)a3
{
  id v4 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
  objc_msgSend(v4, "decrementDigitForScope:", -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"));

  [(_UIDatePickerCalendarTimeLabel *)self _resetTextInput];
  [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUIAndNotify];
}

- (void)didReceiveRightArrowKey:(id)a3
{
  int64_t v4 = [(_UIDatePickerCalendarTimeLabel *)self inputScope];
  if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4 == 4)
    {
      if ([(_UIDatePickerCalendarTimeLabel *)self displaysTimeOfDayLabel])
      {
        unsigned __int8 v8 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
        uint64_t v9 = [v8 clockLayout];

        if (v9 == 2)
        {
          uint64_t v7 = 2;
          goto LABEL_12;
        }
      }
    }
    else
    {
      if (v4 != 3) {
        return;
      }
      if (![(_UIDatePickerCalendarTimeLabel *)self displaysTimeOfDayLabel]) {
        goto LABEL_6;
      }
      uint64_t v5 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
      uint64_t v6 = [v5 clockLayout];

      if (v6 != 1) {
        goto LABEL_6;
      }
    }
    uint64_t v7 = 4;
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v7 = 3;
LABEL_12:
  [(_UIDatePickerCalendarTimeLabel *)self _stateMachineSendEvent:v7];
}

- (void)didReceiveLeftArrowKey:(id)a3
{
  int64_t v4 = [(_UIDatePickerCalendarTimeLabel *)self inputScope];
  uint64_t v5 = 2;
  switch(v4)
  {
    case 1:
    case 3:
      goto LABEL_9;
    case 2:
      if ([(_UIDatePickerCalendarTimeLabel *)self displaysTimeOfDayLabel])
      {
        uint64_t v6 = [(_UIDatePickerCalendarTimeLabel *)self timeFormat];
        uint64_t v7 = [v6 clockLayout];

        if (v7 == 2) {
          goto LABEL_8;
        }
      }
      uint64_t v5 = 2;
      goto LABEL_9;
    case 4:
      if ([(_UIDatePickerCalendarTimeLabel *)self displaysTimeOfDayLabel]
        && ([(_UIDatePickerCalendarTimeLabel *)self timeFormat],
            unsigned __int8 v8 = objc_claimAutoreleasedReturnValue(),
            uint64_t v9 = [v8 clockLayout],
            v8,
            v9 == 1))
      {
        uint64_t v5 = 3;
      }
      else
      {
LABEL_8:
        uint64_t v5 = 4;
      }
LABEL_9:
      [(_UIDatePickerCalendarTimeLabel *)self _stateMachineSendEvent:v5];
      break;
    default:
      return;
  }
}

- (int64_t)keyboardType
{
  int64_t v3 = [(_UIDatePickerCalendarTimeLabel *)self delegate];
  int64_t v4 = [v3 keyboardTypeForTimeLabel:self];

  return v4;
}

- (BOOL)_suppressSoftwareKeyboard
{
  int64_t v3 = [(_UIDatePickerCalendarTimeLabel *)self delegate];
  if ([v3 timeLabelShouldSuppressSoftwareKeyboard:self])
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIDatePickerCalendarTimeLabel;
    BOOL v4 = [(UIResponder *)&v6 _suppressSoftwareKeyboard];
  }

  return v4;
}

- (id)inputView
{
  if ([(_UIDatePickerCalendarTimeLabel *)self _suppressSoftwareKeyboard])
  {
    inputView = self->_inputView;
    if (!inputView)
    {
      BOOL v4 = (UIView *)objc_opt_new();
      uint64_t v5 = self->_inputView;
      self->_inputView = v4;

      -[UIView setFrame:](self->_inputView, "setFrame:", 0.0, 0.0, 1.0, 1.0);
      inputView = self->_inputView;
    }
    objc_super v6 = inputView;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIDatePickerCalendarTimeLabel;
    objc_super v6 = [(UIResponder *)&v8 inputView];
  }
  return v6;
}

- (BOOL)hasText
{
  return 1;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_UIDatePickerCalendarTimeLabel *)self stateContext];
  uint64_t v6 = [v5 currentState];

  if ([(_UIDatePickerCalendarTimeLabel *)self allowsTextInput] || v6 == 9)
  {
    uint64_t v7 = [(_UIDatePickerCalendarTimeLabel *)self delegate];
    if (v7)
    {
      objc_super v8 = [(_UIDatePickerCalendarTimeLabel *)self delegate];
      char v9 = [v8 timeLabel:self didReceiveText:v4];

      if (v9) {
        goto LABEL_16;
      }
    }
    if ([v4 length] == 1)
    {
      uint64_t v10 = [v4 characterAtIndex:0];
      objc_super v11 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      if ([v11 characterIsMember:v10])
      {
        [(_UIDatePickerCalendarTimeLabel *)self _stateMachineSendEvent:1];

LABEL_16:
        goto LABEL_17;
      }
    }
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    if ([(_UIDatePickerCalendarTimeLabel *)self _digits:&v17 fromText:v4 count:&v16])
    {
      if (v6 == 9) {
        uint64_t v12 = 9;
      }
      else {
        uint64_t v12 = 8;
      }
      [(_UIDatePickerCalendarTimeLabel *)self _stateMachineSendEvent:v12];
      if ([(_UIDatePickerCalendarTimeLabel *)self allowsTextInput] || v6 == 9)
      {
        BOOL v13 = [(_UIDatePickerCalendarTimeLabel *)self insertedDigitCount] != 0;
        long long v14 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
        objc_msgSend(v14, "setDigits:count:inScope:append:", v17, v16, -[_UIDatePickerCalendarTimeLabel inputScope](self, "inputScope"), v13);

        unint64_t v15 = [(_UIDatePickerCalendarTimeLabel *)self insertedDigitCount];
        [(_UIDatePickerCalendarTimeLabel *)self setInsertedDigitCount:v16 + v15];
        [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUIAndNotify];
      }
    }
    goto LABEL_16;
  }
LABEL_17:
}

- (void)deleteBackward
{
  [(_UIDatePickerCalendarTimeLabel *)self _stateMachineSendEvent:8];
  if ([(_UIDatePickerCalendarTimeLabel *)self allowsTextInput])
  {
    int64_t v3 = [(_UIDatePickerCalendarTimeLabel *)self inputScope];
    if (![(_UIDatePickerCalendarTimeLabel *)self insertedDigitCount])
    {
      id v4 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
      unint64_t v5 = [v4 digitsInScope:v3];

      uint64_t v6 = 0;
      do
      {
        ++v6;
        BOOL v7 = v5 > 9;
        v5 /= 0xAuLL;
      }
      while (v7);
      [(_UIDatePickerCalendarTimeLabel *)self setInsertedDigitCount:v6];
    }
    objc_super v8 = [(_UIDatePickerCalendarTimeLabel *)self inputValue];
    [v8 removeLastDigitInScope:v3];

    if ([(_UIDatePickerCalendarTimeLabel *)self insertedDigitCount]) {
      [(_UIDatePickerCalendarTimeLabel *)self setInsertedDigitCount:[(_UIDatePickerCalendarTimeLabel *)self insertedDigitCount] - 1];
    }
    [(_UIDatePickerCalendarTimeLabel *)self pushCurrentStateIntoUIAndNotify];
  }
}

- (BOOL)isSingleLineDocument
{
  return 1;
}

+ (BOOL)supportsScribbleInteraction
{
  return 1;
}

- (BOOL)scribbleInteractionIsActive
{
  return [(UIIndirectScribbleInteraction *)self->_scribbleInteraction isHandlingWriting];
}

- (void)indirectScribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  BOOL v7 = (void (**)(void))a5;
  uint64_t v6 = [(_UIDatePickerCalendarTimeLabel *)self stateContext];
  [v6 currentState];

  v7[2]();
}

- (BOOL)indirectScribbleInteraction:(id)a3 isElementFocused:(id)a4
{
  return [(UIView *)self->_hiddenField isFirstResponder];
}

- (void)indirectScribbleInteraction:(id)a3 focusElementIfNeeded:(id)a4 referencePoint:(CGPoint)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, UITextField *))a6;
  hiddenField = self->_hiddenField;
  if (!hiddenField)
  {
    uint64_t v12 = [UITextField alloc];
    [(UIView *)self bounds];
    BOOL v13 = -[UITextField initWithFrame:](v12, "initWithFrame:");
    long long v14 = self->_hiddenField;
    self->_hiddenField = v13;

    [(UITextField *)self->_hiddenField setKeyboardType:[(_UIDatePickerCalendarTimeLabel *)self keyboardType]];
    [(UIView *)self->_hiddenField setHidden:1];
    [(UIView *)self addSubview:self->_hiddenField];
    hiddenField = self->_hiddenField;
  }
  if ([(UITextField *)hiddenField becomeFirstResponder]) {
    unint64_t v15 = self->_hiddenField;
  }
  else {
    unint64_t v15 = 0;
  }
  v10[2](v10, v15);
}

- (BOOL)indirectScribbleInteraction:(id)a3 shouldDelayFocusForElement:(id)a4
{
  return 1;
}

- (void)indirectScribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  -[UITextField setAttributedText:](self->_hiddenField, "setAttributedText:", 0, a4);
  [(_UIDatePickerCalendarTimeLabel *)self _stateMachineSendEvent:9];
  [(_UIDatePickerCalendarTimeLabel *)self willBeginWritingInScribbleInteraction];
}

- (void)indirectScribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  id v10 = [(UITextField *)self->_hiddenField text];
  if ([v10 length])
  {
    uint64_t v5 = 0;
    unsigned int v6 = 1;
    do
    {
      BOOL v7 = objc_msgSend(v10, "substringWithRange:", v5, 1);
      [(_UIDatePickerCalendarTimeLabel *)self insertText:v7];

      uint64_t v5 = v6;
    }
    while ([v10 length] > (unint64_t)v6++);
  }
  [(UITextField *)self->_hiddenField resignFirstResponder];
  [(UITextField *)self->_hiddenField removeFromSuperview];
  hiddenField = self->_hiddenField;
  self->_hiddenField = 0;

  [(_UIDatePickerCalendarTimeLabel *)self _stateMachineSendEvent:10];
}

- (BOOL)_canChangeFirstResponder:(id)a3 toResponder:(id)a4
{
  return a4 != self || self->_hiddenField != a3;
}

- (_UIDatePickerCalendarTimeFormat)timeFormat
{
  return self->_timeFormat;
}

- (BOOL)roundsToMinuteInterval
{
  return self->_roundsToMinuteInterval;
}

- (_UIDatePickerCalendarTimeLabelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDatePickerCalendarTimeLabelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UIDatePickerCalendarTimeValueStore)inputValue
{
  return self->_inputValue;
}

- (BOOL)allowsTextInput
{
  return self->_allowsTextInput;
}

- (unint64_t)insertedDigitCount
{
  return self->_insertedDigitCount;
}

- (_UIDatePickerCalendarTimeLabelStateMachineContext)stateContext
{
  return self->_stateContext;
}

- (int64_t)inputScope
{
  return self->_inputScope;
}

- (NSNumberFormatter)inputFormatter
{
  return self->_inputFormatter;
}

- (void)setInputFormatter:(id)a3
{
}

- (CGRect)timeOfDayRect
{
  double x = self->_timeOfDayRect.origin.x;
  double y = self->_timeOfDayRect.origin.y;
  double width = self->_timeOfDayRect.size.width;
  double height = self->_timeOfDayRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputFormatter, 0);
  objc_storeStrong((id *)&self->_stateContext, 0);
  objc_storeStrong((id *)&self->_inputValue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timeFormat, 0);
  objc_storeStrong((id *)&self->_inputView, 0);
  objc_storeStrong((id *)&self->_hiddenField, 0);
  objc_storeStrong((id *)&self->_scribbleInteraction, 0);
}

@end