@interface PRZhuyinContext
- (PRZhuyinContext)init;
- (id)addedModifications;
- (id)currentModifications;
- (id)description;
- (id)removedModifications;
- (void)_addDeletions;
- (void)_addInsertions;
- (void)_addReplacements;
- (void)_addTranspositions;
- (void)_advanceIndexes;
- (void)_filterModifications;
- (void)_removeModificationsAndMoveStartingPoint;
- (void)addInputCharacter:(unsigned __int16)a3 geometryModel:(void *)a4 geometryData:(id)a5;
- (void)dealloc;
- (void)removeNumberOfInputCharacters:(unint64_t)a3;
- (void)reset;
@end

@implementation PRZhuyinContext

- (PRZhuyinContext)init
{
  v4.receiver = self;
  v4.super_class = (Class)PRZhuyinContext;
  v2 = [(PRZhuyinContext *)&v4 init];
  v2->_modifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v2->_addedModifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v2->_removedModifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v2->_addedRemovedModifications = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v2->_prefixes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  v2->_buffer = (char *)malloc_type_calloc(0x100uLL, 1uLL, 0x4C073188uLL);
  v2->_syllableLengthArray = (unint64_t *)malloc_type_calloc(0x100uLL, 8uLL, 0x100004000313F17uLL);
  [(PRZhuyinContext *)v2 reset];
  return v2;
}

