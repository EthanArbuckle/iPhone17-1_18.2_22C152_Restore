@interface SUUIMediaCollectionViewCell
- (SUUIEmbeddedMediaView)mediaView;
- (UIEdgeInsets)contentInset;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
@end

@implementation SUUIMediaCollectionViewCell

- (SUUIEmbeddedMediaView)mediaView
{
  mediaView = self->_mediaView;
  if (!mediaView)
  {
    v4 = [(SUUIMediaCollectionViewCell *)self contentView];
    v5 = [SUUIEmbeddedMediaView alloc];
    [v4 bounds];
    v10 = -[SUUIEmbeddedMediaView initWithFrame:](v5, "initWithFrame:", v6 + self->_contentInset.left, v7 + self->_contentInset.top, v8 - (self->_contentInset.left + self->_contentInset.right), v9 - (self->_contentInset.top + self->_contentInset.bottom));
    v11 = self->_mediaView;
    self->_mediaView = v10;

    v12 = self->_mediaView;
    v13 = [(SUUIMediaCollectionViewCell *)self backgroundColor];
    [(SUUIEmbeddedMediaView *)v12 setBackgroundColor:v13];

    [v4 addSubview:self->_mediaView];
    mediaView = self->_mediaView;
  }
  return mediaView;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    [(SUUIMediaCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)SUUIMediaCollectionViewCell;
  [(SUUICollectionViewCell *)&v9 layoutSubviews];
  mediaView = self->_mediaView;
  v4 = [(SUUIMediaCollectionViewCell *)self contentView];
  [v4 bounds];
  -[SUUIEmbeddedMediaView setFrame:](mediaView, "setFrame:", v5 + self->_contentInset.left, v6 + self->_contentInset.top, v7 - (self->_contentInset.left + self->_contentInset.right), v8 - (self->_contentInset.top + self->_contentInset.bottom));
}

- (void)setBackgroundColor:(id)a3
{
  mediaView = self->_mediaView;
  id v5 = a3;
  [(SUUIEmbeddedMediaView *)mediaView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUIMediaCollectionViewCell;
  [(SUUICollectionViewCell *)&v6 setBackgroundColor:v5];
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

@end