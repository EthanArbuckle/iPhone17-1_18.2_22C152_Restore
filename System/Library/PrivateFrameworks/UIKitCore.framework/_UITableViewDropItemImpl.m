@interface _UITableViewDropItemImpl
- (CGSize)previewSize;
- (NSIndexPath)_translatedSourceIndexPath;
- (NSIndexPath)sourceIndexPath;
- (UIDragItem)dragItem;
- (_UITableViewDropItemImpl)initWithDragItem:(id)a3 sourceIndexPath:(id)a4;
- (void)_setTranslatedSourceIndexPath:(id)a3;
- (void)_translateSourceIndexPath:(id)a3;
- (void)setDragItem:(id)a3;
- (void)setSourceIndexPath:(id)a3;
@end

@implementation _UITableViewDropItemImpl

- (_UITableViewDropItemImpl)initWithDragItem:(id)a3 sourceIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UITableViewDropItemImpl;
  v9 = [(_UITableViewDropItemImpl *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dragItem, a3);
    objc_storeStrong((id *)&v10->_sourceIndexPath, a4);
  }

  return v10;
}

- (NSIndexPath)sourceIndexPath
{
  translatedSourceIndexPath = self->_translatedSourceIndexPath;
  if (!translatedSourceIndexPath) {
    translatedSourceIndexPath = self->_sourceIndexPath;
  }
  return translatedSourceIndexPath;
}

- (CGSize)previewSize
{
  v2 = [(_UITableViewDropItemImpl *)self dragItem];
  [v2 _visibleDropItemSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_translateSourceIndexPath:(id)a3
{
  (*((void (**)(id, NSIndexPath *))a3 + 2))(a3, self->_sourceIndexPath);
  double v4 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  translatedSourceIndexPath = self->_translatedSourceIndexPath;
  self->_translatedSourceIndexPath = v4;
}

- (UIDragItem)dragItem
{
  return self->_dragItem;
}

- (void)setDragItem:(id)a3
{
}

- (void)setSourceIndexPath:(id)a3
{
}

- (NSIndexPath)_translatedSourceIndexPath
{
  return self->_translatedSourceIndexPath;
}

- (void)_setTranslatedSourceIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translatedSourceIndexPath, 0);
  objc_storeStrong((id *)&self->_sourceIndexPath, 0);
  objc_storeStrong((id *)&self->_dragItem, 0);
}

@end