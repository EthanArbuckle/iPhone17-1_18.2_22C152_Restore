@interface ICCollaborationUIController
+ (ICCollaborationUIController)sharedInstance;
+ (void)showSharingUIWithSanityChecksForFolder:(id)a3 presentingViewController:(id)a4 showSharingUIBlock:(id)a5;
- (CKShare)newlyCreatedShare;
- (ICAccount)account;
- (ICCollaborationUIController)init;
- (ICFolder)folder;
- (ICNote)note;
- (NSMapTable)windowScenesByObjectID;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIViewController)presentingViewController;
- (id)backgroundContextForCollaborationController:(id)a3;
- (id)cloudContextForCollaborationController:(id)a3;
- (id)cloudSharingControllerForObject:(id)a3;
- (id)eventReporterForURL:(id)a3;
- (id)itemThumbnailDataForCloudSharingController:(id)a3;
- (id)itemTitleForCloudSharingController:(id)a3;
- (id)itemTypeForCloudSharingController:(id)a3;
- (id)viewContextForCollaborationController:(id)a3;
- (id)windowSceneForURL:(id)a3;
- (void)_cloudSharingControllerDidActivateShowSharedFolder;
- (void)_cloudSharingControllerDidModifyPrimarySwitch:(BOOL)a3;
- (void)associateWindowScene:(id)a3 withURL:(id)a4;
- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4;
- (void)cloudSharingControllerDidSaveShare:(id)a3;
- (void)cloudSharingControllerDidStopSharing:(id)a3;
- (void)collaborationController:(id)a3 didFailToSaveShareWithError:(id)a4;
- (void)collaborationController:(id)a3 fetchShareMetadataWithURLs:(id)a4 completion:(id)a5;
- (void)collaborationController:(id)a3 persistJoinActivityEventOnObject:(id)a4;
- (void)collaborationController:(id)a3 persistLeaveActivityEventOnObject:(id)a4;
- (void)collaborationController:(id)a3 persistParticipantActivityEventsOnObject:(id)a4 oldShare:(id)a5 newShare:(id)a6;
- (void)collaborationController:(id)a3 showQuotaExceededAlertIfNeededWithRecordID:(id)a4 accountID:(id)a5;
- (void)collaborationController:(id)a3 userAcceptedInvitationWithShareMetadata:(id)a4 associatedObjectID:(id)a5;
- (void)didFailToUpdateShareWithError:(id)a3;
- (void)fetchAndAcceptShareMetadataWithURL:(id)a3 windowScene:(id)a4 managedObjectContext:(id)a5 alertBlock:(id)a6 showObjectBlock:(id)a7;
- (void)notesCloudContextDidFetchShare:(id)a3;
- (void)populateParticipantDetailsForCloudSharingController:(id)a3;
- (void)presentFolderActivityViewControllerWithFolder:(id)a3 presentingViewController:(id)a4 sourceItem:(id)a5 sourceView:(id)a6 sourceRect:(CGRect)a7 completion:(id)a8;
- (void)presentSendNoteActivityViewControllerWithPresentingWindow:(id)a3 presentingViewController:(id)a4 sourceItem:(id)a5 sourceView:(id)a6 sourceRect:(CGRect)a7 note:(id)a8 excludedTypes:(id)a9 eventReporter:(id)a10 didPresentActivityHandler:(id)a11;
- (void)processShareAcceptanceWithMetadata:(id)a3 windowScene:(id)a4 managedObjectContext:(id)a5 alertBlock:(id)a6 showObjectBlock:(id)a7;
- (void)setAccount:(id)a3;
- (void)setFolder:(id)a3;
- (void)setNote:(id)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setWindowScenesByObjectID:(id)a3;
- (void)showCloudSharingControllerForFolder:(id)a3 presentingViewController:(id)a4 popoverBarButtonItem:(id)a5 presented:(id)a6 dismissed:(id)a7;
- (void)showCloudSharingControllerForNote:(id)a3 presentingViewController:(id)a4 popoverBarButtonItem:(id)a5 presented:(id)a6 dismissed:(id)a7;
- (void)showFolderActivityViewControllerWithFolder:(id)a3 presentingViewController:(id)a4 sourceItem:(id)a5 sourceView:(id)a6 sourceRect:(CGRect)a7 itemProvider:(id)a8 completion:(id)a9;
- (void)trackCollaborationActionAddPeopleForObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5;
- (void)trackCollaborationActionFirstShareForObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5;
- (void)trackCollaborationActionSecondCancelForObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5;
- (void)trackCollaborationActionSecondShareForObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5;
- (void)trackCollaborationNotificationAcceptanceForObject:(id)a3 shareURL:(id)a4;
- (void)trackShareActionForNote:(id)a3 activityType:(id)a4 collaborationSelected:(BOOL)a5 countOfCollaboratorsAdded:(int64_t)a6 countOfCollaboratorsRemoved:(int64_t)a7 startInvitedCount:(int64_t)a8 startAcceptedCount:(int64_t)a9 endInvitedCount:(int64_t)a10 endAcceptedCount:(int64_t)a11;
@end

