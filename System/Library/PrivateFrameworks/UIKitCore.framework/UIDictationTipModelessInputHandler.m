@interface UIDictationTipModelessInputHandler
- (BOOL)modelessInputTipDictationStoppedSignal;
- (BOOL)shouldAttemptToShowModelessTip;
- (BOOL)shouldShowModelessInputTip;
- (BOOL)softwareKeyboardInteractionAfterDictationStoppedSignal;
- (UIDictationTipHandlerDelegate)delegate;
- (UIDictationTipModelessInputHandler)initWithDelegate:(id)a3;
- (void)processSoftwareKeyboardInteraction;
- (void)processUserInteractionEnded;
- (void)resetDictationTipModelessHandlerSignalFlags;
- (void)setDelegate:(id)a3;
- (void)setModelessInputTipDictationStoppedSignal:(BOOL)a3;
- (void)setShouldAttemptToShowModelessTip:(BOOL)a3;
- (void)setSoftwareKeyboardInteractionAfterDictationStoppedSignal:(BOOL)a3;
- (void)showModelessInputTip;
- (void)triggerAttemptToShowModelessTipFlag;
- (void)userInteractionEndedDuringModelessInputTipDictationStoppedSignal;
@end

@implementation UIDictationTipModelessInputHandler

- (UIDictationTipModelessInputHandler)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIDictationTipModelessInputHandler;
  v5 = [(UIDictationTipModelessInputHandler *)&v8 init];
  v6 = v5;
  if (v5) {
    [(UIDictationTipModelessInputHandler *)v5 setDelegate:v4];
  }
  [(UIDictationTipModelessInputHandler *)v6 resetDictationTipModelessHandlerSignalFlags];

  return v6;
}

- (void)setShouldAttemptToShowModelessTip:(BOOL)a3
{
  self->_shouldAttemptToShowModelessTip = a3;
}

- (void)setDelegate:(id)a3
{
}

- (void)resetDictationTipModelessHandlerSignalFlags
{
  [(UIDictationTipModelessInputHandler *)self setModelessInputTipDictationStoppedSignal:0];
  [(UIDictationTipModelessInputHandler *)self setSoftwareKeyboardInteractionAfterDictationStoppedSignal:0];
  [(UIDictationTipModelessInputHandler *)self setShouldAttemptToShowModelessTip:0];
}

- (void)setSoftwareKeyboardInteractionAfterDictationStoppedSignal:(BOOL)a3
{
  self->_softwareKeyboardInteractionAfterDictationStoppedSignal = a3;
}

- (void)setModelessInputTipDictationStoppedSignal:(BOOL)a3
{
  self->_modelessInputTipDictationStoppedSignal = a3;
}

- (void)processSoftwareKeyboardInteraction
{
  v3 = [(UIDictationTipModelessInputHandler *)self delegate];
  char v4 = [v3 dictationTipShown:6];

  if ((v4 & 1) == 0
    && [(UIDictationTipModelessInputHandler *)self modelessInputTipDictationStoppedSignal])
  {
    [(UIDictationTipModelessInputHandler *)self setSoftwareKeyboardInteractionAfterDictationStoppedSignal:1];
  }
}

- (void)processUserInteractionEnded
{
  v3 = [(UIDictationTipModelessInputHandler *)self delegate];
  char v4 = [v3 dictationTipShown:6];

  if ((v4 & 1) == 0
    && [(UIDictationTipModelessInputHandler *)self modelessInputTipDictationStoppedSignal])
  {
    [(UIDictationTipModelessInputHandler *)self userInteractionEndedDuringModelessInputTipDictationStoppedSignal];
  }
}

- (void)userInteractionEndedDuringModelessInputTipDictationStoppedSignal
{
  [(UIDictationTipModelessInputHandler *)self triggerAttemptToShowModelessTipFlag];
  if ([(UIDictationTipModelessInputHandler *)self shouldShowModelessInputTip])
  {
    [(UIDictationTipModelessInputHandler *)self showModelessInputTip];
  }
}

- (void)triggerAttemptToShowModelessTipFlag
{
  if ([(UIDictationTipModelessInputHandler *)self softwareKeyboardInteractionAfterDictationStoppedSignal]&& [(UIDictationTipModelessInputHandler *)self modelessInputTipDictationStoppedSignal])
  {
    [(UIDictationTipModelessInputHandler *)self setShouldAttemptToShowModelessTip:1];
  }
  else
  {
    [(UIDictationTipModelessInputHandler *)self resetDictationTipModelessHandlerSignalFlags];
  }
}

- (BOOL)shouldShowModelessInputTip
{
  if (+[UIKeyboard isModelessActive]
    && (+[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController"), v3 = objc_claimAutoreleasedReturnValue(), int v4 = [v3 BOOLForPreferenceKey:@"DictationCommandTipsEnabled"], v3, v4))
  {
    v5 = +[UIDictationController activeInstance];
    char v6 = [v5 shouldSuppressSoftwareKeyboard];

    char v7 = v6 ^ 1;
  }
  else
  {
    char v7 = 0;
  }
  return v7 & [(UIDictationTipModelessInputHandler *)self shouldAttemptToShowModelessTip];
}

- (void)showModelessInputTip
{
  _UILocalizedString(@"ModelessInputTipTitle", @"Type and Speak", @"Type and Speak");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = _UILocalizedString(@"ModelessInputTipDescription", @"You can edit text with the keyboard while you dictate.", @"You can edit text with the keyboard while you dictate.");
  int v4 = [(UIDictationTipModelessInputHandler *)self delegate];
  [v4 finalizeTextWithTipType:6 title:v5 andTipDescription:v3];

  [(UIDictationTipModelessInputHandler *)self resetDictationTipModelessHandlerSignalFlags];
}

- (UIDictationTipHandlerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIDictationTipHandlerDelegate *)WeakRetained;
}

- (BOOL)modelessInputTipDictationStoppedSignal
{
  return self->_modelessInputTipDictationStoppedSignal;
}

- (BOOL)softwareKeyboardInteractionAfterDictationStoppedSignal
{
  return self->_softwareKeyboardInteractionAfterDictationStoppedSignal;
}

- (BOOL)shouldAttemptToShowModelessTip
{
  return self->_shouldAttemptToShowModelessTip;
}

- (void).cxx_destruct
{
}

@end