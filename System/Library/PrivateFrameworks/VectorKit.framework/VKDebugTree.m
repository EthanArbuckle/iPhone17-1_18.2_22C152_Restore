@interface VKDebugTree
- (BOOL)deserializeTree:(id)a3;
- (BOOL)deserializeZippedTree:(id)a3;
- (const)internalData;
- (id).cxx_construct;
- (id)_serializeNode:(const void *)a3;
- (id)_serializeProperty:(const void *)a3;
- (id)_serializeValue:(const void *)a3;
- (id)logTree;
- (id)nodes;
- (id)serializeTree;
- (id)serializeZippedTree;
- (optional<gdc::DebugTreeNode>)_deserializeNode:(optional<gdc::DebugTreeNode> *__return_ptr)retstr;
- (optional<gdc::DebugTreeProperty>)_deserializeProperty:(optional<gdc::DebugTreeProperty> *__return_ptr)retstr;
- (optional<gdc::DebugTreeValue>)_deserializeValue:(optional<gdc::DebugTreeValue> *__return_ptr)retstr;
- (void)_outputTree:(void *)a3;
- (void)_populateData;
- (void)disableAllOptions;
- (void)enableAllOptions;
- (void)populateData:(id)a3;
- (void)printTree;
- (void)replaceInternalData:(const void *)a3;
- (void)setOption:(unint64_t)a3 value:(BOOL)a4;
- (void)setOptions:(id)a3;
@end

@implementation VKDebugTree

- (id).cxx_construct
{
  *((void *)self + 13) = 0;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  uint64_t v3 = *(void *)&self->_anon_30[32];
  if (v3)
  {
    uint64_t v4 = *(void *)&self->_anon_30[40];
    v5 = *(void **)&self->_anon_30[32];
    if (v4 != v3)
    {
      do
      {
        v4 -= 80;
        std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v4);
      }
      while (v4 != v3);
      v5 = *(void **)&self->_anon_30[32];
    }
    *(void *)&self->_anon_30[40] = v3;
    operator delete(v5);
  }
  uint64_t v6 = *(void *)&self->_anon_30[8];
  if (v6)
  {
    uint64_t v7 = *(void *)&self->_anon_30[16];
    v8 = *(void **)&self->_anon_30[8];
    if (v7 != v6)
    {
      do
      {
        v7 -= 96;
        std::allocator_traits<std::allocator<gdc::DebugTreeNode>>::destroy[abi:nn180100]<gdc::DebugTreeNode,void,void>(v7);
      }
      while (v7 != v6);
      v8 = *(void **)&self->_anon_30[8];
    }
    *(void *)&self->_anon_30[16] = v6;
    operator delete(v8);
  }
  if ((char)self->_anon_30[7] < 0)
  {
    operator delete(*(void **)&self->_debugTree._name.__r_.var0);
    if ((*((char *)&self->_debugTree._name.__r_.__value_.var0.__l + 23) & 0x80000000) == 0) {
      return;
    }
  }
  else if ((*((char *)&self->_debugTree._name.__r_.__value_.var0.__l + 23) & 0x80000000) == 0)
  {
    return;
  }
  data = self->_debugTree._name.__r_.__value_.var0.__l.__data_;
  operator delete(data);
}

- (BOOL)deserializeZippedTree:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    uint64_t v6 = [v5 length];
    unint64_t v7 = (unint64_t)[v5 length] >> 1;
    v8 = [MEMORY[0x1E4F1CA58] dataWithLength:v7 + v6];
    id v9 = v5;
    v21.avail_in = objc_msgSend(v9, "length", objc_msgSend(v9, "bytes"));
    v21.zalloc = 0;
    v21.zfree = 0;
    v21.uLong total_out = 0;
    if (inflateInit_(&v21, "1.2.12", 112)) {
      goto LABEL_13;
    }
    do
    {
      uLong total_out = v21.total_out;
      if (total_out >= [v8 length]) {
        [v8 increaseLengthBy:v7];
      }
      id v11 = v8;
      uint64_t v12 = [v11 mutableBytes];
      v21.next_out = (Bytef *)(v12 + v21.total_out);
      int v13 = [v11 length];
      v21.avail_out = v13 - LODWORD(v21.total_out);
      int v14 = inflate(&v21, 2);
    }
    while (!v14);
    BOOL v15 = v14 == 1;
    int v17 = inflateEnd(&v21);
    char v18 = !v15;
    if (v17) {
      char v18 = 1;
    }
    if (v18)
    {
LABEL_13:
      BOOL v16 = 0;
    }
    else
    {
      [v11 setLength:v21.total_out];
      v19 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:0];
      BOOL v16 = [(VKDebugTree *)self deserializeTree:v19];
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)serializeZippedTree
{
  v2 = [(VKDebugTree *)self serializeTree];
  [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v2 requiringSecureCoding:0 error:0];
  v11.uLong total_out = 0;
  memset(&v11.zalloc, 0, 24);
  id v3 = objc_claimAutoreleasedReturnValue();
  v11.avail_in = objc_msgSend(v3, "length", objc_msgSend(v3, "bytes"));
  if (deflateInit_(&v11, 9, "1.2.12", 112))
  {
    id v4 = 0;
  }
  else
  {
    v5 = [MEMORY[0x1E4F1CA58] dataWithLength:1024];
    do
    {
      uLong total_out = v11.total_out;
      if (total_out >= [v5 length]) {
        [v5 increaseLengthBy:1024];
      }
      id v7 = v5;
      uint64_t v8 = [v7 mutableBytes];
      v11.next_out = (Bytef *)(v8 + v11.total_out);
      int v9 = [v7 length];
      v11.avail_out = v9 - LODWORD(v11.total_out);
      deflate(&v11, 4);
    }
    while (!v11.avail_out);
    deflateEnd(&v11);
    [v7 setLength:v11.total_out];
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithData:v7];
  }
  return v4;
}

