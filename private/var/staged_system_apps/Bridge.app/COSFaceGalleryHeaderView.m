@interface COSFaceGalleryHeaderView
- (COSFaceGalleryHeaderView)initWithReuseIdentifier:(id)a3;
- (UIView)galleryView;
- (void)prepareForReuse;
- (void)setGalleryView:(id)a3;
@end

@implementation COSFaceGalleryHeaderView

- (COSFaceGalleryHeaderView)initWithReuseIdentifier:(id)a3
{
  v21.receiver = self;
  v21.super_class = (Class)COSFaceGalleryHeaderView;
  v3 = [(COSFaceGalleryHeaderView *)&v21 initWithReuseIdentifier:a3];
  if (v3)
  {
    v4 = objc_opt_new();
    v5 = +[UIColor separatorColor];
    [v4 setBackgroundColor:v5];

    [(COSFaceGalleryHeaderView *)v3 addSubview:v4];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = [(COSFaceGalleryHeaderView *)v3 topAnchor];
    v19 = [v4 topAnchor];
    v18 = [v20 constraintEqualToAnchor:v19 constant:0.0];
    v22[0] = v18;
    v17 = [(COSFaceGalleryHeaderView *)v3 leadingAnchor];
    v16 = [v4 leadingAnchor];
    v6 = [v17 constraintEqualToAnchor:v16 constant:-18.0];
    v22[1] = v6;
    v7 = [(COSFaceGalleryHeaderView *)v3 trailingAnchor];
    v8 = [v4 trailingAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 constant:18.0];
    v22[2] = v9;
    v10 = [v4 heightAnchor];
    v11 = +[UIScreen mainScreen];
    [v11 scale];
    v13 = [v10 constraintEqualToConstant:1.0 / v12];
    v22[3] = v13;
    v14 = +[NSArray arrayWithObjects:v22 count:4];
    +[NSLayoutConstraint activateConstraints:v14];
  }
  return v3;
}

- (void)setGalleryView:(id)a3
{
  id v5 = a3;
  p_galleryView = &self->_galleryView;
  galleryView = self->_galleryView;
  if (galleryView) {
    [(UIView *)galleryView removeFromSuperview];
  }
  objc_storeStrong((id *)&self->_galleryView, a3);
  if (*p_galleryView)
  {
    -[COSFaceGalleryHeaderView addSubview:](self, "addSubview:");
    [(UIView *)*p_galleryView setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = [(COSFaceGalleryHeaderView *)self topAnchor];
    v19 = [(UIView *)*p_galleryView topAnchor];
    v18 = [v20 constraintEqualToAnchor:v19 constant:-16.0];
    v21[0] = v18;
    v17 = [(COSFaceGalleryHeaderView *)self bottomAnchor];
    v8 = [(UIView *)*p_galleryView bottomAnchor];
    v9 = [v17 constraintEqualToAnchor:v8 constant:16.0];
    v21[1] = v9;
    v10 = [(COSFaceGalleryHeaderView *)self leadingAnchor];
    v11 = [(UIView *)*p_galleryView leadingAnchor];
    double v12 = [v10 constraintEqualToAnchor:v11 constant:0.0];
    v21[2] = v12;
    v13 = [(COSFaceGalleryHeaderView *)self trailingAnchor];
    v14 = [(UIView *)*p_galleryView trailingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:0.0];
    v21[3] = v15;
    v16 = +[NSArray arrayWithObjects:v21 count:4];
    +[NSLayoutConstraint activateConstraints:v16];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)COSFaceGalleryHeaderView;
  [(COSFaceGalleryHeaderView *)&v3 prepareForReuse];
  [(COSFaceGalleryHeaderView *)self setGalleryView:0];
}

- (UIView)galleryView
{
  return self->_galleryView;
}

- (void).cxx_destruct
{
}

@end