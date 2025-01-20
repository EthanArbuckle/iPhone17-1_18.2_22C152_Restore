@interface _UICollectionViewSubviewCollection
- (BOOL)containsView:(uint64_t)a1;
- (_UICollectionViewSubviewCollection)init;
- (id)allViews;
- (id)allViewsHashTable;
- (id)cellAtIndexPath:(id *)a1;
- (id)cells;
- (id)decorationOfKind:(uint64_t)a3 atIndexPath:;
- (id)decorationsOfKind:(uint64_t)a1;
- (id)description;
- (id)indexPathsForCells;
- (id)indexPathsForDecorationsOfKind:(uint64_t)a1;
- (id)indexPathsForSupplementariesOfKind:(uint64_t)a1;
- (id)supplementariesOfKind:(uint64_t)a1;
- (id)supplementaryOfKind:(uint64_t)a3 atIndexPath:;
- (id)viewOfKind:(uint64_t)a3 inCategory:(uint64_t)a4 atIndexPath:;
- (uint64_t)enumerateCellsWithEnumerator:(uint64_t)result;
- (uint64_t)enumerateDecorationsWithEnumerator:(uint64_t)result;
- (uint64_t)enumerateSupplementariesWithEnumerator:(uint64_t)result;
- (uint64_t)setCell:(uint64_t)a3 atIndexPath:;
- (void)enumerateAllViewsWithEnumerator:(uint64_t)a1;
- (void)enumerateAuxillariesWithEnumerator:(uint64_t)a1;
- (void)enumerateDecorationsOfElementKind:(uint64_t)a3 enumerator:;
- (void)enumerateSupplementariesOfElementKind:(uint64_t)a3 enumerator:;
- (void)removeViewForDecorationOfKind:(uint64_t)a3 atIndexPath:;
- (void)removeViewForSupplementaryOfKind:(uint64_t)a3 atIndexPath:;
- (void)removeViewOfKind:(uint64_t)a3 inCategory:(uint64_t)a4 atIndexPath:;
- (void)setView:(uint64_t)a3 forDecorationOfKind:(uint64_t)a4 atIndexPath:;
- (void)setView:(uint64_t)a3 forSupplementaryOfKind:(uint64_t)a4 atIndexPath:;
- (void)setView:(uint64_t)a3 ofKind:(uint64_t)a4 inCategory:(uint64_t)a5 atIndexPath:;
- (void)transferAllViewsWithoutCopyingToSubviewCollection:(id *)a1;
- (void)updateCellsUsingFilter:(uint64_t)a1;
- (void)updateDecorationsUsingFilter:(uint64_t)a1;
- (void)updateSupplementariesUsingFilter:(uint64_t)a1;
@end

@implementation _UICollectionViewSubviewCollection

- (id)allViews
{
  if (a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[2], "count") + objc_msgSend(a1[1], "count") + objc_msgSend(a1[3], "count"));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __46___UICollectionViewSubviewCollection_allViews__block_invoke;
    v5[3] = &unk_1E52E5F30;
    id v3 = v2;
    id v6 = v3;
    -[_UICollectionViewSubviewCollection enumerateAllViewsWithEnumerator:]((uint64_t)a1, (uint64_t)v5);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)cells
{
  if (a1)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43___UICollectionViewSubviewCollection_cells__block_invoke;
    v5[3] = &unk_1E52EB178;
    id v3 = v2;
    id v6 = v3;
    -[_UICollectionViewSubviewCollection enumerateCellsWithEnumerator:](a1, (uint64_t)v5);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)viewOfKind:(uint64_t)a3 inCategory:(uint64_t)a4 atIndexPath:
{
  if (a1)
  {
    uint64_t v7 = (uint64_t)a1;
    switch(a3)
    {
      case 2:
        if (!a2)
        {
          v9 = [MEMORY[0x1E4F28B00] currentHandler];
          [v9 handleFailureInMethod:sel_viewOfKind_inCategory_atIndexPath_, v7, @"_UICollectionViewSubviewCollection.m", 201, @"Invalid parameter not satisfying: %@", @"kind != nil" object file lineNumber description];
        }
        -[_UICollectionViewSubviewCollection decorationOfKind:atIndexPath:](v7, a2, a4);
        a1 = (id *)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        if (!a2)
        {
          v10 = [MEMORY[0x1E4F28B00] currentHandler];
          [v10 handleFailureInMethod:sel_viewOfKind_inCategory_atIndexPath_, v7, @"_UICollectionViewSubviewCollection.m", 197, @"Invalid parameter not satisfying: %@", @"kind != nil" object file lineNumber description];
        }
        -[_UICollectionViewSubviewCollection supplementaryOfKind:atIndexPath:](v7, a2, a4);
        a1 = (id *)objc_claimAutoreleasedReturnValue();
        break;
      case 0:
        a1 = [a1[1] objectForKeyedSubscript:a4];
        break;
    }
    uint64_t v4 = vars8;
  }
  return a1;
}

