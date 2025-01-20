@interface ICDeleteDecisionController
+ (void)deleteHTMLFoldersIfNeeded:(id)a3 eventReporter:(id)a4;
+ (void)deleteHTMLNotesIfNeeded:(id)a3 eventReporter:(id)a4;
+ (void)deleteModernFoldersIfNeeded:(id)a3 eventReporter:(id)a4 completion:(id)a5;
+ (void)deleteModernNotesIfNeeded:(id)a3 eventReporter:(id)a4 completion:(id)a5;
+ (void)deleteSharesInFolder:(id)a3 completion:(id)a4;
- (BOOL)allowsRecentlyDeletedFolderAlert;
- (BOOL)didAuthenticate;
- (BOOL)shouldBypassDeleteFolderAlerts;
- (ICDeleteDecision)deleteDecision;
- (ICDeleteDecisionController)initWithSourceObjects:(id)a3 allowsRecentlyDeletedFolderAlert:(BOOL)a4 window:(id)a5;
- (ICDeleteDecisionController)initWithSourceObjects:(id)a3 allowsRecentlyDeletedFolderAlert:(BOOL)a4 window:(id)a5 sender:(id)a6 eventReporter:(id)a7;
- (ICDeleteDecisionController)initWithSourceObjects:(id)a3 window:(id)a4;
- (ICDeleteDecisionController)initWithSourceObjects:(id)a3 window:(id)a4 sender:(id)a5 eventReporter:(id)a6;
- (ICNAEventReporter)eventReporter;
- (NSArray)sourceObjects;
- (NSString)actionName;
- (UIWindow)window;
- (id)sender;
- (void)authenticateIfNeededWithCompletion:(id)a3;
- (void)commonInitWithSourceObjects:(id)a3 allowsRecentlyDeletedFolderAlert:(BOOL)a4 window:(id)a5;
- (void)deleteHTMLFoldersIfNeeded;
- (void)deleteHTMLNotesIfNeeded;
- (void)deleteModernFoldersIfNeeded:(id)a3;
- (void)deleteModernNotesIfNeeded:(id)a3;
- (void)deleteObjects;
- (void)eventReporterLostSession:(id)a3;
- (void)performAdditionalStepWithCompletion:(id)a3;
- (void)performDecision;
- (void)performDecisionWithCompletion:(id)a3;
- (void)setDidAuthenticate:(BOOL)a3;
- (void)setWindow:(id)a3;
@end

@implementation ICDeleteDecisionController

- (ICDeleteDecisionController)initWithSourceObjects:(id)a3 window:(id)a4
{
  return [(ICDeleteDecisionController *)self initWithSourceObjects:a3 allowsRecentlyDeletedFolderAlert:1 window:a4];
}

- (ICDeleteDecisionController)initWithSourceObjects:(id)a3 allowsRecentlyDeletedFolderAlert:(BOOL)a4 window:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICDeleteDecisionController;
  v10 = [(ICDeleteDecisionController *)&v13 init];
  v11 = v10;
  if (v10) {
    [(ICDeleteDecisionController *)v10 commonInitWithSourceObjects:v8 allowsRecentlyDeletedFolderAlert:v6 window:v9];
  }

  return v11;
}

- (ICDeleteDecisionController)initWithSourceObjects:(id)a3 window:(id)a4 sender:(id)a5 eventReporter:(id)a6
{
  return [(ICDeleteDecisionController *)self initWithSourceObjects:a3 allowsRecentlyDeletedFolderAlert:1 window:a4 sender:a5 eventReporter:a6];
}

- (ICDeleteDecisionController)initWithSourceObjects:(id)a3 allowsRecentlyDeletedFolderAlert:(BOOL)a4 window:(id)a5 sender:(id)a6 eventReporter:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)ICDeleteDecisionController;
  v16 = [(ICDeleteDecisionController *)&v19 init];
  v17 = v16;
  if (v16)
  {
    [(ICDeleteDecisionController *)v16 commonInitWithSourceObjects:v12 allowsRecentlyDeletedFolderAlert:v10 window:v13];
    objc_storeWeak(&v17->_sender, v14);
    objc_storeStrong((id *)&v17->_eventReporter, a7);
  }

  return v17;
}

- (void)commonInitWithSourceObjects:(id)a3 allowsRecentlyDeletedFolderAlert:(BOOL)a4 window:(id)a5
{
  BOOL v6 = a4;
  id v8 = (NSArray *)a3;
  id v9 = (UIWindow *)a5;
  self->_didAuthenticate = 0;
  sourceObjects = self->_sourceObjects;
  self->_sourceObjects = v8;
  id v14 = v8;

  v11 = [[ICDeleteDecision alloc] initWithSourceObjects:v14 allowsRecentlyDeletedFolderAlert:v6];
  deleteDecision = self->_deleteDecision;
  self->_deleteDecision = v11;

  window = self->_window;
  self->_window = v9;
}

