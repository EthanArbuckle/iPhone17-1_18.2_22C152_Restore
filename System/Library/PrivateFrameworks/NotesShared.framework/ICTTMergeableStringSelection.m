@interface ICTTMergeableStringSelection
- (BOOL)hasTopoIDsThatCanChange;
- (BOOL)isEqual:(id)a3;
- (ICTTMergeableStringSelection)initWithArchive:(const void *)a3;
- (ICTTMergeableStringSelection)initWithData:(id)a3;
- (ICTTMergeableStringSelection)locationOnlySelection;
- (NSString)description;
- (TopoID)minTopoID;
- (id).cxx_construct;
- (id)serialize;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (unint64_t)selectionAffinity;
- (void)saveToArchive:(void *)a3;
- (void)selectionRanges;
- (void)setSelectionAffinity:(unint64_t)a3;
- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4;
@end

@implementation ICTTMergeableStringSelection

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void)setSelectionAffinity:(unint64_t)a3
{
  self->_selectionAffinity = a3;
}

- (void)selectionRanges
{
  return &self->_selectionRanges;
}

- (unint64_t)selectionAffinity
{
  return self->_selectionAffinity;
}

- (void).cxx_destruct
{
  p_selectionRanges = &self->_selectionRanges;
  std::vector<std::pair<TopoID,TopoID>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_selectionRanges);
}

- (void)updateTopoIDRange:(TopoIDRange *)a3 toNewRangeID:(TopoIDRange *)a4
{
  begin = (TopoID *)self->_selectionRanges.__begin_;
  end = (TopoID *)self->_selectionRanges.__end_;
  while (begin != end)
  {
    updated = updateTopoID(begin, a3, a4);
    unsigned int v10 = v9;
    replicaID = begin->replicaID;
    begin->replicaID = updated;

    begin->clock = v10;
    v12 = begin + 1;
    v13 = updateTopoID(v12, a3, a4);
    unsigned int v15 = v14;
    v16 = v12->replicaID;
    v12->replicaID = v13;

    v12->clock = v15;
    begin = v12 + 1;
  }

  v17 = a3->var0.replicaID;
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
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
    if (v4 == (void *)v5) {
      break;
    }
    v6 = (void *)v5;
    v7 = begin[2];
    v8 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");

    BOOL result = v7 == v8;
    begin += 4;
    if (v7 == v8 || begin == end) {
      return result;
    }
  }

  return 1;
}

- (TopoID)minTopoID
{
  begin = (id *)self->_selectionRanges.__begin_;
  if (self->_selectionRanges.__end_ == begin)
  {
    uint64_t v7 = 0;
    v4 = 0;
  }
  else
  {
    v4 = (NSUUID *)*begin;
    uint64_t v5 = *((unsigned int *)begin + 2);
    v6 = (char *)self->_selectionRanges.__begin_;
    if ((void *)((char *)self->_selectionRanges.__end_ - (char *)v6) >= (void *)0x40)
    {
      uint64_t v8 = 0;
      unint64_t v9 = 1;
      do
      {
        unsigned int v10 = &v6[v8];
        id v11 = *(id *)&v6[v8 + 32];
        v12 = v11;
        uint64_t v7 = *((unsigned int *)v10 + 10);
        if (v7 < v5
          || v7 == v5 && [v11 TTCompare:v4] == -1)
        {
          v13 = v12;

          v4 = v13;
        }
        else
        {
          uint64_t v7 = v5;
        }

        ++v9;
        v6 = (char *)self->_selectionRanges.__begin_;
        v8 += 32;
        uint64_t v5 = v7;
      }
      while (v9 < ((char *)self->_selectionRanges.__end_ - (char *)v6) >> 5);
    }
    else
    {
      uint64_t v7 = *((unsigned int *)begin + 2);
    }
  }
  unsigned int v14 = v4;
  uint64_t v15 = v7;
  result.clock = v15;
  result.replicaID = v14;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = (uint64_t *)[v5 selectionRanges];
    uint64_t v7 = v6;
    unint64_t v8 = (v6[1] - *v6) >> 5;
    begin = self->_selectionRanges.__begin_;
    end = self->_selectionRanges.__end_;
    if (v8 == (end - begin) >> 5)
    {
      if (end == begin)
      {
LABEL_12:
        unint64_t v16 = [(ICTTMergeableStringSelection *)self selectionAffinity];
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
        uint64_t v15 = (char *)self->_selectionRanges.__begin_;
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

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = ICDynamicCast();
  if (v5)
  {
    v6 = (void *)[(ICTTMergeableStringSelection *)self minTopoID];
    unsigned int v8 = v7;
    unsigned int v10 = (void *)[v5 minTopoID];
    unsigned int v11 = v9;
    if (v8 < v9)
    {
LABEL_3:
      int64_t v12 = -1;
LABEL_12:

      goto LABEL_13;
    }
    if (v8 == v9)
    {
      if ([v6 TTCompare:v10] == -1) {
        goto LABEL_3;
      }
      if (v8 <= v11 && [v6 TTCompare:v10] != 1)
      {
LABEL_9:
        int64_t v12 = 0;
        goto LABEL_12;
      }
    }
    else if (v8 <= v9)
    {
      goto LABEL_9;
    }
    int64_t v12 = 1;
    goto LABEL_12;
  }
  int64_t v12 = -1;
LABEL_13:

  return v12;
}

- (unint64_t)hash
{
  begin = (char *)self->_selectionRanges.__begin_;
  if (self->_selectionRanges.__end_ == begin) {
    return 0;
  }
  uint64_t v4 = 0;
  unint64_t v5 = 0;
  unint64_t v6 = 0;
  do
  {
    uint64_t v7 = [*(id *)&begin[v4] hash];
    unsigned int v8 = (id *)((char *)self->_selectionRanges.__begin_ + v4);
    uint64_t v9 = *((unsigned int *)v8 + 2) - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6);
    uint64_t v10 = [v8[2] hash];
    begin = (char *)self->_selectionRanges.__begin_;
    unint64_t v6 = *(unsigned int *)&begin[v4 + 24] - (v10 - v9 + 32 * v9) + 32 * (v10 - v9 + 32 * v9);
    ++v5;
    v4 += 32;
  }
  while (v5 < ((char *)self->_selectionRanges.__end_ - (char *)begin) >> 5);
  return v6;
}

- (ICTTMergeableStringSelection)initWithData:(id)a3
{
  id v4 = a3;
  topotext::Selection::Selection((topotext::Selection *)v11);
  id v5 = v4;
  unint64_t v6 = (char *)[v5 bytes];
  int v7 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v5 length]);
  if (google::protobuf::MessageLite::ParseFromArray((google::protobuf::MessageLite *)v11, v6, v7))
  {
    self = [(ICTTMergeableStringSelection *)self initWithArchive:v11];
    unsigned int v8 = self;
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICTTMergeableStringSelection initWithData:](v9);
    }

    unsigned int v8 = 0;
  }
  topotext::Selection::~Selection((topotext::Selection *)v11);

  return v8;
}

