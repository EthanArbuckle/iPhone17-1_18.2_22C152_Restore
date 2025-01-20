@interface PPU16CountedSet
- (BOOL)isEqual:(id)a3;
- (PPU16CountedSet)init;
- (PPU16CountedSet)initWithCapacity:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionary;
- (unint64_t)uniqueValueCount;
- (unsigned)countForValue:(unsigned __int16)a3;
- (void)_convertToDictionaryRepresentation;
- (void)addValue:(unsigned __int16)a3;
- (void)dealloc;
- (void)enumerateValuesAndCountsUsingBlock:(id)a3;
@end

@implementation PPU16CountedSet

- (void).cxx_destruct
{
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  [v3 appendString:@"["];
  vectorStorage = (unsigned __int16 **)self->_vectorStorage;
  if (vectorStorage)
  {
    v5 = *vectorStorage;
    v6 = vectorStorage[1];
    if (*vectorStorage != v6)
    {
      char v7 = 1;
      do
      {
        if ((v7 & 1) == 0) {
          [v3 appendString:@", "];
        }
        objc_msgSend(v3, "appendFormat:", @"%u [%u]", *v5, v5[1]);
        char v7 = 0;
        v5 += 2;
      }
      while (v5 != v6);
    }
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v8 = self->_dictStorage;
    uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      char v11 = 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ((v11 & 1) == 0) {
            [v3 appendString:@", "];
          }
          unsigned __int16 v14 = [v13 intValue];
          v15 = [(NSMutableDictionary *)self->_dictStorage objectForKeyedSubscript:v13];
          unsigned __int16 v16 = [v15 intValue];
          objc_msgSend(v3, "appendFormat:", @"%u [%u]", v14, v16, (void)v19);

          char v11 = 0;
        }
        uint64_t v9 = [(NSMutableDictionary *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
        char v11 = 0;
      }
      while (v9);
    }
  }
  [v3 appendString:@"]"];
  v17 = (void *)[v3 copy];

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v5 = objc_opt_new();
  if (v5)
  {
    vectorStorage = (int **)self->_vectorStorage;
    char v7 = *vectorStorage;
    v8 = vectorStorage[1];
    if (*vectorStorage != v8)
    {
      do
      {
        int v9 = *v7;
        uint64_t v10 = (void **)v5[1];
        v12 = v10[1];
        unint64_t v11 = (unint64_t)v10[2];
        if ((unint64_t)v12 >= v11)
        {
          uint64_t v14 = ((char *)v12 - (unsigned char *)*v10) >> 2;
          if ((unint64_t)(v14 + 1) >> 62) {
            std::vector<PPTokenCount * {__strong}>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v15 = v11 - (void)*v10;
          uint64_t v16 = v15 >> 1;
          if (v15 >> 1 <= (unint64_t)(v14 + 1)) {
            uint64_t v16 = v14 + 1;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v16;
          }
          if (v17) {
            unint64_t v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v17);
          }
          else {
            uint64_t v18 = 0;
          }
          long long v19 = (_DWORD *)(v17 + 4 * v14);
          *long long v19 = v9;
          v13 = v19 + 1;
          long long v21 = (char *)*v10;
          long long v20 = (char *)v10[1];
          if (v20 != *v10)
          {
            do
            {
              int v22 = *((_DWORD *)v20 - 1);
              v20 -= 4;
              *--long long v19 = v22;
            }
            while (v20 != v21);
            long long v20 = (char *)*v10;
          }
          *uint64_t v10 = v19;
          v10[1] = v13;
          v10[2] = (void *)(v17 + 4 * v18);
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          _DWORD *v12 = v9;
          v13 = v12 + 1;
        }
        v10[1] = v13;
        ++v7;
      }
      while (v7 != v8);
    }
    uint64_t v23 = [(NSMutableDictionary *)self->_dictStorage copyWithZone:a3];
    uint64_t v24 = (void *)v5[2];
    v5[2] = v23;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPU16CountedSet *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (self)
    {
      v8 = (id *)[(PPU16CountedSet *)self copy];
      int v9 = (id *)[(PPU16CountedSet *)v6 copy];
      -[PPU16CountedSet _convertToDictionaryRepresentation]((uint64_t)v8);
      -[PPU16CountedSet _convertToDictionaryRepresentation]((uint64_t)v9);
      if ([v8[2] isEqualToDictionary:v9[2]])
      {
        BOOL v7 = 1;
      }
      else if ([v8[2] count])
      {
        BOOL v7 = 0;
      }
      else
      {
        BOOL v7 = [v9[2] count] == 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_convertToDictionaryRepresentation
{
  if (a1)
  {
    if (!*(void *)(a1 + 8) || *(void *)(a1 + 16))
    {
      unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel__convertToDictionaryRepresentation, a1, @"PPCompactCountedSets.mm", 62, @"Invalid parameter not satisfying: %@", @"_vectorStorage && !_dictStorage" object file lineNumber description];
    }
    uint64_t v2 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:(uint64_t)(*(void *)(*(void *)(a1 + 8) + 8) - **(void **)(a1 + 8)) >> 1];
    v3 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v2;

    v4 = *(unsigned __int16 ***)(a1 + 8);
    v5 = *v4;
    v6 = v4[1];
    if (*v4 != v6)
    {
      do
      {
        BOOL v7 = (void *)MEMORY[0x1CB79D060]();
        v8 = [NSNumber numberWithUnsignedShort:v5[1]];
        int v9 = *(void **)(a1 + 16);
        uint64_t v10 = [NSNumber numberWithUnsignedShort:*v5];
        [v9 setObject:v8 forKeyedSubscript:v10];

        v5 += 2;
      }
      while (v5 != v6);
      v4 = *(unsigned __int16 ***)(a1 + 8);
      v5 = *v4;
    }
    if (v5)
    {
      v4[1] = v5;
      operator delete(v5);
    }
    *(void *)(a1 + 8) = 0;
  }
}

- (void)enumerateValuesAndCountsUsingBlock:(id)a3
{
  id v5 = a3;
  id v16 = v5;
  if (!v5)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PPCompactCountedSets.mm", 142, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];

    id v5 = 0;
  }
  if (self->_vectorStorage)
  {
    id v6 = v5;
    vectorStorage = (unsigned __int16 **)self->_vectorStorage;
    v8 = *vectorStorage;
    int v9 = vectorStorage[1];
    if (*vectorStorage != v9)
    {
      do
      {
        uint64_t v10 = (void *)MEMORY[0x1CB79D060]();
        LOBYTE(v17[0]) = 0;
        (*((void (**)(id, void, void, void *))v6 + 2))(v6, *v8, v8[1], v17);
        int v11 = LOBYTE(v17[0]);
        v8 += 2;
        if (v11) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = v8 == v9;
        }
      }
      while (!v12);
    }
  }
  else
  {
    id v13 = v5;
    dictStorage = self->_dictStorage;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__PPU16CountedSet__dictEnumerateValuesAndCountsUsingBlock___block_invoke;
    v17[3] = &unk_1E65D4C58;
    id v6 = v13;
    id v18 = v6;
    [(NSMutableDictionary *)dictStorage enumerateKeysAndObjectsUsingBlock:v17];
  }
}

