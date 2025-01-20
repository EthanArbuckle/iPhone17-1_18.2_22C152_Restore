@interface _UIDataSourceBatchUpdateMapHelper
- (id)description;
- (id)finalIndexPathForInitialIndexPath:(uint64_t)a1;
- (id)initWithInitialSnapshot:(void *)a3 finalSnapshot:(void *)a4 updates:(int)a5 assertingForInvalidUpdates:;
- (id)initialIndexPathForFinalIndexPath:(uint64_t)a1;
- (uint64_t)finalGlobalIndexForInitialGlobalIndex:(uint64_t)result;
- (uint64_t)finalSectionIndexForInitialSectionIndex:(uint64_t)result;
- (uint64_t)initialGlobalIndexForFinalGlobalIndex:(uint64_t)result;
- (uint64_t)initialSectionIndexForFinalSectionIndex:(uint64_t)result;
- (void)dealloc;
@end

@implementation _UIDataSourceBatchUpdateMapHelper

- (id)initWithInitialSnapshot:(void *)a3 finalSnapshot:(void *)a4 updates:(int)a5 assertingForInvalidUpdates:
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v49 = a2;
  id v50 = a3;
  id v51 = a4;
  if (a1)
  {
    v53.receiver = a1;
    v53.super_class = (Class)_UIDataSourceBatchUpdateMapHelper;
    v9 = (id *)objc_msgSendSuper2(&v53, sel_init);
    a1 = v9;
    if (!v9) {
      goto LABEL_24;
    }
    objc_storeStrong(v9 + 1, a2);
    objc_storeStrong(a1 + 2, a3);
    objc_storeStrong(a1 + 3, a4);
    id v10 = a1[1];
    unint64_t v11 = [v10 numberOfSections];
    uint64_t v12 = v11;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!HIDWORD(v11))
      {
LABEL_6:
        unint64_t v13 = [v10 numberOfItems];
        uint64_t v14 = v13;
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!HIDWORD(v13))
          {
LABEL_9:
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke;
            aBlock[3] = &unk_1E52E6400;
            id v15 = v10;
            id v67 = v15;
            v48 = _Block_copy(aBlock);
            v64[0] = MEMORY[0x1E4F143A8];
            v64[1] = 3221225472;
            v64[2] = __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_2;
            v64[3] = &unk_1E52E6400;
            id v45 = v15;
            id v65 = v45;
            v46 = _Block_copy(v64);
            id v16 = a1[2];
            unint64_t v17 = [v16 numberOfSections];
            uint64_t v18 = v17;
            if (v17 != 0x7FFFFFFFFFFFFFFFLL)
            {
              if (!HIDWORD(v17))
              {
LABEL_12:
                unint64_t v19 = [v16 numberOfItems];
                unint64_t v20 = v19;
                if (v19 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  if (!HIDWORD(v19))
                  {
                    unint64_t v21 = v19 << 32;
LABEL_16:
                    v62[0] = MEMORY[0x1E4F143A8];
                    v62[1] = 3221225472;
                    v62[2] = __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_3;
                    v62[3] = &unk_1E52E6400;
                    id v22 = v16;
                    id v63 = v22;
                    v47 = _Block_copy(v62);
                    v60[0] = MEMORY[0x1E4F143A8];
                    v60[1] = 3221225472;
                    v60[2] = __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_4;
                    v60[3] = &unk_1E52E6400;
                    id v23 = v22;
                    id v61 = v23;
                    v24 = _Block_copy(v60);
                    id v25 = a1[3];
                    v58[0] = MEMORY[0x1E4F143A8];
                    v58[1] = 3221225472;
                    v58[2] = __83___UIDataSourceBatchUpdateMapHelper__generateUpdateMapsAssertingForInvalidUpdates___block_invoke_5;
                    v58[3] = &unk_1E52E6428;
                    id v26 = v25;
                    id v59 = v26;
                    v27 = _Block_copy(v58);
                    v57[0] = v12 | (v14 << 32);
                    v57[1] = _Block_copy(v48);
                    v57[2] = _Block_copy(v46);
                    v56[0] = v21 | v18;
                    v56[1] = _Block_copy(v47);
                    v56[2] = _Block_copy(v24);
                    uint64_t v28 = [v26 count];
                    __copy_constructor_8_8_sb0_sb8_sb16_sb24_sb32_sb40(v55, (const void **)&_UIDataSourceUpdateProcessingCallbacksNULL);
                    id v54 = 0;
                    _UIDataSourceGenerateUpdateMaps((unsigned int *)v57, (unsigned int *)v56, v28, (uint64_t)v27, (uint64_t *)v55, &v54, (uint64_t)buf);
                    id v29 = v54;
                    v30 = v71;
                    long long v32 = v69;
                    long long v31 = v70;
                    *((_OWORD *)a1 + 2) = *(_OWORD *)buf;
                    *((_OWORD *)a1 + 3) = v32;
                    *((_OWORD *)a1 + 4) = v31;
                    a1[10] = v30;
                    if (*((unsigned char *)a1 + 80))
                    {
                      if (a5)
                      {
                        v33 = [MEMORY[0x1E4F28B00] currentHandler];
                        [v33 handleFailureInMethod:sel__generateUpdateMapsAssertingForInvalidUpdates_, a1, @"_UIDataSourceBatchUpdateMapHelper.m", 82, @"%@", v29 object file lineNumber description];
                      }
                      else
                      {
                        v34 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICollectionView", &_generateUpdateMapsAssertingForInvalidUpdates____s_category)+ 8);
                        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(void *)&buf[4] = v29;
                          _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "Failed to generate data source update maps: %@", buf, 0xCu);
                        }
                      }
                    }

                    if ((a5 & 1) == 0 && *((unsigned char *)a1 + 80)) {
                      goto LABEL_23;
                    }
LABEL_24:
                    a1 = a1;
                    v35 = a1;
                    goto LABEL_25;
                  }
                  v43 = [MEMORY[0x1E4F28B00] currentHandler];
                  v44 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
                  objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v20);
                }
                unint64_t v21 = 0xFFFFFFFF00000000;
                goto LABEL_16;
              }
              v41 = [MEMORY[0x1E4F28B00] currentHandler];
              v42 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
              objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v18);
            }
            uint64_t v18 = 0xFFFFFFFFLL;
            goto LABEL_12;
          }
          v39 = [MEMORY[0x1E4F28B00] currentHandler];
          v40 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
          objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v14);
        }
        uint64_t v14 = 0xFFFFFFFFLL;
        goto LABEL_9;
      }
      v37 = [MEMORY[0x1E4F28B00] currentHandler];
      v38 = [NSString stringWithUTF8String:"_UIMapIndex _UIMapIndexFromNSInteger(const NSInteger)"];
      objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, @"_UIDataSourceBatchUpdateMap.h", 28, @"NSInteger index is negative or too large: %ld", v12);
    }
    uint64_t v12 = 0xFFFFFFFFLL;
    goto LABEL_6;
  }
