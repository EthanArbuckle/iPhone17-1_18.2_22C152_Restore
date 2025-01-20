@interface UICollectionViewUpdateItem
- (BOOL)isEqual:(id)a3;
- (NSIndexPath)indexPathAfterUpdate;
- (NSIndexPath)indexPathBeforeUpdate;
- (NSString)description;
- (UICollectionUpdateAction)updateAction;
- (UICollectionViewUpdateItem)initWithAction:(int64_t)a3 forIndexPath:(id)a4;
- (UICollectionViewUpdateItem)initWithInitialIndexPath:(id)a3 finalIndexPath:(id)a4 updateAction:(int64_t)a5;
- (UICollectionViewUpdateItem)revertedUpdate;
- (id).cxx_construct;
- (id)_newIndexPath;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)compareIndexPaths:(id)a3;
- (int64_t)compareIndexPathsForMoves:(id)a3;
- (int64_t)inverseCompareIndexPaths:(id)a3;
- (uint64_t)_finalIndexPathEqualToUpdateItem:(uint64_t)a1;
- (uint64_t)_initialIndexPathEqualToUpdateItem:(uint64_t)a1;
- (uint64_t)isEqualToUpdate:(void *)a1;
- (uint64_t)isNOOP;
- (void)_indexPath;
- (void)_setNewIndexPath:(uint64_t)a1;
- (void)initWithOldIndexPath:(void *)a3 newIndexPath:;
@end

@implementation UICollectionViewUpdateItem

- (int64_t)compareIndexPaths:(id)a3
{
  v4 = a3;
  int64_t section = self->_indexPairForAction.section;
  if (*(_OWORD *)&self->_indexPairForAction == __PAIR128__(0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL))
  {
    int64_t v6 = 0;
  }
  else
  {
    int64_t v7 = v4[5];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL && v4[6] == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v6 = 1;
    }
    else if (section == v7)
    {
      int64_t item = self->_indexPairForAction.item;
      int64_t v9 = v4[6];
      BOOL v10 = item < v9;
      BOOL v11 = item > v9;
      if (v10) {
        int64_t v6 = -1;
      }
      else {
        int64_t v6 = v11;
      }
    }
    else if (section >= v7)
    {
      int64_t v6 = section > v7;
    }
    else
    {
      int64_t v6 = -1;
    }
  }

  return v6;
}

- (id).cxx_construct
{
  int64x2_t v2 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  *(int64x2_t *)((char *)self + 8) = v2;
  *(int64x2_t *)((char *)self + 24) = v2;
  *(int64x2_t *)((char *)self + 40) = v2;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_finalIndexPath, 0);
  objc_storeStrong((id *)&self->_initialIndexPath, 0);
}

- (UICollectionViewUpdateItem)initWithAction:(int64_t)a3 forIndexPath:(id)a4
{
  id v6 = a4;
  int64_t v7 = v6;
  if (!a3)
  {
    int64_t v9 = 0;
    v8 = v6;
    goto LABEL_5;
  }
  v8 = v6;
  int64_t v9 = v6;
  if (a3 == 1)
  {
    v8 = 0;
    int64_t v9 = v6;
LABEL_5:
  }
  BOOL v10 = [(UICollectionViewUpdateItem *)self initWithInitialIndexPath:v9 finalIndexPath:v8 updateAction:a3];

  return v10;
}

