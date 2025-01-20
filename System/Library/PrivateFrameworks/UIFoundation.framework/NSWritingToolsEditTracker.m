@interface NSWritingToolsEditTracker
- (NSWritingToolsEditTracker)init;
- (NSWritingToolsEditTracker)initWithContextRange:(_NSRange)a3;
- (_NSRange)_indirect_adjustRange:(_NSRange)a3 forUUID:(id)a4;
- (_NSRange)adjustRange:(_NSRange)a3;
- (_NSRange)currentContextRange;
- (_NSRange)rangeOfSuggestionWithRange:(_NSRange)a3 UUID:(id)a4 applyDelta:(BOOL)a5;
- (id)_removeRange:(id *)result;
- (uint64_t)_addRange:(NSUInteger)a3 delta:(uint64_t)a4 uuid:(uint64_t)a5;
- (uint64_t)_adjustRange:(uint64_t)a3 forUUID:(uint64_t)a4;
- (unint64_t)_adjustLocation:(unint64_t)a3;
- (void)_indirect_addRange:(_NSRange)a3 delta:(int64_t)a4 uuid:(id)a5;
- (void)_indirect_removeRange:(id)a3;
- (void)addEditForRange:(_NSRange)a3 lengthDelta:(int64_t)a4;
- (void)addEditForSuggestionWithRange:(_NSRange)a3 lengthDelta:(int64_t)a4 UUID:(id)a5;
- (void)dealloc;
- (void)removeEditForSuggestionWithUUID:(id)a3;
@end

@implementation NSWritingToolsEditTracker

- (NSWritingToolsEditTracker)initWithContextRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v8.receiver = self;
  v8.super_class = (Class)NSWritingToolsEditTracker;
  v5 = [(NSWritingToolsEditTracker *)&v8 init];
  v6 = v5;
  if (v5)
  {
    v5->_currentContextRange.NSUInteger location = location;
    v5->_currentContextRange.NSUInteger length = length;
    v5->_contextRange.NSUInteger location = location;
    v5->_contextRange.NSUInteger length = length;
    v5->_capacity = 64;
    v5->_edits = (NSWritingToolsEdit *)malloc_type_calloc(0x20uLL, 0x40uLL, 0xA6A27410uLL);
    v6->_count = 0;
    v6->_uuidToIndex = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v6;
}

- (NSWritingToolsEditTracker)init
{
  return -[NSWritingToolsEditTracker initWithContextRange:](self, "initWithContextRange:", 0, -1);
}

- (void)dealloc
{
  edits = self->_edits;
  if (edits)
  {
    free(edits);
    self->_edits = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)NSWritingToolsEditTracker;
  [(NSWritingToolsEditTracker *)&v4 dealloc];
}

- (uint64_t)_addRange:(NSUInteger)a3 delta:(uint64_t)a4 uuid:(uint64_t)a5
{
  if (result)
  {
    uint64_t v6 = a4;
    uint64_t v9 = result;
    if (a4 <= 0 && a2 + a3 < -a4) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__addRange_delta_uuid_, result, @"NSWritingToolsEditTracker.m", 82, @"delta exceeds range length");
    }
    result = [*(id *)(v9 + 16) objectForKeyedSubscript:a5];
    if (!result)
    {
      v10.NSUInteger location = *(void *)(v9 + 40);
      if (a3)
      {
        v10.NSUInteger length = *(void *)(v9 + 48);
        v26.NSUInteger location = a2;
        v26.NSUInteger length = a3;
        NSUInteger length = NSIntersectionRange(v26, v10).length;
        v29.NSUInteger length = *(void *)(v9 + 40);
        v27.NSUInteger location = a2;
        v27.NSUInteger length = a3;
        v29.NSUInteger location = 0;
        NSUInteger v12 = NSIntersectionRange(v27, v29).length;
        v30.NSUInteger location = *(void *)(v9 + 48) + *(void *)(v9 + 40);
        v30.NSUInteger length = ~v30.location;
        v28.NSUInteger location = a2;
        v28.NSUInteger length = a3;
        NSRange v13 = NSIntersectionRange(v28, v30);
        result = v13.location;
        if (v13.length && length)
        {
          if (v13.length >= -v6) {
            NSUInteger v14 = 0;
          }
          else {
            NSUInteger v14 = v13.length;
          }
          uint64_t v15 = v14 + v6;
          if (v6 < 0) {
            uint64_t v6 = v15;
          }
          else {
            uint64_t v6 = 0;
          }
        }
        if (v12 && length)
        {
          uint64_t v16 = 0;
          if ((v6 & 0x8000000000000000) == 0)
          {
            uint64_t v17 = v6;
            goto LABEL_46;
          }
          uint64_t v17 = v6;
          if (length < -v6)
          {
            uint64_t v16 = v6 + length;
            uint64_t v17 = -(uint64_t)length;
LABEL_46:
            v10.NSUInteger location = *(void *)(v9 + 40);
            uint64_t v18 = *(void *)(v9 + 48);
LABEL_47:
            *(void *)(v9 + 40) = v10.location + v16;
            *(void *)(v9 + 48) = v18 + v17;
            uint64_t v22 = *(void *)(v9 + 56);
            if (v22 == *(void *)(v9 + 64))
            {
              uint64_t v23 = v22 + 64;
              *(void *)(v9 + 64) = v23;
              result = (uint64_t)malloc_type_realloc(*(void **)(v9 + 8), 32 * v23, 0x108004019856BD9uLL);
              *(void *)(v9 + 8) = result;
              uint64_t v22 = *(void *)(v9 + 56);
            }
            else
            {
              result = *(void *)(v9 + 8);
            }
            v24 = (NSUInteger *)(result + 32 * v22);
            NSUInteger *v24 = a2;
            v24[1] = a3;
            *(void *)(result + 32 * *(void *)(v9 + 56) + 16) = v6;
            uint64_t v25 = *(void *)(v9 + 56);
            *(void *)(result + 32 * v25 + 24) = a5;
            if (a5)
            {
              result = objc_msgSend(*(id *)(v9 + 16), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:"), a5);
              uint64_t v25 = *(void *)(v9 + 56);
            }
            *(void *)(v9 + 56) = v25 + 1;
            return result;
          }
        }
        else
        {
          if (v12) {
            uint64_t v16 = v6;
          }
          else {
            uint64_t v16 = 0;
          }
          if (v12) {
            uint64_t v17 = 0;
          }
          else {
            uint64_t v17 = v6;
          }
        }
        if (!length && !v17 && !v12 && !v16) {
          return result;
        }
        goto LABEL_46;
      }
      uint64_t v18 = *(void *)(v9 + 48);
      if (v18) {
        BOOL v19 = 0;
      }
      else {
        BOOL v19 = a2 == v10.location;
      }
      BOOL v20 = a2 > v10.location;
      if (a2 > v10.location || v19) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = v6;
      }
      if (a2 >= v18 + v10.location) {
        BOOL v20 = 0;
      }
      if (v19 || v20) {
        uint64_t v17 = v6;
      }
      else {
        uint64_t v17 = 0;
      }
      if (v6) {
        goto LABEL_47;
      }
    }
  }
  return result;
}

