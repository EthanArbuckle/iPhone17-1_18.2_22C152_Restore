@interface ICNoteBrowseDataSource
- (BOOL)isTrashFolder;
- (BOOL)needsReindexWithCollectionDifference:(id)a3 controller:(id)a4 identifiersToReload:(id)a5;
- (BOOL)shouldIncludeInvitations;
- (BOOL)shouldIncludeSubfolders;
- (BOOL)shouldIncludeTagDetail;
- (BOOL)shouldIncludeTags;
- (BOOL)shouldStyleForCalculator;
- (ICFolderCustomNoteSortType)sortType;
- (ICFolderDataSource)folderDataSource;
- (ICNAViewController)presentingViewController;
- (ICNoteBrowseDataSource)initWithCollectionView:(id)a3 presentingViewController:(id)a4 noteContainerViewMode:(int64_t)a5 folderDataSource:(id)a6 persistenceConfiguration:(id)a7;
- (ICNoteContainer)noteContainer;
- (ICNoteCoreDataIndexer)indexer;
- (ICPersistenceConfiguration)persistenceConfiguration;
- (ICQuery)noteQuery;
- (ICSelectorDelayer)lockedNotesMigratorDidMigrateNoteDelayer;
- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder;
- (NSManagedObjectContext)legacyViewContext;
- (NSManagedObjectContext)modernBackgroundContext;
- (NSManagedObjectContext)modernViewContext;
- (NSObject)editorExtensionDidSaveNotificationObserver;
- (NSObject)noteMigrationObserver;
- (NoteCollectionObject)noteCollection;
- (id)emptyConfigurationForNoteWithObjectID:(id)a3;
- (id)tagSelectionDidChangeHandler;
- (id)unsupportedFolderInfoButtonTapHandler;
- (int)dateHeadersType;
- (int64_t)noteContainerViewMode;
- (unint64_t)pinnedNotesSectionMinimumCount;
- (unint64_t)totalFolderCount;
- (unint64_t)totalInvitationsCount;
- (unint64_t)totalNoteCount;
- (void)accountHidesNotesInCustomFoldersDidChange:(id)a3;
- (void)dealloc;
- (void)managedObjectContextUpdaterDidMerge:(id)a3;
- (void)noteLockManagerDidToggleLock:(id)a3;
- (void)reindexDataAnimatedYes;
- (void)setDateHeadersType:(int)a3;
- (void)setEditorExtensionDidSaveNotificationObserver:(id)a3;
- (void)setLegacyViewContext:(id)a3;
- (void)setModernBackgroundContext:(id)a3;
- (void)setModernViewContext:(id)a3;
- (void)setNoteCollection:(id)a3;
- (void)setNoteContainer:(id)a3;
- (void)setNoteContainerViewMode:(int64_t)a3;
- (void)setNoteMigrationObserver:(id)a3;
- (void)setNoteQuery:(id)a3;
- (void)setPersistenceConfiguration:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setShouldIncludeInvitations:(BOOL)a3;
- (void)setShouldIncludeSubfolders:(BOOL)a3;
- (void)setShouldIncludeTagDetail:(BOOL)a3;
- (void)setShouldIncludeTags:(BOOL)a3;
- (void)setSortType:(id)a3;
- (void)setSortType:(id)a3 force:(BOOL)a4;
- (void)setTagSelectionDidChangeHandler:(id)a3;
- (void)setVirtualSmartFolder:(id)a3;
- (void)updateIndexerForCurrentNoteContainerViewMode;
@end

@implementation ICNoteBrowseDataSource

- (void)setShouldIncludeTags:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICNoteBrowseDataSource *)self indexer];
  [v4 setShouldIncludeTags:v3];
}

- (NSManagedObjectContext)modernViewContext
{
  v2 = [(ICNoteBrowseDataSource *)self persistenceConfiguration];
  BOOL v3 = [v2 modernViewContext];

  return (NSManagedObjectContext *)v3;
}

- (BOOL)shouldIncludeSubfolders
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  unsigned __int8 v3 = [v2 shouldIncludeSubfolders];

  return v3;
}

- (void)setDateHeadersType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(ICNoteBrowseDataSource *)self indexer];
  [v4 setDateHeadersType:v3];
}

- (void)setShouldIncludeTagDetail:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICNoteBrowseDataSource *)self indexer];
  [v4 setShouldIncludeTagDetail:v3];
}

