@interface MusicPageHeaderPlayButton
- (BOOL)isHighlighted;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MusicPageHeaderPlayButton)initWithCoder:(id)a3;
- (MusicPageHeaderPlayButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation MusicPageHeaderPlayButton

- (MusicPageHeaderPlayButton)initWithFrame:(CGRect)a3
{
  return (MusicPageHeaderPlayButton *)sub_4B6C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MusicPageHeaderPlayButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_4C1A4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_4B964();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_4BA74();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PageHeaderPlayButton();
  return [(MusicPageHeaderPlayButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  double v4 = self;
  sub_4BD88(a3);
}

- (void).cxx_destruct
{
  objc_super v3 = *(void **)&self->MPButton_opaque[OBJC_IVAR___MusicPageHeaderPlayButton_overlayColor];
}

@end