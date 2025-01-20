@interface MacRAPLookAroundImageCell
+ (NSString)reuseIdentifier;
- (MacRAPLookAroundImageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImage)lookAroundImage;
- (UIImageView)lookAroundImageView;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)setLookAroundImage:(id)a3;
- (void)setLookAroundImageView:(id)a3;
@end

@implementation MacRAPLookAroundImageCell

- (MacRAPLookAroundImageCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MacRAPLookAroundImageCell;
  v4 = [(MacRAPLookAroundImageCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MacRAPLookAroundImageCell *)v4 _setupSubviews];
    [(MacRAPLookAroundImageCell *)v5 _setupConstraints];
    [(MacRAPLookAroundImageCell *)v5 setSelectionStyle:0];
  }
  return v5;
}

- (void)setLookAroundImage:(id)a3
{
  v6 = (UIImage *)a3;
  if (self->_lookAroundImage != v6)
  {
    objc_storeStrong((id *)&self->_lookAroundImage, a3);
    v5 = [(MacRAPLookAroundImageCell *)self lookAroundImageView];
    [v5 setImage:v6];
  }
}

- (void)_setupSubviews
{
  id v3 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(MacRAPLookAroundImageCell *)self setLookAroundImageView:v3];

  v4 = [(MacRAPLookAroundImageCell *)self lookAroundImageView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(MacRAPLookAroundImageCell *)self lookAroundImageView];
  [v5 setContentMode:2];

  v6 = [(MacRAPLookAroundImageCell *)self lookAroundImageView];
  [v6 setClipsToBounds:1];

  id v8 = [(MacRAPLookAroundImageCell *)self contentView];
  objc_super v7 = [(MacRAPLookAroundImageCell *)self lookAroundImageView];
  [v8 addSubview:v7];
}

- (void)_setupConstraints
{
  v26 = [(MacRAPLookAroundImageCell *)self lookAroundImageView];
  v24 = [v26 topAnchor];
  v25 = [(MacRAPLookAroundImageCell *)self contentView];
  v23 = [v25 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v27[0] = v22;
  v21 = [(MacRAPLookAroundImageCell *)self lookAroundImageView];
  v19 = [v21 bottomAnchor];
  v20 = [(MacRAPLookAroundImageCell *)self contentView];
  v18 = [v20 bottomAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v27[1] = v17;
  v16 = [(MacRAPLookAroundImageCell *)self lookAroundImageView];
  v14 = [v16 leadingAnchor];
  v15 = [(MacRAPLookAroundImageCell *)self contentView];
  v13 = [v15 leadingAnchor];
  id v3 = [v14 constraintEqualToAnchor:v13];
  v27[2] = v3;
  v4 = [(MacRAPLookAroundImageCell *)self lookAroundImageView];
  v5 = [v4 trailingAnchor];
  v6 = [(MacRAPLookAroundImageCell *)self contentView];
  objc_super v7 = [v6 trailingAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7];
  v27[3] = v8;
  v9 = [(MacRAPLookAroundImageCell *)self lookAroundImageView];
  v10 = [v9 heightAnchor];
  v11 = [v10 constraintEqualToConstant:235.0];
  v27[4] = v11;
  v12 = +[NSArray arrayWithObjects:v27 count:5];
  +[NSLayoutConstraint activateConstraints:v12];
}

+ (NSString)reuseIdentifier
{
  return (NSString *)@"MacRAPLookAroundImageCell";
}

- (UIImage)lookAroundImage
{
  return self->_lookAroundImage;
}

- (UIImageView)lookAroundImageView
{
  return self->_lookAroundImageView;
}

- (void)setLookAroundImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookAroundImageView, 0);

  objc_storeStrong((id *)&self->_lookAroundImage, 0);
}

@end