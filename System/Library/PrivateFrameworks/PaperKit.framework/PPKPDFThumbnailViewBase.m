@interface PPKPDFThumbnailViewBase
- (BOOL)allowsPageReordering;
- (BOOL)largeThumbnails;
- (CGSize)thumbnailSize;
- (NSArray)selectedPages;
- (PDFView)PDFView;
- (PPKPDFThumbnailContextMenuDelegate)thumbnailContextMenuDelegate;
- (PPKPDFThumbnailDataSourceDelegate)thumbnailDataSourceDelegate;
- (PPKPDFThumbnailViewBase)init;
- (PPKPDFThumbnailViewBase)initWithFrame:(CGRect)a3;
- (UICollectionView)collectionView;
- (UIColor)backgroundColor;
- (UIEdgeInsets)contentInset;
- (int64_t)layoutMode;
- (void)_commonInit;
- (void)_updateLayout;
- (void)currentPageChanged:(id)a3;
- (void)documentChanged:(id)a3;
- (void)documentMutated:(id)a3;
- (void)documentUnlocked:(id)a3;
- (void)pageChanged:(id)a3;
- (void)reloadPageAt:(int64_t)a3;
- (void)setAllowsPageReordering:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setLargeThumbnails:(BOOL)a3;
- (void)setLayoutMode:(int64_t)a3;
- (void)setPDFView:(id)a3;
- (void)setThumbnailContextMenuDelegate:(id)a3;
- (void)setThumbnailDataSourceDelegate:(id)a3;
- (void)setThumbnailSize:(CGSize)a3;
- (void)setupNotifications;
- (void)updateNotificationsForDocument;
@end

@implementation PPKPDFThumbnailViewBase

- (PPKPDFThumbnailViewBase)init
{
  v5.receiver = self;
  v5.super_class = (Class)PPKPDFThumbnailViewBase;
  v2 = [(PPKPDFThumbnailViewBase *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PPKPDFThumbnailViewBase *)v2 _commonInit];
  }
  return v3;
}

- (PPKPDFThumbnailViewBase)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PPKPDFThumbnailViewBase;
  v3 = -[PPKPDFThumbnailViewBase initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(PPKPDFThumbnailViewBase *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v20[4] = *MEMORY[0x263EF8340];
  if (!self->_iconsView)
  {
    self->_thumbnailSize = (CGSize)kDefaultThumbnailSize;
    long long v3 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    *(_OWORD *)&self->_contentInset.top = *MEMORY[0x263F834E8];
    *(_OWORD *)&self->_contentInset.bottom = v3;
    v4 = (PPKPDFThumbnailsCollectionViewBase *)[objc_alloc(NSClassFromString(&cfstr_Ppkpdfthumbnai.isa)) initFromThumbnailView:self];
    iconsView = self->_iconsView;
    self->_iconsView = v4;

    [(PPKPDFThumbnailViewBase *)self addSubview:self->_iconsView];
    [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = (void *)MEMORY[0x263F08938];
    v19 = [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView bottomAnchor];
    v18 = [(PPKPDFThumbnailViewBase *)self bottomAnchor];
    v17 = [v19 constraintEqualToAnchor:v18];
    v20[0] = v17;
    v16 = [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView topAnchor];
    objc_super v6 = [(PPKPDFThumbnailViewBase *)self topAnchor];
    v7 = [v16 constraintEqualToAnchor:v6];
    v20[1] = v7;
    v8 = [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView leadingAnchor];
    v9 = [(PPKPDFThumbnailViewBase *)self leadingAnchor];
    v10 = [v8 constraintEqualToAnchor:v9];
    v20[2] = v10;
    v11 = [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView trailingAnchor];
    v12 = [(PPKPDFThumbnailViewBase *)self trailingAnchor];
    v13 = [v11 constraintEqualToAnchor:v12];
    v20[3] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:4];
    [v15 activateConstraints:v14];

    [(PPKPDFThumbnailViewBase *)self setupNotifications];
  }
}

- (void)setupNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_documentChanged_ name:*MEMORY[0x263F148C0] object:0];
  [v3 addObserver:self selector:sel_currentPageChanged_ name:*MEMORY[0x263F148C8] object:0];
  [(PPKPDFThumbnailViewBase *)self updateNotificationsForDocument];
}

- (void)updateNotificationsForDocument
{
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  v4 = [WeakRetained document];

  uint64_t v5 = *MEMORY[0x263F14870];
  [v6 removeObserver:self name:*MEMORY[0x263F14870] object:0];
  [v6 removeObserver:self name:@"PDFDocumentDidMutate" object:0];
  [v6 removeObserver:self name:@"PDFPageDidChangeBounds" object:0];
  [v6 removeObserver:self name:@"PDFPageDidRotate" object:0];
  if (v4)
  {
    [v6 addObserver:self selector:sel_documentUnlocked_ name:v5 object:v4];
    [v6 addObserver:self selector:sel_documentMutated_ name:@"PDFDocumentDidMutate" object:v4];
    [v6 addObserver:self selector:sel_pageChanged_ name:@"PDFPageDidChangeBounds" object:v4];
    [v6 addObserver:self selector:sel_pageChanged_ name:@"PDFPageDidRotate" object:v4];
  }
}

