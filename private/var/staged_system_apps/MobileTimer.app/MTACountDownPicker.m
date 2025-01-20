@interface MTACountDownPicker
- (BOOL)becomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)decrementValue;
- (BOOL)incrementValue;
- (BOOL)resignFirstResponder;
- (BOOL)showText;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)underEditing;
- (BOOL)usesSmallSize;
- (CAShapeLayer)highlightLayer;
- (CGRect)caretRectForPosition:(id)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)hourHighlightFrame;
- (CGRect)minuteHighlightFrame;
- (CGRect)secondHighlightFrame;
- (CGRect)textRectForBounds:(CGRect)a3;
- (MTACountDownPicker)initWithFrame:(CGRect)a3;
- (NSDateComponentsFormatter)formatter;
- (double)duration;
- (double)hourMidX;
- (double)minuteMidX;
- (double)secondMidX;
- (id)selectionRectsForRange:(id)a3;
- (int64_t)selectedField;
- (void)activateNextKeyField;
- (void)activatePreviousKeyField;
- (void)decrementValueContinuouslly;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)endEditing;
- (void)incrementValueContinuouslly;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)recognizeTapGesture:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFormatter:(id)a3;
- (void)setHighlightLayer:(id)a3;
- (void)setHourHighlightFrame:(CGRect)a3;
- (void)setHourMidX:(double)a3;
- (void)setMinuteHighlightFrame:(CGRect)a3;
- (void)setMinuteMidX:(double)a3;
- (void)setSecondHighlightFrame:(CGRect)a3;
- (void)setSecondMidX:(double)a3;
- (void)setSelectedField:(int64_t)a3;
- (void)setShowText:(BOOL)a3;
- (void)setUnderEditing:(BOOL)a3;
- (void)setUsesSmallSize:(BOOL)a3;
- (void)startEditing;
- (void)updateHighlightPath;
@end

@implementation MTACountDownPicker

- (MTACountDownPicker)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)MTACountDownPicker;
  v3 = -[MTACountDownPicker initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v21.receiver = v3;
    v21.super_class = (Class)MTACountDownPicker;
    [(MTACountDownPicker *)&v21 setBorderStyle:3];
    v5 = +[MTAUtilities thinG2MonospacedDigitFontWithSize:100.0];
    v20.receiver = v4;
    v20.super_class = (Class)MTACountDownPicker;
    [(MTACountDownPicker *)&v20 setFont:v5];

    v19.receiver = v4;
    v19.super_class = (Class)MTACountDownPicker;
    [(MTACountDownPicker *)&v19 setTextAlignment:1];
    v18.receiver = v4;
    v18.super_class = (Class)MTACountDownPicker;
    [(MTACountDownPicker *)&v18 setFocusEffect:0];
    v17.receiver = v4;
    v17.super_class = (Class)MTACountDownPicker;
    [(MTACountDownPicker *)&v17 setDelegate:v4];
    v16.receiver = v4;
    v16.super_class = (Class)MTACountDownPicker;
    [(MTACountDownPicker *)&v16 setKeyboardType:4];
    uint64_t v6 = +[CAShapeLayer layer];
    highlightLayer = v4->_highlightLayer;
    v4->_highlightLayer = (CAShapeLayer *)v6;

    v15.receiver = v4;
    v15.super_class = (Class)MTACountDownPicker;
    v8 = [(MTACountDownPicker *)&v15 layer];
    [v8 addSublayer:v4->_highlightLayer];

    v9 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
    formatter = v4->_formatter;
    v4->_formatter = v9;

    [(NSDateComponentsFormatter *)v4->_formatter setUnitsStyle:0];
    [(NSDateComponentsFormatter *)v4->_formatter setAllowedUnits:224];
    [(NSDateComponentsFormatter *)v4->_formatter setZeroFormattingBehavior:0x10000];
    v11 = [(NSDateComponentsFormatter *)v4->_formatter stringFromTimeInterval:v4->_duration];
    v14.receiver = v4;
    v14.super_class = (Class)MTACountDownPicker;
    [(MTACountDownPicker *)&v14 setText:v11];

    v4->_selectedField = 0;
    [(MTACountDownPicker *)v4 endEditing];
    [(MTACountDownPicker *)v4 updateHighlightPath];
    v4->_underEditing = 0;
    id v12 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v4 action:"recognizeTapGesture:"];
    [(MTACountDownPicker *)v4 addGestureRecognizer:v12];
  }
  return v4;
}

