@interface NTKCFaceDetailEditOptionCell
+ (double)insetSpacingForStyle:(int64_t)a3;
+ (id)reuseIdentifier;
- (BOOL)_isReloadCollectionRequired:(id)a3 selectedOptions:(id)a4;
- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4;
- (BOOL)disabled;
- (CGRect)swatchFrame;
- (NSDictionary)selectedOptions;
- (NSDictionary)selectedSlotOptions;
- (NTKCFaceDetailEditOptionCell)initWithCollection:(id)a3 forFaceView:(id)a4 face:(id)a5;
- (NTKCFaceDetailEditOptionCellDelegate)delegate;
- (NTKEditOptionCollection)collection;
- (NTKFace)face;
- (NTKFaceView)faceView;
- (UICollectionView)collectionView;
- (UICollectionViewFlowLayout)layout;
- (UILabel)optionsDescription;
- (double)_spacing;
- (double)rowHeight;
- (id)_dequeueCellForIndexPath:(id)a3;
- (id)_imageForIndexPath:(id)a3;
- (id)_indexPathForEditOptionIndex:(int64_t)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)_editOptionIndexForIndexPath:(id)a3;
- (int64_t)_swatchImageContentMode;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_ensureIndexPathVisible:(id)a3 animated:(BOOL)a4;
- (void)_fontSizeDidChange;
- (void)_setVerticalBottomBuffer;
- (void)_setupCell:(id)a3;
- (void)_setupFromCollection;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)ensureIndexVisible:(int64_t)a3 animated:(BOOL)a4;
- (void)ensureSelectedOptionVisible:(BOOL)a3;
- (void)layoutSubviews;
- (void)reloadVisibleCells;
- (void)scrollToIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)scrollToSelectedOption:(BOOL)a3;
- (void)setCollection:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setFace:(id)a3;
- (void)setFaceView:(id)a3;
- (void)setLayout:(id)a3;
- (void)setOptionsDescription:(id)a3;
- (void)setOptionsText:(id)a3;
- (void)setSelectedOptions:(id)a3;
- (void)setSelectedSlotOptions:(id)a3;
@end

@implementation NTKCFaceDetailEditOptionCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NTKCFaceDetailEditOptionCell)initWithCollection:(id)a3 forFaceView:(id)a4 face:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NTKCFaceDetailEditOptionCell;
  v11 = [(NTKCDetailTableViewCell *)&v22 init];
  v12 = v11;
  if (v11)
  {
    [(NTKCFaceDetailEditOptionCell *)v11 setCollection:v8];
    [(NTKCFaceDetailEditOptionCell *)v12 setFaceView:v9];
    [v10 prepareEditOptions];
    [(NTKCFaceDetailEditOptionCell *)v12 setFace:v10];
    v12->_editOptionVerticalBottomBuffer = 50.0;
    v13 = objc_opt_new();
    [(NTKCFaceDetailEditOptionCell *)v12 setLayout:v13];

    [(UICollectionViewFlowLayout *)v12->_layout _setWantsRightToLeftHorizontalMirroringIfNeeded:1];
    [(UICollectionViewFlowLayout *)v12->_layout setScrollDirection:1];
    id v14 = objc_alloc(MEMORY[0x1E4FB1568]);
    v15 = objc_msgSend(v14, "initWithFrame:collectionViewLayout:", v12->_layout, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(NTKCFaceDetailEditOptionCell *)v12 setCollectionView:v15];

    [(UICollectionView *)v12->_collectionView setBackgroundColor:0];
    [(UICollectionView *)v12->_collectionView setAlwaysBounceHorizontal:1];
    [(UICollectionView *)v12->_collectionView setShowsHorizontalScrollIndicator:0];
    [(UICollectionView *)v12->_collectionView setDelegate:v12];
    [(UICollectionView *)v12->_collectionView setDataSource:v12];
    collectionView = v12->_collectionView;
    uint64_t v17 = objc_opt_class();
    v18 = +[_NTKCFaceDetailCollectionCell reuseIdentifier];
    [(UICollectionView *)collectionView registerClass:v17 forCellWithReuseIdentifier:v18];

    v19 = [(NTKCFaceDetailEditOptionCell *)v12 contentView];
    [v19 addSubview:v12->_collectionView];

    [(NTKCFaceDetailEditOptionCell *)v12 _setVerticalBottomBuffer];
    [(NTKCFaceDetailEditOptionCell *)v12 _setupFromCollection];
    v20 = [(NTKEditOptionCollection *)v12->_collection optionsDescription];
    [(NTKCFaceDetailEditOptionCell *)v12 setOptionsText:v20];
    v12->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
    [(NTKCFaceDetailEditOptionCell *)v12 _fontSizeDidChange];
  }
  return v12;
}