- (UICollectionViewUpdateItem)initWithInitialIndexPath:(id)a3 finalIndexPath:(id)a4 updateAction:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)UICollectionViewUpdateItem;
  BOOL v11 = [(UICollectionViewUpdateItem *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_initialIndexPath, a3);
    if (v9)
    {
      uint64_t v13 = [v9 indexAtPosition:0];
      uint64_t v14 = [v9 indexAtPosition:1];
    }
    else
    {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v12->_initialIndexPair.int64_t section = v13;
    v12->_initialIndexPair.int64_t item = v14;
    objc_storeStrong((id *)&v12->_finalIndexPath, a4);
    if (v10)
    {
      uint64_t v15 = [v10 indexAtPosition:0];
      uint64_t v16 = [v10 indexAtPosition:1];
    }
    else
    {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v12->_finalIndexPair.int64_t section = v15;
    v12->_finalIndexPair.int64_t item = v16;
    v12->_updateAction = a5;
    if (a5) {
      p_initialIndexPair = &v12->_initialIndexPair;
    }
    else {
      p_initialIndexPair = &v12->_finalIndexPair;
    }
    v12->_indexPairForAction = *p_initialIndexPair;
    uint64_t v18 = [MEMORY[0x1E4F29128] UUID];
    identifier = v12->_identifier;
    v12->_identifier = (NSUUID *)v18;

    *(unsigned char *)&v12->_updateItemFlags &= ~1u;
  }

  return v12;
}

- (UICollectionUpdateAction)updateAction
{
  return self->_updateAction;
}

- (NSIndexPath)indexPathAfterUpdate
{
  return self->_finalIndexPath;
}

- (NSIndexPath)indexPathBeforeUpdate
{
  return self->_initialIndexPath;
}

- (void)_indexPath
{
  if (a1)
  {
    uint64_t v2 = 8;
    if (!a1[10]) {
      uint64_t v2 = 9;
    }
    a1 = (id)a1[v2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)initWithOldIndexPath:(void *)a3 newIndexPath:
{
  id v5 = a2;
  id v6 = a3;
  if (a1) {
    a1 = (void *)[a1 initWithInitialIndexPath:v5 finalIndexPath:v6 updateAction:3];
  }

  return a1;
}

- (id)_newIndexPath
{
  if (a1)
  {
    a1 = (id *)a1[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_setNewIndexPath:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    id v5 = (id *)(a1 + 72);
    if (*(id *)(a1 + 72) != v4)
    {
      id v12 = v4;
      objc_storeStrong((id *)(a1 + 72), a2);
      if (v12)
      {
        uint64_t v6 = [v12 indexAtPosition:0];
        uint64_t v7 = [v12 indexAtPosition:1];
        id v8 = v12;
      }
      else
      {
        id v8 = 0;
        uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
      }
      *(void *)(a1 + 24) = v6;
      *(void *)(a1 + 32) = v7;
      id v4 = v8;
      if (!*(void *)(a1 + 80))
      {
        id v9 = *v5;
        if (*v5)
        {
          uint64_t v10 = [*v5 indexAtPosition:0];
          uint64_t v11 = [v9 indexAtPosition:1];
        }
        else
        {
          uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
        }
        *(void *)(a1 + 40) = v10;
        *(void *)(a1 + 48) = v11;
        id v4 = v12;
      }
    }
  }
}

- (NSString)description
{
  if (self && self->_indexPairForAction.item == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = [MEMORY[0x1E4F28E78] stringWithString:@"SEC:"];
    int v4 = 1;
  }
  else
  {
    v3 = [MEMORY[0x1E4F28E78] string];
    int v4 = 0;
  }
  switch(self->_updateAction)
  {
    case 0:
      if (v4)
      {
        id v5 = [NSNumber numberWithInteger:self->_finalIndexPair.section];
        [v3 appendFormat:@"INS(%@)", v5];
      }
      else
      {
        id v5 = [(NSIndexPath *)self->_finalIndexPath _ui_shortDescription];
        [v3 appendFormat:@"INS%@", v5];
      }
      goto LABEL_22;
    case 1:
      if (v4)
      {
        id v5 = [NSNumber numberWithInteger:self->_initialIndexPair.section];
        [v3 appendFormat:@"DEL(%@)", v5];
      }
      else
      {
        id v5 = [(NSIndexPath *)self->_initialIndexPath _ui_shortDescription];
        [v3 appendFormat:@"DEL%@", v5];
      }
      goto LABEL_22;
    case 2:
      if ((*(unsigned char *)&self->_updateItemFlags & 2) != 0) {
        uint64_t v6 = @"REC";
      }
      else {
        uint64_t v6 = @"REL";
      }
      id v5 = v6;
      if (v4)
      {
        uint64_t v7 = [NSNumber numberWithInteger:self->_initialIndexPair.section];
        [v3 appendFormat:@"%@(%@)", v5, v7];
      }
      else
      {
        uint64_t v7 = [(NSIndexPath *)self->_initialIndexPath _ui_shortDescription];
        [v3 appendFormat:@"%@%@", v5, v7];
      }
      goto LABEL_19;
    case 3:
      if (v4)
      {
        id v5 = [NSNumber numberWithInteger:self->_initialIndexPair.section];
        uint64_t v7 = [NSNumber numberWithInteger:self->_finalIndexPair.section];
        [v3 appendFormat:@"MOV(%@)->(%@)", v5, v7];
      }
      else
      {
        id v5 = [(NSIndexPath *)self->_initialIndexPath _ui_shortDescription];
        uint64_t v7 = [(NSIndexPath *)self->_finalIndexPath _ui_shortDescription];
        [v3 appendFormat:@"MOV%@->%@", v5, v7];
      }
LABEL_19:

LABEL_22:
      break;
    default:
      break;
  }
  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:self->_initialIndexPath finalIndexPath:self->_finalIndexPath updateAction:self->_updateAction];
  -[UIBackgroundConfiguration _setStrokeColor:]((uint64_t)v4, self->_identifier);
  if (v4) {
    *(unsigned char *)&v4->_updateItemFlags = *(unsigned char *)&v4->_updateItemFlags & 0xFE | *(unsigned char *)&self->_updateItemFlags & 1;
  }
  return v4;
}

- (int64_t)inverseCompareIndexPaths:(id)a3
{
  int v4 = a3;
  int64_t section = self->_indexPairForAction.section;
  if (*(_OWORD *)&self->_indexPairForAction == __PAIR128__(0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL))
  {
    int64_t v6 = 1;
  }
  else
  {
    int64_t v7 = v4[5];
    if (v7 == 0x7FFFFFFFFFFFFFFFLL && v4[6] == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t v6 = 0;
    }
    else if (v7 == section)
    {
      int64_t v8 = v4[6];
      int64_t item = self->_indexPairForAction.item;
      BOOL v10 = v8 < item;
      BOOL v11 = v8 > item;
      if (v10) {
        int64_t v6 = -1;
      }
      else {
        int64_t v6 = v11;
      }
    }
    else if (v7 >= section)
    {
      int64_t v6 = v7 > section;
    }
    else
    {
      int64_t v6 = -1;
    }
  }

  return v6;
}

- (int64_t)compareIndexPathsForMoves:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  if (v5) {
    BOOL v7 = self->_updateAction == 3;
  }
  else {
    BOOL v7 = 0;
  }
  char v8 = !v7;
  if (has_internal_diagnostics)
  {
    if ((v8 & 1) == 0 && v5[10] == 3) {
      goto LABEL_10;
    }
    id v12 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      uint64_t v15 = NSStringFromSelector(a2);
      int v16 = 138412290;
      v17 = v15;
      _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "%@ should only be used to compare move updates", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    if ((v8 & 1) == 0 && v5[10] == 3)
    {
LABEL_10:
      BOOL v9 = self->_indexPairForAction.item == 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_11;
    }
    id v12 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &-[UICollectionViewUpdateItem compareIndexPathsForMoves:]::__s_category)+ 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = NSStringFromSelector(a2);
      int v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@ should only be used to compare move updates", (uint8_t *)&v16, 0xCu);
    }
  }

  BOOL v9 = self->_indexPairForAction.item == 0x7FFFFFFFFFFFFFFFLL;
  if (!v5)
  {
    BOOL v10 = 0;
    if (self->_indexPairForAction.item != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_18;
    }
    goto LABEL_12;
  }
LABEL_11:
  BOOL v10 = v5[6] == 0x7FFFFFFFFFFFFFFFLL;
  if (!v9) {
    goto LABEL_18;
  }
LABEL_12:
  if (!v10)
  {
    int64_t v11 = -1;
    goto LABEL_21;
  }
LABEL_18:
  if (v9 || !v10) {
    int64_t v11 = [(UICollectionViewUpdateItem *)self compareIndexPaths:v5];
  }
  else {
    int64_t v11 = 1;
  }
LABEL_21:

  return v11;
}

