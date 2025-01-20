@interface RAPPersonalPlaceAdvancedEditorViewController
- (RAPPersonalPlaceAdvancedEditorViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5;
- (id)_commentCell;
- (id)_commentsHeaderView;
- (id)_photoTableViewCell;
- (id)_userContentFooterView;
- (id)_userInfoCell;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int)analyticTarget;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancel;
- (void)_initPhotoPicker;
- (void)_presentPrivacyView;
- (void)_send;
- (void)photoCarouselController:(id)a3 requestsRemovingImageForIdentifier:(id)a4 completion:(id)a5;
- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3;
- (void)viewDidLoad;
@end

@implementation RAPPersonalPlaceAdvancedEditorViewController

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)RAPPersonalPlaceAdvancedEditorViewController;
  [(RAPPersonalPlaceAdvancedEditorViewController *)&v16 viewDidLoad];
  v3 = [(RAPPersonalPlaceAdvancedEditorViewController *)self tableView];
  [v3 setKeyboardDismissMode:1];

  v4 = [(RAPPersonalPlaceAdvancedEditorViewController *)self tableView];
  [v4 _maps_initializeRAPAppearance];

  v5 = [(RAPPersonalPlaceCorrectionsQuestion *)self->_question localizedTitle];
  v6 = [(RAPPersonalPlaceAdvancedEditorViewController *)self navigationItem];
  [v6 setTitle:v5];

  id v7 = objc_alloc((Class)UIBarButtonItem);
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:@"Submit" value:@"localized string not found" table:0];
  id v10 = [v7 initWithTitle:v9 style:2 target:self action:"_send"];
  v11 = [(RAPPersonalPlaceAdvancedEditorViewController *)self navigationItem];
  [v11 setRightBarButtonItem:v10];

  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancel"];
  v13 = [(RAPPersonalPlaceAdvancedEditorViewController *)self navigationItem];
  [v13 setLeftBarButtonItem:v12];

  v14 = +[GEOUserAccountInfo primaryICloudAccount];
  account = self->_account;
  self->_account = v14;
}

- (void)_cancel
{
  completion = (void (**)(id, RAPPersonalPlaceAdvancedEditorViewController *, void))self->_completion;
  if (completion) {
    completion[2](completion, self, 0);
  }
}

- (void)_send
{
  completion = (void (**)(id, RAPPersonalPlaceAdvancedEditorViewController *, uint64_t))self->_completion;
  if (completion) {
    completion[2](completion, self, 1);
  }
}

- (void)_presentPrivacyView
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.mapsrap"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (RAPPersonalPlaceAdvancedEditorViewController)initWithReport:(id)a3 question:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)RAPPersonalPlaceAdvancedEditorViewController;
  id v12 = [(RAPPersonalPlaceAdvancedEditorViewController *)&v21 initWithStyle:1];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_question, a4);
    objc_storeStrong((id *)&v13->_report, a3);
    id v14 = [v11 copy];
    id completion = v13->_completion;
    v13->_id completion = v14;

    objc_super v16 = [UGCPhotoCarouselController alloc];
    v17 = [(RAPPersonalPlaceCorrectionsQuestion *)v13->_question commentQuestion];
    v18 = -[UGCPhotoCarouselController initWithDelegate:maximumNumberOfPhotos:](v16, "initWithDelegate:maximumNumberOfPhotos:", v13, [v17 maximumNumberOfPhotos]);
    photoCarouselController = v13->_photoCarouselController;
    v13->_photoCarouselController = v18;

    [(RAPPersonalPlaceAdvancedEditorViewController *)v13 _initPhotoPicker];
  }

  return v13;
}

- (void)_initPhotoPicker
{
  id v3 = objc_alloc_init(RAPPhotoPickerController);
  photoPicker = self->_photoPicker;
  self->_photoPicker = v3;

  v5 = self->_photoCarouselController;
  v6 = [(RAPPersonalPlaceCorrectionsQuestion *)self->_question commentQuestion];
  id v7 = self->_photoPicker;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A4BFDC;
  v10[3] = &unk_1013151F8;
  id v11 = v6;
  id v12 = v5;
  v8 = v5;
  id v9 = v6;
  [(RAPPhotoPickerController *)v7 addObserver:self changeHandler:v10];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_account) {
    return 3;
  }
  else {
    return 2;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = [a4 section:a3];
  if (self->_account)
  {
    if (v5 != (id)2)
    {
      if (v5 != (id)1)
      {
        if (!v5)
        {
          id v6 = [(RAPPersonalPlaceAdvancedEditorViewController *)self _userInfoCell];
          goto LABEL_11;
        }
        goto LABEL_10;
      }
LABEL_8:
      id v6 = [(RAPPersonalPlaceAdvancedEditorViewController *)self _commentCell];
      goto LABEL_11;
    }
LABEL_9:
    id v6 = [(RAPPersonalPlaceAdvancedEditorViewController *)self _photoTableViewCell];
    goto LABEL_11;
  }
  if (v5 == (id)1) {
    goto LABEL_9;
  }
  if (!v5) {
    goto LABEL_8;
  }
LABEL_10:
  id v6 = objc_alloc_init((Class)UITableViewCell);
LABEL_11:

  return v6;
}

