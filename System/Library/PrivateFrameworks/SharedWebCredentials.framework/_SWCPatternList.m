@interface _SWCPatternList
+ (BOOL)supportsSecureCoding;
+ (id)patternListWithArray:(id)a3;
+ (id)patternListWithDetailsDictionary:(id)a3;
+ (id)patternListWithDetailsDictionary:(id)a3 defaults:(id)a4;
- (BOOL)isEqual:(id)a3;
- (_SWCPatternList)initWithCoder:(id)a3;
- (id)_descriptionDebug:(BOOL)a3 redacted:(BOOL)a4;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (unint64_t)count;
- (unint64_t)evaluateWithURLComponents:(id)a3 substitutionVariables:(id)a4 auditToken:(id *)a5 matchingPattern:(id *)a6 index:(unint64_t *)a7;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumeratePatternsWithBlock:(id)a3;
@end

@implementation _SWCPatternList

+ (id)patternListWithDetailsDictionary:(id)a3
{
  return (id)[a1 patternListWithDetailsDictionary:a3 defaults:MEMORY[0x1E4F1CC08]];
}

+ (id)patternListWithDetailsDictionary:(id)a3 defaults:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = (void *)MEMORY[0x1AD1157F0]();
  if ((_NSIsNSDictionary() & 1) == 0) {
    goto LABEL_28;
  }
  v7 = [a3 objectForKeyedSubscript:@"defaults"];
  if (_NSIsNSDictionary())
  {
    if ([v5 count])
    {
      id v8 = (id)[v5 mutableCopy];
      [v8 addEntriesFromDictionary:v7];
    }
    else
    {
      id v8 = v7;
    }

    id v5 = v8;
  }

  v9 = [a3 objectForKeyedSubscript:@"components"];
  if (_NSIsNSArray())
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = [[_SWCPattern alloc] initWithDictionary:*(void *)(*((void *)&v29 + 1) + 8 * i) defaults:v5];
          [v10 addObject:v15];
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v12);
    }
  }
  else
  {
    v16 = [a3 objectForKeyedSubscript:@"paths"];
    if ((_NSIsNSArray() & 1) == 0)
    {

      goto LABEL_28;
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = v16;
    uint64_t v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16, v16);
    if (v17)
    {
      uint64_t v18 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v11);
          }
          v20 = [[_SWCPattern alloc] initWithPathPattern:*(void *)(*((void *)&v25 + 1) + 8 * j) defaults:v5];
          [v10 addObject:v20];
        }
        uint64_t v17 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v17);
    }
  }
  if (v10)
  {
    v21 = [v10 array];
    v22 = [a1 patternListWithArray:v21];

    goto LABEL_29;
  }
LABEL_28:
  v22 = 0;
LABEL_29:

  return v22;
}

+ (id)patternListWithArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = (SWCPatternStorage *)[*(id *)(*((void *)&v15 + 1) + 8 * i) storage];
        [v6 appendBytes:v11 length:SWCPatternStorage::getSize(v11)];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if (qword_1EB67B040 != -1) {
    dispatch_once(&qword_1EB67B040, &__block_literal_global);
  }
  [v6 appendBytes:&_MergedGlobals length:SWCPatternStorage::getSize((SWCPatternStorage *)&_MergedGlobals)];
  Instance = (char *)class_createInstance((Class)a1, [v6 length]);
  if (!Instance)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"SWCPattern.mm", 489, @"Failed to allocate pattern list object with %lu extra bytes.", objc_msgSend(v6, "length"));
  }
  objc_msgSend(v6, "getBytes:range:", Instance + 8, 0, objc_msgSend(v6, "length"));

  return Instance;
}

- (unint64_t)count
{
  storage = self->_storage;
  if ((~*(unsigned char *)self->_storage & 0x18) == 0) {
    return 0;
  }
  unint64_t v3 = 0;
  do
  {
    ++v3;
    storage = (SWCPatternStorage *)((char *)storage + SWCPatternStorage::getSize(storage));
  }
  while ((~*(unsigned char *)storage & 0x18) != 0);
  return v3;
}

