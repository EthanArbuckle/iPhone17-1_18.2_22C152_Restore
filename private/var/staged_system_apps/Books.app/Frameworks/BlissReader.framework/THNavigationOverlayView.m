@interface THNavigationOverlayView
- (BEHairlineDividerView)separator;
- (BOOL)blissClassicStyle;
- (BOOL)separatorsVisible;
- (BOOL)transparentMode;
- (NSString)alternativeNextCaption;
- (NSString)alternativePrevCaption;
- (NSString)nextCaption;
- (NSString)prevCaption;
- (NSString)title;
- (THNavigationOverlayView)initWithFrame:(CGRect)a3;
- (THNavigationOverlayView)initWithFrame:(CGRect)a3 blissClassicStyle:(BOOL)a4;
- (THTheme)theme;
- (UIButton)nextButton;
- (UIButton)prevButton;
- (UIImage)cachedPillModeNextImage;
- (UIImage)cachedPillModePrevImage;
- (UILabel)titleLabel;
- (UIView)backgroundView;
- (double)marginOffset;
- (double)showHideAnimationDuration;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)p_customButtonWithFrame:(CGRect)a3;
- (void)_updateConstraints;
- (void)_updateTheme;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)layoutSubviewsWithPill;
- (void)layoutSubviewsWithoutPill;
- (void)pSetControlColors;
- (void)p_loadCachedPillButtonImages;
- (void)p_setNextButtonTitle;
- (void)p_setPrevButtonTitle;
- (void)setAlternativeNextCaption:(id)a3;
- (void)setAlternativePrevCaption:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBlissClassicStyle:(BOOL)a3;
- (void)setCachedPillModeNextImage:(id)a3;
- (void)setCachedPillModePrevImage:(id)a3;
- (void)setMarginOffset:(double)a3;
- (void)setNextButton:(id)a3;
- (void)setNextButtonTitle:(id)a3 andEnable:(BOOL)a4;
- (void)setNextCaption:(id)a3;
- (void)setOverlayHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setPrevButton:(id)a3;
- (void)setPrevButtonTitle:(id)a3 andEnable:(BOOL)a4;
- (void)setPrevCaption:(id)a3;
- (void)setSeparator:(id)a3;
- (void)setSeparatorsVisible:(BOOL)a3;
- (void)setShowHideAnimationDuration:(double)a3;
- (void)setTheme:(id)a3;
- (void)setTheme:(id)a3 force:(BOOL)a4;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTransparentMode:(BOOL)a3;
@end

@implementation THNavigationOverlayView

- (THNavigationOverlayView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BCReportAssertionFailureWithMessage();

  return -[THNavigationOverlayView initWithFrame:blissClassicStyle:](self, "initWithFrame:blissClassicStyle:", 0, x, y, width, height);
}