- (NSManagedObjectContext)legacyViewContext
{
  v2 = [(ICNoteBrowseDataSource *)self persistenceConfiguration];
  BOOL v3 = [v2 legacyViewContext];

  return (NSManagedObjectContext *)v3;
}

- (BOOL)shouldStyleForCalculator
{
  v2 = [(ICNoteBrowseDataSource *)self collectionView];
  BOOL v3 = [v2 ic_behavior] == (id)1;

  return v3;
}

- (NSManagedObjectContext)modernBackgroundContext
{
  v2 = [(ICNoteBrowseDataSource *)self persistenceConfiguration];
  BOOL v3 = [v2 modernBackgroundContext];

  return (NSManagedObjectContext *)v3;
}

- (void)setShouldIncludeInvitations:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICNoteBrowseDataSource *)self indexer];
  [v4 setShouldIncludeInvitations:v3];
}

- (void)setSortType:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(ICNoteBrowseDataSource *)self updateIndexerForCurrentNoteContainerViewMode];
  id v7 = [(ICNoteBrowseDataSource *)self indexer];
  [v7 setSortType:v6 force:v4];
}

- (void)setNoteContainer:(id)a3
{
  id v4 = a3;
  v5 = [(ICNoteBrowseDataSource *)self indexer];
  [v5 setNoteContainer:v4];

  [(ICNoteBrowseDataSource *)self updateIndexerForCurrentNoteContainerViewMode];
}

- (id)emptyConfigurationForNoteWithObjectID:(id)a3
{
  id v4 = a3;
  if (objc_msgSend(v4, "ic_isModernNoteType"))
  {
    v5 = [(ICNoteBrowseDataSource *)self modernViewContext];
    id v6 = [v5 ic_existingObjectWithID:v4];

    id v7 = [[ICNoteResultsCellConfiguration alloc] initWithNote:v6];
    v8 = [(ICNoteBrowseDataSource *)self noteContainer];
    v9 = [v8 customNoteSortType];
    [(ICNoteResultsCellConfiguration *)v7 setFolderNoteSortType:v9];

    v10 = [(ICNoteBrowseDataSource *)self virtualSmartFolder];
    v11 = [v10 type];
    -[ICNoteResultsCellConfiguration setShowParticipantsInfo:](v7, "setShowParticipantsInfo:", [v11 isEqual:ICVirtualSmartFolderItemIdentifierTypeSharedWithYou]);

    v12 = [(ICNoteBrowseDataSource *)self virtualSmartFolder];
    v13 = [v12 type];
    unsigned __int8 v14 = [v13 isEqualToString:ICVirtualSmartFolderItemIdentifierTypeSystemPaper];

    if ([(ICNoteBrowseDataSource *)self shouldStyleForCalculator] || (v14 & 1) != 0)
    {
      [(ICNoteResultsCellConfiguration *)v7 setShowFolderName:0];
    }
    else
    {
      v15 = [(ICNoteBrowseDataSource *)self noteContainer];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        v16 = [(ICNoteBrowseDataSource *)self noteContainer];
        v17 = ICDynamicCast();
        if ([v17 isSmartFolder])
        {
          [(ICNoteResultsCellConfiguration *)v7 setShowFolderName:1];
        }
        else
        {
          v26 = [(ICNoteBrowseDataSource *)self noteQuery];
          [(ICNoteResultsCellConfiguration *)v7 setShowFolderName:v26 != 0];
        }
      }
      else
      {
        [(ICNoteResultsCellConfiguration *)v7 setShowFolderName:1];
      }
    }
    objc_opt_class();
    v27 = [(ICNoteBrowseDataSource *)self noteContainer];
    v28 = ICDynamicCast();
    [(ICNoteResultsCellConfiguration *)v7 setIsDisplayedInFolder:v28 != 0];

    v20 = [(ICNoteBrowseDataSource *)self folderDataSource];
    if ((unint64_t)[v20 countOfAllVisibleAccounts] >= 2)
    {
      v21 = [(ICNoteBrowseDataSource *)self noteQuery];
      if (!v21)
      {
        v29 = [(ICNoteBrowseDataSource *)self virtualSmartFolder];
        if (v29)
        {
          v30 = [(ICNoteBrowseDataSource *)self virtualSmartFolder];
          v31 = [v30 accountObjectID];
          [(ICNoteResultsCellConfiguration *)v7 setShowAccountName:v31 == 0];
        }
        else
        {
          [(ICNoteResultsCellConfiguration *)v7 setShowAccountName:0];
        }

        goto LABEL_27;
      }
      v23 = v7;
      BOOL v22 = 1;
LABEL_21:
      [(ICNoteResultsCellConfiguration *)v23 setShowAccountName:v22];
LABEL_27:

      goto LABEL_28;
    }
    goto LABEL_22;
  }
  if (objc_msgSend(v4, "ic_isLegacyNoteType"))
  {
    v18 = [(ICNoteBrowseDataSource *)self legacyViewContext];
    id v6 = [v18 ic_existingObjectWithID:v4];

    id v7 = [[ICNoteResultsCellConfiguration alloc] initWithNote:v6];
    v19 = [(ICNoteBrowseDataSource *)self noteCollection];
    objc_opt_class();
    [(ICNoteResultsCellConfiguration *)v7 setShowFolderName:objc_opt_isKindOfClass() & 1];

    v20 = [(ICNoteBrowseDataSource *)self noteCollection];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [(ICNoteBrowseDataSource *)self folderDataSource];
      BOOL v22 = (unint64_t)[v21 countOfAllVisibleAccounts] > 1;
      v23 = v7;
      goto LABEL_21;
    }
