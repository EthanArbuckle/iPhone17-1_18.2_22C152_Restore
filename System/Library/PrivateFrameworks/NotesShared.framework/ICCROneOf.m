@interface ICCROneOf
- (ICCROneOf)init;
- (ICCROneOf)initWithICCRCoder:(id)a3;
- (ICCRSet)set;
- (NSMapTable)timestamps;
- (id)contents;
- (id)timestampForNewItem;
- (void)addItem:(id)a3;
- (void)encodeWithICCRCoder:(id)a3;
- (void)mergeWith:(id)a3;
- (void)setContents:(id)a3;
- (void)setSet:(id)a3;
- (void)setTimestamps:(id)a3;
- (void)setUpdated:(id)a3;
@end

@implementation ICCROneOf

- (ICCROneOf)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICCROneOf;
  v2 = [(ICCROneOf *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    timestamps = v2->_timestamps;
    v2->_timestamps = (NSMapTable *)v3;
  }
  return v2;
}

- (ICCROneOf)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) != 12) {
    goto LABEL_6;
  }
  v28.receiver = self;
  v28.super_class = (Class)ICCROneOf;
  objc_super v6 = [(ICCROneOf *)&v28 init];
  if (!v6)
  {
    self = 0;
LABEL_6:
    v11 = 0;
    goto LABEL_23;
  }
  uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  timestamps = v6->_timestamps;
  v6->_timestamps = (NSMapTable *)v7;

  if (*(_DWORD *)(v5 + 48) == 12) {
    uint64_t v10 = *(void *)(v5 + 40);
  }
  else {
    uint64_t v10 = CRDT::OneOf::default_instance(v9);
  }
  v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*(int *)(v10 + 48)];
  v13 = v12;
  if (*(_DWORD *)(v10 + 48))
  {
    for (i = *(uint64_t **)(v10 + 40); i != (uint64_t *)(*(void *)(v10 + 40) + 8 * *(int *)(v10 + 48)); ++i)
    {
      uint64_t v15 = *i;
      int v16 = *(_DWORD *)(*i + 32);
      if (v16)
      {
        uint64_t v19 = *(void *)(v15 + 40);
        if (!v19) {
          uint64_t v19 = *(void *)(CRDT::OneOf_Element::default_instance(v12) + 40);
        }
        v17 = [v4 decodeObjectForProtobufObjectID:v19];
        if ((*(_DWORD *)(v15 + 32) & 2) != 0)
        {
LABEL_16:
          v20 = [ICCRTimestamp alloc];
          v21 = v20;
          uint64_t v22 = *(void *)(v15 + 48);
          if (!v22) {
            uint64_t v22 = *(void *)(CRDT::OneOf_Element::default_instance((CRDT::OneOf_Element *)v20) + 48);
          }
          uint64_t v23 = [(ICCRTimestamp *)v21 initWithProtobufTimestamp:v22 decoder:v4];
          v18 = (void *)v23;
          if (v17 && v23)
          {
            [(CRDT::OneOf_Element *)v13 addObject:v17];
            [(CRDT::OneOf_Element *)v13 addObject:v18];
          }
          goto LABEL_21;
        }
      }
      else
      {
        v17 = 0;
        if ((v16 & 2) != 0) {
          goto LABEL_16;
        }
      }
      v18 = 0;
LABEL_21:
    }
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __31__ICCROneOf_initWithICCRCoder___block_invoke;
  v25[3] = &unk_1E64A6D18;
  self = v13;
  v26 = self;
  v11 = v6;
  v27 = v11;
  [v4 addDecoderCompletionHandler:v25 dependency:0 for:v11];

LABEL_23:
  return v11;
}

void __31__ICCROneOf_initWithICCRCoder___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  if (v2)
  {
    unint64_t v3 = v2;
    for (unint64_t i = 0; i < v3; i += 2)
    {
      uint64_t v5 = [*(id *)(a1 + 40) timestamps];
      objc_super v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i + 1];
      uint64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      [v5 setObject:v6 forKey:v7];
    }
  }
}

- (void)encodeWithICCRCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForEncoding];
  uint64_t v6 = v5;
  if (*(_DWORD *)(v5 + 48) != 12)
  {
    CRDT::Document_DocObject::clear_contents(v5);
    *(_DWORD *)(v6 + 48) = 12;
    operator new();
  }
  uint64_t v7 = *(void *)(v5 + 40);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v8 = [(ICCROneOf *)self timestamps];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = *(void *)v23;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * v12);
        int v14 = *(_DWORD *)(v7 + 52);
        uint64_t v15 = *(int *)(v7 + 48);
        if ((int)v15 >= v14)
        {
          if (v14 == *(_DWORD *)(v7 + 56)) {
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v7 + 40, v14 + 1);
          }
          google::protobuf::internal::GenericTypeHandler<CRDT::OneOf_Element>::New();
        }
        uint64_t v16 = *(void *)(v7 + 40);
        *(_DWORD *)(v7 + 48) = v15 + 1;
        uint64_t v17 = *(void *)(v16 + 8 * v15);
        *(_DWORD *)(v17 + 32) |= 1u;
        uint64_t v18 = *(void *)(v17 + 40);
        if (!v18) {
          operator new();
        }
        [v4 encodeObject:v13 forObjectID:v18];
        uint64_t v19 = [(ICCROneOf *)self timestamps];
        v20 = [v19 objectForKey:v13];

        *(_DWORD *)(v17 + 32) |= 2u;
        uint64_t v21 = *(void *)(v17 + 48);
        if (!v21) {
          operator new();
        }
        [v20 encodeIntoProtobufTimestamp:v21 coder:v4];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

