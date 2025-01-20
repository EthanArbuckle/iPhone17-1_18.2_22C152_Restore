@interface PXActivity
+ (id)_destructiveActivities;
+ (id)activityWithActionTitle:(id)a3 actionType:(id)a4 activityType:(id)a5 systemImageName:(id)a6;
- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (NSString)actionTitle;
- (NSString)actionType;
- (NSString)description;
- (NSString)systemImageName;
- (PXActivity)initWithActionTitle:(id)a3 actionType:(id)a4 activityType:(id)a5 systemImageName:(id)a6;
- (PXActivityActionDelegate)actionDelegate;
- (PXActivityDataSource)dataSource;
- (PXActivityItemSourceController)itemSourceController;
- (id)activityType;
- (id)canPerformActivityActionHandler;
- (id)createActivityBundleImageConfigurationForBundle:(id)a3 imageNamed:(id)a4 activityCategory:(int64_t)a5;
- (id)performActivityActionHandler;
- (id)px_activityImageNamed:(id)a3;
- (id)px_activitySettingsImageNamed:(id)a3;
- (void)performActivity;
- (void)setActionDelegate:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setActionType:(id)a3;
- (void)setCanPerformActivityActionHandler:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setItemSourceController:(id)a3;
- (void)setPerformActivityActionHandler:(id)a3;
- (void)setSystemImageName:(id)a3;
- (void)updateActivityViewControllerVisibleShareActions;
@end

@implementation PXActivity

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong(&self->_canPerformActivityActionHandler, 0);
  objc_storeStrong(&self->_performActivityActionHandler, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_destroyWeak((id *)&self->_itemSourceController);
  objc_storeStrong((id *)&self->_internalActivityType, 0);
  objc_storeStrong((id *)&self->_cachedSmallCustomImage, 0);
  objc_storeStrong((id *)&self->_cachedCustomImage, 0);
}

- (PXActivityDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PXActivityDataSource *)WeakRetained;
}

- (void)setActionDelegate:(id)a3
{
}

- (PXActivityActionDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  return (PXActivityActionDelegate *)WeakRetained;
}

- (void)setCanPerformActivityActionHandler:(id)a3
{
}

- (id)canPerformActivityActionHandler
{
  return self->_canPerformActivityActionHandler;
}

- (void)setPerformActivityActionHandler:(id)a3
{
}

- (id)performActivityActionHandler
{
  return self->_performActivityActionHandler;
}

- (void)setSystemImageName:(id)a3
{
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (void)setActionType:(id)a3
{
}

- (NSString)actionType
{
  return self->_actionType;
}

- (void)setActionTitle:(id)a3
{
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)setItemSourceController:(id)a3
{
}

- (PXActivityItemSourceController)itemSourceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemSourceController);
  return (PXActivityItemSourceController *)WeakRetained;
}

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PXActivity;
  return [(UIActivity *)&v6 _presentActivityOnViewController:a3 animated:a4 completion:a5];
}

- (void)performActivity
{
  v3 = [(PXActivity *)self performActivityActionHandler];

  if (v3)
  {
    v4 = [(PXActivity *)self performActivityActionHandler];
    ((void (**)(void, PXActivity *))v4)[2](v4, self);
  }
  else
  {
    v4 = [(PXActivity *)self actionDelegate];
    [v4 performActivity:self];
  }

  [(UIActivity *)self activityDidFinish:1];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4 = a3;
  v5 = [(PXActivity *)self canPerformActivityActionHandler];

  if (v5)
  {
    objc_super v6 = [(PXActivity *)self canPerformActivityActionHandler];
    char v7 = ((uint64_t (**)(void, id, PXActivity *))v6)[2](v6, v4, self);
  }
  else
  {
    objc_super v6 = [(PXActivity *)self actionDelegate];
    char v7 = [v6 canPerformWithActivityItems:v4 forActivity:self];
  }
  BOOL v8 = v7;

  return v8;
}

- (id)activityType
{
  return self->_internalActivityType;
}

- (id)createActivityBundleImageConfigurationForBundle:(id)a3 imageNamed:(id)a4 activityCategory:(int64_t)a5
{
  id v7 = a4;
  BOOL v8 = [a3 bundlePath];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F9F318]) initWithImageName:v7 bundlePath:v8 activityCategory:a5];

  return v9;
}