LABEL_22:
    [(ICNoteResultsCellConfiguration *)v7 setShowAccountName:0];
LABEL_28:

    [(ICNoteResultsCellConfiguration *)v7 setHideThumbnailImage:[(ICNoteBrowseDataSource *)self isTrashFolder]];
    goto LABEL_29;
  }
  if (!objc_msgSend(v4, "ic_isInvitationType"))
  {
    id v7 = 0;
    goto LABEL_30;
  }
  v24 = [(ICNoteBrowseDataSource *)self modernViewContext];
  id v6 = [v24 ic_existingObjectWithID:v4];

  id v7 = [[ICNoteResultsCellConfiguration alloc] initWithInvitation:v6];
  v25 = [(ICNoteBrowseDataSource *)self folderDataSource];
  -[ICNoteResultsCellConfiguration setShowAccountName:](v7, "setShowAccountName:", (unint64_t)[v25 countOfAllVisibleAccounts] > 1);

  [(ICNoteResultsCellConfiguration *)v7 setShowFolderName:0];
LABEL_29:

LABEL_30:

  return v7;
}

- (ICQuery)noteQuery
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  BOOL v3 = [v2 noteQuery];

  return (ICQuery *)v3;
}

- (NoteCollectionObject)noteCollection
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  BOOL v3 = [v2 noteCollection];

  return (NoteCollectionObject *)v3;
}

- (void)updateIndexerForCurrentNoteContainerViewMode
{
  unint64_t v3 = [(ICNoteBrowseDataSource *)self pinnedNotesSectionMinimumCount];
  id v4 = [(ICNoteBrowseDataSource *)self indexer];
  [v4 setPinnedNotesSectionMinimumCount:v3];

  v5 = [(ICNoteBrowseDataSource *)self indexer];
  [v5 setShouldIncludeOutlineParentItems:1];

  BOOL v6 = [(ICNoteBrowseDataSource *)self noteContainerViewMode] == 0;
  id v7 = [(ICNoteBrowseDataSource *)self indexer];
  v8 = [v7 folderIndexer];
  [v8 setShouldIncludeSubfolders:v6];

  if ((id)[(ICNoteBrowseDataSource *)self noteContainerViewMode] == (id)1) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 0;
  }

  [(ICNoteBrowseDataSource *)self setAutoExpandMode:v9];
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (unint64_t)pinnedNotesSectionMinimumCount
{
  if ([(ICNoteBrowseDataSource *)self isTrashFolder]) {
    return -1;
  }
  id v4 = [(ICNoteBrowseDataSource *)self noteContainer];
  if ([v4 isShowingDateHeaders]) {
    goto LABEL_6;
  }
  v5 = [(ICNoteBrowseDataSource *)self virtualSmartFolder];
  if ([v5 isShowingDateHeaders])
  {

LABEL_6:
    return 1;
  }
  BOOL v6 = [(ICNoteBrowseDataSource *)self indexer];
  unsigned __int8 v7 = [v6 isShowingDateHeaders];

  if (v7) {
    return 1;
  }
  int64_t v8 = [(ICNoteBrowseDataSource *)self noteContainerViewMode];
  switch(v8)
  {
    case -1:
      uint64_t v9 = os_log_create("com.apple.notes", "UI");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        sub_1004D3E98(v9);
      }

      return 1;
    case 0:
      return 1;
    case 1:
      return 5;
    default:
      return 0;
  }
}

- (void)setShouldIncludeSubfolders:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICNoteBrowseDataSource *)self indexer];
  [v4 setShouldIncludeSubfolders:v3];
}