- (id)timestampForNewItem
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v3 = [(ICCROneOf *)self set];
  id v4 = 0;
  uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v9 = [(ICCROneOf *)self timestamps];
        uint64_t v10 = [v9 objectForKey:v8];

        if (!v4 || [v4 compare:v10] == 1)
        {
          id v11 = v10;

          id v4 = v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  uint64_t v12 = [ICCRTimestamp alloc];
  uint64_t v13 = [(ICCROneOf *)self set];
  int v14 = [v13 document];
  uint64_t v15 = [v14 replica];
  uint64_t v16 = -[ICCRTimestamp initWithReplica:andCounter:](v12, "initWithReplica:andCounter:", v15, [v4 counter] - 1);

  return v16;
}

- (void)setSet:(id)a3
{
  uint64_t v5 = (ICCRSet *)a3;
  set = self->_set;
  uint64_t v7 = v5;
  if (set != v5)
  {
    [(ICCRSet *)set removeObserver:self];
    objc_storeStrong((id *)&self->_set, a3);
    [(ICCRSet *)v7 addObserver:self];
  }
}

- (void)setUpdated:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(ICCROneOf *)self set];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * v7);
        uint64_t v9 = [(ICCROneOf *)self timestamps];
        uint64_t v10 = [v9 objectForKey:v8];

        if (!v10)
        {
          id v11 = [(ICCROneOf *)self timestamps];
          uint64_t v12 = [(ICCROneOf *)self timestampForNewItem];
          [v11 setObject:v12 forKey:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
}

- (void)addItem:(id)a3
{
  id v6 = a3;
  id v4 = [(ICCROneOf *)self timestamps];
  uint64_t v5 = [(ICCROneOf *)self timestampForNewItem];
  [v4 setObject:v5 forKey:v6];
}

- (id)contents
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v3 = [(ICCROneOf *)self set];
  id v4 = 0;
  uint64_t v5 = 0;
  uint64_t v6 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [(ICCROneOf *)self timestamps];
        id v11 = [v10 objectForKey:v9];

        if (!v5 || [v5 compare:v11] == -1)
        {
          id v12 = v11;

          id v13 = v9;
          id v4 = v13;
          uint64_t v5 = v12;
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

- (void)setContents:(id)a3
{
  id v22 = a3;
  id v4 = [(ICCROneOf *)self set];
  char v5 = [v4 containsObject:v22];

  if (v5)
  {
    uint64_t v6 = [(ICCROneOf *)self timestamps];
    uint64_t v7 = [(ICCROneOf *)self contents];
    uint64_t v8 = [v6 objectForKey:v7];

    uint64_t v9 = [ICCRTimestamp alloc];
    uint64_t v10 = [(ICCROneOf *)self set];
    id v11 = [v10 document];
    id v12 = [v11 replica];
    id v13 = -[ICCRTimestamp initWithReplica:andCounter:](v9, "initWithReplica:andCounter:", v12, [v8 counter] + 1);

    long long v14 = [(ICCROneOf *)self timestamps];
    long long v15 = [v14 objectForKey:v22];
    [v15 mergeWith:v13];

    uint64_t v16 = [(ICCRTimestamp *)v13 counter];
    long long v17 = [(ICCROneOf *)self set];
    long long v18 = [v17 document];
    uint64_t v19 = [v18 unserializedReplicaClock];

    if (v16 <= v19) {
      uint64_t v16 = v19;
    }
    uint64_t v20 = [(ICCROneOf *)self set];
    long long v21 = [v20 document];
    [v21 setUnserializedReplicaClock:v16];
  }
}

- (void)mergeWith:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"Invalid merge ICCROneOf, classes must be equal for merge.", 0 reason userInfo];
    objc_exception_throw(v15);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  char v5 = objc_msgSend(v4, "timestamps", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v4 timestamps];
        id v11 = [v10 objectForKey:v9];

        id v12 = [(ICCROneOf *)self timestamps];
        id v13 = [v12 objectForKey:v9];

        if (v13)
        {
          [v13 mergeWith:v11];
        }
        else
        {
          long long v14 = [(ICCROneOf *)self timestamps];
          [v14 setObject:v11 forKey:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (ICCRSet)set
{
  return self->_set;
}

- (NSMapTable)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_set, 0);
}

@end