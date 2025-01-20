@interface SBHAddWidgetSheetAppCollectionViewCellConfigurator
- (SBHAddWidgetSheetAppCollectionViewCellConfigurator)initWithIconCache:(id)a3;
- (SBHIconImageAppearance)iconImageAppearance;
- (SBHIconImageCache)iconImageCache;
- (id)_cacheKeyForApplicationWidgetCollection:(uint64_t)a1;
- (void)_hydrateCellImage:(void *)a3 forApplicationWidgetCollection:;
- (void)_hydrateCellTitle:(void *)a3 forApplicationWidgetCollection:;
- (void)configureCell:(id)a3 withApplicationWidgetCollection:(id)a4;
- (void)setIconImageAppearance:(id)a3;
@end

@implementation SBHAddWidgetSheetAppCollectionViewCellConfigurator

- (SBHAddWidgetSheetAppCollectionViewCellConfigurator)initWithIconCache:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBHAddWidgetSheetAppCollectionViewCellConfigurator;
  v6 = [(SBHAddWidgetSheetAppCollectionViewCellConfigurator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconImageCache, a3);
    uint64_t v8 = +[SBHIconImageAppearance defaultAppearance];
    iconImageAppearance = v7->_iconImageAppearance;
    v7->_iconImageAppearance = (SBHIconImageAppearance *)v8;
  }
  return v7;
}

- (void)configureCell:(id)a3 withApplicationWidgetCollection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[SBHAddWidgetSheetAppCollectionViewCellConfigurator _hydrateCellTitle:forApplicationWidgetCollection:]((uint64_t)self, v7, v6);
  -[SBHAddWidgetSheetAppCollectionViewCellConfigurator _hydrateCellImage:forApplicationWidgetCollection:]((id *)&self->super.isa, v7, v6);
}

- (void)_hydrateCellTitle:(void *)a3 forApplicationWidgetCollection:
{
  id v9 = a3;
  if (a1)
  {
    id v5 = a2;
    id v6 = [v9 icon];
    id v7 = v6;
    if (!v6) {
      id v6 = v9;
    }
    uint64_t v8 = [v6 displayName];
    [v5 setAddWidgetSheetAppCollectionViewCellTitle:v8];
  }
}

- (void)_hydrateCellImage:(void *)a3 forApplicationWidgetCollection:
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    id v7 = [v5 icon];
    uint64_t v8 = [a1 iconImageAppearance];
    id v9 = [v5 iconImageApplicationBundleIdentifier];

    if (v9)
    {
      if (!a1[1])
      {
        uint64_t v10 = objc_opt_new();
        id v11 = a1[1];
        a1[1] = (id)v10;
      }
      v12 = -[SBHAddWidgetSheetAppCollectionViewCellConfigurator _cacheKeyForApplicationWidgetCollection:]((uint64_t)a1, v5);
      v13 = [a1[1] objectForKeyedSubscript:v12];
      if (!v13)
      {
        v14 = [v5 iconImageApplicationBundleIdentifier];
        [a1[2] iconImageInfo];
        v13 = SBHGetApplicationIconImageWithImageAppearance(v14, v8, 0, v15, v16, v17);

        if (v13) {
          [a1[1] setObject:v13 forKey:v12];
        }
      }
    }
    else if (v7)
    {
      v13 = [a1[2] imageForIcon:v7 imageAppearance:v8 options:0];
    }
    else
    {
      v18 = SBLogWidgets();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SBHAddWidgetSheetAppCollectionViewCellConfigurator _hydrateCellImage:forApplicationWidgetCollection:]((uint64_t)v5, v18);
      }

      v13 = 0;
    }
    [v6 setAddWidgetSheetAppCollectionViewCellIconImage:v13];
  }
}

- (id)_cacheKeyForApplicationWidgetCollection:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(void **)(a1 + 16);
    id v3 = a2;
    [v2 iconImageInfo];
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    v12 = NSString;
    v13 = [v3 icon];
    v14 = [v13 leafIdentifier];
    double v15 = [v3 iconImageApplicationBundleIdentifier];

    double v16 = [v12 stringWithFormat:@"%@ - %@ - %.1fx%.1f@%.0fx - %.1f", v14, v15, v5, v7, v9, v11];
  }
  else
  {
    double v16 = 0;
  }
  return v16;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBHIconImageAppearance)iconImageAppearance
{
  return self->_iconImageAppearance;
}

- (void)setIconImageAppearance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageAppearance, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_nonAppIconImageCache, 0);
}

- (void)_hydrateCellImage:(uint64_t)a1 forApplicationWidgetCollection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Found nil icon for applicationWidgetCollection:%@", (uint8_t *)&v2, 0xCu);
}

@end