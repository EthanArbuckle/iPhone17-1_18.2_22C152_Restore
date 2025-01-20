@interface UIDictationTipController
+ (id)dictationTipPreferenceKey:(int64_t)a3;
- (BOOL)dictationTipShown:(int64_t)a3;
- (BOOL)modelessTipShown;
- (UIDictationTipController)init;
- (UIDictationTipDeletionHandler)dictationDeletionTipHandler;
- (UIDictationTipEmojiHandler)dictationEmojiTipHandler;
- (UIDictationTipInsertionHandler)dictationInsertionTipHandler;
- (UIDictationTipModelessInputHandler)dictationTipModelessInputHandler;
- (UIDictationTipPresentationHandler)dictationTipPresentationHandler;
- (UIDictationTipReplacementHandler)dictationReplacementTipHandler;
- (UIDictationTipSelectionHandler)dictationSelectionTipHandler;
- (id)delayedTip;
- (id)replaceEmojiInStringWithEmojiDictationCommand:(id)a3;
- (int64_t)activeTipType;
- (int64_t)currentDeletionEventCount;
- (int64_t)getDictationTipSignaled;
- (unint64_t)dismissalReasonType;
- (void)addDeletionEventCount:(id)a3 deletedTextRange:(_NSRange)a4;
- (void)dictationCommandUsed:(unint64_t)a3 firstTargetString:(id)a4 secondTargetString:(id)a5;
- (void)emitTipShowingInstrumentation:(int64_t)a3;
- (void)finalizeSelectionTip;
- (void)finalizeTextWithTipType:(int64_t)a3 title:(id)a4 andTipDescription:(id)a5;
- (void)incrementDictationTipDisplayCount:(int64_t)a3 stopFutureShowing:(BOOL)a4;
- (void)logDictationTipDimissialInstrumentation;
- (void)markDictationTipPreferenceToShown:(int64_t)a3;
- (void)presentDelayedTipIfNeeded;
- (void)processSoftwareKeyboardInteraction;
- (void)processUserInteractionEnded;
- (void)recordDictationTipDeletionText:(id)a3;
- (void)recordDictationTipReplacementText:(id)a3;
- (void)reset;
- (void)resetDeletionEventCount;
- (void)resetShowModelessTipSignal;
- (void)setDelayedTip:(id)a3;
- (void)setDictationDeletionTipHandler:(id)a3;
- (void)setDictationEmojiTipHandler:(id)a3;
- (void)setDictationInsertionTipHandler:(id)a3;
- (void)setDictationReplacementTipHandler:(id)a3;
- (void)setDictationSelectionTipHandler:(id)a3;
- (void)setDictationTipModelessInputHandler:(id)a3;
- (void)setDictationTipPresentationHandler:(id)a3;
- (void)setDismissalReasonType:(unint64_t)a3;
- (void)showDictationTipWithTitle:(id)a3 description:(id)a4 dictationTipType:(int64_t)a5;
- (void)signalDictationClearAllTip;
- (void)signalDictationDeletionTip:(id)a3;
- (void)signalDictationEmojiTip:(id)a3;
- (void)signalDictationInsertionTip:(id)a3;
- (void)signalDictationReplacementTip:(id)a3;
- (void)signalDictationSelectionTip:(id)a3;
- (void)signalDictationSendMessageTip;
- (void)signalShowModelessTipIfNeeded;
- (void)triggerModelessInputTipDictationStoppedSignal;
@end

@implementation UIDictationTipController

- (UIDictationTipController)init
{
  v18.receiver = self;
  v18.super_class = (Class)UIDictationTipController;
  v2 = [(UIDictationTipController *)&v18 init];
  if (v2)
  {
    v3 = objc_alloc_init(UIDictationTipPresentationHandler);
    dictationTipPresentationHandler = v2->_dictationTipPresentationHandler;
    v2->_dictationTipPresentationHandler = v3;

    v5 = [[UIDictationTipReplacementHandler alloc] initWithDelegate:v2];
    dictationReplacementTipHandler = v2->_dictationReplacementTipHandler;
    v2->_dictationReplacementTipHandler = v5;

    v7 = [[UIDictationTipDeletionHandler alloc] initWithDelegate:v2];
    dictationDeletionTipHandler = v2->_dictationDeletionTipHandler;
    v2->_dictationDeletionTipHandler = v7;

    v9 = objc_alloc_init(UIDictationTipEmojiHandler);
    dictationEmojiTipHandler = v2->_dictationEmojiTipHandler;
    v2->_dictationEmojiTipHandler = v9;

    v11 = [[UIDictationTipSelectionHandler alloc] initWithDelegate:v2];
    dictationSelectionTipHandler = v2->_dictationSelectionTipHandler;
    v2->_dictationSelectionTipHandler = v11;

    v13 = [[UIDictationTipInsertionHandler alloc] initWithDelegate:v2];
    dictationInsertionTipHandler = v2->_dictationInsertionTipHandler;
    v2->_dictationInsertionTipHandler = v13;

    v15 = [[UIDictationTipModelessInputHandler alloc] initWithDelegate:v2];
    dictationTipModelessInputHandler = v2->_dictationTipModelessInputHandler;
    v2->_dictationTipModelessInputHandler = v15;
  }
  return v2;
}

