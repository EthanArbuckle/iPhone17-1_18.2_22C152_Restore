@interface PXPlacesMapInPlaceUpdatePlan
- (NSMapTable)currentLayoutItemToAnnotationTable;
- (PXPlacesMapInPlaceUpdatePlan)init;
- (PXPlacesMapLayoutResult)currentLayoutResult;
- (PXPlacesMapPipelineComponentProvider)pipelineComponentProvider;
- (id)_changesBetweenSourceLayoutResult:(id)a3 targetLayoutResult:(id)a4;
- (id)annotationForLayoutItem:(id)a3;
- (id)removalPlanResult;
- (id)resultForNewLayoutResult:(id)a3;
- (void)reset;
- (void)setCurrentLayoutItemToAnnotationTable:(id)a3;
- (void)setCurrentLayoutResult:(id)a3;
- (void)setPipelineComponentProvider:(id)a3;
@end

@implementation PXPlacesMapInPlaceUpdatePlan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayoutItemToAnnotationTable, 0);
  objc_storeStrong((id *)&self->_currentLayoutResult, 0);
  objc_destroyWeak((id *)&self->pipelineComponentProvider);
  objc_storeStrong((id *)&self->_sema, 0);
}

- (void)setCurrentLayoutItemToAnnotationTable:(id)a3
{
}

- (NSMapTable)currentLayoutItemToAnnotationTable
{
  return (NSMapTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentLayoutResult:(id)a3
{
}

- (PXPlacesMapLayoutResult)currentLayoutResult
{
  return (PXPlacesMapLayoutResult *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPipelineComponentProvider:(id)a3
{
}

- (PXPlacesMapPipelineComponentProvider)pipelineComponentProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->pipelineComponentProvider);
  return (PXPlacesMapPipelineComponentProvider *)WeakRetained;
}

- (void)reset
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, 0xFFFFFFFFFFFFFFFFLL);
  currentLayoutResult = self->_currentLayoutResult;
  self->_currentLayoutResult = 0;

  currentLayoutItemToAnnotationTable = self->_currentLayoutItemToAnnotationTable;
  self->_currentLayoutItemToAnnotationTable = 0;

  sema = self->_sema;
  dispatch_semaphore_signal(sema);
}

- (id)annotationForLayoutItem:(id)a3
{
  sema = self->_sema;
  id v5 = a3;
  dispatch_semaphore_wait(sema, 0xFFFFFFFFFFFFFFFFLL);
  v6 = [(PXPlacesMapInPlaceUpdatePlan *)self currentLayoutItemToAnnotationTable];
  v7 = [v6 objectForKey:v5];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sema);
  return v7;
}

- (id)_changesBetweenSourceLayoutResult:(id)a3 targetLayoutResult:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [(PXPlacesMapLayoutDiffer *)[PXPlacesMapInPlaceLayoutDiffer alloc] initWithSourceLayoutResult:v6 targetLayoutResult:v5];

  v8 = [(PXPlacesMapLayoutDiffer *)v7 computeChanges];

  return v8;
}

- (id)removalPlanResult
{
  v3 = objc_alloc_init(PXPlacesMapUpdatePlanResultImpl);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, 0xFFFFFFFFFFFFFFFFLL);
  v4 = [(PXPlacesMapUpdatePlanResultImpl *)v3 annotationsToRemoveImmediately];
  id v5 = [(PXPlacesMapInPlaceUpdatePlan *)self currentLayoutItemToAnnotationTable];
  id v6 = [v5 objectEnumerator];
  v7 = [v6 allObjects];
  [v4 addObjectsFromArray:v7];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sema);
  return v3;
}

