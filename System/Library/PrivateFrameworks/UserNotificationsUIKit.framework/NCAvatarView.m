@interface NCAvatarView
+ (BOOL)isAvatarPossibleWithNotificationRequest:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMaterialBacked;
- (NCAvatarView)initWithNotificationRequest:(id)a3;
- (NCAvatarView)initWithNotificationRequest:(id)a3 compatibleWithInitialTraitCollection:(id)a4;
- (NCAvatarView)initWithNotificationRequest:(id)a3 pointSize:(double)a4 compatibleWithInitialTraitCollection:(id)a5;
- (NCNotificationRequest)notificationRequest;
- (double)pointSize;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_configureBackgroundMaterialViewIfNecessary;
- (void)_configureImageViewIfNecessary;
- (void)_loadImage:(id)a3 needsFormatting:(BOOL)a4 animated:(BOOL)a5;
- (void)_updateAvatarImageIfNecessary;
- (void)layoutSubviews;
- (void)setMaterialBacked:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NCAvatarView

+ (BOOL)isAvatarPossibleWithNotificationRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 content];
  v5 = [v4 communicationContext];
  v6 = [v3 topLevelSectionIdentifier];

  LOBYTE(v3) = [v5 isAvatarImagePossibleForBundleIdentifier:v6];
  return (char)v3;
}

- (NCAvatarView)initWithNotificationRequest:(id)a3 pointSize:(double)a4 compatibleWithInitialTraitCollection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NCAvatarView;
  v10 = [(NCAvatarView *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_notificationRequest, v8);
    v11->_pointSize = a4;
    v11->_userInterfaceStyle = [v9 userInterfaceStyle];
  }

  return v11;
}

- (NCAvatarView)initWithNotificationRequest:(id)a3 compatibleWithInitialTraitCollection:(id)a4
{
  return [(NCAvatarView *)self initWithNotificationRequest:a3 pointSize:a4 compatibleWithInitialTraitCollection:0.0];
}

- (NCAvatarView)initWithNotificationRequest:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB1E20];
  id v5 = a3;
  v6 = [v4 currentTraitCollection];
  v7 = [(NCAvatarView *)self initWithNotificationRequest:v5 compatibleWithInitialTraitCollection:v6];

  return v7;
}

