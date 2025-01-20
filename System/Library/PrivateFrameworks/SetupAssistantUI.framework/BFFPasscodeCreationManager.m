@interface BFFPasscodeCreationManager
+ (id)sharedPasscodeManager;
- (BFFPasscodeCreationDelegate)delegate;
- (BFFPasscodeCreationManager)init;
- (BOOL)acceptedWeakPasscode;
- (BOOL)isNumericPasscodeEntry;
- (BOOL)isSimplePasscodeEntry;
- (NSString)constraintFailedInstructions;
- (NSString)constraintInstructions;
- (NSString)passcode;
- (id)_mainQueue;
- (int64_t)simplePasscodeEntryLength;
- (unint64_t)passcodeState;
- (void)_applyPasscode;
- (void)acceptWeakPasscode:(BOOL)a3;
- (void)reset;
- (void)setAcceptedWeakPasscode:(BOOL)a3;
- (void)setConstraintFailedInstructions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNumericPasscodeEntry:(BOOL)a3;
- (void)setPasscode:(id)a3;
- (void)setPasscodeState:(unint64_t)a3;
- (void)setSimplePasscodeEntryLength:(int64_t)a3;
- (void)transitionToNextPasscodeStateForInput:(id)a3;
@end

@implementation BFFPasscodeCreationManager

- (BFFPasscodeCreationManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)BFFPasscodeCreationManager;
  v2 = [(BFFPasscodeCreationManager *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(BFFPasscodeCreationManager *)v2 setPasscodeState:0];
    [(BFFPasscodeCreationManager *)v3 setConstraintFailedInstructions:0];
  }
  return v3;
}

+ (id)sharedPasscodeManager
{
  v2 = (void *)sharedPasscodeManager_sharedPasscodeManager;
  if (!sharedPasscodeManager_sharedPasscodeManager)
  {
    v3 = objc_alloc_init(BFFPasscodeCreationManager);
    v4 = (void *)sharedPasscodeManager_sharedPasscodeManager;
    sharedPasscodeManager_sharedPasscodeManager = (uint64_t)v3;

    v2 = (void *)sharedPasscodeManager_sharedPasscodeManager;
  }
  return v2;
}

- (NSString)constraintInstructions
{
  v3 = [MEMORY[0x263F53C50] sharedConnection];
  int v4 = [v3 isPasscodeRequired];

  if (v4)
  {
    objc_super v5 = [(BFFPasscodeCreationManager *)self constraintFailedInstructions];

    if (v5)
    {
      v6 = [(BFFPasscodeCreationManager *)self constraintFailedInstructions];
    }
    else
    {
      v7 = [MEMORY[0x263F53C50] sharedConnection];
      v6 = [v7 localizedDescriptionOfCurrentPasscodeConstraints];
    }
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (BOOL)isSimplePasscodeEntry
{
  BOOL v3 = [(BFFPasscodeCreationManager *)self isNumericPasscodeEntry];
  if (v3) {
    LOBYTE(v3) = [(BFFPasscodeCreationManager *)self simplePasscodeEntryLength] > 0;
  }
  return v3;
}

- (void)_applyPasscode
{
  BOOL v3 = _BYLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FF9E000, v3, OS_LOG_TYPE_DEFAULT, "Setting a passcode...", buf, 2u);
  }

  int v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__BFFPasscodeCreationManager__applyPasscode__block_invoke;
  block[3] = &unk_26454AAC8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __44__BFFPasscodeCreationManager__applyPasscode__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [*(id *)(a1 + 32) passcode];
  id v18 = 0;
  char v4 = [v2 changePasscodeFrom:0 to:v3 outError:&v18];
  id v5 = v18;

  if ((v4 & 1) == 0)
  {
    v6 = _BYLoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (_BYIsInternalInstall())
      {
        int v12 = 0;
        v13 = v5;
      }
      else if (v5)
      {
        v14 = NSString;
        BOOL v3 = [v5 domain];
        v13 = [v14 stringWithFormat:@"<Error domain: %@, code %ld>", v3, objc_msgSend(v5, "code")];
        int v12 = 1;
      }
      else
      {
        int v12 = 0;
        v13 = 0;
      }
      *(_DWORD *)buf = 138543362;
      v20 = v13;
      _os_log_error_impl(&dword_21FF9E000, v6, OS_LOG_TYPE_ERROR, "Failed to set the passcode with error %{public}@", buf, 0xCu);
      if (v12)
      {
      }
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x263F68020]);
  v8 = (void *)[objc_alloc(MEMORY[0x263F68008]) initWithFeatureFlags:v7];
  v9 = [*(id *)(a1 + 32) passcode];
  [v8 updateCoreCDPStateControllerWithPasscode:v9];

  v10 = [*(id *)(a1 + 32) _mainQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__BFFPasscodeCreationManager__applyPasscode__block_invoke_5;
  block[3] = &unk_26454B080;
  char v17 = v4;
  block[4] = *(void *)(a1 + 32);
  id v16 = v5;
  id v11 = v5;
  dispatch_async(v10, block);
}

