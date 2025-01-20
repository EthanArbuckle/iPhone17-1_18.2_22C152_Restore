@interface PULayoutSampledSectioning
- (BOOL)hasSomeSampling;
- (BOOL)supportsSamplingAndSectionGrouping;
- (PULayoutSampledSectioning)init;
- (PUSimpleIndexPath)_mainRealItemIndexPathForVisualSection:(int64_t)a3 andUnsampledItemIndex:(int64_t)a4;
- (PUSimpleIndexPath)mainRealItemIndexPathForVisualIndexPath:(PUSimpleIndexPath)a3;
- (PUSimpleIndexPath)visualIndexPathForRealIndexPath:(PUSimpleIndexPath)a3 isMainItem:(BOOL *)a4;
- (id)_sectionSamplerForVisualSection:(int64_t)a3;
- (id)visibleUnsampledIndexesForCombinedRealSections:(id)a3;
- (int64_t)__debugUnsampledIndexForRealIndexPath:(PUSimpleIndexPath)a3;
- (int64_t)_unsampledItemIndexForVisualItemIndex:(int64_t)a3 visualSection:(int64_t)a4;
- (int64_t)_visualItemIndexForUnsampledItemIndex:(int64_t)a3 visualSection:(int64_t)a4 isMainItem:(BOOL *)a5;
- (int64_t)mainRealSectionForVisualSection:(int64_t)a3;
- (int64_t)numberOfRealItemsInVisualSection:(int64_t)a3;
- (int64_t)numberOfVisualItemsInVisualSection:(int64_t)a3;
- (int64_t)visualSectionForRealSection:(int64_t)a3;
- (void)_cacheSectioningIfNeeded;
- (void)_discardSamplingCache;
- (void)_discardSectioningCache;
- (void)dealloc;
- (void)enumerateRealMainItemIndexPathsForVisualSection:(int64_t)a3 inVisualItemRange:(_NSRange)a4 usingBlock:(id)a5;
- (void)enumerateRealSectionsForVisualSection:(int64_t)a3 usingBlock:(id)a4;
- (void)invalidateSampling;
- (void)invalidateSections;
- (void)setSupportsSamplingAndSectionGrouping:(BOOL)a3;
@end

@implementation PULayoutSampledSectioning

- (void).cxx_destruct
{
}

- (BOOL)supportsSamplingAndSectionGrouping
{
  return self->_supportsSamplingAndSectionGrouping;
}

- (int64_t)__debugUnsampledIndexForRealIndexPath:(PUSimpleIndexPath)a3
{
  if (self->_supportsSamplingAndSectionGrouping) {
    a3.var1 += self->_startIndexInVisualSectionForRealSection[a3.var0];
  }
  return a3.var1;
}

- (id)visibleUnsampledIndexesForCombinedRealSections:(id)a3
{
  id v4 = a3;
  if (self->_hasSomeSampling)
  {
    [(PULayoutSampledSectioning *)self _cacheSectioningIfNeeded];
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = 0x7FFFFFFFFFFFFFFFLL;
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2020000000;
    v21[3] = 0x7FFFFFFFFFFFFFFFLL;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    char v20 = 1;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = 0x7FFFFFFFFFFFFFFFLL;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__PULayoutSampledSectioning_visibleUnsampledIndexesForCombinedRealSections___block_invoke;
    v10[3] = &unk_1E5F271F8;
    v10[4] = self;
    v12 = v22;
    v13 = v21;
    v14 = v19;
    v15 = v18;
    id v6 = v5;
    id v11 = v6;
    v16 = v17;
    [v4 enumerateIndexesUsingBlock:v10];
    v7 = v11;
    id v8 = v6;

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v22, 8);
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"%@ has no sampling and shouldn't be used to provide sub-sampling", self format];
    id v8 = 0;
  }

  return v8;
}

void *__76__PULayoutSampledSectioning_visibleUnsampledIndexesForCombinedRealSections___block_invoke(void *result, unint64_t a2)
{
  v2 = (void *)result[4];
  uint64_t v3 = *(void *)(v2[8] + 8 * a2);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = result;
    uint64_t v6 = *(void *)(v2[9] + 8 * a2);
    if (v3 != *(void *)(*(void *)(result[6] + 8) + 24))
    {
      *(void *)(*(void *)(result[7] + 8) + 24) = *(void *)(v2[10] + 8 * v3);
      result = (void *)result[4];
      uint64_t v7 = *(void *)(result[13] + 8 * v3);
      if (v7 >= 1 && *(void *)(*(void *)(v5[7] + 8) + 24) <= v7)
      {
        char v8 = 1;
      }
      else
      {
        result = objc_msgSend(result, "visualIndexPathForRealIndexPath:isMainItem:", a2, 0, 0);
        char v8 = 0;
        *(void *)(*(void *)(v5[9] + 8) + 24) = v9;
        *(void *)(*(void *)(v5[7] + 8) + 24) = v7;
      }
      *(unsigned char *)(*(void *)(v5[8] + 8) + 24) = v8;
      *(void *)(*(void *)(v5[6] + 8) + 24) = v3;
    }
    if (*(unsigned char *)(*(void *)(v5[8] + 8) + 24))
    {
      result = objc_msgSend((id)v5[5], "addIndexesInRange:", *(void *)(*(void *)(v5[10] + 8) + 24), v6);
    }
    else
    {
      while (*(void *)(*(void *)(v5[9] + 8) + 24) < *(void *)(*(void *)(v5[7] + 8) + 24))
      {
        result = (void *)[(id)v5[4] mainRealItemIndexPathForVisualIndexPath:*(void *)(*(void *)(v5[6] + 8) + 24)];
        if ((unint64_t)result > a2) {
          break;
        }
        if (result == (void *)a2) {
          result = (void *)[(id)v5[5] addIndex:*(void *)(*(void *)(v5[10] + 8) + 24) + v10];
        }
        ++*(void *)(*(void *)(v5[9] + 8) + 24);
      }
    }
    *(void *)(*(void *)(v5[10] + 8) + 24) += v6;
  }
  return result;
}

