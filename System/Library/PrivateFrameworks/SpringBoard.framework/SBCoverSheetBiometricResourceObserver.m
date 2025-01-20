@interface SBCoverSheetBiometricResourceObserver
- (BOOL)pearlMatchEnabledAndPossible;
- (BOOL)seenMatchResultSinceScreenOn;
- (SBCoverSheetBiometricResourceObserver)initWithBiometricResource:(id)a3;
- (SBPearlMatchingStateProviderDelegate)delegate;
- (SBUIBiometricResource)biometricResource;
- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4;
- (void)reset;
- (void)setBiometricResource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSeenMatchResultSinceScreenOn:(BOOL)a3;
- (void)setSeenMatchResultSinceScreenOn:(int)a3 notifyDelegate:;
@end

@implementation SBCoverSheetBiometricResourceObserver

- (SBCoverSheetBiometricResourceObserver)initWithBiometricResource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBCoverSheetBiometricResourceObserver;
  v5 = [(SBCoverSheetBiometricResourceObserver *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SBCoverSheetBiometricResourceObserver *)v5 setBiometricResource:v4];
    [v4 addObserver:v6];
    [(SBCoverSheetBiometricResourceObserver *)v6 reset];
  }

  return v6;
}

- (void)reset
{
}

- (BOOL)pearlMatchEnabledAndPossible
{
  v2 = [(SBCoverSheetBiometricResourceObserver *)self biometricResource];
  int v3 = [v2 hasBiometricAuthenticationCapabilityEnabled];
  uint64_t v4 = [v2 biometricLockoutState];
  char v5 = [v2 isPearlDetectEnabled];
  int v6 = MGGetBoolAnswer();
  if (v6) {
    LOBYTE(v6) = [v2 isFingerDetectEnabled];
  }
  char v7 = v5 | v6;
  if (v4) {
    char v7 = 0;
  }
  if (v3) {
    BOOL v8 = v7;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)setSeenMatchResultSinceScreenOn:(BOOL)a3
{
  if (self->_seenMatchResultSinceScreenOn != a3) {
    self->_seenMatchResultSinceScreenOn = a3;
  }
}

- (void)setSeenMatchResultSinceScreenOn:(int)a3 notifyDelegate:
{
  if (result)
  {
    uint64_t v4 = result;
    result = (void *)[result setSeenMatchResultSinceScreenOn:a2];
    if (a3)
    {
      uint64_t v5 = [v4 delegate];
      if (v5)
      {
        int v6 = (void *)v5;
        if (objc_opt_respondsToSelector()) {
          [v6 pearlMatchingStateProviderStateChangedForMatchFailure:v4];
        }
      }
      return (void *)MEMORY[0x1F4181820]();
    }
  }
  return result;
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  id v6 = a3;
  if (a4 <= 0x1A)
  {
    id v7 = v6;
    if (((1 << a4) & 0x6008E00) != 0)
    {
      -[SBCoverSheetBiometricResourceObserver setSeenMatchResultSinceScreenOn:notifyDelegate:](self, 1, 1);
LABEL_7:
      id v6 = v7;
      goto LABEL_8;
    }
    if (((1 << a4) & 0x18) != 0 && self)
    {
      [(SBCoverSheetBiometricResourceObserver *)self setSeenMatchResultSinceScreenOn:1];
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (SBPearlMatchingStateProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPearlMatchingStateProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)seenMatchResultSinceScreenOn
{
  return self->_seenMatchResultSinceScreenOn;
}

- (SBUIBiometricResource)biometricResource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_biometricResource);
  return (SBUIBiometricResource *)WeakRetained;
}

- (void)setBiometricResource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_biometricResource);
  objc_destroyWeak((id *)&self->_delegate);
}

@end