- (void)_setVerticalBottomBuffer
{
  self->_editOptionVerticalBottomBuffer = 50.0;
  v3 = [(NTKEditOptionCollection *)self->_collection options];
  uint64_t v4 = [v3 count];

  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      id v7 = [(NTKCFaceDetailEditOptionCell *)self _indexPathForEditOptionIndex:v5];
      v6 = -[NTKCFaceDetailEditOptionCell collectionView:cellForItemAtIndexPath:](self, "collectionView:cellForItemAtIndexPath:", self->_collectionView);
      if ([v6 is3Lines]) {
        break;
      }

      if (v4 == ++v5) {
        return;
      }
    }
    self->_editOptionVerticalBottomBuffer = 58.0;
  }
}

- (void)setOptionsText:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    uint64_t v4 = [(NTKCFaceDetailEditOptionCell *)self optionsDescription];
    [v4 removeFromSuperview];

    uint64_t v5 = objc_opt_new();
    [(NTKCFaceDetailEditOptionCell *)self setOptionsDescription:v5];

    v6 = BPSDetailTextColor();
    [(UILabel *)self->_optionsDescription setTextColor:v6];

    [(UILabel *)self->_optionsDescription setNumberOfLines:0];
    [(UILabel *)self->_optionsDescription setText:v8];
    [(UILabel *)self->_optionsDescription setLineBreakMode:0];
    optionsDescription = [(NTKCFaceDetailEditOptionCell *)self contentView];
    [optionsDescription addSubview:self->_optionsDescription];
  }
  else
  {
    [(UILabel *)self->_optionsDescription removeFromSuperview];
    optionsDescription = self->_optionsDescription;
    self->_optionsDescription = 0;
  }

  [(NTKCFaceDetailEditOptionCell *)self setNeedsLayout];
  [(NTKCFaceDetailEditOptionCell *)self setNeedsDisplay];
}

- (int64_t)_editOptionIndexForIndexPath:(id)a3
{
  return [a3 item];
}

- (id)_indexPathForEditOptionIndex:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F28D58] indexPathForItem:a3 inSection:0];
}

- (void)_setupFromCollection
{
  +[NTKEditOption sizeForSwatchStyle:[(NTKEditOptionCollection *)self->_collection swatchStyle]];
  double v4 = v3;
  double v6 = v5;
  +[_NTKCFaceDetailCollectionCell outlineLineWidth];
  double v8 = v7;
  double v9 = 4.0;
  if ([(NTKEditOptionCollection *)self->_collection mode] == 11)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
    uint64_t v11 = [WeakRetained faceStyle];

    if (v11 == 1) {
      double v9 = (114.0 - v4 + v8 * -2.0) * 0.5;
    }
  }
  self->_outlineOutset = v9;
  self->_double outlinePadding = v8 + v9 + v8 + v9;
  [(NTKCFaceDetailEditOptionCell *)self _spacing];
  -[UICollectionViewFlowLayout setMinimumLineSpacing:](self->_layout, "setMinimumLineSpacing:");
  double v12 = self->_outlinePadding * -0.5 + 23.0;
  unint64_t v13 = [(NTKEditOptionCollection *)self->_collection collectionType];
  double outlinePadding = self->_outlinePadding;
  double v15 = v12;
  if (v13 != 1) {
    double v15 = self->_editOptionVerticalBottomBuffer + outlinePadding * -0.5;
  }
  -[UICollectionViewFlowLayout setItemSize:](self->_layout, "setItemSize:", v4 + outlinePadding, v15 + v6 + v12 + outlinePadding);
  self->_swatchFrame.origin.x = self->_outlinePadding * 0.5;
  self->_swatchFrame.origin.y = 23.0;
  self->_swatchFrame.size.width = v4;
  self->_swatchFrame.size.height = v6;
}

