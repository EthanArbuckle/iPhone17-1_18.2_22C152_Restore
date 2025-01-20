@interface AttachmentPreviewCollectionViewCell
- (AttachmentPreviewCollectionViewCell)initWithFrame:(CGRect)a3;
- (MFAttachment)attachment;
- (MFAvatarView)avatarView;
- (UIImageView)imageView;
- (UILabel)dateLabel;
- (UILabel)nameLabel;
- (void)prepareForReuse;
- (void)setAttachment:(id)a3;
- (void)setAvatarView:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setImage:(id)a3 withAspectRatio:(double)a4;
- (void)setImageView:(id)a3;
- (void)setNameLabel:(id)a3;
@end

@implementation AttachmentPreviewCollectionViewCell

- (AttachmentPreviewCollectionViewCell)initWithFrame:(CGRect)a3
{
  v72.receiver = self;
  v72.super_class = (Class)AttachmentPreviewCollectionViewCell;
  v3 = -[AttachmentPreviewCollectionViewCell initWithFrame:](&v72, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor tableCellGroupedBackgroundColor];
    v5 = [(AttachmentPreviewCollectionViewCell *)v3 contentView];
    [v5 setBackgroundColor:v4];

    id v6 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = v10;

    v12 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [(UILabel *)v3->_nameLabel setFont:v12];

    [(UILabel *)v3->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_nameLabel setNumberOfLines:2];
    [(UILabel *)v3->_nameLabel setTextAlignment:1];
    [(UILabel *)v3->_nameLabel setLineBreakMode:5];
    [(UILabel *)v3->_nameLabel setLineBreakStrategy:0];
    v13 = [(AttachmentPreviewCollectionViewCell *)v3 contentView];
    [v13 addSubview:v3->_nameLabel];

    v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = v14;

    v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
    [(UILabel *)v3->_dateLabel setFont:v16];

    v17 = +[UIColor systemGrayColor];
    [(UILabel *)v3->_dateLabel setTextColor:v17];

    [(UILabel *)v3->_dateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_dateLabel setNumberOfLines:2];
    [(UILabel *)v3->_dateLabel setTextAlignment:1];
    [(UILabel *)v3->_dateLabel setLineBreakMode:5];
    [(UILabel *)v3->_dateLabel setLineBreakStrategy:0];
    v18 = [(AttachmentPreviewCollectionViewCell *)v3 contentView];
    [v18 addSubview:v3->_dateLabel];

    v19 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectMake(0, 0, width, height)];
    imageView = v3->_imageView;
    v3->_imageView = v19;

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_imageView setContentMode:1];
    v21 = [(UIImageView *)v3->_imageView layer];
    [v21 setCornerRadius:5.0];

    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    v22 = [(AttachmentPreviewCollectionViewCell *)v3 contentView];
    [v22 addSubview:v3->_imageView];

    v23 = -[MFAvatarView initWithFrame:]([MFAvatarView alloc], "initWithFrame:", 0.0, 0.0, 25.0, 25.0);
    avatarView = v3->_avatarView;
    v3->_avatarView = v23;

    [(MFAvatarView *)v3->_avatarView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v25 = +[UIColor whiteColor];
    id v26 = [v25 CGColor];
    v27 = [(MFAvatarView *)v3->_avatarView layer];
    [v27 setBorderColor:v26];

    v28 = [(MFAvatarView *)v3->_avatarView layer];
    [v28 setCornerRadius:12.5];

    v29 = [(MFAvatarView *)v3->_avatarView layer];
    [v29 setBorderWidth:1.0];

    [(MFAvatarView *)v3->_avatarView setClipsToBounds:1];
    v30 = [(MFAvatarView *)v3->_avatarView layer];
    [v30 setMasksToBounds:1];

    v31 = [(AttachmentPreviewCollectionViewCell *)v3 contentView];
    [v31 addSubview:v3->_avatarView];

    v32 = [(AttachmentPreviewCollectionViewCell *)v3 contentView];
    [v32 bringSubviewToFront:v3->_avatarView];

    v71 = [(UILabel *)v3->_dateLabel bottomAnchor];
    v61 = [(AttachmentPreviewCollectionViewCell *)v3 bottomAnchor];
    v60 = [v71 constraintEqualToAnchor:-4.0];
    v73[0] = v60;
    v70 = [(UILabel *)v3->_dateLabel centerXAnchor];
    v59 = [(AttachmentPreviewCollectionViewCell *)v3 centerXAnchor];
    v58 = [v70 constraintEqualToAnchor:];
    v73[1] = v58;
    v69 = [(UILabel *)v3->_dateLabel widthAnchor];
    v57 = [(AttachmentPreviewCollectionViewCell *)v3 widthAnchor];
    v56 = [v69 constraintEqualToAnchor:-5.0];
    v73[2] = v56;
    v68 = [(UILabel *)v3->_nameLabel bottomAnchor];
    v55 = [(UILabel *)v3->_dateLabel topAnchor];
    v54 = [v68 constraintEqualToAnchor:];
    v73[3] = v54;
    v67 = [(UILabel *)v3->_nameLabel centerXAnchor];
    v53 = [(AttachmentPreviewCollectionViewCell *)v3 centerXAnchor];
    v52 = [v67 constraintEqualToAnchor:];
    v73[4] = v52;
    v66 = [(UILabel *)v3->_nameLabel widthAnchor];
    v51 = [(AttachmentPreviewCollectionViewCell *)v3 widthAnchor];
    v50 = [v66 constraintEqualToAnchor:-5.0];
    v73[5] = v50;
    v65 = [(UIImageView *)v3->_imageView topAnchor];
    v49 = [(AttachmentPreviewCollectionViewCell *)v3 topAnchor];
    v48 = [v65 constraintEqualToAnchor:4.0];
    v73[6] = v48;
    v64 = [(UIImageView *)v3->_imageView bottomAnchor];
    v47 = [(UILabel *)v3->_nameLabel topAnchor];
    v46 = [v64 constraintEqualToAnchor:-4.0];
    v73[7] = v46;
    v63 = [(UIImageView *)v3->_imageView centerXAnchor];
    v45 = [(AttachmentPreviewCollectionViewCell *)v3 centerXAnchor];
    v44 = [v63 constraintEqualToAnchor:];
    v73[8] = v44;
    v62 = [(MFAvatarView *)v3->_avatarView trailingAnchor];
    v43 = [(UIImageView *)v3->_imageView trailingAnchor];
    v42 = [v62 constraintEqualToAnchor:-10.0];
    v73[9] = v42;
    v33 = [(MFAvatarView *)v3->_avatarView topAnchor];
    v34 = [(UIImageView *)v3->_imageView topAnchor];
    v35 = [v33 constraintEqualToAnchor:v34 constant:10.0];
    v73[10] = v35;
    v36 = [(MFAvatarView *)v3->_avatarView widthAnchor];
    v37 = [v36 constraintEqualToConstant:25.0];
    v73[11] = v37;
    v38 = [(MFAvatarView *)v3->_avatarView heightAnchor];
    v39 = [v38 constraintEqualToConstant:25.0];
    v73[12] = v39;
    v40 = +[NSArray arrayWithObjects:v73 count:13];
    +[NSLayoutConstraint activateConstraints:v40];
  }
  return v3;
}

