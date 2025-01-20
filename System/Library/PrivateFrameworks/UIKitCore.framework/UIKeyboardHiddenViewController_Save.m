@interface UIKeyboardHiddenViewController_Save
- (void)setAutofillVC:(id)a3;
@end

@implementation UIKeyboardHiddenViewController_Save

- (void)setAutofillVC:(id)a3
{
  p_autofillVC = &self->super._autofillVC;
  objc_storeStrong((id *)&self->super._autofillVC, a3);
  id v6 = a3;
  [(_SFPasswordViewController *)*p_autofillVC setDelegate:self];
}

@end