- (void)enumerateRealMainItemIndexPathsForVisualSection:(int64_t)a3 inVisualItemRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length = a4.length;
  int64_t location = a4.location;
  uint64_t v10 = (void (**)(id, int64_t, uint64_t, uint64_t, char *))a5;
  int64_t v11 = location + length;
  if (self->_supportsSamplingAndSectionGrouping)
  {
    if (self->_numberOfVisualSections <= a3
      || v11 > (unint64_t)[(PULayoutSampledSectioning *)self numberOfVisualItemsInVisualSection:a3])
    {
      v38 = [MEMORY[0x1E4F28B00] currentHandler];
      v58.int64_t location = location;
      v58.NSUInteger length = length;
      v39 = NSStringFromRange(v58);
      [v38 handleFailureInMethod:a2, self, @"PULayoutSectioning.m", 1428, @"Invalid visual item range %@ for visual section %ld containing %ld visual items", v39, a3, -[PULayoutSampledSectioning numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", a3) object file lineNumber description];

      if (!length) {
        goto LABEL_49;
      }
    }
    else if (!length)
    {
      goto LABEL_49;
    }
    if (self->_hasSomeSampling)
    {
      uint64_t v12 = self->_maximumNumberOfVisibleItemsForVisualSection[a3];
      int64_t v13 = v12 - 1;
      if (v12 >= 1)
      {
        int64_t v14 = self->_numberOfRealItemsForVisualSection[a3];
        if (v14 > v12)
        {
          if (self->_sectionSamplers
            && ([(PULayoutSampledSectioning *)self _sectionSamplerForVisualSection:a3], (v15 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v16 = v15;
            uint64_t v17 = [v15 unsampledIndexForIndex:location];
            char v18 = 0;
          }
          else
          {
            v16 = 0;
            if (v13 <= location)
            {
              uint64_t v17 = v14 - 1;
              char v18 = 1;
            }
            else
            {
              int64_t v35 = v13 + v14 * location;
              char v18 = 1;
              uint64_t v17 = v35 / v12;
            }
          }
          goto LABEL_23;
        }
        uint64_t v12 = 0;
LABEL_22:
        v16 = 0;
        char v18 = 1;
        uint64_t v17 = location;
LABEL_23:
        uint64_t v21 = [(PULayoutSampledSectioning *)self _mainRealItemIndexPathForVisualSection:a3 andUnsampledItemIndex:v17];
        v57[0] = 0;
        v10[2](v10, location, v21, v22, v57);
        if (length != 1 && !v57[0])
        {
          int64_t v23 = location + 1;
          v24 = [(NSArray *)self->_realSectionIndexesForVisualSection objectAtIndex:a3];
          uint64_t v25 = [v24 rangeAtIndex:self->_lastHitRangeIndex];
          v56[0] = 0;
          v56[1] = v56;
          v56[2] = 0x2020000000;
          v56[3] = v25 + v26;
          v54[0] = 0;
          v54[1] = v54;
          v54[2] = 0x2020000000;
          int64_t v55 = 0;
          int64_t lastHitRealSectionIndex = self->_lastHitRealSectionIndex;
          int64_t v55 = self->_startIndexInVisualSectionForRealSection[lastHitRealSectionIndex];
          v52[0] = 0;
          v52[1] = v52;
          v52[2] = 0x2020000000;
          int64_t v53 = 0;
          int64_t v53 = self->_numberOfItemsForRealSection[lastHitRealSectionIndex] + v55;
          v51[0] = 0;
          v51[1] = v51;
          v51[2] = 0x3010000000;
          v51[3] = "";
          v51[4] = lastHitRealSectionIndex;
          v51[5] = 0;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __106__PULayoutSampledSectioning_enumerateRealMainItemIndexPathsForVisualSection_inVisualItemRange_usingBlock___block_invoke;
          aBlock[3] = &unk_1E5F271D0;
          v47 = v52;
          v48 = v56;
          aBlock[4] = self;
          id v28 = v24;
          id v45 = v28;
          v49 = v54;
          v50 = v51;
          v46 = v10;
          v29 = (void (**)(void *, int64_t, int64_t, unsigned char *))_Block_copy(aBlock);
          if (v18)
          {
            uint64_t v30 = v12 - 1;
            if (v12 < 1)
            {
              char v43 = 0;
              if (v23 < v11)
              {
                NSUInteger v36 = length - 2;
                do
                {
                  v29[2](v29, v23, v23, &v43);
                  ++v23;
                  if (v43) {
                    BOOL v37 = 1;
                  }
                  else {
                    BOOL v37 = v36 == 0;
                  }
                  --v36;
                }
                while (!v37);
              }
            }
            else
            {
              id v42 = v28;
              char v43 = 0;
              if (v23 < v11)
              {
                uint64_t v31 = v30 + v14 * v23;
                NSUInteger v32 = length - 2;
                do
                {
                  NSUInteger v33 = v32;
                  if (v14 <= v12)
                  {
                    v41 = [MEMORY[0x1E4F28B00] currentHandler];
                    v40 = objc_msgSend(NSString, "stringWithUTF8String:", "NSInteger _unsampledIndexForIndex(NSInteger, NSInteger, NSInteger)");
                    [v41 handleFailureInFunction:v40 file:@"PULayoutSectioning.m" lineNumber:374 description:@"Invalid use"];
                  }
                  uint64_t v34 = v14 - 1;
                  if (v30 > v23) {
                    uint64_t v34 = v31 / v12;
                  }
                  v29[2](v29, v23, v34, &v43);
                  if (v43) {
                    break;
                  }
                  ++v23;
                  v31 += v14;
                  NSUInteger v32 = v33 - 1;
                }
                while (v33);
              }
              id v28 = v42;
            }
          }
          else
          {
            objc_msgSend(v16, "enumerateUnsampledIndexesForSampledIndexInRange:usingBlock:", v23, length - 1, v29);
          }

          _Block_object_dispose(v51, 8);
          _Block_object_dispose(v52, 8);
          _Block_object_dispose(v54, 8);
          _Block_object_dispose(v56, 8);
        }
        goto LABEL_49;
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
    int64_t v14 = 0;
    goto LABEL_22;
  }
  LOBYTE(v51[0]) = 0;
  if (location < v11)
  {
    NSUInteger v19 = length - 1;
    do
    {
      v10[2](v10, location, a3, location, (char *)v51);
      ++location;
      if (LOBYTE(v51[0])) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = v19 == 0;
      }
      --v19;
    }
    while (!v20);
  }
LABEL_49:
}

uint64_t __106__PULayoutSampledSectioning_enumerateRealMainItemIndexPathsForVisualSection_inVisualItemRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) <= a3)
  {
    do
    {
      ++*(void *)(*(void *)(a1 + 32) + 120);
      id v5 = *(void **)(a1 + 32);
      uint64_t v6 = v5[15];
      if (v6 >= *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        do
        {
          while (1)
          {
            ++v5[17];
            uint64_t v7 = [*(id *)(a1 + 40) rangeAtIndex:*(void *)(*(void *)(a1 + 32) + 136)];
            if (v8) {
              break;
            }
            id v5 = *(void **)(a1 + 32);
          }
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v7 + v8;
          id v5 = *(void **)(a1 + 32);
          uint64_t v9 = 8 * *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) - 8;
        }
        while (*(void *)(v5[9] + v9) + *(void *)(v5[11] + v9) <= a3);
        v5[15] = v7;
        id v5 = *(void **)(a1 + 32);
        uint64_t v6 = v5[15];
      }
      *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = *(void *)(v5[11] + 8 * v6);
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 32) + 72)
                                                                              + 8
                                                                              * *(void *)(*(void *)(a1 + 32) + 120))
                                                                  + *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                              + 24);
    }
    while (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) <= a3);
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = *(void *)(*(void *)(a1 + 32) + 120);
  }
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = a3
                                                              - *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                          + 24);
  uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v10();
}

