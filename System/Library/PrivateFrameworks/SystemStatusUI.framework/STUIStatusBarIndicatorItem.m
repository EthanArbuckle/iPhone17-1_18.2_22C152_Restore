@interface STUIStatusBarIndicatorItem
- (BOOL)crossfadeForUpdate:(id)a3;
- (BOOL)flipsForRightToLeftLayoutDirection;
- (BOOL)isTemplateImage;
- (BOOL)shouldUpdateIndicatorForIdentifier:(id)a3;
- (BOOL)useMultiColorSystemImageForUpdate:(id)a3;
- (Class)imageViewClass;
- (NSArray)currentImageNamePrefixes;
- (NSString)indicatorEntryKey;
- (STUIStatusBarImageView)imageView;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (id)imageForUpdate:(id)a3;
- (id)imageNameForUpdate:(id)a3;
- (id)systemImageNameForUpdate:(id)a3;
- (int64_t)fontStyle;
- (void)_create_imageView;
- (void)setCurrentImageNamePrefixes:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation STUIStatusBarIndicatorItem

- (id)dependentEntryKeys
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(STUIStatusBarIndicatorItem *)self indicatorEntryKey];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (STUIStatusBarImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    [(STUIStatusBarIndicatorItem *)self _create_imageView];
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)_create_imageView
{
  id v3 = objc_alloc([(STUIStatusBarIndicatorItem *)self imageViewClass]);
  v4 = (STUIStatusBarImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  imageView = self->_imageView;
  self->_imageView = v4;

  int64_t v6 = [(STUIStatusBarIndicatorItem *)self fontStyle];
  v7 = self->_imageView;
  [(STUIStatusBarImageView *)v7 setFontStyle:v6];
}

- (Class)imageViewClass
{
  return (Class)objc_opt_class();
}

- (int64_t)fontStyle
{
  return 0;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)STUIStatusBarIndicatorItem;
  v8 = [(STUIStatusBarItem *)&v22 applyUpdate:v6 toDisplayItem:v7];
  v9 = [v7 identifier];
  if ([(STUIStatusBarIndicatorItem *)self shouldUpdateIndicatorForIdentifier:v9])
  {
    int v10 = [v7 isEnabled];

    if (!v10) {
      goto LABEL_15;
    }
    uint64_t v11 = [(id)objc_opt_class() instanceMethodForSelector:sel_imageForUpdate_];
    uint64_t v12 = +[STUIStatusBarIndicatorItem instanceMethodForSelector:sel_imageForUpdate_];
    v13 = [v6 styleAttributes];
    v9 = [v13 imageNamePrefixes];

    if (([v6 dataChanged] & 1) != 0
      || v11 != v12 && ([v6 styleAttributesChanged] & 1) != 0
      || (BSEqualObjects() & 1) == 0)
    {
      [(STUIStatusBarIndicatorItem *)self setCurrentImageNamePrefixes:v9];
      v14 = [(STUIStatusBarIndicatorItem *)self imageForUpdate:v6];
      if (v14)
      {
        v15 = [v7 identifier];
        v16 = [(STUIStatusBarIndicatorItem *)self imageViewForIdentifier:v15];

        if ([(STUIStatusBarIndicatorItem *)self crossfadeForUpdate:v6])
        {
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __56__STUIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke;
          v19[3] = &unk_1E6AA4048;
          id v20 = v16;
          id v21 = v14;
          uint64_t v17 = +[STUIStatusBarAnimation animationWithBlock:v19];

          v8 = (void *)v17;
        }
        else
        {
          [v16 setImage:v14];
        }
      }
      else
      {
        [v7 setEnabled:0];
      }
    }
  }

LABEL_15:
  return v8;
}

- (BOOL)shouldUpdateIndicatorForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() defaultDisplayIdentifier];

  return v4 == v3;
}

- (void)setCurrentImageNamePrefixes:(id)a3
{
}

- (id)imageForUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(STUIStatusBarIndicatorItem *)self systemImageNameForUpdate:v4];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [MEMORY[0x1E4FB1818] _systemImageNamed:v5];
    if (!v7)
    {
      v8 = _STUIStatusBar_Log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412290;
        v18 = v6;
        _os_log_impl(&dword_1D7E39000, v8, OS_LOG_TYPE_ERROR, "No system image for name %@", (uint8_t *)&v17, 0xCu);
      }
    }
    if ([(STUIStatusBarIndicatorItem *)self useMultiColorSystemImageForUpdate:v4])
    {
      uint64_t v9 = [v7 imageWithRenderingMode:1];

      id v7 = (void *)v9;
    }
  }
  else
  {
    id v6 = [(STUIStatusBarIndicatorItem *)self imageNameForUpdate:v4];
    if (v6)
    {
      int v10 = +[STUIStatusBarImageProvider sharedProvider];
      uint64_t v11 = [v4 styleAttributes];
      uint64_t v12 = [v10 imageNamed:v6 styleAttributes:v11];

      if ([(STUIStatusBarIndicatorItem *)self isTemplateImage])
      {
        v13 = v12;
        uint64_t v14 = 2;
      }
      else
      {
        v13 = v12;
        uint64_t v14 = 1;
      }
      id v7 = [v13 imageWithRenderingMode:v14];
    }
    else
    {
      id v7 = 0;
    }
  }
  if ([(STUIStatusBarIndicatorItem *)self flipsForRightToLeftLayoutDirection])
  {
    uint64_t v15 = [v7 imageFlippedForRightToLeftLayoutDirection];

    id v7 = (void *)v15;
  }

  return v7;
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_currentImageNamePrefixes, 0);
}

- (NSString)indicatorEntryKey
{
  return (NSString *)&stru_1F2F86950;
}

- (BOOL)isTemplateImage
{
  return 1;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return 0;
}

- (BOOL)useMultiColorSystemImageForUpdate:(id)a3
{
  return 0;
}

- (BOOL)crossfadeForUpdate:(id)a3
{
  return 0;
}

void __56__STUIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__STUIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke_2;
  v7[3] = &unk_1E6AA39F0;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  [v6 animateWithDuration:0 delay:v7 options:a4 animations:0.333 completion:0.0];
}

uint64_t __56__STUIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
}

- (NSArray)currentImageNamePrefixes
{
  return self->_currentImageNamePrefixes;
}

- (void)setImageView:(id)a3
{
}

@end