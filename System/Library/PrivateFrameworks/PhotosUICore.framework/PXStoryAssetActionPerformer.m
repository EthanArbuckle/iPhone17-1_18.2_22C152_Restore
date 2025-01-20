@interface PXStoryAssetActionPerformer
+ (BOOL)canPerformWithActionManager:(id)a3;
- (PXStoryViewActionPerformer)storyViewActionPerformer;
@end

@implementation PXStoryAssetActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3
{
  id v4 = a3;
  v5 = [v4 performerDelegate];
  if (objc_opt_respondsToSelector())
  {
    v6 = [v4 performerDelegate];
    v7 = [v6 hostViewControllerForActionPerformer:0];
  }
  else
  {
    v7 = 0;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v7 conformsToProtocol:&unk_1F050CE48])
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___PXStoryAssetActionPerformer;
    unsigned __int8 v8 = objc_msgSendSuper2(&v10, sel_canPerformWithActionManager_, v4);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (PXStoryViewActionPerformer)storyViewActionPerformer
{
  p_storyViewActionPerformer = &self->_storyViewActionPerformer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_storyViewActionPerformer);
  if (!WeakRetained)
  {
    v5 = [(PXActionPerformer *)self hostViewController];
    int v6 = [v5 conformsToProtocol:&unk_1F050CE48];

    if (!v6) {
      goto LABEL_5;
    }
    WeakRetained = [(PXActionPerformer *)self hostViewController];
    objc_storeWeak((id *)p_storyViewActionPerformer, WeakRetained);
  }

LABEL_5:
  id v7 = objc_loadWeakRetained((id *)p_storyViewActionPerformer);
  return (PXStoryViewActionPerformer *)v7;
}

@end