- (BOOL)deserializeTree:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18[0] = (void *)1953460050;
  v19[0] = 4;
  memset(&v19[12], 0, 48);
  char v20 = 0;
  gdc::DebugTreeNode::operator=((uint64_t)&self->_debugTree, (long long *)v18);
  v5 = *(void **)((char *)&v19[24] + 1);
  if (*(void *)((char *)&v19[24] + 1))
  {
    uint64_t v6 = *(void *)((char *)&v19[28] + 1);
    if (*(void *)((char *)&v19[28] + 1) != *(void *)((char *)&v19[24] + 1))
    {
      do
      {
        v6 -= 80;
        std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v6);
      }
      while ((void *)v6 != v5);
    }
    operator delete(v5);
  }
  id v7 = *(void **)((char *)&v19[12] + 1);
  if (*(void *)((char *)&v19[12] + 1))
  {
    uint64_t v8 = *(void *)((char *)&v19[16] + 1);
    if (*(void *)((char *)&v19[16] + 1) != *(void *)((char *)&v19[12] + 1))
    {
      do
      {
        v8 -= 96;
        std::allocator_traits<std::allocator<gdc::DebugTreeNode>>::destroy[abi:nn180100]<gdc::DebugTreeNode,void,void>(v8);
      }
      while ((void *)v8 != v7);
    }
    operator delete(v7);
  }
  if (SLOBYTE(v19[12]) < 0)
  {
    operator delete(*(void **)((char *)v19 + 1));
    if ((SLOBYTE(v19[0]) & 0x80000000) == 0) {
      goto LABEL_11;
    }
LABEL_15:
    operator delete(v18[0]);
    goto LABEL_11;
  }
  if (SLOBYTE(v19[0]) < 0) {
    goto LABEL_15;
  }
LABEL_11:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 objectForKey:@"Version"],
        int v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 intValue],
        v9,
        v10 <= 3))
  {
    uint64_t v12 = [v4 objectForKey:@"Root Nodes"];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v13);
          }
          [(VKDebugTree *)self _deserializeNode:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          if (!LOBYTE(v18[0]))
          {
            geo::optional<gdc::DebugTreeNode>::~optional((uint64_t)v18);
            BOOL v11 = 0;
            goto LABEL_26;
          }
          gdc::DebugTreeNode::addChildNode(&self->_debugTree._name.__r_.__value_.var0.__l.__data_, (long long *)&v18[1]);
          geo::optional<gdc::DebugTreeNode>::~optional((uint64_t)v18);
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 1;
LABEL_26:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)serializeTree
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)&self->_anon_30[16] - *(void *)&self->_anon_30[8]) >> 5)];
  uint64_t v5 = *(void *)&self->_anon_30[8];
  for (uint64_t i = *(void *)&self->_anon_30[16]; v5 != i; v5 += 96)
  {
    id v7 = [(VKDebugTree *)self _serializeNode:v5];
    [v4 addObject:v7];
  }
  [v3 setObject:&unk_1EF5BB340 forKey:@"Version"];
  [v3 setObject:v4 forKey:@"Root Nodes"];

  return v3;
}

- (optional<gdc::DebugTreeNode>)_deserializeNode:(optional<gdc::DebugTreeNode> *__return_ptr)retstr
{
  id v3 = v1;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v5 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v5 objectForKey:@"Type"],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:@"Node"],
        v6,
        (v7 & 1) == 0))
  {
    retstr->var0 = 0;
    goto LABEL_8;
  }
  id v8 = [v5 objectForKey:@"Name"];
  int v9 = (const char *)[v8 UTF8String];
  size_t v10 = strlen(v9);
  if (v10 > 0x7FFFFFFFFFFFFFF7) {
    abort();
  }
  std::string::size_type v11 = v10;
  if (v10 >= 0x17)
  {
    uint64_t v14 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v14 = v10 | 7;
    }
    uint64_t v15 = v14 + 1;
    p_dst = (std::string *)operator new(v14 + 1);
    __dst.__r_.__value_.__l.__size_ = v11;
    __dst.__r_.__value_.__r.__words[2] = v15 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_12;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v10;
  p_dst = &__dst;
  if (v10) {
LABEL_12:
  }
    memmove(p_dst, v9, v11);
  p_dst->__r_.__value_.__s.__data_[v11] = 0;

  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v82, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  }
  else {
    std::string v82 = __dst;
  }
  LOBYTE(v83) = 0;
  memset(&v84[7], 0, 49);
  BOOL v16 = [v5 objectForKey:@"Identifier"];
  int v17 = v16;
  if (!v16) {
    goto LABEL_44;
  }
  char v18 = (const char *)[v16 UTF8String];
  size_t v19 = strlen(v18);
  if (v19 > 0x7FFFFFFFFFFFFFF7) {
    abort();
  }
  size_t v20 = v19;
  if (v19 >= 0x17)
  {
    uint64_t v22 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17) {
      uint64_t v22 = v19 | 7;
    }
    uint64_t v23 = v22 + 1;
    p_p = (long long *)operator new(v22 + 1);
    *((void *)&__p + 1) = v20;
    unint64_t v81 = v23 | 0x8000000000000000;
    *(void *)&long long __p = p_p;
  }
  else
  {
    HIBYTE(v81) = v19;
    p_p = &__p;
    if (!v19) {
      goto LABEL_25;
    }
  }
  memmove(p_p, v18, v20);
LABEL_25:
  *((unsigned char *)p_p + v20) = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v71, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  }
  else {
    std::string v71 = __dst;
  }
  if (SHIBYTE(v81) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v72, (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
    *(_OWORD *)v74 = 0u;
    long long v75 = 0u;
    *(_OWORD *)&v73[8] = 0u;
    operator delete((void *)__p);
    long long v24 = v74[1];
    if (v74[1])
    {
      uint64_t v25 = v75;
      uint64_t v26 = v74[1];
      if ((void *)v75 != v74[1])
      {
        do
        {
          v25 -= 80;
          std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v25);
        }
        while ((void *)v25 != v24);
        uint64_t v26 = v74[1];
      }
      *(void *)&long long v75 = v24;
      operator delete(v26);
    }
    uint64_t v27 = *(void *)&v73[8];
    if (*(void *)&v73[8])
    {
      uint64_t v28 = *(void *)&v73[16];
      v29 = *(void **)&v73[8];
      if (*(void *)&v73[16] != *(void *)&v73[8])
      {
        do
        {
          v28 -= 96;
          std::allocator_traits<std::allocator<gdc::DebugTreeNode>>::destroy[abi:nn180100]<gdc::DebugTreeNode,void,void>(v28);
        }
        while (v28 != v27);
        v29 = *(void **)&v73[8];
      }
      *(void *)&v73[16] = v27;
      operator delete(v29);
    }
  }
  else
  {
    long long v72 = __p;
    *(void *)v73 = v81;
    *(_OWORD *)&v73[8] = 0u;
    *(_OWORD *)v74 = 0u;
    long long v75 = 0u;
  }
  if ((v73[7] & 0x80000000) != 0) {
    operator delete((void *)v72);
  }
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v71.__r_.__value_.__l.__data_);
  }
