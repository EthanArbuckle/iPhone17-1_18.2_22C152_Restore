@interface NTKCGalleryCell
+ (double)estimatedRowHeight;
+ (id)reuseIdentifier;
- (BOOL)allSnapshotsLoaded;
- (BOOL)showFooterInCollectionView;
- (CGPoint)_contentInsetPoint;
- (CGPoint)contentOffset;
- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5;
- (NSArray)snapshotRequests;
- (NSLayoutConstraint)cvHeightConstraint;
- (NTKCGalleryCell)init;
- (NTKCGalleryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NTKCGalleryCellDelegate)delegate;
- (NTKGalleryCollection)collection;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)layout;
- (UILabel)footer;
- (UILabel)title;
- (UIStackView)contentStack;
- (UIStackView)footerStack;
- (UIStackView)titleStack;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (id)containerViewForFace:(id)a3;
- (id)faceForLocation:(CGPoint)a3;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)selectedIndex;
- (void)_configureViews;
- (void)_fontSizeDidChange;
- (void)_resetSnapshotRequests;
- (void)clearSelectedFaces;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)selectFace:(id)a3;
- (void)setAllSnapshotsLoaded:(BOOL)a3;
- (void)setCollection:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentStack:(id)a3;
- (void)setCvHeightConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFooter:(id)a3;
- (void)setFooterStack:(id)a3;
- (void)setLayout:(id)a3;
- (void)setSelectedIndex:(int64_t)a3;
- (void)setShowFooterInCollectionView:(BOOL)a3;
- (void)setSnapshotRequests:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleStack:(id)a3;
- (void)updateFaceAtIndex:(unint64_t)a3;
@end

@implementation NTKCGalleryCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (double)estimatedRowHeight
{
  v2 = [MEMORY[0x1E4FB1948] prominentInsetGroupedHeaderConfiguration];
  v3 = [v2 textProperties];
  v4 = [v3 font];
  [v4 lineHeight];
  double v6 = v5 + 9.0;

  +[NTKCFaceContainerView sizeForFaceSize:1 style:FaceSize()];
  return v6 + 11.0 + v7 + 25.0;
}

- (NTKCGalleryCell)init
{
  v3 = [(id)objc_opt_class() reuseIdentifier];
  v4 = [(NTKCGalleryCell *)self initWithStyle:0 reuseIdentifier:v3];

  return v4;
}

