@interface MFLoadBlockedContentBannerView
+ (id)log;
- (MFLoadBlockedContentBannerView)initWithFrame:(CGRect)a3 blockedContentTypes:(unint64_t)a4 blockingReason:(int64_t)a5;
- (MFLoadBlockedContentBannerViewDelegate)delegate;
- (id)actionTitle;
- (id)title;
- (unint64_t)blockedContentTypes;
- (void)_titleControlTapped:(id)a3;
- (void)_updateBannerText;
- (void)enablePrivacyProtectionAlertForAccount;
- (void)primaryAction;
- (void)setBlockedContentTypes:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MFLoadBlockedContentBannerView

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__MFLoadBlockedContentBannerView_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1) {
    dispatch_once(&log_onceToken_4, block);
  }
  v2 = (void *)log_log_4;
  return v2;
}

void __37__MFLoadBlockedContentBannerView_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;
}

- (MFLoadBlockedContentBannerView)initWithFrame:(CGRect)a3 blockedContentTypes:(unint64_t)a4 blockingReason:(int64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!a4)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"MFLoadBlockedContentBannerView.m", 27, @"Invalid parameter not satisfying: %@", @"blockedContentTypes" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)MFLoadBlockedContentBannerView;
  v12 = -[MFSuggestionBannerView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    v12->_blockedContentTypes = a4;
    v12->_blockingReason = a5;
    v14 = objc_opt_new();
    v15 = [(MFLoadBlockedContentBannerView *)v13 title];
    [v14 setTitle:v15];

    [v14 setAccessoryType:0];
    v16 = [(MFLoadBlockedContentBannerView *)v13 actionTitle];
    [v14 setActionTitle:v16];

    [v14 setActionButtonType:1];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v13);
    v17 = (void *)MEMORY[0x1E4F5DFF8];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __83__MFLoadBlockedContentBannerView_initWithFrame_blockedContentTypes_blockingReason___block_invoke;
    v22[3] = &unk_1E6D1AEA8;
    objc_copyWeak(&v23, &location);
    v18 = [v17 actionWithTitle:&stru_1F39E2A88 handler:v22];
    [v14 setPrimaryAction:v18];

    [(MFSuggestionBannerView *)v13 setBanner:v14];
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v13;
}

void __83__MFLoadBlockedContentBannerView_initWithFrame_blockedContentTypes_blockingReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained primaryAction];
}

- (void)setBlockedContentTypes:(unint64_t)a3
{
  if (self->_blockedContentTypes != a3)
  {
    self->_blockedContentTypes = a3;
    [(MFLoadBlockedContentBannerView *)self _updateBannerText];
  }
}

