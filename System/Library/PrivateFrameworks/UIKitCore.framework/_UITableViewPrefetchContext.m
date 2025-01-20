@interface _UITableViewPrefetchContext
- (_NSRange)_offsetAndValidateRange:(_NSRange)a3 firstIndexOffset:(int64_t)a4 lastIndexOffset:(int64_t)a5;
- (_NSRange)_validatedRangeWithLocation:(int64_t)a3 length:(int64_t)a4;
- (id)computedPrefetchIndexSet;
- (id)description;
- (int)_effectiveRefreshDirectionForProposedVisibleIndexRange:(_NSRange)a3 withContentOffset:(double)a4;
- (uint64_t)cancelWithNewMaxIndex:(uint64_t)result;
- (uint64_t)pruneCellsForVisibleIndexRange:(uint64_t)a3;
- (void)initWithMaxIndex:(uint64_t)a3 prefetchItemCount:(uint64_t)a4 refreshPrefetchThresholdCount:(uint64_t)a5 cancelThresholdCount:;
- (void)schedulePrefetchRequestAfterNextCACommit:(uint64_t)a1;
- (void)updateVisibleIndexRange:(unint64_t)a3 withContentOffset:(double)a4;
@end

@implementation _UITableViewPrefetchContext

- (uint64_t)pruneCellsForVisibleIndexRange:(uint64_t)a3
{
  if (result)
  {
    uint64_t v3 = result;
    result = *(void *)(result + 40);
    if (result)
    {
      if (a2 <= 1) {
        uint64_t v4 = 1;
      }
      else {
        uint64_t v4 = a2;
      }
      uint64_t v5 = *(void *)(v3 + 56);
      if (v5 >= a2 + a3) {
        uint64_t v5 = a2 + a3;
      }
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, v4 - 1, v5 - v4 + 2);
    }
  }
  return result;
}

- (uint64_t)cancelWithNewMaxIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    *(unsigned char *)(result + 8) = 0;
    id v4 = *(id *)(result + 24);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = [*(id *)(v3 + 48) count];

      if (v6)
      {
        v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(v3 + 48), "count"));
        v8 = *(void **)(v3 + 48);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __53___UITableViewPrefetchContext_cancelWithNewMaxIndex___block_invoke;
        v10[3] = &unk_1E52DA548;
        id v11 = v7;
        id v9 = v7;
        [v8 enumerateIndexesUsingBlock:v10];
        (*(void (**)(void))(*(void *)(v3 + 24) + 16))();
      }
    }
    result = [*(id *)(v3 + 48) removeAllIndexes];
    *(void *)(v3 + 96) = 0;
    *(void *)(v3 + 104) = 0;
    *(void *)(v3 + 56) = a2;
    *(void *)(v3 + 64) = 0x7FEFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)initWithMaxIndex:(uint64_t)a3 prefetchItemCount:(uint64_t)a4 refreshPrefetchThresholdCount:(uint64_t)a5 cancelThresholdCount:
{
  if (!a1) {
    return 0;
  }
  v20.receiver = a1;
  v20.super_class = (Class)_UITableViewPrefetchContext;
  id v9 = objc_msgSendSuper2(&v20, sel_init);
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v11 = (void *)v9[6];
    v9[6] = v10;

    v9[7] = a2;
    if (a3) {
      BOOL v12 = a4 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    int v14 = v12 || a3 < a4;
    BOOL v15 = v14 == 0;
    uint64_t v16 = 20;
    if (v15) {
      uint64_t v16 = a3;
    }
    uint64_t v17 = 10;
    if (v15) {
      uint64_t v17 = a4;
    }
    v9[9] = v16;
    v9[10] = v17;
    if (!a5 || v16 > a5)
    {
      if (a3 >= 0) {
        uint64_t v18 = a3;
      }
      else {
        uint64_t v18 = a3 + 1;
      }
      a5 = v16 + (v18 >> 1);
    }
    v9[12] = 0;
    v9[13] = 0;
    v9[11] = a5;
    v9[8] = 0x7FEFFFFFFFFFFFFFLL;
  }
  return v9;
}

