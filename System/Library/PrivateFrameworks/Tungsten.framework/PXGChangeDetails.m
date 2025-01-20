@interface PXGChangeDetails
- (BOOL)hasAnyInsertionsRemovalsOrMoves;
- (NSIndexSet)insertedSpriteIndexes;
- (NSIndexSet)modifiedSpriteIndexes;
- (NSIndexSet)removedSpriteIndexes;
- (NSString)description;
- (NSString)diagnosticDescription;
- (PXArrayChangeDetails)arrayChangeDetails;
- (PXGChangeDetails)inverse;
- (_PXGSpriteIndexRange)replaceRemovalsWithMovesToEndForIndexes:(id)a3;
- (_PXGSpriteIndexRange)splitIndexesIntoMovesToEndAndReinsertions:(id)a3;
- (const)spriteIndexAfterChangeBySpriteIndexBeforeChange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexSetAfterApplyingChangeDetails:(id)a3;
- (int64_t)layoutVersionAfterChange;
- (int64_t)layoutVersionBeforeChange;
- (unsigned)numberOfSpritesAfterChange;
- (unsigned)numberOfSpritesBeforeChange;
- (void)_invalidateCachedArrayChangeDetails;
- (void)_invalidateLayoutVersions;
- (void)_resizeStorageIfNeeded;
- (void)applySpriteTransferMap:(const unsigned int *)a3;
- (void)applyToArray:(void *)a3 elementSize:(unint64_t)a4 countAfterChanges:(unint64_t)a5 insertionHandler:(id)a6 modifiedHandler:(id)a7;
- (void)applyToDictionary:(id)a3 removalHandler:(id)a4;
- (void)applyToSpriteIndexes:(unsigned int *)a3 atIndexes:(id)a4;
- (void)configureWithNumberOfSpritesAfterChange:(unsigned int)a3 changeDetails:(id)a4;
- (void)dealloc;
- (void)increaseNumberOfSpritesBy:(unsigned int)a3;
- (void)removeSpritesAtIndexes:(id)a3;
- (void)setLayoutVersionAfterChange:(int64_t)a3;
- (void)setLayoutVersionBeforeChange:(int64_t)a3;
@end

@implementation PXGChangeDetails

- (void)applyToArray:(void *)a3 elementSize:(unint64_t)a4 countAfterChanges:(unint64_t)a5 insertionHandler:(id)a6 modifiedHandler:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  if (self->_numberOfSpritesAfterChange != a5)
  {
    v25 = [MEMORY[0x263F08690] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PXGChangeDetails.m", 425, @"Invalid parameter not satisfying: %@", @"countAfterChanges == _numberOfSpritesAfterChange" object file lineNumber description];
  }
  uint64_t numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
  if ([(PXGChangeDetails *)self hasAnyInsertionsRemovalsOrMoves])
  {
    int64_t v16 = numberOfSpritesBeforeChange * a4;
    int64_t tempBufferCapacity = self->_tempBufferCapacity;
    if (tempBufferCapacity >= (uint64_t)(numberOfSpritesBeforeChange * a4))
    {
      tempBuffer = self->_tempBuffer;
    }
    else
    {
      if (!tempBufferCapacity)
      {
        int64_t tempBufferCapacity = 10;
        self->_int64_t tempBufferCapacity = 10;
      }
      if (tempBufferCapacity < v16)
      {
        do
          tempBufferCapacity *= 2;
        while (tempBufferCapacity < v16);
        self->_int64_t tempBufferCapacity = tempBufferCapacity;
      }
      tempBuffer = (char *)malloc_type_realloc(self->_tempBuffer, tempBufferCapacity, 0xB8FC66A4uLL);
      self->_tempBuffer = tempBuffer;
    }
    memcpy(tempBuffer, a3, numberOfSpritesBeforeChange * a4);
    if (numberOfSpritesBeforeChange)
    {
      nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
      v20 = self->_tempBuffer;
      do
      {
        unsigned int v22 = *nextSpriteIndexByPreviousSpriteIndex++;
        uint64_t v21 = v22;
        if (v22 != -1) {
          memcpy((char *)a3 + v21 * a4, v20, a4);
        }
        v20 += a4;
        --numberOfSpritesBeforeChange;
      }
      while (numberOfSpritesBeforeChange);
    }
    if (v13)
    {
      spriteIndexesThatWereInserted = self->_spriteIndexesThatWereInserted;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __96__PXGChangeDetails_applyToArray_elementSize_countAfterChanges_insertionHandler_modifiedHandler___block_invoke;
      v28[3] = &unk_265556610;
      id v29 = v13;
      [(NSIndexSet *)spriteIndexesThatWereInserted enumerateRangesUsingBlock:v28];
    }
  }
  if (v14)
  {
    spriteIndexesThatWereModified = self->_spriteIndexesThatWereModified;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __96__PXGChangeDetails_applyToArray_elementSize_countAfterChanges_insertionHandler_modifiedHandler___block_invoke_2;
    v26[3] = &unk_265556610;
    id v27 = v14;
    [(NSIndexSet *)spriteIndexesThatWereModified enumerateRangesUsingBlock:v26];
  }
}