@implementation ICCollaborationUIController

- (ICCollaborationUIController)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICCollaborationUIController;
  v2 = [(ICCollaborationUIController *)&v6 init];
  if (v2)
  {
    v3 = +[NSMapTable strongToWeakObjectsMapTable];
    [(ICCollaborationUIController *)v2 setWindowScenesByObjectID:v3];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"notesCloudContextDidFetchShare:" name:ICNotesCloudContextDidFetchShareNotification object:0];
  }
  return v2;
}

+ (ICCollaborationUIController)sharedInstance
{
  if (qword_1006AA260 != -1) {
    dispatch_once(&qword_1006AA260, &stru_1006297B0);
  }
  v2 = (void *)qword_1006AA268;

  return (ICCollaborationUIController *)v2;
}

- (void)setWindowScenesByObjectID:(id)a3
{
}

- (void)associateWindowScene:(id)a3 withURL:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if (v6)
  {
    v7 = v6;
    id v8 = [objc_alloc((Class)NSURLComponents) initWithURL:v6 resolvingAgainstBaseURL:0];
    [v8 setQuery:0];
    v9 = [v8 URL];

    v10 = [(ICCollaborationUIController *)self windowScenesByObjectID];
    objc_sync_enter(v10);
    v11 = [(ICCollaborationUIController *)self windowScenesByObjectID];
    [v11 setObject:v12 forKey:v9];

    objc_sync_exit(v10);
  }
}

- (id)windowSceneForURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    id v6 = [objc_alloc((Class)NSURLComponents) initWithURL:v4 resolvingAgainstBaseURL:0];
    [v6 setQuery:0];
    v7 = [v6 URL];

    id v8 = [(ICCollaborationUIController *)self windowScenesByObjectID];
    objc_sync_enter(v8);
    v9 = [(ICCollaborationUIController *)self windowScenesByObjectID];
    v10 = [v9 objectForKey:v7];

    objc_sync_exit(v8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)eventReporterForURL:(id)a3
{
  if (a3)
  {
    v3 = -[ICCollaborationUIController windowSceneForURL:](self, "windowSceneForURL:");
    id v4 = objc_alloc((Class)ICNAEventReporter);
    id v5 = [v4 initWithSubTrackerName:kICNASubtrackerNameCollaborationController windowScene:v3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (ICAccount)account
{
  v3 = [(ICCollaborationUIController *)self note];
  id v4 = [v3 folder];
  id v5 = [v4 account];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(ICCollaborationUIController *)self folder];
    id v7 = [v8 account];
  }

  return (ICAccount *)v7;
}

- (id)cloudSharingControllerForObject:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 shortLoggingDescription];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Creating cloud sharing controller for %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x3032000000;
  v20 = sub_1000A1530;
  v21 = sub_1000A1540;
  id v22 = 0;
  id v7 = [v4 cloudAccount];
  id v8 = [v7 identifier];
  BOOL v9 = [v8 length] == 0;

  if (v9)
  {
    v11 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1004D8F54();
    }

    id v10 = *(id *)(*((void *)&buf + 1) + 40);
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000A1548;
    v13[3] = &unk_1006255E8;
    id v14 = v7;
    v16 = self;
    p_long long buf = &buf;
    id v15 = v4;
    [v14 performBlockInPersonaContext:v13];
    id v10 = *(id *)(*((void *)&buf + 1) + 40);
  }
  _Block_object_dispose(&buf, 8);

  return v10;
}

