@interface PXPlacesMapInPlaceLayoutDiffer
- (void)_computeChanges;
@end

@implementation PXPlacesMapInPlaceLayoutDiffer

- (void)_computeChanges
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v3 = [(PXPlacesMapLayoutDiffer *)self targetLayoutResult];
  v4 = [v3 layoutItems];
  v5 = [v4 set];
  v42 = (void *)[v5 mutableCopy];

  v6 = [(PXPlacesMapLayoutDiffer *)self sourceLayoutResult];
  v7 = [v6 layoutItems];
  v8 = [v7 set];
  v43 = (void *)[v8 mutableCopy];

  v9 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v10 = [(PXPlacesMapLayoutDiffer *)self sourceLayoutResult];
  v11 = [v10 layoutItems];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v56 objects:v63 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v57 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        [v16 coordinate];
        v19 = objc_msgSend(NSString, "stringWithFormat:", @"%f,%f", v17, v18);
        [v9 setObject:v16 forKey:v19];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v56 objects:v63 count:16];
    }
    while (v13);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v20 = [(PXPlacesMapLayoutDiffer *)self targetLayoutResult];
  v21 = [v20 layoutItems];

  obuint64_t j = v21;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v52 objects:v62 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v53 != v24) {
          objc_enumerationMutation(obj);
        }
        v26 = *(void **)(*((void *)&v52 + 1) + 8 * j);
        [v26 coordinate];
        v29 = objc_msgSend(NSString, "stringWithFormat:", @"%f,%f", v27, v28);
        v30 = [v9 objectForKey:v29];
        if (v30)
        {
          [(PXPlacesMapLayoutDiffer *)self _relateSourceLayoutItem:v30 withTargetLayoutItem:v26];
          [v42 removeObject:v26];
          [v43 removeObject:v30];
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    }
    while (v23);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v31 = v42;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v49 != v34) {
          objc_enumerationMutation(v31);
        }
        [(PXPlacesMapLayoutDiffer *)self _addTargetLayoutItem:*(void *)(*((void *)&v48 + 1) + 8 * k)];
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v33);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v36 = v43;
  uint64_t v37 = [v36 countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v38; ++m)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(v36);
        }
        [(PXPlacesMapLayoutDiffer *)self _removeSourceLayoutItem:*(void *)(*((void *)&v44 + 1) + 8 * m)];
      }
      uint64_t v38 = [v36 countByEnumeratingWithState:&v44 objects:v60 count:16];
    }
    while (v38);
  }
}

@end