- (void)dealloc
{
  free(self->_buffer);
  free(self->_syllableLengthArray);
  v3.receiver = self;
  v3.super_class = (Class)PRZhuyinContext;
  [(PRZhuyinContext *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@\nmodifications:  %@\nprefixes:  %@", objc_msgSend(NSString, "stringWithUTF8String:", self->_buffer), self->_modifications, self->_prefixes];
}

- (void)_removeModificationsAndMoveStartingPoint
{
  uint64_t v3 = [(NSMutableArray *)self->_modifications count];
  unint64_t startingPoint = self->_startingPoint;
  uint64_t v30 = 0;
  unint64_t length = self->_length;
  unint64_t v6 = 0x2676F2000uLL;
  if (length <= startingPoint)
  {
    BOOL v26 = 0;
  }
  else
  {
    BOOL v26 = 0;
    if (findZhuyin((unint64_t)&self->_buffer[startingPoint], length - startingPoint, 0, 1, 0, 0, 0, 0, &v30, 0, 0, 0))BOOL v26 = v30 + self->_startingPoint == self->_length; {
  }
    }
  if (v3)
  {
    unint64_t v7 = 0;
    uint64_t v8 = v3 - 1;
    while (1)
    {
      v9 = (void *)[(NSMutableArray *)self->_modifications objectAtIndex:v8];
      uint64_t v10 = [v9 syllableRange];
      unint64_t v12 = v10 + v11;
      if (self->_startingPoint >= v10 + v11) {
        goto LABEL_23;
      }
      unint64_t v13 = self->_length;
      if (v13 <= v12) {
        goto LABEL_23;
      }
      unint64_t v14 = v10;
      uint64_t v29 = 0;
      uint64_t v15 = *(int *)(v6 + 3044);
      v16 = next_zhuyin(*(unsigned __int8 **)((char *)&self->super.super.isa + v15) + v12, v13 - v12, 0, 1, &v29, 0);
      unint64_t v27 = 0;
      unint64_t v28 = 0;
      unint64_t v17 = v16 ? v29 - (void)v16 : 0;
      if (([v9 producesPartialSyllable] & 1) != 0 || v26 && self->_startingPoint <= v14) {
        break;
      }
      if (v17)
      {
        if (v17 == 1 && self->_length - v12 > 1) {
          break;
        }
      }
      else if (!is_partial_zhuyin(*(unsigned __int8 **)((char *)&self->super.super.isa + v15) + v12, self->_length - v12, 0))
      {
        break;
      }
      if ([v9 _shouldAppendLetter:(*(unsigned __int8 **)((char *)&self->super.super.isa + v15))[v12]])break; {
      if (v17 >= 2)
      }
      {
        if (findZhuyin(*(unint64_t *)((char *)&self->super.super.isa + v15) + v12, self->_length - v12, 0, 1, 0, 0, 0, 0, &v28, &v27, 0, self->_syllableLengthArray))
        {
          unint64_t v18 = v28;
          unint64_t v19 = self->_length;
          if (v28 + v12 < v19)
          {
            if (v27 > 1 || v19 - v12 >= 8 && v27 == 1)
            {
LABEL_31:
              unint64_t v6 = 0x2676F2000;
              if (v18 > v7 || v7 && v18 == v7 && v12 < startingPoint)
              {
                unint64_t startingPoint = v12;
                unint64_t v7 = v18;
              }
              goto LABEL_23;
            }
            unint64_t v20 = *self->_syllableLengthArray;
            if (v20 == 3)
            {
              v25 = *(char **)((char *)&self->super.super.isa + v15) + v12;
              if (!strncmp(v25, "dei", 3uLL)) {
                goto LABEL_31;
              }
              v22 = v25;
              v23 = "gei";
              size_t v24 = 3;
LABEL_44:
              if (!strncmp(v22, v23, v24)) {
                goto LABEL_31;
              }
              goto LABEL_22;
            }
            if (v20 == 2)
            {
              v21 = *(char **)((char *)&self->super.super.isa + v15) + v12;
              if (!strncmp(v21, "de", 2uLL) || !strncmp(v21, "ge", 2uLL)) {
                goto LABEL_31;
              }
              v22 = v21;
              v23 = "he";
              size_t v24 = 2;
              goto LABEL_44;
            }
          }
        }
      }
LABEL_22:
      unint64_t v6 = 0x2676F2000;
LABEL_23:
      if (--v8 == -1) {
        goto LABEL_46;
      }
    }
    [(NSMutableArray *)self->_removedModifications addObject:v9];
    [(NSMutableArray *)self->_modifications removeObjectAtIndex:v8];
    goto LABEL_22;
  }
LABEL_46:
  self->_unint64_t startingPoint = startingPoint;
}

- (void)_advanceIndexes
{
  v22 = 0;
  v23 = 0;
  uint64_t v20 = 0;
  v21 = 0;
  uint64_t v19 = 0;
  nextIndexes = self->_nextIndexes;
  unint64_t v4 = self->_nextIndexes[0];
  lastIndexes = self->_lastIndexes;
  unint64_t v6 = self->_lastIndexes[0];
  BOOL v18 = 0;
  findZhuyin((unint64_t)&self->_buffer[self->_startingPoint], self->_length - self->_startingPoint, 1, 1, &v23, &v22, &v21, &v20, &v19, 0, &v18, 0);
  unint64_t *lastIndexes = v20 + self->_startingPoint;
  lastIndexes[1] = (unint64_t)&v21[self->_startingPoint];
  lastIndexes[2] = (unint64_t)&v22[self->_startingPoint];
  lastIndexes[3] = (unint64_t)&v23[self->_startingPoint];
  unint64_t *nextIndexes = v19 + self->_startingPoint;
  nextIndexes[1] = self->_startingPoint;
  unint64_t v7 = lastIndexes[2];
  unint64_t v8 = lastIndexes[3];
  if (v7 == v8 && v4 < v8)
  {
    if (lastIndexes[1] == v7 && v6 < v4)
    {
      lastIndexes[2] = v4;
      unint64_t v4 = v6;
    }
    lastIndexes[3] = v4;
  }
  unint64_t v9 = *nextIndexes;
  self->_startIndex = *nextIndexes;
  unint64_t v10 = nextIndexes[1];
  if (v10 < v9 && v10 > self->_startingPoint) {
    unint64_t v9 = nextIndexes[1];
  }
  self->_startIndex = v9;
  if (v9 > *lastIndexes) {
    self->_startIndex = v9 - 1;
  }
  unint64_t v12 = *nextIndexes;
  unint64_t v13 = *nextIndexes + 7;
  self->_endIndex = v13;
  unint64_t length = self->_length;
  if (v13 < length)
  {
    buffer = self->_buffer;
    if (buffer[v13] == 39)
    {
      unint64_t v16 = v12 + 8;
      do
      {
        unint64_t v13 = v16;
        self->_endIndex = v16;
        unint64_t length = self->_length;
        if (v16 >= length) {
          break;
        }
        int v17 = buffer[v16++];
      }
      while (v17 == 39);
    }
  }
  if (v13 > length) {
    self->_endIndex = length;
  }
  self->_lastSyllableIsPartial = v18;
}

- (void)_addTranspositions
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  lastIndexes = self->_lastIndexes;
  if (self->_lastIndexes[1] >= self->_startIndex) {
    unint64_t startIndex = self->_startIndex;
  }
  else {
    unint64_t startIndex = self->_lastIndexes[1];
  }
  unint64_t v4 = startIndex + 1;
  unint64_t endIndex = self->_endIndex;
  if (startIndex + 1 < endIndex)
  {
    unint64_t v6 = self;
    v43 = self->_lastIndexes;
    while (1)
    {
      unint64_t v7 = startIndex;
      unint64_t startIndex = v4;
      buffer = v6->_buffer;
      uint64_t v9 = buffer[v7];
      if ((v9 - 49) >= 5)
      {
        uint64_t v11 = 0;
        while (adjacentMatchesForLetters[v11] != v9)
        {
          v11 += 7;
          if (v11 == 259)
          {
            unint64_t v12 = 0;
            goto LABEL_14;
          }
        }
        unint64_t v10 = &adjacentMatchesForLetters[v11];
      }
      else
      {
        unint64_t v10 = (int *)((char *)&adjacentMatchesForTones + 28 * (v9 - 49));
      }
      unint64_t v12 = v10 + 1;
LABEL_14:
      uint64_t v13 = buffer[startIndex];
      if ((v13 - 49) >= 5)
      {
        uint64_t v25 = 0;
        while (adjacentMatchesForLetters[v25] != v13)
        {
          v25 += 7;
          if (v25 == 259) {
            goto LABEL_80;
          }
        }
      }
      if (!v12) {
        goto LABEL_80;
      }
      uint64_t v58 = 0;
      uint64_t v59 = 0;
      unint64_t v57 = 0;
      char v56 = 0;
      v55[0] = externalZhuyinFromInternal(v13);
      v55[1] = externalZhuyinFromInternal(v9);
      v6->_buffer[v7] = v13;
      v6->_buffer[startIndex] = v9;
      unint64_t v50 = startIndex;
      if (v7 >= *lastIndexes)
      {
        if (findZhuyin((unint64_t)&v6->_buffer[*lastIndexes], v6->_endIndex - *lastIndexes, 0, 0, 0, 0, 0, &v59, &v58, &v57, &v56, v6->_syllableLengthArray))
        {
          unint64_t v14 = *lastIndexes;
          if (v58 + *lastIndexes == v6->_endIndex)
          {
            unint64_t v15 = v57;
            if (v57)
            {
              unint64_t v16 = 0;
              unint64_t v17 = 0;
              char v18 = 0;
              unint64_t v19 = 0;
              syllableLengthArray = v6->_syllableLengthArray;
              uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
              while (1)
              {
                unint64_t v22 = syllableLengthArray[v16];
                unint64_t v23 = v22 + v14;
                if (v7 >= v14)
                {
                  if (startIndex < v23)
                  {
                    if (v56 && v57 - 1 == v16) {
                      char v18 = 1;
                    }
                    unint64_t v17 = syllableLengthArray[v16];
                    uint64_t v24 = v14;
                    goto LABEL_33;
                  }
                  if (v7 < v23)
                  {
                    unint64_t v17 = syllableLengthArray[v16 + 1];
                    if (v56 && v57 - 2 == v16) {
                      char v18 = 1;
                    }
                    uint64_t v21 = v14;
                    unint64_t v19 = syllableLengthArray[v16];
                    uint64_t v24 = v22 + v14;
                    goto LABEL_33;
                  }
                }
                uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_33:
                if (v24 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  ++v16;
                  v14 += v22;
                  if (v16 < v57) {
                    continue;
                  }
                }
                goto LABEL_64;
              }
            }
            goto LABEL_63;
          }
        }
      }
      unint64_t v26 = lastIndexes[1];
      if (v7 >= v26)
      {
        if (findZhuyin((unint64_t)&v6->_buffer[v26], v6->_endIndex - v26, 0, 0, 0, 0, 0, &v59, &v58, &v57, &v56, v6->_syllableLengthArray))
        {
          unint64_t v27 = lastIndexes[1];
          if (v58 + v27 == v6->_length && (!v56 || v7 < v59 + v27)) {
            break;
          }
        }
      }
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      char v44 = 0;
      uint64_t v49 = 0;
      uint64_t v45 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_65:
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      modifications = v6->_modifications;
      uint64_t v33 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v52;
LABEL_67:
        uint64_t v36 = 0;
        while (1)
        {
          if (*(void *)v52 != v35) {
            objc_enumerationMutation(modifications);
          }
          v37 = *(void **)(*((void *)&v51 + 1) + 8 * v36);
          if ([v37 modificationType] == 2 && v7 == objc_msgSend(v37, "range") && v38 == 2) {
            break;
          }
          if (v34 == ++v36)
          {
            uint64_t v34 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v51 objects:v60 count:16];
            if (v34) {
              goto LABEL_67;
            }
            goto LABEL_77;
          }
        }
      }
      else
      {
LABEL_77:
        if (v49)
        {
          v40 = (void *)[[NSString alloc] initWithCharacters:v55 length:2];
          LOBYTE(v42) = v44;
          v41 = -[PRZhuyinModification initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:]([PRZhuyinModification alloc], "initWithRange:replacementString:modificationType:syllableRange:additionalSyllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", v7, 2, v40, 2, v24, v49, 0.0, v45, v46, v47, &self->_buffer[v24], v42);
          [(NSMutableArray *)self->_modifications addObject:v41];
          [(NSMutableArray *)self->_addedModifications addObject:v41];
        }
      }
      unint64_t v6 = self;
      self->_buffer[v7] = v9;
      unint64_t startIndex = v50;
      self->_buffer[v50] = v13;
      lastIndexes = v43;
      unint64_t endIndex = self->_endIndex;
LABEL_80:
      unint64_t v4 = startIndex + 1;
      if (startIndex + 1 >= endIndex) {
        return;
      }
    }
    unint64_t v15 = v57 - 1;
    if (!v57)
    {
LABEL_63:
      char v18 = 0;
      unint64_t v19 = 0;
      unint64_t v17 = 0;
      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_64:
      uint64_t v45 = v21;
      uint64_t v46 = v19;
      uint64_t v49 = v17;
      uint64_t v47 = v15;
      char v44 = v18 & 1;
      goto LABEL_65;
    }
    unint64_t v28 = 0;
    unint64_t v17 = 0;
    char v18 = 0;
    unint64_t v19 = 0;
    uint64_t v29 = v6->_syllableLengthArray;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      unint64_t v30 = v29[v28];
      unint64_t v31 = v30 + v27;
      if (v7 >= v27)
      {
        if (startIndex < v31)
        {
          if (v56 && v15 == v28) {
            char v18 = 1;
          }
          unint64_t v17 = v29[v28];
          uint64_t v24 = v27;
          goto LABEL_59;
        }
        if (v7 < v31)
        {
          unint64_t v17 = v29[v28 + 1];
          if (v56 && v57 - 2 == v28) {
            char v18 = 1;
          }
          uint64_t v21 = v27;
          unint64_t v19 = v29[v28];
          uint64_t v24 = v30 + v27;
          goto LABEL_59;
        }
      }
      uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_59:
      if (v24 == 0x7FFFFFFFFFFFFFFFLL)
      {
        ++v28;
        v27 += v30;
        if (v28 < v57) {
          continue;
        }
      }
      goto LABEL_64;
    }
  }
}

