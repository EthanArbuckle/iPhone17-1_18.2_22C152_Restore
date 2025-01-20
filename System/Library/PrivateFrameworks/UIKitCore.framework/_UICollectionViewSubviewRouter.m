@interface _UICollectionViewSubviewRouter
- (BOOL)shouldAddSubview:(id)a3 atPosition:(int64_t *)a4 relativeTo:(id)a5;
- (BOOL)shouldBringSubviewToFront:(id)a3;
- (BOOL)shouldExchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4;
- (BOOL)shouldSendSubviewToBack:(id)a3;
- (id)description;
- (id)initWithContainer:(void *)a1;
- (uint64_t)setContainer:(uint64_t)result;
- (uint64_t)shouldAddSubview:(uint64_t *)a3 atPosition:(uint64_t)a4 relativeTo:(int)a5 creatingBookmarkIfNecessary:;
- (void)addContainerView:(uint64_t)a1;
- (void)addControlledSubview:(int64_t)a3 zIndex:(int64_t)a4 orderMode:;
- (void)enumerateBookmarksWithEnumerator:(uint64_t)a1;
- (void)willRemoveSubview:(id)a3;
@end

@implementation _UICollectionViewSubviewRouter

- (void)addContainerView:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned char *)(a1 + 32)) {
      [*(id *)(a1 + 40) insertSubview:a2 atIndex:0];
    }
    else {
      -[_UICollectionViewSubviewRouter addControlledSubview:zIndex:orderMode:](a1, a2, 0, 0);
    }
  }
}

- (void)addControlledSubview:(int64_t)a3 zIndex:(int64_t)a4 orderMode:
{
  if (!a1) {
    return;
  }
  id v8 = *(id *)(a1 + 40);
  v9 = v8;
  if (!a2 || !v8) {
    goto LABEL_41;
  }
  if (!*(unsigned char *)(a1 + 32))
  {
    if (a4 == -10000)
    {
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      [v35 handleFailureInMethod:sel_addControlledSubview_zIndex_orderMode_, a1, @"_UICollectionViewSubviewRouter.m", 69, @"UICollectionView internal inconsistency: a controlled subview must specify its position in relation to containers. View: %@", a2 object file lineNumber description];
    }
    v24 = [*(id *)(a1 + 16) objectForKey:a2];
    v25 = v24;
    if (v24)
    {
      if (v24[2] == a3 && v24[3] == a4)
      {
        char v26 = 0;
LABEL_30:
        uint64_t v50 = 0;
        v51 = &v50;
        uint64_t v52 = 0x3032000000;
        v53 = __Block_byref_object_copy__188;
        v54 = __Block_byref_object_dispose__188;
        id v55 = 0;
        uint64_t v46 = 0;
        v47 = &v46;
        uint64_t v48 = 0x2020000000;
        uint64_t v49 = 0;
        uint64_t v42 = 0;
        v43 = &v42;
        uint64_t v44 = 0x2020000000;
        uint64_t v45 = 0;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __72___UICollectionViewSubviewRouter_addControlledSubview_zIndex_orderMode___block_invoke;
        v40[3] = &unk_1E5308840;
        v40[7] = a4;
        v40[8] = a3;
        char v41 = v26;
        v40[4] = &v50;
        v40[5] = &v42;
        v40[6] = &v46;
        -[_UICollectionViewSubviewRouter enumerateBookmarksWithEnumerator:](a1, (uint64_t)v40);
        uint64_t v27 = v51[5];
        if (!v27)
        {
          uint64_t v28 = self;
          if (a4 == -10000)
          {
            uint64_t v36 = v28;
            v37 = [MEMORY[0x1E4F28B00] currentHandler];
            [v37 handleFailureInMethod:sel_bookmarkForControlledSubviewsWithZIndex_orderMode_ object:v36 file:@"_UICollectionViewSubviewRouter.m" lineNumber:483 description:@"UICollectionView internal inconsistency: a controlled subview bookmark must specify its position in relation to containers."];
          }
          v29 = objc_alloc_init(_UICollectionViewSubviewRouterBookmark);
          if (v29)
          {
            v29->_zIndex = a3;
            v29->_orderMode = a4;
            v29->_count = 1;
          }
          v30 = (void *)v51[5];
          v51[5] = (uint64_t)v29;

          [*(id *)(a1 + 8) insertObject:v51[5] atIndex:v47[3]];
          uint64_t v27 = v51[5];
        }
        [*(id *)(a1 + 16) setObject:v27 forKey:a2];
        v32 = *(void **)(a1 + 24);
        v31 = (id *)(a1 + 24);
        id v33 = v32;
        objc_storeStrong(v31, a2);
        [v9 _addSubview:a2 positioned:v43[3] relativeTo:0];
        id v34 = *v31;
        id *v31 = v33;

        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v50, 8);

        goto LABEL_41;
      }
      --v24[1];
    }
    char v26 = 1;
    goto LABEL_30;
  }
  objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = *(id *)(a1 + 40);
  v12 = v11;
  if (!v11) {
    goto LABEL_40;
  }
  v13 = -[UIView _subviewAtIndex:](v11, 0);
  if (!v13) {
    goto LABEL_26;
  }
  v38 = v9;
  uint64_t v39 = a3;
  uint64_t v14 = 0;
  int v15 = 0;
  int v16 = 0;
  uint64_t v17 = -1;
  while (1)
  {
    if (objc_opt_isKindOfClass())
    {
      v18 = [v13 _layoutAttributes];
      uint64_t v19 = [v18 zIndex];

      if (v19 > v39) {
        goto LABEL_18;
      }
      v16 |= v13 == a2;
      int v15 = 1;
      goto LABEL_13;
    }
    if (![v13 isMemberOfClass:v10]) {
      break;
    }
    v16 |= v13 == a2;
LABEL_13:
    uint64_t v17 = v14;
LABEL_14:
    uint64_t v20 = -[UIView _subviewAtIndex:](v12, ++v14);

    v13 = (void *)v20;
    if (!v20) {
      goto LABEL_18;
    }
  }
  if (dyld_program_sdk_at_least() & 1) != 0 || ((v15 ^ 1)) {
    goto LABEL_14;
  }
