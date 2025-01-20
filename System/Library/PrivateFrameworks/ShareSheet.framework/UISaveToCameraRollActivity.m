@interface UISaveToCameraRollActivity
+ (unint64_t)_xpcAttributes;
- (BOOL)_canSaveImages;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (_UISaveToCameraRollSaveItemsController)saveController;
- (id)_activityImage;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (int64_t)imageCount;
- (int64_t)livePhotoCount;
- (int64_t)videoCount;
- (void)prepareWithActivityItems:(id)a3;
- (void)setImageCount:(int64_t)a3;
- (void)setLivePhotoCount:(int64_t)a3;
- (void)setSaveController:(id)a3;
- (void)setVideoCount:(int64_t)a3;
@end

@implementation UISaveToCameraRollActivity

+ (unint64_t)_xpcAttributes
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class()) {
    return 3;
  }
  else {
    return 0;
  }
}

- (id)activityType
{
  return @"com.apple.UIKit.activity.SaveToCameraRoll";
}

- (id)activityTitle
{
  int64_t imageCount = self->_imageCount;
  int64_t videoCount = self->_videoCount;
  int64_t v4 = videoCount + imageCount;
  int64_t livePhotoCount = self->_livePhotoCount;
  if (videoCount + imageCount < 2)
  {
    if (videoCount == 1)
    {
      v11 = _ShareSheetBundle();
      v8 = v11;
      v12 = @"Save Video[Activity]";
      v13 = @"Save Video";
    }
    else
    {
      v11 = _ShareSheetBundle();
      v8 = v11;
      if (livePhotoCount == 1)
      {
        v12 = @"Save Live Photo[Activity]";
        v13 = @"Save Live Photo";
      }
      else
      {
        v12 = @"Save Image[Activity]";
        v13 = @"Save Image";
      }
    }
    v23 = [v11 localizedStringForKey:v12 value:v13 table:@"Localizable"];
    goto LABEL_17;
  }
  if (imageCount - livePhotoCount == v4)
  {
    v6 = NSString;
    v7 = _ShareSheetBundle();
    v8 = v7;
    v9 = @"Save %@ Images[Activity]";
    v10 = @"Save %@ Images";
LABEL_12:
    v19 = [v7 localizedStringForKey:v9 value:v10 table:@"Localizable"];
    v20 = (void *)MEMORY[0x1E4F28EE0];
    v21 = [NSNumber numberWithInteger:v4];
    v22 = [v20 localizedStringFromNumber:v21 numberStyle:0];
    v23 = objc_msgSend(v6, "stringWithFormat:", v19, v22);

    goto LABEL_17;
  }
  if (livePhotoCount == v4)
  {
    v6 = NSString;
    v8 = _ShareSheetBundle();
    v15 = [v8 localizedStringForKey:@"Save %@ Live Photos[Activity]" value:@"Save %@ Live Photos" table:@"Localizable"];
    v16 = (void *)MEMORY[0x1E4F28EE0];
    v17 = NSNumber;
    int64_t v18 = self->_livePhotoCount;
  }
  else
  {
    v6 = NSString;
    v7 = _ShareSheetBundle();
    v8 = v7;
    if (imageCount)
    {
      v9 = @"Save %@ Items[Activity]";
      v10 = @"Save %@ Items";
      goto LABEL_12;
    }
    v15 = [v7 localizedStringForKey:@"Save %@ Videos[Activity]" value:@"Save %@ Videos" table:@"Localizable"];
    v16 = (void *)MEMORY[0x1E4F28EE0];
    v17 = NSNumber;
    int64_t v18 = self->_videoCount;
  }
  v24 = [v17 numberWithInteger:v18];
  v25 = [v16 localizedStringFromNumber:v24 numberStyle:0];
  v23 = objc_msgSend(v6, "stringWithFormat:", v15, v25);

LABEL_17:
  return v23;
}

- (id)_activityImage
{
  if (self->_videoCount + self->_imageCount < 2)
  {
    if (_activityImage_onceToken_58 != -1) {
      dispatch_once(&_activityImage_onceToken_58, &__block_literal_global_60);
    }
    uint64_t v2 = &_activityImage___image_57;
  }
  else
  {
    if (_activityImage_onceToken_0 != -1) {
      dispatch_once(&_activityImage_onceToken_0, &__block_literal_global_37);
    }
    uint64_t v2 = &_activityImage___image_0;
  }
  v3 = (void *)*v2;
  return v3;
}