- (void)_addReplacements
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  unint64_t startIndex = self->_startIndex;
  unint64_t endIndex = self->_endIndex;
  while (startIndex < endIndex)
  {
    int v4 = self->_buffer[startIndex];
    if ((v4 - 49) < 5)
    {
      v5 = (int *)((char *)&adjacentMatchesForTones + 28 * (v4 - 49));
      goto LABEL_9;
    }
    for (uint64_t i = 0; i != 259; i += 7)
    {
      if (adjacentMatchesForLetters[i] == v4)
      {
        v5 = &adjacentMatchesForLetters[i];
LABEL_9:
        unint64_t v7 = v5 + 1;
        uint64_t v8 = 0;
        int v32 = self->_buffer[startIndex];
        unint64_t v31 = v5 + 1;
LABEL_10:
        uint64_t v9 = LOBYTE(v7[v8]);
        if (LOBYTE(v7[v8])) {
          BOOL v10 = v9 == v4;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10)
        {
          uint64_t v41 = 0;
          uint64_t v42 = 0;
          unint64_t v40 = 0;
          char v39 = 0;
          unsigned __int16 v38 = 0;
          unsigned __int16 v38 = externalZhuyinFromInternal(v9);
          self->_buffer[startIndex] = v9;
          if (findZhuyin((unint64_t)&self->_buffer[self->_lastIndexes[0]], self->_endIndex - self->_lastIndexes[0], 0, 0, 0, 0, 0, &v42, &v41, &v40, &v39, self->_syllableLengthArray))
          {
            unint64_t v11 = self->_lastIndexes[0];
            if (v41 + v11 == self->_endIndex)
            {
              if (v40)
              {
                char v12 = 0;
                unint64_t v13 = 0;
                unint64_t v14 = 0;
                syllableLengthArray = self->_syllableLengthArray;
                while (startIndex < v11)
                {
                  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
                  if (v39) {
                    goto LABEL_27;
                  }
LABEL_28:
                  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    v11 += syllableLengthArray[v14++];
                    if (v14 < v40) {
                      continue;
                    }
                  }
                  goto LABEL_32;
                }
                unint64_t v17 = syllableLengthArray[v14];
                if (startIndex >= v17 + v11) {
                  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v16 = v11;
                }
                if (startIndex < v17 + v11) {
                  unint64_t v13 = syllableLengthArray[v14];
                }
                if (!v39) {
                  goto LABEL_28;
                }
LABEL_27:
                v12 |= v40 - 1 == v14;
                goto LABEL_28;
              }
              unint64_t v13 = 0;
              char v12 = 0;
              uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_32:
              long long v36 = 0u;
              long long v37 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              modifications = self->_modifications;
              uint64_t v19 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v34 objects:v43 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v35;
LABEL_34:
                uint64_t v22 = 0;
                while (1)
                {
                  if (*(void *)v35 != v21) {
                    objc_enumerationMutation(modifications);
                  }
                  unint64_t v23 = *(void **)(*((void *)&v34 + 1) + 8 * v22);
                  if ([v23 modificationType] == 1
                    && startIndex == [v23 range]
                    && v24 == 1)
                  {
                    int v26 = objc_msgSend((id)objc_msgSend(v23, "replacementString"), "characterAtIndex:", 0);
                    if (v26 == v38) {
                      break;
                    }
                  }
                  if (v20 == ++v22)
                  {
                    uint64_t v20 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v34 objects:v43 count:16];
                    if (v20) {
                      goto LABEL_34;
                    }
                    goto LABEL_46;
                  }
                }
              }
              else
              {
LABEL_46:
                if (v13)
                {
                  unint64_t v27 = (void *)[[NSString alloc] initWithCharacters:&v38 length:1];
                  unint64_t v28 = [PRZhuyinModification alloc];
                  LOBYTE(v30) = v12 & 1;
                  uint64_t v29 = -[PRZhuyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:](v28, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", startIndex, 1, v27, 1, v16, v13, 0.0, v40, &self->_buffer[v16], v30);
                  [(NSMutableArray *)self->_modifications addObject:v29];
                  [(NSMutableArray *)self->_addedModifications addObject:v29];
                }
              }
            }
          }
          int v4 = v32;
          self->_buffer[startIndex] = v32;
          unint64_t v7 = v31;
        }
        if (++v8 == 6)
        {
          unint64_t endIndex = self->_endIndex;
          break;
        }
        goto LABEL_10;
      }
    }
    ++startIndex;
  }
}

