@interface PXGadgetUICollectionViewCell
+ (Class)_contentViewClass;
- (UIView)gadgetContentView;
- (id)focusEffect;
- (void)_updateFocusRing;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setGadgetContentView:(id)a3;
@end

@implementation PXGadgetUICollectionViewCell

- (void).cxx_destruct
{
}

- (UIView)gadgetContentView
{
  return self->_gadgetContentView;
}

- (id)focusEffect
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXGadgetUICollectionViewCell;
  [(PXGadgetUICollectionViewCell *)&v10 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  v7 = [v6 nextFocusedItem];
  if (v7 == self)
  {
    v9 = [(PXGadgetUICollectionViewCell *)self gadgetContentView];
    if (v9)
    {

LABEL_8:
      [(PXGadgetUICollectionViewCell *)self _updateFocusRing];
      goto LABEL_9;
    }
  }
  v8 = [v6 previouslyFocusedItem];

  if (v7 == self) {
  else
  }

  if (v8 == self) {
    goto LABEL_8;
  }
LABEL_9:
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PXGadgetUICollectionViewCell;
  [(PXGadgetUICollectionViewCell *)&v3 prepareForReuse];
  [(PXGadgetUICollectionViewCell *)self setGadgetContentView:0];
}

- (void)setGadgetContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_gadgetContentView = &self->_gadgetContentView;
  gadgetContentView = self->_gadgetContentView;
  if (gadgetContentView != v5)
  {
    v8 = [(UIView *)gadgetContentView superview];
    v9 = [(PXGadgetUICollectionViewCell *)self contentView];

    if (v8 == v9) {
      [(UIView *)*p_gadgetContentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_gadgetContentView, a3);
    if (*p_gadgetContentView)
    {
      [(UIView *)*p_gadgetContentView setAutoresizingMask:0];
      objc_super v10 = [(PXGadgetUICollectionViewCell *)self contentView];
      [v10 addSubview:*p_gadgetContentView];

      if (objc_opt_respondsToSelector())
      {
        objc_initWeak(&location, self);
        uint64_t v12 = MEMORY[0x1E4F143A8];
        uint64_t v13 = 3221225472;
        v14 = __53__PXGadgetUICollectionViewCell_setGadgetContentView___block_invoke;
        v15 = &unk_1E5DD32D0;
        objc_copyWeak(&v16, &location);
        [(UIView *)*p_gadgetContentView setFocusInfoChangeHandler:&v12];
        objc_destroyWeak(&v16);
        objc_destroyWeak(&location);
      }
      v11 = [(PXGadgetUICollectionViewCell *)self contentView];
      [v11 setNeedsLayout];
    }
  }
}

void __53__PXGadgetUICollectionViewCell_setGadgetContentView___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained isFocused];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 _updateFocusRing];
  }
}

- (void)_updateFocusRing
{
}

id __48__PXGadgetUICollectionViewCell__updateFocusRing__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) gadgetContentView];
  if (objc_opt_respondsToSelector())
  {
    v2 = [v1 focusInfo];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

@end