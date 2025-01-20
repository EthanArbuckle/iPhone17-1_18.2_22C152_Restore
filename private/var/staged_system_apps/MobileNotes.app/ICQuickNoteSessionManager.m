@interface ICQuickNoteSessionManager
+ (BOOL)lastViewedDateExpired:(id)a3 currentDate:(id)a4;
+ (BOOL)requirePasscodeInContext:(id)a3 stateArchive:(id)a4;
+ (BOOL)requirePasscodeInContext:(id)a3 stateArchive:(id)a4 currentDate:(id)a5;
+ (id)sharedManager;
- (BOOL)isQuickNoteFirstLaunch;
- (BOOL)isQuickNoteSessionActive;
- (BOOL)isSecureScreenShowing;
- (ICNote)createdNoteForSession;
- (ICNoteEditorViewController)noteEditorViewController;
- (ICViewControllerManager)viewControllerManager;
- (id)newEmptyNoteInContext:(id)a3;
- (id)noteForSessionCreatingIfNecessaryInContext:(id)a3 stateArchive:(id)a4 canResume:(BOOL)a5 currentDate:(id)a6 isNewlyCreated:(BOOL *)a7;
- (id)noteForSessionCreatingIfNecessaryInContext:(id)a3 stateArchive:(id)a4 canResume:(BOOL)a5 isNewlyCreated:(BOOL *)a6;
- (void)beginSessionWithNoteEditorViewController:(id)a3;
- (void)endSession;
- (void)saveSession;
- (void)setCreatedNoteForSession:(id)a3;
- (void)setNoteEditorViewController:(id)a3;
- (void)setQuickNoteFirstLaunch:(BOOL)a3;
- (void)setQuickNoteSessionActive:(BOOL)a3;
- (void)setSecureScreenShowing:(BOOL)a3;
@end

@implementation ICQuickNoteSessionManager

+ (id)sharedManager
{
  if (qword_1006AA178 != -1) {
    dispatch_once(&qword_1006AA178, &stru_1006278D8);
  }
  v2 = (void *)qword_1006AA170;

  return v2;
}

- (ICViewControllerManager)viewControllerManager
{
  v2 = [(ICQuickNoteSessionManager *)self noteEditorViewController];
  v3 = [v2 ic_viewControllerManager];

  return (ICViewControllerManager *)v3;
}

- (BOOL)isQuickNoteFirstLaunch
{
  objc_opt_class();
  v2 = +[ICSettingsUtilities objectForKey:@"QNFirstLaunchState"];
  v3 = ICCheckedDynamicCast();

  if (v3 && ([v3 BOOLValue] & 1) == 0)
  {
    objc_opt_class();
    v5 = +[ICSettingsUtilities objectForKey:@"QNForceFirstLaunchStateTrue"];
    v6 = ICCheckedDynamicCast();

    unsigned __int8 v4 = [v6 BOOLValue];
  }
  else
  {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)setQuickNoteFirstLaunch:(BOOL)a3
{
  id v3 = +[NSNumber numberWithBool:a3];
  +[ICSettingsUtilities setObject:v3 forKey:@"QNFirstLaunchState"];
}

+ (BOOL)requirePasscodeInContext:(id)a3 stateArchive:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[NSDate date];
  LOBYTE(a1) = [a1 requirePasscodeInContext:v7 stateArchive:v6 currentDate:v8];

  return (char)a1;
}

+ (BOOL)requirePasscodeInContext:(id)a3 stateArchive:(id)a4 currentDate:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (+[ICQuickNoteSessionSettings showOnLockScreen] == (id)1
    || +[ICQuickNoteSessionSettings showOnLockScreen] == (id)3)
  {
    v10 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1004D7E40();
    }

    unsigned int v11 = 0;
  }
  else if (+[ICQuickNoteSessionSettings showOnLockScreen] == (id)2)
  {
    v14 = [v8 currentNoteLastViewedDate];
    unsigned int v11 = [a1 lastViewedDateExpired:v14 currentDate:v9];
  }
  else
  {
    unsigned int v11 = 1;
  }
  v12 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = NSStringFromSelector(a2);
    int v18 = 138413058;
    v19 = v16;
    __int16 v20 = 2112;
    v21 = v17;
    __int16 v22 = 2048;
    id v23 = +[ICQuickNoteSessionSettings showOnLockScreen];
    __int16 v24 = 2048;
    uint64_t v25 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ %@ showOnLockScreen %ld requirePasscode %ld", (uint8_t *)&v18, 0x2Au);
  }
  return v11;
}

