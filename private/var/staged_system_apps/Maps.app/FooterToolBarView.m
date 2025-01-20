@interface FooterToolBarView
- (BOOL)canAdaptToWidth;
- (BOOL)canBeSaved;
- (BOOL)canDeleteOnly;
- (BOOL)canMove;
- (FooterToolBarView)initWithFrame:(CGRect)a3;
- (UIToolbar)toolBar;
- (id)contentView;
- (id)delegate;
- (unint64_t)state;
- (void)layoutSubviews;
- (void)setCanAdaptToWidth:(BOOL)a3;
- (void)setCanBeSaved:(BOOL)a3;
- (void)setCanDeleteOnly:(BOOL)a3;
- (void)setCanMove:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setToolBar:(id)a3;
- (void)updateTheme;
@end

@implementation FooterToolBarView

- (FooterToolBarView)initWithFrame:(CGRect)a3
{
  v45.receiver = self;
  v45.super_class = (Class)FooterToolBarView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v6 = -[FooterToolBarView initWithFrame:](&v45, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v7 = v6;
  if (v6)
  {
    [(FooterToolBarView *)v6 setAccessibilityIdentifier:@"FooterToolBarView"];
    uint64_t v8 = +[MapsTheme visualEffectViewAllowingBlur:1];
    blurView = v7->_blurView;
    v7->_blurView = (UIVisualEffectView *)v8;

    [(UIVisualEffectView *)v7->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FooterToolBarView *)v7 addSubview:v7->_blurView];
    id v10 = [(FooterToolBarView *)v7 _maps_addHairlineAtTopWithMargin:0.0];
    id v11 = [objc_alloc((Class)UIToolbar) initWithFrame:CGRectZero.origin.x, y, width, height];
    v12 = objc_opt_new();
    [v11 setBackgroundImage:v12 forToolbarPosition:0 barMetrics:0];

    v13 = +[UIColor clearColor];
    [v11 setBackgroundColor:v13];

    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 setTranslucent:1];
    [v11 setTintAdjustmentMode:1];
    [v11 setAccessibilityIdentifier:@"FooterToolBar"];
    v14 = [(FooterToolBarView *)v7 contentView];
    [v14 addSubview:v11];

    [(FooterToolBarView *)v7 setToolBar:v11];
    v15 = [v11 bottomAnchor];
    v16 = [(FooterToolBarView *)v7 safeAreaLayoutGuide];
    v17 = [v16 bottomAnchor];
    v18 = [v15 constraintEqualToAnchor:v17];

    LODWORD(v19) = 1140457472;
    v20 = v18;
    v32 = v18;
    [v18 setPriority:v19];
    v44 = [(UIVisualEffectView *)v7->_blurView topAnchor];
    v43 = [(FooterToolBarView *)v7 topAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v46[0] = v42;
    v41 = [(UIVisualEffectView *)v7->_blurView bottomAnchor];
    v40 = [(FooterToolBarView *)v7 bottomAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v46[1] = v39;
    v38 = [(UIVisualEffectView *)v7->_blurView leadingAnchor];
    v37 = [(FooterToolBarView *)v7 leadingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v46[2] = v36;
    v35 = [(UIVisualEffectView *)v7->_blurView trailingAnchor];
    v34 = [(FooterToolBarView *)v7 trailingAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v46[3] = v33;
    v31 = [v11 topAnchor];
    v30 = [(FooterToolBarView *)v7 topAnchor];
    v21 = [v31 constraintEqualToAnchor:v30];
    v46[4] = v21;
    v22 = [v11 leadingAnchor];
    v23 = [(FooterToolBarView *)v7 leadingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    v46[5] = v24;
    v25 = [v11 trailingAnchor];
    v26 = [(FooterToolBarView *)v7 trailingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v46[6] = v27;
    v46[7] = v20;
    v28 = +[NSArray arrayWithObjects:v46 count:8];
    +[NSLayoutConstraint activateConstraints:v28];
  }
  return v7;
}

- (id)contentView
{
  return [(UIVisualEffectView *)self->_blurView contentView];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FooterToolBarView;
  [(FooterToolBarView *)&v3 layoutSubviews];
  if ([(FooterToolBarView *)self canAdaptToWidth]) {
    [(FooterToolBarView *)self _updateContent];
  }
}

- (void)updateTheme
{
  id v5 = [(FooterToolBarView *)self theme];
  objc_super v3 = [v5 keyColor];
  v4 = [(FooterToolBarView *)self toolBar];
  [v4 setTintColor:v3];
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(FooterToolBarView *)self setCanAdaptToWidth:0];
    [(FooterToolBarView *)self _updateContent];
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)canDeleteOnly
{
  return self->_canDeleteOnly;
}

- (void)setCanDeleteOnly:(BOOL)a3
{
  self->_canDeleteOnldouble y = a3;
}

- (BOOL)canBeSaved
{
  return self->_canBeSaved;
}

- (void)setCanBeSaved:(BOOL)a3
{
  self->_canBeSaved = a3;
}

- (BOOL)canMove
{
  return self->_canMove;
}

- (void)setCanMove:(BOOL)a3
{
  self->_canMove = a3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canAdaptToWidth
{
  return self->_canAdaptToWidth;
}

- (void)setCanAdaptToWidth:(BOOL)a3
{
  self->_canAdaptToWidth = a3;
}

- (UIToolbar)toolBar
{
  return self->_toolBar;
}

- (void)setToolBar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolBar, 0);
  objc_destroyWeak(&self->_delegate);

  objc_storeStrong((id *)&self->_blurView, 0);
}

@end