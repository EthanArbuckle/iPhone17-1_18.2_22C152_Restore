@interface CRVectorTimestamp
- (BOOL)isEqual:(id)a3;
- (CRVectorTimestamp)init;
- (CRVectorTimestamp)initWithCRCoder:(id)a3;
- (CRVectorTimestamp)initWithProtobufTimestamp:(const void *)a3 decoder:(id)a4;
- (NSString)description;
- (id)allUUIDs;
- (id)clockElementForUUID:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)shortDescription;
- (id)sortedUUIDs;
- (id)timestampForReplica:(id)a3;
- (id)tombstone;
- (unint64_t)clockForUUID:(id)a3;
- (unint64_t)compare:(id)a3;
- (unint64_t)count;
- (unint64_t)subclockForUUID:(id)a3;
- (void)encodeIntoProtobufTimestamp:(void *)a3 coder:(id)a4;
- (void)encodeWithCRCoder:(id)a3;
- (void)incrementClockForUUID:(id)a3;
- (void)maxClock:(unint64_t)a3 forUUID:(id)a4;
- (void)mergeWith:(id)a3;
- (void)minusVectorTimestamp:(id)a3;
- (void)removeUUID:(id)a3;
- (void)setClock:(unint64_t)a3 forUUID:(id)a4;
- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5;
@end

@implementation CRVectorTimestamp

- (CRVectorTimestamp)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRVectorTimestamp;
  v2 = [(CRVectorTimestamp *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    clock = v2->_clock;
    v2->_clock = v3;
  }
  return v2;
}

- (CRVectorTimestamp)initWithCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 8) {
    objc_super v6 = [(CRVectorTimestamp *)self initWithProtobufTimestamp:*(void *)(v5 + 40) decoder:v4];
  }
  else {
    objc_super v6 = [(CRVectorTimestamp *)self init];
  }
  v7 = v6;

  return v7;
}

- (void)encodeWithCRCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 currentDocumentObjectForEncoding];
  uint64_t v5 = v4;
  if (*(_DWORD *)(v4 + 48) != 8)
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 8;
    operator new();
  }
  [(CRVectorTimestamp *)self encodeIntoProtobufTimestamp:*(void *)(v4 + 40) coder:v6];
}

- (CRVectorTimestamp)initWithProtobufTimestamp:(const void *)a3 decoder:(id)a4
{
  id v6 = a4;
  v7 = [(CRVectorTimestamp *)self init];
  if (v7)
  {
    int v8 = *((_DWORD *)a3 + 12);
    if (v8)
    {
      v9 = (uint64_t *)*((void *)a3 + 5);
      v10 = v9;
      do
      {
        uint64_t v11 = *v10;
        if (*(unsigned char *)(*v10 + 32))
        {
          v12 = [v6 decodeUUIDFromUUIDIndex:*(void *)(v11 + 40)];
          v13 = objc_alloc_init(CRVectorTimestampElement);
          v14 = v13;
          int v15 = *(_DWORD *)(v11 + 32);
          if ((v15 & 2) != 0)
          {
            [(CRVectorTimestampElement *)v13 setClock:*(void *)(v11 + 48)];
            int v15 = *(_DWORD *)(v11 + 32);
          }
          if ((v15 & 4) != 0) {
            [(CRVectorTimestampElement *)v14 setSubclock:*(void *)(v11 + 56)];
          }
          [(NSMutableDictionary *)v7->_clock setObject:v14 forKeyedSubscript:v12];

          v9 = (uint64_t *)*((void *)a3 + 5);
          int v8 = *((_DWORD *)a3 + 12);
        }
        ++v10;
      }
      while (v10 != &v9[v8]);
    }
  }

  return v7;
}