- (void)setMaterialBacked:(BOOL)a3
{
  if (self->_materialBacked != a3)
  {
    self->_materialBacked = a3;
    if (a3)
    {
      [(NCAvatarView *)self setNeedsLayout];
    }
    else
    {
      [(MTMaterialView *)self->_backgroundMaterialView removeFromSuperview];
      backgroundMaterialView = self->_backgroundMaterialView;
      self->_backgroundMaterialView = 0;
    }
  }
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)NCAvatarView;
  [(NCAvatarView *)&v10 layoutSubviews];
  [(NCAvatarView *)self _configureImageViewIfNecessary];
  [(NCAvatarView *)self _updateAvatarImageIfNecessary];
  [(NCAvatarView *)self _configureBackgroundMaterialViewIfNecessary];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationRequest);
  v4 = [WeakRetained content];
  id v5 = [v4 communicationContext];
  int v6 = [v5 isBusinessCorrespondence];

  if (v6)
  {
    double v7 = NCProminentIconCornerRadius();
    -[NCAvatarView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
    [(MTMaterialView *)self->_backgroundMaterialView _setContinuousCornerRadius:v7];
    [(UIImageView *)self->_imageView _setContinuousCornerRadius:v7];
  }
  else
  {
    [(NCAvatarView *)self frame];
    CGRectGetHeight(v11);
    UIRoundToScale();
    double v9 = v8;
    -[NCAvatarView _setCornerRadius:](self, "_setCornerRadius:");
    [(MTMaterialView *)self->_backgroundMaterialView _setCornerRadius:v9];
    [(UIImageView *)self->_imageView _setCornerRadius:v9];
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NCAvatarView *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    int v6 = v5;
    if (v6)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationRequest);
      id v8 = objc_loadWeakRetained(v6 + 55);
      if (BSEqualObjects()) {
        BOOL v9 = self->_pointSize == *((double *)v6 + 56);
      }
      else {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationRequest);
  if (WeakRetained)
  {
    id v5 = objc_alloc((Class)objc_opt_class());
    double pointSize = self->_pointSize;
    double v7 = [(NCAvatarView *)self traitCollection];
    int64_t userInterfaceStyle = self->_userInterfaceStyle;
    BOOL v9 = self;
    objc_super v10 = [v7 traitCollectionByReplacingNSIntegerValue:userInterfaceStyle forTrait:v9];
    CGRect v11 = (id *)[v5 initWithNotificationRequest:WeakRetained pointSize:v10 compatibleWithInitialTraitCollection:pointSize];

    v12 = [(UIImageView *)self->_imageView image];
    if (v12)
    {
      [v11 _configureImageViewIfNecessary];
      [v11[52] setImage:v12];
      objc_msgSend(v11[52], "setContentMode:", -[UIImageView contentMode](self->_imageView, "contentMode"));
    }
  }
  else
  {
    CGRect v11 = 0;
  }

  return v11;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCAvatarView;
  [(NCAvatarView *)&v6 traitCollectionDidChange:a3];
  v4 = [(NCAvatarView *)self traitCollection];
  int64_t v5 = [v4 userInterfaceStyle];

  if (self->_userInterfaceStyle != v5)
  {
    self->_int64_t userInterfaceStyle = v5;
    self->_avatarImageNeedsUpdate = 1;
    [(NCAvatarView *)self setNeedsLayout];
  }
}

- (void)_configureImageViewIfNecessary
{
  if (!self->_imageView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(NCAvatarView *)self bounds];
    v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:");
    imageView = self->_imageView;
    self->_imageView = v4;

    objc_super v6 = self->_imageView;
    double v7 = [MEMORY[0x1E4FB1618] systemDarkGrayColor];
    [(UIImageView *)v6 setTintColor:v7];

    [(UIImageView *)self->_imageView setClipsToBounds:1];
    [(NCAvatarView *)self addSubview:self->_imageView];
    id v8 = self->_imageView;
    [(UIImageView *)v8 setAutoresizingMask:18];
  }
}

- (void)_updateAvatarImageIfNecessary
{
  id v3 = [(UIImageView *)self->_imageView image];
  if (v3 && !self->_avatarImageNeedsUpdate)
  {
  }
  else
  {
    BOOL isGeneratingAvatarImage = self->_isGeneratingAvatarImage;

    if (!isGeneratingAvatarImage)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationRequest);
      if ([(id)objc_opt_class() isAvatarPossibleWithNotificationRequest:WeakRetained])
      {
        objc_super v6 = [(NCAvatarView *)self traitCollection];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __45__NCAvatarView__updateAvatarImageIfNecessary__block_invoke;
        v13[3] = &unk_1E6A94080;
        v13[4] = self;
        double v7 = [v6 traitCollectionByModifyingTraits:v13];

        self->_BOOL isGeneratingAvatarImage = 1;
        objc_initWeak(&location, self);
        CFTimeInterval v8 = CACurrentMediaTime();
        BOOL v9 = +[NCAvatarImageRenderer sharedInstanceForPointSize:self->_pointSize];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __45__NCAvatarView__updateAvatarImageIfNecessary__block_invoke_2;
        v10[3] = &unk_1E6A940D0;
        objc_copyWeak(v11, &location);
        v11[1] = *(id *)&v8;
        [v9 renderAvatarForRequest:WeakRetained compatibleWithTraitCollection:v7 completion:v10];

        objc_destroyWeak(v11);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __45__NCAvatarView__updateAvatarImageIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4FB1BA8];
  id v5 = a2;
  v4 = [v3 mainScreen];
  [v4 scale];
  objc_msgSend(v5, "setDisplayScale:");

  [v5 setUserInterfaceStyle:*(void *)(*(void *)(a1 + 32) + 408)];
}

