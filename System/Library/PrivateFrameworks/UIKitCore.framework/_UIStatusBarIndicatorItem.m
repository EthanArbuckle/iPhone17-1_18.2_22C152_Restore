@interface _UIStatusBarIndicatorItem
- (BOOL)crossfadeForUpdate:(id)a3;
- (BOOL)flipsForRightToLeftLayoutDirection;
- (BOOL)isTemplateImage;
- (BOOL)shouldUpdateIndicatorForIdentifier:(id)a3;
- (BOOL)useMultiColorSystemImageForUpdate:(id)a3;
- (NSArray)currentImageNamePrefixes;
- (NSString)indicatorEntryKey;
- (_UIStatusBarImageView)imageView;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (id)imageForUpdate:(id)a3;
- (id)imageNameForUpdate:(id)a3;
- (id)systemImageNameForUpdate:(id)a3;
- (void)_create_imageView;
- (void)setCurrentImageNamePrefixes:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation _UIStatusBarIndicatorItem

- (id)dependentEntryKeys
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(_UIStatusBarIndicatorItem *)self indicatorEntryKey];
  v4 = [v2 setWithObject:v3];

  return v4;
}

- (NSString)indicatorEntryKey
{
  return (NSString *)&stru_1ED0E84C0;
}

- (BOOL)isTemplateImage
{
  return 1;
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return 0;
}

- (BOOL)useMultiColorSystemImageForUpdate:(id)a3
{
  return 0;
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

- (id)imageForUpdate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_UIStatusBarIndicatorItem *)self systemImageNameForUpdate:v4];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = +[UIImage _systemImageNamed:v5];
    if (!v7)
    {
      v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("StatusBar", &imageForUpdate____s_category) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v17 = 138412290;
        v18 = v6;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "No system image for name %@", (uint8_t *)&v17, 0xCu);
      }
    }
    if ([(_UIStatusBarIndicatorItem *)self useMultiColorSystemImageForUpdate:v4])
    {
      uint64_t v9 = [v7 imageWithRenderingMode:1];

      v7 = (void *)v9;
    }
  }
  else
  {
    v6 = [(_UIStatusBarIndicatorItem *)self imageNameForUpdate:v4];
    if (v6)
    {
      v10 = +[_UIStatusBarImageProvider sharedProvider];
      v11 = [v4 styleAttributes];
      v12 = [v10 imageNamed:v6 styleAttributes:v11];

      if ([(_UIStatusBarIndicatorItem *)self isTemplateImage])
      {
        v13 = v12;
        uint64_t v14 = 2;
      }
      else
      {
        v13 = v12;
        uint64_t v14 = 1;
      }
      v7 = [v13 imageWithRenderingMode:v14];
    }
    else
    {
      v7 = 0;
    }
  }
  if ([(_UIStatusBarIndicatorItem *)self flipsForRightToLeftLayoutDirection])
  {
    uint64_t v15 = [v7 imageFlippedForRightToLeftLayoutDirection];

    v7 = (void *)v15;
  }

  return v7;
}

- (BOOL)crossfadeForUpdate:(id)a3
{
  return 0;
}

- (_UIStatusBarImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    [(_UIStatusBarIndicatorItem *)self _create_imageView];
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)_create_imageView
{
  v3 = [_UIStatusBarImageView alloc];
  id v4 = -[_UIStatusBarImageView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  imageView = self->_imageView;
  self->_imageView = v4;
}

- (BOOL)shouldUpdateIndicatorForIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() defaultDisplayIdentifier];

  return v4 == v3;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)_UIStatusBarIndicatorItem;
  v8 = [(_UIStatusBarItem *)&v26 applyUpdate:v6 toDisplayItem:v7];
  uint64_t v9 = [v7 identifier];
  if (![(_UIStatusBarIndicatorItem *)self shouldUpdateIndicatorForIdentifier:v9])goto LABEL_20; {
  int v10 = [v7 isEnabled];
  }

  if (!v10) {
    goto LABEL_21;
  }
  uint64_t v11 = [(id)objc_opt_class() instanceMethodForSelector:sel_imageForUpdate_];
  uint64_t v12 = +[_UIStatusBarIndicatorItem instanceMethodForSelector:sel_imageForUpdate_];
  v13 = [v6 styleAttributes];
  uint64_t v9 = [v13 imageNamePrefixes];

  if ([v6 dataChanged] & 1) != 0 || v11 != v12 && (objc_msgSend(v6, "styleAttributesChanged")) {
    goto LABEL_13;
  }
  currentImageNamePrefixes = self->_currentImageNamePrefixes;
  uint64_t v15 = v9;
  v16 = currentImageNamePrefixes;
  if (v15 == v16)
  {

LABEL_19:
    goto LABEL_20;
  }
  int v17 = v16;
  if (!v15 || !v16)
  {

LABEL_13:
    [(_UIStatusBarIndicatorItem *)self setCurrentImageNamePrefixes:v9];
    uint64_t v15 = [(_UIStatusBarIndicatorItem *)self imageForUpdate:v6];
    if (v15)
    {
      uint64_t v19 = [v7 identifier];
      v20 = [(_UIStatusBarIndicatorItem *)self imageViewForIdentifier:v19];

      if ([(_UIStatusBarIndicatorItem *)self crossfadeForUpdate:v6])
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __55___UIStatusBarIndicatorItem_applyUpdate_toDisplayItem___block_invoke;
        v23[3] = &unk_1E53053A0;
        id v24 = v20;
        v25 = v15;
        uint64_t v21 = +[_UIStatusBarAnimation animationWithBlock:v23];

        v8 = (void *)v21;
      }
      else
      {
        [v20 setImage:v15];
      }
    }
    else
    {
      [v7 setEnabled:0];
    }
    goto LABEL_19;
  }
  char v18 = [(NSArray *)v15 isEqual:v16];

  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v9 = v15;
LABEL_20:

LABEL_21:
  return v8;
}

- (NSArray)currentImageNamePrefixes
{
  return self->_currentImageNamePrefixes;
}

- (void)setCurrentImageNamePrefixes:(id)a3
{
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_currentImageNamePrefixes, 0);
}

@end