- (THNavigationOverlayView)initWithFrame:(CGRect)a3 blissClassicStyle:(BOOL)a4
{
  v12.receiver = self;
  v12.super_class = (Class)THNavigationOverlayView;
  v5 = -[THNavigationOverlayView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    id v6 = objc_alloc((Class)BEHairlineDividerView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v5->_separator = [(BEHairlineDividerView *)[v6 initWithFrame:CGRectMake(0, y, width, height)] autorelease];
    v5->_prevButton = (UIButton *)-[THNavigationOverlayView p_customButtonWithFrame:](v5, "p_customButtonWithFrame:", CGRectZero.origin.x, y, width, height);
    v5->_nextButton = (UIButton *)-[THNavigationOverlayView p_customButtonWithFrame:](v5, "p_customButtonWithFrame:", CGRectZero.origin.x, y, width, height);
    v5->_titleLabel = (UILabel *)objc_alloc_init((Class)UILabel);
    id v10 = objc_alloc((Class)UIView);
    [(THNavigationOverlayView *)v5 bounds];
    v5->_backgroundView = [v10 initWithFrame:];
    v5->_blissClassicStyle = a4;
    [(THNavigationOverlayView *)v5 addSubview:v5->_backgroundView];
    [(THNavigationOverlayView *)v5 addSubview:v5->_separator];
    [(THNavigationOverlayView *)v5 addSubview:v5->_prevButton];
    [(THNavigationOverlayView *)v5 addSubview:v5->_nextButton];
    [(THNavigationOverlayView *)v5 addSubview:v5->_titleLabel];
    [(THNavigationOverlayView *)v5 setTintAdjustmentMode:0];
    [(UIButton *)v5->_prevButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v5->_nextButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v5->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(THNavigationOverlayView *)v5 _updateConstraints];
    [(THNavigationOverlayView *)v5 pSetControlColors];
    [(THNavigationOverlayView *)v5 setOverlayHidden:1 animated:0];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THNavigationOverlayView;
  [(THNavigationOverlayView *)&v3 dealloc];
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THNavigationOverlayView;
  -[THNavigationOverlayView setBackgroundColor:](&v5, "setBackgroundColor:");
  [(UIView *)self->_backgroundView setBackgroundColor:a3];
}

- (void)layoutSubviews
{
  if ([(THNavigationOverlayView *)self blissClassicStyle]) {
    [(THNavigationOverlayView *)self layoutSubviewsWithPill];
  }
  else {
    [(THNavigationOverlayView *)self layoutSubviewsWithoutPill];
  }
  [(THNavigationOverlayView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [self window].safeAreaInsets;
  backgroundView = self->_backgroundView;

  -[UIView setFrame:](backgroundView, "setFrame:", v4, v6, v8, v10 + v11);
}

- (void)layoutSubviewsWithPill
{
  [(THNavigationOverlayView *)self p_loadCachedPillButtonImages];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v24[0] = [(THNavigationOverlayView *)self prevButton];
  v24[1] = [(THNavigationOverlayView *)self nextButton];
  double v3 = +[NSArray arrayWithObjects:v24 count:2];
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v7);
        id v9 = [(THTheme *)self->_theme identifier];
        if ([v9 isEqualToString:kIMThemeIdentifierBlissClassicTheme]) {
          objc_msgSend(objc_msgSend(v8, "layer"), "setBackgroundColor:", objc_msgSend(+[UIColor bc_darkSystemBackgroundForTraitCollection:](UIColor, "bc_darkSystemBackgroundForTraitCollection:", -[THNavigationOverlayView traitCollection](self, "traitCollection")), "CGColor"));
        }
        objc_msgSend(objc_msgSend(v8, "layer"), "setBorderWidth:", 0.0);
        objc_msgSend(objc_msgSend(v8, "layer"), "setCornerRadius:", 3.0);
        [v8 setClipsToBounds:1];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v5);
  }
  [(UIButton *)[(THNavigationOverlayView *)self prevButton] setImage:[(THNavigationOverlayView *)self cachedPillModePrevImage] forState:0];
  -[UIButton setImageEdgeInsets:]([(THNavigationOverlayView *)self prevButton], "setImageEdgeInsets:", 0.0, 0.0, 0.0, 8.0);
  [(UILabel *)[(UIButton *)[(THNavigationOverlayView *)self prevButton] titleLabel] setFont:+[UIFont systemFontOfSize:13.0]];
  [(UIButton *)[(THNavigationOverlayView *)self nextButton] setImage:[(THNavigationOverlayView *)self cachedPillModeNextImage] forState:0];
  [(UILabel *)[(UIButton *)[(THNavigationOverlayView *)self nextButton] titleLabel] setFont:+[UIFont systemFontOfSize:13.0]];
  [(UILabel *)[(UIButton *)[(THNavigationOverlayView *)self nextButton] titleLabel] frame];
  double v10 = [(UILabel *)[(UIButton *)[(THNavigationOverlayView *)self nextButton] titleLabel] text];
  NSAttributedStringKey v22 = NSFontAttributeName;
  v23 = [(UILabel *)[(UIButton *)[(THNavigationOverlayView *)self nextButton] titleLabel] font];
  [(NSString *)v10 sizeWithAttributes:+[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1]];
  double v12 = v11;
  [(UIImageView *)[(UIButton *)[(THNavigationOverlayView *)self nextButton] imageView] frame];
  double v14 = v13;
  -[UIButton setImageEdgeInsets:]([(THNavigationOverlayView *)self nextButton], "setImageEdgeInsets:", 0.0, v12 + 8.0, 0.0, -(v12 + 8.0));
  -[UIButton setTitleEdgeInsets:]([(THNavigationOverlayView *)self nextButton], "setTitleEdgeInsets:", 0.0, -v14, 0.0, v14);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  -[UILabel setFrame:]([(THNavigationOverlayView *)self titleLabel], "setFrame:", CGRectZero.origin.x, y, width, height);
  -[BEHairlineDividerView setFrame:]([(THNavigationOverlayView *)self separator], "setFrame:", CGRectZero.origin.x, y, width, height);
}

- (void)layoutSubviewsWithoutPill
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v23[0] = [(THNavigationOverlayView *)self prevButton];
  v23[1] = [(THNavigationOverlayView *)self nextButton];
  double v3 = +[NSArray arrayWithObjects:v23 count:2];
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        double v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(objc_msgSend(v11, "layer"), "setBackgroundColor:", 0);
        objc_msgSend(objc_msgSend(v11, "layer"), "setBorderWidth:", 0.0);
        objc_msgSend(objc_msgSend(v11, "layer"), "setCornerRadius:", 0.0);
        [v11 setClipsToBounds:0];
        [v11 setImageEdgeInsets:UIEdgeInsetsZero.top, left, bottom, right];
        [v11 setTitleEdgeInsets:UIEdgeInsetsZero.top, left, bottom, right];
      }
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
  [(UILabel *)[(THNavigationOverlayView *)self titleLabel] setFont:+[UIFont systemFontOfSize:13.0]];
  [(BEHairlineDividerView *)[(THNavigationOverlayView *)self separator] setHorizontal:1];
  [(UIButton *)[(THNavigationOverlayView *)self prevButton] setImage:0 forState:0];
  [(UIButton *)[(THNavigationOverlayView *)self nextButton] setImage:0 forState:0];
  [(UILabel *)[(UIButton *)[(THNavigationOverlayView *)self prevButton] titleLabel] setFont:+[UIFont systemFontOfSize:13.0]];
  [(UILabel *)[(UIButton *)[(THNavigationOverlayView *)self nextButton] titleLabel] setFont:+[UIFont systemFontOfSize:13.0]];
  [(UIButton *)[(THNavigationOverlayView *)self prevButton] sizeToFit];
  [(UIButton *)[(THNavigationOverlayView *)self nextButton] sizeToFit];
  [(UILabel *)[(THNavigationOverlayView *)self titleLabel] sizeToFit];
  [(THNavigationOverlayView *)self bounds];
  double v13 = v12;
  [(THNavigationOverlayView *)self bounds];
  double v15 = v14;
  [(THNavigationOverlayView *)self bounds];
  double v17 = v16;
  [+[UIScreen mainScreen] scale];
  -[BEHairlineDividerView setFrame:]([(THNavigationOverlayView *)self separator], "setFrame:", v13, v15, v17, 1.0 / v18);
}

