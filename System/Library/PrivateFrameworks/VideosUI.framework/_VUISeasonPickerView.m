@interface _VUISeasonPickerView
- (UICollectionView)collectionView;
- (_VUISeasonPickerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation _VUISeasonPickerView

- (_VUISeasonPickerView)initWithFrame:(CGRect)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)_VUISeasonPickerView;
  v3 = -[_VUISeasonPickerView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_primaryDynamicBackgroundColor");
    [(_VUISeasonPickerView *)v3 setBackgroundColor:v4];

    id v5 = objc_alloc_init(MEMORY[0x1E4FB15C0]);
    [v5 setScrollDirection:0];
    [v5 setMinimumLineSpacing:0.0];
    id v6 = objc_alloc(MEMORY[0x1E4FB1568]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:collectionViewLayout:", v5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    collectionView = v3->_collectionView;
    v3->_collectionView = (UICollectionView *)v7;

    [(UICollectionView *)v3->_collectionView setAlwaysBounceVertical:1];
    v9 = v3->_collectionView;
    v10 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)v9 setBackgroundColor:v10];

    [(_VUISeasonPickerView *)v3 addSubview:v3->_collectionView];
    objc_initWeak(&location, v3);
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:3];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __38___VUISeasonPickerView_initWithFrame___block_invoke;
    v14[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v15, &location);
    id v12 = (id)[(_VUISeasonPickerView *)v3 registerForTraitChanges:v11 withHandler:v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)layoutSubviews
{
  collectionView = self->_collectionView;
  [(_VUISeasonPickerView *)self bounds];
  -[UICollectionView setFrame:](collectionView, "setFrame:");
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
}

@end