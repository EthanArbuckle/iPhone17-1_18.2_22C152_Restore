@interface TTMergeableStringSelection
- (BOOL)hasTopoIDsThatCanChange;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (TTMergeableStringSelection)initWithArchive:(const void *)a3;
- (TTMergeableStringSelection)initWithData:(id)a3;
- (id).cxx_construct;
- (id)serialize;
- (unint64_t)hash;
- (unint64_t)selectionAffinity;
- (void)saveToArchive:(void *)a3;
- (void)selectionRanges;
- (void)setSelectionAffinity:(unint64_t)a3;
- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4;
@end

@implementation TTMergeableStringSelection

- (void)selectionRanges
{
  return &self->_selectionRanges;
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  begin = (TopoID *)self->_selectionRanges.__begin_;
  end = (TopoID *)self->_selectionRanges.__end_;
  while (begin != end)
  {
    id updated = updateTopoID(begin, a3, a4);
    unsigned int v10 = v9;
    id var0 = begin->var0;
    begin->id var0 = updated;

    begin->var1 = v10;
    v12 = begin + 1;
    id v13 = updateTopoID(v12, a3, a4);
    unsigned int v15 = v14;
    id v16 = v12->var0;
    v12->id var0 = v13;

    v12->var1 = v15;
    begin = v12 + 1;
  }

  id v17 = a3->var0.var0;
}

- (BOOL)hasTopoIDsThatCanChange
{
  begin = (void **)self->_selectionRanges.__begin_;
  end = (void **)self->_selectionRanges.__end_;
  if (begin == end) {
    return 0;
  }
  while (1)
  {
    v4 = *begin;
    uint64_t v5 = +[TTMergeableString unserialisedReplicaID];
    if (v4 == (void *)v5) {
      break;
    }
    v6 = (void *)v5;
    v7 = begin[2];
    v8 = +[TTMergeableString unserialisedReplicaID];

    BOOL result = v7 == v8;
    begin += 4;
    if (v7 == v8 || begin == end) {
      return result;
    }
  }

  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = (uint64_t *)[v5 selectionRanges];
    v7 = v6;
    unint64_t v8 = (v6[1] - *v6) >> 5;
    begin = self->_selectionRanges.__begin_;
    end = self->_selectionRanges.__end_;
    if (v8 == (end - begin) >> 5)
    {
      if (end == begin)
      {
LABEL_12:
        unint64_t v16 = [(TTMergeableStringSelection *)self selectionAffinity];
        BOOL v17 = v16 == [v5 selectionAffinity];
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v11 = 0;
      if (v8 <= 1) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = (v6[1] - *v6) >> 5;
      }
      while (1)
      {
        uint64_t v13 = *v7;
        uint64_t v14 = *v7 + v11;
        unsigned int v15 = (char *)self->_selectionRanges.__begin_;
        if (*(_DWORD *)(v14 + 8) != *(_DWORD *)&v15[v11 + 8]
          || ![*(id *)v14 isEqual:*(void *)&v15[v11]]
          || *(_DWORD *)(v13 + v11 + 24) != *(_DWORD *)&v15[v11 + 24]
          || ([*(id *)(v13 + v11 + 16) isEqual:*(void *)&v15[v11 + 16]] & 1) == 0)
        {
          break;
        }
        v11 += 32;
        if (!--v12) {
          goto LABEL_12;
        }
      }
    }
    BOOL v17 = 0;
    goto LABEL_15;
  }
  BOOL v17 = 0;
LABEL_16:

  return v17;
}

- (unint64_t)hash
{
  begin = (char *)self->_selectionRanges.__begin_;
  uint64_t v3 = (char *)self->_selectionRanges.__end_ - (char *)begin;
  if (!v3) {
    return 0;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  unint64_t v7 = v3 >> 5;
  if (v7 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  do
  {
    uint64_t v9 = [*(id *)&begin[v5] hash];
    unsigned int v10 = (id *)((char *)self->_selectionRanges.__begin_ + v5);
    uint64_t v11 = *((unsigned int *)v10 + 2);
    uint64_t v12 = [v10[2] hash];
    begin = (char *)self->_selectionRanges.__begin_;
    v6 ^= v9 ^ v11 ^ v12 ^ *(unsigned int *)&begin[v5 + 24];
    v5 += 32;
    --v8;
  }
  while (v8);
  return v6;
}

- (TTMergeableStringSelection)initWithData:(id)a3
{
  id v4 = a3;
  topotext::Selection::Selection((topotext::Selection *)v11);
  id v5 = v4;
  unint64_t v6 = (char *)[v5 bytes];
  int v7 = TTBoundedCheckedCastNSUIntegerToUInt32([v5 length]);
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = [(TTMergeableStringSelection *)self initWithArchive:v11];
    uint64_t v8 = self;
  }
  else
  {
    uint64_t v9 = +[REMLog crdt];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[TTMergeableStringSelection initWithData:](v9);
    }

    uint64_t v8 = 0;
  }
  topotext::Selection::~Selection((topotext::Selection *)v11);

  return v8;
}