- (id)resultForNewLayoutResult:(id)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sema, 0xFFFFFFFFFFFFFFFFLL);
  v84 = objc_alloc_init(PXPlacesMapUpdatePlanResultImpl);
  id v5 = [(PXPlacesMapInPlaceUpdatePlan *)self currentLayoutResult];
  v78 = v4;
  id v6 = [(PXPlacesMapInPlaceUpdatePlan *)self _changesBetweenSourceLayoutResult:v5 targetLayoutResult:v4];

  v7 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  v83 = (dispatch_semaphore_t *)self;
  v8 = [(PXPlacesMapInPlaceUpdatePlan *)self pipelineComponentProvider];
  v9 = [v8 renderer];

  if ([v9 annotationType])
  {
    v74 = [MEMORY[0x1E4F28B00] currentHandler];
    [v74 handleFailureInMethod:a2 object:v83 file:@"PXPlacesMapInPlaceUpdatePlan.m" lineNumber:56 description:@"PXPlacesMapAnnotationTypeAnnotation is the only type supported at this time"];
  }
  else
  {
    v75 = v9;
    id v81 = v9;
    v82 = [MEMORY[0x1E4F1CA80] set];
    v10 = [MEMORY[0x1E4F1CA80] set];
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    v76 = v6;
    id v11 = v6;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v101 objects:v109 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v102;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v102 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v101 + 1) + 8 * i);
          v17 = [v16 sourceLayoutItem];
          v18 = [v16 targetLayoutItem];
          if (v17) {
            [v82 addObject:v17];
          }
          if (v18) {
            [v10 addObject:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v101 objects:v109 count:16];
      }
      while (v13);
    }

    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v19 = v11;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v97 objects:v108 count:16];
    if (v20)
    {
      id v21 = (id)v20;
      uint64_t v22 = *(void *)v98;
      do
      {
        v23 = 0;
        obuint64_t j = v21;
        do
        {
          if (*(void *)v98 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v97 + 1) + 8 * (void)v23);
          uint64_t v25 = [v24 type];
          v26 = [v24 sourceLayoutItem];
          uint64_t v27 = [v24 targetLayoutItem];
          v28 = (void *)v27;
          if (v25 == 2)
          {
            if (v26)
            {
              if (v27)
              {
LABEL_21:
                v29 = [(dispatch_semaphore_t *)v83 currentLayoutItemToAnnotationTable];
                v30 = [v29 objectForKey:v26];

                if (!v30)
                {
                  v41 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v41 handleFailureInMethod:a2 object:v83 file:@"PXPlacesMapInPlaceUpdatePlan.m" lineNumber:93 description:@"annotation for sourceItem cannot be nil"];
                }
                if (([v30 conformsToProtocol:&unk_1F048BF10] & 1) == 0)
                {
                  v42 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v42 handleFailureInMethod:a2 object:v83 file:@"PXPlacesMapInPlaceUpdatePlan.m" lineNumber:94 description:@"annotation must conform to PXPlacesMapRenderable"];
                }
                id v31 = v30;
                [v7 setObject:v31 forKey:v28];
                [v82 removeObject:v26];
                [v10 removeObject:v28];
                if (([v26 isEqualToLayoutItem:v28] & 1) == 0)
                {
                  [v7 setObject:v31 forKey:v28];
                  [v82 removeObject:v26];
                  [v10 removeObject:v28];
                  v32 = [v28 geotaggables];
                  uint64_t v33 = v22;
                  v34 = v10;
                  v35 = v7;
                  id v36 = v19;
                  v37 = (void *)[v32 copy];
                  [v31 setGeotaggables:v37];

                  id v19 = v36;
                  v7 = v35;
                  v10 = v34;
                  uint64_t v22 = v33;
                  id v21 = obj;

                  v38 = [(PXPlacesMapUpdatePlanResultImpl *)v84 annotationsToRedraw];
                  [v38 addObject:v31];
                }
                goto LABEL_28;
              }
            }
            else
            {
              v39 = [MEMORY[0x1E4F28B00] currentHandler];
              [v39 handleFailureInMethod:a2 object:v83 file:@"PXPlacesMapInPlaceUpdatePlan.m" lineNumber:90 description:@"sourceItem cannot be nil for PXPlacesMapLayoutDiffTypeRelated"];

              if (v28) {
                goto LABEL_21;
              }
            }
            v40 = [MEMORY[0x1E4F28B00] currentHandler];
            [v40 handleFailureInMethod:a2 object:v83 file:@"PXPlacesMapInPlaceUpdatePlan.m" lineNumber:91 description:@"targetItem cannot be nil for PXPlacesMapLayoutDiffTypeRelated"];

            goto LABEL_21;
          }