- (void)_addInsertions
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  unint64_t startIndex = self->_startIndex;
  if (startIndex >= self->_endIndex) {
    return;
  }
  do
  {
    int v4 = self->_buffer[startIndex];
    if ((v4 - 49) <= 4)
    {
      unint64_t v5 = startIndex + 1;
      goto LABEL_55;
    }
    if (v4 == 154 || v4 == 158)
    {
      unint64_t v7 = &insertionFollowersForLetter_insertionFollowers1;
LABEL_11:
      unsigned __int16 v38 = v7;
      goto LABEL_12;
    }
    unsigned __int16 v38 = &insertionFollowersForLetter_insertionFollowers1;
    if (v4 != 231)
    {
      unint64_t v6 = memchr("bpmfdtnlgkhjqxzcs", v4, 0x12uLL);
      unint64_t v7 = &insertionFollowersForLetter_insertionFollowers1;
      if (!v6) {
        unint64_t v7 = &insertionFollowersForLetter_insertionFollowers2;
      }
      goto LABEL_11;
    }
LABEL_12:
    unint64_t length = self->_length;
    if (length + 1 > startIndex)
    {
      do
        self->_buffer[length + 1] = self->_buffer[length];
      while (length-- > startIndex);
    }
    uint64_t v10 = 0;
    unint64_t v36 = startIndex;
    unint64_t v5 = startIndex + 1;
    do
    {
      int v11 = v38[v10];
      if ((_BYTE)v11)
      {
        uint64_t v46 = 0;
        uint64_t v47 = 0;
        unint64_t v45 = 0;
        char v44 = 0;
        unsigned __int16 v43 = 0;
        unsigned __int16 v43 = externalZhuyinFromInternal(v11);
        self->_buffer[v5] = v11;
        if (findZhuyin((unint64_t)&self->_buffer[self->_lastIndexes[0]], self->_endIndex - self->_lastIndexes[0] + 1, 0, 0, 0, 0, 0, &v47, &v46, &v45, &v44, self->_syllableLengthArray))
        {
          unint64_t v12 = self->_lastIndexes[0];
          if (v46 + v12 == self->_endIndex + 1 && (!v44 || v5 < v47 + v12))
          {
            if (v45)
            {
              char v13 = 0;
              unint64_t v14 = 0;
              unint64_t v15 = 0;
              syllableLengthArray = self->_syllableLengthArray;
              while (v5 < v12)
              {
                uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
                if (v44) {
                  goto LABEL_31;
                }
LABEL_32:
                if (v17 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v12 += syllableLengthArray[v15++];
                  if (v15 < v45) {
                    continue;
                  }
                }
                goto LABEL_36;
              }
              unint64_t v18 = syllableLengthArray[v15];
              unint64_t v19 = v18 + v12;
              unint64_t v20 = v18 - 1;
              if (v5 >= v19) {
                uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v17 = v12;
              }
              if (v5 < v19) {
                unint64_t v14 = v20;
              }
              if (!v44) {
                goto LABEL_32;
              }
LABEL_31:
              v13 |= v45 - 1 == v15;
              goto LABEL_32;
            }
            unint64_t v14 = 0;
            char v13 = 0;
            uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_36:
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            uint64_t v37 = v14;
            modifications = self->_modifications;
            uint64_t v22 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v39 objects:v48 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v40;
LABEL_38:
              uint64_t v25 = 0;
              while (1)
              {
                if (*(void *)v40 != v24) {
                  objc_enumerationMutation(modifications);
                }
                int v26 = *(void **)(*((void *)&v39 + 1) + 8 * v25);
                if ([v26 modificationType] == 3 && v5 == objc_msgSend(v26, "range") && v27 == 0)
                {
                  int v29 = objc_msgSend((id)objc_msgSend(v26, "replacementString"), "characterAtIndex:", 0);
                  if (v29 == v43) {
                    break;
                  }
                }
                if (v23 == ++v25)
                {
                  uint64_t v23 = [(NSMutableArray *)modifications countByEnumeratingWithState:&v39 objects:v48 count:16];
                  if (v23) {
                    goto LABEL_38;
                  }
                  goto LABEL_50;
                }
              }
            }
            else
            {
LABEL_50:
              if (v37)
              {
                uint64_t v30 = (void *)[[NSString alloc] initWithCharacters:&v43 length:1];
                unint64_t v31 = [PRZhuyinModification alloc];
                LOBYTE(v35) = v13 & 1;
                int v32 = -[PRZhuyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:](v31, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", v5, 0, v30, 3, v17, v37, 0.0, v45, &self->_buffer[v17], v35);
                [(NSMutableArray *)self->_modifications addObject:v32];
                [(NSMutableArray *)self->_addedModifications addObject:v32];
              }
            }
          }
        }
      }
      ++v10;
    }
    while (v10 != 5);
    unint64_t v33 = v36;
    if (v36 < self->_length)
    {
      do
      {
        self->_buffer[v33 + 1] = self->_buffer[v33 + 2];
        unint64_t v34 = v33 + 2;
        ++v33;
      }
      while (v34 <= self->_length);
    }
LABEL_55:
    unint64_t startIndex = v5;
  }
  while (v5 < self->_endIndex);
}