- (BOOL)_isReloadCollectionRequired:(id)a3 selectedOptions:(id)a4
{
  return 0;
}

- (double)rowHeight
{
  [(UICollectionViewFlowLayout *)self->_layout itemSize];
  double v4 = v3;
  if (self->_optionsDescription)
  {
    double v5 = v3 - self->_editOptionVerticalBottomBuffer;
    [(NTKCFaceDetailEditOptionCell *)self layoutIfNeeded];
    double v6 = [(UILabel *)self->_optionsDescription font];
    [v6 _scaledValueForValue:60.0];
    double v8 = v5 + v7;
    [(UILabel *)self->_optionsDescription _firstLineBaselineOffsetFromBoundsTop];
    double v10 = v8 - v9;
    [(UILabel *)self->_optionsDescription bounds];
    double v11 = v10 + CGRectGetHeight(v16);
    [v6 _scaledValueForValue:25.0];
    double v13 = v12;
    [(UILabel *)self->_optionsDescription _baselineOffsetFromBottom];
    double v4 = v11 + v13 - v14;
  }
  return v4;
}

- (void)reloadVisibleCells
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v11 = [(NTKCFaceDetailEditOptionCell *)self _indexPathForEditOptionIndex:self->_selectedIndex];
  uint64_t v3 = [v11 row];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = [(UICollectionView *)self->_collectionView visibleCells];
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v9 = [(UICollectionView *)self->_collectionView indexPathForCell:v8];
        double v10 = [(NTKCFaceDetailEditOptionCell *)self _imageForIndexPath:v9];
        [v8 setImage:v10];

        objc_msgSend(v8, "setActive:", objc_msgSend(v9, "row") == v3);
        objc_msgSend(v8, "setSwatchImageContentMode:", -[NTKCFaceDetailEditOptionCell _swatchImageContentMode](self, "_swatchImageContentMode"));
        [v8 setDisabled:self->_disabled];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)setSelectedOptions:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(NTKCFaceDetailEditOptionCell *)self collection];
  BOOL v7 = [(NTKCFaceDetailEditOptionCell *)self _isReloadCollectionRequired:v6 selectedOptions:v5];

  if (v7)
  {
    objc_storeStrong((id *)&self->_selectedOptions, a3);
    [(NTKCFaceDetailEditOptionCell *)self _setupFromCollection];
    [(UICollectionView *)self->_collectionView reloadData];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_face);
    char v9 = [WeakRetained editOptionsPrepared];

    if ((v9 & 1) == 0)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_face);
      [v10 prepareEditOptions];
    }
    double v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[NTKEditOptionCollection mode](self->_collection, "mode"));
    double v12 = [v5 objectForKeyedSubscript:v11];

    id v13 = objc_loadWeakRetained((id *)&self->_face);
    int64_t v14 = [(NTKEditOptionCollection *)self->_collection mode];
    long long v15 = [(NTKEditOptionCollection *)self->_collection slot];
    int64_t v16 = [v13 indexOfOption:v12 forCustomEditMode:v14 slot:v15];

    if (v16 != self->_selectedIndex)
    {
      if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v16 = 0;
      }
      self->_selectedIndex = v16;
    }
    uint64_t v17 = [(NTKCFaceDetailEditOptionCell *)self _indexPathForEditOptionIndex:v16];
    if (v17) {
      [(NTKCFaceDetailEditOptionCell *)self _ensureIndexPathVisible:v17 animated:0];
    }
    [(NTKCFaceDetailEditOptionCell *)self reloadVisibleCells];
  }
  else
  {
    id v86 = a3;
    id v18 = objc_loadWeakRetained((id *)&self->_faceView);
    v19 = objc_opt_class();
    int64_t v20 = [(NTKEditOptionCollection *)self->_collection mode];
    location = (id *)&self->_faceView;
    id v21 = objc_loadWeakRetained((id *)&self->_faceView);
    objc_super v22 = [v21 device];
    [v19 swatchForEditModeDependsOnOptions:v20 forDevice:v22];
    v23 = v88 = v5;

    v93 = objc_opt_new();
    v92 = objc_opt_new();
    v24 = [MEMORY[0x1E4F1CA60] dictionary];
    v25 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    v26 = v88;
    id obj = v23;
    uint64_t v94 = [obj countByEnumeratingWithState:&v103 objects:v108 count:16];
    if (v94)
    {
      uint64_t v90 = *(void *)v104;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v104 != v90) {
            objc_enumerationMutation(obj);
          }
          uint64_t v97 = v27;
          v28 = *(void **)(*((void *)&v103 + 1) + 8 * v27);
          v29 = -[NSDictionary objectForKeyedSubscript:](self->_selectedOptions, "objectForKeyedSubscript:", v28, v86, location);
          [v93 setObject:v29 forKeyedSubscript:v28];

          v30 = [v26 objectForKeyedSubscript:v28];
          [v92 setObject:v30 forKeyedSubscript:v28];

          id v31 = objc_loadWeakRetained((id *)&self->_face);
          uint64_t v32 = [v31 dynamicEditMode];
          uint64_t v33 = [v28 integerValue];

          if (v32 == v33)
          {
            id v34 = objc_loadWeakRetained((id *)&self->_face);
            v35 = objc_msgSend(v34, "selectedSlotOptionsForCustomEditMode:", objc_msgSend(v34, "dynamicEditMode"));

            long long v101 = 0u;
            long long v102 = 0u;
            long long v99 = 0u;
            long long v100 = 0u;
            v36 = v35;
            uint64_t v37 = [(NSDictionary *)v36 countByEnumeratingWithState:&v99 objects:v107 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              uint64_t v39 = *(void *)v100;
              do
              {
                for (uint64_t i = 0; i != v38; ++i)
                {
                  if (*(void *)v100 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  uint64_t v41 = *(void *)(*((void *)&v99 + 1) + 8 * i);
                  v42 = [(NSDictionary *)self->_selectedSlotOptions objectForKeyedSubscript:v41];
                  [v24 setObject:v42 forKeyedSubscript:v41];

                  v43 = [(NSDictionary *)v36 objectForKeyedSubscript:v41];
                  [v25 setObject:v43 forKeyedSubscript:v41];
                }
                uint64_t v38 = [(NSDictionary *)v36 countByEnumeratingWithState:&v99 objects:v107 count:16];
              }
              while (v38);
            }

            selectedSlotOptions = self->_selectedSlotOptions;
            self->_selectedSlotOptions = v36;

            v26 = v88;
          }
          uint64_t v27 = v97 + 1;
        }
        while (v97 + 1 != v94);
        uint64_t v94 = [obj countByEnumeratingWithState:&v103 objects:v108 count:16];
      }
      while (v94);
    }

    selectedOptions = self->_selectedOptions;
    v46 = objc_msgSend(NSNumber, "numberWithInteger:", -[NTKEditOptionCollection mode](self->_collection, "mode"));
    uint64_t v47 = [(NSDictionary *)selectedOptions objectForKeyedSubscript:v46];

    v48 = [(NTKEditOptionCollection *)self->_collection slot];

    v98 = (void *)v47;
    if (v48)
    {
      p_selectedOptions = &self->_selectedOptions;
      id v49 = objc_loadWeakRetained((id *)&self->_face);
      int64_t v50 = [(NTKEditOptionCollection *)self->_collection mode];
      v51 = [(NTKEditOptionCollection *)self->_collection slot];
      v52 = [v49 selectedOptionForCustomEditMode:v50 slot:v51];

      if (v52)
      {
        id v53 = v52;
        v54 = v98;
      }
      else
      {
        v54 = v98;
        if (v98)
        {
          id v53 = v98;
        }
        else
        {
          id v57 = objc_loadWeakRetained((id *)&self->_face);
          int64_t v58 = [(NTKEditOptionCollection *)self->_collection mode];
          v59 = [(NTKEditOptionCollection *)self->_collection slot];
          uint64_t v60 = [v57 defaultOptionForCustomEditMode:v58 slot:v59];

          id v53 = (id)v60;
        }
      }
      v61 = (NSDictionary *)objc_msgSend(v88, "mutableCopy", v86);
      v62 = objc_msgSend(NSNumber, "numberWithInteger:", -[NTKEditOptionCollection mode](self->_collection, "mode"));
      [(NSDictionary *)v61 setObject:v53 forKey:v62];

      v63 = *p_selectedOptions;
      *p_selectedOptions = v61;
    }
    else
    {
      v55 = objc_msgSend(NSNumber, "numberWithInteger:", -[NTKEditOptionCollection mode](self->_collection, "mode"));
      uint64_t v56 = [v26 objectForKeyedSubscript:v55];

      objc_storeStrong((id *)&self->_selectedOptions, v86);
      id v53 = (id)v56;
      v54 = (void *)v47;
    }
    p_face = &self->_face;
    id v65 = objc_loadWeakRetained((id *)&self->_face);
    char v66 = [v65 editOptionsPrepared];

    if ((v66 & 1) == 0)
    {
      id v67 = objc_loadWeakRetained((id *)p_face);
      [v67 prepareEditOptions];
    }
    id v68 = objc_loadWeakRetained((id *)p_face);
    int64_t v69 = [(NTKEditOptionCollection *)self->_collection mode];
    v70 = [(NTKEditOptionCollection *)self->_collection slot];
    v71 = v53;
    uint64_t v72 = [v68 indexOfOption:v53 forCustomEditMode:v69 slot:v70];

    v96 = v71;
    if ([v71 isEqual:v54] && v72 == self->_selectedIndex)
    {
      int v91 = 0;
    }
    else
    {
      if (v72 == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v73 = 0;
      }
      else {
        int64_t v73 = v72;
      }
      self->_selectedIndex = v73;
      int v91 = 1;
    }
    if (objc_msgSend(obj, "count", v86))
    {
      v74 = &self->_face;
      if ([v92 isEqualToDictionary:v93]) {
        int v75 = [v25 isEqualToDictionary:v24] ^ 1;
      }
      else {
        int v75 = 1;
      }
    }
    else
    {
      v74 = &self->_face;
      int v75 = 0;
    }
    id v76 = objc_loadWeakRetained(location);
    v77 = [v76 _editModesDisabledByCurrentConfiguration];

    int64_t v78 = [(NTKEditOptionCollection *)self->_collection mode];
    v79 = [NSNumber numberWithInteger:v78];
    int v80 = [v77 containsObject:v79];

    int disabled = self->_disabled;
    int v82 = disabled;
    if (disabled != v80)
    {
      self->_int disabled = v80;
      int v82 = v80;
    }
    if (v82)
    {
      id v83 = objc_loadWeakRetained((id *)v74);
      v84 = [v83 localizedExplanationMessageForDisabledEditMode:v78];
      [(NTKCFaceDetailEditOptionCell *)self setOptionsText:v84];

      [(UICollectionView *)self->_collectionView setScrollEnabled:0];
    }
    else
    {
      v85 = [(NTKEditOptionCollection *)self->_collection optionsDescription];
      [(NTKCFaceDetailEditOptionCell *)self setOptionsText:v85];
      [(UICollectionView *)self->_collectionView setScrollEnabled:1];
    }
    if (((v91 | v75) & 1) != 0 || disabled != v80) {
      [(NTKCFaceDetailEditOptionCell *)self reloadVisibleCells];
    }

    id v5 = v88;
  }
}

