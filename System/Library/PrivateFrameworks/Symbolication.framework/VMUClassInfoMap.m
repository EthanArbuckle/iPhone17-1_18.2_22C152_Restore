@interface VMUClassInfoMap
+ (BOOL)supportsSecureCoding;
+ (void)_destroyRetainedLinearArray:(id *)a3 withCount:(unsigned int)a4;
- (BOOL)hasClassInfosDerivedFromStackBacktraces;
- (VMUClassInfoMap)init;
- (VMUClassInfoMap)initWithCoder:(id)a3;
- (id).cxx_construct;
- (id)_retainedLinearArrayWithReturnedCount:(unsigned int *)a3;
- (id)classInfoForAddress:(unint64_t)a3;
- (id)classInfoForIndex:(unsigned int)a3;
- (id)fieldInfoForIndex:(unsigned int)a3;
- (id)swiftFieldWithName:(const char *)a3 offset:(unsigned int)a4 kind:(unsigned int)a5 typeref:(swift_typeref_interop)a6;
- (unsigned)addClassInfo:(id)a3 forAddress:(unint64_t)a4;
- (unsigned)addFieldInfo:(id)a3;
- (unsigned)count;
- (unsigned)fieldInfoCount;
- (unsigned)indexForClassInfo:(id)a3;
- (unsigned)indexForFieldInfo:(id)a3;
- (void)_applyTypeOverlay:(id)a3;
- (void)_applyTypeOverlayRules:(void *)a3 toMutableInfo:;
- (void)addClassInfosFromMap:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateInfosWithBlock:(id)a3;
- (void)memoizeSwiftField:(id)a3 withName:(const char *)a4 offset:(unsigned int)a5 kind:(unsigned int)a6 typeref:(swift_typeref_interop)a7;
@end

@implementation VMUClassInfoMap

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)_destroyRetainedLinearArray:(id *)a3 withCount:(unsigned int)a4
{
  if (a3)
  {
    if (a4)
    {
      uint64_t v5 = a4;
      v6 = a3;
      do
      {
        id v7 = *v6;
        *v6++ = 0;

        --v5;
      }
      while (v5);
    }
    free(a3);
  }
}

- (VMUClassInfoMap)init
{
  v8.receiver = self;
  v8.super_class = (Class)VMUClassInfoMap;
  v2 = [(VMUClassInfoMap *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    linearClassInfos = v2->_linearClassInfos;
    v2->_linearClassInfos = (NSMutableArray *)v3;

    uint64_t v5 = objc_opt_new();
    linearFieldInfos = v2->_linearFieldInfos;
    v2->_linearFieldInfos = (NSMutableArray *)v5;
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 allowsKeyedCoding] & 1) == 0) {
    __assert_rtn("-[VMUClassInfoMap encodeWithCoder:]", "VMUClassInfoMap.mm", 133, "[coder allowsKeyedCoding]");
  }
  uint64_t v5 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v6 = self->_linearClassInfos;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __35__VMUClassInfoMap_encodeWithCoder___block_invoke;
        v25[3] = &unk_1E5D256D0;
        v25[4] = self;
        [v10 enumerateTypeFieldsWithBlock:v25];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  [v5 serialize32:-[NSMutableArray count](self->_linearFieldInfos, "count")];
  [v5 serialize32:-[VMUClassInfoMap count](self, "count")];
  uint64_t v11 = [(id)objc_opt_class() version];
  [v5 serialize32:v11];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = self->_linearFieldInfos;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v15++) serializeWithClassMap:self simpleSerializer:v5 version:v11];
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v13);
  }

  v16 = objc_opt_new();
  for (unsigned int i = 0; [(NSMutableArray *)self->_linearClassInfos count] > (unint64_t)i; ++i)
  {
    v18 = [(NSMutableArray *)self->_linearClassInfos objectAtIndexedSubscript:i];
    [v18 serializeWithClassMap:self simpleSerializer:v5 version:v11];
    if ([v18 isDerivedFromStackBacktrace]) {
      [v16 addIndex:i];
    }
  }
  v19 = (void *)[v5 copyContiguousData];
  [v4 encodeObject:v19 forKey:@"simpleSerializerData"];
  v20 = [NSNumber numberWithUnsignedInt:3];
  [v4 encodeObject:v20 forKey:@"classMapVersion"];

  if ([v16 count]) {
    [v4 encodeObject:v16 forKey:@"classInfosDerivedFromStackBacktraces"];
  }
}