- (UICollectionViewUpdateItem)revertedUpdate
{
  if (a1)
  {
    uint64_t v2 = a1;
    int64_t updateAction = a1->_updateAction;
    if (updateAction)
    {
      if (updateAction != 1)
      {
        if (updateAction == 3) {
          a1 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:a1->_finalIndexPath finalIndexPath:a1->_initialIndexPath updateAction:3];
        }
        else {
          a1 = 0;
        }
        goto LABEL_14;
      }
      int v4 = [UICollectionViewUpdateItem alloc];
      uint64_t v8 = 64;
      if (!v2->_updateAction) {
        uint64_t v8 = 72;
      }
      uint64_t v6 = *(uint64_t *)((char *)&v2->super.isa + v8);
      uint64_t v7 = 0;
    }
    else
    {
      int v4 = [UICollectionViewUpdateItem alloc];
      uint64_t v5 = 64;
      if (!v2->_updateAction) {
        uint64_t v5 = 72;
      }
      uint64_t v6 = *(uint64_t *)((char *)&v2->super.isa + v5);
      uint64_t v7 = 1;
    }
    a1 = [(UICollectionViewUpdateItem *)v4 initWithAction:v7 forIndexPath:v6];
LABEL_14:
    uint64_t v1 = vars8;
  }
  return a1;
}