- (BOOL)collectionChanged:(id)a3 withSelectedOptions:(id)a4
{
  id v6 = a4;
  [(NTKCFaceDetailEditOptionCell *)self setCollection:a3];
  [(NTKCFaceDetailEditOptionCell *)self setSelectedOptions:v6];

  [(NTKCFaceDetailEditOptionCell *)self _setupFromCollection];
  [(UICollectionView *)self->_collectionView reloadData];
  return 0;
}

- (void)layoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)NTKCFaceDetailEditOptionCell;
  [(NTKCDetailTableViewCell *)&v48 layoutSubviews];
  uint64_t v3 = [(NTKCFaceDetailEditOptionCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v49.origin.x = v5;
  v49.origin.y = v7;
  v49.size.width = v9;
  v49.size.height = v11;
  double Width = CGRectGetWidth(v49);
  [(NTKCFaceDetailEditOptionCell *)self separatorInset];
  double v46 = v12;
  [(UICollectionView *)self->_collectionView frame];
  CGFloat v44 = v14;
  CGFloat v45 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  double v19 = *MEMORY[0x1E4F1DAD8];
  double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v50.origin.x = v5;
  v50.origin.y = v7;
  v50.size.width = v9;
  v50.size.height = v11;
  double v21 = CGRectGetWidth(v50);
  [(UICollectionViewFlowLayout *)self->_layout itemSize];
  -[UICollectionView setFrame:](self->_collectionView, "setFrame:", v19, v20, v21, v22);
  [(UICollectionView *)self->_collectionView contentInset];
  double v24 = v23;
  double v26 = v25;
  [(NTKCFaceDetailEditOptionCell *)self separatorInset];
  -[UICollectionView setContentInset:](self->_collectionView, "setContentInset:", v24, v27 + self->_outlinePadding * -0.5, v26, v27 + self->_outlinePadding * -0.5);
  if (self->_selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v28 = -[NTKCFaceDetailEditOptionCell _indexPathForEditOptionIndex:](self, "_indexPathForEditOptionIndex:");
    v51.origin.y = v44;
    v51.origin.x = v45;
    v51.size.width = v16;
    v51.size.height = v18;
    if (CGRectIsEmpty(v51)
      || ([(UICollectionView *)self->_collectionView indexPathsForVisibleItems],
          v29 = objc_claimAutoreleasedReturnValue(),
          char v30 = [v29 containsObject:v28],
          v29,
          (v30 & 1) == 0))
    {
      -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v28, 16, 0, *(void *)&v44, *(void *)&v45);
    }
  }
  double v31 = Width + v46 * -2.0;
  [(UILabel *)self->_optionsDescription frame];
  double v33 = v32;
  -[UILabel sizeThatFits:](self->_optionsDescription, "sizeThatFits:", v31, 1.79769313e308);
  double v35 = v34;
  [(NTKCFaceDetailEditOptionCell *)self separatorInset];
  double v37 = v36;
  -[UILabel setFrame:](self->_optionsDescription, "setFrame:", v36, v33, v31, v35);
  double MaxY = CGRectGetMaxY(self->_swatchFrame);
  uint64_t v39 = [(UILabel *)self->_optionsDescription font];
  [v39 _scaledValueForValue:60.0];
  double v41 = MaxY + v40;
  [(UILabel *)self->_optionsDescription _firstLineBaselineOffsetFromBoundsTop];
  double v43 = v41 - v42;

  -[UILabel setFrame:](self->_optionsDescription, "setFrame:", v37, v43, v31, v35);
}

