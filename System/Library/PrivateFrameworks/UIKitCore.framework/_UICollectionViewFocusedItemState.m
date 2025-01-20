@interface _UICollectionViewFocusedItemState
+ (_UICollectionViewFocusedItemState)stateWithReusableView:(id)a3 indexPath:(id)a4 elementKind:(id)a5 viewType:(unint64_t)a6;
+ (id)stateWithIndexPath:(void *)a3 elementKind:(uint64_t)a4 viewType:;
+ (id)stateWithLayoutAttributes:(uint64_t)a1;
+ (id)stateWithReusableView:(uint64_t)a1;
+ (id)stateWithReusableView:(void *)a3 overrideIndexPath:;
- (_UICollectionViewFocusedItemState)initWithReusableView:(id)a3 indexPath:(id)a4 elementKind:(id)a5 viewType:(unint64_t)a6;
- (id)description;
- (void)cell;
- (void)copyWithIndexPath:(int)a3 preservingReusableView:;
- (void)copyWithReusableView:(void *)a1;
@end

@implementation _UICollectionViewFocusedItemState

- (void)copyWithReusableView:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((id)a1[1] == v3) {
      v5 = a1;
    }
    else {
      v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithReusableView:v3 indexPath:a1[2] elementKind:a1[3] viewType:a1[4]];
    }
    a1 = v5;
  }

  return a1;
}

+ (_UICollectionViewFocusedItemState)stateWithReusableView:(id)a3 indexPath:(id)a4 elementKind:(id)a5 viewType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"_UICollectionViewFocusedItemState.m", 17, @"Invalid parameter not satisfying: %@", @"reusableView != nil" object file lineNumber description];
  }
  v14 = (void *)[objc_alloc((Class)a1) initWithReusableView:v11 indexPath:v12 elementKind:v13 viewType:a6];

  return (_UICollectionViewFocusedItemState *)v14;
}

+ (id)stateWithIndexPath:(void *)a3 elementKind:(uint64_t)a4 viewType:
{
  id v6 = a3;
  id v7 = a2;
  v8 = (void *)[objc_alloc((Class)self) initWithReusableView:0 indexPath:v7 elementKind:v6 viewType:a4];

  return v8;
}

+ (id)stateWithLayoutAttributes:(uint64_t)a1
{
  id v2 = a2;
  id v3 = (objc_class *)self;
  if (!v2)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel_stateWithLayoutAttributes_, v3, @"_UICollectionViewFocusedItemState.m", 28, @"Invalid parameter not satisfying: %@", @"layoutAttributes" object file lineNumber description];
  }
  id v4 = [v3 alloc];
  v5 = [v2 indexPath];
  id v6 = -[UIBarButtonItemGroup _items]((id *)v2);
  uint64_t v7 = [v2 representedElementCategory];

  v8 = (void *)[v4 initWithReusableView:0 indexPath:v5 elementKind:v6 viewType:v7];
  return v8;
}

+ (id)stateWithReusableView:(uint64_t)a1
{
  id v2 = a2;
  id v3 = (objc_class *)self;
  if (!v2)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel_stateWithReusableView_, v3, @"_UICollectionViewFocusedItemState.m", 34, @"Invalid parameter not satisfying: %@", @"reusableView != nil" object file lineNumber description];
  }
  id v4 = [v2 _layoutAttributes];
  id v5 = [v3 alloc];
  id v6 = [v4 indexPath];
  uint64_t v7 = -[UIBarButtonItemGroup _items]((id *)v4);
  v8 = objc_msgSend(v5, "initWithReusableView:indexPath:elementKind:viewType:", v2, v6, v7, objc_msgSend(v4, "representedElementCategory"));

  return v8;
}

+ (id)stateWithReusableView:(void *)a3 overrideIndexPath:
{
  id v4 = a3;
  id v5 = a2;
  id v6 = (objc_class *)self;
  if (v5)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel_stateWithReusableView_overrideIndexPath_, v6, @"_UICollectionViewFocusedItemState.m", 41, @"Invalid parameter not satisfying: %@", @"reusableView != nil" object file lineNumber description];

    if (v4) {
      goto LABEL_3;
    }
  }
  id v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:sel_stateWithReusableView_overrideIndexPath_, v6, @"_UICollectionViewFocusedItemState.m", 42, @"Invalid parameter not satisfying: %@", @"overrideIndexPath != nil" object file lineNumber description];

