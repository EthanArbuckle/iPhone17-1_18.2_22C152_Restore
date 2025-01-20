@interface AccountCell
+ (int64_t)cellStyle;
- (AccountCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImage)placeHolderImage;
- (void)_profileImageDidChange:(id)a3;
- (void)_updateAccountImage;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setPlaceHolderImage:(id)a3;
@end

@implementation AccountCell

+ (int64_t)cellStyle
{
  return 3;
}

- (AccountCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)AccountCell;
  v5 = -[AccountCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, a3, a4, a5);
  v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle"];
  v7 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  v8 = [v6 imageWithTintColor:v7 renderingMode:2];

  id v9 = objc_alloc_init(MEMORY[0x1E4F4C068]);
  v10 = [v9 profilePictureForPicture:v8];

  [(AccountCell *)v5 setPlaceHolderImage:v10];
  v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:v5 selector:sel__profileImageDidChange_ name:@"VUIAuthenticationManagerProfileImageDidChangeNotification" object:0];

  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AccountCell;
  id v4 = a3;
  [(PSTableCell *)&v11 refreshCellContentsWithSpecifier:v4];
  -[AccountCell setAccessoryType:](self, "setAccessoryType:", 1, v11.receiver, v11.super_class);
  v5 = [(AccountCell *)self textLabel];
  v6 = [v4 propertyForKey:*MEMORY[0x1E4F93240]];
  [v5 setText:v6];

  v7 = [(AccountCell *)self detailTextLabel];
  v8 = [v4 propertyForKey:*MEMORY[0x1E4F93230]];
  [v7 setText:v8];

  id v9 = [(AccountCell *)self detailTextLabel];
  v10 = [v4 propertyForKey:*MEMORY[0x1E4F93228]];

  [v9 setTextColor:v10];
  [(AccountCell *)self _updateAccountImage];
  [(AccountCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AccountCell;
  [(PSTableCell *)&v4 layoutSubviews];
  v3 = [(AccountCell *)self imageView];
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, 56.0, 56.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AccountCell;
  -[AccountCell sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  if (v4 < 72.0) {
    double v4 = 72.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)_updateAccountImage
{
  if (!+[VUIAuthenticationManager userHasActiveAccount]) {
    goto LABEL_4;
  }
  double v3 = +[VUIAuthenticationManager userProfileImage];
  if (!v3)
  {
    double v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 scale];
    double v3 = +[VUIAuthenticationManager monogramAvatarForSize:scale:isRTL:](VUIAuthenticationManager, "monogramAvatarForSize:scale:isRTL:", [(AccountCell *)self vuiIsRTL], 56.0, 56.0, v5);

    if (!v3)
    {
LABEL_4:
      double v3 = [(AccountCell *)self placeHolderImage];
    }
  }
  v6 = [(AccountCell *)self imageView];
  [v6 setImage:v3];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__AccountCell__updateAccountImage__block_invoke;
  v7[3] = &unk_1E6DF3D58;
  v7[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
}

uint64_t __34__AccountCell__updateAccountImage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidateIntrinsicContentSize];
}

- (void)_profileImageDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  double v4 = __38__AccountCell__profileImageDidChange___block_invoke;
  double v5 = &unk_1E6DF3D58;
  v6 = self;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3)) {
    v4((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __38__AccountCell__profileImageDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccountImage];
}

- (UIImage)placeHolderImage
{
  return self->_placeHolderImage;
}

- (void)setPlaceHolderImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end