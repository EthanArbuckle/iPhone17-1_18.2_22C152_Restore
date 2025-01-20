@interface _UICollectionViewListSeparatorView
- (_UICollectionViewListSeparatorView)initWithFrame:(CGRect)a3;
- (void)_setUpEffectViewWithEffect:(id)a3;
- (void)_tearDownEffectView;
- (void)applyLayoutAttributes:(id)a3;
@end

@implementation _UICollectionViewListSeparatorView

- (_UICollectionViewListSeparatorView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewListSeparatorView;
  v3 = -[UICollectionReusableView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UIView *)v3 layer];
    [v5 setAllowsEdgeAntialiasing:1];
  }
  return v4;
}

- (void)applyLayoutAttributes:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)_UICollectionViewListSeparatorView;
  v4 = (id *)a3;
  [(UICollectionReusableView *)&v14 applyLayoutAttributes:v4];
  v5 = [(UIView *)self traitCollection];
  v6 = _UITableConstantsForTraitCollection(v5);

  uint64_t v7 = -[UICollectionViewLayoutAttributes _existingListAttributes](v4);

  if (v7)
  {
    id v8 = *(id *)(v7 + 48);
    v9 = *(void **)(v7 + 56);
  }
  else
  {
    id v8 = 0;
    v9 = 0;
  }
  id v10 = v9;
  v11 = v10;
  if (!v8 && v10)
  {
    if (v7 && (unint64_t v12 = *(void *)(v7 + 16) - 1, v12 <= 2)) {
      uint64_t v13 = qword_186B968E8[v12];
    }
    else {
      uint64_t v13 = 0;
    }
    id v8 = [v6 defaultSeparatorColorForTableViewStyle:v13];
    goto LABEL_12;
  }
  if (v10)
  {
LABEL_12:
    [(_UICollectionViewListSeparatorView *)self _setUpEffectViewWithEffect:v11];
    goto LABEL_13;
  }
  [(_UICollectionViewListSeparatorView *)self _tearDownEffectView];
LABEL_13:
  [(UIView *)self setBackgroundColor:v8];
}

- (void)_tearDownEffectView
{
  [(UIView *)self->_effectView removeFromSuperview];
  effectView = self->_effectView;
  self->_effectView = 0;
}

- (void)_setUpEffectViewWithEffect:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_UICollectionViewListSeparatorView.m", 64, @"Invalid parameter not satisfying: %@", @"effect != nil" object file lineNumber description];
  }
  effectView = self->_effectView;
  if (effectView)
  {
    uint64_t v7 = [(UIVisualEffectView *)effectView effect];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v9 = isKindOfClass ^ 1;
  }
  else
  {
    char v9 = 1;
  }
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();
  char v11 = v10;
  if ((v9 & 1) == 0 && (v10 & 1) == 0) {
    [(_UICollectionViewListSeparatorView *)self _tearDownEffectView];
  }
  unint64_t v12 = self->_effectView;
  if (!v12)
  {
    v19 = [[UIVisualEffectView alloc] initWithEffect:v5];
    v20 = self->_effectView;
    self->_effectView = v19;

    v21 = [(UIView *)self->_effectView layer];
    [v21 setAllowsEdgeAntialiasing:1];

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __65___UICollectionViewListSeparatorView__setUpEffectViewWithEffect___block_invoke;
    v23[3] = &unk_1E52D9F70;
    v23[4] = self;
    +[UIView performWithoutAnimation:v23];
    [(UIView *)self->_effectView setAutoresizingMask:18];
    [(UIView *)self addSubview:self->_effectView];
    if ((v11 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  [(UIVisualEffectView *)v12 setEffect:v5];
  if (v11)
  {
LABEL_11:
    uint64_t v13 = [(UIVisualEffectView *)self->_effectView contentView];
    objc_super v14 = [v13 tintColor];
    v15 = [(UIVisualEffectView *)self->_effectView contentView];
    [v15 setBackgroundColor:v14];

    v16 = [(UIVisualEffectView *)self->_effectView contentView];
    v17 = [v16 layer];
    [v17 setAllowsEdgeAntialiasing:1];

    v18 = [(UIVisualEffectView *)self->_effectView contentView];
    [v18 setClipsToBounds:0];
  }
LABEL_12:
}

- (void).cxx_destruct
{
}

@end