@interface NSAttributeDictionary
+ (id)emptyAttributeDictionary;
+ (id)newWithDictionary:(id)a3;
+ (void)initialize;
- (BOOL)isEqualToDictionary:(id)a3;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)newWithKey:(id)a3 object:(id)a4;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)__apply:(void *)a3 context:(void *)a4;
- (void)dealloc;
- (void)getObjects:(id *)a3 andKeys:(id *)a4;
@end

@implementation NSAttributeDictionary

- (unint64_t)count
{
  return self->numElements;
}

- (id)objectForKey:(id)a3
{
  unint64_t numElements = self->numElements;
  if (numElements)
  {
    unint64_t v6 = 0;
    p_key = &self->elements[0].key;
    while (*p_key != a3)
    {
      ++v6;
      p_key += 3;
      if (numElements == v6) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    if (__NSNumberOfNormalizedKeys == 1)
    {
      uint64_t v8 = 0;
      while ((id)normalizedKeyInfo[v8] != a3)
      {
        v8 += 2;
        if (v8 == 60) {
          goto LABEL_9;
        }
      }
      return 0;
    }
LABEL_9:
    if (!numElements) {
      return 0;
    }
    unint64_t v9 = [a3 hash];
    unint64_t v10 = v9 % self->numElements;
    unint64_t v6 = v10;
    while (self->elements[v6].hash != v9 || ([(value *)self->elements[v6].key isEqual:a3] & 1) == 0)
    {
      if (v6 + 1 == self->numElements) {
        unint64_t v6 = 0;
      }
      else {
        ++v6;
      }
      if (v6 == v10) {
        return 0;
      }
    }
  }
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  return self->elements[v6].var0;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t numElements = self->numElements;
  if (numElements < 0x29)
  {
    if (numElements)
    {
      p_var0 = &self->elements[0].var0;
      unint64_t v6 = v10;
      v7 = v11;
      do
      {
        *v7++ = *(p_var0 - 1);
        id v8 = *p_var0;
        p_var0 += 3;
        *v6++ = v8;
        --numElements;
      }
      while (numElements);
    }
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA60], "allocWithZone:", a3), "initWithObjects:forKeys:count:", v10, v11, self->numElements);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSAttributeDictionary;
    return [(NSAttributeDictionary *)&v9 mutableCopyWithZone:a3];
  }
}

+ (id)newWithDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = (id)emptyAttributeDictionary;
  }
  id v31 = v3;
  if (v3 && object_getClass(v3) == (Class)attributeDictionaryClass)
  {
    return v31;
  }
  os_unfair_lock_lock_with_options();
  v4 = (void *)[(id)attributeDictionaryTable member:v31];
  if (v4)
  {
    v5 = v4;
    unint64_t v6 = v4;
LABEL_8:
    os_unfair_lock_unlock((os_unfair_lock_t)&attributeDictionaryLock);
    return v5;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&attributeDictionaryLock);
  unint64_t v7 = [v31 count];
  if (v7 >= 0x81)
  {
    objc_super v9 = NSZoneMalloc(0, 8 * v7);
    id v8 = NSZoneMalloc(0, 8 * v7);
  }
  else
  {
    id v8 = v34;
    objc_super v9 = v35;
  }
  objc_msgSend(v31, "getObjects:andKeys:count:", v8, v9, v7, v31);
  v11 = (objc_class *)objc_opt_class();
  unint64_t v12 = v7 - 1;
  if (!v7) {
    unint64_t v12 = 0;
  }
  v5 = NSAllocateObject(v11, 24 * v12, 0);
  v5[1] = v7;
  if (!v7) {
    goto LABEL_42;
  }
  uint64_t v13 = 0;
  v33 = v9;
  do
  {
    v14 = *(void **)&v9[8 * v13];
    if (__NSNumberOfNormalizedKeys == 1)
    {
      for (uint64_t i = 0; i != 60; i += 2)
      {
        if ((void *)normalizedKeyInfo[i] == v14)
        {
          unint64_t v18 = normalizedKeyInfo[i + 1];
          id v22 = v14;
          goto LABEL_34;
        }
      }
    }
    v16 = v8;
    v17 = v5;
    unint64_t v18 = [v14 hash];
    if (__NSNumberOfNormalizedKeys != 1)
    {
LABEL_31:
      id v22 = (id)[v14 copyWithZone:0];
      goto LABEL_32;
    }
    unint64_t v19 = 0;
    v20 = normalizedKeyInfo;
    while (v18 != v20[1])
    {
      char v21 = 1;
LABEL_29:
      if (v19 <= 0x1C)
      {
        ++v19;
        v20 += 2;
        if (v21) {
          continue;
        }
      }
      goto LABEL_31;
    }
    if (([(id)*v20 isEqual:v14] & 1) == 0)
    {
      char v21 = __NSNumberOfNormalizedKeys;
      goto LABEL_29;
    }
    id v22 = (id)*v20;
LABEL_32:
    v5 = v17;
    id v8 = v16;
    objc_super v9 = v33;
LABEL_34:
    *(void *)&v9[8 * v13] = v22;
    unint64_t v23 = v18 % v7;
    v24 = v5 + 2;
    while (1)
    {
      v25 = &v24[3 * v23];
      uint64_t v27 = v25[1];
      v26 = v25 + 1;
      if (!v27) {
        break;
      }
      if (v23 + 1 == v7) {
        unint64_t v23 = 0;
      }
      else {
        ++v23;
      }
    }
    v24[3 * v23] = v18;
    void *v26 = *(void *)&v9[8 * v13];
    v5[3 * v23 + 4] = *(id *)&v8[8 * v13++];
  }
  while (v13 != v7);