- (void)showCloudSharingControllerForFolder:(id)a3 presentingViewController:(id)a4 popoverBarButtonItem:(id)a5 presented:(id)a6 dismissed:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  [(ICCollaborationUIController *)self setPresentingBarButtonItem:v14];
  [(ICCollaborationUIController *)self setPresentingViewController:v13];
  [(ICCollaborationUIController *)self setFolder:v12];
  [(ICCollaborationUIController *)self setNote:0];
  v17 = [v12 account];
  v18 = [v17 identifier];

  uint64_t v19 = [v13 ic_windowScene];
  v20 = [v12 objectID];
  v21 = [v20 URIRepresentation];
  [(ICCollaborationUIController *)self associateWindowScene:v19 withURL:v21];

  id v22 = objc_opt_class();
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000A1DA8;
  v29[3] = &unk_100627D78;
  v29[4] = self;
  id v30 = v12;
  id v31 = v18;
  id v32 = v14;
  id v33 = v13;
  id v34 = v16;
  id v35 = v15;
  id v23 = v15;
  id v24 = v13;
  id v25 = v14;
  id v26 = v16;
  id v27 = v18;
  id v28 = v12;
  [v22 showSharingUIWithSanityChecksForFolder:v28 presentingViewController:v24 showSharingUIBlock:v29];
}

- (void)showCloudSharingControllerForNote:(id)a3 presentingViewController:(id)a4 popoverBarButtonItem:(id)a5 presented:(id)a6 dismissed:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  [(ICCollaborationUIController *)self setPresentingBarButtonItem:v14];
  [(ICCollaborationUIController *)self setPresentingViewController:v13];
  [(ICCollaborationUIController *)self setNote:v12];
  [(ICCollaborationUIController *)self setFolder:0];
  v17 = [(ICCollaborationUIController *)self account];
  v18 = [v13 ic_windowScene];
  uint64_t v19 = [v12 objectID];
  v20 = [v19 URIRepresentation];
  [(ICCollaborationUIController *)self associateWindowScene:v18 withURL:v20];

  v21 = +[ICCollaborationController sharedInstance];
  id v22 = [(ICCollaborationUIController *)self note];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000A2334;
  v29[3] = &unk_100627D78;
  id v30 = v17;
  id v31 = self;
  id v32 = v12;
  id v33 = v14;
  id v34 = v13;
  id v35 = v16;
  id v36 = v15;
  id v23 = v15;
  id v24 = v13;
  id v25 = v14;
  id v26 = v16;
  id v27 = v12;
  id v28 = v17;
  [v21 fetchShareIfNecessaryForObject:v22 completionHandler:v29];
}

- (void)didFailToUpdateShareWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCollaborationUIController *)self presentingViewController];

  if (!v5) {
    goto LABEL_11;
  }
  id v6 = v4;
  id v7 = [v6 domain];
  if ([v7 isEqualToString:CKErrorDomain]) {
    goto LABEL_5;
  }
  id v8 = [v6 userInfo];
  BOOL v9 = [v8 objectForKeyedSubscript:NSUnderlyingErrorKey];

  if (v9)
  {
    id v7 = [v6 userInfo];
    uint64_t v10 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    id v6 = (id)v10;
LABEL_5:
  }
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1000A1530;
  id v30 = sub_1000A1540;
  v11 = +[NSBundle mainBundle];
  id v31 = [v11 localizedStringForKey:@"Couldn’t Connect" value:&stru_10063F3D8 table:0];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1000A1530;
  id v24 = sub_1000A1540;
  id v12 = +[NSBundle mainBundle];
  id v25 = [v12 localizedStringForKey:@"There may be a problem with the server. Please try again later." value:&stru_10063F3D8 table:0];

  id v13 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_1004D90C4();
  }

  if ([v6 code] == (id)2)
  {
    id v14 = [v6 userInfo];
    id v15 = [v14 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1000A2CAC;
    v19[3] = &unk_100627DC8;
    v19[4] = &v26;
    v19[5] = &v20;
    [v15 enumerateKeysAndObjectsUsingBlock:v19];
  }
  uint64_t v16 = v27[5];
  uint64_t v17 = v21[5];
  v18 = [(ICCollaborationUIController *)self presentingViewController];
  +[UIAlertController ic_showAlertWithTitle:v16 message:v17 viewController:v18];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

LABEL_11:
}

