@interface NotesQuickLookActivityItem
- (NSArray)previewItems;
- (NotesQuickLookActivityItemDelegate)delegate;
- (unint64_t)firstItemIndex;
- (void)setDelegate:(id)a3;
- (void)setFirstItemIndex:(unint64_t)a3;
- (void)setPreviewItems:(id)a3;
@end

@implementation NotesQuickLookActivityItem

- (NSArray)previewItems
{
  return self->_previewItems;
}

- (void)setPreviewItems:(id)a3
{
}

- (unint64_t)firstItemIndex
{
  return self->_firstItemIndex;
}

- (void)setFirstItemIndex:(unint64_t)a3
{
  self->_firstItemIndex = a3;
}

- (NotesQuickLookActivityItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NotesQuickLookActivityItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_previewItems, 0);
}

@end