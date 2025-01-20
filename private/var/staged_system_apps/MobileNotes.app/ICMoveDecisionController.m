@interface ICMoveDecisionController
+ (id)defaultPresentingViewController;
+ (void)moveFolderWithDeletingShares:(id)a3 destination:(id)a4 isCopy:(BOOL)a5 completionHandler:(id)a6;
+ (void)moveNotesWithDeletingShares:(id)a3 destination:(id)a4 isCopy:(BOOL)a5 completionHandler:(id)a6;
+ (void)postAdditionalStepAlertForMoveDecision:(id)a3 isCopy:(BOOL)a4;
- (ICFolder)sourceFolder;
- (ICMoveDecision)moveDecision;
- (ICMoveDecisionController)initWithSourceObjects:(id)a3 presentingViewController:(id)a4;
- (NSArray)sourceObjects;
- (NSManagedObjectContext)workerContext;
- (UIViewController)presentingViewController;
- (id)destination;
- (void)announceMoveToDestination:(id)a3 delay:(double)a4;
- (void)moveSourceObjectsToDestination:(id)a3 completionHandler:(id)a4;
- (void)performDecision;
- (void)performDecisionWithCompletion:(id)a3;
- (void)setDestination:(id)a3;
- (void)setMoveDecision:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSourceFolder:(id)a3;
- (void)setWorkerContext:(id)a3;
@end

@implementation ICMoveDecisionController

- (ICMoveDecisionController)initWithSourceObjects:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICMoveDecisionController;
  v9 = [(ICMoveDecisionController *)&v14 init];
  if (v9)
  {
    if ([v7 count])
    {
      v10 = [v7 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v7 firstObject];
        sourceFolder = v9->_sourceFolder;
        v9->_sourceFolder = (ICFolder *)v11;
      }
      else
      {
        sourceFolder = v9->_sourceFolder;
        v9->_sourceFolder = 0;
      }
    }
    else
    {
      v10 = v9->_sourceFolder;
      v9->_sourceFolder = 0;
    }

    objc_storeStrong((id *)&v9->_sourceObjects, a3);
    objc_storeStrong((id *)&v9->_presentingViewController, a4);
  }

  return v9;
}

+ (void)postAdditionalStepAlertForMoveDecision:(id)a3 isCopy:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  switch((unint64_t)[v10 additionalStep])
  {
    case 1uLL:
      v6 = [a1 defaultPresentingViewController];
      +[ICMoveAlertUtilities postAlertForFolderDepthLimitWithPresentingViewController:v6 completionHandler:0];
      goto LABEL_9;
    case 2uLL:
      v6 = [a1 defaultPresentingViewController];
      +[ICMoveAlertUtilities postAlertForMovingLockedNotesToOtherAccountIsCopy:v4 presentingViewController:v6 completionHandler:0];
      goto LABEL_9;
    case 3uLL:
      v6 = [v10 guiltyObjects];
      id v7 = [a1 defaultPresentingViewController];
      +[ICMoveAlertUtilities postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:v6 presentingViewController:v7 completionHandler:0];
      goto LABEL_8;
    case 4uLL:
      v6 = [a1 defaultPresentingViewController];
      +[ICMoveAlertUtilities postAlertForMovingSharedNotesToAnotherAccountWithPresentingViewController:v6 completionHandler:0];
      goto LABEL_9;
    case 5uLL:
      v6 = [v10 htmlDestinationFolder];
      id v8 = [v6 account];
      v9 = [a1 defaultPresentingViewController];
      +[ICMoveAlertUtilities postAlertForUnsupportedAttachmentsInLegacyAccount:v8 presentingViewController:v9];

      goto LABEL_9;
    case 0xDuLL:
      v6 = [v10 modernDestinationAccount];
      id v7 = [a1 defaultPresentingViewController];
      +[ICMoveAlertUtilities postAlertForMovingSmartFolderWithRestrictedFilterToLocalAccount:v6 presentingViewController:v7];
LABEL_8:

LABEL_9:
      break;
    default:
      break;
  }
}

