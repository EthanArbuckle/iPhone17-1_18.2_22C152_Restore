@interface NSMutableArray(VideosUICore)
- (BOOL)vui_applyChangeSet:()VideosUICore destinationObjectsBlock:updateObjectBlock:;
- (uint64_t)vui_addObjectIfNotNil:()VideosUICore;
- (uint64_t)vui_addObjectsFromArrayIfNotNil:()VideosUICore;
- (uint64_t)vui_applyChangeSet:()VideosUICore destinationObjects:;
- (uint64_t)vui_applyChangeSet:()VideosUICore destinationObjects:updateObjectBlock:;
- (uint64_t)vui_applyChangeSet:()VideosUICore destinationObjectsBlock:;
- (uint64_t)vui_applyChangeSetIfAvailable:()VideosUICore destinationObjects:replaceContentsOnNilChanges:;
- (void)_vui_applyUpdateChanges:()VideosUICore destinationObjectsBlock:updateObjectBlock:;
@end

@implementation NSMutableArray(VideosUICore)

- (uint64_t)vui_addObjectIfNotNil:()VideosUICore
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    id v4 = (id)[a1 addObject:v4];
    id v5 = v7;
  }
  return MEMORY[0x1F41817F8](v4, v5);
}

- (uint64_t)vui_applyChangeSet:()VideosUICore destinationObjects:
{
  return objc_msgSend(a1, "vui_applyChangeSetIfAvailable:destinationObjects:replaceContentsOnNilChanges:", a3, a4, 0);
}

- (uint64_t)vui_applyChangeSetIfAvailable:()VideosUICore destinationObjects:replaceContentsOnNilChanges:
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = objc_msgSend(a1, "vui_applyChangeSet:destinationObjects:updateObjectBlock:", v8, v9, 0);
  }
  else if (a5)
  {
    [a1 removeAllObjects];
    [a1 addObjectsFromArray:v9];
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (uint64_t)vui_applyChangeSet:()VideosUICore destinationObjects:updateObjectBlock:
{
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__NSMutableArray_VideosUICore__vui_applyChangeSet_destinationObjects_updateObjectBlock___block_invoke;
  v12[3] = &unk_1E6DDD0B0;
  id v13 = v8;
  id v9 = v8;
  uint64_t v10 = objc_msgSend(a1, "vui_applyChangeSet:destinationObjectsBlock:updateObjectBlock:", a3, v12, a5);

  return v10;
}

- (uint64_t)vui_applyChangeSet:()VideosUICore destinationObjectsBlock:
{
  return objc_msgSend(a1, "vui_applyChangeSet:destinationObjectsBlock:updateObjectBlock:", a3, a4, 0);
}

- (BOOL)vui_applyChangeSet:()VideosUICore destinationObjectsBlock:updateObjectBlock:
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v55 = a4;
  id v53 = a5;
  id v8 = [MEMORY[0x1E4F28E60] indexSet];
  id v9 = [v7 deleteChange];
  uint64_t v10 = [v9 sourceIndexes];

  if (v10) {
    [v8 addIndexes:v10];
  }
  v52 = (void *)v10;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v54 = v7;
  v12 = [v7 moveChanges];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v63 objects:v68 count:16];
  v14 = v8;
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v64 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        v19 = [v18 sourceIndexes];
        uint64_t v20 = [v19 firstIndex];

        v21 = [a1 objectAtIndex:v20];
        v22 = [v18 destinationIndexes];
        uint64_t v23 = [v22 firstIndex];

        v24 = [NSNumber numberWithUnsignedInteger:v23];
        [v11 setObject:v21 forKey:v24];

        id v8 = v14;
        [v14 addIndex:v20];
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v63 objects:v68 count:16];
    }
    while (v15);
  }
  uint64_t v25 = [v8 count];
  BOOL v26 = v25 != 0;
  if (v25)
  {
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __93__NSMutableArray_VideosUICore__vui_applyChangeSet_destinationObjectsBlock_updateObjectBlock___block_invoke;
    v62[3] = &unk_1E6DDDB78;
    v62[4] = a1;
    v27 = [v8 indexesPassingTest:v62];
    [a1 removeObjectsAtIndexes:v27];
  }
  v28 = [v54 insertChange];
  v29 = [v28 destinationIndexes];
  v30 = v29;
  if (v29)
  {
    id v31 = v29;
  }
  else
  {
    id v31 = [MEMORY[0x1E4F28D60] indexSet];
  }
  v56 = v31;

  v32 = [MEMORY[0x1E4F28E60] indexSet];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v33 = v12;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v59 != v36) {
          objc_enumerationMutation(v33);
        }
        v38 = [*(id *)(*((void *)&v58 + 1) + 8 * j) destinationIndexes];
        uint64_t v39 = [v38 firstIndex];

        [v32 addIndex:v39];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v35);
  }

  if ([v32 count] || objc_msgSend(v56, "count"))
  {
    unint64_t v40 = [v56 firstIndex];
    uint64_t v41 = [v32 firstIndex];
    unint64_t v42 = v41;
    int v43 = v41 != 0x7FFFFFFFFFFFFFFFLL;
    BOOL v44 = v40 != 0x7FFFFFFFFFFFFFFFLL;
    for (k = v54; v40 != 0x7FFFFFFFFFFFFFFFLL || v42 != 0x7FFFFFFFFFFFFFFFLL; BOOL v44 = v40 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v44 && (v43 & 1) != 0)
      {
        if (v40 > v42) {
          goto LABEL_34;
        }
      }
      else if ((v44 & ~v43 & 1) == 0)
      {
LABEL_34:
        v49 = [NSNumber numberWithUnsignedInteger:v42];
        v47 = [v11 objectForKey:v49];

        if (v47 && v42 <= [a1 count]) {
          [a1 insertObject:v47 atIndex:v42];
        }
        unint64_t v42 = [v32 indexGreaterThanIndex:v42];
        goto LABEL_38;
      }
      v46 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v40];
      v47 = v55[2](v55, v46);

      v48 = [v47 firstObject];
      if (v48 && v40 <= [a1 count]) {
        [a1 insertObject:v48 atIndex:v40];
      }
      unint64_t v40 = [v56 indexGreaterThanIndex:v40];

