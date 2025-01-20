@interface VUILibraryiOSMenuCollectionConfiguration
- (BOOL)isDesignedForIpadEnabled;
- (Class)classForCollectionViewCell;
- (UICollectionViewCell)menuItemSizingCell;
- (VUILibraryiOSMenuCollectionConfiguration)init;
- (double)minimumLineSpacing;
- (id)_layout;
- (id)configureCollectionViewCellForCollectionView:(id)a3 ForItem:(id)a4 AtIndexPath:(id)a5;
- (id)configureSizingCellForItem:(id)a3 AtIndexPath:(id)a4;
- (id)generateCollectionView;
- (void)setIsDesignedForIpadEnabled:(BOOL)a3;
- (void)setMenuItemSizingCell:(id)a3;
@end

@implementation VUILibraryiOSMenuCollectionConfiguration

- (VUILibraryiOSMenuCollectionConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUILibraryiOSMenuCollectionConfiguration;
  v2 = [(VUILibraryiOSMenuCollectionConfiguration *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB16C8] currentDevice];
    BOOL v4 = [v3 userInterfaceIdiom] == 1;

    v2->_isDesignedForIpadEnabled = v4;
  }
  return v2;
}

- (id)generateCollectionView
{
  v3 = [VUILegacyCollectionView alloc];
  BOOL v4 = [(VUILibraryiOSMenuCollectionConfiguration *)self _layout];
  v5 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [(VUILegacyCollectionView *)v5 setAutoresizingMask:18];
  [(VUILegacyCollectionView *)v5 setShowsHorizontalScrollIndicator:0];
  [(VUILegacyCollectionView *)v5 setShowsVerticalScrollIndicator:0];
  [(VUILegacyCollectionView *)v5 setBackgroundColor:0];
  [(VUILegacyCollectionView *)v5 setOpaque:0];
  if ([(VUILibraryiOSMenuCollectionConfiguration *)self isDesignedForIpadEnabled])
  {
    [(VUILegacyCollectionView *)v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"MenuCellIdentifier"];
    objc_msgSend(MEMORY[0x1E4FB1618], "vui_secondaryDynamicBackgroundColor");
  }
  else
  {
    [(VUILegacyCollectionView *)v5 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"MenuCellIdentifier"];
    [(VUILegacyCollectionView *)v5 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"MenuSectionHeaderCellIdentifier"];
    objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  objc_super v6 = };
  [(VUILegacyCollectionView *)v5 setBackgroundColor:v6];

  return v5;
}

- (id)configureCollectionViewCellForCollectionView:(id)a3 ForItem:(id)a4 AtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(VUILibraryiOSMenuCollectionConfiguration *)self isDesignedForIpadEnabled];
  v12 = [v8 dequeueReusableCellWithReuseIdentifier:@"MenuCellIdentifier" forIndexPath:v10];
  if (v11)
  {
    v13 = [v8 indexPathsForSelectedItems];
    objc_msgSend(v12, "setSelected:", objc_msgSend(v13, "containsObject:", v10));
    if ([v10 section])
    {
      objc_msgSend(v12, "setShouldAppearAsHeader:", objc_msgSend(v10, "row") == 0);
      [v12 setTitle:v9];
    }
    else
    {
      uint64_t v18 = [v9 unsignedIntegerValue];
      v19 = VUILibraryCategoryStringFromType(v18);
      [v12 setTitle:v19];
      v20 = VUILibraryCategoryImageNameFromType(v18);
      [v12 setImageName:v20];
    }
  }
  else
  {
    if ([v10 section])
    {
      v14 = [v12 titleLabel];
      v15 = [v14 textLayout];
      v16 = [v12 titleLabel];
      id v17 = +[VUILabel labelWithString:v9 textLayout:v15 existingLabel:v16];
    }
    else
    {
      v14 = VUILibraryCategoryStringFromType([v9 unsignedIntegerValue]);
      v15 = [v12 titleLabel];
      v16 = [v15 textLayout];
      v21 = [v12 titleLabel];
      id v22 = +[VUILabel labelWithString:v14 textLayout:v16 existingLabel:v21];
    }
    [v12 setHideChevron:1];
  }

  return v12;
}