void __59__PPU16CountedSet__dictEnumerateValuesAndCountsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v9 = a2;
  id v7 = a3;
  v8 = (void *)MEMORY[0x1CB79D060]();
  (*(void (**)(void, void, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), (unsigned __int16)[v9 unsignedIntValue], (unsigned __int16)objc_msgSend(v7, "unsignedIntValue"), a4);
}

- (id)dictionary
{
  dictStorage = self->_dictStorage;
  if (!dictStorage)
  {
    -[PPU16CountedSet _convertToDictionaryRepresentation]((uint64_t)self);
    dictStorage = self->_dictStorage;
  }
  return dictStorage;
}

- (unint64_t)uniqueValueCount
{
  vectorStorage = self->_vectorStorage;
  if (vectorStorage) {
    return (uint64_t)(vectorStorage[1] - *vectorStorage) >> 2;
  }
  else {
    return [(NSMutableDictionary *)self->_dictStorage count];
  }
}

- (unsigned)countForValue:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  vectorStorage = (unsigned __int16 **)self->_vectorStorage;
  if (vectorStorage)
  {
    id v5 = *vectorStorage;
    id v6 = vectorStorage[1];
    if (v5 != v6)
    {
      while (*v5 != a3)
      {
        v5 += 2;
        if (v5 == v6) {
          return 0;
        }
      }
    }
    if (v5 == v6) {
      return 0;
    }
    else {
      return v5[1];
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1CB79D060]();
    dictStorage = self->_dictStorage;
    int v11 = [NSNumber numberWithUnsignedShort:v3];
    BOOL v12 = [(NSMutableDictionary *)dictStorage objectForKeyedSubscript:v11];

    if (v12) {
      unsigned __int16 v7 = [v12 unsignedIntValue];
    }
    else {
      unsigned __int16 v7 = 0;
    }
  }
  return v7;
}

