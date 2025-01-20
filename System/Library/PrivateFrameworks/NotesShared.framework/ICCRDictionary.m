@interface ICCRDictionary
- (BOOL)isEqual:(id)a3;
- (ICCRDictionary)init;
- (ICCRDictionary)initWithDocument:(id)a3;
- (ICCRDictionary)initWithICCRCoder:(id)a3;
- (ICCRDictionary)initWithICCRCoder:(id)a3 dictionary:(const void *)a4;
- (ICCRDictionary)initWithICCRCoder:(id)a3 dictionary:(const void *)a4 elementValueDecoder:(id)a5;
- (ICCRDocument)document;
- (NSMapTable)contents;
- (NSString)description;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (int64_t)removeClock;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)encodeWithICCRCoder:(id)a3;
- (void)encodeWithICCRCoder:(id)a3 dictionary:(void *)a4;
- (void)encodeWithICCRCoder:(id)a3 dictionary:(void *)a4 elementValueCoder:(id)a5;
- (void)enumerateKeysObjectsAndTimestampsUsingBlock:(id)a3;
- (void)mergeWith:(id)a3;
- (void)mergeWithDictionary:(id)a3;
- (void)realizeLocalChangesIn:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setContents:(id)a3;
- (void)setDocument:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setRemoveClock:(int64_t)a3;
- (void)walkGraph:(id)a3;
@end

@implementation ICCRDictionary

- (unint64_t)count
{
  v2 = [(ICCRDictionary *)self contents];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSMapTable)contents
{
  return self->_contents;
}

- (ICCRDictionary)initWithDocument:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCRDictionary;
  v5 = [(ICCRDictionary *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    contents = v5->_contents;
    v5->_contents = (NSMapTable *)v6;

    objc_storeWeak((id *)&v5->_document, v4);
  }

  return v5;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = [(ICCRDictionary *)self contents];
  uint64_t v6 = [v5 objectForKey:v4];
  v7 = [v6 value];

  return v7;
}

- (void)walkGraph:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(ICCRDictionary *)self contents];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v4[2](v4, v9);
        v10 = [(ICCRDictionary *)self contents];
        v11 = [v10 objectForKey:v9];
        v12 = [v11 value];
        ((void (**)(id, void *))v4)[2](v4, v12);
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)setDocument:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_storeWeak((id *)&self->_document, v4);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = [(ICCRDictionary *)self contents];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * v8);
        v10 = [(ICCRDictionary *)self contents];
        v11 = [v10 objectForKey:v9];

        v12 = [v11 value];
        long long v13 = [v4 localObject:v12];

        if (v13)
        {
          long long v14 = [v11 value];
          BOOL v15 = v14 == v13;

          if (!v15) {
            [v11 setValue:v13];
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

void __67__ICCRDictionary_initWithICCRCoder_dictionary_elementValueDecoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  if (v2)
  {
    unint64_t v3 = v2;
    for (unint64_t i = 0; i < v3; i += 2)
    {
      v5 = [*(id *)(a1 + 40) contents];
      uint64_t v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i + 1];
      uint64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      [v5 setObject:v6 forKey:v7];
    }
  }
}

- (ICCRDictionary)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 6)
  {
    uint64_t v6 = [(ICCRDictionary *)self initWithICCRCoder:v4 dictionary:*(void *)(v5 + 40)];
  }
  else
  {
    uint64_t v7 = [v4 document];
    uint64_t v6 = [(ICCRDictionary *)self initWithDocument:v7];
  }
  uint64_t v8 = v6;

  return v8;
}

