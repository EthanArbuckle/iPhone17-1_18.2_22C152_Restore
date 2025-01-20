@interface PRInlineComplicationGalleryView
- (PRInlineComplicationGalleryView)initWithFrame:(CGRect)a3;
- (PRInlineComplicationGalleryViewDelegate)delegate;
- (UICollectionView)collectionView;
- (id)_makeLayout;
- (void)setDelegate:(id)a3;
@end

@implementation PRInlineComplicationGalleryView

- (PRInlineComplicationGalleryView)initWithFrame:(CGRect)a3
{
  v42[8] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)PRInlineComplicationGalleryView;
  v3 = -[PRInlineComplicationGalleryView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1F00]);
    v5 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
    v6 = (void *)[v4 initWithEffect:v5];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRInlineComplicationGalleryView *)v3 addSubview:v6];
    id v7 = objc_alloc(MEMORY[0x1E4FB1568]);
    v8 = [(PRInlineComplicationGalleryView *)v3 _makeLayout];
    uint64_t v9 = objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v8, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    collectionView = v3->_collectionView;
    v3->_collectionView = (UICollectionView *)v9;

    [(UICollectionView *)v3->_collectionView setDelegate:v3];
    v11 = v3->_collectionView;
    v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(UICollectionView *)v11 setBackgroundColor:v12];

    [(UICollectionView *)v3->_collectionView setShowsVerticalScrollIndicator:0];
    [(UICollectionView *)v3->_collectionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRInlineComplicationGalleryView *)v3 addSubview:v3->_collectionView];
    v29 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [v6 leadingAnchor];
    v39 = [(PRInlineComplicationGalleryView *)v3 leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v42[0] = v38;
    v37 = [v6 trailingAnchor];
    v36 = [(PRInlineComplicationGalleryView *)v3 trailingAnchor];
    v34 = [v37 constraintEqualToAnchor:v36];
    v35 = v6;
    v42[1] = v34;
    v33 = [v6 topAnchor];
    v32 = [(PRInlineComplicationGalleryView *)v3 topAnchor];
    v31 = [v33 constraintEqualToAnchor:v32];
    v42[2] = v31;
    v30 = [v6 bottomAnchor];
    v28 = [(PRInlineComplicationGalleryView *)v3 bottomAnchor];
    v27 = [v30 constraintEqualToAnchor:v28];
    v42[3] = v27;
    v26 = [(UICollectionView *)v3->_collectionView leadingAnchor];
    v25 = [(PRInlineComplicationGalleryView *)v3 leadingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25];
    v42[4] = v24;
    v23 = [(UICollectionView *)v3->_collectionView trailingAnchor];
    v13 = [(PRInlineComplicationGalleryView *)v3 trailingAnchor];
    v14 = [v23 constraintEqualToAnchor:v13];
    v42[5] = v14;
    v15 = [(UICollectionView *)v3->_collectionView topAnchor];
    v16 = [(PRInlineComplicationGalleryView *)v3 topAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v42[6] = v17;
    v18 = [(UICollectionView *)v3->_collectionView bottomAnchor];
    v19 = [(PRInlineComplicationGalleryView *)v3 bottomAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v42[7] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:8];
    [v29 activateConstraints:v21];
  }
  return v3;
}

- (id)_makeLayout
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1588]);
  [v2 setInterSectionSpacing:20.0];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1558]) initWithAppearance:2];
  id v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setShowsSeparators:1];
  id v5 = objc_alloc(MEMORY[0x1E4FB1580]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__PRInlineComplicationGalleryView__makeLayout__block_invoke;
  v9[3] = &unk_1E54DBE68;
  id v10 = v3;
  id v6 = v3;
  id v7 = (void *)[v5 initWithSectionProvider:v9 configuration:v2];

  return v7;
}

id __46__PRInlineComplicationGalleryView__makeLayout__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB1330] sectionWithListConfiguration:*(void *)(a1 + 32) layoutEnvironment:a3];
  objc_msgSend(v3, "setContentInsets:", 0.0, 16.0, 0.0, 16.0);
  id v4 = (void *)MEMORY[0x1E4FB1338];
  id v5 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  id v6 = [MEMORY[0x1E4FB1308] estimatedDimension:44.0];
  id v7 = [v4 sizeWithWidthDimension:v5 heightDimension:v6];

  v8 = objc_msgSend(MEMORY[0x1E4FB12F8], "boundarySupplementaryItemWithLayoutSize:elementKind:alignment:absoluteOffset:", v7, @"PRInlineComplicationGalleryTitleElementKind", 1, 0.0, -8.0);
  v11[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [v3 setBoundarySupplementaryItems:v9];

  return v3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (PRInlineComplicationGalleryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRInlineComplicationGalleryViewDelegate *)WeakRetained;
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