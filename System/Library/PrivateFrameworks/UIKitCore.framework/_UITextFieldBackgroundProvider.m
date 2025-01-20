@interface _UITextFieldBackgroundProvider
- (BOOL)_isTV;
- (BOOL)drawsContent;
- (BOOL)hitTestView:(id)a3;
- (BOOL)isEqual:(id)a3;
- (UITextField)textField;
- (id)description;
- (id)focusRingPathForBounds:(CGRect)a3;
- (id)overridingGetBackgroundColor;
- (id)overridingSetBackgroundColor:(id)a3;
- (id)preferredMetricsProvider;
- (int64_t)associatedBorderStyle;
- (unint64_t)hash;
- (void)addToTextField:(id)a3;
- (void)removeFromTextField;
@end

@implementation _UITextFieldBackgroundProvider

- (void).cxx_destruct
{
}

- (UITextField)textField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  return (UITextField *)WeakRetained;
}

- (BOOL)drawsContent
{
  return 0;
}

- (void)addToTextField:(id)a3
{
  id obj = a3;
  if (!obj)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"_UITextFieldBackgroundProvider.m", 56, @"Invalid parameter not satisfying: %@", @"textField" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);

  if (WeakRetained)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UITextFieldBackgroundProvider.m" lineNumber:57 description:@"Adding a background decorator that is already attached to a textfield."];
  }
  objc_storeWeak((id *)&self->_textField, obj);
}

- (id)preferredMetricsProvider
{
  return 0;
}

- (void)removeFromTextField
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UITextFieldBackgroundProvider *)a3;
  p_isa = (id *)&v4->super.isa;
  if (!v4) {
    goto LABEL_4;
  }
  if (v4 == self)
  {
    BOOL v7 = 1;
    goto LABEL_16;
  }
  uint64_t v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    id WeakRetained = objc_loadWeakRetained(p_isa + 1);
    id v9 = objc_loadWeakRetained((id *)&self->_textField);
    if (WeakRetained) {
      BOOL v10 = v9 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    BOOL v7 = v10 || WeakRetained == v9;
  }
  else
  {
LABEL_4:
    BOOL v7 = 0;
  }
LABEL_16:

  return v7;
}

- (int64_t)associatedBorderStyle
{
  return -1;
}

- (id)overridingGetBackgroundColor
{
  return 0;
}

- (id)overridingSetBackgroundColor:(id)a3
{
  id v3 = a3;
  return v3;
}

- (id)focusRingPathForBounds:(CGRect)a3
{
  return 0;
}

- (BOOL)hitTestView:(id)a3
{
  return 0;
}

- (BOOL)_isTV
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  id v3 = [WeakRetained traitCollection];

  if (v3) {
    BOOL v4 = [v3 userInterfaceIdiom] == 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)_UITextFieldBackgroundProvider;
  unint64_t v3 = [(_UITextFieldBackgroundProvider *)&v7 hash];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  unint64_t v5 = [WeakRetained hash] ^ v3;

  return v5;
}

- (id)description
{
  unint64_t v3 = [[UIDescriptionBuilder alloc] initWithObject:self];
  [(_UITextFieldBackgroundProvider *)self _buildDescription:v3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  id v5 = [(UIDescriptionBuilder *)v3 appendName:@"textfield" object:WeakRetained usingLightweightDescription:1];

  uint64_t v6 = [(UIDescriptionBuilder *)v3 string];

  return v6;
}

@end