- (void)configureWithNumberOfSpritesAfterChange:(unsigned int)a3 changeDetails:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(PXGChangeDetails *)self _invalidateLayoutVersions];
  [(PXGChangeDetails *)self _invalidateCachedArrayChangeDetails];
  v51 = self;
  unsigned int v58 = a3;
  self->_numberOfSpritesAfterChange = a3;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    LOBYTE(v11) = 0;
    uint64_t v12 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v69 != v12) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        v15 = objc_msgSend(v14, "insertedIndexes", v51);
        uint64_t v16 = [v15 count];

        v17 = [v14 removedIndexes];
        uint64_t v18 = [v17 count];

        if (v11) {
          int v11 = 1;
        }
        else {
          int v11 = [v14 hasAnyInsertionsRemovalsOrMoves];
        }
        uint64_t v10 = v16 + v10 - v18;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v68 objects:v74 count:16];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
    int v11 = 0;
  }

  uint64_t v19 = v58 - v10;
  v20 = v51;
  if (v19 < 0)
  {
    v50 = [MEMORY[0x263F08690] currentHandler];
    [v50 handleFailureInMethod:a2, v51, @"PXGChangeDetails.m", 66, @"Invalid change details provided, numberOfSpritesBeforeChange would be < 0" object file lineNumber description];
  }
  v51->_uint64_t numberOfSpritesBeforeChange = v19;
  v55 = objc_msgSend(MEMORY[0x263F089C8], "indexSet", v51);
  uint64_t v21 = [MEMORY[0x263F089C8] indexSet];
  v57 = [MEMORY[0x263F089C8] indexSet];
  if ([v7 count])
  {
    [(PXGChangeDetails *)v20 _resizeStorageIfNeeded];
    uint64_t numberOfSpritesBeforeChange = v20->_numberOfSpritesBeforeChange;
    nextSpriteIndexByPreviousSpriteIndex = v20->_nextSpriteIndexByPreviousSpriteIndex;
    v54 = nextSpriteIndexByPreviousSpriteIndex;
    if (v11)
    {
      objc_msgSend(v55, "addIndexesInRange:", 0, v20->_numberOfSpritesAfterChange);
      if (numberOfSpritesBeforeChange)
      {
        uint64_t v24 = 0;
        char v25 = 0;
        uint64_t v53 = numberOfSpritesBeforeChange;
        do
        {
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v26 = v7;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v64 objects:v73 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            LOBYTE(v29) = 0;
            uint64_t v30 = *(void *)v65;
            v25 &= 1u;
            uint64_t v59 = v24;
            uint64_t v31 = v24;
            while (2)
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v65 != v30) {
                  objc_enumerationMutation(v26);
                }
                v33 = *(void **)(*((void *)&v64 + 1) + 8 * j);
                if (v25 & 1) != 0 || ([*(id *)(*((void *)&v64 + 1) + 8 * j) hasMoves]) {
                  char v25 = 1;
                }
                else {
                  char v25 = [v33 hasIncrementalChanges] ^ 1;
                }
                uint64_t v34 = [v33 indexAfterApplyingChangesToIndex:v31];
                if (v34 == 0x7FFFFFFFFFFFFFFFLL)
                {

                  uint64_t v24 = v59;
                  [v57 addIndex:v59];
                  LODWORD(v31) = -1;
                  uint64_t numberOfSpritesBeforeChange = v53;
                  nextSpriteIndexByPreviousSpriteIndex = v54;
                  goto LABEL_39;
                }
                uint64_t v31 = v34;
                if (v29)
                {
                  int v29 = 1;
                }
                else
                {
                  v35 = [v33 changedIndexes];
                  int v29 = [v35 containsIndex:v31];
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v64 objects:v73 count:16];
              if (v28) {
                continue;
              }
              break;
            }

            [v55 removeIndex:v31];
            nextSpriteIndexByPreviousSpriteIndex = v54;
            if (v29) {
              [v21 addIndex:v31];
            }
            uint64_t numberOfSpritesBeforeChange = v53;
            uint64_t v24 = v59;
          }
          else
          {

            [v55 removeIndex:v24];
            LODWORD(v31) = v24;
          }
LABEL_39:
          nextSpriteIndexByPreviousSpriteIndex[v24++] = v31;
        }
        while (v24 != numberOfSpritesBeforeChange);
      }
      else
      {
        char v25 = 0;
      }
      BOOL v43 = v25 & 1;
      goto LABEL_55;
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v36 = v7;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v60 objects:v72 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v38; ++k)
        {
          if (*(void *)v61 != v39) {
            objc_enumerationMutation(v36);
          }
          v41 = [*(id *)(*((void *)&v60 + 1) + 8 * k) changedIndexes];
          [v21 addIndexes:v41];
        }
        uint64_t v38 = [v36 countByEnumeratingWithState:&v60 objects:v72 count:16];
      }
      while (v38);
    }

    if (!numberOfSpritesBeforeChange)
    {
      BOOL v43 = 0;
LABEL_55:
      v20 = v52;
      goto LABEL_56;
    }
    uint64_t v42 = 0;
    v20 = v52;
    do
    {
      v54[v42] = v42;
      ++v42;
    }
    while (numberOfSpritesBeforeChange != v42);
  }
  BOOL v43 = 0;
LABEL_56:
  uint64_t v44 = [v55 copy];
  spriteIndexesThatWereInserted = v20->_spriteIndexesThatWereInserted;
  v20->_spriteIndexesThatWereInserted = (NSIndexSet *)v44;

  uint64_t v46 = [v21 copy];
  spriteIndexesThatWereModified = v20->_spriteIndexesThatWereModified;
  v20->_spriteIndexesThatWereModified = (NSIndexSet *)v46;

  uint64_t v48 = [v57 copy];
  spriteIndexesThatWereRemoved = v20->_spriteIndexesThatWereRemoved;
  v20->_spriteIndexesThatWereRemoved = (NSIndexSet *)v48;

  v20->_hasMoves = v43;
}

- (void)_invalidateLayoutVersions
{
  self->_layoutVersionBeforeChange = 0;
  self->_layoutVersionAfterChange = 0;
}

