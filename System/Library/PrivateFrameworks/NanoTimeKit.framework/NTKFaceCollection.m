@interface NTKFaceCollection
- (BOOL)containsFace:(id)a3;
- (BOOL)hasLoaded;
- (NSString)collectionIdentifier;
- (NSString)debugName;
- (NSUUID)deviceUUID;
- (NTKFace)selectedFace;
- (NTKFaceCollection)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4;
- (id)UUIDsByFace;
- (id)_chooseNewSelectionBecauseSelectedUUIDWillBeRemovedAtIndex:(unint64_t)a3;
- (id)faceAtIndex:(unint64_t)a3;
- (id)faceForUUID:(id)a3;
- (id)facesByUUID;
- (id)logIdentifier;
- (id)observers;
- (id)orderedUUIDs;
- (id)selectedUUID;
- (id)uuidForFace:(id)a3;
- (unint64_t)indexOfFace:(id)a3;
- (unint64_t)numberOfFaces;
- (unint64_t)selectedFaceIndex;
- (void)_addFace:(id)a3 forUUID:(id)a4 atIndex:(unint64_t)a5;
- (void)_addFace:(id)a3 forUUID:(id)a4 atIndex:(unint64_t)a5 suppressingCallbackToObserver:(id)a6;
- (void)_notifyAddedFace:(id)a3 atIndex:(unint64_t)a4 omitObserver:(id)a5;
- (void)_notifyRemovedFace:(id)a3 atIndex:(unint64_t)a4 omitObserver:(id)a5;
- (void)_notifyReorderedFacesOmittingObserver:(id)a3;
- (void)_notifySelectedFaceOmittingObserver:(id)a3;
- (void)_removeFaceForUUID:(id)a3;
- (void)_removeFaceForUUID:(id)a3 suppressingCallbackToObserver:(id)a4;
- (void)_selectFaceUUID:(id)a3 notify:(BOOL)a4;
- (void)_setContentWithFaces:(id)a3 order:(id)a4 selection:(id)a5;
- (void)_setSelectedUUID:(id)a3 notify:(BOOL)a4 suppressingCallbackToObserver:(id)a5;
- (void)_throwIfNotLoaded:(SEL)a3;
- (void)_updateLogIdentifier;
- (void)_updateOrderedUUIDsFromReference:(id)a3 andNotifyReordered:(BOOL)a4;
- (void)_upgradeFace:(id)a3 forUUID:(id)a4;
- (void)addFace:(id)a3 atIndex:(unint64_t)a4 suppressingCallbackToObserver:(id)a5;
- (void)addObserver:(id)a3;
- (void)appendFace:(id)a3 suppressingCallbackToObserver:(id)a4;
- (void)enumerateFaceNamesUsingBlock:(id)a3;
- (void)enumerateFacesUsingBlock:(id)a3;
- (void)enumerateFacesWithIndexesUsingBlock:(id)a3;
- (void)moveFace:(id)a3 toIndex:(unint64_t)a4 suppressingCallbackToObserver:(id)a5;
- (void)removeFace:(id)a3 suppressingCallbackToObserver:(id)a4;
- (void)removeFaceAtIndex:(unint64_t)a3 suppressingCallbackToObserver:(id)a4;
- (void)removeObserver:(id)a3;
- (void)replaceFaceLocallyByCopy:(id)a3 suppressingCallbackToObserver:(id)a4;
- (void)setDebugName:(id)a3;
- (void)setSelectedFace:(id)a3 suppressingCallbackToObserver:(id)a4;
- (void)setSelectedFaceIndex:(unint64_t)a3 suppressingCallbackToObserver:(id)a4;
@end

@implementation NTKFaceCollection

- (NTKFaceCollection)initWithCollectionIdentifier:(id)a3 deviceUUID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NTKFaceCollection;
  v9 = [(NTKFaceCollection *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collectionIdentifier, a3);
    objc_storeStrong((id *)&v10->_deviceUUID, a4);
    [(NTKFaceCollection *)v10 _updateLogIdentifier];
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    orderedUUIDs = v10->_orderedUUIDs;
    v10->_orderedUUIDs = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    facesByUUID = v10->_facesByUUID;
    v10->_facesByUUID = v15;

    uint64_t v17 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    UUIDsByFace = v10->_UUIDsByFace;
    v10->_UUIDsByFace = (NSMapTable *)v17;
  }
  return v10;
}

