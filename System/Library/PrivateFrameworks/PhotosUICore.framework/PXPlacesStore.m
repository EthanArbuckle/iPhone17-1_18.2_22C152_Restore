@interface PXPlacesStore
- ($12569EB6952B655774F5ECF42E55FE6C)minimalEncompassingMapRect;
- ($12569EB6952B655774F5ECF42E55FE6C)rect;
- (NSMutableArray)itemsToAddArray;
- (NSMutableSet)itemsToAdd;
- (NSMutableSet)itemsToRemove;
- (NSSet)allItems;
- (PXPlacesGeotaggedItemDataSourceDelegate)delegate;
- (PXPlacesStore)init;
- (PXPlacesStore)initWithCapacityPerNode:(unint64_t)a3;
- (id)_findItemsInMapRect:(id)a3;
- (id)findItemsInMapRect:(id)a3;
- (int64_t)numberOfItems;
- (unint64_t)capacityPerNode;
- (void)_commitChanges;
- (void)addItem:(id)a3;
- (void)addItems:(id)a3;
- (void)addItemsFromArray:(id)a3;
- (void)beginUpdates;
- (void)dealloc;
- (void)endUpdates;
- (void)removeItem:(id)a3;
- (void)removeItems:(id)a3;
- (void)runNodeDebugCollector:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setItemsToAdd:(id)a3;
- (void)setItemsToAddArray:(id)a3;
- (void)setItemsToRemove:(id)a3;
- (void)setRect:(id)a3;
@end

@implementation PXPlacesStore

- (void)setItemsToRemove:(id)a3
{
}

- (NSMutableSet)itemsToRemove
{
  return (NSMutableSet *)objc_getProperty(self, a2, 272, 1);
}

- (void)setItemsToAddArray:(id)a3
{
}

- (NSMutableArray)itemsToAddArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setItemsToAdd:(id)a3
{
}

- (NSMutableSet)itemsToAdd
{
  return (NSMutableSet *)objc_getProperty(self, a2, 256, 1);
}

- (void)setRect:(id)a3
{
  $12569EB6952B655774F5ECF42E55FE6C v3 = a3;
  objc_copyStruct(&self->_rect, &v3, 32, 1, 0);
}

- ($12569EB6952B655774F5ECF42E55FE6C)rect
{
  objc_copyStruct(v6, &self->_rect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (unint64_t)capacityPerNode
{
  return self->_capacityPerNode;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PXPlacesGeotaggedItemDataSourceDelegate *)a3;
}

- (PXPlacesGeotaggedItemDataSourceDelegate)delegate
{
  return self->_delegate;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (void)runNodeDebugCollector:(id)a3
{
}

- ($12569EB6952B655774F5ECF42E55FE6C)minimalEncompassingMapRect
{
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  int64_t v4 = [(PXPlacesStore *)self numberOfItems];
  double v5 = (double *)malloc_type_malloc(16 * v4, 0x1000040451B5BE8uLL);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  rootNode = (double *)self->_rootNode;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __43__PXPlacesStore_minimalEncompassingMapRect__block_invoke;
  v25[3] = &unk_1E5DBC6D8;
  v25[4] = v26;
  v25[5] = v5;
  PXQuadTreeNodeRunCollector(rootNode, (uint64_t)v25);
  int64_t v7 = v4 - 1;
  if (v4 == 1)
  {
    double v8 = *v5;
    double v9 = v5[1];
    double v10 = 0.0;
    double v11 = 0.0;
  }
  else if (v4 < 2)
  {
    double v8 = *MEMORY[0x1E4F30D98];
    double v9 = *(double *)(MEMORY[0x1E4F30D98] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F30D98] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F30D98] + 24);
  }
  else
  {
    qsort(v5, v4, 0x10uLL, (int (__cdecl *)(const void *, const void *))mapPointComparator);
    uint64_t v12 = 0;
    v13 = v5 + 1;
    double v8 = 0.0;
    double v14 = -3.40282347e38;
    double v9 = 3.40282347e38;
    double v15 = 0.0;
    do
    {
      double v16 = *v13;
      if (v7 == v12) {
        uint64_t v17 = 0;
      }
      else {
        uint64_t v17 = v12 + 1;
      }
      uint64_t v18 = v12 + 1;
      double v19 = v5[2 * v17];
      double v20 = -0.0;
      if (v7 == v12) {
        double v20 = *(double *)(MEMORY[0x1E4F30DA0] + 16);
      }
      if (v19 - *(v13 - 1) + v20 > v15)
      {
        double v15 = v19 - *(v13 - 1) + v20;
        double v8 = v5[2 * v17];
      }
      if (v16 > v14) {
        double v14 = *v13;
      }
      if (v16 < v9) {
        double v9 = *v13;
      }
      v13 += 2;
      ++v12;
    }
    while (v4 != v18);
    double v11 = *(double *)(MEMORY[0x1E4F30DA0] + 16) - v15;
    double v10 = v14 - v9;
  }
  free(v5);
  pthread_rwlock_unlock(p_rwlock);
  _Block_object_dispose(v26, 8);
  double v21 = v8;
  double v22 = v9;
  double v23 = v11;
  double v24 = v10;
  result.var1.var1 = v24;
  result.var1.var0 = v23;
  result.var0.var1 = v22;
  result.var0.var0 = v21;
  return result;
}