- (id)decorationOfKind:(uint64_t)a3 atIndexPath:
{
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 24) objectForKeyedSubscript:a2];
    v5 = [v4 objectForKeyedSubscript:a3];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)supplementaryOfKind:(uint64_t)a3 atIndexPath:
{
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 16) objectForKeyedSubscript:a2];
    v5 = [v4 objectForKeyedSubscript:a3];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)removeViewForDecorationOfKind:(uint64_t)a3 atIndexPath:
{
  if (a1)
  {
    id v4 = [*(id *)(a1 + 24) objectForKeyedSubscript:a2];
    [v4 removeObjectForKey:a3];
  }
}

- (void)removeViewForSupplementaryOfKind:(uint64_t)a3 atIndexPath:
{
  if (a1)
  {
    id v4 = [*(id *)(a1 + 16) objectForKeyedSubscript:a2];
    [v4 removeObjectForKey:a3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decorations, 0);
  objc_storeStrong((id *)&self->_supplementaries, 0);
  objc_storeStrong((id *)&self->_cells, 0);
}

- (BOOL)containsView:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51___UICollectionViewSubviewCollection_containsView___block_invoke;
  v4[3] = &unk_1E52EB100;
  v4[4] = a2;
  v4[5] = &v5;
  -[_UICollectionViewSubviewCollection enumerateAllViewsWithEnumerator:](a1, (uint64_t)v4);
  BOOL v2 = *((unsigned char *)v6 + 24) != 0;
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)indexPathsForCells
{
  if (a1)
  {
    BOOL v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56___UICollectionViewSubviewCollection_indexPathsForCells__block_invoke;
    v5[3] = &unk_1E52EB178;
    id v3 = v2;
    id v6 = v3;
    -[_UICollectionViewSubviewCollection enumerateCellsWithEnumerator:](a1, (uint64_t)v5);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (_UICollectionViewSubviewCollection)init
{
  v10.receiver = self;
  v10.super_class = (Class)_UICollectionViewSubviewCollection;
  BOOL v2 = [(_UICollectionViewSubviewCollection *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cells = v2->_cells;
    v2->_cells = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    supplementaries = v2->_supplementaries;
    v2->_supplementaries = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    decorations = v2->_decorations;
    v2->_decorations = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (id)cellAtIndexPath:(id *)a1
{
  if (a1)
  {
    a1 = [a1[1] objectForKeyedSubscript:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)enumerateAllViewsWithEnumerator:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:sel_enumerateAllViewsWithEnumerator_, a1, @"_UICollectionViewSubviewCollection.m", 298, @"Invalid parameter not satisfying: %@", @"enumerator != nil" object file lineNumber description];
    }
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __70___UICollectionViewSubviewCollection_enumerateAllViewsWithEnumerator___block_invoke;
    v7[3] = &unk_1E52EB0D8;
    v7[4] = a2;
    v7[5] = &v8;
    -[_UICollectionViewSubviewCollection enumerateCellsWithEnumerator:](a1, (uint64_t)v7);
    if (!*((unsigned char *)v9 + 24))
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __70___UICollectionViewSubviewCollection_enumerateAllViewsWithEnumerator___block_invoke_2;
      v6[3] = &unk_1E52EB088;
      v6[4] = a2;
      v6[5] = &v8;
      -[_UICollectionViewSubviewCollection enumerateSupplementariesWithEnumerator:](a1, (uint64_t)v6);
      if (!*((unsigned char *)v9 + 24))
      {
        v5[0] = MEMORY[0x1E4F143A8];
        v5[1] = 3221225472;
        v5[2] = __70___UICollectionViewSubviewCollection_enumerateAllViewsWithEnumerator___block_invoke_3;
        v5[3] = &unk_1E52EB088;
        void v5[4] = a2;
        v5[5] = &v8;
        -[_UICollectionViewSubviewCollection enumerateDecorationsWithEnumerator:](a1, (uint64_t)v5);
      }
    }
    _Block_object_dispose(&v8, 8);
  }
}

- (uint64_t)enumerateCellsWithEnumerator:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!a2)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel_enumerateCellsWithEnumerator_, v3, @"_UICollectionViewSubviewCollection.m", 230, @"Invalid parameter not satisfying: %@", @"enumerator != nil" object file lineNumber description];
    }
    id v4 = *(void **)(v3 + 8);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67___UICollectionViewSubviewCollection_enumerateCellsWithEnumerator___block_invoke;
    v6[3] = &unk_1E52E5EE0;
    v6[4] = a2;
    return [v4 enumerateKeysAndObjectsUsingBlock:v6];
  }
  return result;
}

