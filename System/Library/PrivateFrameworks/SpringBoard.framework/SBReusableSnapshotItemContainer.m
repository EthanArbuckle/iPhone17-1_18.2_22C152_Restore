@interface SBReusableSnapshotItemContainer
- (SBReusableSnapshotItemContainer)initWithFrame:(CGRect)a3 appLayout:(id)a4 delegate:(id)a5 active:(BOOL)a6 windowScene:(id)a7;
- (id)_snapshotView;
- (void)_updateSnapshotViewWithAppLayout:(id)a3;
- (void)prepareForReuse;
- (void)setAppLayout:(id)a3;
- (void)setContentView:(id)a3;
@end

@implementation SBReusableSnapshotItemContainer

- (void)setAppLayout:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBReusableSnapshotItemContainer;
  id v4 = a3;
  [(SBFluidSwitcherItemContainer *)&v5 setAppLayout:v4];
  -[SBReusableSnapshotItemContainer _updateSnapshotViewWithAppLayout:](self, "_updateSnapshotViewWithAppLayout:", v4, v5.receiver, v5.super_class);
}

- (void)_updateSnapshotViewWithAppLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(SBReusableSnapshotItemContainer *)self _snapshotView];
  [v5 setAppLayout:v4];
}

- (id)_snapshotView
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(SBFluidSwitcherItemContainer *)self contentView];
  id v5 = SBSafeCast(v3, v4);

  return v5;
}

- (SBReusableSnapshotItemContainer)initWithFrame:(CGRect)a3 appLayout:(id)a4 delegate:(id)a5 active:(BOOL)a6 windowScene:(id)a7
{
  BOOL v8 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBReusableSnapshotItemContainer;
  v16 = -[SBFluidSwitcherItemContainer initWithFrame:appLayout:delegate:active:windowScene:](&v19, sel_initWithFrame_appLayout_delegate_active_windowScene_, v15, a5, v8, a7, x, y, width, height);
  v17 = v16;
  if (v16) {
    [(SBReusableSnapshotItemContainer *)v16 _updateSnapshotViewWithAppLayout:v15];
  }

  return v17;
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)SBReusableSnapshotItemContainer;
  [(SBFluidSwitcherItemContainer *)&v2 prepareForReuse];
}

- (void)setContentView:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"SBReusableSnapshotItemContainer.m" lineNumber:39 description:@"Only SBAppSwitcherReusableSnapshotView * allowed"];
  }
  v6 = [(SBFluidSwitcherItemContainer *)self contentView];

  if (v6)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"SBReusableSnapshotItemContainer.m" lineNumber:40 description:@"Can't change content view once set"];
  }
  v10.receiver = self;
  v10.super_class = (Class)SBReusableSnapshotItemContainer;
  [(SBFluidSwitcherItemContainer *)&v10 setContentView:v5];
  v7 = [(SBFluidSwitcherItemContainer *)self appLayout];
  [(SBReusableSnapshotItemContainer *)self _updateSnapshotViewWithAppLayout:v7];
}

@end