LABEL_3:
  uint64_t v7 = [v5 _layoutAttributes];
  id v8 = [v6 alloc];
  v9 = -[UIBarButtonItemGroup _items](v7);
  v10 = objc_msgSend(v8, "initWithReusableView:indexPath:elementKind:viewType:", v5, v4, v9, objc_msgSend(v7, "representedElementCategory"));

  return v10;
}

- (_UICollectionViewFocusedItemState)initWithReusableView:(id)a3 indexPath:(id)a4 elementKind:(id)a5 viewType:(unint64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"_UICollectionViewFocusedItemState.m", 49, @"Invalid parameter not satisfying: %@", @"reusableView == nil || [reusableView isKindOfClass:[UICollectionReusableView class]]" object file lineNumber description];

    if (v13)
    {
LABEL_4:
      if (v14) {
        goto LABEL_5;
      }
LABEL_14:
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"_UICollectionViewFocusedItemState.m", 51, @"Invalid parameter not satisfying: %@", @"elementKind != nil" object file lineNumber description];

      if (!v12) {
        goto LABEL_9;
      }
      goto LABEL_6;
    }
  }
  else if (v13)
  {
    goto LABEL_4;
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"_UICollectionViewFocusedItemState.m", 50, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];

  if (!v14) {
    goto LABEL_14;
  }
LABEL_5:
  if (!v12) {
    goto LABEL_9;
  }
LABEL_6:
  if (!a6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      [v21 handleFailureInMethod:a2, self, @"_UICollectionViewFocusedItemState.m", 52, @"Invalid view for view type cell: %@", v23 object file lineNumber description];
    }
  }
LABEL_9:
  v24.receiver = self;
  v24.super_class = (Class)_UICollectionViewFocusedItemState;
  v15 = [(_UICollectionViewFocusedItemState *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_reusableView, a3);
    objc_storeStrong((id *)&v16->_indexPath, a4);
    objc_storeStrong((id *)&v16->_elementKind, a5);
    v16->_viewType = a6;
  }

  return v16;
}

- (void)copyWithIndexPath:(int)a3 preservingReusableView:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    if (!v5)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel_copyWithIndexPath_preservingReusableView_, a1, @"_UICollectionViewFocusedItemState.m", 76, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
    }
    if (a1[1] || ![v6 isEqual:a1[2]])
    {
      id v8 = objc_alloc((Class)objc_opt_class());
      if (a3) {
        uint64_t v9 = a1[1];
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t v7 = (void *)[v8 initWithReusableView:v9 indexPath:v6 elementKind:a1[3] viewType:a1[4]];
    }
    else
    {
      uint64_t v7 = a1;
    }
    a1 = v7;
  }

  return a1;
}

- (void)cell
{
  if (a1)
  {
    id v2 = a1;
    if (a1[1])
    {
      if (a1[4] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v3 = [MEMORY[0x1E4F28B00] currentHandler];
        id v4 = (objc_class *)objc_opt_class();
        id v5 = NSStringFromClass(v4);
        [v3 handleFailureInMethod:sel_cell, v2, @"_UICollectionViewFocusedItemState.m", 97, @"Expected a kind of UICollectionViewCell but found %@.", v5 object file lineNumber description];
      }
    }
    a1 = (id)v2[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"indexPath" object:self->_indexPath];
  id v5 = (id)[v3 appendName:@"elementKind" object:self->_elementKind];
  id v6 = _UIStringFromCollectionElementCategory(self->_viewType);
  id v7 = (id)[v3 appendName:@"viewType" object:v6];

  if (self->_reusableView) {
    id v8 = (id)objc_msgSend(v3, "appendName:object:", @"reusableView");
  }
  uint64_t v9 = [v3 string];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementKind, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_reusableView, 0);
}

@end