- (id)_userInfoCell
{
  userInfoCell = self->_userInfoCell;
  if (!userInfoCell)
  {
    v4 = [[RAPDisplayUserContentTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_userInfoCell;
    self->_userInfoCell = v4;

    userInfoCell = self->_userInfoCell;
  }

  return userInfoCell;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  account = self->_account;
  if (!a4 && account || (id v5 = 0, a4 == 1) && !account)
  {
    id v5 = [(RAPPersonalPlaceAdvancedEditorViewController *)self _userContentFooterView];
  }

  return v5;
}

- (id)_userContentFooterView
{
  userContentFooterView = self->_userContentFooterView;
  if (!userContentFooterView)
  {
    v4 = +[TableViewFooterOptions defaultRAPUserContentOptions];
    id v5 = [[TableViewSelectableFooterView alloc] initWithReuseIdentifier:@"RAPUserContentTableViewFooterView" options:v4];
    id v6 = self->_userContentFooterView;
    self->_userContentFooterView = v5;

    [(TableViewSelectableFooterView *)self->_userContentFooterView setTarget:self action:"_presentPrivacyView"];
    if (sub_1000BBB44(self) == 5)
    {
      id v7 = +[UIColor whiteColor];
      [(TableViewSelectableFooterView *)self->_userContentFooterView setBackgroundColor:v7];
    }
    [(TableViewSelectableFooterView *)self->_userContentFooterView sizeToFit];

    userContentFooterView = self->_userContentFooterView;
  }

  return userContentFooterView;
}

- (id)_commentCell
{
  commentCell = self->_commentCell;
  if (!commentCell)
  {
    v4 = [[RAPReportComposerCommentTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_commentCell;
    self->_commentCell = v4;

    id v6 = [(RAPPersonalPlaceCorrectionsQuestion *)self->_question commentQuestion];
    id v7 = [v6 commentsPlaceholderText];
    [(RAPReportComposerCommentTableViewCell *)self->_commentCell setPlaceholderText:v7];

    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100A4C478;
    v9[3] = &unk_101301528;
    objc_copyWeak(&v10, &location);
    [(RAPReportComposerCommentTableViewCell *)self->_commentCell setTextDidChange:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    commentCell = self->_commentCell;
  }

  return commentCell;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  account = self->_account;
  if (!a4 && !account || (id v5 = 0, a4 == 1) && account)
  {
    id v5 = [(RAPPersonalPlaceAdvancedEditorViewController *)self _commentsHeaderView];
  }

  return v5;
}

- (id)_commentsHeaderView
{
  commentsHeaderView = self->_commentsHeaderView;
  if (!commentsHeaderView)
  {
    v4 = [RAPCommentPartHeaderView alloc];
    id v5 = [(RAPPersonalPlaceCorrectionsQuestion *)self->_question commentQuestion];
    id v6 = [(RAPCommentPartHeaderView *)v4 initWithQuestion:v5 reuseIdentifier:@"RAPCommentPartHeaderView"];
    id v7 = self->_commentsHeaderView;
    self->_commentsHeaderView = v6;

    [(RAPCommentPartHeaderView *)self->_commentsHeaderView sizeToFit];
    commentsHeaderView = self->_commentsHeaderView;
  }

  return commentsHeaderView;
}

- (id)_photoTableViewCell
{
  photoCell = self->_photoCell;
  if (!photoCell)
  {
    v4 = [[RAPPhotoCarouselTableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    id v5 = self->_photoCell;
    self->_photoCell = v4;

    [(RAPPhotoCarouselTableViewCell *)self->_photoCell setPhotoCarouselController:self->_photoCarouselController];
    photoCell = self->_photoCell;
  }

  return photoCell;
}

- (void)photoCarouselControllerRequestsAddingNewPhoto:(id)a3
{
  v4 = [a3 anchoringView];
  [(RAPPhotoPickerController *)self->_photoPicker setAnchoringView:v4];

  [(RAPPhotoPickerController *)self->_photoPicker setPresentingViewController:self];
  photoPicker = self->_photoPicker;

  [(RAPPhotoPickerController *)photoPicker startPicking];
}

- (void)photoCarouselController:(id)a3 requestsRemovingImageForIdentifier:(id)a4 completion:(id)a5
{
  question = self->_question;
  id v10 = (void (**)(id, id))a5;
  id v7 = a4;
  v8 = [(RAPPersonalPlaceCorrectionsQuestion *)question commentQuestion];
  id v9 = [v8 removePhotoForIdentifier:v7];

  v10[2](v10, v9);
}

- (int)analyticTarget
{
  return 1302;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_userContentFooterView, 0);
  objc_storeStrong((id *)&self->_userInfoCell, 0);
  objc_storeStrong((id *)&self->_commentsHeaderView, 0);
  objc_storeStrong((id *)&self->_commentCell, 0);
  objc_storeStrong((id *)&self->_photoCell, 0);
  objc_storeStrong((id *)&self->_photoCarouselController, 0);
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_question, 0);

  objc_storeStrong((id *)&self->_report, 0);
}

@end