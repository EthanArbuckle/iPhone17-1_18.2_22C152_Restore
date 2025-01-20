@interface _PASMutableDomainSelection
- (BOOL)_addDomainsFrom:(id)a3;
- (BOOL)_addDomainsFromOtherDictionary:(id)a3 toOwnDictionary:(id)a4 ownDictionaryIsPlaceholder:(BOOL)a5;
- (BOOL)addDomain:(id)a3;
- (BOOL)addDomainsFromSelection:(id)a3;
- (BOOL)containsDomain:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqualToDomainSelection:(id)a3;
- (_PASMutableDomainSelection)init;
- (id)_initWithNonOverlappingDomainSet:(id)a3;
- (id)allDomains;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)count;
- (void)_decrementCountAndMaybePruneItems:(id)a3;
- (void)dealloc;
@end

@implementation _PASMutableDomainSelection

- (BOOL)addDomainsFromSelection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEmpty])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || *((unsigned char *)v4 + 24))
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      v7 = objc_msgSend(v4, "allDomains", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        int v5 = 0;
        uint64_t v10 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            v5 |= [(_PASMutableDomainSelection *)self addDomain:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
    else
    {
      v6 = (void *)MEMORY[0x1A62450A0]();
      LOBYTE(v5) = [(_PASMutableDomainSelection *)self _addDomainsFromOtherDictionary:*((void *)v4 + 1) toOwnDictionary:self->_domains ownDictionaryIsPlaceholder:1];
    }
  }

  return v5 & 1;
}

