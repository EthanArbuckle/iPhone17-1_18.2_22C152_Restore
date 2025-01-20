@interface SHUDPillViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)needsButton;
- (PLPillView)pillView;
- (SHUDPillViewController)initWithNeedsButton:(BOOL)a3;
- (UIButton)bannerButton;
- (UIEdgeInsets)bannerContentOutsets;
- (UIView)contentSizeProvidingView;
- (id)buttonTapped;
- (id)formattedSubtitle:(id)a3;
- (id)formattedTitle:(id)a3;
- (id)leadingImage;
- (id)subtitle;
- (id)title;
- (id)trailingButton;
- (id)trailingPillButton;
- (id)viewDidAppearHandler;
- (id)viewDidDisappearHandler;
- (int64_t)imageContentMode;
- (int64_t)subtitleAlignment;
- (void)handleButtonTapped;
- (void)handleTap:(id)a3;
- (void)loadView;
- (void)setBannerButton:(id)a3;
- (void)setButtonTapped:(id)a3;
- (void)setContentSizeProvidingView:(id)a3;
- (void)setNeedsButton:(BOOL)a3;
- (void)setPillView:(id)a3;
- (void)setViewDidAppearHandler:(id)a3;
- (void)setViewDidDisappearHandler:(id)a3;
- (void)updateUI;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SHUDPillViewController

- (SHUDPillViewController)initWithNeedsButton:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SHUDPillViewController;
  result = [(SHUDPillViewController *)&v5 initWithNibName:0 bundle:0];
  if (result) {
    result->_needsButton = a3;
  }
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = sharingHUDLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Banner did appear", v7, 2u);
  }

  objc_super v5 = [(SHUDPillViewController *)self viewDidAppearHandler];

  if (v5)
  {
    v6 = [(SHUDPillViewController *)self viewDidAppearHandler];
    v6[2]();
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = sharingHUDLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Banner did disappear", v7, 2u);
  }

  objc_super v5 = [(SHUDPillViewController *)self viewDidDisappearHandler];

  if (v5)
  {
    v6 = [(SHUDPillViewController *)self viewDidDisappearHandler];
    v6[2]();
  }
}

- (void)handleButtonTapped
{
  v3 = sharingHUDLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Banner button tapped", buf, 2u);
  }

  v4 = [(SHUDPillViewController *)self buttonTapped];

  if (v4)
  {
    objc_super v5 = sharingHUDLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "buttonTapped() called", v7, 2u);
    }

    v6 = [(SHUDPillViewController *)self buttonTapped];
    v6[2]();
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)formattedTitle:(id)a3
{
  id v4 = a3;
  if ([(SHUDPillViewController *)self needsButton])
  {
    id v5 = objc_alloc_init((Class)NSMutableParagraphStyle);
    [v5 setAlignment:4];
    id v6 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v11 = NSParagraphStyleAttributeName;
    id v12 = v5;
    v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v8 = [v6 initWithString:v4 attributes:v7];

    id v9 = [objc_alloc(off_10001CEA8()) initWithAttributedText:v8 style:1];
    id v4 = v5;
  }
  else
  {
    id v9 = [objc_alloc(off_10001CEA8()) initWithText:v4 style:1];
  }

  return v9;
}

- (id)formattedSubtitle:(id)a3
{
  id v4 = a3;
  if ([(SHUDPillViewController *)self needsButton])
  {
    id v5 = objc_alloc_init((Class)NSMutableParagraphStyle);
    objc_msgSend(v5, "setAlignment:", -[SHUDPillViewController subtitleAlignment](self, "subtitleAlignment"));
    id v6 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v11 = NSParagraphStyleAttributeName;
    id v12 = v5;
    v7 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v8 = [v6 initWithString:v4 attributes:v7];

    id v9 = [objc_alloc(off_10001CEA8()) initWithAttributedText:v8 style:2];
    id v4 = v5;
  }
  else
  {
    id v9 = [objc_alloc(off_10001CEA8()) initWithText:v4 style:2];
  }

  return v9;
}