- (unint64_t)numberOfFaces
{
  return [(NSMutableArray *)self->_orderedUUIDs count];
}

- (unint64_t)indexOfFace:(id)a3
{
  v4 = [(NSMapTable *)self->_UUIDsByFace objectForKey:a3];
  if (v4) {
    unint64_t v5 = [(NSMutableArray *)self->_orderedUUIDs indexOfObject:v4];
  }
  else {
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (BOOL)containsFace:(id)a3
{
  v3 = [(NSMapTable *)self->_UUIDsByFace objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NTKFace)selectedFace
{
  v3 = [(NTKFaceCollection *)self selectedUUID];
  if (v3)
  {
    BOOL v4 = [(NTKFaceCollection *)self facesByUUID];
    unint64_t v5 = [(NTKFaceCollection *)self selectedUUID];
    v6 = [v4 objectForKey:v5];
  }
  else
  {
    v6 = 0;
  }

  return (NTKFace *)v6;
}

- (id)faceAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_orderedUUIDs count] <= a3)
  {
    v6 = 0;
  }
  else
  {
    unint64_t v5 = [(NSMutableArray *)self->_orderedUUIDs objectAtIndex:a3];
    v6 = [(NSMutableDictionary *)self->_facesByUUID objectForKey:v5];
  }
  return v6;
}

- (id)uuidForFace:(id)a3
{
  return [(NSMapTable *)self->_UUIDsByFace objectForKey:a3];
}

- (id)faceForUUID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_facesByUUID objectForKey:a3];
}

- (void)enumerateFacesUsingBlock:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NTKFaceCollection *)self orderedUUIDs];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__NTKFaceCollection_enumerateFacesUsingBlock___block_invoke;
  v7[3] = &unk_1E62C3FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __46__NTKFaceCollection_enumerateFacesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = a2;
  id v9 = [v6 facesByUUID];
  id v8 = [v9 objectForKey:v7];

  (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v8, a4);
}

- (void)enumerateFacesWithIndexesUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKFaceCollection *)self orderedUUIDs];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__NTKFaceCollection_enumerateFacesWithIndexesUsingBlock___block_invoke;
  v7[3] = &unk_1E62C3FC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __57__NTKFaceCollection_enumerateFacesWithIndexesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = a2;
  id v10 = [v7 facesByUUID];
  id v9 = [v10 objectForKey:v8];

  (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v6 + 16))(v6, v9, a3, a4);
}

- (void)enumerateFaceNamesUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKFaceCollection *)self facesByUUID];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__NTKFaceCollection_enumerateFaceNamesUsingBlock___block_invoke;
  v7[3] = &unk_1E62C3FF0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void __50__NTKFaceCollection_enumerateFaceNamesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [a3 name];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

- (unint64_t)selectedFaceIndex
{
  uint64_t v3 = [(NTKFaceCollection *)self selectedUUID];
  if (v3)
  {
    id v4 = [(NTKFaceCollection *)self orderedUUIDs];
    uint64_t v5 = [(NTKFaceCollection *)self selectedUUID];
    unint64_t v6 = [v4 indexOfObject:v5];
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (BOOL)hasLoaded
{
  return 0;
}

- (void)setSelectedFaceIndex:(unint64_t)a3 suppressingCallbackToObserver:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    id v10 = [NSNumber numberWithUnsignedInteger:a3];
    int v13 = 138412802;
    v14 = logIdentifier;
    __int16 v15 = 2112;
    v16 = v10;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "%@ set selected face index %@, observer = %@", (uint8_t *)&v13, 0x20u);
  }
  [(NTKFaceCollection *)self _throwIfNotLoaded:a2];
  if ([(NSMutableArray *)self->_orderedUUIDs count] <= a3)
  {
    uint64_t v11 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[NTKFaceCollection setSelectedFaceIndex:suppressingCallbackToObserver:]((id *)&self->_orderedUUIDs);
    }
  }
  else
  {
    uint64_t v11 = [(NSMutableArray *)self->_orderedUUIDs objectAtIndex:a3];
    v12 = [(NSMutableDictionary *)self->_facesByUUID objectForKey:v11];
    [(NTKFaceCollection *)self setSelectedFace:v12 suppressingCallbackToObserver:v7];
  }
}