- (void)enumerateRealSectionsForVisualSection:(int64_t)a3 usingBlock:(id)a4
{
  if (self->_supportsSamplingAndSectionGrouping)
  {
    id v7 = a4;
    [(PULayoutSampledSectioning *)self _cacheSectioningIfNeeded];
    if (a3 < 0 || self->_numberOfVisualSections <= a3)
    {
      uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PULayoutSectioning.m", 1408, @"Invalid visual section %ld for %ld visual sections", a3, self->_numberOfVisualSections);
    }
    id v11 = [(NSArray *)self->_realSectionIndexesForVisualSection objectAtIndex:a3];
    [v11 enumerateIndexesUsingBlock:v7];
  }
  else
  {
    uint64_t v8 = (void (*)(void))*((void *)a4 + 2);
    id v9 = a4;
    v8();
  }
}

- (int64_t)visualSectionForRealSection:(int64_t)a3
{
  if (self->_supportsSamplingAndSectionGrouping)
  {
    [(PULayoutSampledSectioning *)self _cacheSectioningIfNeeded];
    if (a3 < 0 || self->_numberOfRealSections <= a3)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PULayoutSectioning.m", 1394, @"Invalid real section %ld for %ld real sections", a3, self->_numberOfRealSections);
    }
    return self->_visualSectionForRealSection[a3];
  }
  return a3;
}

- (int64_t)mainRealSectionForVisualSection:(int64_t)a3
{
  if (!self->_supportsSamplingAndSectionGrouping) {
    return a3;
  }
  [(PULayoutSampledSectioning *)self _cacheSectioningIfNeeded];
  if (a3 < 0 || self->_numberOfVisualSections <= a3)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PULayoutSectioning.m", 1380, @"Invalid visual section %ld for %ld visual sections", a3, self->_numberOfVisualSections);
  }
  uint64_t v6 = [(NSArray *)self->_realSectionIndexesForVisualSection objectAtIndex:a3];
  int64_t v7 = [v6 firstIndex];

  return v7;
}

- (PUSimpleIndexPath)visualIndexPathForRealIndexPath:(PUSimpleIndexPath)a3 isMainItem:(BOOL *)a4
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  if (self->_supportsSamplingAndSectionGrouping)
  {
    [(PULayoutSampledSectioning *)self _cacheSectioningIfNeeded];
    if (var0 < 0 || var0 >= self->_numberOfRealSections)
    {
      uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PULayoutSectioning.m", 1350, @"Invalid real section index %ld for %ld real sections", var0, self->_numberOfRealSections);
    }
    if (var1 < 0 || var1 >= self->_numberOfItemsForRealSection[var0])
    {
      int64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PULayoutSectioning.m", 1351, @"Invalid real item index %ld for real section %ld containing %ld items", var1, var0, self->_numberOfItemsForRealSection[var0]);
    }
    int64_t v9 = self->_visualSectionForRealSection[var0];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t var0 = 0x7FFFFFFFFFFFFFFFLL;
      int64_t var1 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      int64_t var1 = [(PULayoutSampledSectioning *)self _visualItemIndexForUnsampledItemIndex:self->_startIndexInVisualSectionForRealSection[var0] + var1 visualSection:self->_visualSectionForRealSection[var0] isMainItem:a4];
      int64_t var0 = v9;
    }
  }
  else if (a4)
  {
    *a4 = 1;
  }
  int64_t v10 = var0;
  int64_t v11 = var1;
  result.int64_t var1 = v11;
  result.int64_t var0 = v10;
  return result;
}

