@interface TLKImagesView
- (BOOL)isPaddingDisabled;
- (BOOL)isSelectionEnabled;
- (BOOL)useGridAlignment;
- (BOOL)usesDefaultLayoutMargins;
- (NSArray)images;
- (NSMutableArray)imageButtons;
- (TLKImagesViewDelegate)delegate;
- (id)imageViewAtLocation:(CGPoint)a3;
- (id)setupContentView;
- (void)_handleTap:(id)a3;
- (void)_updateImages;
- (void)_updateSpacing;
- (void)observedPropertiesChanged;
- (void)setDelegate:(id)a3;
- (void)setImageButtons:(id)a3;
- (void)setImages:(id)a3;
- (void)setPaddingDisabled:(BOOL)a3;
- (void)setSelectionEnabled:(BOOL)a3;
- (void)setUseGridAlignment:(BOOL)a3;
@end

@implementation TLKImagesView

- (id)setupContentView
{
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  imageButtons = self->_imageButtons;
  self->_imageButtons = v3;

  v5 = objc_opt_new();
  [v5 setHorizontalAlignment:3];
  [v5 setHorizontalDistribution:7];
  [v5 setVerticalAlignment:1];
  [v5 setDelegate:self];
  +[TLKView makeContainerShadowCompatible:v5];
  +[TLKView makeContainerShadowCompatible:self];
  return v5;
}

- (BOOL)usesDefaultLayoutMargins
{
  return 0;
}

- (void)setImages:(id)a3
{
  v10 = (NSArray *)a3;
  if (self->_images != v10)
  {
    objc_storeStrong((id *)&self->_images, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setPaddingDisabled:(BOOL)a3
{
  if (self->_paddingDisabled != a3)
  {
    self->_paddingDisabled = a3;
    uint64_t v4 = [(TLKView *)self observer];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      v6 = [(TLKView *)self observer];
      uint64_t v7 = [v6 batchUpdateCount];

      if (!v7)
      {
        id v8 = [(TLKView *)self observer];
        [v8 propertiesDidChange];
      }
    }
  }
}

- (void)setSelectionEnabled:(BOOL)a3
{
  if (self->_selectionEnabled != a3)
  {
    self->_selectionEnabled = a3;
    uint64_t v4 = [(TLKView *)self observer];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      v6 = [(TLKView *)self observer];
      uint64_t v7 = [v6 batchUpdateCount];

      if (!v7)
      {
        id v8 = [(TLKView *)self observer];
        [v8 propertiesDidChange];
      }
    }
  }
}

- (void)observedPropertiesChanged
{
  [(TLKImagesView *)self _updateImages];
  [(TLKImagesView *)self _updateSpacing];
  id v6 = [(TLKImagesView *)self images];
  BOOL v3 = [v6 count] == 1 && -[TLKImagesView isPaddingDisabled](self, "isPaddingDisabled");
  uint64_t v4 = [(TLKImagesView *)self imageButtons];
  uint64_t v5 = [v4 firstObject];
  [v5 setAlwaysShowPlaceholderView:v3];
}

- (void)_updateSpacing
{
  if ([(TLKImagesView *)self isPaddingDisabled]) {
    double v3 = 0.0;
  }
  else {
    double v3 = 6.0;
  }
  uint64_t v4 = [(TLKView *)self contentView];
  [v4 setItemSpacing:v3];

  if ([(TLKImagesView *)self isPaddingDisabled]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 6.0;
  }
  id v6 = [(TLKView *)self contentView];
  [v6 setRowSpacing:v5];

  if ([(TLKImagesView *)self isPaddingDisabled])
  {
    double v7 = *MEMORY[0x1E4FB2848];
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:6.0];
    double v7 = v11;
    +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:6.0];
    double v8 = v12;
    +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:6.0];
    double v9 = v13;
    +[TLKLayoutUtilities deviceScaledRoundedValue:self forView:6.0];
    double v10 = v14;
  }
  id v15 = [(TLKView *)self contentView];
  objc_msgSend(v15, "setLayoutMargins:", v7, v8, v9, v10);
}

- (void)_updateImages
{
  if ([(TLKImagesView *)self useGridAlignment])
  {
    uint64_t v3 = 4;
  }
  else
  {
    uint64_t v4 = [(TLKImagesView *)self images];
    unint64_t v5 = [v4 count];

    if (v5 >= 4) {
      uint64_t v3 = 4;
    }
    else {
      uint64_t v3 = v5;
    }
  }
  id v6 = [(TLKView *)self contentView];
  [v6 setNumberOfColumns:v3];

  double v7 = [(TLKImagesView *)self imageButtons];
  unint64_t v8 = [v7 count];

  double v9 = [(TLKImagesView *)self images];
  unint64_t v10 = [v9 count];

  if (v8 < v10)
  {
    do
    {
      double v11 = objc_opt_new();
      [v11 setMatchesHeightForAlignmentRectWithIntrinsicContentSize:0];
      [v11 addTarget:self action:sel__handleTap_];
      double v12 = [(TLKImagesView *)self imageButtons];
      [v12 addObject:v11];

      ++v8;
      double v13 = [(TLKImagesView *)self images];
      unint64_t v14 = [v13 count];
    }
    while (v8 < v14);
  }
  id v15 = [(TLKImagesView *)self imageButtons];
  v16 = [(TLKImagesView *)self images];
  v17 = objc_msgSend(v15, "subarrayWithRange:", 0, objc_msgSend(v16, "count"));
  v18 = [(TLKView *)self contentView];
  [v18 setArrangedSubviews:v17];

  v19 = [(TLKImagesView *)self images];
  uint64_t v20 = [v19 count];

  if (v20)
  {
    unint64_t v21 = 0;
    do
    {
      v22 = [(TLKImagesView *)self imageButtons];
      v23 = [v22 objectAtIndexedSubscript:v21];

      v24 = [(TLKImagesView *)self images];
      v25 = [v24 objectAtIndexedSubscript:v21];
      [v23 setTlkImage:v25];

      objc_msgSend(v23, "setEnabled:", -[TLKImagesView isSelectionEnabled](self, "isSelectionEnabled"));
      ++v21;
      v26 = [(TLKImagesView *)self images];
      unint64_t v27 = [v26 count];
    }
    while (v21 < v27);
  }
}

- (void)_handleTap:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v6 = [v5 tlkImage];

  [WeakRetained imagesView:self didSelectImage:v6];
}

- (id)imageViewAtLocation:(CGPoint)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = -[TLKImagesView hitTest:withEvent:](self, "hitTest:withEvent:", 0, a3.x, a3.y);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(TLKImagesView *)self imageButtons];
  id v6 = (void *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (v4 == *(void **)(*((void *)&v10 + 1) + 8 * i))
        {
          id v6 = [v4 tlkImageView];
          goto LABEL_11;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (TLKImagesViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TLKImagesViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)images
{
  return self->_images;
}

- (BOOL)isPaddingDisabled
{
  return self->_paddingDisabled;
}

- (BOOL)isSelectionEnabled
{
  return self->_selectionEnabled;
}

- (BOOL)useGridAlignment
{
  return self->_useGridAlignment;
}

- (void)setUseGridAlignment:(BOOL)a3
{
  self->_useGridAlignment = a3;
}

- (NSMutableArray)imageButtons
{
  return self->_imageButtons;
}

- (void)setImageButtons:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageButtons, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end