- (void)pSetControlColors
{
  double v3 = +[UIColor whiteColor];
  id v4 = [(THNavigationOverlayView *)self prevButton];
  id v5 = [(THNavigationOverlayView *)self nextButton];
  if ([(THNavigationOverlayView *)self blissClassicStyle])
  {
    [(UIButton *)v4 setTitleColor:v3 forState:0];
    [(UIButton *)v4 setTitleColor:0 forState:1];
    [(UIButton *)v5 setTitleColor:v3 forState:0];
    [(UIButton *)v5 setTitleColor:0 forState:1];
    [(UILabel *)[(THNavigationOverlayView *)self titleLabel] setTextColor:+[UIColor clearColor]];
    uint64_t v6 = [(THNavigationOverlayView *)self separator];
    uint64_t v7 = 1;
  }
  else
  {
    objc_opt_class();
    [(THNavigationOverlayView *)self theme];
    double v8 = (void *)TSUDynamicCast();
    id v9 = [v8 headerTextColorDimmed];
    id v10 = [v8 tintColor];
    [(UIButton *)v4 setTitleColor:v10 forState:0];
    [(UIButton *)v5 setTitleColor:v10 forState:0];
    [(UIButton *)v4 setTitleColor:v9 forState:2];
    [(UIButton *)v5 setTitleColor:v9 forState:2];
    [(UILabel *)[(THNavigationOverlayView *)self titleLabel] setTextColor:v9];
    double v11 = [(THNavigationOverlayView *)self separator];
    -[BEHairlineDividerView setDividerColor:](v11, "setDividerColor:", [v8 separatorColor]);
    uint64_t v7 = [(THNavigationOverlayView *)self separatorsVisible] ^ 1;
    uint64_t v6 = v11;
  }

  [(BEHairlineDividerView *)v6 setHidden:v7];
}

