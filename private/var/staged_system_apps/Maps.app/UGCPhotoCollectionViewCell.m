@interface UGCPhotoCollectionViewCell
+ (id)reuseIdentifier;
- (BOOL)hoverActive;
- (NSString)identifier;
- (UGCPhotoCollectionViewCell)initWithFrame:(CGRect)a3;
- (UGCPhotoCollectionViewCellDelegate)delegate;
- (UIImage)image;
- (UIImageView)contentImageView;
- (id)imageView;
- (void)_cancelButtonPressed;
- (void)_handleHover:(id)a3;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)beginAnimatingActivityIndicator;
- (void)endAnimatingActivityIndicatorWithError:(id)a3;
- (void)prepareForReuse;
- (void)setContentImageView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHoverActive:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation UGCPhotoCollectionViewCell

- (UGCPhotoCollectionViewCell)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)UGCPhotoCollectionViewCell;
  v3 = -[UGCPhotoCollectionViewCell initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
    contentImageView = v3->_contentImageView;
    v3->_contentImageView = v8;

    if (sub_1000BBB44(v3) == 5)
    {
      uint64_t v10 = +[UIButton buttonWithType:0];
      closeButton = v3->_closeButton;
      v3->_closeButton = (UIButton *)v10;

      v12 = v3->_closeButton;
      v13 = +[UIImage systemImageNamed:@"minus.circle"];
      [(UIButton *)v12 setImage:v13 forState:0];

      v14 = v3->_closeButton;
      v15 = +[UIImageSymbolConfiguration configurationWithPointSize:26.0];
      [(UIButton *)v14 setPreferredSymbolConfiguration:v15 forImageInState:0];

      -[UIButton setContentEdgeInsets:](v3->_closeButton, "setContentEdgeInsets:", -2.0, -2.0, -2.0, -2.0);
      v16 = +[UIColor systemWhiteColor];
      [(UIButton *)v3->_closeButton setTintColor:v16];

      v17 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
      closeButtonBlurView = v3->_closeButtonBlurView;
      v3->_closeButtonBlurView = v17;

      v19 = +[UIColor colorWithWhite:0.0 alpha:0.55];
      [(UIView *)v3->_closeButtonBlurView setBackgroundColor:v19];
    }
    else
    {
      uint64_t v20 = +[UIButton buttonWithType:7];
      v21 = v3->_closeButton;
      v3->_closeButton = (UIButton *)v20;

      id v22 = objc_alloc((Class)UIVisualEffectView);
      v19 = +[UIBlurEffect effectWithStyle:17];
      v23 = (UIView *)[v22 initWithEffect:v19];
      v24 = v3->_closeButtonBlurView;
      v3->_closeButtonBlurView = v23;
    }
    [(UGCPhotoCollectionViewCell *)v3 _setupSubviews];
    [(UGCPhotoCollectionViewCell *)v3 _setupConstraints];
  }
  return v3;
}