- (PUSimpleIndexPath)mainRealItemIndexPathForVisualIndexPath:(PUSimpleIndexPath)a3
{
  int64_t var1 = a3.var1;
  int64_t var0 = a3.var0;
  if (!self->_supportsSamplingAndSectionGrouping) {
    goto LABEL_11;
  }
  [(PULayoutSampledSectioning *)self _cacheSectioningIfNeeded];
  if (var0 < 0 || var0 >= self->_numberOfVisualSections)
  {
    int64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PULayoutSectioning.m", 1327, @"Invalid visual section %ld for %ld visual sections", var0, self->_numberOfVisualSections);

    if ((var1 & 0x8000000000000000) == 0)
    {
LABEL_5:
      if (var1 < [(PULayoutSampledSectioning *)self numberOfVisualItemsInVisualSection:var0])goto LABEL_6; {
    }
      }
  }
  else if ((var1 & 0x8000000000000000) == 0)
  {
    goto LABEL_5;
  }
  int64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PULayoutSectioning.m", 1328, @"Invalid visual item %ld for %ld visual items in visual section #%ld", var1, -[PULayoutSampledSectioning numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:", var0), var0);

LABEL_6:
  if (!self->_numberOfRealItemsForVisualSection[var0])
  {
    int64_t var0 = 0x7FFFFFFFFFFFFFFFLL;
    int64_t var1 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:
    int64_t v8 = var0;
    int64_t v9 = var1;
    goto LABEL_14;
  }
  int64_t v7 = [(PULayoutSampledSectioning *)self _unsampledItemIndexForVisualItemIndex:var1 visualSection:var0];
  int64_t v8 = [(PULayoutSampledSectioning *)self _mainRealItemIndexPathForVisualSection:var0 andUnsampledItemIndex:v7];
LABEL_14:
  result.int64_t var1 = v9;
  result.int64_t var0 = v8;
  return result;
}