void *__43__PXPlacesStore_minimalEncompassingMapRect__block_invoke(void *result, int a2, uint64_t a3, int a4, void *__src)
{
  if (a3)
  {
    v6 = result;
    $12569EB6952B655774F5ECF42E55FE6C result = memcpy((void *)(result[5] + 16 * *(void *)(*(void *)(result[4] + 8) + 24)), __src, 16 * a3);
    *(void *)(*(void *)(v6[4] + 8) + 24) += a3;
  }
  return result;
}

- (id)_findItemsInMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__PXPlacesStore__findItemsInMapRect___block_invoke;
  v10[3] = &unk_1E5DBC6B0;
  v10[4] = v8;
  PXQuadTreeNodeFindItemsInRect((uint64_t *)self->_rootNode, (uint64_t)v10, v6, v5, var0, var1);
  return v8;
}

uint64_t __37__PXPlacesStore__findItemsInMapRect___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)findItemsInMapRect:(id)a3
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v5 = a3.var0.var1;
  double v6 = a3.var0.var0;
  p_rwlock = &self->_rwlock;
  pthread_rwlock_rdlock(&self->_rwlock);
  Log = PKPlacesKitGetLog();
  os_signpost_id_t v10 = os_signpost_id_generate(Log);
  double v11 = PKPlacesKitGetLog();
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PX_PLACES_STORE_QUERY", "", buf, 2u);
  }
  v29.origin.double x = v6;
  v29.origin.double y = v5;
  v29.size.double width = var0;
  v29.size.double height = var1;
  if (MKMapRectSpans180thMeridian(v29))
  {
    v30.origin.double x = v6;
    v30.origin.double y = v5;
    v30.size.double width = var0;
    v30.size.double height = var1;
    MKMapRect v31 = MKMapRectIntersection(v30, *MEMORY[0x1E4F30DA0]);
    double x = v31.origin.x;
    double y = v31.origin.y;
    double width = v31.size.width;
    double height = v31.size.height;
    v31.origin.double x = v6;
    v31.origin.double y = v5;
    v31.size.double width = var0;
    v31.size.double height = var1;
    MKMapRect v32 = MKMapRectRemainder(v31);
    double v17 = v32.origin.x;
    double v18 = v32.origin.y;
    double v19 = v32.size.width;
    double v20 = v32.size.height;
    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v22 = -[PXPlacesStore _findItemsInMapRect:](self, "_findItemsInMapRect:", x, y, width, height);
    id v23 = -[PXPlacesStore _findItemsInMapRect:](self, "_findItemsInMapRect:", v17, v18, v19, v20);
    [v21 unionSet:v22];
    [v21 unionSet:v23];
    id v24 = v21;
  }
  else
  {
    id v24 = -[PXPlacesStore _findItemsInMapRect:](self, "_findItemsInMapRect:", v6, v5, var0, var1);
  }
  v25 = v24;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v27 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_END, v10, "PX_PLACES_STORE_QUERY", "", v27, 2u);
  }
  pthread_rwlock_unlock(p_rwlock);
  return v25;
}