- (NTKCGalleryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v70[3] = *MEMORY[0x1E4F143B8];
  v68.receiver = self;
  v68.super_class = (Class)NTKCGalleryCell;
  v4 = [(NTKCGalleryCell *)&v68 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    double v5 = BPSBackgroundColor();
    [(NTKCGalleryCell *)v4 setBackgroundColor:v5];

    double v6 = NTKCScreenEdgeMargin();
    double v7 = objc_opt_new();
    v8 = BPSTextColor();
    [v7 setTextColor:v8];

    [v7 setNumberOfLines:0];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v9) = 1053609165;
    [v7 _setHyphenationFactor:v9];
    [v7 setLineBreakMode:0];
    [(NTKCGalleryCell *)v4 setTitle:v7];

    v10 = objc_opt_new();
    [(NTKCGalleryCell *)v4 setTitleStack:v10];

    -[UIStackView setLayoutMargins:](v4->_titleStack, "setLayoutMargins:", 0.0, v6, 0.0, v6);
    [(UIStackView *)v4->_titleStack setLayoutMarginsRelativeArrangement:1];
    [(UIStackView *)v4->_titleStack addArrangedSubview:v4->_title];
    v11 = objc_opt_new();
    v12 = BPSTextColor();
    [v11 setTextColor:v12];

    [v11 setNumberOfLines:0];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v13) = 1053609165;
    [v11 _setHyphenationFactor:v13];
    [v11 setLineBreakMode:0];
    [(NTKCGalleryCell *)v4 setFooter:v11];

    v14 = objc_opt_new();
    [(NTKCGalleryCell *)v4 setFooterStack:v14];

    -[UIStackView setLayoutMargins:](v4->_footerStack, "setLayoutMargins:", 0.0, v6, 0.0, v6);
    [(UIStackView *)v4->_footerStack setLayoutMarginsRelativeArrangement:1];
    [(UIStackView *)v4->_footerStack addArrangedSubview:v4->_footer];
    v15 = objc_opt_new();
    [(NTKCGalleryCell *)v4 setLayout:v15];

    [(UICollectionViewFlowLayout *)v4->_layout _setWantsRightToLeftHorizontalMirroringIfNeeded:1];
    [(UICollectionViewFlowLayout *)v4->_layout setScrollDirection:1];
    uint64_t v16 = NTKCScreenStyle();
    double v17 = 15.0;
    if (v16 == -1) {
      double v17 = 11.0;
    }
    [(UICollectionViewFlowLayout *)v4->_layout setMinimumLineSpacing:v17];
    id v18 = objc_alloc(MEMORY[0x1E4FB1568]);
    v19 = objc_msgSend(v18, "initWithFrame:collectionViewLayout:", v4->_layout, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(NTKCGalleryCell *)v4 setCollectionView:v19];

    v20 = [(NTKCGalleryCell *)v4 collectionView];
    v21 = [v20 layer];
    [v21 setAllowsGroupOpacity:0];

    collectionView = v4->_collectionView;
    uint64_t v23 = objc_opt_class();
    v24 = +[_NTKCGalleryCollectionCell classicReuseIdentifier];
    [(UICollectionView *)collectionView registerClass:v23 forCellWithReuseIdentifier:v24];

    v25 = v4->_collectionView;
    uint64_t v26 = objc_opt_class();
    v27 = +[_NTKCGalleryCollectionCell luxoReuseIdentifier];
    [(UICollectionView *)v25 registerClass:v26 forCellWithReuseIdentifier:v27];

    v28 = v4->_collectionView;
    uint64_t v29 = objc_opt_class();
    v30 = +[_NTKCGalleryCollectionCell aloeReuseIdentifier];
    [(UICollectionView *)v28 registerClass:v29 forCellWithReuseIdentifier:v30];

    v31 = v4->_collectionView;
    uint64_t v32 = objc_opt_class();
    v33 = +[_NTKCGalleryCollectionCell agaveReuseIdentifier];
    [(UICollectionView *)v31 registerClass:v32 forCellWithReuseIdentifier:v33];

    v34 = v4->_collectionView;
    uint64_t v35 = objc_opt_class();
    v36 = +[_NTKCGalleryCollectionCell avoniaReuseIdentifier];
    [(UICollectionView *)v34 registerClass:v35 forCellWithReuseIdentifier:v36];

    v37 = v4->_collectionView;
    uint64_t v38 = objc_opt_class();
    uint64_t v39 = *MEMORY[0x1E4FB2760];
    v40 = +[_NTKCGalleryCollectionFooter reuseIdentifier];
    [(UICollectionView *)v37 registerClass:v38 forSupplementaryViewOfKind:v39 withReuseIdentifier:v40];

    -[UICollectionView setContentInset:](v4->_collectionView, "setContentInset:", 0.0, v6, 0.0, v6);
    [(UICollectionView *)v4->_collectionView setBackgroundColor:0];
    [(UICollectionView *)v4->_collectionView setAlwaysBounceHorizontal:1];
    [(UICollectionView *)v4->_collectionView setShowsVerticalScrollIndicator:0];
    [(UICollectionView *)v4->_collectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)v4->_collectionView setDelegate:v4];
    [(UICollectionView *)v4->_collectionView setDataSource:v4];
    [(UICollectionView *)v4->_collectionView setClipsToBounds:0];
    v4->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    id v41 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v70[0] = v4->_titleStack;
    v70[1] = v4->_collectionView;
    v70[2] = v4->_footerStack;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
    v43 = (void *)[v41 initWithArrangedSubviews:v42];
    [(NTKCGalleryCell *)v4 setContentStack:v43];

    [(UIStackView *)v4->_contentStack setAxis:1];
    [(UIStackView *)v4->_contentStack setCustomSpacing:v4->_titleStack afterView:11.0];
    [(UIStackView *)v4->_contentStack setCustomSpacing:v4->_collectionView afterView:15.0];
    [(UIStackView *)v4->_contentStack setTranslatesAutoresizingMaskIntoConstraints:0];
    v44 = [(NTKCGalleryCell *)v4 contentView];
    [v44 addSubview:v4->_contentStack];

    v45 = [(NTKCGalleryCell *)v4 contentView];
    v46 = [v45 leadingAnchor];
    v47 = [(UIStackView *)v4->_contentStack leadingAnchor];
    v48 = [v46 constraintEqualToAnchor:v47];

    v49 = [(NTKCGalleryCell *)v4 contentView];
    v50 = [v49 trailingAnchor];
    v51 = [(UIStackView *)v4->_contentStack trailingAnchor];
    v52 = [v50 constraintEqualToAnchor:v51];

    v53 = [(UIStackView *)v4->_contentStack topAnchor];
    v54 = [(NTKCGalleryCell *)v4 contentView];
    v55 = [v54 topAnchor];
    v56 = [v53 constraintEqualToAnchor:v55 constant:9.0];

    v57 = [(NTKCGalleryCell *)v4 contentView];
    v58 = [v57 bottomAnchor];
    v59 = [(UIStackView *)v4->_contentStack bottomAnchor];
    v60 = [v58 constraintEqualToAnchor:v59 constant:25.0];

    LODWORD(v61) = 1132068864;
    [v60 setPriority:v61];
    v62 = [(UICollectionView *)v4->_collectionView heightAnchor];
    uint64_t v63 = [v62 constraintEqualToConstant:0.0];
    cvHeightConstraint = v4->_cvHeightConstraint;
    v4->_cvHeightConstraint = (NSLayoutConstraint *)v63;

    v69[0] = v48;
    v69[1] = v52;
    v69[2] = v56;
    v69[3] = v60;
    v69[4] = v4->_cvHeightConstraint;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:5];
    [MEMORY[0x1E4F28DC8] activateConstraints:v65];
    v66 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v66 addObserver:v4 selector:sel__fontSizeDidChange name:*MEMORY[0x1E4FB27A8] object:0];

    [(NTKCGalleryCell *)v4 _fontSizeDidChange];
  }
  return v4;
}