+ (id)dictationTipPreferenceKey:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_1E530FA78 + a3);
  }
  return v4;
}

- (void)presentDelayedTipIfNeeded
{
  if (self->_delayedTip)
  {
    v2 = [(UIDictationTipController *)self delayedTip];
    v2[2]();
  }
}

- (BOOL)dictationTipShown:(int64_t)a3
{
  return [(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler dictationTipShownOverLimit:a3];
}

- (int64_t)getDictationTipSignaled
{
  return [(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler getDictationTipSignaled];
}

- (void)showDictationTipWithTitle:(id)a3 description:(id)a4 dictationTipType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[UIDictationController sharedInstance];
  int v11 = [v10 isDictationPaused];
  if (a5 == 7 || !v11)
  {
  }
  else
  {

    if (a5 != 5)
    {
      objc_initWeak(&location, self);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __83__UIDictationTipController_showDictationTipWithTitle_description_dictationTipType___block_invoke;
      v13[3] = &unk_1E53080E8;
      objc_copyWeak(v16, &location);
      id v14 = v8;
      id v15 = v9;
      v16[1] = (id)a5;
      [(UIDictationTipController *)self setDelayedTip:v13];

      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
      goto LABEL_10;
    }
  }
  if (![(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler isShowingTip]
    && ([v9 _containsEmoji] & 1) == 0)
  {
    [(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler signalTipPresentedInCurrentDictationSession];
    v12 = +[UIKeyboardImpl activeInstance];
    [v12 presentDictationMenuTipWithTitle:v8 description:v9];

    [(UIDictationTipController *)self incrementDictationTipDisplayCount:a5 stopFutureShowing:0];
    [(UIDictationTipController *)self emitTipShowingInstrumentation:a5];
    [(UIDictationTipController *)self setDelayedTip:0];
  }
  [(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler resetDictationTipSignal];
LABEL_10:
}

void __83__UIDictationTipController_showDictationTipWithTitle_description_dictationTipType___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained showDictationTipWithTitle:*(void *)(a1 + 32) description:*(void *)(a1 + 40) dictationTipType:*(void *)(a1 + 56)];
}

- (void)dictationCommandUsed:(unint64_t)a3 firstTargetString:(id)a4 secondTargetString:(id)a5
{
  id v9 = a5;
  if (([a4 _containsEmoji] & 1) != 0 || objc_msgSend(v9, "_containsEmoji")) {
    [(UIDictationTipController *)self incrementDictationTipDisplayCount:3 stopFutureShowing:1];
  }
  unint64_t v8 = a3 - 1;
  if (a3 - 1 <= 0x13 && ((0x8603Bu >> v8) & 1) != 0) {
    [(UIDictationTipController *)self markDictationTipPreferenceToShown:qword_186B9E2A0[v8]];
  }
}

- (void)incrementDictationTipDisplayCount:(int64_t)a3 stopFutureShowing:(BOOL)a4
{
  if (a4)
  {
    v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v6 = [v5 valueForPreferenceKey:*MEMORY[0x1E4FAE5D8]];

    uint64_t v7 = [v6 integerValue];
  }
  else
  {
    v6 = [(UIDictationTipController *)self dictationTipPresentationHandler];
    uint64_t v7 = [v6 dictationTipDisplayCount:a3] + 1;
  }

  unint64_t v8 = +[UIDictationTipController dictationTipPreferenceKey:a3];
  if (v8)
  {
    id v12 = v8;
    id v9 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v10 = [v9 preferencesActions];
    int v11 = [NSNumber numberWithInteger:v7];
    [v10 updateDictationTipDisplayCount:v11 dictationTipKey:v12];

    unint64_t v8 = v12;
  }
}

- (void)markDictationTipPreferenceToShown:(int64_t)a3
{
  if (a3 != 9) {
    [(UIDictationTipController *)self incrementDictationTipDisplayCount:a3 stopFutureShowing:1];
  }
}

- (void)reset
{
  [(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler resetHandler];
  [(UIDictationTipReplacementHandler *)self->_dictationReplacementTipHandler resetHandler];
  [(UIDictationTipDeletionHandler *)self->_dictationDeletionTipHandler resetHandler];
  dictationInsertionTipHandler = self->_dictationInsertionTipHandler;
  [(UIDictationTipInsertionHandler *)dictationInsertionTipHandler resetHandler];
}

- (int64_t)activeTipType
{
  return [(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler getDictationTipSignaled];
}

- (void)logDictationTipDimissialInstrumentation
{
  unint64_t v2 = [(UIDictationTipController *)self dismissalReasonType];
  id v3 = objc_alloc_init((Class)getSISchemaUEIDictationDiscoveryToolTipDisplayContextClass());
  id v4 = objc_alloc((Class)getSISchemaUUIDClass_0());
  v5 = +[UIKeyboardImpl activeInstance];
  v6 = [v5 _sessionIdentifier];
  uint64_t v7 = (void *)[v4 initWithNSUUID:v6];
  [v3 setContextId:v7];

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  unint64_t v8 = (void *)getSISchemaUEIDictationDiscoveryToolTipDismissedClass_softClass;
  uint64_t v18 = getSISchemaUEIDictationDiscoveryToolTipDismissedClass_softClass;
  if (!getSISchemaUEIDictationDiscoveryToolTipDismissedClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getSISchemaUEIDictationDiscoveryToolTipDismissedClass_block_invoke;
    v14[3] = &unk_1E52D9900;
    v14[4] = &v15;
    __getSISchemaUEIDictationDiscoveryToolTipDismissedClass_block_invoke((uint64_t)v14);
    unint64_t v8 = (void *)v16[3];
  }
  if (v2 == 2) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = v2 == 1;
  }
  v10 = v8;
  _Block_object_dispose(&v15, 8);
  id v11 = objc_alloc_init(v10);
  [v11 setDismissalReason:v9];
  [v3 setEnded:v11];
  id v12 = +[UIDictationController sharedInstance];
  v13 = [v12 currentInstrumentationContext];
  [v13 emitInstrumentation:v3];
}

- (void)emitTipShowingInstrumentation:(int64_t)a3
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2050000000;
  id v4 = (void *)getSISchemaUEIDictationDiscoveryToolTipShownClass_softClass;
  uint64_t v20 = getSISchemaUEIDictationDiscoveryToolTipShownClass_softClass;
  if (!getSISchemaUEIDictationDiscoveryToolTipShownClass_softClass)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    id v16[2] = __getSISchemaUEIDictationDiscoveryToolTipShownClass_block_invoke;
    v16[3] = &unk_1E52D9900;
    v16[4] = &v17;
    __getSISchemaUEIDictationDiscoveryToolTipShownClass_block_invoke((uint64_t)v16);
    id v4 = (void *)v18[3];
  }
  v5 = v4;
  _Block_object_dispose(&v17, 8);
  id v6 = objc_alloc_init(v5);
  uint64_t v7 = v6;
  if ((unint64_t)a3 > 6) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = dword_186B9E340[a3];
  }
  [v6 setToolTipShown:v8];
  id v9 = objc_alloc_init((Class)getSISchemaUEIDictationDiscoveryToolTipDisplayContextClass());
  id v10 = objc_alloc((Class)getSISchemaUUIDClass_0());
  id v11 = +[UIKeyboardImpl activeInstance];
  id v12 = [v11 _sessionIdentifier];
  v13 = (void *)[v10 initWithNSUUID:v12];
  [v9 setContextId:v13];

  [v9 setStartedOrChanged:v7];
  id v14 = +[UIDictationController sharedInstance];
  uint64_t v15 = [v14 currentInstrumentationContext];
  [v15 emitInstrumentation:v9];
}