- (BOOL)becomeFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)MTACountDownPicker;
  BOOL v3 = [(MTACountDownPicker *)&v5 becomeFirstResponder];
  if (v3) {
    [(MTACountDownPicker *)self setSelectedField:1];
  }
  return v3;
}

- (BOOL)resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)MTACountDownPicker;
  BOOL v3 = [(MTACountDownPicker *)&v5 resignFirstResponder];
  if (v3) {
    [(MTACountDownPicker *)self setSelectedField:0];
  }
  return v3;
}

- (CGRect)caretRectForPosition:(id)a3
{
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  CGRect v4 = CGRectInset(a3, 10.0, 10.0);

  return CGRectOffset(v4, 0.0, -2.0);
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  CGRect v4 = CGRectInset(a3, 10.0, 10.0);

  return CGRectOffset(v4, 0.0, -2.0);
}

- (id)selectionRectsForRange:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)MTACountDownPicker;
  [(MTACountDownPicker *)&v33 layoutSubviews];
  [(MTACountDownPicker *)self bounds];
  -[MTACountDownPicker editingRectForBounds:](self, "editingRectForBounds:");
  double v4 = v3;
  objc_super v5 = [(MTACountDownPicker *)self beginningOfDocument];
  uint64_t v6 = [(MTACountDownPicker *)self positionFromPosition:v5 offset:0];

  v7 = [(MTACountDownPicker *)self positionFromPosition:v6 offset:2];
  v8 = [(MTACountDownPicker *)self textRangeFromPosition:v6 toPosition:v7];
  [(MTACountDownPicker *)self firstRectForRange:v8];
  double v10 = v9;
  double v12 = v11;

  CGFloat v13 = v4 + v10;
  [(MTACountDownPicker *)self bounds];
  CGFloat v14 = CGRectGetHeight(v34) + -20.0;
  -[MTACountDownPicker setHourHighlightFrame:](self, "setHourHighlightFrame:", v13, 10.0, v12, v14);
  v35.origin.double y = 10.0;
  v35.origin.double x = v13;
  v35.size.double width = v12;
  v35.size.double height = v14;
  [(MTACountDownPicker *)self setHourMidX:CGRectGetMidX(v35)];
  objc_super v15 = [(MTACountDownPicker *)self beginningOfDocument];
  objc_super v16 = [(MTACountDownPicker *)self positionFromPosition:v15 offset:3];

  objc_super v17 = [(MTACountDownPicker *)self positionFromPosition:v16 offset:2];

  objc_super v18 = [(MTACountDownPicker *)self textRangeFromPosition:v16 toPosition:v17];
  [(MTACountDownPicker *)self firstRectForRange:v18];
  double v20 = v19;
  double v22 = v21;

  CGFloat v23 = v4 + v20;
  -[MTACountDownPicker setMinuteHighlightFrame:](self, "setMinuteHighlightFrame:", v23, 10.0, v22, v14);
  v36.origin.double y = 10.0;
  v36.origin.double x = v23;
  v36.size.double width = v22;
  v36.size.double height = v14;
  [(MTACountDownPicker *)self setMinuteMidX:CGRectGetMidX(v36)];
  v24 = [(MTACountDownPicker *)self beginningOfDocument];
  v25 = [(MTACountDownPicker *)self positionFromPosition:v24 offset:6];

  v26 = [(MTACountDownPicker *)self positionFromPosition:v25 offset:2];

  v27 = [(MTACountDownPicker *)self textRangeFromPosition:v25 toPosition:v26];
  [(MTACountDownPicker *)self firstRectForRange:v27];
  double v29 = v28;
  double v31 = v30;

  CGFloat v32 = v4 + v29;
  -[MTACountDownPicker setSecondHighlightFrame:](self, "setSecondHighlightFrame:", v32, 10.0, v31, v14);
  v37.origin.double y = 10.0;
  v37.origin.double x = v32;
  v37.size.double width = v31;
  v37.size.double height = v14;
  [(MTACountDownPicker *)self setSecondMidX:CGRectGetMidX(v37)];
  [(MTACountDownPicker *)self updateHighlightPath];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MTACountDownPicker;
  BOOL result = [(MTACountDownPicker *)&v8 canPerformAction:a3 withSender:a4];
  if ("copy:" == a3 && "paste:" == a3 && "selectAll:" == a3) {
    return 0;
  }
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTACountDownPicker;
  [(MTACountDownPicker *)&v12 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  v7 = [v6 previouslyFocusedView];
  if (v7 == self)
  {
  }
  else
  {
    objc_super v8 = v7;
    double v9 = [v6 nextFocusedView];

    if (v9 == self)
    {
      if ([v6 focusHeading] == (id)32)
      {
        double v10 = self;
        uint64_t v11 = 3;
LABEL_8:
        [(MTACountDownPicker *)v10 setSelectedField:v11];
        goto LABEL_9;
      }
      if ([v6 focusHeading] == (id)16)
      {
        double v10 = self;
        uint64_t v11 = 1;
        goto LABEL_8;
      }
    }
  }
LABEL_9:
}