LABEL_44:
  [v5 objectForKey:@"Children"];
  v61 = id v63 = v5;
  v30 = [v5 objectForKey:@"Properties"];
  v62 = retstr;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v31 = v61;
  id v64 = v31;
  uint64_t v32 = [v31 countByEnumeratingWithState:&v76 objects:v87 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v77;
    while (2)
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v77 != v33) {
          objc_enumerationMutation(v31);
        }
        [v3 _deserializeNode:*(void *)(*((void *)&v76 + 1) + 8 * i)];
        if (!v71.__r_.__value_.__s.__data_[0])
        {
          v62->var0 = 0;
          geo::optional<gdc::DebugTreeNode>::~optional((uint64_t)&v71);

          goto LABEL_81;
        }
        gdc::DebugTreeNode::addChildNode(&v82, (long long *)&v71.__r_.__value_.__r.__words[1]);
        geo::optional<gdc::DebugTreeNode>::~optional((uint64_t)&v71);
      }
      uint64_t v32 = [v31 countByEnumeratingWithState:&v76 objects:v87 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = v30;
  uint64_t v35 = [obj countByEnumeratingWithState:&v67 objects:v86 count:16];
  if (v35)
  {
    uint64_t v66 = *(void *)v68;
    v60 = v17;
    while (2)
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v68 != v66) {
          objc_enumerationMutation(obj);
        }
        objc_msgSend(v3, "_deserializeProperty:", *(void *)(*((void *)&v67 + 1) + 8 * j), v60);
        if (!v71.__r_.__value_.__s.__data_[0])
        {
          v62->var0 = 0;
          geo::optional<gdc::DebugTreeProperty>::~optional((uint64_t)&v71);

          id v5 = v63;
          int v17 = v60;
          goto LABEL_81;
        }
        v39 = *(char **)&v84[40];
        if (*(void *)&v84[40] < *(void *)&v84[48])
        {
          long long v37 = *(_OWORD *)&v71.__r_.__value_.__r.__words[1];
          *(void *)(*(void *)&v84[40] + 16) = v72;
          *(_OWORD *)v39 = v37;
          *(void *)&long long v72 = 0;
          *(_OWORD *)&v71.__r_.__value_.__r.__words[1] = 0uLL;
          *((_DWORD *)v39 + 6) = DWORD2(v72);
          *((void *)v39 + 5) = 0;
          *((void *)v39 + 6) = 0;
          *((void *)v39 + 4) = 0;
          *((_OWORD *)v39 + 2) = *(_OWORD *)v73;
          *((void *)v39 + 6) = *(void *)&v73[16];
          memset(v73, 0, sizeof(v73));
          *((void *)v39 + 8) = 0;
          *((void *)v39 + 9) = 0;
          *((void *)v39 + 7) = 0;
          *(_OWORD *)(v39 + 56) = *(_OWORD *)v74;
          *((void *)v39 + 9) = v75;
          v74[0] = 0;
          v74[1] = 0;
          *(void *)&long long v75 = 0;
          v38 = v39 + 80;
        }
        else
        {
          v40 = *(char **)&v84[32];
          unint64_t v41 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)&v84[40] - *(void *)&v84[32]) >> 4);
          unint64_t v42 = v41 + 1;
          if (v41 + 1 > 0x333333333333333) {
            abort();
          }
          if (0x999999999999999ALL * ((uint64_t)(*(void *)&v84[48] - *(void *)&v84[32]) >> 4) > v42) {
            unint64_t v42 = 0x999999999999999ALL * ((uint64_t)(*(void *)&v84[48] - *(void *)&v84[32]) >> 4);
          }
          if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)&v84[48] - *(void *)&v84[32]) >> 4) >= 0x199999999999999) {
            unint64_t v43 = 0x333333333333333;
          }
          else {
            unint64_t v43 = v42;
          }
          if (v43 > 0x333333333333333) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v44 = 80 * v43;
          v45 = (char *)operator new(80 * v43);
          v46 = &v45[80 * v41];
          *(_OWORD *)v46 = *(_OWORD *)&v71.__r_.__value_.__r.__words[1];
          v47 = &v45[v44];
          *((void *)v46 + 2) = v72;
          *(_OWORD *)&v71.__r_.__value_.__r.__words[1] = 0uLL;
          *(void *)&long long v72 = 0;
          *((_DWORD *)v46 + 6) = DWORD2(v72);
          *((_OWORD *)v46 + 2) = *(_OWORD *)v73;
          *((void *)v46 + 6) = *(void *)&v73[16];
          memset(v73, 0, sizeof(v73));
          *((void *)v46 + 9) = 0;
          *(_OWORD *)(v46 + 56) = *(_OWORD *)v74;
          *((void *)v46 + 9) = v75;
          v74[0] = 0;
          v74[1] = 0;
          v38 = v46 + 80;
          *(void *)&long long v75 = 0;
          if (v39 == v40)
          {
            *(void *)&v84[32] = v46;
            *(void *)&v84[40] = v46 + 80;
            *(void *)&v84[48] = &v45[v44];
          }
          else
          {
            uint64_t v48 = 0;
            do
            {
              v49 = &v46[v48];
              v50 = &v39[v48];
              long long v51 = *(_OWORD *)&v39[v48 - 80];
              *((void *)v49 - 8) = *(void *)&v39[v48 - 64];
              *((_OWORD *)v49 - 5) = v51;
              *((void *)v50 - 9) = 0;
              *((void *)v50 - 8) = 0;
              *((void *)v50 - 10) = 0;
              *((_DWORD *)v49 - 14) = *(_DWORD *)&v39[v48 - 56];
              *((_OWORD *)v49 - 3) = *(_OWORD *)&v39[v48 - 48];
              *((void *)v49 - 4) = *(void *)&v39[v48 - 32];
              *((void *)v50 - 5) = 0;
              *((void *)v50 - 4) = 0;
              *((void *)v50 - 6) = 0;
              *(_OWORD *)(v49 - 24) = *(_OWORD *)&v39[v48 - 24];
              *((void *)v49 - 1) = *(void *)&v39[v48 - 8];
              *((void *)v50 - 3) = 0;
              *((void *)v50 - 2) = 0;
              *((void *)v50 - 1) = 0;
              v48 -= 80;
            }
            while (&v39[v48] != v40);
            v39 = *(char **)&v84[32];
            uint64_t v52 = *(void *)&v84[40];
            *(void *)&v84[32] = &v46[v48];
            *(void *)&v84[40] = v46 + 80;
            *(void *)&v84[48] = v47;
            while ((char *)v52 != v39)
            {
              v52 -= 80;
              std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v52);
            }
          }
          id v31 = v64;
          if (v39) {
            operator delete(v39);
          }
        }
        *(void *)&v84[40] = v38;
        geo::optional<gdc::DebugTreeProperty>::~optional((uint64_t)&v71);
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v67 objects:v86 count:16];
      int v17 = v60;
      if (v35) {
        continue;
      }
      break;
    }
  }

  id v5 = v63;
  v62->var0 = 1;
  *(std::string *)v62->var1.data = v82;
  *(_OWORD *)&v82.__r_.__value_.__l.__data_ = 0uLL;
  *((_OWORD *)&v62->var2.__r_.__value_.var0.__l + 1) = v83;
  v62->var2.var0 = *(void *)v84;
  long long v83 = 0uLL;
  *(void *)v84 = 0;
  *(_OWORD *)&v62[1].var0 = *(_OWORD *)&v84[8];
  uint64_t v53 = *(void *)&v84[48];
  v62[1].var2.__r_.__value_.var0.__l.__data_ = *(char **)&v84[24];
  v82.__r_.__value_.__r.__words[2] = 0;
  memset(&v84[8], 0, 24);
  *(_OWORD *)&v62[1].var2.__r_.__value_.var0.__l.__size_ = *(_OWORD *)&v84[32];
  *(void *)&v62[1].var2.__r_.var0 = v53;
  memset(&v84[32], 0, 24);
