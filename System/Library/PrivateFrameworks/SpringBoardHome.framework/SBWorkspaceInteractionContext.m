@interface SBWorkspaceInteractionContext
- (SBWorkspaceInteractionContext)initWithGestureRecognizer:(id)a3;
- (SBWorkspaceInteractionContext)initWithInteractionProgress:(id)a3;
- (UIGestureRecognizer)gestureRecognizer;
- (UIInteractionProgress)interactionProgress;
@end

@implementation SBWorkspaceInteractionContext

- (SBWorkspaceInteractionContext)initWithInteractionProgress:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBWorkspaceInteractionContext;
  v6 = [(SBWorkspaceInteractionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_interactionProgress, a3);
  }

  return v7;
}

- (SBWorkspaceInteractionContext)initWithGestureRecognizer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBWorkspaceInteractionContext;
  v6 = [(SBWorkspaceInteractionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_gestureRecognizer, a3);
  }

  return v7;
}

- (UIInteractionProgress)interactionProgress
{
  return self->_interactionProgress;
}

- (UIGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_interactionProgress, 0);
}

@end