uint64_t __35__VMUClassInfoMap_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) addFieldInfo:a2];
  *a4 = 0;
  return result;
}

- (VMUClassInfoMap)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMUClassInfoMap *)self init];
  if (v5)
  {
    if ([v4 allowsKeyedCoding]
      && (unint64_t v6 = 0x1E4F28000uLL,
          [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classMapVersion"],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v7 unsignedIntValue],
          v7,
          v8 >= 2))
    {
      uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"simpleSerializerData"];
      v10 = [[VMUSimpleDeserializer alloc] initWithData:v9];
      uint64_t v11 = v10;
      if (v8 < 3)
      {
        unsigned int v12 = 0;
      }
      else
      {
        v47[0] = 0;
        unsigned int v12 = [(VMUSimpleDeserializer *)v10 deserialize32WithError:v47];
        id v13 = v47[0];
        if (v13)
        {
LABEL_16:

          v16 = 0;
          goto LABEL_11;
        }
      }
      v33 = v9;
      v34 = objc_opt_new();
      id v46 = 0;
      unsigned int v32 = [(VMUSimpleDeserializer *)v11 deserialize32WithError:&v46];
      id v13 = v46;
      if (v13
        || (id v45 = 0,
            unsigned int v35 = [(VMUSimpleDeserializer *)v11 deserialize32WithError:&v45],
            (id v13 = v45) != 0))
      {
LABEL_15:

        uint64_t v9 = v33;
        goto LABEL_16;
      }
      if (v12)
      {
        uint64_t v18 = 0;
        v31 = v11;
        do
        {
          v19 = (void *)MEMORY[0x1AD0D9F90]();
          unsigned int v44 = 0;
          v20 = [VMUFieldInfo alloc];
          id v43 = 0;
          long long v21 = [(VMUFieldInfo *)v20 initWithSerializer:v11 classMap:v5 version:v35 returnedDestinationLayoutClassInfoIndex:&v44 error:&v43];
          id v13 = v43;
          if (!v13)
          {
            [(NSMutableArray *)v5->_linearFieldInfos addObject:v21];
            v41 = v21;
            LODWORD(v42) = v18 + 1;
            std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUFieldInfo * {__strong},std::pair<VMUFieldInfo * {__strong},unsigned int>>((uint64_t)&v5->_fieldInfoToIndexMap, (id *)&v41, (uint64_t *)&v41);

            if (v44)
            {
              long long v22 = [*(id *)(v6 + 3792) numberWithUnsignedInt:];
              unint64_t v23 = v6;
              long long v24 = [*(id *)(v6 + 3792) numberWithUnsignedInt:v18];
              [v34 setObject:v22 forKeyedSubscript:v24];

              unint64_t v6 = v23;
              uint64_t v11 = v31;
            }
          }

          if (v13) {
            goto LABEL_15;
          }
          uint64_t v18 = (v18 + 1);
        }
        while (v12 != v18);
      }
      if (v32)
      {
        uint64_t v25 = 1;
        do
        {
          long long v26 = (void *)MEMORY[0x1AD0D9F90]();
          long long v27 = [VMUClassInfo alloc];
          id v40 = 0;
          long long v28 = [(VMUClassInfo *)v27 initWithSerializer:v11 classMap:v5 version:v35 error:&v40];
          id v13 = v40;
          if (!v13)
          {
            [(NSMutableArray *)v5->_linearClassInfos addObject:v28];
            long long v29 = v28;
            v41 = (VMUFieldInfo *)v29;
            LODWORD(v42) = v25;
            std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUClassInfo * {__strong},std::pair<VMUClassInfo * {__strong},unsigned int>>((uint64_t)&v5->_classInfoToIndexMap, (unint64_t *)&v41, (uint64_t *)&v41);

            if ([(VMUClassInfo *)v29 remoteIsa])
            {
              v41 = [(VMUClassInfo *)v29 remoteIsa];
              uint64_t v42 = v25;
              std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,unsigned int>>((uint64_t)&v5->_isaAddressToIndexMap, (unint64_t *)&v41, (uint64_t)&v41);
            }
          }

          if (v13) {
            goto LABEL_15;
          }
        }
        while (++v25 - v32 != 1);
      }
      v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classInfosDerivedFromStackBacktraces"];
      if ([v30 count])
      {
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __33__VMUClassInfoMap_initWithCoder___block_invoke;
        v38[3] = &unk_1E5D256F8;
        v39 = v5;
        [v30 enumerateIndexesUsingBlock:v38];
      }
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __33__VMUClassInfoMap_initWithCoder___block_invoke_2;
      v36[3] = &unk_1E5D25720;
      v37 = v5;
      [v34 enumerateKeysAndObjectsUsingBlock:v36];
    }
    else
    {
      unsigned int v44 = 0;
      v41 = 0;
      [v4 decodeValueOfObjCType:"I" at:&v44 size:4];
      if (v44)
      {
        for (unsigned int i = 0; i < v44; ++i)
        {
          [v4 decodeValueOfObjCType:"Q" at:&v41 size:8];
          uint64_t v15 = [v4 decodeObject];
          [(VMUClassInfoMap *)v5 addClassInfo:v15 forAddress:v41];
        }
      }
    }
  }
  v16 = v5;