- (void)updateActivityViewControllerVisibleShareActions
{
  v3 = [(PXActivity *)self itemSourceController];
  if (v3)
  {
    id v8 = v3;
    id v4 = [v3 activityViewController];
    [v4 updateVisibleShareActionsIfNeeded];
LABEL_6:

    v3 = v8;
    goto LABEL_7;
  }
  if (self->_dataSourceFlags.respondsToActivityViewControllerForActivity
    && self->_dataSourceFlags.respondsToActivityItemsForActivity)
  {
    id v8 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v4 = [WeakRetained activityViewControllerForActivity:self];

    id v6 = objc_loadWeakRetained((id *)&self->_dataSource);
    id v7 = [v6 activityItemsForActivity:self];

    [v4 _updateActivityItems:v7];
    goto LABEL_6;
  }
LABEL_7:
}

- (id)px_activitySettingsImageNamed:(id)a3
{
  cachedSmallCustomImage = self->_cachedSmallCustomImage;
  if (!cachedSmallCustomImage)
  {
    v5 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", a3);
    PLPhysicalScreenScale();
    objc_msgSend(v5, "_applicationIconImageForFormat:precomposed:scale:", 0, 0);
    id v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_cachedSmallCustomImage;
    self->_cachedSmallCustomImage = v6;

    cachedSmallCustomImage = self->_cachedSmallCustomImage;
  }
  return cachedSmallCustomImage;
}

- (id)px_activityImageNamed:(id)a3
{
  cachedCustomImage = self->_cachedCustomImage;
  if (!cachedCustomImage)
  {
    v5 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", a3);
    PLPhysicalScreenScale();
    objc_msgSend(v5, "_applicationIconImageForFormat:precomposed:scale:", 10, 0);
    id v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_cachedCustomImage;
    self->_cachedCustomImage = v6;

    cachedCustomImage = self->_cachedCustomImage;
  }
  return cachedCustomImage;
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_dataSource, obj);
    p_dataSourceFlags = &self->_dataSourceFlags;
    self->_dataSourceFlags.respondsToActivityViewControllerForActivity = objc_opt_respondsToSelector() & 1;

    id v7 = objc_loadWeakRetained((id *)&self->_dataSource);
    p_dataSourceFlags->respondsToActivityItemsForActivity = objc_opt_respondsToSelector() & 1;
  }
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; actionTitle = %@; actionType = %@; internalActivityType = %@, systemImageName = %@>",
    v5,
    self,
    self->_actionTitle,
    self->_actionType,
    self->_internalActivityType,
  id v6 = self->_systemImageName);

  return (NSString *)v6;
}

- (PXActivity)initWithActionTitle:(id)a3 actionType:(id)a4 activityType:(id)a5 systemImageName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PXActivity.m", 171, @"Invalid parameter not satisfying: %@", @"actionType" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"PXActivity.m", 170, @"Invalid parameter not satisfying: %@", @"actionTitle" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_9:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"PXActivity.m", 172, @"Invalid parameter not satisfying: %@", @"activityType" object file lineNumber description];

LABEL_4:
  v28.receiver = self;
  v28.super_class = (Class)PXActivity;
  v15 = [(UIActivity *)&v28 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    actionTitle = v15->_actionTitle;
    v15->_actionTitle = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    actionType = v15->_actionType;
    v15->_actionType = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    internalActivityType = v15->_internalActivityType;
    v15->_internalActivityType = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    systemImageName = v15->_systemImageName;
    v15->_systemImageName = (NSString *)v22;
  }
  return v15;
}

+ (id)activityWithActionTitle:(id)a3 actionType:(id)a4 activityType:(id)a5 systemImageName:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = [a1 _destructiveActivities];
  int v15 = [v14 containsObject:v10];

  uint64_t v16 = off_1E5DAA098;
  if (!v15) {
    uint64_t v16 = off_1E5DA53F0;
  }
  v17 = (void *)[objc_alloc(*v16) initWithActionTitle:v13 actionType:v12 activityType:v10 systemImageName:v11];

  return v17;
}

+ (id)_destructiveActivities
{
  if (_destructiveActivities_onceToken != -1) {
    dispatch_once(&_destructiveActivities_onceToken, &__block_literal_global_298356);
  }
  v2 = (void *)_destructiveActivities__destructiveTypes;
  return v2;
}

void __36__PXActivity__destructiveActivities__block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PXActivityTypeDeleteMemory";
  v2[1] = @"PXActivityTypeBlockMemory";
  v2[2] = @"PXActivityTypeTrashMomentShare";
  v2[3] = @"PXActivityTypeSharingSuggestionDecline";
  v2[4] = @"PXActivityTypeRemovePersonFromHome";
  v2[5] = @"PXActivityTypeBlockPerson";
  v2[6] = @"PXActivityTypeDeleteAlbum";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)_destructiveActivities__destructiveTypes;
  _destructiveActivities__destructiveTypes = v0;
}

@end