LABEL_18:
  v9 = v38;
  if ((v17 & 0x8000000000000000) == 0)
  {
    uint64_t v21 = v17 + ((v16 & 1) == 0);
    v22 = v12;
    v23 = a2;
    goto LABEL_38;
  }
LABEL_26:
  if (objc_msgSend(v12, "__isKindOfUIScrollView"))
  {
    [v12 _addContentSubview:a2 atBack:1];
  }
  else
  {
    v22 = v12;
    v23 = a2;
    uint64_t v21 = 0;
LABEL_38:
    [v22 insertSubview:v23 atIndex:v21];
  }

LABEL_40:
LABEL_41:
}

- (void)enumerateBookmarksWithEnumerator:(uint64_t)a1
{
  unint64_t v4 = 0;
  uint64_t v5 = 0;
  char v8 = 0;
  do
  {
    if (v4 >= [*(id *)(a1 + 8) count]) {
      break;
    }
    uint64_t v6 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v4];
    v7 = (void *)v6;
    if (v6 && *(void *)(v6 + 8))
    {
      (*(void (**)(uint64_t, uint64_t, unint64_t, uint64_t, char *))(a2 + 16))(a2, v6, v4, v5, &v8);
      v5 += v7[1];
      ++v4;
    }
    else
    {
      [*(id *)(a1 + 8) removeObjectAtIndex:v4];
    }
  }
  while (!v8);
}

- (BOOL)shouldBringSubviewToFront:(id)a3
{
  unint64_t v4 = self;
  if (self) {
    self = (_UICollectionViewSubviewRouter *)self->_container;
  }
  uint64_t v5 = [(_UICollectionViewSubviewRouter *)self subviews];
  uint64_t v6 = [v5 count];

  uint64_t v8 = v6;
  return -[_UICollectionViewSubviewRouter shouldAddSubview:atPosition:relativeTo:creatingBookmarkIfNecessary:]((uint64_t)v4, (uint64_t)a3, &v8, 0, 0);
}