- (ICNoteBrowseDataSource)initWithCollectionView:(id)a3 presentingViewController:(id)a4 noteContainerViewMode:(int64_t)a5 folderDataSource:(id)a6 persistenceConfiguration:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id obj = a6;
  id v14 = a7;
  v82 = v12;
  objc_initWeak(location, v12);
  objc_initWeak(&from, self);
  [(ICNoteBrowseDataSource *)self setPersistenceConfiguration:v14];
  v15 = [v14 legacyViewContext];
  [(ICNoteBrowseDataSource *)self setLegacyViewContext:v15];

  v16 = [v14 modernViewContext];
  [(ICNoteBrowseDataSource *)self setModernViewContext:v16];

  v17 = [v14 modernBackgroundContext];
  [(ICNoteBrowseDataSource *)self setModernBackgroundContext:v17];
  v74 = v14;

  id v18 = objc_alloc((Class)ICNoteCoreDataIndexer);
  v19 = [(ICNoteBrowseDataSource *)self legacyViewContext];
  v20 = [(ICNoteBrowseDataSource *)self modernBackgroundContext];
  id v81 = [v18 initWithLegacyManagedObjectContext:v19 modernManagedObjectContext:v20];

  uint64_t v21 = objc_opt_class();
  v129[0] = _NSConcreteStackBlock;
  v129[1] = 3221225472;
  v129[2] = sub_100037FB4;
  v129[3] = &unk_1006252D0;
  v130[1] = (id)a5;
  objc_copyWeak(v130, &from);
  uint64_t v22 = +[UICollectionViewCellRegistration registrationWithCellClass:v21 configurationHandler:v129];
  objc_initWeak(&v128, v13);
  uint64_t v23 = objc_opt_class();
  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472;
  v124[2] = sub_10003811C;
  v124[3] = &unk_1006252F8;
  objc_copyWeak(&v125, &from);
  objc_copyWeak(&v126, &v128);
  objc_copyWeak(&v127, location);
  v76 = +[UICollectionViewCellRegistration registrationWithCellClass:v23 configurationHandler:v124];
  uint64_t v24 = objc_opt_class();
  v25 = (void *)v22;
  int64_t v75 = a5;
  v121[0] = _NSConcreteStackBlock;
  v121[1] = 3221225472;
  v121[2] = sub_1000382C8;
  v121[3] = &unk_100625320;
  objc_copyWeak(&v122, &from);
  objc_copyWeak(&v123, location);
  v26 = +[UICollectionViewCellRegistration registrationWithCellClass:v24 configurationHandler:v121];
  v27 = (objc_class *)objc_opt_class();
  v28 = NSStringFromClass(v27);
  uint64_t v29 = +[UINib nibWithNibName:v28 bundle:0];

  v118[0] = _NSConcreteStackBlock;
  v118[1] = 3221225472;
  v118[2] = sub_100038440;
  v118[3] = &unk_100625348;
  objc_copyWeak(&v119, &from);
  objc_copyWeak(&v120, location);
  v79 = (void *)v29;
  v30 = +[UICollectionViewCellRegistration registrationWithCellNib:v29 configurationHandler:v118];
  v31 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v31);
  uint64_t v33 = +[UINib nibWithNibName:v32 bundle:0];
  v78 = v13;

  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472;
  v115[2] = sub_100038558;
  v115[3] = &unk_100625370;
  objc_copyWeak(&v116, &from);
  objc_copyWeak(&v117, location);
  v77 = (void *)v33;
  v34 = +[UICollectionViewCellRegistration registrationWithCellNib:v33 configurationHandler:v115];
  uint64_t v35 = objc_opt_class();
  v113[0] = _NSConcreteStackBlock;
  v113[1] = 3221225472;
  v113[2] = sub_10003865C;
  v113[3] = &unk_100625400;
  objc_copyWeak(&v114, &from);
  v36 = +[UICollectionViewCellRegistration registrationWithCellClass:v35 configurationHandler:v113];
  uint64_t v37 = objc_opt_class();
  v111[0] = _NSConcreteStackBlock;
  v111[1] = 3221225472;
  v111[2] = sub_100038984;
  v111[3] = &unk_100625478;
  objc_copyWeak(&v112, &from);
  v38 = +[UICollectionViewCellRegistration registrationWithCellClass:v37 configurationHandler:v111];
  v39 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:UICollectionElementKindSectionHeader configurationHandler:&stru_1006254B8];
  v40 = +[UICollectionViewSupplementaryRegistration registrationWithSupplementaryClass:objc_opt_class() elementKind:UICollectionElementKindSectionFooter configurationHandler:&stru_1006254F8];
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_100038E30;
  v102[3] = &unk_100625520;
  id v73 = v25;
  id v103 = v73;
  id v70 = v36;
  id v104 = v70;
  id v69 = v38;
  id v105 = v69;
  objc_copyWeak(&v110, &from);
  v72 = v76;
  v106 = v72;
  id v67 = v34;
  id v107 = v67;
  id v71 = v26;
  id v108 = v71;
  id v68 = v30;
  id v109 = v68;
  v41 = objc_retainBlock(v102);
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472;
  v98[2] = sub_100039018;
  v98[3] = &unk_100625548;
  objc_copyWeak(&v101, &from);
  id v42 = v39;
  id v99 = v42;
  id v43 = v40;
  id v100 = v43;
  v44 = objc_retainBlock(v98);
  v97.receiver = self;
  v97.super_class = (Class)ICNoteBrowseDataSource;
  v45 = [(ICNoteBrowseDataSource *)&v97 initWithCollectionView:v82 cellProvider:v41 indexer:v81];
  v46 = v45;
  v47 = v78;
  v48 = v79;
  v49 = v77;
  if (v45)
  {
    v66 = v44;
    objc_storeWeak((id *)&v45->_presentingViewController, v78);
    objc_storeWeak((id *)&v46->_folderDataSource, obj);
    id v50 = objc_alloc_init((Class)UICollectionViewDiffableDataSourceSectionSnapshotHandlers);
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_100039160;
    v95[3] = &unk_100625570;
    objc_copyWeak(&v96, &from);
    [v50 setShouldExpandItemHandler:v95];
    v93[0] = _NSConcreteStackBlock;
    v93[1] = 3221225472;
    v93[2] = sub_1000391EC;
    v93[3] = &unk_100625570;
    objc_copyWeak(&v94, &from);
    [v50 setShouldCollapseItemHandler:v93];
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_100039278;
    v91[3] = &unk_100625598;
    objc_copyWeak(&v92, &from);
    [v50 setWillExpandItemHandler:v91];
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_10003937C;
    v89[3] = &unk_100625598;
    objc_copyWeak(&v90, &from);
    [v50 setWillCollapseItemHandler:v89];
    v51 = [(ICNoteBrowseDataSource *)v46 collectionViewDiffableDataSource];
    [v51 setSectionSnapshotHandlers:v50];

    [(ICNoteBrowseDataSource *)v46 setSectionTypes:&off_10064B578];
    v52 = [(ICNoteBrowseDataSource *)v46 collectionViewDiffableDataSource];
    [v52 setSupplementaryViewProvider:v66];

    [(ICNoteBrowseDataSource *)v46 setNoteContainerViewMode:v75];
    v53 = (ICSelectorDelayer *)[objc_alloc((Class)ICSelectorDelayer) initWithTarget:v46 selector:"reindexDataAnimatedYes" delay:1 waitToFireUntilRequestsStop:0 callOnMainThread:0.3];
    lockedNotesMigratorDidMigrateNoteDelayer = v46->_lockedNotesMigratorDidMigrateNoteDelayer;
    v46->_lockedNotesMigratorDidMigrateNoteDelayer = v53;

    v55 = +[ICNoteContext sharedContext];
    v56 = [v55 crossProcessChangeCoordinator];
    uint64_t v57 = ICLockedNotesModeMigratorDidMigrateNoteNotification;
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_100039480;
    v86[3] = &unk_1006255C0;
    objc_copyWeak(&v87, location);
    objc_copyWeak(&v88, &from);
    uint64_t v58 = [v56 registerForCrossProcessNotificationName:v57 block:v86];
    noteMigrationObserver = v46->_noteMigrationObserver;
    v46->_noteMigrationObserver = v58;

    v60 = +[ICNoteContext sharedContext];
    v61 = [v60 crossProcessChangeCoordinator];
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_10003951C;
    v83[3] = &unk_1006255C0;
    objc_copyWeak(&v84, location);
    objc_copyWeak(&v85, &from);
    uint64_t v62 = [v61 registerForEditorExtensionDidSaveNotificationWithBlock:v83];
    editorExtensionDidSaveNotificationObserver = v46->_editorExtensionDidSaveNotificationObserver;
    v46->_editorExtensionDidSaveNotificationObserver = v62;

    objc_destroyWeak(&v85);
    objc_destroyWeak(&v84);
    objc_destroyWeak(&v88);
    objc_destroyWeak(&v87);
    objc_destroyWeak(&v90);
    objc_destroyWeak(&v92);
    objc_destroyWeak(&v94);
    objc_destroyWeak(&v96);

    v47 = v78;
    v48 = v79;
    v49 = v77;
    v44 = v66;
  }
  v64 = v46;

  objc_destroyWeak(&v101);
  objc_destroyWeak(&v110);

  objc_destroyWeak(&v112);
  objc_destroyWeak(&v114);

  objc_destroyWeak(&v117);
  objc_destroyWeak(&v116);

  objc_destroyWeak(&v120);
  objc_destroyWeak(&v119);

  objc_destroyWeak(&v123);
  objc_destroyWeak(&v122);

  objc_destroyWeak(&v127);
  objc_destroyWeak(&v126);
  objc_destroyWeak(&v125);
  objc_destroyWeak(&v128);

  objc_destroyWeak(v130);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return v64;
}

