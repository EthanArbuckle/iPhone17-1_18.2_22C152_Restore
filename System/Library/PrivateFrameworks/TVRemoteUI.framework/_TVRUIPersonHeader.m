@interface _TVRUIPersonHeader
+ (NSString)elementKind;
+ (NSString)reuseIdentifier;
- (BOOL)showsImageBorder;
- (UIImage)image;
- (UIImageView)imageView;
- (_TVRUIPersonHeader)initWithFrame:(CGRect)a3;
- (void)_configureHierarchy;
- (void)_updateImageBorderFromCurrentState;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setShowsImageBorder:(BOOL)a3;
@end

@implementation _TVRUIPersonHeader

- (_TVRUIPersonHeader)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVRUIPersonHeader;
  v3 = -[_TVRUIPersonHeader initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_TVRUIPersonHeader *)v3 _configureHierarchy];
    [(_TVRUIPersonHeader *)v4 setShowsImageBorder:1];
  }
  return v4;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  objc_super v6 = [(_TVRUIPersonHeader *)self imageView];
  [v6 setImage:v5];

  [(_TVRUIPersonHeader *)self _updateImageBorderFromCurrentState];
}

- (void)setShowsImageBorder:(BOOL)a3
{
  self->_showsImageBorder = a3;
  [(_TVRUIPersonHeader *)self _updateImageBorderFromCurrentState];
}

+ (NSString)elementKind
{
  return (NSString *)@"com.apple.tvos.remote.person-header-element-kind";
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"com.apple.tvos.remote.person-header-reuse-identifier";
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)_TVRUIPersonHeader;
  [(_TVRUIPersonHeader *)&v16 layoutSubviews];
  v3 = [(_TVRUIPersonHeader *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  double MidX = CGRectGetMidX(v17);
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  double MidY = CGRectGetMidY(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  double Height = CGRectGetHeight(v19);
  v15 = [(_TVRUIPersonHeader *)self imageView];
  objc_msgSend(v15, "setFrame:", MidX - Height * 0.5, MidY - Height * 0.5, Height, Height);
}

- (void)_configureHierarchy
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
  [(UIImageView *)v3 _setContinuousCornerRadius:16.0];
  id v4 = [MEMORY[0x263F825C8] darkGrayColor];
  uint64_t v5 = [v4 CGColor];
  double v6 = [(UIImageView *)v3 layer];
  [v6 setBorderColor:v5];

  CGFloat v7 = [(UIImageView *)v3 layer];
  [v7 setBorderWidth:0.5];

  [(UIImageView *)v3 setContentMode:1];
  [(UIImageView *)v3 setClipsToBounds:1];
  double v8 = [(_TVRUIPersonHeader *)self contentView];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  CGRect v19 = v3;
  CGFloat v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", &v19, 1, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        [v8 addSubview:*(void *)(*((void *)&v15 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v11);
  }

  imageView = self->_imageView;
  self->_imageView = v3;

  [(_TVRUIPersonHeader *)self setNeedsLayout];
}

- (void)_updateImageBorderFromCurrentState
{
  if ([(_TVRUIPersonHeader *)self showsImageBorder]) {
    [MEMORY[0x263F825C8] darkGrayColor];
  }
  else {
  id v6 = [MEMORY[0x263F825C8] clearColor];
  }
  uint64_t v3 = [v6 CGColor];
  id v4 = [(_TVRUIPersonHeader *)self imageView];
  uint64_t v5 = [v4 layer];
  [v5 setBorderColor:v3];
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)showsImageBorder
{
  return self->_showsImageBorder;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end