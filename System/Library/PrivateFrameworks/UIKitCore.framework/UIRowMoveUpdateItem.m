@interface UIRowMoveUpdateItem
- (id)_moveDestinationDescription;
- (id)collectionViewUpdateItem;
- (id)initWithOldIndexPath:(void *)a3 newIndexPath:;
- (id)newIndexPath;
@end

@implementation UIRowMoveUpdateItem

- (id)initWithOldIndexPath:(void *)a3 newIndexPath:
{
  id v6 = a3;
  if (a1)
  {
    id v7 = a2;
    _UIAssertValidUpdateIndexPath(v7);
    _UIAssertValidUpdateIndexPath(v6);
    a1 = -[UIUpdateItem initWithAction:forIndexPath:animation:](a1, 3, v7, (void *)5);

    if (a1) {
      objc_storeStrong(a1 + 5, a3);
    }
  }

  return a1;
}

- (id)collectionViewUpdateItem
{
  if (self)
  {
    unsigned int action = self->super._action;
    if (action >= 4) {
      uint64_t v4 = 4;
    }
    else {
      uint64_t v4 = action;
    }
    v5 = [UICollectionViewUpdateItem alloc];
    indexPath = self->super._indexPath;
  }
  else
  {
    v5 = [UICollectionViewUpdateItem alloc];
    uint64_t v4 = 0;
    indexPath = 0;
  }
  id v7 = indexPath;
  v8 = -[UIRowMoveUpdateItem newIndexPath]((id *)&self->super.super.isa);
  v9 = [(UICollectionViewUpdateItem *)v5 initWithInitialIndexPath:v7 finalIndexPath:v8 updateAction:v4];

  return v9;
}

- (id)newIndexPath
{
  if (a1)
  {
    a1 = (id *)a1[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_moveDestinationDescription
{
  if (self && (*(unsigned char *)&self->super._updateItemFlags & 1) != 0)
  {
    uint64_t v4 = NSString;
    v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSIndexPath section](self->_newIndexPath, "section"));
    [v4 stringWithFormat:@"->(%@)", v3];
  }
  else
  {
    v2 = NSString;
    v3 = [(NSIndexPath *)self->_newIndexPath _ui_shortDescription];
    [v2 stringWithFormat:@"->%@", v3];
  v5 = };

  return v5;
}

- (void).cxx_destruct
{
}

@end