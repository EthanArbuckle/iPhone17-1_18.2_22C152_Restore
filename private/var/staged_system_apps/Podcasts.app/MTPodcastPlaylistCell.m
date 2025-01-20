@interface MTPodcastPlaylistCell
+ (CGSize)artworkSizeForViewWidth:(double)a3;
- (BOOL)isAdded;
- (MTPodcastPlaylistCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)countView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAdded:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation MTPodcastPlaylistCell

- (MTPodcastPlaylistCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTPodcastPlaylistCell;
  v4 = [(MTPodcastCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(MTPodcastPlaylistCell *)v4 setClipsToBounds:1];
  }
  return v5;
}

- (id)countView
{
  return 0;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)MTPodcastPlaylistCell;
  [(MTGenericCell *)&v7 layoutSubviews];
  if (self->_disabledView)
  {
    -[MTPodcastPlaylistCell bringSubviewToFront:](self, "bringSubviewToFront:");
    disabledView = self->_disabledView;
    [(MTPodcastPlaylistCell *)self bounds];
    -[UIView setFrame:](disabledView, "setFrame:");
    v4 = self->_disabledView;
    v5 = +[UIColor systemBackgroundColor];
    v6 = [v5 colorWithAlphaComponent:0.5];
    [(UIView *)v4 setBackgroundColor:v6];
  }
}

+ (CGSize)artworkSizeForViewWidth:(double)a3
{
  double v3 = 44.0;
  double v4 = 44.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setAdded:(BOOL)a3
{
  self->_added = a3;
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  [(MTPodcastPlaylistCell *)self setAccessoryType:v3];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MTPodcastPlaylistCell;
  [(MTGenericCell *)&v3 prepareForReuse];
  [(MTPodcastPlaylistCell *)self setAdded:0];
  [(MTPodcastPlaylistCell *)self setEnabled:1];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  disabledView = self->_disabledView;
  if (a3)
  {
    if (disabledView)
    {
      [(UIView *)disabledView removeFromSuperview];
      v6 = self->_disabledView;
      self->_disabledView = 0;
    }
  }
  else if (!disabledView)
  {
    objc_super v7 = (UIView *)[objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v8 = self->_disabledView;
    self->_disabledView = v7;

    [(MTPodcastPlaylistCell *)self addSubview:self->_disabledView];
    [(MTPodcastPlaylistCell *)self setNeedsLayout];
  }

  [(MTPodcastPlaylistCell *)self setUserInteractionEnabled:v3];
}

- (BOOL)isAdded
{
  return self->_added;
}

- (void).cxx_destruct
{
}

@end