- (void)_configureViews
{
  collection = self->_collection;
  if (collection)
  {
    v4 = [(NTKGalleryCollection *)collection title];
    [(UILabel *)self->_title setText:v4];

    double v5 = [(NTKGalleryCollection *)self->_collection descriptionText];
    [(UILabel *)self->_footer setText:v5];

    +[NTKCFaceContainerView sizeForFaceSize:1 style:FaceSize()];
    double v7 = v6;
    double v9 = v8;
    v10 = (id *)MEMORY[0x1E4FB2608];
    v11 = [(id)*MEMORY[0x1E4FB2608] preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

    if (IsAccessibilityCategory) {
      double v7 = v7 * 1.5;
    }
    double v13 = [(NTKGalleryCollection *)self->_collection calloutName];

    if (v13)
    {
      v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
      LODWORD(v15) = 0.5;
      id v16 = (id)[MEMORY[0x1E4FB0848] NTKHyphenationParagraphStyleWithFactor:v15];
      double v17 = NTKSingleLineHeight((uint64_t)v14, v16);
      double v18 = NTKMaxLineHeightDeltaForEnumeratableFaceCollection(self->_collection, v14, v16, 1, v7);

      double v9 = v9 + v17 + v18 + 10.0;
    }
    -[UICollectionViewFlowLayout setItemSize:](self->_layout, "setItemSize:", v7, v9);
    [(NSLayoutConstraint *)self->_cvHeightConstraint setConstant:v9];
    if ([(NTKGalleryCollection *)self->_collection numberOfFaces] == 1
      && ([(NTKGalleryCollection *)self->_collection descriptionText],
          v19 = objc_claimAutoreleasedReturnValue(),
          uint64_t v20 = [v19 length],
          v19,
          v20))
    {
      v21 = (NSString *)*MEMORY[0x1E4FB27D0];
      v22 = [*v10 preferredContentSizeCategory];
      BOOL v23 = UIContentSizeCategoryCompareToCategory(v21, v22) != NSOrderedAscending;

      self->_showFooterInCollectionView = v23;
    }
    else
    {
      self->_showFooterInCollectionView = 0;
      BOOL v23 = 1;
    }
    [(UIStackView *)self->_footerStack setHidden:v23];
    collectionView = self->_collectionView;
    [(UICollectionView *)collectionView reloadData];
  }
}

- (void)setAllSnapshotsLoaded:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_allSnapshotsLoaded != a3)
  {
    BOOL v3 = a3;
    self->_allSnapshotsLoaded = a3;
    double v5 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double v6 = [(NTKGalleryCollection *)self->_collection title];
      int v7 = 134218498;
      double v8 = self;
      __int16 v9 = 2112;
      v10 = v6;
      __int16 v11 = 2048;
      BOOL v12 = v3;
      _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) - snapshots loaded %lu", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)prepareForReuse
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(NTKGalleryCollection *)self->_collection title];
    *(_DWORD *)buf = 134218242;
    v10 = self;
    __int16 v11 = 2112;
    BOOL v12 = v4;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) preparing for reuse", buf, 0x16u);
  }
  v8.receiver = self;
  v8.super_class = (Class)NTKCGalleryCell;
  [(NTKCGalleryCell *)&v8 prepareForReuse];
  double v5 = [(NTKGalleryCollection *)self->_collection delegate];

  if (v5 == self) {
    [(NTKGalleryCollection *)self->_collection setDelegate:0];
  }
  double v6 = [(NTKCGalleryCell *)self collectionView];
  int v7 = [(NTKCGalleryCell *)self collectionView];
  [v7 contentOffset];
  objc_msgSend(v6, "setContentOffset:animated:", 0);

  [(NTKCGalleryCell *)self _resetSnapshotRequests];
}