- (void)setUsesSmallSize:(BOOL)a3
{
  if (self->_usesSmallSize != a3)
  {
    self->_usesSmallSize = a3;
    double v4 = 100.0;
    if (a3) {
      double v4 = 54.0;
    }
    objc_super v5 = +[MTAUtilities thinG2MonospacedDigitFontWithSize:v4];
    [(MTACountDownPicker *)self setFont:v5];

    [(MTACountDownPicker *)self setNeedsLayout];
  }
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    double v4 = 0.0;
    if (a3 >= 0.0)
    {
      double v4 = a3;
      if (a3 > 86399.0) {
        double v4 = 86399.0;
      }
    }
    self->_duration = v4;
    objc_super v5 = [(MTACountDownPicker *)self formatter];
    id v6 = [v5 stringFromTimeInterval:v4];
    v7.receiver = self;
    v7.super_class = (Class)MTACountDownPicker;
    [(MTACountDownPicker *)&v7 setText:v6];
  }
}

- (void)setShowText:(BOOL)a3
{
  if (self->_showText != a3)
  {
    BOOL v4 = a3;
    self->_showText = a3;
    if (a3)
    {
      double v3 = [(MTACountDownPicker *)self formatter];
      [(MTACountDownPicker *)self duration];
      [v3 stringFromTimeInterval:];
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = &stru_1000A2560;
    }
    v7.receiver = self;
    v7.super_class = (Class)MTACountDownPicker;
    [(MTACountDownPicker *)&v7 setText:v6];
    if (v4)
    {
    }
  }
}

- (void)setSelectedField:(int64_t)a3
{
  if (self->_selectedField != a3)
  {
    self->_selectedField = a3;
    [(MTACountDownPicker *)self endEditing];
    [(MTACountDownPicker *)self updateHighlightPath];
  }
}