- (TTMergeableStringSelection)initWithArchive:(const void *)a3
{
  id v4 = [(TTMergeableStringSelection *)self init];
  id v5 = v4;
  if (v4)
  {
    int v6 = *((_DWORD *)a3 + 18);
    v28 = v4;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v29 = a3;
    int v8 = *((_DWORD *)a3 + 12);
    if (v8)
    {
      for (int i = 0; i != v8; ++i)
      {
        id v10 = objc_alloc(MEMORY[0x1E4F29128]);
        uint64_t v11 = google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<std::string>::TypeHandler>((uint64_t)(v29 + 10), i);
        if (*(char *)(v11 + 23) >= 0) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = *(void *)v11;
        }
        uint64_t v13 = objc_msgSend(v10, "initWithUUIDBytes:", v12, v28);
        [v7 addObject:v13];
      }
    }
    if (v6)
    {
      int v14 = 0;
      uint64_t v15 = (uint64_t)(v29 + 16);
      p_selectionRanges = (uint64_t *)&v28->_selectionRanges;
      do
      {
        BOOL v17 = (topotext::Selection_Range *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Selection_Range>::TypeHandler>(v15, v14);
        uint64_t v18 = *((void *)v17 + 5);
        if (!v18) {
          uint64_t v18 = *(void *)(topotext::Selection_Range::default_instance(v17) + 40);
        }
        v19 = objc_msgSend(v7, "objectAtIndexedSubscript:", *(unsigned int *)(v18 + 40), v28);
        int v20 = *(_DWORD *)(v18 + 44);
        if ((*(unsigned char *)(google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Selection_Range>::TypeHandler>(v15, v14)+ 32) & 2) != 0)
        {
          v23 = (topotext::Selection_Range *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<topotext::Selection_Range>::TypeHandler>(v15, v14);
          uint64_t v24 = *((void *)v23 + 6);
          if (!v24) {
            uint64_t v24 = *(void *)(topotext::Selection_Range::default_instance(v23) + 48);
          }
          v21 = [v7 objectAtIndexedSubscript:*(unsigned int *)(v24 + 40)];
          int v22 = *(_DWORD *)(v24 + 44);
        }
        else
        {
          v21 = [MEMORY[0x1E4F29128] TTZero];
          int v22 = 0;
        }
        id v25 = v19;
        id v30 = v25;
        int v31 = v20;
        id v26 = v21;
        id v32 = v26;
        int v33 = v22;
        std::vector<std::pair<TopoID,TopoID>>::push_back[abi:ne180100](p_selectionRanges, (uint64_t *)&v30);

        ++v14;
      }
      while (v6 != v14);
    }
    id v5 = v28;
    -[TTMergeableStringSelection setSelectionAffinity:](v28, "setSelectionAffinity:", v29[22] & ((int)(v29[8] << 29) >> 31), v28);
  }
  return v5;
}

- (void)saveToArchive:(void *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __44__TTMergeableStringSelection_saveToArchive___block_invoke;
  v38[3] = &unk_1E61DE2D8;
  id v6 = v5;
  id v39 = v6;
  id v7 = (uint64_t (**)(void, void))MEMORY[0x1BA9DBBC0](v38);
  begin = self->_selectionRanges.__begin_;
  for (int i = self->_selectionRanges.__end_; begin != i; begin += 4)
  {
    int v10 = *((_DWORD *)a3 + 19);
    uint64_t v11 = *((int *)a3 + 18);
    if ((int)v11 >= v10)
    {
      if (v10 == *((_DWORD *)a3 + 20)) {
        google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 64, v10 + 1);
      }
      google::protobuf::internal::GenericTypeHandler<topotext::Selection_Range>::New();
    }
    uint64_t v12 = *((void *)a3 + 8);
    *((_DWORD *)a3 + 18) = v11 + 1;
    uint64_t v13 = *(void *)(v12 + 8 * v11);
    *(_DWORD *)(v13 + 32) |= 1u;
    uint64_t v14 = *(void *)(v13 + 40);
    if (!v14) {
      operator new();
    }
    int v15 = v7[2](v7, *begin);
    *(_DWORD *)(v14 + 32) |= 1u;
    *(_DWORD *)(v14 + 40) = v15;
    *(_DWORD *)(v13 + 32) |= 1u;
    uint64_t v16 = *(void *)(v13 + 40);
    if (!v16) {
      operator new();
    }
    int v17 = *((_DWORD *)begin + 2);
    *(_DWORD *)(v16 + 32) |= 2u;
    *(_DWORD *)(v16 + 44) = v17;
    uint64_t v18 = begin[2];
    if (v18 || *((_DWORD *)begin + 6))
    {
      *(_DWORD *)(v13 + 32) |= 2u;
      uint64_t v19 = *(void *)(v13 + 48);
      if (!v19) {
        operator new();
      }
      int v20 = v7[2](v7, v18);
      *(_DWORD *)(v19 + 32) |= 1u;
      *(_DWORD *)(v19 + 40) = v20;
      *(_DWORD *)(v13 + 32) |= 2u;
      uint64_t v21 = *(void *)(v13 + 48);
      if (!v21) {
        operator new();
      }
      int v22 = *((_DWORD *)begin + 6);
      *(_DWORD *)(v21 + 32) |= 2u;
      *(_DWORD *)(v21 + 44) = v22;
    }
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v23 = v6;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v23);
        }
        v27 = *(void **)(*((void *)&v34 + 1) + 8 * j);
        v40[0] = 0;
        v40[1] = 0;
        v28 = (google::protobuf::internal::StringTypeHandlerBase *)objc_msgSend(v27, "getUUIDBytes:", v40, (void)v34);
        int v29 = *((_DWORD *)a3 + 13);
        uint64_t v30 = *((int *)a3 + 12);
        if ((int)v30 >= v29)
        {
          if (v29 == *((_DWORD *)a3 + 14)) {
            v28 = (google::protobuf::internal::StringTypeHandlerBase *)google::protobuf::internal::RepeatedPtrFieldBase::Reserve((uint64_t)a3 + 40, v29 + 1);
          }
          google::protobuf::internal::StringTypeHandlerBase::New(v28);
        }
        uint64_t v31 = *((void *)a3 + 5);
        *((_DWORD *)a3 + 12) = v30 + 1;
        MEMORY[0x1BA9DB490](*(void *)(v31 + 8 * v30), v40, 16);
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v24);
  }

  id v32 = [(TTMergeableStringSelection *)self selectionAffinity];
  int v33 = (int)v32;
  if (!topotext::Selection_Affinity_IsValid(v32)) {
    __assert_rtn("set_affinity", "topotext.pb.h", 3757, "::topotext::Selection_Affinity_IsValid(value)");
  }
  *((_DWORD *)a3 + 8) |= 4u;
  *((_DWORD *)a3 + 22) = v33;
}