- (void)_updateBannerText
{
  int64_t blockingReason = self->_blockingReason;
  switch(blockingReason)
  {
    case 1:
      v7 = [MEMORY[0x1E4F28B50] mainBundle];
      id v15 = [v7 localizedStringForKey:@"REMOTE_IMAGES_BLOCKED_ENCRYPTION" value:&stru_1F39E2A88 table:@"Main"];

      v5 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v6 = [v5 localizedStringForKey:@"LOAD_REMOTE_IMAGES_ENCRYPTION" value:&stru_1F39E2A88 table:@"Main"];
      break;
    case 3:
      v8 = [MEMORY[0x1E4F28B50] mainBundle];
      id v15 = [v8 localizedStringForKey:@"MESSAGE_HAS_MULTIPLE_SIGNERS" value:&stru_1F39E2A88 table:@"Main"];

      v5 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v6 = [v5 localizedStringForKey:@"LOAD_MESSAGE" value:&stru_1F39E2A88 table:@"Main"];
      break;
    case 2:
      v4 = [MEMORY[0x1E4F28B50] mainBundle];
      id v15 = [v4 localizedStringForKey:@"UNABLE_TO_VERIFY_MESSAGE_CONTENT" value:&stru_1F39E2A88 table:@"Main"];

      v5 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v6 = [v5 localizedStringForKey:@"LOAD_MESSAGE" value:&stru_1F39E2A88 table:@"Main"];
      break;
    default:
      if ((self->_blockedContentTypes & 2) != 0)
      {
        v10 = [MEMORY[0x1E4F28B50] mainBundle];
        id v15 = [v10 localizedStringForKey:@"REMOTE_CONTENT_BLOCKED_TRUST_EVALUATION" value:&stru_1F39E2A88 table:@"Main"];

        v5 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v6 = [v5 localizedStringForKey:@"LOAD_REMOTE_CONTENT_TRUST_EVALUATION" value:&stru_1F39E2A88 table:@"Main"];
      }
      else
      {
        if (blockingReason == 5)
        {
          v9 = [MEMORY[0x1E4F28B50] mainBundle];
          id v15 = [v9 localizedStringForKey:@"REMOTE_IMAGES_BLOCKED_LDM" value:&stru_1F39E2A88 table:@"Main"];

          v5 = [MEMORY[0x1E4F28B50] mainBundle];
          [v5 localizedStringForKey:@"DISPLAY_REMOTE_IMAGES_LDM" value:&stru_1F39E2A88 table:@"Main"];
        }
        else
        {
          v11 = [MEMORY[0x1E4F28B50] mainBundle];
          id v15 = [v11 localizedStringForKey:@"REMOTE_IMAGES_BLOCKED_OTHER" value:&stru_1F39E2A88 table:@"Main"];

          v5 = [MEMORY[0x1E4F28B50] mainBundle];
          [v5 localizedStringForKey:@"LOAD_REMOTE_IMAGES_OTHER" value:&stru_1F39E2A88 table:@"Main"];
        uint64_t v6 = };
      }
      break;
  }
  v12 = (void *)v6;

  v13 = [(MFSuggestionBannerView *)self banner];
  [v13 setTitle:v15];

  v14 = [(MFSuggestionBannerView *)self banner];
  [v14 setActionTitle:v12];
}

- (void)primaryAction
{
  id v3 = [(MFLoadBlockedContentBannerView *)self delegate];
  [v3 loadBlockedContentBannerDidTriggerLoad:self];

  [(MFLoadBlockedContentBannerView *)self enablePrivacyProtectionAlertForAccount];
}

- (void)enablePrivacyProtectionAlertForAccount
{
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  if ([v3 shouldPresentRemoteContentAlert])
  {
    v4 = (void *)MEMORY[0x1E4FB1418];
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v6 = [v5 localizedStringForKey:@"ENABLE_MAIL_PRIVACY_PROTECTION" value:&stru_1F39E2A88 table:@"Main"];
    v7 = [MEMORY[0x1E4F28B50] mainBundle];
    v8 = [v7 localizedStringForKey:@"ENABLE_MAIL_PRIVACY_PROTECTION_DESCRIPTION" value:&stru_1F39E2A88 table:@"Main"];
    v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

    v10 = (void *)MEMORY[0x1E4FB1410];
    v11 = [MEMORY[0x1E4F28B50] mainBundle];
    v12 = [v11 localizedStringForKey:@"NOT_NOW" value:&stru_1F39E2A88 table:@"Main"];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __72__MFLoadBlockedContentBannerView_enablePrivacyProtectionAlertForAccount__block_invoke;
    v25[3] = &unk_1E6D1AF60;
    id v13 = v3;
    id v26 = v13;
    v14 = [v10 actionWithTitle:v12 style:1 handler:v25];
    [v9 addAction:v14];

    id v15 = (void *)MEMORY[0x1E4FB1410];
    v16 = [MEMORY[0x1E4F28B50] mainBundle];
    v17 = [v16 localizedStringForKey:@"TURN_ON" value:&stru_1F39E2A88 table:@"Main"];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __72__MFLoadBlockedContentBannerView_enablePrivacyProtectionAlertForAccount__block_invoke_81;
    id v23 = &unk_1E6D1AF60;
    id v24 = v13;
    v18 = [v15 actionWithTitle:v17 style:0 handler:&v20];
    objc_msgSend(v9, "addAction:", v18, v20, v21, v22, v23);

    v19 = [(MFLoadBlockedContentBannerView *)self delegate];
    [v19 presentViewController:v9];
  }
}

