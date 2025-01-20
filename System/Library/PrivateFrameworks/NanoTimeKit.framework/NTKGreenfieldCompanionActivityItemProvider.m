@interface NTKGreenfieldCompanionActivityItemProvider
- (NTKGreenfieldCompanionActivityItemProvider)initWithDraftRecipe:(id)a3 previewImage:(id)a4;
- (NTKGreenfieldCompanionActivityItemProviderDelegate)delegate;
- (id)activityViewController:(id)a3 itemsForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerLinkPresentationMetadata:(id)a3;
- (id)item;
- (id)writeImageToDisk:(id)a3 suffix:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NTKGreenfieldCompanionActivityItemProvider

- (NTKGreenfieldCompanionActivityItemProvider)initWithDraftRecipe:(id)a3 previewImage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28D78]);
  [v9 registerDataRepresentationForTypeIdentifier:@"com.apple.watchface" visibility:0 loadHandler:&__block_literal_global_15];
  v13.receiver = self;
  v13.super_class = (Class)NTKGreenfieldCompanionActivityItemProvider;
  v10 = [(UIActivityItemProvider *)&v13 initWithPlaceholderItem:v9];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_draftRecipe, a3);
    objc_storeStrong((id *)&v11->_previewImage, a4);
  }

  return v11;
}

uint64_t __79__NTKGreenfieldCompanionActivityItemProvider_initWithDraftRecipe_previewImage___block_invoke(uint64_t a1, uint64_t a2)
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F30A78];
  v5 = self->_previewImage;
  id v6 = objc_alloc_init(v4);
  id v7 = [(NTKGreenfieldDraftRecipe *)self->_draftRecipe faceForSharing];
  id v8 = [v7 faceSharingName];
  [v6 setTitle:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F30A58]);
  [v9 setType:5];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v5 properties:v9];
  [v6 setImage:v10];

  unint64_t v11 = [(NTKGreenfieldDraftRecipe *)self->_draftRecipe faceForSharingComplicationOptionsCount];
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F30AD8]);
    objc_super v13 = NTKClockFaceLocalizedString(@"GREENFIELD_COMPLICATION_COUNT_DESCRIPTION", @"%lu Complications");
    v14 = objc_msgSend(NSString, "localizedStringWithFormat:", v13, v11);
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v14];
    [v12 setStatus:v15];

    [v6 setSpecialization:v12];
  }

  return v6;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  if ((id)*MEMORY[0x1E4F9F370] == a4)
  {
    v5 = [(NTKGreenfieldDraftRecipe *)self->_draftRecipe faceForSharing];
    id v6 = [v5 faceSharingName];

    id v7 = NTKClockFaceLocalizedString(@"GREENFIELD_SHARE_WATCH_FACE_SUBJECT", @"Apple Watch Face — %@");
    objc_msgSend(NSString, "stringWithFormat:", v7, v6);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1F1635E90;
  }
  return v4;
}

- (id)item
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  draftRecipe = self->_draftRecipe;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  unint64_t v11 = __50__NTKGreenfieldCompanionActivityItemProvider_item__block_invoke;
  id v12 = &unk_1E62C13A8;
  objc_super v13 = self;
  dispatch_semaphore_t v14 = v3;
  v5 = v3;
  +[NTKGreenfieldUtilities encodeRecipeFromDraftRecipe:draftRecipe completionBlock:&v9];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  id v7 = [(NTKGreenfieldEncodedRecipe *)self->_encodedRecipe watchFaceDataUrl];

  return v7;
}

void __50__NTKGreenfieldCompanionActivityItemProvider_item__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__NTKGreenfieldCompanionActivityItemProvider_item__block_invoke_2;
    v14[3] = &unk_1E62C09C0;
    v14[4] = *(void *)(a1 + 32);
    id v15 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v14);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 280), a2);
    uint64_t v9 = [v6 watchFaceImage];
    uint64_t v10 = +[NTKGreenfieldUtilities addBorder:3 toWatchFaceImage:v9];

    uint64_t v11 = [*(id *)(a1 + 32) writeImageToDisk:v10 suffix:@"email"];
    uint64_t v12 = *(void *)(a1 + 32);
    objc_super v13 = *(void **)(v12 + 288);
    *(void *)(v12 + 288) = v11;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __50__NTKGreenfieldCompanionActivityItemProvider_item__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 companionActivityItemProvider:*(void *)(a1 + 32) handleError:*(void *)(a1 + 40)];
}

- (id)writeImageToDisk:(id)a3 suffix:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = UIImagePNGRepresentation((UIImage *)a3);
    id v8 = NSString;
    uint64_t v9 = [(NTKGreenfieldEncodedRecipe *)self->_encodedRecipe watchFaceName];
    uint64_t v10 = [v8 stringWithFormat:@"%@_%@@2x.png", v9, v6];

    uint64_t v11 = NSTemporaryDirectory();
    uint64_t v12 = [v11 stringByAppendingString:v10];

    objc_super v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
    [v7 writeToURL:v13 atomically:1];
  }
  else
  {
    objc_super v13 = 0;
  }
  return v13;
}

- (id)activityViewController:(id)a3 itemsForActivityType:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NTKGreenfieldCompanionActivityItemProvider;
  id v6 = a4;
  id v7 = [(UIActivityItemProvider *)&v11 activityViewController:a3 itemForActivityType:v6];
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v11.receiver, v11.super_class);
  int v9 = [v6 isEqualToString:*MEMORY[0x1E4F9F370]];

  if (v9 && self->_emailImageUrl) {
    objc_msgSend(v8, "addObject:");
  }
  if (v7) {
    [v8 addObject:v7];
  }

  return v8;
}

- (NTKGreenfieldCompanionActivityItemProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKGreenfieldCompanionActivityItemProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_emailImageUrl, 0);
  objc_storeStrong((id *)&self->_encodedRecipe, 0);
  objc_storeStrong((id *)&self->_draftRecipe, 0);
}

@end