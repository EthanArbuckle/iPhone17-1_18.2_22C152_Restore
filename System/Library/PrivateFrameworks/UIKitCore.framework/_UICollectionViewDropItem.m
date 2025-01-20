@interface _UICollectionViewDropItem
- (CGSize)previewSize;
- (NSIndexPath)sourceIndexPath;
- (NSString)description;
- (UIDragItem)dragItem;
- (_UICollectionViewDropItem)initWithDragItem:(id)a3 previewSize:(CGSize)a4 sourceIndexPath:(id)a5;
- (void)setDragItem:(id)a3;
- (void)setPreviewSize:(CGSize)a3;
- (void)setSourceIndexPath:(id)a3;
@end

@implementation _UICollectionViewDropItem

- (_UICollectionViewDropItem)initWithDragItem:(id)a3 previewSize:(CGSize)a4 sourceIndexPath:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UICollectionViewDropItem;
  v12 = [(_UICollectionViewDropItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dragItem, a3);
    v13->_previewSize.CGFloat width = width;
    v13->_previewSize.CGFloat height = height;
    objc_storeStrong((id *)&v13->_sourceIndexPath, a5);
  }

  return v13;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = NSStringFromCGSize(self->_previewSize);
  v7 = __UICVIndexPathDescription(self->_sourceIndexPath);
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p previewSize = %@; sourceIndexPath = %@; dragItem = %@>",
    v5,
    self,
    v6,
    v7,
  v8 = self->_dragItem);

  return (NSString *)v8;
}

- (UIDragItem)dragItem
{
  return self->_dragItem;
}

- (void)setDragItem:(id)a3
{
}

- (CGSize)previewSize
{
  double width = self->_previewSize.width;
  double height = self->_previewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviewSize:(CGSize)a3
{
  self->_previewSize = a3;
}

- (NSIndexPath)sourceIndexPath
{
  return self->_sourceIndexPath;
}

- (void)setSourceIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIndexPath, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
}

@end