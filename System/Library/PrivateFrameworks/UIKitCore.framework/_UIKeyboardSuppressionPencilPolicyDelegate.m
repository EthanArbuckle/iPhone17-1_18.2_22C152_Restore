@interface _UIKeyboardSuppressionPencilPolicyDelegate
- (BOOL)_shouldSuppressForDelegate:(id)a3;
- (BOOL)_suppressLocaleIdentifier;
- (NSString)_overrideLocaleIdentifier;
- (id)_recognitionLocaleIdentifier;
- (void)set_overrideLocaleIdentifier:(id)a3;
- (void)set_suppressLocaleIdentifier:(BOOL)a3;
@end

@implementation _UIKeyboardSuppressionPencilPolicyDelegate

- (id)_recognitionLocaleIdentifier
{
  if (self->_isQueryingLocaleIdentifier)
  {
    id v2 = 0;
  }
  else
  {
    self->_isQueryingLocaleIdentifier = 1;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v4 = (void *)_MergedGlobals_1107;
    uint64_t v17 = _MergedGlobals_1107;
    if (!_MergedGlobals_1107)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getPKTextInputSettingsClass_block_invoke;
      v13[3] = &unk_1E52D9900;
      v13[4] = &v14;
      __getPKTextInputSettingsClass_block_invoke((uint64_t)v13);
      v4 = (void *)v15[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v14, 8);
    v6 = [v5 sharedSettings];
    v7 = [(_UIKeyboardSuppressionPencilPolicyDelegate *)self _overrideLocaleIdentifier];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [v6 recognitionLocaleIdentifier];
    }
    v10 = v9;

    self->_isQueryingLocaleIdentifier = 0;
    if ([(_UIKeyboardSuppressionPencilPolicyDelegate *)self _suppressLocaleIdentifier]) {
      v11 = 0;
    }
    else {
      v11 = v10;
    }
    id v2 = v11;
  }
  return v2;
}

- (BOOL)_shouldSuppressForDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIKeyboardSuppressionPencilPolicyDelegate *)self _recognitionLocaleIdentifier];

  if (v5)
  {
    if (objc_opt_respondsToSelector()) {
      LODWORD(v5) = [v4 isSecureTextEntry] ^ 1;
    }
    else {
      LOBYTE(v5) = 1;
    }
    if (objc_opt_respondsToSelector())
    {
      if ([v4 _textInputSource] != 3) {
        LOBYTE(v5) = 0;
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (BOOL)_suppressLocaleIdentifier
{
  return self->_suppressLocaleIdentifier;
}

- (void)set_suppressLocaleIdentifier:(BOOL)a3
{
  self->_suppressLocaleIdentifier = a3;
}

- (NSString)_overrideLocaleIdentifier
{
  return self->_overrideLocaleIdentifier;
}

- (void)set_overrideLocaleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end