- (void)setPDFView:(id)a3
{
  objc_storeWeak((id *)&self->_pdfView, a3);
  [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView updateIconsImages];
  [(PPKPDFThumbnailViewBase *)self _updateLayout];
  [(PPKPDFThumbnailViewBase *)self updateNotificationsForDocument];
}

- (PDFView)PDFView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  return (PDFView *)WeakRetained;
}

- (void)setBackgroundColor:(id)a3
{
  v4 = (UIColor *)[a3 copy];
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v4;

  iconsView = self->_iconsView;
  v7 = self->_backgroundColor;
  [(PPKPDFThumbnailsCollectionViewBase *)iconsView setBackgroundColor:v7];
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSArray)selectedPages
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView currentPage];
  id v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)setThumbnailSize:(CGSize)a3
{
  self->_thumbnailSize = a3;
  [(PPKPDFThumbnailViewBase *)self _updateLayout];
  id v4 = [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView collectionView];
  [v4 reloadData];
}

- (CGSize)thumbnailSize
{
  double width = self->_thumbnailSize.width;
  double height = self->_thumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAllowsPageReordering:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    iconsView = self->_iconsView;
    [(PPKPDFThumbnailsCollectionViewBase *)iconsView setAllowsPageReordering:v3];
  }
}

- (BOOL)allowsPageReordering
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  iconsView = self->_iconsView;
  return [(PPKPDFThumbnailsCollectionViewBase *)iconsView allowsPageReordering];
}

- (void)setLargeThumbnails:(BOOL)a3
{
}

- (BOOL)largeThumbnails
{
  return [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView largeThumbnails];
}

- (void)setLayoutMode:(int64_t)a3
{
  self->_layoutMode = a3;
  [(PPKPDFThumbnailViewBase *)self _updateLayout];
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (UICollectionView)collectionView
{
  return [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView collectionView];
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  [(PPKPDFThumbnailViewBase *)self _updateLayout];
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_updateLayout
{
}

- (void)documentChanged:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  id v5 = [v6 object];

  if (WeakRetained == v5)
  {
    [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView documentChanged:v6];
    [(PPKPDFThumbnailViewBase *)self updateNotificationsForDocument];
  }
}

- (void)documentUnlocked:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  id v5 = [WeakRetained document];
  id v6 = [v7 object];

  if (v5 == v6) {
    [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView documentChanged:v7];
  }
}

- (void)documentMutated:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  id v5 = [WeakRetained document];
  id v6 = [v7 object];

  if (v5 == v6) {
    [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView documentMutated:v7];
  }
}

- (void)currentPageChanged:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  id v5 = [v6 object];

  if (WeakRetained == v5) {
    [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView currentPageChanged:v6];
  }
}

- (void)pageChanged:(id)a3
{
  id v14 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pdfView);
  id v5 = [WeakRetained document];
  if (!v5) {
    goto LABEL_10;
  }
  id v6 = [v14 name];
  if ([v6 isEqualToString:@"PDFPageDidChangeBounds"])
  {

    goto LABEL_5;
  }
  id v7 = [v14 name];
  int v8 = [v7 isEqualToString:@"PDFPageDidRotate"];

  if (v8)
  {
LABEL_5:
    v9 = [v14 object];

    if (v9 != v5) {
      goto LABEL_10;
    }
  }
  v10 = [v14 userInfo];
  v11 = [v10 objectForKey:@"page"];
  v12 = v11;
  if (v11)
  {
    v13 = [v11 document];

    if (v13 == v5) {
      [(PPKPDFThumbnailsCollectionViewBase *)self->_iconsView pageChanged:v14];
    }
  }

LABEL_10:
}

- (void)reloadPageAt:(int64_t)a3
{
}

- (PPKPDFThumbnailContextMenuDelegate)thumbnailContextMenuDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->thumbnailContextMenuDelegate);
  return (PPKPDFThumbnailContextMenuDelegate *)WeakRetained;
}

- (void)setThumbnailContextMenuDelegate:(id)a3
{
}

- (PPKPDFThumbnailDataSourceDelegate)thumbnailDataSourceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailDataSourceDelegate);
  return (PPKPDFThumbnailDataSourceDelegate *)WeakRetained;
}

- (void)setThumbnailDataSourceDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_thumbnailDataSourceDelegate);
  objc_destroyWeak((id *)&self->thumbnailContextMenuDelegate);
  objc_storeStrong((id *)&self->_iconsView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_destroyWeak((id *)&self->_pdfView);
}

@end