- (void)presentSendNoteActivityViewControllerWithPresentingWindow:(id)a3 presentingViewController:(id)a4 sourceItem:(id)a5 sourceView:(id)a6 sourceRect:(CGRect)a7 note:(id)a8 excludedTypes:(id)a9 eventReporter:(id)a10 didPresentActivityHandler:(id)a11
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v20 = a3;
  id v21 = a4;
  unint64_t v22 = (unint64_t)a5;
  unint64_t v23 = (unint64_t)a6;
  id v24 = a8;
  id v25 = a10;
  id v26 = a11;
  if (v22 | v23)
  {
    [v21 ic_windowScene];
    id v27 = v33 = v20;
    uint64_t v28 = [v24 objectID];
    v29 = [v28 URIRepresentation];
    [(ICCollaborationUIController *)self associateWindowScene:v27 withURL:v29];

    id v30 = [v24 visibleTopLevelAttachments];
    id v31 = [v30 allObjects];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000A3058;
    v34[3] = &unk_100627E40;
    id v35 = v24;
    id v36 = v21;
    id v37 = v25;
    id v38 = (id)v22;
    id v39 = (id)v23;
    CGFloat v41 = x;
    CGFloat v42 = y;
    CGFloat v43 = width;
    CGFloat v44 = height;
    id v40 = v26;
    id v20 = v33;
    +[ICDocCamPDFGenerator generatePDFsIfNecessaryForGalleryAttachments:v31 displayWindow:v33 presentingViewController:v36 completionHandler:v34];

    id v32 = v35;
  }
  else
  {
    id v32 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1004D912C();
    }
  }
}

- (void)presentFolderActivityViewControllerWithFolder:(id)a3 presentingViewController:(id)a4 sourceItem:(id)a5 sourceView:(id)a6 sourceRect:(CGRect)a7 completion:(id)a8
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v17 = a3;
  id v18 = a4;
  unint64_t v19 = (unint64_t)a5;
  unint64_t v20 = (unint64_t)a6;
  id v21 = a8;
  unint64_t v22 = v21;
  if (v19 | v20)
  {
    unint64_t v23 = [v18 ic_windowScene];
    id v24 = [v17 objectID];
    id v25 = [v24 URIRepresentation];
    [(ICCollaborationUIController *)self associateWindowScene:v23 withURL:v25];

    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000A3A6C;
    v49[3] = &unk_100627E90;
    v49[4] = self;
    id v26 = v17;
    id v50 = v26;
    id v38 = v18;
    id v51 = v38;
    id v52 = (id)v19;
    id v53 = (id)v20;
    CGFloat v55 = x;
    CGFloat v56 = y;
    CGFloat v57 = width;
    CGFloat v58 = height;
    id v27 = v22;
    id v54 = v27;
    uint64_t v28 = objc_retainBlock(v49);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1000A3B94;
    v46[3] = &unk_100625B40;
    id v29 = v26;
    id v47 = v29;
    id v30 = v28;
    id v48 = v30;
    id v31 = objc_retainBlock(v46);
    id v32 = +[NSMutableArray array];
    switch((unint64_t)+[ICCollaborationController shareStatusOfFolder:v29 objectsForMakingDecision:v32])
    {
      case 0uLL:
      case 3uLL:
        goto LABEL_8;
      case 1uLL:
      case 2uLL:
        ((void (*)(void *))v31[2])(v31);
        break;
      case 4uLL:
        +[ICMoveAlertUtilities postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:v32 presentingViewController:v38 completionHandler:0];
LABEL_8:
        if (v27) {
          v27[2](v27);
        }
        break;
      default:
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_1000A3C1C;
        v43[3] = &unk_100627EE0;
        id v33 = v29;
        id v44 = v33;
        v45 = v27;
        id v34 = objc_retainBlock(v43);
        id v37 = [v33 rootSharedNotesIncludingChildFolders];
        id v36 = [v33 rootSharedFoldersInDescendantsIncludingSelf];
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472;
        v39[2] = sub_1000A3EB0;
        v39[3] = &unk_100625CC8;
        id v40 = v33;
        id v41 = v34;
        CGFloat v42 = v30;
        id v35 = v34;
        +[ICMoveAlertUtilities postAlertForSharingFolderWithSharedNotes:v37 sharedSubfolders:v36 presentingViewController:v38 shareHandler:v39 cancelHandler:0];

        break;
    }
  }
  else if (v21)
  {
    (*((void (**)(id))v21 + 2))(v21);
  }
}

