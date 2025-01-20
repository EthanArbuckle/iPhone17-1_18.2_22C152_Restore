@interface _UITableViewSubviewManager
- (id)indexPathForPrefetchedCell:(id *)a1;
- (id)prefetchedCellAtIndexPath:(id *)a1;
- (uint64_t)preventReuseOfCell:(uint64_t)result;
- (uint64_t)shouldDeferReuseOfCell:(uint64_t)result;
- (void)cellReadyForReuse:(void *)a3 withIndexPath:(char)a4 didEndDisplaying:;
- (void)filterPrefetchedCells:(id *)a1;
- (void)initWithTableView:(void *)a1;
- (void)rebasePrefetchedCellIndexPathsWithMapping:(id *)a1;
- (void)removeAllPrefetchedCells;
- (void)resumeReuseOfCell:(id *)a1;
- (void)setReorderingCell:(id *)a1;
- (void)storePrefetchedCell:(void *)a3 forIndexPath:;
@end

@implementation _UITableViewSubviewManager

- (id)prefetchedCellAtIndexPath:(id *)a1
{
  if (a1)
  {
    a1 = [a1[5] objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)shouldDeferReuseOfCell:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!a2)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = NSStringFromSelector(sel_shouldDeferReuseOfCell_);
      [v5 handleFailureInMethod:sel_shouldDeferReuseOfCell_, v3, @"_UITableViewSubviewManager.m", 81, @"UITableView internal inconsistency: cell should not be nil in %@", v6 object file lineNumber description];
    }
    v4 = *(void **)(v3 + 24);
    return [v4 containsObject:a2];
  }
  return result;
}

- (id)indexPathForPrefetchedCell:(id *)a1
{
  if (a1)
  {
    a1 = [a1[6] objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)rebasePrefetchedCellIndexPathsWithMapping:(id *)a1
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1 && [a1[5] count])
  {
    v4 = (void *)[a1[5] copy];
    [a1[5] removeAllObjects];
    [a1[6] removeAllObjects];
    id WeakRetained = objc_loadWeakRetained(a1 + 2);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72___UITableViewSubviewManager_rebasePrefetchedCellIndexPathsWithMapping___block_invoke;
    v22[3] = &unk_1E53094B0;
    uint64_t v24 = a2;
    v22[4] = a1;
    id v6 = WeakRetained;
    id v23 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v22];
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v8 = [a1[5] count];
    uint64_t v9 = [a1[6] count];
    if (has_internal_diagnostics)
    {
      if (v8 == v9)
      {
LABEL_6:

        return;
      }
      v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        uint64_t v11 = [a1[5] count];
        uint64_t v12 = [a1[6] count];
        id v13 = a1[5];
        id v14 = a1[6];
        *(_DWORD *)buf = 134218754;
        uint64_t v26 = v11;
        __int16 v27 = 2048;
        uint64_t v28 = v12;
        __int16 v29 = 2112;
        id v30 = v13;
        __int16 v31 = 2112;
        id v32 = v14;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
          buf,
          0x2Au);
      }
    }
    else
    {
      if (v8 == v9) {
        goto LABEL_6;
      }
      v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &rebasePrefetchedCellIndexPathsWithMapping____s_category)+ 8);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      id v17 = a1[5];
      v10 = v15;
      uint64_t v18 = [v17 count];
      uint64_t v19 = [a1[6] count];
      id v20 = a1[5];
      id v21 = a1[6];
      *(_DWORD *)buf = 134218754;
      uint64_t v26 = v18;
      __int16 v27 = 2048;
      uint64_t v28 = v19;
      __int16 v29 = 2112;
      id v30 = v20;
      __int16 v31 = 2112;
      id v32 = v21;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
        buf,
        0x2Au);
    }

    goto LABEL_6;
  }
}

