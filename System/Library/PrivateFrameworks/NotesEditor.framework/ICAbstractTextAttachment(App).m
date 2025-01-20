@interface ICAbstractTextAttachment(App)
- (id)newlyCreatedViewControllerForManualRendering:()App layoutManager:initialCharacterIndex:;
- (id)viewForLayoutManager:()App;
@end

@implementation ICAbstractTextAttachment(App)

- (id)viewForLayoutManager:()App
{
  id v4 = a3;
  objc_opt_class();
  v5 = ICCheckedDynamicCast();

  v6 = [v5 viewForTextAttachment:a1];

  return v6;
}

- (id)newlyCreatedViewControllerForManualRendering:()App layoutManager:initialCharacterIndex:
{
  id v8 = a4;
  v9 = (void *)[a1 attachmentViewControllerClass];
  if ([v9 conformsToProtocol:&unk_26C150C00])
  {
    int v10 = [v9 instancesRespondToSelector:sel_initWithTextAttachment_forManualRendering_layoutManager_initialCharacterIndex_];
    id v11 = objc_alloc((Class)v9);
    if (v10) {
      uint64_t v12 = [v11 initWithTextAttachment:a1 forManualRendering:a3 layoutManager:v8 initialCharacterIndex:a5];
    }
    else {
      uint64_t v12 = [v11 initWithTextAttachment:a1 forManualRendering:a3 layoutManager:v8];
    }
    v13 = (void *)v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end