LABEL_38:
      int v43 = v42 != 0x7FFFFFFFFFFFFFFFLL;
    }
    BOOL v26 = 1;
  }
  else
  {
    k = v54;
  }
  v50 = [k updateChanges];
  if (v50)
  {
    objc_msgSend(a1, "_vui_applyUpdateChanges:destinationObjectsBlock:updateObjectBlock:", v50, v55, v53);
    BOOL v26 = 1;
  }

  return v26;
}

- (uint64_t)vui_addObjectsFromArrayIfNotNil:()VideosUICore
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v7 = v4;
    id v4 = (id)[a1 addObjectsFromArray:v4];
    id v5 = v7;
  }
  return MEMORY[0x1F41817F8](v4, v5);
}

- (void)_vui_applyUpdateChanges:()VideosUICore destinationObjectsBlock:updateObjectBlock:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v23 = a4;
  id v9 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v8;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v15 = [v14 sourceIndexes];
        uint64_t v16 = [v14 destinationIndexes];
        uint64_t v17 = [v16 firstIndex];
        v18 = [a1 objectAtIndex:v17];
        if (v9)
        {
          v19 = [v14 updateChangeSet];
          v9[2](v9, v19, v18, v17);
        }
        else
        {
          v19 = v23[2](v23, v16);
          [v19 firstObject];
          uint64_t v20 = v11;
          v22 = uint64_t v21 = v12;
          [a1 replaceObjectAtIndex:v17 withObject:v22];

          uint64_t v12 = v21;
          uint64_t v11 = v20;
          id v9 = 0;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }
}

@end