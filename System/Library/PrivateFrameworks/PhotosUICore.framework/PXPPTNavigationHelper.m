@interface PXPPTNavigationHelper
+ (UIViewController)applicationRootViewController;
+ (id)_unwrapNavigationController:(id)a3;
+ (id)caseNameStringForPXProgrammaticNavigationResult:(int64_t)a3;
+ (id)topmostChildFromViewController:(id)a3;
+ (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation PXPPTNavigationHelper

+ (id)_unwrapNavigationController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v3;
  v6 = v5;
  id v7 = v5;
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 topViewController];
    v9 = (void *)v8;
    if (v8) {
      v10 = (void *)v8;
    }
    else {
      v10 = v6;
    }
    id v7 = v10;
  }
  return v7;
}

+ (UIViewController)applicationRootViewController
{
  v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v5 = objc_msgSend(v4, "px_firstKeyWindow");
  v6 = [v5 rootViewController];

  if (!v6)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"PXPPTNavigationHelper.m", 85, @"Invalid parameter not satisfying: %@", @"rootViewController != nil" object file lineNumber description];
  }
  return (UIViewController *)v6;
}

+ (id)caseNameStringForPXProgrammaticNavigationResult:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return @"PXProgrammaticNavigationResultUndefined";
  }
  else {
    return off_1E5DD3508[a3 - 1];
  }
}

+ (id)topmostChildFromViewController:(id)a3
{
  id v4 = a3;
  id v5 = [v4 presentedViewController];

  v6 = v4;
  if (v5)
  {
    v6 = v4;
    do
    {
      id v7 = [a1 _unwrapNavigationController:v6];

      v6 = [v7 presentedViewController];

      uint64_t v8 = [v6 presentedViewController];
    }
    while (v8);
  }
  v9 = [a1 _unwrapNavigationController:v6];

  return v9;
}

+ (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v11 = [a1 applicationRootViewController];
  v12 = [PXProgrammaticNavigationRequest alloc];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__PXPPTNavigationHelper_navigateToDestination_options_completionHandler___block_invoke;
  v17[3] = &unk_1E5DD34E8;
  id v18 = v9;
  id v19 = v11;
  id v20 = v10;
  SEL v21 = a2;
  id v22 = a1;
  id v13 = v11;
  id v14 = v10;
  id v15 = v9;
  v16 = [(PXProgrammaticNavigationRequest *)v12 initWithDestination:v15 options:a4 completionHandler:v17];
  PXProgrammaticNavigationRequestExecute(v16, v13);
}

void __73__PXPPTNavigationHelper_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 1)
  {
    id v4 = PXProgrammaticNavigationLastParticipantOnRouteToDestinationMatching(*(void **)(a1 + 32), *(void **)(a1 + 40), &__block_literal_global_302737);
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v25 = *(void *)(a1 + 56);
        uint64_t v26 = *(void *)(a1 + 64);
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        v29 = objc_msgSend(v4, "px_descriptionForAssertionMessage");
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v25, v26, @"PXPPTNavigationHelper.m", 30, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"PXProgrammaticNavigationLastParticipantOnRouteToDestinationMatching(destination, rootViewController, ^BOOL(id<PXProgrammaticNavigationParticipant> participant) { UIViewController *viewController = ((UIViewController *)({ id obj = (participant); id result = ((void *)0); Class cls = [UIViewController class]; if (cls && [obj isKindOfClass:cls]) { result = obj; } result; })); return viewController.px_isVisible || viewController.presentedViewController != ((void *)0); })",
          v28,
          v29);
      }
    }
    uint64_t v5 = objc_msgSend(v4, "ppt_containedViewController");
    v6 = (void *)v5;
    if (v5) {
      id v7 = (void *)v5;
    }
    else {
      id v7 = v4;
    }
    id v8 = v7;

    id v9 = objc_msgSend(v8, "px_topmostPresentedViewController");
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;

      id v8 = v11;
    }
    uint64_t v12 = objc_msgSend(v8, "ppt_containedViewController");
    id v13 = (void *)v12;
    if (v12) {
      id v14 = (void *)v12;
    }
    else {
      id v14 = v8;
    }
    id v15 = v14;

    id v16 = [v15 navigationController];
    if (v16) {
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v16 = 0;
      goto LABEL_22;
    }
    id v16 = v15;
    if (v16)
    {
LABEL_14:
      uint64_t v17 = [v16 topViewController];

      id v15 = (id)v17;
    }
    else
    {
      id v15 = 0;
    }
LABEL_22:
    uint64_t v18 = objc_msgSend(v15, "ppt_containedViewController");
    id v19 = (void *)v18;
    if (v18) {
      id v20 = (void *)v18;
    }
    else {
      id v20 = v15;
    }
    id v21 = v20;

    if (v21)
    {
      dispatch_time_t v22 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__PXPPTNavigationHelper_navigateToDestination_options_completionHandler___block_invoke_3;
      block[3] = &unk_1E5DD34C0;
      id v33 = *(id *)(a1 + 48);
      uint64_t v34 = 1;
      id v32 = v21;
      dispatch_after(v22, MEMORY[0x1E4F14428], block);
    }
    else
    {
      v23 = [NSString stringWithFormat:@"No view controller found after navigating to destination %@", *(void *)(a1 + 32)];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    return;
  }
  id v30 = [NSString stringWithFormat:@"Failed to navigate to destination %@: %@", *(void *)(a1 + 32), a3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __73__PXPPTNavigationHelper_navigateToDestination_options_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[6], 0, a1[4]);
}

BOOL __73__PXPPTNavigationHelper_navigateToDestination_options_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  if (objc_msgSend(v3, "px_isVisible"))
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [v3 presentedViewController];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

@end