- (void)showFolderActivityViewControllerWithFolder:(id)a3 presentingViewController:(id)a4 sourceItem:(id)a5 sourceView:(id)a6 sourceRect:(CGRect)a7 itemProvider:(id)a8 completion:(id)a9
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a8;
  id v23 = a9;
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_1000A1530;
  id v47 = sub_1000A1540;
  id v48 = 0;
  id v24 = [v18 managedObjectContext];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000A4320;
  v40[3] = &unk_100626040;
  CGFloat v42 = &v43;
  id v25 = v18;
  id v41 = v25;
  [v24 performBlockAndWait:v40];

  id v26 = [ICActivityItemProvider alloc];
  uint64_t v27 = v44[5];
  uint64_t v28 = +[ICCollaborationController shareSheetFolderThumbnailImage];
  id v29 = [(ICActivityItemProvider *)v26 initWithItemProvider:v22 title:v27 image:v28];

  id v30 = objc_alloc((Class)UIActivityViewController);
  id v50 = v29;
  id v31 = +[NSArray arrayWithObjects:&v50 count:1];
  id v32 = [v30 initWithActivityItems:v31 applicationActivities:0];

  v49[0] = ICActivityTypeShareToNote;
  v49[1] = UIActivityTypeOpenInIBooks;
  v49[2] = UIActivityTypeSharePlay;
  id v33 = +[NSArray arrayWithObjects:v49 count:3];
  [v32 setExcludedActivityTypes:v33];

  id v34 = [v25 account];
  [v32 setIsContentManaged:[v34 isManaged]];

  if (+[UIDevice ic_isVision]) {
    uint64_t v35 = -2;
  }
  else {
    uint64_t v35 = 7;
  }
  [v32 setModalPresentationStyle:v35];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000A436C;
  v38[3] = &unk_100627F08;
  id v36 = v25;
  id v39 = v36;
  [v32 setCompletionWithItemsHandler:v38];
  id v37 = [v32 popoverPresentationController];
  [v37 setSourceItem:v20];
  [v37 setSourceView:v21];
  [v37 setSourceRect:x, y, width, height];
  [v37 setPermittedArrowDirections:3];
  [v37 _setIgnoreBarButtonItemSiblings:1];
  [v19 ic_replacePresentedViewControllerWithViewController:v32 animated:1 completion:v23];

  _Block_object_dispose(&v43, 8);
}

+ (void)showSharingUIWithSanityChecksForFolder:(id)a3 presentingViewController:(id)a4 showSharingUIBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000A4630;
  v24[3] = &unk_100625B40;
  id v10 = v7;
  id v25 = v10;
  id v11 = v9;
  id v26 = v11;
  id v12 = objc_retainBlock(v24);
  id v13 = +[NSMutableArray array];
  switch((unint64_t)+[ICCollaborationController shareStatusOfFolder:v10 objectsForMakingDecision:v13])
  {
    case 0uLL:
    case 3uLL:
      break;
    case 1uLL:
    case 2uLL:
      ((void (*)(void *))v12[2])(v12);
      break;
    case 4uLL:
      +[ICMoveAlertUtilities postAlertForSharingFolderContainingLockedOrJoinedRootObjectsWithGuiltyObjects:v13 presentingViewController:v8 completionHandler:0];
      break;
    default:
      id v18 = _NSConcreteStackBlock;
      uint64_t v19 = 3221225472;
      id v20 = sub_1000A47BC;
      id v21 = &unk_100625B40;
      id v14 = v10;
      id v22 = v14;
      id v23 = v12;
      id v15 = objc_retainBlock(&v18);
      uint64_t v16 = [v14 rootSharedNotesIncludingChildFolders:v18, v19, v20, v21];
      id v17 = [v14 rootSharedFoldersInDescendantsIncludingSelf];
      +[ICMoveAlertUtilities postAlertForSharingFolderWithSharedNotes:v16 sharedSubfolders:v17 presentingViewController:v8 shareHandler:v15 cancelHandler:0];

      break;
  }
}

- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4
{
}

- (void)cloudSharingControllerDidSaveShare:(id)a3
{
  id v4 = a3;
  id v5 = [v4 share];
  id v6 = [(ICCollaborationUIController *)self account];
  id v7 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 ic_loggingDescription];
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Cloud sharing controller did save share: %@", (uint8_t *)&v11, 0xCu);
  }
  id v9 = +[ICCollaborationController sharedInstance];
  id v10 = [v6 identifier];
  [v9 didSaveShare:v5 accountID:v10];

  [(ICCollaborationUIController *)self populateParticipantDetailsForCloudSharingController:v4];
}

- (void)populateParticipantDetailsForCloudSharingController:(id)a3
{
  id v27 = a3;
  id v4 = [v27 share];
  id v29 = self;
  id v5 = [(ICCollaborationUIController *)self presentingViewController];
  id v6 = [v5 traitCollection];
  unsigned int v28 = [v6 ic_isDark];

  id v7 = objc_alloc((Class)NSMutableDictionary);
  id v8 = [v4 participants];
  id v9 = [v7 initWithCapacity:[v8 count]];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v26 = v4;
  id v10 = [v4 participants];
  id v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v31;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v15 acceptanceStatus] == (id)2)
        {
          id v16 = objc_alloc_init((Class)_UIShareParticipantDetails);
          id v17 = [v15 userIdentity];
          id v18 = [v17 userRecordID];
          uint64_t v19 = [v18 recordName];
          [v16 setParticipantID:v19];

          [v16 setDetailText:0];
          id v20 = [v16 participantID];
          id v21 = [(ICCollaborationUIController *)v29 note];
          id v22 = +[ICCollaborationController highlightColorForUserID:v20 inNote:v21 isDark:v28];
          [v16 setParticipantColor:v22];

          id v23 = [v15 userIdentity];
          id v24 = [v23 userRecordID];
          id v25 = [v24 recordName];
          [v9 setObject:v16 forKey:v25];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v12);
  }

  [v27 _setParticipantDetails:v9];
}

- (void)cloudSharingControllerDidStopSharing:(id)a3
{
  id v4 = [a3 share];
  id v5 = [(ICCollaborationUIController *)self account];
  id v6 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 ic_loggingDescription];
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cloud sharing controller did stop sharing: %@", (uint8_t *)&v11, 0xCu);
  }
  id v8 = +[ICCollaborationController sharedInstance];
  id v9 = [v4 recordID];
  id v10 = [v5 identifier];
  [v8 didStopSharing:v4 recordID:v9 accountID:v10];
}

- (id)itemThumbnailDataForCloudSharingController:(id)a3
{
  id v4 = [(ICCollaborationUIController *)self note];

  if (v4)
  {
    id v5 = +[ICCollaborationController shareSheetNoteThumbnailImage];
LABEL_5:
    id v7 = v5;
    id v8 = [v5 ic_PNGData];

    goto LABEL_6;
  }
  id v6 = [(ICCollaborationUIController *)self folder];

  if (v6)
  {
    id v5 = +[ICCollaborationController shareSheetFolderThumbnailImage];
    goto LABEL_5;
  }
  id v8 = 0;
LABEL_6:

  return v8;
}

- (id)itemTypeForCloudSharingController:(id)a3
{
  id v4 = [(ICCollaborationUIController *)self note];
  id v5 = [v4 shareType];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [(ICCollaborationUIController *)self folder];
    id v7 = [v8 shareType];
  }

  return v7;
}

- (id)itemTitleForCloudSharingController:(id)a3
{
  id v4 = [(ICCollaborationUIController *)self note];

  if (v4)
  {
    id v5 = [(ICCollaborationUIController *)self note];
    id v6 = [v5 shareTitle];
LABEL_5:

    goto LABEL_6;
  }
  id v7 = [(ICCollaborationUIController *)self folder];

  if (v7)
  {
    id v5 = +[NSBundle mainBundle];
    id v8 = [v5 localizedStringForKey:@"Share Folder: %@" value:&stru_10063F3D8 table:0];
    id v9 = [(ICCollaborationUIController *)self folder];
    id v10 = [v9 shareTitle];
    id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10);

    goto LABEL_5;
  }
  id v6 = 0;
