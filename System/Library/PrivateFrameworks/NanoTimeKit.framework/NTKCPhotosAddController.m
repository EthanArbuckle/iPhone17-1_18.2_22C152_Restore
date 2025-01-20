@interface NTKCPhotosAddController
+ (id)_sharedInstance;
+ (id)pickerConfigurationWithLimit:(unint64_t)a3;
+ (void)presentPhotosAddControllerFromViewController:(id)a3 configuration:(id)a4 withCompletion:(id)a5;
+ (void)presentPhotosAddControllerFromViewController:(id)a3 selectionLimit:(unint64_t)a4 withCompletion:(id)a5;
+ (void)presentPhotosAddControllerFromViewController:(id)a3 withCompletion:(id)a4;
+ (void)presentSinglePhotoAddControllerFromViewController:(id)a3 withCompletion:(id)a4;
- (id)completion;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCompletion:(id)a3;
@end

@implementation NTKCPhotosAddController

+ (id)pickerConfigurationWithLimit:(unint64_t)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F39228] sharedPhotoLibrary];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F39930]) initWithPhotoLibrary:v4];
  v6 = (void *)MEMORY[0x1E4F39938];
  v7 = [MEMORY[0x1E4F39938] livePhotosFilter];
  v12[0] = v7;
  v8 = [MEMORY[0x1E4F39938] imagesFilter];
  v12[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v10 = [v6 anyFilterMatchingSubfilters:v9];
  [v5 setFilter:v10];

  [v5 setSelectionLimit:a3];
  return v5;
}

+ (void)presentPhotosAddControllerFromViewController:(id)a3 withCompletion:(id)a4
{
}

+ (void)presentPhotosAddControllerFromViewController:(id)a3 selectionLimit:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a1 pickerConfigurationWithLimit:a4];
  [v10 setSelectionLimit:a4];
  [a1 presentPhotosAddControllerFromViewController:v9 configuration:v10 withCompletion:v8];
}

+ (void)presentSinglePhotoAddControllerFromViewController:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__NTKCPhotosAddController_presentSinglePhotoAddControllerFromViewController_withCompletion___block_invoke;
  v8[3] = &unk_1E62C1C18;
  id v9 = v6;
  id v7 = v6;
  [a1 presentPhotosAddControllerFromViewController:a3 selectionLimit:1 withCompletion:v8];
}

uint64_t __92__NTKCPhotosAddController_presentSinglePhotoAddControllerFromViewController_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  id v5 = a2;
  id v6 = [a3 firstObject];
  uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return v7;
}

+ (void)presentPhotosAddControllerFromViewController:(id)a3 configuration:(id)a4 withCompletion:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    id v8 = [a1 pickerConfigurationWithLimit:0];
  }
  id v10 = [a1 _sharedInstance];
  [v10 setCompletion:v9];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v8];
  [v11 setDelegate:v10];
  v12 = [v11 presentationController];
  [v12 setDelegate:v10];

  if (v15)
  {
    [v15 presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    v13 = [MEMORY[0x1E4FB1F48] _applicationKeyWindow];
    v14 = [v13 rootViewController];
    [v14 presentViewController:v11 animated:1 completion:0];
  }
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1) {
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)_sharedInstance_sharedInstance;
  return v2;
}

void __42__NTKCPhotosAddController__sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_sharedInstance_sharedInstance;
  _sharedInstance_sharedInstance = v0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id completion = self->_completion;
  if (completion) {
    (*((void (**)(id, void, void))completion + 2))(completion, 0, 0);
  }
  [(NTKCPhotosAddController *)self setCompletion:0];
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  v26 = self;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * i), "assetIdentifier", v26);
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v9);
  }

  v13 = (void *)[v6 copy];
  v14 = NTKPHAssetsForLocalIdentifiers(v13);

  id v15 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v16 = v14;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v29;
    uint64_t v20 = *MEMORY[0x1E4FB2A30];
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v28 + 1) + 8 * j);
        uint64_t v36 = v20;
        uint64_t v37 = v22;
        v23 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1, v26);
        [v15 addObject:v23];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v18);
  }

  id completion = (uint64_t (**)(id, id, void *))v26->_completion;
  if (completion)
  {
    char v25 = completion[2](completion, v27, v15);
    [(NTKCPhotosAddController *)v26 setCompletion:0];
    if (v25) {
      goto LABEL_22;
    }
  }
  else
  {
    [(NTKCPhotosAddController *)v26 setCompletion:0];
  }
  objc_msgSend(v27, "dismissViewControllerAnimated:completion:", 1, 0, v26);
LABEL_22:
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end