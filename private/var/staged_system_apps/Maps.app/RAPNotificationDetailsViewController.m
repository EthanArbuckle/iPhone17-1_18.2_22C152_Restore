@interface RAPNotificationDetailsViewController
- (BOOL)_supportEdit;
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (RAPNotificationDetailsViewController)initWithViewModel:(id)a3 report:(id)a4 question:(id)a5;
- (RAPNotificationDetailsViewControllerDelegate)delegate;
- (UIButton)actionButton;
- (UICollectionView)collectionView;
- (_TtC4Maps31RAPNotificationDetailsViewModel)viewModel;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_dismissAndOpenReportsHome;
- (void)_done:(id)a3;
- (void)_initPhotoPicker;
- (void)_performButtonAction:(int)a3;
- (void)_send:(id)a3;
- (void)_setRAPRecordAsInReviewWithReportID:(id)a3;
- (void)_setupConstraints;
- (void)_setupHeaderButtons;
- (void)_setupViews;
- (void)_submitReport;
- (void)_updateDoneButton;
- (void)_updateSummarySection;
- (void)descriptionCellLinkButtonClick:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)macFooterViewLeftButtonTapped:(id)a3;
- (void)photoCarouselController:(id)a3 requestsRemovingImageForIdentifier:(id)a4 completion:(id)a5;
- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3;
- (void)setActionButton:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setViewModel:(id)a3;
- (void)textViewCellDidChangeWithTextViewCell:(id)a3 validatedText:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RAPNotificationDetailsViewController

- (RAPNotificationDetailsViewController)initWithViewModel:(id)a3 report:(id)a4 question:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RAPNotificationDetailsViewController;
  v12 = [(RAPNotificationDetailsViewController *)&v19 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewModel, a3);
    objc_storeStrong((id *)&v13->_report, a4);
    objc_storeStrong((id *)&v13->_question, a5);
    v14 = [UGCPhotoCarouselController alloc];
    v15 = [(RAPUserResponseQuestion *)v13->_question commentQuestion];
    v16 = -[UGCPhotoCarouselController initWithDelegate:maximumNumberOfPhotos:](v14, "initWithDelegate:maximumNumberOfPhotos:", v13, [v15 maximumNumberOfPhotos]);
    photoCarouselController = v13->_photoCarouselController;
    v13->_photoCarouselController = v16;

    [(RAPNotificationDetailsViewController *)v13 _initPhotoPicker];
  }

  return v13;
}

- (BOOL)_supportEdit
{
  return self->_report && self->_question;
}

