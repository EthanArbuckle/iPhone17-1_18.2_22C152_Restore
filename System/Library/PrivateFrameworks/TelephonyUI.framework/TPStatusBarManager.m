@interface TPStatusBarManager
+ (id)sharedInstance;
- (NSString)currentAbbreviatedStatusBarString;
- (NSTimer)callDurationTimer;
- (TPStatusBarManager)init;
- (void)dealloc;
- (void)setCallDurationTimer:(id)a3;
- (void)setCurrentAbbreviatedStatusBarString:(id)a3;
- (void)updateCurrentAbbreviatedStatusBarString;
- (void)updateCurrentAbbreviatedStatusBarStringAndSendNotification;
@end

@implementation TPStatusBarManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__TPStatusBarManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

uint64_t __36__TPStatusBarManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (TPStatusBarManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)TPStatusBarManager;
  uint64_t v2 = [(TPStatusBarManager *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_updateCurrentAbbreviatedStatusBarStringAndSendNotification name:*MEMORY[0x1E4FADD90] object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_updateCurrentAbbreviatedStatusBarStringAndSendNotification name:*MEMORY[0x1E4FADDD8] object:0];

    [(TPStatusBarManager *)v2 updateCurrentAbbreviatedStatusBarString];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(TPStatusBarManager *)self callDurationTimer];
  [v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)TPStatusBarManager;
  [(TPStatusBarManager *)&v5 dealloc];
}

- (void)updateCurrentAbbreviatedStatusBarString
{
  v3 = [MEMORY[0x1E4FADA90] sharedInstance];
  uint64_t v4 = [v3 activeVideoCall];
  if (v4)
  {
    id v5 = (id)v4;
  }
  else
  {
    objc_super v6 = [MEMORY[0x1E4FADA90] sharedInstance];
    v7 = [v6 displayedCall];
    v8 = v7;
    if (v7)
    {
      id v5 = v7;
    }
    else
    {
      v9 = [MEMORY[0x1E4FADA90] sharedInstance];
      id v5 = [v9 incomingVideoCall];
    }
    if (!v5)
    {
      id v19 = 0;
      goto LABEL_11;
    }
  }
  v10 = [v5 callDurationString];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    objc_msgSend(NSString, "localizedStringWithFormat:", @"%02d:%02d", 0, 0);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v19 = v12;

LABEL_11:
  v13 = [(TPStatusBarManager *)self currentAbbreviatedStatusBarString];
  char v14 = TUStringsAreEqualOrNil();

  if ((v14 & 1) == 0)
  {
    [(TPStatusBarManager *)self setCurrentAbbreviatedStatusBarString:v19];
    v15 = [(TPStatusBarManager *)self currentAbbreviatedStatusBarString];

    v16 = [(TPStatusBarManager *)self callDurationTimer];
    v17 = v16;
    if (v15)
    {

      if (!v17)
      {
        v18 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_updateCurrentAbbreviatedStatusBarStringAndSendNotification selector:0 userInfo:1 repeats:1.0];
        [(TPStatusBarManager *)self setCallDurationTimer:v18];
      }
    }
    else
    {
      [v16 invalidate];

      [(TPStatusBarManager *)self setCallDurationTimer:0];
    }
  }
}

- (void)updateCurrentAbbreviatedStatusBarStringAndSendNotification
{
  [(TPStatusBarManager *)self updateCurrentAbbreviatedStatusBarString];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"TPStatusBarManagerStringChangedNotification" object:self];
}

- (NSString)currentAbbreviatedStatusBarString
{
  return self->_currentAbbreviatedStatusBarString;
}

- (void)setCurrentAbbreviatedStatusBarString:(id)a3
{
}

- (NSTimer)callDurationTimer
{
  return self->_callDurationTimer;
}

- (void)setCallDurationTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callDurationTimer, 0);
  objc_storeStrong((id *)&self->_currentAbbreviatedStatusBarString, 0);
}

@end