- (uint64_t)isEqualToUpdate:(void *)a1
{
  v3 = a2;
  int v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    if (a1[8])
    {
      if (a1[2] != v4[2])
      {
        int v7 = 0;
        goto LABEL_12;
      }
      BOOL v6 = a1[1] == v4[1];
    }
    else
    {
      BOOL v6 = v4[8] == 0;
    }
    int v7 = v6;
LABEL_12:
    if (a1[9])
    {
      if (a1[4] != v4[4])
      {
        unsigned int v9 = 0;
        if (v7)
        {
LABEL_20:
          if (a1[10] == v4[10]) {
            uint64_t v5 = v9;
          }
          else {
            uint64_t v5 = 0;
          }
          goto LABEL_25;
        }
LABEL_24:
        uint64_t v5 = 0;
        goto LABEL_25;
      }
      BOOL v8 = a1[3] == v4[3];
    }
    else
    {
      BOOL v8 = v4[9] == 0;
    }
    unsigned int v9 = v8;
    if (v7) {
      goto LABEL_20;
    }
    goto LABEL_24;
  }
LABEL_25:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  return -[UICollectionViewUpdateItem isEqualToUpdate:](self, a3);
}

- (uint64_t)isNOOP
{
  if (result)
  {
    if (*(void *)(result + 80) == 3
      && *(void *)(result + 16) == *(void *)(result + 32)
      && *(void *)(result + 8) == *(void *)(result + 24))
    {
      return 1;
    }
    else
    {
      return !*(void *)(result + 64) && *(void *)(result + 72) == 0;
    }
  }
  return result;
}

- (uint64_t)_initialIndexPathEqualToUpdateItem:(uint64_t)a1
{
  v3 = a2;
  if (a1) {
    a1 = *(void *)(a1 + 16) == v3[2] && *(void *)(a1 + 8) == v3[1];
  }

  return a1;
}

- (uint64_t)_finalIndexPathEqualToUpdateItem:(uint64_t)a1
{
  v3 = a2;
  if (a1) {
    a1 = *(void *)(a1 + 32) == v3[4] && *(void *)(a1 + 24) == v3[3];
  }

  return a1;
}

@end