LABEL_81:

  uint64_t v54 = *(void *)&v84[32];
  if (*(void *)&v84[32])
  {
    uint64_t v55 = *(void *)&v84[40];
    v56 = *(void **)&v84[32];
    if (*(void *)&v84[40] != *(void *)&v84[32])
    {
      do
      {
        v55 -= 80;
        std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v55);
      }
      while (v55 != v54);
      v56 = *(void **)&v84[32];
    }
    *(void *)&v84[40] = v54;
    operator delete(v56);
  }
  uint64_t v57 = *(void *)&v84[8];
  if (*(void *)&v84[8])
  {
    uint64_t v58 = *(void *)&v84[16];
    v59 = *(void **)&v84[8];
    if (*(void *)&v84[16] != *(void *)&v84[8])
    {
      do
      {
        v58 -= 96;
        std::allocator_traits<std::allocator<gdc::DebugTreeNode>>::destroy[abi:nn180100]<gdc::DebugTreeNode,void,void>(v58);
      }
      while (v58 != v57);
      v59 = *(void **)&v84[8];
    }
    *(void *)&v84[16] = v57;
    operator delete(v59);
  }
  if ((v84[7] & 0x80000000) != 0)
  {
    operator delete((void *)v83);
    if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_93:
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
        goto LABEL_97;
      }
      goto LABEL_8;
    }
  }
  else if ((SHIBYTE(v82.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_93;
  }
  operator delete(v82.__r_.__value_.__l.__data_);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
LABEL_97:
  }
    operator delete(__dst.__r_.__value_.__l.__data_);
LABEL_8:

  return result;
}

- (id)_serializeNode:(const void *)a3
{
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:@"Node" forKey:@"Type"];
  uint64_t v6 = a3;
  if ((*((char *)a3 + 23) & 0x80000000) == 0 || (uint64_t v6 = *(const void **)a3) != 0)
  {
    char v7 = [NSString stringWithUTF8String:v6];
    [v5 setObject:v7 forKey:@"Name"];
  }
  uint64_t v8 = *((unsigned __int8 *)a3 + 47);
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *((void *)a3 + 4);
  }
  if (v8) {
    uint64_t v9 = 24;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v8) {
    size_t v10 = (char *)a3 + 24;
  }
  else {
    size_t v10 = (char *)a3;
  }
  uint64_t v11 = v10[23];
  int v12 = (char)v11;
  if ((v11 & 0x80u) != 0) {
    uint64_t v11 = *((void *)v10 + 1);
  }
  if (v11)
  {
    id v13 = *(char **)((char *)a3 + v9);
    if (v12 >= 0) {
      uint64_t v14 = v10;
    }
    else {
      uint64_t v14 = v13;
    }
    uint64_t v15 = [NSString stringWithUTF8String:v14];
    [v5 setObject:v15 forKey:@"Identifier"];
  }
  BOOL v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 7) - *((void *)a3 + 6)) >> 5)];
  int v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((void *)a3 + 10) - *((void *)a3 + 9)) >> 4)];
  uint64_t v18 = *((void *)a3 + 9);
  for (uint64_t i = *((void *)a3 + 10); v18 != i; v18 += 80)
  {
    size_t v20 = [(VKDebugTree *)self _serializeProperty:v18];
    [v17 addObject:v20];
  }
  uint64_t v21 = *((void *)a3 + 6);
  for (uint64_t j = *((void *)a3 + 7); v21 != j; v21 += 96)
  {
    uint64_t v23 = [(VKDebugTree *)self _serializeNode:v21];
    [v16 addObject:v23];
  }
  if ([v17 count]) {
    [v5 setObject:v17 forKey:@"Properties"];
  }
  if ([v16 count]) {
    [v5 setObject:v16 forKey:@"Children"];
  }

  return v5;
}