- (void)storePrefetchedCell:(void *)a3 forIndexPath:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v7 = [*(id *)(a1 + 48) objectForKey:a2];

  if (has_internal_diagnostics)
  {
    if (!v7) {
      goto LABEL_4;
    }
    id v13 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      goto LABEL_22;
    }
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"IP(%ld,%ld)", objc_msgSend(a3, "section"), objc_msgSend(a3, "row"));
    v15 = NSString;
    v16 = [*(id *)(a1 + 48) objectForKey:a2];
    uint64_t v17 = [v16 section];
    uint64_t v18 = [*(id *)(a1 + 48) objectForKey:a2];
    uint64_t v19 = objc_msgSend(v15, "stringWithFormat:", @"IP(%ld,%ld)", v17, objc_msgSend(v18, "row"));
    uint64_t v20 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    uint64_t v46 = (uint64_t)v14;
    __int16 v47 = 2112;
    uint64_t v48 = (uint64_t)v19;
    __int16 v49 = 2112;
    uint64_t v50 = a2;
    __int16 v51 = 2112;
    uint64_t v52 = v20;
    _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: cell prefetched for %@ already stored for %@. Cell: %@; Prefetched Cells: %@",
      buf,
      0x2Au);
LABEL_21:

LABEL_22:
    goto LABEL_4;
  }
  if (v7)
  {
    id v30 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1255) + 8);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = NSString;
      id v13 = v30;
      id v14 = objc_msgSend(v31, "stringWithFormat:", @"IP(%ld,%ld)", objc_msgSend(a3, "section"), objc_msgSend(a3, "row"));
      id v32 = NSString;
      v16 = [*(id *)(a1 + 48) objectForKey:a2];
      uint64_t v33 = [v16 section];
      uint64_t v18 = [*(id *)(a1 + 48) objectForKey:a2];
      uint64_t v19 = objc_msgSend(v32, "stringWithFormat:", @"IP(%ld,%ld)", v33, objc_msgSend(v18, "row"));
      uint64_t v34 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      uint64_t v46 = (uint64_t)v14;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v19;
      __int16 v49 = 2112;
      uint64_t v50 = a2;
      __int16 v51 = 2112;
      uint64_t v52 = v34;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: cell prefetched for %@ already stored for %@. Cell: %@; Prefetched Cells: %@",
        buf,
        0x2Au);
      goto LABEL_21;
    }
  }
LABEL_4:
  int v8 = os_variant_has_internal_diagnostics();
  uint64_t v9 = [*(id *)(a1 + 40) objectForKey:a3];

  if (v8)
  {
    if (!v9) {
      goto LABEL_6;
    }
    id v21 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      goto LABEL_26;
    }
    v22 = objc_msgSend(NSString, "stringWithFormat:", @"IP(%ld,%ld)", objc_msgSend(a3, "section"), objc_msgSend(a3, "row"));
    id v23 = [*(id *)(a1 + 40) objectForKey:a3];
    uint64_t v24 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    uint64_t v46 = (uint64_t)v22;
    __int16 v47 = 2112;
    uint64_t v48 = (uint64_t)v23;
    __int16 v49 = 2112;
    uint64_t v50 = a2;
    __int16 v51 = 2112;
    uint64_t v52 = v24;
    _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: cell already prefetched for %@. Existing: %@; New: %@; Prefetched Cells: %@",
      buf,
      0x2Au);
LABEL_25:

LABEL_26:
    goto LABEL_6;
  }
  if (v9)
  {
    v35 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2645E8) + 8);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v36 = NSString;
      id v21 = v35;
      v22 = objc_msgSend(v36, "stringWithFormat:", @"IP(%ld,%ld)", objc_msgSend(a3, "section"), objc_msgSend(a3, "row"));
      id v23 = [*(id *)(a1 + 40) objectForKey:a3];
      uint64_t v37 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413058;
      uint64_t v46 = (uint64_t)v22;
      __int16 v47 = 2112;
      uint64_t v48 = (uint64_t)v23;
      __int16 v49 = 2112;
      uint64_t v50 = a2;
      __int16 v51 = 2112;
      uint64_t v52 = v37;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: cell already prefetched for %@. Existing: %@; New: %@; Prefetched Cells: %@",
        buf,
        0x2Au);
      goto LABEL_25;
    }
  }
