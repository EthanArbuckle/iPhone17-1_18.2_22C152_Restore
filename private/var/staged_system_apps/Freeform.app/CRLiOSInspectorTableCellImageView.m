@interface CRLiOSInspectorTableCellImageView
- (BOOL)accessibilityIgnoresInvertColors;
- (CRLiOSInspectorTableViewCell)parentCell;
- (void)setContentMode:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setParentCell:(id)a3;
@end

@implementation CRLiOSInspectorTableCellImageView

- (void)setImage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInspectorTableCellImageView;
  [(CRLiOSInspectorTableCellImageView *)&v5 setImage:a3];
  v4 = [(CRLiOSInspectorTableCellImageView *)self parentCell];
  [v4 p_imageDidChange];
}

- (void)setContentMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLiOSInspectorTableCellImageView;
  [(CRLiOSInspectorTableCellImageView *)&v5 setContentMode:a3];
  v4 = [(CRLiOSInspectorTableCellImageView *)self parentCell];
  [v4 p_imageDidChange];
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 0;
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