- (void)_addDeletions
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  unint64_t startIndex = self->_startIndex;
  unint64_t v3 = startIndex + 2;
  unint64_t endIndex = self->_endIndex;
  if (startIndex + 2 < endIndex)
  {
    unint64_t v6 = startIndex + 1;
    do
    {
      unint64_t v7 = v6;
      unint64_t v6 = v3;
      buffer = self->_buffer;
      int v9 = buffer[v7];
      int v10 = buffer[v7 - 1];
      int v11 = buffer[v6];
      unsigned int v12 = v9 - 49;
      if ((v9 - 49) >= 5)
      {
        uint64_t v14 = 0;
        while (adjacentMatchesForLetters[v14] != v9)
        {
          v14 += 7;
          if (v14 == 259) {
            goto LABEL_77;
          }
        }
        if (v9 == v10)
        {
LABEL_11:
          unint64_t v49 = v6;
          int v50 = 1;
          goto LABEL_22;
        }
        for (uint64_t i = 0; i != 259; i += 7)
        {
          if (adjacentMatchesForLetters[i] == v9)
          {
            char v13 = &adjacentMatchesForLetters[i];
            goto LABEL_17;
          }
        }
LABEL_20:
        if (v9 != v11)
        {
          if (v12 >= 5)
          {
            uint64_t v28 = 0;
            while (adjacentMatchesForLetters[v28] != v9)
            {
              v28 += 7;
              if (v28 == 259) {
                goto LABEL_77;
              }
            }
            uint64_t v27 = &adjacentMatchesForLetters[v28];
          }
          else
          {
            uint64_t v27 = (int *)((char *)&adjacentMatchesForTones + 28 * v12);
          }
          long long v42 = v27 + 1;
          uint64_t v43 = 0;
          while (v42[v43] != v11)
          {
            if (++v43 == 6) {
              goto LABEL_77;
            }
          }
        }
      }
      else
      {
        if (v9 == v10) {
          goto LABEL_11;
        }
        char v13 = (int *)((char *)&adjacentMatchesForTones + 28 * v12);
LABEL_17:
        uint64_t v16 = v13 + 1;
        uint64_t v17 = 0;
        while (v16[v17] != v10)
        {
          if (++v17 == 6) {
            goto LABEL_20;
          }
        }
      }
      unint64_t v49 = v6;
      int v50 = 0;
LABEL_22:
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      unint64_t v56 = 0;
      char v55 = 0;
      if (v7 < self->_length)
      {
        unint64_t v18 = startIndex;
        do
        {
          self->_buffer[v18 + 1] = self->_buffer[v18 + 2];
          unint64_t v19 = v18 + 2;
          ++v18;
        }
        while (v19 < self->_length);
        buffer = self->_buffer;
        unint64_t endIndex = self->_endIndex;
      }
      unint64_t v48 = startIndex;
      if (findZhuyin((unint64_t)&buffer[self->_lastIndexes[0]], endIndex + ~self->_lastIndexes[0], 0, 0, 0, 0, 0, &v58, &v57, &v56, &v55, self->_syllableLengthArray))
      {
        unint64_t v20 = self->_lastIndexes[0];
        if (v57 + v20 == self->_endIndex - 1 && (!v55 || v49 <= v58 + v20))
        {
          if (v56)
          {
            char v21 = 0;
            unint64_t v22 = 0;
            unint64_t v23 = 0;
            syllableLengthArray = self->_syllableLengthArray;
            while (v7 < v20)
            {
              uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
              if (v55) {
                goto LABEL_41;
              }
LABEL_42:
              if (v25 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v20 += syllableLengthArray[v23++];
                if (v23 < v56) {
                  continue;
                }
              }
              goto LABEL_52;
            }
            unint64_t v26 = syllableLengthArray[v23];
            if (v7 >= v26 + v20) {
              uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v25 = v20;
            }
            if (v7 < v26 + v20) {
              unint64_t v22 = v26 + 1;
            }
            if (!v55) {
              goto LABEL_42;
            }
LABEL_41:
            v21 |= v56 - 1 == v23;
            goto LABEL_42;
          }
          unint64_t v22 = 0;
          char v21 = 0;
          uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_52:
          char v45 = v21;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          unint64_t v46 = v22;
          obunint64_t j = self->_modifications;
          uint64_t v29 = [(NSMutableArray *)obj countByEnumeratingWithState:&v51 objects:v59 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v52;
LABEL_54:
            uint64_t v32 = 0;
            while (1)
            {
              if (*(void *)v52 != v31) {
                objc_enumerationMutation(obj);
              }
              unint64_t v33 = *(void **)(*((void *)&v51 + 1) + 8 * v32);
              if ([v33 modificationType] == 4)
              {
                uint64_t v34 = [v33 range];
                if (v7 == v34 && v35 == 1) {
                  break;
                }
                int v37 = v35 == 1 ? v50 : 0;
                if (v37 == 1 && v34 + 1 == v7) {
                  break;
                }
              }
              if (v30 == ++v32)
              {
                uint64_t v30 = [(NSMutableArray *)obj countByEnumeratingWithState:&v51 objects:v59 count:16];
                if (v30) {
                  goto LABEL_54;
                }
                goto LABEL_71;
              }
            }
          }
          else
          {
LABEL_71:
            if (v46 >= 2)
            {
              long long v39 = [PRZhuyinModification alloc];
              LOBYTE(v44) = v45 & 1;
              long long v40 = -[PRZhuyinModification initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:](v39, "initWithRange:replacementString:modificationType:syllableRange:modificationScore:syllableCountScore:syllableLetters:producesPartialSyllable:", v7, 1, &stru_26C1C71A8, 4, v25, v46, 0.0, v56, &self->_buffer[v25], v44);
              [(NSMutableArray *)self->_modifications addObject:v40];
              [(NSMutableArray *)self->_addedModifications addObject:v40];
            }
          }
        }
      }
      for (unint64_t j = self->_length; --j > v7; self->_buffer[j] = self->_buffer[j - 1])
        ;
      self->_buffer[v7] = v9;
      unint64_t startIndex = v48;
      unint64_t endIndex = self->_endIndex;
      unint64_t v6 = v49;
LABEL_77:
      unint64_t v3 = v6 + 1;
      ++startIndex;
    }
    while (v6 + 1 < endIndex);
  }
}

