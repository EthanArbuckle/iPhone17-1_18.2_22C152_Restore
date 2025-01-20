@interface PUTilingViewUpdateItem
- (NSIndexPath)indexPathAfterUpdate;
- (NSIndexPath)indexPathBeforeUpdate;
- (PUTilingDataSource)dataSource;
- (PUTilingViewUpdateItem)initWithAction:(int64_t)a3 indexPathBeforeUpdate:(id)a4 indexPathAfterUpdate:(id)a5 dataSource:(id)a6;
- (id)transformedIndexPath:(id)a3 withDataSource:(id)a4;
- (int64_t)action;
@end

@implementation PUTilingViewUpdateItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_indexPathAfterUpdate, 0);
  objc_storeStrong((id *)&self->_indexPathBeforeUpdate, 0);
}

- (PUTilingDataSource)dataSource
{
  return self->_dataSource;
}

- (NSIndexPath)indexPathAfterUpdate
{
  return self->_indexPathAfterUpdate;
}

- (NSIndexPath)indexPathBeforeUpdate
{
  return self->_indexPathBeforeUpdate;
}

- (int64_t)action
{
  return self->_action;
}

- (id)transformedIndexPath:(id)a3 withDataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(PUTilingViewUpdateItem *)self dataSource];
  int v10 = [v8 isEqual:v9];

  v11 = v7;
  if (v10)
  {
    v11 = v7;
    switch([(PUTilingViewUpdateItem *)self action])
    {
      case 0:
        v12 = [MEMORY[0x1E4F28B00] currentHandler];
        [v12 handleFailureInMethod:a2 object:self file:@"PUTilingViewUpdateItem.m" lineNumber:48 description:@"undefined action"];
        v11 = v7;
        goto LABEL_9;
      case 1:
        v12 = [(PUTilingViewUpdateItem *)self indexPathAfterUpdate];
        uint64_t v13 = objc_msgSend(v7, "pu_indexPathAfterInsertingItemAtIndexPath:", v12);
        goto LABEL_8;
      case 2:
        v12 = [(PUTilingViewUpdateItem *)self indexPathBeforeUpdate];
        uint64_t v13 = objc_msgSend(v7, "pu_indexPathAfterDeletingItemAtIndexPath:", v12);
        goto LABEL_8;
      case 3:
        v12 = [(PUTilingViewUpdateItem *)self indexPathBeforeUpdate];
        v14 = [(PUTilingViewUpdateItem *)self indexPathAfterUpdate];
        v11 = objc_msgSend(v7, "pu_indexPathAfterMovingItemFromIndexPath:toIndexPath:", v12, v14);

        goto LABEL_9;
      case 4:
        v12 = [(PUTilingViewUpdateItem *)self indexPathBeforeUpdate];
        uint64_t v13 = objc_msgSend(v7, "pu_indexPathAfterReloadingItemAtIndexPath:", v12);
LABEL_8:
        v11 = (void *)v13;

LABEL_9:
        break;
      default:
        break;
    }
  }

  return v11;
}

- (PUTilingViewUpdateItem)initWithAction:(int64_t)a3 indexPathBeforeUpdate:(id)a4 indexPathAfterUpdate:(id)a5 dataSource:(id)a6
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a3 == 1)
  {
    if (v12)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, self, @"PUTilingViewUpdateItem.m", 21, @"Invalid parameter not satisfying: %@", @"indexPathBeforeUpdate == nil" object file lineNumber description];

      if (v13) {
        goto LABEL_10;
      }
LABEL_17:
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2, self, @"PUTilingViewUpdateItem.m", 28, @"Invalid parameter not satisfying: %@", @"indexPathAfterUpdate != nil" object file lineNumber description];
LABEL_18:

      if (v14) {
        goto LABEL_11;
      }
      goto LABEL_19;
    }
LABEL_9:
    if (v13) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
  if (!a3)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUTilingViewUpdateItem.m", 19, @"Invalid parameter not satisfying: %@", @"action != PUTilingViewUpdateActionUndefined" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
LABEL_15:
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PUTilingViewUpdateItem.m", 23, @"Invalid parameter not satisfying: %@", @"indexPathBeforeUpdate != nil" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v12) {
    goto LABEL_15;
  }
LABEL_4:
  if (a3 != 4 && a3 != 2) {
    goto LABEL_9;
  }
  if (v13)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PUTilingViewUpdateItem.m", 26, @"Invalid parameter not satisfying: %@", @"indexPathAfterUpdate == nil" object file lineNumber description];
    goto LABEL_18;
  }
LABEL_10:
  if (v14) {
    goto LABEL_11;
  }
LABEL_19:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PUTilingViewUpdateItem.m", 30, @"Invalid parameter not satisfying: %@", @"dataSource != nil" object file lineNumber description];

LABEL_11:
  v23.receiver = self;
  v23.super_class = (Class)PUTilingViewUpdateItem;
  v16 = [(PUTilingViewUpdateItem *)&v23 init];
  v17 = v16;
  if (v16)
  {
    v16->_action = a3;
    objc_storeStrong((id *)&v16->_indexPathBeforeUpdate, a4);
    objc_storeStrong((id *)&v17->_indexPathAfterUpdate, a5);
    objc_storeStrong((id *)&v17->_dataSource, a6);
  }

  return v17;
}

@end