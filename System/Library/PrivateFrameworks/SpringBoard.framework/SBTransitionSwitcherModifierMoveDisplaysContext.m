@interface SBTransitionSwitcherModifierMoveDisplaysContext
+ (id)moveDisplaysContextWithCoordinatedLayoutStateTransitionContext:(id)a3 relativeToSwitcherController:(id)a4;
- (BOOL)pertainsToAppLayout:(id)a3;
- (BOOL)pertainsToDisplayItem:(id)a3;
- (CGRect)fromFrameForDisplayItem:(id)a3;
- (CGRect)toFrameForDisplayItem:(id)a3;
- (NSSet)movingDisplayItems;
- (SBSwitcherController)switcherController;
- (SBSwitcherCoordinatedLayoutStateTransitionContext)coordinatedLayoutStateTransitionContext;
- (SBTransitionSwitcherModifierMoveDisplaysContext)initWithCoordinatedLayoutStateTransitionContext:(id)a3 switcherController:(id)a4;
@end

@implementation SBTransitionSwitcherModifierMoveDisplaysContext

+ (id)moveDisplaysContextWithCoordinatedLayoutStateTransitionContext:(id)a3 relativeToSwitcherController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithCoordinatedLayoutStateTransitionContext:v7 switcherController:v6];

  return v8;
}

- (SBTransitionSwitcherModifierMoveDisplaysContext)initWithCoordinatedLayoutStateTransitionContext:(id)a3 switcherController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBTransitionSwitcherModifierMoveDisplaysContext;
  v9 = [(SBTransitionSwitcherModifierMoveDisplaysContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coordinatedLayoutStateTransitionContext, a3);
    objc_storeStrong((id *)&v10->_switcherController, a4);
  }

  return v10;
}

- (NSSet)movingDisplayItems
{
  return [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_coordinatedLayoutStateTransitionContext displayItems];
}

- (BOOL)pertainsToAppLayout:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  v5 = [a3 allItems];
  id v6 = [v4 setWithArray:v5];

  id v7 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_coordinatedLayoutStateTransitionContext displayItems];
  LOBYTE(v5) = [v6 intersectsSet:v7];

  return (char)v5;
}

- (BOOL)pertainsToDisplayItem:(id)a3
{
  coordinatedLayoutStateTransitionContext = self->_coordinatedLayoutStateTransitionContext;
  id v4 = a3;
  v5 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)coordinatedLayoutStateTransitionContext displayItems];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (CGRect)fromFrameForDisplayItem:(id)a3
{
  id v4 = a3;
  switcherController = self->_switcherController;
  char v6 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_coordinatedLayoutStateTransitionContext fromSwitcherController];
  LODWORD(switcherController) = [(SBSwitcherController *)switcherController isEqual:v6];

  if (switcherController)
  {
    [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_coordinatedLayoutStateTransitionContext fromFrameInFromSwitcherForDisplayItem:v4];
  }
  else
  {
    v11 = self->_switcherController;
    objc_super v12 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_coordinatedLayoutStateTransitionContext toSwitcherController];
    LODWORD(v11) = [(SBSwitcherController *)v11 isEqual:v12];

    if (!v11)
    {
      double v13 = *MEMORY[0x1E4F1DB28];
      double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      goto LABEL_7;
    }
    [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_coordinatedLayoutStateTransitionContext fromFrameInToSwitcherForDisplayItem:v4];
  }
  double v13 = v7;
  double v14 = v8;
  double v15 = v9;
  double v16 = v10;
LABEL_7:

  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)toFrameForDisplayItem:(id)a3
{
  id v4 = a3;
  switcherController = self->_switcherController;
  char v6 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_coordinatedLayoutStateTransitionContext fromSwitcherController];
  LODWORD(switcherController) = [(SBSwitcherController *)switcherController isEqual:v6];

  if (switcherController)
  {
    [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_coordinatedLayoutStateTransitionContext toFrameInFromSwitcherForDisplayItem:v4];
  }
  else
  {
    v11 = self->_switcherController;
    objc_super v12 = [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_coordinatedLayoutStateTransitionContext toSwitcherController];
    LODWORD(v11) = [(SBSwitcherController *)v11 isEqual:v12];

    if (!v11)
    {
      double v13 = *MEMORY[0x1E4F1DB28];
      double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      goto LABEL_7;
    }
    [(SBSwitcherCoordinatedLayoutStateTransitionContext *)self->_coordinatedLayoutStateTransitionContext toFrameInToSwitcherForDisplayItem:v4];
  }
  double v13 = v7;
  double v14 = v8;
  double v15 = v9;
  double v16 = v10;
LABEL_7:

  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (SBSwitcherCoordinatedLayoutStateTransitionContext)coordinatedLayoutStateTransitionContext
{
  return self->_coordinatedLayoutStateTransitionContext;
}

- (SBSwitcherController)switcherController
{
  return self->_switcherController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switcherController, 0);
  objc_storeStrong((id *)&self->_coordinatedLayoutStateTransitionContext, 0);
}

@end