- (void)encodeIntoProtobufTimestamp:(void *)a3 coder:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v7 = [(NSMutableDictionary *)self->_clock allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v12 = [(NSMutableDictionary *)self->_clock objectForKeyedSubscript:v11];
        int v13 = *((_DWORD *)a3 + 13);
        uint64_t v14 = *((int *)a3 + 12);
        if ((int)v14 >= v13)
        {
          if (v13 == *((_DWORD *)a3 + 14)) {
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 40, v13 + 1);
          }
          google::protobuf::internal::GenericTypeHandler<CRDT::VectorTimestamp_Element>::New();
        }
        uint64_t v15 = *((void *)a3 + 5);
        *((_DWORD *)a3 + 12) = v14 + 1;
        uint64_t v16 = *(void *)(v15 + 8 * v14);
        uint64_t v17 = [v6 encodeUUIDIndexFromUUID:v11];
        *(_DWORD *)(v16 + 32) |= 1u;
        *(void *)(v16 + 40) = v17;
        if ([v12 clock])
        {
          uint64_t v18 = [v12 clock];
          *(_DWORD *)(v16 + 32) |= 2u;
          *(void *)(v16 + 48) = v18;
        }
        if ([v12 subclock])
        {
          uint64_t v19 = [v12 subclock];
          *(_DWORD *)(v16 + 32) |= 4u;
          *(void *)(v16 + 56) = v19;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(CRVectorTimestamp);
  [(CRVectorTimestamp *)v4 mergeWith:self];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CRVectorTimestamp *)self compare:v4] == 0;

  return v5;
}

- (unint64_t)count
{
  return [(NSMutableDictionary *)self->_clock count];
}

- (id)timestampForReplica:(id)a3
{
  id v4 = a3;
  BOOL v5 = [[CRTimestamp alloc] initWithReplica:v4 andCounter:[(CRVectorTimestamp *)self clockForUUID:v4]];

  return v5;
}

- (id)clockElementForUUID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_clock objectForKeyedSubscript:a3];

  return v3;
}

- (unint64_t)clockForUUID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_clock objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 clock];

  return v4;
}

- (unint64_t)subclockForUUID:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_clock objectForKeyedSubscript:a3];
  unint64_t v4 = [v3 subclock];

  return v4;
}

- (void)setClock:(unint64_t)a3 forUUID:(id)a4
{
  id v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_clock, "objectForKeyedSubscript:");
  id v6 = (CRVectorTimestampElement *)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    id v6 = objc_alloc_init(CRVectorTimestampElement);
  }
  [(CRVectorTimestampElement *)v6 setClock:a3];
  [(NSMutableDictionary *)self->_clock setObject:v6 forKey:v7];
}

- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5
{
  id v9 = a5;
  uint64_t v8 = objc_alloc_init(CRVectorTimestampElement);
  [(CRVectorTimestampElement *)v8 setClock:a3];
  [(CRVectorTimestampElement *)v8 setSubclock:a4];
  [(NSMutableDictionary *)self->_clock setObject:v8 forKey:v9];
}

- (void)incrementClockForUUID:(id)a3
{
  id v4 = a3;
  -[CRVectorTimestamp setClock:forUUID:](self, "setClock:forUUID:", -[CRVectorTimestamp clockForUUID:](self, "clockForUUID:") + 1, v4);
}

- (void)maxClock:(unint64_t)a3 forUUID:(id)a4
{
  id v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_clock, "objectForKeyedSubscript:");
  id v6 = (CRVectorTimestampElement *)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    id v6 = objc_alloc_init(CRVectorTimestampElement);
  }
  unint64_t v7 = [(CRVectorTimestampElement *)v6 clock];
  if (v7 <= a3) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = v7;
  }
  [(CRVectorTimestampElement *)v6 setClock:v8];
  [(NSMutableDictionary *)self->_clock setObject:v6 forKey:v9];
}

- (void)removeUUID:(id)a3
{
}

- (id)allUUIDs
{
  return (id)[(NSMutableDictionary *)self->_clock allKeys];
}

- (id)sortedUUIDs
{
  v2 = [(NSMutableDictionary *)self->_clock allKeys];
  v3 = [v2 sortedArrayUsingSelector:sel_CR_compare_];

  return v3;
}

