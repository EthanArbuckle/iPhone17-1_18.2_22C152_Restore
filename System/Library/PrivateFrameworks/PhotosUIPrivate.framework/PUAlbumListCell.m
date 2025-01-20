@interface PUAlbumListCell
- (PUAlbumListCell)initWithFrame:(CGRect)a3;
- (PUAlbumListCellContentView)albumListCellContentView;
- (id)focusEffect;
- (id)snapshotViewAfterScreenUpdates:(BOOL)a3;
- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4;
- (void)setBackgroundCornerRadius:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4;
@end

@implementation PUAlbumListCell

- (id)focusEffect
{
  v3 = [(PUAlbumListCell *)self albumListCellContentView];
  v4 = [v3 focusInfo];
  v5 = [v4 makeHaloEffectForSourceView:self];

  return v5;
}

- (id)snapshotViewAfterScreenUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(PUAlbumListCell *)self albumListCellContentView];
  uint64_t v6 = [v5 showsDeleteButtonWhenEditing];
  [v5 setShowsDeleteButtonWhenEditing:0];
  v9.receiver = self;
  v9.super_class = (Class)PUAlbumListCell;
  v7 = [(PUAlbumListCell *)&v9 snapshotViewAfterScreenUpdates:v3];
  [v5 setShowsDeleteButtonWhenEditing:v6];

  return v7;
}

- (void)setBackgroundCornerRadius:(double)a3
{
  v5 = [(PUAlbumListCell *)self backgroundConfiguration];
  [v5 cornerRadius];
  double v7 = v6;

  if (v7 != a3)
  {
    id v8 = [MEMORY[0x1E4FB1498] clearConfiguration];
    [v8 setCornerRadius:a3];
    [(PUAlbumListCell *)self setBackgroundConfiguration:v8];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PUAlbumListCell *)self isHighlighted];
  v7.receiver = self;
  v7.super_class = (Class)PUAlbumListCell;
  [(PUAlbumListCell *)&v7 setHighlighted:v3];
  if (v5 != [(PUAlbumListCell *)self isHighlighted])
  {
    double v6 = [(PUAlbumListCell *)self albumListCellContentView];
    [v6 setHighlighted:v3];
  }
}

- (void)didTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__PUAlbumListCell_didTransitionFromLayout_toLayout___block_invoke;
    v7[3] = &unk_1E5F2ED10;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:0.3];
  }
}

void __52__PUAlbumListCell_didTransitionFromLayout_toLayout___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) albumListCellContentView];
  [v1 setShowsTitle:1 animated:1];
}

- (void)willTransitionFromLayout:(id)a3 toLayout:(id)a4
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __53__PUAlbumListCell_willTransitionFromLayout_toLayout___block_invoke;
    v8[3] = &unk_1E5F2ED10;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:0.1];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__PUAlbumListCell_willTransitionFromLayout_toLayout___block_invoke_2;
    v7[3] = &unk_1E5F2ED10;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
  }
}

void __53__PUAlbumListCell_willTransitionFromLayout_toLayout___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) albumListCellContentView];
  [v1 setShowsTitle:0 animated:1];
}

void __53__PUAlbumListCell_willTransitionFromLayout_toLayout___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) albumListCellContentView];
  [v1 setShowsTitle:0 animated:0];
}

- (PUAlbumListCellContentView)albumListCellContentView
{
  return (PUAlbumListCellContentView *)[(PUAlbumListCell *)self viewWithTag:236897];
}

- (PUAlbumListCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUAlbumListCell;
  BOOL v3 = -[PUAlbumListCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    id v5 = [(PUAlbumListCell *)v3 contentView];
    double v6 = [PUAlbumListCellContentView alloc];
    [v5 bounds];
    objc_super v7 = -[PUAlbumListCellContentView initWithFrame:](v6, "initWithFrame:");
    [(PUAlbumListCellContentView *)v7 setTag:236897];
    [(PUAlbumListCellContentView *)v7 setAutoresizingMask:18];
    [(PUAlbumListCellContentView *)v7 setTopInsetEnabled:1];
    [v5 addSubview:v7];
  }
  return v4;
}

@end