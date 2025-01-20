@interface UIUpdateItem
- (BOOL)isDecomposedFromReload;
- (UICollectionViewUpdateItem)collectionViewUpdateItem;
- (id)_moveDestinationDescription;
- (id)description;
- (id)initWithAction:(void *)a3 forIndexPath:(void *)a4 animation:;
- (int64_t)compareIndexPaths:(id)a3;
- (int64_t)compareIndexPathsForMoves:(id)a3;
- (int64_t)inverseCompareIndexPaths:(id)a3;
@end

@implementation UIUpdateItem

- (int64_t)compareIndexPaths:(id)a3
{
  indexPath = self->_indexPath;
  if (a3) {
    a3 = (id)*((void *)a3 + 3);
  }
  return [(NSIndexPath *)indexPath compare:a3];
}

- (id)initWithAction:(void *)a3 forIndexPath:(void *)a4 animation:
{
  id v8 = a3;
  v9 = v8;
  if (a1)
  {
    _UIAssertValidUpdateIndexPath(v8);
    v12.receiver = a1;
    v12.super_class = (Class)UIUpdateItem;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      *((_DWORD *)v10 + 5) = a2;
      objc_storeStrong(v10 + 3, a3);
      a1[4] = a4;
      *((unsigned char *)a1 + 16) = (_BYTE)a1[2] & 0xFE | ([v9 row] == 0x7FFFFFFFFFFFFFFFLL);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_collectionViewUpdateItem, 0);
}

- (BOOL)isDecomposedFromReload
{
  return 0;
}

- (UICollectionViewUpdateItem)collectionViewUpdateItem
{
  collectionViewUpdateItem = self->_collectionViewUpdateItem;
  if (!collectionViewUpdateItem)
  {
    unsigned int action = self->_action;
    if (action >= 4) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = action;
    }
    v6 = [UICollectionViewUpdateItem alloc];
    v7 = self->_indexPath;
    id v8 = [(UICollectionViewUpdateItem *)v6 initWithAction:v5 forIndexPath:v7];
    v9 = self->_collectionViewUpdateItem;
    self->_collectionViewUpdateItem = v8;

    collectionViewUpdateItem = self->_collectionViewUpdateItem;
  }
  return collectionViewUpdateItem;
}

- (id)_moveDestinationDescription
{
  return &stru_1ED0E84C0;
}

- (id)description
{
  if (self && (*(unsigned char *)&self->_updateItemFlags & 1) != 0)
  {
    v3 = [MEMORY[0x1E4F28E78] stringWithString:@"SEC:"];
    int v4 = 1;
  }
  else
  {
    v3 = [MEMORY[0x1E4F28E78] string];
    int v4 = 0;
  }
  switch(self->_action)
  {
    case 0:
      if (v4)
      {
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSIndexPath section](self->_indexPath, "section"));
        [v3 appendFormat:@"INS(%@)", v5, v8];
      }
      else
      {
        uint64_t v5 = [(NSIndexPath *)self->_indexPath _ui_shortDescription];
        [v3 appendFormat:@"INS%@", v5, v8];
      }
      goto LABEL_19;
    case 1:
      if (v4)
      {
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSIndexPath section](self->_indexPath, "section"));
        [v3 appendFormat:@"DEL(%@)", v5, v8];
      }
      else
      {
        uint64_t v5 = [(NSIndexPath *)self->_indexPath _ui_shortDescription];
        [v3 appendFormat:@"DEL%@", v5, v8];
      }
      goto LABEL_19;
    case 2:
      if (v4)
      {
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSIndexPath section](self->_indexPath, "section"));
        [v3 appendFormat:@"%@(%@)", @"REL", v5];
      }
      else
      {
        uint64_t v5 = [(NSIndexPath *)self->_indexPath _ui_shortDescription];
        [v3 appendFormat:@"%@%@", @"REL", v5];
      }
      goto LABEL_19;
    case 3:
      if (v4)
      {
        uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSIndexPath section](self->_indexPath, "section"));
        v6 = [(UIUpdateItem *)self _moveDestinationDescription];
        [v3 appendFormat:@"MOV(%@)%@", v5, v6];
      }
      else
      {
        uint64_t v5 = [(NSIndexPath *)self->_indexPath _ui_shortDescription];
        v6 = [(UIUpdateItem *)self _moveDestinationDescription];
        [v3 appendFormat:@"MOV%@%@", v5, v6];
      }

LABEL_19:
      break;
    default:
      break;
  }
  return v3;
}

- (int64_t)inverseCompareIndexPaths:(id)a3
{
  if (a3) {
    v3 = (void *)*((void *)a3 + 3);
  }
  else {
    v3 = 0;
  }
  return [v3 compare:self->_indexPath];
}

- (int64_t)compareIndexPathsForMoves:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (v5) {
    BOOL v7 = self->_action == 3;
  }
  else {
    BOOL v7 = 0;
  }
  char v8 = !v7;
  if (has_internal_diagnostics)
  {
    if ((v8 & 1) == 0 && v5[5] == 3) {
      goto LABEL_10;
    }
    v13 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_17;
    }
    v14 = NSStringFromSelector(a2);
    int v16 = 138412290;
    v17 = v14;
    _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "%@ should only be used to compare move updates", (uint8_t *)&v16, 0xCu);
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  if ((v8 & 1) == 0 && v5[5] == 3)
  {
LABEL_10:
    int v9 = *(unsigned char *)&self->_updateItemFlags & 1;
    goto LABEL_11;
  }
  objc_super v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &compareIndexPathsForMoves____s_category) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = v12;
    v14 = NSStringFromSelector(a2);
    int v16 = 138412290;
    v17 = v14;
    _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "%@ should only be used to compare move updates", (uint8_t *)&v16, 0xCu);
    goto LABEL_16;
  }
LABEL_18:
  int v9 = *(unsigned char *)&self->_updateItemFlags & 1;
  if (!v5)
  {
    int v10 = 0;
    if ((*(unsigned char *)&self->_updateItemFlags & 1) == 0) {
      goto LABEL_20;
    }
    goto LABEL_12;
  }
LABEL_11:
  int v10 = v5[4] & 1;
  if (!v9) {
    goto LABEL_20;
  }
LABEL_12:
  if (!v10)
  {
    int64_t v11 = -1;
    goto LABEL_23;
  }
LABEL_20:
  if ((v9 | v10 ^ 1) == 1) {
    int64_t v11 = [(UIUpdateItem *)self compareIndexPaths:v5];
  }
  else {
    int64_t v11 = 1;
  }
LABEL_23:

  return v11;
}

@end