- (ICTTMergeableStringSelection)initWithArchive:(const void *)a3
{
  id v4 = [(ICTTMergeableStringSelection *)self init];
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
    -[ICTTMergeableStringSelection setSelectionAffinity:](v28, "setSelectionAffinity:", v29[22] & ((int)(v29[8] << 29) >> 31), v28);
  }
  return v5;
}

- (void)saveToArchive:(void *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__ICTTMergeableStringSelection_saveToArchive___block_invoke;
  aBlock[3] = &unk_1E64A5A88;
  id v6 = v5;
  id v39 = v6;
  id v7 = (uint64_t (**)(void *, void))_Block_copy(aBlock);
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
        MEMORY[0x1C877D5C0](*(void *)(v31 + 8 * v30), v40, 16);
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v24);
  }

  id v32 = [(ICTTMergeableStringSelection *)self selectionAffinity];
  int v33 = (int)v32;
  if (!topotext::Selection_Affinity_IsValid(v32)) {
    __assert_rtn("set_affinity", "topotext.pb.h", 4122, "::topotext::Selection_Affinity_IsValid(value)");
  }
  *((_DWORD *)a3 + 8) |= 4u;
  *((_DWORD *)a3 + 22) = v33;
}

uint64_t __46__ICTTMergeableStringSelection_saveToArchive___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) indexOfObject:v3];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v4 = [*(id *)(a1 + 32) count];
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
  else
  {
    uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (id)serialize
{
  topotext::Selection::Selection((topotext::Selection *)v7);
  [(ICTTMergeableStringSelection *)self saveToArchive:v7];
  id v3 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:(int)topotext::Selection::ByteSize((topotext::Selection *)v7)];
  uint64_t v4 = (void *)[v3 mutableBytes];
  int v5 = ICTTBoundedCheckedCastNSUIntegerToUInt32([v3 length]);
  google::protobuf::MessageLite::SerializeToArray((google::protobuf::MessageLite *)v7, v4, v5);
  topotext::Selection::~Selection((topotext::Selection *)v7);
  return v3;
}

- (ICTTMergeableStringSelection)locationOnlySelection
{
  begin = (id *)self->_selectionRanges.__begin_;
  if (self->_selectionRanges.__end_ == begin)
  {
    id v6 = objc_alloc_init(ICTTMergeableStringSelection);
  }
  else
  {
    id v3 = *begin;
    id v15 = begin[2];
    int v16 = *((_DWORD *)begin + 6);
    int v4 = v16;
    id v5 = v15;
    id v13 = v5;

    int v14 = v16;
    id v6 = objc_alloc_init(ICTTMergeableStringSelection);
    id v7 = [(ICTTMergeableStringSelection *)v6 selectionRanges];
    int v8 = v7;
    unint64_t v9 = v7[1];
    if (v9 >= v7[2])
    {
      uint64_t v11 = std::vector<std::pair<TopoID,TopoID>>::__push_back_slow_path<std::pair<TopoID,TopoID> const&>(v7, (uint64_t)&v13);
    }
    else
    {
      id v10 = v5;
      *(void *)unint64_t v9 = v10;
      *(_DWORD *)(v9 + 8) = v4;
      *(void *)(v9 + 16) = v10;
      *(_DWORD *)(v9 + 24) = v4;
      uint64_t v11 = v9 + 32;
      v8[1] = v9 + 32;
    }
    v8[1] = v11;
  }
  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v3, "appendFormat:", @"<ICTTMergeableStringSelection %p ", self);
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
    id v10 = [begin[2] TTShortDescription];
    [v3 appendFormat:@"-%@:%d", v10, *((unsigned int *)begin + 6)];
  }
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (void)initWithData:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C3A61000, log, OS_LOG_TYPE_ERROR, "ICTTMergeableStringSelection protobuf corrupt.", v1, 2u);
}

@end