- (NSSet)allItems
{
  [(PXPlacesStore *)self rect];
  return (NSSet *)-[PXPlacesStore findItemsInMapRect:](self, "findItemsInMapRect:");
}

- (void)_commitChanges
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  p_rwlocuint64_t k = &self->_rwlock;
  pthread_rwlock_wrlock(&self->_rwlock);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_itemChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  double v3 = PKPlacesKitGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  double v5 = PKPlacesKitGetLog();
  double v6 = v5;
  unint64_t v40 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PX_PLACES_STORE_LOAD", "", buf, 2u);
  }
  log = v6;
  int64_t v7 = [(PXPlacesStore *)self itemsToAdd];
  id v8 = [(PXPlacesStore *)self itemsToRemove];
  double v9 = [(PXPlacesStore *)self itemsToAddArray];
  os_signpost_id_t v10 = (void *)[MEMORY[0x1E4F1CA80] set];
  double v11 = (void *)[MEMORY[0x1E4F1CA80] set];
  *(void *)buf = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v12 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(v8);
        }
        double v16 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        [v16 coordinate];
        CLLocationDegrees latitude = v60.latitude;
        CLLocationDegrees longitude = v60.longitude;
        if (CLLocationCoordinate2DIsValid(v60))
        {
          v61.CLLocationDegrees latitude = latitude;
          v61.CLLocationDegrees longitude = longitude;
          MKMapPoint v19 = MKMapPointForCoordinate(v61);
          if (PXQuadTreeNodeRemoveItem((uint64_t)self->_rootNode, (uint64_t)v16, buf, v19.x, v19.y)) {
            [v10 addObject:v16];
          }
        }
      }
      uint64_t v13 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v51 objects:v58 count:16];
    }
    while (v13);
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v20 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v48 != v22) {
          objc_enumerationMutation(v7);
        }
        id v24 = *(void **)(*((void *)&v47 + 1) + 8 * j);
        [v24 coordinate];
        CLLocationDegrees v25 = v62.latitude;
        CLLocationDegrees v26 = v62.longitude;
        if (CLLocationCoordinate2DIsValid(v62))
        {
          v63.CLLocationDegrees latitude = v25;
          v63.CLLocationDegrees longitude = v26;
          MKMapPoint v27 = MKMapPointForCoordinate(v63);
          if (PXQuadTreeNodeInsertItem((uint64_t)self->_rootNode, (uint64_t)v24, v27.x, v27.y)) {
            [v11 addObject:v24];
          }
        }
      }
      uint64_t v21 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v21);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v28 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v44;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v44 != v30) {
          objc_enumerationMutation(v9);
        }
        MKMapRect v32 = *(void **)(*((void *)&v43 + 1) + 8 * k);
        [v32 coordinate];
        CLLocationDegrees v33 = v64.latitude;
        CLLocationDegrees v34 = v64.longitude;
        if (CLLocationCoordinate2DIsValid(v64))
        {
          v65.CLLocationDegrees latitude = v33;
          v65.CLLocationDegrees longitude = v34;
          MKMapPoint v35 = MKMapPointForCoordinate(v65);
          if (PXQuadTreeNodeInsertItem((uint64_t)self->_rootNode, (uint64_t)v32, v35.x, v35.y)) {
            [v11 addObject:v32];
          }
        }
      }
      uint64_t v29 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v43 objects:v56 count:16];
    }
    while (v29);
  }
  self->_numberOfItems -= *(void *)buf;
  self->_numberOfItems += [v11 count];
  [(NSMutableSet *)v7 removeAllObjects];
  [(NSMutableSet *)v8 removeAllObjects];
  [(NSMutableArray *)v9 removeAllObjects];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_itemChangeSemaphore);
  pthread_rwlock_unlock(p_rwlock);
  if ([(PXPlacesStore *)self delegate])
  {
    if ([v10 count])
    {
      id v36 = (id)[v11 mutableCopy];
      [v36 intersectSet:v10];
      [v11 minusSet:v36];
      [v10 minusSet:v36];
    }
    else
    {
      id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    }
    v37 = [[_PXMapStoreChange alloc] initWithAddedItems:v11 removedItems:v10 updatedItems:v36];

    [(PXPlacesGeotaggedItemDataSourceDelegate *)[(PXPlacesStore *)self delegate] dataSource:self didChange:v37];
  }
  if (v40 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(log))
  {
    *(_WORD *)v42 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, log, OS_SIGNPOST_INTERVAL_END, spid, "PX_PLACES_STORE_LOAD", "", v42, 2u);
  }
}