- (void)setTheme:(id)a3
{
  theme = self->_theme;
  if (theme != a3)
  {

    self->_theme = (THTheme *)a3;
    [(THNavigationOverlayView *)self _updateTheme];
  }
}

- (void)setTransparentMode:(BOOL)a3
{
  if (self->_transparentMode != a3)
  {
    self->_transparentMode = a3;
    [(THNavigationOverlayView *)self _updateTheme];
  }
}

- (void)_updateTheme
{
  if (self->_transparentMode) {
    double v3 = +[UIColor clearColor];
  }
  else {
    double v3 = (UIColor *)[(THTheme *)self->_theme backgroundColorForTraitEnvironment:self];
  }
  [(THNavigationOverlayView *)self setBackgroundColor:v3];
  [(THNavigationOverlayView *)self setTintColor:[(THTheme *)self->_theme tintColor]];

  [(THNavigationOverlayView *)self pSetControlColors];
}

- (void)setTheme:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  [(THNavigationOverlayView *)self setTheme:a3];
  if (v4)
  {
    [(THNavigationOverlayView *)self _updateTheme];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)THNavigationOverlayView;
  [(THNavigationOverlayView *)&v3 didMoveToWindow];
  [(THNavigationOverlayView *)self _updateTheme];
}

- (void)_updateConstraints
{
  [(UILabel *)[(THNavigationOverlayView *)self titleLabel] removeConstraints:[(UILabel *)[(THNavigationOverlayView *)self titleLabel] constraints]];
  [(UIButton *)[(THNavigationOverlayView *)self nextButton] removeConstraints:[(UIButton *)[(THNavigationOverlayView *)self nextButton] constraints]];
  [(UIButton *)[(THNavigationOverlayView *)self prevButton] removeConstraints:[(UIButton *)[(THNavigationOverlayView *)self prevButton] constraints]];
  v14[0] = [[-[UILabel centerXAnchor](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "centerXAnchor")] constraintEqualToAnchor:[[-[THNavigationOverlayView centerXAnchor](self, "centerXAnchor")] constant:0.0];
  v14[1] = [[-[UILabel centerYAnchor](-[THNavigationOverlayView titleLabel](self, "titleLabel"), "centerYAnchor")] constraintEqualToAnchor:[[-[THNavigationOverlayView centerYAnchor](self, "centerYAnchor")] constant:0.0];
  v14[2] = [(-[UIButton centerYAnchor](-[THNavigationOverlayView prevButton](self, "prevButton"), "centerYAnchor")) constraintEqualToAnchor:(-[THNavigationOverlayView centerYAnchor](self, "centerYAnchor")) constant:0.0];
  v14[3] = [[-[UIButton centerYAnchor](-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView centerYAnchor](self, "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self, "nextButton"), "centerYAnchor") constraintEqualToAnchor:[[-[THNavigationOverlayView nextButton](self
  id v3 = [(UIButton *)[(THNavigationOverlayView *)self prevButton] leadingAnchor];
  id v4 = [[self safeAreaLayoutGuide] leadingAnchor];
  if ([(THNavigationOverlayView *)self blissClassicStyle]) {
    double v5 = 10.0;
  }
  else {
    double v5 = 20.0;
  }
  v14[4] = [v3 constraintEqualToAnchor:v4 constant:v5];
  id v6 = [(UIButton *)[(THNavigationOverlayView *)self nextButton] trailingAnchor];
  id v7 = [[self safeAreaLayoutGuide] trailingAnchor];
  if ([(THNavigationOverlayView *)self blissClassicStyle]) {
    double v8 = 10.0;
  }
  else {
    double v8 = 20.0;
  }
  v14[5] = [v6 constraintEqualToAnchor:v7 constant:-v8];
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:v14 count:6]);
  unsigned int v9 = [(THNavigationOverlayView *)self blissClassicStyle];
  id v10 = [(THNavigationOverlayView *)self prevButton];
  if (v9)
  {
    v13[0] = [v10 widthAnchor].constraintEqualToConstant(145.0);
    v13[1] = [(-[UIButton widthAnchor](-[THNavigationOverlayView nextButton](self, "nextButton"), "widthAnchor")) constraintEqualToConstant:145.0];
    double v11 = v13;
  }
  else
  {
    v12[0] = [v10 heightAnchor constraintEqualToConstant:24.0];
    v12[1] = [[-[THNavigationOverlayView nextButton](self, "nextButton") heightAnchor] constraintEqualToConstant:24.0];
    double v11 = v12;
  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", +[NSArray arrayWithObjects:v11 count:2]);
}

- (NSString)title
{
  v2 = [(THNavigationOverlayView *)self titleLabel];

  return [(UILabel *)v2 text];
}

- (void)setTitle:(id)a3
{
  [(UILabel *)[(THNavigationOverlayView *)self titleLabel] setText:a3];

  [(THNavigationOverlayView *)self setNeedsLayout];
}

- (void)setSeparatorsVisible:(BOOL)a3
{
  self->_separatorsVisible = a3;
  [(THNavigationOverlayView *)self pSetControlColors];
}

- (void)setOverlayHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    [(THNavigationOverlayView *)self showHideAnimationDuration];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_142A84;
    v8[3] = &unk_457278;
    BOOL v9 = a3;
    v8[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_142AD8;
    v6[3] = &unk_459E18;
    BOOL v7 = a3;
    v6[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v6);
  }
  else if (a3)
  {
    [(THNavigationOverlayView *)self setAlpha:0.0];
    [(THNavigationOverlayView *)self setHidden:1];
  }
  else
  {
    [(THNavigationOverlayView *)self setHidden:0];
    [(THNavigationOverlayView *)self setAlpha:1.0];
  }
}

- (void)setAlternativePrevCaption:(id)a3
{
  id v5 = a3;

  self->_alternativePrevCaption = (NSString *)a3;

  [(THNavigationOverlayView *)self p_setPrevButtonTitle];
}

- (void)setAlternativeNextCaption:(id)a3
{
  id v5 = a3;

  self->_alternativeNextCaption = (NSString *)a3;

  [(THNavigationOverlayView *)self p_setNextButtonTitle];
}

- (void)setPrevButtonTitle:(id)a3 andEnable:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;

  self->_prevCaption = (NSString *)a3;
  [(THNavigationOverlayView *)self p_setPrevButtonTitle];
  [(UIButton *)[(THNavigationOverlayView *)self prevButton] setEnabled:v4];
  objc_opt_class();
  [(UIButton *)[(THNavigationOverlayView *)self nextButton] _titleView];
  double v8 = (void *)TSUDynamicCast();

  [v8 _setWantsUnderlineForAccessibilityButtonShapesEnabled:v4];
}

- (void)setNextButtonTitle:(id)a3 andEnable:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;

  self->_nextCaption = (NSString *)a3;
  [(THNavigationOverlayView *)self p_setNextButtonTitle];
  [(UIButton *)[(THNavigationOverlayView *)self nextButton] setEnabled:v4];
  objc_opt_class();
  [(UIButton *)[(THNavigationOverlayView *)self nextButton] _titleView];
  double v8 = (void *)TSUDynamicCast();

  [v8 _setWantsUnderlineForAccessibilityButtonShapesEnabled:v4];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)THNavigationOverlayView;
  id v7 = -[THNavigationOverlayView hitTest:withEvent:](&v9, "hitTest:withEvent:", a4);
  [(UIButton *)[(THNavigationOverlayView *)self prevButton] frame];
  v10.CGFloat x = x;
  v10.CGFloat y = y;
  if (!CGRectContainsPoint(v12, v10))
  {
    [(UIButton *)[(THNavigationOverlayView *)self nextButton] frame];
    v11.CGFloat x = x;
    v11.CGFloat y = y;
    if (!CGRectContainsPoint(v13, v11)) {
      return 0;
    }
  }
  return v7;
}

