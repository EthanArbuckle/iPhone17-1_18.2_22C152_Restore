@interface LocalSearchView
- (BOOL)buttonMode;
- (LocalSearchView)initWithFrame:(CGRect)a3;
- (LocalSearchViewDelegate)delegate;
- (double)_localSearchViewHeight;
- (double)bottomInset;
- (double)contentHeight;
- (id)textForState:(unint64_t)a3;
- (unint64_t)state;
- (void)_updateFontsAndAppearance;
- (void)actionButtonTapped:(id)a3;
- (void)configureStateAnimated:(BOOL)a3;
- (void)customInit;
- (void)executeAction;
- (void)setBottomInset:(double)a3;
- (void)setButtonMode:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setText:(id)a3 forState:(unint64_t)a4;
- (void)updateTheme;
@end

@implementation LocalSearchView

- (void)updateTheme
{
  if (sub_1000BBB44(self) != 5)
  {
    actionButton = self->_actionButton;
    v4 = [(LocalSearchView *)self theme];
    v5 = [v4 controlTintColor];
    [(UIButton *)actionButton setTitleColor:v5 forState:0];
  }
  id v6 = [(LocalSearchView *)self theme];
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_loadingIndicatorView, "setActivityIndicatorViewStyle:", [v6 activityIndicatorStyle]);
}

- (LocalSearchView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)LocalSearchView;
  v3 = -[LocalSearchView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(LocalSearchView *)v3 customInit];
    v4->_state = 0;
  }
  return v4;
}