uint64_t __72__MFLoadBlockedContentBannerView_enablePrivacyProtectionAlertForAccount__block_invoke(uint64_t a1)
{
  v2 = +[MFLoadBlockedContentBannerView log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DDF5A000, v2, OS_LOG_TYPE_DEFAULT, "Mail Privacy Protection Alert with returnCode dismiss", v4, 2u);
  }

  return [*(id *)(a1 + 32) setObject:0 forKey:*MEMORY[0x1E4F60160]];
}

uint64_t __72__MFLoadBlockedContentBannerView_enablePrivacyProtectionAlertForAccount__block_invoke_81(uint64_t a1)
{
  v2 = +[MFLoadBlockedContentBannerView log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DDF5A000, v2, OS_LOG_TYPE_DEFAULT, "Turning on Mail Privacy Protection Alert", v4, 2u);
  }

  [*(id *)(a1 + 32) setObject:0 forKey:*MEMORY[0x1E4F60160]];
  return [*(id *)(a1 + 32) enableMailTrackingProtection:1];
}

- (void)_titleControlTapped:(id)a3
{
  id v4 = [(MFLoadBlockedContentBannerView *)self delegate];
  [v4 loadBlockedContentBannerDidTriggerLoad:self];
}

- (id)title
{
  int64_t blockingReason = self->_blockingReason;
  switch(blockingReason)
  {
    case 1:
      id v3 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"REMOTE_IMAGES_BLOCKED_ENCRYPTION" value:&stru_1F39E2A88 table:@"Main"];
      break;
    case 3:
      id v3 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"MESSAGE_HAS_MULTIPLE_SIGNERS" value:&stru_1F39E2A88 table:@"Main"];
      break;
    case 2:
      id v3 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v4 = [v3 localizedStringForKey:@"UNABLE_TO_VERIFY_MESSAGE_CONTENT" value:&stru_1F39E2A88 table:@"Main"];
      break;
    default:
      if ((self->_blockedContentTypes & 2) != 0)
      {
        id v3 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v4 = [v3 localizedStringForKey:@"REMOTE_CONTENT_BLOCKED_TRUST_EVALUATION" value:&stru_1F39E2A88 table:@"Main"];
      }
      else
      {
        v5 = [MEMORY[0x1E4F28B50] mainBundle];
        id v3 = v5;
        if (blockingReason == 5) {
          [v5 localizedStringForKey:@"REMOTE_IMAGES_BLOCKED_LDM" value:&stru_1F39E2A88 table:@"Main"];
        }
        else {
        uint64_t v4 = [v5 localizedStringForKey:@"REMOTE_IMAGES_BLOCKED_OTHER" value:&stru_1F39E2A88 table:@"Main"];
        }
      }
      break;
  }
  uint64_t v6 = (void *)v4;

  return v6;
}

- (id)actionTitle
{
  int64_t blockingReason = self->_blockingReason;
  if (blockingReason == 1)
  {
    id v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = [v3 localizedStringForKey:@"LOAD_REMOTE_IMAGES_ENCRYPTION" value:&stru_1F39E2A88 table:@"Main"];
  }
  else if (blockingReason == 3 || blockingReason == 2)
  {
    id v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = [v3 localizedStringForKey:@"LOAD_MESSAGE" value:&stru_1F39E2A88 table:@"Main"];
  }
  else if ((self->_blockedContentTypes & 2) != 0)
  {
    id v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = [v3 localizedStringForKey:@"LOAD_REMOTE_CONTENT_TRUST_EVALUATION" value:&stru_1F39E2A88 table:@"Main"];
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    id v3 = v5;
    if (blockingReason == 5) {
      [v5 localizedStringForKey:@"DISPLAY_REMOTE_IMAGES_LDM" value:&stru_1F39E2A88 table:@"Main"];
    }
    else {
    uint64_t v4 = [v5 localizedStringForKey:@"LOAD_REMOTE_IMAGES_OTHER" value:&stru_1F39E2A88 table:@"Main"];
    }
  }
  uint64_t v6 = (void *)v4;

  return v6;
}

- (MFLoadBlockedContentBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFLoadBlockedContentBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)blockedContentTypes
{
  return self->_blockedContentTypes;
}

- (void).cxx_destruct
{
}

@end