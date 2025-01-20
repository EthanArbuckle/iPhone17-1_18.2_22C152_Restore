@interface ShortcutsRowCollectionViewListCell
+ (double)estimatedCellHeight;
- (ShortcutsRowCollectionViewListCell)initWithFrame:(CGRect)a3;
- (ShortcutsRowTableViewCellDelegate)delegate;
- (SuggestionsDataProvider)suggestionsDataProvider;
- (_TtC4Maps20MapsFavoritesManager)favoritesDataProvider;
- (void)fetchMissingImages;
- (void)resetScrollOffset;
- (void)setDelegate:(id)a3;
- (void)setFavoritesDataProvider:(id)a3;
- (void)setSuggestionsDataProvider:(id)a3;
- (void)shortcutsRowCellProvider:(id)a3 editShortcut:(id)a4;
- (void)shortcutsRowCellProvider:(id)a3 openFavorite:(id)a4;
- (void)shortcutsRowCellProvider:(id)a3 openShortcut:(id)a4;
- (void)shortcutsRowCellProvider:(id)a3 removeShortcut:(id)a4;
- (void)shortcutsRowCellProviderAddNewShortcut:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ShortcutsRowCollectionViewListCell

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ShortcutsRowCollectionViewListCell;
  [(ShortcutsRowCollectionViewListCell *)&v5 traitCollectionDidChange:a3];
  v4 = [(ShortcutsRowCollectionViewListCell *)self traitCollection];
  [(ShortcutsRowCellProvider *)self->_cellProvider setTraitCollection:v4];
}

- (ShortcutsRowCollectionViewListCell)initWithFrame:(CGRect)a3
{
  v33.receiver = self;
  v33.super_class = (Class)ShortcutsRowCollectionViewListCell;
  v3 = -[ShortcutsRowCollectionViewListCell initWithFrame:](&v33, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UICollectionView);
    id v5 = objc_alloc_init((Class)UICollectionViewFlowLayout);
    v6 = [v4 initWithFrame:v5 collectionViewLayout:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    collectionView = v3->_collectionView;
    v3->_collectionView = v6;

    [(UICollectionView *)v3->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UICollectionView *)v3->_collectionView setAlwaysBounceHorizontal:1];
    v8 = +[UIColor clearColor];
    [(UICollectionView *)v3->_collectionView setBackgroundColor:v8];

    [(UICollectionView *)v3->_collectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)v3->_collectionView setAccessibilityIdentifier:@"ShortcutsRowTableViewCellCollectionView"];
    v9 = [(ShortcutsRowCollectionViewListCell *)v3 contentView];
    [v9 addSubview:v3->_collectionView];

    v10 = [[ShortcutsRowCellProvider alloc] initWithCollectionView:v3->_collectionView];
    cellProvider = v3->_cellProvider;
    v3->_cellProvider = v10;

    [(ShortcutsRowCellProvider *)v3->_cellProvider setDelegate:v3];
    v12 = [(ShortcutsRowCollectionViewListCell *)v3 traitCollection];
    [(ShortcutsRowCellProvider *)v3->_cellProvider setTraitCollection:v12];

    v31 = [(UICollectionView *)v3->_collectionView topAnchor];
    v32 = [(ShortcutsRowCollectionViewListCell *)v3 contentView];
    v30 = [v32 topAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v34[0] = v29;
    v27 = [(UICollectionView *)v3->_collectionView leadingAnchor];
    v28 = [(ShortcutsRowCollectionViewListCell *)v3 contentView];
    v26 = [v28 leadingAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v34[1] = v25;
    v24 = [(UICollectionView *)v3->_collectionView trailingAnchor];
    v13 = [(ShortcutsRowCollectionViewListCell *)v3 contentView];
    v14 = [v13 trailingAnchor];
    v15 = [v24 constraintEqualToAnchor:v14];
    v34[2] = v15;
    v16 = [(UICollectionView *)v3->_collectionView bottomAnchor];
    v17 = [(ShortcutsRowCollectionViewListCell *)v3 contentView];
    v18 = [v17 bottomAnchor];
    LODWORD(v19) = 1132068864;
    v20 = [v16 constraintEqualToAnchor:v18 constant:0.0 priority:v19];
    v34[3] = v20;
    v21 = [(ShortcutsRowCellProvider *)v3->_cellProvider heightConstraint];
    v34[4] = v21;
    v22 = +[NSArray arrayWithObjects:v34 count:5];
    +[NSLayoutConstraint activateConstraints:v22];
  }
  return v3;
}

- (void)setFavoritesDataProvider:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)resetScrollOffset
{
}

- (void)fetchMissingImages
{
}

+ (double)estimatedCellHeight
{
  return 130.0;
}

- (_TtC4Maps20MapsFavoritesManager)favoritesDataProvider
{
  return [(ShortcutsRowCellProvider *)self->_cellProvider favoritesDataProvider];
}

- (SuggestionsDataProvider)suggestionsDataProvider
{
  return [(ShortcutsRowCellProvider *)self->_cellProvider suggestionsDataProvider];
}

- (void)setSuggestionsDataProvider:(id)a3
{
}

- (void)shortcutsRowCellProviderAddNewShortcut:(id)a3
{
  id v4 = [(ShortcutsRowCollectionViewListCell *)self delegate];
  [v4 shortcutsRowTableViewCellAddNewShortcut:self];
}

- (void)shortcutsRowCellProvider:(id)a3 openShortcut:(id)a4
{
  id v5 = a4;
  id v6 = [(ShortcutsRowCollectionViewListCell *)self delegate];
  [v6 shortcutsRowTableViewCell:self openShortcut:v5];
}

- (void)shortcutsRowCellProvider:(id)a3 openFavorite:(id)a4
{
  id v5 = a4;
  id v6 = [(ShortcutsRowCollectionViewListCell *)self delegate];
  [v6 shortcutsRowTableViewCell:self openFavorite:v5];
}

- (void)shortcutsRowCellProvider:(id)a3 editShortcut:(id)a4
{
  id v5 = a4;
  id v6 = [(ShortcutsRowCollectionViewListCell *)self delegate];
  [v6 editFavoriteShortcut:v5];
}

- (void)shortcutsRowCellProvider:(id)a3 removeShortcut:(id)a4
{
  id v5 = a4;
  id v6 = [(ShortcutsRowCollectionViewListCell *)self delegate];
  [v6 removeFavoriteShortcut:v5];
}

- (ShortcutsRowTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ShortcutsRowTableViewCellDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_storeStrong((id *)&self->_cellProvider, 0);
}

@end