@interface _PASProxyConcatenatedString
- (__CFString)_substringWithRange:(unint64_t)a3;
- (id)_createSubstringWithRange:(_NSRange)a3;
- (id)substringWithRange:(_NSRange)a3;
- (uint64_t)_locationOfStringIndex:(uint64_t)a1;
- (uint64_t)_validateRange:(uint64_t)a3;
- (unint64_t)length;
- (unsigned)characterAtIndex:(unint64_t)a3;
- (void)_initWithComponents:(void *)a1;
- (void)dealloc;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
@end

@implementation _PASProxyConcatenatedString

- (void).cxx_destruct
{
}

- (id)substringWithRange:(_NSRange)a3
{
  return [(_PASProxyConcatenatedString *)(uint64_t)self _substringWithRange:a3.length];
}

- (__CFString)_substringWithRange:(unint64_t)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v6 = a3;
    [(_PASProxyConcatenatedString *)a1 _validateRange:a3];
    if (!a3)
    {
      v7 = &stru_1EF678A50;
      goto LABEL_33;
    }
    if (!a2 && a3 == *(void *)(a1 + 24))
    {
      v7 = (__CFString *)(id)a1;
      goto LABEL_33;
    }
    unint64_t v8 = -[_PASProxyConcatenatedString _locationOfStringIndex:](a1, a2);
    uint64_t v10 = v9;
    id v11 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v8];
    uint64_t v12 = [v11 length];
    size_t v13 = v12 - v10;
    unint64_t v14 = a3 - (v12 - v10);
    if (a3 <= v12 - v10)
    {
      if (v10 || a3 != v12)
      {
        v27 = (void *)MEMORY[0x1A62450A0]();
        objc_msgSend(v11, "substringWithRange:", v10, v6);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = (__CFString *)v11;
      }
    }
    else
    {
      id v44 = v11;
      uint64_t v15 = [*(id *)(a1 + 8) count];
      unint64_t v16 = v15;
      if (v10 && v8 < v15 - 1)
      {
        size_t v43 = v14;
        v17 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v8 + 1];
        if ([v17 length] + v13 > a3)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v11 = v44;
              uint64_t v29 = [v44 _fastCStringContents:0];
              v30 = v17;
              if (v29
                && (uint64_t v31 = v29, (v32 = [v17 _fastCStringContents:0]) != 0))
              {
                v33 = (const void *)v32;
                uint64_t v34 = MEMORY[0x1A62450A0]();
                v42 = (void *)v34;
                size_t v35 = a3 + 1;
                memptr = 0;
                uint64_t v47 = 0;
                if (a3 > 0x7F)
                {
                  int v40 = malloc_type_posix_memalign(&memptr, 8uLL, a3 + 1, 0xE296A5D2uLL);
                  LOBYTE(v47) = 0;
                  if (v40)
                  {
                    id v41 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
                    objc_exception_throw(v41);
                  }
                  v36 = (char *)memptr;
                }
                else
                {
                  MEMORY[0x1F4188790](v34);
                  v36 = (char *)&v42 - ((a3 + 16) & 0xFFFFFFFFFFFFFFF0);
                  bzero((char *)&v42 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0), v35);
                  memptr = v36;
                  LOBYTE(v47) = 1;
                }
                size_t v37 = v43;
                uint64_t v38 = v47;
                memcpy(v36, (const void *)(v31 + v10), v13);
                memcpy(&v36[v13], v33, v37);
                v36[v6] = 0;
                objc_msgSend(NSString, "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:", v36, v38, v35, 1, 1, 0);
                v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
                id v11 = v44;
                v39 = v42;
              }
              else
              {
                v39 = (void *)MEMORY[0x1A62450A0]();
                v45.receiver = (id)a1;
                v45.super_class = (Class)_PASProxyConcatenatedString;
                objc_msgSendSuper2(&v45, sel_substringWithRange_, a2, a3);
                v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_32;
            }
          }
        }
      }
      size_t v43 = a3;
      v18 = objc_opt_new();
      if (v8 <= v16) {
        unint64_t v19 = v16;
      }
      else {
        unint64_t v19 = v8;
      }
      do
      {
        if (v19 == v8) {
          __assert_rtn("-[_PASProxyConcatenatedString _substringWithRange:]", "NSString+_PASAdditions.m", 763, "loopLocation.index < componentsCount");
        }
        v20 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v8];
        uint64_t v21 = [v20 length];
        if (v21 - v10 >= v6) {
          unint64_t v22 = v6;
        }
        else {
          unint64_t v22 = v21 - v10;
        }
        if (v21 == v22)
        {
          [v18 addObject:v20];
        }
        else
        {
          v23 = (void *)MEMORY[0x1A62450A0]();
          v24 = objc_msgSend(v20, "substringWithRange:", v10, v22);
          [v18 addObject:v24];
        }
        v6 -= v22;

        uint64_t v10 = 0;
        ++v8;
      }
      while (v6);
      id v11 = v44;
      if ((unint64_t)[v18 count] < 2) {
        __assert_rtn("-[_PASProxyConcatenatedString _substringWithRange:]", "NSString+_PASAdditions.m", 774, "substringComponents.count >= 2");
      }
      v25 = [_PASProxyConcatenatedString alloc];
      v26 = (void *)[v18 copy];
      v7 = (__CFString *)-[_PASProxyConcatenatedString _initWithComponents:](v25, v26);

      if ([(__CFString *)v7 length] != v43) {
        __assert_rtn("-[_PASProxyConcatenatedString _substringWithRange:]", "NSString+_PASAdditions.m", 776, "result.length == range.length");
      }
    }
