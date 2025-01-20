@interface UIDictationTipReplacementHandler
- (NSMutableString)replacementText;
- (NSString)replacementTargetText;
- (UIDelayedAction)finalizeAction;
- (UIDictationTipHandlerDelegate)delegate;
- (UIDictationTipReplacementHandler)initWithDelegate:(id)a3;
- (int64_t)textRecorderStatus;
- (void)finalizeRecordedText;
- (void)recordDictationTipText:(id)a3;
- (void)resetHandler;
- (void)setDelegate:(id)a3;
- (void)setFinalizeAction:(id)a3;
- (void)setReplacementTargetText:(id)a3;
- (void)setReplacementText:(id)a3;
- (void)setTextRecorderStatus:(int64_t)a3;
- (void)startRecodingText:(id)a3;
@end

@implementation UIDictationTipReplacementHandler

- (UIDictationTipReplacementHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDictationTipReplacementHandler;
  v5 = [(UIDictationTipReplacementHandler *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(UIDictationTipReplacementHandler *)v5 setDelegate:v4];
    v7 = [[UIDelayedAction alloc] initWithTarget:v6 action:sel_finalizeRecordedText userInfo:0 delay:1.0];
    finalizeAction = v6->_finalizeAction;
    v6->_finalizeAction = v7;

    [(UIDictationTipReplacementHandler *)v6 resetHandler];
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (void)resetHandler
{
  replacementTargetText = self->_replacementTargetText;
  self->_replacementTargetText = (NSString *)&stru_1ED0E84C0;

  id v4 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  replacementText = self->_replacementText;
  self->_replacementText = v4;

  [(UIDelayedAction *)self->_finalizeAction cancel];
  self->_textRecorderStatus = 0;
}

- (void)startRecodingText:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = [WeakRetained getDictationTipSignaled];

  if (!v5)
  {
    [(UIDictationTipReplacementHandler *)self resetHandler];
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = [v6 replaceEmojiInStringWithEmojiDictationCommand:v9];
    replacementTargetText = self->_replacementTargetText;
    self->_replacementTargetText = v7;

    self->_textRecorderStatus = 1;
  }
}

- (void)recordDictationTipText:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained getDictationTipSignaled])
  {
  }
  else
  {
    int64_t textRecorderStatus = self->_textRecorderStatus;

    if (textRecorderStatus != 2)
    {
      [(UIDelayedAction *)self->_finalizeAction unschedule];
      [(NSMutableString *)self->_replacementText appendString:v6];
      self->_int64_t textRecorderStatus = 1;
      [(UIDelayedAction *)self->_finalizeAction touch];
    }
  }
}

- (void)finalizeRecordedText
{
  self->_int64_t textRecorderStatus = 2;
  _UILocalizedString(@"Dictation Replacement Tip Body Standard", @"Standard description of the Replacement tip", @"To edit text while dictating, just say 'Change... to...'");
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  int v4 = [v3 BOOLForPreferenceKey:@"DictationTipContextual"];

  if (v4)
  {
    replacementTargetText = self->_replacementTargetText;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = [WeakRetained replaceEmojiInStringWithEmojiDictationCommand:self->_replacementText];
    v12 = _UILocalizedFormat(@"Dictation Replacement Tip Body Contextual", @"Contextual description of the Replacement tip", @"To edit your message while you dictate, say “Replace ‘%@’ with ‘%@'", v7, v8, v9, v10, v11, (uint64_t)replacementTargetText);
  }
  v13 = [(UIDictationTipReplacementHandler *)self delegate];
  v14 = _UILocalizedString(@"Dictation Replacement Tip Title", @"Title of the Replacement tip", @"Replace Text");
  [v13 finalizeTextWithTipType:0 title:v14 andTipDescription:v16];
}

- (UIDictationTipHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIDictationTipHandlerDelegate *)WeakRetained;
}

- (NSString)replacementTargetText
{
  return self->_replacementTargetText;
}

- (void)setReplacementTargetText:(id)a3
{
}

- (NSMutableString)replacementText
{
  return self->_replacementText;
}

- (void)setReplacementText:(id)a3
{
}

- (UIDelayedAction)finalizeAction
{
  return self->_finalizeAction;
}

- (void)setFinalizeAction:(id)a3
{
}

- (int64_t)textRecorderStatus
{
  return self->_textRecorderStatus;
}

- (void)setTextRecorderStatus:(int64_t)a3
{
  self->_int64_t textRecorderStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalizeAction, 0);
  objc_storeStrong((id *)&self->_replacementText, 0);
  objc_storeStrong((id *)&self->_replacementTargetText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end