- (void)addValue:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  vectorStorage = (unsigned __int16 **)self->_vectorStorage;
  if (vectorStorage)
  {
    id v6 = (char *)*vectorStorage;
    unsigned __int16 v7 = vectorStorage[1];
    v8 = *vectorStorage;
    if (*vectorStorage != v7)
    {
      while (*v8 != a3)
      {
        v8 += 2;
        if (v8 == v7) {
          goto LABEL_14;
        }
      }
    }
    if (v8 == v7)
    {
LABEL_14:
      uint64_t v15 = (char *)v7 - v6;
      if ((unint64_t)((char *)v7 - v6) < 0x1FD)
      {
        unint64_t v17 = (unint64_t)vectorStorage[2];
        if ((unint64_t)v7 >= v17)
        {
          uint64_t v19 = v15 >> 2;
          uint64_t v20 = v17 - (void)v6;
          if (v20 >> 1 <= (unint64_t)((v15 >> 2) + 1)) {
            uint64_t v21 = v19 + 1;
          }
          else {
            uint64_t v21 = v20 >> 1;
          }
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v22 = v21;
          }
          uint64_t v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v22);
          uint64_t v24 = &v23[4 * v19];
          v26 = &v23[4 * v25];
          *(_WORD *)uint64_t v24 = v3;
          *((_WORD *)v24 + 1) = 1;
          id v18 = (unsigned __int16 *)(v24 + 4);
          v28 = *vectorStorage;
          v27 = (char *)vectorStorage[1];
          if (v27 != (char *)*vectorStorage)
          {
            do
            {
              int v29 = *((_DWORD *)v27 - 1);
              v27 -= 4;
              *((_DWORD *)v24 - 1) = v29;
              v24 -= 4;
            }
            while (v27 != (char *)v28);
            v27 = (char *)*vectorStorage;
          }
          void *vectorStorage = (unsigned __int16 *)v24;
          vectorStorage[1] = v18;
          vectorStorage[2] = (unsigned __int16 *)v26;
          if (v27) {
            operator delete(v27);
          }
        }
        else
        {
          *unsigned __int16 v7 = a3;
          v7[1] = 1;
          id v18 = v7 + 2;
        }
        vectorStorage[1] = v18;
      }
      else
      {
        -[PPU16CountedSet _convertToDictionaryRepresentation]((uint64_t)self);
        dictStorage = self->_dictStorage;
        id v31 = [NSNumber numberWithUnsignedShort:v3];
        -[NSMutableDictionary setObject:forKeyedSubscript:](dictStorage, "setObject:forKeyedSubscript:", &unk_1F2568BB8);
      }
    }
    else
    {
      int v9 = v8[1];
      if (v9 == 0xFFFF) {
        __int16 v10 = -1;
      }
      else {
        __int16 v10 = v9 + 1;
      }
      v8[1] = v10;
    }
  }
  else
  {
    int v11 = (void *)MEMORY[0x1CB79D060]();
    id v30 = [NSNumber numberWithUnsignedShort:v3];
    BOOL v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_dictStorage, "objectForKeyedSubscript:");
    id v13 = v12;
    if (v12)
    {
      if ([v12 unsignedIntValue] <= 0xFFFE)
      {
        uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "unsignedIntValue") + 1);
        [(NSMutableDictionary *)self->_dictStorage setObject:v14 forKeyedSubscript:v30];
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_dictStorage setObject:&unk_1F2568BB8 forKeyedSubscript:v30];
    }
  }
}

- (void)dealloc
{
  vectorStorage = (void **)self->_vectorStorage;
  if (vectorStorage)
  {
    v4 = *vectorStorage;
    if (*vectorStorage)
    {
      vectorStorage[1] = v4;
      operator delete(v4);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)PPU16CountedSet;
  [(PPU16CountedSet *)&v5 dealloc];
}

- (PPU16CountedSet)initWithCapacity:(unint64_t)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PPU16CountedSet;
  v4 = [(PPU16CountedSet *)&v14 init];
  objc_super v5 = v4;
  if (v4)
  {
    *(void *)v4->_vectorInlineStorage.__lx = 0;
    *(void *)&v4->_vectorInlineStorage.__lx[8] = 0;
    *(void *)&v4->_vectorInlineStorage.__lx[16] = 0;
    v4->_vectorStorage = &v4->_vectorInlineStorage;
    if (a3)
    {
      if (a3 >= 0x80) {
        unint64_t v6 = 128;
      }
      else {
        unint64_t v6 = a3;
      }
      unsigned __int16 v7 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned short,unsigned short>>>(v6);
      __int16 v10 = *(char **)v5->_vectorInlineStorage.__lx;
      int v9 = *(char **)&v5->_vectorInlineStorage.__lx[8];
      int v11 = v7;
      if (v9 != v10)
      {
        do
        {
          int v12 = *((_DWORD *)v9 - 1);
          v9 -= 4;
          *((_DWORD *)v11 - 1) = v12;
          v11 -= 4;
        }
        while (v9 != v10);
        int v9 = *(char **)v5->_vectorInlineStorage.__lx;
      }
      *(void *)v5->_vectorInlineStorage.__lx = v11;
      *(void *)&v5->_vectorInlineStorage.__lx[8] = v7;
      *(void *)&v5->_vectorInlineStorage.__lx[16] = &v7[4 * v8];
      if (v9) {
        operator delete(v9);
      }
    }
  }
  return v5;
}

- (PPU16CountedSet)init
{
  return [(PPU16CountedSet *)self initWithCapacity:0];
}

@end