LABEL_11:

  return v16;
}

void __33__VMUClassInfoMap_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 88) objectAtIndexedSubscript:a2];
  [v2 setIsDerivedFromStackBacktrace:1];
}

void __33__VMUClassInfoMap_initWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 176) objectAtIndexedSubscript:[a2 unsignedIntValue]];
  unint64_t v6 = [*(id *)(a1 + 32) classInfoForIndex:[v7 unsignedIntValue]];
  [v5 setDestinationLayout:v6];
}

- (void)addClassInfosFromMap:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__VMUClassInfoMap_addClassInfosFromMap___block_invoke;
  v3[3] = &unk_1E5D25748;
  v3[4] = self;
  [a3 enumerateInfosWithBlock:v3];
}

uint64_t __40__VMUClassInfoMap_addClassInfosFromMap___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) addClassInfo:a3 forAddress:a2];
}

- (unsigned)addClassInfo:(id)a3 forAddress:(unint64_t)a4
{
  id v15 = a3;
  unint64_t v14 = a4;
  if (v15)
  {
    unint64_t v6 = std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::find<VMUClassInfo * {__strong}>(&self->_classInfoToIndexMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v15);
    if (!v6)
    {
      unsigned int v8 = [v15 superclassInfo];

      if (v8)
      {
        uint64_t v9 = [v15 superclassInfo];
        v10 = [v15 superclassInfo];
        -[VMUClassInfoMap addClassInfo:forAddress:](self, "addClassInfo:forAddress:", v9, [v10 remoteIsa]);
      }
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __43__VMUClassInfoMap_addClassInfo_forAddress___block_invoke;
      v12[3] = &unk_1E5D256D0;
      v12[4] = self;
      [v15 enumerateTypeFieldsWithBlock:v12];
      unsigned int v13 = [(VMUClassInfoMap *)self count] + 1;
      unsigned int v13 = *((_DWORD *)std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUClassInfo * {__strong},VMUClassInfo * {__strong}&,unsigned int &>((uint64_t)&self->_classInfoToIndexMap, (unint64_t *)&v15, &v15, &v13)+ 6);
      if (v14) {
        std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,unsigned int &>((uint64_t)&self->_isaAddressToIndexMap, &v14, &v14, &v13);
      }
      [(NSMutableArray *)self->_linearClassInfos addObject:v15];
      goto LABEL_11;
    }
    unsigned int v7 = *((_DWORD *)v6 + 6);
    unsigned int v13 = v7;
    if (a4)
    {
      std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::__emplace_unique_key_args<unsigned long long,unsigned long long &,unsigned int &>((uint64_t)&self->_isaAddressToIndexMap, &v14, &v14, &v13);
LABEL_11:
      unsigned int v7 = v13;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

void __43__VMUClassInfoMap_addClassInfo_forAddress___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 destinationLayout];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v6 destinationLayout];
    [v4 indexForClassInfo:v5];
  }
}

- (unsigned)indexForClassInfo:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    id v4 = std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::find<VMUClassInfo * {__strong}>(&self->_classInfoToIndexMap.__table_.__bucket_list_.__ptr_.__value_, (unint64_t *)&v7);
    if (v4) {
      unsigned int v5 = *((_DWORD *)v4 + 6);
    }
    else {
      unsigned int v5 = -[VMUClassInfoMap addClassInfo:forAddress:](self, "addClassInfo:forAddress:", v7, [v7 remoteIsa]);
    }
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)classInfoForAddress:(unint64_t)a3
{
  unint64_t v6 = a3;
  id v4 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned int>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned int>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned int>>>::find<unsigned long long>(&self->_isaAddressToIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v6);
  if (v4)
  {
    id v4 = [(NSMutableArray *)self->_linearClassInfos objectAtIndexedSubscript:(v4[6] - 1)];
  }

  return v4;
}

