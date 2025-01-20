@interface CRLiOSInspectorTableCellImageButton
- (CRLiOSInspectorTableViewCell)parentCell;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setParentCell:(id)a3;
@end

@implementation CRLiOSInspectorTableCellImageButton

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSInspectorTableCellImageButton;
  [(CRLiOSInspectorTableCellImageButton *)&v6 setImage:a3 forState:a4];
  v5 = [(CRLiOSInspectorTableCellImageButton *)self parentCell];
  [v5 p_imageDidChange];
}

- (CRLiOSInspectorTableViewCell)parentCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentCell);

  return (CRLiOSInspectorTableViewCell *)WeakRetained;
}

- (void)setParentCell:(id)a3
{
}

- (void).cxx_destruct
{
}

@end