+ (void)moveNotesWithDeletingShares:(id)a3 destination:(id)a4 isCopy:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10006227C;
  v20[3] = &unk_100625B40;
  id v13 = v10;
  id v21 = v13;
  id v14 = v12;
  id v22 = v14;
  v15 = objc_retainBlock(v20);
  v16 = v15;
  if (v7)
  {
    ((void (*)(void *))v15[2])(v15);
  }
  else
  {
    v17 = [a1 defaultPresentingViewController];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100062498;
    v18[3] = &unk_100625988;
    id v19 = v14;
    +[ICMoveAlertUtilities postAlertForMovingNotesContainingSharedNotesToSharedFolder:v13 destination:v11 presentingViewController:v17 shareHandler:v16 cancelHandler:v18];
  }
}

+ (void)moveFolderWithDeletingShares:(id)a3 destination:(id)a4 isCopy:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100062670;
  v22[3] = &unk_100625B40;
  id v13 = v10;
  id v23 = v13;
  id v14 = v12;
  id v24 = v14;
  v15 = objc_retainBlock(v22);
  v16 = v15;
  if (v7)
  {
    ((void (*)(void *))v15[2])(v15);
  }
  else
  {
    v17 = [v13 rootSharedNotesIncludingChildFolders];
    v18 = [v13 rootSharedFoldersInDescendantsIncludingSelf];
    id v19 = [a1 defaultPresentingViewController];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100062870;
    v20[3] = &unk_100625988;
    id v21 = v14;
    +[ICMoveAlertUtilities postAlertForMovingFolderWithSharedNotes:v17 sharedSubfolders:v18 destination:v11 presentingViewController:v19 shareHandler:v16 cancelHandler:v20];
  }
}

- (void)performDecision
{
}

- (void)performDecisionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICMoveDecisionController *)self destination];

  if (v5)
  {
    v6 = [(ICMoveDecisionController *)self destination];
    [(ICMoveDecisionController *)self moveSourceObjectsToDestination:v6 completionHandler:v4];
  }
  else
  {
    BOOL v7 = [(ICMoveDecisionController *)self presentingViewController];
    v6 = [v7 ic_viewControllerManager];

    if (v6)
    {
      id v8 = [(ICMoveDecisionController *)self sourceObjects];
      v9 = [v8 ic_map:&stru_100626818];

      id v10 = [[ICMoveNavigationController alloc] initWithViewControllerManager:v6 sourceObjectIds:v9];
      objc_initWeak(&location, v10);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100062AB4;
      v13[3] = &unk_100626840;
      objc_copyWeak(&v15, &location);
      v13[4] = self;
      id v14 = v4;
      id v11 = [(ICMoveNavigationController *)v10 moveViewController];
      [v11 setCompletionHandler:v13];

      id v12 = [(ICMoveDecisionController *)self presentingViewController];
      [v12 presentViewController:v10 animated:1 completion:0];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((viewControllerManager) != nil)", "-[ICMoveDecisionController performDecisionWithCompletion:]", 1, 0, @"Expected non-nil value for '%s'", "viewControllerManager");
    }
  }
}