- (BOOL)containsDomain:(id)a3
{
  id v4 = a3;
  int v5 = self->_domains;
  uint64_t v6 = [v4 length];
  v7 = (void *)MEMORY[0x1A62450A0]();
  uint64_t v8 = objc_msgSend(v4, "rangeOfString:options:range:", @".", 2, 0, v6);
  if (v9)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    uint64_t v12 = 0;
    long long v13 = 0;
    long long v14 = 0;
    while (1)
    {
      long long v15 = v14;
      long long v16 = objc_msgSend(v4, "substringWithRange:", v12, v10 - v12);
      long long v14 = objc_msgSend(v16, "_pas_distilledString");

      v17 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v14];

      BOOL v18 = v17 != 0;
      if (!v17) {
        break;
      }
      if (![v17 count]) {
        goto LABEL_11;
      }
      long long v13 = v17;

      uint64_t v12 = v10 + v11;
      uint64_t v6 = [v4 length] - (v10 + v11);
      v7 = (void *)MEMORY[0x1A62450A0]();
      uint64_t v10 = objc_msgSend(v4, "rangeOfString:options:range:", @".", 2, v10 + v11, v6);
      uint64_t v11 = v19;
      int v5 = v13;
      if (!v19)
      {

        int v5 = v13;
        goto LABEL_8;
      }
    }
  }
  else
  {
    long long v13 = 0;
    uint64_t v12 = 0;
LABEL_8:
    v20 = (void *)MEMORY[0x1A62450A0]();
    v21 = objc_msgSend(v4, "substringWithRange:", v12, v6);
    long long v14 = objc_msgSend(v21, "_pas_distilledString");

    v17 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v14];

    if (v17 && ![v17 count]) {
LABEL_11:
    }
      BOOL v18 = 1;
    else {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (_PASMutableDomainSelection)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PASMutableDomainSelection;
  v2 = [(_PASDomainSelection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    domains = v2->_domains;
    v2->_domains = (NSMutableDictionary *)v3;

    v2->_count = 0;
    v2->_taintedByDeepDomain = 0;
  }
  return v2;
}

- (BOOL)_addDomainsFrom:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  int v32 = 0;
  unint64_t v3 = 1;
  while (1)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v4 = v29;
    uint64_t v35 = [v4 countByEnumeratingWithState:&v48 objects:v52 count:16];
    if (!v35) {
      break;
    }
    uint64_t v33 = *(void *)v49;
    unint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
    id obj = v4;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v49 != v33) {
          objc_enumerationMutation(obj);
        }
        objc_super v6 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x1A62450A0]();
        uint64_t v8 = v6;
        uint64_t v9 = self;

        if (!v9) {
          goto LABEL_34;
        }
        uint64_t v47 = 0;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        *(_OWORD *)theString = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        *(_OWORD *)buffer = 0u;
        CFIndex Length = CFStringGetLength(v8);
        theString[0] = v8;
        *((void *)&v45 + 1) = 0;
        *(void *)&long long v46 = Length;
        CFStringRef CharactersPtr = (const __CFString *)CFStringGetCharactersPtr(v8);
        CStringPtr = 0;
        theString[1] = CharactersPtr;
        if (!CharactersPtr) {
          CStringPtr = CFStringGetCStringPtr(v8, 0x600u);
        }
        *(void *)&long long v45 = CStringPtr;
        *((void *)&v46 + 1) = 0;
        uint64_t v47 = 0;
        if (Length >= 1)
        {
          uint64_t v13 = 0;
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 64;
          unint64_t v17 = 1;
          do
          {
            if ((unint64_t)v15 >= 4) {
              uint64_t v18 = 4;
            }
            else {
              uint64_t v18 = v15;
            }
            uint64_t v19 = v46;
            if ((uint64_t)v46 > v15)
            {
              if (theString[1])
              {
                UniChar v20 = *((_WORD *)&theString[1]->isa + v15 + *((void *)&v45 + 1));
              }
              else if ((void)v45)
              {
                UniChar v20 = *(char *)(v45 + *((void *)&v45 + 1) + v15);
              }
              else
              {
                if (v47 <= v15 || v14 > v15)
                {
                  uint64_t v22 = v18 + v13;
                  uint64_t v23 = v16 - v18;
                  uint64_t v24 = v15 - v18;
                  uint64_t v25 = v24 + 64;
                  if (v24 + 64 >= (uint64_t)v46) {
                    uint64_t v25 = v46;
                  }
                  *((void *)&v46 + 1) = v24;
                  uint64_t v47 = v25;
                  if ((uint64_t)v46 >= v23) {
                    uint64_t v19 = v23;
                  }
                  v54.length = v19 + v22;
                  v54.location = v24 + *((void *)&v45 + 1);
                  CFStringGetCharacters(theString[0], v54, buffer);
                  uint64_t v14 = *((void *)&v46 + 1);
                }
                UniChar v20 = buffer[v15 - v14];
              }
              if (v20 == 46) {
                ++v17;
              }
            }
            ++v15;
            --v13;
            ++v16;
          }
          while (Length != v15);
        }
        else
        {
LABEL_34:
          unint64_t v17 = 1;
        }

        if (v17 == v3)
        {
          v32 |= [(_PASMutableDomainSelection *)self addDomain:v8];
        }
        else
        {
          unint64_t v26 = v34;
          if (v17 < v34 && v17 > v3) {
            unint64_t v26 = v17;
          }
          unint64_t v34 = v26;
        }
      }
      id v4 = obj;
      uint64_t v35 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v35);

    unint64_t v3 = v34;
    if (v34 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_48;
    }
  }

LABEL_48:
  return v32 & 1;
}