- (ICNoteContainer)noteContainer
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  BOOL v3 = [v2 noteContainer];

  return (ICNoteContainer *)v3;
}

- (ICNoteCoreDataIndexer)indexer
{
  objc_opt_class();
  v6.receiver = self;
  v6.super_class = (Class)ICNoteBrowseDataSource;
  BOOL v3 = [(ICNoteBrowseDataSource *)&v6 indexer];
  id v4 = ICDynamicCast();

  return (ICNoteCoreDataIndexer *)v4;
}

- (BOOL)isTrashFolder
{
  BOOL v3 = [(ICNoteBrowseDataSource *)self noteContainer];
  if ([v3 isTrashFolder])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    v5 = [(ICNoteBrowseDataSource *)self virtualSmartFolder];
    unsigned __int8 v4 = [v5 isTrashFolder];
  }
  return v4;
}

- (unint64_t)totalNoteCount
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  id v3 = [v2 totalNoteCount];

  return (unint64_t)v3;
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  id v3 = [v2 virtualSmartFolder];

  return (ICVirtualSmartFolderItemIdentifier *)v3;
}

- (unint64_t)totalInvitationsCount
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  id v3 = [v2 totalInvitationsCount];

  return (unint64_t)v3;
}

- (unint64_t)totalFolderCount
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  id v3 = [v2 totalFolderCount];

  return (unint64_t)v3;
}