- (id)noteForSessionCreatingIfNecessaryInContext:(id)a3 stateArchive:(id)a4 canResume:(BOOL)a5 isNewlyCreated:(BOOL *)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = +[NSDate date];
  v13 = [(ICQuickNoteSessionManager *)self noteForSessionCreatingIfNecessaryInContext:v11 stateArchive:v10 canResume:v7 currentDate:v12 isNewlyCreated:a6];

  return v13;
}

- (id)noteForSessionCreatingIfNecessaryInContext:(id)a3 stateArchive:(id)a4 canResume:(BOOL)a5 currentDate:(id)a6 isNewlyCreated:(BOOL *)a7
{
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (a7) {
    *a7 = 0;
  }
  v16 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    v38 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138413058;
    v66 = v37;
    __int16 v67 = 2112;
    v68 = v38;
    __int16 v69 = 1024;
    LODWORD(v70[0]) = v9;
    WORD2(v70[0]) = 2112;
    *(void *)((char *)v70 + 6) = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@ %@ canResume %d currentDate %@", buf, 0x26u);
  }
  if (ICInternalSettingsIsSelectionStateTrackingEnabled())
  {
    if (v9
      && +[ICQuickNoteSessionSettings showOnLockScreen] == (id)2)
    {
      v17 = +[ICSelectionStateUtilities selectedNoteObjectIDFromArchive:v14 modernManagedObjectContext:v13 legacyManagedObjectContext:0];
      id v18 = +[ICNote ic_existingObjectWithID:v17 context:v13];
      v19 = os_log_create("com.apple.notes", "QuickNote");
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
LABEL_19:

        goto LABEL_26;
      }
    }
    else
    {
      if (+[ICQuickNoteSessionSettings showOnLockScreen] != (id)3) {
        goto LABEL_31;
      }
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = [v14 currentNoteLastViewedDate];
      LOBYTE(v24) = [(id)v24 lastViewedDateExpired:v25 currentDate:v15];

      if (v24) {
        goto LABEL_31;
      }
      v17 = +[ICSelectionStateUtilities selectedNoteObjectIDFromArchive:v14 modernManagedObjectContext:v13 legacyManagedObjectContext:0];
      id v18 = +[ICNote ic_existingObjectWithID:v17 context:v13];
      v19 = os_log_create("com.apple.notes", "QuickNote");
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_19;
      }
    }
    v55 = (objc_class *)objc_opt_class();
    v63 = NSStringFromClass(v55);
    v62 = NSStringFromSelector(a2);
    uint64_t v56 = [v18 shortLoggingDescription];
    *(_DWORD *)buf = 138412802;
    v66 = v63;
    __int16 v67 = 2112;
    v68 = v62;
    __int16 v69 = 2112;
    v70[0] = v56;
    v57 = (void *)v56;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%@ %@ found %@", buf, 0x20u);

    goto LABEL_19;
  }
  if (v9
    && +[ICQuickNoteSessionSettings showOnLockScreen] == (id)2)
  {
    __int16 v20 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v51 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v51);
      v53 = NSStringFromSelector(a2);
      v54 = [v14 currentNoteObjectIDURL];
      *(_DWORD *)buf = 138412802;
      v66 = v52;
      __int16 v67 = 2112;
      v68 = v53;
      __int16 v69 = 2112;
      v70[0] = v54;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@ %@ looking for current note %@", buf, 0x20u);
    }
    v21 = [v13 persistentStoreCoordinator];
    __int16 v22 = [v14 currentNoteObjectIDURL];
    id v23 = [v21 ic_managedObjectIDForURIRepresentation:v22];
    id v18 = +[ICNote ic_existingObjectWithID:v23 context:v13];

    v19 = os_log_create("com.apple.notes", "QuickNote");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
  }
  else
  {
    if (+[ICQuickNoteSessionSettings showOnLockScreen] != (id)3) {
      goto LABEL_31;
    }
    v26 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v47 = (objc_class *)objc_opt_class();
      v48 = NSStringFromClass(v47);
      v49 = NSStringFromSelector(a2);
      v50 = [v14 currentNoteObjectIDURL];
      *(_DWORD *)buf = 138412802;
      v66 = v48;
      __int16 v67 = 2112;
      v68 = v49;
      __int16 v69 = 2112;
      v70[0] = v50;
      _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%@ %@ looking for instant note %@", buf, 0x20u);
    }
    uint64_t v27 = objc_opt_class();
    v28 = [v14 currentNoteLastViewedDate];
    LOBYTE(v27) = [(id)v27 lastViewedDateExpired:v28 currentDate:v15];

    if (v27) {
      goto LABEL_31;
    }
    v29 = [v13 persistentStoreCoordinator];
    v30 = [v14 currentNoteObjectIDURL];
    v31 = [v29 ic_managedObjectIDForURIRepresentation:v30];
    id v18 = +[ICNote ic_existingObjectWithID:v31 context:v13];

    v19 = os_log_create("com.apple.notes", "QuickNote");
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
  }
  v58 = (objc_class *)objc_opt_class();
  v64 = NSStringFromClass(v58);
  v59 = NSStringFromSelector(a2);
  uint64_t v60 = [v18 shortLoggingDescription];
  *(_DWORD *)buf = 138412802;
  v66 = v64;
  __int16 v67 = 2112;
  v68 = v59;
  __int16 v69 = 2112;
  v70[0] = v60;
  v61 = (void *)v60;
  _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%@ %@ found %@", buf, 0x20u);