- (void)_invalidateCachedArrayChangeDetails
{
  self->_cachedArrayChangeDetails = 0;
  MEMORY[0x270F9A758]();
}

- (void)applyToDictionary:(id)a3 removalHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PXGChangeDetails *)self hasAnyInsertionsRemovalsOrMoves])
  {
    uint64_t v8 = (void *)[v6 copy];
    [v6 removeAllObjects];
    nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__PXGChangeDetails_applyToDictionary_removalHandler___block_invoke;
    v10[3] = &unk_265556638;
    id v13 = nextSpriteIndexByPreviousSpriteIndex;
    id v12 = v7;
    id v11 = v6;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

- (id)indexSetAfterApplyingChangeDetails:(id)a3
{
  id v4 = a3;
  if ([(PXGChangeDetails *)self hasAnyInsertionsRemovalsOrMoves])
  {
    if (self->_hasMoves)
    {
      nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
      id v6 = [MEMORY[0x263F089C8] indexSet];
      uint64_t v10 = MEMORY[0x263EF8330];
      uint64_t v11 = 3221225472;
      id v12 = __55__PXGChangeDetails_indexSetAfterApplyingChangeDetails___block_invoke;
      id v13 = &unk_2655565C8;
      id v14 = v6;
      v15 = nextSpriteIndexByPreviousSpriteIndex;
      id v7 = v6;
      [v4 enumerateRangesUsingBlock:&v10];
      id v8 = (id)objc_msgSend(v7, "copy", v10, v11, v12, v13);
    }
    else
    {
      id v7 = [(PXGChangeDetails *)self arrayChangeDetails];
      id v8 = [v7 indexSetAfterApplyingChangesToIndexSet:v4];
    }
  }
  else
  {
    id v8 = v4;
  }

  return v8;
}

- (PXArrayChangeDetails)arrayChangeDetails
{
  p_cachedArrayChangeDetails = &self->_cachedArrayChangeDetails;
  cachedArrayChangeDetails = self->_cachedArrayChangeDetails;
  if (cachedArrayChangeDetails)
  {
    id v4 = cachedArrayChangeDetails;
  }
  else
  {
    if (self->_hasMoves)
    {
      nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
      id v7 = (unsigned int *)malloc_type_malloc(4 * self->_numberOfSpritesBeforeChange, 0x100004052888210uLL);
      NSUInteger v8 = [(NSIndexSet *)self->_spriteIndexesThatWereInserted firstIndex];
      if (self->_numberOfSpritesBeforeChange)
      {
        NSUInteger v9 = v8;
        unint64_t v10 = 0;
        LODWORD(v11) = 0;
        do
        {
          unsigned int v12 = nextSpriteIndexByPreviousSpriteIndex[v10];
          if (v12 != -1)
          {
            if (v9 == v11)
            {
              do
              {
                uint64_t v11 = (v11 + 1);
                NSUInteger v9 = -[NSIndexSet indexGreaterThanIndex:](self->_spriteIndexesThatWereInserted, "indexGreaterThanIndex:");
              }
              while (v9 == v11);
            }
            unsigned int v12 = v11;
            LODWORD(v11) = v11 + 1;
          }
          v7[v10++] = v12;
        }
        while (v10 < self->_numberOfSpritesBeforeChange);
      }
      id v13 = [MEMORY[0x263F089C8] indexSet];
      Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
      uint64_t numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
      if (numberOfSpritesBeforeChange)
      {
        uint64_t v16 = v7;
        do
        {
          unsigned int v18 = *nextSpriteIndexByPreviousSpriteIndex++;
          unint64_t v17 = v18;
          unsigned int v20 = *v16++;
          unint64_t v19 = v20;
          if (v17 != v20)
          {
            [v13 addIndex:v17];
            CFDictionarySetValue(Mutable, (const void *)v17, (const void *)v19);
          }
          --numberOfSpritesBeforeChange;
        }
        while (numberOfSpritesBeforeChange);
      }
      [v13 count];
      uint64_t v21 = (const void *)PXCreateMutableIntegerArrayRef();
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __38__PXGChangeDetails_arrayChangeDetails__block_invoke;
      v23[3] = &__block_descriptor_48_e12_v24__0Q8_B16l;
      v23[4] = Mutable;
      v23[5] = v21;
      [v13 enumerateIndexesUsingBlock:v23];
      CFRelease(Mutable);
      free(v7);
    }
    else
    {
      uint64_t v21 = 0;
      id v13 = 0;
    }
    id v4 = (PXArrayChangeDetails *)[objc_alloc(MEMORY[0x263F5E328]) initWithIncrementalChangeDetailsRemovedIndexes:self->_spriteIndexesThatWereRemoved insertedIndexes:self->_spriteIndexesThatWereInserted movesToIndexes:v13 movesFromIndexes:v21 changedIndexes:self->_spriteIndexesThatWereModified];
    if (v21) {
      CFRelease(v21);
    }
    objc_storeStrong((id *)p_cachedArrayChangeDetails, v4);
  }

  return v4;
}

- (BOOL)hasAnyInsertionsRemovalsOrMoves
{
  return [(NSIndexSet *)self->_spriteIndexesThatWereRemoved count]
      || [(NSIndexSet *)self->_spriteIndexesThatWereInserted count]
      || self->_hasMoves;
}

- (void)_resizeStorageIfNeeded
{
  int64_t numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
  int64_t nextSpriteIndexByPreviousSpriteIndexCapacity = self->_nextSpriteIndexByPreviousSpriteIndexCapacity;
  if (nextSpriteIndexByPreviousSpriteIndexCapacity < numberOfSpritesBeforeChange)
  {
    if (!nextSpriteIndexByPreviousSpriteIndexCapacity)
    {
      int64_t nextSpriteIndexByPreviousSpriteIndexCapacity = 10;
      self->_int64_t nextSpriteIndexByPreviousSpriteIndexCapacity = 10;
    }
    if (nextSpriteIndexByPreviousSpriteIndexCapacity < numberOfSpritesBeforeChange)
    {
      do
        nextSpriteIndexByPreviousSpriteIndexCapacity *= 2;
      while (nextSpriteIndexByPreviousSpriteIndexCapacity < numberOfSpritesBeforeChange);
      self->_int64_t nextSpriteIndexByPreviousSpriteIndexCapacity = nextSpriteIndexByPreviousSpriteIndexCapacity;
    }
    self->_nextSpriteIndexByPreviousSpriteIndex = (unsigned int *)malloc_type_realloc(self->_nextSpriteIndexByPreviousSpriteIndex, 4 * nextSpriteIndexByPreviousSpriteIndexCapacity, 0xFA539D40uLL);
  }
}

- (void)setLayoutVersionBeforeChange:(int64_t)a3
{
  self->_layoutVersionBeforeChange = a3;
}

- (void)setLayoutVersionAfterChange:(int64_t)a3
{
  self->_layoutVersionAfterChange = a3;
}

- (NSIndexSet)removedSpriteIndexes
{
  return self->_spriteIndexesThatWereRemoved;
}

- (NSIndexSet)modifiedSpriteIndexes
{
  return self->_spriteIndexesThatWereModified;
}

- (int64_t)layoutVersionAfterChange
{
  return self->_layoutVersionAfterChange;
}

uint64_t __96__PXGChangeDetails_applyToArray_elementSize_countAfterChanges_insertionHandler_modifiedHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (const)spriteIndexAfterChangeBySpriteIndexBeforeChange
{
  if ([(PXGChangeDetails *)self hasAnyInsertionsRemovalsOrMoves]) {
    return self->_nextSpriteIndexByPreviousSpriteIndex;
  }
  else {
    return 0;
  }
}

uint64_t __51__PXGChangeDetails_applyToSpriteIndexes_atIndexes___block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2 < a2 + a3)
  {
    uint64_t v3 = *(void *)(result + 40);
    id v4 = (_DWORD *)(*(void *)(result + 32) + 4 * a2);
    do
    {
      *id v4 = *(_DWORD *)(v3 + 4 * *v4);
      ++v4;
      --a3;
    }
    while (a3);
  }
  return result;
}