- (BOOL)allowsRecentlyDeletedFolderAlert
{
  v2 = [(ICDeleteDecisionController *)self deleteDecision];
  unsigned __int8 v3 = [v2 allowsRecentlyDeletedFolderAlert];

  return v3;
}

- (void)performDecision
{
}

- (void)performDecisionWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = [(ICDeleteDecisionController *)self deleteDecision];
  id v6 = [v5 type];

  if (v6 == (id)2)
  {
    if (v4) {
      v4[2](v4, 0);
    }
  }
  else if (v6 == (id)1)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000935BC;
    v7[3] = &unk_100627958;
    v7[4] = self;
    id v8 = v4;
    [(ICDeleteDecisionController *)self performAdditionalStepWithCompletion:v7];
  }
  else if (!v6)
  {
    [(ICDeleteDecisionController *)self deleteObjects];
    if (v4) {
      v4[2](v4, 1);
    }
  }
}

+ (void)deleteSharesInFolder:(id)a3 completion:(id)a4
{
  id v11 = a3;
  v5 = (void (**)(id, void))a4;
  if ([v11 isSmartFolder])
  {
    if (v5) {
      v5[2](v5, 0);
    }
  }
  else
  {
    id v6 = +[NSMutableArray array];
    v7 = [v11 rootSharedFoldersInDescendantsIncludingSelf];
    [v6 addObjectsFromArray:v7];

    id v8 = [v11 rootSharedNotesIncludingChildFolders];
    [v6 addObjectsFromArray:v8];

    if ([v6 count])
    {
      id v9 = +[ICCloudContext sharedContext];
      id v10 = [v6 copy];
      [v9 deleteSharesForObjects:v10 completionHandler:v5];
    }
    else if (v5)
    {
      v5[2](v5, 0);
    }
  }
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter
    && +[ICNAEventReporter isOptedInForAnalytics])
  {
    id v3 = objc_alloc((Class)ICNAEventReporter);
    uint64_t v4 = kICNASubtrackerNameDeleteDecisionController;
    v5 = [(ICDeleteDecisionController *)self window];
    id v6 = (ICNAEventReporter *)[v3 initWithSubTrackerName:v4 window:v5];
    eventReporter = self->_eventReporter;
    self->_eventReporter = v6;

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"eventReporterLostSession:" name:ICNAEventReporterLostSessionNotification object:self->_eventReporter];
  }
  id v9 = self->_eventReporter;

  return v9;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = ICNAEventReporterLostSessionNotification;
  v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (NSString)actionName
{
  v2 = [(ICDeleteDecisionController *)self deleteDecision];
  id v3 = [v2 modernFolders];
  if ([v3 count])
  {
  }
  else
  {
    uint64_t v4 = [v2 htmlFolders];
    id v5 = [v4 count];

    if (!v5)
    {
      id v9 = [v2 htmlNotes];
      id v10 = [v9 count];

      id v11 = [v2 modernNotes];
      id v12 = [v11 count];

      id v13 = [v2 modernNotes];
      id v14 = [v13 firstObject];
      id v15 = [v14 folder];
      unsigned int v16 = [v15 isTrashFolder];

      if (v10) {
        id v17 = v10;
      }
      else {
        id v17 = v12;
      }
      if (v10) {
        int v18 = 1;
      }
      else {
        int v18 = v16;
      }
      objc_super v19 = +[NSBundle mainBundle];
      uint64_t v6 = v19;
      if (v18) {
        CFStringRef v20 = @"Delete %lu Notes";
      }
      else {
        CFStringRef v20 = @"Trash %lu Notes";
      }
      v21 = [v19 localizedStringForKey:v20 value:&stru_10063F3D8 table:0];
      v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, v17);

      goto LABEL_5;
    }
  }
  uint64_t v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"Delete Folder" value:&stru_10063F3D8 table:0];
LABEL_5:

  return (NSString *)v7;
}