- (unint64_t)compare:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F1CA80];
  id v6 = [(CRVectorTimestamp *)self allUUIDs];
  unint64_t v7 = [v5 setWithArray:v6];

  unint64_t v8 = [v4 allUUIDs];
  [v7 addObjectsFromArray:v8];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v9)
  {

    unint64_t v22 = 0;
    goto LABEL_21;
  }
  int v10 = 0;
  int v11 = 0;
  uint64_t v12 = *(void *)v27;
  uint64_t v24 = 4;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
      uint64_t v15 = [(CRVectorTimestamp *)self clockElementForUUID:v14];
      uint64_t v16 = [v4 clockElementForUUID:v14];
      unint64_t v17 = [v15 clock];
      if (v17 < [v16 clock])
      {
LABEL_7:
        int v11 = 1;
        goto LABEL_12;
      }
      unint64_t v18 = [v15 clock];
      if (v18 <= [v16 clock])
      {
        unint64_t v19 = [v15 subclock];
        if (v19 < [v16 subclock]) {
          goto LABEL_7;
        }
        unint64_t v20 = [v15 subclock];
        v10 |= v20 > [v16 subclock];
      }
      else
      {
        int v10 = 1;
      }
LABEL_12:

      if (v11 & v10)
      {
        LOBYTE(v11) = 1;
        goto LABEL_19;
      }
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v9) {
      continue;
    }
    break;
  }
  uint64_t v21 = 4;
  if ((v10 & 1) == 0) {
    uint64_t v21 = 0;
  }
  uint64_t v24 = v21;
LABEL_19:

  unint64_t v22 = v24 | v11 & 1;
LABEL_21:

  return v22;
}

- (void)minusVectorTimestamp:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  BOOL v5 = objc_msgSend(v4, "allUUIDs", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        int v10 = [(CRVectorTimestamp *)self clockElementForUUID:v9];
        int v11 = [v4 clockElementForUUID:v9];
        unint64_t v12 = [v10 clock];
        if (v12 < [v11 clock]
          || (uint64_t v13 = [v10 clock], v13 == objc_msgSend(v11, "clock"))
          && (unint64_t v14 = [v10 subclock], v14 <= objc_msgSend(v11, "subclock")))
        {
          [(NSMutableDictionary *)self->_clock removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)mergeWith:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v5 = objc_msgSend(v4, "allUUIDs", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        int v10 = [(CRVectorTimestamp *)self clockElementForUUID:v9];
        int v11 = [v4 clockElementForUUID:v9];
        unint64_t v12 = [v10 clock];
        if (v12 > [v11 clock]
          || (uint64_t v15 = [v10 clock], v15 == objc_msgSend(v11, "clock"))
          && (unint64_t v16 = [v10 subclock], v16 > objc_msgSend(v11, "subclock")))
        {
          uint64_t v13 = [v10 clock];
          uint64_t v14 = [v10 subclock];
        }
        else
        {
          uint64_t v13 = [v11 clock];
          uint64_t v14 = [v11 subclock];
        }
        [(CRVectorTimestamp *)self setClock:v13 subclock:v14 forUUID:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Cannot calculate deltas for vector timestamps." userInfo:0];
  objc_exception_throw(v7);
}

- (id)tombstone
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Cannot tombstone a non-value / non-identified object." userInfo:0];
  objc_exception_throw(v2);
}

- (id)shortDescription
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(CRVectorTimestamp *)self count])
  {
    v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    [(__CFString *)v3 appendFormat:@"{"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(CRVectorTimestamp *)self sortedUUIDs];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          unint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          uint64_t v9 = [(CRVectorTimestamp *)self clockElementForUUID:v8];
          int v10 = objc_msgSend(v8, "CR_shortDescription");
          -[__CFString appendFormat:](v3, "appendFormat:", @"%@:%lu ", v10, [v9 clock]);
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    [(__CFString *)v3 replaceCharactersInRange:[(__CFString *)v3 length] - 1, 1, @"}" withString];
  }
  else
  {
    v3 = @"{}";
  }

  return v3;
}

- (NSString)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "appendFormat:", @"<%@ %p (\n"), v5, self;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(CRVectorTimestamp *)self sortedUUIDs];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        int v11 = [(CRVectorTimestamp *)self clockElementForUUID:v10];
        [v3 appendFormat:@"  %@:%lu.%lu\n", v10, objc_msgSend(v11, "clock"), objc_msgSend(v11, "subclock")];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [v3 appendString:@">"]);

  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

@end