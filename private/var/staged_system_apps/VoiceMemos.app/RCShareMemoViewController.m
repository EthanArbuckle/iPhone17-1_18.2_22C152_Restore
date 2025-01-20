@interface RCShareMemoViewController
+ (RCShareMemoViewController)presentedController;
+ (id)_newPresentedPrepareFailureAlertControllerForCompositions:(id)a3 source:(id)a4;
+ (void)prepareToShareCompositions:(id)a3 ignoringInteraction:(BOOL)a4 source:(id)a5 isShareButton:(BOOL)a6 shouldContinuePreparingBlock:(id)a7 preparedHandler:(id)a8 completionWithItemsHandler:(id)a9;
+ (void)presentInViewController:(id)a3 source:(id)a4 compositions:(id)a5 ignoringInteraction:(BOOL)a6 shouldContinuePreparingBlock:(id)a7 preparedToPresentBlock:(id)a8 isShareButton:(BOOL)a9 completionWithItemsHandler:(id)a10;
+ (void)setPresentedController:(id)a3;
- (BOOL)isRecentlyDeletedShown;
- (NSArray)compositions;
- (RCShareMemoViewController)initWithCompositions:(id)a3 accessTokens:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_endAccessSession;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RCShareMemoViewController

+ (RCShareMemoViewController)presentedController
{
  id WeakRetained = objc_loadWeakRetained(&qword_10026A790);

  return (RCShareMemoViewController *)WeakRetained;
}

+ (void)setPresentedController:(id)a3
{
}

+ (void)presentInViewController:(id)a3 source:(id)a4 compositions:(id)a5 ignoringInteraction:(BOOL)a6 shouldContinuePreparingBlock:(id)a7 preparedToPresentBlock:(id)a8 isShareButton:(BOOL)a9 completionWithItemsHandler:(id)a10
{
  BOOL v27 = a6;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000617EC;
  v38[3] = &unk_100221DE0;
  id v39 = a8;
  id v28 = v39;
  id v19 = a10;
  v20 = objc_retainBlock(v38);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100061804;
  v36[3] = &unk_100221E40;
  id v37 = v18;
  id v21 = v18;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100061820;
  v29[3] = &unk_100221E88;
  id v30 = v15;
  id v31 = v16;
  v34 = objc_retainBlock(v36);
  id v35 = a1;
  id v32 = v17;
  id v33 = v20;
  id v22 = v17;
  v23 = v34;
  id v24 = v16;
  id v25 = v15;
  v26 = v20;
  +[RCShareMemoViewController prepareToShareCompositions:v22 ignoringInteraction:v27 source:v24 isShareButton:a9 shouldContinuePreparingBlock:v23 preparedHandler:v29 completionWithItemsHandler:v19];
}

+ (void)prepareToShareCompositions:(id)a3 ignoringInteraction:(BOOL)a4 source:(id)a5 isShareButton:(BOOL)a6 shouldContinuePreparingBlock:(id)a7 preparedHandler:(id)a8 completionWithItemsHandler:(id)a9
{
  id v10 = a3;
  v11 = (void (**)(id, RCShareMemoViewController *, void))a8;
  id v25 = a9;
  v12 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v19 = +[RCSSavedRecordingService sharedService];
        v20 = [v18 composedAVURL];
        uint64_t v26 = 0;
        id v21 = [v19 prepareToExportCompositionAVURL:v20 error:&v26];

        if (v21) {
          [v12 addObject:v21];
        }
      }
      id v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  id v22 = [v12 count];
  if (v22 == [v13 count])
  {
    v23 = [[RCShareMemoViewController alloc] initWithCompositions:v13 accessTokens:v12];
    +[RCShareMemoViewController setPresentedController:v23];
    if (!a6) {
      [(RCShareMemoViewController *)v23 setSharingStyle:1];
    }
    if (v25) {
      [(RCShareMemoViewController *)v23 setCompletionWithItemsHandler:v25];
    }
    v11[2](v11, v23, 0);
  }
}

- (RCShareMemoViewController)initWithCompositions:(id)a3 accessTokens:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[RCShareMemoHelper shareableCompositionsFromCompositions:v7];
  if ([(RCShareMemoViewController *)self isRecentlyDeletedShown])
  {
    id v10 = 0;
  }
  else
  {
    id v10 = +[RCShareMemoHelper customActivitiesForShareableCompositions:v9];
  }
  v16.receiver = self;
  v16.super_class = (Class)RCShareMemoViewController;
  v11 = [(RCShareMemoViewController *)&v16 initWithActivityItems:v9 applicationActivities:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_shareableCompositions, v9);
    objc_storeStrong((id *)&v12->_compositions, a3);
    objc_storeStrong((id *)&v12->_accessTokens, a4);
    id v13 = +[RCShareMemoHelper customActivityTypes];
    [(RCShareMemoViewController *)v12 setActivityTypeOrder:v13];

    id v14 = +[RCShareMemoHelper unsupportedActivityTypes];
    [(RCShareMemoViewController *)v12 setExcludedActivityTypes:v14];

    [(RCShareMemoViewController *)v12 setShowKeyboardAutomatically:1];
  }

  return v12;
}

- (void)_endAccessSession
{
  if ([(NSArray *)self->_accessTokens count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v3 = self->_accessTokens;
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        id v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * (void)v7);
          v9 = +[RCSSavedRecordingService sharedService];
          [v9 endAccessSessionWithToken:v8 error:0];

          id v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    accessTokens = self->_accessTokens;
    self->_accessTokens = 0;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  +[RCAnalyticsUtilities sendDidOpenShareMemoController];
  v5.receiver = self;
  v5.super_class = (Class)RCShareMemoViewController;
  [(RCShareMemoViewController *)&v5 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(RCShareMemoViewController *)self _endAccessSession];
  +[RCShareMemoViewController setPresentedController:0];
  v5.receiver = self;
  v5.super_class = (Class)RCShareMemoViewController;
  [(RCShareMemoViewController *)&v5 viewWillDisappear:v3];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)isRecentlyDeletedShown
{
  v2 = +[UIApplication sharedApplication];
  BOOL v3 = [v2 delegate];

  id v4 = [v3 defaultSceneDelegate];
  objc_super v5 = [v4 mainViewController];

  LOBYTE(v4) = [v5 isShowingRecentlyDeleted];
  return (char)v4;
}

+ (id)_newPresentedPrepareFailureAlertControllerForCompositions:(id)a3 source:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSBundle mainBundle];
  uint64_t v8 = [v7 localizedStringForKey:@"PREPARE_TO_SHARE_MEMO_FAILED_TITLE" value:&stru_100228BC8 table:0];

  v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"PREPARE_TO_SHARE_MEMOS_FAILED_MESSAGE_FORMAT" value:&stru_100228BC8 table:0];
  id v11 = [v6 count];

  long long v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v11);

  long long v13 = +[UIAlertController alertControllerWithTitle:v8 message:v12 preferredStyle:0];
  long long v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"OK" value:&stru_100228BC8 table:0];
  objc_super v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:0];
  [v13 addAction:v16];

  id v17 = +[UIApplication sharedApplication];
  id v18 = [v17 delegate];
  id v19 = [v18 window];
  v20 = [v19 rootViewController];

  [v13 rc_configurePopoverControllerWithSource:v5];
  [v20 presentViewController:v13 animated:1 completion:0];

  return v13;
}

- (NSArray)compositions
{
  return self->_compositions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositions, 0);
  objc_storeStrong((id *)&self->_shareableCompositions, 0);

  objc_storeStrong((id *)&self->_accessTokens, 0);
}

@end