- (void)authenticateIfNeededWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(ICDeleteDecisionController *)self deleteDecision];
  uint64_t v6 = [v5 modernSourceObjects];
  if (![v6 count])
  {

    goto LABEL_7;
  }
  unsigned __int8 v7 = [(ICDeleteDecisionController *)self didAuthenticate];

  if (v7)
  {
LABEL_7:
    v4[2](v4, 1);
    goto LABEL_19;
  }
  id v8 = [(ICDeleteDecisionController *)self deleteDecision];
  id v9 = [v8 modernFolders];

  if ([v9 count] && objc_msgSend(v9, "ic_allSatisfy:", &stru_100627998))
  {
    v4[2](v4, 1);
  }
  else
  {
    id v10 = [(ICDeleteDecisionController *)self deleteDecision];
    id v11 = [v10 modernNotes];

    if (![v11 count])
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v12 = [(ICDeleteDecisionController *)self deleteDecision];
      id v13 = [v12 modernFolders];

      id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v27;
        do
        {
          unsigned int v16 = 0;
          id v17 = v11;
          do
          {
            if (*(void *)v27 != v15) {
              objc_enumerationMutation(v13);
            }
            int v18 = [*(id *)(*((void *)&v26 + 1) + 8 * (void)v16) visibleNotesIncludingChildFolders];
            id v11 = [v17 ic_arrayByAddingObjectsFromNonNilArray:v18];

            unsigned int v16 = (char *)v16 + 1;
            id v17 = v11;
          }
          while (v14 != v16);
          id v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v14);
      }
    }
    objc_initWeak(&location, self);
    objc_super v19 = +[ICAuthenticationPrompt promptForDeletingNotes:v11];
    CFStringRef v20 = +[ICAuthentication shared];
    v21 = [(ICDeleteDecisionController *)self window];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100093EA4;
    v22[3] = &unk_1006279C0;
    objc_copyWeak(&v24, &location);
    v23 = v4;
    [v20 authenticateWithPrompt:v19 displayWindow:v21 completionHandler:v22];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
LABEL_19:
}

- (void)deleteObjects
{
  if (!+[NSThread isMainThread]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICDeleteDecisionController deleteObjects]", 1, 0, @"Unexpected call from background thread");
  }
  id v3 = +[ICAuthenticationState sharedState];
  [v3 extendDeauthenticationTimer];

  [(ICDeleteDecisionController *)self setDidAuthenticate:0];
  uint64_t v4 = +[ICAppDelegate sharedInstance];
  id v5 = [v4 undoManager];

  [v5 beginUndoGrouping];
  uint64_t v6 = [(ICDeleteDecisionController *)self actionName];
  [v5 setActionName:v6];

  [(ICDeleteDecisionController *)self deleteHTMLNotesIfNeeded];
  [(ICDeleteDecisionController *)self deleteHTMLFoldersIfNeeded];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100094088;
  v8[3] = &unk_100625860;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(ICDeleteDecisionController *)self deleteModernNotesIfNeeded:v8];
}

- (void)deleteHTMLNotesIfNeeded
{
  id v3 = objc_opt_class();
  id v6 = [(ICDeleteDecisionController *)self deleteDecision];
  uint64_t v4 = [v6 htmlNotes];
  id v5 = [(ICDeleteDecisionController *)self eventReporter];
  [v3 deleteHTMLNotesIfNeeded:v4 eventReporter:v5];
}

+ (void)deleteHTMLNotesIfNeeded:(id)a3 eventReporter:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v19 = v5;
    id obj = v5;
    id v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          id v12 = os_log_create("com.apple.notes", "Delete");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v26 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Deleting HTML note: %@", buf, 0xCu);
          }

          objc_opt_class();
          id v13 = ICDynamicCast();
          id v14 = +[NotesApp sharedNotesApp];
          uint64_t v15 = [v14 noteContext];
          [v15 deleteNote:v13];

          unsigned int v16 = +[NotesApp sharedNotesApp];
          id v17 = [v16 noteContext];
          int v18 = [v17 managedObjectContext];
          [v18 ic_save];

          [v6 submitNoteDeleteEventForHTMLNote:v13];
        }
        id v8 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v8);
    }

    id v5 = v19;
  }
}

- (void)deleteHTMLFoldersIfNeeded
{
  id v3 = objc_opt_class();
  id v6 = [(ICDeleteDecisionController *)self deleteDecision];
  uint64_t v4 = [v6 htmlFolders];
  id v5 = [(ICDeleteDecisionController *)self eventReporter];
  [v3 deleteHTMLFoldersIfNeeded:v4 eventReporter:v5];
}

+ (void)deleteHTMLFoldersIfNeeded:(id)a3 eventReporter:(id)a4
{
  id v4 = a3;
  if ([v4 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v13 = v4;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = os_log_create("com.apple.notes", "Delete");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v19 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleting HTML folder: %@", buf, 0xCu);
          }

          id v12 = os_log_create("com.apple.notes", "Delete");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Deleting HTML folders is unsupported on iOS.", buf, 2u);
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v7);
    }

    id v4 = v13;
  }
}

