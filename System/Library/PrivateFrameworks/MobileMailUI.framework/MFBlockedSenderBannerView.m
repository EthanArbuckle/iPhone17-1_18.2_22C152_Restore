@interface MFBlockedSenderBannerView
- (MFBlockedSenderBannerView)initWithFrame:(CGRect)a3;
- (MFBlockedSenderBannerViewDelegate)delegate;
- (void)_bannerDismissed:(id)a3;
- (void)_titleControlTapped:(id)a3;
- (void)dismissAction;
- (void)primaryAction;
- (void)setDelegate:(id)a3;
@end

@implementation MFBlockedSenderBannerView

- (MFBlockedSenderBannerView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MFBlockedSenderBannerView;
  v3 = -[MFSuggestionBannerView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    v6 = [v5 localizedStringForKey:@"MESSAGE_FROM_BLOCKED_SENDER" value:&stru_1F39E2A88 table:@"Main"];
    [v4 setTitle:v6];

    v7 = [MEMORY[0x1E4F28B50] mainBundle];
    v8 = [v7 localizedStringForKey:@"BLOCKED_SENDER_SETTINGS" value:&stru_1F39E2A88 table:@"Main"];
    [v4 setActionTitle:v8];

    [v4 setAccessoryType:1];
    [v4 setActionButtonType:1];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    v9 = (void *)MEMORY[0x1E4F5DFF8];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __43__MFBlockedSenderBannerView_initWithFrame___block_invoke;
    v16[3] = &unk_1E6D1AEA8;
    objc_copyWeak(&v17, &location);
    v10 = [v9 actionWithTitle:&stru_1F39E2A88 handler:v16];
    [v4 setPrimaryAction:v10];

    v11 = (void *)MEMORY[0x1E4F5DFF8];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __43__MFBlockedSenderBannerView_initWithFrame___block_invoke_2;
    v14[3] = &unk_1E6D1AEA8;
    objc_copyWeak(&v15, &location);
    v12 = [v11 actionWithTitle:&stru_1F39E2A88 handler:v14];
    [v4 setDismissAction:v12];

    [(MFSuggestionBannerView *)v3 setBanner:v4];
    [v4 reload];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __43__MFBlockedSenderBannerView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained primaryAction];
}

void __43__MFBlockedSenderBannerView_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissAction];
}

- (void)primaryAction
{
  id v3 = [(MFBlockedSenderBannerView *)self delegate];
  [v3 didTapBlockedSenderBannerView:self];
}

- (void)dismissAction
{
  id v3 = [(MFBlockedSenderBannerView *)self delegate];
  [v3 didDismissBlockedSenderBannerView:self];
}

- (void)_titleControlTapped:(id)a3
{
  id v4 = [(MFBlockedSenderBannerView *)self delegate];
  [v4 didTapBlockedSenderBannerView:self];
}

- (void)_bannerDismissed:(id)a3
{
  id v4 = [(MFBlockedSenderBannerView *)self delegate];
  [v4 didDismissBlockedSenderBannerView:self];
}

- (MFBlockedSenderBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFBlockedSenderBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end