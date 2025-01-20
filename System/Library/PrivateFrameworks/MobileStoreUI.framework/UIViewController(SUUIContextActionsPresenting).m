@interface UIViewController(SUUIContextActionsPresenting)
- (SUUIContextActionsPresentationRegistration)registerForPreviewingFromSourceView:()SUUIContextActionsPresenting handler:;
- (void)unregisterForPreviewing:()SUUIContextActionsPresenting;
@end

@implementation UIViewController(SUUIContextActionsPresenting)

- (SUUIContextActionsPresentationRegistration)registerForPreviewingFromSourceView:()SUUIContextActionsPresenting handler:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[SUUIContextActionsPresentationRegistration alloc] initWithViewController:a1 handler:v6];

  v9 = (void *)[objc_alloc(MEMORY[0x263F82AC8]) initWithView:v7];
  [v9 setDelegate:v8];
  [(SUUIContextActionsPresentationRegistration *)v8 setPreviewInteraction:v9];
  id v10 = objc_alloc_init(MEMORY[0x263F82938]);
  [v10 setAllowableMovement:10.0];
  [v7 addGestureRecognizer:v10];

  [(SUUIContextActionsPresentationRegistration *)v8 setLongPressGestureRecognizer:v10];
  return v8;
}

- (void)unregisterForPreviewing:()SUUIContextActionsPresenting
{
  id v3 = a3;
  id v6 = [v3 longPressGestureRecognizer];
  if (v6)
  {
    v4 = [v6 view];
    [v4 removeGestureRecognizer:v6];
  }
  v5 = [v3 previewInteraction];
  [v5 cancelInteraction];

  [v3 setPreviewInteraction:0];
}

@end