- (id)classInfoForIndex:(unsigned int)a3
{
  if (a3)
  {
    if ([(NSMutableArray *)self->_linearClassInfos count] >= (unint64_t)a3)
    {
      unint64_t v6 = [(NSMutableArray *)self->_linearClassInfos objectAtIndexedSubscript:a3 - 1];
    }
    else
    {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v6;
}

- (unsigned)count
{
  return [(NSMutableArray *)self->_linearClassInfos count];
}

- (void)enumerateInfosWithBlock:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self->_linearClassInfos;
  unint64_t v6 = (void (**)(id, void *, void, unint64_t, unsigned __int8 *))v4;
  unsigned int v7 = [(NSMutableArray *)v5 count];
  if (v6)
  {
    unsigned int v8 = v7;
    if (v7)
    {
      unsigned int v9 = v7 + 1;
      v10 = malloc_type_malloc(8 * (v7 + 1), 0x80040B8603338uLL);
      void *v10 = 0;
      -[NSMutableArray getObjects:range:](v5, "getObjects:range:", v10 + 1, 0, v8);
      uint64_t v11 = malloc_type_calloc(1uLL, ((v8 + 8) >> 3) + 4, 0xFF42C4F3uLL);
      *uint64_t v11 = v9;
      unsigned __int8 v16 = 0;
      p_p1 = &self->_isaAddressToIndexMap.__table_.__p1_;
      while (1)
      {
        p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<unsigned long long, unsigned int>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long, unsigned int>, void *>>> *)p_p1->__value_.__next_;
        if (!p_p1) {
          break;
        }
        unint64_t next_low = LODWORD(p_p1[3].__value_.__next_);
        if (*v11 > next_low)
        {
          *((unsigned char *)v11 + (next_low >> 3) + 4) |= 1 << (next_low & 7);
          unint64_t next_low = LODWORD(p_p1[3].__value_.__next_);
        }
        v6[2](v6, p_p1[2].__value_.__next_, v10[next_low], next_low, &v16);
        if (v16) {
          goto LABEL_16;
        }
      }
      uint64_t v14 = 1;
      do
      {
        if (*v11 > v14
          && ((*((unsigned __int8 *)v11 + (v14 >> 3) + 4) >> (v14 & 7)) & 1) != 0)
        {
          int v15 = 0;
        }
        else
        {
          v6[2](v6, (void *)[(id)v10[v14] remoteIsa], v10[v14], v14, &v16);
          int v15 = v16;
        }
        uint64_t v14 = (v14 + 1);
      }
      while (v14 <= v8 && !v15);
LABEL_16:
      free(v11);
      free(v10);
    }
  }
}

- (id)_retainedLinearArrayWithReturnedCount:(unsigned int *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = [(NSMutableArray *)self->_linearClassInfos count] + 1;
  unint64_t v6 = (id *)malloc_type_calloc(v5, 8uLL, 0x80040B8603338uLL);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v7 = self->_linearClassInfos;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    int v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_storeStrong(&v6[(v10 + i)], *(id *)(*((void *)&v13 + 1) + 8 * i));
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      v10 += i;
    }
    while (v8);
  }

  *a3 = v5;
  return v6;
}

- (unsigned)addFieldInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  long long v16 = &v15;
  id v4 = std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::__emplace_unique_key_args<VMUFieldInfo * {__strong},std::piecewise_construct_t const&,std::tuple<VMUFieldInfo * const {__strong}&>,std::tuple<>>((uint64_t)&self->_fieldInfoToIndexMap, &v15, (uint64_t)&std::piecewise_construct, &v16);
  unsigned int v5 = *((_DWORD *)v4 + 6);
  if (!v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    unint64_t v6 = [v15 subFieldArray];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v6);
          }
          [(VMUClassInfoMap *)self addFieldInfo:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
      }
      while (v7);
    }

    [(NSMutableArray *)self->_linearFieldInfos addObject:v15];
    unsigned int v5 = [(NSMutableArray *)self->_linearFieldInfos count];
    *((_DWORD *)v4 + 6) = v5;
  }

  return v5;
}