- (void)setSelectedFace:(id)a3 suppressingCallbackToObserver:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    int v12 = 138412802;
    int v13 = logIdentifier;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "%@ set selected face %@, observer = %@", (uint8_t *)&v12, 0x20u);
  }

  [(NTKFaceCollection *)self _throwIfNotLoaded:a2];
  uint64_t v11 = [(NSMapTable *)self->_UUIDsByFace objectForKey:v7];
  if (v11)
  {
    [(NTKFaceCollection *)self _setSelectedUUID:v11 notify:1 suppressingCallbackToObserver:v8];
    [(NTKFaceCollection *)self _didSelectFaceUUID:v11 suppressingCallback:1];
  }
}

- (void)appendFace:(id)a3 suppressingCallbackToObserver:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    int v11 = 138412802;
    int v12 = logIdentifier;
    __int16 v13 = 2112;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "%@ append face %@, observer = %@", (uint8_t *)&v11, 0x20u);
  }

  [(NTKFaceCollection *)self _throwIfNotLoaded:a2];
  [(NTKFaceCollection *)self addFace:v7 atIndex:[(NTKFaceCollection *)self numberOfFaces] suppressingCallbackToObserver:v8];
}

- (void)addFace:(id)a3 atIndex:(unint64_t)a4 suppressingCallbackToObserver:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  int v11 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    __int16 v13 = [NSNumber numberWithUnsignedInteger:a4];
    int v15 = 138413058;
    id v16 = logIdentifier;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    objc_super v20 = v13;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "%@ add face %@, at index %@, observer = %@", (uint8_t *)&v15, 0x2Au);
  }
  [(NTKFaceCollection *)self _throwIfNotLoaded:a2];
  id v14 = [MEMORY[0x1E4F29128] UUID];
  [(NTKFaceCollection *)self _addFace:v9 forUUID:v14 atIndex:a4 suppressingCallbackToObserver:v10];
}

- (void)moveFace:(id)a3 toIndex:(unint64_t)a4 suppressingCallbackToObserver:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  int v11 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    __int16 v13 = [NSNumber numberWithUnsignedInteger:a4];
    int v15 = 138413058;
    id v16 = logIdentifier;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    objc_super v20 = v13;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl(&dword_1BC5A9000, v11, OS_LOG_TYPE_DEFAULT, "%@ move face %@, to index %@, observer = %@", (uint8_t *)&v15, 0x2Au);
  }
  [(NTKFaceCollection *)self _throwIfNotLoaded:a2];
  id v14 = [(NSMapTable *)self->_UUIDsByFace objectForKey:v9];
  if (v14)
  {
    [(NSMutableArray *)self->_orderedUUIDs removeObject:v14];
    [(NSMutableArray *)self->_orderedUUIDs insertObject:v14 atIndex:a4];
    [(NTKFaceCollection *)self _didMoveFace:v9 withUUID:v14 toIndex:a4];
    [(NTKFaceCollection *)self _notifyReorderedFacesOmittingObserver:v10];
  }
}

- (void)removeFaceAtIndex:(unint64_t)a3 suppressingCallbackToObserver:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    id v10 = [NSNumber numberWithUnsignedInteger:a3];
    int v15 = 138412802;
    id v16 = logIdentifier;
    __int16 v17 = 2112;
    unint64_t v18 = (unint64_t)v10;
    __int16 v19 = 2112;
    uint64_t v20 = (uint64_t)v7;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "%@ remove face at index %@, observer = %@", (uint8_t *)&v15, 0x20u);
  }
  [(NTKFaceCollection *)self _throwIfNotLoaded:a2];
  int v11 = [(NTKFaceCollection *)self faceAtIndex:a3];
  if (v11)
  {
    [(NTKFaceCollection *)self removeFace:v11 suppressingCallbackToObserver:v7];
  }
  else
  {
    int v12 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = self->_logIdentifier;
      uint64_t v14 = [(NSMutableArray *)self->_orderedUUIDs count];
      int v15 = 138543874;
      id v16 = v13;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      __int16 v19 = 2048;
      uint64_t v20 = v14;
      _os_log_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to remove face because there is no face at index %lu. count: %lu", (uint8_t *)&v15, 0x20u);
    }
  }
}