uint64_t __44__TTMergeableStringSelection_saveToArchive___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) indexOfObject:v3];
  uint64_t v5 = v4;
  if (v3 && v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [*(id *)(a1 + 32) count];
    [*(id *)(a1 + 32) addObject:v3];
  }

  return v5;
}

- (id)serialize
{
  topotext::Selection::Selection((topotext::Selection *)v7);
  [(TTMergeableStringSelection *)self saveToArchive:v7];
  id v3 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::Selection::ByteSize((topotext::Selection *)v7)];
  uint64_t v4 = (void *)[v3 mutableBytes];
  int v5 = TTBoundedCheckedCastNSUIntegerToUInt32([v3 length]);
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v7, v4, v5);
  topotext::Selection::~Selection((topotext::Selection *)v7);

  return v3;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v3, "appendFormat:", @"<TTMergeableStringSelection %p ", self);
  begin = (id *)self->_selectionRanges.__begin_;
  for (int i = (id *)self->_selectionRanges.__end_; begin != i; begin += 4)
  {
    id v6 = [*begin TTShortDescription];
    [v3 appendFormat:@" %@:%d", v6, *((unsigned int *)begin + 2)];

    id v7 = begin[2];
    int v8 = [MEMORY[0x1E4F29128] TTZero];
    if ([v7 isEqual:v8])
    {
      int v9 = *((_DWORD *)begin + 6);

      if (!v9) {
        continue;
      }
    }
    else
    {
    }
    int v10 = [begin[2] TTShortDescription];
    [v3 appendFormat:@"-%@:%d", v10, *((unsigned int *)begin + 6)];
  }
  [v3 appendFormat:@">"];

  return (NSString *)v3;
}

- (unint64_t)selectionAffinity
{
  return self->_selectionAffinity;
}

- (void)setSelectionAffinity:(unint64_t)a3
{
  self->_selectionAffinity = a3;
}

- (void).cxx_destruct
{
  p_selectionRanges = &self->_selectionRanges;
  std::vector<std::pair<TopoID,TopoID>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_selectionRanges);
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void)initWithData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "TTMergeableStringSelection protobuf corrupt.", v1, 2u);
}

@end