- (void)_resetSnapshotRequests
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(NTKGalleryCollection *)self->_collection title];
    *(_DWORD *)buf = 134218242;
    double v18 = self;
    __int16 v19 = 2112;
    uint64_t v20 = v4;
    _os_log_impl(&dword_1BC5A9000, v3, OS_LOG_TYPE_DEFAULT, "Resetting snapshot requests for cell %p (%@)", buf, 0x16u);
  }
  double v5 = +[NTKFaceSnapshotCache snapshotCache];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v6 = self->_snapshotRequests;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "cancelSnapshotRequest:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), (void)v12);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  snapshotRequests = self->_snapshotRequests;
  self->_snapshotRequests = 0;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKCGalleryCell;
  [(NTKCGalleryCell *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)NTKCGalleryCell;
  [(NTKCGalleryCell *)&v6 layoutSubviews];
  [(UICollectionView *)self->_collectionView frame];
  if (CGRectIsEmpty(v7))
  {
    int64_t selectedIndex = self->_selectedIndex;
    if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      collectionView = self->_collectionView;
      double v5 = [MEMORY[0x1E4F28D58] indexPathForItem:selectedIndex inSection:0];
      [(UICollectionView *)collectionView scrollToItemAtIndexPath:v5 atScrollPosition:16 animated:0];
    }
  }
}

