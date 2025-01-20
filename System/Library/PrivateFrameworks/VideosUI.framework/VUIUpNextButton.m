@interface VUIUpNextButton
- (CGSize)intrinsicContentSize;
- (VUIUpNextButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4;
- (VUIUpNextButtonProperties)properties;
- (id)largeContentTitle;
- (id)stateDidChangeHandler;
- (void)selectButtonAction:(id)a3;
- (void)setProperties:(id)a3;
- (void)setStateDidChangeHandler:(id)a3;
- (void)setTintColor:(id)a3;
- (void)upNextStateChangedToAdded;
- (void)upNextStateChangedToRemoved;
- (void)updateAccessibilityIdentifierAfterStateChanged;
@end

@implementation VUIUpNextButton

- (VUIUpNextButton)initWithType:(unint64_t)a3 interfaceStyle:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)VUIUpNextButton;
  v4 = [(VUIButton *)&v10 initWithType:a3 interfaceStyle:a4];
  if (v4)
  {
    v5 = objc_alloc_init(VUIUpNextButtonProperties);
    [(VUIUpNextButton *)v4 setProperties:v5];

    objc_initWeak(&location, v4);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__VUIUpNextButton_initWithType_interfaceStyle___block_invoke;
    v7[3] = &unk_1E6DF4400;
    objc_copyWeak(&v8, &location);
    [(VUIButton *)v4 setSelectActionHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __47__VUIUpNextButton_initWithType_interfaceStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained selectButtonAction:@"select"];
}

- (void)selectButtonAction:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  [v4 postNotificationName:@"VUIDidSelectUpNextButtonNotification" object:self userInfo:0];

  v5 = [(VUIUpNextButton *)self properties];
  [v5 callAPIAndToggleUpNextState];

  v6 = [(VUIUpNextButton *)self properties];
  LODWORD(v5) = [v6 dismissOnSelect];

  if (v5)
  {
    +[VUIApplicationRouter dismissPresentedViewController];
  }
}

- (CGSize)intrinsicContentSize
{
  -[UIView vui_sizeThatFits:](self, "vui_sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VUIUpNextButton;
  [(VUIButton *)&v7 setTintColor:v4];
  if ([(VUIUpNextButton *)self tintAdjustmentMode] != 2)
  {
    v5 = [(VUIUpNextButton *)self properties];
    v6 = [v5 currentImageView];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v6 _setTintColor:v4];
    }
    [(VUIButton *)self setImageTintColor:v4];
  }
}

- (void)upNextStateChangedToAdded
{
  double v3 = [(VUIUpNextButton *)self properties];
  id v4 = [v3 addedStateView];
  v5 = [v4 label];
  [(VUIButton *)self setTextContentView:v5];

  v6 = [(VUIUpNextButton *)self properties];
  id v22 = [v6 currentImageView];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  objc_super v7 = [(VUIButton *)self imageView];

  if (!v7) {
    [(VUIButton *)self setImageView:v22];
  }
  id v8 = [(VUIUpNextButton *)self properties];
  v9 = [v8 addedStateView];
  objc_super v10 = [v9 image];

  v11 = [v22 image];
  if (v11 && ([MEMORY[0x1E4FB3C90] isMac] & 1) == 0)
  {
    char v19 = [MEMORY[0x1E4FB3C90] isTV];

    if ((v19 & 1) == 0)
    {
      v20 = [v22 image];

      if (v20 != v10)
      {
        v21 = [MEMORY[0x1E4F41A60] transition];
        [v22 setSymbolImage:v10 withSymbolTransition:v21];
      }
      goto LABEL_8;
    }
  }
  else
  {
  }
  [v22 setImage:v10];
LABEL_8:
  int v12 = _os_feature_enabled_impl();
  v13 = @"TV.Button.UpNext.Remove";
  if (v12) {
    v13 = @"TV.Button.Watchlist.Remove";
  }
  v14 = v13;
  v15 = +[VUILocalizationManager sharedInstance];
  v16 = [v15 localizedStringForKey:v14];

  [v22 setAccessibilityLabel:v16];
LABEL_11:
  [(VUIUpNextButton *)self invalidateIntrinsicContentSize];
  [(VUIUpNextButton *)self updateAccessibilityIdentifierAfterStateChanged];
  v17 = [(VUIUpNextButton *)self stateDidChangeHandler];

  if (v17)
  {
    v18 = [(VUIUpNextButton *)self stateDidChangeHandler];
    ((void (**)(void, VUIUpNextButton *))v18)[2](v18, self);
  }
}

