@interface _PXFrozenViewController
- (_PXFrozenViewController)initWithSnapshotView:(id)a3;
- (void)unfreezeAnimated:(BOOL)a3;
@end

@implementation _PXFrozenViewController

- (void).cxx_destruct
{
}

- (void)unfreezeAnimated:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  snapshotView = self->_snapshotView;
  if (snapshotView)
  {
    BOOL v4 = a3;
    v6 = snapshotView;
    v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_INFO, "Unfreezing snapshot: %p", buf, 0xCu);
    }

    v8 = self->_snapshotView;
    self->_snapshotView = 0;

    if (v4) {
      double v9 = 0.3;
    }
    else {
      double v9 = 0.0;
    }
    v10 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __44___PXFrozenViewController_unfreezeAnimated___block_invoke;
    v14[3] = &unk_1E5DD36F8;
    v15 = v6;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44___PXFrozenViewController_unfreezeAnimated___block_invoke_2;
    v12[3] = &unk_1E5DD2188;
    v13 = v15;
    v11 = v15;
    [v10 animateWithDuration:v14 animations:v12 completion:v9];
  }
}

- (_PXFrozenViewController)initWithSnapshotView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXFrozenViewController;
  v6 = [(_PXFrozenViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_snapshotView, a3);
  }

  return v7;
}

@end