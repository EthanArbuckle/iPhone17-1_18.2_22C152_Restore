@interface UICollectionViewReorderedItem
- (BOOL)isNOOP;
- (BOOL)isUncommitted;
- (NSIndexPath)lastCommittedIndexPath;
- (NSIndexPath)originalIndexPath;
- (NSIndexPath)targetIndexPath;
- (UICollectionViewCell)cell;
- (UICollectionViewReorderedItem)initWithCell:(id)a3 indexPath:(id)a4;
- (id)description;
- (id)expectedCellIndexPath;
- (void)commitTargetIndexPath;
- (void)setOriginalIndexPath:(id)a3;
- (void)setTargetIndexPath:(id)a3;
@end

@implementation UICollectionViewReorderedItem

- (UICollectionViewReorderedItem)initWithCell:(id)a3 indexPath:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewReorderedItem;
  v8 = [(UICollectionViewReorderedItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cell, a3);
    objc_storeStrong((id *)&v9->_originalIndexPath, a4);
    objc_storeStrong((id *)&v9->_lastCommittedIndexPath, a4);
    objc_storeStrong((id *)&v9->_targetIndexPath, a4);
  }

  return v9;
}

- (id)expectedCellIndexPath
{
  if ([(UICollectionViewReorderedItem *)self isUncommitted]) {
    [(UICollectionViewReorderedItem *)self lastCommittedIndexPath];
  }
  else {
  v3 = [(UICollectionViewReorderedItem *)self targetIndexPath];
  }
  return v3;
}

- (void)setTargetIndexPath:(id)a3
{
  id v4 = a3;
  targetIndexPath = self->_targetIndexPath;
  v6 = (NSIndexPath *)v4;
  id v7 = targetIndexPath;
  if (v7 == v6)
  {

    goto LABEL_9;
  }
  v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_8;
  }
  char v9 = [(NSIndexPath *)v6 isEqual:v7];

  if ((v9 & 1) == 0) {
LABEL_8:
  }
    self->_isUncommitted = 1;
LABEL_9:
  v10 = self->_targetIndexPath;
  self->_targetIndexPath = v6;
}

- (void)commitTargetIndexPath
{
  v3 = [(UICollectionViewReorderedItem *)self targetIndexPath];
  lastCommittedIndexPath = self->_lastCommittedIndexPath;
  self->_lastCommittedIndexPath = v3;

  self->_isUncommitted = 0;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  cell = self->_cell;
  id v7 = [(NSIndexPath *)self->_originalIndexPath _ui_shortDescription];
  v8 = [(NSIndexPath *)self->_targetIndexPath _ui_shortDescription];
  char v9 = [(NSIndexPath *)self->_lastCommittedIndexPath _ui_shortDescription];
  v10 = [NSNumber numberWithBool:self->_isUncommitted];
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p: cell== %p; %@ -> %@; lastCommittedIndexPath: %@; isUncomitted: %@>",
    v5,
    self,
    cell,
    v7,
    v8,
    v9,
  objc_super v11 = v10);

  return v11;
}

- (BOOL)isNOOP
{
  return [(NSIndexPath *)self->_originalIndexPath isEqual:self->_targetIndexPath];
}

- (UICollectionViewCell)cell
{
  return self->_cell;
}

- (NSIndexPath)originalIndexPath
{
  return self->_originalIndexPath;
}

- (void)setOriginalIndexPath:(id)a3
{
}

- (NSIndexPath)targetIndexPath
{
  return self->_targetIndexPath;
}

- (NSIndexPath)lastCommittedIndexPath
{
  return self->_lastCommittedIndexPath;
}

- (BOOL)isUncommitted
{
  return self->_isUncommitted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCommittedIndexPath, 0);
  objc_storeStrong((id *)&self->_targetIndexPath, 0);
  objc_storeStrong((id *)&self->_originalIndexPath, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end