- (void)_initPhotoPicker
{
  v3 = objc_alloc_init(RAPPhotoPickerController);
  photoPicker = self->_photoPicker;
  self->_photoPicker = v3;

  v5 = self->_photoCarouselController;
  v6 = [(RAPUserResponseQuestion *)self->_question commentQuestion];
  objc_initWeak(&location, self);
  v7 = self->_photoPicker;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10041A640;
  v10[3] = &unk_1012E9BA8;
  objc_copyWeak(&v13, &location);
  id v8 = v6;
  id v11 = v8;
  id v9 = v5;
  v12 = v9;
  [(RAPPhotoPickerController *)v7 addObserver:self changeHandler:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)viewDidLoad
{
  [(RAPNotificationDetailsViewController *)self _setupHeaderButtons];
  v10.receiver = self;
  v10.super_class = (Class)RAPNotificationDetailsViewController;
  [(RAPNotificationDetailsViewController *)&v10 viewDidLoad];
  if (sub_1000BBB44(self) == 5) {
    -[RAPNotificationDetailsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 390.0, 520.0);
  }
  [(RAPNotificationDetailsViewController *)self _setupViews];
  [(RAPNotificationDetailsViewController *)self _setupConstraints];
  v3 = [(RAPNotificationDetailsViewController *)self viewModel];
  v4 = [v3 rapRecord];

  if (v4)
  {
    [(RAPNotificationDetailsViewController *)self _updateSummarySection];
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = [(RAPNotificationDetailsViewController *)self viewModel];
    v6 = [v5 reportId];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10041A8DC;
    v7[3] = &unk_1012E9BD0;
    objc_copyWeak(&v8, &location);
    +[RAPRecordManager fetchRAPRecordsMatchingProblemId:v6 completion:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RAPNotificationDetailsViewController;
  [(RAPNotificationDetailsViewController *)&v6 viewWillAppear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RAPNotificationDetailsViewController;
  [(RAPNotificationDetailsViewController *)&v6 viewWillDisappear:a3];
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIKeyboardWillShowNotification object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:UIKeyboardWillHideNotification object:0];
}

- (void)_setupHeaderButtons
{
  v3 = [(RAPNotificationDetailsViewController *)self viewModel];
  unsigned int v4 = [v3 editMode];

  v5 = +[NSBundle mainBundle];
  objc_super v6 = [v5 localizedStringForKey:@"Reviewed Reports [RAP]" value:@"localized string not found" table:0];
  [(RAPNotificationDetailsViewController *)self setTitle:v6];

  id v7 = objc_alloc((Class)UIBarButtonItem);
  id v8 = v7;
  if (v4)
  {
    id v9 = +[NSBundle mainBundle];
    objc_super v10 = [v9 localizedStringForKey:@"Not Now [RAP]" value:@"localized string not found" table:0];
    id v11 = [v8 initWithTitle:v10 style:0 target:self action:"_done:"];
    v12 = [(RAPNotificationDetailsViewController *)self navigationItem];
    [v12 setLeftBarButtonItem:v11];

    id v13 = objc_alloc((Class)UIBarButtonItem);
    id v14 = +[NSBundle mainBundle];
    v15 = [v14 localizedStringForKey:@"Send [RAP]" value:@"localized string not found" table:0];
    id v16 = [v13 initWithTitle:v15 style:0 target:self action:"_send:"];
    v17 = [(RAPNotificationDetailsViewController *)self navigationItem];
    [v17 setRightBarButtonItem:v16];
  }
  else
  {
    id v14 = [v7 initWithBarButtonSystemItem:0 target:self action:"_done:"];
    v15 = [(RAPNotificationDetailsViewController *)self navigationItem];
    [v15 setRightBarButtonItem:v14];
  }

  [(RAPNotificationDetailsViewController *)self _updateDoneButton];
}

- (void)_updateDoneButton
{
  v3 = [(RAPNotificationDetailsViewController *)self viewModel];
  unsigned __int8 v4 = [v3 editMode];

  if ((v4 & 1) == 0) {
    goto LABEL_5;
  }
  v5 = [(RAPUserResponseQuestion *)self->_question commentQuestion];
  objc_super v6 = [v5 comment];
  if ([v6 length])
  {

LABEL_5:
    id v13 = [(RAPNotificationDetailsViewController *)self navigationItem];
    objc_super v10 = [v13 rightBarButtonItem];
    id v11 = v10;
    uint64_t v12 = 1;
    goto LABEL_6;
  }
  id v7 = [(RAPUserResponseQuestion *)self->_question commentQuestion];
  id v8 = [v7 photos];
  id v9 = [v8 count];

  if (v9) {
    goto LABEL_5;
  }
  id v13 = [(RAPNotificationDetailsViewController *)self navigationItem];
  objc_super v10 = [v13 rightBarButtonItem];
  id v11 = v10;
  uint64_t v12 = 0;
LABEL_6:
  [v10 setEnabled:v12];
}

- (void)_setupViews
{
  v3 = +[MapsTheme visualEffectViewAllowingBlur:1];
  blurView = self->_blurView;
  self->_blurView = v3;

  [(UIVisualEffectView *)self->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(RAPNotificationDetailsViewController *)self view];
  [v5 addSubview:self->_blurView];

  id v6 = [objc_alloc((Class)UICollectionViewCompositionalLayout) initWithSectionProvider:&stru_1012E9C10];
  id v7 = [objc_alloc((Class)UICollectionView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(RAPNotificationDetailsViewController *)self setCollectionView:v7];

  id v8 = [(RAPNotificationDetailsViewController *)self collectionView];
  [v8 setDataSource:self];

  id v9 = [(RAPNotificationDetailsViewController *)self collectionView];
  [v9 setDelegate:self];

  objc_super v10 = [(RAPNotificationDetailsViewController *)self collectionView];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = +[TwoLineCollectionViewListCell identifier];
  [v10 registerClass:v11 forCellWithReuseIdentifier:v12];

  id v13 = [(RAPNotificationDetailsViewController *)self collectionView];
  uint64_t v14 = objc_opt_class();
  v15 = +[RAPNotificationDetailsMapCell identifier];
  [v13 registerClass:v14 forCellWithReuseIdentifier:v15];

  id v16 = [(RAPNotificationDetailsViewController *)self collectionView];
  uint64_t v17 = objc_opt_class();
  v18 = +[RAPNotificationDescriptionCell identifier];
  [v16 registerClass:v17 forCellWithReuseIdentifier:v18];

  objc_super v19 = [(RAPNotificationDetailsViewController *)self collectionView];
  uint64_t v20 = objc_opt_class();
  v21 = +[RAPPhotoCarouselCollectionViewCell reuseIdentifier];
  [v19 registerClass:v20 forCellWithReuseIdentifier:v21];

  v22 = [(RAPNotificationDetailsViewController *)self collectionView];
  uint64_t v23 = objc_opt_class();
  v24 = +[RAPTextViewCollectionViewCell reuseIdentifier];
  [v22 registerClass:v23 forCellWithReuseIdentifier:v24];

  v25 = [(RAPNotificationDetailsViewController *)self collectionView];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  v29 = [(RAPNotificationDetailsViewController *)self collectionView];
  [v29 setContentInset:UIEdgeInsetsZero.top, left, bottom, right];

  v30 = [(RAPNotificationDetailsViewController *)self view];
  v31 = [(RAPNotificationDetailsViewController *)self collectionView];
  [v30 addSubview:v31];

  v32 = [(RAPNotificationDetailsViewController *)self viewModel];
  if (([v32 hasButton] & 1) == 0) {
    goto LABEL_4;
  }
  v33 = [(RAPNotificationDetailsViewController *)self viewModel];
  v34 = [v33 button];
  unsigned int v35 = [v34 buttonAction];

  if (v35)
  {
    v32 = +[UIButtonConfiguration grayButtonConfiguration];
    [v32 setButtonSize:3];
    objc_initWeak(&location, self);
    v45 = _NSConcreteStackBlock;
    uint64_t v46 = 3221225472;
    v47 = sub_10041B450;
    v48 = &unk_1012E8CD0;
    objc_copyWeak(&v49, &location);
    v36 = +[UIAction actionWithHandler:&v45];
    v37 = +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v32, v36, v45, v46, v47, v48);
    [(RAPNotificationDetailsViewController *)self setActionButton:v37];

    v38 = [(RAPNotificationDetailsViewController *)self actionButton];
    [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

    v39 = [(RAPNotificationDetailsViewController *)self actionButton];
    v40 = [(RAPNotificationDetailsViewController *)self viewModel];
    v41 = [v40 button];
    v42 = [v41 localizedText];
    [v39 setTitle:v42 forState:0];

    v43 = [(RAPNotificationDetailsViewController *)self view];
    v44 = [(RAPNotificationDetailsViewController *)self actionButton];
    [v43 addSubview:v44];

    objc_destroyWeak(&v49);
    objc_destroyWeak(&location);
LABEL_4:
  }
}

- (void)_setupConstraints
{
  v64 = +[NSMutableArray array];
  v60 = [(UIVisualEffectView *)self->_blurView topAnchor];
  v62 = [(RAPNotificationDetailsViewController *)self view];
  v58 = [v62 topAnchor];
  v56 = [v60 constraintEqualToAnchor:v58];
  v66[0] = v56;
  v52 = [(UIVisualEffectView *)self->_blurView leadingAnchor];
  v54 = [(RAPNotificationDetailsViewController *)self view];
  v50 = [v54 leadingAnchor];
  v48 = [v52 constraintEqualToAnchor:v50];
  v66[1] = v48;
  v44 = [(UIVisualEffectView *)self->_blurView trailingAnchor];
  uint64_t v46 = [(RAPNotificationDetailsViewController *)self view];
  v42 = [v46 trailingAnchor];
  v40 = [v44 constraintEqualToAnchor:v42];
  v66[2] = v40;
  v38 = [(UIVisualEffectView *)self->_blurView bottomAnchor];
  v39 = [(RAPNotificationDetailsViewController *)self view];
  v37 = [v39 bottomAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v66[3] = v36;
  unsigned int v35 = [(RAPNotificationDetailsViewController *)self collectionView];
  v33 = [v35 topAnchor];
  v34 = [(RAPNotificationDetailsViewController *)self view];
  v32 = [v34 safeAreaLayoutGuide];
  v31 = [v32 topAnchor];
  v30 = [v33 constraintEqualToAnchor:v31];
  v66[4] = v30;
  v29 = [(RAPNotificationDetailsViewController *)self collectionView];
  v28 = [v29 leadingAnchor];
  v3 = [(RAPNotificationDetailsViewController *)self view];
  unsigned __int8 v4 = [v3 leadingAnchor];
  v5 = [v28 constraintEqualToAnchor:v4];
  v66[5] = v5;
  id v6 = [(RAPNotificationDetailsViewController *)self collectionView];
  id v7 = [v6 trailingAnchor];
  id v8 = [(RAPNotificationDetailsViewController *)self view];
  id v9 = [v8 trailingAnchor];
  objc_super v10 = [v7 constraintEqualToAnchor:v9];
  v66[6] = v10;
  uint64_t v11 = +[NSArray arrayWithObjects:v66 count:7];
  [v64 addObjectsFromArray:v11];

  uint64_t v12 = [(RAPNotificationDetailsViewController *)self actionButton];

  if (v12)
  {
    v61 = [(RAPNotificationDetailsViewController *)self actionButton];
    v45 = [v61 topAnchor];
    v53 = [(RAPNotificationDetailsViewController *)self collectionView];
    uint64_t v59 = [v53 bottomAnchor];
    uint64_t v49 = [v45 constraintEqualToAnchor:v59 constant:16.0];
    v65[0] = v49;
    v63 = [(RAPNotificationDetailsViewController *)self actionButton];
    v55 = [v63 leadingAnchor];
    v57 = [(RAPNotificationDetailsViewController *)self view];
    v51 = [v57 leadingAnchor];
    v47 = [v55 constraintEqualToAnchor:v51 constant:16.0];
    v65[1] = v47;
    v43 = [(RAPNotificationDetailsViewController *)self actionButton];
    v41 = [v43 trailingAnchor];
    id v13 = [(RAPNotificationDetailsViewController *)self view];
    uint64_t v14 = [v13 trailingAnchor];
    v15 = [v41 constraintEqualToAnchor:v14 constant:-16.0];
    v65[2] = v15;
    id v16 = [(RAPNotificationDetailsViewController *)self actionButton];
    uint64_t v17 = [v16 bottomAnchor];
    v18 = [(RAPNotificationDetailsViewController *)self view];
    objc_super v19 = [v18 safeAreaLayoutGuide];
    uint64_t v20 = [v19 bottomAnchor];
    v21 = [v17 constraintEqualToAnchor:v20];
    v65[3] = v21;
    v22 = +[NSArray arrayWithObjects:v65 count:4];
    [v64 addObjectsFromArray:v22];

    uint64_t v23 = v45;
    v24 = v53;

    v25 = (void *)v49;
    v26 = v61;

    v27 = (void *)v59;
  }
  else
  {
    v26 = [(RAPNotificationDetailsViewController *)self collectionView];
    uint64_t v23 = [v26 bottomAnchor];
    v24 = [(RAPNotificationDetailsViewController *)self view];
    v27 = [v24 bottomAnchor];
    v25 = [v23 constraintEqualToAnchor:v27];
    [v64 addObject:v25];
  }

  +[NSLayoutConstraint activateConstraints:v64];
}

- (void)_done:(id)a3
{
  unsigned __int8 v4 = [(RAPNotificationDetailsViewController *)self viewModel];
  unsigned int v5 = [v4 editMode];

  if (v5) {
    +[RAPAnalyticsManager captureRAPCancelActionFromReport:self->_report];
  }

  [(RAPNotificationDetailsViewController *)self _dismissAndOpenReportsHome];
}

- (void)_send:(id)a3
{
}

- (void)_performButtonAction:(int)a3
{
  if (a3 == 1) {
    [(RAPNotificationDetailsViewController *)self _dismissAndOpenReportsHome];
  }
}

- (void)_dismissAndOpenReportsHome
{
  if (sub_1000BBB44(self) == 5)
  {
    v3 = [(RAPNotificationDetailsViewController *)self navigationController];
    unsigned __int8 v4 = &stru_1012E9C70;
  }
  else
  {
    v3 = [(RAPNotificationDetailsViewController *)self presentingViewController];
    unsigned __int8 v4 = &stru_1012E9C90;
  }
  id v5 = v3;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

- (void)_updateSummarySection
{
  id v11 = +[NSMutableArray array];
  v3 = [(RAPNotificationDetailsViewController *)self viewModel];
  unsigned __int8 v4 = [v3 rapRecord];

  if (v4) {
    [v11 addObject:&off_1013A6FE8];
  }
  id v5 = [(RAPNotificationDetailsViewController *)self viewModel];
  id v6 = [v5 displayStyle];

  if (v6 != (id)6) {
    [v11 addObject:&off_1013A7000];
  }
  id v7 = (NSArray *)[v11 copy];
  notificationSummaryItems = self->_notificationSummaryItems;
  self->_notificationSummaryItems = v7;

  id v9 = [(RAPNotificationDetailsViewController *)self collectionView];
  objc_super v10 = +[NSIndexSet indexSetWithIndex:0];
  [v9 reloadSections:v10];
}

- (void)_submitReport
{
  if ([(RAPNotificationDetailsViewController *)self _supportEdit])
  {
    v3 = sub_1009A033C();
    objc_initWeak(&location, self);
    report = self->_report;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10041BFA8;
    v11[3] = &unk_1012E9CD8;
    id v5 = v3;
    id v12 = v5;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10041BFB0;
    v7[3] = &unk_1012E9D00;
    objc_copyWeak(&v10, &location);
    id v6 = v5;
    id v8 = v6;
    id v9 = self;
    [(RAPReport *)report submitWithPrivacyRequestHandler:&stru_1012E9CB0 willStartSubmitting:v11 didFinishSubmitting:v7];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_setRAPRecordAsInReviewWithReportID:(id)a3
{
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    id v7 = [(RAPNotificationDetailsViewController *)self viewModel];
    if ([v7 editMode])
    {
      if ([(RAPNotificationDetailsViewController *)self _supportEdit]) {
        a4 = 2;
      }
      else {
        a4 = 0;
      }
    }
    else
    {
      a4 = 0;
    }
  }
  else if (a4 != 1)
  {
    if (a4) {
      a4 = 0;
    }
    else {
      a4 = [(NSArray *)self->_notificationSummaryItems count];
    }
  }

  return a4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == (id)2)
  {
    if (![v7 row])
    {
      v22 = +[RAPPhotoCarouselCollectionViewCell reuseIdentifier];
      id v12 = [v6 dequeueReusableCellWithReuseIdentifier:v22 forIndexPath:v7];

      [v12 setCarouselController:self->_photoCarouselController];
      goto LABEL_15;
    }
    if ([v7 row] == (id)1)
    {
      uint64_t v17 = +[RAPTextViewCollectionViewCell reuseIdentifier];
      id v12 = [v6 dequeueReusableCellWithReuseIdentifier:v17 forIndexPath:v7];

      [v12 setDelegate:self];
      objc_storeStrong((id *)&self->_textViewCell, v12);
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  if (v8 == (id)1)
  {
    v18 = +[RAPNotificationDescriptionCell identifier];
    id v12 = [v6 dequeueReusableCellWithReuseIdentifier:v18 forIndexPath:v7];

    objc_super v19 = [RAPNotificationDescriptionViewModel alloc];
    uint64_t v20 = [(RAPNotificationDetailsViewController *)self viewModel];
    v21 = [(RAPNotificationDescriptionViewModel *)v19 initWithRAPNotificationDetailsViewModel:v20];
    [v12 setViewModel:v21];

    [v12 setDelegate:self];
    goto LABEL_15;
  }
  if (v8) {
    goto LABEL_10;
  }
  id v9 = -[NSArray objectAtIndexedSubscript:](self->_notificationSummaryItems, "objectAtIndexedSubscript:", [v7 row]);
  id v10 = [v9 integerValue];

  if (v10 == (id)1)
  {
    uint64_t v23 = +[RAPNotificationDetailsMapCell identifier];
    id v12 = [v6 dequeueReusableCellWithReuseIdentifier:v23 forIndexPath:v7];

    id v16 = [(RAPNotificationDetailsViewController *)self viewModel];
    [v12 setViewModel:v16];
    goto LABEL_14;
  }
  if (v10)
  {
LABEL_10:
    id v12 = 0;
    goto LABEL_15;
  }
  id v11 = +[TwoLineCollectionViewListCell identifier];
  id v12 = [v6 dequeueReusableCellWithReuseIdentifier:v11 forIndexPath:v7];

  id v13 = [(RAPNotificationDetailsViewController *)self viewModel];
  uint64_t v14 = [v13 rapRecord];
  v15 = +[TwoLinesContentViewModelComposer cellModelForRAPReportsHistory:v14 allowDisclosureIndicator:0];
  [v12 setViewModel:v15];

  id v16 = +[UIColor tableCellGroupedBackgroundColor];
  [v12 setBackgroundColor:v16];
LABEL_14:

LABEL_15:

  return v12;
}

- (void)keyboardWillShow:(id)a3
{
  unsigned __int8 v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v5 CGRectValue];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = [(RAPNotificationDetailsViewController *)self collectionView];
  v15 = +[UIScreen mainScreen];
  id v16 = [v15 coordinateSpace];
  [v14 convertRect:v16 fromCoordinateSpace:v7, v9, v11, v13];
  double v18 = v17;

  objc_super v19 = [(RAPNotificationDetailsViewController *)self collectionView];
  [v19 setContentInset:0.0, 0.0, v18, 0.0];

  uint64_t v20 = [(RAPNotificationDetailsViewController *)self collectionView];
  [v20 frame];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  double v28 = v27;

  textViewCell = self->_textViewCell;
  if (textViewCell)
  {
    [(RAPTextViewCollectionViewCell *)textViewCell frame];
    v37.origin.x = v30;
    v37.origin.y = v31;
    v37.size.width = v32;
    v37.size.height = v33;
    v36.origin.x = v22;
    v36.origin.y = v24;
    v36.size.width = v26;
    v36.size.height = v28 - v18;
    if (!CGRectContainsRect(v36, v37))
    {
      id v34 = [(RAPNotificationDetailsViewController *)self collectionView];
      [(RAPTextViewCollectionViewCell *)self->_textViewCell frame];
      [v34 scrollRectToVisible:1 animated:];
    }
  }
}

- (void)keyboardWillHide:(id)a3
{
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  double v7 = [(RAPNotificationDetailsViewController *)self collectionView];
  [v7 setContentInset:UIEdgeInsetsZero.top, left, bottom, right];

  id v8 = [(RAPNotificationDetailsViewController *)self collectionView];
  [v8 setScrollIndicatorInsets:UIEdgeInsetsZero.top, left, bottom, right];
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  return 0;
}

- (void)macFooterViewLeftButtonTapped:(id)a3
{
}

- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3
{
  unsigned __int8 v4 = [a3 anchoringView];
  [(RAPPhotoPickerController *)self->_photoPicker setAnchoringView:v4];

  [(RAPPhotoPickerController *)self->_photoPicker setPresentingViewController:self];
  photoPicker = self->_photoPicker;

  [(RAPPhotoPickerController *)photoPicker startPicking];
}

- (void)photoCarouselController:(id)a3 requestsRemovingImageForIdentifier:(id)a4 completion:(id)a5
{
  question = self->_question;
  double v11 = (void (**)(id, id))a5;
  id v8 = a4;
  double v9 = [(RAPUserResponseQuestion *)question commentQuestion];
  id v10 = [v9 removePhotoForIdentifier:v8];

  [(RAPNotificationDetailsViewController *)self _updateDoneButton];
  v11[2](v11, v10);
}

- (void)textViewCellDidChangeWithTextViewCell:(id)a3 validatedText:(id)a4
{
  question = self->_question;
  id v6 = a4;
  double v7 = [(RAPUserResponseQuestion *)question commentQuestion];
  [v7 setComment:v6];

  [(RAPNotificationDetailsViewController *)self _updateDoneButton];
}

- (void)descriptionCellLinkButtonClick:(id)a3
{
  unsigned __int8 v4 = [(RAPNotificationDetailsViewController *)self viewModel];
  id v5 = [v4 linkButtonLink];
  id v7 = +[NSURL URLWithString:v5];

  id v6 = [(RAPNotificationDetailsViewController *)self delegate];
  [v6 openURLWithDetailsViewController:self URL:v7];
}

- (RAPNotificationDetailsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RAPNotificationDetailsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC4Maps31RAPNotificationDetailsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textViewCell, 0);
  objc_storeStrong((id *)&self->_photoCarouselController, 0);
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_storeStrong((id *)&self->_report, 0);
  objc_storeStrong((id *)&self->_notificationSummaryItems, 0);

  objc_storeStrong((id *)&self->_blurView, 0);
}

@end