@interface UIDictationTipInsertionHandler
- (NSMutableString)insertionText;
- (UIDelayedAction)finalizeAction;
- (UIDictationTipHandlerDelegate)delegate;
- (UIDictationTipInsertionHandler)initWithDelegate:(id)a3;
- (int64_t)textRecorderStatus;
- (void)finalizeRecordedText;
- (void)recordDictationTipText:(id)a3;
- (void)resetHandler;
- (void)setDelegate:(id)a3;
- (void)setFinalizeAction:(id)a3;
- (void)setInsertionText:(id)a3;
- (void)setTextRecorderStatus:(int64_t)a3;
- (void)startRecodingText:(id)a3;
@end

@implementation UIDictationTipInsertionHandler

- (UIDictationTipInsertionHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDictationTipInsertionHandler;
  v5 = [(UIDictationTipInsertionHandler *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(UIDictationTipInsertionHandler *)v5 setDelegate:v4];
    v7 = [[UIDelayedAction alloc] initWithTarget:v6 action:sel_finalizeRecordedText userInfo:0 delay:1.0];
    finalizeAction = v6->_finalizeAction;
    v6->_finalizeAction = v7;

    [(UIDictationTipInsertionHandler *)v6 resetHandler];
  }

  return v6;
}

- (void)setDelegate:(id)a3
{
}

- (void)resetHandler
{
  v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  insertionText = self->_insertionText;
  self->_insertionText = v3;

  self->_textRecorderStatus = 0;
  finalizeAction = self->_finalizeAction;
  [(UIDelayedAction *)finalizeAction cancel];
}

- (void)finalizeRecordedText
{
  self->_textRecorderStatus = 2;
  _UILocalizedString(@"Dictation Insertion Tip Body Standard", @"Standard description of the Insertion tip", @"While you dictate, say something like Insert ”’super’ before 'happy'“");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  if ([v3 BOOLForPreferenceKey:@"DictationTipContextual"])
  {
  }
  else
  {
    char v4 = [(NSMutableString *)self->_insertionText _containsEmojiOnly];

    if ((v4 & 1) == 0) {
      goto LABEL_5;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = [WeakRetained replaceEmojiInStringWithEmojiDictationCommand:self->_insertionText];
  uint64_t v12 = _UILocalizedFormat(@"Dictation Insertion Tip Body Contextual", @"Contextual description of the Insertion tip", @"While you dictate, say Insert '%@'", v7, v8, v9, v10, v11, (uint64_t)v6);

  id v15 = (id)v12;
LABEL_5:
  v13 = [(UIDictationTipInsertionHandler *)self delegate];
  v14 = _UILocalizedString(@"Dictation Insertion Tip Title", @"Title of the Insertion tip", @"Insert Text");
  [v13 finalizeTextWithTipType:2 title:v14 andTipDescription:v15];
}

- (void)recordDictationTipText:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained getDictationTipSignaled] == 2)
  {
    int64_t textRecorderStatus = self->_textRecorderStatus;

    if (textRecorderStatus != 2)
    {
      [(UIDelayedAction *)self->_finalizeAction unschedule];
      [(NSMutableString *)self->_insertionText appendString:v6];
      self->_int64_t textRecorderStatus = 1;
      [(UIDelayedAction *)self->_finalizeAction touch];
    }
  }
  else
  {
  }
}

- (void)startRecodingText:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = [WeakRetained getDictationTipSignaled];

  if (v5 == 2)
  {
    [(UIDictationTipInsertionHandler *)self resetHandler];
    [(UIDictationTipInsertionHandler *)self recordDictationTipText:v6];
  }
}

- (UIDictationTipHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIDictationTipHandlerDelegate *)WeakRetained;
}

- (NSMutableString)insertionText
{
  return self->_insertionText;
}

- (void)setInsertionText:(id)a3
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
  objc_storeStrong((id *)&self->_insertionText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end