- (void)_filterModifications
{
  v2 = self;
  uint64_t v71 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(NSMutableArray *)self->_addedModifications count];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  addedModifications = v2->_addedModifications;
  uint64_t v5 = [(NSMutableArray *)addedModifications countByEnumeratingWithState:&v63 objects:v70 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = v2;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v64 != v9) {
          objc_enumerationMutation(addedModifications);
        }
        unint64_t v11 = [*(id *)(*((void *)&v63 + 1) + 8 * i) syllableCountScore];
        if (v8 - 1 >= v11) {
          unint64_t v8 = v11;
        }
      }
      uint64_t v6 = [(NSMutableArray *)addedModifications countByEnumeratingWithState:&v63 objects:v70 count:16];
    }
    while (v6);
    if (v8) {
      BOOL v12 = v3 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    v2 = v7;
    if (!v12)
    {
      uint64_t v13 = v3 - 1;
      do
      {
        uint64_t v14 = (void *)[(NSMutableArray *)v7->_addedModifications objectAtIndex:v13];
        if ([v14 syllableCountScore] > v8)
        {
          [(NSMutableArray *)v7->_modifications removeObjectIdenticalTo:v14];
          [(NSMutableArray *)v7->_addedModifications removeObjectAtIndex:v13];
        }
        --v13;
      }
      while (v13 != -1);
    }
  }
  uint64_t v15 = [(NSMutableArray *)v2->_modifications count];
  if (v15)
  {
    uint64_t v16 = v15;
    unint64_t v48 = v2;
    do
    {
      while (1)
      {
        uint64_t v49 = v16 - 1;
        uint64_t v17 = (void *)[(NSMutableArray *)v2->_modifications objectAtIndex:v16 - 1];
        [v17 modificationType];
        [v17 range];
        unint64_t v18 = [v17 combinedSyllableRange];
        uint64_t v20 = v19;
        unint64_t v21 = [v17 syllableCountScore];
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        obuint64_t j = v2->_modifications;
        uint64_t v22 = [(NSMutableArray *)obj countByEnumeratingWithState:&v59 objects:v69 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v60;
          unint64_t v25 = v18 + v20;
          while (2)
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v60 != v24) {
                objc_enumerationMutation(obj);
              }
              uint64_t v27 = *(void **)(*((void *)&v59 + 1) + 8 * j);
              if (v27 != v17)
              {
                [*(id *)(*((void *)&v59 + 1) + 8 * j) modificationType];
                uint64_t v28 = v17;
                unint64_t v29 = [v27 combinedSyllableRange];
                uint64_t v31 = v30;
                BOOL v32 = [v27 syllableCountScore] >= v21 || v18 >= v29 + v31;
                BOOL v33 = !v32 && v25 > v29;
                uint64_t v17 = v28;
                if (v33)
                {
                  v2 = v48;
                  uint64_t v44 = [(NSMutableArray *)v48->_addedModifications indexOfObjectIdenticalTo:v28];
                  if (v44 == 0x7FFFFFFFFFFFFFFFLL) {
                    [(NSMutableArray *)v48->_removedModifications addObject:v28];
                  }
                  else {
                    [(NSMutableArray *)v48->_addedModifications removeObjectAtIndex:v44];
                  }
                  uint64_t v16 = v49;
                  goto LABEL_63;
                }
              }
            }
            uint64_t v23 = [(NSMutableArray *)obj countByEnumeratingWithState:&v59 objects:v69 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        v2 = v48;
        removedModifications = v48->_removedModifications;
        uint64_t v35 = [(NSMutableArray *)removedModifications countByEnumeratingWithState:&v55 objects:v68 count:16];
        uint64_t v16 = v49;
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v56;
          while (2)
          {
            for (uint64_t k = 0; k != v36; ++k)
            {
              if (*(void *)v56 != v37) {
                objc_enumerationMutation(removedModifications);
              }
              if ([*(id *)(*((void *)&v55 + 1) + 8 * k) isEqual:v17])
              {
                uint64_t v45 = [(NSMutableArray *)v48->_addedModifications indexOfObjectIdenticalTo:v17];
                if (v45 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  [(NSMutableArray *)v48->_addedModifications removeObjectAtIndex:v45];
                  addedRemovedModifications = v48->_addedRemovedModifications;
LABEL_61:
                  [(NSMutableArray *)addedRemovedModifications addObject:v17];
                }
                goto LABEL_63;
              }
            }
            uint64_t v36 = [(NSMutableArray *)removedModifications countByEnumeratingWithState:&v55 objects:v68 count:16];
            if (v36) {
              continue;
            }
            break;
          }
        }
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v39 = v48->_addedRemovedModifications;
        uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v51 objects:v67 count:16];
        if (v40) {
          break;
        }
LABEL_51:
        if (!v49) {
          return;
        }
      }
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v52;
LABEL_45:
      uint64_t v43 = 0;
      while (1)
      {
        if (*(void *)v52 != v42) {
          objc_enumerationMutation(v39);
        }
        if ([*(id *)(*((void *)&v51 + 1) + 8 * v43) isEqual:v17]) {
          break;
        }
        if (v41 == ++v43)
        {
          uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v51 objects:v67 count:16];
          if (v41) {
            goto LABEL_45;
          }
          goto LABEL_51;
        }
      }
      uint64_t v47 = [(NSMutableArray *)v48->_addedModifications indexOfObjectIdenticalTo:v17];
      if (v47 == 0x7FFFFFFFFFFFFFFFLL)
      {
        addedRemovedModifications = v48->_removedModifications;
        goto LABEL_61;
      }
      [(NSMutableArray *)v48->_addedModifications removeObjectAtIndex:v47];