LABEL_6:

  return v6;
}

- (void)_cloudSharingControllerDidModifyPrimarySwitch:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = os_log_create("com.apple.notes", "Collaboration");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004D9250(v3, v5);
  }

  id v6 = [(ICCollaborationUIController *)self note];
  id v7 = [v6 recordID];
  +[ICShareNotifier setShouldPreventNotifications:v3 forRecordID:v7];
}

- (void)_cloudSharingControllerDidActivateShowSharedFolder
{
  +[CATransaction begin];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000A5214;
  v3[3] = &unk_100625AF0;
  v3[4] = self;
  +[CATransaction setCompletionBlock:v3];
  +[CATransaction commit];
}

- (void)fetchAndAcceptShareMetadataWithURL:(id)a3 windowScene:(id)a4 managedObjectContext:(id)a5 alertBlock:(id)a6 showObjectBlock:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v12)
  {
    [(ICCollaborationUIController *)self associateWindowScene:a4 withURL:v12];
    id v16 = +[ICCollaborationController sharedInstance];
    [v16 fetchAndAcceptShareMetadataWithURL:v12 managedObjectContext:v13 alertBlock:v14 showObjectBlock:v15];
  }
  else
  {
    id v16 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1004D92E0();
    }
  }
}

- (void)processShareAcceptanceWithMetadata:(id)a3 windowScene:(id)a4 managedObjectContext:(id)a5 alertBlock:(id)a6 showObjectBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12)
  {
    id v17 = [v12 share];
    id v18 = [v17 URL];

    if (v18)
    {
      uint64_t v19 = [v12 share];
      id v20 = [v19 URL];
      [(ICCollaborationUIController *)self associateWindowScene:v13 withURL:v20];
    }
    id v21 = +[ICCollaborationController sharedInstance];
    [v21 processShareAcceptanceWithMetadata:v12 managedObjectContext:v14 alertBlock:v15 showObjectBlock:v16];
  }
  else
  {
    id v21 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1004D9314();
    }
  }
}

- (void)notesCloudContextDidFetchShare:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = [v3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:ICNotesCloudContextDidFetchShareNotificationShareKey];
  id v6 = ICCheckedDynamicCast();

  objc_opt_class();
  id v7 = [v3 userInfo];

  id v8 = [v7 objectForKeyedSubscript:ICNotesCloudContextDidFetchShareNotificationAccountIDKey];
  id v9 = ICCheckedDynamicCast();

  id v10 = [v6 URL];

  if (v10)
  {
    int v11 = +[ICSharedWithYouController sharedController];
    id v12 = [v11 managedObjectContext];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000E3D40;
    v15[3] = &unk_100625A00;
    id v16 = v6;
    id v17 = v9;
    id v18 = v12;
    id v13 = v12;
    [v13 performBlockAndWait:v15];

    id v14 = v16;
  }
  else
  {
    id v14 = os_log_create("com.apple.notes", "Collaboration");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1004DB360(v6);
    }
    id v13 = v14;
  }
}

- (void)trackCollaborationActionAddPeopleForObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 objectID];
  int v11 = [v10 URIRepresentation];
  id v12 = [(ICCollaborationUIController *)self eventReporterForURL:v11];

  [v12 submitCollaborationActionEventForCloudSyncingObject:v9 share:v8 isInviting:v5 inviteStep:1];
}

- (void)trackCollaborationActionFirstShareForObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 objectID];
  int v11 = [v10 URIRepresentation];
  id v12 = [(ICCollaborationUIController *)self eventReporterForURL:v11];

  [v12 submitCollaborationActionEventForCloudSyncingObject:v9 share:v8 isInviting:v5 inviteStep:2];
}

- (void)trackCollaborationActionSecondShareForObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 objectID];
  int v11 = [v10 URIRepresentation];
  id v12 = [(ICCollaborationUIController *)self eventReporterForURL:v11];

  [v12 submitCollaborationActionEventForCloudSyncingObject:v9 share:v8 isInviting:v5 inviteStep:3];
}