- (PUSimpleIndexPath)_mainRealItemIndexPathForVisualSection:(int64_t)a3 andUnsampledItemIndex:(int64_t)a4
{
  int64_t v7 = 0;
  int64_t lastHitRangeIndex = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  int64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  int64_t v19 = 0;
  if (self->_lastHitVisualSectionIndex != a3) {
    goto LABEL_9;
  }
  int64_t lastHitRealSectionIndex = self->_lastHitRealSectionIndex;
  int64_t v10 = self->_startIndexInVisualSectionForRealSection[lastHitRealSectionIndex];
  int64_t v11 = a4 - v10;
  if (a4 >= v10 && self->_numberOfItemsForRealSection[lastHitRealSectionIndex] + v10 > a4)
  {
    int64_t v23 = self->_lastHitRealSectionIndex;
    int64_t v19 = a4 - v10;
    if (lastHitRealSectionIndex != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (a4 <= v10)
  {
LABEL_8:
    int64_t v7 = 0;
    int64_t lastHitRangeIndex = 0;
    goto LABEL_9;
  }
  int64_t v7 = lastHitRealSectionIndex + 1;
  int64_t lastHitRangeIndex = self->_lastHitRangeIndex;
LABEL_9:
  uint64_t v12 = [(NSArray *)self->_realSectionIndexesForVisualSection objectAtIndex:a3];
  self->_int64_t lastHitRangeIndex = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__PULayoutSampledSectioning__mainRealItemIndexPathForVisualSection_andUnsampledItemIndex___block_invoke;
  v15[3] = &unk_1E5F271A8;
  v15[8] = v7;
  v15[9] = a4;
  v15[4] = self;
  v15[5] = &v20;
  v15[6] = &v16;
  v15[7] = lastHitRangeIndex;
  [v12 enumerateRangesWithOptions:0 usingBlock:v15];
  self->_int64_t lastHitRealSectionIndex = v21[3];
  self->_lastHitVisualSectionIndex = a3;

  int64_t v11 = v17[3];
  int64_t lastHitRealSectionIndex = v21[3];
LABEL_10:
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  int64_t v13 = lastHitRealSectionIndex;
  int64_t v14 = v11;
  result.int64_t var1 = v14;
  result.int64_t var0 = v13;
  return result;
}

void *__90__PULayoutSampledSectioning__mainRealItemIndexPathForVisualSection_andUnsampledItemIndex___block_invoke(void *result, unint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v4 = (void *)result[4];
  uint64_t v5 = v4[17];
  if (v5 < result[7]
    || (uint64_t v6 = a2 + a3, v7 = result[8], (uint64_t)(a2 + a3) <= (uint64_t)v7)
    || (uint64_t v8 = v4[11], v9 = v4[9], v10 = result[9], v10 >= *(void *)(v9 + 8 * v6 - 8) + *(void *)(v8 + 8 * v6 - 8)))
  {
    if (!*a4) {
      v4[17] = v5 + 1;
    }
  }
  else
  {
    if (v7 <= a2) {
      uint64_t v11 = a2;
    }
    else {
      uint64_t v11 = result[8];
    }
    if (v11 < v6)
    {
      while (1)
      {
        uint64_t v12 = *(void *)(v8 + 8 * v11);
        if (v10 < *(void *)(v9 + 8 * v11) + v12) {
          break;
        }
        if (v6 == ++v11) {
          goto LABEL_14;
        }
      }
      *(void *)(*(void *)(result[5] + 8) + 24) = v11;
      *(void *)(*(void *)(result[6] + 8) + 24) = result[9] - v12;
    }
LABEL_14:
    *a4 = 1;
  }
  return result;
}

- (int64_t)_unsampledItemIndexForVisualItemIndex:(int64_t)a3 visualSection:(int64_t)a4
{
  uint64_t v4 = a3;
  if (self->_hasSomeSampling)
  {
    uint64_t v5 = self->_maximumNumberOfVisibleItemsForVisualSection[a4];
    int64_t v6 = v5 - 1;
    if (v5 >= 1)
    {
      int64_t v7 = self->_numberOfRealItemsForVisualSection[a4];
      if (v7 > v5)
      {
        if (self->_sectionSamplers)
        {
          uint64_t v8 = [(PULayoutSampledSectioning *)self _sectionSamplerForVisualSection:a4];
          uint64_t v4 = [v8 unsampledIndexForIndex:v4];
        }
        else if (v6 <= a3)
        {
          return v7 - 1;
        }
        else
        {
          return (v6 + v7 * a3) / v5;
        }
      }
    }
  }
  return v4;
}

- (int64_t)_visualItemIndexForUnsampledItemIndex:(int64_t)a3 visualSection:(int64_t)a4 isMainItem:(BOOL *)a5
{
  if (a5) {
    *a5 = 1;
  }
  if (!self->_hasSomeSampling) {
    return a3;
  }
  uint64_t v7 = self->_maximumNumberOfVisibleItemsForVisualSection[a4];
  int64_t v8 = v7 - 1;
  if (v7 < 1) {
    return a3;
  }
  int64_t v9 = self->_numberOfRealItemsForVisualSection[a4];
  if (v9 <= v7) {
    return a3;
  }
  if (self->_sectionSamplers)
  {
    uint64_t v10 = [(PULayoutSampledSectioning *)self _sectionSamplerForVisualSection:a4];
    int64_t v11 = [v10 indexForUnsampledIndex:a3 isMainItem:a5];

    return v11;
  }
  else
  {
    int64_t result = v7 * a3 / v9;
    if (a5)
    {
      if (v8 <= result) {
        int64_t v13 = v9 - 1;
      }
      else {
        int64_t v13 = (v8 + result * v9) / v7;
      }
      *a5 = v13 == a3;
    }
  }
  return result;
}

- (id)_sectionSamplerForVisualSection:(int64_t)a3
{
  uint64_t v5 = (PULayoutSectionSimpleSampler *)self->_sectionSamplers[a3];
  if (!v5)
  {
    uint64_t v6 = self->_maximumNumberOfVisibleItemsForVisualSection[a3];
    uint64_t v7 = self->_numberOfRealItemsForVisualSection[a3];
    int64_t v8 = [(NSArray *)self->_realSectionIndexesForVisualSection objectAtIndexedSubscript:a3];
    int64_t v9 = [(PULayoutSectioning *)self->super._baseSectioning visibleUnsampledIndexesForCombinedRealSections:v8];
    uint64_t v10 = [v9 count];
    if (v10 == v7 || v10 == 0)
    {
      uint64_t v5 = [[PULayoutSectionSimpleSampler alloc] initWithNumberOfVisibleItems:v6 numberOfRealItems:v7];
LABEL_40:
      objc_storeStrong(&self->_sectionSamplers[a3], v5);

      goto LABEL_41;
    }
    int64_t v35 = v8;
    uint64_t v5 = [[PULayoutSectionListSampler alloc] initWithNumberOfVisibleItems:v6 numberOfRealItems:v7];
    NSUInteger v36 = (void *)[(PULayoutSectionSimpleSampler *)v5 visibleItemIndexes];
    id v12 = v9;
    int64_t v13 = v12;
    if (v6 >= v7)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v25 = objc_msgSend(NSString, "stringWithUTF8String:", "void _spreadIndexesInBuffer(NSInteger *, NSInteger, NSInteger, NSIndexSet *__strong)");
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, @"PULayoutSectioning.m", 409, @"Invalid count for visible indexes buffer (%ld) compared to maximum index (%ld)", v6, v7);
    }
    uint64_t v14 = [v13 count];
    if (v14 <= 0)
    {
      NSUInteger v33 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v26 = objc_msgSend(NSString, "stringWithUTF8String:", "void _spreadIndexesInBuffer(NSInteger *, NSInteger, NSInteger, NSIndexSet *__strong)");
      [v33 handleFailureInFunction:v26 file:@"PULayoutSectioning.m" lineNumber:412 description:@"Invalid empty hinting from base sectioning"];
    }
    if ([v13 lastIndex] >= (unint64_t)v7)
    {
      uint64_t v34 = [MEMORY[0x1E4F28B00] currentHandler];
      v27 = objc_msgSend(NSString, "stringWithUTF8String:", "void _spreadIndexesInBuffer(NSInteger *, NSInteger, NSInteger, NSIndexSet *__strong)");
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v27, @"PULayoutSectioning.m", 413, @"Invalid last index for visible indexes hint (%ld) compared to maximum index (%ld)", objc_msgSend(v13, "lastIndex"), v7);
    }
    if (v6 == v14)
    {
      [v13 getIndexes:v36 maxCount:v6 inIndexRange:0];
LABEL_39:

      int64_t v8 = v35;
      goto LABEL_40;
    }
    if (v6 < v14)
    {
      v15 = (uint64_t *)malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
      [v13 getIndexes:v15 maxCount:v14 inIndexRange:0];
      uint64_t v37 = MEMORY[0x1E4F143A8];
      uint64_t v38 = 3221225472;
      v39 = ___spreadIndexesInBuffer_block_invoke;
      v40 = &__block_descriptor_48_e11_v24__0q8q16l;
      v41 = v36;
      id v42 = v15;
      _iterateBySpreadingIndexes(v6, v14, &v37);
      free(v15);
      goto LABEL_39;
    }
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    uint64_t v49 = v6 - v14;
    int v16 = [v13 containsIndex:0];
    int v17 = v16;
    uint64_t v18 = v47[3];
    if ((v16 & 1) == 0) {
      v47[3] = --v18;
    }
    uint64_t v31 = v7 - 1;
    if (v18 < 1 || (v19 = objc_msgSend(v13, "containsIndex:"), uint64_t v18 = v47[3], (v19 & 1) != 0))
    {
      unsigned int v32 = 0;
      if (v18)
      {
LABEL_24:
        uint64_t v30 = v14 + (v17 ^ 1u);
        uint64_t v20 = malloc_type_malloc(8 * (v30 + v32), 0x100004000313F17uLL);
        if (v17)
        {
          uint64_t v21 = v20;
          [v13 getIndexes:v20 maxCount:v14 inIndexRange:0];
        }
        else
        {
          uint64_t v21 = v20;
          *uint64_t v20 = 0;
          [v13 getIndexes:v20 + 1 maxCount:v14 inIndexRange:0];
        }
        if (v32) {
          v21[v30] = v31;
        }
        v45[0] = 0;
        v45[1] = v45;
        v45[2] = 0x2020000000;
        v45[3] = 0;
        uint64_t v37 = MEMORY[0x1E4F143A8];
        uint64_t v38 = 3221225472;
        v39 = ___spreadIndexesInBuffer_block_invoke_2;
        v40 = &unk_1E5F27240;
        v41 = v45;
        id v42 = &v46;
        char v43 = v21;
        v44 = v36;
        _iterateBySpreadingIndexes(v6, v7, &v37);
        free(v21);
        if (v47[3])
        {
          id v28 = [MEMORY[0x1E4F28B00] currentHandler];
          v29 = objc_msgSend(NSString, "stringWithUTF8String:", "void _spreadIndexesInBuffer(NSInteger *, NSInteger, NSInteger, NSIndexSet *__strong)");
          objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"PULayoutSectioning.m", 485, @"Did not properly fill up buffer. We still need %ld indexes", v47[3]);
        }
        _Block_object_dispose(v45, 8);
LABEL_38:
        _Block_object_dispose(&v46, 8);
        goto LABEL_39;
      }
    }
    else
    {
      uint64_t v22 = v18 - 1;
      v47[3] = v22;
      unsigned int v32 = 1;
      if (v22) {
        goto LABEL_24;
      }
    }
    if (v17)
    {
      [v13 getIndexes:v36 maxCount:v14 inIndexRange:0];
    }
    else
    {
      *NSUInteger v36 = 0;
      [v13 getIndexes:v36 + 1 maxCount:v14 inIndexRange:0];
    }
    if (v32) {
      v36[v6 - 1] = v31;
    }
    goto LABEL_38;
  }