LABEL_42:
  if (v9 != v35) {
    NSZoneFree(0, v9);
  }
  if (v8 != v34) {
    NSZoneFree(0, v8);
  }
  os_unfair_lock_lock_with_options();
  v28 = (void *)[(id)attributeDictionaryTable member:v32];
  if (!v28)
  {
    [(id)attributeDictionaryTable addObject:v5];
    goto LABEL_8;
  }
  v29 = v28;
  id v30 = v28;
  os_unfair_lock_unlock((os_unfair_lock_t)&attributeDictionaryLock);
  [v5 dealloc];
  return v29;
}

- (id)keyEnumerator
{
  v2 = (void *)[objc_allocWithZone((Class)NSAttributeDictionaryEnumerator) initWithAttributeDictionary:self];

  return v2;
}

- (BOOL)isEqualToDictionary:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_60;
  }
  if (object_getClass(a3) == (Class)attributeDictionaryClass)
  {
    LOBYTE(v46) = self == a3;
    return v46;
  }
  unint64_t numElements = self->numElements;
  if (numElements != [a3 count])
  {
LABEL_60:
    LOBYTE(v46) = 0;
    return v46;
  }
  Class Class = object_getClass(a3);
  unint64_t v19 = self->numElements;
  if (Class == (Class)tempAttributeDictionaryClass)
  {
    if (!v19)
    {
LABEL_59:
      LOBYTE(v46) = 1;
      return v46;
    }
    unint64_t v47 = 0;
    elements = self->elements;
    p_key = &self->elements[0].key;
    v64 = (const void **)((char *)a3 + 16);
    while (2)
    {
      unint64_t v49 = 0;
      v50 = (value *)v64[3 * v47 + 1];
      v51 = p_key;
      while (*v51 != v50)
      {
        ++v49;
        v51 += 3;
        if (v19 == v49)
        {
          if (__NSNumberOfNormalizedKeys != 1)
          {
LABEL_39:
            unint64_t v53 = [(id)v64[3 * v47 + 1] hash];
            unint64_t v54 = self->numElements;
            unint64_t v55 = v53 % v54;
            unint64_t v49 = v53 % v54;
            do
            {
              if (elements[v49].hash == v53)
              {
                if ([(value *)elements[v49].key isEqual:v50]) {
                  goto LABEL_48;
                }
                unint64_t v54 = self->numElements;
              }
              LOBYTE(v46) = 0;
              if (v49 + 1 == v54) {
                unint64_t v49 = 0;
              }
              else {
                ++v49;
              }
            }
            while (v49 != v55);
            return v46;
          }
          uint64_t v52 = 0;
          while ((value *)normalizedKeyInfo[v52] != v50)
          {
            v52 += 2;
            if (v52 == 60) {
              goto LABEL_39;
            }
          }
          goto LABEL_60;
        }
      }
LABEL_48:
      if (v49 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_60;
      }
      id var0 = elements[v49].var0;
      if (var0 == v64[3 * v47 + 2] || (LODWORD(v46) = objc_msgSend(var0, "isEqual:"), v46))
      {
        ++v47;
        unint64_t v19 = self->numElements;
        LOBYTE(v46) = 1;
        if (v47 < v19) {
          continue;
        }
      }
      break;
    }
  }
  else
  {
    if (v19 < 8)
    {
      p_key = (value **)&v60;
      uint64_t v20 = MEMORY[0x1F4188790](Class, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
      MEMORY[0x1F4188790](v20, (char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0), v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32);
      v64 = v33;
      v62 = (char *)&v60 - v34;
      CFDictionaryGetKeysAndValues((CFDictionaryRef)a3, v33, (const void **)((char *)&v60 - v34));
      unint64_t v35 = self->numElements;
      if (v35)
      {
        unint64_t v36 = 0;
        p_unint64_t numElements = &self->numElements;
        v61 = &self->numElements;
        while (2)
        {
          unint64_t v38 = 0;
          v39 = v64[v36];
          v40 = (const void **)(p_numElements + 2);
          while (*v40 != v39)
          {
            ++v38;
            v40 += 3;
            if (v35 == v38)
            {
              if (__NSNumberOfNormalizedKeys == 1)
              {
                uint64_t v41 = 0;
                while ((const void *)normalizedKeyInfo[v41] != v39)
                {
                  v41 += 2;
                  if (v41 == 60) {
                    goto LABEL_15;
                  }
                }
              }
              else
              {
LABEL_15:
                unint64_t v42 = [(id)v64[v36] hash];
                unint64_t v43 = self->numElements;
                unint64_t v44 = v42 % v43;
                unint64_t v38 = v42 % v43;
                do
                {
                  if (self->elements[v38].hash == v42)
                  {
                    if ([(value *)self->elements[v38].key isEqual:v39]) {
                      goto LABEL_24;
                    }
                    unint64_t v43 = self->numElements;
                  }
                  if (v38 + 1 == v43) {
                    unint64_t v38 = 0;
                  }
                  else {
                    ++v38;
                  }
                }
                while (v38 != v44);
              }
              goto LABEL_60;
            }
          }
LABEL_24:
          if (v38 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_60;
          }
          id v45 = self->elements[v38].var0;
          if (v45 != *(id *)&v62[8 * v36] && !objc_msgSend(v45, "isEqual:")) {
            goto LABEL_60;
          }
          ++v36;
          unint64_t v35 = self->numElements;
          p_unint64_t numElements = v61;
          if (v36 < v35) {
            continue;
          }
          break;
        }
      }
      goto LABEL_59;
    }
    unint64_t v57 = 0;
    p_id var0 = &self->elements[0].var0;
    do
    {
      uint64_t v46 = [a3 objectForKey:*(p_var0 - 1)];
      if (!v46) {
        break;
      }
      if (*p_var0 != (id)v46)
      {
        LODWORD(v46) = objc_msgSend(*p_var0, "isEqual:");
        if (!v46) {
          break;
        }
      }
      ++v57;
      p_var0 += 3;
      LOBYTE(v46) = 1;
    }
    while (v57 < self->numElements);
  }
  return v46;
}

