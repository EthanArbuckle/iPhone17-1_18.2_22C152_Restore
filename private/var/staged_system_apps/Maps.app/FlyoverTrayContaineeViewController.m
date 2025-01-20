@interface FlyoverTrayContaineeViewController
- (BackgroundColorButton)tourButton;
- (FlyoverActionCoordination)delegate;
- (FlyoverTrayContaineeViewController)initWithMapItem:(id)a3;
- (FlyoverTrayHeader)headerView;
- (MKMapItem)mapItem;
- (NSString)startTourTitle;
- (UIView)panelView;
- (double)heightForLayout:(unint64_t)a3;
- (id)contentView;
- (unint64_t)tourButtonState;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)resetFlyoverTour;
- (void)setDelegate:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setPanelView:(id)a3;
- (void)setStartTourTitle:(id)a3;
- (void)setTourButton:(id)a3;
- (void)setTourButtonState:(unint64_t)a3;
- (void)tourButtonTapped:(id)a3;
- (void)trayHeaderButtonDidTouchUpInside:(id)a3;
- (void)trayHeaderDidReceiveTap;
- (void)updateTheme;
- (void)viewDidLoad;
@end

@implementation FlyoverTrayContaineeViewController

- (FlyoverTrayContaineeViewController)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FlyoverTrayContaineeViewController;
  v6 = [(FlyoverTrayContaineeViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
  }

  return v7;
}

- (void)resetFlyoverTour
{
  [(BackgroundColorButton *)self->_tourButton setTitle:self->_startTourTitle forState:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  unsigned int v3 = [WeakRetained isFlyoverUnificationEnabled];
  unint64_t v4 = 1;
  if (v3) {
    unint64_t v4 = 2;
  }
  self->_tourButtonState = v4;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)FlyoverTrayContaineeViewController;
  [(ContaineeViewController *)&v7 viewDidLoad];
  id WeakRetained = +[VKPlatform sharedPlatform];
  unsigned __int8 v4 = [WeakRetained supportsARMode];

  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v5 = [WeakRetained isFlyoverUnificationEnabled] ^ 1;
  }
  v6 = [(ContaineeViewController *)self cardPresentationController];
  [v6 setPresentedModally:v5];

  if ((v4 & 1) == 0) {
  [(FlyoverTrayContaineeViewController *)self _setupViews];
  }
  [(FlyoverTrayContaineeViewController *)self _setupConstraints];
}

