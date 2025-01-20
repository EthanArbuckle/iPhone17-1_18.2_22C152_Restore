@interface _UISceneSnapshotPresentationView
- (FBSceneSnapshot)sceneSnapshot;
- (_UISceneSnapshotPresentationView)init;
- (_UISceneSnapshotPresentationView)initWithCoder:(id)a3;
- (_UISceneSnapshotPresentationView)initWithFrame:(CGRect)a3;
- (_UISceneSnapshotPresentationView)initWithSnapshot:(id)a3;
- (void)setSceneSnapshot:(id)a3;
@end

@implementation _UISceneSnapshotPresentationView

- (_UISceneSnapshotPresentationView)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UISceneSnapshotPresentationView.m" lineNumber:27 description:@"-[_UISceneSnapshotPresentationView init] is unavailable. Please use -[initWithSnapshot:]."];

  id v5 = objc_alloc_init(MEMORY[0x1E4F62498]);
  v6 = [(_UISceneSnapshotPresentationView *)self initWithSnapshot:v5];

  return v6;
}

- (_UISceneSnapshotPresentationView)initWithCoder:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"_UISceneSnapshotPresentationView.m" lineNumber:32 description:@"-[_UISceneSnapshotPresentationView initWithCoder:] is unavailable. Please use -[initWithSnapshot:]."];

  id v6 = objc_alloc_init(MEMORY[0x1E4F62498]);
  v7 = [(_UISceneSnapshotPresentationView *)self initWithSnapshot:v6];

  return v7;
}

- (_UISceneSnapshotPresentationView)initWithFrame:(CGRect)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v5 handleFailureInMethod:a2 object:self file:@"_UISceneSnapshotPresentationView.m" lineNumber:37 description:@"-[_UISceneSnapshotPresentationView initWithFrame:] is unavailable. Please use -[initWithSnapshot:]."];

  id v6 = objc_alloc_init(MEMORY[0x1E4F62498]);
  v7 = [(_UISceneSnapshotPresentationView *)self initWithSnapshot:v6];

  return v7;
}

- (_UISceneSnapshotPresentationView)initWithSnapshot:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_UISceneSnapshotPresentationView;
  id v6 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    p_snapshot = (id *)&v6->_snapshot;
    objc_storeStrong((id *)&v6->_snapshot, a3);
    v9 = [*p_snapshot IOSurface];
    if (!v9)
    {
      v9 = [*p_snapshot CGImage];
    }
    v10 = [(UIView *)v7 layer];
    [v10 setContents:v9];
    [v10 setAllowsDisplayCompositing:0];
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v14[0] = *MEMORY[0x1E4F1DAB8];
    v14[1] = v11;
    v14[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(UIView *)v7 setTransform:v14];
    v12 = [v5 context];
    [v12 frame];
    -[UIView setFrame:](v7, "setFrame:");
  }
  return v7;
}

- (FBSceneSnapshot)sceneSnapshot
{
  return self->_snapshot;
}

- (void)setSceneSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
}

@end