- (optional<gdc::DebugTreeProperty>)_deserializeProperty:(optional<gdc::DebugTreeProperty> *__return_ptr)retstr
{
  id v3 = v1;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v4 = v2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v4 objectForKey:@"Type"],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqualToString:@"Property"],
        v5,
        (v6 & 1) == 0))
  {
    retstr->var0 = 0;
    goto LABEL_8;
  }
  id v7 = [v4 objectForKey:@"Name"];
  uint64_t v8 = (const char *)[v7 UTF8String];
  size_t v9 = strlen(v8);
  if (v9 > 0x7FFFFFFFFFFFFFF7) {
    abort();
  }
  std::string::size_type v10 = v9;
  if (v9 >= 0x17)
  {
    uint64_t v13 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v13 = v9 | 7;
    }
    uint64_t v14 = v13 + 1;
    p_dst = (std::string *)operator new(v13 + 1);
    __dst.__r_.__value_.__l.__size_ = v10;
    __dst.__r_.__value_.__r.__words[2] = v14 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_12;
  }
  *((unsigned char *)&__dst.__r_.__value_.__s + 23) = v9;
  p_dst = &__dst;
  if (v9) {
LABEL_12:
  }
    memmove(p_dst, v8, v10);
  p_dst->__r_.__value_.__s.__data_[v10] = 0;

  uint64_t v15 = [v4 objectForKey:@"Visual Type"];
  BOOL v16 = v15;
  v45 = v15;
  if (v15)
  {
    if ([v15 isEqualToString:@"Primitive"])
    {
      LODWORD(v16) = 0;
    }
    else if ([v16 isEqualToString:@"Time"])
    {
      LODWORD(v16) = 1;
    }
    else if ([v16 isEqualToString:@"StyleAttribute"])
    {
      LODWORD(v16) = 2;
    }
    else
    {
      LODWORD(v16) = 0;
    }
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v62, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  }
  else {
    std::string v62 = __dst;
  }
  int v63 = (int)v16;
  long long v64 = 0u;
  memset(v65, 0, 32);
  int v17 = [v4 objectForKey:@"Values"];
  uint64_t v18 = v17;
  v46 = v17;
  if (v17 && [v17 count])
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v58 objects:v73 count:16];
    if (!v20) {
      goto LABEL_39;
    }
    uint64_t v21 = *(void *)v59;
LABEL_28:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v59 != v21) {
        objc_enumerationMutation(v19);
      }
      [v3 _deserializeValue:*(void *)(*((void *)&v58 + 1) + 8 * v22)];
      if (!v68) {
        break;
      }
      *(_OWORD *)uint64_t v54 = v69[0];
      *(_OWORD *)&v54[9] = *(_OWORD *)((char *)v69 + 9);
      long long v55 = v70;
      uint64_t v56 = v71;
      long long v70 = 0uLL;
      uint64_t v71 = 0;
      int v57 = v72;
      gdc::DebugTreeProperty::addValue((gdc::DebugTreeProperty *)&v62, (DebugTreeValue *)v54);
      if (SHIBYTE(v56) < 0) {
        operator delete((void *)v55);
      }
      if (v68 && SHIBYTE(v71) < 0) {
        operator delete((void *)v70);
      }
      if (v20 == ++v22)
      {
        uint64_t v20 = [v19 countByEnumeratingWithState:&v58 objects:v73 count:16];
        if (!v20)
        {
LABEL_39:

          goto LABEL_40;
        }
        goto LABEL_28;
      }
    }
    retstr->var0 = 0;
    goto LABEL_69;
  }
LABEL_40:
  uint64_t v23 = [v4 objectForKey:@"Tags"];
  id v19 = v23;
  if (v23 && [v23 count])
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v44 = v19;
    id v24 = v19;
    id v43 = v4;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v67 count:16];
    if (!v25) {
      goto LABEL_66;
    }
    uint64_t v26 = *(void *)v51;
    while (1)
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v51 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v28 = (const char *)[*(id *)(*((void *)&v50 + 1) + 8 * i) UTF8String];
        size_t v29 = strlen(v28);
        if (v29 > 0x7FFFFFFFFFFFFFF7) {
          abort();
        }
        v30 = (void *)v29;
        if (v29 >= 0x17)
        {
          uint64_t v32 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v29 | 7) != 0x17) {
            uint64_t v32 = v29 | 7;
          }
          uint64_t v33 = v32 + 1;
          id v31 = operator new(v32 + 1);
          v48[1] = v30;
          unint64_t v49 = v33 | 0x8000000000000000;
          v48[0] = v31;
LABEL_56:
          memmove(v31, v28, (size_t)v30);
          goto LABEL_57;
        }
        HIBYTE(v49) = v29;
        id v31 = v48;
        if (v29) {
          goto LABEL_56;
        }
LABEL_57:
        *((unsigned char *)v30 + (void)v31) = 0;
        uint64_t v34 = v65[2];
        if (v65[2] >= v65[3])
        {
          v65[2] = std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t)&v65[1], (uint64_t)v48);
          if ((v49 & 0x8000000000000000) != 0) {
            goto LABEL_45;
          }
        }
        else
        {
          char v35 = HIBYTE(v49);
          if (SHIBYTE(v49) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v65[2], (const std::string::value_type *)v48[0], (std::string::size_type)v48[1]);
          }
          else
          {
            *(_OWORD *)v65[2] = *(_OWORD *)v48;
            *(void *)(v34 + 16) = v49;
          }
          v65[2] = v34 + 24;
          if (v35 < 0)
          {
LABEL_45:
            operator delete(v48[0]);
            continue;
          }
        }
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v50 objects:v67 count:16];
      if (!v25)
      {
LABEL_66:

        id v4 = v43;
        id v19 = v44;
        break;
      }
    }
  }
  retstr->var0 = 1;
  retstr->var3.var0 = (DebugTreeValue *)v62.__r_.__value_.__r.__words[2];
  LODWORD(retstr->var3.var1) = v63;
  double v36 = *(double *)&v65[3];
  retstr->var4.var1 = (void *)v65[0];
  *(_OWORD *)retstr->var1.data = *(_OWORD *)&v62.__r_.__value_.__l.__data_;
  *(_OWORD *)&v62.__r_.__value_.__l.__data_ = 0uLL;
  *(_OWORD *)&retstr->var3.var2.var0 = v64;
  v65[0] = 0;
  long long v64 = 0uLL;
  *(_OWORD *)&retstr->var4.var2.var0 = *(_OWORD *)&v65[1];
  retstr[1].var1.type = v36;
  v62.__r_.__value_.__r.__words[2] = 0;
  memset(&v65[1], 0, 24);
