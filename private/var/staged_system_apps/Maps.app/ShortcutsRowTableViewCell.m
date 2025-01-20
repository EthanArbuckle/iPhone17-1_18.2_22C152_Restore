@interface ShortcutsRowTableViewCell
+ (NSString)identifier;
+ (double)cellHeightWithTraitCollection:(id)a3;
+ (double)estimatedCellHeight;
- (ShortcutsRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (ShortcutsRowTableViewCellDelegate)delegate;
- (SuggestionsDataProvider)suggestionsDataProvider;
- (id)favoritesDataProvider;
- (void)fetchMissingImages;
- (void)resetScrollOffset;
- (void)setDelegate:(id)a3;
- (void)setFavoritesDataProvider:(id)a3;
- (void)setSuggestionsDataProvider:(id)a3;
- (void)shortcutsRowCellProvider:(id)a3 openFavorite:(id)a4;
- (void)shortcutsRowCellProvider:(id)a3 openShortcut:(id)a4;
- (void)shortcutsRowCellProviderAddNewShortcut:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ShortcutsRowTableViewCell

+ (NSString)identifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (double)cellHeightWithTraitCollection:(id)a3
{
  +[ShortcutsRowCollectionViewCell cellSizeWithTraitCollection:a3];
  return v3;
}

+ (double)estimatedCellHeight
{
  return 130.0;
}

- (ShortcutsRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v36.receiver = self;
  v36.super_class = (Class)ShortcutsRowTableViewCell;
  v4 = [(MapsThemeTableViewCell *)&v36 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    [(ShortcutsRowTableViewCell *)v4 setBackgroundColor:v5];

    [(ShortcutsRowTableViewCell *)v4 setAccessibilityIdentifier:@"ShortcutsRowTableViewCell"];
    v6 = [(ShortcutsRowTableViewCell *)v4 contentView];
    [v6 setAccessibilityIdentifier:@"ShortcutsRowTableViewCellContent"];

    id v7 = objc_alloc((Class)UICollectionView);
    id v8 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    v9 = [v7 initWithFrame:v8 collectionViewLayout:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    collectionView = v4->_collectionView;
    v4->_collectionView = v9;

    [(UICollectionView *)v4->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UICollectionView *)v4->_collectionView setAlwaysBounceHorizontal:1];
    v11 = +[UIColor clearColor];
    [(UICollectionView *)v4->_collectionView setBackgroundColor:v11];

    [(UICollectionView *)v4->_collectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)v4->_collectionView setAccessibilityIdentifier:@"ShortcutsRowTableViewCellCollectionView"];
    v12 = [(ShortcutsRowTableViewCell *)v4 contentView];
    [v12 addSubview:v4->_collectionView];

    v13 = [[ShortcutsRowCellProvider alloc] initWithCollectionView:v4->_collectionView];
    cellProvider = v4->_cellProvider;
    v4->_cellProvider = v13;

    [(ShortcutsRowCellProvider *)v4->_cellProvider setDelegate:v4];
    v15 = [(ShortcutsRowTableViewCell *)v4 traitCollection];
    [(ShortcutsRowCellProvider *)v4->_cellProvider setTraitCollection:v15];

    v34 = [(UICollectionView *)v4->_collectionView topAnchor];
    v35 = [(ShortcutsRowTableViewCell *)v4 contentView];
    v33 = [v35 topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v37[0] = v32;
    v30 = [(UICollectionView *)v4->_collectionView leadingAnchor];
    v31 = [(ShortcutsRowTableViewCell *)v4 contentView];
    v29 = [v31 leadingAnchor];
    v28 = [v30 constraintEqualToAnchor:v29];
    v37[1] = v28;
    v27 = [(UICollectionView *)v4->_collectionView trailingAnchor];
    v16 = [(ShortcutsRowTableViewCell *)v4 contentView];
    v17 = [v16 trailingAnchor];
    v18 = [v27 constraintEqualToAnchor:v17];
    v37[2] = v18;
    v19 = [(UICollectionView *)v4->_collectionView bottomAnchor];
    v20 = [(ShortcutsRowTableViewCell *)v4 contentView];
    v21 = [v20 bottomAnchor];
    LODWORD(v22) = 1132068864;
    v23 = [v19 constraintEqualToAnchor:v21 constant:0.0 priority:v22];
    v37[3] = v23;
    v24 = [(ShortcutsRowCellProvider *)v4->_cellProvider heightConstraint];
    v37[4] = v24;
    v25 = +[NSArray arrayWithObjects:v37 count:5];
    +[NSLayoutConstraint activateConstraints:v25];
  }
  return v4;
}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return [(ShortcutsRowCellProvider *)self->_cellProvider suggestionsDataProvider];
}

- (void)setSuggestionsDataProvider:(id)a3
{
}

- (id)favoritesDataProvider
{
  return [(ShortcutsRowCellProvider *)self->_cellProvider favoritesDataProvider];
}

- (void)setFavoritesDataProvider:(id)a3
{
}

- (void)resetScrollOffset
{
}

- (void)fetchMissingImages
{
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ShortcutsRowTableViewCell;
  [(MapsThemeTableViewCell *)&v5 traitCollectionDidChange:a3];
  v4 = [(ShortcutsRowTableViewCell *)self traitCollection];
  [(ShortcutsRowCellProvider *)self->_cellProvider setTraitCollection:v4];
}

- (void)shortcutsRowCellProviderAddNewShortcut:(id)a3
{
  id v4 = [(ShortcutsRowTableViewCell *)self delegate];
  [v4 shortcutsRowTableViewCellAddNewShortcut:self];
}

- (void)shortcutsRowCellProvider:(id)a3 openShortcut:(id)a4
{
  id v5 = a4;
  id v6 = [(ShortcutsRowTableViewCell *)self delegate];
  [v6 shortcutsRowTableViewCell:self openShortcut:v5];
}

- (void)shortcutsRowCellProvider:(id)a3 openFavorite:(id)a4
{
  id v5 = a4;
  id v6 = [(ShortcutsRowTableViewCell *)self delegate];
  [v6 shortcutsRowTableViewCell:self openFavorite:v5];
}

- (ShortcutsRowTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ShortcutsRowTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_cellProvider, 0);
}

@end