- (ICCRDictionary)initWithICCRCoder:(id)a3 dictionary:(const void *)a4 elementValueDecoder:(id)a5
{
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void, id *, id))a5;
  v10 = [v8 document];
  v11 = [(ICCRDictionary *)self initWithDocument:v10];

  if (v11)
  {
    v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*((int *)a4 + 12)];
    if (*((_DWORD *)a4 + 12))
    {
      for (unint64_t i = (uint64_t *)*((void *)a4 + 5); i != (uint64_t *)(*((void *)a4 + 5) + 8 * *((int *)a4 + 12)); ++i)
      {
        uint64_t v14 = *i;
        id v28 = 0;
        BOOL v15 = v9[2](v9, v14, &v28, v8);
        id v16 = v28;
        long long v17 = v16;
        if ((*(unsigned char *)(v14 + 32) & 4) != 0)
        {
          long long v19 = [ICCRVectorTimestamp alloc];
          v20 = v19;
          uint64_t v21 = *(void *)(v14 + 56);
          if (!v21) {
            uint64_t v21 = *(void *)(CRDT::Dictionary_Element::default_instance((CRDT::Dictionary_Element *)v19) + 56);
          }
          long long v18 = [(ICCRVectorTimestamp *)v20 initWithProtobufTimestamp:v21 decoder:v8];
          if (!v17) {
            goto LABEL_11;
          }
        }
        else
        {
          long long v18 = 0;
          if (!v16) {
            goto LABEL_11;
          }
        }
        v22 = [[ICCRDictionaryElement alloc] initWithValue:v15 timestamp:v18];
        [v12 addObject:v17];
        [v12 addObject:v22];

LABEL_11:
      }
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __67__ICCRDictionary_initWithICCRCoder_dictionary_elementValueDecoder___block_invoke;
    v25[3] = &unk_1E64A6D18;
    id v23 = v12;
    id v26 = v23;
    v27 = v11;
    [v8 addDecoderCompletionHandler:v25 dependency:0 for:v27];
  }
  return v11;
}

- (ICCRDictionary)initWithICCRCoder:(id)a3 dictionary:(const void *)a4
{
  return [(ICCRDictionary *)self initWithICCRCoder:a3 dictionary:a4 elementValueDecoder:&__block_literal_global_88];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = [(ICCRDictionary *)self contents];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (ICCRDictionary)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICCRDictionary;
  uint64_t v2 = [(ICCRDictionary *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    contents = v2->_contents;
    v2->_contents = (NSMapTable *)v3;
  }
  return v2;
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 currentDocumentObjectForEncoding];
  uint64_t v5 = v4;
  if (*(_DWORD *)(v4 + 48) != 6)
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 6;
    operator new();
  }
  [(ICCRDictionary *)self encodeWithICCRCoder:v6 dictionary:*(void *)(v4 + 40)];
}

- (void)encodeWithICCRCoder:(id)a3 dictionary:(void *)a4
{
}

void __49__ICCRDictionary_encodeWithICCRCoder_dictionary___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v12 = a2;
  id v8 = a3;
  id v9 = a5;
  if (v8 && [v8 conformsToProtocol:&unk_1F1F737E0])
  {
    *(_DWORD *)(a4 + 32) |= 2u;
    uint64_t v10 = *(void *)(a4 + 48);
    if (!v10) {
      operator new();
    }
    [v9 encodeObject:v8 forObjectID:v10];
  }
  *(_DWORD *)(a4 + 32) |= 1u;
  uint64_t v11 = *(void *)(a4 + 40);
  if (!v11) {
    operator new();
  }
  [v9 encodeObject:v12 forObjectID:v11];
}

- (void)encodeWithICCRCoder:(id)a3 dictionary:(void *)a4 elementValueCoder:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, void *, uint64_t, id))a5;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v26 = self;
  id obj = [(ICCRDictionary *)self contents];
  uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    uint64_t v25 = *(void *)v28;
    id v23 = (google::protobuf::internal::RepeatedPtrFieldBase *)((char *)a4 + 40);
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        int v13 = *((_DWORD *)a4 + 13);
        uint64_t v14 = *((int *)a4 + 12);
        if ((int)v14 >= v13)
        {
          if (v13 == *((_DWORD *)a4 + 14)) {
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)v23, v13 + 1);
          }
          google::protobuf::internal::GenericTypeHandler<CRDT::Dictionary_Element>::New();
        }
        uint64_t v15 = *((void *)a4 + 5);
        *((_DWORD *)a4 + 12) = v14 + 1;
        uint64_t v16 = *(void *)(v15 + 8 * v14);
        long long v17 = [(ICCRDictionary *)v26 contents];
        long long v18 = [v17 objectForKey:v12];

        long long v19 = [v18 value];
        v9[2](v9, v12, v19, v16, v8);

        v20 = [v18 timestamp];
        uint64_t v21 = v20;
        *(_DWORD *)(v16 + 32) |= 4u;
        uint64_t v22 = *(void *)(v16 + 56);
        if (!v22) {
          operator new();
        }
        [v20 encodeIntoProtobufTimestamp:v22 coder:v8];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }
}

- (id)keyEnumerator
{
  uint64_t v2 = [(ICCRDictionary *)self contents];
  uint64_t v3 = [v2 keyEnumerator];

  return v3;
}