- (void)updateHighlightPath
{
  int64_t v3 = [(MTACountDownPicker *)self selectedField];
  switch(v3)
  {
    case 3:
      [(MTACountDownPicker *)self secondHighlightFrame];
      break;
    case 2:
      [(MTACountDownPicker *)self minuteHighlightFrame];
      break;
    case 1:
      [(MTACountDownPicker *)self hourHighlightFrame];
      break;
    default:
      CGFloat x = CGRectZero.origin.x;
      CGFloat y = CGRectZero.origin.y;
      CGFloat width = CGRectZero.size.width;
      CGFloat height = CGRectZero.size.height;
      break;
  }
  objc_super v8 = CGPathCreateWithRoundedRect(*(CGRect *)&x, 3.0, 3.0, 0);
  double v9 = [(MTACountDownPicker *)self highlightLayer];
  [v9 setPath:v8];

  CGPathRelease(v8);
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MTACountDownPicker *)self isFocused])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v9)
    {
      id v10 = v9;
      id v23 = v7;
      id v22 = v6;
      char v11 = 0;
      uint64_t v12 = *(void *)v26;
      while (1)
      {
        CGFloat v13 = 0;
        do
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v8);
          }
          CGFloat v14 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v13) key:v22];
          objc_super v15 = v14;
          if (v14)
          {
            objc_super v16 = [v14 charactersIgnoringModifiers];
            if ([v16 isEqualToString:UIKeyInputEscape])
            {
              objc_super v17 = [(MTACountDownPicker *)self superview];
              [v17 pressesBegan:v8 withEvent:v23];

LABEL_23:
              goto LABEL_24;
            }
            if ([v16 isEqualToString:UIKeyInputUpArrow])
            {
              if ([(MTACountDownPicker *)self incrementValue])
              {
                objc_super v18 = self;
                double v19 = "incrementValueContinuouslly";
                goto LABEL_16;
              }
LABEL_17:
              [(MTACountDownPicker *)self beep];
              goto LABEL_22;
            }
            if ([v16 isEqualToString:UIKeyInputDownArrow])
            {
              if (![(MTACountDownPicker *)self decrementValue]) {
                goto LABEL_17;
              }
              objc_super v18 = self;
              double v19 = "decrementValueContinuouslly";
LABEL_16:
              [(MTACountDownPicker *)v18 performSelector:v19 withObject:0 afterDelay:0.2];
LABEL_22:
              char v11 = 1;
              goto LABEL_23;
            }
            if ([v16 isEqualToString:UIKeyInputLeftArrow])
            {
LABEL_19:
              [(MTACountDownPicker *)self activatePreviousKeyField];
              goto LABEL_22;
            }
            if ([v16 isEqualToString:UIKeyInputRightArrow])
            {
LABEL_21:
              [(MTACountDownPicker *)self activateNextKeyField];
              goto LABEL_22;
            }
            if (![v16 isEqualToString:@"\t"]) {
              goto LABEL_23;
            }
            id v20 = [v15 modifierFlags];
            if (v20 == (id)0x20000)
            {
              if ((id)[(MTACountDownPicker *)self selectedField] != (id)1) {
                goto LABEL_19;
              }
            }
            else
            {
              if (v20) {
                goto LABEL_23;
              }
              if ((id)[(MTACountDownPicker *)self selectedField] != (id)3) {
                goto LABEL_21;
              }
            }
            [(MTACountDownPicker *)self setSelectedField:0];
            goto LABEL_23;
          }
LABEL_24:

          CGFloat v13 = (char *)v13 + 1;
        }
        while (v10 != v13);
        id v21 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
        id v10 = v21;
        if (!v21)
        {

          id v6 = v22;
          id v7 = v23;
          if (v11) {
            goto LABEL_38;
          }
          goto LABEL_37;
        }
      }
    }
  }
LABEL_37:
  v24.receiver = self;
  v24.super_class = (Class)MTACountDownPicker;
  [(MTACountDownPicker *)&v24 pressesBegan:v6 withEvent:v7];