LABEL_25:
  v17 = v19;
LABEL_26:

  if (v18)
  {
    if (![v18 isDeletedOrInTrash]) {
      goto LABEL_37;
    }

    v32 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
      sub_1004D7E80();
    }
  }
LABEL_31:
  id v18 = [(ICQuickNoteSessionManager *)self createdNoteForSession];
  if (!v18)
  {
    id v18 = [(ICQuickNoteSessionManager *)self newEmptyNoteInContext:v13];
    [(ICQuickNoteSessionManager *)self setCreatedNoteForSession:v18];
    if (a7) {
      *a7 = 1;
    }
    v33 = os_log_create("com.apple.notes", "QuickNote");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      v43 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v43);
      v45 = NSStringFromSelector(a2);
      v46 = [v18 shortLoggingDescription];
      *(_DWORD *)buf = 138412802;
      v66 = v44;
      __int16 v67 = 2112;
      v68 = v45;
      __int16 v69 = 2112;
      v70[0] = v46;
      _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%@ %@ created new note %@", buf, 0x20u);
    }
  }
LABEL_37:
  v34 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
  {
    v39 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v39);
    v41 = NSStringFromSelector(a2);
    v42 = [v18 shortLoggingDescription];
    *(_DWORD *)buf = 138412802;
    v66 = v40;
    __int16 v67 = 2112;
    v68 = v41;
    __int16 v69 = 2112;
    v70[0] = v42;
    _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "%@ %@ note %@", buf, 0x20u);
  }

  return v18;
}

- (void)beginSessionWithNoteEditorViewController:(id)a3
{
  id v4 = a3;
  if ([(ICQuickNoteSessionManager *)self isQuickNoteSessionActive]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!self.isQuickNoteSessionActive", "-[ICQuickNoteSessionManager beginSessionWithNoteEditorViewController:]", 1, 0, @"Beginning a quicknote session when one is active");
  }
  [(ICQuickNoteSessionManager *)self setQuickNoteSessionActive:1];
  [(ICQuickNoteSessionManager *)self setNoteEditorViewController:v4];

  v5 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004D7F24(self);
  }
}

- (void)saveSession
{
  if (![(ICQuickNoteSessionManager *)self isQuickNoteSessionActive]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isQuickNoteSessionActive", "-[ICQuickNoteSessionManager saveSession]", 1, 0, @"Attempting to save a quicknote session when one is not active");
  }
  id v3 = [(ICQuickNoteSessionManager *)self noteEditorViewController];

  if (!v3) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.noteEditorViewController", "-[ICQuickNoteSessionManager saveSession]", 1, 0, @"Attempting to save a quicknote session without a note editor");
  }
  id v4 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1004D7FEC(self);
  }

  if ([(ICQuickNoteSessionManager *)self isQuickNoteSessionActive])
  {
    v5 = [(ICQuickNoteSessionManager *)self noteEditorViewController];

    if (v5)
    {
      id v6 = [(ICQuickNoteSessionManager *)self viewControllerManager];
      BOOL v7 = [v6 windowStateArchive];

      id v8 = +[ICAppDelegate sharedInstance];
      [v8 saveQuicknoteArchiveState:v7];

      BOOL v9 = +[ICAppDelegate sharedInstance];
      [v9 saveLastBackgroundedArchiveState:v7];
    }
  }
}