- (void)customInit
{
  [(LocalSearchView *)self setClipsToBounds:1];
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  contentView = self->_contentView;
  self->_contentView = v7;

  [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(LocalSearchView *)self addSubview:self->_contentView];
  v33 = [(UIView *)self->_contentView leadingAnchor];
  v32 = [(LocalSearchView *)self leadingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v34[0] = v31;
  v30 = [(UIView *)self->_contentView trailingAnchor];
  v29 = [(LocalSearchView *)self trailingAnchor];
  v9 = [v30 constraintEqualToAnchor:v29];
  v34[1] = v9;
  v10 = [(UIView *)self->_contentView topAnchor];
  v11 = [(LocalSearchView *)self topAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v34[2] = v12;
  v13 = [(UIView *)self->_contentView bottomAnchor];
  v14 = [(LocalSearchView *)self safeAreaLayoutGuide];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  v34[3] = v16;
  v17 = +[NSArray arrayWithObjects:v34 count:4];
  +[NSLayoutConstraint activateConstraints:v17];

  v18 = [(LocalSearchView *)self heightAnchor];
  v19 = [v18 constraintEqualToConstant:0.0];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v19;

  v21 = +[UIButton buttonWithType:0];
  actionButton = self->_actionButton;
  self->_actionButton = v21;

  [(UIButton *)self->_actionButton setAccessibilityIdentifier:@"ActionButton"];
  [(UIButton *)self->_actionButton addTarget:self action:"actionButtonTapped:" forControlEvents:64];
  [(UIButton *)self->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  loadingIndicatorView = self->_loadingIndicatorView;
  self->_loadingIndicatorView = v23;

  [(UIActivityIndicatorView *)self->_loadingIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  v25 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v25;

  [(UILabel *)self->_loadingLabel setAccessibilityIdentifier:@"LoadingLabel"];
  [(UILabel *)self->_loadingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v27 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  errorLabel = self->_errorLabel;
  self->_errorLabel = v27;

  [(UILabel *)self->_errorLabel setAccessibilityIdentifier:@"ErrorLabel"];
  [(UILabel *)self->_errorLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(NSLayoutConstraint *)self->_heightConstraint setActive:1];
  [(LocalSearchView *)self _mapsui_addSelectGestureRecognizerWithTarget:self action:"actionButtonTapped:"];
  [(LocalSearchView *)self _updateFontsAndAppearance];
}

- (void)_updateFontsAndAppearance
{
  if (sub_1000BBB44(self) == 5)
  {
    id v13 = +[UIColor colorWithDynamicProvider:&stru_1012E8F80];
    id v3 = +[UIFont systemFontOfSize:16.0 weight:UIFontWeightLight];
    v4 = [v3 fontDescriptor];
    v5 = [v4 fontDescriptorWithDesign:UIFontDescriptorSystemDesignRounded];

    objc_super v6 = +[UIFont fontWithDescriptor:v5 size:0.0];
    v7 = [(UIButton *)self->_actionButton titleLabel];
    [v7 setFont:v6];

    IsEnabled_SearchAndDiscoverdouble y = MapsFeature_IsEnabled_SearchAndDiscovery();
    actionButton = self->_actionButton;
    if (IsEnabled_SearchAndDiscovery)
    {
      v10 = [(LocalSearchView *)self tintColor];
      [(UIButton *)actionButton setTitleColor:v10 forState:0];
    }
    else
    {
      [(UIButton *)self->_actionButton setTitleColor:v13 forState:0];
      [(UIButton *)self->_actionButton setTintColor:v13];
      v12 = +[UIImageSymbolConfiguration configurationWithFont:v6 scale:2];
      v10 = +[UIImage systemImageNamed:@"arrow.clockwise" withConfiguration:v12];

      [(UIButton *)self->_actionButton setImage:v10 forState:0];
    }

    [(UILabel *)self->_loadingLabel setTextColor:v13];
    [(UILabel *)self->_errorLabel setTextColor:v13];
    [(UILabel *)self->_loadingLabel setFont:v6];
    [(UILabel *)self->_errorLabel setFont:v6];
    -[UIButton setImageEdgeInsets:](self->_actionButton, "setImageEdgeInsets:", 0.0, -10.0, 0.0, 0.0);
    -[UIButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", 0.0, 0.0, 0.0, -2.0);
  }
  else
  {
    v11 = +[UIColor secondaryLabelColor];
    [(UILabel *)self->_loadingLabel setTextColor:v11];

    id v13 = +[UIColor secondaryLabelColor];
    [(UILabel *)self->_errorLabel setTextColor:v13];
  }
}

- (double)contentHeight
{
  [(LocalSearchView *)self _localSearchViewHeight];
  return v3 + self->_bottomInset;
}

- (void)setText:(id)a3 forState:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 4)
  {
    uint64_t v7 = 32;
LABEL_7:
    id v8 = v6;
    [*(id *)((char *)&self->super.super.super.super.isa + v7) setText:v6];
    goto LABEL_8;
  }
  if (a4 == 3)
  {
    uint64_t v7 = 40;
    goto LABEL_7;
  }
  if (a4 != 1) {
    goto LABEL_9;
  }
  id v8 = v6;
  [(UIButton *)self->_actionButton setTitle:v6 forState:0];
LABEL_8:
  id v6 = v8;
LABEL_9:
}

- (id)textForState:(unint64_t)a3
{
  switch(a3)
  {
    case 4uLL:
      uint64_t v4 = 32;
LABEL_7:
      double v3 = [*(id *)((char *)&self->super.super.super.super.isa + v4) text];
      break;
    case 3uLL:
      uint64_t v4 = 40;
      goto LABEL_7;
    case 1uLL:
      double v3 = [(UIButton *)self->_actionButton titleForState:0];
      break;
    default:
      double v3 = 0;
      break;
  }

  return v3;
}

- (void)actionButtonTapped:(id)a3
{
}

- (void)executeAction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained localSearchViewSelected:self];
}

- (void)setState:(unint64_t)a3
{
  if (self->_state == a3) {
    return;
  }
  self->_state = a3;
  if (!MapsFeature_IsEnabled_SearchAndDiscovery()) {
    goto LABEL_6;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v4 = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned int v5 = [v4 shouldShowRefreshFooter];

    if (!v5) {
      return;
    }
LABEL_6:
    [(LocalSearchView *)self configureStateAnimated:1];
    return;
  }
}

- (void)setBottomInset:(double)a3
{
  if (self->_bottomInset != a3)
  {
    [(NSLayoutConstraint *)self->_heightConstraint constant];
    double bottomInset = self->_bottomInset;
    self->_double bottomInset = a3;
    double v7 = v6 - bottomInset + a3;
    heightConstraint = self->_heightConstraint;
    [(NSLayoutConstraint *)heightConstraint setConstant:v7];
  }
}

- (void)configureStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(LocalSearchView *)self _localSearchViewHeight];
  double v6 = v5;
  [(UIActivityIndicatorView *)self->_loadingIndicatorView stopAnimating];
  switch(self->_state)
  {
    case 0uLL:
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1003F5C4C;
      v54[3] = &unk_1012E5D08;
      v54[4] = self;
      v10 = objc_retainBlock(v54);
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_1003F5CD0;
      v53[3] = &unk_1012E7D28;
      v53[4] = self;
      v36 = objc_retainBlock(v53);
      double v7 = 0;
      id v8 = 0;
      v9 = 0;
      double v6 = 0.0;
      break;
    case 1uLL:
      double v7 = self->_actionButton;
      id v8 = self->_actionButton;
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_1003F5D60;
      v52[3] = &unk_1012E5D08;
      v52[4] = self;
      v9 = objc_retainBlock(v52);
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1003F5FC4;
      v51[3] = &unk_1012E5D08;
      v51[4] = self;
      v10 = objc_retainBlock(v51);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_1003F6048;
      v50[3] = &unk_1012E7D28;
      v50[4] = self;
      v11 = v50;
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
      double v7 = self->_loadingIndicatorView;
      id v8 = self->_loadingLabel;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_1003F60CC;
      v49[3] = &unk_1012E5D08;
      v49[4] = self;
      v9 = objc_retainBlock(v49);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1003F6368;
      v48[3] = &unk_1012E5D08;
      v48[4] = self;
      v10 = objc_retainBlock(v48);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1003F63EC;
      v47[3] = &unk_1012E7D28;
      v47[4] = self;
      v11 = v47;
      goto LABEL_7;
    case 4uLL:
      double v7 = self->_errorLabel;
      id v8 = self->_errorLabel;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_1003F64A4;
      v46[3] = &unk_1012E5D08;
      v46[4] = self;
      v9 = objc_retainBlock(v46);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1003F660C;
      v45[3] = &unk_1012E5D08;
      v45[4] = self;
      v10 = objc_retainBlock(v45);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1003F6690;
      v44[3] = &unk_1012E7D28;
      v44[4] = self;
      v11 = v44;
LABEL_7:
      v36 = objc_retainBlock(v11);
      break;
    default:
      v10 = 0;
      v36 = 0;
      double v7 = 0;
      id v8 = 0;
      v9 = 0;
      break;
  }
  [(NSLayoutConstraint *)self->_heightConstraint constant];
  double v13 = v12;
  double v14 = v6 + self->_bottomInset;
  BOOL v15 = v12 != v14;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1003F6714;
  v42[3] = &unk_1012E8FA8;
  BOOL v43 = v12 != v14;
  v42[4] = self;
  *(double *)&v42[5] = v6;
  v16 = objc_retainBlock(v42);
  if (v9)
  {
    ((void (*)(void *))v9[2])(v9);
    if (self->_buttonMode && v7 != 0 && v8 != 0)
    {
      v33 = [(UIButton *)v7 leadingAnchor];
      v32 = [(LocalSearchView *)self leadingAnchor];
      [v33 constraintEqualToAnchor:v32 constant:16.0];
      v31 = v35 = v7;
      v55[0] = v31;
      v19 = [(UIButton *)v8 trailingAnchor];
      [(LocalSearchView *)self trailingAnchor];
      v20 = BOOL v34 = v3;
      v21 = [v19 constraintEqualToAnchor:v20 constant:-16.0];
      v55[1] = v21;
      +[NSArray arrayWithObjects:v55 count:2];
      v22 = v10;
      v23 = v9;
      v25 = v24 = v8;
      +[NSLayoutConstraint activateConstraints:v25];

      id v8 = v24;
      v9 = v23;
      v10 = v22;

      BOOL v3 = v34;
      double v7 = v35;
    }
    [(LocalSearchView *)self layoutIfNeeded];
  }
  ((void (*)(void *))v16[2])(v16);
  if (v3)
  {
    [(LocalSearchView *)self updateConstraintsIfNeeded];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1003F6748;
    v40[3] = &unk_1012E5F78;
    v40[4] = self;
    v41 = v10;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1003F6790;
    v37[3] = &unk_1012E8FD0;
    v26 = v36;
    BOOL v39 = v15;
    v37[4] = self;
    v38 = v36;
    +[UIView animateWithDuration:v40 animations:v37 completion:0.25];

    id v27 = v41;
LABEL_20:

    goto LABEL_29;
  }
  [(LocalSearchView *)self layoutIfNeeded];
  if (v10) {
    ((void (*)(void *))v10[2])(v10);
  }
  v26 = v36;
  if (v36) {
    ((void (*)(void *, uint64_t))v36[2])(v36, 1);
  }
  if (v13 != v14 && (MapsFeature_IsEnabled_SearchAndDiscovery() & 1) == 0)
  {
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    char v30 = objc_opt_respondsToSelector();

    if (v30)
    {
      id v27 = objc_loadWeakRetained((id *)p_delegate);
      [v27 localSearchViewContentSizeChanged];
      goto LABEL_20;
    }
  }
LABEL_29:
}

- (double)_localSearchViewHeight
{
  uint64_t v2 = sub_1000BBB44(self);
  double result = 49.0;
  if (v2 == 5) {
    return 24.0;
  }
  return result;
}

- (LocalSearchViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (LocalSearchViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)buttonMode
{
  return self->_buttonMode;
}

- (void)setButtonMode:(BOOL)a3
{
  self->_buttonMode = a3;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorView, 0);
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_errorLabel, 0);
  objc_storeStrong((id *)&self->_actionButtonImageView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end