- (void)enumeratePatternsWithBlock:(id)a3
{
  id v5 = [[_SWCPattern alloc] _initWithPatternStorageNoCopy:0 freeWhenDone:0];
  uint64_t v6 = 0;
  storage = self->_storage;
  char v9 = 0;
  do
  {
    if ((~*(unsigned char *)storage & 0x18) == 0) {
      break;
    }
    uint64_t v8 = (void *)MEMORY[0x1AD1157F0]();
    [v5 setStorage:storage];
    (*((void (**)(id, id, uint64_t, char *))a3 + 2))(a3, v5, v6, &v9);
    ++v6;
    storage = (SWCPatternStorage *)((char *)storage + SWCPatternStorage::getSize(storage));
  }
  while (!v9);
}

- (unint64_t)evaluateWithURLComponents:(id)a3 substitutionVariables:(id)a4 auditToken:(id *)a5 matchingPattern:(id *)a6 index:(unint64_t *)a7
{
  v18[0] = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  id v21 = a4;
  int v22 = 0;
  memset(v23, 0, sizeof(v23));
  int v24 = 1065353216;
  char v25 = 0;
  ++_SWCDiagnosticStorage;
  SWCPatternStorage v13 = self->_storage[0];
  storage = self->_storage;
  if ((~*(_DWORD *)&v13 & 0x18) != 0)
  {
    unint64_t v14 = 0;
    while (1)
    {
      unint64_t v15 = SWCPatternStorage::evaluate(storage, (NSURLComponents *)a3, (const SWCFNMatch *)v18, (const audit_token_t *)a5);
      if (v15) {
        break;
      }
      ++v14;
      storage = (SWCPatternStorage *)((char *)storage + SWCPatternStorage::getSize(storage));
      if ((~*(unsigned char *)storage & 0x18) == 0) {
        goto LABEL_5;
      }
    }
    if (a6)
    {
      id v16 = [[_SWCPattern alloc] _initWithPatternStorageNoCopy:storage freeWhenDone:0];
      goto LABEL_9;
    }
  }
  else
  {
LABEL_5:
    id v16 = 0;
    unint64_t v15 = 0;
    unint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    if (a6) {
LABEL_9:
    }
      *a6 = v16;
  }
  if (a7) {
    *a7 = v14;
  }
  std::__hash_table<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::__unordered_map_hasher<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::hash<std::string_view>,std::equal_to<std::string_view>,true>,std::__unordered_map_equal<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::equal_to<std::string_view>,std::hash<std::string_view>,true>,std::allocator<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>>>::~__hash_table((uint64_t)v23);

  return v15;
}

- (id)_descriptionDebug:(BOOL)a3 redacted:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  storage = self->_storage;
  if ((~*(unsigned char *)self->_storage & 0x18) != 0)
  {
    do
    {
      id v9 = +[_SWCPattern _debug:v5 descriptionOfStorage:storage forObject:0 redacted:v4];
      [v7 addObject:v9];

      storage = (SWCPatternStorage *)((char *)storage + SWCPatternStorage::getSize(storage));
    }
    while ((~*(unsigned char *)storage & 0x18) != 0);
  }
  if (v5)
  {
    id v10 = [NSString alloc];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v7 componentsJoinedByString:@", "];
    SWCPatternStorage v13 = (void *)[v10 initWithFormat:@"<%@ %p> %@", v11, self, v12];
  }
  else
  {
    SWCPatternStorage v13 = [v7 componentsJoinedByString:@", "];
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  SWCPatternStorage v6 = self->_storage[0];
  storage = self->_storage;
  id v7 = (SWCPatternStorage *)((char *)a3 + 8);
  if ((~*(_DWORD *)&v6 & 0x18) != 0)
  {
    size_t v8 = 0;
    id v10 = storage;
    do
    {
      uint64_t Size = SWCPatternStorage::getSize(v10);
      v8 += Size;
      id v10 = (SWCPatternStorage *)((char *)v10 + Size);
    }
    while ((~*(unsigned char *)v10 & 0x18) != 0);
  }
  else
  {
    size_t v8 = 0;
  }
  if ((~*(unsigned char *)v7 & 0x18) != 0)
  {
    uint64_t v12 = 0;
    SWCPatternStorage v13 = v7;
    do
    {
      uint64_t v14 = SWCPatternStorage::getSize(v13);
      v12 += v14;
      SWCPatternStorage v13 = (SWCPatternStorage *)((char *)v13 + v14);
    }
    while ((~*(unsigned char *)v13 & 0x18) != 0);
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v8 == v12 && memcmp(storage, v7, v8) == 0;
}

- (unint64_t)hash
{
  storage = self->_storage;
  if ((~*(unsigned char *)self->_storage & 0x18) == 0) {
    return 0;
  }
  unint64_t v3 = 0;
  do
  {
    unint64_t Size = SWCPatternStorage::getSize(storage);
    v3 ^= std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)storage, Size);
    storage = (SWCPatternStorage *)((char *)storage + Size);
  }
  while ((~*(unsigned char *)storage & 0x18) != 0);
  return v3;
}

