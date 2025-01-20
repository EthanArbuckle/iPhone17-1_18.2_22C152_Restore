@interface RCMoveToFolderActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (RCFolderSelectionContainerViewController)folderSelectionContainerViewController;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)didCancelFolderSelection;
- (void)didCompleteFolderSelection;
- (void)prepareWithActivityItems:(id)a3;
- (void)setFolderSelectionContainerViewController:(id)a3;
@end

@implementation RCMoveToFolderActivity

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return @"RCActivityTypeMoveToFolder";
}

- (id)activityTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"MOVE_TO_FOLDER" value:&stru_100228BC8 table:0];

  return v3;
}

- (id)_systemImageName
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  v3 = [v2 moveToFolderActivitySystemImageName];

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return [a3 count] != 0;
}

- (void)prepareWithActivityItems:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)RCMoveToFolderActivity;
  [(RCUIActivity *)&v11 prepareWithActivityItems:a3];
  v4 = +[UIApplication sharedApplication];
  v5 = [v4 delegate];

  v6 = [v5 defaultSceneDelegate];
  v7 = [v6 mainViewController];

  v8 = [(RCUIActivity *)self recordingUUIDs];
  v9 = [v7 moveToFolderContainerViewControllerWithUUIDs:v8];

  [(RCMoveToFolderActivity *)self setFolderSelectionContainerViewController:v9];
  v10 = [v9 collectionViewController];
  [v10 setPresentingDelegate:self];
}

- (id)activityViewController
{
  return [(RCMoveToFolderActivity *)self folderSelectionContainerViewController];
}

- (void)didCancelFolderSelection
{
}

- (void)didCompleteFolderSelection
{
}

- (RCFolderSelectionContainerViewController)folderSelectionContainerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderSelectionContainerViewController);

  return (RCFolderSelectionContainerViewController *)WeakRetained;
}

- (void)setFolderSelectionContainerViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end