@interface VUIAccountSettingsButton
- (BOOL)hideAndDisable;
- (CGSize)calculateContentSize;
- (CGSize)contentSize;
- (CGSize)preferedContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (VUIAccountSettingsButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4;
- (id)largeContentImage;
- (void)_accountStoreDidChange:(id)a3;
- (void)_profileImageDidChange:(id)a3;
- (void)_setup;
- (void)_setupAccountImageView;
- (void)_updateAccessibilityFrame;
- (void)_updateAccountButtonVisibility;
- (void)_updateAccountImage;
- (void)_updateImageViewFrame;
- (void)configureWithLayoutProperties;
- (void)hideAndDisable:(BOOL)a3;
- (void)layoutSubviews;
- (void)setContentSize:(CGSize)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHideAndDisable:(BOOL)a3;
- (void)setPreferedContentSize:(CGSize)a3;
- (void)setTintColor:(id)a3;
@end

@implementation VUIAccountSettingsButton

- (void)configureWithLayoutProperties
{
  v7.receiver = self;
  v7.super_class = (Class)VUIAccountSettingsButton;
  [(VUIButton *)&v7 configureWithLayoutProperties];
  [(VUIButton *)self setImageTintColor:0];
  [(VUIAccountSettingsButton *)self contentSize];
  double v4 = v3;
  [(VUIAccountSettingsButton *)self contentSize];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  [(VUIButton *)self setCornerRadius:v6 * 0.5];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VUIAccountSettingsButton;
  [(VUIButton *)&v3 layoutSubviews];
  [(VUIAccountSettingsButton *)self _updateAccessibilityFrame];
  [(VUIAccountSettingsButton *)self _updateImageViewFrame];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUIAccountSettingsButton;
  -[VUIAccountSettingsButton setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(VUIAccountSettingsButton *)self _updateAccessibilityFrame];
}

- (void)_updateImageViewFrame
{
  [(VUIButton *)self padding];
  [(VUIAccountSettingsButton *)self contentSize];
  [(VUIAccountSettingsButton *)self contentSize];
  [(VUIAccountSettingsButton *)self bounds];
  [(VUIAccountSettingsButton *)self vuiIsRTL];
  VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(VUIButton *)self imageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)_updateAccessibilityFrame
{
  [(VUIButton *)self padding];
  [(VUIAccountSettingsButton *)self bounds];
  CGRectGetMinY(v13);
  [(VUIAccountSettingsButton *)self bounds];
  CGRectGetWidth(v14);
  [(VUIButton *)self padding];
  [(VUIAccountSettingsButton *)self bounds];
  CGRectGetHeight(v15);
  [(VUIAccountSettingsButton *)self bounds];
  [(VUIAccountSettingsButton *)self vuiIsRTL];
  VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[VUIAccountSettingsButton convertRect:toView:](self, "convertRect:toView:", 0);
  -[VUIAccountSettingsButton setAccessibilityFrame:](self, "setAccessibilityFrame:");
  id v11 = [(VUIButton *)self imageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(VUIAccountSettingsButton *)self contentSize];
  double v5 = v4;
  [(VUIButton *)self padding];
  double v7 = v5 + v6;
  [(VUIAccountSettingsButton *)self contentSize];
  double v9 = v7;
  result.height = v8;
  result.width = v9;
  return result;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_updateAccountButtonVisibility
{
  if (+[VUIAuthenticationManager allowsAccountModification]&& ![(VUIAccountSettingsButton *)self hideAndDisable])
  {
    uint64_t v4 = 0;
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 1;
  }
  [(VUIAccountSettingsButton *)self setHidden:v4];
  [(VUIAccountSettingsButton *)self setUserInteractionEnabled:v3];
}

- (BOOL)hideAndDisable
{
  return self->_hideAndDisable;
}

- (VUIAccountSettingsButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VUIAccountSettingsButton;
  uint64_t v4 = [(VUIButton *)&v11 initWithType:a3 interfaceStyle:a4];
  double v5 = v4;
  if (v4)
  {
    -[VUIAccountSettingsButton setPreferedContentSize:](v4, "setPreferedContentSize:", 34.0, 34.0);
    -[VUIButton setPadding:](v5, "setPadding:", 0.0, 15.0, 0.0, 0.0);
    [(VUIAccountSettingsButton *)v5 _setup];
    objc_initWeak(&location, v5);
    v12[0] = objc_opt_class();
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__VUIAccountSettingsButton_initWithType_interfaceStyle___block_invoke;
    v8[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v9, &location);
    [(VUIAccountSettingsButton *)v5 vui_registerForTraitChanges:v6 withHandler:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v5;
}

- (void)setPreferedContentSize:(CGSize)a3
{
  self->_preferedContentSize = a3;
  [(VUIAccountSettingsButton *)self calculateContentSize];
  -[VUIAccountSettingsButton setContentSize:](self, "setContentSize:");
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (CGSize)preferedContentSize
{
  double width = self->_preferedContentSize.width;
  double height = self->_preferedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)calculateContentSize
{
  uint64_t v3 = [(VUIAccountSettingsButton *)self traitCollection];
  char v4 = [v3 isAXEnabled];

  if (v4)
  {
    double v5 = 44.0;
    double v6 = 44.0;
  }
  else
  {
    [(VUIAccountSettingsButton *)self preferedContentSize];
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (void)_setup
{
  [(VUIAccountSettingsButton *)self _setupAccountImageView];
  [(VUIAccountSettingsButton *)self _updateAccountImage];
  [(VUIAccountSettingsButton *)self _updateAccountButtonVisibility];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__accountStoreDidChange_ name:@"VUIAuthenticationManagerAccountStoreDidChangeNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__profileImageDidChange_ name:@"VUIAuthenticationManagerProfileImageDidChangeNotification" object:0];
}

- (void)_updateAccountImage
{
  VUIRequireMainThread();
  if (+[VUIAuthenticationManager userHasActiveAccount])
  {
    id v6 = +[VUIAuthenticationManager userProfileImage];
    if (!v6)
    {
      uint64_t v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v3 scale];
      +[VUIAuthenticationManager monogramAvatarForSize:scale:isRTL:](VUIAuthenticationManager, "monogramAvatarForSize:scale:isRTL:", [(VUIAccountSettingsButton *)self vuiIsRTL], 34.0, 34.0, v4);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v6 = 0;
  }
  double v5 = [(VUIButton *)self imageView];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 setImage:v6];
  }
}

- (void)_setupAccountImageView
{
  [(VUIAccountSettingsButton *)self contentSize];
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4FB3D18]), "initWithSymbol:size:symbolConfiguration:", @"person.crop.circle", 0, v3, v4);
  [v7 setRenderAsTemplate:1];
  double v5 = [MEMORY[0x1E4FB3CC0] makeImageViewWithResourceDescriptor:v7 existingView:0];
  [v5 setUserInteractionEnabled:0];
  if (v5)
  {
    id v6 = [v5 image];
    [v5 setPlaceholderImage:v6];
  }
  [(VUIButton *)self setImageView:v5 forHighlightedState:0];
}

void __56__VUIAccountSettingsButton_initWithType_interfaceStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained calculateContentSize];
  double v2 = v1;
  double v4 = v3;
  [WeakRetained contentSize];
  if (v2 != v6 || v4 != v5)
  {
    objc_msgSend(WeakRetained, "setContentSize:", v2, v4);
    [WeakRetained invalidateIntrinsicContentSize];
  }
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIButton *)self imageView];
  [v5 setTintColor:v4];
}

- (id)largeContentImage
{
  double v2 = [(VUIButton *)self imageView];
  double v3 = [v2 placeholderImage];

  return v3;
}

- (void)hideAndDisable:(BOOL)a3
{
  [(VUIAccountSettingsButton *)self setHideAndDisable:a3];
  [(VUIAccountSettingsButton *)self _updateAccountButtonVisibility];
}

- (void)_accountStoreDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v4 = __51__VUIAccountSettingsButton__accountStoreDidChange___block_invoke;
  id v5 = &unk_1E6DF3D58;
  double v6 = self;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3)) {
    v4((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __51__VUIAccountSettingsButton__accountStoreDidChange___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateAccountButtonVisibility];
  double v2 = *(void **)(a1 + 32);
  return [v2 _updateAccountImage];
}

- (void)_profileImageDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v4 = __51__VUIAccountSettingsButton__profileImageDidChange___block_invoke;
  id v5 = &unk_1E6DF3D58;
  double v6 = self;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3)) {
    v4((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __51__VUIAccountSettingsButton__profileImageDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccountImage];
}

- (void)setHideAndDisable:(BOOL)a3
{
  self->_hideAndDisable = a3;
}

@end