- (id)replaceEmojiInStringWithEmojiDictationCommand:(id)a3
{
  return [(UIDictationTipEmojiHandler *)self->_dictationEmojiTipHandler replaceEmojiInStringWithEmojiDictationCommand:a3];
}

- (void)signalDictationReplacementTip:(id)a3
{
  id v6 = a3;
  id v4 = +[UIDictationController sharedInstance];
  int v5 = [v4 isDictationPaused];

  if (v5
    && [(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler shouldSignalDictationTip:0])
  {
    [(UIDictationTipReplacementHandler *)self->_dictationReplacementTipHandler startRecodingReplacementText:v6];
  }
}

- (void)recordDictationTipReplacementText:(id)a3
{
}

- (void)finalizeTextWithTipType:(int64_t)a3 title:(id)a4 andTipDescription:(id)a5
{
}

- (void)recordDictationTipDeletionText:(id)a3
{
}

- (void)signalDictationDeletionTip:(id)a3
{
  id v6 = a3;
  id v4 = +[UIDictationController sharedInstance];
  int v5 = [v4 isDictationPaused];

  if (v5)
  {
    if ([(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler shouldSignalDictationTip:1])
    {
      [(UIDictationTipDeletionHandler *)self->_dictationDeletionTipHandler startRecodingDeletionText:v6];
    }
    else if ([(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler getDictationTipSignaled] == 1)
    {
      [(UIDictationTipDeletionHandler *)self->_dictationDeletionTipHandler recordDictationTipDeletionText:v6];
    }
  }
}

- (void)resetDeletionEventCount
{
}

- (void)addDeletionEventCount:(id)a3 deletedTextRange:(_NSRange)a4
{
}

- (int64_t)currentDeletionEventCount
{
  return [(UIDictationTipDeletionHandler *)self->_dictationDeletionTipHandler currentDeletionEventCount];
}

- (void)signalDictationClearAllTip
{
  id v3 = +[UIDictationController sharedInstance];
  int v4 = [v3 isDictationPaused];

  if (v4)
  {
    [(UIDictationTipController *)self reset];
    if ([(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler shouldSignalDictationTip:5])
    {
      _UILocalizedFormat(@"Dictation Clear All Tip Body", @"Description of the clear all tip", @"While dictating, just say 'Clear all...'", v5, v6, v7, v8, v9, v11);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = _UILocalizedString(@"Dictation Clear All Tip Title", @"Title of the Clear All tip", @"Clear All");
      [(UIDictationTipController *)self finalizeTextWithTipType:5 title:v10 andTipDescription:v12];
    }
  }
}

- (void)signalDictationSelectionTip:(id)a3
{
  id v6 = a3;
  int v4 = +[UIDictationController sharedInstance];
  int v5 = [v4 isDictationPaused];

  if (v5
    && [(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler shouldSignalDictationTip:4])
  {
    [(UIDictationTipSelectionHandler *)self->_dictationSelectionTipHandler signalSelectedText:v6];
  }
}

- (void)finalizeSelectionTip
{
  if ([(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler getDictationTipSignaled] == 4)
  {
    dictationSelectionTipHandler = self->_dictationSelectionTipHandler;
    [(UIDictationTipSelectionHandler *)dictationSelectionTipHandler finalizeSelectionTip];
  }
}

- (void)signalDictationSendMessageTip
{
  [(UIDictationTipController *)self reset];
  if ([(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler shouldSignalDictationTip:7])
  {
    _UILocalizedFormat(@"Dictation Send Message Tip Body", @"Description of the send message tip", @"When you're done dictating a message, just say 'Send it'", v3, v4, v5, v6, v7, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = _UILocalizedString(@"Dictation Send Message Tip Title", @"Title of the Send Message tip", @"Send It");
    [(UIDictationTipController *)self finalizeTextWithTipType:5 title:v8 andTipDescription:v10];
  }
}

- (void)signalDictationEmojiTip:(id)a3
{
  id v14 = a3;
  [(UIDictationTipController *)self reset];
  if ([(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler shouldSignalDictationTip:3])
  {
    dictationEmojiTipHandler = self->_dictationEmojiTipHandler;
    uint64_t v5 = [(UIDictationTipEmojiHandler *)dictationEmojiTipHandler replaceEmojiInStringWithEmojiDictationCommand:v14];
    uint64_t v6 = [(UIDictationTipEmojiHandler *)dictationEmojiTipHandler replaceEmojiInStringWithEmojiDictationCommand:v5];
    id v12 = _UILocalizedFormat(@"Dictation Emoji Tip Body", @"Description of the emoji tip", @"While dictating, just say '%@'", v7, v8, v9, v10, v11, (uint64_t)v6);

    v13 = _UILocalizedString(@"Dictation Emoji Tip Title", @"Title of the Emoji tip", @"Speak Emoji");
    [(UIDictationTipController *)self finalizeTextWithTipType:3 title:v13 andTipDescription:v12];
  }
}

- (void)signalDictationInsertionTip:(id)a3
{
  id v8 = a3;
  uint64_t v4 = +[UIDictationController sharedInstance];
  int v5 = [v4 isDictationPaused];

  uint64_t v6 = v8;
  if (v5)
  {
    if ([(UIDictationTipController *)self dictationTipShown:3]
      || ![v8 _containsEmojiOnly])
    {
      if ([(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler shouldSignalDictationTip:2])
      {
        [(UIDictationTipInsertionHandler *)self->_dictationInsertionTipHandler startRecodingText:v8];
      }
      else
      {
        int64_t v7 = [(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler getDictationTipSignaled];
        uint64_t v6 = v8;
        if (v7 != 2) {
          goto LABEL_10;
        }
        [(UIDictationTipInsertionHandler *)self->_dictationInsertionTipHandler recordDictationTipText:v8];
      }
    }
    else
    {
      [(UIDictationTipController *)self signalDictationEmojiTip:v8];
    }
    uint64_t v6 = v8;
  }
LABEL_10:
}

- (BOOL)modelessTipShown
{
  return [(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler dictationTipShownOverLimit:6];
}

- (void)triggerModelessInputTipDictationStoppedSignal
{
  id v2 = [(UIDictationTipController *)self dictationTipModelessInputHandler];
  [v2 setModelessInputTipDictationStoppedSignal:1];
}

- (void)processSoftwareKeyboardInteraction
{
  id v2 = [(UIDictationTipController *)self dictationTipModelessInputHandler];
  [v2 processSoftwareKeyboardInteraction];
}

- (void)processUserInteractionEnded
{
  if ([(UIDictationTipPresentationHandler *)self->_dictationTipPresentationHandler shouldSignalDictationTip:6])
  {
    id v3 = [(UIDictationTipController *)self dictationTipModelessInputHandler];
    [v3 processUserInteractionEnded];
  }
}

- (void)signalShowModelessTipIfNeeded
{
  id v2 = [(UIDictationTipController *)self dictationTipModelessInputHandler];
  [v2 setShouldAttemptToShowModelessTip:1];
}

- (void)resetShowModelessTipSignal
{
  id v2 = [(UIDictationTipController *)self dictationTipModelessInputHandler];
  [v2 resetDictationTipModelessHandlerSignalFlags];
}

- (unint64_t)dismissalReasonType
{
  return self->_dismissalReasonType;
}

- (void)setDismissalReasonType:(unint64_t)a3
{
  self->_dismissalReasonType = a3;
}

- (UIDictationTipPresentationHandler)dictationTipPresentationHandler
{
  return self->_dictationTipPresentationHandler;
}

- (void)setDictationTipPresentationHandler:(id)a3
{
}

- (UIDictationTipReplacementHandler)dictationReplacementTipHandler
{
  return self->_dictationReplacementTipHandler;
}

- (void)setDictationReplacementTipHandler:(id)a3
{
}

- (UIDictationTipDeletionHandler)dictationDeletionTipHandler
{
  return self->_dictationDeletionTipHandler;
}

- (void)setDictationDeletionTipHandler:(id)a3
{
}

- (UIDictationTipEmojiHandler)dictationEmojiTipHandler
{
  return self->_dictationEmojiTipHandler;
}

- (void)setDictationEmojiTipHandler:(id)a3
{
}

- (UIDictationTipSelectionHandler)dictationSelectionTipHandler
{
  return self->_dictationSelectionTipHandler;
}

- (void)setDictationSelectionTipHandler:(id)a3
{
}

- (UIDictationTipInsertionHandler)dictationInsertionTipHandler
{
  return self->_dictationInsertionTipHandler;
}

- (void)setDictationInsertionTipHandler:(id)a3
{
}

- (UIDictationTipModelessInputHandler)dictationTipModelessInputHandler
{
  return self->_dictationTipModelessInputHandler;
}

- (void)setDictationTipModelessInputHandler:(id)a3
{
}

- (id)delayedTip
{
  return self->_delayedTip;
}

- (void)setDelayedTip:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_delayedTip, 0);
  objc_storeStrong((id *)&self->_dictationTipModelessInputHandler, 0);
  objc_storeStrong((id *)&self->_dictationInsertionTipHandler, 0);
  objc_storeStrong((id *)&self->_dictationSelectionTipHandler, 0);
  objc_storeStrong((id *)&self->_dictationEmojiTipHandler, 0);
  objc_storeStrong((id *)&self->_dictationDeletionTipHandler, 0);
  objc_storeStrong((id *)&self->_dictationReplacementTipHandler, 0);
  objc_storeStrong((id *)&self->_dictationTipPresentationHandler, 0);
}

@end