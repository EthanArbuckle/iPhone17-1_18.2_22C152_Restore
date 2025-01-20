@interface TTVectorMultiTimestamp
- (BOOL)isDocumentShared;
- (BOOL)isEqual:(id)a3;
- (NSArray)timestamps;
- (TTVectorMultiTimestamp)initWithArchive:(const void *)a3 andCapacity:(unint64_t)a4;
- (TTVectorMultiTimestamp)initWithCapacity:(unint64_t)a3;
- (TTVectorMultiTimestamp)initWithData:(id)a3 andCapacity:(unint64_t)a4;
- (TTVectorMultiTimestamp)initWithTimestamps:(id)a3;
- (id)clockElementForUUID:(id)a3 atIndex:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serialize;
- (id)sortedUUIDs;
- (unint64_t)clockForUUID:(id)a3 atIndex:(unint64_t)a4;
- (unint64_t)compareTo:(id)a3;
- (void)mergeWithTimestamp:(id)a3;
- (void)saveToArchive:(void *)a3;
- (void)setClock:(unint64_t)a3 forUUID:(id)a4 atIndex:(unint64_t)a5;
- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5 atIndex:(unint64_t)a6;
- (void)setTimestamps:(id)a3;
@end

@implementation TTVectorMultiTimestamp

- (TTVectorMultiTimestamp)initWithCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TTVectorMultiTimestamp;
  v4 = [(TTVectorMultiTimestamp *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    timestamps = v4->_timestamps;
    v4->_timestamps = (NSArray *)v5;

    if (a3)
    {
      uint64_t v7 = 0;
      do
      {
        v8 = objc_alloc_init(TTVectorTimestamp);
        [(NSArray *)v4->_timestamps setObject:v8 atIndexedSubscript:v7];

        ++v7;
      }
      while (a3 != v7);
    }
  }
  return v4;
}

- (TTVectorMultiTimestamp)initWithTimestamps:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TTVectorMultiTimestamp;
  uint64_t v5 = [(TTVectorMultiTimestamp *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    timestamps = v5->_timestamps;
    v5->_timestamps = (NSArray *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[TTVectorMultiTimestamp alloc] initWithCapacity:[(NSArray *)self->_timestamps count]];
  [(TTVectorMultiTimestamp *)v4 mergeWithTimestamp:self];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TTVectorMultiTimestamp *)self compareTo:v4] == 0;

  return v5;
}

- (BOOL)isDocumentShared
{
  return 0;
}

- (id)clockElementForUUID:(id)a3 atIndex:(unint64_t)a4
{
  timestamps = self->_timestamps;
  id v6 = a3;
  uint64_t v7 = [(NSArray *)timestamps objectAtIndexedSubscript:a4];
  v8 = [v7 clockElementForUUID:v6];

  return v8;
}

- (unint64_t)clockForUUID:(id)a3 atIndex:(unint64_t)a4
{
  timestamps = self->_timestamps;
  id v6 = a3;
  uint64_t v7 = [(NSArray *)timestamps objectAtIndexedSubscript:a4];
  unint64_t v8 = [v7 clockForUUID:v6];

  return v8;
}

- (void)setClock:(unint64_t)a3 forUUID:(id)a4 atIndex:(unint64_t)a5
{
  timestamps = self->_timestamps;
  id v8 = a4;
  id v9 = [(NSArray *)timestamps objectAtIndexedSubscript:a5];
  [v9 setClock:a3 forUUID:v8];
}

- (void)setClock:(unint64_t)a3 subclock:(unint64_t)a4 forUUID:(id)a5 atIndex:(unint64_t)a6
{
  timestamps = self->_timestamps;
  id v10 = a5;
  id v11 = [(NSArray *)timestamps objectAtIndexedSubscript:a6];
  [v11 setClock:a3 subclock:a4 forUUID:v10];
}

- (id)sortedUUIDs
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  NSUInteger v4 = [(NSArray *)self->_timestamps count];
  if (v4)
  {
    NSUInteger v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v7 = [(NSArray *)self->_timestamps objectAtIndexedSubscript:i];
      id v8 = [v7 allUUIDs];
      [v3 addObjectsFromArray:v8];
    }
  }
  id v9 = [v3 allObjects];
  id v10 = [v9 sortedArrayUsingSelector:sel_TTCompare_];

  return v10;
}