- (void)applyToSpriteIndexes:(unsigned int *)a3 atIndexes:(id)a4
{
  id v6 = a4;
  if ([(PXGChangeDetails *)self hasAnyInsertionsRemovalsOrMoves])
  {
    nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __51__PXGChangeDetails_applyToSpriteIndexes_atIndexes___block_invoke;
    v8[3] = &__block_descriptor_48_e24_v32__0__NSRange_QQ_8_B24l;
    v8[4] = a3;
    v8[5] = nextSpriteIndexByPreviousSpriteIndex;
    [v6 enumerateRangesUsingBlock:v8];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedArrayChangeDetails, 0);
  objc_storeStrong((id *)&self->_spriteIndexesThatWereModified, 0);
  objc_storeStrong((id *)&self->_spriteIndexesThatWereInserted, 0);

  objc_storeStrong((id *)&self->_spriteIndexesThatWereRemoved, 0);
}

- (int64_t)layoutVersionBeforeChange
{
  return self->_layoutVersionBeforeChange;
}

- (unsigned)numberOfSpritesBeforeChange
{
  return self->_numberOfSpritesBeforeChange;
}

- (unsigned)numberOfSpritesAfterChange
{
  return self->_numberOfSpritesAfterChange;
}

- (NSString)diagnosticDescription
{
  uint64_t v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p\n", v5, self];

  objc_msgSend(v6, "appendFormat:", @"\tnumberOfSprites beforeChange:%li afterChange:%li\n", self->_numberOfSpritesBeforeChange, self->_numberOfSpritesAfterChange);
  id v7 = [(NSIndexSet *)self->_spriteIndexesThatWereRemoved px_shortDescription];
  [v6 appendFormat:@"\tremovedSpriteIndexes: %@\n", v7];

  NSUInteger v8 = [(NSIndexSet *)self->_spriteIndexesThatWereInserted px_shortDescription];
  [v6 appendFormat:@"\tinsertedSpriteIndexes: %@\n", v8];

  NSUInteger v9 = [(NSIndexSet *)self->_spriteIndexesThatWereModified px_shortDescription];
  [v6 appendFormat:@"\tmodifiedSpriteIndexes: %@\n", v9];

  objc_msgSend(v6, "appendFormat:", @"\thasMoves: %i\n", self->_hasMoves);
  if ([(PXGChangeDetails *)self hasAnyInsertionsRemovalsOrMoves])
  {
    nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
    if (nextSpriteIndexByPreviousSpriteIndex)
    {
      if (self->_numberOfSpritesBeforeChange)
      {
        unint64_t v11 = 0;
        do
        {
          if (nextSpriteIndexByPreviousSpriteIndex[v11] == -1)
          {
            [v6 appendFormat:@"\t\t%li -> %@\n", v11, @"-"];
          }
          else
          {
            unsigned int v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
            [v6 appendFormat:@"\t\t%li -> %@\n", v11, v12];
          }
          ++v11;
        }
        while (v11 < self->_numberOfSpritesBeforeChange);
      }
    }
  }
  if (*(_OWORD *)&self->_layoutVersionBeforeChange != 0) {
    objc_msgSend(v6, "appendFormat:", @"\tlayoutVersion: %li->%li\n", self->_layoutVersionBeforeChange, self->_layoutVersionAfterChange);
  }
  [v6 appendString:@">"];

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  *((_DWORD *)v4 + 21) = self->_numberOfSpritesBeforeChange;
  *((_DWORD *)v4 + 20) = self->_numberOfSpritesAfterChange;
  uint64_t v5 = [(NSIndexSet *)self->_spriteIndexesThatWereRemoved copy];
  id v6 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v5;

  uint64_t v7 = [(NSIndexSet *)self->_spriteIndexesThatWereInserted copy];
  NSUInteger v8 = (void *)*((void *)v4 + 4);
  *((void *)v4 + 4) = v7;

  uint64_t v9 = [(NSIndexSet *)self->_spriteIndexesThatWereModified copy];
  unint64_t v10 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v9;

  *((unsigned char *)v4 + 48) = self->_hasMoves;
  if ([(PXGChangeDetails *)self hasAnyInsertionsRemovalsOrMoves])
  {
    [v4 _resizeStorageIfNeeded];
    memcpy(*((void **)v4 + 1), self->_nextSpriteIndexByPreviousSpriteIndex, 4 * self->_numberOfSpritesBeforeChange);
  }
  *((void *)v4 + 11) = self->_layoutVersionBeforeChange;
  *((void *)v4 + 12) = self->_layoutVersionAfterChange;
  return v4;
}