- (void)setTagSelectionDidChangeHandler:(id)a3
{
}

- (void)setPersistenceConfiguration:(id)a3
{
}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  if (self->_noteContainerViewMode != a3)
  {
    self->_noteContainerViewMode = a3;
    v5 = [(ICNoteBrowseDataSource *)self collectionView];
    [v5 setNoteContainerViewMode:a3];

    [(ICNoteBrowseDataSource *)self updateIndexerForCurrentNoteContainerViewMode];
  }
}

- (void)setModernViewContext:(id)a3
{
}

- (void)setModernBackgroundContext:(id)a3
{
}

- (void)setLegacyViewContext:(id)a3
{
}

- (ICPersistenceConfiguration)persistenceConfiguration
{
  return self->_persistenceConfiguration;
}

- (ICFolderDataSource)folderDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderDataSource);

  return (ICFolderDataSource *)WeakRetained;
}

- (void)dealloc
{
  id v3 = +[ICNoteContext sharedContext];
  unsigned __int8 v4 = [v3 crossProcessChangeCoordinator];
  v5 = [(ICNoteBrowseDataSource *)self noteMigrationObserver];
  [v4 removeCrossProcessNotificationObserver:v5];

  objc_super v6 = +[ICNoteContext sharedContext];
  unsigned __int8 v7 = [v6 crossProcessChangeCoordinator];
  int64_t v8 = [(ICNoteBrowseDataSource *)self editorExtensionDidSaveNotificationObserver];
  [v7 removeCrossProcessNotificationObserver:v8];

  v9.receiver = self;
  v9.super_class = (Class)ICNoteBrowseDataSource;
  [(ICNoteBrowseDataSource *)&v9 dealloc];
}

- (BOOL)shouldIncludeTags
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  unsigned __int8 v3 = [v2 shouldIncludeTags];

  return v3;
}

- (BOOL)shouldIncludeTagDetail
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  unsigned __int8 v3 = [v2 shouldIncludeTagDetail];

  return v3;
}

- (BOOL)shouldIncludeInvitations
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  unsigned __int8 v3 = [v2 shouldIncludeInvitations];

  return v3;
}