- (unint64_t)compareTo:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)self->_timestamps count];
  if (v5)
  {
    NSUInteger v6 = v5;
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      id v9 = [(NSArray *)self->_timestamps objectAtIndexedSubscript:v7];
      id v10 = [v4 timestamps];
      id v11 = [v10 objectAtIndexedSubscript:v7];
      v8 |= [v9 compareTo:v11];

      if (v8 == 5) {
        break;
      }
      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)mergeWithTimestamp:(id)a3
{
  id v10 = a3;
  NSUInteger v4 = [(NSArray *)self->_timestamps count];
  if (v4)
  {
    NSUInteger v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v7 = [(NSArray *)self->_timestamps objectAtIndexedSubscript:i];
      unint64_t v8 = [v10 timestamps];
      id v9 = [v8 objectAtIndexedSubscript:i];
      [v7 mergeWithTimestamp:v9];
    }
  }
}

- (id)description
{
  id v3 = NSString;
  NSUInteger v4 = (objc_class *)objc_opt_class();
  NSUInteger v5 = NSStringFromClass(v4);
  NSUInteger v6 = [v3 stringWithFormat:@"<%@ %p>(\n%@\n)", v5, self, self->_timestamps];

  return v6;
}

- (NSArray)timestamps
{
  return self->_timestamps;
}

- (void)setTimestamps:(id)a3
{
}

- (void).cxx_destruct
{
}

- (TTVectorMultiTimestamp)initWithData:(id)a3 andCapacity:(unint64_t)a4
{
  id v6 = a3;
  topotext::VectorTimestamp::VectorTimestamp((topotext::VectorTimestamp *)v13);
  id v7 = v6;
  unint64_t v8 = (char *)[v7 bytes];
  int v9 = TTBoundedCheckedCastNSUIntegerToUInt32([v7 length]);
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v13, v8, v9))
  {
    self = [(TTVectorMultiTimestamp *)self initWithArchive:v13 andCapacity:a4];
    id v10 = self;
  }
  else
  {
    id v11 = +[REMLog crdt];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TTVectorMultiTimestamp(TTVectorTimestampPersistenceAdditions) initWithData:andCapacity:](v11);
    }

    id v10 = 0;
  }
  topotext::VectorTimestamp::~VectorTimestamp((topotext::VectorTimestamp *)v13);

  return v10;
}

- (TTVectorMultiTimestamp)initWithArchive:(const void *)a3 andCapacity:(unint64_t)a4
{
  id v6 = [(TTVectorMultiTimestamp *)self initWithCapacity:a4];
  id v7 = v6;
  if (!v6)
  {
LABEL_29:
    int v9 = 0;
    goto LABEL_30;
  }
  int v8 = *((_DWORD *)a3 + 12);
  int v9 = v6;
  if (v8)
  {
    int v10 = 0;
    id v11 = (char *)a3 + 40;
    while (1)
    {
      uint64_t v12 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::VectorTimestamp_Clock>::TypeHandler>((uint64_t)v11, v10);
      uint64_t v13 = v12;
      if ((*(unsigned char *)(v12 + 32) & 1) == 0) {
        break;
      }
      uint64_t v14 = *(void *)(v12 + 40);
      uint64_t v15 = *(char *)(v14 + 23) < 0 ? *(void *)(v14 + 8) : *(unsigned __int8 *)(v14 + 23);
      if (v15 != 16) {
        break;
      }
      id v16 = objc_alloc(MEMORY[0x1E4F29128]);
      v17 = *(uint64_t **)(v13 + 40);
      if (*((char *)v17 + 23) < 0) {
        v17 = (uint64_t *)*v17;
      }
      v18 = [v16 initWithUUIDBytes:v17];
      uint64_t v19 = *(unsigned int *)(v13 + 56);
      if (v19 != a4)
      {
        v24 = +[REMLog crdt];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[TTVectorMultiTimestamp(TTVectorTimestampPersistenceAdditions) initWithArchive:andCapacity:](v19, a4, v24);
        }

        goto LABEL_28;
      }
      if (v19)
      {
        uint64_t v20 = 0;
        uint64_t v21 = v13 + 48;
        do
        {
          if (*(unsigned char *)(google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::VectorTimestamp_Clock_ReplicaClock>::TypeHandler>(v21, v20)+ 32))uint64_t v22 = *(unsigned int *)(google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::VectorTimestamp_Clock_ReplicaClock>::TypeHandler>(v21, v20)+ 40); {
          else
          }
            uint64_t v22 = 0;
          if ((*(unsigned char *)(google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::VectorTimestamp_Clock_ReplicaClock>::TypeHandler>(v21, v20)+ 32) & 2) != 0)uint64_t v23 = *(unsigned int *)(google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::VectorTimestamp_Clock_ReplicaClock>::TypeHandler>(v21, v20)+ 44); {
          else
          }
            uint64_t v23 = 0;
          [(TTVectorMultiTimestamp *)v7 setClock:v22 subclock:v23 forUUID:v18 atIndex:v20++];
        }
        while (a4 != v20);
      }

      if (++v10 == v8)
      {
        int v9 = v7;
        goto LABEL_30;
      }
    }
    v18 = +[REMLog crdt];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[TTVectorMultiTimestamp(TTVectorTimestampPersistenceAdditions) initWithArchive:andCapacity:](v18);
    }
