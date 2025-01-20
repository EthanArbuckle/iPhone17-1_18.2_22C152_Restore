@interface UIViewController(PrototypeTools_PhotosUICore)
+ (_PXConsoleViewController)px_viewControllerWithContinuousOutputProducer:()PrototypeTools_PhotosUICore;
+ (id)px_viewControllerWithAsynchronousOutputProducer:()PrototypeTools_PhotosUICore;
+ (id)px_viewControllerWithOutput:()PrototypeTools_PhotosUICore;
+ (id)px_viewControllerWithSettings:()PrototypeTools_PhotosUICore;
@end

@implementation UIViewController(PrototypeTools_PhotosUICore)

+ (_PXConsoleViewController)px_viewControllerWithContinuousOutputProducer:()PrototypeTools_PhotosUICore
{
  id v3 = a3;
  v4 = objc_alloc_init(_PXConsoleViewController);
  v5 = [MEMORY[0x1E4F1C9C8] date];
  objc_initWeak(&location, v4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95__UIViewController_PrototypeTools_PhotosUICore__px_viewControllerWithContinuousOutputProducer___block_invoke;
  v11[3] = &unk_1E5DBBE18;
  objc_copyWeak(&v12, &location);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __95__UIViewController_PrototypeTools_PhotosUICore__px_viewControllerWithContinuousOutputProducer___block_invoke_2;
  v8[3] = &unk_1E5DB5580;
  objc_copyWeak(&v10, &location);
  id v6 = v5;
  id v9 = v6;
  (*((void (**)(id, void *, void *))v3 + 2))(v3, v11, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v4;
}

+ (id)px_viewControllerWithAsynchronousOutputProducer:()PrototypeTools_PhotosUICore
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__UIViewController_PrototypeTools_PhotosUICore__px_viewControllerWithAsynchronousOutputProducer___block_invoke;
  v8[3] = &unk_1E5DB5558;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "px_viewControllerWithContinuousOutputProducer:", v8);

  return v6;
}

+ (id)px_viewControllerWithOutput:()PrototypeTools_PhotosUICore
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__UIViewController_PrototypeTools_PhotosUICore__px_viewControllerWithOutput___block_invoke;
  v8[3] = &unk_1E5DB54C0;
  id v9 = v4;
  id v5 = v4;
  id v6 = objc_msgSend(a1, "px_viewControllerWithAsynchronousOutputProducer:", v8);

  return v6;
}

+ (id)px_viewControllerWithSettings:()PrototypeTools_PhotosUICore
{
  id v3 = (objc_class *)MEMORY[0x1E4F94208];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithRootSettings:v4];

  id v6 = [v5 topViewController];

  return v6;
}

@end