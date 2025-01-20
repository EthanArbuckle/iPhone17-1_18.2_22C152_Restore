@interface RoutePlanningWaypointTextField
- (BOOL)isHandlingTouch;
- (CGRect)clearButtonRectForBounds:(CGRect)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)leftViewRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (RoutePlanningWaypointTextField)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (double)_textMinimumLeadingMargin;
- (double)_textMinimumTrailingMargin;
- (void)_hoverGesture:(id)a3;
- (void)didBeginEditingFromTouch:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation RoutePlanningWaypointTextField

- (RoutePlanningWaypointTextField)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RoutePlanningWaypointTextField;
  v3 = -[RoutePlanningWaypointTextField initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(RoutePlanningWaypointTextField *)v3 _setSupportsKeyboardNavigationForSuggestions:1];
    if (sub_1000BBB44(v4) == 5)
    {
      id v5 = [objc_alloc((Class)UIHoverGestureRecognizer) initWithTarget:v4 action:"_hoverGesture:"];
      [(RoutePlanningWaypointTextField *)v4 addGestureRecognizer:v5];
    }
    else
    {
      [(RoutePlanningWaypointTextField *)v4 setClearButtonMode:1];
    }
  }
  return v4;
}

- (void)_hoverGesture:(id)a3
{
  id v5 = a3;
  if ([v5 state] == (id)1
    && [(RoutePlanningWaypointTextField *)self clearButtonMode] != (id)3)
  {
    uint64_t v4 = 3;
  }
  else
  {
    if ([v5 state] != (id)3 && objc_msgSend(v5, "state") != (id)4
      || [(RoutePlanningWaypointTextField *)self clearButtonMode] != (id)3)
    {
      goto LABEL_9;
    }
    uint64_t v4 = 0;
  }
  [(RoutePlanningWaypointTextField *)self setClearButtonMode:v4];
LABEL_9:
}

