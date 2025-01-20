@interface SASTestingInputController
- (SASTestingInputController)init;
- (SiriTestingContext)preloadedTestingInput;
- (id)dequeuePreloadedTestingContext;
- (void)_registerForTestingNotifications;
- (void)_testingAudioInputPathsDidChange:(id)a3;
- (void)_testingStringsDidChange:(id)a3;
- (void)dealloc;
@end

@implementation SASTestingInputController

- (SASTestingInputController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SASTestingInputController;
  v2 = [(SASTestingInputController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(SASTestingInputController *)v2 _registerForTestingNotifications];
    preloadedTestingInput = v3->_preloadedTestingInput;
    v3->_preloadedTestingInput = 0;
  }
  return v3;
}

- (void)_registerForTestingNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__testingStringsDidChange_ name:@"SBTestingConfigureNextAssistantRecognitionStrings" object:0];
  [v3 addObserver:self selector:sel__testingAudioInputPathsDidChange_ name:@"SBTestingConfigureNextVoiceRecognitionAudioInputPathsNotification" object:0];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SASTestingInputController;
  [(SASTestingInputController *)&v4 dealloc];
}

- (void)_testingStringsDidChange:(id)a3
{
  preloadedTestingInput = self->_preloadedTestingInput;
  self->_preloadedTestingInput = 0;
  id v5 = a3;

  id v8 = [v5 object];

  if ([v8 count])
  {
    objc_super v6 = [[SiriTestingContext alloc] initWithRecognitionStrings:v8];
    v7 = self->_preloadedTestingInput;
    self->_preloadedTestingInput = v6;
  }
}

- (void)_testingAudioInputPathsDidChange:(id)a3
{
  id v6 = [a3 object];
  if ([v6 count])
  {
    objc_super v4 = [[SiriTestingContext alloc] initWithAudioInput:v6];
    preloadedTestingInput = self->_preloadedTestingInput;
    self->_preloadedTestingInput = v4;
  }
}

- (id)dequeuePreloadedTestingContext
{
  id v3 = self->_preloadedTestingInput;
  preloadedTestingInput = self->_preloadedTestingInput;
  self->_preloadedTestingInput = 0;

  return v3;
}

- (SiriTestingContext)preloadedTestingInput
{
  return self->_preloadedTestingInput;
}

- (void).cxx_destruct
{
}

@end