void __44__UISaveToCameraRollActivity__activityImage__block_invoke()
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1E20];
  v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v2 = [v1 traitCollection];
  v13[0] = v2;
  v3 = (void *)MEMORY[0x1E4FB1E20];
  int64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  v5 = objc_msgSend(v3, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v7 = [v0 traitCollectionWithTraitsFromCollections:v6];

  v8 = (void *)MEMORY[0x1E4FB1818];
  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v8 imageNamed:@"UIActivitySaveMultiple.png" inBundle:v9 compatibleWithTraitCollection:v7];
  uint64_t v11 = +[UIActivity _activityImageForActionRepresentationImage:v10];
  v12 = (void *)_activityImage___image_0;
  _activityImage___image_0 = v11;
}

void __44__UISaveToCameraRollActivity__activityImage__block_invoke_2()
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4FB1E20];
  v1 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v2 = [v1 traitCollection];
  v13[0] = v2;
  v3 = (void *)MEMORY[0x1E4FB1E20];
  int64_t v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  v5 = objc_msgSend(v3, "traitCollectionWithUserInterfaceIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v7 = [v0 traitCollectionWithTraitsFromCollections:v6];

  v8 = (void *)MEMORY[0x1E4FB1818];
  v9 = [MEMORY[0x1E4F28B50] mainBundle];
  v10 = [v8 imageNamed:@"UIActivitySaveSingle.png" inBundle:v9 compatibleWithTraitCollection:v7];
  uint64_t v11 = +[UIActivity _activityImageForActionRepresentationImage:v10];
  v12 = (void *)_activityImage___image_57;
  _activityImage___image_57 = v11;
}

- (id)_systemImageName
{
  if (self->_videoCount + self->_imageCount <= 1) {
    return @"square.and.arrow.down";
  }
  else {
    return @"square.and.arrow.down.on.square";
  }
}

- (BOOL)_canSaveImages
{
  BOOL v2 = 1;
  uint64_t v3 = [(objc_class *)getPHPhotoLibraryClass() authorizationStatusForAccessLevel:1];
  if ((unint64_t)(v3 - 1) < 2) {
    return 0;
  }
  if (!v3)
  {
    int64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v5 = [v4 objectForInfoDictionaryKey:@"NSPhotoLibraryAddUsageDescription"];

    uint64_t v6 = [v4 objectForInfoDictionaryKey:@"NSPhotoLibraryUsageDescription"];
    uint64_t v7 = v5 | v6;

    BOOL v2 = v7 != 0;
  }
  return v2;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_int64_t imageCount = 0;
  self->_int64_t livePhotoCount = 0;
  self->_int64_t videoCount = 0;
  if ((_UIActivityItemTypes() & 0x42) != 0)
  {
    self->_int64_t imageCount = _UIActivityItemCountOfType(v4, 2);
    self->_int64_t videoCount = _UIActivityItemCountOfType(v4, 64);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          if (_UIActivityItemIsLivePhoto(*(void **)(*((void *)&v12 + 1) + 8 * i))) {
            ++self->_livePhotoCount;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    self->_int64_t imageCount = 0;
    self->_int64_t videoCount = 0;
  }
  BOOL v10 = (self->_imageCount > 0 || self->_videoCount >= 1)
     && [(UISaveToCameraRollActivity *)self _canSaveImages];

  return v10;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4 = a3;
  id v5 = _UIActivityItemsGetImagesAndVideos(v4);
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v6 = [_UISaveToCameraRollSaveItemsController alloc];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __55__UISaveToCameraRollActivity_prepareWithActivityItems___block_invoke;
  long long v12 = &unk_1E5A232C0;
  objc_copyWeak(&v13, &location);
  uint64_t v7 = [(_UISaveToCameraRollSaveItemsController *)v6 initWithItems:v5 saveCompletionBlock:&v9];
  saveController = self->_saveController;
  self->_saveController = v7;

  [(_UISaveToCameraRollSaveItemsController *)self->_saveController beginSaving];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __55__UISaveToCameraRollActivity_prepareWithActivityItems___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained activityDidFinish:a2 items:0 error:v5];
}

- (int64_t)imageCount
{
  return self->_imageCount;
}

- (void)setImageCount:(int64_t)a3
{
  self->_int64_t imageCount = a3;
}

- (int64_t)livePhotoCount
{
  return self->_livePhotoCount;
}

- (void)setLivePhotoCount:(int64_t)a3
{
  self->_int64_t livePhotoCount = a3;
}

- (int64_t)videoCount
{
  return self->_videoCount;
}

- (void)setVideoCount:(int64_t)a3
{
  self->_int64_t videoCount = a3;
}

- (_UISaveToCameraRollSaveItemsController)saveController
{
  return self->_saveController;
}

- (void)setSaveController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end