LABEL_32:

    goto LABEL_33;
  }
  v7 = 0;
LABEL_33:

  return v7;
}

- (uint64_t)_validateRange:(uint64_t)a3
{
  if (result)
  {
    if ((unint64_t)(a2 + a3) > *(void *)(result + 24))
    {
      v3 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v4 = *MEMORY[0x1E4F1C4A8];
      v5 = objc_msgSend([NSString alloc], "initWithFormat:", @"Range {%tu, %tu} out of bounds; string length %tu",
                     a2,
                     a3,
                     *(void *)(result + 24));
      id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

      objc_exception_throw(v6);
    }
  }
  return result;
}

- (uint64_t)_locationOfStringIndex:(uint64_t)a1
{
  unint64_t __key = a2;
  if (!a1) {
    return 0;
  }
  unint64_t v4 = *(void *)(a1 + 24);
  if (v4 < a2) {
    __assert_rtn("-[_PASProxyConcatenatedString _locationOfStringIndex:]", "NSString+_PASAdditions.m", 795, "stringIndex <= _length");
  }
  if (!a2) {
    return 0;
  }
  if (v4 == a2)
  {
    uint64_t v5 = [*(id *)(a1 + 8) count] - 1;
    id v6 = [*(id *)(a1 + 8) lastObject];
    [v6 length];

    return v5;
  }
  v7 = *(unint64_t **)(a1 + 16);
  if (v7)
  {
    if (*v7 > a2) {
      return 0;
    }
    uint64_t v16 = [*(id *)(a1 + 8) count];
    uint64_t v5 = v16 - 1;
    if (v16 == 1) {
      __assert_rtn("-[_PASProxyConcatenatedString _locationOfStringIndex:]", "NSString+_PASAdditions.m", 823, "startIndicesCArrayCount != 0");
    }
    v17 = *(const void **)(a1 + 16);
    if (a2 < *((void *)v17 + v16 - 2))
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __54___PASProxyConcatenatedString__locationOfStringIndex___block_invoke;
      v21[3] = &__block_descriptor_40_e15_i24__0r_v8r_v16l;
      v21[4] = a2;
      v18 = bsearch_b(&__key, v17, v16 - 2, 8uLL, v21);
      uint64_t v19 = *(void *)(a1 + 16);
      unint64_t v20 = ((unint64_t)v18 - v19) >> 3;
      if ((void *)(v19 + 8 * v20) != v18) {
        __assert_rtn("-[_PASProxyConcatenatedString _locationOfStringIndex:]", "NSString+_PASAdditions.m", 851, "&(_startIndices[startIndicesIndex]) == matchingCandidate");
      }
      return v20 + 1;
    }
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 8) count];
    if (v5)
    {
      uint64_t v9 = [*(id *)(a1 + 8) objectAtIndexedSubscript:0];
      unint64_t v10 = [v9 length];

      uint64_t v11 = 0;
      if (v10 > a2)
      {
        return v11;
      }
      else
      {
        uint64_t v12 = 1;
        while (v5 != v12)
        {
          unint64_t v13 = v10;
          uint64_t v11 = v12;
          unint64_t v14 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v12];
          uint64_t v15 = [v14 length];

          unint64_t v10 = v15 + v13;
          uint64_t v12 = v11 + 1;
          if (v15 + v13 > a2) {
            return v11;
          }
        }
      }
    }
  }
  return v5;
}