void __38__PXGChangeDetails_arrayChangeDetails__block_invoke(uint64_t a1, const void *a2)
{
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
  id v4 = *(__CFArray **)(a1 + 40);

  CFArrayAppendValue(v4, Value);
}

void __53__PXGChangeDetails_applyToDictionary_removalHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v7 = a3;
  if (*(_DWORD *)(a1[6] + 4 * [a2 integerValue]) == -1)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    uint64_t v5 = (void *)a1[4];
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    [v5 setObject:v7 forKeyedSubscript:v6];
  }
}

uint64_t __96__PXGChangeDetails_applyToArray_elementSize_countAfterChanges_insertionHandler_modifiedHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__PXGChangeDetails_indexSetAfterApplyingChangeDetails___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a2 + a3;
  if (a2 + a3 > (unint64_t)a2)
  {
    uint64_t v4 = result;
    uint64_t v5 = a2;
    unsigned int v6 = a2 + 1;
    do
    {
      if (*(_DWORD *)(*(void *)(v4 + 40) + 4 * v5) != -1) {
        result = objc_msgSend(*(id *)(v4 + 32), "addIndex:");
      }
      uint64_t v5 = v6;
    }
    while (v3 > v6++);
  }
  return result;
}

- (NSIndexSet)insertedSpriteIndexes
{
  return self->_spriteIndexesThatWereInserted;
}

- (PXGChangeDetails)inverse
{
  unint64_t v3 = objc_alloc_init(PXGChangeDetails);
  v3->_unint64_t numberOfSpritesBeforeChange = self->_numberOfSpritesAfterChange;
  v3->_unint64_t numberOfSpritesAfterChange = self->_numberOfSpritesBeforeChange;
  uint64_t v4 = [(NSIndexSet *)self->_spriteIndexesThatWereInserted copy];
  spriteIndexesThatWereRemoved = v3->_spriteIndexesThatWereRemoved;
  v3->_spriteIndexesThatWereRemoved = (NSIndexSet *)v4;

  uint64_t v6 = [(NSIndexSet *)self->_spriteIndexesThatWereRemoved copy];
  spriteIndexesThatWereInserted = v3->_spriteIndexesThatWereInserted;
  v3->_spriteIndexesThatWereInserted = (NSIndexSet *)v6;

  v3->_hasMoves = self->_hasMoves;
  v3->_layoutVersionBeforeChange = self->_layoutVersionAfterChange;
  v3->_layoutVersionAfterChange = self->_layoutVersionBeforeChange;
  if ([(PXGChangeDetails *)self hasAnyInsertionsRemovalsOrMoves])
  {
    NSUInteger v8 = malloc_type_malloc(4 * self->_numberOfSpritesAfterChange, 0x100004052888210uLL);
    uint64_t v9 = v8;
    if (self->_numberOfSpritesAfterChange)
    {
      unint64_t v10 = 0;
      do
      {
        v8[v10++] = -1;
        unint64_t numberOfSpritesAfterChange = self->_numberOfSpritesAfterChange;
      }
      while (v10 < numberOfSpritesAfterChange);
    }
    else
    {
      LODWORD(numberOfSpritesAfterChange) = 0;
    }
    unint64_t numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
    if (numberOfSpritesBeforeChange)
    {
      unint64_t v15 = 0;
      nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
      do
      {
        uint64_t v17 = nextSpriteIndexByPreviousSpriteIndex[v15];
        if (v17 != -1)
        {
          v8[v17] = v15;
          unint64_t numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
        }
        ++v15;
      }
      while (v15 < numberOfSpritesBeforeChange);
      LODWORD(numberOfSpritesAfterChange) = self->_numberOfSpritesAfterChange;
    }
    v3->_nextSpriteIndexByPreviousSpriteIndex = v8;
    v3->_int64_t nextSpriteIndexByPreviousSpriteIndexCapacity = numberOfSpritesAfterChange;
    id v18 = objc_alloc_init(MEMORY[0x263F089C8]);
    spriteIndexesThatWereModified = self->_spriteIndexesThatWereModified;
    uint64_t v24 = MEMORY[0x263EF8330];
    uint64_t v25 = 3221225472;
    id v26 = __27__PXGChangeDetails_inverse__block_invoke;
    uint64_t v27 = &unk_2655565A0;
    id v28 = v18;
    int v29 = v9;
    id v20 = v18;
    [(NSIndexSet *)spriteIndexesThatWereModified enumerateIndexesUsingBlock:&v24];
    objc_msgSend(v20, "removeIndex:", 0xFFFFFFFFLL, v24, v25, v26, v27);
    uint64_t v21 = [v20 copy];
    unsigned int v22 = v3->_spriteIndexesThatWereModified;
    v3->_spriteIndexesThatWereModified = (NSIndexSet *)v21;
  }
  else
  {
    uint64_t v12 = [(NSIndexSet *)self->_spriteIndexesThatWereModified copy];
    id v13 = v3->_spriteIndexesThatWereModified;
    v3->_spriteIndexesThatWereModified = (NSIndexSet *)v12;
  }

  return v3;
}