- (unsigned)indexForFieldInfo:(id)a3
{
  id v7 = a3;
  id v4 = std::__hash_table<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::hash<VMUFieldInfo * {__strong}>,std::equal_to<VMUFieldInfo * {__strong}>,true>,std::__unordered_map_equal<VMUFieldInfo * {__strong},std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>,std::equal_to<VMUFieldInfo * {__strong}>,std::hash<VMUFieldInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUFieldInfo * {__strong},unsigned int>>>::find<VMUFieldInfo * {__strong}>(&self->_fieldInfoToIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v7);
  if (v4) {
    unsigned int v5 = *((_DWORD *)v4 + 6);
  }
  else {
    unsigned int v5 = 0;
  }

  return v5;
}

- (id)fieldInfoForIndex:(unsigned int)a3
{
  if (a3)
  {
    if ([(NSMutableArray *)self->_linearFieldInfos count] >= (unint64_t)a3)
    {
      unint64_t v6 = [(NSMutableArray *)self->_linearFieldInfos objectAtIndexedSubscript:a3 - 1];
    }
    else
    {
      unint64_t v6 = 0;
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  return v6;
}

- (id)swiftFieldWithName:(const char *)a3 offset:(unsigned int)a4 kind:(unsigned int)a5 typeref:(swift_typeref_interop)a6
{
  int var1 = a6.var1;
  unint64_t var0 = a6.var0;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)a3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v15, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    unsigned int v16 = a4;
    unsigned int v17 = a5;
    unint64_t v18 = var0;
    int v19 = var1;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v15 = __p;
    unsigned int v16 = a4;
    unsigned int v17 = a5;
    unint64_t v18 = var0;
    int v19 = var1;
  }
  long long v11 = std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::find<SwiftFieldKey>(&self->_swiftFieldToIndexMap.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)&v15);
  if (v11)
  {
    long long v12 = [(NSMutableArray *)self->_linearFieldInfos objectAtIndexedSubscript:(*((_DWORD *)v11 + 16) - 1)];
  }
  else
  {
    long long v12 = 0;
  }
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }

  return v12;
}

- (void)memoizeSwiftField:(id)a3 withName:(const char *)a4 offset:(unsigned int)a5 kind:(unsigned int)a6 typeref:(swift_typeref_interop)a7
{
  int var1 = a7.var1;
  unint64_t var0 = a7.var0;
  id v13 = a3;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v16, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    unsigned int v17 = a5;
    unsigned int v18 = a6;
    unint64_t v19 = var0;
    int v20 = var1;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v16 = __p;
    unsigned int v17 = a5;
    unsigned int v18 = a6;
    unint64_t v19 = var0;
    int v20 = var1;
  }
  unsigned int v14 = [(VMUClassInfoMap *)self addFieldInfo:v13];
  long long v21 = &v16;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::__emplace_unique_key_args<SwiftFieldKey,std::piecewise_construct_t const&,std::tuple<SwiftFieldKey const&>,std::tuple<>>((uint64_t)&self->_swiftFieldToIndexMap, (uint64_t)&v16, (uint64_t)&std::piecewise_construct, (long long **)&v21)+ 16) = v14;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
}

- (unsigned)fieldInfoCount
{
  return [(NSMutableArray *)self->_linearFieldInfos count];
}

- (BOOL)hasClassInfosDerivedFromStackBacktraces
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__VMUClassInfoMap_hasClassInfosDerivedFromStackBacktraces__block_invoke;
  v4[3] = &unk_1E5D25770;
  v4[4] = &v5;
  [(VMUClassInfoMap *)self enumerateInfosWithBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __58__VMUClassInfoMap_hasClassInfosDerivedFromStackBacktraces__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = [a3 isDerivedFromStackBacktrace];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (void)_applyTypeOverlayRules:(void *)a3 toMutableInfo:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__VMUClassInfoMap__applyTypeOverlayRules_toMutableInfo___block_invoke;
    v11[3] = &unk_1E5D256D0;
    v11[4] = a1;
    [v6 enumerateTypeFieldsWithBlock:v11];
  }
}

void __56__VMUClassInfoMap__applyTypeOverlayRules_toMutableInfo___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 destinationLayout];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 destinationLayout];
    [v4 addClassInfo:v5 forAddress:0];
  }
}