- (void)endSession
{
  if (![(ICQuickNoteSessionManager *)self isQuickNoteSessionActive]) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isQuickNoteSessionActive", "-[ICQuickNoteSessionManager endSession]", 1, 0, @"Ending a quicknote session when one is not active");
  }
  id v3 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1004D80B4(self);
  }

  if (+[ICQuickNoteSessionSettings showOnLockScreen] == (id)2)
  {
    id v4 = [(ICQuickNoteSessionManager *)self noteEditorViewController];
    v5 = [v4 note];
    id v6 = +[ICNoteContext sharedContext];
    [v6 setCurrentNote:v5];
  }
  [(ICQuickNoteSessionManager *)self saveSession];
  [(ICQuickNoteSessionManager *)self setQuickNoteSessionActive:0];
  [(ICQuickNoteSessionManager *)self setNoteEditorViewController:0];
  [(ICQuickNoteSessionManager *)self setCreatedNoteForSession:0];
}

- (id)newEmptyNoteInContext:(id)a3
{
  id v3 = +[ICAccount defaultAccountInContext:a3];
  id v4 = [v3 defaultFolder];
  id v5 = +[ICNote newEmptyNoteInFolder:v4];

  objc_opt_class();
  id v6 = +[ICSettingsUtilities objectForKey:@"PaperStyle"];
  BOOL v7 = ICCheckedDynamicCast();
  unsigned int v8 = [v7 intValue];

  if (v8 <= 1) {
    __int16 v9 = 1;
  }
  else {
    __int16 v9 = v8;
  }
  [v5 setPaperStyleType:v9];

  return v5;
}

+ (BOOL)lastViewedDateExpired:(id)a3 currentDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (uint64_t)+[ICQuickNoteSessionSettings sessionDuration];
  double v8 = (double)v7;
  if (v7 == -1)
  {
    int v9 = 0;
    goto LABEL_14;
  }
  if (v5)
  {
    if (v7 == -2)
    {
      int v9 = [v5 ic_isToday] ^ 1;
      id v10 = os_log_create("com.apple.notes", "QuickNote");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_1004D817C();
      }
LABEL_12:

      goto LABEL_14;
    }
    if (v7 >= 1)
    {
      [v6 timeIntervalSinceDate:v5];
      double v12 = v11;
      id v13 = os_log_create("com.apple.notes", "QuickNote");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1004D8278();
      }

      int v9 = v12 > v8;
      id v10 = os_log_create("com.apple.notes", "QuickNote");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_1004D81F4();
      }
      goto LABEL_12;
    }
  }
  int v9 = 1;
LABEL_14:
  id v14 = os_log_create("com.apple.notes", "QuickNote");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138413058;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2048;
    double v21 = v8;
    __int16 v22 = 1024;
    int v23 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "lastViewedDateExpired:%@ currentDate:%@ sessionDuration %f expired %d", (uint8_t *)&v16, 0x26u);
  }

  return v9;
}

- (ICNoteEditorViewController)noteEditorViewController
{
  return self->_noteEditorViewController;
}

- (void)setNoteEditorViewController:(id)a3
{
}

- (BOOL)isQuickNoteSessionActive
{
  return self->_quickNoteSessionActive;
}

- (void)setQuickNoteSessionActive:(BOOL)a3
{
  self->_quickNoteSessionActive = a3;
}

- (BOOL)isSecureScreenShowing
{
  return self->_secureScreenShowing;
}

- (void)setSecureScreenShowing:(BOOL)a3
{
  self->_secureScreenShowing = a3;
}

- (ICNote)createdNoteForSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_createdNoteForSession);

  return (ICNote *)WeakRetained;
}

- (void)setCreatedNoteForSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_createdNoteForSession);

  objc_storeStrong((id *)&self->_noteEditorViewController, 0);
}

@end