LABEL_38:
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v22 = self;
  if (![(MTACountDownPicker *)self isFocused]) {
    goto LABEL_17;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v9)
  {

LABEL_17:
    v23.receiver = v22;
    v23.super_class = (Class)MTACountDownPicker;
    [(MTACountDownPicker *)&v23 pressesEnded:v6 withEvent:v7];
    goto LABEL_18;
  }
  id v10 = v9;
  id v20 = v7;
  id v21 = v6;
  char v11 = 0;
  uint64_t v12 = *(void *)v25;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v25 != v12) {
        objc_enumerationMutation(v8);
      }
      CGFloat v14 = [*(id *)(*((void *)&v24 + 1) + 8 * i) key:v20, v21];
      objc_super v15 = v14;
      if (v14)
      {
        objc_super v16 = [v14 charactersIgnoringModifiers];
        unsigned __int8 v17 = [v16 isEqualToString:UIKeyInputUpArrow];
        objc_super v18 = "incrementValueContinuouslly";
        if ((v17 & 1) != 0
          || (v19 = objc_msgSend(v16, "isEqualToString:", UIKeyInputDownArrow, "incrementValueContinuouslly"), objc_super v18 = "decrementValueContinuouslly", v19))
        {
          +[NSThread cancelPreviousPerformRequestsWithTarget:v22 selector:v18 object:0];
          char v11 = 1;
        }
      }
    }
    id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v10);

  id v7 = v20;
  id v6 = v21;
  if ((v11 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_18:
}

- (void)activateNextKeyField
{
  int64_t v3 = [(MTACountDownPicker *)self selectedField];
  if ((unint64_t)(v3 - 1) < 2)
  {
    uint64_t v4 = [(MTACountDownPicker *)self selectedField] + 1;
  }
  else
  {
    uint64_t v4 = 1;
    if (v3 && v3 != 3) {
      return;
    }
  }

  [(MTACountDownPicker *)self setSelectedField:v4];
}

- (void)activatePreviousKeyField
{
  unint64_t v3 = [(MTACountDownPicker *)self selectedField];
  if (v3 < 2)
  {
    uint64_t v4 = 3;
  }
  else
  {
    if (v3 - 2 > 1) {
      return;
    }
    uint64_t v4 = [(MTACountDownPicker *)self selectedField] - 1;
  }

  [(MTACountDownPicker *)self setSelectedField:v4];
}

- (BOOL)incrementValue
{
  [(MTACountDownPicker *)self duration];
  uint64_t v4 = (uint64_t)v3;
  int64_t v5 = [(MTACountDownPicker *)self selectedField];
  if (v5 == 3)
  {
    if (v4 % 60 >= 59) {
      double v6 = 0.0;
    }
    else {
      double v6 = 1.0;
    }
  }
  else
  {
    if (v5 == 2)
    {
      BOOL v7 = v4 % 3600 < 3540;
      double v8 = 60.0;
    }
    else
    {
      double v6 = 0.0;
      if (v5 != 1) {
        goto LABEL_12;
      }
      BOOL v7 = v4 < 82800;
      double v8 = 3600.0;
    }
    if (v7) {
      double v6 = v8;
    }
    else {
      double v6 = 0.0;
    }
  }
LABEL_12:
  [(MTACountDownPicker *)self duration];
  [(MTACountDownPicker *)self setDuration:v6 + v9];
  return v6 > 0.0;
}

- (void)incrementValueContinuouslly
{
  if ([(MTACountDownPicker *)self incrementValue])
  {
    [(MTACountDownPicker *)self performSelector:"incrementValueContinuouslly" withObject:0 afterDelay:0.1];
  }
  else
  {
    [(MTACountDownPicker *)self beep];
  }
}

- (BOOL)decrementValue
{
  [(MTACountDownPicker *)self duration];
  uint64_t v4 = (uint64_t)v3;
  int64_t v5 = [(MTACountDownPicker *)self selectedField];
  if (v5 == 3)
  {
    if (v4 % 60 <= 0) {
      double v6 = 0.0;
    }
    else {
      double v6 = -1.0;
    }
  }
  else
  {
    if (v5 == 2)
    {
      BOOL v7 = v4 % 3600 <= 59;
      double v8 = -60.0;
    }
    else
    {
      double v6 = 0.0;
      if (v5 != 1) {
        goto LABEL_12;
      }
      BOOL v7 = v4 <= 3599;
      double v8 = -3600.0;
    }
    if (v7) {
      double v6 = 0.0;
    }
    else {
      double v6 = v8;
    }
  }
LABEL_12:
  [(MTACountDownPicker *)self duration];
  [(MTACountDownPicker *)self setDuration:v6 + v9];
  return v6 < 0.0;
}

- (void)decrementValueContinuouslly
{
  if ([(MTACountDownPicker *)self decrementValue])
  {
    [(MTACountDownPicker *)self performSelector:"decrementValueContinuouslly" withObject:0 afterDelay:0.1];
  }
  else
  {
    [(MTACountDownPicker *)self beep];
  }
}

- (void)startEditing
{
  +[NSThread cancelPreviousPerformRequestsWithTarget:self selector:"endEditing" object:0];
  [(MTACountDownPicker *)self setUnderEditing:1];

  [(MTACountDownPicker *)self performSelector:"endEditing" withObject:0 afterDelay:0.5];
}

- (void)endEditing
{
  +[NSThread cancelPreviousPerformRequestsWithTarget:self selector:"endEditing" object:0];

  [(MTACountDownPicker *)self setUnderEditing:0];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v6 = a5;
  BOOL v7 = +[NSCharacterSet decimalDigitCharacterSet];
  double v8 = [v6 stringByTrimmingCharactersInSet:v7];

  if ([v8 length]) {
    goto LABEL_15;
  }
  int64_t v9 = [(MTACountDownPicker *)self selectedField];
  switch(v9)
  {
    case 3:
      [(MTACountDownPicker *)self duration];
      uint64_t v11 = (uint64_t)v14 % 60;
      uint64_t v12 = 1;
LABEL_8:
      uint64_t v13 = 59;
      break;
    case 2:
      [(MTACountDownPicker *)self duration];
      uint64_t v11 = (int)(((__int16)((34953 * ((int)(uint64_t)v15 % 3600)) >> 16) >> 5)
                + ((((int)(uint64_t)v15 % 3600 + ((-30583 * ((int)(uint64_t)v15 % 3600)) >> 16)) & 0x8000) >> 15));
      uint64_t v12 = 60;
      goto LABEL_8;
    case 1:
      [(MTACountDownPicker *)self duration];
      uint64_t v11 = (uint64_t)v10 / 3600;
      uint64_t v12 = 3600;
      uint64_t v13 = 23;
      break;
    default:
      [(MTACountDownPicker *)self beep];
      uint64_t v13 = 0;
      uint64_t v12 = 0;
      uint64_t v11 = 0;
      break;
  }
  objc_super v16 = (char *)[v6 integerValue];
  if ((unint64_t)v16 >= 0xA
    || (unsigned __int8 v17 = v16, [(MTACountDownPicker *)self underEditing]) && (v17 += 10 * v11, (uint64_t)v17 > v13))
  {
    [(MTACountDownPicker *)self beep];
  }
  else
  {
    [(MTACountDownPicker *)self startEditing];
    [(MTACountDownPicker *)self duration];
    [(MTACountDownPicker *)self setDuration:v18 + (double)((uint64_t)&v17[-v11] * v12)];
  }
LABEL_15:

  return 0;
}

- (void)recognizeTapGesture:(id)a3
{
  [a3 locationInView:self];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  [(MTACountDownPicker *)self hourHighlightFrame];
  v10.CGFloat x = v5;
  v10.CGFloat y = v7;
  if (CGRectContainsPoint(v13, v10))
  {
    uint64_t v8 = 1;
  }
  else
  {
    [(MTACountDownPicker *)self minuteHighlightFrame];
    v11.CGFloat x = v5;
    v11.CGFloat y = v7;
    if (CGRectContainsPoint(v14, v11))
    {
      uint64_t v8 = 2;
    }
    else
    {
      [(MTACountDownPicker *)self secondHighlightFrame];
      v12.CGFloat x = v5;
      v12.CGFloat y = v7;
      if (!CGRectContainsPoint(v15, v12)) {
        return;
      }
      uint64_t v8 = 3;
    }
  }

  [(MTACountDownPicker *)self setSelectedField:v8];
}

- (BOOL)usesSmallSize
{
  return self->_usesSmallSize;
}

- (double)duration
{
  return self->_duration;
}

- (double)hourMidX
{
  return self->_hourMidX;
}

- (void)setHourMidX:(double)a3
{
  self->_hourMidX = a3;
}

- (double)minuteMidX
{
  return self->_minuteMidX;
}

- (void)setMinuteMidX:(double)a3
{
  self->_minuteMidX = a3;
}

- (double)secondMidX
{
  return self->_secondMidX;
}

- (void)setSecondMidX:(double)a3
{
  self->_secondMidX = a3;
}

- (BOOL)showText
{
  return self->_showText;
}

- (int64_t)selectedField
{
  return self->_selectedField;
}

- (CAShapeLayer)highlightLayer
{
  return self->_highlightLayer;
}

- (void)setHighlightLayer:(id)a3
{
}

- (CGRect)hourHighlightFrame
{
  double x = self->_hourHighlightFrame.origin.x;
  double y = self->_hourHighlightFrame.origin.y;
  double width = self->_hourHighlightFrame.size.width;
  double height = self->_hourHighlightFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setHourHighlightFrame:(CGRect)a3
{
  self->_hourHighlightFrame = a3;
}

- (CGRect)minuteHighlightFrame
{
  double x = self->_minuteHighlightFrame.origin.x;
  double y = self->_minuteHighlightFrame.origin.y;
  double width = self->_minuteHighlightFrame.size.width;
  double height = self->_minuteHighlightFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setMinuteHighlightFrame:(CGRect)a3
{
  self->_minuteHighlightFrame = a3;
}

- (CGRect)secondHighlightFrame
{
  double x = self->_secondHighlightFrame.origin.x;
  double y = self->_secondHighlightFrame.origin.y;
  double width = self->_secondHighlightFrame.size.width;
  double height = self->_secondHighlightFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSecondHighlightFrame:(CGRect)a3
{
  self->_secondHighlightFrame = a3;
}

- (NSDateComponentsFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (BOOL)underEditing
{
  return self->_underEditing;
}

- (void)setUnderEditing:(BOOL)a3
{
  self->_underEditing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatter, 0);

  objc_storeStrong((id *)&self->_highlightLayer, 0);
}

@end