LABEL_6:
  [*(id *)(a1 + 40) setObject:a2 forKey:a3];
  [*(id *)(a1 + 48) setObject:a3 forKey:a2];
  int v10 = os_variant_has_internal_diagnostics();
  uint64_t v11 = [*(id *)(a1 + 40) count];
  uint64_t v12 = [*(id *)(a1 + 48) count];
  if (v10)
  {
    if (v11 != v12)
    {
      v25 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        uint64_t v26 = [*(id *)(a1 + 40) count];
        uint64_t v27 = [*(id *)(a1 + 48) count];
        uint64_t v28 = *(void *)(a1 + 40);
        uint64_t v29 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134218754;
        uint64_t v46 = v26;
        __int16 v47 = 2048;
        uint64_t v48 = v27;
        __int16 v49 = 2112;
        uint64_t v50 = v28;
        __int16 v51 = 2112;
        uint64_t v52 = v29;
        _os_log_fault_impl(&dword_1853B0000, v25, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
          buf,
          0x2Au);
      }
      goto LABEL_29;
    }
  }
  else if (v11 != v12)
  {
    v38 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2645F0) + 8);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v40 = *(void **)(a1 + 40);
      v25 = v38;
      uint64_t v41 = [v40 count];
      uint64_t v42 = [*(id *)(a1 + 48) count];
      uint64_t v43 = *(void *)(a1 + 40);
      uint64_t v44 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218754;
      uint64_t v46 = v41;
      __int16 v47 = 2048;
      uint64_t v48 = v42;
      __int16 v49 = 2112;
      uint64_t v50 = v43;
      __int16 v51 = 2112;
      uint64_t v52 = v44;
      _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
        buf,
        0x2Au);
LABEL_29:
    }
  }
}

- (void)filterPrefetchedCells:(id *)a1
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (a1 && [a1[5] count])
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x3032000000;
    __int16 v31 = __Block_byref_object_copy__197;
    id v32 = __Block_byref_object_dispose__197;
    id v33 = 0;
    id v4 = a1[5];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __52___UITableViewSubviewManager_filterPrefetchedCells___block_invoke;
    v27[3] = &unk_1E53094D8;
    v27[4] = a2;
    v27[5] = &v28;
    [v4 enumerateKeysAndObjectsUsingBlock:v27];
    if (!v29[5])
    {
LABEL_7:
      _Block_object_dispose(&v28, 8);

      return;
    }
    id WeakRetained = objc_loadWeakRetained(a1 + 2);
    id v6 = (void *)v29[5];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __52___UITableViewSubviewManager_filterPrefetchedCells___block_invoke_2;
    uint64_t v24 = &unk_1E5309500;
    v25 = a1;
    id v7 = WeakRetained;
    id v26 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:&v21];
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    id v9 = a1[5];
    if (has_internal_diagnostics)
    {
      uint64_t v11 = objc_msgSend(v9, "count", v21, v22, v23, v24, v25);
      if (v11 == [a1[6] count]) {
        goto LABEL_6;
      }
      uint64_t v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        uint64_t v13 = [a1[5] count];
        uint64_t v14 = [a1[6] count];
        id v15 = a1[5];
        id v16 = a1[6];
        *(_DWORD *)buf = 134218754;
        uint64_t v35 = v13;
        __int16 v36 = 2048;
        uint64_t v37 = v14;
        __int16 v38 = 2112;
        id v39 = v15;
        __int16 v40 = 2112;
        id v41 = v16;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
          buf,
          0x2Au);
      }
    }
    else
    {
      uint64_t v10 = objc_msgSend(v9, "count", v21, v22, v23, v24, v25);
      if (v10 == [a1[6] count])
      {
LABEL_6:

        goto LABEL_7;
      }
      uint64_t v12 = objc_retain(*(id *)(__UILogGetCategoryCachedImpl("Assert", &filterPrefetchedCells____s_category)
                                          + 8));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [a1[5] count];
        uint64_t v18 = [a1[6] count];
        id v19 = a1[5];
        id v20 = a1[6];
        *(_DWORD *)buf = 134218754;
        uint64_t v35 = v17;
        __int16 v36 = 2048;
        uint64_t v37 = v18;
        __int16 v38 = 2112;
        id v39 = v19;
        __int16 v40 = 2112;
        id v41 = v20;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
          buf,
          0x2Au);
      }
    }

    goto LABEL_6;
  }
}

