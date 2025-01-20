@interface _SBPIPInteractionControllerTransitionInfo
- (SBWindowScene)targetWindowScene;
- (unint64_t)layoutCorner;
- (void)setLayoutCorner:(unint64_t)a3;
- (void)setTargetWindowScene:(id)a3;
@end

@implementation _SBPIPInteractionControllerTransitionInfo

- (SBWindowScene)targetWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setTargetWindowScene:(id)a3
{
}

- (unint64_t)layoutCorner
{
  return self->_layoutCorner;
}

- (void)setLayoutCorner:(unint64_t)a3
{
  self->_layoutCorner = a3;
}

- (void).cxx_destruct
{
}

@end