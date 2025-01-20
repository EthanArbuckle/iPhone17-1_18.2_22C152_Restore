@interface PLQuickActionManager
+ (BOOL)shouldShowInternalQuickActions;
+ (void)setShouldShowInternalQuickActions:(BOOL)a3;
- (BOOL)_mostRecentPhotoIsInvalid;
- (BOOL)_userHasPhotos;
- (BOOL)_userHasPhotosFromLastYear;
- (Class)_SBSApplicationShortcutCustomImageIconClass;
- (Class)_SBSApplicationShortcutItemClass;
- (Class)_SBSApplicationShortcutServiceClass;
- (NSData)_cachedMostRecentPhotoData;
- (PLQuickActionManager)initWithDatabaseContext:(id)a3;
- (SBSApplicationShortcutService)_appShortcutService;
- (id)_buildFavoritesQuickAction;
- (id)_buildMostRecentPhotoQuickAction;
- (id)_buildOneYearAgoQuickAction;
- (id)_buildSearchQuickAction;
- (id)_shortcutItemWithType:(id)a3 localizedTitle:(id)a4 iconName:(id)a5;
- (id)_shortcutSystemImageNamed:(id)a3;
- (void)_setAppShortcutService:(id)a3;
- (void)_setCachedMostRecentPhotoData:(id)a3;
- (void)_setMostRecentPhotoIsInvalid:(BOOL)a3;
- (void)_setSBSApplicationShortcutCustomImageIconClass:(Class)a3;
- (void)_setSBSApplicationShortcutItemClass:(Class)a3;
- (void)_setSBSApplicationShortcutServiceClass:(Class)a3;
- (void)buildQuickActionItems;
- (void)cameraPreviewWellImageDidChange:(id)a3;
- (void)dealloc;
@end

@implementation PLQuickActionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__SBSApplicationShortcutCustomImageIconClass, 0);
  objc_storeStrong((id *)&self->__SBSApplicationShortcutItemClass, 0);
  objc_storeStrong((id *)&self->__SBSApplicationShortcutServiceClass, 0);
  objc_storeStrong((id *)&self->__appShortcutService, 0);
  objc_storeStrong((id *)&self->__cachedMostRecentPhotoData, 0);
  objc_storeStrong((id *)&self->_databaseContext, 0);
}

- (void)_setSBSApplicationShortcutCustomImageIconClass:(Class)a3
{
}

- (Class)_SBSApplicationShortcutCustomImageIconClass
{
  return self->__SBSApplicationShortcutCustomImageIconClass;
}

- (void)_setSBSApplicationShortcutItemClass:(Class)a3
{
}

- (Class)_SBSApplicationShortcutItemClass
{
  return self->__SBSApplicationShortcutItemClass;
}

- (void)_setSBSApplicationShortcutServiceClass:(Class)a3
{
}

- (Class)_SBSApplicationShortcutServiceClass
{
  return self->__SBSApplicationShortcutServiceClass;
}

- (void)_setAppShortcutService:(id)a3
{
}

- (SBSApplicationShortcutService)_appShortcutService
{
  return self->__appShortcutService;
}

- (void)_setMostRecentPhotoIsInvalid:(BOOL)a3
{
  self->__mostRecentPhotoIsInvalid = a3;
}

- (BOOL)_mostRecentPhotoIsInvalid
{
  return self->__mostRecentPhotoIsInvalid;
}

- (void)_setCachedMostRecentPhotoData:(id)a3
{
}

- (NSData)_cachedMostRecentPhotoData
{
  return self->__cachedMostRecentPhotoData;
}

- (BOOL)_userHasPhotosFromLastYear
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v19 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v4 setYear:-1];
  v5 = [v3 dateByAddingComponents:v4 toDate:v19 options:0];
  [v4 setYear:0];
  [v4 setDay:-3];
  v18 = [v3 dateByAddingComponents:v4 toDate:v5 options:0];
  [v4 setDay:3];
  v6 = [v3 dateByAddingComponents:v4 toDate:v5 options:0];
  v7 = (void *)MEMORY[0x1E4F28BA0];
  v8 = +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:[(PLDatabaseContext *)self->_databaseContext wellKnownPhotoLibraryIdentifier]];
  v27[0] = v8;
  v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"dateCreated >= %@ AND dateCreated <= %@", v18, v6];
  v27[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v11 = [v7 andPredicateWithSubpredicates:v10];

  v12 = (void *)MEMORY[0x1E4F1C0D0];
  v13 = +[PLManagedAsset entityName];
  v14 = [v12 fetchRequestWithEntityName:v13];

  [v14 setFetchLimit:1];
  [v14 setPredicate:v11];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  databaseContext = self->_databaseContext;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __50__PLQuickActionManager__userHasPhotosFromLastYear__block_invoke;
  v20[3] = &unk_1E58712E8;
  v22 = &v23;
  id v16 = v14;
  id v21 = v16;
  -[PLDatabaseContext performSync:withName:](databaseContext, "performSync:withName:", v20, "-[PLQuickActionManager _userHasPhotosFromLastYear]");
  LOBYTE(self) = *((unsigned char *)v24 + 24) != 0;

  _Block_object_dispose(&v23, 8);
  return (char)self;
}