- (void)_initWithComponents:(void *)a1
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (a1)
  {
    if ((unint64_t)[v4 count] <= 1)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel__initWithComponents_, a1, @"NSString+_PASAdditions.m", 628, @"Invalid parameter not satisfying: %@", @"components.count >= 2" object file lineNumber description];
    }
    v19.receiver = a1;
    v19.super_class = (Class)_PASProxyConcatenatedString;
    id v6 = objc_msgSendSuper2(&v19, sel_init);
    a1 = v6;
    if (v6)
    {
      objc_storeStrong((id *)v6 + 1, a2);
      unint64_t v7 = [v5 count];
      unint64_t v8 = [v5 objectAtIndexedSubscript:0];
      if (v7 < 3)
      {
        a1[2] = 0;
        if (!v7)
        {
          a1[3] = 0;
          goto LABEL_24;
        }
        uint64_t v14 = 0;
        uint64_t v11 = 0;
        char v10 = 0;
        do
        {
          while (1)
          {
            uint64_t v15 = [v5 objectAtIndexedSubscript:v14];
            v11 += [v15 length];
            if (v10) {
              break;
            }
            char v10 = objc_msgSend(v15, "_pas_retainsConmingledBackingStore");

            if (++v14 == v7) {
              goto LABEL_19;
            }
          }

          ++v14;
          char v10 = 1;
        }
        while (v14 != v7);
LABEL_21:
        a1[3] = v11;
      }
      else
      {
        uint64_t v9 = malloc_type_malloc(8 * v7 - 8, 0x100004000313F17uLL);
        if (!v9)
        {
          id v18 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
          objc_exception_throw(v18);
        }
        a1[2] = v9;
        char v10 = objc_msgSend(v8, "_pas_retainsConmingledBackingStore");
        uint64_t v11 = [v8 length];
        for (uint64_t i = 1; i != v7; ++i)
        {
          while (1)
          {
            *(void *)(a1[2] + 8 * i - 8) = v11;
            unint64_t v13 = [v5 objectAtIndexedSubscript:i];
            v11 += [v13 length];
            if ((v10 & 1) == 0) {
              break;
            }

            ++i;
            char v10 = 1;
            if (i == v7) {
              goto LABEL_21;
            }
          }
          char v10 = objc_msgSend(v13, "_pas_retainsConmingledBackingStore");
        }
LABEL_19:
        a1[3] = v11;
        if ((v10 & 1) == 0) {
          goto LABEL_24;
        }
      }
      objc_msgSend(a1, "_pas_setRetainsConmingledBackingStore:", 1);
LABEL_24:
    }
  }

  return a1;
}

- (id)_createSubstringWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = (void *)MEMORY[0x1A62450A0](self, a2);
  unint64_t v7 = [(_PASProxyConcatenatedString *)(uint64_t)self _substringWithRange:length];
  return v7;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  [(_PASProxyConcatenatedString *)(uint64_t)self _validateRange:a4.length];
  if (length)
  {
    uint64_t v8 = -[_PASProxyConcatenatedString _locationOfStringIndex:]((uint64_t)self, location);
    for (uint64_t i = v9; ; uint64_t i = 0)
    {
      id v15 = [(NSArray *)self->_components objectAtIndexedSubscript:v8];
      uint64_t v11 = [v15 length];
      NSUInteger v12 = v11 - i;
      NSUInteger v13 = length >= v11 - i ? v11 - i : length;
      objc_msgSend(v15, "getCharacters:range:", a3, i, v13);
      BOOL v14 = length > v12;
      length -= v12;
      if (!v14) {
        break;
      }
      a3 += v12;
      ++v8;
    }
  }
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  [(_PASProxyConcatenatedString *)(uint64_t)self _validateRange:1];
  uint64_t v5 = -[_PASProxyConcatenatedString _locationOfStringIndex:]((uint64_t)self, a3);
  uint64_t v7 = v6;
  uint64_t v8 = [(NSArray *)self->_components objectAtIndexedSubscript:v5];
  LOWORD(v7) = [v8 characterAtIndex:v7];

  return v7;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)dealloc
{
  free(self->_startIndices);
  v3.receiver = self;
  v3.super_class = (Class)_PASProxyConcatenatedString;
  [(_PASProxyConcatenatedString *)&v3 dealloc];
}

@end