uint64_t __27__PXGChangeDetails_inverse__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndex:*(unsigned int *)(*(void *)(a1 + 40) + 4 * a2)];
}

- (void)applySpriteTransferMap:(const unsigned int *)a3
{
  uint64_t v6 = (void *)[(NSIndexSet *)self->_spriteIndexesThatWereRemoved mutableCopy];
  id v7 = (void *)[(NSIndexSet *)self->_spriteIndexesThatWereInserted mutableCopy];
  NSUInteger v8 = (void *)[(NSIndexSet *)self->_spriteIndexesThatWereModified mutableCopy];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  char v33 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  spriteIndexesThatWereRemoved = self->_spriteIndexesThatWereRemoved;
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __43__PXGChangeDetails_applySpriteTransferMap___block_invoke;
  unsigned int v22 = &unk_265556578;
  id v28 = v32;
  int v29 = a3;
  uint64_t v27 = v31;
  v23 = self;
  id v10 = v6;
  id v24 = v10;
  id v11 = v7;
  id v25 = v11;
  SEL v30 = a2;
  id v12 = v8;
  id v26 = v12;
  [(NSIndexSet *)spriteIndexesThatWereRemoved enumerateIndexesUsingBlock:&v19];
  id v13 = (NSIndexSet *)objc_msgSend(v10, "copy", v19, v20, v21, v22, v23);
  id v14 = self->_spriteIndexesThatWereRemoved;
  self->_spriteIndexesThatWereRemoved = v13;

  unint64_t v15 = (NSIndexSet *)[v11 copy];
  spriteIndexesThatWereInserted = self->_spriteIndexesThatWereInserted;
  self->_spriteIndexesThatWereInserted = v15;

  uint64_t v17 = (NSIndexSet *)[v12 copy];
  spriteIndexesThatWereModified = self->_spriteIndexesThatWereModified;
  self->_spriteIndexesThatWereModified = v17;

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);
}

uint64_t __43__PXGChangeDetails_applySpriteTransferMap___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 64) + 8);
  uint64_t v3 = *(void *)(v2 + 24);
  uint64_t v4 = *(unsigned int *)(*(void *)(result + 80) + 4 * v3);
  if (v4 != -1)
  {
    uint64_t v6 = result;
    uint64_t v7 = *(void *)(*(void *)(result + 72) + 8);
    if (!*(unsigned char *)(v7 + 24))
    {
      *(unsigned char *)(v7 + 24) = 1;
      [*(id *)(result + 32) _invalidateLayoutVersions];
      [*(id *)(v6 + 32) _invalidateCachedArrayChangeDetails];
      uint64_t v8 = *(void *)(v6 + 32);
      if (!*(unsigned char *)(v8 + 48))
      {
        *(unsigned char *)(v8 + 48) = 1;
        [*(id *)(v6 + 32) _resizeStorageIfNeeded];
      }
    }
    [*(id *)(v6 + 40) removeIndex:a2];
    if (([*(id *)(v6 + 48) containsIndex:v4] & 1) == 0)
    {
      uint64_t v9 = [MEMORY[0x263F08690] currentHandler];
      [v9 handleFailureInMethod:*(void *)(v6 + 88), *(void *)(v6 + 32), @"PXGChangeDetails.m", 293, @"Invalid parameter not satisfying: %@", @"[spriteIndexesThatWereInserted containsIndex:mappedSpriteIndex]" object file lineNumber description];
    }
    [*(id *)(v6 + 48) removeIndex:v4];
    result = [*(id *)(v6 + 56) addIndex:v4];
    *(_DWORD *)(*(void *)(*(void *)(v6 + 32) + 8) + 4 * a2) = v4;
    uint64_t v2 = *(void *)(*(void *)(v6 + 64) + 8);
    uint64_t v3 = *(void *)(v2 + 24);
  }
  *(void *)(v2 + 24) = v3 + 1;
  return result;
}