void __50__PLQuickActionManager__userHasPhotosFromLastYear__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 managedObjectContext];
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = 0;
  uint64_t v5 = [v3 countForFetchRequest:v4 error:&v10];
  id v6 = v10;
  v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = v8;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
}

- (BOOL)_userHasPhotos
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v4 = +[PLManagedAsset entityName];
  uint64_t v5 = [v3 fetchRequestWithEntityName:v4];

  [v5 setFetchLimit:1];
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  v7 = +[PLManagedAsset predicateToExcludeTrashedAssets];
  v21[0] = v7;
  BOOL v8 = +[PLManagedAsset predicateToExcludeHiddenAssets];
  v21[1] = v8;
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  id v10 = [v6 andPredicateWithSubpredicates:v9];
  [v5 setPredicate:v10];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  databaseContext = self->_databaseContext;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__PLQuickActionManager__userHasPhotos__block_invoke;
  v14[3] = &unk_1E58712E8;
  id v16 = &v17;
  id v12 = v5;
  id v15 = v12;
  -[PLDatabaseContext performSync:withName:](databaseContext, "performSync:withName:", v14, "-[PLQuickActionManager _userHasPhotos]");
  LOBYTE(v5) = *((unsigned char *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return (char)v5;
}

void __38__PLQuickActionManager__userHasPhotos__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 managedObjectContext];
  uint64_t v4 = *(void *)(a1 + 32);
  id v10 = 0;
  uint64_t v5 = [v3 countForFetchRequest:v4 error:&v10];
  id v6 = v10;
  v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  char v9 = v8;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
}

- (id)_shortcutSystemImageNamed:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4FA69E8];
  id v4 = a3;
  uint64_t v5 = (void *)[[v3 alloc] initWithSystemImageName:v4];

  return v5;
}

- (id)_shortcutItemWithType:(id)a3 localizedTitle:(id)a4 iconName:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init([(PLQuickActionManager *)self _SBSApplicationShortcutItemClass]);
  [v11 setType:v10];

  [v11 setLocalizedTitle:v9];
  id v12 = [(PLQuickActionManager *)self _shortcutSystemImageNamed:v8];

  [v11 setIcon:v12];
  return v11;
}

- (id)_buildSearchQuickAction
{
  id v3 = objc_alloc_init([(PLQuickActionManager *)self _SBSApplicationShortcutItemClass]);
  [v3 setType:@"com.apple.photos.shortcuts.search"];
  [v3 setLocalizedTitle:@"SEARCH"];
  id v4 = [(PLQuickActionManager *)self _shortcutSystemImageNamed:@"magnifyingglass"];
  [v3 setIcon:v4];

  return v3;
}

- (id)_buildFavoritesQuickAction
{
  id v3 = objc_alloc_init([(PLQuickActionManager *)self _SBSApplicationShortcutItemClass]);
  [v3 setType:@"com.apple.photos.shortcuts.favorites"];
  [v3 setLocalizedTitle:@"FAVORITES"];
  id v4 = [(PLQuickActionManager *)self _shortcutSystemImageNamed:@"heart"];
  [v3 setIcon:v4];

  return v3;
}

- (id)_buildOneYearAgoQuickAction
{
  id v3 = +[PLSearchIndexConfiguration locale];
  if (!+[PLNLP nlpSearchSupportsLocale:v3])
  {
    id v5 = 0;
    goto LABEL_5;
  }
  BOOL v4 = [(PLQuickActionManager *)self _userHasPhotosFromLastYear];

  if (v4)
  {
    id v5 = objc_alloc_init([(PLQuickActionManager *)self _SBSApplicationShortcutItemClass]);
    [v5 setType:@"com.apple.photos.shortcuts.oneyearago"];
    [v5 setLocalizedTitle:@"ONE_YEAR_AGO"];
    id v3 = [(PLQuickActionManager *)self _shortcutSystemImageNamed:@"clock"];
    [v5 setIcon:v3];
LABEL_5:

    goto LABEL_7;
  }
  id v5 = 0;
LABEL_7:
  return v5;
}

- (id)_buildMostRecentPhotoQuickAction
{
  id v3 = objc_alloc_init([(PLQuickActionManager *)self _SBSApplicationShortcutItemClass]);
  [v3 setType:@"com.apple.photos.shortcuts.recentphoto"];
  [v3 setLocalizedTitle:@"MOST_RECENT_PHOTO"];
  id v4 = objc_alloc([(PLQuickActionManager *)self _SBSApplicationShortcutCustomImageIconClass]);
  id v5 = [(PLQuickActionManager *)self _cachedMostRecentPhotoData];
  id v6 = (void *)[v4 initWithImageData:v5 dataType:0 isTemplate:0];

  [v3 setIcon:v6];
  return v3;
}