LABEL_28:

    goto LABEL_29;
  }
LABEL_30:
  v25 = v9;

  return v25;
}

- (void)saveToArchive:(void *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = [(TTVectorMultiTimestamp *)self sortedUUIDs];
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v24 = *(void *)v27;
    uint64_t v22 = (google::protobuf::internal::RepeatedPtrFieldBase *)((char *)a3 + 40);
    do
    {
      uint64_t v25 = v5;
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        int v8 = *((_DWORD *)a3 + 13);
        uint64_t v9 = *((int *)a3 + 12);
        if ((int)v9 >= v8)
        {
          if (v8 == *((_DWORD *)a3 + 14)) {
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)v22, v8 + 1);
          }
          google::protobuf::internal::GenericTypeHandler<topotext::VectorTimestamp_Clock>::New();
        }
        uint64_t v10 = *((void *)a3 + 5);
        *((_DWORD *)a3 + 12) = v9 + 1;
        uint64_t v11 = *(void *)(v10 + 8 * v9);
        v30[0] = 0;
        v30[1] = 0;
        objc_msgSend(v7, "getUUIDBytes:", v30, v22);
        *(_DWORD *)(v11 + 32) |= 1u;
        if (!google::protobuf::internal::empty_string_) {
          __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
        }
        if (*(void *)(v11 + 40) == google::protobuf::internal::empty_string_) {
          operator new();
        }
        MEMORY[0x1BA9DB490]();
        uint64_t v12 = [(TTVectorMultiTimestamp *)self timestamps];
        uint64_t v13 = [v12 count];

        if (v13)
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            uint64_t v15 = [(TTVectorMultiTimestamp *)self clockElementForUUID:v7 atIndex:j];
            int v16 = *(_DWORD *)(v11 + 60);
            uint64_t v17 = *(int *)(v11 + 56);
            if ((int)v17 >= v16)
            {
              if (v16 == *(_DWORD *)(v11 + 64)) {
                google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v11 + 48, v16 + 1);
              }
              google::protobuf::internal::GenericTypeHandler<topotext::VectorTimestamp_Clock_ReplicaClock>::New();
            }
            uint64_t v18 = *(void *)(v11 + 48);
            *(_DWORD *)(v11 + 56) = v17 + 1;
            uint64_t v19 = *(_DWORD **)(v18 + 8 * v17);
            if ([v15 clock])
            {
              int v20 = TTBoundedCheckedCastNSUIntegerToUInt32([v15 clock]);
              v19[8] |= 1u;
              v19[10] = v20;
            }
            if ([v15 subclock])
            {
              int v21 = TTBoundedCheckedCastNSUIntegerToUInt32([v15 subclock]);
              v19[8] |= 2u;
              v19[11] = v21;
            }
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }
}

- (id)serialize
{
  -[TTVectorMultiTimestamp saveToArchive:](self, "saveToArchive:", v6, topotext::VectorTimestamp::VectorTimestamp((topotext::VectorTimestamp *)v6));
  id v2 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::VectorTimestamp::ByteSize((topotext::VectorTimestamp *)v6)];
  id v3 = (void *)[v2 mutableBytes];
  int v4 = TTBoundedCheckedCastNSUIntegerToUInt32([v2 length]);
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v6, v3, v4);
  topotext::VectorTimestamp::~VectorTimestamp((topotext::VectorTimestamp *)v6);

  return v2;
}

@end