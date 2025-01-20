@interface MeCardShortcutViewController
- (BOOL)_isMapUserShortcut;
- (MeCardShortcutViewController)initWithShortcutEditSession:(id)a3;
- (ShortcutEditSessionController)sessionController;
- (UIButton)contactCardButton;
- (id)shortcut;
- (void)_buildContent;
- (void)_close;
- (void)_doneAction:(id)a3;
- (void)_updateFonts;
- (void)_updatePreferredContentSize;
- (void)setSessionController:(id)a3;
- (void)updateContact;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MeCardShortcutViewController

- (MeCardShortcutViewController)initWithShortcutEditSession:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MeCardShortcutViewController;
  v6 = [(MeCardShortcutViewController *)&v11 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    v8 = [(ContaineeViewController *)v6 cardPresentationController];
    [v8 setPresentedModally:1];

    v9 = [(ContaineeViewController *)v7 cardPresentationController];
    [v9 setTakesAvailableHeight:1];

    objc_storeStrong((id *)&v7->_shortcutEditSession, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v93.receiver = self;
  v93.super_class = (Class)MeCardShortcutViewController;
  [(ContaineeViewController *)&v93 viewDidLoad];
  v3 = +[UIColor clearColor];
  v4 = [(MeCardShortcutViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [(ContaineeViewController *)self headerView];
  v6 = [(ContaineeViewController *)self contentView];
  if (sub_1000BBB44(self) == 5) {
    v7 = objc_alloc_init(OverridenBackgroundColorButton);
  }
  else {
    v7 = +[OverridenBackgroundColorButton newChromeBlueButton];
  }
  v8 = v7;
  [(OverridenBackgroundColorButton *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"[Shortcut] Open My Contact Card" value:@"localized string not found" table:0];
  [(OverridenBackgroundColorButton *)v8 setTitle:v10 forState:0];

  objc_super v11 = [(OverridenBackgroundColorButton *)v8 titleLabel];
  [v11 setNumberOfLines:2];

  [(OverridenBackgroundColorButton *)v8 addTarget:self action:"_doneAction:" forControlEvents:0x2000];
  [v6 addSubview:v8];
  objc_storeStrong((id *)&self->_contactCardButton, v8);
  v12 = [(MeCardShortcutViewController *)self traitCollection];
  id v91 = [v12 userInterfaceIdiom];

  v13 = [(MeCardShortcutViewController *)self traitCollection];
  if ([v13 userInterfaceIdiom] == (id)5) {
    double v14 = 17.0;
  }
  else {
    double v14 = 0.0;
  }

  v15 = [(MeCardShortcutViewController *)self traitCollection];
  id v89 = [v15 userInterfaceIdiom];

  v16 = [(MeCardShortcutViewController *)self traitCollection];
  id v87 = [v16 userInterfaceIdiom];

  v17 = [(OverridenBackgroundColorButton *)v8 layer];
  [v17 setCornerRadius:7.5];

  uint64_t v18 = sub_1000BBB44(self);
  v19 = [(OverridenBackgroundColorButton *)v8 titleLabel];
  v20 = v19;
  v21 = v6;
  v86 = self;
  if (v18 == 5)
  {
    [v19 setTextAlignment:4];

    [(OverridenBackgroundColorButton *)v8 setContentHorizontalAlignment:4];
    v22 = +[UIColor _maps_keyColor];
    [(OverridenBackgroundColorButton *)v8 setTitleColor:v22 forState:0];

    v23 = (ModalCardHeaderView *)objc_alloc_init((Class)UILabel);
    v24 = +[NSBundle mainBundle];
    v25 = [v24 localizedStringForKey:@"[Shortcut] Set up your Contact Card" value:@"localized string not found" table:0];
    [(ModalCardHeaderView *)v23 setText:v25];

    [(ModalCardHeaderView *)v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v21 addSubview:v23];
    v26 = +[UIColor labelColor];
    [(ModalCardHeaderView *)v23 setTextColor:v26];

    v27 = +[UIFont system20Semibold];
    [(ModalCardHeaderView *)v23 setFont:v27];

    v28 = v23;
    [(ModalCardHeaderView *)v23 setNumberOfLines:0];
    v29 = (AutoLayoutScrollView *)objc_alloc_init((Class)UIView);
    [(AutoLayoutScrollView *)v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v21 addSubview:v29];
    objc_storeStrong((id *)&self->_meCardContainerView, v29);
    v30 = [(MeCardShortcutViewController *)self view];
    v31 = [v30 widthAnchor];
    v32 = [(ModalCardHeaderView *)v31 constraintEqualToConstant:v14 + v14 + 256.0];
    [(AutoLayoutScrollView *)v32 setActive:1];
  }
  else
  {
    [v19 setTextAlignment:1];

    v33 = [ModalCardHeaderView alloc];
    v34 = +[ModalCardHeaderConfiguration leadingAlignedTitleModalCardHeaderConfiguration];
    v35 = [(ModalCardHeaderView *)v33 initWithConfiguration:v34];

    [(ModalCardHeaderView *)v35 setUseAdaptiveFont:1];
    [(ModalCardHeaderView *)v35 setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = +[NSBundle mainBundle];
    v37 = [v36 localizedStringForKey:@"[Shortcut] Set up Contact Card" value:@"localized string not found" table:0];
    [(ModalCardHeaderView *)v35 setTitle:v37];

    v38 = [(ModalCardHeaderView *)v35 trailingButton];
    v39 = sub_100AEBDC4();
    [v38 setTitle:v39 forState:0];

    v40 = [(ModalCardHeaderView *)v35 trailingButton];
    [v40 addTarget:self action:"_close" forControlEvents:0x2000];

    [v5 addSubview:v35];
    objc_storeStrong((id *)&self->_modalHeaderView, v35);
    v31 = v35;
    v41 = -[AutoLayoutScrollView initWithFrame:]([AutoLayoutScrollView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    LODWORD(v42) = 1148846080;
    [(AutoLayoutScrollView *)v41 setContentOverflowCompressionPriority:0 forAxis:v42];
    [(AutoLayoutScrollView *)v41 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 addSubview:v41];
    objc_storeStrong((id *)&self->_scrollView, v41);
    v32 = v41;
    v43 = [(OverridenBackgroundColorButton *)v8 heightAnchor];
    v44 = [v43 constraintEqualToConstant:0.0];
    contactCardButtonHeightConstraint = self->_contactCardButtonHeightConstraint;
    self->_contactCardButtonHeightConstraint = v44;

    v95 = self->_contactCardButtonHeightConstraint;
    v30 = +[NSArray arrayWithObjects:&v95 count:1];
    +[NSLayoutConstraint activateConstraints:v30];
    v29 = v32;
    v28 = v31;
  }
  v69 = v28;
  v71 = v29;

  if (v87 == (id)5) {
    double v46 = 7.0;
  }
  else {
    double v46 = 10.0;
  }
  if (v89 == (id)5) {
    double v47 = 14.0;
  }
  else {
    double v47 = 0.0;
  }
  if (v91 == (id)5) {
    double v48 = 13.0;
  }
  else {
    double v48 = 0.0;
  }
  v92 = [(ModalCardHeaderView *)v28 topAnchor];
  v90 = [v5 topAnchor];
  v88 = [v92 constraintEqualToAnchor:v90 constant:v48];
  v94[0] = v88;
  v85 = [(ModalCardHeaderView *)v28 leadingAnchor];
  v84 = [v5 leadingAnchor];
  v83 = [v85 constraintEqualToAnchor:v84 constant:v14];
  v94[1] = v83;
  v82 = [(ModalCardHeaderView *)v28 trailingAnchor];
  v81 = [v5 trailingAnchor];
  v80 = [v82 constraintEqualToAnchor:v81 constant:-v14];
  v94[2] = v80;
  v79 = [(ModalCardHeaderView *)v28 bottomAnchor];
  v78 = [v5 bottomAnchor];
  v77 = [v79 constraintEqualToAnchor:v78 constant:-v47];
  v94[3] = v77;
  v76 = [(AutoLayoutScrollView *)v29 topAnchor];
  v75 = [v21 topAnchor];
  v74 = [v76 constraintEqualToAnchor:v75];
  v94[4] = v74;
  v72 = [(AutoLayoutScrollView *)v29 leadingAnchor];
  v70 = [v21 leadingAnchor];
  v66 = [v72 constraintEqualToAnchor:v70];
  v94[5] = v66;
  v65 = [(AutoLayoutScrollView *)v29 trailingAnchor];
  v64 = [v21 trailingAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v94[6] = v63;
  v62 = [(AutoLayoutScrollView *)v29 bottomAnchor];
  v61 = [(OverridenBackgroundColorButton *)v8 topAnchor];
  v60 = [v62 constraintEqualToAnchor:v61 constant:-v46];
  v94[7] = v60;
  v59 = [(OverridenBackgroundColorButton *)v8 bottomAnchor];
  v49 = [v21 safeAreaLayoutGuide];
  v50 = [v49 bottomAnchor];
  v51 = [v59 constraintEqualToAnchor:v50 constant:-10.0];
  v94[8] = v51;
  v68 = v8;
  v52 = [(OverridenBackgroundColorButton *)v8 leadingAnchor];
  [v21 leadingAnchor];
  v53 = v73 = v5;
  v54 = [v52 constraintEqualToAnchor:v53 constant:16.0];
  v94[9] = v54;
  v55 = [(OverridenBackgroundColorButton *)v8 trailingAnchor];
  [v21 trailingAnchor];
  v56 = v67 = v21;
  v57 = [v55 constraintEqualToAnchor:v56 constant:-16.0];
  v94[10] = v57;
  v58 = +[NSArray arrayWithObjects:v94 count:11];
  +[NSLayoutConstraint activateConstraints:v58];

  [(MeCardShortcutViewController *)v86 _buildContent];
}

- (void)_updatePreferredContentSize
{
  if (sub_1000BBB44(self) == 5)
  {
    [(MeCardShortcutViewController *)self preferredContentSize];
    double v4 = v3;
    double v6 = v5;
    v7 = [(MeCardShortcutViewController *)self view];
    [v7 systemLayoutSizeFittingSize:UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height];
    double v9 = v8;
    double v11 = v10;

    if (v4 != v9 || v6 != v11)
    {
      -[MeCardShortcutViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, v11);
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MeCardShortcutViewController;
  [(MeCardShortcutViewController *)&v6 viewDidAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionController);
  double v5 = [WeakRetained meCardContact];
  [(MeCardShortcutView *)self->_meCardAvatar setContact:v5];
}

- (UIButton)contactCardButton
{
  return (UIButton *)self->_contactCardButton;
}

- (void)updateContact
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionController);
  double v3 = [WeakRetained meCardContact];
  [(MeCardShortcutView *)self->_meCardAvatar setContact:v3];
}

- (id)shortcut
{
  return [(ShortcutEditSession *)self->_shortcutEditSession shortcut];
}

- (BOOL)_isMapUserShortcut
{
  v2 = [(MeCardShortcutViewController *)self shortcut];
  BOOL v3 = [v2 type] == (id)1;

  return v3;
}

- (void)_buildContent
{
  if (sub_1000BBB44(self) == 5)
  {
    BOOL v3 = self->_meCardContainerView;
  }
  else
  {
    BOOL v3 = [(AutoLayoutScrollView *)self->_scrollView contentView];
  }
  double v4 = v3;
  double v5 = [MeCardShortcutView alloc];
  objc_super v6 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionController);
  double v8 = [WeakRetained meCardContact];
  double v9 = [(MeCardShortcutView *)v5 initWithContact:v8];

  [(MeCardShortcutView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v4 addSubview:v9];
  double v10 = v9;
  objc_storeStrong((id *)&v6->_meCardAvatar, v9);
  id v11 = objc_alloc_init((Class)UILabel);
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v4 addSubview:v11];
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"[Shortcut] Contact Card title" value:@"localized string not found" table:0];
  [v11 setText:v13];

  [v11 setNumberOfLines:0];
  objc_storeStrong((id *)&v6->_titleLabel, v11);
  id v14 = objc_alloc_init((Class)UILabel);
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v4 addSubview:v14];
  v15 = +[NSBundle mainBundle];
  v16 = [v15 localizedStringForKey:@"[Shortcut] Contact Card Update" value:@"localized string not found" table:0];
  [v14 setText:v16];

  v17 = +[UIColor secondaryLabelColor];
  [v14 setTextColor:v17];

  [v14 setNumberOfLines:0];
  uint64_t v18 = v6;
  objc_storeStrong((id *)&v6->_subtitleLabel, v14);
  v19 = [(MeCardShortcutViewController *)v6 traitCollection];
  id v20 = [v19 userInterfaceIdiom];

  v64 = v6;
  v21 = [(MeCardShortcutViewController *)v6 traitCollection];
  id v22 = [v21 userInterfaceIdiom];

  v23 = [(MeCardShortcutViewController *)v6 traitCollection];
  id v24 = [v23 userInterfaceIdiom];

  if (sub_1000BBB44(v18) == 5) {
    uint64_t v25 = 4;
  }
  else {
    uint64_t v25 = 1;
  }
  [v11 setTextAlignment:v25];
  [v14 setTextAlignment:v25];
  if (v24 == (id)5) {
    double v26 = 14.0;
  }
  else {
    double v26 = 10.0;
  }
  if (v22 == (id)5) {
    double v27 = 4.0;
  }
  else {
    double v27 = 10.0;
  }
  if (v20 == (id)5) {
    double v28 = 17.0;
  }
  else {
    double v28 = 24.0;
  }
  v63 = [(MeCardShortcutView *)v10 topAnchor];
  v61 = [(UIView *)v4 topAnchor];
  v60 = [v63 constraintEqualToAnchor:v61];
  v65[0] = v60;
  v59 = [(MeCardShortcutView *)v10 leadingAnchor];
  v58 = [(UIView *)v4 leadingAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v65[1] = v57;
  v62 = v10;
  v56 = [(MeCardShortcutView *)v10 trailingAnchor];
  v54 = [(UIView *)v4 trailingAnchor];
  v53 = [v56 constraintEqualToAnchor:v54];
  v65[2] = v53;
  v52 = [v11 topAnchor];
  v51 = [(MeCardShortcutView *)v10 bottomAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:v26];
  v65[3] = v50;
  double v48 = [v11 leadingAnchor];
  double v47 = [(UIView *)v4 leadingAnchor];
  double v46 = [v48 constraintEqualToAnchor:v47 constant:v28];
  v65[4] = v46;
  v55 = v11;
  v45 = [v11 trailingAnchor];
  v49 = v4;
  v44 = [(UIView *)v4 trailingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44 constant:-v28];
  v65[5] = v43;
  double v42 = [v14 topAnchor];
  v41 = [v11 bottomAnchor];
  v40 = [v42 constraintEqualToAnchor:v41 constant:v27];
  v65[6] = v40;
  v39 = [v14 leadingAnchor];
  v29 = [(UIView *)v4 leadingAnchor];
  v30 = [v39 constraintEqualToAnchor:v29 constant:v28];
  v65[7] = v30;
  v31 = [v14 trailingAnchor];
  v32 = [(UIView *)v4 trailingAnchor];
  v33 = [v31 constraintEqualToAnchor:v32 constant:-v28];
  v65[8] = v33;
  v34 = [v14 bottomAnchor];
  v35 = [(UIView *)v4 bottomAnchor];
  v36 = [v34 constraintLessThanOrEqualToAnchor:v35];
  v65[9] = v36;
  v37 = +[NSArray arrayWithObjects:v65 count:10];
  +[NSLayoutConstraint activateConstraints:v37];

  v38 = +[NSNotificationCenter defaultCenter];
  [v38 addObserver:v64 selector:"_contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];

  [(MeCardShortcutViewController *)v64 _updateFonts];
  [(MeCardShortcutViewController *)v64 _updatePreferredContentSize];
}

- (void)_updateFonts
{
  if (sub_1000BBB44(self) == 5)
  {
    BOOL v3 = +[UIFont system17Tall];
    [(UILabel *)self->_titleLabel setFont:v3];

    double v4 = +[UIFont system17Tall];
    [(UILabel *)self->_subtitleLabel setFont:v4];

    id v10 = +[UIFont system17Tall];
    double v5 = [(OverridenBackgroundColorButton *)self->_contactCardButton titleLabel];
    [v5 setFont:v10];
  }
  else
  {
    objc_super v6 = +[UIFont system17Bold];
    [(UILabel *)self->_titleLabel setFont:v6];

    v7 = +[UIFont system15];
    [(UILabel *)self->_subtitleLabel setFont:v7];

    double v8 = +[UIFont system15Bold];
    double v9 = [(OverridenBackgroundColorButton *)self->_contactCardButton titleLabel];
    [v9 setFont:v8];

    id v10 = [(OverridenBackgroundColorButton *)self->_contactCardButton titleLabel];
    double v5 = [v10 font];
    [v5 _mapkit_scaledValueForValue:54.0];
    -[NSLayoutConstraint setConstant:](self->_contactCardButtonHeightConstraint, "setConstant:");
  }
}

- (void)_close
{
  id v3 = [(MeCardShortcutViewController *)self sessionController];
  [v3 closeViewController:self];
}

- (void)_doneAction:(id)a3
{
  double v4 = +[AddressBookManager sharedManager];
  unsigned int v5 = [v4 meCardExists];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionController);
  contactCardButton = self->_contactCardButton;
  id v8 = WeakRetained;
  if (v5) {
    [WeakRetained showMeCardWithAddress:0 from:contactCardButton];
  }
  else {
    [WeakRetained presentChoicePickerFrom:contactCardButton];
  }
}

- (ShortcutEditSessionController)sessionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionController);

  return (ShortcutEditSessionController *)WeakRetained;
}

- (void)setSessionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionController);
  objc_storeStrong((id *)&self->_meCardAvatar, 0);
  objc_storeStrong((id *)&self->_contactCardButtonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contactCardButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_meCardContainerView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);

  objc_storeStrong((id *)&self->_modalHeaderView, 0);
}

@end