- (double)_spacing
{
  objc_msgSend((id)objc_opt_class(), "insetSpacingForStyle:", -[NTKEditOptionCollection swatchStyle](self->_collection, "swatchStyle"));
  return v3 - self->_outlinePadding;
}

+ (double)insetSpacingForStyle:(int64_t)a3
{
  uint64_t v4 = NTKCScreenStyle();
  double result = 20.0;
  if (v4 != 1)
  {
    double result = 0.0;
    if ((unint64_t)a3 <= 4) {
      return dbl_1BC8A0510[a3];
    }
  }
  return result;
}

- (id)_dequeueCellForIndexPath:(id)a3
{
  collectionView = self->_collectionView;
  id v5 = a3;
  double v6 = +[_NTKCFaceDetailCollectionCell reuseIdentifier];
  CGFloat v7 = [(UICollectionView *)collectionView dequeueReusableCellWithReuseIdentifier:v6 forIndexPath:v5];

  [(NTKCFaceDetailEditOptionCell *)self _setupCell:v7];
  return v7;
}

- (void)_setupCell:(id)a3
{
  double x = self->_swatchFrame.origin.x;
  double y = self->_swatchFrame.origin.y;
  double width = self->_swatchFrame.size.width;
  double height = self->_swatchFrame.size.height;
  id v8 = a3;
  objc_msgSend(v8, "setSwatchFrame:", x, y, width, height);
  [v8 setOutlineOutset:self->_outlineOutset];
}

