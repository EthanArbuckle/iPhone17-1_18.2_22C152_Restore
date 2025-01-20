@interface SXContainerComponentView
- (BOOL)allowHierarchyRemoval;
- (BOOL)isTransitionable;
- (BOOL)transitionViewShouldFadeInContent;
- (BOOL)userInteractable;
- (BOOL)usesThumbnailWithImageIdentifier:(id)a3;
- (CGRect)transitionContentFrame;
- (NSArray)componentViews;
- (NSString)description;
- (SXContainerComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 mediaSharingPolicyProvider:(id)a7;
- (SXDragManager)dragManager;
- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider;
- (id)componentViewsForRole:(int)a3 recursive:(BOOL)a4;
- (id)contentViewForBehavior:(id)a3;
- (id)dragManager:(id)a3 dragableAtLocation:(CGPoint)a4;
- (void)addComponentView:(id)a3;
- (void)animationDidFinish:(id)a3;
- (void)animationDidStart:(id)a3;
- (void)didApplyBehavior:(id)a3;
- (void)prepareForTransitionType:(unint64_t)a3;
- (void)presentComponentWithChanges:(id)a3;
- (void)removeComponentView:(id)a3;
- (void)setComponentViews:(id)a3;
- (void)setDragManager:(id)a3;
@end

@implementation SXContainerComponentView

- (SXContainerComponentView)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegate:(id)a5 componentStyleRendererFactory:(id)a6 mediaSharingPolicyProvider:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SXContainerComponentView;
  v14 = [(SXComponentView *)&v17 initWithDOMObjectProvider:a3 viewport:a4 presentationDelegate:a5 componentStyleRendererFactory:a6];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_mediaSharingPolicyProvider, a7);
  }

  return v15;
}

- (void)presentComponentWithChanges:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SXContainerComponentView;
  [(SXComponentView *)&v12 presentComponentWithChanges:*(void *)&a3.var0 & 0xFFFFFFLL];
  v4 = [(SXContainerComponentView *)self dragManager];
  if (!v4)
  {
    v4 = [(SXContainerComponentView *)self componentViews];
    if (![v4 count])
    {
      v5 = [(SXComponentView *)self fillView];
      v6 = [v5 dragable];

      if (!v6) {
        return;
      }
      v7 = [SXDragManager alloc];
      v8 = [(SXContainerComponentView *)self mediaSharingPolicyProvider];
      v9 = -[SXDragManager initWithSharingPolicy:dataSource:](v7, "initWithSharingPolicy:dataSource:", [v8 mediaSharingPolicy], self);
      [(SXContainerComponentView *)self setDragManager:v9];

      v4 = [(SXContainerComponentView *)self dragManager];
      v10 = [(SXComponentView *)self fillView];
      v11 = [v10 dragable];
      [v4 updateAccessibilityDragSourceDescriptorsForDraggableElement:v11];
    }
  }
}

- (id)contentViewForBehavior:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [(SXComponentView *)v5 fillView];
    v6 = v5;
    v5 = (SXContainerComponentView *)objc_claimAutoreleasedReturnValue();
LABEL_4:

    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [(SXComponentView *)v5 fillView];
    if (v6)
    {
      uint64_t v8 = [(SXComponentView *)v5 fillView];

      v5 = (SXContainerComponentView *)v8;
    }
    goto LABEL_4;
  }
LABEL_5:

  return v5;
}

- (id)componentViewsForRole:(int)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  v7 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v8 = [(SXContainerComponentView *)self componentViews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v14 = [v13 component];
        if ([v14 role] == v5) {
          [v7 addObject:v13];
        }
        if (v4)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = [v13 componentViewsForRole:v5 recursive:1];
            [v7 addObjectsFromArray:v15];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)addComponentView:(id)a3
{
  id v16 = a3;
  [(SXComponentView *)self fillView];

  BOOL v4 = [(SXComponentView *)self contentView];
  uint64_t v5 = [v4 subviews];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = [(SXComponentView *)self contentView];
      uint64_t v9 = [v8 subviews];
      uint64_t v10 = [v9 objectAtIndex:v7];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v11 = [v10 componentIndex];
        if (v11 > [v16 componentIndex]) {
          break;
        }
      }

      ++v7;
      objc_super v12 = [(SXComponentView *)self contentView];
      id v13 = [v12 subviews];
      unint64_t v14 = [v13 count];

      if (v7 >= v14) {
        goto LABEL_6;
      }
    }

    v15 = [(SXComponentView *)self contentView];
    [v15 insertSubview:v16 atIndex:v7];
  }
  else
  {
LABEL_6:
    v15 = [(SXComponentView *)self contentView];
    [v15 addSubview:v16];
  }
}

