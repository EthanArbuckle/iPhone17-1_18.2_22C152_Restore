@interface UINavigationController(PhotosUICore_PPT)
- (id)_ppt_transitionAnimationCompletionHandler;
- (void)_ppt_setTransitionAnimationCompletionHandler:()PhotosUICore_PPT;
- (void)ppt_installTransitionAnimationCompletionHandler:()PhotosUICore_PPT;
- (void)ppt_notifyTransitionAnimationDidComplete;
@end

@implementation UINavigationController(PhotosUICore_PPT)

- (void)_ppt_setTransitionAnimationCompletionHandler:()PhotosUICore_PPT
{
  v4 = (const void *)PPTTransitionAnimationCompletionHandlerAssociationKey;
  id v5 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, v4, v5, (void *)1);
}

- (id)_ppt_transitionAnimationCompletionHandler
{
  v1 = objc_getAssociatedObject(a1, (const void *)PPTTransitionAnimationCompletionHandlerAssociationKey);
  v2 = _Block_copy(v1);

  return v2;
}

- (void)ppt_notifyTransitionAnimationDidComplete
{
  objc_msgSend(a1, "_ppt_transitionAnimationCompletionHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    objc_msgSend(a1, "_ppt_setTransitionAnimationCompletionHandler:", 0);
    v2 = v3;
  }
}

- (void)ppt_installTransitionAnimationCompletionHandler:()PhotosUICore_PPT
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_msgSend(a1, "_ppt_transitionAnimationCompletionHandler");
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __92__UINavigationController_PhotosUICore_PPT__ppt_installTransitionAnimationCompletionHandler___block_invoke;
    v11 = &unk_1E5DCC5D0;
    id v12 = v5;
    id v13 = v4;
    id v6 = v5;
    v7 = (void *)[&v8 copy];
    objc_msgSend(a1, "_ppt_setTransitionAnimationCompletionHandler:", v7, v8, v9, v10, v11);
  }
}

@end