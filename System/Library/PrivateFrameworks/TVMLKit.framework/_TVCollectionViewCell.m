@interface _TVCollectionViewCell
- (TVAuxiliaryViewSelecting)selectingView;
- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3;
- (void)layoutSubviews;
- (void)setSelectingView:(id)a3;
@end

@implementation _TVCollectionViewCell

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_TVCollectionViewCell;
  [(_TVCollectionViewCell *)&v4 layoutSubviews];
  v3 = [(_TVCollectionViewCell *)self selectingView];
  [(_TVCollectionViewCell *)self bounds];
  objc_msgSend(v3, "setFrame:");
  [v3 layoutIfNeeded];
}

- (TVAuxiliaryViewSelecting)selectingView
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_selectingView = &self->_selectingView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectingView);

  if (!WeakRetained)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5 = [(_TVCollectionViewCell *)self contentView];
    v6 = [v5 subviews];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 conformsToProtocol:&unk_26E5AEAA8])
          {
            objc_storeWeak((id *)p_selectingView, v11);
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  id v12 = objc_loadWeakRetained((id *)p_selectingView);
  return (TVAuxiliaryViewSelecting *)v12;
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectingView);
  objc_msgSend(WeakRetained, "selectionMarginsForSize:", width, height);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)setSelectingView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end