- (uint64_t)shouldAddSubview:(uint64_t *)a3 atPosition:(uint64_t)a4 relativeTo:(int)a5 creatingBookmarkIfNecessary:
{
  if (!a1) {
    return 0;
  }
  id v10 = *(id *)(a1 + 40);
  id v11 = v10;
  uint64_t v12 = 0;
  if (a2 && v10)
  {
    if (!*(unsigned char *)(a1 + 32) && *(void *)(a1 + 24) != a2 && (*((void *)v10 + 13) & 0x400000) == 0)
    {
      uint64_t v14 = [*(id *)(a1 + 16) objectForKey:a2];
      if (v14)
      {
        int v15 = v14;
        if (v14[3] != -10000)
        {

LABEL_18:
          uint64_t v12 = 0;
          goto LABEL_6;
        }
      }
      else
      {
        if (!a5) {
          goto LABEL_18;
        }
        int v15 = +[_UICollectionViewSubviewRouterBookmark bookmarkForUncontrolledSubview]();
        [*(id *)(a1 + 16) setObject:v15 forKey:a2];
      }
      int v16 = [v11 subviews];
      uint64_t v17 = [v16 count];

      v18 = [*(id *)(a1 + 16) objectForKey:a4];
      uint64_t v19 = *a3;
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x2020000000;
      uint64_t v49 = -1;
      uint64_t v42 = 0;
      v43 = &v42;
      uint64_t v44 = 0x2020000000;
      uint64_t v45 = -1;
      uint64_t v38 = 0;
      uint64_t v39 = &v38;
      uint64_t v40 = 0x2020000000;
      uint64_t v41 = 0;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __101___UICollectionViewSubviewRouter_shouldAddSubview_atPosition_relativeTo_creatingBookmarkIfNecessary___block_invoke;
      v29[3] = &unk_1E5308868;
      id v33 = &v46;
      uint64_t v20 = v15;
      id v30 = v20;
      uint64_t v31 = a1;
      id v34 = &v42;
      v35 = &v38;
      uint64_t v36 = v19;
      uint64_t v37 = v17;
      id v21 = v18;
      id v32 = v21;
      -[_UICollectionViewSubviewRouter enumerateBookmarksWithEnumerator:](a1, (uint64_t)v29);
      unint64_t v22 = [*(id *)(a1 + 8) count];
      v23 = v43;
      unint64_t v24 = v43[3];
      if ((v24 & 0x8000000000000000) != 0)
      {
        if (v19 <= -3) {
          unint64_t v25 = 0;
        }
        else {
          unint64_t v25 = v22;
        }
        v43[3] = v25;
        if (v19 <= -3) {
          uint64_t v26 = 0;
        }
        else {
          uint64_t v26 = v17;
        }
        v39[3] = v26;
      }
      else if (v24 > v22)
      {
        v43[3] = v22;
      }
      if ((v47[3] & 0x8000000000000000) == 0)
      {
        objc_msgSend(*(id *)(a1 + 8), "removeObjectAtIndex:");
        v23 = v43;
        uint64_t v27 = v43[3];
        if (v47[3] < v27)
        {
          v43[3] = v27 - 1;
          if (v20) {
            uint64_t v28 = v20[1];
          }
          else {
            uint64_t v28 = 0;
          }
          v39[3] -= v28;
        }
      }
      [*(id *)(a1 + 8) insertObject:v20 atIndex:v23[3]];
      *a3 = v39[3];

      _Block_object_dispose(&v38, 8);
      _Block_object_dispose(&v42, 8);
      _Block_object_dispose(&v46, 8);
    }
    uint64_t v12 = 1;
  }
LABEL_6:

  return v12;
}

- (BOOL)shouldAddSubview:(id)a3 atPosition:(int64_t *)a4 relativeTo:(id)a5
{
  return -[_UICollectionViewSubviewRouter shouldAddSubview:atPosition:relativeTo:creatingBookmarkIfNecessary:]((uint64_t)self, (uint64_t)a3, a4, (uint64_t)a5, 1);
}