- (void)updateVisibleIndexRange:(unint64_t)a3 withContentOffset:(double)a4
{
  if (!a1) {
    return;
  }
  if (*(unsigned char *)(a1 + 8) || a3 == 0) {
    return;
  }
  uint64_t v8 = a2 + a3;
  if (a2 + a3 - 1 > *(void *)(a1 + 56))
  {
    if (os_variant_has_internal_diagnostics())
    {
      v61 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v61, OS_LOG_TYPE_FAULT, "UIKit internal bug: table view prefetch context updated with an out-of-bounds visible range; the _maxIndex is probably stale",
          buf,
          2u);
      }
    }
    else
    {
      id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &updateVisibleIndexRange_withContentOffset____s_category)+ 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "UIKit internal bug: table view prefetch context updated with an out-of-bounds visible range; the _maxIndex is probably stale",
          buf,
          2u);
      }
    }
    return;
  }
  unsigned int v11 = [(id)a1 _effectiveRefreshDirectionForProposedVisibleIndexRange:a2 withContentOffset:a3];
  *(void *)(a1 + 96) = a2;
  *(void *)(a1 + 104) = a3;
  *(double *)(a1 + 64) = a4;
  objc_msgSend(*(id *)(a1 + 48), "removeIndexesInRange:", a2, a3);
  if (v11 == 3) {
    return;
  }
  id v12 = *(id *)(a1 + 24);
  unint64_t v66 = v8;
  if (v12)
  {
  }
  else if (!*(void *)(a1 + 16))
  {
    id v67 = 0;
    goto LABEL_59;
  }
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__196;
  v73 = __Block_byref_object_dispose__196;
  id v74 = 0;
  if ([*(id *)(a1 + 48) count])
  {
    v13 = (void *)[(id)a1 _offsetAndValidateRange:a2 firstIndexOffset:a3 lastIndexOffset:-*(void *)(a1 + 88)];
    unint64_t v15 = v14;
    unint64_t v16 = [*(id *)(a1 + 48) firstIndex];
    uint64_t v17 = [*(id *)(a1 + 48) lastIndex];
    uint64_t v18 = [*(id *)(a1 + 48) firstIndex];
    if ((unint64_t)v13 > v16 || (unint64_t)v13 + v15 < v16 + v17 - v18 + 1)
    {
      v19 = *(void **)(a1 + 48);
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v76 = 3221225472;
      v77 = (uint64_t (*)(uint8_t *, uint64_t, uint64_t))__74___UITableViewPrefetchContext_computeIndexesToCancelForVisibleIndexRange___block_invoke;
      v78 = &unk_1E5309410;
      id v80 = v13;
      unint64_t v81 = v15;
      v79 = &v69;
      [v19 enumerateIndexesUsingBlock:buf];
      objc_super v20 = (void *)v70[5];
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __74___UITableViewPrefetchContext_computeIndexesToCancelForVisibleIndexRange___block_invoke_2;
      v68[3] = &unk_1E5309438;
      v68[4] = a1;
      [v20 enumerateObjectsUsingBlock:v68];
    }
  }
  id v67 = (id)v70[5];
  _Block_object_dispose(&v69, 8);

  uint64_t v21 = *(void *)(a1 + 80) + 1;
  if ((v11 | 2) == 2)
  {
    uint64_t v22 = [(id)a1 _validatedRangeWithLocation:a2 - v21 length:*(void *)(a1 + 80) + 1];
    uint64_t v24 = v23;
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v24 = 0;
  }
  if (v11 > 1)
  {
    uint64_t v25 = 0;
    uint64_t v27 = 0;
  }
  else
  {
    uint64_t v25 = [(id)a1 _validatedRangeWithLocation:v8 length:v21];
    uint64_t v27 = v26;
  }
  *(void *)buf = MEMORY[0x1E4F143A8];
  uint64_t v76 = 3221225472;
  v77 = (uint64_t (*)(uint8_t *, uint64_t, uint64_t))__91___UITableViewPrefetchContext_shouldRefreshForVisibleIndexRange_effectiveRefreshDirection___block_invoke;
  v78 = &unk_1E5309460;
  v79 = (uint64_t *)a1;
  switch(v11)
  {
    case 0u:
      unint64_t v32 = objc_msgSend(*(id *)(a1 + 48), "countOfIndexesInRange:", v22, v24);
      if (v32 <= v79[10] || (v77(buf, v25, v27) & 1) != 0)
      {
        uint64_t v33 = [(id)a1 _offsetAndValidateRange:a2 firstIndexOffset:a3 lastIndexOffset:-*(void *)(a1 + 72)];
        id v35 = v34;
        if (v34)
        {
          v64 = v34;
          unint64_t v65 = v33;
          v36 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", v33, v34);
          objc_msgSend(v36, "removeIndexesInRange:", a2, a3);
          unint64_t v37 = ((unint64_t)[v36 count] >> 1) + 1;
          v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v37];
          v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v37];
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v76 = 3221225472;
          v77 = (uint64_t (*)(uint8_t *, uint64_t, uint64_t))__101___UITableViewPrefetchContext_computeIndexesToRefreshForVisibleIndexRange_effectiveRefreshDirection___block_invoke;
          v78 = &unk_1E52E0CE0;
          unint64_t v81 = a2;
          unint64_t v82 = a3;
          v40 = v38;
          v79 = v40;
          id v41 = v39;
          id v80 = v41;
          [v36 enumerateIndexesUsingBlock:buf];
          id v35 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v36, "count"));
          v63 = v40;
          v42 = [v40 objectEnumerator];
          v62 = v41;
          v43 = [v41 objectEnumerator];
          uint64_t v44 = 0;
          v45 = 0;
          do
          {
            v46 = (void *)v44;
            uint64_t v44 = [v43 nextObject];

            if (v44) {
              [v35 addObject:v44];
            }
            uint64_t v47 = [v42 nextObject];

            if (v47) {
              [v35 addObject:v47];
            }
            v45 = (void *)v47;
          }
          while (v44 | v47);

          unsigned int v11 = 0;