- (void)removeAllPrefetchedCells
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (a1 && [a1[5] count])
  {
    uint64_t v2 = (void *)[a1[5] copy];
    [a1[5] removeAllObjects];
    [a1[6] removeAllObjects];
    id WeakRetained = objc_loadWeakRetained(a1 + 2);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54___UITableViewSubviewManager_removeAllPrefetchedCells__block_invoke;
    v20[3] = &unk_1E5309150;
    id v4 = WeakRetained;
    id v21 = v4;
    [v2 enumerateKeysAndObjectsUsingBlock:v20];
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    uint64_t v6 = [a1[5] count];
    uint64_t v7 = [a1[6] count];
    if (has_internal_diagnostics)
    {
      if (v6 == v7)
      {
LABEL_6:

        return;
      }
      int v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        uint64_t v9 = [a1[5] count];
        uint64_t v10 = [a1[6] count];
        id v11 = a1[5];
        id v12 = a1[6];
        *(_DWORD *)buf = 134218754;
        uint64_t v23 = v9;
        __int16 v24 = 2048;
        uint64_t v25 = v10;
        __int16 v26 = 2112;
        id v27 = v11;
        __int16 v28 = 2112;
        id v29 = v12;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
          buf,
          0x2Au);
      }
    }
    else
    {
      if (v6 == v7) {
        goto LABEL_6;
      }
      uint64_t v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &removeAllPrefetchedCells___s_category) + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      id v15 = a1[5];
      int v8 = v13;
      uint64_t v16 = [v15 count];
      uint64_t v17 = [a1[6] count];
      id v18 = a1[5];
      id v19 = a1[6];
      *(_DWORD *)buf = 134218754;
      uint64_t v23 = v16;
      __int16 v24 = 2048;
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      id v27 = v18;
      __int16 v28 = 2112;
      id v29 = v19;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "UITableView internal inconsistency: prefetchedCells (%ld) and indexPathsForPrefetchedCells (%ld) are out of sync. prefetchedCells=%@; indexPathsForPrefetchedCells=%@",
        buf,
        0x2Au);
    }

    goto LABEL_6;
  }
}

- (void)initWithTableView:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v14.receiver = a1;
  v14.super_class = (Class)_UITableViewSubviewManager;
  id v3 = objc_msgSendSuper2(&v14, sel_init);
  id v4 = v3;
  if (v3)
  {
    objc_storeWeak((id *)v3 + 2, a2);
    uint64_t v5 = [MEMORY[0x1E4F28BD0] set];
    uint64_t v6 = (void *)v4[3];
    v4[3] = v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:512];
    int v8 = (void *)v4[4];
    v4[4] = v7;

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v10 = (void *)v4[5];
    v4[5] = v9;

    uint64_t v11 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
    id v12 = (void *)v4[6];
    v4[6] = v11;
  }
  return v4;
}