+ (id)emptyAttributeDictionary
{
  return (id)emptyAttributeDictionary;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4
{
  if (self->numElements)
  {
    unint64_t v4 = 0;
    v5 = self;
    do
    {
      if (a3) {
        *a3++ = v5->elements[0].var0;
      }
      if (a4) {
        *a4++ = v5->elements[0].key;
      }
      ++v4;
      v5 = (NSAttributeDictionary *)((char *)v5 + 24);
    }
    while (v4 < self->numElements);
  }
}

- (void)__apply:(void *)a3 context:(void *)a4
{
  if (a3)
  {
    unint64_t numElements = self->numElements;
    if (numElements)
    {
      uint64_t v7 = 24 * numElements;
      p_id var0 = &self->elements[0].var0;
      do
      {
        ((void (*)(void, id, void *))a3)(*(p_var0 - 1), *p_var0, a4);
        p_var0 += 3;
        v7 -= 24;
      }
      while (v7);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSAttributeDictionary;
    [(NSAttributeDictionary *)&v9 __apply:0 context:a4];
  }
}

- (void)dealloc
{
  if (self->numElements)
  {
    unint64_t v3 = 0;
    p_id var0 = &self->elements[0].var0;
    do
    {

      id v5 = *p_var0;
      p_var0 += 3;

      ++v3;
    }
    while (v3 < self->numElements);
  }
  v6.receiver = self;
  v6.super_class = (Class)NSAttributeDictionary;
  [(NSAttributeDictionary *)&v6 dealloc];
}

- (id)newWithKey:(id)a3 object:(id)a4
{
  id v5 = (value *)a3;
  unint64_t v43 = self;
  if (__NSNumberOfNormalizedKeys == 1)
  {
    for (uint64_t i = 0; i != 60; i += 2)
    {
      if ((id)normalizedKeyInfo[i] == a3)
      {
        uint64_t v7 = normalizedKeyInfo[i + 1];
        goto LABEL_17;
      }
    }
  }
  uint64_t v7 = [a3 hash];
  if (__NSNumberOfNormalizedKeys != 1) {
    goto LABEL_16;
  }
  unint64_t v8 = 0;
  objc_super v9 = normalizedKeyInfo;
  self = v43;
  while (v7 != v9[1])
  {
    char v10 = 1;
LABEL_11:
    if (v8 <= 0x1C)
    {
      ++v8;
      v9 += 2;
      if (v10) {
        continue;
      }
    }
    goto LABEL_17;
  }
  if (([(id)*v9 isEqual:v5] & 1) == 0)
  {
    char v10 = __NSNumberOfNormalizedKeys;
    self = v43;
    goto LABEL_11;
  }
  id v5 = (value *)*v9;
LABEL_16:
  self = v43;
LABEL_17:
  unint64_t numElements = self->numElements;
  if (numElements)
  {
    uint64_t v12 = 0;
    p_key = &self->elements[0].key;
    do
    {
      if (*p_key == v5) {
        goto LABEL_37;
      }
      ++v12;
      p_key += 3;
    }
    while (numElements != v12);
  }
  if (__NSNumberOfNormalizedKeys == 1)
  {
    uint64_t v14 = 0;
    while ((value *)normalizedKeyInfo[v14] != v5)
    {
      v14 += 2;
      if (v14 == 60) {
        goto LABEL_25;
      }
    }
LABEL_35:
    unint64_t v18 = numElements + 1;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    int v19 = 1;
    goto LABEL_48;
  }
LABEL_25:
  if (!numElements) {
    goto LABEL_35;
  }
  id v42 = a4;
  unint64_t v15 = [(value *)v5 hash];
  __n128 v16 = v43;
  unint64_t v17 = v15 % v43->numElements;
  uint64_t v12 = v17;
  while (2)
  {
    if (v16->elements[v12].hash != v15)
    {
LABEL_30:
      if (v12 + 1 == v16->numElements) {
        uint64_t v12 = 0;
      }
      else {
        ++v12;
      }
      if (v12 == v17)
      {
        unint64_t numElements = v16->numElements;
        a4 = v42;
        goto LABEL_35;
      }
      continue;
    }
    break;
  }
  if (([(value *)v16->elements[v12].key isEqual:v5] & 1) == 0)
  {
    __n128 v16 = v43;
    goto LABEL_30;
  }
  a4 = v42;
  self = v43;
  unint64_t numElements = v43->numElements;
LABEL_37:
  if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v18 = numElements + 1;
  }
  else {
    unint64_t v18 = numElements;
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v19 = 1;
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_48;
  }
  id var0 = self->elements[v12].var0;
  if (var0 != a4 && ![var0 isEqual:a4])
  {
    int v19 = 0;
LABEL_48:
    os_unfair_lock_lock((os_unfair_lock_t)&newWithKey_object__tempDictLock);
    if (v18 <= newWithKey_object__tempDictNumElements)
    {
      uint64_t v23 = (void *)newWithKey_object__tempDict;
      if (!newWithKey_object__tempDict) {
        goto LABEL_57;
      }
    }
    else
    {
      newWithKey_object__tempDictNumElements = v18;
      if (newWithKey_object__tempDict) {
        NSDeallocateObject((id)newWithKey_object__tempDict);
      }
      uint64_t v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSAllocateObject(v22, 24 * newWithKey_object__tempDictNumElements - 24, 0);
      newWithKey_object__tempDict = (uint64_t)v23;
      if (!v23)
      {
LABEL_57:
        os_unfair_lock_lock_with_options();
        uint64_t v26 = [(id)attributeDictionaryTable member:newWithKey_object__tempDict];
        if (v26)
        {
          uint64_t v27 = (void *)v26;
          os_unfair_lock_unlock((os_unfair_lock_t)&newWithKey_object__tempDictLock);
          id v28 = v27;
        }
        else
        {
          os_unfair_lock_unlock((os_unfair_lock_t)&attributeDictionaryLock);
          __n128 v29 = (objc_class *)objc_opt_class();
          __n128 v30 = (char *)NSAllocateObject(v29, 24 * v18 - 24, 0);
          uint64_t v27 = v30;
          *((void *)v30 + 1) = v18;
          if (v18)
          {
            uint64_t v31 = 0;
            double v32 = v30 + 16;
            do
            {
              uint64_t v33 = newWithKey_object__tempDict + 16;
              unint64_t v34 = *(void *)(newWithKey_object__tempDict + 16 + 24 * v31);
              unint64_t v35 = v34 % v18;
              while (1)
              {
                unint64_t v36 = &v32[24 * v35];
                uint64_t v38 = *((void *)v36 + 1);
                v37 = v36 + 8;
                if (!v38) {
                  break;
                }
                if (v35 + 1 == v18) {
                  unint64_t v35 = 0;
                }
                else {
                  ++v35;
                }
              }
              v39 = &v32[24 * v35];
              *(void *)v39 = v34;
              void *v37 = [*(id *)(v33 + 24 * v31 + 8) copyWithZone:0];
              *((void *)v39 + 2) = *(id *)(newWithKey_object__tempDict + 16 + 24 * v31++ + 16);
            }
            while (v31 != v18);
          }
          os_unfair_lock_lock_with_options();
          v40 = (void *)[(id)attributeDictionaryTable member:newWithKey_object__tempDict];
          os_unfair_lock_unlock((os_unfair_lock_t)&newWithKey_object__tempDictLock);
          if (v40)
          {
            id v41 = v40;
            os_unfair_lock_unlock((os_unfair_lock_t)&attributeDictionaryLock);
            [v27 dealloc];
            return v40;
          }
          [(id)attributeDictionaryTable addObject:v27];
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&attributeDictionaryLock);
        return v27;
      }
    }
    v23[1] = v18;
    memmove(v23 + 2, v43->elements, 24 * v43->numElements);
    uint64_t v24 = newWithKey_object__tempDict + 16;
    if (v19)
    {
      uint64_t v12 = v18 - 1;
      uint64_t v25 = (uint64_t *)(v24 + 24 * (v18 - 1));
      uint64_t *v25 = v7;
      v25[1] = (uint64_t)v5;
    }
    *(void *)(v24 + 24 * v12 + 16) = a4;
    goto LABEL_57;
  }

  return v43;
}

+ (void)initialize
{
  v8[30] = *MEMORY[0x1E4F143B8];
  if (!attributeDictionaryClass)
  {
    uint64_t v2 = objc_opt_class();
    if (v2 == objc_opt_class())
    {
      attributeDictionaryClass Class = objc_opt_class();
      tempAttributeDictionaryClass Class = objc_opt_class();
      unint64_t v3 = (void *)[MEMORY[0x1E4F28F58] pointerFunctionsWithOptions:5];
      [v3 setIsEqualFunction:attributeDictionaryIsEqual];
      [v3 setDescriptionFunction:attributeDictionaryDescribe];
      [v3 setHashFunction:attributeDictionaryHash];
      uint64_t v4 = 0;
      v8[0] = @"NSFont";
      v8[1] = @"NSParagraphStyle";
      v8[2] = @"NSOriginalFont";
      v8[3] = NSGlyphInfoAttributeName;
      v8[4] = @"NSStrikethrough";
      v8[5] = @"NSUnderline";
      v8[6] = @"CTVerticalForms";
      v8[7] = @"NSLigature";
      v8[8] = @"NSKern";
      v8[9] = NSLanguageAttributeName;
      v8[10] = @"NSStrokeColor";
      v8[11] = @"NSBackgroundColor";
      v8[12] = @"NSShadow";
      v8[13] = @"NSColor";
      v8[14] = @"NSStrikethroughColor";
      v8[15] = @"NSUnderlineColor";
      v8[16] = @"NSAttachment";
      v8[17] = @"NSBaselineOffset";
      v8[18] = @"NSExpansion";
      v8[19] = @"NSWritingDirection";
      uint64_t v5 = *MEMORY[0x1E4F24740];
      v8[20] = @"NSSuperScript";
      v8[21] = v5;
      v8[22] = @"NSStrokeWidth";
      v8[23] = @"NSObliqueness";
      v8[24] = @"NSTextEffect";
      v8[25] = NSTemporaryTextCorrectionAttributeName;
      v8[26] = @"NSLink";
      v8[27] = @"NSTextAlternativesDisplayStyle";
      __NSNumberOfNormalizedKeys = 1;
      objc_super v6 = &qword_1EB2A5950;
      v8[28] = @"NSTextAlternatives";
      v8[29] = @"NSMarkedTextStyleAttributeName";
      do
      {
        uint64_t v7 = (void *)v8[v4];
        *(v6 - 1) = (uint64_t)v7;
        *objc_super v6 = [v7 hash];
        v6 += 2;
        ++v4;
      }
      while (v4 != 30);
      attributeDictionaryTable = [objc_alloc(MEMORY[0x1E4F28D30]) initWithPointerFunctions:v3 capacity:0];
      emptyAttributeDictionary = +[NSAttributeDictionary newWithDictionary:](NSAttributeDictionary, "newWithDictionary:", [MEMORY[0x1E4F1C9E8] dictionary]);
    }
  }
}

@end