@interface PUActivity
- (PUActivityDataSource)dataSource;
- (PUActivityItemSourceController)itemSourceController;
- (id)createActivityBundleImageConfigurationForBundle:(id)a3 imageNamed:(id)a4 activityCategory:(int64_t)a5;
- (id)pu_activityImageNamed:(id)a3;
- (id)pu_activitySettingsImageNamed:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setItemSourceController:(id)a3;
- (void)updateActivityViewControllerVisibleShareActions;
@end

@implementation PUActivity

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_itemSourceController);
  objc_storeStrong((id *)&self->_cachedSmallCustomImage, 0);
  objc_storeStrong((id *)&self->_cachedCustomImage, 0);
}

- (PUActivityDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PUActivityDataSource *)WeakRetained;
}

- (void)setItemSourceController:(id)a3
{
}

- (PUActivityItemSourceController)itemSourceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemSourceController);
  return (PUActivityItemSourceController *)WeakRetained;
}

- (id)createActivityBundleImageConfigurationForBundle:(id)a3 imageNamed:(id)a4 activityCategory:(int64_t)a5
{
  id v7 = a4;
  v8 = [a3 bundlePath];
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F9F318]) initWithImageName:v7 bundlePath:v8 activityCategory:a5];

  return v9;
}

- (void)updateActivityViewControllerVisibleShareActions
{
  v3 = [(PUActivity *)self itemSourceController];
  if (v3)
  {
    id v8 = v3;
    v4 = [v3 activityViewController];
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
    v4 = [WeakRetained activityViewControllerForActivity:self];

    id v6 = objc_loadWeakRetained((id *)&self->_dataSource);
    id v7 = [v6 activityItemsForActivity:self];

    [v4 _updateActivityItems:v7];
    goto LABEL_6;
  }
LABEL_7:
}

- (id)pu_activitySettingsImageNamed:(id)a3
{
  cachedSmallCustomImage = self->_cachedSmallCustomImage;
  if (!cachedSmallCustomImage)
  {
    v5 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", a3);
    PLPhysicalScreenScale();
    objc_msgSend(v5, "_applicationIconImageForFormat:precomposed:scale:", 0, 0);
    id v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_cachedSmallCustomImage;
    self->_cachedSmallCustomImage = v6;

    cachedSmallCustomImage = self->_cachedSmallCustomImage;
  }
  return cachedSmallCustomImage;
}

- (id)pu_activityImageNamed:(id)a3
{
  cachedCustomImage = self->_cachedCustomImage;
  if (!cachedCustomImage)
  {
    v5 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", a3);
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

@end