- (id)_removeRange:(id *)result
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v3 = result;
    if (!a2) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__removeRange_, result, @"NSWritingToolsEditTracker.m", 172, @"Invalid parameter not satisfying: %@", @"uuid");
    }
    result = (id *)[v3[2] objectForKeyedSubscript:a2];
    if (result)
    {
      unint64_t v4 = [result unsignedIntValue];
      v5 = (char *)v3[7];
      if ((unint64_t)v5 <= v4)
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__removeRange_, v3, @"NSWritingToolsEditTracker.m", 179, @"index out of range");
        v5 = (char *)v3[7];
      }
      uint64_t v6 = v3[1];
      v7 = &v6[4 * v4];
      unint64_t v8 = *v7;
      unint64_t v9 = v7[2];
      if (&v5[~v4])
      {
        memmove(v7, v7 + 4, 32 * (void)&v5[~v4]);
        v5 = (char *)v3[7];
        uint64_t v6 = v3[1];
      }
      NSRange v10 = v5 - 1;
      v3[7] = v10;
      v11 = &v6[4 * (void)v10];
      void *v11 = 0;
      v11[1] = 0;
      v6[4 * (void)v3[7] + 2] = 0;
      v6[4 * (void)v3[7] + 3] = 0;
      [v3[2] removeObjectForKey:a2];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      NSUInteger v12 = (void *)[v3[2] allKeys];
      result = (id *)[v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (result)
      {
        NSRange v13 = result;
        uint64_t v14 = *(void *)v21;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v15);
            unsigned int v17 = objc_msgSend((id)objc_msgSend(v3[2], "objectForKeyedSubscript:", v16), "unsignedIntValue");
            if (v4 < v17) {
              objc_msgSend(v3[2], "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v17 - 1), v16);
            }
            uint64_t v15 = (id *)((char *)v15 + 1);
          }
          while (v13 != v15);
          result = (id *)[v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
          NSRange v13 = result;
        }
        while (result);
      }
      id v18 = v3[7];
      if ((unint64_t)v18 > v4)
      {
        BOOL v19 = (unint64_t *)((char *)v3[1] + 32 * v4);
        do
        {
          if (v8 < *v19)
          {
            *v19 -= v9;
            id v18 = v3[7];
          }
          ++v4;
          v19 += 4;
        }
        while (v4 < (unint64_t)v18);
      }
      v3[6] = (char *)v3[6] - v9;
    }
  }
  return result;
}