LABEL_69:

  uint64_t v37 = v65[1];
  if (v65[1])
  {
    uint64_t v38 = v65[2];
    v39 = (void *)v65[1];
    if (v65[2] != v65[1])
    {
      do
      {
        if (*(char *)(v38 - 1) < 0) {
          operator delete(*(void **)(v38 - 24));
        }
        v38 -= 24;
      }
      while (v38 != v37);
      v39 = (void *)v65[1];
    }
    v65[2] = v37;
    operator delete(v39);
  }
  uint64_t v40 = v64;
  if ((void)v64)
  {
    uint64_t v41 = *((void *)&v64 + 1);
    unint64_t v42 = (void *)v64;
    if (*((void *)&v64 + 1) != (void)v64)
    {
      do
      {
        if (*(char *)(v41 - 9) < 0) {
          operator delete(*(void **)(v41 - 32));
        }
        v41 -= 64;
      }
      while (v41 != v40);
      unint64_t v42 = (void *)v64;
    }
    *((void *)&v64 + 1) = v40;
    operator delete(v42);
  }
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v62.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
LABEL_8:

  return result;
}

- (id)_serializeProperty:(const void *)a3
{
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [v5 setObject:@"Property" forKey:@"Type"];
  char v6 = a3;
  if ((*((char *)a3 + 23) & 0x80000000) == 0 || (char v6 = *(const void **)a3) != 0)
  {
    id v7 = [NSString stringWithUTF8String:v6];
    [v5 setObject:v7 forKey:@"Name"];
  }
  uint64_t v8 = *((unsigned int *)a3 + 6);
  if (v8 <= 2) {
    [v5 setObject:*((void *)&off_1E5A8F0A0 + v8) forKey:@"Visual Type"];
  }
  size_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(*((void *)a3 + 5) - *((void *)a3 + 4)) >> 6];
  uint64_t v10 = *((void *)a3 + 4);
  for (uint64_t i = *((void *)a3 + 5); v10 != i; v10 += 64)
  {
    int v12 = [(VKDebugTree *)self _serializeValue:v10];
    [v9 addObject:v12];
  }
  [v5 setObject:v9 forKey:@"Values"];
  uint64_t v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a3 + 8) - *((void *)a3 + 7)) >> 3)];
  uint64_t v15 = (uint64_t *)*((void *)a3 + 7);
  for (uint64_t j = (uint64_t *)*((void *)a3 + 8); v15 != j; v15 += 3)
  {
    BOOL v16 = v15;
    if (*((char *)v15 + 23) < 0) {
      BOOL v16 = (uint64_t *)*v15;
    }
    int v17 = [NSString stringWithUTF8String:v16];
    [v13 addObject:v17];
  }
  [v5 setObject:v13 forKey:@"Tags"];

  return v5;
}

- (optional<gdc::DebugTreeValue>)_deserializeValue:(optional<gdc::DebugTreeValue> *__return_ptr)retstr
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = v1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 objectForKey:@"Type"];
    uint64_t v8 = [v7 isEqualToString:@"Value"];

    if (v8)
    {
      size_t v9 = [v6 objectForKey:@"Value Type"];
      memset(v24, 0, 15);
      if ([v9 isEqualToString:@"String"])
      {
        id v10 = [v6 objectForKey:@"Value"];
        uint64_t v11 = (const std::string::value_type *)[v10 UTF8String];
        memset(&v22, 0, sizeof(v22));
        int v23 = 4;
        if (v11)
        {
          std::string::__assign_external(&v22, v11);
          uint64_t v8 = v18;
          v2 = v19;
          uint64_t v4 = v20;
          unsigned __int8 v3 = v21;
        }
        else
        {
          *((unsigned char *)&v22.__r_.__value_.__s + 23) = 6;
          strcpy((char *)&v22, "<null>");
        }
        unsigned __int8 v13 = HIBYTE(v22.__r_.__value_.__r.__words[2]);
        int v12 = v23;
        v24[0] = v22.__r_.__value_.__l.__size_;
        std::string::size_type v14 = v22.__r_.__value_.__r.__words[0];
        *(void *)((char *)v24 + 7) = *(std::string::size_type *)((char *)&v22.__r_.__value_.__r.__words[1] + 7);
        *((unsigned char *)&v22.__r_.__value_.__s + 23) = 0;
        v22.__r_.__value_.__s.__data_[0] = 0;

        goto LABEL_14;
      }
      if ([v9 isEqualToString:@"Number"])
      {
        v2 = [v6 objectForKey:@"Value"];
        uint64_t v8 = [v2 longLongValue];
        memset(v24, 0, 15);
      }
      else
      {
        if ([v9 isEqualToString:@"Unsigned Number"])
        {
          uint64_t v8 = [v6 objectForKey:@"Value"];
          v2 = (void *)[(id)v8 unsignedLongLongValue];
          memset(v24, 0, 15);

          unsigned __int8 v13 = 0;
          std::string::size_type v14 = 0;
          int v12 = 1;
          goto LABEL_14;
        }
        if ([v9 isEqualToString:@"Double"])
        {
          uint64_t v8 = [v6 objectForKey:@"Value"];
          [(id)v8 doubleValue];
          uint64_t v4 = v17;
          memset(v24, 0, 15);

          unsigned __int8 v13 = 0;
          std::string::size_type v14 = 0;
          int v12 = 2;
          goto LABEL_14;
        }
        if ([v9 isEqualToString:@"Boolean"])
        {
          uint64_t v8 = [v6 objectForKey:@"Value"];
          unsigned __int8 v3 = [(id)v8 BOOLValue];
          memset(v24, 0, 15);

          unsigned __int8 v13 = 0;
          std::string::size_type v14 = 0;
          int v12 = 3;
          goto LABEL_14;
        }
        uint64_t v8 = 0;
      }
      int v12 = 0;
      unsigned __int8 v13 = 0;
      std::string::size_type v14 = 0;
LABEL_14:
      retstr->var0 = 1;
      *(void *)&retstr->var1.type = v8;
      *(void *)&retstr->var2 = v2;
      *(void *)&retstr[1].var0 = v4;
      retstr[1].var1.data[0] = v3;
      uint64_t v15 = v24[0];
      *(void *)&retstr[1].var2 = v14;
      *(void *)&retstr[2].var0 = v15;
      *(void *)(&retstr[2].var0 + 7) = *(void *)((char *)v24 + 7);
      retstr[2].var1.data[7] = v13;
      retstr[2].var2 = v12;

      goto LABEL_15;
    }
  }
  retstr->var0 = 0;