- (void)prepareForReuse
{
  v3 = [(AttachmentPreviewCollectionViewCell *)self nameLabel];
  [v3 setText:0];

  v4 = [(AttachmentPreviewCollectionViewCell *)self dateLabel];
  [v4 setText:0];

  v5 = [(AttachmentPreviewCollectionViewCell *)self imageView];
  [v5 setImage:0];

  v6.receiver = self;
  v6.super_class = (Class)AttachmentPreviewCollectionViewCell;
  [(AttachmentPreviewCollectionViewCell *)&v6 prepareForReuse];
}

- (void)setImage:(id)a3 withAspectRatio:(double)a4
{
  id v14 = a3;
  objc_super v6 = [(AttachmentPreviewCollectionViewCell *)self imageView];
  [v6 setImage:v14];

  v7 = [(AttachmentPreviewCollectionViewCell *)self imageView];
  v8 = [v7 constraints];
  +[NSLayoutConstraint deactivateConstraints:v8];

  v9 = [(AttachmentPreviewCollectionViewCell *)self imageView];
  v10 = [v9 widthAnchor];
  v11 = [(AttachmentPreviewCollectionViewCell *)self imageView];
  v12 = [v11 heightAnchor];
  v13 = [v10 constraintEqualToAnchor:v12 multiplier:a4];
  [v13 setActive:1];
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
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
  objc_storeStrong((id *)&self->_dateLabel, 0);

  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end