@interface UIDictationTipPresentationHandler
- (BOOL)dictationCommandTipsEnabled;
- (BOOL)dictationTipShownOverLimit:(int64_t)a3;
- (BOOL)isShowingTip;
- (BOOL)shouldSignalDictationTip:(int64_t)a3;
- (BOOL)tipPresentedInCurrentDictationSession;
- (BOOL)tipShownLastWeek;
- (UIDictationTipPresentationHandler)init;
- (int64_t)dictationTipDisplayCount:(int64_t)a3;
- (int64_t)dictationTipSignaled;
- (int64_t)getDictationTipSignaled;
- (void)resetDictationTipSignal;
- (void)resetHandler;
- (void)setDictationTipSignaled:(int64_t)a3;
- (void)setIsShowingTip:(BOOL)a3;
- (void)setTipPresentedInCurrentDictationSession:(BOOL)a3;
- (void)signalTipPresentedInCurrentDictationSession;
@end

@implementation UIDictationTipPresentationHandler

- (UIDictationTipPresentationHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIDictationTipPresentationHandler;
  v2 = [(UIDictationTipPresentationHandler *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_isShowingTip = 0;
    [(UIDictationTipPresentationHandler *)v2 resetHandler];
  }
  return v3;
}

- (void)resetHandler
{
  [(UIDictationTipPresentationHandler *)self setTipPresentedInCurrentDictationSession:0];
  [(UIDictationTipPresentationHandler *)self resetDictationTipSignal];
}

- (void)setTipPresentedInCurrentDictationSession:(BOOL)a3
{
  self->_tipPresentedInCurrentDictationSession = a3;
}

- (void)resetDictationTipSignal
{
  self->_dictationTipSignaled = 9;
}

- (BOOL)dictationTipShownOverLimit:(int64_t)a3
{
  objc_super v5 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v6 = [v5 valueForPreferenceKey:*MEMORY[0x1E4FAE5D8]];

  uint64_t v7 = [v6 integerValue];
  LOBYTE(a3) = v7 <= [(UIDictationTipPresentationHandler *)self dictationTipDisplayCount:a3];

  return a3;
}

- (BOOL)shouldSignalDictationTip:(int64_t)a3
{
  return 0;
}

- (int64_t)getDictationTipSignaled
{
  return self->_dictationTipSignaled;
}

- (void)signalTipPresentedInCurrentDictationSession
{
  self->_tipPresentedInCurrentDictationSession = 1;
}

- (BOOL)tipShownLastWeek
{
  v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  int v3 = [v2 BOOLForPreferenceKey:@"DictationOneTipPerDayEnabled"];

  if (v3)
  {
    v4 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
    objc_super v5 = [v4 valueForPreferenceKey:*MEMORY[0x1E4FAE5D0]];

    objc_opt_class();
    LOBYTE(v3) = (objc_opt_isKindOfClass() & 1) != 0
              && ([MEMORY[0x1E4F1C9C8] date],
                  v6 = objc_claimAutoreleasedReturnValue(),
                  [v6 timeIntervalSinceDate:v5],
                  double v8 = v7,
                  v6,
                  v8 < 604800.0);
  }
  return v3;
}

- (BOOL)dictationCommandTipsEnabled
{
  v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  char v3 = [v2 BOOLForPreferenceKey:@"DictationCommandTipsEnabled"];

  return v3;
}

- (int64_t)dictationTipDisplayCount:(int64_t)a3
{
  char v3 = +[UIDictationTipController dictationTipPreferenceKey:a3];
  if (v3)
  {
    v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
    objc_super v5 = [v4 valueForPreferenceKey:v3];
    int64_t v6 = [v5 integerValue];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)isShowingTip
{
  return self->_isShowingTip;
}

- (void)setIsShowingTip:(BOOL)a3
{
  self->_isShowingTip = a3;
}

- (int64_t)dictationTipSignaled
{
  return self->_dictationTipSignaled;
}

- (void)setDictationTipSignaled:(int64_t)a3
{
  self->_dictationTipSignaled = a3;
}

- (BOOL)tipPresentedInCurrentDictationSession
{
  return self->_tipPresentedInCurrentDictationSession;
}

@end