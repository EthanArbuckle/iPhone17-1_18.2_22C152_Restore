@interface UIViewController(VideosUI)
+ (id)_vui_TVLoadingViewControllerClass;
- (BOOL)vui_ppt_isLoading;
- (void)vui_presentViewController:()VideosUI animated:completion:;
@end

@implementation UIViewController(VideosUI)

- (BOOL)vui_ppt_isLoading
{
  v1 = [a1 view];
  v2 = [v1 subviews];

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__UIViewController_VideosUI__vui_ppt_isLoading__block_invoke;
  v7[3] = &unk_1E6DF8378;
  v7[4] = &v8;
  [v2 enumerateObjectsUsingBlock:v7];
  v3 = (void *)v9[5];
  BOOL v5 = 0;
  if (v3)
  {
    [v3 alpha];
    if (v4 > 0.0) {
      BOOL v5 = 1;
    }
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)_vui_TVLoadingViewControllerClass
{
  if (_vui_TVLoadingViewControllerClass___onceToken != -1) {
    dispatch_once(&_vui_TVLoadingViewControllerClass___onceToken, &__block_literal_global_74);
  }
  v0 = (void *)_vui_TVLoadingViewControllerClass___loadingViewClass;
  return v0;
}

- (void)vui_presentViewController:()VideosUI animated:completion:
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __76__UIViewController_VideosUI__vui_presentViewController_animated_completion___block_invoke;
  v18 = &unk_1E6DF83A0;
  v19 = a1;
  id v20 = v8;
  char v22 = a4;
  id v21 = v9;
  id v10 = v9;
  id v11 = v8;
  v12 = (void (**)(void))_Block_copy(&v15);
  id v13 = objc_msgSend(a1, "presentedViewController", v15, v16, v17, v18, v19);
  v14 = v13;
  if (v13) {
    [v13 dismissViewControllerAnimated:a4 completion:v12];
  }
  else {
    v12[2](v12);
  }
}

@end