- (id)configureSizingCellForItem:(id)a3 AtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VUILibraryiOSMenuCollectionConfiguration *)self menuItemSizingCell];

  if (!v8)
  {
    BOOL v9 = [(VUILibraryiOSMenuCollectionConfiguration *)self isDesignedForIpadEnabled];
    id v10 = off_1E6DF2900;
    if (!v9) {
      id v10 = off_1E6DF27B8;
    }
    id v11 = objc_alloc_init(*v10);
    [(VUILibraryiOSMenuCollectionConfiguration *)self setMenuItemSizingCell:v11];
  }
  if ([v7 section])
  {
    if ([(VUILibraryiOSMenuCollectionConfiguration *)self isDesignedForIpadEnabled])
    {
      BOOL v12 = [v7 row] == 0;
      v13 = [(VUILibraryiOSMenuCollectionConfiguration *)self menuItemSizingCell];
      [v13 setShouldAppearAsHeader:v12];

      v14 = [(VUILibraryiOSMenuCollectionConfiguration *)self menuItemSizingCell];
      [v14 setTitle:v6];
    }
    else
    {
      v14 = [(VUILibraryiOSMenuCollectionConfiguration *)self menuItemSizingCell];
      v19 = [v14 titleLabel];
      v20 = [v19 textLayout];
      v21 = [(VUILibraryiOSMenuCollectionConfiguration *)self menuItemSizingCell];
      id v22 = [v21 titleLabel];
      id v23 = +[VUILabel labelWithString:v6 textLayout:v20 existingLabel:v22];
    }
  }
  else
  {
    uint64_t v15 = [v6 unsignedIntegerValue];
    v14 = VUILibraryCategoryStringFromType(v15);
    if ([(VUILibraryiOSMenuCollectionConfiguration *)self isDesignedForIpadEnabled])
    {
      v16 = [(VUILibraryiOSMenuCollectionConfiguration *)self menuItemSizingCell];
      [v16 setTitle:v14];

      id v17 = VUILibraryCategoryImageNameFromType(v15);
      uint64_t v18 = [(VUILibraryiOSMenuCollectionConfiguration *)self menuItemSizingCell];
      [v18 setImageName:v17];
    }
    else
    {
      id v17 = [(VUILibraryiOSMenuCollectionConfiguration *)self menuItemSizingCell];
      uint64_t v18 = [v17 titleLabel];
      v24 = [v18 textLayout];
      v25 = [(VUILibraryiOSMenuCollectionConfiguration *)self menuItemSizingCell];
      v26 = [v25 titleLabel];
      id v27 = +[VUILabel labelWithString:v14 textLayout:v24 existingLabel:v26];
    }
  }

  v28 = [(VUILibraryiOSMenuCollectionConfiguration *)self menuItemSizingCell];

  return v28;
}

- (double)minimumLineSpacing
{
  return 0.0;
}

- (Class)classForCollectionViewCell
{
  [(VUILibraryiOSMenuCollectionConfiguration *)self isDesignedForIpadEnabled];
  v2 = objc_opt_class();
  return (Class)v2;
}

- (id)_layout
{
  if ([(VUILibraryiOSMenuCollectionConfiguration *)self isDesignedForIpadEnabled])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4FB1588]);
    id v3 = (id)[objc_alloc(MEMORY[0x1E4FB1580]) initWithSectionProvider:&__block_literal_global_98 configuration:v2];
  }
  else
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  }
  return v3;
}

id __51__VUILibraryiOSMenuCollectionConfiguration__layout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4FB2050];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithAppearanceStyle:3 layoutEnvironment:v5];
  [v6 setAppearanceStyle:3];
  [v6 setSeparatorStyle:0];
  if (a2) {
    [v6 setStylesFirstItemAsHeader:1];
  }
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB2048]) initWithConfiguration:v6 layoutEnvironment:v5];

  return v7;
}

- (UICollectionViewCell)menuItemSizingCell
{
  return self->_menuItemSizingCell;
}

- (void)setMenuItemSizingCell:(id)a3
{
}

- (BOOL)isDesignedForIpadEnabled
{
  return self->_isDesignedForIpadEnabled;
}

- (void)setIsDesignedForIpadEnabled:(BOOL)a3
{
  self->_isDesignedForIpadEnabled = a3;
}

- (void).cxx_destruct
{
}

@end