- (void)_setupSubviews
{
  [(UIImageView *)self->_contentImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_contentImageView setAccessibilityIgnoresInvertColors:1];
  [(UIImageView *)self->_contentImageView setContentMode:2];
  v3 = [(UGCPhotoCollectionViewCell *)self contentView];
  [v3 addSubview:self->_contentImageView];

  [(UIButton *)self->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_closeButton setOverrideUserInterfaceStyle:2];
  if (sub_1000BBB44(self) != 5) {
    -[UIButton setImageEdgeInsets:](self->_closeButton, "setImageEdgeInsets:", 6.0, 6.0, 6.0, 6.0);
  }
  [(UIButton *)self->_closeButton addTarget:self action:"_cancelButtonPressed" forControlEvents:64];
  [(UIView *)self->_closeButtonBlurView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_closeButtonBlurView _setCornerRadius:12.0];
  id v4 = [objc_alloc((Class)UIActivityIndicatorView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  spinner = self->_spinner;
  self->_spinner = v4;

  [(UIActivityIndicatorView *)self->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)self->_spinner setHidesWhenStopped:1];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  closeButtonBlurView = self->_closeButtonBlurView;
  if (isKindOfClass)
  {
    v8 = [(UIView *)closeButtonBlurView contentView];
    [v8 addSubview:self->_closeButton];
  }
  else
  {
    [(UIView *)closeButtonBlurView addSubview:self->_closeButton];
  }
  v9 = [(UGCPhotoCollectionViewCell *)self contentView];
  [v9 addSubview:self->_closeButtonBlurView];

  uint64_t v10 = [(UGCPhotoCollectionViewCell *)self contentView];
  [v10 addSubview:self->_spinner];

  if (sub_1000BBB44(self) == 5)
  {
    [(UIView *)self->_closeButtonBlurView setHidden:1];
    v11 = (UIHoverGestureRecognizer *)[objc_alloc((Class)UIHoverGestureRecognizer) initWithTarget:self action:"_handleHover:"];
    hoverGestureRecognizer = self->_hoverGestureRecognizer;
    self->_hoverGestureRecognizer = v11;

    id v13 = [(UGCPhotoCollectionViewCell *)self contentView];
    [v13 addGestureRecognizer:self->_hoverGestureRecognizer];
  }
}

- (void)_setupConstraints
{
  v3 = [(UGCPhotoCollectionViewCell *)self contentView];
  v47 = [v3 leadingAnchor];
  v46 = [(UIImageView *)self->_contentImageView leadingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v48[0] = v45;
  v44 = [v3 trailingAnchor];
  v43 = [(UIImageView *)self->_contentImageView trailingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v48[1] = v42;
  v41 = [v3 topAnchor];
  v40 = [(UIImageView *)self->_contentImageView topAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v48[2] = v39;
  id v4 = v3;
  v38 = [v3 bottomAnchor];
  v37 = [(UIImageView *)self->_contentImageView bottomAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v48[3] = v36;
  v35 = [(UIButton *)self->_closeButton widthAnchor];
  v34 = [v35 constraintEqualToConstant:24.0];
  v48[4] = v34;
  v33 = [(UIButton *)self->_closeButton heightAnchor];
  v32 = [(UIButton *)self->_closeButton widthAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v48[5] = v31;
  v30 = [(UIButton *)self->_closeButton leadingAnchor];
  v29 = [(UIView *)self->_closeButtonBlurView leadingAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v48[6] = v28;
  v27 = [(UIButton *)self->_closeButton trailingAnchor];
  objc_super v26 = [(UIView *)self->_closeButtonBlurView trailingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v48[7] = v25;
  v23 = [(UIButton *)self->_closeButton topAnchor];
  id v22 = [(UIView *)self->_closeButtonBlurView topAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v48[8] = v21;
  uint64_t v20 = [(UIButton *)self->_closeButton bottomAnchor];
  v19 = [(UIView *)self->_closeButtonBlurView bottomAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v48[9] = v18;
  v17 = [(UIView *)self->_closeButtonBlurView topAnchor];
  v16 = [(UIImageView *)self->_contentImageView topAnchor];
  v15 = [v17 constraintEqualToAnchor:v16 constant:4.0];
  v48[10] = v15;
  v5 = [(UIView *)self->_closeButtonBlurView trailingAnchor];
  v6 = [(UIImageView *)self->_contentImageView trailingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6 constant:-4.0];
  v48[11] = v7;
  v8 = [(UIActivityIndicatorView *)self->_spinner centerXAnchor];
  v24 = v4;
  v9 = [v4 centerXAnchor];
  uint64_t v10 = [v8 constraintEqualToAnchor:v9];
  v48[12] = v10;
  v11 = [(UIActivityIndicatorView *)self->_spinner centerYAnchor];
  v12 = [v4 centerYAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];
  v48[13] = v13;
  v14 = +[NSArray arrayWithObjects:v48 count:14];
  +[NSLayoutConstraint activateConstraints:v14];
}

- (void)_handleHover:(id)a3
{
  id v4 = [a3 _maps_isHovering];

  [(UGCPhotoCollectionViewCell *)self setHoverActive:v4];
}

- (void)setHoverActive:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_1000BBB44(self) == 5)
  {
    if (self->_hoverActive != v3)
    {
      self->_hoverActive = v3;
      closeButtonBlurView = self->_closeButtonBlurView;
      [(UIView *)closeButtonBlurView setHidden:!v3];
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: MapsIdiomIsMac(self)", v6, 2u);
  }
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return [(UIImageView *)self->_contentImageView image];
}

- (id)imageView
{
  return self->_contentImageView;
}

- (void)_cancelButtonPressed
{
  id v3 = [(UGCPhotoCollectionViewCell *)self delegate];
  [v3 photoCellDidCancel:self];
}

+ (id)reuseIdentifier
{
  return @"PhotosCollectionViewCell";
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)UGCPhotoCollectionViewCell;
  [(UGCPhotoCollectionViewCell *)&v3 prepareForReuse];
  [(UGCPhotoCollectionViewCell *)self setIdentifier:0];
  [(UGCPhotoCollectionViewCell *)self setImage:0];
  [(UGCPhotoCollectionViewCell *)self endAnimatingActivityIndicatorWithError:0];
}

- (void)beginAnimatingActivityIndicator
{
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UGCPhotoCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCPhotoCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void)setContentImageView:(id)a3
{
}

- (BOOL)hoverActive
{
  return self->_hoverActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_closeButtonBlurView, 0);

  objc_storeStrong((id *)&self->_closeButton, 0);
}

@end