LABEL_28:

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        uint64_t v43 = [v19 countByEnumeratingWithState:&v97 objects:v108 count:16];
        id v21 = (id)v43;
      }
      while (v43);
    }

    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    id obja = v10;
    uint64_t v44 = [obja countByEnumeratingWithState:&v93 objects:v107 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v94;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v94 != v46) {
            objc_enumerationMutation(obja);
          }
          v48 = *(void **)(*((void *)&v93 + 1) + 8 * j);
          v49 = [v48 geotaggables];
          [v48 coordinate];
          v50 = objc_msgSend(v81, "annotationForGeotaggables:initialCoordinate:", v49);

          if (!v50)
          {
            v52 = [MEMORY[0x1E4F28B00] currentHandler];
            [v52 handleFailureInMethod:a2 object:v83 file:@"PXPlacesMapInPlaceUpdatePlan.m" lineNumber:123 description:@"annotation for targetItem cannot be nil"];
          }
          v51 = [(PXPlacesMapUpdatePlanResultImpl *)v84 annotationsToAddImmediately];
          [v51 addObject:v50];

          [v7 setObject:v50 forKey:v48];
        }
        uint64_t v45 = [obja countByEnumeratingWithState:&v93 objects:v107 count:16];
      }
      while (v45);
    }

    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    id v53 = v82;
    uint64_t v54 = [v53 countByEnumeratingWithState:&v89 objects:v106 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v56 = *(void *)v90;
      do
      {
        for (uint64_t k = 0; k != v55; ++k)
        {
          if (*(void *)v90 != v56) {
            objc_enumerationMutation(v53);
          }
          uint64_t v58 = *(void *)(*((void *)&v89 + 1) + 8 * k);
          v59 = [(dispatch_semaphore_t *)v83 currentLayoutItemToAnnotationTable];
          v60 = [v59 objectForKey:v58];

          if (!v60)
          {
            v62 = [MEMORY[0x1E4F28B00] currentHandler];
            [v62 handleFailureInMethod:a2 object:v83 file:@"PXPlacesMapInPlaceUpdatePlan.m" lineNumber:132 description:@"annotation for sourceItem cannot be nil"];
          }
          v61 = [(PXPlacesMapUpdatePlanResultImpl *)v84 annotationsToRemoveImmediately];
          [v61 addObject:v60];
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v89 objects:v106 count:16];
      }
      while (v55);
    }

    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v63 = [v78 layoutItems];
    uint64_t v64 = [v63 countByEnumeratingWithState:&v85 objects:v105 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = 0;
      uint64_t v67 = *(void *)v86;
      do
      {
        for (uint64_t m = 0; m != v65; ++m)
        {
          if (*(void *)v86 != v67) {
            objc_enumerationMutation(v63);
          }
          v69 = [v7 objectForKey:*(void *)(*((void *)&v85 + 1) + 8 * m)];
          if (!v69)
          {
            v72 = [MEMORY[0x1E4F28B00] currentHandler];
            [v72 handleFailureInMethod:a2 object:v83 file:@"PXPlacesMapInPlaceUpdatePlan.m" lineNumber:142 description:@"annotation for layout item cannot be nil"];
          }
          if ([v69 conformsToProtocol:&unk_1F048BF10])
          {
            id v70 = v69;
            if (v66 != [v70 index])
            {
              [v70 setIndex:v66];
              v71 = [(PXPlacesMapUpdatePlanResultImpl *)v84 annotationsWithUpdatedIndex];
              [v71 addObject:v70];
            }
            ++v66;
          }
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v85 objects:v105 count:16];
      }
      while (v65);
    }

    v9 = v75;
    id v6 = v76;
  }
  [(dispatch_semaphore_t *)v83 setCurrentLayoutResult:v78];
  [(dispatch_semaphore_t *)v83 setCurrentLayoutItemToAnnotationTable:v7];
  dispatch_semaphore_signal(v83[1]);

  return v84;
}

- (PXPlacesMapInPlaceUpdatePlan)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXPlacesMapInPlaceUpdatePlan;
  v2 = [(PXPlacesMapInPlaceUpdatePlan *)&v6 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(1);
    sema = v2->_sema;
    v2->_sema = (OS_dispatch_semaphore *)v3;
  }
  return v2;
}

@end