- (_PXGSpriteIndexRange)splitIndexesIntoMovesToEndAndReinsertions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    [(PXGChangeDetails *)self _invalidateLayoutVersions];
    [(PXGChangeDetails *)self _invalidateCachedArrayChangeDetails];
    BOOL v5 = [(PXGChangeDetails *)self hasAnyInsertionsRemovalsOrMoves];
    uint64_t numberOfSpritesAfterChange = self->_numberOfSpritesAfterChange;
    self->_numberOfSpritesAfterChange += [v4 count];
    uint64_t v7 = (void *)[(NSIndexSet *)self->_spriteIndexesThatWereInserted mutableCopy];
    uint64_t v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = objc_alloc_init(MEMORY[0x263F089C8]);
    }
    id v11 = v9;

    [v11 addIndexes:v4];
    id v12 = (NSIndexSet *)[v11 copy];
    spriteIndexesThatWereInserted = self->_spriteIndexesThatWereInserted;
    self->_spriteIndexesThatWereInserted = v12;

    id v14 = (void *)[(NSIndexSet *)self->_spriteIndexesThatWereModified mutableCopy];
    [v14 removeIndexes:v4];
    unint64_t v15 = (NSIndexSet *)[v14 copy];
    spriteIndexesThatWereModified = self->_spriteIndexesThatWereModified;
    self->_spriteIndexesThatWereModified = v15;

    self->_hasMoves = 1;
    [(PXGChangeDetails *)self _resizeStorageIfNeeded];
    if (self->_numberOfSpritesBeforeChange)
    {
      unint64_t v17 = 0;
      LODWORD(v10) = 0;
      do
      {
        if (v5) {
          unsigned int v18 = self->_nextSpriteIndexByPreviousSpriteIndex[v17];
        }
        else {
          unsigned int v18 = v17;
        }
        int v19 = [v4 containsIndex:v18];
        unsigned int v20 = v10 + numberOfSpritesAfterChange;
        uint64_t v10 = (v10 + v19);
        if (!v19) {
          unsigned int v20 = v18;
        }
        self->_nextSpriteIndexByPreviousSpriteIndex[v17++] = v20;
      }
      while (v17 < self->_numberOfSpritesBeforeChange);
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t numberOfSpritesAfterChange = 0xFFFFFFFFLL;
  }

  return (_PXGSpriteIndexRange)(numberOfSpritesAfterChange | (v10 << 32));
}

- (void)increaseNumberOfSpritesBy:(unsigned int)a3
{
  [(PXGChangeDetails *)self _invalidateLayoutVersions];
  [(PXGChangeDetails *)self _invalidateCachedArrayChangeDetails];
  unint64_t numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
  self->_numberOfSpritesAfterChange += a3;
  self->_unint64_t numberOfSpritesBeforeChange = numberOfSpritesBeforeChange + a3;
  if ([(PXGChangeDetails *)self hasAnyInsertionsRemovalsOrMoves])
  {
    [(PXGChangeDetails *)self _resizeStorageIfNeeded];
    unsigned int v6 = self->_numberOfSpritesBeforeChange;
    if (numberOfSpritesBeforeChange < v6)
    {
      nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
      unsigned int v8 = self->_numberOfSpritesAfterChange - v6;
      do
      {
        nextSpriteIndexByPreviousSpriteIndex[numberOfSpritesBeforeChange] = v8 + numberOfSpritesBeforeChange;
        ++numberOfSpritesBeforeChange;
      }
      while (numberOfSpritesBeforeChange < self->_numberOfSpritesBeforeChange);
    }
  }
}

- (void)removeSpritesAtIndexes:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    [(PXGChangeDetails *)self _invalidateLayoutVersions];
    [(PXGChangeDetails *)self _invalidateCachedArrayChangeDetails];
    uint64_t numberOfSpritesAfterChange = self->_numberOfSpritesAfterChange;
    if ([(PXGChangeDetails *)self hasAnyInsertionsRemovalsOrMoves])
    {
      spriteIndexesThatWereRemoved = self->_spriteIndexesThatWereRemoved;
      if (spriteIndexesThatWereRemoved)
      {
        unsigned int v8 = (NSIndexSet *)[(NSIndexSet *)spriteIndexesThatWereRemoved mutableCopy];
        [(NSIndexSet *)v8 addIndexes:v5];
        id v9 = (NSIndexSet *)[(NSIndexSet *)v8 copy];
        uint64_t v10 = self->_spriteIndexesThatWereRemoved;
        self->_spriteIndexesThatWereRemoved = v9;
      }
      else
      {
        unsigned int v20 = (NSIndexSet *)[v5 copy];
        unsigned int v8 = self->_spriteIndexesThatWereRemoved;
        self->_spriteIndexesThatWereRemoved = v20;
      }

      id v21 = objc_alloc_init(MEMORY[0x263F089C8]);
      uint64_t v36 = MEMORY[0x263EF8330];
      uint64_t v37 = 3221225472;
      uint64_t v38 = __43__PXGChangeDetails_removeSpritesAtIndexes___block_invoke;
      uint64_t v39 = &unk_265556550;
      id v22 = v21;
      id v40 = v22;
      v41 = self;
      [v5 enumerateIndexesUsingBlock:&v36];
      objc_msgSend(v22, "removeIndex:", 0xFFFFFFFFLL, v36, v37, v38, v39);
      v23 = [(NSIndexSet *)self->_spriteIndexesThatWereModified px_indexSetAdjustedForDeletions:v22];
      spriteIndexesThatWereModified = self->_spriteIndexesThatWereModified;
      self->_spriteIndexesThatWereModified = v23;

      id v25 = [(NSIndexSet *)self->_spriteIndexesThatWereInserted px_indexSetAdjustedForDeletions:v22];
      spriteIndexesThatWereInserted = self->_spriteIndexesThatWereInserted;
      self->_spriteIndexesThatWereInserted = v25;

      uint64_t v27 = malloc_type_malloc(4 * self->_numberOfSpritesAfterChange, 0x100004052888210uLL);
      if (self->_numberOfSpritesAfterChange)
      {
        unint64_t v28 = 0;
        int v29 = 0;
        do
        {
          v27[v28] = v29;
          v29 += [v22 containsIndex:v28++] ^ 1;
        }
        while (v28 < self->_numberOfSpritesAfterChange);
      }
      unint64_t numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
      if (numberOfSpritesBeforeChange)
      {
        unint64_t v31 = 0;
        nextSpriteIndexByPreviousSpriteIndex = self->_nextSpriteIndexByPreviousSpriteIndex;
        do
        {
          uint64_t v33 = nextSpriteIndexByPreviousSpriteIndex[v31];
          if (v33 != -1)
          {
            nextSpriteIndexByPreviousSpriteIndex[v31] = v27[v33];
            unint64_t numberOfSpritesBeforeChange = self->_numberOfSpritesBeforeChange;
          }
          ++v31;
        }
        while (v31 < numberOfSpritesBeforeChange);
      }
      free(v27);
      uint64_t v19 = [v22 count];
    }
    else
    {
      [(PXGChangeDetails *)self _resizeStorageIfNeeded];
      if (self->_numberOfSpritesBeforeChange)
      {
        unint64_t v11 = 0;
        unsigned int v12 = 0;
        do
        {
          int v13 = [v5 containsIndex:v11];
          if (v13) {
            unsigned int v14 = -1;
          }
          else {
            unsigned int v14 = v12;
          }
          v12 += v13 ^ 1;
          self->_nextSpriteIndexByPreviousSpriteIndex[v11++] = v14;
        }
        while (v11 < self->_numberOfSpritesBeforeChange);
      }
      unint64_t v15 = (NSIndexSet *)[v5 copy];
      uint64_t v16 = self->_spriteIndexesThatWereRemoved;
      self->_spriteIndexesThatWereRemoved = v15;

      unint64_t v17 = [(NSIndexSet *)self->_spriteIndexesThatWereModified px_indexSetAdjustedForDeletions:v5];
      unsigned int v18 = self->_spriteIndexesThatWereModified;
      self->_spriteIndexesThatWereModified = v17;

      uint64_t v19 = [v5 count];
    }
    uint64_t v34 = numberOfSpritesAfterChange - v19;
    if (v34 < 0)
    {
      v35 = [MEMORY[0x263F08690] currentHandler];
      [v35 handleFailureInMethod:a2, self, @"PXGChangeDetails.m", 219, @"Invalid removed indexes, numberOfSpritesAfterChange would be < 0" object file lineNumber description];
    }
    self->_uint64_t numberOfSpritesAfterChange = v34;
  }
}