- (uint64_t)enumerateSupplementariesWithEnumerator:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!a2)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel_enumerateSupplementariesWithEnumerator_, v3, @"_UICollectionViewSubviewCollection.m", 238, @"Invalid parameter not satisfying: %@", @"enumerator != nil" object file lineNumber description];
    }
    id v4 = *(void **)(v3 + 16);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77___UICollectionViewSubviewCollection_enumerateSupplementariesWithEnumerator___block_invoke;
    v6[3] = &unk_1E52E5F58;
    v6[4] = a2;
    return [v4 enumerateKeysAndObjectsUsingBlock:v6];
  }
  return result;
}

- (uint64_t)enumerateDecorationsWithEnumerator:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!a2)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel_enumerateDecorationsWithEnumerator_, v3, @"_UICollectionViewSubviewCollection.m", 259, @"Invalid parameter not satisfying: %@", @"enumerator != nil" object file lineNumber description];
    }
    id v4 = *(void **)(v3 + 24);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73___UICollectionViewSubviewCollection_enumerateDecorationsWithEnumerator___block_invoke;
    v6[3] = &unk_1E52E5F58;
    v6[4] = a2;
    return [v4 enumerateKeysAndObjectsUsingBlock:v6];
  }
  return result;
}

- (void)transferAllViewsWithoutCopyingToSubviewCollection:(id *)a1
{
  if (a1)
  {
    objc_storeStrong(a2 + 1, a1[1]);
    objc_storeStrong(a2 + 2, a1[2]);
    objc_storeStrong(a2 + 3, a1[3]);
    uint64_t v4 = objc_opt_new();
    id v5 = a1[1];
    a1[1] = (id)v4;

    uint64_t v6 = objc_opt_new();
    id v7 = a1[2];
    a1[2] = (id)v6;

    uint64_t v8 = objc_opt_new();
    id v9 = a1[3];
    a1[3] = (id)v8;
  }
}

- (void)setView:(uint64_t)a3 forSupplementaryOfKind:(uint64_t)a4 atIndexPath:
{
  if (a1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (!a2)
      {
        id v9 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v20 = 0;
          _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "View cannot be nil", v20, 2u);
        }
      }
    }
    else if (!a2)
    {
      v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260238) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "View cannot be nil", buf, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (!a3)
      {
        uint64_t v10 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Element kind cannot be nil", v18, 2u);
        }
      }
    }
    else if (!a3)
    {
      v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260240) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Element kind cannot be nil", v17, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (!a4)
      {
        char v11 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Index path cannot be nil", v16, 2u);
        }
      }
    }
    else if (!a4)
    {
      v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260248) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Index path cannot be nil", v15, 2u);
      }
    }
    uint64_t v8 = [*(id *)(a1 + 16) objectForKeyedSubscript:a3];
    if (!v8)
    {
      uint64_t v8 = objc_opt_new();
      [*(id *)(a1 + 16) setObject:v8 forKeyedSubscript:a3];
    }
    [v8 setObject:a2 forKeyedSubscript:a4];
  }
}