- (void)moveSourceObjectsToDestination:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)ICMoveDecision);
  v9 = [(ICMoveDecisionController *)self sourceObjects];
  id v10 = [v8 initWithSourceObjects:v9 destination:v6];
  [(ICMoveDecisionController *)self setMoveDecision:v10];

  id v11 = [(ICMoveDecisionController *)self moveDecision];
  LODWORD(v9) = [v11 shouldProceed];

  if (!v9)
  {
    if (!v7) {
      goto LABEL_39;
    }
    goto LABEL_32;
  }
  id v12 = [(ICMoveDecisionController *)self moveDecision];
  id v13 = [v12 additionalStep];

  int v14 = 0;
  char v15 = 1;
  switch((unint64_t)v13)
  {
    case 1uLL:
      v16 = [(ICMoveDecisionController *)self presentingViewController];
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_10006372C;
      v70[3] = &unk_100625988;
      id v71 = v7;
      +[ICMoveAlertUtilities postAlertForFolderDepthLimitWithPresentingViewController:v16 completionHandler:v70];

      v17 = v71;
      goto LABEL_23;
    case 2uLL:
      v18 = [(ICMoveDecisionController *)self presentingViewController];
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472;
      v72[2] = sub_10006370C;
      v72[3] = &unk_100625988;
      id v73 = v7;
      +[ICMoveAlertUtilities postAlertForMovingLockedNotesToOtherAccountIsCopy:0 presentingViewController:v18 completionHandler:v72];

      v17 = v73;
      goto LABEL_23;
    case 3uLL:
      id v19 = [(ICMoveDecisionController *)self sourceFolder];

      if (v19)
      {
        v20 = [(ICMoveDecisionController *)self moveDecision];
        id v21 = [v20 guiltyObjects];
        id v22 = [(ICMoveDecisionController *)self presentingViewController];
        v78[0] = _NSConcreteStackBlock;
        v78[1] = 3221225472;
        v78[2] = sub_1000636AC;
        v78[3] = &unk_100625988;
        id v79 = v7;
        +[ICMoveAlertUtilities postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:v21 presentingViewController:v22 completionHandler:v78];

        v17 = v79;
      }
      else
      {
        v39 = [(ICMoveDecisionController *)self sourceObjects];
        id v40 = [v39 count];
        v41 = [(ICMoveDecisionController *)self moveDecision];
        v42 = [v41 guiltyObjects];
        v43 = [(ICMoveDecisionController *)self presentingViewController];
        v76[0] = _NSConcreteStackBlock;
        v76[1] = 3221225472;
        v76[2] = sub_1000636CC;
        v76[3] = &unk_100625988;
        id v77 = v7;
        +[ICMoveAlertUtilities postAlertForMovingLockedOrSingleJoinedNotesToSharedFolderWithCountOfNotes:v40 guiltyObjects:v42 presentingViewController:v43 completionHandler:v76];

        v17 = v77;
      }
      goto LABEL_23;
    case 4uLL:
      id v23 = [(ICMoveDecisionController *)self presentingViewController];
      v74[0] = _NSConcreteStackBlock;
      v74[1] = 3221225472;
      v74[2] = sub_1000636EC;
      v74[3] = &unk_100625988;
      id v75 = v7;
      +[ICMoveAlertUtilities postAlertForMovingSharedNotesToAnotherAccountWithPresentingViewController:v23 completionHandler:v74];

      v17 = v75;
LABEL_23:

      char v15 = 0;
      goto LABEL_24;
    case 6uLL:
      int v14 = 1;
      break;
    case 7uLL:
      id v24 = +[ICNoteContext sharedContext];
      v25 = [(ICMoveDecisionController *)self moveDecision];
      v26 = [v25 guiltyObjects];
      v27 = v24;
      v28 = v26;
      uint64_t v29 = 1;
      goto LABEL_13;
    case 8uLL:
      id v24 = +[ICNoteContext sharedContext];
      v25 = [(ICMoveDecisionController *)self moveDecision];
      v26 = [v25 guiltyObjects];
      v27 = v24;
      v28 = v26;
      uint64_t v29 = 0;
LABEL_13:
      [v27 undoablyMarkNotes:v28 asSystemPaper:v29];
      goto LABEL_20;
    case 9uLL:
      id v24 = +[ICNoteContext sharedContext];
      v25 = [(ICMoveDecisionController *)self moveDecision];
      v26 = [v25 guiltyObjects];
      v30 = v24;
      v31 = v26;
      uint64_t v32 = 1;
      goto LABEL_16;
    case 0xAuLL:
      id v24 = +[ICNoteContext sharedContext];
      v25 = [(ICMoveDecisionController *)self moveDecision];
      v26 = [v25 guiltyObjects];
      v30 = v24;
      v31 = v26;
      uint64_t v32 = 0;
LABEL_16:
      [v30 undoablyMarkNotes:v31 asMathNotes:v32];
      goto LABEL_20;
    case 0xBuLL:
      id v24 = +[ICNoteContext sharedContext];
      v25 = [(ICMoveDecisionController *)self moveDecision];
      v26 = [v25 guiltyObjects];
      v33 = v24;
      v34 = v26;
      uint64_t v35 = 1;
      goto LABEL_19;
    case 0xCuLL:
      id v24 = +[ICNoteContext sharedContext];
      v25 = [(ICMoveDecisionController *)self moveDecision];
      v26 = [v25 guiltyObjects];
      v33 = v24;
      v34 = v26;
      uint64_t v35 = 0;
LABEL_19:
      [v33 undoablyMarkNotes:v34 asCallNotes:v35];
LABEL_20:

LABEL_24:
      int v14 = 0;
      break;
    case 0xDuLL:
      v36 = [(ICMoveDecisionController *)self moveDecision];
      v37 = [v36 modernDestinationAccount];
      v38 = [(ICMoveDecisionController *)self presentingViewController];
      +[ICMoveAlertUtilities postAlertForMovingSmartFolderWithRestrictedFilterToLocalAccount:v37 presentingViewController:v38];

      int v14 = 0;
      char v15 = 1;
      break;
    default:
      break;
  }
  v44 = [(ICMoveDecisionController *)self moveDecision];
  unsigned int v45 = [v44 shouldMove];

  if (v45)
  {
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_10006374C;
    v67[3] = &unk_100625888;
    v67[4] = self;
    id v46 = v6;
    id v68 = v46;
    id v47 = v7;
    id v69 = v47;
    v48 = objc_retainBlock(v67);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_10006391C;
    v64[3] = &unk_100625888;
    v64[4] = self;
    id v49 = v46;
    id v65 = v49;
    id v50 = v47;
    id v66 = v50;
    v51 = objc_retainBlock(v64);
    v52 = [(ICMoveDecisionController *)self sourceFolder];

    if (v14)
    {
      if (v52)
      {
        v53 = [(ICMoveDecisionController *)self sourceFolder];
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_100063D4C;
        v61[3] = &unk_100626890;
        v62 = v48;
        id v63 = v50;
        +[ICMoveDecisionController moveFolderWithDeletingShares:v53 destination:v49 isCopy:0 completionHandler:v61];

        v54 = v62;
      }
      else
      {
        v56 = [(ICMoveDecisionController *)self moveDecision];
        v57 = [v56 modernNotes];
        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_100063D80;
        v58[3] = &unk_100626890;
        v59 = v51;
        id v60 = v50;
        +[ICMoveDecisionController moveNotesWithDeletingShares:v57 destination:v49 isCopy:0 completionHandler:v58];

        v54 = v59;
      }
    }
    else if (v52)
    {
      ((void (*)(void *))v48[2])(v48);
    }
    else
    {
      ((void (*)(void *))v51[2])(v51);
    }

    goto LABEL_39;
  }
  char v55 = v15 ^ 1;
  if (!v7) {
    char v55 = 1;
  }
  if ((v55 & 1) == 0) {
LABEL_32:
  }
    (*((void (**)(id, void *))v7 + 2))(v7, &__NSArray0__struct);