- (id)initWithContainer:(void *)a1
{
  id v2 = a1;
  if (a1)
  {
    unint64_t v4 = [a2 subviews];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel_initWithContainer_, v2, @"_UICollectionViewSubviewRouter.m", 37, @"_UICollectionViewSubviewRouter should be initialized with a view containing zero subviews. View: %@", a2 object file lineNumber description];
    }
    v13.receiver = v2;
    v13.super_class = (Class)_UICollectionViewSubviewRouter;
    uint64_t v6 = objc_msgSendSuper2(&v13, sel_init);
    id v2 = v6;
    if (v6)
    {
      v6[5] = a2;
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
      uint64_t v8 = (void *)*((void *)v2 + 1);
      *((void *)v2 + 1) = v7;

      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:514 valueOptions:0 capacity:0];
      id v10 = (void *)*((void *)v2 + 2);
      *((void *)v2 + 2) = v9;

      *((unsigned char *)v2 + 32) = dyld_program_sdk_at_least() ^ 1;
    }
  }
  return v2;
}

- (void)willRemoveSubview:(id)a3
{
  if (!self || !self->_useLegacyRouting)
  {
    uint64_t v6 = [(NSMapTable *)self->_subviewToBookmarkMap objectForKey:a3];
    uint64_t v9 = (void *)v6;
    if (v6)
    {
      uint64_t v7 = *(void *)(v6 + 8);
      if (!v7)
      {
        uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2 object:self file:@"_UICollectionViewSubviewRouter.m" lineNumber:376 description:@"UICollectionView internal inconsistency: attempted to remove a subview from an empty _UICollectionViewSubviewRouterBookmark. Please file a bug against UICollectionView."];

        uint64_t v6 = (uint64_t)v9;
        uint64_t v7 = v9[1];
      }
      *(void *)(v6 + 8) = v7 - 1;
    }
    [(NSMapTable *)self->_subviewToBookmarkMap removeObjectForKey:a3];
  }
}

- (uint64_t)setContainer:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    unint64_t v4 = [a2 subviews];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_setContainer_, v3, @"_UICollectionViewSubviewRouter.m", 49, @"UICollectionView internal inconsistency: the _UICollectionViewSubviewRouter's view should initially contain zero subviews. View: %@", a2 object file lineNumber description];
    }
    *(void *)(v3 + 40) = a2;
    [*(id *)(v3 + 8) removeAllObjects];
    uint64_t v6 = *(void **)(v3 + 16);
    return [v6 removeAllObjects];
  }
  return result;
}

- (BOOL)shouldSendSubviewToBack:(id)a3
{
  uint64_t v4 = 0;
  return -[_UICollectionViewSubviewRouter shouldAddSubview:atPosition:relativeTo:creatingBookmarkIfNecessary:]((uint64_t)self, (uint64_t)a3, &v4, 0, 0);
}