- (id)_imageForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NTKCFaceDetailEditOptionCell *)self _editOptionIndexForIndexPath:v4];
  double v6 = [(NTKEditOptionCollection *)self->_collection options];
  unint64_t v7 = [v6 count];

  if (v5 >= v7)
  {
    double v13 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
    CGFloat v9 = [(NTKEditOptionCollection *)self->_collection options];
    double v10 = [v9 objectAtIndexedSubscript:v5];
    int64_t v11 = [(NTKEditOptionCollection *)self->_collection mode];
    selectedOptions = self->_selectedOptions;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __51__NTKCFaceDetailEditOptionCell__imageForIndexPath___block_invoke;
    v15[3] = &unk_1E62C1A18;
    objc_copyWeak(&v17, &location);
    id v16 = v4;
    double v13 = [WeakRetained swatchImageForEditOption:v10 mode:v11 withSelectedOptions:selectedOptions refreshHandler:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __51__NTKCFaceDetailEditOptionCell__imageForIndexPath___block_invoke(uint64_t a1)
{
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  unint64_t v5 = __51__NTKCFaceDetailEditOptionCell__imageForIndexPath___block_invoke_2;
  double v6 = &unk_1E62C1A18;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  v2 = (void (**)(void))_Block_copy(&v3);
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v3, v4, v5, v6)) {
    v2[2](v2);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v2);
  }

  objc_destroyWeak(&v8);
}

