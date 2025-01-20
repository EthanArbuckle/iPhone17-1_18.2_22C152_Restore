@interface SUIKSearchResultCollectionViewListCell
- (CSSearchableItem)searchableItem;
- (void)configureWithSearchableItem:(id)a3;
- (void)prepareForReuse;
- (void)setSearchableItem:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation SUIKSearchResultCollectionViewListCell

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SUIKSearchResultCollectionViewListCell;
  [(SUIKSearchResultCollectionViewListCell *)&v3 prepareForReuse];
  [(SUIKSearchResultCollectionViewListCell *)self configureWithSearchableItem:0];
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v30 = a3;
  if (updateConfigurationUsingState__onceToken != -1) {
    dispatch_once(&updateConfigurationUsingState__onceToken, &__block_literal_global_28);
  }
  v4 = [MEMORY[0x1E4F42B58] subtitleCellConfiguration];
  v5 = +[PSListController appearance];
  v6 = [v5 textColor];
  v7 = [v4 textProperties];
  [v7 setColor:v6];

  v8 = +[PSListController appearance];
  v9 = [v8 altTextColor];
  v10 = [v4 secondaryTextProperties];
  [v10 setColor:v9];

  double v11 = *(double *)&updateConfigurationUsingState__iconSize_0;
  double v12 = *(double *)&updateConfigurationUsingState__iconSize_1;
  v13 = [v4 imageProperties];
  objc_msgSend(v13, "setReservedLayoutSize:", v11, v12);

  [v4 setImage:updateConfigurationUsingState__icon];
  id v14 = objc_alloc(MEMORY[0x1E4F28B18]);
  v15 = [(SUIKSearchResultCollectionViewListCell *)self searchableItem];
  v16 = [v15 attributeSet];
  uint64_t v17 = [v16 subject];
  v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @" ";
  }
  v20 = (void *)[v14 initWithString:v19];
  [v4 setAttributedText:v20];

  v21 = [(SUIKSearchResultCollectionViewListCell *)self searchableItem];
  v22 = [v21 attributeSet];
  v23 = [v22 contentDescription];
  uint64_t v24 = [v23 length];

  if (v24)
  {
    id v25 = objc_alloc(MEMORY[0x1E4F28B18]);
    v26 = [(SUIKSearchResultCollectionViewListCell *)self searchableItem];
    v27 = [v26 attributeSet];
    v28 = [v27 contentDescription];
    v29 = (void *)[v25 initWithString:v28];
    [v4 setSecondaryAttributedText:v29];
  }
  [(SUIKSearchResultCollectionViewListCell *)self setContentConfiguration:v4];
}

uint64_t __72__SUIKSearchResultCollectionViewListCell_updateConfigurationUsingState___block_invoke()
{
  v0 = PSBlankIconImage();
  [v0 size];
  updateConfigurationUsingState__iconSize_0 = v1;
  updateConfigurationUsingState__iconSize_1 = v2;

  id v3 = objc_alloc_init(MEMORY[0x1E4F42A80]);
  uint64_t v4 = updateConfigurationUsingState__icon;
  updateConfigurationUsingState__icon = (uint64_t)v3;
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)configureWithSearchableItem:(id)a3
{
  [(SUIKSearchResultCollectionViewListCell *)self setSearchableItem:a3];
  [(SUIKSearchResultCollectionViewListCell *)self setNeedsUpdateConfiguration];
}

- (CSSearchableItem)searchableItem
{
  return self->_searchableItem;
}

- (void)setSearchableItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end