- (void)removeComponentView:(id)a3
{
}

- (CGRect)transitionContentFrame
{
  [(SXComponentView *)self contentFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(SXComponentView *)self fillView];

  if (v11)
  {
    objc_super v12 = [(SXComponentView *)self fillView];
    id v13 = [(SXComponentView *)self fillView];
    [v13 contentFrame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    uint64_t v22 = [(SXComponentView *)self fillView];
    v23 = [v22 superview];
    objc_msgSend(v12, "convertRect:toView:", v23, v15, v17, v19, v21);
    double v4 = v24;
    double v6 = v25;
    double v8 = v26;
    double v10 = v27;
  }
  double v28 = v4;
  double v29 = v6;
  double v30 = v8;
  double v31 = v10;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (BOOL)usesThumbnailWithImageIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = [(SXComponentView *)self fillView];
  uint64_t v6 = [v5 fill];
  if (v6)
  {
    double v7 = (void *)v6;
    double v8 = [(SXComponentView *)self fillView];
    double v9 = [v8 fill];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      unint64_t v11 = [(SXComponentView *)self fillView];
      objc_super v12 = [v11 fill];

      uint64_t v13 = [v12 imageIdentifier];
      goto LABEL_8;
    }
  }
  else
  {
  }
  objc_super v12 = [(SXComponentView *)self fillView];
  uint64_t v14 = [v12 fill];
  if (!v14)
  {
    double v20 = 0;
    goto LABEL_10;
  }
  double v15 = (void *)v14;
  double v16 = [(SXComponentView *)self fillView];
  double v17 = [v16 fill];
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) == 0)
  {
    double v20 = 0;
    goto LABEL_12;
  }
  double v19 = [(SXComponentView *)self fillView];
  objc_super v12 = [v19 fill];

  uint64_t v13 = [v12 stillImageIdentifier];
LABEL_8:
  double v20 = (void *)v13;
LABEL_10:

LABEL_12:
  char v21 = [v4 isEqualToString:v20];

  return v21;
}

- (BOOL)transitionViewShouldFadeInContent
{
  return 1;
}

- (BOOL)isTransitionable
{
  v2 = [(SXComponentView *)self fillView];
  double v3 = [v2 fill];
  BOOL v4 = [v3 fillMode] != 0;

  return v4;
}

- (void)prepareForTransitionType:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)SXContainerComponentView;
  -[SXComponentView prepareForTransitionType:](&v14, sel_prepareForTransitionType_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v5 = [(SXContainerComponentView *)self componentViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) prepareForTransitionType:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)animationDidStart:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SXContainerComponentView;
  [(SXComponentView *)&v14 animationDidStart:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v5 = [(SXContainerComponentView *)self componentViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) animationDidStart:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)animationDidFinish:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SXContainerComponentView;
  [(SXComponentView *)&v14 animationDidFinish:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v5 = [(SXContainerComponentView *)self componentViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) animationDidFinish:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)didApplyBehavior:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SXContainerComponentView;
  [(SXComponentView *)&v14 didApplyBehavior:v4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v5 = [(SXContainerComponentView *)self componentViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) didApplyBehavior:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)dragManager:(id)a3 dragableAtLocation:(CGPoint)a4
{
  id v4 = [(SXComponentView *)self fillView];
  double v5 = [v4 dragable];

  return v5;
}

- (BOOL)userInteractable
{
  v2 = [(SXContainerComponentView *)self dragManager];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)allowHierarchyRemoval
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)SXContainerComponentView;
  if (![(SXComponentView *)&v14 allowHierarchyRemoval]) {
    return 0;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(SXContainerComponentView *)self componentViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![*(id *)(*((void *)&v10 + 1) + 8 * i) allowHierarchyRemoval])
        {
          BOOL v8 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

- (NSString)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(SXComponentView *)self component];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = [(SXComponentView *)self component];
  BOOL v8 = [v7 components];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; identifier: '%@'; numberOfChilds: %lu>",
    v4,
    self,
    v6,
  uint64_t v9 = [v8 count]);

  return (NSString *)v9;
}

- (NSArray)componentViews
{
  return self->_componentViews;
}

- (void)setComponentViews:(id)a3
{
}

- (SXMediaSharingPolicyProvider)mediaSharingPolicyProvider
{
  return self->_mediaSharingPolicyProvider;
}

- (SXDragManager)dragManager
{
  return self->_dragManager;
}

- (void)setDragManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragManager, 0);
  objc_storeStrong((id *)&self->_mediaSharingPolicyProvider, 0);
  objc_storeStrong((id *)&self->_componentViews, 0);
}

@end