- (void)setView:(uint64_t)a3 forDecorationOfKind:(uint64_t)a4 atIndexPath:
{
  if (a1)
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (!a2)
      {
        id v9 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v20 = 0;
          _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "View cannot be nil", v20, 2u);
        }
      }
    }
    else if (!a2)
    {
      v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260250) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "View cannot be nil", buf, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (!a3)
      {
        uint64_t v10 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Element kind cannot be nil", v18, 2u);
        }
      }
    }
    else if (!a3)
    {
      v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260258) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Element kind cannot be nil", v17, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (!a4)
      {
        char v11 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Index path cannot be nil", v16, 2u);
        }
      }
    }
    else if (!a4)
    {
      v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260260) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Index path cannot be nil", v15, 2u);
      }
    }
    uint64_t v8 = [*(id *)(a1 + 24) objectForKeyedSubscript:a3];
    if (!v8)
    {
      uint64_t v8 = objc_opt_new();
      [*(id *)(a1 + 24) setObject:v8 forKeyedSubscript:a3];
    }
    [v8 setObject:a2 forKeyedSubscript:a4];
  }
}

- (void)setView:(uint64_t)a3 ofKind:(uint64_t)a4 inCategory:(uint64_t)a5 atIndexPath:
{
  if (a1)
  {
    switch(a4)
    {
      case 2:
        if (!a3)
        {
          id v9 = [MEMORY[0x1E4F28B00] currentHandler];
          [v9 handleFailureInMethod:sel_setView_ofKind_inCategory_atIndexPath_, a1, @"_UICollectionViewSubviewCollection.m", 108, @"Invalid parameter not satisfying: %@", @"kind != nil" object file lineNumber description];
        }
        -[_UICollectionViewSubviewCollection setView:forDecorationOfKind:atIndexPath:](a1, a2, a3, a5);
        break;
      case 1:
        if (!a3)
        {
          uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
          [v10 handleFailureInMethod:sel_setView_ofKind_inCategory_atIndexPath_, a1, @"_UICollectionViewSubviewCollection.m", 103, @"Invalid parameter not satisfying: %@", @"kind != nil" object file lineNumber description];
        }
        -[_UICollectionViewSubviewCollection setView:forSupplementaryOfKind:atIndexPath:](a1, a2, a3, a5);
        break;
      case 0:
        -[_UICollectionViewSubviewCollection setCell:atIndexPath:](a1, a2, a5);
        break;
    }
  }
}

- (uint64_t)setCell:(uint64_t)a3 atIndexPath:
{
  if (result)
  {
    uint64_t v5 = result;
    if (os_variant_has_internal_diagnostics())
    {
      if (!a2)
      {
        uint64_t v6 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Cell cannot be nil", v13, 2u);
        }
      }
    }
    else if (!a2)
    {
      uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1015) + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Cell cannot be nil", buf, 2u);
      }
    }
    if (os_variant_has_internal_diagnostics())
    {
      if (!a3)
      {
        id v7 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)char v11 = 0;
          _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Index path cannot be nil", v11, 2u);
        }
      }
    }
    else if (!a3)
    {
      id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB260230) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Index path cannot be nil", v10, 2u);
      }
    }
    return [*(id *)(v5 + 8) setObject:a2 forKeyedSubscript:a3];
  }
  return result;
}

