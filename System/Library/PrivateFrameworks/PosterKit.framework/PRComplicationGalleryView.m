@interface PRComplicationGalleryView
- (PRComplicationGalleryView)initWithFrame:(CGRect)a3;
- (PRComplicationGalleryViewDelegate)delegate;
- (UICollectionView)collectionView;
- (id)_makeLayout;
- (void)setDelegate:(id)a3;
@end

@implementation PRComplicationGalleryView

- (PRComplicationGalleryView)initWithFrame:(CGRect)a3
{
  v42[8] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)PRComplicationGalleryView;
  v3 = -[PRComplicationGalleryView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
    v6 = (void *)[v4 initWithEffect:v5];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRComplicationGalleryView *)v3 addSubview:v6];
    id v7 = objc_alloc(MEMORY[0x1E4FB1568]);
    v8 = [(PRComplicationGalleryView *)v3 _makeLayout];
    uint64_t v9 = objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v8, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    collectionView = v3->_collectionView;
    v3->_collectionView = (UICollectionView *)v9;

    v11 = v3->_collectionView;
    v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)v11 setBackgroundColor:v12];

    [(UICollectionView *)v3->_collectionView setShowsVerticalScrollIndicator:0];
    [(UICollectionView *)v3->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRComplicationGalleryView *)v3 addSubview:v3->_collectionView];
    v29 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [v6 leadingAnchor];
    v39 = [(PRComplicationGalleryView *)v3 leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v42[0] = v38;
    v37 = [v6 trailingAnchor];
    v36 = [(PRComplicationGalleryView *)v3 trailingAnchor];
    v34 = [v37 constraintEqualToAnchor:v36];
    v35 = v6;
    v42[1] = v34;
    v33 = [v6 topAnchor];
    v32 = [(PRComplicationGalleryView *)v3 topAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v42[2] = v31;
    v30 = [v6 bottomAnchor];
    v28 = [(PRComplicationGalleryView *)v3 bottomAnchor];
    v27 = [v30 constraintEqualToAnchor:v28];
    v42[3] = v27;
    v26 = [(UICollectionView *)v3->_collectionView leadingAnchor];
    v25 = [(PRComplicationGalleryView *)v3 leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v42[4] = v24;
    v23 = [(UICollectionView *)v3->_collectionView trailingAnchor];
    v13 = [(PRComplicationGalleryView *)v3 trailingAnchor];
    v14 = [v23 constraintEqualToAnchor:v13];
    v42[5] = v14;
    v15 = [(UICollectionView *)v3->_collectionView topAnchor];
    v16 = [(PRComplicationGalleryView *)v3 topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v42[6] = v17;
    v18 = [(UICollectionView *)v3->_collectionView bottomAnchor];
    v19 = [(PRComplicationGalleryView *)v3 bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v42[7] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:8];
    [v29 activateConstraints:v21];
  }
  return v3;
}

- (id)_makeLayout
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1588]);
  [v3 setInterSectionSpacing:20.0];
  objc_initWeak(&location, self);
  id v4 = objc_alloc(MEMORY[0x1E4FB1580]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__PRComplicationGalleryView__makeLayout__block_invoke;
  v7[3] = &unk_1E54DB1E8;
  objc_copyWeak(&v8, &location);
  v5 = (void *)[v4 initWithSectionProvider:v7 configuration:v3];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

id __40__PRComplicationGalleryView__makeLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4FB1338];
  v5 = [MEMORY[0x1E4FB1308] estimatedDimension:60.0];
  v6 = [MEMORY[0x1E4FB1308] estimatedDimension:60.0];
  id v7 = [v4 sizeWithWidthDimension:v5 heightDimension:v6];

  id v8 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v7];
  [MEMORY[0x1E4F5E4A8] containerEdgeInset];
  double v10 = v9;
  v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 scale];
  double v13 = v12;

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15 = [WeakRetained delegate];
  uint64_t v16 = [v15 layoutStyleForSectionIndex:a2];

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E4FB1338];
    v18 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v19 = [MEMORY[0x1E4FB1308] estimatedDimension:60.0];
    v20 = [v17 sizeWithWidthDimension:v18 heightDimension:v19];

    v21 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v20];
    v22 = (void *)MEMORY[0x1E4FB1338];
    v23 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v24 = [MEMORY[0x1E4FB1308] estimatedDimension:60.0];
    v25 = [v22 sizeWithWidthDimension:v23 heightDimension:v24];

    v26 = (void *)MEMORY[0x1E4FB1318];
    v38 = v21;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
    v28 = [v26 verticalGroupWithLayoutSize:v25 subitems:v27];

    v29 = [MEMORY[0x1E4FB1340] flexibleSpacing:0.0];
    [v28 setInterItemSpacing:v29];

    v30 = [MEMORY[0x1E4FB1330] sectionWithGroup:v28];
    [v30 setInterGroupSpacing:0.0];
    [v30 setOrthogonalScrollingBehavior:0];
    objc_msgSend(v30, "setContentInsets:", 0.0, 0.0, 24.0, 0.0);
  }
  else
  {
    v31 = (void *)MEMORY[0x1E4FB1338];
    v32 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v33 = [MEMORY[0x1E4FB1308] estimatedDimension:60.0];
    v20 = [v31 sizeWithWidthDimension:v32 heightDimension:v33];

    v34 = (void *)MEMORY[0x1E4FB1318];
    v39[0] = v8;
    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    v21 = [v34 horizontalGroupWithLayoutSize:v20 subitems:v35];

    [MEMORY[0x1E4F5E4A8] interComplicationSpacingExcludingInnerInset];
    v36 = objc_msgSend(MEMORY[0x1E4FB1340], "fixedSpacing:");
    [v21 setInterItemSpacing:v36];

    v30 = [MEMORY[0x1E4FB1330] sectionWithGroup:v21];
    [v30 setInterGroupSpacing:16.0];
    [v30 setOrthogonalScrollingBehavior:0];
    objc_msgSend(v30, "setContentInsets:", 0.0, v10 - 1.0 / v13, 12.0, v10 - 1.0 / v13);
  }

  return v30;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (PRComplicationGalleryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRComplicationGalleryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end