- (void)cellReadyForReuse:(void *)a3 withIndexPath:(char)a4 didEndDisplaying:
{
  if (a1)
  {
    if (!a2)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v11 = NSStringFromSelector(sel_cellReadyForReuse_withIndexPath_didEndDisplaying_);
      [v10 handleFailureInMethod:sel_cellReadyForReuse_withIndexPath_didEndDisplaying_, a1, @"_UITableViewSubviewManager.m", 87, @"UITableView internal inconsistency: cell should not be nil in %@", v11 object file lineNumber description];
    }
    if ((-[_UITableViewSubviewManager shouldDeferReuseOfCell:](a1, a2) & 1) == 0)
    {
      id v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:sel_cellReadyForReuse_withIndexPath_didEndDisplaying_, a1, @"_UITableViewSubviewManager.m", 88, @"UITableView internal inconsistency: cells that are not prevented from being reused should not be deferred from being reused: %@", a2 object file lineNumber description];
    }
    int v8 = [_UITableViewCellReuseParameters alloc];
    id v9 = a3;
    if (v8
      && (v14.receiver = v8,
          v14.super_class = (Class)_UITableViewCellReuseParameters,
          (uint64_t v13 = (id *)objc_msgSendSuper2(&v14, sel_init)) != 0))
    {
      objc_storeStrong(v13 + 2, a3);
      *((unsigned char *)v13 + 8) = a4;
    }
    else
    {
      uint64_t v13 = 0;
    }

    [*(id *)(a1 + 32) setObject:v13 forKey:a2];
  }
}

- (uint64_t)preventReuseOfCell:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (!a2)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = NSStringFromSelector(sel_preventReuseOfCell_);
      [v5 handleFailureInMethod:sel_preventReuseOfCell_, v3, @"_UITableViewSubviewManager.m", 95, @"UITableView internal inconsistency: cell should not be nil in %@", v6 object file lineNumber description];
    }
    id v4 = *(void **)(v3 + 24);
    return [v4 addObject:a2];
  }
  return result;
}

- (void)resumeReuseOfCell:(id *)a1
{
  if (a1)
  {
    if (!a2)
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = NSStringFromSelector(sel_resumeReuseOfCell_);
      [v6 handleFailureInMethod:sel_resumeReuseOfCell_, a1, @"_UITableViewSubviewManager.m", 101, @"UITableView internal inconsistency: cell should not be nil in %@", v7 object file lineNumber description];
    }
    if ((-[_UITableViewSubviewManager shouldDeferReuseOfCell:]((uint64_t)a1, a2) & 1) == 0)
    {
      int v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_resumeReuseOfCell_, a1, @"_UITableViewSubviewManager.m", 102, @"UITableView internal inconsistency: attempted to resume reuse of a cell that was never prevented from being reused: %@", a2 object file lineNumber description];
    }
    [a1[3] removeObject:a2];
    if (([a1[3] containsObject:a2] & 1) == 0)
    {
      id v4 = [a1[4] objectForKey:a2];
      if (v4)
      {
        id v9 = v4;
        [a1[4] removeObjectForKey:a2];
        id WeakRetained = objc_loadWeakRetained(a1 + 2);
        [WeakRetained _reuseTableViewCell:a2 withIndexPath:v9[2] didEndDisplaying:*((unsigned __int8 *)v9 + 8)];

        id v4 = v9;
      }
    }
  }
}

- (void)setReorderingCell:(id *)a1
{
  if (a1)
  {
    id v4 = a1 + 1;
    id v5 = a1[1];
    if (v5 != a2)
    {
      id v6 = v5;
      if (v5) {
        -[_UITableViewSubviewManager resumeReuseOfCell:](a1, (uint64_t)v5);
      }
      objc_storeStrong(v4, a2);
      id v5 = v6;
      if (a2)
      {
        [a1[3] addObject:a2];
        id v5 = v6;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPathsForPrefetchedCells, 0);
  objc_storeStrong((id *)&self->_prefetchedCells, 0);
  objc_storeStrong((id *)&self->_cellsReadyForReuse, 0);
  objc_storeStrong((id *)&self->_reusePreventedCells, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_storeStrong((id *)&self->_reorderingCell, 0);
}

@end