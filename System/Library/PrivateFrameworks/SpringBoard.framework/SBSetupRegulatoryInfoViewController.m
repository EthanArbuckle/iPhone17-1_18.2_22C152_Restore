@interface SBSetupRegulatoryInfoViewController
- (BOOL)_canShowWhileLocked;
- (void)loadView;
@end

@implementation SBSetupRegulatoryInfoViewController

- (void)loadView
{
  SFRegulatoryImage();
  id v24 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v24];
  regulatoryImageView = self->_regulatoryImageView;
  self->_regulatoryImageView = v3;

  [(UIImageView *)self->_regulatoryImageView sizeToFit];
  if (_os_feature_enabled_impl())
  {
    v5 = self->_regulatoryImageView;
    v6 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIImageView *)v5 setTintColor:v6];
  }
  v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  [MEMORY[0x1E4FA5F68] notificationListInsets];
  double v13 = v12;
  double v14 = *MEMORY[0x1E4F43D08];
  if (SBFEffectiveHomeButtonType() == 2)
  {
    [MEMORY[0x1E4FA5F68] proudLockOffsetFromTopOfScreen];
    double v14 = v14 + v15;
  }
  [v24 size];
  v17 = (UIScrollView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42DB0]), "initWithFrame:", v9, v14, v16, v11 - (v13 + v14));
  containerView = self->_containerView;
  self->_containerView = v17;

  v19 = self->_containerView;
  v20 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIScrollView *)v19 setBackgroundColor:v20];

  [(UIScrollView *)self->_containerView setAutoresizingMask:16];
  -[UIScrollView setContentInset:](self->_containerView, "setContentInset:", 24.0, 0.0, 24.0, 0.0);
  -[UIScrollView setContentOffset:](self->_containerView, "setContentOffset:", 0.0, -24.0);
  [(UIScrollView *)self->_containerView addSubview:self->_regulatoryImageView];
  v21 = self->_containerView;
  [(UIScrollView *)v21 frame];
  double v23 = v22;
  [v24 size];
  [(UIScrollView *)v21 setContentSize:v23];
  [(UIScrollView *)self->_containerView setClipsToBounds:1];
  [(SBSetupRegulatoryInfoViewController *)self setView:self->_containerView];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regulatoryImageView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end