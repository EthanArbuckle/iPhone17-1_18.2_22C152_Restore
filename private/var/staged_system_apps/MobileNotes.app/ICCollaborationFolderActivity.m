@interface ICCollaborationFolderActivity
- (BOOL)forceShareSheet;
- (CGRect)presentingSourceRect;
- (ICCollaborationFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 presentingSourceView:(id)a6 presentingSourceRect:(CGRect)a7 eventReporter:(id)a8;
- (ICCollaborationUIController)collaborationUIController;
- (ICFolder)folder;
- (ICNAEventReporter)eventReporter;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIView)presentingSourceView;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setFolder:(id)a3;
- (void)setForceShareSheet:(BOOL)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingSourceRect:(CGRect)a3;
- (void)setPresentingSourceView:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICCollaborationFolderActivity

- (ICCollaborationFolderActivity)initWithFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 presentingSourceView:(id)a6 presentingSourceRect:(CGRect)a7 eventReporter:(id)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a8;
  v26.receiver = self;
  v26.super_class = (Class)ICCollaborationFolderActivity;
  v23 = [(ICCollaborationFolderActivity *)&v26 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_folder, a3);
    objc_storeWeak((id *)&v24->_presentingViewController, v19);
    objc_storeStrong((id *)&v24->_presentingBarButtonItem, a5);
    objc_storeStrong((id *)&v24->_presentingSourceView, a6);
    v24->_presentingSourceRect.origin.CGFloat x = x;
    v24->_presentingSourceRect.origin.CGFloat y = y;
    v24->_presentingSourceRect.size.CGFloat width = width;
    v24->_presentingSourceRect.size.CGFloat height = height;
    objc_storeStrong((id *)&v24->_eventReporter, a8);
  }

  return v24;
}

- (id)activityTitle
{
  v2 = [(ICCollaborationFolderActivity *)self folder];
  v3 = [v2 shareViaICloudManageActionTitle];

  return v3;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.collaborationFolder";
}

- (id)activityImage
{
  v2 = [(ICCollaborationFolderActivity *)self folder];
  v3 = [v2 shareViaICloudSystemImageName];

  v4 = +[UIImage systemImageNamed:v3];

  return v4;
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(ICCollaborationFolderActivity *)self contextPathEnum])
  {
    v5 = [(ICCollaborationFolderActivity *)self eventReporter];
    [v5 pushContextPathDataWithContextPathEnum:[self contextPathEnum]];
  }
  v6 = [(ICCollaborationFolderActivity *)self presentationSourceItem];
  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    v8 = [(ICCollaborationFolderActivity *)self presentingSourceView];
    BOOL v7 = v8 == 0;
  }
  if ([(ICCollaborationFolderActivity *)self forceShareSheet])
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v10 = [(ICCollaborationFolderActivity *)self folder];
    if ([v10 canBeSharedViaICloud])
    {
      v11 = [(ICCollaborationFolderActivity *)self folder];
      unsigned int v9 = [v11 isPubliclySharedOrHasInvitees] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  char v12 = v9 ^ 1 | v7;
  v13 = [(ICCollaborationFolderActivity *)self collaborationUIController];
  v14 = [(ICCollaborationFolderActivity *)self folder];
  v15 = [(ICCollaborationFolderActivity *)self presentingViewController];
  if (v12)
  {
    v16 = [(ICCollaborationFolderActivity *)self presentingBarButtonItem];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100058610;
    v32[3] = &unk_100625AF0;
    v32[4] = self;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10005867C;
    v30[3] = &unk_100625B40;
    v30[4] = self;
    id v31 = v4;
    id v17 = v4;
    [v13 showCloudSharingControllerForFolder:v14 presentingViewController:v15 popoverBarButtonItem:v16 presented:v32 dismissed:v30];

    id v18 = v31;
  }
  else
  {
    id v19 = [(ICCollaborationFolderActivity *)self presentationSourceItem];
    id v20 = [(ICCollaborationFolderActivity *)self presentingSourceView];
    [(ICCollaborationFolderActivity *)self presentingSourceRect];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100058564;
    v33[3] = &unk_100625B40;
    v33[4] = self;
    id v34 = v4;
    id v29 = v4;
    [v13 presentFolderActivityViewControllerWithFolder:v14 presentingViewController:v15 sourceItem:v19 sourceView:v20 sourceRect:v33 completion:v22, v24, v26, v28];

    id v18 = v34;
  }
}

- (ICCollaborationUIController)collaborationUIController
{
  return +[ICCollaborationUIController sharedInstance];
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
}

- (UIView)presentingSourceView
{
  return self->_presentingSourceView;
}

- (void)setPresentingSourceView:(id)a3
{
}

- (CGRect)presentingSourceRect
{
  double x = self->_presentingSourceRect.origin.x;
  double y = self->_presentingSourceRect.origin.y;
  double width = self->_presentingSourceRect.size.width;
  double height = self->_presentingSourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentingSourceRect:(CGRect)a3
{
  self->_presentingSourceRect = a3;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
}

- (BOOL)forceShareSheet
{
  return self->_forceShareSheet;
}

- (void)setForceShareSheet:(BOOL)a3
{
  self->_forceShareSheet = a3;
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_presentingSourceView, 0);

  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
}

@end