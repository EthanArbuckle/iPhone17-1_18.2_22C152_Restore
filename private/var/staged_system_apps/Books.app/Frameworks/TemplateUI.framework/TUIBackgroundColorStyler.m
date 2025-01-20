@interface TUIBackgroundColorStyler
- (BOOL)isEqualToStyle:(id)a3;
- (UIColor)backgroundColor;
- (void)applyStylingToLayer:(id)a3;
- (void)applyStylingToView:(id)a3;
- (void)setBackgroundColor:(id)a3;
@end

@implementation TUIBackgroundColorStyler

- (void)applyStylingToLayer:(id)a3
{
  backgroundColor = self->_backgroundColor;
  id v4 = a3;
  [v4 setBackgroundColor:[backgroundColor CGColor]];
}

- (void)applyStylingToView:(id)a3
{
}

- (BOOL)isEqualToStyle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  v7 = v6;
  v8 = v7;
  if (v7 == self) {
    goto LABEL_8;
  }
  if (!v7)
  {
    unsigned __int8 v10 = 0;
    goto LABEL_10;
  }
  backgroundColor = self->_backgroundColor;
  if (backgroundColor == v8->_backgroundColor) {
LABEL_8:
  }
    unsigned __int8 v10 = 1;
  else {
    unsigned __int8 v10 = -[UIColor isEqual:](backgroundColor, "isEqual:");
  }
LABEL_10:

  return v10;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end