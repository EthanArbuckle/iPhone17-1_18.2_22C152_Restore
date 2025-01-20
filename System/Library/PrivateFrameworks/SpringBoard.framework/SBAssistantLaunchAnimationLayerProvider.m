@interface SBAssistantLaunchAnimationLayerProvider
- (CALayer)transitioningLayer;
- (SBAssistantLaunchAnimationLayerProvider)initWithDropletLayer:(id)a3;
- (void)setTransitioningLayer:(id)a3;
@end

@implementation SBAssistantLaunchAnimationLayerProvider

- (SBAssistantLaunchAnimationLayerProvider)initWithDropletLayer:(id)a3
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBAssistantLaunchAnimationLayerProvider;
  v7 = [(SBAssistantLaunchAnimationLayerProvider *)&v10 init];
  if (v7)
  {
    if (!v6)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"SBAssistantLaunchAnimationLayerProvider.m", 21, @"Invalid parameter not satisfying: %@", @"dropletLayer" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_dropletLayer, a3);
  }

  return v7;
}

- (CALayer)transitioningLayer
{
  return self->_dropletLayer;
}

- (void)setTransitioningLayer:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"SBAssistantLaunchAnimationLayerProvider.m" lineNumber:34 description:@"read-only"];
}

- (void).cxx_destruct
{
}

@end