void __45__NCAvatarView__updateAvatarImageIfNecessary__block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__NCAvatarView__updateAvatarImageIfNecessary__block_invoke_3;
  v7[3] = &unk_1E6A940A8;
  objc_copyWeak(v9, (id *)(a1 + 32));
  v9[1] = *(id *)(a1 + 40);
  id v8 = v5;
  char v10 = a3;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(v9);
}

void __45__NCAvatarView__updateAvatarImageIfNecessary__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _loadImage:*(void *)(a1 + 32) needsFormatting:*(unsigned __int8 *)(a1 + 56) animated:CACurrentMediaTime() - *(double *)(a1 + 48) > 0.0333];
    id WeakRetained = v3;
    *((unsigned char *)v3 + 432) = 0;
  }
}

- (void)_loadImage:(id)a3 needsFormatting:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  imageView = self->_imageView;
  if (a4) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  id v9 = a3;
  [(UIImageView *)imageView setContentMode:v8];
  char v10 = [(UIImageView *)self->_imageView image];

  [(UIImageView *)self->_imageView setImage:v9];
  self->_avatarImageNeedsUpdate = 0;
  CGRect v11 = self->_imageView;
  if (!v5 || v10)
  {
    [(UIImageView *)v11 setAlpha:1.0];
  }
  else
  {
    [(UIImageView *)v11 setAlpha:0.0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __52__NCAvatarView__loadImage_needsFormatting_animated___block_invoke;
    v12[3] = &unk_1E6A91BB0;
    v12[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithTension:1 friction:v12 interactive:0 animations:240.0 completion:20.0];
  }
}

uint64_t __52__NCAvatarView__loadImage_needsFormatting_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
}

- (void)_configureBackgroundMaterialViewIfNecessary
{
  v21[3] = *MEMORY[0x1E4F143B8];
  if (self->_materialBacked && !self->_backgroundMaterialView)
  {
    id v3 = [(NCAvatarView *)self traitCollection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __59__NCAvatarView__configureBackgroundMaterialViewIfNecessary__block_invoke;
    v19[3] = &unk_1E6A94080;
    v19[4] = self;
    v4 = [v3 traitCollectionByModifyingTraits:v19];

    BOOL v5 = (void *)MEMORY[0x1E4F743C8];
    id v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:0];
    v20[0] = v6;
    v21[0] = @"avatarBackground";
    double v7 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:1];
    v20[1] = v7;
    v21[1] = @"avatarBackground";
    uint64_t v8 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
    v20[2] = v8;
    v21[2] = @"avatarBackgroundDark";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];
    char v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    CGRect v11 = [v5 materialViewWithRecipeNamesByTraitCollection:v9 inBundle:v10 options:0 initialWeighting:0 scaleAdjustment:v4 compatibleWithTraitCollection:1.0];
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v11;

    objc_super v13 = self->_backgroundMaterialView;
    v14 = NSString;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = [v14 stringWithFormat:@"%@.%p", v16, self];
    [(MTMaterialView *)v13 setGroupNameBase:v17];

    [(NCAvatarView *)self insertSubview:self->_backgroundMaterialView atIndex:0];
    v18 = self->_backgroundMaterialView;
    [(NCAvatarView *)self bounds];
    -[MTMaterialView setFrame:](v18, "setFrame:");
    [(MTMaterialView *)self->_backgroundMaterialView setAutoresizingMask:18];
  }
}

uint64_t __59__NCAvatarView__configureBackgroundMaterialViewIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setUserInterfaceStyle:*(void *)(*(void *)(a1 + 32) + 408)];
}

- (NCNotificationRequest)notificationRequest
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationRequest);

  return (NCNotificationRequest *)WeakRetained;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (BOOL)isMaterialBacked
{
  return self->_materialBacked;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationRequest);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end