- (void)p_loadCachedPillButtonImages
{
  if (![(THNavigationOverlayView *)self cachedPillModePrevImage])
  {
    [(THNavigationOverlayView *)self setCachedPillModePrevImage:+[UIImage th_imageNamed:@"ios_ib_history_nav_hud_arrow_back"]];
    id v3 = +[UIImage th_imageNamed:@"ios_ib_history_nav_hud_arrow_go"];
    [(THNavigationOverlayView *)self setCachedPillModeNextImage:v3];
  }
}

- (id)p_customButtonWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = +[UIButton buttonWithType:0];
  [(UIButton *)v7 setTitle:@"None" forState:0];
  [(UIButton *)v7 setContentVerticalAlignment:0];
  [(UILabel *)[(UIButton *)v7 titleLabel] setFont:+[UIFont systemFontOfSize:13.0]];
  -[UIButton setFrame:](v7, "setFrame:", x, y, width, height);
  [(UIButton *)v7 setEnabled:0];
  return v7;
}

- (void)p_setPrevButtonTitle
{
  if ([(NSString *)[(THNavigationOverlayView *)self prevCaption] length])
  {
    id v3 = [(THNavigationOverlayView *)self prevCaption];
  }
  else
  {
    BOOL v4 = [(THNavigationOverlayView *)self alternativePrevCaption];
    if (v4) {
      id v3 = (__CFString *)v4;
    }
    else {
      id v3 = &stru_46D7E8;
    }
  }
  if (([(__CFString *)v3 isEqual:[(UIButton *)[(THNavigationOverlayView *)self prevButton] titleForState:0]] & 1) == 0)
  {
    [(UIButton *)[(THNavigationOverlayView *)self prevButton] setTitle:v3 forState:0];
    [(UIButton *)[(THNavigationOverlayView *)self prevButton] setHidden:[(__CFString *)v3 length] == 0];
    [(THNavigationOverlayView *)self setNeedsLayout];
  }
}