LABEL_41:
  return v5;
}

- (int64_t)numberOfRealItemsInVisualSection:(int64_t)a3
{
  if (self->_supportsSamplingAndSectionGrouping)
  {
    [(PULayoutSampledSectioning *)self _cacheSectioningIfNeeded];
    if (a3 < 0 || self->_numberOfVisualSections <= a3)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PULayoutSectioning.m", 1110, @"Invalid visual section %ld for %ld visual sections", a3, self->_numberOfVisualSections);
    }
    return self->_numberOfRealItemsForVisualSection[a3];
  }
  else
  {
    return -[PULayoutSampledSectioning numberOfVisualItemsInVisualSection:](self, "numberOfVisualItemsInVisualSection:");
  }
}

- (int64_t)numberOfVisualItemsInVisualSection:(int64_t)a3
{
  if (self->_supportsSamplingAndSectionGrouping)
  {
    [(PULayoutSampledSectioning *)self _cacheSectioningIfNeeded];
    if (a3 < 0 || self->_numberOfVisualSections <= a3)
    {
      int64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PULayoutSectioning.m", 1088, @"Invalid visual section %ld for %ld visual sections", a3, self->_numberOfVisualSections);
    }
    int64_t result = self->_numberOfRealItemsForVisualSection[a3];
    if (self->_hasSomeSampling)
    {
      int64_t v7 = self->_maximumNumberOfVisibleItemsForVisualSection[a3];
      if (result > v7 && v7 != 0) {
        return self->_maximumNumberOfVisibleItemsForVisualSection[a3];
      }
    }
  }
  else
  {
    int64_t v9 = [(PULayoutSectioning *)self delegate];
    int64_t v10 = [v9 numberOfItemsInRealSection:a3 forSectioning:self];

    return v10;
  }
  return result;
}

