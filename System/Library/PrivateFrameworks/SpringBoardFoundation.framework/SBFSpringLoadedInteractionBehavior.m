@interface SBFSpringLoadedInteractionBehavior
- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4;
- (SBFSpringLoadedInteractionBehaviorDelegate)delegate;
- (void)interactionDidFinish:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SBFSpringLoadedInteractionBehavior

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 dropSession];
  v9 = [v7 view];

  [v6 locationInView:v9];
  double v11 = v10;
  double v13 = v12;
  v14 = [(SBFSpringLoadedInteractionBehavior *)self delegate];
  v15 = objc_msgSend(v14, "targetItemForSpringLoadingInteractionInView:atLocation:forDropSession:", v9, v8, v11, v13);

  [v6 setTargetItem:v15];
  return v15 != 0;
}

- (void)interactionDidFinish:(id)a3
{
  id v3 = [(SBFSpringLoadedInteractionBehavior *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 springLoadedInteractionDidFinish];
  }
}

- (SBFSpringLoadedInteractionBehaviorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBFSpringLoadedInteractionBehaviorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end