LABEL_63:
      [(NSMutableArray *)v2->_modifications removeObjectAtIndex:v16];
    }
    while (v16);
  }
}

- (void)addInputCharacter:(unsigned __int16)a3 geometryModel:(void *)a4 geometryData:(id)a5
{
  unsigned int v5 = a3;
  [(NSMutableArray *)self->_addedModifications removeAllObjects];
  [(NSMutableArray *)self->_removedModifications removeAllObjects];
  if (self->_length <= 0xFE)
  {
    char v7 = internalFromExternalZhuyin(v5);
    buffer = self->_buffer;
    unint64_t length = self->_length;
    self->_unint64_t length = length + 1;
    buffer[length] = v7;
    if (v5 != 39) {
      self->_lengthBeforeApostrophes = self->_length;
    }
    [(PRZhuyinContext *)self _removeModificationsAndMoveStartingPoint];
    [(PRZhuyinContext *)self _advanceIndexes];
    unint64_t v10 = self->_length;
    if (self->_nextIndexes[0] < v10)
    {
      if (v10 - self->_startingPoint >= 2)
      {
        [(PRZhuyinContext *)self _addTranspositions];
        if (self->_length - self->_startingPoint >= 2)
        {
          [(PRZhuyinContext *)self _addReplacements];
          if (self->_length - self->_startingPoint >= 4) {
            [(PRZhuyinContext *)self _addDeletions];
          }
        }
      }
      [(PRZhuyinContext *)self _filterModifications];
    }
  }
}

