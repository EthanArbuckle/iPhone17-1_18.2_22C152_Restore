@interface UIWebFormDelegate
- ($94EAB4A8BE99507F6334A41B2EE9F3E4)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4;
- (BOOL)_shouldIgnoreFormTextChangesInFrame:(id)a3;
- (BOOL)formWasEdited;
- (BOOL)hasCurrentSuggestions;
- (BOOL)textField:(id)a3 doCommandBySelector:(SEL)a4 inFrame:(id)a5;
- (UIWebFormDelegate)initWithWebBrowserView:(id)a3;
- (void)_clearEditedFormsInFrame:(id)a3;
- (void)_didEditFormElement:(id)a3 inFrame:(id)a4;
- (void)acceptedAutoFillWord:(id)a3;
- (void)dealloc;
- (void)didFocusTextField:(id)a3 inFrame:(id)a4;
- (void)frame:(id)a3 sourceFrame:(id)a4 willSubmitForm:(id)a5 withValues:(id)a6 submissionListener:(id)a7;
- (void)textDidChangeInTextArea:(id)a3 inFrame:(id)a4;
- (void)textDidChangeInTextField:(id)a3 inFrame:(id)a4;
- (void)textFieldDidBeginEditing:(id)a3 inFrame:(id)a4;
- (void)textFieldDidEndEditing:(id)a3 inFrame:(id)a4;
- (void)willSendSubmitEventToForm:(id)a3 inFrame:(id)a4 withValues:(id)a5;
@end

@implementation UIWebFormDelegate

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIWebFormDelegate;
  [(UIWebFormDelegate *)&v3 dealloc];
}

- (void)frame:(id)a3 sourceFrame:(id)a4 willSubmitForm:(id)a5 withValues:(id)a6 submissionListener:(id)a7
{
  if ([(UIWebBrowserView *)self->_webBrowserView autoFillDelegate])
  {
    v13 = [(UIWebBrowserView *)self->_webBrowserView autoFillDelegate];
    id v14 = +[UIWebBrowserView getUIWebBrowserViewForWebFrame:a3];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __84__UIWebFormDelegate_frame_sourceFrame_willSubmitForm_withValues_submissionListener___block_invoke;
    v15[3] = &unk_1E52DC580;
    v15[4] = a7;
    [(UIWebAutoFillDelegate *)v13 webBrowserView:v14 willSubmitForm:a5 toFrame:a3 fromFrame:a4 withValues:a6 submissionHandler:v15];
  }
  else
  {
    [a7 continue];
  }
}

uint64_t __84__UIWebFormDelegate_frame_sourceFrame_willSubmitForm_withValues_submissionListener___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) continue];
}

- (void)textDidChangeInTextArea:(id)a3 inFrame:(id)a4
{
  if (![(UIWebFormDelegate *)self _shouldIgnoreFormTextChangesInFrame:a4]) {
    [(UIWebFormDelegate *)self _didEditFormElement:a3 inFrame:a4];
  }
  id v7 = +[UIWebBrowserView getUIWebBrowserViewForWebFrame:a4];
  [v7 formDelegateTextDidChange];
}

- (void)textDidChangeInTextField:(id)a3 inFrame:(id)a4
{
  if (![(UIWebFormDelegate *)self _shouldIgnoreFormTextChangesInFrame:a4])
  {
    [(UIWebFormDelegate *)self _didEditFormElement:a3 inFrame:a4];
    id v7 = [(UIWebBrowserView *)self->_webBrowserView autoFillDelegate];
    if (objc_opt_respondsToSelector()) {
      [(UIWebAutoFillDelegate *)v7 webBrowserView:self->_webBrowserView textDidChangeInTextField:a3 inFrame:a4];
    }
  }
  id v8 = +[UIWebBrowserView getUIWebBrowserViewForWebFrame:a4];
  [v8 formDelegateTextDidChange];
}

- (void)textFieldDidBeginEditing:(id)a3 inFrame:(id)a4
{
  v6 = [(UIWebBrowserView *)self->_webBrowserView autoFillDelegate];
  id v7 = +[UIWebBrowserView getUIWebBrowserViewForWebFrame:a4];
  [(UIWebAutoFillDelegate *)v6 webBrowserView:v7 didBeginEditingTextField:a3 inFrame:a4];
}

- (void)textFieldDidEndEditing:(id)a3 inFrame:(id)a4
{
  v6 = [(UIWebBrowserView *)self->_webBrowserView autoFillDelegate];
  id v7 = +[UIWebBrowserView getUIWebBrowserViewForWebFrame:a4];
  [(UIWebAutoFillDelegate *)v6 webBrowserView:v7 didEndEditingTextField:a3 inFrame:a4];
}

- (BOOL)textField:(id)a3 doCommandBySelector:(SEL)a4 inFrame:(id)a5
{
  return 0;
}

- (void)didFocusTextField:(id)a3 inFrame:(id)a4
{
  id v7 = [(UIWebBrowserView *)self->_webBrowserView autoFillDelegate];
  webBrowserView = self->_webBrowserView;
  [(UIWebAutoFillDelegate *)v7 webBrowserView:webBrowserView didFocusTextField:a3 inFrame:a4];
}