- (void)removeItems:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesStore.m", 191, @"Cannot remove nil items");
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_itemChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableSet *)[(PXPlacesStore *)self itemsToRemove] unionSet:a3];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_itemChangeSemaphore);
  if (!atomic_load((unsigned int *)&self->_updateCount))
  {
    [(PXPlacesStore *)self _commitChanges];
  }
}

- (void)removeItem:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesStore.m", 178, @"Cannot remove nil item");
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_itemChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableSet *)[(PXPlacesStore *)self itemsToRemove] addObject:a3];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_itemChangeSemaphore);
  if (!atomic_load((unsigned int *)&self->_updateCount))
  {
    [(PXPlacesStore *)self _commitChanges];
  }
}

- (void)addItemsFromArray:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesStore.m", 165, @"Cannot add nil items");
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_itemChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableArray *)[(PXPlacesStore *)self itemsToAddArray] addObjectsFromArray:a3];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_itemChangeSemaphore);
  if (!atomic_load((unsigned int *)&self->_updateCount))
  {
    [(PXPlacesStore *)self _commitChanges];
  }
}

- (void)addItems:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesStore.m", 152, @"Cannot add nil items");
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_itemChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableSet *)[(PXPlacesStore *)self itemsToAdd] unionSet:a3];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_itemChangeSemaphore);
  if (!atomic_load((unsigned int *)&self->_updateCount))
  {
    [(PXPlacesStore *)self _commitChanges];
  }
}

- (void)addItem:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesStore.m", 139, @"Cannot add nil item");
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_itemChangeSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSMutableSet *)[(PXPlacesStore *)self itemsToAdd] addObject:a3];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_itemChangeSemaphore);
  if (!atomic_load((unsigned int *)&self->_updateCount))
  {
    [(PXPlacesStore *)self _commitChanges];
  }
}

- (void)endUpdates
{
  p_updateCount = &self->_updateCount;
  int v4 = atomic_load((unsigned int *)&self->_updateCount);
  if (v4 <= 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPlacesStore.m", 128, @"-[PXMapStore beginChanges] and -[PXMapStore endChanges] need to be balanced!");
  }
  if (atomic_fetch_add(p_updateCount, 0xFFFFFFFF) == 1)
  {
    [(PXPlacesStore *)self _commitChanges];
  }
}

- (void)beginUpdates
{
}

- (void)dealloc
{
  PXQuadTreeNodeFree(self->_rootNode);
  pthread_rwlock_destroy(&self->_rwlock);
  dispatch_release((dispatch_object_t)self->_itemChangeSemaphore);
  v3.receiver = self;
  v3.super_class = (Class)PXPlacesStore;
  [(PXPlacesStore *)&v3 dealloc];
}

- (PXPlacesStore)initWithCapacityPerNode:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PXPlacesStore;
  int v4 = [(PXPlacesStore *)&v9 init];
  double v5 = (PXPlacesStore *)v4;
  if (v4)
  {
    double v6 = (double *)MEMORY[0x1E4F30DA0];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F30DA0] + 16);
    *(_OWORD *)(v4 + 280) = *MEMORY[0x1E4F30DA0];
    *(_OWORD *)(v4 + 296) = v7;
    *((void *)v4 + 31) = a3;
    *((void *)v4 + 1) = PXQuadTreeNodeMake(a3, *v6, v6[1], v6[2], v6[3]);
    v5->_itemsToAdd = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v5->_itemsToAddArradouble y = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v5->_itemsToRemove = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    atomic_store(0, (unsigned int *)&v5->_updateCount);
    pthread_rwlock_init(&v5->_rwlock, 0);
    v5->_itemChangeSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
  }
  return v5;
}

- (PXPlacesStore)init
{
  return [(PXPlacesStore *)self initWithCapacityPerNode:1000];
}

@end