void __51__NTKCFaceDetailEditOptionCell__imageForIndexPath___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 140);
    v6[0] = *(void *)(a1 + 32);
    unint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
    [v4 reloadItemsAtIndexPaths:v5];
  }
}

- (int64_t)_swatchImageContentMode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
  int64_t v3 = [WeakRetained swatchImageContentMode];

  return v3;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(NTKEditOptionCollection *)self->_collection options];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(NTKCFaceDetailEditOptionCell *)self _dequeueCellForIndexPath:v5];
  int64_t v7 = [(NTKCFaceDetailEditOptionCell *)self _editOptionIndexForIndexPath:v5];

  id v8 = [(NTKEditOptionCollection *)self->_collection options];
  CGFloat v9 = [v8 objectAtIndexedSubscript:v7];

  if ([(NTKEditOptionCollection *)self->_collection collectionType] != 1)
  {
    double v10 = [v9 localizedName];
    int64_t v11 = [v10 localizedUppercaseString];
    [v6 setText:v11];
  }
  objc_msgSend(v6, "setStyle:", objc_msgSend(v9, "swatchStyle"));

  return v6;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7 = a5;
  id v9 = a4;
  objc_msgSend(v9, "setActive:animated:", self->_selectedIndex == -[NTKCFaceDetailEditOptionCell _editOptionIndexForIndexPath:](self, "_editOptionIndexForIndexPath:", v7), 0);
  [v9 setDisabled:self->_disabled];
  id v8 = [(NTKCFaceDetailEditOptionCell *)self _imageForIndexPath:v7];

  [v9 setImage:v8];
  objc_msgSend(v9, "setSwatchImageContentMode:", -[NTKCFaceDetailEditOptionCell _swatchImageContentMode](self, "_swatchImageContentMode"));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  if (!self->_disabled)
  {
    id v9 = v5;
    int64_t v6 = [(NTKCFaceDetailEditOptionCell *)self _editOptionIndexForIndexPath:v5];
    id v5 = v9;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v7 = v6;
      id v8 = [(NTKCFaceDetailEditOptionCell *)self delegate];
      [v8 editOptionCell:self didSelectOptionAtIndex:v7];

      [(NTKCFaceDetailEditOptionCell *)self _ensureIndexPathVisible:v9 animated:1];
      id v5 = v9;
    }
  }
}

- (void)_fontSizeDidChange
{
  if (self->_optionsDescription)
  {
    int64_t v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2948]];
    uint64_t v4 = [v3 fontDescriptorWithSymbolicTraits:0x8000];

    id v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];
    [(UILabel *)self->_optionsDescription setFont:v5];
  }
  [(NTKCFaceDetailEditOptionCell *)self setNeedsLayout];
}