- (void)removeViewOfKind:(uint64_t)a3 inCategory:(uint64_t)a4 atIndexPath:
{
  if (!a1) {
    return;
  }
  if (a3 == 2)
  {
    if (!a2)
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:sel_removeViewOfKind_inCategory_atIndexPath_, a1, @"_UICollectionViewSubviewCollection.m", 151, @"Invalid parameter not satisfying: %@", @"kind != nil" object file lineNumber description];
    }
    uint64_t v8 = (void *)a1[3];
  }
  else
  {
    if (a3 != 1)
    {
      if (!a3)
      {
        id v7 = (void *)a1[1];
        [v7 removeObjectForKey:a4];
      }
      return;
    }
    if (!a2)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel_removeViewOfKind_inCategory_atIndexPath_, a1, @"_UICollectionViewSubviewCollection.m", 146, @"Invalid parameter not satisfying: %@", @"kind != nil" object file lineNumber description];
    }
    uint64_t v8 = (void *)a1[2];
  }
  id v11 = [v8 objectForKeyedSubscript:a2];
  [v11 removeObjectForKey:a4];
}

- (void)updateSupplementariesUsingFilter:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_updateSupplementariesUsingFilter_, a1, @"_UICollectionViewSubviewCollection.m", 354, @"Invalid parameter not satisfying: %@", @"filterBlock != nil" object file lineNumber description];
    }
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71___UICollectionViewSubviewCollection_updateSupplementariesUsingFilter___block_invoke;
    v9[3] = &unk_1E52EB150;
    uint64_t v11 = a2;
    id v5 = v4;
    id v10 = v5;
    -[_UICollectionViewSubviewCollection enumerateSupplementariesWithEnumerator:](a1, (uint64_t)v9);
    uint64_t v6 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v5;
    id v7 = v5;
  }
}

- (void)updateDecorationsUsingFilter:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_updateDecorationsUsingFilter_, a1, @"_UICollectionViewSubviewCollection.m", 373, @"Invalid parameter not satisfying: %@", @"filterBlock != nil" object file lineNumber description];
    }
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67___UICollectionViewSubviewCollection_updateDecorationsUsingFilter___block_invoke;
    v9[3] = &unk_1E52EB150;
    uint64_t v11 = a2;
    id v5 = v4;
    id v10 = v5;
    -[_UICollectionViewSubviewCollection enumerateDecorationsWithEnumerator:](a1, (uint64_t)v9);
    uint64_t v6 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v5;
    id v7 = v5;
  }
}

- (void)updateCellsUsingFilter:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_updateCellsUsingFilter_, a1, @"_UICollectionViewSubviewCollection.m", 339, @"Invalid parameter not satisfying: %@", @"filterBlock != nil" object file lineNumber description];
    }
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61___UICollectionViewSubviewCollection_updateCellsUsingFilter___block_invoke;
    v9[3] = &unk_1E52EB128;
    uint64_t v11 = a2;
    id v5 = v4;
    id v10 = v5;
    -[_UICollectionViewSubviewCollection enumerateCellsWithEnumerator:](a1, (uint64_t)v9);
    uint64_t v6 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v5;
    id v7 = v5;
  }
}

- (void)enumerateAuxillariesWithEnumerator:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:sel_enumerateAuxillariesWithEnumerator_, a1, @"_UICollectionViewSubviewCollection.m", 280, @"Invalid parameter not satisfying: %@", @"enumerator != nil" object file lineNumber description];
    }
    uint64_t v7 = 0;
    uint64_t v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73___UICollectionViewSubviewCollection_enumerateAuxillariesWithEnumerator___block_invoke;
    v6[3] = &unk_1E52EB088;
    v6[4] = a2;
    void v6[5] = &v7;
    -[_UICollectionViewSubviewCollection enumerateSupplementariesWithEnumerator:](a1, (uint64_t)v6);
    if (!*((unsigned char *)v8 + 24))
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __73___UICollectionViewSubviewCollection_enumerateAuxillariesWithEnumerator___block_invoke_2;
      v5[3] = &unk_1E52EB0B0;
      void v5[4] = a2;
      -[_UICollectionViewSubviewCollection enumerateDecorationsWithEnumerator:](a1, (uint64_t)v5);
    }
    _Block_object_dispose(&v7, 8);
  }
}