LABEL_57:
          v52 = v64;
          unint64_t v51 = v65;
LABEL_61:
          objc_msgSend(*(id *)(a1 + 48), "addIndexesInRange:", v51, v52);
          objc_msgSend(*(id *)(a1 + 48), "removeIndexesInRange:", a2, a3);
          goto LABEL_64;
        }
      }
      else
      {
        id v35 = 0;
      }
      unsigned int v11 = 0;
      goto LABEL_64;
    case 1u:
      unint64_t v48 = objc_msgSend(*(id *)(a1 + 48), "countOfIndexesInRange:", v25, v27);
      if (v48 > v79[10]) {
        goto LABEL_59;
      }
      int v31 = 0;
      uint64_t v29 = *(void *)(a1 + 72);
      uint64_t v30 = a3;
      break;
    case 2u:
      unint64_t v28 = objc_msgSend(*(id *)(a1 + 48), "countOfIndexesInRange:", v22, v24);
      if (v28 > v79[10]) {
        goto LABEL_59;
      }
      uint64_t v29 = 0;
      uint64_t v30 = -*(void *)(a1 + 72);
      int v31 = 1;
      break;
    default:
      goto LABEL_59;
  }
  unint64_t v49 = objc_msgSend((id)a1, "_offsetAndValidateRange:firstIndexOffset:lastIndexOffset:", a2, a3, v30, v29);
  if (v50)
  {
    unint64_t v51 = v49;
    v52 = v50;
    if (v49 < (unint64_t)&v50[v49])
    {
      id v35 = 0;
      v64 = v50;
      unint64_t v65 = v49;
      v53 = v50;
      unint64_t v54 = v49;
      while (1)
      {
        if (a2 <= v54 && v54 - a2 < a3 || (objc_msgSend(*(id *)(a1 + 48), "containsIndex:", v54, v52) & 1) != 0) {
          goto LABEL_56;
        }
        if (!v35) {
          id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        if (v31) {
          break;
        }
        if (v11 == 1)
        {
          v55 = [NSNumber numberWithUnsignedInteger:v54];
          [v35 addObject:v55];
          goto LABEL_55;
        }
LABEL_56:
        ++v54;
        if (!--v53) {
          goto LABEL_57;
        }
      }
      v55 = [NSNumber numberWithUnsignedInteger:v54];
      [v35 insertObject:v55 atIndex:0];
LABEL_55:

      goto LABEL_56;
    }
    id v35 = 0;
    goto LABEL_61;
  }
LABEL_59:
  id v35 = 0;
LABEL_64:
  int v56 = _isNotifyingIdleObservers;
  if ([v67 count])
  {
    uint64_t v57 = *(void *)(a1 + 24);
    if (v57) {
      (*(void (**)(uint64_t, id))(v57 + 16))(v57, v67);
    }
  }
  if (![v35 count]) {
    goto LABEL_74;
  }
  uint64_t v58 = *(void *)(a1 + 16);
  if (!v58) {
    goto LABEL_74;
  }
  if (v56)
  {
LABEL_73:
    (*(void (**)(uint64_t, id))(v58 + 16))(v58, v35);
LABEL_74:
    if (v56 && *(void *)(a1 + 32))
    {
      uint64_t v59 = v11 == 2 ? a2 - 1 : v66;
      [(id)a1 _validatedRangeWithLocation:v59 length:1];
      if (v60 == 1) {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
    goto LABEL_81;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    uint64_t v58 = *(void *)(a1 + 16);
    goto LABEL_73;
  }
  -[_UITableViewPrefetchContext schedulePrefetchRequestAfterNextCACommit:](a1, v35);
LABEL_81:
}

- (void)schedulePrefetchRequestAfterNextCACommit:(uint64_t)a1
{
  id v3 = a2;
  *(unsigned char *)(a1 + 8) = 1;
  id v4 = (void *)UIApp;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72___UITableViewPrefetchContext_schedulePrefetchRequestAfterNextCACommit___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = a1;
  id v5 = v3;
  id v7 = v5;
  [v4 _performBlockAfterCATransactionCommits:v6];
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; %@>", v5, self, self->_outstandingRequests];

  return v6;
}

- (int)_effectiveRefreshDirectionForProposedVisibleIndexRange:(_NSRange)a3 withContentOffset:(double)a4
{
  NSUInteger location = self->_lastVisibleIndexRange.location;
  NSUInteger length = self->_lastVisibleIndexRange.length;
  if (location != a3.location || length != a3.length)
  {
    if (!a3.location) {
      return 1;
    }
    NSUInteger maxIndex = self->_maxIndex;
    BOOL v9 = maxIndex >= a3.location;
    NSUInteger v8 = maxIndex - a3.location;
    BOOL v9 = !v9 || v8 >= a3.length;
    if (!v9) {
      return 2;
    }
    if (length) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = a3.length == 0;
    }
    char v11 = !v10;
    if (v10 && a3.length)
    {
      if (length)
      {
        if (location != a3.location)
        {
          if (a3.location > location) {
            return 1;
          }
          else {
            return 2;
          }
        }
        if (a3.length > length) {
          return 1;
        }
      }
    }
    else if (v11)
    {
      return 0;
    }
  }
  double lastContentOffset = self->_lastContentOffset;
  if (lastContentOffset == 1.79769313e308 || vabdd_f64(a4, lastContentOffset) <= 0.01) {
    return 3;
  }
  if (lastContentOffset < a4) {
    return 1;
  }
  return 2;
}

- (_NSRange)_offsetAndValidateRange:(_NSRange)a3 firstIndexOffset:(int64_t)a4 lastIndexOffset:(int64_t)a5
{
  int64_t maxIndex = a3.length + a3.location + a5 - 1;
  int64_t v6 = (a3.location + a4) & ~((int64_t)(a3.location + a4) >> 63);
  if (maxIndex >= self->_maxIndex) {
    int64_t maxIndex = self->_maxIndex;
  }
  BOOL v7 = maxIndex < v6;
  int64_t v8 = maxIndex - v6;
  if (v7) {
    NSUInteger v9 = 0;
  }
  else {
    NSUInteger v9 = v8 + 1;
  }
  if (v7) {
    NSUInteger v10 = 0;
  }
  else {
    NSUInteger v10 = (a3.location + a4) & ~((int64_t)(a3.location + a4) >> 63);
  }
  result.NSUInteger length = v9;
  result.NSUInteger location = v10;
  return result;
}

- (_NSRange)_validatedRangeWithLocation:(int64_t)a3 length:(int64_t)a4
{
  NSUInteger v5 = 0;
  NSUInteger v6 = 0;
  if ((a3 & 0x8000000000000000) == 0 && a4 >= 1)
  {
    int64_t v7 = a3 + a4 - 1;
    int64_t maxIndex = self->_maxIndex;
    if (v7 <= maxIndex) {
      NSUInteger v5 = a3;
    }
    else {
      NSUInteger v5 = 0;
    }
    if (v7 <= maxIndex) {
      NSUInteger v6 = a4;
    }
    else {
      NSUInteger v6 = 0;
    }
  }
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (id)computedPrefetchIndexSet
{
  return self->_outstandingRequests;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong(&self->_cellPruningHandler, 0);
  objc_storeStrong(&self->_cellHandler, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_requestHandler, 0);
}

@end