- (void)scrollToIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  collectionView = self->_collectionView;
  id v6 = [(NTKCFaceDetailEditOptionCell *)self _indexPathForEditOptionIndex:a3];
  [(UICollectionView *)collectionView scrollToItemAtIndexPath:v6 atScrollPosition:16 animated:v4];
}

- (void)scrollToSelectedOption:(BOOL)a3
{
}

- (void)_ensureIndexPathVisible:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id rect_16 = a3;
  id v6 = [(UICollectionView *)self->_collectionView layoutAttributesForItemAtIndexPath:rect_16];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = [rect_16 item];
  if (v15
    && v15 != -[UICollectionView numberOfItemsInSection:](self->_collectionView, "numberOfItemsInSection:", [rect_16 section])- 1)
  {
    [(UICollectionView *)self->_collectionView bounds];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    [(UICollectionView *)self->_collectionView contentInset];
    CGFloat v24 = v10;
    CGFloat v26 = v17 + v25;
    double v28 = v19 + v27;
    double v30 = v21 - (v25 + v29);
    double v32 = v23 - (v27 + v31);
    v47.origin.double x = v8;
    CGFloat rect_8 = v24;
    v47.origin.double y = v24;
    v47.size.double width = v12;
    v47.size.double height = v14;
    double MaxX = CGRectGetMaxX(v47);
    CGFloat rect = v26;
    v48.origin.double x = v26;
    v48.origin.double y = v28;
    v48.size.double width = v30;
    v48.size.double height = v32;
    if (MaxX <= CGRectGetMaxX(v48))
    {
      v49.origin.double x = v8;
      double v10 = rect_8;
      v49.origin.double y = rect_8;
      v49.size.double width = v12;
      v49.size.double height = v14;
      double MinX = CGRectGetMinX(v49);
      v50.origin.double x = rect;
      v50.origin.double y = v28;
      v50.size.double width = v30;
      v50.size.double height = v32;
      if (MinX < CGRectGetMinX(v50))
      {
        [(UICollectionView *)self->_collectionView contentInset];
        double v40 = v39;
        double v41 = self->_outlinePadding * 0.5;
        [(NTKCFaceDetailEditOptionCell *)self _spacing];
        double v8 = v8 + v40 - (v41 + v42);
      }
    }
    else
    {
      [(UICollectionView *)self->_collectionView contentInset];
      double v35 = v34;
      double v36 = self->_outlinePadding * 0.5;
      [(NTKCFaceDetailEditOptionCell *)self _spacing];
      double v8 = v8 - (v35 - (v36 + v37));
      double v10 = rect_8;
    }
  }
  -[UICollectionView scrollRectToVisible:animated:](self->_collectionView, "scrollRectToVisible:animated:", v4, v8, v10, v12, v14);
}

- (void)ensureIndexVisible:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(NTKCFaceDetailEditOptionCell *)self _indexPathForEditOptionIndex:a3];
  [(NTKCFaceDetailEditOptionCell *)self _ensureIndexPathVisible:v6 animated:v4];
}

- (void)ensureSelectedOptionVisible:(BOOL)a3
{
}

- (NTKEditOptionCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (NTKFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
  return (NTKFaceView *)WeakRetained;
}

- (void)setFaceView:(id)a3
{
}

- (NTKFace)face
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_face);
  return (NTKFace *)WeakRetained;
}

- (void)setFace:(id)a3
{
}

- (NSDictionary)selectedOptions
{
  return self->_selectedOptions;
}

- (NSDictionary)selectedSlotOptions
{
  return self->_selectedSlotOptions;
}

- (void)setSelectedSlotOptions:(id)a3
{
}

- (NTKCFaceDetailEditOptionCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKCFaceDetailEditOptionCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_int disabled = a3;
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

- (UILabel)optionsDescription
{
  return self->_optionsDescription;
}

- (void)setOptionsDescription:(id)a3
{
}

- (CGRect)swatchFrame
{
  double x = self->_swatchFrame.origin.x;
  double y = self->_swatchFrame.origin.y;
  double width = self->_swatchFrame.size.width;
  double height = self->_swatchFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsDescription, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedSlotOptions, 0);
  objc_storeStrong((id *)&self->_selectedOptions, 0);
  objc_destroyWeak((id *)&self->_face);
  objc_destroyWeak((id *)&self->_faceView);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end