- (id)trailingPillButton
{
  v2 = [(SHUDPillViewController *)self trailingButton];
  v3 = [v2 widthAnchor];
  [v2 intrinsicContentSize];
  id v5 = [v3 constraintEqualToConstant:v4 + 25.0];
  id v8 = v5;
  id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  +[NSLayoutConstraint activateConstraints:v6];

  [v2 setUserInteractionEnabled:0];
  return v2;
}

- (void)loadView
{
  v20.receiver = self;
  v20.super_class = (Class)SHUDPillViewController;
  [(SHUDPillViewController *)&v20 loadView];
  v3 = [(SHUDPillViewController *)self trailingPillButton];
  [(SHUDPillViewController *)self setBannerButton:v3];
  v19 = [(SHUDPillViewController *)self leadingImage];
  id v4 = [objc_alloc((Class)UIImageView) initWithImage:v19];
  objc_msgSend(v4, "setContentMode:", -[SHUDPillViewController imageContentMode](self, "imageContentMode"));
  unsigned int v5 = [(SHUDPillViewController *)self needsButton];
  id v6 = objc_alloc(off_10001CEB0());
  if (v5) {
    id v7 = [v6 initWithLeadingAccessoryView:v4 trailingAccessoryView:v3];
  }
  else {
    id v7 = [v6 initWithLeadingAccessoryView:v4];
  }
  id v8 = v7;
  id v9 = [(SHUDPillViewController *)self title];
  v10 = [(SHUDPillViewController *)self subtitle];
  NSAttributedStringKey v11 = [(SHUDPillViewController *)self formattedTitle:v9];
  id v12 = [(SHUDPillViewController *)self formattedSubtitle:v10];
  v21[0] = v11;
  v21[1] = v12;
  v13 = +[NSArray arrayWithObjects:v21 count:2];
  [v8 setCenterContentItems:v13];

  [(SHUDPillViewController *)self setPillView:v8];
  v14 = [(SHUDPillViewController *)self pillView];
  [(SHUDPillViewController *)self setContentSizeProvidingView:v14];

  id v15 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"handleTap:"];
  v16 = [(SHUDPillViewController *)self pillView];
  [v16 addGestureRecognizer:v15];

  v17 = [(SHUDPillViewController *)self view];
  v18 = [(SHUDPillViewController *)self pillView];
  [v17 addSubview:v18];
}

