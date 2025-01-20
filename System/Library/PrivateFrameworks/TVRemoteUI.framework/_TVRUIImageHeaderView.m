@interface _TVRUIImageHeaderView
+ (NSString)elementKind;
+ (NSString)reuseIdentifier;
+ (double)computedHeightForWidth:(double)a3;
- (UIImage)image;
- (UIImageView)imageView;
- (_TVRUIImageHeaderView)initWithFrame:(CGRect)a3;
- (void)_configureHierarchy;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
@end

@implementation _TVRUIImageHeaderView

- (_TVRUIImageHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVRUIImageHeaderView;
  v3 = -[_TVRUIImageHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TVRUIImageHeaderView *)v3 _configureHierarchy];
  }
  return v4;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
  id v5 = a3;
  id v6 = [(_TVRUIImageHeaderView *)self imageView];
  [v6 setImage:v5];
}

+ (double)computedHeightForWidth:(double)a3
{
  return (a3 + -40.0) / 1.77777778;
}

+ (NSString)elementKind
{
  return (NSString *)@"com.apple.tvos.remote.mediaInfo-header-element-kind";
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"com.apple.tvos.remote.mediaInfo-header-reuse-identifier";
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)_TVRUIImageHeaderView;
  [(_TVRUIImageHeaderView *)&v16 layoutSubviews];
  v3 = [(_TVRUIImageHeaderView *)self contentView];
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
  v15 = [(_TVRUIImageHeaderView *)self imageView];
  objc_msgSend(v15, "setFrame:", MidX - Height * 1.77777778 * 0.5, MidY - Height * 0.5, Height * 1.77777778, Height);
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
  double v8 = [(_TVRUIImageHeaderView *)self contentView];
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

  [(_TVRUIImageHeaderView *)self setNeedsLayout];
}

- (UIImage)image
{
  return self->_image;
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