- (void)buildQuickActionItems
{
  uint64_t v3 = [(PLQuickActionManager *)self _cachedMostRecentPhotoData];
  if (!v3
    || (id v4 = (void *)v3,
        BOOL v5 = [(PLQuickActionManager *)self _mostRecentPhotoIsInvalid],
        v4,
        v5))
  {
    id v6 = [MEMORY[0x1E4F8B848] cameraPreviewWellImageFileURL];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6];
    [(PLQuickActionManager *)self _setCachedMostRecentPhotoData:v7];
    [(PLQuickActionManager *)self _setMostRecentPhotoIsInvalid:0];
  }
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PLQuickActionManager *)self _userHasPhotos])
  {
    id v8 = [(PLQuickActionManager *)self _buildMostRecentPhotoQuickAction];
    if (v8) {
      [v13 addObject:v8];
    }

    id v9 = [(PLQuickActionManager *)self _buildFavoritesQuickAction];
    if (v9) {
      [v13 addObject:v9];
    }

    id v10 = [(PLQuickActionManager *)self _buildOneYearAgoQuickAction];
    if (v10) {
      [v13 addObject:v10];
    }

    id v11 = [(PLQuickActionManager *)self _buildSearchQuickAction];
    if (v11) {
      [v13 addObject:v11];
    }
  }
  id v12 = [(PLQuickActionManager *)self _appShortcutService];
  [v12 updateDynamicApplicationShortcutItems:v13 forBundleIdentifier:@"com.apple.mobileslideshow"];
}

- (void)cameraPreviewWellImageDidChange:(id)a3
{
  [(PLQuickActionManager *)self _setMostRecentPhotoIsInvalid:1];
  [(PLQuickActionManager *)self buildQuickActionItems];
}

- (void)dealloc
{
  [(SBSApplicationShortcutService *)self->__appShortcutService invalidate];
  uint64_t v3 = +[PLChangeNotificationCenter defaultCenter];
  [v3 removeCameraPreviewWellImageChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PLQuickActionManager;
  [(PLQuickActionManager *)&v4 dealloc];
}

- (PLQuickActionManager)initWithDatabaseContext:(id)a3
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLQuickActionManager;
  v7 = [(PLQuickActionManager *)&v16 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_databaseContext, a3);
    if (!dlopen((const char *)[@"/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices" fileSystemRepresentation], 4))
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2 object:v8 file:@"PLQuickActionManager.m" lineNumber:66 description:@"No SpringBoardServices!"];
    }
    [(PLQuickActionManager *)v8 _setSBSApplicationShortcutItemClass:NSClassFromString(&cfstr_Sbsapplication.isa)];
    if (![(PLQuickActionManager *)v8 _SBSApplicationShortcutItemClass])
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:v8 file:@"PLQuickActionManager.m" lineNumber:69 description:@"No SBSApplicationShortcutItem"];
    }
    [(PLQuickActionManager *)v8 _setSBSApplicationShortcutServiceClass:NSClassFromString(&cfstr_Sbsapplication_0.isa)];
    if (![(PLQuickActionManager *)v8 _SBSApplicationShortcutServiceClass])
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:v8 file:@"PLQuickActionManager.m" lineNumber:72 description:@"No _setSBSApplicationShortcutService"];
    }
    [(PLQuickActionManager *)v8 _setSBSApplicationShortcutCustomImageIconClass:NSClassFromString(&cfstr_Sbsapplication_1.isa)];
    if (![(PLQuickActionManager *)v8 _SBSApplicationShortcutCustomImageIconClass])
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:v8 file:@"PLQuickActionManager.m" lineNumber:75 description:@"No SBSApplicationShortcutCustomImageIcon"];
    }
    id v9 = objc_alloc_init([(PLQuickActionManager *)v8 _SBSApplicationShortcutServiceClass]);
    [(PLQuickActionManager *)v8 _setAppShortcutService:v9];
    id v10 = +[PLChangeNotificationCenter defaultCenter];
    [v10 addCameraPreviewWellImageChangeObserver:v8];
  }
  return v8;
}

+ (void)setShouldShowInternalQuickActions:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  CFPreferencesSetAppValue(@"showInternalQuickActions", v3, @"com.apple.mobileslideshow");

  notify_post("cameraPreviewImageWellChanged");
}

+ (BOOL)shouldShowInternalQuickActions
{
  int v2 = MEMORY[0x19F38BDB0](a1, a2);
  if (v2)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"showInternalQuickActions", @"com.apple.mobileslideshow", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat) {
      BOOL v4 = AppBooleanValue == 0;
    }
    else {
      BOOL v4 = 0;
    }
    LOBYTE(v2) = !v4;
  }
  return v2;
}

@end