- (void)removeNumberOfInputCharacters:(unint64_t)a3
{
  unint64_t length = self->_length;
  if (length >= a3) {
    unint64_t v4 = length - a3;
  }
  else {
    unint64_t v4 = 0;
  }
  if (a3 && length)
  {
    char v7 = (unsigned __int8 *)malloc_type_calloc(0x100uLL, 1uLL, 0xB13B2EFuLL);
    unint64_t v8 = v7;
    if (length <= a3)
    {
      [(PRZhuyinContext *)self reset];
    }
    else
    {
      unint64_t v9 = 0;
      do
      {
        v7[v9] = self->_buffer[v9];
        ++v9;
      }
      while (v9 < v4);
      [(PRZhuyinContext *)self reset];
      unint64_t v10 = 0;
      do
        [(PRZhuyinContext *)self addInputCharacter:v8[v10++] geometryModel:0 geometryData:0];
      while (v10 < v4);
    }
    free(v8);
  }
}

- (void)reset
{
  buffer = self->_buffer;
  *(_OWORD *)buffer = 0u;
  *((_OWORD *)buffer + 1) = 0u;
  *((_OWORD *)buffer + 2) = 0u;
  *((_OWORD *)buffer + 3) = 0u;
  *((_OWORD *)buffer + 4) = 0u;
  *((_OWORD *)buffer + 5) = 0u;
  *((_OWORD *)buffer + 6) = 0u;
  *((_OWORD *)buffer + 7) = 0u;
  *((_OWORD *)buffer + 8) = 0u;
  *((_OWORD *)buffer + 9) = 0u;
  *((_OWORD *)buffer + 10) = 0u;
  *((_OWORD *)buffer + 11) = 0u;
  *((_OWORD *)buffer + 12) = 0u;
  *((_OWORD *)buffer + 13) = 0u;
  *((_OWORD *)buffer + 14) = 0u;
  *((_OWORD *)buffer + 15) = 0u;
  [(NSMutableArray *)self->_addedModifications removeAllObjects];
  [(NSMutableArray *)self->_removedModifications removeAllObjects];
  [(NSMutableArray *)self->_removedModifications addObjectsFromArray:self->_modifications];
  [(NSMutableArray *)self->_modifications removeAllObjects];
  [(NSMutableArray *)self->_prefixes removeAllObjects];
  self->_unint64_t endIndex = 0;
  self->_unint64_t startIndex = 0;
  self->_nextIndexes[0] = 0;
  self->_nextIndexes[1] = 0;
  *(_OWORD *)self->_lastIndexes = 0u;
  *(_OWORD *)&self->_lastIndexes[2] = 0u;
  self->_unint64_t startingPoint = 0;
  self->_lengthBeforeApostrophes = 0;
  self->_unint64_t length = 0;
  self->_lastSyllableIsPartial = 0;
}

- (id)currentModifications
{
  return modificationArrayFilteredByMaskAndLength(self->_modifications, self->super._modificationMask, 0);
}

- (id)addedModifications
{
  return modificationArrayFilteredByMaskAndLength(self->_addedModifications, self->super._modificationMask, self->_length);
}

- (id)removedModifications
{
  return modificationArrayFilteredByMaskAndLength(self->_removedModifications, self->super._modificationMask, self->_length);
}

@end