- (void)enumerateKeysObjectsAndTimestampsUsingBlock:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, uint64_t, uint64_t, void *, char *))a3;
  char v18 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [(ICCRDictionary *)self contents];
  uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
      id v9 = [(ICCRDictionary *)self contents];
      uint64_t v10 = [v9 objectForKey:v8];

      uint64_t v11 = [v10 value];
      uint64_t v12 = [v10 timestamp];
      v4[2](v4, v8, v11, v12, &v18);

      LOBYTE(v11) = v18 == 0;
      if ((v11 & 1) == 0) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (unint64_t)hash
{
  uint64_t v2 = [(ICCRDictionary *)self contents];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(ICCRDictionary *)self contents];
    uint64_t v6 = [v4 contents];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(ICCRDictionary *)self contents];
    id v9 = [v8 objectForKey:v7];

    if (v9)
    {
      uint64_t v10 = (ICCRDictionaryElement *)os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_DEBUG)) {
        -[ICCRDictionary setObject:forKey:](&v10->super);
      }
    }
    else
    {
      uint64_t v10 = [[ICCRDictionaryElement alloc] initWithValue:v6];
      uint64_t v11 = [(ICCRDictionary *)self document];
      uint64_t v12 = [v11 replicaClock];

      int v13 = [(ICCRDictionaryElement *)v10 timestamp];
      long long v14 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
      [v13 setClock:v12 + 1 forUUID:v14];

      long long v15 = [(ICCRDictionary *)self contents];
      [v15 setObject:v10 forKey:v7];

      long long v16 = [(ICCRDictionary *)self document];
      [v16 setDocumentFor:v7];

      long long v17 = [(ICCRDictionary *)self document];
      [v17 setDocumentFor:v6];
    }
  }
  else
  {
    [(ICCRDictionary *)self removeObjectForKey:v7];
  }
}

- (id)objectForKeyedSubscript:(id)a3
{
  unint64_t v3 = [(ICCRDictionary *)self objectForKey:a3];
  return v3;
}

- (void)removeObjectForKey:(id)a3
{
  id v6 = a3;
  id v4 = [(ICCRDictionary *)self contents];
  [v4 removeObjectForKey:v6];

  uint64_t v5 = [(ICCRDictionary *)self document];
  -[ICCRDictionary setRemoveClock:](self, "setRemoveClock:", [v5 replicaClock] + 1);
}

- (void)removeAllObjects
{
  id v3 = [(ICCRDictionary *)self contents];
  [v3 removeAllObjects];

  id v4 = [(ICCRDictionary *)self document];
  -[ICCRDictionary setRemoveClock:](self, "setRemoveClock:", [v4 replicaClock] + 1);
}

- (void)realizeLocalChangesIn:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(ICCRDictionary *)self contents];
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v25;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v24 + 1) + 8 * v7);
        id v9 = [(ICCRDictionary *)self contents];
        uint64_t v10 = [v9 objectForKey:v8];

        uint64_t v11 = [v10 timestamp];
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
        uint64_t v13 = [v11 clockForUUID:v12];

        if (v13 >= 1)
        {
          long long v14 = [v10 timestamp];
          long long v15 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
          [v14 removeUUID:v15];

          long long v16 = [v10 timestamp];
          long long v17 = [v4 replica];
          [v16 setClock:v13 forUUID:v17];

          uint64_t v18 = [v4 unserializedReplicaClock];
          if (v18 <= v13) {
            uint64_t v19 = v13;
          }
          else {
            uint64_t v19 = v18;
          }
          [v4 setUnserializedReplicaClock:v19];
        }

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v5);
  }

  if ([(ICCRDictionary *)self removeClock] >= 1)
  {
    uint64_t v20 = [v4 unserializedReplicaClock];
    int64_t v21 = [(ICCRDictionary *)self removeClock];
    if (v20 <= v21) {
      int64_t v22 = v21;
    }
    else {
      int64_t v22 = v20;
    }
    [v4 setUnserializedReplicaClock:v22];
  }
  [(ICCRDictionary *)self setRemoveClock:0];
}

- (void)mergeWith:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"Invalid merge, classes must be equal for merge.", 0 reason userInfo];
    objc_exception_throw(v4);
  }
  [(ICCRDictionary *)self mergeWithDictionary:v5];
}

