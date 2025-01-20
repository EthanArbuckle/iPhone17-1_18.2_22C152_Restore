@interface SFPrivacyReportBannerCell
+ (id)reuseIdentifier;
- (BOOL)isPrivateBrowsingEnabled;
- (SFPrivacyReportBannerCell)initWithFrame:(CGRect)a3;
- (int64_t)numberOfTrackers;
- (void)_privacyProxyAvailabilityChanged:(id)a3;
- (void)_setAction:(unint64_t)a3 text:(id)a4;
- (void)_updateState;
- (void)configureUsingBanner:(id)a3;
- (void)setNumberOfTrackers:(int64_t)a3;
- (void)setPrivateBrowsingEnabled:(BOOL)a3;
@end

@implementation SFPrivacyReportBannerCell

- (void)setPrivateBrowsingEnabled:(BOOL)a3
{
  if (self->_privateBrowsingEnabled != a3)
  {
    self->_privateBrowsingEnabled = a3;
    [(SFPrivacyReportBannerCell *)self _updateState];
  }
}

- (void)setNumberOfTrackers:(int64_t)a3
{
  if (self->_numberOfTrackers != a3)
  {
    self->_numberOfTrackers = a3;
    [(SFPrivacyReportBannerCell *)self _updateState];
  }
}

- (void)_updateState
{
  v3 = (void *)MEMORY[0x1E4FB0870];
  v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"shield.lefthalf.fill"];
  id v29 = [v3 textAttachmentWithImage:v4];

  v5 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v29];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  [v6 appendAttributedString:v5];
  if (self->_numberOfTrackers >= 1)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F28B18]);
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", self->_numberOfTrackers);
    v9 = (void *)[v7 initWithString:v8];

    if ([(UIView *)self _sf_usesLeftToRightLayout]) {
      [v6 appendAttributedString:v9];
    }
    else {
      [v6 insertAttributedString:v9 atIndex:0];
    }
  }
  v10 = [(SFInteractiveBannerCell *)self leadingLabel];
  [v10 setAttributedText:v6];

  v11 = [MEMORY[0x1E4F98CF0] sharedManager];
  int v12 = [v11 isPrivacyProxyActive];
  uint64_t v13 = [v11 state];
  v14 = [(SFInteractiveBannerCell *)self captionLabel];
  if (self->_privateBrowsingEnabled)
  {
    [(SFInteractiveBannerCell *)self _removeActionButton];
    v15 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    int v16 = objc_msgSend(v15, "safari_enableAdvancedPrivacyProtections:", 1);

    if (v16)
    {
      if (v13) {
        int v17 = v12;
      }
      else {
        int v17 = 0;
      }
      if (self->_numberOfTrackers)
      {
        if (v17)
        {
          if (v13 == 2)
          {
            v18 = NSString;
          }
          else
          {
            if (v13 != 1) {
              goto LABEL_34;
            }
            v18 = NSString;
          }
        }
        else
        {
          v18 = NSString;
        }
        v27 = _WBSLocalizedString();
        v28 = objc_msgSend(v18, "localizedStringWithFormat:", v27, self->_numberOfTrackers);
        [v14 setText:v28];

        goto LABEL_34;
      }
      if (v17 && v13 != 2 && v13 != 1) {
        goto LABEL_34;
      }
    }
    v22 = _WBSLocalizedString();
    [v14 setText:v22];

    goto LABEL_34;
  }
  v19 = [MEMORY[0x1E4F28D18] sharedHTTPCookieStorage];
  char v20 = objc_msgSend(v19, "webui_trackerProtectionEnabled");

  if (v20)
  {
    if (v12)
    {
      if (v13 == 2)
      {
        v21 = NSString;
      }
      else if (v13 == 1)
      {
        v21 = NSString;
      }
      else
      {
        if (v13) {
          goto LABEL_34;
        }
        v21 = NSString;
      }
    }
    else
    {
      v21 = NSString;
    }
    v25 = _WBSLocalizedString();
    v26 = objc_msgSend(v21, "localizedStringWithFormat:", v25, self->_numberOfTrackers);
    [v14 setText:v26];

    [(SFInteractiveBannerCell *)self _removeActionButton];
  }
  else
  {
    v23 = _WBSLocalizedString();
    [v14 setText:v23];

    v24 = _WBSLocalizedString();
    [(SFPrivacyReportBannerCell *)self _setAction:0 text:v24];
  }
LABEL_34:
}

- (SFPrivacyReportBannerCell)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SFPrivacyReportBannerCell;
  v3 = -[SFInteractiveBannerCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_numberOfTrackers = -1;
    [(SFPrivacyReportBannerCell *)v3 _updateState];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4F993A0];
    id v7 = [MEMORY[0x1E4F98CF0] sharedManager];
    [v5 addObserver:v4 selector:sel__privacyProxyAvailabilityChanged_ name:v6 object:v7];

    v8 = v4;
  }

  return v4;
}

- (void)configureUsingBanner:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportBannerCell;
  [(SFInteractiveBannerCell *)&v4 configureUsingBanner:a3];
  [(SFPrivacyReportBannerCell *)self _updateState];
}

+ (id)reuseIdentifier
{
  return @"PrivacyReportBanner";
}

- (void)_privacyProxyAvailabilityChanged:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__SFPrivacyReportBannerCell__privacyProxyAvailabilityChanged___block_invoke;
  v3[3] = &unk_1E54E9858;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v3 completion:0];
}

void __62__SFPrivacyReportBannerCell__privacyProxyAvailabilityChanged___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateState];
  id v3 = [*(id *)(a1 + 32) superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [v3 collectionViewLayout];
    [v2 invalidateLayout];
  }
  [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_setAction:(unint64_t)a3 text:(id)a4
{
  self->_action = a3;
  [(SFInteractiveBannerCell *)self _updateActionButtonWithText:a4];
}

- (int64_t)numberOfTrackers
{
  return self->_numberOfTrackers;
}

- (BOOL)isPrivateBrowsingEnabled
{
  return self->_privateBrowsingEnabled;
}

@end