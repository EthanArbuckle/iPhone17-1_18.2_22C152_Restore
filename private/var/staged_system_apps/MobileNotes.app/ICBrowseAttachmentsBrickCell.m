@interface ICBrowseAttachmentsBrickCell
- (ICAttachmentBrickView)attachmentBrickView;
- (ICBrowseAttachmentsBrickCell)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)prepareForReuse;
- (void)setAttachment:(id)a3;
- (void)setAttachmentBrickView:(id)a3;
@end

@implementation ICBrowseAttachmentsBrickCell

- (ICBrowseAttachmentsBrickCell)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)ICBrowseAttachmentsBrickCell;
  v3 = -[ICBrowseAttachmentsBrickCell initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [objc_alloc((Class)ICAttachmentBrickView) initWithType:4];
    [(ICBrowseAttachmentsBrickCell *)v3 setAttachmentBrickView:v4];

    v5 = [(ICBrowseAttachmentsBrickCell *)v3 attachmentBrickView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(ICBrowseAttachmentsBrickCell *)v3 contentView];
    [v6 addSubview:v5];

    v7 = [(ICBrowseAttachmentsBrickCell *)v3 contentView];
    CFStringRef v17 = @"brick";
    v18 = v5;
    v8 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v9 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|-0-[brick]-0-|", 0, 0, v8);
    [v7 addConstraints:v9];

    v10 = [(ICBrowseAttachmentsBrickCell *)v3 contentView];
    CFStringRef v15 = @"brick";
    v16 = v5;
    v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v12 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-0-[brick]-0-|", 0, 0, v11);
    [v10 addConstraints:v12];
  }
  return v3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)ICBrowseAttachmentsBrickCell;
  [(ICBrowseAttachmentsBaseCell *)&v4 prepareForReuse];
  [(ICBrowseAttachmentsBrickCell *)self setAttachment:0];
  v3 = [(ICBrowseAttachmentsBrickCell *)self attachmentBrickView];
  [v3 prepareForReuse];
}

- (void)setAttachment:(id)a3
{
  id v4 = a3;
  id v5 = [(ICBrowseAttachmentsBaseCell *)self attachment];

  if (v5 != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)ICBrowseAttachmentsBrickCell;
    [(ICBrowseAttachmentsBaseCell *)&v7 setAttachment:v4];
    v6 = [(ICBrowseAttachmentsBrickCell *)self attachmentBrickView];
    [v6 setAttachment:v4];
  }
}

- (ICAttachmentBrickView)attachmentBrickView
{
  return self->_attachmentBrickView;
}

- (void)setAttachmentBrickView:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)accessibilityLabel
{
  v2 = [(ICBrowseAttachmentsBrickCell *)self attachmentBrickView];
  v3 = [v2 accessibilityLabel];

  return v3;
}

- (id)accessibilityValue
{
  v2 = [(ICBrowseAttachmentsBrickCell *)self attachmentBrickView];
  v3 = [v2 accessibilityValue];

  return v3;
}

@end