- (void)trackCollaborationActionSecondCancelForObject:(id)a3 share:(id)a4 isInviting:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 objectID];
  int v11 = [v10 URIRepresentation];
  id v12 = [(ICCollaborationUIController *)self eventReporterForURL:v11];

  [v12 submitCollaborationActionEventForCloudSyncingObject:v9 share:v8 isInviting:v5 inviteStep:4];
}

- (void)trackShareActionForNote:(id)a3 activityType:(id)a4 collaborationSelected:(BOOL)a5 countOfCollaboratorsAdded:(int64_t)a6 countOfCollaboratorsRemoved:(int64_t)a7 startInvitedCount:(int64_t)a8 startAcceptedCount:(int64_t)a9 endInvitedCount:(int64_t)a10 endAcceptedCount:(int64_t)a11
{
  BOOL v14 = a5;
  id v17 = a4;
  id v18 = a3;
  uint64_t v19 = [v18 objectID];
  id v20 = [v19 URIRepresentation];
  id v21 = [(ICCollaborationUIController *)self eventReporterForURL:v20];

  [v21 submitNoteSharrowEventForModernNote:v18 activityType:v17 collaborationSelected:v14 countOfCollaboratorsAdded:a6 countOfCollaboratorsRemoved:a7 startInvitedCount:a8 startAcceptedCount:a9 endInvitedCount:a10 endAcceptedCount:a11];
}

- (void)trackCollaborationNotificationAcceptanceForObject:(id)a3 shareURL:(id)a4
{
  id v12 = a4;
  id v6 = [a3 objectID];
  id v7 = [v6 URIRepresentation];
  id v8 = [(ICCollaborationUIController *)self eventReporterForURL:v7];
  id v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(ICCollaborationUIController *)self eventReporterForURL:v12];
  }
  int v11 = v10;

  [v11 submitCollabNotificationEventWithAction:1];
}

- (id)viewContextForCollaborationController:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 managedObjectContext];

  return v4;
}

- (id)backgroundContextForCollaborationController:(id)a3
{
  id v3 = +[ICNoteContext sharedContext];
  id v4 = [v3 workerManagedObjectContext];

  return v4;
}

- (id)cloudContextForCollaborationController:(id)a3
{
  return +[ICCloudContext sharedContext];
}

- (void)collaborationController:(id)a3 fetchShareMetadataWithURLs:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = +[ICSharedWithYouController sharedController];
  [v8 fetchShareMetadataWithURLs:v7 completion:v6];
}

- (void)collaborationController:(id)a3 userAcceptedInvitationWithShareMetadata:(id)a4 associatedObjectID:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = +[ICSharedWithYouController sharedController];
  [v8 userAcceptedInvitationWithShareMetadata:v7 associatedObjectID:v6];
}

- (void)collaborationController:(id)a3 persistParticipantActivityEventsOnObject:(id)a4 oldShare:(id)a5 newShare:(id)a6
{
}

- (void)collaborationController:(id)a3 persistJoinActivityEventOnObject:(id)a4
{
}

- (void)collaborationController:(id)a3 persistLeaveActivityEventOnObject:(id)a4
{
}

- (void)collaborationController:(id)a3 showQuotaExceededAlertIfNeededWithRecordID:(id)a4 accountID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [ICQuotaExceededAlertController alloc];
  id v10 = +[NSDate now];
  BOOL v14 = [(ICQuotaExceededAlertController *)v9 initWithRecordID:v8 accountID:v7 date:v10];

  [(ICQuotaExceededAlertController *)v14 setIgnoresDebouncing:1];
  int v11 = [(ICCollaborationUIController *)self presentingViewController];
  id v12 = [v11 ic_windowScene];
  id v13 = [v12 keyWindow];

  if (v13) {
    [(ICQuotaExceededAlertController *)v14 showIfNeededFromWindow:v13];
  }
}

- (void)collaborationController:(id)a3 didFailToSaveShareWithError:(id)a4
{
}

- (CKShare)newlyCreatedShare
{
  return self->_newlyCreatedShare;
}

- (NSMapTable)windowScenesByObjectID
{
  return self->_windowScenesByObjectID;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
}

- (void)setAccount:(id)a3
{
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_windowScenesByObjectID, 0);

  objc_storeStrong((id *)&self->_newlyCreatedShare, 0);
}

@end