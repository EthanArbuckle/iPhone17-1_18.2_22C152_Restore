@interface UIKBViewTreeSnapshotter
+ (id)snapshotterForKeyboardView:(id)a3 afterScreenUpdates:(BOOL)a4;
- (UIView)snapshotView;
- (void)dealloc;
@end

@implementation UIKBViewTreeSnapshotter

+ (id)snapshotterForKeyboardView:(id)a3 afterScreenUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = objc_alloc_init(UIKBViewTreeSnapshotter);
  v7 = [_UIViewBlockVisitor alloc];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __73__UIKBViewTreeSnapshotter_snapshotterForKeyboardView_afterScreenUpdates___block_invoke;
  v17 = &unk_1E52E7838;
  BOOL v19 = v4;
  v8 = v6;
  v18 = v8;
  v9 = [(_UIViewBlockVisitor *)v7 initWithTraversalDirection:2 visitorBlock:&v14];
  -[_UIViewVisitor setVisitMaskViews:](v9, "setVisitMaskViews:", 0, v14, v15, v16, v17);
  [v5 _receiveVisitor:v9];
  uint64_t v10 = [v5 snapshotViewAfterScreenUpdates:v4];

  snapshotView = v8->_snapshotView;
  v8->_snapshotView = (UIView *)v10;

  if (v8->_snapshotView) {
    v12 = v8;
  }
  else {
    v12 = 0;
  }

  return v12;
}

BOOL __73__UIKBViewTreeSnapshotter_snapshotterForKeyboardView_afterScreenUpdates___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    if (*(unsigned char *)(a1 + 40)) {
      [v3 prepareForSnapshotting];
    }
    id v5 = *(void **)(*(void *)(a1 + 32) + 8);
    if (!v5)
    {
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 8);
      *(void *)(v7 + 8) = v6;

      id v5 = *(void **)(*(void *)(a1 + 32) + 8);
    }
    [v5 addObject:v3];
  }

  return (isKindOfClass & 1) == 0;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_inputViews;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) restoreFromSnapshotting];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)UIKBViewTreeSnapshotter;
  [(UIKBViewTreeSnapshotter *)&v8 dealloc];
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_inputViews, 0);
}

@end