- (void)removeFace:(id)a3 suppressingCallbackToObserver:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    int v12 = 138412802;
    __int16 v13 = logIdentifier;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl(&dword_1BC5A9000, v9, OS_LOG_TYPE_DEFAULT, "%@ remove face %@, observer = %@", (uint8_t *)&v12, 0x20u);
  }

  [(NTKFaceCollection *)self _throwIfNotLoaded:a2];
  int v11 = [(NSMapTable *)self->_UUIDsByFace objectForKey:v7];
  if (v11)
  {
    [(NTKFaceCollection *)self _removeFaceForUUID:v11 suppressingCallbackToObserver:v8];
    [(NTKFaceCollection *)self _didRemoveFace:v7 withUUID:v11];
  }
}

- (void)_setContentWithFaces:(id)a3 order:(id)a4 selection:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (NSMutableDictionary *)[v8 mutableCopy];
  facesByUUID = self->_facesByUUID;
  self->_facesByUUID = v11;

  __int16 v13 = (NSMutableArray *)[v9 mutableCopy];
  orderedUUIDs = self->_orderedUUIDs;
  self->_orderedUUIDs = v13;

  objc_storeStrong((id *)&self->_selectedUUID, a5);
  [(NSMapTable *)self->_UUIDsByFace removeAllObjects];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v15 = v8;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        UUIDsByFace = self->_UUIDsByFace;
        id v22 = objc_msgSend(v15, "objectForKey:", v20, (void)v23);
        [(NSMapTable *)UUIDsByFace setObject:v20 forKey:v22];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v17);
  }
}

- (void)_addFace:(id)a3 forUUID:(id)a4 atIndex:(unint64_t)a5
{
}

- (void)_removeFaceForUUID:(id)a3
{
}

- (void)_selectFaceUUID:(id)a3 notify:(BOOL)a4
{
}

- (void)_updateOrderedUUIDsFromReference:(id)a3 andNotifyReordered:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)[(NSMutableArray *)self->_orderedUUIDs copy];
  if (v6)
  {
    BOOL v16 = v4;
    id v8 = (void *)[(NSMutableArray *)self->_orderedUUIDs mutableCopy];
    [v8 removeObjectsInArray:v6];
    [(NSMutableArray *)self->_orderedUUIDs removeAllObjects];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v15 = [(NSMutableDictionary *)self->_facesByUUID objectForKey:v14];

          if (v15) {
            [(NSMutableArray *)self->_orderedUUIDs addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }

    [(NSMutableArray *)self->_orderedUUIDs addObjectsFromArray:v8];
    BOOL v4 = v16;
  }
  if (v4 && ([v7 isEqualToArray:self->_orderedUUIDs] & 1) == 0) {
    [(NTKFaceCollection *)self _notifyReorderedFacesOmittingObserver:0];
  }
}

- (void)_upgradeFace:(id)a3 forUUID:(id)a4
{
  facesByUUID = self->_facesByUUID;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(NSMutableDictionary *)facesByUUID objectForKey:v7];
  [(NSMapTable *)self->_UUIDsByFace removeObjectForKey:v9];
  [(NSMutableDictionary *)self->_facesByUUID setObject:v8 forKey:v7];
  [(NSMapTable *)self->_UUIDsByFace setObject:v7 forKey:v8];
}