- (void)setCollection:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v47 = self;
    __int16 v48 = 2112;
    v49 = self;
    __int16 v50 = 2112;
    id v51 = v4;
    __int16 v52 = 2048;
    id v53 = v4;
    _os_log_impl(&dword_1BC5A9000, v5, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) setting collection to %@ (%p)", buf, 0x2Au);
  }

  objc_storeStrong((id *)&self->_collection, a3);
  objc_super v6 = [v4 delegate];
  BOOL v7 = v6 == 0;

  if (v7) {
    [v4 setDelegate:self];
  }
  [(NTKCGalleryCell *)self _configureViews];
  [(NTKCGalleryCell *)self _resetSnapshotRequests];
  uint64_t v8 = +[NTKFaceSnapshotCache snapshotCache];
  unint64_t v9 = [v4 numberOfFaces];
  if (v9 >= 4) {
    unint64_t v10 = 4;
  }
  else {
    unint64_t v10 = v9;
  }
  if (v10)
  {
    __int16 v11 = [v4 faceAtIndex:0];
    long long v12 = [v8 cachedSnapshotOfFace:v11];
    BOOL v13 = v12 == 0;

    if (v13)
    {
      BOOL v19 = 0;
    }
    else
    {
      uint64_t v14 = 1;
      do
      {
        unint64_t v15 = v14;
        if (v10 == v14) {
          break;
        }
        id v16 = [v4 faceAtIndex:v14];
        double v17 = [v8 cachedSnapshotOfFace:v16];
        BOOL v18 = v17 == 0;

        uint64_t v14 = v15 + 1;
      }
      while (!v18);
      BOOL v19 = v15 >= v10;
    }
  }
  else
  {
    BOOL v19 = 1;
  }
  [(NTKCGalleryCell *)self setAllSnapshotsLoaded:v19];
  uint64_t v20 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = [*v35 title];
    *(_DWORD *)buf = 134218242;
    v47 = self;
    __int16 v48 = 2112;
    v49 = v21;
    _os_log_impl(&dword_1BC5A9000, v20, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) - reloading data", buf, 0x16u);
  }
  if (v19) {
    double v22 = 1.0;
  }
  else {
    double v22 = 0.0;
  }
  [(UICollectionView *)self->_collectionView setAlpha:v22];
  [(UILabel *)self->_footer setAlpha:v22];
  v36 = [MEMORY[0x1E4F1CA48] array];
  if (!v19)
  {
    BOOL v23 = dispatch_group_create();
    dispatch_group_enter(v23);
    if (v10)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        v25 = [v4 faceAtIndex:i];
        uint64_t v26 = [v8 cachedSnapshotOfFace:v25];
        if (!v26)
        {
          dispatch_group_enter(v23);
          v27 = [[NTKFaceSnapshotCacheRequestOptions alloc] initWithPriority:3];
          v28 = [NTKFaceSnapshotCacheRequest alloc];
          v44[0] = MEMORY[0x1E4F143A8];
          v44[1] = 3221225472;
          v44[2] = __33__NTKCGalleryCell_setCollection___block_invoke;
          v44[3] = &unk_1E62C4128;
          v45 = v23;
          uint64_t v29 = [(NTKFaceSnapshotCacheRequest *)v28 initWithFace:v25 options:v27 completion:v44];
          [v36 addObject:v29];
          [v8 fetchSnapshotWithRequest:v29];
        }
      }
    }
    objc_initWeak((id *)buf, self);
    v30 = [*v35 title];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__NTKCGalleryCell_setCollection___block_invoke_2;
    block[3] = &unk_1E62C4170;
    objc_copyWeak(v43, (id *)buf);
    id v39 = v4;
    id v31 = v30;
    id v40 = v31;
    v43[1] = (id)v10;
    id v41 = v8;
    id v32 = v36;
    id v42 = v32;
    dispatch_group_notify(v23, MEMORY[0x1E4F14428], block);
    v33 = (NSArray *)[v32 copy];
    snapshotRequests = self->_snapshotRequests;
    self->_snapshotRequests = v33;

    dispatch_group_leave(v23);
    objc_destroyWeak(v43);

    objc_destroyWeak((id *)buf);
  }
}

void __33__NTKCGalleryCell_setCollection___block_invoke(uint64_t a1)
{
}

void __33__NTKCGalleryCell_setCollection___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  BOOL v3 = WeakRetained;
  if (WeakRetained && WeakRetained[128] == *(id *)(a1 + 32))
  {
    [WeakRetained setAllSnapshotsLoaded:1];
    objc_super v6 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      BOOL v18 = v3;
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) - reloading data with snapshots", buf, 0x16u);
    }

    [v3[132] reloadData];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __33__NTKCGalleryCell_setCollection___block_invoke_88;
    v16[3] = &unk_1E62BFF20;
    v16[4] = v3;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __33__NTKCGalleryCell_setCollection___block_invoke_2_90;
    v15[3] = &unk_1E62C2648;
    v15[4] = v3;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v16 options:v15 animations:0.3 completion:0.0];
    unint64_t v8 = [*(id *)(a1 + 32) numberOfFaces];
    unint64_t v9 = *(void *)(a1 + 72);
    if (v9 < v8)
    {
      unint64_t v10 = v8;
      do
      {
        __int16 v11 = [*(id *)(a1 + 32) faceAtIndex:v9];
        long long v12 = [*(id *)(a1 + 48) cachedSnapshotOfFace:v11];
        if (!v12)
        {
          BOOL v13 = [[NTKFaceSnapshotCacheRequestOptions alloc] initWithPriority:2];
          uint64_t v14 = [[NTKFaceSnapshotCacheRequest alloc] initWithFace:v11 options:v13 completion:&__block_literal_global_64];
          [*(id *)(a1 + 56) addObject:v14];
          [*(id *)(a1 + 48) fetchSnapshotWithRequest:v14];
        }
        ++v9;
      }
      while (v10 != v9);
    }
  }
  else
  {
    id v4 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      BOOL v18 = v3;
      __int16 v19 = 2112;
      uint64_t v20 = v5;
      _os_log_impl(&dword_1BC5A9000, v4, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) - skipping notify", buf, 0x16u);
    }
  }
}