LABEL_15:

  return result;
}

- (id)_serializeValue:(const void *)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v4 setObject:@"Value" forKey:@"Type"];
  switch(*((_DWORD *)a3 + 14))
  {
    case 0:
      [v4 setObject:@"Number" forKey:@"Value Type"];
      id v5 = [NSNumber numberWithLongLong:*(void *)a3];
      [v4 setObject:v5 forKey:@"Value"];
      goto LABEL_5;
    case 1:
      [v4 setObject:@"Unsigned Number" forKey:@"Value Type"];
      id v5 = [NSNumber numberWithUnsignedLongLong:*((void *)a3 + 1)];
      [v4 setObject:v5 forKey:@"Value"];
      goto LABEL_5;
    case 2:
      [v4 setObject:@"Double" forKey:@"Value Type"];
      id v5 = [NSNumber numberWithDouble:*((double *)a3 + 2)];
      [v4 setObject:v5 forKey:@"Value"];
LABEL_5:

      break;
    case 3:
      [v4 setObject:@"Boolean" forKey:@"Value Type"];
      if (*((unsigned char *)a3 + 24)) {
        id v6 = @"True";
      }
      else {
        id v6 = @"False";
      }
      [v4 setObject:v6 forKey:@"Value"];
      break;
    case 4:
      [v4 setObject:@"String" forKey:@"Value Type"];
      id v7 = NSString;
      if (*((char *)a3 + 55) < 0) {
        std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a3 + 4), *((void *)a3 + 5));
      }
      else {
        std::string __p = *(std::string *)((char *)a3 + 32);
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      size_t v9 = objc_msgSend(v7, "stringWithUTF8String:", p_p, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
      [v4 setObject:v9 forKey:@"Value"];

      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      break;
    default:
      break;
  }
  return v4;
}

- (id)logTree
{
  std::ostringstream::basic_ostringstream[abi:nn180100]((uint64_t)v17);
  *(void *)((char *)&v17[2] + *(void *)(v17[0] - 24)) = 10;
  [(VKDebugTree *)self _outputTree:v17];
  unsigned __int8 v3 = NSString;
  if ((v24 & 0x10) != 0)
  {
    unint64_t v6 = v23;
    if (v23 < v20)
    {
      unint64_t v23 = v20;
      unint64_t v6 = v20;
    }
    id v7 = (const void **)&v19;
  }
  else
  {
    if ((v24 & 8) == 0)
    {
      size_t v4 = 0;
      HIBYTE(v16) = 0;
      p_p = &__p;
      goto LABEL_16;
    }
    id v7 = (const void **)v18;
    unint64_t v6 = v18[2];
  }
  uint64_t v8 = *v7;
  size_t v4 = v6 - (void)*v7;
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  if (v4 >= 0x17)
  {
    uint64_t v9 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v9 = v4 | 7;
    }
    uint64_t v10 = v9 + 1;
    p_p = operator new(v9 + 1);
    size_t v15 = v4;
    int64_t v16 = v10 | 0x8000000000000000;
    std::string __p = p_p;
    goto LABEL_15;
  }
  HIBYTE(v16) = v6 - *(unsigned char *)v7;
  p_p = &__p;
  if (v4) {
LABEL_15:
  }
    memmove(p_p, v8, v4);
LABEL_16:
  *((unsigned char *)p_p + v4) = 0;
  if (v16 >= 0) {
    uint64_t v11 = &__p;
  }
  else {
    uint64_t v11 = __p;
  }
  int v12 = objc_msgSend(v3, "stringWithUTF8String:", v11, __p, v15, v16);
  if (SHIBYTE(v16) < 0) {
    operator delete(__p);
  }
  v17[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v17[1] = MEMORY[0x1E4FBA470] + 16;
  if (v22 < 0) {
    operator delete(v21);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1A62391A0](&v25);
  return v12;
}

- (void)printTree
{
}