- (void)deleteModernNotesIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v8 = [(ICDeleteDecisionController *)self deleteDecision];
  id v6 = [v8 modernNotes];
  id v7 = [(ICDeleteDecisionController *)self eventReporter];
  [v5 deleteModernNotesIfNeeded:v6 eventReporter:v7 completion:v4];
}

+ (void)deleteModernNotesIfNeeded:(id)a3 eventReporter:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      id v13 = 0;
      do
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v7);
        }
        [v8 submitNoteDeleteEventForModernNote:*(void *)(*((void *)&v20 + 1) + 8 * (void)v13)];
        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  long long v14 = +[ICCloudContext sharedContext];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000948F0;
  v17[3] = &unk_100625230;
  id v18 = v7;
  id v19 = v9;
  id v15 = v9;
  id v16 = v7;
  [v14 deleteSharesForObjects:v16 completionHandler:v17];
}

- (void)deleteModernFoldersIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v8 = [(ICDeleteDecisionController *)self deleteDecision];
  id v6 = [v8 modernFolders];
  id v7 = [(ICDeleteDecisionController *)self eventReporter];
  [v5 deleteModernFoldersIfNeeded:v6 eventReporter:v7 completion:v4];
}

+ (void)deleteModernFoldersIfNeeded:(id)a3 eventReporter:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v18 = (void (**)(void))a5;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v7;
  id v9 = [v7 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v35;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(obj);
        }
        [v8 submitFolderDeleteEventForModernFolder:*(void *)(*((void *)&v34 + 1) + 8 * (void)v11)];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v9);
  }
  if ([obj count])
  {
    uint64_t v12 = dispatch_group_create();
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v19 = obj;
    id v13 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v27;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v19);
          }
          uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v15);
          dispatch_group_enter(v12);
          ++v31[3];
          long long v17 = objc_opt_class();
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_100094E78;
          v23[3] = &unk_100627A08;
          v23[4] = v16;
          long long v24 = v12;
          v25 = &v30;
          [v17 deleteSharesInFolder:v16 completion:v23];

          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v19 countByEnumeratingWithState:&v26 objects:v38 count:16];
      }
      while (v13);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100095048;
    block[3] = &unk_100625988;
    long long v22 = v18;
    dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(&v30, 8);
  }
  else if (v18)
  {
    v18[2]();
  }
}

