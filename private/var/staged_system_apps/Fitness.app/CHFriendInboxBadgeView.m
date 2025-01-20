@interface CHFriendInboxBadgeView
- (CHFriendInboxBadgeView)initWithFrame:(CGRect)a3;
- (NSString)badgeText;
- (void)layoutSubviews;
- (void)setBadgeText:(id)a3;
- (void)setTintColor:(id)a3;
- (void)sizeToFit;
@end

@implementation CHFriendInboxBadgeView

- (CHFriendInboxBadgeView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CHFriendInboxBadgeView;
  v3 = -[CHFriendInboxBadgeView initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIImage imageNamed:@"ContactsBadgeBackground"];
    v5 = [v4 imageWithRenderingMode:2];

    [v5 size];
    v7 = [v5 resizableImageWithCapInsets:0.0, v6 * 0.5 + -0.5, 0.0, v6 * 0.5 + -0.5];
    v8 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v7];
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = v8;

    [(CHFriendInboxBadgeView *)v3 addSubview:v3->_backgroundImageView];
    v10 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    badgeTextLabel = v3->_badgeTextLabel;
    v3->_badgeTextLabel = v10;

    [(UILabel *)v3->_badgeTextLabel setTextAlignment:1];
    v12 = +[UIFont systemFontOfSize:13.0];
    [(UILabel *)v3->_badgeTextLabel setFont:v12];

    v13 = +[UIColor blackColor];
    [(UILabel *)v3->_badgeTextLabel setTextColor:v13];

    [(CHFriendInboxBadgeView *)v3 addSubview:v3->_badgeTextLabel];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(CHFriendInboxBadgeView *)self bounds];
  -[UIImageView setFrame:](self->_backgroundImageView, "setFrame:");
  [(CHFriendInboxBadgeView *)self bounds];
  -[UILabel setFrame:](self->_badgeTextLabel, "setFrame:");
  [(CHFriendInboxBadgeView *)self bounds];
  double MidX = CGRectGetMidX(v7);
  [(CHFriendInboxBadgeView *)self bounds];
  double MidY = CGRectGetMidY(v8);
  badgeTextLabel = self->_badgeTextLabel;

  -[UILabel setCenter:](badgeTextLabel, "setCenter:", MidX, MidY);
}

- (void)sizeToFit
{
  [(UILabel *)self->_badgeTextLabel sizeToFit];
  v3 = [(UIImageView *)self->_backgroundImageView image];
  [v3 size];
  double v5 = v4;

  [(UILabel *)self->_badgeTextLabel bounds];
  float v6 = CGRectGetWidth(v10) + 4.0;
  float v7 = v5;
  double v8 = fmaxf(v6, v7);

  -[CHFriendInboxBadgeView setBounds:](self, "setBounds:", 0.0, 0.0, v8, v5);
}

- (void)setTintColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHFriendInboxBadgeView;
  id v4 = a3;
  [(CHFriendInboxBadgeView *)&v5 setTintColor:v4];
  -[UIImageView setTintColor:](self->_backgroundImageView, "setTintColor:", v4, v5.receiver, v5.super_class);
}

- (void)setBadgeText:(id)a3
{
  [(UILabel *)self->_badgeTextLabel setText:a3];

  [(CHFriendInboxBadgeView *)self setNeedsLayout];
}

- (NSString)badgeText
{
  return [(UILabel *)self->_badgeTextLabel text];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeTextLabel, 0);

  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end