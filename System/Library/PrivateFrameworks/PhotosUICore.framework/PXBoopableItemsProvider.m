@interface PXBoopableItemsProvider
- (NSArray)assets;
- (NSArray)itemProvidersForActivityItemsConfiguration;
- (PXBoopableItemsProvider)init;
- (PXBoopableItemsProvider_Swift)boopableItemsProvider;
- (PXMediaProvider)imagePreviewMediaProvider;
- (PXSectionedSelectionManager)selectionManager;
- (id)activityItemsConfigurationMetadataForKey:(id)a3;
- (id)activityItemsConfigurationPreviewForItemAtIndex:(int64_t)a3 intent:(id)a4 suggestedSize:(CGSize)a5;
- (void)setAssets:(id)a3;
- (void)setBoopableItemsProvider:(id)a3;
- (void)setImagePreviewMediaProvider:(id)a3;
- (void)setSelectionManager:(id)a3;
@end

@implementation PXBoopableItemsProvider

- (void).cxx_destruct
{
}

- (void)setBoopableItemsProvider:(id)a3
{
}

- (PXBoopableItemsProvider_Swift)boopableItemsProvider
{
  return self->_boopableItemsProvider;
}

- (id)activityItemsConfigurationPreviewForItemAtIndex:(int64_t)a3 intent:(id)a4 suggestedSize:(CGSize)a5
{
  return -[PXBoopableItemsProvider_Swift activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:](self->_boopableItemsProvider, "activityItemsConfigurationPreviewForItemAtIndex:intent:suggestedSize:", a3, a4, a5.width, a5.height);
}

- (id)activityItemsConfigurationMetadataForKey:(id)a3
{
  return [(PXBoopableItemsProvider_Swift *)self->_boopableItemsProvider activityItemsConfigurationMetadataForKey:a3];
}

- (NSArray)itemProvidersForActivityItemsConfiguration
{
  return [(PXBoopableItemsProvider_Swift *)self->_boopableItemsProvider itemProvidersForActivityItemsConfiguration];
}

- (void)setImagePreviewMediaProvider:(id)a3
{
}

- (PXMediaProvider)imagePreviewMediaProvider
{
  return [(PXBoopableItemsProvider_Swift *)self->_boopableItemsProvider imagePreviewMediaProvider];
}

- (void)setAssets:(id)a3
{
  id v4 = (id)[a3 copy];
  [(PXBoopableItemsProvider_Swift *)self->_boopableItemsProvider setAssets:v4];
}

- (NSArray)assets
{
  return [(PXBoopableItemsProvider_Swift *)self->_boopableItemsProvider assets];
}

- (void)setSelectionManager:(id)a3
{
}

- (PXSectionedSelectionManager)selectionManager
{
  return [(PXBoopableItemsProvider_Swift *)self->_boopableItemsProvider selectionManager];
}

- (PXBoopableItemsProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXBoopableItemsProvider;
  v2 = [(PXBoopableItemsProvider *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(PXBoopableItemsProvider_Swift);
    boopableItemsProvider = v2->_boopableItemsProvider;
    v2->_boopableItemsProvider = v3;
  }
  return v2;
}

@end