@interface SBSystemNotesPlaceholderContentProvider
- (SBScenePlaceholderContentViewProviderDelegate)delegate;
- (SBSystemNotesPlaceholderContentProvider)initWithSnapshot:(id)a3;
- (UIImage)snapshot;
- (id)sceneView:(id)a3 requestsPlaceholderContentViewWithContext:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSnapshot:(id)a3;
@end

@implementation SBSystemNotesPlaceholderContentProvider

- (SBSystemNotesPlaceholderContentProvider)initWithSnapshot:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSystemNotesPlaceholderContentProvider;
  v6 = [(SBSystemNotesPlaceholderContentProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_snapshot, a3);
  }

  return v7;
}

- (id)sceneView:(id)a3 requestsPlaceholderContentViewWithContext:(id)a4
{
  v4 = [[SBPIPSceneContentPlaceholderView alloc] initWithImage:self->_snapshot];
  return v4;
}

- (void)setSnapshot:(id)a3
{
  id v6 = a3;
  if ((-[UIImage isEqual:](self->_snapshot, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_snapshot, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained placeholderContentViewProviderContentDidUpdate:self];
  }
}

- (SBScenePlaceholderContentViewProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBScenePlaceholderContentViewProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImage)snapshot
{
  return self->_snapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end