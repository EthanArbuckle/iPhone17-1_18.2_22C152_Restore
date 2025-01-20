@interface MFHasMoreContentBannerView
+ (id)bannerWithFrame:(CGRect)a3 isPlainText:(BOOL)a4 remainingBytes:(unint64_t)a5;
- (MFHasMoreContentBannerView)initWithFrame:(CGRect)a3;
- (MFHasMoreContentBannerViewDelegate)delegate;
- (NSString)titleString;
- (id)actionStringIsDownloading:(BOOL)a3;
- (void)_titleControlTapped:(id)a3;
- (void)primaryAction;
- (void)reloadData;
- (void)requestLoad;
- (void)setDelegate:(id)a3;
@end

@implementation MFHasMoreContentBannerView

+ (id)bannerWithFrame:(CGRect)a3 isPlainText:(BOOL)a4 remainingBytes:(unint64_t)a5
{
  if (a4) {
    v5 = -[_MFPlainTextBannerView initWithFrame:]([_MFPlainTextBannerView alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else {
    v5 = -[_MFPartiallyDownloadedBannerView initWithFrame:remainingBytes:]([_MFPartiallyDownloadedBannerView alloc], "initWithFrame:remainingBytes:", a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  return v5;
}

- (MFHasMoreContentBannerView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MFHasMoreContentBannerView;
  v3 = -[MFSuggestionBannerView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    [v4 setAccessoryType:0];
    [v4 setActionButtonType:1];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    v5 = (void *)MEMORY[0x1E4F5DFF8];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __44__MFHasMoreContentBannerView_initWithFrame___block_invoke;
    v11 = &unk_1E6D1AEA8;
    objc_copyWeak(&v12, &location);
    v6 = [v5 actionWithTitle:&stru_1F39E2A88 handler:&v8];
    objc_msgSend(v4, "setPrimaryAction:", v6, v8, v9, v10, v11);

    [(MFSuggestionBannerView *)v3 setBanner:v4];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __44__MFHasMoreContentBannerView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained primaryAction];
}

- (NSString)titleString
{
}

- (id)actionStringIsDownloading:(BOOL)a3
{
}

- (void)primaryAction
{
}

- (void)_titleControlTapped:(id)a3
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__MFHasMoreContentBannerView__titleControlTapped___block_invoke;
  v6[3] = &unk_1E6D1AB40;
  v6[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.35];
  v4 = [(MFSuggestionBannerView *)self banner];
  [v4 setUserInteractionEnabled:0];

  v5 = [(MFHasMoreContentBannerView *)self delegate];
  [v5 didTapHasMoreContentBannerView:self];
}

void __50__MFHasMoreContentBannerView__titleControlTapped___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) banner];
  v2 = [*(id *)(a1 + 32) actionStringIsDownloading:1];
  [v4 setActionTitle:v2];

  [v4 setActionButtonType:1];
  [*(id *)(a1 + 32) setBanner:v4];
  v3 = [*(id *)(a1 + 32) banner];
  [v3 setTintAdjustmentMode:2];
}

- (void)reloadData
{
  id v6 = [(MFSuggestionBannerView *)self banner];
  v3 = [(MFHasMoreContentBannerView *)self actionStringIsDownloading:0];
  [v6 setActionTitle:v3];

  [v6 setActionButtonType:1];
  [(MFSuggestionBannerView *)self setBanner:v6];
  id v4 = [(MFSuggestionBannerView *)self banner];
  [v4 setTintAdjustmentMode:0];

  v5 = [(MFSuggestionBannerView *)self banner];
  [v5 setUserInteractionEnabled:1];
}

- (void)requestLoad
{
}

- (MFHasMoreContentBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MFHasMoreContentBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end