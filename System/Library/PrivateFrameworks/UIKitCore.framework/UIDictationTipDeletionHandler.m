@interface UIDictationTipDeletionHandler
- (NSMutableString)cachedDeletedText;
- (NSMutableString)deletionText;
- (UIDelayedAction)finalizeAction;
- (UIDictationTipDeletionHandler)initWithDelegate:(id)a3;
- (UIDictationTipHandlerDelegate)delegate;
- (_NSRange)lastSelectedDeletionRange;
- (int64_t)currentDeletionEventCount;
- (int64_t)deletionEventCount;
- (int64_t)textRecorderStatus;
- (void)addDeletionEventCount:(id)a3 deletedTextRange:(_NSRange)a4;
- (void)finalizeRecordedText;
- (void)recordDictationTipText:(id)a3;
- (void)resetDeletionEventCount;
- (void)resetHandler;
- (void)resetRecorder;
- (void)setCachedDeletedText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeletionEventCount:(int64_t)a3;
- (void)setDeletionText:(id)a3;
- (void)setFinalizeAction:(id)a3;
- (void)setLastSelectedDeletionRange:(_NSRange)a3;
- (void)setTextRecorderStatus:(int64_t)a3;
- (void)setlastDeletionRange:(_NSRange)a3;
- (void)startRecodingText:(id)a3;
@end

@implementation UIDictationTipDeletionHandler

- (UIDictationTipDeletionHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIDictationTipDeletionHandler;
  v5 = [(UIDictationTipDeletionHandler *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(UIDictationTipDeletionHandler *)v5 setDelegate:v4];
    [(UIDictationTipDeletionHandler *)v6 resetDeletionEventCount];
    v7 = [[UIDelayedAction alloc] initWithTarget:v6 action:sel_finalizeRecordedText userInfo:0 delay:1.0];
    finalizeAction = v6->_finalizeAction;
    v6->_finalizeAction = v7;

    [(UIDictationTipDeletionHandler *)v6 resetHandler];
  }

  return v6;
}

- (void)resetDeletionEventCount
{
  self->_deletionEventCount = 0;
  v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  cachedDeletedText = self->_cachedDeletedText;
  self->_cachedDeletedText = v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)resetRecorder
{
  v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
  deletionText = self->_deletionText;
  self->_deletionText = v3;

  [(UIDelayedAction *)self->_finalizeAction cancel];
  self->_textRecorderStatus = 0;
}

- (void)resetHandler
{
  [(UIDictationTipDeletionHandler *)self resetDeletionEventCount];
  [(UIDictationTipDeletionHandler *)self resetRecorder];
}

- (void)setlastDeletionRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  int v6 = LODWORD(a3.location) - LODWORD(self->_lastSelectedDeletionRange.location);
  if (v6 < 0) {
    int v6 = LODWORD(self->_lastSelectedDeletionRange.location) - LODWORD(a3.location);
  }
  if (v6 >= 2) {
    [(UIDictationTipDeletionHandler *)self resetDeletionEventCount];
  }
  self->_lastSelectedDeletionRange.NSUInteger location = location;
  self->_lastSelectedDeletionRange.NSUInteger length = length;
}

- (void)addDeletionEventCount:(id)a3 deletedTextRange:(_NSRange)a4
{
  if (a3)
  {
    NSUInteger length = a4.length;
    NSUInteger location = a4.location;
    id v8 = a3;
    -[UIDictationTipDeletionHandler setlastDeletionRange:](self, "setlastDeletionRange:", location, length);
    cachedDeletedText = self->_cachedDeletedText;
    ++self->_deletionEventCount;
    [(NSMutableString *)cachedDeletedText insertString:v8 atIndex:0];
  }
}

- (int64_t)currentDeletionEventCount
{
  return self->_deletionEventCount;
}

- (void)startRecodingText:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v5 = [WeakRetained getDictationTipSignaled];

  if (v5 == 1)
  {
    [(UIDictationTipDeletionHandler *)self resetRecorder];
    int v6 = [MEMORY[0x1E4F28E78] stringWithString:self->_cachedDeletedText];
    deletionText = self->_deletionText;
    self->_deletionText = v6;

    if ((unint64_t)[v8 length] >= 2) {
      [(UIDictationTipDeletionHandler *)self recordDictationTipText:v8];
    }
  }
}

- (void)recordDictationTipText:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained getDictationTipSignaled] == 1)
  {
    int64_t textRecorderStatus = self->_textRecorderStatus;

    if (textRecorderStatus != 2)
    {
      [(UIDelayedAction *)self->_finalizeAction unschedule];
      [(NSMutableString *)self->_deletionText insertString:v6 atIndex:0];
      self->_int64_t textRecorderStatus = 1;
      [(UIDelayedAction *)self->_finalizeAction touch];
    }
  }
  else
  {
  }
}

- (void)finalizeRecordedText
{
  self->_int64_t textRecorderStatus = 2;
  _UILocalizedString(@"Dictation Deletion Tip Body Standard", @"Standard Description of the deletion tip", @"While dictating, just say 'Delete...'");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  if ([v3 BOOLForPreferenceKey:@"DictationTipContextual"])
  {
  }
  else
  {
    char v4 = [(NSMutableString *)self->_deletionText _containsEmojiOnly];

    if ((v4 & 1) == 0) {
      goto LABEL_5;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = [WeakRetained replaceEmojiInStringWithEmojiDictationCommand:self->_deletionText];
  uint64_t v12 = _UILocalizedFormat(@"Dictation Deletion Tip Body Contextual", @"Contextual Description of the deletion tip", @"While you dictate, say Delete ‘%@’", v7, v8, v9, v10, v11, (uint64_t)v6);

  id v15 = (id)v12;
LABEL_5:
  v13 = [(UIDictationTipDeletionHandler *)self delegate];
  v14 = _UILocalizedString(@"Dictation Deletion Tip Title", @"Title of the deletion tip", @"Delete Text");
  [v13 finalizeTextWithTipType:1 title:v14 andTipDescription:v15];

  [(UIDictationTipDeletionHandler *)self resetDeletionEventCount];
}

- (UIDictationTipHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIDictationTipHandlerDelegate *)WeakRetained;
}

- (NSMutableString)deletionText
{
  return self->_deletionText;
}

- (void)setDeletionText:(id)a3
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

- (_NSRange)lastSelectedDeletionRange
{
  NSUInteger length = self->_lastSelectedDeletionRange.length;
  NSUInteger location = self->_lastSelectedDeletionRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setLastSelectedDeletionRange:(_NSRange)a3
{
  self->_lastSelectedDeletionRange = a3;
}

- (int64_t)deletionEventCount
{
  return self->_deletionEventCount;
}

- (void)setDeletionEventCount:(int64_t)a3
{
  self->_deletionEventCount = a3;
}

- (NSMutableString)cachedDeletedText
{
  return self->_cachedDeletedText;
}

- (void)setCachedDeletedText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDeletedText, 0);
  objc_storeStrong((id *)&self->_finalizeAction, 0);
  objc_storeStrong((id *)&self->_deletionText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end