- (void)_setupViews
{
  unsigned int v3 = [(FlyoverTrayContaineeViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  unsigned __int8 v4 = [(FlyoverTrayContaineeViewController *)self view];
  [v4 setAccessibilityIdentifier:@"FlyoverTray"];

  uint64_t v5 = [FlyoverTrayHeader alloc];
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  objc_super v9 = -[FlyoverTrayHeader initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  headerView = self->_headerView;
  self->_headerView = v9;

  [(FlyoverTrayHeader *)self->_headerView setDelegate:self];
  [(FlyoverTrayHeader *)self->_headerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v11 = self->_headerView;
  v12 = [(MKMapItem *)self->_mapItem name];
  [(FlyoverTrayHeader *)v11 setTitle:v12];

  v13 = +[VKPlatform sharedPlatform];
  if ([v13 supportsARMode])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v15 = [WeakRetained isFlyoverUnificationEnabled];

    if ((v15 & 1) == 0)
    {
      v16 = +[NSBundle mainBundle];
      v17 = v16;
      CFStringRef v18 = @"Flyover [Minimized Card Subtitle]";
      goto LABEL_6;
    }
  }
  else
  {
  }
  v16 = +[NSBundle mainBundle];
  v17 = v16;
  CFStringRef v18 = @"Flyover Tour [Minimized Card Subtitle]";
LABEL_6:
  id v36 = [v16 localizedStringForKey:v18 value:@"localized string not found" table:0];

  [(FlyoverTrayHeader *)self->_headerView setSubtitle:v36];
  v19 = [(FlyoverTrayContaineeViewController *)self view];
  [v19 addSubview:self->_headerView];

  v20 = +[VKPlatform sharedPlatform];
  unsigned int v21 = [v20 supportsARMode];

  if (v21)
  {
    v22 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    panelView = self->_panelView;
    self->_panelView = v22;

    [(UIView *)self->_panelView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_panelView setAccessibilityIdentifier:@"FlyoverTrayPanel"];
    v24 = [(FlyoverTrayContaineeViewController *)self view];
    [v24 addSubview:self->_panelView];

    if ([(MKMapItem *)self->_mapItem _hasFlyover])
    {
      v25 = +[BackgroundColorButton buttonWithType:0];
      tourButton = self->_tourButton;
      self->_tourButton = v25;

      -[BackgroundColorButton setContentEdgeInsets:](self->_tourButton, "setContentEdgeInsets:", 0.0, 17.0, 0.0, 17.0);
      v27 = [(BackgroundColorButton *)self->_tourButton layer];
      [v27 setCornerRadius:8.0];

      [(BackgroundColorButton *)self->_tourButton setTranslatesAutoresizingMaskIntoConstraints:0];
      v28 = [(BackgroundColorButton *)self->_tourButton titleLabel];
      +[DynamicTypeWizard autorefreshLabel:v28 withFontProvider:&stru_1012E9018];

      [(BackgroundColorButton *)self->_tourButton addTarget:self action:"tourButtonTapped:" forControlEvents:64];
      if (qword_10160EBD0 != -1) {
        dispatch_once(&qword_10160EBD0, &stru_1012E9038);
      }
      id v29 = objc_loadWeakRetained((id *)&self->_delegate);
      unsigned __int8 v30 = [v29 isFlyoverUnificationEnabled];

      v31 = [(MKMapItem *)self->_mapItem _firstLocalizedCategoryName];
      v32 = v31;
      if (v30)
      {
        v33 = &qword_10160EBB8;
        unint64_t v34 = 2;
      }
      else
      {
        if (v31)
        {
          id v35 = [v31 length];
          v33 = &qword_10160EBC0;
          if (!v35) {
            v33 = &qword_10160EBC8;
          }
        }
        else
        {
          v33 = &qword_10160EBC8;
        }
        unint64_t v34 = 1;
      }
      objc_storeStrong((id *)&self->_startTourTitle, (id)*v33);
      [(BackgroundColorButton *)self->_tourButton setTitle:self->_startTourTitle forState:0];
      [(BackgroundColorButton *)self->_tourButton setAccessibilityIdentifier:@"FlyoverTrayTourButton"];
      [(UIView *)self->_panelView addSubview:self->_tourButton];
      self->_tourButtonState = v34;
    }
    [(FlyoverTrayContaineeViewController *)self updateTheme];
  }
}

- (void)_setupConstraints
{
  unsigned int v3 = +[VKPlatform sharedPlatform];
  unsigned __int8 v4 = [v3 supportsARMode];

  if (v4)
  {
    v59 = [(FlyoverTrayHeader *)self->_headerView topAnchor];
    v62 = [(FlyoverTrayContaineeViewController *)self view];
    v56 = [v62 topAnchor];
    v53 = [v59 constraintEqualToAnchor:v56];
    v68[0] = v53;
    v48 = [(FlyoverTrayHeader *)self->_headerView leadingAnchor];
    v50 = [(FlyoverTrayContaineeViewController *)self view];
    v47 = [v50 leadingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v68[1] = v46;
    v44 = [(FlyoverTrayHeader *)self->_headerView trailingAnchor];
    v45 = [(FlyoverTrayContaineeViewController *)self view];
    v43 = [v45 trailingAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v68[2] = v42;
    v41 = [(FlyoverTrayHeader *)self->_headerView bottomAnchor];
    v40 = [(UIView *)self->_panelView topAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v68[3] = v39;
    v37 = [(UIView *)self->_panelView leadingAnchor];
    v38 = [(FlyoverTrayContaineeViewController *)self view];
    id v36 = [v38 leadingAnchor];
    id v35 = [v37 constraintEqualToAnchor:v36];
    v68[4] = v35;
    uint64_t v5 = [(UIView *)self->_panelView trailingAnchor];
    v6 = [(FlyoverTrayContaineeViewController *)self view];
    objc_super v7 = [v6 trailingAnchor];
    v8 = [v5 constraintEqualToAnchor:v7];
    v68[5] = v8;
    objc_super v9 = [(UIView *)self->_panelView bottomAnchor];
    v10 = [(FlyoverTrayContaineeViewController *)self view];
    v11 = [v10 bottomAnchor];
    v12 = [v9 constraintEqualToAnchor:v11];
    v68[6] = v12;
    v13 = +[NSArray arrayWithObjects:v68 count:7];
    id v65 = [v13 mutableCopy];

    if ([(MKMapItem *)self->_mapItem _hasFlyover])
    {
      v63 = [(BackgroundColorButton *)self->_tourButton leadingAnchor];
      v60 = [(UIView *)self->_panelView leadingAnchor];
      v57 = [v63 constraintEqualToAnchor:v60 constant:16.0];
      v67[0] = v57;
      v54 = [(BackgroundColorButton *)self->_tourButton trailingAnchor];
      v51 = [(UIView *)self->_panelView trailingAnchor];
      v14 = [v54 constraintEqualToAnchor:v51 constant:-16.0];
      v67[1] = v14;
      unsigned __int8 v15 = [(BackgroundColorButton *)self->_tourButton heightAnchor];
      v16 = [v15 constraintGreaterThanOrEqualToConstant:52.0];
      v17 = +[DynamicTypeWizard autoscaledConstraint:v16 constant:&stru_1012E9018 withFontProvider:52.0];
      v67[2] = v17;
      CFStringRef v18 = [(BackgroundColorButton *)self->_tourButton titleLabel];
      v19 = [v18 firstBaselineAnchor];
      v20 = [(UIView *)self->_panelView topAnchor];
      unsigned int v21 = [v19 constraintEqualToAnchor:v20];
      v22 = +[DynamicTypeWizard autoscaledConstraint:v21 constant:&stru_1012E9018 withFontProvider:32.0];
      v67[3] = v22;
      v23 = +[NSArray arrayWithObjects:v67 count:4];
      [v65 addObjectsFromArray:v23];
    }
    v24 = v65;
    +[NSLayoutConstraint activateConstraints:v65];
  }
  else
  {
    v66 = [(FlyoverTrayHeader *)self->_headerView topAnchor];
    v64 = [(FlyoverTrayContaineeViewController *)self view];
    v61 = [v64 topAnchor];
    v58 = [v66 constraintEqualToAnchor:v61];
    v69[0] = v58;
    v52 = [(FlyoverTrayHeader *)self->_headerView leadingAnchor];
    v55 = [(FlyoverTrayContaineeViewController *)self view];
    v49 = [v55 leadingAnchor];
    v25 = [v52 constraintEqualToAnchor:v49];
    v69[1] = v25;
    v26 = [(FlyoverTrayHeader *)self->_headerView trailingAnchor];
    v27 = [(FlyoverTrayContaineeViewController *)self view];
    v28 = [v27 trailingAnchor];
    id v29 = [v26 constraintEqualToAnchor:v28];
    v69[2] = v29;
    unsigned __int8 v30 = [(FlyoverTrayHeader *)self->_headerView bottomAnchor];
    v31 = [(FlyoverTrayContaineeViewController *)self view];
    v32 = [v31 bottomAnchor];
    v33 = [v30 constraintEqualToAnchor:v32];
    v69[3] = v33;
    unint64_t v34 = +[NSArray arrayWithObjects:v69 count:4];
    +[NSLayoutConstraint activateConstraints:v34];

    v24 = v66;
  }
}

- (void)updateTheme
{
  if ([(MKMapItem *)self->_mapItem _hasFlyover])
  {
    tourButton = self->_tourButton;
    unsigned __int8 v4 = [(FlyoverTrayContaineeViewController *)self theme];
    uint64_t v5 = [v4 flyoverTourButtonBackgroundColor:0];
    [(BackgroundColorButton *)tourButton setBackgroundColor:v5 forState:0];

    v6 = self->_tourButton;
    objc_super v7 = [(FlyoverTrayContaineeViewController *)self theme];
    v8 = [v7 flyoverTourButtonBackgroundColor:1];
    [(BackgroundColorButton *)v6 setBackgroundColor:v8 forState:1];

    objc_super v9 = self->_tourButton;
    v10 = [(FlyoverTrayContaineeViewController *)self theme];
    v11 = [v10 keyColor];
    [(BackgroundColorButton *)v9 setTitleColor:v11 forState:0];

    v12 = self->_tourButton;
    id v14 = [(FlyoverTrayContaineeViewController *)self theme];
    v13 = [v14 darkKeyColor];
    [(BackgroundColorButton *)v12 setTitleColor:v13 forState:1];
  }
}

- (void)tourButtonTapped:(id)a3
{
  id v4 = a3;
  if (qword_10160EBE8 != -1)
  {
    id v8 = v4;
    dispatch_once(&qword_10160EBE8, &stru_1012E9058);
    id v4 = v8;
  }
  unint64_t tourButtonState = self->_tourButtonState;
  switch(tourButtonState)
  {
    case 3uLL:
      id v7 = v4;
      [(BackgroundColorButton *)self->_tourButton setTitle:qword_10160EBD8 forState:0];
      self->_unint64_t tourButtonState = 2;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained flyoverTourResume];
      break;
    case 2uLL:
      id v7 = v4;
      [(BackgroundColorButton *)self->_tourButton setTitle:qword_10160EBE0 forState:0];
      self->_unint64_t tourButtonState = 3;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained flyoverTourPause];
      break;
    case 1uLL:
      id v7 = v4;
      [(BackgroundColorButton *)self->_tourButton setTitle:qword_10160EBD8 forState:0];
      self->_unint64_t tourButtonState = 2;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained flyoverTourPlay];
      break;
    default:
      goto LABEL_10;
  }

  id v4 = v7;
LABEL_10:
}

- (void)trayHeaderButtonDidTouchUpInside:(id)a3
{
  id v4 = [(FlyoverTrayContaineeViewController *)self delegate];
  [v4 viewControllerEndFlyover:self];

  id v6 = [(FlyoverTrayContaineeViewController *)self delegate];
  uint64_t v5 = [v6 appCoordinator];
  [v5 exitFlyover];
}

- (void)trayHeaderDidReceiveTap
{
  unsigned int v3 = +[VKPlatform sharedPlatform];
  if ([v3 supportsARMode])
  {
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned int v5 = [WeakRetained isFlyoverUnificationEnabled];

    if (!v5) {
      return;
    }
  }
  id v6 = [(ContaineeViewController *)self cardPresentationController];
  id v7 = [v6 containeeLayout];

  if (v7 == (id)1)
  {
    id v8 = [(ContaineeViewController *)self cardPresentationController];
    id v10 = v8;
    uint64_t v9 = 2;
  }
  else
  {
    if (v7 != (id)2) {
      return;
    }
    id v8 = [(ContaineeViewController *)self cardPresentationController];
    id v10 = v8;
    uint64_t v9 = 1;
  }
  [v8 wantsLayout:v9];
}

- (FlyoverTrayHeader)headerView
{
  return self->_headerView;
}

- (id)contentView
{
  return self->_tourButton;
}

- (double)heightForLayout:(unint64_t)a3
{
  unsigned int v5 = [(ContaineeViewController *)self cardPresentationController];
  [v5 bottomSafeOffset];
  double v7 = v6;

  if (a3 == 1)
  {
LABEL_8:
    [(ContaineeViewController *)self headerHeight];
    return v7 + v12;
  }
  if (a3 == 5 || (double result = -1.0, a3 == 2))
  {
    tourButton = self->_tourButton;
    if (tourButton)
    {
      -[BackgroundColorButton systemLayoutSizeFittingSize:](tourButton, "systemLayoutSizeFittingSize:", CGSizeZero.width, CGSizeZero.height);
      double v11 = v10 + 15.0;
    }
    else
    {
      double v11 = 15.0;
    }
    double v7 = v7 + v11;
    goto LABEL_8;
  }
  return result;
}

- (FlyoverActionCoordination)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FlyoverActionCoordination *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setHeaderView:(id)a3
{
}

- (UIView)panelView
{
  return self->_panelView;
}

- (void)setPanelView:(id)a3
{
}

- (BackgroundColorButton)tourButton
{
  return self->_tourButton;
}

- (void)setTourButton:(id)a3
{
}

- (unint64_t)tourButtonState
{
  return self->_tourButtonState;
}

- (void)setTourButtonState:(unint64_t)a3
{
  self->_unint64_t tourButtonState = a3;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (NSString)startTourTitle
{
  return self->_startTourTitle;
}

- (void)setStartTourTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTourTitle, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_tourButton, 0);
  objc_storeStrong((id *)&self->_panelView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end