@interface REMClockElementList
+ (BOOL)list:(id)a3 isCompatibleToList:(id)a4;
+ (int64_t)compareList:(id)a3 toList:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)elements;
- (REMClockElementList)initWithCRVectorTimestampElements:(id)a3;
- (REMClockElementList)initWithEntryArchive:(const void *)a3;
- (REMClockElementList)initWithTTVectorTimestampElements:(id)a3;
- (id)description;
- (void)encodeIntoEntryArchive:(void *)a3;
- (void)setElements:(id)a3;
@end

@implementation REMClockElementList

- (REMClockElementList)initWithCRVectorTimestampElements:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMClockElementList;
  v5 = [(REMClockElementList *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    elements = v5->_elements;
    v5->_elements = (NSArray *)v6;
  }
  return v5;
}

- (REMClockElementList)initWithTTVectorTimestampElements:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
        v11 = objc_alloc_init(CRVectorTimestampElement);
        -[CRVectorTimestampElement setClock:](v11, "setClock:", objc_msgSend(v10, "clock", (void)v14));
        -[CRVectorTimestampElement setSubclock:](v11, "setSubclock:", [v10 subclock]);
        [v5 addObject:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  v12 = [(REMClockElementList *)self initWithCRVectorTimestampElements:v5];
  return v12;
}

+ (BOOL)list:(id)a3 isCompatibleToList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  BOOL v8 = 1;
  if (v5 && v6)
  {
    uint64_t v9 = [v5 elements];
    uint64_t v10 = [v9 count];
    v11 = [v7 elements];
    BOOL v8 = v10 == [v11 count];
  }
  return v8;
}

+ (int64_t)compareList:(id)a3 toList:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  uint64_t v7 = (void *)v6;
  if (!(v5 | v6))
  {
    uint64_t v8 = 0;
    goto LABEL_6;
  }
  if (!v5 && v6)
  {
    uint64_t v8 = 1;
    goto LABEL_6;
  }
  if (v5 && !v6)
  {
    uint64_t v8 = 2;
    goto LABEL_6;
  }
  uint64_t v10 = [(id)v5 elements];
  uint64_t v8 = [v10 count];

  v11 = [v7 elements];
  uint64_t v12 = [v11 count];

  if (v8 == v12)
  {
    if (!v8) {
      goto LABEL_6;
    }
    goto LABEL_12;
  }
  uint64_t v19 = +[REMLog crdt];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
    +[REMClockElementList compareList:toList:](v8, v12, v19);
  }

  if (v8)
  {
LABEL_12:
    for (uint64_t i = 0; i != v8; ++i)
    {
      long long v14 = [(id)v5 elements];
      long long v15 = [v14 objectAtIndexedSubscript:i];

      long long v16 = [v7 elements];
      long long v17 = [v16 objectAtIndexedSubscript:i];

      uint64_t v18 = objc_msgSend(v15, "rem_compareToVectorTimestampElement:", v17);
    }
    if (v18 == -1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2 * (v18 == 1);
    }
  }
LABEL_6:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMClockElementList *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    unint64_t v6 = v4;
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && +[REMClockElementList list:isCompatibleToList:](REMClockElementList, "list:isCompatibleToList:", self, v6)&& +[REMClockElementList compareList:self toList:v6] == 0;
  }
  return v7;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(REMClockElementList *)self elements];
  unint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v6 = [(REMClockElementList *)self elements];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%llu.%llu", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "clock"), objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "subclock"));
        [v5 addObject:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  if ([v5 count] == 1)
  {
    v11 = [v5 firstObject];
  }
  else
  {
    uint64_t v12 = NSString;
    v13 = [v5 componentsJoinedByString:@","];
    v11 = [v12 stringWithFormat:@"[%@]", v13];
  }

  return v11;
}

- (void)encodeIntoEntryArchive:(void *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(REMClockElementList *)self elements];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        int v9 = *((_DWORD *)a3 + 15);
        uint64_t v10 = *((int *)a3 + 14);
        if ((int)v10 >= v9)
        {
          if (v9 == *((_DWORD *)a3 + 16)) {
            google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 48, v9 + 1);
          }
          google::protobuf::internal::GenericTypeHandler<replica_manager::VectorTimestampElement>::New();
        }
        uint64_t v11 = *((void *)a3 + 6);
        *((_DWORD *)a3 + 14) = v10 + 1;
        uint64_t v12 = *(void *)(v11 + 8 * v10);
        uint64_t v13 = [v8 clock];
        *(_DWORD *)(v12 + 32) |= 1u;
        *(void *)(v12 + 40) = v13;
        uint64_t v14 = [v8 subclock];
        *(_DWORD *)(v12 + 32) |= 2u;
        *(void *)(v12 + 48) = v14;
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (REMClockElementList)initWithEntryArchive:(const void *)a3
{
  int v4 = *((_DWORD *)a3 + 14);
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:*((unsigned int *)a3 + 14)];
    int v7 = 0;
    uint64_t v8 = (char *)a3 + 48;
    do
    {
      int v9 = (const replica_manager::VectorTimestampElement *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<replica_manager::VectorTimestampElement>::TypeHandler>((uint64_t)v8, v7);
      replica_manager::VectorTimestampElement::VectorTimestampElement((replica_manager::VectorTimestampElement *)v13, v9);
      uint64_t v10 = objc_alloc_init(CRVectorTimestampElement);
      [(CRVectorTimestampElement *)v10 setClock:v14];
      [(CRVectorTimestampElement *)v10 setSubclock:v15];
      [v6 addObject:v10];

      replica_manager::VectorTimestampElement::~VectorTimestampElement((replica_manager::VectorTimestampElement *)v13);
      ++v7;
    }
    while (v4 != v7);
    self = [(REMClockElementList *)self initWithCRVectorTimestampElements:v6];

    uint64_t v11 = self;
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)compareList:(os_log_t)log toList:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (aCount != bCount) -- clock elements should have the same count {aCount: %ld, bCount: %ld}", (uint8_t *)&v3, 0x16u);
}

@end