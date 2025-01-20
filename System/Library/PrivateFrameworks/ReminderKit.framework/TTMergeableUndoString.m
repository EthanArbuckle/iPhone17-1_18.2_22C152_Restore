@interface TTMergeableUndoString
- (TopoIDRange)insertAttributedString:(SEL)a3 after:(id)a4 before:(void *)a5;
- (void)addUndoCommand:(id)a3;
- (void)applyUndoCommand:(id)a3;
- (void)deleteSubstrings:(void *)a3 withCharacterRanges:(void *)a4;
- (void)undeleteSubstrings:(void *)a3;
@end

@implementation TTMergeableUndoString

- (void)addUndoCommand:(id)a3
{
  id v7 = a3;
  v4 = [(TTMergeableString *)self objectsNeedingUpdatedRanges];
  [v4 addObject:v7];

  v5 = [(TTMergeableString *)self delegate];
  [v5 addUndoCommand:v7];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:TTMergeableUndoStringDidAddUndoNotification object:self];
}

- (void)applyUndoCommand:(id)a3
{
}

- (void)deleteSubstrings:(void *)a3 withCharacterRanges:(void *)a4
{
  uint64_t v7 = [(TTMergeableString *)self delegate];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(TTMergeableString *)self delegate];
    int v10 = [v9 wantsUndoCommands];

    if (v10)
    {
      v11 = objc_alloc_init(TTMergeableStringUndoEditCommand);
      v12 = *(uint64_t **)a3;
      v13 = (uint64_t *)*((void *)a3 + 1);
      while (v12 != v13)
      {
        uint64_t v14 = *v12;
        if (!*(unsigned char *)(*v12 + 44))
        {
          v15 = [(TTMergeableStringUndoEditCommand *)v11 insertStrings];
          v16 = [(TTMergeableString *)self attributedString];
          v17 = v16;
          if (*(unsigned char *)(v14 + 44)) {
            uint64_t v18 = 0;
          }
          else {
            uint64_t v18 = *(unsigned int *)(v14 + 16);
          }
          v19 = objc_msgSend(v16, "attributedSubstringFromRange:", *(unsigned int *)(v14 + 40), v18);
          id v22 = *(id *)v14;
          int v20 = *(_DWORD *)(v14 + 16);
          int v23 = *(_DWORD *)(v14 + 8);
          int v24 = v20;
          id v25 = v19;
          std::vector<std::pair<TopoIDRange,NSAttributedString * {__strong}>>::push_back[abi:ne180100](v15, (uint64_t *)&v22);
        }
        ++v12;
      }
      [(TTMergeableUndoString *)self addUndoCommand:v11];
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)TTMergeableUndoString;
  [(TTMergeableString *)&v21 deleteSubstrings:a3 withCharacterRanges:a4];
}