- (BOOL)shouldExchangeSubviewAtIndex:(int64_t)a3 withSubviewAtIndex:(int64_t)a4
{
  if (!self)
  {
    uint64_t v9 = 0;
    goto LABEL_25;
  }
  uint64_t v8 = self->_container;
  uint64_t v9 = v8;
  if (!v8)
  {
LABEL_25:
    BOOL v10 = 0;
    goto LABEL_26;
  }
  if (!self->_useLegacyRouting)
  {
    id v11 = [(UIView *)v8 subviews];
    uint64_t v12 = v11;
    if (a3 < 0)
    {
      BOOL v10 = 0;
LABEL_22:

      goto LABEL_26;
    }
    unint64_t v13 = [v11 count];
    BOOL v10 = 0;
    if (a4 < 0) {
      goto LABEL_22;
    }
    if (v13 <= a3) {
      goto LABEL_22;
    }
    unint64_t v14 = [v12 count];
    BOOL v10 = 0;
    if (a3 == a4 || v14 <= a4) {
      goto LABEL_22;
    }
    subviewToBookmarkMap = self->_subviewToBookmarkMap;
    int v16 = [v12 objectAtIndexedSubscript:a3];
    uint64_t v17 = [(NSMapTable *)subviewToBookmarkMap objectForKey:v16];

    v18 = self->_subviewToBookmarkMap;
    uint64_t v19 = [v12 objectAtIndexedSubscript:a4];
    uint64_t v20 = [(NSMapTable *)v18 objectForKey:v19];

    if (v17 && v20
      || ([MEMORY[0x1E4F28B00] currentHandler],
          id v21 = objc_claimAutoreleasedReturnValue(),
          [v21 handleFailureInMethod:a2 object:self file:@"_UICollectionViewSubviewRouter.m" lineNumber:342 description:@"UICollectionView internal inconsistency: attempted to exchange subviews that do not have an associated _UICollectionViewSubviewRouterBookmark. Please file a bug against UICollectionView."], v21, v17))
    {
      BOOL v10 = 0;
      if (v17[3] != -10000 || !v20) {
        goto LABEL_21;
      }
      if (v20[3] == -10000)
      {
        uint64_t v36 = 0;
        uint64_t v37 = &v36;
        uint64_t v38 = 0x2020000000;
        uint64_t v39 = -1;
        uint64_t v32 = 0;
        id v33 = &v32;
        uint64_t v34 = 0x2020000000;
        uint64_t v35 = -1;
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        uint64_t v26 = __82___UICollectionViewSubviewRouter_shouldExchangeSubviewAtIndex_withSubviewAtIndex___block_invoke;
        uint64_t v27 = &unk_1E5308890;
        id v30 = &v36;
        uint64_t v28 = v17;
        uint64_t v31 = &v32;
        v29 = v20;
        -[_UICollectionViewSubviewRouter enumerateBookmarksWithEnumerator:]((uint64_t)self, (uint64_t)&v24);
        if (v37[3] < 0 || v33[3] < 0)
        {
          unint64_t v22 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v24, v25, v26, v27, v28);
          [v22 handleFailureInMethod:a2 object:self file:@"_UICollectionViewSubviewRouter.m" lineNumber:362 description:@"UICollectionView internal inconsistency: attempted to exchange subviews that do not have an associated _UICollectionViewSubviewRouterBookmark index. Please file a bug against UICollectionView."];
        }
        -[NSMutableArray exchangeObjectAtIndex:withObjectAtIndex:](self->_bookmarks, "exchangeObjectAtIndex:withObjectAtIndex:", v24, v25, v26, v27);

        _Block_object_dispose(&v32, 8);
        _Block_object_dispose(&v36, 8);
        BOOL v10 = 1;
        goto LABEL_21;
      }
    }
    BOOL v10 = 0;
LABEL_21:

    goto LABEL_22;
  }
  BOOL v10 = 1;
LABEL_26:

  return v10;
}

- (id)description
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  if (self)
  {
    uint64_t v5 = self->_container;
    BOOL useLegacyRouting = self->_useLegacyRouting;
  }
  else
  {
    uint64_t v5 = 0;
    BOOL useLegacyRouting = 0;
  }
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p container = %@; legacyRouting = %d; bookmarks = {",
    v4,
    self,
    v5,
  uint64_t v7 = useLegacyRouting);

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v8 = self->_bookmarks;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      uint64_t v12 = 0;
      unint64_t v13 = v7;
      do
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v14 = NSString;
        int v15 = [*(id *)(*((void *)&v34 + 1) + 8 * v12) description];
        int v16 = [v14 stringWithFormat:@"\n    %@", v15];
        uint64_t v7 = [v13 stringByAppendingString:v16];

        ++v12;
        unint64_t v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v10);
  }

  uint64_t v17 = [v7 stringByAppendingString:@"\n} subviews = {"];;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  if (self) {
    container = self->_container;
  }
  else {
    container = 0;
  }
  uint64_t v19 = [(UIView *)container subviews];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      uint64_t v23 = 0;
      uint64_t v24 = v17;
      do
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v30 + 1) + 8 * v23);
        uint64_t v26 = [(NSMapTable *)self->_subviewToBookmarkMap objectForKey:v25];
        uint64_t v27 = [NSString stringWithFormat:@"\n    <%@: %p bookmark: %p>", v25, objc_opt_class(), v26];
        uint64_t v17 = [v24 stringByAppendingString:v27];

        ++v23;
        uint64_t v24 = v17;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v21);
  }

  uint64_t v28 = [v17 stringByAppendingString:@"\n}>"];

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedUpdateView, 0);
  objc_storeStrong((id *)&self->_subviewToBookmarkMap, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
}

@end