- (void)didBeginEditingFromTouch:(BOOL)a3
{
  self->_didBeginEditingFromTouch = a3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_isHandlingTouch = 1;
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [(RoutePlanningWaypointTextField *)self isEditing];
  v12.receiver = self;
  v12.super_class = (Class)RoutePlanningWaypointTextField;
  [(RoutePlanningWaypointTextField *)&v12 touchesBegan:v7 withEvent:v6];

  if (sub_1000BBB44(self) == 5 && v8 && !self->_didBeginEditingFromTouch)
  {
    v9 = [(RoutePlanningWaypointTextField *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v11 = [(RoutePlanningWaypointTextField *)self delegate];
      [v11 textFieldDidBeginEditing:self];
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningWaypointTextField;
  [(RoutePlanningWaypointTextField *)&v5 touchesEnded:a3 withEvent:a4];
  self->_isHandlingTouch = 0;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)RoutePlanningWaypointTextField;
  [(RoutePlanningWaypointTextField *)&v5 touchesCancelled:a3 withEvent:a4];
  self->_isHandlingTouch = 0;
}

- (UIEdgeInsets)alignmentRectInsets
{
  if (sub_1000BBB44(self) == 5)
  {
    sub_1000BBB44(self);
    double v3 = 0.0;
    double v4 = 10.0;
    double v5 = 0.0;
    double v6 = 10.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RoutePlanningWaypointTextField;
    [(RoutePlanningWaypointTextField *)&v7 alignmentRectInsets];
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  unsigned int v8 = +[UIApplication sharedApplication];
  id v9 = [v8 userInterfaceLayoutDirection];

  if (v9 == (id)1) {
    [(RoutePlanningWaypointTextField *)self rightView];
  }
  else {
  char v10 = [(RoutePlanningWaypointTextField *)self leftView];
  }
  CGFloat v11 = CGRectZero.origin.y;
  [v10 intrinsicContentSize];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  sub_1000BBB44(self);
  double v16 = x + 10.0;
  v24.origin.double x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v24);
  v25.origin.double x = x + 10.0;
  v25.origin.CGFloat y = v11;
  v25.size.CGFloat width = v13;
  v25.size.CGFloat height = v15;
  double v18 = CGRectGetHeight(v25);
  if (sub_1000BBB44(self) == 5)
  {
    sub_1000BBB44(self);
    double v19 = -10.0;
    if (v9 != (id)1) {
      double v19 = 10.0;
    }
    double v16 = v16 + v19;
  }

  double v20 = v16;
  double v21 = round(MidY + v18 * -0.5);
  double v22 = v13;
  double v23 = v15;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.double x = v20;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  unsigned int v8 = +[UIApplication sharedApplication];
  id v9 = [v8 userInterfaceLayoutDirection];

  if (v9 == (id)1) {
    [(RoutePlanningWaypointTextField *)self leftView];
  }
  else {
  char v10 = [(RoutePlanningWaypointTextField *)self rightView];
  }
  CGFloat v11 = CGRectZero.origin.y;
  [v10 intrinsicContentSize];
  double v13 = v12;
  CGFloat v15 = v14;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat v16 = CGRectGetMaxX(v25) - v13;
  sub_1000BBB44(self);
  double v17 = v16 + -10.0;
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v26);
  v27.origin.CGFloat x = v17;
  v27.origin.CGFloat y = v11;
  v27.size.CGFloat width = v13;
  v27.size.CGFloat height = v15;
  double v19 = CGRectGetHeight(v27);
  if (sub_1000BBB44(self) == 5)
  {
    sub_1000BBB44(self);
    double v20 = 10.0;
    if (v9 != (id)1) {
      double v20 = -10.0;
    }
    double v17 = v20 + v17;
  }

  double v21 = v17;
  double v22 = round(MidY + v19 * -0.5);
  double v23 = v13;
  double v24 = v15;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (double)_textMinimumLeadingMargin
{
  uint64_t v3 = sub_1000BBB44(self);
  double result = 0.0;
  if (v3 == 5)
  {
    sub_1000BBB44(self);
    return 10.0;
  }
  return result;
}

- (double)_textMinimumTrailingMargin
{
  uint64_t v3 = sub_1000BBB44(self);
  double result = 0.0;
  if (v3 == 5)
  {
    sub_1000BBB44(self);
    return 10.0;
  }
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  sub_1000BBB44(self);
  unsigned int v8 = +[UIApplication sharedApplication];
  id v9 = [v8 userInterfaceLayoutDirection];

  double v60 = y;
  -[RoutePlanningWaypointTextField leftViewRectForBounds:](self, "leftViewRectForBounds:", x, y, width, height);
  CGFloat v10 = v61.origin.x;
  CGFloat v11 = v61.origin.y;
  CGFloat v12 = v61.size.width;
  CGFloat v13 = v61.size.height;
  CGFloat v14 = CGRectGetWidth(v61);
  double v15 = 0.0;
  if (v14 > 0.0)
  {
    v62.origin.double x = v10;
    v62.origin.double y = v11;
    v62.size.double width = v12;
    v62.size.double height = v13;
    double v15 = CGRectGetMaxX(v62) + 8.0;
  }
  double v57 = v15;
  -[RoutePlanningWaypointTextField rightViewRectForBounds:](self, "rightViewRectForBounds:", x, y, width, height);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  double rect = width;
  CGFloat v59 = height;
  -[RoutePlanningWaypointTextField clearButtonRectForBounds:](self, "clearButtonRectForBounds:", x, v60, width, height);
  uint64_t v51 = v24;
  uint64_t v54 = v25;
  uint64_t v55 = v26;
  uint64_t v56 = v27;
  v63.origin.double x = v17;
  v63.origin.double y = v19;
  v63.size.double width = v21;
  v63.size.double height = v23;
  double v28 = CGRectGetWidth(v63);
  if (v9 == (id)1)
  {
    double v29 = 0.0;
    double v30 = 0.0;
    if (v28 > 0.0)
    {
      v64.origin.double x = v17;
      v64.origin.double y = v19;
      v64.size.double width = v21;
      v64.size.double height = v23;
      double v31 = CGRectGetWidth(v64);
      v65.origin.double x = x;
      v65.size.double height = v59;
      v65.origin.double y = v60;
      v65.size.double width = rect;
      double v32 = v31 + CGRectGetWidth(v65);
      v66.origin.double x = v17;
      v66.origin.double y = v19;
      v66.size.double width = v21;
      v66.size.double height = v23;
      double v30 = v32 - CGRectGetMaxX(v66) + 8.0;
    }
    v33 = [(RoutePlanningWaypointTextField *)self _clearButton];
    v34 = [v33 superview];
    double v35 = v57;
    if (v34) {
      double v29 = CGRectGetMaxX(v52) + 8.0;
    }

    if (v57 <= v29) {
      double v35 = v29;
    }
  }
  else
  {
    double v30 = 0.0;
    double v36 = 0.0;
    if (v28 > 0.0)
    {
      v67.origin.double x = x;
      v67.size.double height = v59;
      v67.origin.double y = v60;
      v67.size.double width = rect;
      double MaxX = CGRectGetMaxX(v67);
      v68.origin.double x = v17;
      v68.origin.double y = v19;
      v68.size.double width = v21;
      v68.size.double height = v23;
      double v36 = MaxX - CGRectGetMinX(v68) + 8.0;
    }
    v38 = [(RoutePlanningWaypointTextField *)self _clearButton];
    v39 = [v38 superview];
    double v35 = v57;
    if (v39)
    {
      v69.origin.double x = x;
      v69.size.double height = v59;
      v69.origin.double y = v60;
      v69.size.double width = rect;
      double v40 = CGRectGetMaxX(v69);
      double v30 = v40 - CGRectGetMinX(v53) + 8.0;
    }

    if (v36 > v30) {
      double v30 = v36;
    }
  }
  [(RoutePlanningWaypointTextField *)self _textMinimumLeadingMargin];
  double v42 = v41;
  [(RoutePlanningWaypointTextField *)self _textMinimumTrailingMargin];
  if (v9 == (id)1) {
    double v44 = v43;
  }
  else {
    double v44 = v42;
  }
  if (v9 == (id)1) {
    double v43 = v42;
  }
  if (v35 <= v44) {
    double v45 = v44;
  }
  else {
    double v45 = v35;
  }
  if (v30 <= v43) {
    double v46 = v43;
  }
  else {
    double v46 = v30;
  }
  double v47 = x + v45;
  double v48 = v60 + 0.0;
  double v49 = rect - (v45 + v46);
  double v50 = v59;
  result.size.double height = v50;
  result.size.double width = v49;
  result.origin.double y = v48;
  result.origin.double x = v47;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  -[RoutePlanningWaypointTextField textRectForBounds:](self, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  -[RoutePlanningWaypointTextField textRectForBounds:](self, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)RoutePlanningWaypointTextField;
  -[RoutePlanningWaypointTextField clearButtonRectForBounds:](&v19, "clearButtonRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CGFloat v12 = +[UIApplication sharedApplication];
  id v13 = [v12 userInterfaceLayoutDirection];

  if (sub_1000BBB44(self) == 5)
  {
    sub_1000BBB44(self);
    double v14 = -10.0;
    if (v13 == (id)1) {
      double v14 = 10.0;
    }
    double v5 = v5 + v14;
  }
  double v15 = v5;
  double v16 = v7;
  double v17 = v9;
  double v18 = v11;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (BOOL)isHandlingTouch
{
  return self->_isHandlingTouch;
}

@end