- (void)_cacheSectioningIfNeeded
{
  if (self->_sectioningIsValid)
  {
    if (!self->_samplingIsValid)
    {
      self->_hasSomeSampling = 0;
      self->_maximumNumberOfVisibleItemsForVisualSection = (int64_t *)malloc_type_malloc(8 * self->_numberOfVisualSections, 0x100004000313F17uLL);
      id obj = [(PULayoutSectioning *)self delegate];
      if (self->_numberOfVisualSections >= 1)
      {
        int64_t v3 = 0;
        do
        {
          uint64_t v4 = [obj maximumNumberOfItemsInVisualSection:v3 withNumberOfRealItems:self->_numberOfRealItemsForVisualSection[v3] forSectioning:self];
          self->_maximumNumberOfVisibleItemsForVisualSection[v3] = v4;
          if (v4 >= 1 && self->_numberOfRealItemsForVisualSection[v3] > v4) {
            self->_hasSomeSampling = 1;
          }
          ++v3;
        }
        while (v3 < self->_numberOfVisualSections);
      }
      baseSectioning = self->super._baseSectioning;
      if (baseSectioning)
      {
        if ([(PULayoutSectioning *)baseSectioning hasSomeSampling])
        {
          int64_t numberOfRealSections = self->_numberOfRealSections;
          if (numberOfRealSections >= 1) {
            self->_sectionSamplers = (id *)malloc_type_calloc(numberOfRealSections, 8uLL, 0x80040B8603338uLL);
          }
        }
      }
      self->_samplingIsValid = 1;
      self->_int64_t lastHitRealSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
      self->_lastHitVisualSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
      self->_int64_t lastHitRangeIndex = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    int64_t v7 = [(PULayoutSectioning *)self delegate];
    int64_t v8 = [v7 numberOfRealSectionsForSectioning:self];
    self->_int64_t numberOfRealSections = v8;
    self->_numberOfItemsForRealSection = (int64_t *)malloc_type_malloc(8 * v8, 0x100004000313F17uLL);
    int64_t v9 = self->_numberOfRealSections;
    if (v9 >= 1)
    {
      for (int64_t i = 0; i < v9; ++i)
      {
        self->_numberOfItemsForRealSection[i] = [v7 numberOfItemsInRealSection:i forSectioning:self];
        int64_t v9 = self->_numberOfRealSections;
      }
    }
    self->_startIndexInVisualSectionForRealSection = (int64_t *)malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
    self->_visualSectionForRealSection = (int64_t *)malloc_type_calloc(self->_numberOfRealSections, 8uLL, 0x100004000313F17uLL);
    int64_t v11 = [v7 numberOfVisualSectionsForSectioning:self];
    id obja = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v11];
    self->_hasSomeSampling = 0;
    self->_numberOfRealItemsForVisualSection = (int64_t *)malloc_type_malloc(8 * v11, 0x100004000313F17uLL);
    self->_maximumNumberOfVisibleItemsForVisualSection = (int64_t *)malloc_type_malloc(8 * v11, 0x100004000313F17uLL);
    uint64_t v56 = 0;
    v57 = &v56;
    uint64_t v58 = 0x3032000000;
    v59 = __Block_byref_object_copy__41837;
    v60 = __Block_byref_object_dispose__41838;
    id v61 = 0;
    int64_t v12 = self->_numberOfRealSections;
    id v34 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    if (v11 < 1)
    {
      uint64_t v32 = 0;
    }
    else
    {
      uint64_t v32 = 0;
      uint64_t v13 = 0;
      int64_t v33 = v11;
      do
      {
        uint64_t v14 = [v7 realSectionsForVisualSection:v13 forSectioning:self];
        if ([v14 count]
          && (unint64_t)[v14 lastIndex] >= self->_numberOfRealSections)
        {
          v15 = (void *)[v14 mutableCopy];
          objc_msgSend(v15, "removeIndexesInRange:", self->_numberOfRealSections, objc_msgSend(v14, "lastIndex") - self->_numberOfRealSections + 1);
          ++v32;

          int64_t v11 = v33;
        }
        else
        {
          v15 = v14;
        }
        uint64_t v50 = 0;
        v51 = &v50;
        uint64_t v52 = 0x3032000000;
        int64_t v53 = __Block_byref_object_copy__41837;
        v54 = __Block_byref_object_dispose__41838;
        id v55 = 0;
        uint64_t v46 = 0;
        v47 = &v46;
        uint64_t v48 = 0x2020000000;
        uint64_t v49 = 0;
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __53__PULayoutSampledSectioning__cacheSectioningIfNeeded__block_invoke;
        v38[3] = &unk_1E5F27180;
        id v16 = v34;
        id v39 = v16;
        id v42 = &v50;
        id v17 = v15;
        id v40 = v17;
        v41 = self;
        v44 = &v46;
        uint64_t v45 = v13;
        char v43 = &v56;
        [v17 enumerateIndexesUsingBlock:v38];
        uint64_t v18 = (void *)v51[5];
        if (v18)
        {
          id v19 = v18;

          id v17 = v19;
          int64_t v11 = v33;
        }
        [obja addObject:v17];
        [v16 addIndexes:v17];
        self->_numberOfRealItemsForVisualSection[v13] = v47[3];
        uint64_t v20 = objc_msgSend(v7, "maximumNumberOfItemsInVisualSection:withNumberOfRealItems:forSectioning:", v13);
        self->_maximumNumberOfVisibleItemsForVisualSection[v13] = v20;
        if (v20 >= 1 && self->_numberOfRealItemsForVisualSection[v13] > v20) {
          self->_hasSomeSampling = 1;
        }
        v12 -= [v17 count];

        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v50, 8);

        ++v13;
      }
      while (v11 != v13);
    }
    if (v57[5] || v12 || v32)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (v12)
      {
        uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%ld real section(s) in no visual sections", v12);
        [v21 addObject:v22];
      }
      int64_t v23 = (void *)v57[5];
      if (v23)
      {
        v24 = objc_msgSend(NSString, "stringWithFormat:", @"%ld real section(s) in several visual sections", objc_msgSend(v23, "count"));
        [v21 addObject:v24];
      }
      if (v32)
      {
        uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"%ld visual section(s) with unknown real sections", v32);
        [v21 addObject:v25];
      }
      uint64_t v26 = [v21 componentsJoinedByString:@", "];
      NSLog(&cfstr_FoundHopefully.isa, v26);
    }
    objc_storeStrong((id *)&self->_realSectionIndexesForVisualSection, obja);
    self->_numberOfVisualSections = v11;
    if (v12)
    {
      v27 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", 0, self->_numberOfRealSections);
      if (self->_numberOfVisualSections >= 1)
      {
        int64_t v28 = 0;
        do
        {
          v29 = [(NSArray *)self->_realSectionIndexesForVisualSection objectAtIndexedSubscript:v28];
          [v27 removeIndexes:v29];

          ++v28;
        }
        while (v28 < self->_numberOfVisualSections);
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __53__PULayoutSampledSectioning__cacheSectioningIfNeeded__block_invoke_2;
      v37[3] = &unk_1E5F2C2D8;
      v37[4] = self;
      [v27 enumerateIndexesUsingBlock:v37];
    }
    uint64_t v30 = self->super._baseSectioning;
    if (v30)
    {
      if ([(PULayoutSectioning *)v30 hasSomeSampling])
      {
        int64_t v31 = self->_numberOfRealSections;
        if (v31 >= 1) {
          self->_sectionSamplers = (id *)malloc_type_calloc(v31, 8uLL, 0x80040B8603338uLL);
        }
      }
    }
    self->_samplingIsValid = 1;
    self->_sectioningIsValid = 1;
    self->_int64_t lastHitRealSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_lastHitVisualSectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_int64_t lastHitRangeIndex = 0x7FFFFFFFFFFFFFFFLL;

    _Block_object_dispose(&v56, 8);
  }
}