- (void)willSendSubmitEventToForm:(id)a3 inFrame:(id)a4 withValues:(id)a5
{
  [(UIWebBrowserView *)self->_webBrowserView autoFillDelegate];
  if (objc_opt_respondsToSelector())
  {
    v9 = [(UIWebBrowserView *)self->_webBrowserView autoFillDelegate];
    id v10 = +[UIWebBrowserView getUIWebBrowserViewForWebFrame:a4];
    [(UIWebAutoFillDelegate *)v9 webBrowserView:v10 willSendSubmitEventToForm:a3 inFrame:a4 withValues:a5];
  }
}

- (UIWebFormDelegate)initWithWebBrowserView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIWebFormDelegate;
  v4 = [(UIWebFormDelegate *)&v7 init];
  if (v4)
  {
    v5 = objc_alloc_init(_UIWebFormDelegateEditedFormsMap);
    v4->_webBrowserView = (UIWebBrowserView *)a3;
    v4->_editedForms = v5;
  }
  return v4;
}

- (BOOL)formWasEdited
{
  v2 = objc_msgSend(-[_UIWebFormDelegateEditedFormsMap allValues](self->_editedForms, "allValues"), "objectEnumerator");
  objc_super v3 = (void *)[v2 nextObject];
  if (v3)
  {
    while (1)
    {
      v4 = (void *)[v3 objectEnumerator];
      uint64_t v5 = [v4 nextObject];
      if (v5) {
        break;
      }
LABEL_12:
      objc_super v3 = (void *)[v2 nextObject];
      if (!v3) {
        return (char)v3;
      }
    }
    v6 = (void *)v5;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (([v6 _isEdited] & 1) == 0) {
          goto LABEL_11;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ![v6 _isEdited]) {
          goto LABEL_11;
        }
      }
      if ([v6 inDocument] && !objc_msgSend(v6, "isHidden"))
      {
        LOBYTE(v3) = 1;
        return (char)v3;
      }
LABEL_11:
      v6 = (void *)[v4 nextObject];
      if (!v6) {
        goto LABEL_12;
      }
    }
  }
  return (char)v3;
}

- ($94EAB4A8BE99507F6334A41B2EE9F3E4)suggestionsForString:(id)a3 inputIndex:(unsigned int)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v6 = (void *)[(UIWebAutoFillDelegate *)[(UIWebBrowserView *)self->_webBrowserView autoFillDelegate] webBrowserView:self->_webBrowserView suggestionsForString:a3];
  objc_super v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count") + 1);
  [v7 addObject:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E4FAE318], "candidateWithCandidate:forInput:", *(void *)(*((void *)&v14 + 1) + 8 * v11++), a3));
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  unint64_t v12 = a4;
  v13 = v7;
  result.var1 = v12;
  result.var0 = v13;
  return result;
}

- (BOOL)hasCurrentSuggestions
{
  objc_super v3 = [(UIWebBrowserView *)self->_webBrowserView autoFillDelegate];
  webBrowserView = self->_webBrowserView;
  return [(UIWebAutoFillDelegate *)v3 hasCurrentSuggestionsForWebBrowserView:webBrowserView];
}

- (void)acceptedAutoFillWord:(id)a3
{
  uint64_t v5 = [(UIWebBrowserView *)self->_webBrowserView autoFillDelegate];
  webBrowserView = self->_webBrowserView;
  [(UIWebAutoFillDelegate *)v5 webBrowserView:webBrowserView acceptedAutoFillWord:a3];
}

- (void)_didEditFormElement:(id)a3 inFrame:(id)a4
{
  BOOL v7 = [(UIWebFormDelegate *)self formWasEdited];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v8 = (void *)[a3 form];
    if (v8)
    {
      uint64_t v9 = v8;
      if (objc_msgSend((id)objc_msgSend(v8, "action"), "length")
        || objc_msgSend((id)objc_msgSend(v9, "method"), "length"))
      {
        id v10 = [(_UIWebFormDelegateEditedFormsMap *)self->_editedForms objectForKey:a4];
        if (!v10)
        {
          id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [(_UIWebFormDelegateEditedFormsMap *)self->_editedForms setObject:v10 forKey:a4];
        }
        if (([v10 containsObject:a3] & 1) == 0) {
          [v10 addObject:a3];
        }
      }
    }
  }
  if (v7 != [(UIWebFormDelegate *)self formWasEdited]
    && objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"DebugConfirmTossingUnsubmittedFormTextPreferenceKey"))
  {
    webBrowserView = self->_webBrowserView;
    uint64_t v12 = [a4 webView];
    [(UIWebBrowserView *)webBrowserView _webViewFormEditedStatusHasChanged:v12];
  }
}

- (BOOL)_shouldIgnoreFormTextChangesInFrame:(id)a3
{
  return [(UIWebBrowserView *)self->_webBrowserView _isAutoFilling];
}

- (void)_clearEditedFormsInFrame:(id)a3
{
  BOOL v5 = [(UIWebFormDelegate *)self formWasEdited];
  id v6 = [(_UIWebFormDelegateEditedFormsMap *)self->_editedForms objectForKey:a3];
  editedForms = self->_editedForms;
  if (v6) {
    [(_UIWebFormDelegateEditedFormsMap *)editedForms removeObjectForKey:a3];
  }
  else {
    [(_UIWebFormDelegateEditedFormsMap *)editedForms removeAllObjects];
  }
  if (v5 != [(UIWebFormDelegate *)self formWasEdited]
    && objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"DebugConfirmTossingUnsubmittedFormTextPreferenceKey"))
  {
    webBrowserView = self->_webBrowserView;
    uint64_t v9 = [a3 webView];
    [(UIWebBrowserView *)webBrowserView _webViewFormEditedStatusHasChanged:v9];
  }
}

@end