- (void)p_setNextButtonTitle
{
  if ([(NSString *)[(THNavigationOverlayView *)self nextCaption] length])
  {
    id v3 = [(THNavigationOverlayView *)self nextCaption];
  }
  else
  {
    BOOL v4 = [(THNavigationOverlayView *)self alternativeNextCaption];
    if (v4) {
      id v3 = (__CFString *)v4;
    }
    else {
      id v3 = &stru_46D7E8;
    }
  }
  if (([(__CFString *)v3 isEqual:[(UIButton *)[(THNavigationOverlayView *)self nextButton] titleForState:0]] & 1) == 0)
  {
    [(UIButton *)[(THNavigationOverlayView *)self nextButton] setTitle:v3 forState:0];
    [(UIButton *)[(THNavigationOverlayView *)self nextButton] setHidden:[(__CFString *)v3 length] == 0];
    [(THNavigationOverlayView *)self setNeedsLayout];
  }
}

- (NSString)alternativePrevCaption
{
  return self->_alternativePrevCaption;
}

- (NSString)alternativeNextCaption
{
  return self->_alternativeNextCaption;
}

- (UIButton)prevButton
{
  return self->_prevButton;
}

- (void)setPrevButton:(id)a3
{
}

- (UIButton)nextButton
{
  return self->_nextButton;
}

- (void)setNextButton:(id)a3
{
}

- (THTheme)theme
{
  return self->_theme;
}

- (BOOL)separatorsVisible
{
  return self->_separatorsVisible;
}

- (double)marginOffset
{
  return self->_marginOffset;
}

- (void)setMarginOffset:(double)a3
{
  self->_marginOffset = a3;
}

- (double)showHideAnimationDuration
{
  return self->_showHideAnimationDuration;
}

- (void)setShowHideAnimationDuration:(double)a3
{
  self->_showHideAnimationDuration = a3;
}

- (BOOL)transparentMode
{
  return self->_transparentMode;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSString)prevCaption
{
  return self->_prevCaption;
}

- (void)setPrevCaption:(id)a3
{
}

- (NSString)nextCaption
{
  return self->_nextCaption;
}

- (void)setNextCaption:(id)a3
{
}

- (UIImage)cachedPillModePrevImage
{
  return self->_cachedPillModePrevImage;
}

- (void)setCachedPillModePrevImage:(id)a3
{
}

- (UIImage)cachedPillModeNextImage
{
  return self->_cachedPillModeNextImage;
}

- (void)setCachedPillModeNextImage:(id)a3
{
}

- (BEHairlineDividerView)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (BOOL)blissClassicStyle
{
  return self->_blissClassicStyle;
}

- (void)setBlissClassicStyle:(BOOL)a3
{
  self->_blissClassicStyle = a3;
}

@end