- (void)_removeFaceForUUID:(id)a3 suppressingCallbackToObserver:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(NTKFaceCollection *)self orderedUUIDs];
  uint64_t v8 = [v7 indexOfObject:v15];

  id v9 = [(NTKFaceCollection *)self selectedUUID];
  int v10 = [v15 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = [(NTKFaceCollection *)self _chooseNewSelectionBecauseSelectedUUIDWillBeRemovedAtIndex:v8];
    selectedUUID = self->_selectedUUID;
    self->_selectedUUID = v11;
  }
  __int16 v13 = [(NTKFaceCollection *)self facesByUUID];
  uint64_t v14 = [v13 objectForKey:v15];

  [v14 removeObserver:self];
  [(NSMutableDictionary *)self->_facesByUUID removeObjectForKey:v15];
  [(NSMapTable *)self->_UUIDsByFace removeObjectForKey:v14];
  [(NSMutableArray *)self->_orderedUUIDs removeObject:v15];
  [(NTKFaceCollection *)self _notifyRemovedFace:v14 atIndex:v8 omitObserver:v6];
  if (v10) {
    [(NTKFaceCollection *)self _notifySelectedFaceOmittingObserver:v6];
  }
}

- (void)_addFace:(id)a3 forUUID:(id)a4 atIndex:(unint64_t)a5 suppressingCallbackToObserver:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [v10 addObserver:self];
  if (v10)
  {
    [(NSMutableArray *)self->_orderedUUIDs insertObject:v11 atIndex:a5];
    [(NSMutableDictionary *)self->_facesByUUID setObject:v10 forKey:v11];
    [(NSMapTable *)self->_UUIDsByFace setObject:v11 forKey:v10];
    [(NTKFaceCollection *)self _notifyAddedFace:v10 atIndex:a5 omitObserver:v12];
    [(NTKFaceCollection *)self _didAddFace:v10 withUUID:v11 atIndex:a5];
  }
  else
  {
    __int16 v13 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NTKFaceCollection _addFace:forUUID:atIndex:suppressingCallbackToObserver:](v11);
    }
  }
}

- (void)_setSelectedUUID:(id)a3 notify:(BOOL)a4 suppressingCallbackToObserver:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  if ((NTKEqualObjects(v10, self->_selectedUUID) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedUUID, a3);
    id v9 = [(NTKFaceCollection *)self selectedUUID];

    if (v9) {
      [(NTKFaceCollection *)self _notifySelectedFaceOmittingObserver:v8];
    }
  }
}

- (id)_chooseNewSelectionBecauseSelectedUUIDWillBeRemovedAtIndex:(unint64_t)a3
{
  BOOL v4 = (void *)[(NSMutableArray *)self->_orderedUUIDs mutableCopy];
  [v4 removeObjectAtIndex:a3];
  if ([v4 count] <= a3) {
    [v4 lastObject];
  }
  else {
  uint64_t v5 = [v4 objectAtIndex:a3];
  }

  return v5;
}

- (void)replaceFaceLocallyByCopy:(id)a3 suppressingCallbackToObserver:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    logIdentifier = self->_logIdentifier;
    int v13 = 138412802;
    uint64_t v14 = logIdentifier;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_1BC5A9000, v8, OS_LOG_TYPE_DEFAULT, "%@ replace face locally by copy %@, observer = %@", (uint8_t *)&v13, 0x20u);
  }

  id v10 = [(NSMapTable *)self->_UUIDsByFace objectForKey:v6];
  if (v10)
  {
    uint64_t v11 = [(NSMutableArray *)self->_orderedUUIDs indexOfObject:v10];
    id v12 = (void *)[v6 copy];
    [(NTKFaceCollection *)self _removeFaceForUUID:v10 suppressingCallbackToObserver:v7];
    [(NTKFaceCollection *)self _addFace:v12 forUUID:v10 atIndex:v11 suppressingCallbackToObserver:v7];
  }
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers addObject:v5];
  objc_sync_exit(v4);
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  [(NSHashTable *)v4->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)_notifyAddedFace:(id)a3 atIndex:(unint64_t)a4 omitObserver:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([(NTKFaceCollection *)self hasLoaded])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = [(NTKFaceCollection *)self observers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v16 + 1) + 8 * v14);
          if (v15 != v9 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v15 faceCollection:self didAddFace:v8 atIndex:a4];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)_notifyRemovedFace:(id)a3 atIndex:(unint64_t)a4 omitObserver:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if ([(NTKFaceCollection *)self hasLoaded])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = [(NTKFaceCollection *)self observers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(id *)(*((void *)&v16 + 1) + 8 * v14);
          if (v15 != v9 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v15 faceCollection:self didRemoveFace:v8 atIndex:a4];
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }
  }
}