- (BOOL)addDomain:(id)a3
{
  id v4 = a3;
  v31 = self;
  int v5 = self->_domains;
  uint64_t v6 = [v4 length];
  v7 = (void *)MEMORY[0x1A62450A0]();
  int v32 = v4;
  uint64_t v8 = objc_msgSend(v4, "rangeOfString:options:range:", @".", 2, 0, v6);
  if (v9)
  {
    uint64_t v10 = v8;
    uint64_t v11 = v9;
    uint64_t v12 = v7;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    unint64_t v17 = v32;
    do
    {
      uint64_t v18 = (void *)MEMORY[0x1A62450A0]();
      uint64_t v19 = objc_msgSend(v17, "substringWithRange:", v13, v10 - v13);
      uint64_t v20 = objc_msgSend(v19, "_pas_distilledString");

      uint64_t v15 = (void *)v20;
      v21 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v20];

      if (v21)
      {
        if (![v21 count])
        {
          BOOL v28 = 0;
          id v29 = v32;
          v7 = v12;
          goto LABEL_17;
        }
      }
      else
      {
        v21 = objc_opt_new();
        [(NSMutableDictionary *)v5 setObject:v21 forKeyedSubscript:v20];
      }
      uint64_t v14 = v21;

      uint64_t v13 = v10 + v11;
      unint64_t v17 = v32;
      uint64_t v6 = [v32 length] - (v10 + v11);
      ++v16;
      uint64_t v12 = (void *)MEMORY[0x1A62450A0]();
      uint64_t v10 = objc_msgSend(v32, "rangeOfString:options:range:", @".", 2, v10 + v11, v6);
      uint64_t v11 = v22;
      int v5 = v14;
    }
    while (v22);
    if (v16 >= 0x65)
    {
      uint64_t v23 = v31;
      id v29 = v32;
      v31->_taintedByDeepDomain = 1;
      int v5 = v14;
    }
    else
    {
      int v5 = v14;
      uint64_t v23 = v31;
      id v29 = v32;
    }
    v7 = v12;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    uint64_t v23 = v31;
    id v29 = v4;
  }
  uint64_t v24 = v15;
  uint64_t v25 = (void *)MEMORY[0x1A62450A0]();
  unint64_t v26 = objc_msgSend(v29, "substringWithRange:", v13, v6);
  uint64_t v15 = objc_msgSend(v26, "_pas_distilledString");

  v21 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v15];

  if (v21)
  {
    if (![v21 count])
    {
      BOOL v28 = 0;
      goto LABEL_17;
    }
    [(_PASMutableDomainSelection *)v23 _decrementCountAndMaybePruneItems:v21];
  }
  v27 = objc_opt_new();
  [(NSMutableDictionary *)v5 setObject:v27 forKeyedSubscript:v15];

  ++v23->_count;
  BOOL v28 = 1;
LABEL_17:

  return v28;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  if (self->_taintedByDeepDomain)
  {
    [(_PASMutableDomainSelection *)self _decrementCountAndMaybePruneItems:self->_domains];
    if (self->_count)
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2, self, @"_PASDomainSelection.m", 309, @"Invalid parameter not satisfying: %@", @"_count == 0" object file lineNumber description];
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)_PASMutableDomainSelection;
  [(_PASMutableDomainSelection *)&v5 dealloc];
}

- (unint64_t)count
{
  return self->_count;
}

- (void)_decrementCountAndMaybePruneItems:(id)a3
{
  id v5 = a3;
  unint64_t count = self->_count;
  if (!count)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_PASDomainSelection.m", 544, @"Invalid parameter not satisfying: %@", @"beforeCount > 0" object file lineNumber description];
  }
  v7 = (void *)MEMORY[0x1A62450A0]();
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, 0);
  do
  {
    uint64_t v9 = (void *)MEMORY[0x1A62450A0]();
    uint64_t v10 = [v8 lastObject];
    [v8 removeLastObject];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64___PASMutableDomainSelection__decrementCountAndMaybePruneItems___block_invoke;
    v14[3] = &unk_1E5AEB2F0;
    v14[4] = self;
    id v11 = v8;
    id v15 = v11;
    [v10 enumerateKeysAndObjectsUsingBlock:v14];
    if (self->_taintedByDeepDomain) {
      [v10 removeAllObjects];
    }
  }
  while ([v11 count]);
  if (self->_count > count)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_PASDomainSelection.m", 564, @"Invalid parameter not satisfying: %@", @"afterCount <= beforeCount" object file lineNumber description];
  }
}