LABEL_23:
  v35 = 0;
LABEL_25:

  return v35;
}

- (uint64_t)initialGlobalIndexForFinalGlobalIndex:(uint64_t)result
{
  if (result)
  {
    unint64_t v3 = *(unsigned int *)(result + 44);
    uint64_t v4 = *(void *)(result + 72);
    if (!v4)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapOldGlobalItemForNewGlobalItem(const _UIDataSourceUpdateMaps, const NSInteger)");
      [v5 handleFailureInFunction:v6, @"_UIDataSourceBatchUpdateMap.h", 185, @"Invalid parameter not satisfying: %@", @"updateMaps.newGlobalItemMap != NULL" file lineNumber description];
    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v3 <= a2) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    result = *(unsigned int *)(v4 + 4 * a2);
    if (result == -1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (uint64_t)finalGlobalIndexForInitialGlobalIndex:(uint64_t)result
{
  if (result)
  {
    unint64_t v3 = *(unsigned int *)(result + 40);
    uint64_t v4 = *(void *)(result + 64);
    if (!v4)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      v6 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapNewGlobalItemForOldGlobalItem(const _UIDataSourceUpdateMaps, const NSInteger)");
      [v5 handleFailureInFunction:v6, @"_UIDataSourceBatchUpdateMap.h", 171, @"Invalid parameter not satisfying: %@", @"updateMaps.oldGlobalItemMap != NULL" file lineNumber description];
    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v3 <= a2) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    result = *(unsigned int *)(v4 + 4 * a2);
    if (result == -1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (id)initialIndexPathForFinalIndexPath:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    if ([v3 section] == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v4, "item") == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = v4;
    }
    else
    {
      uint64_t v7 = -[_UIDataSourceBatchUpdateMapHelper initialGlobalIndexForFinalGlobalIndex:](a1, [*(id *)(a1 + 16) globalIndexForIndexPath:v4]);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v5 = 0;
        goto LABEL_10;
      }
      id v6 = [*(id *)(a1 + 8) indexPathForGlobalIndex:v7];
    }
    v5 = v6;
  }
LABEL_10:

  return v5;
}