- (void)_applyTypeOverlay:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v31 = v4;
    id v5 = [v4 refinementRules];
    if ([v5 count])
    {
      uint64_t v6 = MEMORY[0x1AD0D9F90]();
      unsigned int v32 = v5;
      uint64_t v7 = [(NSMutableArray *)self->_linearClassInfos count];
      unint64_t v8 = v7 + 1;
      uint64_t v9 = (char *)malloc_type_calloc(v7 + 1, 8uLL, 0x80040B8603338uLL);
      context = (void *)v6;
      p_linearClassInfos = &self->_linearClassInfos;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v10 = self->_linearClassInfos;
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v36;
        uint64_t v13 = 1;
        do
        {
          uint64_t v14 = 0;
          long long v15 = &v9[8 * v13];
          do
          {
            if (*(void *)v36 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v16 = [*(id *)(*((void *)&v35 + 1) + 8 * v14) mutableCopy];
            uint64_t v17 = *(void **)&v15[8 * v14];
            *(void *)&v15[8 * v14] = v16;

            ++v14;
          }
          while (v11 != v14);
          uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
          v13 += v14;
        }
        while (v11);
      }

      v30 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:v9 + 8 count:v7];
      if (v8 < 2)
      {
        std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::clear((uint64_t)&self->_classInfoToIndexMap);
        objc_storeStrong((id *)p_linearClassInfos, v30);
      }
      else
      {
        uint64_t v18 = 0;
        unint64_t v19 = v9 + 8;
        do
        {
          int v20 = [*(id *)&v19[8 * v18] superclassInfo];
          BOOL v21 = v20 == 0;

          if (!v21)
          {
            long long v22 = [*(id *)&v19[8 * v18] superclassInfo];
            unsigned int v23 = [(VMUClassInfoMap *)self indexForClassInfo:v22];

            if (v8 <= v23 || v18 + 1 == v23) {
              __assert_rtn("-[VMUClassInfoMap _applyTypeOverlay:]", "VMUClassInfoMap.mm", 485, "replacementIndex < linearCount + 1 && replacementIndex != i");
            }
            [*(id *)&v19[8 * v18] setSuperclassInfo:*(void *)&v9[8 * v23]];
          }
          ++v18;
        }
        while (v7 != v18);
        std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::clear((uint64_t)&self->_classInfoToIndexMap);
        uint64_t v25 = 0;
        do
        {
          id v33 = *(id *)&v9[8 * v25 + 8];
          int v34 = v25 + 1;
          std::__hash_table<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::__unordered_map_hasher<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::hash<VMUClassInfo * {__strong}>,std::equal_to<VMUClassInfo * {__strong}>,true>,std::__unordered_map_equal<VMUClassInfo * {__strong},std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>,std::equal_to<VMUClassInfo * {__strong}>,std::hash<VMUClassInfo * {__strong}>,true>,std::allocator<std::__hash_value_type<VMUClassInfo * {__strong},unsigned int>>>::__emplace_unique_impl<std::pair<VMUMutableClassInfo * {__strong},unsigned int>>(&self->_classInfoToIndexMap.__table_.__bucket_list_.__ptr_.__value_, (uint64_t *)&v33);

          ++v25;
        }
        while (v7 != v25);
        objc_storeStrong((id *)p_linearClassInfos, v30);
        long long v26 = (void **)(v9 + 8);
        do
        {
          -[VMUClassInfoMap _applyTypeOverlayRules:toMutableInfo:]((uint64_t)self, v32, *v26);
          long long v27 = *v26;
          *long long v26 = 0;

          ++v26;
          --v7;
        }
        while (v7);
      }
      free(v9);

      id v5 = v32;
    }

    id v4 = v31;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linearFieldInfos, 0);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::~__hash_table((uint64_t)&self->_fieldInfoToIndexMap);
  std::__hash_table<std::__hash_value_type<SwiftFieldKey,unsigned int>,std::__unordered_map_hasher<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::hash<SwiftFieldKey>,std::equal_to<SwiftFieldKey>,true>,std::__unordered_map_equal<SwiftFieldKey,std::__hash_value_type<SwiftFieldKey,unsigned int>,std::equal_to<SwiftFieldKey>,std::hash<SwiftFieldKey>,true>,std::allocator<std::__hash_value_type<SwiftFieldKey,unsigned int>>>::~__hash_table((uint64_t)&self->_swiftFieldToIndexMap);
  objc_storeStrong((id *)&self->_linearClassInfos, 0);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},unsigned int>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringHashFunctor,NSStringEqualsFunctor,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},unsigned int>,NSStringEqualsFunctor,NSStringHashFunctor,true>,std::allocator<std::__hash_value_type<NSString * {__strong},unsigned int>>>::~__hash_table((uint64_t)&self->_classInfoToIndexMap);

  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&self->_isaAddressToIndexMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 10) = 1065353216;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  return self;
}

@end