- (id)indexPathsForSupplementariesOfKind:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 16) objectForKeyedSubscript:a2];
    uint64_t v3 = [v2 allKeys];
    uint64_t v4 = (void *)v3;
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
    if (v3) {
      id v5 = (void *)v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)allViewsHashTable
{
  if (a1)
  {
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D30]), "initWithOptions:capacity:", 512, objc_msgSend(a1[2], "count") + objc_msgSend(a1[1], "count") + objc_msgSend(a1[3], "count"));
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __55___UICollectionViewSubviewCollection_allViewsHashTable__block_invoke;
    v5[3] = &unk_1E52E5F30;
    id v3 = v2;
    id v6 = v3;
    -[_UICollectionViewSubviewCollection enumerateAllViewsWithEnumerator:]((uint64_t)a1, (uint64_t)v5);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (id)supplementariesOfKind:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 16) objectForKeyedSubscript:a2];
    uint64_t v3 = [v2 allValues];
    uint64_t v4 = (void *)v3;
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
    if (v3) {
      id v5 = (void *)v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)decorationsOfKind:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 24) objectForKeyedSubscript:a2];
    uint64_t v3 = [v2 allValues];
    uint64_t v4 = (void *)v3;
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
    if (v3) {
      id v5 = (void *)v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)indexPathsForDecorationsOfKind:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v2 = [*(id *)(a1 + 24) objectForKeyedSubscript:a2];
    uint64_t v3 = [v2 allKeys];
    uint64_t v4 = (void *)v3;
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
    if (v3) {
      id v5 = (void *)v3;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (void)enumerateSupplementariesOfElementKind:(uint64_t)a3 enumerator:
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
LABEL_4:
        id v6 = [*(id *)(a1 + 16) objectForKeyedSubscript:a2];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __87___UICollectionViewSubviewCollection_enumerateSupplementariesOfElementKind_enumerator___block_invoke;
        v9[3] = &unk_1E52EB060;
        void v9[4] = a3;
        [v6 enumerateKeysAndObjectsUsingBlock:v9];

        return;
      }
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_enumerateSupplementariesOfElementKind_enumerator_, a1, @"_UICollectionViewSubviewCollection.m", 249, @"Invalid parameter not satisfying: %@", @"elementKind != nil" object file lineNumber description];

      if (a3) {
        goto LABEL_4;
      }
    }
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:sel_enumerateSupplementariesOfElementKind_enumerator_, a1, @"_UICollectionViewSubviewCollection.m", 250, @"Invalid parameter not satisfying: %@", @"enumerator != nil" object file lineNumber description];

    goto LABEL_4;
  }
}

- (void)enumerateDecorationsOfElementKind:(uint64_t)a3 enumerator:
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
LABEL_4:
        id v6 = [*(id *)(a1 + 24) objectForKeyedSubscript:a2];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __83___UICollectionViewSubviewCollection_enumerateDecorationsOfElementKind_enumerator___block_invoke;
        v9[3] = &unk_1E52EB060;
        void v9[4] = a3;
        [v6 enumerateKeysAndObjectsUsingBlock:v9];

        return;
      }
    }
    else
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_enumerateDecorationsOfElementKind_enumerator_, a1, @"_UICollectionViewSubviewCollection.m", 270, @"Invalid parameter not satisfying: %@", @"elementKind != nil" object file lineNumber description];

      if (a3) {
        goto LABEL_4;
      }
    }
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:sel_enumerateDecorationsOfElementKind_enumerator_, a1, @"_UICollectionViewSubviewCollection.m", 271, @"Invalid parameter not satisfying: %@", @"enumerator != nil" object file lineNumber description];

    goto LABEL_4;
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = MutableReusableViewMapDescription(self->_cells);
  id v6 = StringToMutableReusableViewMapMapDescription(self->_supplementaries);
  uint64_t v7 = StringToMutableReusableViewMapMapDescription(self->_decorations);
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p cells = %@; supplementaries = %@; decorations = %@>",
    v4,
    self,
    v5,
    v6,
  uint64_t v8 = v7);

  return v8;
}

@end