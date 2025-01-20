@interface SSFamilyCircle
- (NSArray)familyMembers;
- (NSArray)iTunesAccountNames;
- (SSFamilyCircle)initWithCacheRepresentation:(id)a3;
- (SSFamilyCircle)initWithXPCEncoding:(id)a3;
- (id)allITunesAccountNames;
- (id)allITunesIdentifiers;
- (id)copyXPCEncoding;
- (id)newCacheRepresentation;
- (void)setFamilyMembers:(id)a3;
- (void)setITunesAccountNames:(id)a3;
@end

@implementation SSFamilyCircle

- (id)allITunesIdentifiers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_familyMembers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "iTunesIdentifier", (void)v11);
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)allITunesAccountNames
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:self->_iTunesAccountNames];
}

- (SSFamilyCircle)initWithCacheRepresentation:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v35.receiver = self;
    v35.super_class = (Class)SSFamilyCircle;
    uint64_t v5 = [(SSFamilyCircle *)&v35 init];
    if (v5)
    {
      uint64_t v6 = [v4 objectForKey:@"family"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v8 = v6;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v32;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v32 != v11) {
                objc_enumerationMutation(v8);
              }
              long long v13 = [[SSFamilyMember alloc] initWithCacheRepresentation:*(void *)(*((void *)&v31 + 1) + 8 * v12)];
              if (v13) {
                [v7 addObject:v13];
              }

              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v37 count:16];
          }
          while (v10);
        }

        uint64_t v14 = [v7 copy];
        familyMembers = v5->_familyMembers;
        v5->_familyMembers = (NSArray *)v14;
      }
      uint64_t v16 = [v4 objectForKey:@"accountNames"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v18 = v16;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v36 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v28;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v28 != v21) {
                objc_enumerationMutation(v18);
              }
              uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * v22);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                objc_msgSend(v17, "addObject:", v23, (void)v27);
              }
              ++v22;
            }
            while (v20 != v22);
            uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v36 count:16];
          }
          while (v20);
        }

        uint64_t v24 = [v17 copy];
        iTunesAccountNames = v5->_iTunesAccountNames;
        v5->_iTunesAccountNames = (NSArray *)v24;
      }
    }
  }
  else
  {

    uint64_t v5 = 0;
  }

  return v5;
}

- (id)newCacheRepresentation
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  iTunesAccountNames = self->_iTunesAccountNames;
  if (iTunesAccountNames) {
    [v3 setObject:iTunesAccountNames forKey:@"accountNames"];
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = self->_familyMembers;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "newCacheRepresentation", (void)v14);
        if (v12) {
          [v6 addObject:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  if ([v6 count]) {
    [v4 setObject:v6 forKey:@"family"];
  }

  return v4;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_familyMembers);
  SSXPCDictionarySetObject(v3, "1", self->_iTunesAccountNames);
  return v3;
}

- (SSFamilyCircle)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v17.receiver = self;
    v17.super_class = (Class)SSFamilyCircle;
    id v6 = [(SSFamilyCircle *)&v17 init];
    if (v6)
    {
      uint64_t v8 = xpc_dictionary_get_value(v5, "0");
      uint64_t v9 = (void *)v8;
      uint64_t v10 = MEMORY[0x1E4F14568];
      if (v8 && MEMORY[0x1A62689E0](v8) == v10)
      {
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = (NSArray *)SSXPCCreateNSArrayFromXPCEncodedArray(v9, v11);
        familyMembers = v6->_familyMembers;
        v6->_familyMembers = v12;
      }
      xpc_dictionary_get_value(v5, "1");
      CFDictionaryRef v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      if (v14 && MEMORY[0x1A62689E0](v14) == v10)
      {
        CFArrayRef v15 = SSXPCCreateCFObjectFromXPCObject(v14);
        iTunesAccountNames = v6->_iTunesAccountNames;
        v6->_iTunesAccountNames = (NSArray *)v15;
      }
    }
  }
  else
  {

    id v6 = 0;
  }

  return v6;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
}

- (NSArray)iTunesAccountNames
{
  return self->_iTunesAccountNames;
}

- (void)setITunesAccountNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesAccountNames, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
}

@end