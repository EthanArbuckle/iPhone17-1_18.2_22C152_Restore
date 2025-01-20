@interface VSITMLCredentialEntryField
- (IKTextFieldElement)associatedTextFieldElement;
- (void)setAssociatedTextFieldElement:(id)a3;
- (void)textDidChangeForKeyboard:(id)a3;
@end

@implementation VSITMLCredentialEntryField

- (void)setAssociatedTextFieldElement:(id)a3
{
  v5 = (IKTextFieldElement *)a3;
  associatedTextFieldElement = self->_associatedTextFieldElement;
  v9 = v5;
  if (associatedTextFieldElement != v5)
  {
    v7 = [(IKTextFieldElement *)associatedTextFieldElement keyboard];
    [v7 setDelegate:0];

    objc_storeStrong((id *)&self->_associatedTextFieldElement, a3);
    v8 = [(IKTextFieldElement *)v9 keyboard];
    [v8 setDelegate:self];
    [(VSITMLCredentialEntryField *)self textDidChangeForKeyboard:v8];
  }
}

- (void)textDidChangeForKeyboard:(id)a3
{
  id v4 = a3;
  VSRequireMainThread();
  uint64_t v5 = [v4 text];

  if (v5) {
    v6 = (__CFString *)v5;
  }
  else {
    v6 = &stru_26F361E90;
  }
  v7 = v6;
  -[VSCredentialEntryField setText:](self, "setText:");
}

- (IKTextFieldElement)associatedTextFieldElement
{
  return self->_associatedTextFieldElement;
}

- (void).cxx_destruct
{
}

@end