- (BOOL)isEqualToDomainSelection:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    unint64_t count = self->_count;
    if (count == [v4 count])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v5;
        uint64_t v8 = v7;
        if (!self->_taintedByDeepDomain && !*((unsigned char *)v7 + 24))
        {
          char v9 = [(NSMutableDictionary *)self->_domains isEqual:*((void *)v7 + 1)];
LABEL_10:

          goto LABEL_11;
        }
      }
      uint64_t v8 = [(_PASMutableDomainSelection *)self allDomains];
      uint64_t v10 = [v5 allDomains];
      char v9 = [v8 isEqual:v10];

      goto LABEL_10;
    }
  }
  char v9 = 0;
LABEL_11:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_PASDomainSelection alloc];
  id v5 = [(_PASMutableDomainSelection *)self allDomains];
  id v6 = [(_PASDomainSelection *)v4 _initWithNonOverlappingDomainSet:v5];

  return v6;
}

- (BOOL)_addDomainsFromOtherDictionary:(id)a3 toOwnDictionary:(id)a4 ownDictionaryIsPlaceholder:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v9 count] || v5)
  {
    if ([v8 count])
    {
      uint64_t v16 = 0;
      unint64_t v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 0;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __104___PASMutableDomainSelection__addDomainsFromOtherDictionary_toOwnDictionary_ownDictionaryIsPlaceholder___block_invoke;
      v12[3] = &unk_1E5AEB2C8;
      uint64_t v14 = self;
      id v15 = &v16;
      id v13 = v9;
      [v8 enumerateKeysAndObjectsUsingBlock:v12];
      BOOL v10 = *((unsigned char *)v17 + 24) != 0;

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      [(_PASMutableDomainSelection *)self _decrementCountAndMaybePruneItems:v9];
      [v9 removeAllObjects];
      ++self->_count;
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)isEmpty
{
  return self->_count == 0;
}

- (id)allDomains
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->_domains count])
  {
    SEL v17 = a2;
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:self->_count];
    BOOL v5 = +[_PASTuple2 tupleWithFirst:self->_domains second:&stru_1EF678A50];
    v22[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    id v7 = (void *)[v6 mutableCopy];

    do
    {
      id v8 = (void *)MEMORY[0x1A62450A0]();
      id v9 = [v7 lastObject];
      [v7 removeLastObject];
      BOOL v10 = [v9 first];
      id v11 = [v9 second];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __40___PASMutableDomainSelection_allDomains__block_invoke;
      v18[3] = &unk_1E5AEB2A0;
      id v12 = v4;
      id v19 = v12;
      id v20 = v11;
      id v13 = v7;
      id v21 = v13;
      id v14 = v11;
      [v10 enumerateKeysAndObjectsUsingBlock:v18];
    }
    while ([v13 count]);
    if ([v12 count] != self->_count)
    {
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:v17, self, @"_PASDomainSelection.m", 367, @"Invalid parameter not satisfying: %@", @"allDomainsSet.count == _count" object file lineNumber description];
    }
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v12;
}

- (id)_initWithNonOverlappingDomainSet:(id)a3
{
  id v5 = a3;
  id v6 = [(_PASMutableDomainSelection *)self init];
  if (v6)
  {
    id v7 = [[_PASDomainSelection alloc] _initWithNonOverlappingDomainSet:v5];
    [(_PASMutableDomainSelection *)v6 addDomainsFromSelection:v7];

    uint64_t v8 = [(_PASMutableDomainSelection *)v6 count];
    if (v8 != [v5 count])
    {
      BOOL v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:v6 file:@"_PASDomainSelection.m" lineNumber:298 description:@"-[_PASMutableDomainSelection _initWithNonOverlappingDomainSet:] was invoked with overlapping domains"];
    }
  }

  return v6;
}

@end