- (void)_notifySelectedFaceOmittingObserver:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NTKFaceCollection *)self hasLoaded])
  {
    id v5 = [(NTKFaceCollection *)self selectedFace];
    unint64_t v6 = [(NTKFaceCollection *)self selectedFaceIndex];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [(NTKFaceCollection *)self observers];
    id v8 = (void *)[v7 copy];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(id *)(*((void *)&v14 + 1) + 8 * v12);
          if (v13 != v4 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v13 faceCollection:self didSelectFace:v5 atIndex:v6];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)_notifyReorderedFacesOmittingObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NTKFaceCollection *)self hasLoaded])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [(NTKFaceCollection *)self observers];
    unint64_t v6 = (void *)[v5 copy];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v12 + 1) + 8 * v10);
          if (v11 != v4 && (objc_opt_respondsToSelector() & 1) != 0) {
            [v11 faceCollectionDidReorderFaces:self];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (id)orderedUUIDs
{
  return self->_orderedUUIDs;
}

- (id)facesByUUID
{
  return self->_facesByUUID;
}

- (id)selectedUUID
{
  return self->_selectedUUID;
}

- (id)UUIDsByFace
{
  return self->_UUIDsByFace;
}

- (id)observers
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = (void *)[(NSHashTable *)v2->_observers copy];
  objc_sync_exit(v2);

  return v3;
}

- (id)logIdentifier
{
  return self->_logIdentifier;
}

- (void)_throwIfNotLoaded:(SEL)a3
{
  if (![(NTKFaceCollection *)self hasLoaded])
  {
    id v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3B8];
    id v8 = [(NTKFaceCollection *)self collectionIdentifier];
    uint64_t v7 = NSStringFromSelector(a3);
    [v5 raise:v6, @"Attempt to modify face collection (%@) before it has loaded (sel = %@)", v8, v7 format];
  }
}

- (void)setDebugName:(id)a3
{
  objc_storeStrong((id *)&self->_debugName, a3);
  [(NTKFaceCollection *)self _updateLogIdentifier];
}

- (void)_updateLogIdentifier
{
  debugName = self->_debugName;
  deviceUUID = self->_deviceUUID;
  if (debugName)
  {
    if (deviceUUID) {
      [NSString stringWithFormat:@"<%@(%@), %@>", self->_collectionIdentifier, debugName, deviceUUID];
    }
    else {
      [NSString stringWithFormat:@"<%@(%@)>", self->_collectionIdentifier, debugName, v8];
    }
  }
  else if (deviceUUID)
  {
    [NSString stringWithFormat:@"<%@, %@>", self->_collectionIdentifier, deviceUUID, v8];
  }
  else
  {
    [NSString stringWithFormat:@"<%@>", self->_collectionIdentifier, v7, v8];
  }
  id v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  logIdentifier = self->_logIdentifier;
  self->_logIdentifier = v5;
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (NSUUID)deviceUUID
{
  return self->_deviceUUID;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_UUIDsByFace, 0);
  objc_storeStrong((id *)&self->_facesByUUID, 0);
  objc_storeStrong((id *)&self->_orderedUUIDs, 0);
  objc_storeStrong((id *)&self->_selectedUUID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (void)setSelectedFaceIndex:(id *)a1 suppressingCallbackToObserver:.cold.1(id *a1)
{
  [*a1 count];
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v1, v2, "Attempting to select face at index %lu is out of bounds [0...%lu).", v3, v4, v5, v6, 0);
}

- (void)_addFace:(void *)a1 forUUID:atIndex:suppressingCallbackToObserver:.cold.1(void *a1)
{
  uint64_t v1 = [a1 description];
  OUTLINED_FUNCTION_6(&dword_1BC5A9000, v2, v3, "Attempted to add a nil NTKFace with uuid %@ at index %lu", v4, v5, v6, v7, 2u);
}

@end