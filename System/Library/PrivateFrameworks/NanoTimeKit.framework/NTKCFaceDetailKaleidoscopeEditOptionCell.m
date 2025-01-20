@interface NTKCFaceDetailKaleidoscopeEditOptionCell
- (NTKCFaceDetailKaleidoscopeEditOptionCellDelegate)delegate;
- (int64_t)userOptionIndex;
- (void)_setupFromCollection;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)selectUserOption;
- (void)setDelegate:(id)a3;
- (void)setUserOptionIndex:(int64_t)a3;
@end

@implementation NTKCFaceDetailKaleidoscopeEditOptionCell

- (void)_setupFromCollection
{
  [(NTKCFaceDetailKaleidoscopeEditOptionCell *)self setUserOptionIndex:0x7FFFFFFFFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)NTKCFaceDetailKaleidoscopeEditOptionCell;
  [(NTKCFaceDetailEditOptionCell *)&v3 _setupFromCollection];
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKCFaceDetailKaleidoscopeEditOptionCell;
  id v9 = a5;
  [(NTKCFaceDetailEditOptionCell *)&v11 collectionView:a3 willDisplayCell:v8 forItemAtIndexPath:v9];
  uint64_t v10 = objc_msgSend(v9, "row", v11.receiver, v11.super_class);

  if (v10 == self->_userOptionIndex) {
    [v8 setActive:0 animated:0];
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 row] == self->_userOptionIndex)
  {
    id v8 = [(NTKCFaceDetailKaleidoscopeEditOptionCell *)self delegate];
    [v8 kaleidoscopeEditOptionCellDidSelectUserOption:self];

    [(NTKCFaceDetailEditOptionCell *)self _ensureIndexPathVisible:v7 animated:1];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NTKCFaceDetailKaleidoscopeEditOptionCell;
    [(NTKCFaceDetailEditOptionCell *)&v9 collectionView:v6 didSelectItemAtIndexPath:v7];
  }
}

- (void)setUserOptionIndex:(int64_t)a3
{
  if (self->_userOptionIndex != a3)
  {
    self->_userOptionIndex = a3;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = [(NTKCFaceDetailEditOptionCell *)self collectionView];
      v5 = [(NTKCFaceDetailEditOptionCell *)self _indexPathForEditOptionIndex:self->_userOptionIndex];
      id v6 = [v4 cellForItemAtIndexPath:v5];

      [v6 setActive:0 animated:0];
    }
  }
}

- (void)selectUserOption
{
  objc_super v3 = [MEMORY[0x1E4F19A30] currentDevice];
  v4 = +[NTKKaleidoscopeAssetOption optionWithAsset:1000 forDevice:v3];

  v5 = [(NTKCFaceDetailEditOptionCell *)self collection];
  id v6 = [v5 options];
  uint64_t v7 = [v6 indexOfObject:v4];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [(NTKCFaceDetailEditOptionCell *)self _indexPathForEditOptionIndex:v7];
    objc_super v9 = [(NTKCFaceDetailEditOptionCell *)self collectionView];
    uint64_t v10 = [v9 indexPathsForVisibleItems];
    int v11 = [v10 containsObject:v8];

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E4FB1EB0];
      uint64_t v14 = MEMORY[0x1E4F143A8];
      uint64_t v15 = 3221225472;
      v16 = __60__NTKCFaceDetailKaleidoscopeEditOptionCell_selectUserOption__block_invoke;
      v17 = &unk_1E62C09C0;
      v18 = self;
      id v19 = v8;
      [v12 performWithoutAnimation:&v14];
    }
    v13 = [(NTKCFaceDetailEditOptionCell *)self collectionView];
    [(NTKCFaceDetailKaleidoscopeEditOptionCell *)self collectionView:v13 didSelectItemAtIndexPath:v8];
  }
}

void __60__NTKCFaceDetailKaleidoscopeEditOptionCell_selectUserOption__block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) collectionView];
  v4[0] = *(void *)(a1 + 40);
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 reloadItemsAtIndexPaths:v3];
}

- (NTKCFaceDetailKaleidoscopeEditOptionCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (NTKCFaceDetailKaleidoscopeEditOptionCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)userOptionIndex
{
  return self->_userOptionIndex;
}

- (void).cxx_destruct
{
}

@end