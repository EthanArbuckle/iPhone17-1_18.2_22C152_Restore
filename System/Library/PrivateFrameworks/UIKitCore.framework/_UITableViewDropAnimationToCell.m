@interface _UITableViewDropAnimationToCell
- (UIDragPreviewParameters)previewParameters;
- (UITableViewCell)cell;
- (_UITableViewDropAnimationToCell)initWithDragItem:(id)a3 cell:(id)a4 previewParameters:(id)a5;
- (void)setCell:(id)a3;
- (void)setPreviewParameters:(id)a3;
@end

@implementation _UITableViewDropAnimationToCell

- (_UITableViewDropAnimationToCell)initWithDragItem:(id)a3 cell:(id)a4 previewParameters:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_UITableViewDropAnimationToCell;
  v10 = [(_UITableViewDropAnimation *)&v13 initWithDragItem:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_cell, v8);
    objc_storeStrong((id *)&v11->_previewParameters, a5);
  }

  return v11;
}

- (UITableViewCell)cell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  return (UITableViewCell *)WeakRetained;
}

- (void)setCell:(id)a3
{
}

- (UIDragPreviewParameters)previewParameters
{
  return self->_previewParameters;
}

- (void)setPreviewParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewParameters, 0);
  objc_destroyWeak((id *)&self->_cell);
}

@end