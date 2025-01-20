@interface SearchUIScreenTimeRequestButton
+ (BOOL)supportsRowModel:(id)a3;
- (NSObject)screentimeRequestStatusObserver;
- (id)requestIdentifier;
- (int)getRequestState;
- (unint64_t)type;
- (void)dealloc;
- (void)setScreentimeRequestStatusObserver:(id)a3;
- (void)setupSubscription;
- (void)updateWithRowModel:(id)a3;
@end

@implementation SearchUIScreenTimeRequestButton

+ (BOOL)supportsRowModel:(id)a3
{
  id v3 = a3;
  v4 = [v3 buttonItems];
  if ([v4 count] == 1 && objc_msgSend(v3, "buttonItemsAreTrailing"))
  {
    v5 = [v4 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [v5 command];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [v6 punchout];
        v8 = [v7 label];
        if (v8)
        {
          v9 = [v7 urls];
          v10 = [v9 firstObject];
          v11 = [v10 scheme];
          char v12 = [v11 isEqualToString:@"prefs"];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (id)requestIdentifier
{
  v2 = [(SearchUIRequestButton *)self command];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 punchout];
    v4 = [v3 label];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)getRequestState
{
  v2 = [(SearchUIScreenTimeRequestButton *)self requestIdentifier];
  if (v2)
  {
    id v3 = +[SearchUIScreenTimeRequestStatusManager sharedManager];
    int v4 = [v3 statusForRequestID:v2];

    if (v4 == 2) {
      int v5 = 3;
    }
    else {
      int v5 = 1;
    }
    if (v4 == 3) {
      int v6 = 2;
    }
    else {
      int v6 = v5;
    }
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (void)updateWithRowModel:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SearchUIScreenTimeRequestButton;
  id v4 = a3;
  [(SearchUIAccessoryViewController *)&v13 updateWithRowModel:v4];
  int v5 = [v4 buttonItems];
  int v6 = [v5 firstObject];

  v7 = [v6 command];
  [(SearchUIRequestButton *)self setCommand:v7];
  v8 = [v6 title];
  v9 = [(SearchUIRequestButton *)self viewButton];
  [v9 setTitle:v8];

  uint64_t v10 = [v4 useCompactVersionOfUI];
  v11 = [(SearchUIRequestButton *)self viewButton];
  [v11 setUseCompactMode:v10];

  [(SearchUIScreenTimeRequestButton *)self setupSubscription];
  v12.receiver = self;
  v12.super_class = (Class)SearchUIScreenTimeRequestButton;
  [(SearchUIRequestButton *)&v12 updateButtonState:0 withState:[(SearchUIScreenTimeRequestButton *)self getRequestState]];
}

- (void)setupSubscription
{
  id v3 = [(SearchUIScreenTimeRequestButton *)self screentimeRequestStatusObserver];

  if (!v3)
  {
    id v4 = +[SearchUIScreenTimeRequestStatusManager sharedManager];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__SearchUIScreenTimeRequestButton_setupSubscription__block_invoke;
    v6[3] = &unk_1E6E72960;
    v6[4] = self;
    int v5 = [v4 addObserver:v6];
    [(SearchUIScreenTimeRequestButton *)self setScreentimeRequestStatusObserver:v5];
  }
}

void __52__SearchUIScreenTimeRequestButton_setupSubscription__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__SearchUIScreenTimeRequestButton_setupSubscription__block_invoke_2;
  block[3] = &unk_1E6E72730;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

id __52__SearchUIScreenTimeRequestButton_setupSubscription__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3.receiver = v1;
  v3.super_class = (Class)SearchUIScreenTimeRequestButton;
  return objc_msgSendSuper2(&v3, sel_updateButtonState_withState_, 1, [v1 getRequestState]);
}

- (void)dealloc
{
  objc_super v3 = +[SearchUIScreenTimeRequestStatusManager sharedManager];
  id v4 = [(SearchUIScreenTimeRequestButton *)self screentimeRequestStatusObserver];
  [v3 removeObserver:v4];

  screentimeRequestStatusObserver = self->_screentimeRequestStatusObserver;
  self->_screentimeRequestStatusObserver = 0;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIScreenTimeRequestButton;
  [(SearchUIScreenTimeRequestButton *)&v6 dealloc];
}

- (unint64_t)type
{
  return 8;
}

- (NSObject)screentimeRequestStatusObserver
{
  return self->_screentimeRequestStatusObserver;
}

- (void)setScreentimeRequestStatusObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end