- (void)viewDidLoad
{
  v39.receiver = self;
  v39.super_class = (Class)SHUDPillViewController;
  [(SHUDPillViewController *)&v39 viewDidLoad];
  v3 = [(SHUDPillViewController *)self pillView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  v38 = [(SHUDPillViewController *)self pillView];
  v36 = [v38 leadingAnchor];
  v37 = [(SHUDPillViewController *)self view];
  v35 = [v37 leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v40[0] = v34;
  v33 = [(SHUDPillViewController *)self pillView];
  v31 = [v33 trailingAnchor];
  v32 = [(SHUDPillViewController *)self view];
  v30 = [v32 trailingAnchor];
  v29 = [v31 constraintEqualToAnchor:v30];
  v40[1] = v29;
  v28 = [(SHUDPillViewController *)self pillView];
  v26 = [v28 bottomAnchor];
  v27 = [(SHUDPillViewController *)self view];
  id v4 = [v27 bottomAnchor];
  unsigned int v5 = [v26 constraintEqualToAnchor:v4];
  v40[2] = v5;
  id v6 = [(SHUDPillViewController *)self pillView];
  id v7 = [v6 topAnchor];
  id v8 = [(SHUDPillViewController *)self view];
  id v9 = [v8 topAnchor];
  v10 = [v7 constraintEqualToAnchor:v9];
  v40[3] = v10;
  NSAttributedStringKey v11 = +[NSArray arrayWithObjects:v40 count:4];
  id v12 = [v11 mutableCopy];

  v13 = +[UITraitCollection currentTraitCollection];
  v14 = [v13 preferredContentSizeCategory];
  NSComparisonResult v15 = UIContentSizeCategoryCompareToCategory(UIContentSizeCategoryExtraExtraExtraLarge, v14);

  if (v15 != NSOrderedAscending && [(SHUDPillViewController *)self needsButton])
  {
    v16 = [(SHUDPillViewController *)self bannerButton];
    v17 = [v16 topAnchor];
    v18 = [(SHUDPillViewController *)self pillView];
    v19 = [v18 topAnchor];
    objc_super v20 = [v17 constraintEqualToAnchor:v19 constant:8.0];
    [v12 addObject:v20];

    v21 = [(SHUDPillViewController *)self bannerButton];
    v22 = [v21 bottomAnchor];
    v23 = [(SHUDPillViewController *)self pillView];
    v24 = [v23 bottomAnchor];
    v25 = [v22 constraintEqualToAnchor:v24 constant:-8.0];
    [v12 addObject:v25];
  }
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(SHUDPillViewController *)self pillView];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  v10 = [(SHUDPillViewController *)self bannerButton];
  NSAttributedStringKey v11 = [(SHUDPillViewController *)self pillView];
  objc_msgSend(v10, "convertPoint:fromView:", v11, v7, v9);
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v16 = [(SHUDPillViewController *)self bannerButton];
  [v16 bounds];
  v18.x = v13;
  v18.y = v15;
  LODWORD(v11) = CGRectContainsPoint(v19, v18);

  if (v11)
  {
    [(SHUDPillViewController *)self handleButtonTapped];
  }
}

- (UIEdgeInsets)bannerContentOutsets
{
  [(SHUDPillViewController *)self loadViewIfNeeded];
  v3 = [(SHUDPillViewController *)self pillView];
  [v3 shadowOutsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (void)updateUI
{
  v3 = [(SHUDPillViewController *)self title];
  double v4 = [(SHUDPillViewController *)self subtitle];
  double v5 = [(SHUDPillViewController *)self formattedTitle:v3];
  double v6 = [(SHUDPillViewController *)self formattedSubtitle:v4];
  double v7 = [(SHUDPillViewController *)self pillView];
  v9[0] = v5;
  v9[1] = v6;
  double v8 = +[NSArray arrayWithObjects:v9 count:2];
  [v7 setCenterContentItems:v8];
}

- (id)leadingImage
{
  return 0;
}

- (int64_t)imageContentMode
{
  return 2;
}

- (id)title
{
  return 0;
}

- (id)subtitle
{
  return 0;
}

- (int64_t)subtitleAlignment
{
  return 4;
}

- (id)trailingButton
{
  return 0;
}

- (UIView)contentSizeProvidingView
{
  return self->_contentSizeProvidingView;
}

- (void)setContentSizeProvidingView:(id)a3
{
}

- (UIButton)bannerButton
{
  return self->_bannerButton;
}

- (void)setBannerButton:(id)a3
{
}

- (BOOL)needsButton
{
  return self->_needsButton;
}

- (void)setNeedsButton:(BOOL)a3
{
  self->_needsButton = a3;
}

- (id)viewDidAppearHandler
{
  return self->_viewDidAppearHandler;
}

- (void)setViewDidAppearHandler:(id)a3
{
}

- (id)viewDidDisappearHandler
{
  return self->_viewDidDisappearHandler;
}

- (void)setViewDidDisappearHandler:(id)a3
{
}

- (id)buttonTapped
{
  return self->_buttonTapped;
}

- (void)setButtonTapped:(id)a3
{
}

- (PLPillView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong(&self->_buttonTapped, 0);
  objc_storeStrong(&self->_viewDidDisappearHandler, 0);
  objc_storeStrong(&self->_viewDidAppearHandler, 0);
  objc_storeStrong((id *)&self->_bannerButton, 0);
  objc_storeStrong((id *)&self->_contentSizeProvidingView, 0);
}

@end