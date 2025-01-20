@interface UIDictationTipSelectionHandler
- (NSString)selectionText;
- (UIDictationTipHandlerDelegate)delegate;
- (UIDictationTipSelectionHandler)initWithDelegate:(id)a3;
- (void)finalizeSelectionTip;
- (void)setDelegate:(id)a3;
- (void)setSelectionText:(id)a3;
- (void)signalSelectedText:(id)a3;
@end

@implementation UIDictationTipSelectionHandler

- (UIDictationTipSelectionHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIDictationTipSelectionHandler;
  v5 = [(UIDictationTipSelectionHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    [(UIDictationTipSelectionHandler *)v5 setDelegate:v4];
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (void)signalSelectedText:(id)a3
{
  id v17 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = [WeakRetained getDictationTipSignaled];

  if (v5 == 4)
  {
    v6 = _UILocalizedString(@"Dictation Selection Tip Body Standard", @"Standard description of selection tip", @"While you dictate, say something like “Select 'see you later.'”");
    v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
    if ([v7 BOOLForPreferenceKey:@"DictationTipContextual"])
    {
    }
    else
    {
      char v8 = [v17 _containsEmojiOnly];

      if ((v8 & 1) == 0)
      {
LABEL_6:
        [(UIDictationTipSelectionHandler *)self setSelectionText:v6];

        goto LABEL_7;
      }
    }
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = [v9 replaceEmojiInStringWithEmojiDictationCommand:v17];
    uint64_t v16 = _UILocalizedFormat(@"Dictation Selection Tip Body Contextual", @"Contexual description of selection tip", @"While you dictate, say Select ‘%@’", v11, v12, v13, v14, v15, (uint64_t)v10);

    v6 = (void *)v16;
    goto LABEL_6;
  }
LABEL_7:
}

- (void)finalizeSelectionTip
{
  id v4 = [(UIDictationTipSelectionHandler *)self delegate];
  v3 = _UILocalizedString(@"Dictation Selection Tip Title", @"Title of the selection tip", @"Select Text");
  [v4 finalizeTextWithTipType:4 title:v3 andTipDescription:self->_selectionText];
}

- (UIDictationTipHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIDictationTipHandlerDelegate *)WeakRetained;
}

- (NSString)selectionText
{
  return self->_selectionText;
}

- (void)setSelectionText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end