- (id)description
{
  return [(_SWCPatternList *)self _descriptionDebug:0 redacted:0];
}

- (id)debugDescription
{
  return [(_SWCPatternList *)self _descriptionDebug:1 redacted:0];
}

- (id)redactedDescription
{
  return [(_SWCPatternList *)self _descriptionDebug:0 redacted:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL v5 = (void *)MEMORY[0x1AD1157F0](self, a2);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  SWCPatternStorage v8 = self->_storage[0];
  storage = self->_storage;
  if ((~*(_DWORD *)&v8 & 0x18) != 0)
  {
    do
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:storage length:SWCPatternStorage::getSize(storage) freeWhenDone:0];
      if (v9) {
        [v6 addObject:v9];
      }

      storage = (SWCPatternStorage *)((char *)storage + SWCPatternStorage::getSize(storage));
    }
    while ((~*(unsigned char *)storage & 0x18) != 0);
  }
  id v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:0];
  if (v10) {
    [a3 encodeObject:v10 forKey:@"patternData"];
  }
}

- (_SWCPatternList)initWithCoder:(id)a3
{
  long long v28 = self;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1AD1157F0](self, a2);
  BOOL v4 = objc_msgSend(a3, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), @"patternData");
  BOOL v5 = v4;
  if (!v4)
  {

    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    v35[0] = @"Line";
    v35[1] = @"Function";
    v36[0] = &unk_1F0345818;
    id v26 = [NSString stringWithUTF8String:"-[_SWCPatternList initWithCoder:]"];
    v36[1] = v26;
    long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    long long v29 = objc_msgSend(v22, "initWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4865);
    objc_msgSend(a3, "failWithError:");
    id v21 = 0;
LABEL_29:

    goto LABEL_30;
  }
  id v34 = 0;
  id v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v34];
  id v26 = v34;
  long long v27 = v6;
  if (v6)
  {
    if (_NSIsNSArray())
    {
      long long v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA70]), "initWithCapacity:", objc_msgSend(v6, "count"));
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (!v8) {
        goto LABEL_24;
      }
      uint64_t v9 = *(void *)v31;
      while (1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (_NSIsNSData())
          {
            size_t v12 = [v11 length];
            uint64_t v13 = [v11 bytes];
            if (v12)
            {
              uint64_t v14 = (const void *)v13;
              if (v12 + 4 < 0x401)
              {
                unint64_t v15 = (SWCPatternStorage *)v40;
              }
              else
              {
                unint64_t v15 = (SWCPatternStorage *)malloc_type_malloc(v12 + 4, 0x7E3352D0uLL);
                if (!v15) {
                  continue;
                }
              }
              memcpy(v15, v14, v12);
              *(SWCPatternStorage *)((char *)v15 + v12) = 0;
              uint64_t Size = SWCPatternStorage::getSize(v15);
              if (v15 != (SWCPatternStorage *)v40) {
                free(v15);
              }
              BOOL v17 = Size == v12;
              BOOL v4 = v5;
              if (v17)
              {
                id v18 = [[_SWCPattern alloc] _initWithPatternStorageNoCopy:v14 freeWhenDone:0];
                if (v18) {
                  [v29 addObject:v18];
                }
              }
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v39 count:16];
        if (!v8)
        {
LABEL_24:

          uint64_t v19 = objc_opt_class();
          uint64_t v20 = [v29 array];
          id v21 = [v19 patternListWithArray:v20];
          goto LABEL_28;
        }
      }
    }

    id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
    v37[0] = @"Line";
    v37[1] = @"Function";
    v38[0] = &unk_1F0345800;
    long long v29 = [NSString stringWithUTF8String:"-[_SWCPatternList initWithCoder:]"];
    v38[1] = v29;
    uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
    long long v28 = (_SWCPatternList *)[v23 initWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:v20];
    objc_msgSend(a3, "failWithError:");
    id v21 = 0;
LABEL_28:

    goto LABEL_29;
  }

  [a3 failWithError:v26];
  id v21 = 0;

LABEL_30:
  return v21;
}

@end