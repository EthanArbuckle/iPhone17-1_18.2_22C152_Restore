@interface UIKeyboardSuggestedInputMode
- (BOOL)enabled;
- (UIKeyboardSuggestedInputMode)initWithIdentifier:(id)a3 enabled:(BOOL)a4;
- (id)description;
- (void)setEnabled:(BOOL)a3;
@end

@implementation UIKeyboardSuggestedInputMode

- (UIKeyboardSuggestedInputMode)initWithIdentifier:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardSuggestedInputMode;
  v5 = [(UIKeyboardInputMode *)&v8 initWithIdentifier:a3];
  v6 = v5;
  if (v5) {
    [(UIKeyboardSuggestedInputMode *)v5 setEnabled:v4];
  }
  return v6;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = [(UIKeyboardInputMode *)self identifier];
  BOOL v5 = [(UIKeyboardSuggestedInputMode *)self enabled];
  v6 = @"NO";
  if (v5) {
    v6 = @"YES";
  }
  v7 = [v3 stringWithFormat:@"identifier: %@, enabled: %@", v4, v6];

  return v7;
}

- (BOOL)enabled
{
  return self->enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->enabled = a3;
}

@end