uint64_t __44__BFFPasscodeCreationManager__applyPasscode__block_invoke_5(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 48))
  {
    v2 = [MEMORY[0x263F828C0] sharedInputModeController];
    [v2 saveDeviceUnlockPasscodeInputModes];
  }
  BOOL v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 passcodeManager:*(void *)(a1 + 32) didSetPasscodeWithSuccess:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 40)];
  }
  else
  {
    id v5 = _BYLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [*(id *)(a1 + 32) delegate];
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_21FF9E000, v5, OS_LOG_TYPE_DEFAULT, "Failed to stash passcode token, delegate = %@", (uint8_t *)&v8, 0xCu);
    }
  }

  return [*(id *)(a1 + 32) setPasscodeState:4];
}

- (id)_mainQueue
{
  v2 = (void *)MEMORY[0x263EF83A0];
  id v3 = MEMORY[0x263EF83A0];
  return v2;
}

- (void)setPasscodeState:(unint64_t)a3
{
  unint64_t v5 = [(BFFPasscodeCreationManager *)self passcodeState];
  self->_passcodeState = a3;
  uint64_t v6 = [(BFFPasscodeCreationManager *)self delegate];
  if (v6)
  {
    id v7 = (void *)v6;
    int v8 = [(BFFPasscodeCreationManager *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(BFFPasscodeCreationManager *)self delegate];
      [v10 passcodeManager:self didTransitionFromState:v5 toState:a3];
    }
  }
}

- (void)transitionToNextPasscodeStateForInput:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(BFFPasscodeCreationManager *)self passcodeState];
  switch(v5)
  {
    case 0uLL:
    case 3uLL:
      if (![v4 length])
      {
        id v8 = 0;
        goto LABEL_16;
      }
      uint64_t v6 = [MEMORY[0x263F53C50] sharedConnection];
      id v18 = 0;
      int v7 = [v6 passcode:v4 meetsCurrentConstraintsOutError:&v18];
      id v8 = v18;

      if (!v7)
      {
        if (v8)
        {
          v14 = [v8 domain];
          int v15 = [v14 isEqualToString:*MEMORY[0x263F53B10]];

          if (v15)
          {
            id v16 = [v8 localizedDescription];
            [(BFFPasscodeCreationManager *)self setConstraintFailedInstructions:v16];
LABEL_17:

            goto LABEL_18;
          }
        }
LABEL_16:
        id v16 = [MEMORY[0x263F53C50] sharedConnection];
        char v17 = [v16 localizedDescriptionOfCurrentPasscodeConstraints];
        [(BFFPasscodeCreationManager *)self setConstraintFailedInstructions:v17];

        goto LABEL_17;
      }
      [(BFFPasscodeCreationManager *)self setPasscode:v4];
      [(BFFPasscodeCreationManager *)self isSimplePasscodeEntry];
      [(BFFPasscodeCreationManager *)self passcode];
      if (SecPasswordIsPasswordWeak2()) {
        unint64_t v5 = 1;
      }
      else {
        unint64_t v5 = 2;
      }

LABEL_19:
      [(BFFPasscodeCreationManager *)self setPasscodeState:v5];
LABEL_20:

      return;
    case 1uLL:
    case 4uLL:
      goto LABEL_19;
    case 2uLL:
      char v9 = [(BFFPasscodeCreationManager *)self passcode];
      int v10 = [v9 isEqualToString:v4];

      if (!v10)
      {
        unint64_t v5 = 3;
        goto LABEL_19;
      }
      id v11 = [(BFFPasscodeCreationManager *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        v13 = [(BFFPasscodeCreationManager *)self delegate];
        [v13 passcodeManagerWillSetPasscode:self];
      }
      [(BFFPasscodeCreationManager *)self _applyPasscode];
      goto LABEL_20;
    default:
LABEL_18:
      unint64_t v5 = 0;
      goto LABEL_19;
  }
}

- (void)acceptWeakPasscode:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    uint64_t v5 = 2;
  }
  else
  {
    [(BFFPasscodeCreationManager *)self setPasscode:0];
    uint64_t v5 = 0;
  }
  [(BFFPasscodeCreationManager *)self setPasscodeState:v5];
  [(BFFPasscodeCreationManager *)self setAcceptedWeakPasscode:v3];
}

- (void)reset
{
  [(BFFPasscodeCreationManager *)self setPasscode:0];
  [(BFFPasscodeCreationManager *)self setAcceptedWeakPasscode:0];
  [(BFFPasscodeCreationManager *)self setPasscodeState:0];
  [(BFFPasscodeCreationManager *)self setConstraintFailedInstructions:0];
}

- (unint64_t)passcodeState
{
  return self->_passcodeState;
}

- (NSString)passcode
{
  return self->_passcode;
}

- (void)setPasscode:(id)a3
{
}

- (BFFPasscodeCreationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BFFPasscodeCreationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isNumericPasscodeEntry
{
  return self->_numericPasscodeEntry;
}

- (void)setNumericPasscodeEntry:(BOOL)a3
{
  self->_numericPasscodeEntry = a3;
}

- (int64_t)simplePasscodeEntryLength
{
  return self->_simplePasscodeEntryLength;
}

- (void)setSimplePasscodeEntryLength:(int64_t)a3
{
  self->_simplePasscodeEntryLength = a3;
}

- (BOOL)acceptedWeakPasscode
{
  return self->_acceptedWeakPasscode;
}

- (void)setAcceptedWeakPasscode:(BOOL)a3
{
  self->_acceptedWeakPasscode = a3;
}

- (NSString)constraintFailedInstructions
{
  return self->_constraintFailedInstructions;
}

- (void)setConstraintFailedInstructions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintFailedInstructions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end