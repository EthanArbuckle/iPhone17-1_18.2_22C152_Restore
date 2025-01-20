@interface WFVariableCell
+ (double)widthWithVariable:(id)a3 height:(double)a4;
- (BOOL)currentAvailable;
- (BOOL)isAccessibilityElement;
- (NSString)currentTitle;
- (WFIcon)currentIcon;
- (WFVariable)variable;
- (WFVariableCell)initWithFrame:(CGRect)a3;
- (WFVariablePillView)pillView;
- (unint64_t)accessibilityTraits;
- (unint64_t)currentControlState;
- (void)setCurrentAvailable:(BOOL)a3;
- (void)setCurrentControlState:(unint64_t)a3;
- (void)setCurrentIcon:(id)a3;
- (void)setCurrentTitle:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setVariable:(id)a3;
- (void)updateVariableImage;
@end

@implementation WFVariableCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentIcon, 0);
  objc_storeStrong((id *)&self->_currentTitle, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_variable, 0);
}

- (void)setCurrentControlState:(unint64_t)a3
{
  self->_currentControlState = a3;
}

- (unint64_t)currentControlState
{
  return self->_currentControlState;
}

- (void)setCurrentAvailable:(BOOL)a3
{
  self->_currentAvailable = a3;
}

- (BOOL)currentAvailable
{
  return self->_currentAvailable;
}

- (void)setCurrentIcon:(id)a3
{
}

- (WFIcon)currentIcon
{
  return self->_currentIcon;
}

- (void)setCurrentTitle:(id)a3
{
}

- (NSString)currentTitle
{
  return self->_currentTitle;
}

- (WFVariablePillView)pillView
{
  return self->_pillView;
}

- (WFVariable)variable
{
  return self->_variable;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFVariableCell;
  [(WFVariableCell *)&v4 setHighlighted:a3];
  [(WFVariableCell *)self updateVariableImage];
}

- (void)setVariable:(id)a3
{
  objc_storeStrong((id *)&self->_variable, a3);
  id v5 = a3;
  [(WFVariableCell *)self updateVariableImage];
  id v6 = [v5 nameIncludingPropertyName];

  [(WFVariableCell *)self setAccessibilityLabel:v6];
}

- (void)updateVariableImage
{
  id v27 = [(WFVariableCell *)self variable];
  v3 = [v27 propertyName];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v27 name];
  }
  id v6 = v5;

  v7 = [v27 icon];
  uint64_t v8 = [v27 isAvailable];
  uint64_t v9 = [(WFVariableCell *)self isHighlighted];
  v10 = [(WFVariableCell *)self currentTitle];
  id v11 = v6;
  id v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {
  }
  else
  {
    id v14 = v12;
    v15 = v11;
    if (!v11) {
      goto LABEL_20;
    }
    id v14 = v12;
    v15 = v11;
    if (!v12) {
      goto LABEL_20;
    }
    int v16 = [v11 isEqualToString:v12];

    if (!v16) {
      goto LABEL_22;
    }
  }
  v17 = [(WFVariableCell *)self currentIcon];
  id v14 = v7;
  id v18 = v17;
  v15 = v18;
  if (v14 == v18)
  {

    goto LABEL_16;
  }
  if (v14 && v18)
  {
    int v19 = [v14 isEqual:v18];

    if (!v19) {
      goto LABEL_21;
    }
LABEL_16:
    if (v8 == [(WFVariableCell *)self currentAvailable])
    {
      unint64_t v20 = [(WFVariableCell *)self currentControlState];

      if (v20 == v9) {
        goto LABEL_26;
      }
      goto LABEL_23;
    }
    goto LABEL_21;
  }

LABEL_20:
LABEL_21:

LABEL_22:
LABEL_23:
  pillView = self->_pillView;
  if (pillView) {
    [(WFVariablePillView *)pillView removeFromSuperview];
  }
  v22 = [WFVariablePillView alloc];
  [(WFVariableCell *)self bounds];
  v24 = [(WFVariablePillView *)v22 initWithName:v11 icon:v7 font:0 available:v8 height:v9 controlState:v23];
  [(WFVariablePillView *)v24 setUserInteractionEnabled:0];
  [(WFVariableCell *)self bounds];
  -[WFVariablePillView setFrame:](v24, "setFrame:");
  [(WFVariablePillView *)v24 setAutoresizingMask:18];
  v25 = [(WFVariableCell *)self contentView];
  [v25 addSubview:v24];

  v26 = self->_pillView;
  self->_pillView = v24;

  [(WFVariableCell *)self setCurrentTitle:v11];
  [(WFVariableCell *)self setCurrentIcon:v7];
  [(WFVariableCell *)self setCurrentAvailable:v8];
  [(WFVariableCell *)self setCurrentControlState:v9];
LABEL_26:
}

- (WFVariableCell)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFVariableCell;
  v3 = -[WFVariableCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_super v4 = WFLocalizedString(@"Double tap to insert");
    [(WFVariableCell *)v3 setAccessibilityHint:v4];

    id v5 = v3;
  }

  return v3;
}

+ (double)widthWithVariable:(id)a3 height:(double)a4
{
  id v5 = a3;
  id v6 = [v5 propertyName];
  objc_super v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v5 name];
  }
  uint64_t v9 = v8;

  v10 = [v5 icon];
  +[WFVariablePillView widthForVariableViewWithName:v9 icon:v10 font:0 height:a4];
  double v12 = v11;

  return v12;
}

@end