uint64_t __53__PULayoutSampledSectioning__cacheSectioningIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndex:a2];
  if (result)
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    if (!v5)
    {
      uint64_t v6 = [*(id *)(a1 + 40) mutableCopy];
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
      int64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    [v5 removeIndex:a2];
    int64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (!v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      int64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      int64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    return [v9 addIndex:a2];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 64) + 8 * a2) = *(void *)(a1 + 80);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 88) + 8 * a2) = *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                               + 24);
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) += *(void *)(*(void *)(*(void *)(a1 + 48) + 72)
                                                                             + 8 * a2);
  }
  return result;
}

uint64_t __53__PULayoutSampledSectioning__cacheSectioningIfNeeded__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 64) + 8 * a2) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(*(void *)(*(void *)(result + 32) + 88) + 8 * a2) = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (void)invalidateSections
{
  [(PULayoutSampledSectioning *)self _discardSectioningCache];
  self->_sectioningIsValid = 0;
  v3.receiver = self;
  v3.super_class = (Class)PULayoutSampledSectioning;
  [(PULayoutSectioning *)&v3 invalidateSections];
}

- (BOOL)hasSomeSampling
{
  if (!self->_supportsSamplingAndSectionGrouping) {
    return 0;
  }
  [(PULayoutSampledSectioning *)self _cacheSectioningIfNeeded];
  return self->_hasSomeSampling;
}

- (void)invalidateSampling
{
  [(PULayoutSampledSectioning *)self _discardSamplingCache];
  self->_samplingIsValid = 0;
  v3.receiver = self;
  v3.super_class = (Class)PULayoutSampledSectioning;
  [(PULayoutSectioning *)&v3 invalidateSampling];
}

- (void)dealloc
{
  [(PULayoutSampledSectioning *)self _discardSamplingCache];
  [(PULayoutSampledSectioning *)self _discardSectioningCache];
  v3.receiver = self;
  v3.super_class = (Class)PULayoutSampledSectioning;
  [(PULayoutSectioning *)&v3 dealloc];
}

- (void)_discardSectioningCache
{
  numberOfItemsForRealSection = self->_numberOfItemsForRealSection;
  if (numberOfItemsForRealSection)
  {
    free(numberOfItemsForRealSection);
    self->_numberOfItemsForRealSection = 0;
  }
  startIndexInVisualSectionForRealSection = self->_startIndexInVisualSectionForRealSection;
  if (startIndexInVisualSectionForRealSection)
  {
    free(startIndexInVisualSectionForRealSection);
    self->_startIndexInVisualSectionForRealSection = 0;
  }
  visualSectionForRealSection = self->_visualSectionForRealSection;
  if (visualSectionForRealSection)
  {
    free(visualSectionForRealSection);
    self->_visualSectionForRealSection = 0;
  }
  numberOfRealItemsForVisualSection = self->_numberOfRealItemsForVisualSection;
  if (numberOfRealItemsForVisualSection)
  {
    free(numberOfRealItemsForVisualSection);
    self->_numberOfRealItemsForVisualSection = 0;
  }
  realSectionIndexesForVisualSection = self->_realSectionIndexesForVisualSection;
  self->_realSectionIndexesForVisualSection = 0;
}

- (void)_discardSamplingCache
{
  maximumNumberOfVisibleItemsForVisualSection = self->_maximumNumberOfVisibleItemsForVisualSection;
  if (maximumNumberOfVisibleItemsForVisualSection)
  {
    free(maximumNumberOfVisibleItemsForVisualSection);
    self->_maximumNumberOfVisibleItemsForVisualSection = 0;
  }
  sectionSamplers = self->_sectionSamplers;
  if (sectionSamplers)
  {
    if (self->_numberOfVisualSections >= 1)
    {
      int64_t v5 = 0;
      do
      {
        uint64_t v6 = self->_sectionSamplers;
        id v7 = v6[v5];
        v6[v5] = 0;

        ++v5;
      }
      while (v5 < self->_numberOfVisualSections);
      sectionSamplers = self->_sectionSamplers;
    }
    free(sectionSamplers);
    self->_sectionSamplers = 0;
  }
}

- (void)setSupportsSamplingAndSectionGrouping:(BOOL)a3
{
  if (self->_supportsSamplingAndSectionGrouping != a3)
  {
    self->_supportsSamplingAndSectionGrouping = a3;
    if (!a3) {
      self->_hasSomeSampling = 0;
    }
    [(PULayoutSampledSectioning *)self invalidateSections];
  }
}

- (PULayoutSampledSectioning)init
{
  v3.receiver = self;
  v3.super_class = (Class)PULayoutSampledSectioning;
  uint64_t result = [(PULayoutSampledSectioning *)&v3 init];
  if (result) {
    result->_supportsSamplingAndSectionGrouping = 1;
  }
  return result;
}

@end