- (void)undeleteSubstrings:(void *)a3
{
  uint64_t v5 = [(TTMergeableString *)self delegate];
  if (v5)
  {
    v6 = (void *)v5;
    uint64_t v7 = [(TTMergeableString *)self delegate];
    int v8 = [v7 wantsUndoCommands];

    if (v8)
    {
      v9 = objc_alloc_init(TTMergeableStringUndoEditCommand);
      uint64_t v10 = *(void *)a3;
      uint64_t v11 = *((void *)a3 + 1);
      while (v10 != v11)
      {
        *(void *)&long long v49 = *(id *)v10;
        DWORD2(v49) = *(_DWORD *)(v10 + 8);
        LODWORD(v50) = *(_DWORD *)(v10 + 16);
        *((void *)&v50 + 1) = *(id *)(v10 + 24);
        if (*((void *)&v50 + 1))
        {
          v12 = [(TTMergeableStringUndoEditCommand *)v9 deleteRanges];
          v13 = v12;
          unint64_t v14 = v12[1];
          if (v14 >= v12[2])
          {
            uint64_t v15 = std::vector<TopoIDRange>::__push_back_slow_path<TopoIDRange const&>(v12, (uint64_t)&v49);
          }
          else
          {
            *(void *)unint64_t v14 = (id)v49;
            *(_DWORD *)(v14 + 8) = DWORD2(v49);
            *(_DWORD *)(v14 + 16) = v50;
            uint64_t v15 = v14 + 24;
          }
          v13[1] = v15;
          v16 = (void *)*((void *)&v50 + 1);
        }
        else
        {
          v16 = 0;
        }

        v10 += 32;
      }
      v17 = [(TTMergeableStringUndoEditCommand *)v9 deleteRanges];
      if (v17[1] == *v17)
      {

        return;
      }
      [(TTMergeableUndoString *)self addUndoCommand:v9];
    }
  }
  long long v49 = 0u;
  long long v50 = 0u;
  int v51 = 1065353216;
  uint64_t v18 = *(void *)a3;
  uint64_t v41 = *((void *)a3 + 1);
  if (*(void *)a3 != v41)
  {
    do
    {
      id v19 = *(id *)v18;
      int v20 = *(_DWORD *)(v18 + 8);
      int v21 = *(_DWORD *)(v18 + 16);
      id v22 = *(id *)(v18 + 24);
      if (v22)
      {
        __p = 0;
        v47 = 0;
        uint64_t v48 = 0;
        id v23 = v19;
        id v43 = v23;
        int v44 = v20;
        int v45 = v21;
        if (self) {
          [(TTMergeableString *)self getSubstrings:&__p forTopoIDRange:&v43];
        }
        else {

        }
        int v24 = v47;
        while (v24 != __p)
        {
          uint64_t v42 = 0;
          uint64_t v26 = *((void *)v24 - 1);
          v24 -= 8;
          uint64_t v25 = v26;
          uint64_t v42 = v26;
          if (*(unsigned char *)(v26 + 44))
          {
            int v27 = *(_DWORD *)(v25 + 8);
            uint64_t v28 = *(unsigned int *)(v25 + 16);
            v29 = [(TTMergeableString *)self attributedString];
            v30 = objc_msgSend(v22, "attributedSubstringFromRange:", (v27 - v20), v28);
            [v29 insertAttributedString:v30 atIndex:*(unsigned int *)(v42 + 40)];

            *(unsigned char *)(v42 + 44) = 0;
            uint64_t v31 = +[TTMergeableString unserialisedReplicaID];
            v32 = *(void **)(v42 + 24);
            *(void *)(v42 + 24) = v31;

            std::__hash_table<TopoSubstring *,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,std::allocator<TopoSubstring *>>::__emplace_unique_key_args<TopoSubstring *,TopoSubstring * const&>((uint64_t)&v49, &v42, &v42);
          }
        }
        [(TTMergeableString *)self updateSubstringIndexes];
        if (__p)
        {
          v47 = (char *)__p;
          operator delete(__p);
        }
      }

      v18 += 32;
    }
    while (v18 != v41);
  }
  v33 = [(TTMergeableString *)self delegate];

  if (v33)
  {
    v34 = [(TTMergeableString *)self orderedSubstrings];
    v35 = *v34;
    v36 = v34[1];
    if (*v34 != v36)
    {
      uint64_t v37 = 0;
      do
      {
        __p = *v35;
        if (std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::find<TopoSubstring *>(&v49, &__p))
        {
          uint64_t v38 = *((unsigned int *)__p + 4);
          v39 = [(TTMergeableString *)self delegate];
          objc_msgSend(v39, "edited:range:changeInLength:", 2, v37, 0, v38);
        }
        if (*((unsigned char *)__p + 44)) {
          uint64_t v40 = 0;
        }
        else {
          uint64_t v40 = *((unsigned int *)__p + 4);
        }
        v37 += v40;
        ++v35;
      }
      while (v35 != v36);
    }
  }
  [(TTMergeableString *)self setHasLocalChanges:1];
  [(TTMergeableString *)self coalesce];
  [(TTMergeableString *)self updateSubstringIndexes];
  std::__hash_table<std::__hash_value_type<TopoSubstring *,unsigned long>,std::__unordered_map_hasher<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::hash<TopoSubstring *>,std::equal_to<TopoSubstring *>,true>,std::__unordered_map_equal<TopoSubstring *,std::__hash_value_type<TopoSubstring *,unsigned long>,std::equal_to<TopoSubstring *>,std::hash<TopoSubstring *>,true>,std::allocator<std::__hash_value_type<TopoSubstring *,unsigned long>>>::~__hash_table((uint64_t)&v49);
}

- (TopoIDRange)insertAttributedString:(SEL)a3 after:(id)a4 before:(void *)a5
{
  v17.receiver = self;
  v17.super_class = (Class)TTMergeableUndoString;
  result = (TopoIDRange *)[(TopoIDRange *)&v17 insertAttributedString:a4 after:a5 before:a6];
  if (retstr->var1)
  {
    result = [(TTMergeableString *)self delegate];
    v9 = result;
    if (result)
    {
      uint64_t v10 = [(TTMergeableString *)self delegate];
      int v11 = [v10 wantsUndoCommands];

      if (v11)
      {
        v12 = objc_alloc_init(TTMergeableStringUndoEditCommand);
        v13 = [(TTMergeableStringUndoEditCommand *)v12 deleteRanges];
        unint64_t v14 = v13;
        unint64_t v15 = v13[1];
        if (v15 >= v13[2])
        {
          uint64_t v16 = std::vector<TopoIDRange>::__push_back_slow_path<TopoIDRange const&>(v13, (uint64_t)retstr);
        }
        else
        {
          *(void *)unint64_t v15 = retstr->var0.var0;
          *(_DWORD *)(v15 + 8) = retstr->var0.var1;
          *(_DWORD *)(v15 + 16) = retstr->var1;
          uint64_t v16 = v15 + 24;
        }
        v14[1] = v16;
        [(TTMergeableUndoString *)self addUndoCommand:v12];
      }
    }
  }
  return result;
}

@end