@interface _UITextFormattingDeferredFontPickingDelegate
- (UIResponderStandardEditActions)editResponder;
- (double)fontSize;
- (void)_removeAssociatedDelegate;
- (void)fontPickerViewControllerDidCancel:(id)a3;
- (void)fontPickerViewControllerDidPickFont:(id)a3;
- (void)setEditResponder:(id)a3;
- (void)setFontSize:(double)a3;
@end

@implementation _UITextFormattingDeferredFontPickingDelegate

- (void)setEditResponder:(id)a3
{
  id obj = a3;
  objc_setAssociatedObject(obj, &_UITextFormattingDeferredFontPickingDelegateIdentifier, self, (void *)1);
  objc_storeWeak((id *)&self->_editResponder, obj);
}

- (void)_removeAssociatedDelegate
{
  p_editResponder = &self->_editResponder;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editResponder);

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_editResponder);
    objc_setAssociatedObject(v4, &_UITextFormattingDeferredFontPickingDelegateIdentifier, 0, (void *)1);
  }
}

- (void)fontPickerViewControllerDidCancel:(id)a3
{
  [a3 dismissViewControllerAnimated:1 completion:0];
  [(_UITextFormattingDeferredFontPickingDelegate *)self _removeAssociatedDelegate];
}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  id v4 = a3;
  v5 = [v4 selectedFontDescriptor];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1C9E8];
    [(_UITextFormattingDeferredFontPickingDelegate *)self fontSize];
    v7 = objc_msgSend(off_1E52D39B8, "fontWithDescriptor:size:", v5);
    v8 = [v6 dictionaryWithObject:v7 forKey:*(void *)off_1E52D2040];

    if (v8)
    {
      v9 = [(_UITextFormattingDeferredFontPickingDelegate *)self editResponder];

      if (v9)
      {
        v10 = [(_UITextFormattingDeferredFontPickingDelegate *)self editResponder];
        SendUpdatesToEditResponder(v8, v10);
      }
    }
  }
  dispatch_time_t v11 = dispatch_time(0, 300000000);
  objc_initWeak(&location, v4);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __84___UITextFormattingDeferredFontPickingDelegate_fontPickerViewControllerDidPickFont___block_invoke;
  v15 = &unk_1E52DC308;
  objc_copyWeak(&v16, &location);
  dispatch_after(v11, MEMORY[0x1E4F14428], &v12);
  [(_UITextFormattingDeferredFontPickingDelegate *)self _removeAssociatedDelegate];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (UIResponderStandardEditActions)editResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editResponder);
  return (UIResponderStandardEditActions *)WeakRetained;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void).cxx_destruct
{
}

@end