- (void)setNoteCollection:(id)a3
{
  id v4 = a3;
  v5 = [(ICNoteBrowseDataSource *)self indexer];
  [v5 setNoteCollection:v4];

  [(ICNoteBrowseDataSource *)self updateIndexerForCurrentNoteContainerViewMode];
}

- (void)setNoteQuery:(id)a3
{
  id v4 = a3;
  v5 = [(ICNoteBrowseDataSource *)self indexer];
  [v5 setNoteQuery:v4];

  [(ICNoteBrowseDataSource *)self updateIndexerForCurrentNoteContainerViewMode];
}

- (void)setVirtualSmartFolder:(id)a3
{
  id v4 = a3;
  v5 = [(ICNoteBrowseDataSource *)self indexer];
  [v5 setVirtualSmartFolder:v4];

  [(ICNoteBrowseDataSource *)self updateIndexerForCurrentNoteContainerViewMode];
}

- (ICFolderCustomNoteSortType)sortType
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  unsigned __int8 v3 = [v2 sortType];

  return (ICFolderCustomNoteSortType *)v3;
}

- (void)setSortType:(id)a3
{
}

- (int)dateHeadersType
{
  v2 = [(ICNoteBrowseDataSource *)self indexer];
  int v3 = [v2 dateHeadersType];

  return v3;
}

- (BOOL)needsReindexWithCollectionDifference:(id)a3 controller:(id)a4 identifiersToReload:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  unsigned __int8 v29 = 0;
  v25.receiver = self;
  v25.super_class = (Class)ICNoteBrowseDataSource;
  unsigned __int8 v29 = [(ICNoteBrowseDataSource *)&v25 needsReindexWithCollectionDifference:v8 controller:v9 identifiersToReload:v10];
  if (*((unsigned char *)v27 + 24))
  {
    int v11 = 1;
  }
  else
  {
    id v12 = [(ICNoteBrowseDataSource *)self indexer];
    unsigned __int8 v13 = [v12 isShowingDateHeaders];

    if (v13)
    {
      id v14 = +[NSMutableSet set];
      v15 = [v8 insertions];
      v16 = [v8 removals];
      v17 = [v15 arrayByAddingObjectsFromArray:v16];

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100039AF0;
      v20[3] = &unk_100625610;
      id v18 = v14;
      id v21 = v18;
      uint64_t v23 = self;
      uint64_t v24 = &v26;
      id v22 = v9;
      [v17 enumerateObjectsUsingBlock:v20];
      int v11 = *((unsigned __int8 *)v27 + 24);
    }
    else
    {
      int v11 = *((unsigned __int8 *)v27 + 24);
    }
  }
  _Block_object_dispose(&v26, 8);

  return v11 != 0;
}

- (void)reindexDataAnimatedYes
{
}

- (void)accountHidesNotesInCustomFoldersDidChange:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)ICNoteBrowseDataSource;
  [(ICNoteBrowseDataSource *)&v19 accountHidesNotesInCustomFoldersDidChange:a3];
  id v4 = [(ICNoteBrowseDataSource *)self indexer];
  [v4 updateContainerPredicate];

  [(ICNoteBrowseDataSource *)self reloadDataAnimated:1];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(ICNoteBrowseDataSource *)self collectionView];
  objc_super v6 = [v5 indexPathsForVisibleItems];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v10);
        objc_opt_class();
        id v12 = [(ICNoteBrowseDataSource *)self collectionView];
        unsigned __int8 v13 = [v12 cellForItemAtIndexPath:v11];
        id v14 = ICDynamicCast();

        [v14 updateNoteCount];
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)noteLockManagerDidToggleLock:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 object];
  objc_super v6 = ICCheckedDynamicCast();

  id v7 = [v6 updatedNote];

  if (v7)
  {
    id v8 = [v6 updatedNote];
    uint64_t v9 = [v8 objectID];
    id v10 = +[NSSet setWithObject:v9];
    uint64_t v11 = [(ICNoteBrowseDataSource *)self associatedCellsForItemIdentifiers:v10];
    id v12 = [v11 anyObject];

    unsigned __int8 v13 = [v6 updatedNote];
    id v14 = [v13 objectID];
    long long v15 = [(ICNoteBrowseDataSource *)self emptyConfigurationForNoteWithObjectID:v14];
    objc_opt_class();
    long long v16 = ICDynamicCast();
    [v16 setConfiguration:v15];
  }
  v17.receiver = self;
  v17.super_class = (Class)ICNoteBrowseDataSource;
  [(ICNoteBrowseDataSource *)&v17 noteLockManagerDidToggleLock:v4];
}

