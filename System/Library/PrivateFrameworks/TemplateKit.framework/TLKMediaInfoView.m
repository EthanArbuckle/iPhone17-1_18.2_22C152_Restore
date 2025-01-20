@interface TLKMediaInfoView
- (BOOL)imageViewIsHidden;
- (NSArray)contents;
- (TLKContentsContainerView)contentsContainer;
- (TLKImage)image;
- (TLKImageView)imageView;
- (id)detailLabelStrings;
- (id)setupContentView;
- (id)titleLabelStrings;
- (void)observedPropertiesChanged;
- (void)setContents:(id)a3;
- (void)setContentsContainer:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation TLKMediaInfoView

- (id)setupContentView
{
  v3 = objc_opt_new();
  [v3 setAlignment:1];
  [v3 setSpacing:10.0];
  [v3 setFlipsToVerticalAxisForAccessibilityContentSizes:1];
  v4 = objc_opt_new();
  [v3 addArrangedSubview:v4];
  +[TLKLayoutUtilities requireIntrinsicSizeForView:v4];
  [(TLKMediaInfoView *)self setImageView:v4];
  v5 = objc_opt_new();
  v6 = +[TLKFontUtilities shortSubheadBoldFont];
  [v6 ascender];
  double v8 = v7;
  v9 = +[TLKFontUtilities shortSubheadBoldFont];
  [v9 capHeight];
  objc_msgSend(v5, "setCustomAlignmentRectInsets:", v8 - v10, 0.0, 0.0, 0.0);

  [v3 addArrangedSubview:v5];
  [(TLKMediaInfoView *)self setContentsContainer:v5];

  return v3;
}

- (void)setImage:(id)a3
{
  double v10 = (TLKImage *)a3;
  if (self->_image != v10)
  {
    objc_storeStrong((id *)&self->_image, a3);
    uint64_t v5 = [(TLKView *)self observer];
    if (v5)
    {
      v6 = (void *)v5;
      double v7 = [(TLKView *)self observer];
      uint64_t v8 = [v7 batchUpdateCount];

      if (!v8)
      {
        v9 = [(TLKView *)self observer];
        [v9 propertiesDidChange];
      }
    }
  }
}

- (void)setContents:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_contents = &self->_contents;
  if (objc_opt_respondsToSelector())
  {
    [(NSArray *)*p_contents setObserver:0];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v24 = v5;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      double v7 = *p_contents;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v30;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v30 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
            if (objc_opt_respondsToSelector()) {
              [v12 setObserver:0];
            }
            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v9);
      }

      id v5 = v24;
    }
  }
  objc_storeStrong((id *)&self->_contents, a3);
  if (objc_opt_respondsToSelector())
  {
    [(NSArray *)*p_contents setObserver:self];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v13 = *p_contents;
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v26;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v26 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v25 + 1) + 8 * v17);
            if (objc_opt_respondsToSelector()) {
              [v18 setObserver:self];
            }
            ++v17;
          }
          while (v15 != v17);
          uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v15);
      }
    }
  }
  uint64_t v19 = [(TLKView *)self observer];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(TLKView *)self observer];
    uint64_t v22 = [v21 batchUpdateCount];

    if (!v22)
    {
      v23 = [(TLKView *)self observer];
      [v23 propertiesDidChange];
    }
  }
}

- (void)observedPropertiesChanged
{
  v3 = [(TLKMediaInfoView *)self image];
  v4 = [(TLKMediaInfoView *)self imageView];
  [v4 setTlkImage:v3];

  id v5 = [(TLKMediaInfoView *)self image];
  v6 = [(TLKMediaInfoView *)self imageView];
  [v6 setHidden:v5 == 0];

  id v8 = [(TLKMediaInfoView *)self contentsContainer];
  double v7 = [(TLKMediaInfoView *)self contents];
  [v8 updateWithContents:v7];
}

- (BOOL)imageViewIsHidden
{
  v2 = [(TLKMediaInfoView *)self imageView];
  char v3 = [v2 isHidden];

  return v3;
}

- (id)titleLabelStrings
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(TLKMediaInfoView *)self contentsContainer];
  id v5 = [v4 contentsViews];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (([v10 isHidden] & 1) == 0)
        {
          uint64_t v11 = [v10 titleLabel];
          v12 = [v11 text];
          [v3 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)detailLabelStrings
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v19 = (id)objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  char v3 = [(TLKMediaInfoView *)self contentsContainer];
  v4 = [v3 contentsViews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (([v9 isHidden] & 1) == 0)
        {
          uint64_t v10 = objc_opt_new();
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          uint64_t v11 = [v9 detailsLabels];
          uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v21 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v20 + 1) + 8 * j);
                if (([v16 isHidden] & 1) == 0)
                {
                  long long v17 = [v16 text];
                  [v10 addObject:v17];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v13);
          }

          [v19 addObject:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }

  return v19;
}

- (TLKImage)image
{
  return self->_image;
}

- (NSArray)contents
{
  return self->_contents;
}

- (TLKImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (TLKContentsContainerView)contentsContainer
{
  return self->_contentsContainer;
}

- (void)setContentsContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentsContainer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end