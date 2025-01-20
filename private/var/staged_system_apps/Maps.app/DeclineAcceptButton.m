@interface DeclineAcceptButton
- (BOOL)accept;
- (DeclineAcceptButton)initWithAccept:(BOOL)a3;
- (MKVibrantView)vibrantView;
- (void)_commontInit;
- (void)_setVibrantView;
- (void)setAccept:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setVibrantView:(id)a3;
- (void)updateButtonWithHighlighted:(BOOL)a3;
@end

@implementation DeclineAcceptButton

- (DeclineAcceptButton)initWithAccept:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DeclineAcceptButton;
  v4 = [(DeclineAcceptButton *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(DeclineAcceptButton *)v4 setAccept:v3];
    [(DeclineAcceptButton *)v5 _commontInit];
  }
  return v5;
}

- (void)_commontInit
{
  [(DeclineAcceptButton *)self _setVibrantView];
  [(DeclineAcceptButton *)self _accessibilitySetInterfaceStyleIntent:1];
  -[DeclineAcceptButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 5.0, 10.0, 5.0, 10.0);
  BOOL v3 = [(DeclineAcceptButton *)self titleLabel];
  [v3 setNumberOfLines:2];

  [(DeclineAcceptButton *)self updateButtonWithHighlighted:0];
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)updateButtonWithHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(DeclineAcceptButton *)self accept];
  v6 = [(DeclineAcceptButton *)self mk_theme];
  id v11 = v6;
  if (v3)
  {
    if (v5)
    {
      uint64_t v7 = [v6 headerPrimaryButtonHighlightedColor];
LABEL_6:
      v8 = (void *)v7;
      [(DeclineAcceptButton *)self setBackgroundColor:v7];
      goto LABEL_10;
    }
    uint64_t v9 = [v6 buttonHighlightedColor];
  }
  else
  {
    if (v5)
    {
      uint64_t v7 = [v6 tintColor];
      goto LABEL_6;
    }
    uint64_t v9 = [v6 buttonNormalColor];
  }
  v8 = (void *)v9;
  v10 = [(MKVibrantView *)self->_vibrantView contentView];
  [v10 setBackgroundColor:v8];

LABEL_10:
}

- (void)_setVibrantView
{
  if ([(DeclineAcceptButton *)self accept])
  {
    BOOL v3 = [(DeclineAcceptButton *)self layer];
    [v3 setCornerRadius:8.0];

    v4 = [(DeclineAcceptButton *)self layer];
    [v4 setCornerCurve:kCACornerCurveContinuous];

    id v5 = +[UIColor colorWithWhite:1.0 alpha:0.200000003];
    id v6 = [v5 CGColor];
    uint64_t v7 = [(DeclineAcceptButton *)self layer];
    [v7 setBorderColor:v6];

    id v23 = [(DeclineAcceptButton *)self layer];
    [v23 setBorderWidth:1.0];
  }
  else
  {
    v8 = [objc_alloc((Class)MKVibrantView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    vibrantView = self->_vibrantView;
    self->_vibrantView = v8;

    [(MKVibrantView *)self->_vibrantView setTranslatesAutoresizingMaskIntoConstraints:0];
    v10 = +[UIColor clearColor];
    [(MKVibrantView *)self->_vibrantView setBackgroundColor:v10];

    [(MKVibrantView *)self->_vibrantView setUserInteractionEnabled:0];
    [(MKVibrantView *)self->_vibrantView setContinuousCornerRadius:8.0];
    [(DeclineAcceptButton *)self addSubview:self->_vibrantView];
    id v24 = [(MKVibrantView *)self->_vibrantView topAnchor];
    v22 = [(DeclineAcceptButton *)self topAnchor];
    v21 = [v24 constraintEqualToAnchor:v22];
    v25[0] = v21;
    id v11 = [(MKVibrantView *)self->_vibrantView bottomAnchor];
    v12 = [(DeclineAcceptButton *)self bottomAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v25[1] = v13;
    v14 = [(MKVibrantView *)self->_vibrantView leadingAnchor];
    v15 = [(DeclineAcceptButton *)self leadingAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    v25[2] = v16;
    v17 = [(MKVibrantView *)self->_vibrantView trailingAnchor];
    v18 = [(DeclineAcceptButton *)self trailingAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v25[3] = v19;
    v20 = +[NSArray arrayWithObjects:v25 count:4];
    +[NSLayoutConstraint activateConstraints:v20];
  }
}

- (BOOL)accept
{
  return self->_accept;
}

- (void)setAccept:(BOOL)a3
{
  self->_accept = a3;
}

- (MKVibrantView)vibrantView
{
  return self->_vibrantView;
}

- (void)setVibrantView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end