- (void)managedObjectContextUpdaterDidMerge:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 userInfo];
  objc_super v6 = [v5 objectForKeyedSubscript:ICManagedObjectContextUpdaterChangeDictionaryKey];
  id v7 = ICCheckedDynamicCast();

  id v8 = [v7 objectForKey:NSInsertedObjectIDsKey];
  uint64_t v9 = [v7 objectForKey:NSDeletedObjectIDsKey];
  id v10 = [v7 objectForKey:NSUpdatedObjectIDsKey];
  uint64_t v11 = [(ICNoteBrowseDataSource *)self indexer];
  id v12 = [v11 noteContainer];
  unsigned int v13 = [v12 isAllNotesContainer];

  if (!v13)
  {
    id v21 = [(ICNoteBrowseDataSource *)self indexer];
    id v22 = [v21 noteContainer];

    uint64_t v23 = [(ICNoteBrowseDataSource *)self indexer];
    uint64_t v24 = v23;
    if (v22)
    {
      objc_super v25 = [v23 noteContainer];
      uint64_t v26 = [v25 objectID];
      unsigned __int8 v27 = [v10 containsObject:v26];

      if ((v27 & 1) == 0) {
        goto LABEL_4;
      }
    }
    else
    {
      v31 = [v23 noteCollection];

      if (v31) {
        goto LABEL_4;
      }
    }
LABEL_10:
    uint64_t v28 = [(ICNoteBrowseDataSource *)self collectionView];
    unsigned __int8 v29 = [v28 window];
    BOOL v30 = v29 != 0;

    [(ICNoteBrowseDataSource *)self reloadDataAnimated:v30];
    goto LABEL_11;
  }
  if ((objc_msgSend(v8, "ic_containsObjectPassingTest:", &stru_100625650) & 1) != 0
    || (objc_msgSend(v9, "ic_containsObjectPassingTest:", &stru_100625650) & 1) != 0)
  {
    goto LABEL_10;
  }
LABEL_4:
  id v14 = [(ICNoteBrowseDataSource *)self indexer];
  long long v15 = [v14 noteCollection];

  if (!v15)
  {
    v32 = v9;
    uint64_t v33 = [v10 objectsPassingTest:&stru_100625650];
    id v16 = [v33 mutableCopy];
    objc_super v17 = [(ICNoteBrowseDataSource *)self collectionViewDiffableDataSource];
    long long v18 = [v17 snapshot];
    objc_super v19 = [v18 itemIdentifiers];
    v20 = +[NSSet setWithArray:v19];
    [v16 intersectSet:v20];

    if ([v16 count])
    {
      objc_initWeak(&location, self);
      objc_copyWeak(&v35, &location);
      id v34 = v16;
      performBlockOnMainThread();

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }

    uint64_t v9 = v32;
  }
LABEL_11:
}

- (id)unsupportedFolderInfoButtonTapHandler
{
  return self->_unsupportedFolderInfoButtonTapHandler;
}

- (id)tagSelectionDidChangeHandler
{
  return self->_tagSelectionDidChangeHandler;
}

- (ICNAViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (ICNAViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICSelectorDelayer)lockedNotesMigratorDidMigrateNoteDelayer
{
  return self->_lockedNotesMigratorDidMigrateNoteDelayer;
}

- (NSObject)noteMigrationObserver
{
  return self->_noteMigrationObserver;
}

- (void)setNoteMigrationObserver:(id)a3
{
}

- (NSObject)editorExtensionDidSaveNotificationObserver
{
  return self->_editorExtensionDidSaveNotificationObserver;
}

- (void)setEditorExtensionDidSaveNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editorExtensionDidSaveNotificationObserver, 0);
  objc_storeStrong((id *)&self->_noteMigrationObserver, 0);
  objc_storeStrong((id *)&self->_lockedNotesMigratorDidMigrateNoteDelayer, 0);
  objc_storeStrong((id *)&self->_persistenceConfiguration, 0);
  objc_storeStrong((id *)&self->_modernBackgroundContext, 0);
  objc_storeStrong((id *)&self->_modernViewContext, 0);
  objc_storeStrong((id *)&self->_legacyViewContext, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_folderDataSource);
  objc_storeStrong(&self->_tagSelectionDidChangeHandler, 0);

  objc_storeStrong(&self->_unsupportedFolderInfoButtonTapHandler, 0);
}

@end