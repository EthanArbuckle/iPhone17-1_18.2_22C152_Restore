@interface LinkPreviewCollectionViewCell
- (LPLinkView)linkView;
- (MFAvatarView)avatarView;
- (void)_linkViewMetadataDidBecomeComplete:(id)a3;
- (void)linkViewNeedsResize:(id)a3;
- (void)prepareForReuse;
- (void)setAvatarView:(id)a3;
- (void)setLinkView:(id)a3;
@end

@implementation LinkPreviewCollectionViewCell

- (void)setLinkView:(id)a3
{
  v5 = (LPLinkView *)a3;
  p_linkView = &self->_linkView;
  if (self->_linkView != v5)
  {
    objc_storeStrong((id *)&self->_linkView, a3);
    if (v5)
    {
      [(LPLinkView *)*p_linkView setDelegate:self];
      [(LPLinkView *)*p_linkView _setDisableTapGesture:1];
      [(LPLinkView *)*p_linkView _setApplyCornerRadius:1];
      v7 = *p_linkView;
      [(LinkPreviewCollectionViewCell *)self bounds];
      -[LPLinkView setFrame:](v7, "setFrame:");
      [(LinkPreviewCollectionViewCell *)self addSubview:*p_linkView];
      v8 = -[MFAvatarView initWithFrame:]([MFAvatarView alloc], "initWithFrame:", 0.0, 0.0, 25.0, 25.0);
      avatarView = self->_avatarView;
      self->_avatarView = v8;

      [(MFAvatarView *)self->_avatarView setTranslatesAutoresizingMaskIntoConstraints:0];
      id v10 = +[UIColor whiteColor];
      id v11 = [v10 CGColor];
      v12 = [(MFAvatarView *)self->_avatarView layer];
      [v12 setBorderColor:v11];

      v13 = [(MFAvatarView *)self->_avatarView layer];
      [v13 setCornerRadius:12.5];

      v14 = [(MFAvatarView *)self->_avatarView layer];
      [v14 setBorderWidth:1.0];

      [(MFAvatarView *)self->_avatarView setClipsToBounds:1];
      v15 = [(MFAvatarView *)self->_avatarView layer];
      [v15 setMasksToBounds:1];

      [(LinkPreviewCollectionViewCell *)self addSubview:self->_avatarView];
      [(LinkPreviewCollectionViewCell *)self bringSubviewToFront:self->_avatarView];
      v27 = [(MFAvatarView *)self->_avatarView trailingAnchor];
      v25 = [(LPLinkView *)*p_linkView trailingAnchor];
      v24 = [v27 constraintEqualToAnchor:-10.0];
      v28[0] = v24;
      v26 = [(MFAvatarView *)self->_avatarView topAnchor];
      v16 = [(LPLinkView *)*p_linkView topAnchor];
      v17 = [v26 constraintEqualToAnchor:v16 constant:10.0];
      v28[1] = v17;
      v18 = [(MFAvatarView *)self->_avatarView widthAnchor];
      v19 = [v18 constraintEqualToConstant:25.0];
      v28[2] = v19;
      v20 = [(MFAvatarView *)self->_avatarView heightAnchor];
      v21 = [v20 constraintEqualToConstant:25.0];
      v28[3] = v21;
      v22 = +[NSArray arrayWithObjects:v28 count:4];
      +[NSLayoutConstraint activateConstraints:v22];
    }
    else
    {
      v23 = [(LinkPreviewCollectionViewCell *)self linkView];
      [v23 removeFromSuperview];
    }
  }
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)LinkPreviewCollectionViewCell;
  [(LinkPreviewCollectionViewCell *)&v6 prepareForReuse];
  v3 = [(LinkPreviewCollectionViewCell *)self linkView];

  if (v3)
  {
    v4 = [(LinkPreviewCollectionViewCell *)self linkView];
    [v4 removeFromSuperview];

    v5 = [(LinkPreviewCollectionViewCell *)self avatarView];
    [v5 removeFromSuperview];
  }
}

- (void)linkViewNeedsResize:(id)a3
{
  id v6 = a3;
  id v4 = [(LinkPreviewCollectionViewCell *)self linkView];

  if (v4 == v6)
  {
    v5 = [(LinkPreviewCollectionViewCell *)self linkView];
    [v5 setNeedsLayout];
  }
}

- (void)_linkViewMetadataDidBecomeComplete:(id)a3
{
  id v6 = a3;
  id v4 = [(LinkPreviewCollectionViewCell *)self linkView];

  if (v4 == v6)
  {
    v5 = [(LinkPreviewCollectionViewCell *)self linkView];
    [v5 setNeedsLayout];
  }
}

- (LPLinkView)linkView
{
  return self->_linkView;
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

  objc_storeStrong((id *)&self->_linkView, 0);
}

@end