uint64_t __33__NTKCGalleryCell_setCollection___block_invoke_88(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1056) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 1104);
  return [v2 setAlpha:1.0];
}

uint64_t __33__NTKCGalleryCell_setCollection___block_invoke_2_90(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1056) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 1104);
  return [v2 setAlpha:1.0];
}

- (CGPoint)contentOffset
{
  [(UICollectionView *)self->_collectionView contentOffset];
  double v4 = v3;
  double v6 = v5;
  [(NTKCGalleryCell *)self _contentInsetPoint];
  double v8 = v4 + v7;
  double v10 = v6 + v9;
  result.y = v10;
  result.x = v8;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(NTKCGalleryCell *)self layoutIfNeeded];
  [(NTKCGalleryCell *)self _contentInsetPoint];
  double v7 = x - v6;
  double v9 = y - v8;
  collectionView = self->_collectionView;
  -[UICollectionView setContentOffset:](collectionView, "setContentOffset:", v7, v9);
}

- (CGPoint)_contentInsetPoint
{
  [(UICollectionView *)self->_collectionView contentInset];
  double v4 = v3;
  [(UICollectionView *)self->_collectionView contentInset];
  double v6 = v5;
  double v7 = v4;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (void)updateFaceAtIndex:(unint64_t)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  collectionView = self->_collectionView;
  double v4 = [MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
  v6[0] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(UICollectionView *)collectionView reloadItemsAtIndexPaths:v5];
}

- (void)selectFace:(id)a3
{
  id v4 = a3;
  double v5 = [(NTKCGalleryCell *)self collection];
  uint64_t v6 = [v5 indexOfFace:v4];

  collectionView = self->_collectionView;
  id v8 = [MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:0];
  [(UICollectionView *)collectionView selectItemAtIndexPath:v8 animated:1 scrollPosition:0];
}

- (void)clearSelectedFaces
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v3 = [(UICollectionView *)self->_collectionView indexPathsForSelectedItems];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(UICollectionView *)self->_collectionView deselectItemAtIndexPath:*(void *)(*((void *)&v8 + 1) + 8 * v7++) animated:1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)faceForLocation:(CGPoint)a3
{
  collectionView = self->_collectionView;
  -[NTKCGalleryCell convertPoint:toView:](self, "convertPoint:toView:", collectionView, a3.x, a3.y);
  uint64_t v5 = -[UICollectionView indexPathForItemAtPoint:](collectionView, "indexPathForItemAtPoint:");
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = -[NTKGalleryCollection faceAtIndex:](self->_collection, "faceAtIndex:", [v5 item]);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)containerViewForFace:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", -[NTKGalleryCollection indexOfFace:](self->_collection, "indexOfFace:", a3), 0);
  uint64_t v5 = [(UICollectionView *)self->_collectionView cellForItemAtIndexPath:v4];
  uint64_t v6 = [v5 faceContainerView];

  return v6;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NTKCGalleryCell *)self allSnapshotsLoaded])
  {
    int64_t v5 = [(NTKGalleryCollection *)self->_collection numberOfFaces];
    uint64_t v6 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(NTKGalleryCollection *)self->_collection title];
      int v10 = 134218498;
      long long v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      __int16 v14 = 2048;
      int64_t v15 = v5;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Cell %p (%@)- number of items - %ld", (uint8_t *)&v10, 0x20u);
    }
  }
  else
  {
    uint64_t v6 = _NTKLoggingObjectForDomain(24, (uint64_t)"NTKLoggingDomainCompanionApp");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = [(NTKGalleryCollection *)self->_collection title];
      int v10 = 134218242;
      long long v11 = self;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1BC5A9000, v6, OS_LOG_TYPE_DEFAULT, "Cell %p (%@) - number of items - NOT loaded", (uint8_t *)&v10, 0x16u);
    }
    int64_t v5 = 0;
  }

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  collectionView = self->_collectionView;
  uint64_t v7 = +[_NTKCGalleryCollectionCell reuseIdentifier];
  long long v8 = [(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:v7 forIndexPath:v5];

  uint64_t v9 = [v5 item];
  int v10 = [(NTKGalleryCollection *)self->_collection faceAtIndex:v9];
  long long v11 = [(NTKCGalleryCell *)self delegate];
  __int16 v12 = [v11 galleryCell:self viewForFace:v10 atIndex:v9];
  [v8 setFaceView:v12];

  uint64_t v13 = [(NTKGalleryCollection *)self->_collection calloutName];

  if (v13)
  {
    __int16 v14 = [(NTKGalleryCollection *)self->_collection calloutName];
    int64_t v15 = ((void (**)(void, void *))v14)[2](v14, v10);
    [v8 setCalloutName:v15];
  }
  else
  {
    [v8 setCalloutName:0];
  }
  objc_msgSend(v8, "setActive:", objc_msgSend(v5, "item") == self->_selectedIndex);

  return v8;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  long long v11 = +[_NTKCGalleryCollectionFooter reuseIdentifier];
  __int16 v12 = [v10 dequeueReusableSupplementaryViewOfKind:v9 withReuseIdentifier:v11 forIndexPath:v8];

  uint64_t v13 = [(NTKGalleryCollection *)self->_collection descriptionText];
  [v12 setText:v13];

  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NTKGalleryCollection faceAtIndex:](self->_collection, "faceAtIndex:", [v7 item]);
  id v9 = [(NTKCGalleryCell *)self delegate];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__NTKCGalleryCell_collectionView_didSelectItemAtIndexPath___block_invoke;
  v12[3] = &unk_1E62C09C0;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 galleryCell:self didSelectFace:v8 finishedSelectionHandler:v12];
}