- (void)_outputTree:(void *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  gdc::tag_invoke((uint64_t)v13, &self->_debugTree._name.__r_.__value_.var0.__l.__data_);
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  size_t v15 = 0;
  size_t v4 = (std::__shared_weak_count *)operator new(0x28uLL);
  v4->__shared_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF58B0A8;
  v4->__shared_weak_owners_ = 0;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF56B658;
  v4[1].__shared_owners_ = (uint64_t)&v15;
  uint64_t v18 = v4 + 1;
  uint64_t v19 = v4;
  atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  char v22 = v4 + 1;
  unint64_t v23 = v4;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = localeconv();
  uint64_t v28 = v5;
  thousands_sep = v5->thousands_sep;
  if (thousands_sep) {
    LOBYTE(thousands_sep) = *thousands_sep;
  }
  char v29 = (char)thousands_sep;
  decimal_point = v5->decimal_point;
  if (v5->decimal_point) {
    LOBYTE(decimal_point) = *decimal_point;
  }
  char v30 = (char)decimal_point;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  char v63 = 32;
  uint64_t v8 = operator new(0x208uLL);
  std::string __p = v8;
  unint64_t v66 = 0x8000000000000208;
  uint64_t v65 = 512;
  *(void *)&long long v9 = 0x2020202020202020;
  *((void *)&v9 + 1) = 0x2020202020202020;
  _OWORD *v8 = v9;
  v8[1] = v9;
  v8[2] = v9;
  v8[3] = v9;
  v8[4] = v9;
  v8[5] = v9;
  v8[6] = v9;
  v8[7] = v9;
  v8[8] = v9;
  v8[9] = v9;
  v8[10] = v9;
  v8[11] = v9;
  v8[12] = v9;
  v8[13] = v9;
  v8[14] = v9;
  v8[15] = v9;
  v8[16] = v9;
  v8[17] = v9;
  v8[18] = v9;
  v8[19] = v9;
  v8[20] = v9;
  v8[21] = v9;
  v8[22] = v9;
  v8[23] = v9;
  v8[24] = v9;
  v8[25] = v9;
  v8[26] = v9;
  v8[27] = v9;
  v8[28] = v9;
  v8[29] = v9;
  v8[30] = v9;
  v8[31] = v9;
  *((unsigned char *)v8 + 512) = 0;
  int v67 = 0;
  if (!atomic_fetch_add(&v4->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  nlohmann::detail::serializer<nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>::dump((uint64_t)&v22, (uint64_t)v13, 0);
  if (SHIBYTE(v66) < 0) {
    operator delete(__p);
  }
  uint64_t v10 = v23;
  if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
  }
  if (v17 >= 0) {
    uint64_t v11 = &v15;
  }
  else {
    uint64_t v11 = v15;
  }
  if (v17 >= 0) {
    uint64_t v12 = HIBYTE(v17);
  }
  else {
    uint64_t v12 = v16;
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(a3, (uint64_t)v11, v12);
  if (SHIBYTE(v17) < 0) {
    operator delete(v15);
  }
  nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>::json_value::destroy(&v14, v13[0]);
}

- (id)nodes
{
  return self->_nodes;
}

- (const)internalData
{
  return &self->_debugTree;
}

- (void)replaceInternalData:(const void *)a3
{
  gdc::DebugTreeNode::operator=((size_t *)&self->_debugTree, (size_t *)a3);
}

- (void)populateData:(id)a3
{
  id v8 = a3;
  *(void *)&long long v9 = 1953460050;
  v10[0] = 4;
  memset(&v10[12], 0, 48);
  char v11 = 0;
  gdc::DebugTreeNode::operator=((uint64_t)&self->_debugTree, &v9);
  size_t v4 = *(void **)((char *)&v10[24] + 1);
  if (*(void *)((char *)&v10[24] + 1))
  {
    uint64_t v5 = *(void *)((char *)&v10[28] + 1);
    if (*(void *)((char *)&v10[28] + 1) != *(void *)((char *)&v10[24] + 1))
    {
      do
      {
        v5 -= 80;
        std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v5);
      }
      while ((void *)v5 != v4);
    }
    operator delete(v4);
  }
  unint64_t v6 = *(void **)((char *)&v10[12] + 1);
  if (*(void *)((char *)&v10[12] + 1))
  {
    uint64_t v7 = *(void *)((char *)&v10[16] + 1);
    if (*(void *)((char *)&v10[16] + 1) != *(void *)((char *)&v10[12] + 1))
    {
      do
      {
        v7 -= 96;
        std::allocator_traits<std::allocator<gdc::DebugTreeNode>>::destroy[abi:nn180100]<gdc::DebugTreeNode,void,void>(v7);
      }
      while ((void *)v7 != v6);
    }
    operator delete(v6);
  }
  if (SLOBYTE(v10[12]) < 0)
  {
    operator delete(*(void **)((char *)v10 + 1));
    if ((SLOBYTE(v10[0]) & 0x80000000) == 0) {
      goto LABEL_11;
    }
  }
  else if ((SLOBYTE(v10[0]) & 0x80000000) == 0)
  {
    goto LABEL_11;
  }
  operator delete((void *)v9);
LABEL_11:
  LOBYTE(v10[0]) = 8;
  strcpy((char *)&v9, "Map View");
  objc_msgSend(v8, "populateDebugNode:withOptions:", gdc::DebugTreeNode::createChildNode((uint64_t)&self->_debugTree, &v9), &self->_options);
}

- (void)_populateData
{
  unsigned __int8 v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = *(void *)&self->_anon_30[8];
  for (uint64_t i = *(void *)&self->_anon_30[16]; v4 != i; v4 += 96)
  {
    unint64_t v6 = [[VKDebugTreeDataNode alloc] initWithDebugTreeNode:v4 withParent:0];
    [(VKDebugTreeDataNode *)v6 buildChildren];
    [(NSArray *)v3 addObject:v6];
  }
  nodes = self->_nodes;
  self->_nodes = v3;
}

- (void)disableAllOptions
{
  self->_options.__first_ &= 0xFFFFFFFFFFFFFFF0;
}

- (void)enableAllOptions
{
  self->_options.__first_ |= 0xFuLL;
}

- (void)setOption:(unint64_t)a3 value:(BOOL)a4
{
  if (a3 >= 4) {
    abort();
  }
  uint64_t v4 = 1 << a3;
  if (a4) {
    unint64_t v5 = self->_options.__first_ | v4;
  }
  else {
    unint64_t v5 = self->_options.__first_ & ~v4;
  }
  self->_options.__first_ = v5;
}

- (void)setOptions:(id)a3
{
  id v22 = a3;
  if (v22)
  {
    uint64_t v4 = [NSNumber numberWithUnsignedLong:0];
    unint64_t v5 = [v4 stringValue];
    unint64_t v6 = [v22 objectForKey:v5];

    if (v6) {
      self->_options.__first_ = self->_options.__first_ & 0xFFFFFFFFFFFFFFFELL | [v6 BOOLValue];
    }

    uint64_t v7 = [NSNumber numberWithUnsignedLong:1];
    id v8 = [v7 stringValue];
    long long v9 = [v22 objectForKey:v8];

    if (v9)
    {
      int v10 = [v9 BOOLValue];
      uint64_t v11 = 2;
      if (!v10) {
        uint64_t v11 = 0;
      }
      self->_options.__first_ = self->_options.__first_ & 0xFFFFFFFFFFFFFFFDLL | v11;
    }

    uint64_t v12 = [NSNumber numberWithUnsignedLong:2];
    unsigned __int8 v13 = [v12 stringValue];
    std::string::size_type v14 = [v22 objectForKey:v13];

    if (v14)
    {
      int v15 = [v14 BOOLValue];
      uint64_t v16 = 4;
      if (!v15) {
        uint64_t v16 = 0;
      }
      self->_options.__first_ = self->_options.__first_ & 0xFFFFFFFFFFFFFFFBLL | v16;
    }

    uint64_t v17 = [NSNumber numberWithUnsignedLong:3];
    uint64_t v18 = [v17 stringValue];
    uint64_t v19 = [v22 objectForKey:v18];

    if (v19)
    {
      int v20 = [v19 BOOLValue];
      uint64_t v21 = 8;
      if (!v20) {
        uint64_t v21 = 0;
      }
      self->_options.__first_ = self->_options.__first_ & 0xFFFFFFFFFFFFFFF7 | v21;
    }
  }
}

@end