@interface CHFriendInboxBarButtonView
- (BOOL)_touchesInside:(id)a3;
- (CHFriendInboxBarButtonView)init;
- (CHFriendInboxBarButtonViewDelegate)delegate;
- (NSString)badgeText;
- (void)_animateToTappedState:(BOOL)a3;
- (void)layoutSubviews;
- (void)setBadgeText:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTintColor:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CHFriendInboxBarButtonView

- (CHFriendInboxBarButtonView)init
{
  v9.receiver = self;
  v9.super_class = (Class)CHFriendInboxBarButtonView;
  v2 = -[CHFriendInboxBarButtonView initWithFrame:](&v9, "initWithFrame:", 0.0, 0.0, 39.0, 27.0);
  if (v2)
  {
    v3 = +[UIImage systemImageNamed:@"person.2.badge.gearshape.fill"];
    v4 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v3];
    contactsImageView = v2->_contactsImageView;
    v2->_contactsImageView = v4;

    -[UIImageView setBounds:](v2->_contactsImageView, "setBounds:", 0.0, 0.0, 39.0, 27.0);
    [(CHFriendInboxBarButtonView *)v2 addSubview:v2->_contactsImageView];
    v6 = -[CHFriendInboxBadgeView initWithFrame:]([CHFriendInboxBadgeView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    badgeView = v2->_badgeView;
    v2->_badgeView = v6;

    [(CHFriendInboxBadgeView *)v2->_badgeView setHidden:1];
    [(CHFriendInboxBarButtonView *)v2 addSubview:v2->_badgeView];
    [(CHFriendInboxBarButtonView *)v2 setUserInteractionEnabled:1];
  }
  return v2;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CHFriendInboxBarButtonView;
  [(CHFriendInboxBarButtonView *)&v5 layoutSubviews];
  [(CHFriendInboxBarButtonView *)self bounds];
  double MidX = CGRectGetMidX(v6);
  [(CHFriendInboxBarButtonView *)self bounds];
  -[UIImageView setCenter:](self->_contactsImageView, "setCenter:", MidX, CGRectGetMidY(v7));
  [(CHFriendInboxBadgeView *)self->_badgeView sizeToFit];
  [(UIImageView *)self->_contactsImageView frame];
  CGFloat v4 = CGRectGetMaxX(v8) + -1.0;
  [(CHFriendInboxBadgeView *)self->_badgeView bounds];
  -[CHFriendInboxBadgeView setCenter:](self->_badgeView, "setCenter:", v4, CGRectGetMidX(v9) + -5.0);
}

- (void)setTintColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CHFriendInboxBarButtonView;
  id v4 = a3;
  [(CHFriendInboxBarButtonView *)&v5 setTintColor:v4];
  -[CHFriendInboxBadgeView setTintColor:](self->_badgeView, "setTintColor:", v4, v5.receiver, v5.super_class);
  [(UIImageView *)self->_contactsImageView setTintColor:v4];
}

- (void)setBadgeText:(id)a3
{
  id v5 = a3;
  [(CHFriendInboxBadgeView *)self->_badgeView setBadgeText:v5];
  if (v5) {
    BOOL v4 = [v5 length] == 0;
  }
  else {
    BOOL v4 = 1;
  }
  [(CHFriendInboxBadgeView *)self->_badgeView setHidden:v4];
  [(CHFriendInboxBarButtonView *)self setNeedsLayout];
}

- (void)_animateToTappedState:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000F822C;
  v3[3] = &unk_1008ABAA0;
  v3[4] = self;
  BOOL v4 = a3;
  +[UIView animateWithDuration:v3 animations:0.2];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (BOOL)_touchesInside:(id)a3
{
  BOOL v4 = [a3 anyObject];
  [v4 locationInView:self];
  uint64_t v6 = v5;
  uint64_t v8 = v7;

  [(CHFriendInboxBarButtonView *)self bounds];
  uint64_t v13 = v6;
  uint64_t v14 = v8;

  return CGRectContainsPoint(*(CGRect *)&v9, *(CGPoint *)&v13);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(CHFriendInboxBarButtonView *)self _animateToTappedState:0];
  unsigned int v6 = [(CHFriendInboxBarButtonView *)self _touchesInside:v5];

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained didTapInboxBarButtonView:self];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  BOOL v5 = -[CHFriendInboxBarButtonView _touchesInside:](self, "_touchesInside:", a3, a4);

  [(CHFriendInboxBarButtonView *)self _animateToTappedState:v5];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (CHFriendInboxBarButtonViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CHFriendInboxBarButtonViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)badgeText
{
  return self->_badgeText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeText, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_badgeView, 0);

  objc_storeStrong((id *)&self->_contactsImageView, 0);
}

@end