uint64_t __43__PXGChangeDetails_removeSpritesAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) addIndex:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 4 * a2)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 4 * a2) = -1;
  return result;
}

- (_PXGSpriteIndexRange)replaceRemovalsWithMovesToEndForIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  unsigned int v20 = (_PXGSpriteIndexRange *)&v19;
  uint64_t v21 = 0x2810000000;
  id v22 = &unk_2603C79F7;
  uint64_t v23 = 0xFFFFFFFFLL;
  LODWORD(v23) = self->_numberOfSpritesAfterChange;
  id v5 = (void *)[(NSIndexSet *)self->_spriteIndexesThatWereRemoved mutableCopy];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  unsigned int v14 = __60__PXGChangeDetails_replaceRemovalsWithMovesToEndForIndexes___block_invoke;
  unint64_t v15 = &unk_265556528;
  uint64_t v16 = self;
  unsigned int v18 = &v19;
  id v6 = v5;
  id v17 = v6;
  [v4 enumerateIndexesUsingBlock:&v12];
  uint64_t v7 = v20;
  if (v20[4].var1)
  {
    [(PXGChangeDetails *)self _invalidateLayoutVersions];
    [(PXGChangeDetails *)self _invalidateCachedArrayChangeDetails];
    self->_numberOfSpritesAfterChange += v20[4].var1;
    unsigned int v8 = (NSIndexSet *)[v6 count];
    if (v8) {
      unsigned int v8 = (NSIndexSet *)[v6 copy];
    }
    spriteIndexesThatWereRemoved = self->_spriteIndexesThatWereRemoved;
    self->_spriteIndexesThatWereRemoved = v8;

    self->_hasMoves = 1;
    uint64_t v7 = v20;
  }
  _PXGSpriteIndexRange v10 = v7[4];

  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __60__PXGChangeDetails_replaceRemovalsWithMovesToEndForIndexes___block_invoke(void *a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1[4] + 24) containsIndex:a2];
  if (result)
  {
    uint64_t v5 = *(void *)(a1[6] + 8);
    int v6 = *(_DWORD *)(v5 + 36);
    int v7 = v6 + *(_DWORD *)(v5 + 32);
    *(_DWORD *)(v5 + 36) = v6 + 1;
    *(_DWORD *)(*(void *)(a1[4] + 8) + 4 * a2) = v7;
    unsigned int v8 = (void *)a1[5];
    return [v8 removeIndex:a2];
  }
  return result;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = [(PXGChangeDetails *)self insertedSpriteIndexes];
  uint64_t v7 = [v6 count];
  unsigned int v8 = [(PXGChangeDetails *)self removedSpriteIndexes];
  uint64_t v9 = [v8 count];
  _PXGSpriteIndexRange v10 = [(PXGChangeDetails *)self modifiedSpriteIndexes];
  uint64_t v11 = [v10 count];
  if (self->_hasMoves) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  uint64_t v13 = v12;
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; ins = %lu; del = %lu; mod = %lu; moves = %@>",
    v5,
    self,
    v7,
    v9,
    v11,
  unsigned int v14 = v13);

  return (NSString *)v14;
}

- (void)dealloc
{
  free(self->_nextSpriteIndexByPreviousSpriteIndex);
  free(self->_tempBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PXGChangeDetails;
  [(PXGChangeDetails *)&v3 dealloc];
}

@end