- (void)upNextStateChangedToRemoved
{
  double v3 = [(VUIUpNextButton *)self properties];
  id v4 = [v3 removedStateView];
  v5 = [v4 label];
  [(VUIButton *)self setTextContentView:v5];

  v6 = [(VUIUpNextButton *)self properties];
  id v22 = [v6 currentImageView];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  objc_super v7 = [(VUIButton *)self imageView];

  if (!v7) {
    [(VUIButton *)self setImageView:v22];
  }
  id v8 = [(VUIUpNextButton *)self properties];
  v9 = [v8 removedStateView];
  objc_super v10 = [v9 image];

  v11 = [v22 image];
  if (v11 && ([MEMORY[0x1E4FB3C90] isMac] & 1) == 0)
  {
    char v19 = [MEMORY[0x1E4FB3C90] isTV];

    if ((v19 & 1) == 0)
    {
      v20 = [v22 image];

      if (v20 != v10)
      {
        v21 = [MEMORY[0x1E4F41A60] transition];
        [v22 setSymbolImage:v10 withSymbolTransition:v21];
      }
      goto LABEL_8;
    }
  }
  else
  {
  }
  [v22 setImage:v10];
LABEL_8:
  int v12 = _os_feature_enabled_impl();
  v13 = +[VUILocalizationManager sharedInstance];
  v14 = v13;
  if (v12) {
    v15 = @"TV.Button.Watchlist.Add";
  }
  else {
    v15 = @"TV.Button.UpNext.Add";
  }
  v16 = [v13 localizedStringForKey:v15];
  [v22 setAccessibilityLabel:v16];

LABEL_12:
  [(VUIUpNextButton *)self invalidateIntrinsicContentSize];
  [(VUIUpNextButton *)self updateAccessibilityIdentifierAfterStateChanged];
  v17 = [(VUIUpNextButton *)self stateDidChangeHandler];

  if (v17)
  {
    v18 = [(VUIUpNextButton *)self stateDidChangeHandler];
    ((void (**)(void, VUIUpNextButton *))v18)[2](v18, self);
  }
}

- (void)updateAccessibilityIdentifierAfterStateChanged
{
  double v3 = [(VUIUpNextButton *)self vuiAccessibilityIdentifier];
  id v4 = [(VUIUpNextButton *)self properties];
  int v5 = [v4 isWatchListed];

  if (v5)
  {
    v6 = @"removed";
    objc_super v7 = @"added";
  }
  else
  {
    v6 = @"added";
    objc_super v7 = @"removed";
  }
  id v8 = [v3 stringByReplacingOccurrencesOfString:v6 withString:v7];

  [(VUIUpNextButton *)self setVuiAccessibilityIdentifier:v8];
}

- (id)largeContentTitle
{
  double v2 = [(VUIUpNextButton *)self properties];
  int v3 = [v2 isWatchListed];

  int v4 = _os_feature_enabled_impl();
  int v5 = +[VUILocalizationManager sharedInstance];
  v6 = v5;
  objc_super v7 = @"TV.Button.UpNext.Remove";
  if (v4) {
    objc_super v7 = @"TV.Button.Watchlist.Remove";
  }
  id v8 = @"TV.Button.Watchlist.Add";
  if (!v4) {
    id v8 = @"TV.Button.UpNext.Add";
  }
  if (v3) {
    v9 = v7;
  }
  else {
    v9 = v8;
  }
  objc_super v10 = [v5 localizedStringForKey:v9];

  return v10;
}

- (VUIUpNextButtonProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (id)stateDidChangeHandler
{
  return self->_stateDidChangeHandler;
}

- (void)setStateDidChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end