- (unint64_t)_adjustLocation:(unint64_t)a3
{
  unint64_t count = self->_count;
  if (count)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    edits = self->_edits;
    do
    {
      if (edits[v7].var0.length + edits[v7].var0.location <= a3)
      {
        uint64_t var1 = edits[v7].var1;
        if (var1 <= 0 && a3 < -var1)
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSWritingToolsEditTracker.m", 221, @"attempting to set range to a negative location.");
          edits = self->_edits;
          unint64_t count = self->_count;
        }
        a3 += edits[v7].var1;
      }
      ++v8;
      ++v7;
    }
    while (v8 < count);
  }
  return a3;
}

- (uint64_t)_adjustRange:(uint64_t)a3 forUUID:(uint64_t)a4
{
  if (!a1) {
    return 0;
  }
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel__adjustRange_forUUID_, a1, @"NSWritingToolsEditTracker.m", 239, @"Invalid parameter not satisfying: %@", @"uuid");
  }
  if (*(void *)(a1 + 56))
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    uint64_t v10 = *(void *)(a1 + 8);
    unint64_t v11 = a2;
    while (1)
    {
      int v12 = [*(id *)(v10 + v8 + 24) isEqual:a4];
      uint64_t v10 = *(void *)(a1 + 8);
      if (v12) {
        break;
      }
      unint64_t v14 = *(void *)(v10 + v8);
      unint64_t v15 = *(void *)(v10 + v8 + 8) + v14;
      if (v15 <= v11)
      {
        uint64_t v13 = *(void *)(v10 + v8 + 16);
        v11 += v13;
        goto LABEL_20;
      }
      if (v14 <= a2 && v15 > a2) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      if (a2 <= v14 && a2 + a3 > v14) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
LABEL_21:
      ++v9;
      v8 += 32;
      if (v9 >= *(void *)(a1 + 56)) {
        return v11;
      }
    }
    uint64_t v13 = *(void *)(v10 + v8 + 16);
LABEL_20:
    a2 += v13;
    goto LABEL_21;
  }
  return a2;
}

- (void)addEditForRange:(_NSRange)a3 lengthDelta:(int64_t)a4
{
}

- (_NSRange)adjustRange:(_NSRange)a3
{
  NSUInteger v5 = a3.location + a3.length;
  unint64_t v6 = -[NSWritingToolsEditTracker _adjustLocation:](self, "_adjustLocation:");
  unint64_t v7 = [(NSWritingToolsEditTracker *)self _adjustLocation:v5];
  NSUInteger v8 = v7 - v6;
  if (v7 < v6) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSWritingToolsEditTracker.m", 293, @"attempting to set range to a negative length.");
  }
  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (void)addEditForSuggestionWithRange:(_NSRange)a3 lengthDelta:(int64_t)a4 UUID:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (!a5) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSWritingToolsEditTracker.m", 305, @"Invalid parameter not satisfying: %@", @"uuid");
  }
  NSUInteger v11 = [(NSWritingToolsEditTracker *)(uint64_t)self _adjustRange:length forUUID:(uint64_t)a5];
  NSUInteger v13 = v12;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSWritingToolsEditTracker.m", 312, @"attempting to add a suggestion that has already been invalidated by previous edits.");
  }

  [(NSWritingToolsEditTracker *)(uint64_t)self _addRange:v13 delta:a4 uuid:(uint64_t)a5];
}

- (void)removeEditForSuggestionWithUUID:(id)a3
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSWritingToolsEditTracker.m", 320, @"Invalid parameter not satisfying: %@", @"uuid");
  }

  -[NSWritingToolsEditTracker _removeRange:]((id *)&self->super.isa, (uint64_t)a3);
}

- (_NSRange)rangeOfSuggestionWithRange:(_NSRange)a3 UUID:(id)a4 applyDelta:(BOOL)a5
{
  BOOL v5 = a5;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (!a4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"NSWritingToolsEditTracker.m", 340, @"Invalid parameter not satisfying: %@", @"uuid");
  }
  uint64_t v10 = [(NSWritingToolsEditTracker *)(uint64_t)self _adjustRange:length forUUID:(uint64_t)a4];
  NSUInteger v12 = v11;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    unint64_t v14 = (void *)[(NSMutableDictionary *)self->_uuidToIndex objectForKeyedSubscript:a4];
    if (v14)
    {
      edits = self->_edits;
      v12 += edits[[v14 unsignedIntValue]].var1;
    }
  }
  NSUInteger v16 = v10;
  NSUInteger v17 = v12;
  result.NSUInteger length = v17;
  result.NSUInteger location = v16;
  return result;
}

- (_NSRange)currentContextRange
{
  NSUInteger length = self->_currentContextRange.length;
  NSUInteger location = self->_currentContextRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)_indirect_addRange:(_NSRange)a3 delta:(int64_t)a4 uuid:(id)a5
{
}

- (void)_indirect_removeRange:(id)a3
{
}

- (_NSRange)_indirect_adjustRange:(_NSRange)a3 forUUID:(id)a4
{
  NSUInteger v4 = [(NSWritingToolsEditTracker *)(uint64_t)self _adjustRange:a3.length forUUID:(uint64_t)a4];
  result.NSUInteger length = v5;
  result.NSUInteger location = v4;
  return result;
}

@end