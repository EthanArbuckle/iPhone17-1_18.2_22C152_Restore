@interface _UICollectionViewItemKey
+ (_UICollectionViewItemKey)collectionItemKeyForCellWithIndexPath:(uint64_t)a1;
+ (_UICollectionViewItemKey)collectionItemKeyForDecorationViewOfKind:(void *)a3 andIndexPath:;
+ (_UICollectionViewItemKey)collectionItemKeyForSupplementaryViewOfKind:(void *)a3 andIndexPath:;
+ (id)collectionItemKeyForLayoutAttributes:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (id)copyAsClone:(id *)result;
- (id)description;
- (id)initWithType:(void *)a3 indexPath:(void *)a4 identifier:(char)a5 clone:;
- (unint64_t)hash;
@end

@implementation _UICollectionViewItemKey

- (unint64_t)hash
{
  return [(NSIndexPath *)self->_indexPath hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = v5 == objc_opt_class()
    && self->_type == v4[4]
    && [(NSString *)self->_identifier isEqualToString:v4[2]]
    && [(NSIndexPath *)self->_indexPath isEqual:v4[1]]
    && self->_isClone == *((unsigned __int8 *)v4 + 24);

  return v6;
}

+ (id)collectionItemKeyForLayoutAttributes:(uint64_t)a1
{
  self;
  if (!a2)
  {
    uint64_t v4 = 2;
LABEL_6:
    -[UIBarButtonItemGroup _items]((id *)a2);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  __int16 v3 = *(_WORD *)(a2 + 288);
  if ((v3 & 1) == 0)
  {
    if ((v3 & 3) != 0) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  uint64_t v5 = @"_Cell_";
LABEL_8:
  BOOL v6 = [_UICollectionViewItemKey alloc];
  v7 = [(id)a2 indexPath];
  if (a2) {
    int v8 = (*(unsigned __int16 *)(a2 + 288) >> 3) & 1;
  }
  else {
    LOBYTE(v8) = 0;
  }
  v9 = -[_UICollectionViewItemKey initWithType:indexPath:identifier:clone:](v6, (void *)v4, v7, v5, v8);

  return v9;
}

+ (_UICollectionViewItemKey)collectionItemKeyForCellWithIndexPath:(uint64_t)a1
{
  self;
  __int16 v3 = [_UICollectionViewItemKey alloc];
  if (v3) {
    __int16 v3 = (_UICollectionViewItemKey *)-[_UICollectionViewItemKey initWithType:indexPath:identifier:clone:](v3, 0, a2, @"_Cell_", 0);
  }
  return v3;
}

- (id)initWithType:(void *)a3 indexPath:(void *)a4 identifier:(char)a5 clone:
{
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)_UICollectionViewItemKey;
  v9 = (id *)objc_msgSendSuper2(&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9[4] = a2;
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong(v10 + 2, a4);
    *((unsigned char *)v10 + 24) = a5;
  }
  return v10;
}

+ (_UICollectionViewItemKey)collectionItemKeyForSupplementaryViewOfKind:(void *)a3 andIndexPath:
{
  self;
  uint64_t v5 = [_UICollectionViewItemKey alloc];
  if (v5) {
    uint64_t v5 = (_UICollectionViewItemKey *)-[_UICollectionViewItemKey initWithType:indexPath:identifier:clone:](v5, (void *)1, a3, a2, 0);
  }
  return v5;
}

+ (_UICollectionViewItemKey)collectionItemKeyForDecorationViewOfKind:(void *)a3 andIndexPath:
{
  self;
  uint64_t v5 = [_UICollectionViewItemKey alloc];
  if (v5) {
    uint64_t v5 = (_UICollectionViewItemKey *)-[_UICollectionViewItemKey initWithType:indexPath:identifier:clone:](v5, (void *)2, a3, a2, 0);
  }
  return v5;
}

- (id)description
{
  if (!self)
  {
LABEL_5:
    uint64_t v4 = NSString;
    v26.receiver = self;
    v26.super_class = (Class)_UICollectionViewItemKey;
    uint64_t v5 = [(_UICollectionViewItemKey *)&v26 description];
    if (self) {
      indexPath = self->_indexPath;
    }
    else {
      indexPath = 0;
    }
    v7 = indexPath;
    int v8 = [(NSIndexPath *)v7 _ui_shortDescription];
    BOOL isClone = self->_isClone;

    v10 = @" (C)";
    if (!isClone) {
      v10 = &stru_1ED0E84C0;
    }
    v11 = [v4 stringWithFormat:@"%@ Type = C IndexPath = %@%@", v5, v8, v10];
    goto LABEL_19;
  }
  unint64_t type = self->_type;
  switch(type)
  {
    case 2uLL:
      objc_super v12 = NSString;
      v24.receiver = self;
      v24.super_class = (Class)_UICollectionViewItemKey;
      uint64_t v5 = [(_UICollectionViewItemKey *)&v24 description];
      identifier = self->_identifier;
      v14 = self->_indexPath;
      int v8 = identifier;
      uint64_t v15 = [(NSIndexPath *)v14 _ui_shortDescription];
      v16 = (void *)v15;
      if (self->_isClone) {
        v17 = @" (C)";
      }
      else {
        v17 = &stru_1ED0E84C0;
      }
      [v12 stringWithFormat:@"%@ Type = DV ReuseID = %@ IndexPath = %@%@", v5, v8, v15, v17];
      goto LABEL_18;
    case 1uLL:
      v18 = NSString;
      v25.receiver = self;
      v25.super_class = (Class)_UICollectionViewItemKey;
      uint64_t v5 = [(_UICollectionViewItemKey *)&v25 description];
      v19 = self->_identifier;
      v14 = self->_indexPath;
      int v8 = v19;
      uint64_t v20 = [(NSIndexPath *)v14 _ui_shortDescription];
      v16 = (void *)v20;
      if (self->_isClone) {
        v21 = @" (C)";
      }
      else {
        v21 = &stru_1ED0E84C0;
      }
      [v18 stringWithFormat:@"%@ Type = SV Kind = %@ IndexPath = %@%@", v5, v8, v20, v21];
      v11 = LABEL_18:;

LABEL_19:
      goto LABEL_21;
    case 0uLL:
      goto LABEL_5;
  }
  v23.receiver = self;
  v23.super_class = (Class)_UICollectionViewItemKey;
  v11 = [(_UICollectionViewItemKey *)&v23 description];
LABEL_21:
  return v11;
}

- (id)copyAsClone:(id *)result
{
  if (result)
  {
    char v2 = a2;
    if ((*((unsigned char *)result + 24) != 0) == a2)
    {
      return result;
    }
    else
    {
      int v8 = result;
      __int16 v3 = [_UICollectionViewItemKey alloc];
      id v4 = v8[4];
      id v5 = v8[2];
      id v6 = v8[1];
      v7 = -[_UICollectionViewItemKey initWithType:indexPath:identifier:clone:](v3, v4, v6, v5, v2);

      return v7;
    }
  }
  return result;
}

@end