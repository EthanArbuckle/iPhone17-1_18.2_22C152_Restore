@interface VUILibraryGenresMenuCollectionConfiguration
- (Class)classForCollectionViewCell;
- (VUILibraryMenuItemViewCell)menuItemSizingCell;
- (double)minimumLineSpacing;
- (id)configureCollectionViewCellForCollectionView:(id)a3 ForItem:(id)a4 AtIndexPath:(id)a5;
- (id)configureSizingCellForItem:(id)a3 AtIndexPath:(id)a4;
- (id)generateCollectionView;
- (void)setMenuItemSizingCell:(id)a3;
@end

@implementation VUILibraryGenresMenuCollectionConfiguration

- (id)generateCollectionView
{
  v2 = [VUILegacyCollectionView alloc];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
  v4 = -[VUILegacyCollectionView initWithFrame:collectionViewLayout:](v2, "initWithFrame:collectionViewLayout:", v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [(VUILegacyCollectionView *)v4 setAutoresizingMask:18];
  [(VUILegacyCollectionView *)v4 setShowsHorizontalScrollIndicator:0];
  [(VUILegacyCollectionView *)v4 setShowsVerticalScrollIndicator:0];
  [(VUILegacyCollectionView *)v4 setAlwaysBounceVertical:1];
  [(VUILegacyCollectionView *)v4 setBackgroundColor:0];
  [(VUILegacyCollectionView *)v4 setOpaque:0];
  [(VUILegacyCollectionView *)v4 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"MenuCellIdentifier"];
  [(VUILegacyCollectionView *)v4 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"MenuSectionHeaderCellIdentifier"];
  v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
  [(VUILegacyCollectionView *)v4 setBackgroundColor:v5];

  v6 = [MEMORY[0x1E4FB3C20] makeAccessibilityIdentifierString:*MEMORY[0x1E4FB3D60] additionalString:@"Library.id=\"Genres\""];
  [(VUILegacyCollectionView *)v4 setAccessibilityIdentifier:v6];

  return v4;
}

- (id)configureCollectionViewCellForCollectionView:(id)a3 ForItem:(id)a4 AtIndexPath:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [a3 dequeueReusableCellWithReuseIdentifier:@"MenuCellIdentifier" forIndexPath:v8];
  if ([v8 section])
  {
    v10 = [v9 titleLabel];
    v11 = [v10 textLayout];

    if ([v8 section] == 1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = [v7 valueForKey:@"title"];
        v13 = [v7 valueForKey:@"type"];
        v14 = v13;
        if (v13)
        {
          v15 = VUILibraryGenreImageNameFromGenre([v13 integerValue]);
        }
        else
        {
          v15 = 0;
        }
      }
      else
      {
        v15 = 0;
        id v12 = 0;
      }
      v18 = [MEMORY[0x1E4FB1618] labelColor];
      [v11 setColor:v18];
    }
    else
    {
      id v12 = v7;
      v15 = 0;
    }
    v19 = [v9 titleLabel];
    id v20 = +[VUILabel labelWithString:v12 textLayout:v11 existingLabel:v19];

    [v9 setImageName:v15];
  }
  else
  {
    VUILibraryCategoryStringFromType([v7 unsignedIntegerValue]);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v15 = [v9 titleLabel];
    v11 = [v15 textLayout];
    v16 = [v9 titleLabel];
    id v17 = +[VUILabel labelWithString:v12 textLayout:v11 existingLabel:v16];
  }
  [v9 setHideChevron:0];

  return v9;
}

- (id)configureSizingCellForItem:(id)a3 AtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(VUILibraryGenresMenuCollectionConfiguration *)self menuItemSizingCell];

  if (!v8)
  {
    v9 = objc_alloc_init(VUILibraryMenuItemViewCell);
    [(VUILibraryGenresMenuCollectionConfiguration *)self setMenuItemSizingCell:v9];
  }
  if ([v7 section])
  {
    v10 = [(VUILibraryGenresMenuCollectionConfiguration *)self menuItemSizingCell];
    v11 = [v10 titleLabel];
    id v12 = [v11 textLayout];
    v13 = [(VUILibraryGenresMenuCollectionConfiguration *)self menuItemSizingCell];
    v14 = [v13 titleLabel];
    id v15 = +[VUILabel labelWithString:v6 textLayout:v12 existingLabel:v14];
  }
  else
  {
    v10 = VUILibraryCategoryStringFromType([v6 unsignedIntegerValue]);
    v11 = [(VUILibraryGenresMenuCollectionConfiguration *)self menuItemSizingCell];
    id v12 = [v11 titleLabel];
    v13 = [v12 textLayout];
    v14 = [(VUILibraryGenresMenuCollectionConfiguration *)self menuItemSizingCell];
    v16 = [v14 titleLabel];
    id v17 = +[VUILabel labelWithString:v10 textLayout:v13 existingLabel:v16];
  }
  v18 = [(VUILibraryGenresMenuCollectionConfiguration *)self menuItemSizingCell];

  return v18;
}

- (double)minimumLineSpacing
{
  return 0.0;
}

- (Class)classForCollectionViewCell
{
  return (Class)objc_opt_class();
}

- (VUILibraryMenuItemViewCell)menuItemSizingCell
{
  return self->_menuItemSizingCell;
}

- (void)setMenuItemSizingCell:(id)a3
{
}

- (void).cxx_destruct
{
}

@end