- (void)mergeWithDictionary:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v39 = a3;
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [(ICCRDictionary *)self contents];
  uint64_t v4 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v49;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v49 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v48 + 1) + 8 * v6);
        uint64_t v8 = [(ICCRDictionary *)self contents];
        id v9 = [v8 objectForKey:v7];

        uint64_t v10 = [v39 contents];
        uint64_t v11 = [v10 objectForKey:v7];

        if (v11)
        {
          [v9 mergeWith:v11];
        }
        else
        {
          uint64_t v12 = [v9 timestamp];
          uint64_t v13 = [v39 document];
          long long v14 = [v13 version];
          [v12 minusVectorTimestamp:v14];

          long long v15 = [v9 timestamp];
          LODWORD(v12) = [v15 count] == 0;

          if (v12) {
            [v35 addObject:v7];
          }
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v4);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obja = v35;
  uint64_t v16 = [obja countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v45;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v45 != v17) {
          objc_enumerationMutation(obja);
        }
        uint64_t v19 = *(void *)(*((void *)&v44 + 1) + 8 * v18);
        uint64_t v20 = [(ICCRDictionary *)self contents];
        [v20 removeObjectForKey:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [obja countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v16);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v36 = [v39 contents];
  uint64_t v21 = [v36 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v41;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v36);
        }
        uint64_t v24 = *(void *)(*((void *)&v40 + 1) + 8 * v23);
        long long v25 = [(ICCRDictionary *)self contents];
        long long v26 = [v25 objectForKey:v24];
        BOOL v27 = v26 == 0;

        if (v27)
        {
          long long v28 = [v39 contents];
          uint64_t v29 = [v28 objectForKey:v24];

          long long v30 = [(ICCRDictionary *)self document];
          v31 = [v30 version];
          uint64_t v32 = [v29 timestamp];
          BOOL v33 = ([v31 compare:v32] & 1) == 0;

          if (!v33)
          {
            v34 = [(ICCRDictionary *)self contents];
            [v34 setObject:v29 forKey:v24];
          }
        }
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v36 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v21);
  }
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v21 = a4;
  uint64_t v20 = [[ICCRDictionary alloc] initWithDocument:v21];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(ICCRDictionary *)self contents];
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v10 = [(ICCRDictionary *)self contents];
        uint64_t v11 = [v10 objectForKey:v9];

        uint64_t v12 = [v11 timestamp];
        uint64_t v13 = (void *)[v12 copy];

        [v13 minusVectorTimestamp:v5];
        long long v14 = [v11 value];
        long long v15 = [v14 deltaSince:v5 in:v21];

        uint64_t v16 = objc_alloc_init(ICCRDictionaryElement);
        [(ICCRDictionaryElement *)v16 setValue:v15];
        [(ICCRDictionaryElement *)v16 setTimestamp:v13];
        uint64_t v17 = [(ICCRDictionary *)v20 contents];
        [v17 setObject:v16 forKey:v9];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  return v20;
}

- (NSString)description
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(ICCRDictionary *)self count])
  {
    id v3 = (void *)MEMORY[0x1E4F28E78];
    uint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    uint64_t v6 = objc_msgSend(v3, "stringWithFormat:", @"<%@ %p (\n"), v5, self;

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = [(ICCRDictionary *)self contents];
    uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v11 = [(ICCRDictionary *)self contents];
          uint64_t v12 = [v11 objectForKey:v10];

          uint64_t v13 = [v12 value];
          LODWORD(v11) = v13 == v10;

          long long v14 = [v12 timestamp];
          long long v15 = [v14 shortDescription];
          [v12 value];
          if (v11) {
            uint64_t v16 = {;
          }
            [v6 appendFormat:@"  %@ %@,\n", v15, v16];
          }
          else {
            uint64_t v16 = {;
          }
            [v6 appendFormat:@"  %@ : %@ %@,\n", v10, v15, v16];
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }

    [v6 replaceCharactersInRange:objc_msgSend(v6, "length") - 2, 2, @">" withString]);
  }
  else
  {
    uint64_t v17 = NSString;
    uint64_t v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    uint64_t v6 = [v17 stringWithFormat:@"<%@ %p>", v19, self];
  }
  return (NSString *)v6;
}

- (ICCRDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  return (ICCRDocument *)WeakRetained;
}

- (void)setContents:(id)a3
{
}

- (int64_t)removeClock
{
  return self->_removeClock;
}

- (void)setRemoveClock:(int64_t)a3
{
  self->_removeClock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
  objc_destroyWeak((id *)&self->_document);
}

- (void)setObject:(os_log_t)log forKey:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Setting value for an existing key has no effect in a ICCRDictionary.", v1, 2u);
}

@end