uint64_t __59__NTKCGalleryCell_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:*(void *)(a1 + 40) animated:1];
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 referenceSizeForFooterInSection:(int64_t)a5
{
  id v6 = a3;
  id v7 = v6;
  if (self->_showFooterInCollectionView)
  {
    [v6 bounds];
    double Width = CGRectGetWidth(v19);
    [v7 contentInset];
    double v10 = v9;
    [v7 contentInset];
    double v12 = Width - (v10 + v11);
    +[NTKCFaceContainerView sizeForFaceSize:1 style:FaceSize()];
    double v14 = v12 - v13;
    double v15 = 0.0;
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DB30];
    double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }

  double v16 = v14;
  double v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)_fontSizeDidChange
{
  id v10 = [MEMORY[0x1E4FB1948] prominentInsetGroupedHeaderConfiguration];
  double v3 = [v10 textProperties];
  uint64_t v4 = [v3 font];
  [(UILabel *)self->_title setFont:v4];

  uint64_t v5 = NTKCScreenStyle();
  id v6 = (void *)MEMORY[0x1E4FB28F0];
  if (v5 != -1) {
    id v6 = (void *)MEMORY[0x1E4FB2948];
  }
  id v7 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*v6];
  id v8 = [v7 fontDescriptorWithSymbolicTraits:0x8000];

  double v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];

  [(UILabel *)self->_footer setFont:v9];
  [(NTKCGalleryCell *)self _configureViews];
}

- (NTKGalleryCollection)collection
{
  return self->_collection;
}

- (NTKCGalleryCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKCGalleryCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(int64_t)a3
{
  self->_int64_t selectedIndex = a3;
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionViewFlowLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
}

- (NSLayoutConstraint)cvHeightConstraint
{
  return self->_cvHeightConstraint;
}

- (void)setCvHeightConstraint:(id)a3
{
}

- (UIStackView)contentStack
{
  return self->_contentStack;
}

- (void)setContentStack:(id)a3
{
}

- (UIStackView)titleStack
{
  return self->_titleStack;
}

- (void)setTitleStack:(id)a3
{
}

- (UIStackView)footerStack
{
  return self->_footerStack;
}

- (void)setFooterStack:(id)a3
{
}

- (UILabel)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSArray)snapshotRequests
{
  return self->_snapshotRequests;
}

- (void)setSnapshotRequests:(id)a3
{
}

- (BOOL)allSnapshotsLoaded
{
  return self->_allSnapshotsLoaded;
}

- (BOOL)showFooterInCollectionView
{
  return self->_showFooterInCollectionView;
}

- (void)setShowFooterInCollectionView:(BOOL)a3
{
  self->_showFooterInCollectionView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotRequests, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_footerStack, 0);
  objc_storeStrong((id *)&self->_titleStack, 0);
  objc_storeStrong((id *)&self->_contentStack, 0);
  objc_storeStrong((id *)&self->_cvHeightConstraint, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end