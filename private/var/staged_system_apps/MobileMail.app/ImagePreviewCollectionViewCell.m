@interface ImagePreviewCollectionViewCell
- (ImagePreviewCollectionViewCell)initWithFrame:(CGRect)a3;
- (MFAttachment)attachment;
- (MFAvatarView)avatarView;
- (UIImageView)imageView;
- (void)setAttachment:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation ImagePreviewCollectionViewCell

- (ImagePreviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  v43.receiver = self;
  v43.super_class = (Class)ImagePreviewCollectionViewCell;
  v3 = -[ImagePreviewCollectionViewCell initWithFrame:](&v43, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor tableCellGroupedBackgroundColor];
    v5 = [(ImagePreviewCollectionViewCell *)v3 contentView];
    [v5 setBackgroundColor:v4];

    v6 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    imageView = v3->_imageView;
    v3->_imageView = v6;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_imageView setContentMode:2];
    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    v8 = [(ImagePreviewCollectionViewCell *)v3 contentView];
    [v8 addSubview:v3->_imageView];

    v9 = -[MFAvatarView initWithFrame:]([MFAvatarView alloc], "initWithFrame:", 0.0, 0.0, 25.0, 25.0);
    avatarView = v3->_avatarView;
    v3->_avatarView = v9;

    [(MFAvatarView *)v3->_avatarView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v11 = +[UIColor whiteColor];
    id v12 = [v11 CGColor];
    v13 = [(MFAvatarView *)v3->_avatarView layer];
    [v13 setBorderColor:v12];

    v14 = [(MFAvatarView *)v3->_avatarView layer];
    [v14 setCornerRadius:12.5];

    v15 = [(MFAvatarView *)v3->_avatarView layer];
    [v15 setBorderWidth:1.0];

    [(MFAvatarView *)v3->_avatarView setClipsToBounds:1];
    v16 = [(MFAvatarView *)v3->_avatarView layer];
    [v16 setMasksToBounds:1];

    v17 = [(ImagePreviewCollectionViewCell *)v3 contentView];
    [v17 addSubview:v3->_avatarView];

    v18 = [(ImagePreviewCollectionViewCell *)v3 contentView];
    [v18 bringSubviewToFront:v3->_avatarView];

    v42 = [(UIImageView *)v3->_imageView leadingAnchor];
    v37 = [(ImagePreviewCollectionViewCell *)v3 leadingAnchor];
    v36 = [v42 constraintEqualToAnchor:];
    v44[0] = v36;
    v41 = [(UIImageView *)v3->_imageView topAnchor];
    v35 = [(ImagePreviewCollectionViewCell *)v3 topAnchor];
    v34 = [v41 constraintEqualToAnchor:];
    v44[1] = v34;
    v40 = [(UIImageView *)v3->_imageView bottomAnchor];
    v33 = [(ImagePreviewCollectionViewCell *)v3 bottomAnchor];
    v32 = [v40 constraintEqualToAnchor:];
    v44[2] = v32;
    v39 = [(UIImageView *)v3->_imageView trailingAnchor];
    v31 = [(ImagePreviewCollectionViewCell *)v3 trailingAnchor];
    v30 = [v39 constraintEqualToAnchor:];
    v44[3] = v30;
    v38 = [(MFAvatarView *)v3->_avatarView trailingAnchor];
    v29 = [(UIImageView *)v3->_imageView trailingAnchor];
    v28 = [v38 constraintEqualToAnchor:-10.0];
    v44[4] = v28;
    v19 = [(MFAvatarView *)v3->_avatarView topAnchor];
    v20 = [(UIImageView *)v3->_imageView topAnchor];
    v21 = [v19 constraintEqualToAnchor:v20 constant:10.0];
    v44[5] = v21;
    v22 = [(MFAvatarView *)v3->_avatarView widthAnchor];
    v23 = [v22 constraintEqualToConstant:25.0];
    v44[6] = v23;
    v24 = [(MFAvatarView *)v3->_avatarView heightAnchor];
    v25 = [v24 constraintEqualToConstant:25.0];
    v44[7] = v25;
    v26 = +[NSArray arrayWithObjects:v44 count:8];
    +[NSLayoutConstraint activateConstraints:v26];
  }
  return v3;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (MFAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (MFAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_attachment, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end