- (void)performAdditionalStepWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = [(ICDeleteDecisionController *)self deleteDecision];
  id v6 = [v5 additionalStep];

  switch((unint64_t)v6)
  {
    case 0uLL:
      v4[2](v4, 0);
      goto LABEL_35;
    case 1uLL:
      id v7 = [(ICDeleteDecisionController *)self deleteDecision];
      id v8 = [v7 modernNotes];
      id v9 = [v8 count];

      if (v9 == (id)1)
      {
        uint64_t v10 = 0;
        goto LABEL_31;
      }
      long long v29 = [(ICDeleteDecisionController *)self deleteDecision];
      unsigned int v30 = [v29 containsUnsharedObjects];

      BOOL v31 = v30 == 0;
      uint64_t v32 = 1;
      goto LABEL_28;
    case 2uLL:
      if ([(ICDeleteDecisionController *)self shouldBypassDeleteFolderAlerts]) {
        goto LABEL_21;
      }
      id v11 = [(ICDeleteDecisionController *)self window];
      uint64_t v12 = [(ICDeleteDecisionController *)self sender];
      uint64_t v13 = 3;
      goto LABEL_33;
    case 3uLL:
      uint64_t v14 = [(ICDeleteDecisionController *)self deleteDecision];
      id v15 = [v14 modernNotes];
      id v16 = [v15 count];

      if (v16 == (id)1)
      {
        uint64_t v10 = 4;
      }
      else
      {
        uint64_t v33 = [(ICDeleteDecisionController *)self deleteDecision];
        unsigned int v34 = [v33 containsUnsharedObjects];

        BOOL v31 = v34 == 0;
        uint64_t v32 = 5;
LABEL_28:
        if (v31) {
          uint64_t v10 = v32;
        }
        else {
          uint64_t v10 = v32 + 1;
        }
      }
LABEL_31:
      long long v35 = [(ICDeleteDecisionController *)self deleteDecision];
      long long v36 = [v35 modernNotes];
      id v37 = [v36 count];
      v38 = [(ICDeleteDecisionController *)self window];
      v39 = [(ICDeleteDecisionController *)self sender];
      +[ICDeleteAlert showAlertForDeletingObjectsWithType:v10 count:v37 window:v38 sender:v39 completion:v4];

      goto LABEL_35;
    case 4uLL:
      if ([(ICDeleteDecisionController *)self shouldBypassDeleteFolderAlerts]) {
        goto LABEL_21;
      }
      id v11 = [(ICDeleteDecisionController *)self window];
      uint64_t v12 = [(ICDeleteDecisionController *)self sender];
      uint64_t v13 = 7;
      goto LABEL_33;
    case 5uLL:
      long long v17 = [(ICDeleteDecisionController *)self deleteDecision];
      id v18 = [v17 guiltyObjects];
      if ([v18 count] == (id)1) {
        uint64_t v19 = 8;
      }
      else {
        uint64_t v19 = 9;
      }

      id v11 = [(ICDeleteDecisionController *)self deleteDecision];
      long long v20 = [v11 guiltyObjects];
      id v21 = [v20 count];
      long long v22 = [(ICDeleteDecisionController *)self window];
      long long v23 = [(ICDeleteDecisionController *)self sender];
      +[ICDeleteAlert showAlertForDeletingObjectsWithType:v19 count:v21 window:v22 sender:v23 completion:v4];

      goto LABEL_34;
    case 6uLL:
      if ([(ICDeleteDecisionController *)self shouldBypassDeleteFolderAlerts])
      {
LABEL_21:
        v4[2](v4, 1);
      }
      else
      {
        id v11 = [(ICDeleteDecisionController *)self window];
        uint64_t v12 = [(ICDeleteDecisionController *)self sender];
        uint64_t v13 = 10;
LABEL_33:
        +[ICDeleteAlert showAlertForDeletingObjectsWithType:v13 count:1 window:v11 sender:v12 completion:v4];

LABEL_34:
      }
LABEL_35:

      return;
    case 7uLL:
      id v11 = [(ICDeleteDecisionController *)self window];
      uint64_t v12 = [(ICDeleteDecisionController *)self sender];
      uint64_t v13 = 13;
      goto LABEL_33;
    case 8uLL:
      id v11 = [(ICDeleteDecisionController *)self deleteDecision];
      long long v24 = [v11 guiltyObjects];
      id v25 = [v24 count];
      long long v26 = [(ICDeleteDecisionController *)self window];
      long long v27 = [(ICDeleteDecisionController *)self sender];
      uint64_t v28 = 11;
      goto LABEL_24;
    case 9uLL:
      id v11 = [(ICDeleteDecisionController *)self window];
      uint64_t v12 = [(ICDeleteDecisionController *)self sender];
      uint64_t v13 = 12;
      goto LABEL_33;
    case 0xAuLL:
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100095614;
      v40[3] = &unk_100627958;
      v40[4] = self;
      v41 = v4;
      [(ICDeleteDecisionController *)self authenticateIfNeededWithCompletion:v40];

      goto LABEL_35;
    case 0xBuLL:
      +[ICDeleteDecision setDidShowMoveToRecentlyDeletedFolderAlert:1];
      id v11 = [(ICDeleteDecisionController *)self deleteDecision];
      long long v24 = [v11 guiltyObjects];
      id v25 = [v24 count];
      long long v26 = [(ICDeleteDecisionController *)self window];
      long long v27 = [(ICDeleteDecisionController *)self sender];
      uint64_t v28 = 15;
LABEL_24:
      +[ICDeleteAlert showAlertForDeletingObjectsWithType:v28 count:v25 window:v26 sender:v27 completion:v4];

      goto LABEL_34;
    case 0xCuLL:
      id v11 = [(ICDeleteDecisionController *)self window];
      uint64_t v12 = [(ICDeleteDecisionController *)self sender];
      uint64_t v13 = 17;
      goto LABEL_33;
    case 0xDuLL:
      [(ICDeleteDecisionController *)self authenticateIfNeededWithCompletion:v4];
      goto LABEL_35;
    default:
      goto LABEL_35;
  }
}

- (BOOL)shouldBypassDeleteFolderAlerts
{
  return 0;
}

- (NSArray)sourceObjects
{
  return self->_sourceObjects;
}

- (ICDeleteDecision)deleteDecision
{
  return self->_deleteDecision;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (BOOL)didAuthenticate
{
  return self->_didAuthenticate;
}

- (void)setDidAuthenticate:(BOOL)a3
{
  self->_didAuthenticate = a3;
}

- (id)sender
{
  id WeakRetained = objc_loadWeakRetained(&self->_sender);

  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_sender);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_deleteDecision, 0);
  objc_storeStrong((id *)&self->_sourceObjects, 0);

  objc_storeStrong((id *)&self->_eventReporter, 0);
}

@end