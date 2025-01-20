@interface MFLoadFailedProxyContentBannerView
- (MFLoadFailedProxyContentBannerView)initWithFrame:(CGRect)a3 failureReason:(int64_t)a4;
- (MFLoadFailedProxyContentBannerViewDelegate)delegate;
- (void)dismissAction;
- (void)primaryAction;
- (void)setDelegate:(id)a3;
@end

@implementation MFLoadFailedProxyContentBannerView

- (MFLoadFailedProxyContentBannerView)initWithFrame:(CGRect)a3 failureReason:(int64_t)a4
{
  v26.receiver = self;
  v26.super_class = (Class)MFLoadFailedProxyContentBannerView;
  v5 = -[MFSuggestionBannerView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = @"FAILED_TO_PROXY_REMOTE_CONTENT_NETWORK_INCOMPATIBLE";
    v7 = @"FAILED_TO_PROXY_REMOTE_CONTENT_OTHER";
    if (a4) {
      v7 = 0;
    }
    if (a4 != 1) {
      v6 = v7;
    }
    BOOL v8 = a4 == 2;
    if (a4 == 2) {
      v9 = @"FAILED_TO_PROXY_REMOTE_CONTENT_VPN";
    }
    else {
      v9 = v6;
    }
    v10 = [MEMORY[0x1E4F28B50] mainBundle];
    v11 = [v10 localizedStringForKey:v9 value:&stru_1F39E2A88 table:@"Main"];

    id v12 = objc_alloc_init(MEMORY[0x1E4F5DFE8]);
    [v12 setTitle:v11];
    [v12 setActionButtonType:1];
    if (v8)
    {
      [v12 setActionTitle:0];
      uint64_t v13 = 1;
    }
    else
    {
      v14 = [MEMORY[0x1E4F28B50] mainBundle];
      v15 = [v14 localizedStringForKey:@"LOAD_FAILED_PROXY_CONTENT" value:&stru_1F39E2A88 table:@"Main"];
      [v12 setActionTitle:v15];

      uint64_t v13 = 0;
    }
    [v12 setAccessoryType:v13];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v5);
    v16 = (void *)MEMORY[0x1E4F5DFF8];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__MFLoadFailedProxyContentBannerView_initWithFrame_failureReason___block_invoke;
    v23[3] = &unk_1E6D1AEA8;
    objc_copyWeak(&v24, &location);
    v17 = [v16 actionWithTitle:&stru_1F39E2A88 handler:v23];
    [v12 setPrimaryAction:v17];

    v18 = (void *)MEMORY[0x1E4F5DFF8];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __66__MFLoadFailedProxyContentBannerView_initWithFrame_failureReason___block_invoke_2;
    v21[3] = &unk_1E6D1AEA8;
    objc_copyWeak(&v22, &location);
    v19 = [v18 actionWithTitle:&stru_1F39E2A88 handler:v21];
    [v12 setDismissAction:v19];

    [(MFSuggestionBannerView *)v5 setBanner:v12];
    [v12 reload];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __66__MFLoadFailedProxyContentBannerView_initWithFrame_failureReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained primaryAction];
}

void __66__MFLoadFailedProxyContentBannerView_initWithFrame_failureReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissAction];
}

- (void)primaryAction
{
  id v3 = [(MFLoadFailedProxyContentBannerView *)self delegate];
  [v3 loadFailedProxyContentBannerDidTriggerLoad:self];
}

- (void)dismissAction
{
  id v3 = [(MFLoadFailedProxyContentBannerView *)self delegate];
  [v3 loadFailedProxyContentBannerWasDismissed:self];
}

- (MFLoadFailedProxyContentBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFLoadFailedProxyContentBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end