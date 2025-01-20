@interface PUCopyToPasteboardActivity
- (BOOL)canPerformWithActivityItems:(id)a3;
- (PXActivityItemSourceController)itemSourceController;
- (id)activityTitle;
- (void)setItemSourceController:(id)a3;
@end

@implementation PUCopyToPasteboardActivity

- (void).cxx_destruct
{
}

- (void)setItemSourceController:(id)a3
{
}

- (PXActivityItemSourceController)itemSourceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemSourceController);
  return (PXActivityItemSourceController *)WeakRetained;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4 = a3;
  v5 = [(PUCopyToPasteboardActivity *)self itemSourceController];
  int v6 = [v5 isPreparingIndividualItems];

  v7 = [MEMORY[0x1E4F906A0] sharedInstance];
  char v8 = [v7 allowCopyingVideos];

  unsigned __int8 v9 = v8 & v6;
  if ((v8 & 1) == 0 && v6)
  {
    v10 = [(PUCopyToPasteboardActivity *)self itemSourceController];
    uint64_t v18 = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    if (v10 && (v11 = v10, [v10 requestAssetsMediaTypeCount], v11, *((void *)&v14 + 1)))
    {
      unsigned __int8 v9 = 0;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)PUCopyToPasteboardActivity;
      unsigned __int8 v9 = [(UICopyToPasteboardActivity *)&v13 canPerformWithActivityItems:v4];
    }
  }

  return v9;
}

- (id)activityTitle
{
  v2 = [(PUCopyToPasteboardActivity *)self itemSourceController];
  v3 = [v2 assets];
  PXMediaTypeForAssets();
  [v3 count];
  id v4 = PXLocalizationKeyForMediaType();
  v5 = PULocalizedString(v4);

  return v5;
}

@end