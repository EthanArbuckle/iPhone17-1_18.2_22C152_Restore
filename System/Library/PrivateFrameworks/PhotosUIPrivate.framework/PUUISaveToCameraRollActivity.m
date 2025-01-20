@interface PUUISaveToCameraRollActivity
- (BOOL)_containsVideoComplementsInActivityItems:(id)a3 outVideoComplements:(id *)a4;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (id)activityType;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation PUUISaveToCameraRollActivity

- (BOOL)_containsVideoComplementsInActivityItems:(id)a3 outVideoComplements:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  else {
    id v6 = 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend(v6, "addObject:", v13, (void)v15);
          char v10 = 1;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  else
  {
    char v10 = 0;
  }

  if (a4) {
    *a4 = v6;
  }

  return v10 & 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4 = a3;
  id v15 = 0;
  BOOL v5 = [(PUUISaveToCameraRollActivity *)self _containsVideoComplementsInActivityItems:v4 outVideoComplements:&v15];
  id v6 = v15;
  id v7 = v6;
  if (v5)
  {
    if ([v6 count])
    {
      objc_initWeak(&location, self);
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __57__PUUISaveToCameraRollActivity_prepareWithActivityItems___block_invoke;
      v11[3] = &unk_1E5F2ED10;
      id v12 = v7;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __57__PUUISaveToCameraRollActivity_prepareWithActivityItems___block_invoke_2;
      v9[3] = &unk_1E5F2D940;
      objc_copyWeak(&v10, &location);
      [v8 performChanges:v11 completionHandler:v9];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PUUISaveToCameraRollActivity;
    [(UISaveToCameraRollActivity *)&v14 prepareWithActivityItems:v4];
  }
}

void __57__PUUISaveToCameraRollActivity_prepareWithActivityItems___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = (id)objc_msgSend(MEMORY[0x1E4F38F28], "creationRequestForAssetFromVideoComplementBundle:", *(void *)(*((void *)&v7 + 1) + 8 * v5++), (void)v7);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __57__PUUISaveToCameraRollActivity_prepareWithActivityItems___block_invoke_2(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__PUUISaveToCameraRollActivity_prepareWithActivityItems___block_invoke_3;
  v3[3] = &unk_1E5F2D918;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __57__PUUISaveToCameraRollActivity_prepareWithActivityItems___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained activityDidFinish:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v4 = a3;
  if ([(PUUISaveToCameraRollActivity *)self _containsVideoComplementsInActivityItems:v4 outVideoComplements:0])
  {
    unsigned __int8 v5 = (unint64_t)([MEMORY[0x1E4F39228] authorizationStatusForAccessLevel:1] - 3) < 2;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUUISaveToCameraRollActivity;
    unsigned __int8 v5 = [(UISaveToCameraRollActivity *)&v7 canPerformWithActivityItems:v4];
  }

  return v5;
}

- (id)activityType
{
  return @"com.apple.Photos.activity.saveToCameraRoll";
}

@end