- (id)finalIndexPathForInitialIndexPath:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    if ([v3 section] == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v4, "item") == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = v4;
    }
    else
    {
      uint64_t v7 = -[_UIDataSourceBatchUpdateMapHelper finalGlobalIndexForInitialGlobalIndex:](a1, [*(id *)(a1 + 8) globalIndexForIndexPath:v4]);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v5 = 0;
        goto LABEL_10;
      }
      id v6 = [*(id *)(a1 + 16) indexPathForGlobalIndex:v7];
    }
    v5 = v6;
  }
LABEL_10:

  return v5;
}

- (uint64_t)initialSectionIndexForFinalSectionIndex:(uint64_t)result
{
  if (result)
  {
    unint64_t v3 = *(unsigned int *)(result + 36);
    uint64_t v4 = *(void *)(result + 56);
    if (!v4)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapOldSectionForNewSection(const _UIDataSourceUpdateMaps, const NSInteger)");
      [v5 handleFailureInFunction:v6, @"_UIDataSourceBatchUpdateMap.h", 157, @"Invalid parameter not satisfying: %@", @"updateMaps.newSectionMap != NULL" file lineNumber description];
    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v3 <= a2) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    result = *(unsigned int *)(v4 + 4 * a2);
    if (result == -1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (uint64_t)finalSectionIndexForInitialSectionIndex:(uint64_t)result
{
  if (result)
  {
    unint64_t v3 = *(unsigned int *)(result + 32);
    uint64_t v4 = *(void *)(result + 48);
    if (!v4)
    {
      v5 = [MEMORY[0x1E4F28B00] currentHandler];
      id v6 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _UIUpdateMapNewSectionForOldSection(const _UIDataSourceUpdateMaps, const NSInteger)");
      [v5 handleFailureInFunction:v6, @"_UIDataSourceBatchUpdateMap.h", 143, @"Invalid parameter not satisfying: %@", @"updateMaps.oldSectionMap != NULL" file lineNumber description];
    }
    if (a2 > 0x7FFFFFFFFFFFFFFELL) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v3 <= a2) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    result = *(unsigned int *)(v4 + 4 * a2);
    if (result == -1) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (void)dealloc
{
  _UIDataSourceDestroyUpdateMaps((uint64_t)&self->_updateMaps);
  v3.receiver = self;
  v3.super_class = (Class)_UIDataSourceBatchUpdateMapHelper;
  [(_UIDataSourceBatchUpdateMapHelper *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"[%@ - %p: initialSnapshot = %@;  finalSnapshot= %@; items = %@]",
    v5,
    self,
    self->_initialSnapshot,
    self->_finalSnapshot,
  id v6 = self->_updateItems);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateItems, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
}

@end