LABEL_39:
}

- (UIViewController)presentingViewController
{
  presentingViewController = self->_presentingViewController;
  if (presentingViewController)
  {
    v3 = presentingViewController;
  }
  else
  {
    v3 = [(id)objc_opt_class() defaultPresentingViewController];
  }

  return v3;
}

+ (id)defaultPresentingViewController
{
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 keyWindow];
  id v4 = [v3 rootViewController];
  v5 = [v4 presentedViewController];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = +[UIApplication sharedApplication];
    v9 = [v8 keyWindow];
    id v7 = [v9 rootViewController];
  }

  return v7;
}

- (void)announceMoveToDestination:(id)a3 delay:(double)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v7, &location);
  id v6 = v5;
  dispatchMainAfterDelay();

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (NSManagedObjectContext)workerContext
{
  return self->_workerContext;
}

- (void)setWorkerContext:(id)a3
{
}

- (NSArray)sourceObjects
{
  return self->_sourceObjects;
}

- (ICMoveDecision)moveDecision
{
  return self->_moveDecision;
}

- (void)setMoveDecision:(id)a3
{
}

- (id)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICFolder)sourceFolder
{
  return self->_sourceFolder;
}

- (void)setSourceFolder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceFolder, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong(&self->_destination, 0);
  objc_storeStrong((id *)&self->_moveDecision, 0);
  objc_storeStrong((id *)&self->_sourceObjects, 0);

  objc_storeStrong((id *)&self->_workerContext, 0);
}

@end