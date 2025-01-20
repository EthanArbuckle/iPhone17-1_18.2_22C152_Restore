@interface USOSerializedGraph
+ (BOOL)supportsSecureCoding;
- (NSArray)alignments;
- (NSArray)edges;
- (NSArray)identifiers;
- (NSArray)nodes;
- (NSString)printedForm;
- (USOSerializedGraph)initWithCoder:(id)a3;
- (USOSerializedGraph)initWithNodes:(id)a3 edges:(id)a4;
- (USOSerializedGraph)initWithNodes:(id)a3 edges:(id)a4 identifiers:(id)a5 alignments:(id)a6;
- (USOSerializedGraph)initWithUsoGraph:(const void *)a3 withError:(id *)a4;
- (const)getOrCreateEdgeName:(id)a3 withVocabManager:(shared_ptr<siri:(id *)a5 :ontology::UsoVocabManager>)a4 withError:;
- (const)getOrCreateNodeName:(id)a3 withVocabManager:(shared_ptr<siri:(id *)a5 :ontology::UsoVocabManager>)a4 withError:;
- (const)getOrCreateVerbName:(id)a3 withVocabManager:(shared_ptr<siri:(id *)a5 :ontology::UsoVocabManager>)a4 withError:;
- (id)createSerializedNode:(const UsoGraphNode *)a3 withError:(id *)a4;
- (id)getIdentifiersIfExists:(const UsoGraphNode *)a3 nodeIndex:(unint64_t)a4;
- (id)getUtteranceAlignmentsIfExists:(const UsoGraphNode *)a3 nodeIndex:(unint64_t)a4;
- (unique_ptr<siri::ontology::UsoGraph,)toCppUsoGraph:(shared_ptr<siri:(id *)a4 :ontology::UsoVocabManager>)a3 withError:;
- (void)encodeWithCoder:(id)a3;
- (void)setAlignments:(id)a3;
- (void)setEdges:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setNodes:(id)a3;
- (void)setPrintedForm:(id)a3;
@end

@implementation USOSerializedGraph

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alignments, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_edges, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_printedForm, 0);
}

- (void)setAlignments:(id)a3
{
}

- (NSArray)alignments
{
  return self->_alignments;
}

- (void)setIdentifiers:(id)a3
{
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setEdges:(id)a3
{
}

- (NSArray)edges
{
  return self->_edges;
}

- (void)setNodes:(id)a3
{
}

- (NSArray)nodes
{
  return self->_nodes;
}

- (void)setPrintedForm:(id)a3
{
}

- (NSString)printedForm
{
  if (!self->_printedForm)
  {
    siri::ontology::getSharedUsoVocabManager((siri::ontology *)self);
    uint64_t v3 = siri::ontology::getSharedUsoVocabManager(void)::inst;
    v4 = (std::__shared_weak_count *)unk_1EBCA3AE0;
    if (unk_1EBCA3AE0)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(unk_1EBCA3AE0 + 8), 1uLL, memory_order_relaxed);
      v18 = v4;
      atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    else
    {
      v18 = 0;
    }
    uint64_t v17 = v3;
    [(USOSerializedGraph *)self toCppUsoGraph:&v17 withError:0];
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v14);
    if (v19) {
      siri::ontology::UsoGraph::prettyPrint(v19, v14);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"", 0);
    v5 = NSString;
    std::stringbuf::str();
    if (v13 >= 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    v7 = [v5 stringWithUTF8String:p_p];
    printedForm = self->_printedForm;
    self->_printedForm = v7;

    if (v13 < 0) {
      operator delete(__p);
    }
    v14[0] = *MEMORY[0x1E4FBA418];
    *(void *)((char *)v14 + *(void *)(v14[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
    v14[1] = MEMORY[0x1E4FBA470] + 16;
    if (v15 < 0) {
      operator delete((void *)v14[9]);
    }
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x1CB796460](&v16);
    v9 = (siri::ontology::UsoGraph *)v19;
    v19 = 0;
    if (v9)
    {
      siri::ontology::UsoGraph::~UsoGraph(v9);
      MEMORY[0x1CB796510]();
    }
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
  }
  v10 = self->_printedForm;
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  v4 = [(USOSerializedGraph *)self nodes];
  [v9 encodeObject:v4 forKey:@"nodes"];

  v5 = [(USOSerializedGraph *)self edges];
  [v9 encodeObject:v5 forKey:@"edges"];

  v6 = [(USOSerializedGraph *)self identifiers];
  [v9 encodeObject:v6 forKey:@"identifiers"];

  v7 = [(USOSerializedGraph *)self alignments];
  [v9 encodeObject:v7 forKey:@"alignments"];

  v8 = [(USOSerializedGraph *)self printedForm];
  [v9 encodeObject:v8 forKey:@"printedForm"];
}

- (USOSerializedGraph)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)USOSerializedGraph;
  v5 = [(USOSerializedGraph *)&v30 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"nodes"];
    nodes = v5->_nodes;
    v5->_nodes = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    char v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"edges"];
    edges = v5->_edges;
    v5->_edges = (NSArray *)v14;

    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"identifiers"];
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"alignments"];
    alignments = v5->_alignments;
    v5->_alignments = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"printedForm"];
    printedForm = v5->_printedForm;
    v5->_printedForm = (NSString *)v26;

    v28 = v5;
  }

  return v5;
}

- (unique_ptr<siri::ontology::UsoGraph,)toCppUsoGraph:(shared_ptr<siri:(id *)a4 :ontology::UsoVocabManager>)a3 withError:
{
}

- (const)getOrCreateEdgeName:(id)a3 withVocabManager:(shared_ptr<siri:(id *)a5 :ontology::UsoVocabManager>)a4 withError:
{
  var1 = a4.var1;
  var0 = a4.var0;
  id v7 = a3;
  uint64_t v8 = [v7 usoElementId];
  uint64_t v9 = *(uint64_t ***)var0;
  if (v8)
  {
    uint64_t EdgeName = siri::ontology::UsoVocabManager::getEdgeName(v9, v8);
    if (v11)
    {
      Customuint64_t EdgeName = (void *)EdgeName;
    }
    else
    {
      if (var1)
      {
        uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid edge element id: %d", v8);
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v16 forKey:*MEMORY[0x1E4F28568]];
        *(void *)var1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"USOSerializedGraphErrorDomain" code:5 userInfo:v17];
      }
      Customuint64_t EdgeName = 0;
    }
  }
  else
  {
    id v13 = [v7 edgeLabel];
    uint64_t v14 = (void *)[v13 UTF8String];
    char v15 = [v7 edgeLabel];
    std::string::basic_string[abi:ne180100](__p, v14, [v15 lengthOfBytesUsingEncoding:4]);
    Customuint64_t EdgeName = siri::ontology::UsoVocabManager::createCustomEdgeName((siri::ontology *)v9, (unsigned __int8 *)__p);
    if (v20 < 0) {
      operator delete(__p[0]);
    }
  }
  return CustomEdgeName;
}

- (const)getOrCreateVerbName:(id)a3 withVocabManager:(shared_ptr<siri:(id *)a5 :ontology::UsoVocabManager>)a4 withError:
{
  var1 = a4.var1;
  var0 = a4.var0;
  id v7 = a3;
  uint64_t v8 = [v7 usoVerbId];
  uint64_t v9 = [v8 intValue];

  v10 = *(uint64_t ***)var0;
  if (v9)
  {
    uint64_t VerbName = siri::ontology::UsoVocabManager::getVerbName(v10, v9);
    if (v12)
    {
      Customuint64_t VerbName = (void *)VerbName;
    }
    else
    {
      if (var1)
      {
        uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid verb element id: %d", v9);
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v17 forKey:*MEMORY[0x1E4F28568]];
        *(void *)var1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"USOSerializedGraphErrorDomain" code:6 userInfo:v18];
      }
      Customuint64_t VerbName = 0;
    }
  }
  else
  {
    id v14 = [v7 verbLabel];
    char v15 = (void *)[v14 UTF8String];
    uint64_t v16 = [v7 verbLabel];
    std::string::basic_string[abi:ne180100](__p, v15, [v16 lengthOfBytesUsingEncoding:4]);
    Customuint64_t VerbName = siri::ontology::UsoVocabManager::createCustomVerbName((siri::ontology *)v10, (unsigned __int8 *)__p);
    if (v21 < 0) {
      operator delete(__p[0]);
    }
  }
  return CustomVerbName;
}

- (const)getOrCreateNodeName:(id)a3 withVocabManager:(shared_ptr<siri:(id *)a5 :ontology::UsoVocabManager>)a4 withError:
{
  var1 = a4.var1;
  var0 = a4.var0;
  id v7 = a3;
  uint64_t v8 = [v7 usoElementId];
  uint64_t v9 = *(uint64_t ***)var0;
  if (v8)
  {
    uint64_t v10 = siri::ontology::UsoVocabManager::getOntologyName<siri::ontology::OntologyNodeName>(v9, v8);
    if (v11)
    {
      CustomEntityName = (void *)v10;
    }
    else
    {
      if (var1)
      {
        uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid node element id: %d", v8);
        uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v16 forKey:*MEMORY[0x1E4F28568]];
        *(void *)var1 = [MEMORY[0x1E4F28C58] errorWithDomain:@"USOSerializedGraphErrorDomain" code:5 userInfo:v17];
      }
      CustomEntityName = 0;
    }
  }
  else
  {
    id v13 = [v7 entityLabel];
    id v14 = (void *)[v13 UTF8String];
    char v15 = [v7 entityLabel];
    std::string::basic_string[abi:ne180100](__p, v14, [v15 lengthOfBytesUsingEncoding:4]);
    CustomEntityName = siri::ontology::UsoVocabManager::createCustomEntityName((siri::ontology *)v9, (unsigned __int8 *)__p);
    if (v20 < 0) {
      operator delete(__p[0]);
    }
  }
  return CustomEntityName;
}

- (USOSerializedGraph)initWithUsoGraph:(const void *)a3 withError:(id *)a4
{
  v56 = (siri::ontology::UsoGraph *)a3;
  id obj = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v65 = 0u;
  long long v66 = 0u;
  float v67 = 1.0;
  siri::ontology::UsoGraph::getNodes(v56, &v63);
  v6 = v63;
  id v7 = v64;
  if (v63 != v64)
  {
    uint64_t v8 = 0;
    uint64_t v9 = v63;
    v59 = v63;
    while (1)
    {
      uint64_t v10 = *v9;
      char v11 = -[USOSerializedGraph createSerializedNode:withError:](self, "createSerializedNode:withError:", *v9, a4, v56);
      if (!v11)
      {
        if (v6)
        {
          v53 = v6;
          goto LABEL_112;
        }
        goto LABEL_113;
      }
      [obj addObject:v11];
      char v12 = [(USOSerializedGraph *)self getIdentifiersIfExists:v10 nodeIndex:v8];
      [v61 addObjectsFromArray:v12];

      id v13 = [(USOSerializedGraph *)self getUtteranceAlignmentsIfExists:v10 nodeIndex:v8];
      if (v13) {
        [v58 addObject:v13];
      }
      unint64_t v14 = *(void *)(v10 + 16);
      unint64_t v15 = *((void *)&v65 + 1);
      if (*((void *)&v65 + 1))
      {
        uint8x8_t v16 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v65 + 8));
        v16.i16[0] = vaddlv_u8(v16);
        if (v16.u32[0] > 1uLL)
        {
          unint64_t v4 = *(void *)(v10 + 16);
          if (v14 >= *((void *)&v65 + 1)) {
            unint64_t v4 = v14 % *((void *)&v65 + 1);
          }
        }
        else
        {
          unint64_t v4 = (*((void *)&v65 + 1) - 1) & v14;
        }
        uint64_t v17 = *(void **)(v65 + 8 * v4);
        if (v17)
        {
          for (i = (void *)*v17; i; i = (void *)*i)
          {
            unint64_t v19 = i[1];
            if (v19 == v14)
            {
              if (i[2] == v14) {
                goto LABEL_78;
              }
            }
            else
            {
              if (v16.u32[0] > 1uLL)
              {
                if (v19 >= *((void *)&v65 + 1)) {
                  v19 %= *((void *)&v65 + 1);
                }
              }
              else
              {
                v19 &= *((void *)&v65 + 1) - 1;
              }
              if (v19 != v4) {
                break;
              }
            }
          }
        }
      }
      char v20 = operator new(0x20uLL);
      *(void *)&long long v21 = v14;
      *((void *)&v21 + 1) = v8;
      *char v20 = 0;
      v20[1] = v14;
      *((_OWORD *)v20 + 1) = v21;
      float v22 = (float)(unint64_t)(*((void *)&v66 + 1) + 1);
      if (!v15 || (float)(v67 * (float)v15) < v22) {
        break;
      }
LABEL_68:
      uint64_t v38 = v65;
      v39 = *(void **)(v65 + 8 * v4);
      if (v39)
      {
        *char v20 = *v39;
      }
      else
      {
        *char v20 = v66;
        *(void *)&long long v66 = v20;
        *(void *)(v38 + 8 * v4) = &v66;
        if (!*v20) {
          goto LABEL_77;
        }
        unint64_t v40 = *(void *)(*v20 + 8);
        if ((v15 & (v15 - 1)) != 0)
        {
          if (v40 >= v15) {
            v40 %= v15;
          }
        }
        else
        {
          v40 &= v15 - 1;
        }
        v39 = (void *)(v65 + 8 * v40);
      }
      void *v39 = v20;
LABEL_77:
      ++*((void *)&v66 + 1);
LABEL_78:
      ++v8;

      ++v9;
      v6 = v59;
      if (v9 == v7) {
        goto LABEL_89;
      }
    }
    BOOL v23 = (v15 & (v15 - 1)) != 0;
    if (v15 < 3) {
      BOOL v23 = 1;
    }
    unint64_t v24 = v23 | (2 * v15);
    unint64_t v25 = vcvtps_u32_f32(v22 / v67);
    if (v24 <= v25) {
      int8x8_t prime = (int8x8_t)v25;
    }
    else {
      int8x8_t prime = (int8x8_t)v24;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v15 = *((void *)&v65 + 1);
    }
    if (*(void *)&prime > v15) {
      goto LABEL_34;
    }
    if (*(void *)&prime < v15)
    {
      unint64_t v33 = vcvtps_u32_f32((float)*((unint64_t *)&v66 + 1) / v67);
      if (v15 < 3 || (uint8x8_t v34 = (uint8x8_t)vcnt_s8((int8x8_t)v15), v34.i16[0] = vaddlv_u8(v34), v34.u32[0] > 1uLL))
      {
        unint64_t v33 = std::__next_prime(v33);
      }
      else
      {
        uint64_t v35 = 1 << -(char)__clz(v33 - 1);
        if (v33 >= 2) {
          unint64_t v33 = v35;
        }
      }
      if (*(void *)&prime <= v33) {
        int8x8_t prime = (int8x8_t)v33;
      }
      if (*(void *)&prime >= v15)
      {
        unint64_t v15 = *((void *)&v65 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_34:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v27 = operator new(8 * *(void *)&prime);
          v28 = (void *)v65;
          *(void *)&long long v65 = v27;
          if (v28) {
            operator delete(v28);
          }
          uint64_t v29 = 0;
          *((int8x8_t *)&v65 + 1) = prime;
          do
            *(void *)(v65 + 8 * v29++) = 0;
          while (*(void *)&prime != v29);
          objc_super v30 = (void **)v66;
          if ((void)v66)
          {
            unint64_t v31 = *(void *)(v66 + 8);
            uint8x8_t v32 = (uint8x8_t)vcnt_s8(prime);
            v32.i16[0] = vaddlv_u8(v32);
            if (v32.u32[0] > 1uLL)
            {
              if (v31 >= *(void *)&prime) {
                v31 %= *(void *)&prime;
              }
            }
            else
            {
              v31 &= *(void *)&prime - 1;
            }
            *(void *)(v65 + 8 * v31) = &v66;
            for (j = *v30; j; unint64_t v31 = v37)
            {
              unint64_t v37 = j[1];
              if (v32.u32[0] > 1uLL)
              {
                if (v37 >= *(void *)&prime) {
                  v37 %= *(void *)&prime;
                }
              }
              else
              {
                v37 &= *(void *)&prime - 1;
              }
              if (v37 != v31)
              {
                if (!*(void *)(v65 + 8 * v37))
                {
                  *(void *)(v65 + 8 * v37) = v30;
                  goto LABEL_59;
                }
                *objc_super v30 = (void *)*j;
                void *j = **(void **)(v65 + 8 * v37);
                **(void **)(v65 + 8 * v37) = j;
                j = v30;
              }
              unint64_t v37 = v31;
LABEL_59:
              objc_super v30 = (void **)j;
              j = (void *)*j;
            }
          }
          unint64_t v15 = (unint64_t)prime;
          goto LABEL_63;
        }
        v41 = (void *)v65;
        *(void *)&long long v65 = 0;
        if (v41) {
          operator delete(v41);
        }
        unint64_t v15 = 0;
        *((void *)&v65 + 1) = 0;
      }
    }
LABEL_63:
    if ((v15 & (v15 - 1)) != 0)
    {
      if (v14 >= v15) {
        unint64_t v4 = v14 % v15;
      }
      else {
        unint64_t v4 = v14;
      }
    }
    else
    {
      unint64_t v4 = (v15 - 1) & v14;
    }
    goto LABEL_68;
  }
LABEL_89:
  if (v6) {
    operator delete(v6);
  }
  siri::ontology::UsoGraph::getEdges(v56, &v63);
  v43 = v63;
  v42 = (unint64_t **)v64;
  if (v63 == v64)
  {
LABEL_100:
    if (v43) {
      operator delete(v43);
    }
    objc_storeStrong((id *)&self->_nodes, obj);
    objc_storeStrong((id *)&self->_edges, v57);
    objc_storeStrong((id *)&self->_identifiers, v61);
    objc_storeStrong((id *)&self->_alignments, v58);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v63);
    siri::ontology::UsoGraph::prettyPrint((uint64_t *)v56, &v63);
  }
  v44 = (unint64_t **)v63;
  while (1)
  {
    v45 = *v44;
    long long v46 = v65;
    v47 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::find<unsigned long long>(v65, *((unint64_t *)&v65 + 1), **v44);
    if (!v47)
    {
      if (!a4) {
        goto LABEL_110;
      }
      v54 = [MEMORY[0x1E4F28C58] errorWithDomain:@"USOSerializedGraphErrorDomain" code:1 userInfo:0];
      goto LABEL_109;
    }
    v48 = v47;
    v49 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::find<unsigned long long>(v46, *((unint64_t *)&v46 + 1), v45[1]);
    if (!v49) {
      break;
    }
    v50 = [[USOSerializedGraphEdge alloc] initWithUsoElementId:*((unsigned int *)v45 + 15) fromVertex:v48[3] toVertex:v49[3] enumeration:*((unsigned int *)v45 + 4)];
    if (!*((_DWORD *)v45 + 15))
    {
      v51 = v45 + 4;
      if (*((char *)v45 + 55) < 0) {
        v51 = (void *)*v51;
      }
      v52 = objc_msgSend(NSString, "stringWithUTF8String:", v51, v56);
      [(USOSerializedGraphEdge *)v50 setEdgeLabel:v52];
    }
    objc_msgSend(v57, "addObject:", v50, v56);

    if (++v44 == v42) {
      goto LABEL_100;
    }
  }
  if (!a4) {
    goto LABEL_110;
  }
  v54 = [MEMORY[0x1E4F28C58] errorWithDomain:@"USOSerializedGraphErrorDomain" code:2 userInfo:0];
LABEL_109:
  *a4 = v54;
LABEL_110:
  if (v43)
  {
    v53 = v43;
LABEL_112:
    operator delete(v53);
  }
LABEL_113:
  std::__hash_table<siri::ontology::UsoGraphNode const*,std::hash<siri::ontology::UsoGraphNode const*>,std::equal_to<siri::ontology::UsoGraphNode const*>,std::allocator<siri::ontology::UsoGraphNode const*>>::~__hash_table((uint64_t)&v65);

  return 0;
}

- (id)createSerializedNode:(const UsoGraphNode *)a3 withError:(id *)a4
{
  v6 = objc_alloc_init(USOSerializedGraphNode);
  switch((*((unsigned int (**)(const UsoGraphNode *))a3->var0 + 2))(a3))
  {
    case 0u:
    case 2u:
      if (!v7) {
        __cxa_bad_cast();
      }
      uint64_t v8 = v7;
      [(USOSerializedGraphNode *)v6 setUsoElementId:*(unsigned int *)(v7[3] + 36)];
      uint64_t v9 = v8[3];
      if (*(_DWORD *)(v9 + 36)) {
        goto LABEL_39;
      }
      uint64_t v10 = NSString;
      char v11 = (void *)(v9 + 8);
      if (*(char *)(v9 + 31) < 0) {
        char v11 = (void *)*v11;
      }
      goto LABEL_6;
    case 1u:
      if (!v19) {
        __cxa_bad_cast();
      }
      char v20 = v19;
      [(USOSerializedGraphNode *)v6 setUsoElementId:*(unsigned int *)(v19[3] + 36)];
      uint64_t v21 = v20[3];
      if (!*(_DWORD *)(v21 + 36))
      {
        float v22 = (void *)(v21 + 8);
        if (*(char *)(v21 + 31) < 0) {
          float v22 = (void *)*v22;
        }
        BOOL v23 = [NSString stringWithUTF8String:v22];
        [(USOSerializedGraphNode *)v6 setEntityLabel:v23];
      }
      unint64_t v24 = [NSNumber numberWithInt:*(unsigned int *)(v20[13] + 36)];
      [(USOSerializedGraphNode *)v6 setUsoVerbId:v24];

      uint64_t v25 = v20[13];
      if (*(_DWORD *)(v25 + 36)) {
        goto LABEL_39;
      }
      uint64_t v26 = (void *)(v25 + 8);
      if (*(char *)(v25 + 31) < 0) {
        uint64_t v26 = (void *)*v26;
      }
      char v12 = [NSString stringWithUTF8String:v26];
      [(USOSerializedGraphNode *)v6 setVerbLabel:v12];
      break;
    case 3u:
      if (!v13) {
        __cxa_bad_cast();
      }
      unint64_t v14 = v13;
      [(USOSerializedGraphNode *)v6 setUsoElementId:*(unsigned int *)(v13[3] + 36)];
      unint64_t v15 = (long long *)(v14 + 13);
      std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, v15);
      if (v36)
      {
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        uint8x8_t v16 = NSString;
        std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, v15);
        if (!v36) {
          std::__throw_bad_optional_access[abi:ne180100]();
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        v18 = [v16 stringWithUTF8String:p_p];
        [(USOSerializedGraphNode *)v6 setStringPayload:v18];

        if (v36 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      goto LABEL_39;
    case 4u:
      if (!v32) {
        __cxa_bad_cast();
      }
      unint64_t v33 = v32;
      [(USOSerializedGraphNode *)v6 setUsoElementId:*(unsigned int *)(v32[3] + 36)];
      if (!*((unsigned char *)v33 + 112)) {
        goto LABEL_39;
      }
      char v12 = [NSNumber numberWithLongLong:v33[13]];
      [(USOSerializedGraphNode *)v6 setIntegerPayload:v12];
      break;
    case 5u:
      if (!v27) {
        __cxa_bad_cast();
      }
      v28 = v27;
      [(USOSerializedGraphNode *)v6 setUsoElementId:*(unsigned int *)(v27[3] + 36)];
      uint64_t v29 = v28[3];
      if (*(_DWORD *)(v29 + 36)) {
        goto LABEL_39;
      }
      uint64_t v10 = NSString;
      char v11 = (void *)(v29 + 8);
      if (*(char *)(v29 + 31) < 0) {
        char v11 = (void *)*v11;
      }
LABEL_6:
      char v12 = [v10 stringWithUTF8String:v11];
      [(USOSerializedGraphNode *)v6 setEntityLabel:v12];
      break;
    default:
      if (a4)
      {
        objc_super v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:@"Unknown UsoGraphNode" forKey:*MEMORY[0x1E4F28568]];
        *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"USOSerializedGraphErrorDomain" code:4 userInfo:v30];
      }
      unint64_t v31 = 0;
      goto LABEL_40;
  }

LABEL_39:
  unint64_t v31 = v6;
LABEL_40:

  return v31;
}

- (id)getUtteranceAlignmentsIfExists:(const UsoGraphNode *)a3 nodeIndex:(unint64_t)a4
{
  if (!v5 || (v6 = v5, v5[7] == v5[8]))
  {
    unint64_t v15 = 0;
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    siri::ontology::UsoUtteranceAlignment::getSpans(*(siri::ontology::UsoUtteranceAlignment **)v6[7], &v17);
    uint64_t v8 = v17;
    uint64_t v9 = v18;
    if (v17 != v18)
    {
      uint64_t v10 = (unsigned int **)v17;
      do
      {
        char v11 = *v10;
        if (*((unsigned char *)*v10 + 20)) {
          uint64_t v12 = v11[4];
        }
        else {
          uint64_t v12 = 0;
        }
        if (*((unsigned char *)v11 + 28)) {
          uint64_t v13 = v11[6];
        }
        else {
          uint64_t v13 = 0;
        }
        unint64_t v14 = [[USOSerializedUtteranceSpan alloc] initWithStartIndex:**v10 endIndex:(*v10)[1] startUnicodeScalarIndex:(*v10)[2] endUnicodeScalarIndex:(*v10)[3] startMilliSeconds:v12 endMilliSeconds:v13];
        [v7 addObject:v14];

        ++v10;
      }
      while (v10 != (unsigned int **)v9);
    }
    if (v8) {
      operator delete(v8);
    }
    unint64_t v15 = [[USOSerializedUtteranceAlignment alloc] initWithNodeIndex:a4 asrHypothesisIndex:**(unsigned int **)v6[7] spans:v7];
  }
  return v15;
}

- (id)getIdentifiersIfExists:(const UsoGraphNode *)a3 nodeIndex:(unint64_t)a4
{
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
    siri::ontology::UsoEntityNode::getIdentifiers(v5, &v34);
    std::string __p = v34;
    uint64_t v29 = v35;
    if (v34 != v35)
    {
      unint64_t v6 = 0x1E4F29000uLL;
      unint64_t v7 = 0x1E4F28000uLL;
      uint64_t v8 = v34;
      do
      {
        uint64_t v9 = *(void **)(v6 + 24);
        uint64_t v10 = *v8;
        if (SHIBYTE((*v8)->__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(&v32, v10->__r_.__value_.__l.__data_, v10->__r_.__value_.__l.__size_);
        }
        else
        {
          long long v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
          v32.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v11;
        }
        if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v12 = &v32;
        }
        else {
          uint64_t v12 = (std::string *)v32.__r_.__value_.__r.__words[0];
        }
        uint64_t v13 = [v9 stringWithUTF8String:v12];
        if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v32.__r_.__value_.__l.__data_);
        }
        unint64_t v14 = *(void **)(v6 + 24);
        unint64_t v15 = *v8;
        if (SHIBYTE((*v8)[1].__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v32, v15[1].__r_.__value_.__l.__data_, v15[1].__r_.__value_.__l.__size_);
        }
        else {
          std::string v32 = v15[1];
        }
        if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint8x8_t v16 = &v32;
        }
        else {
          uint8x8_t v16 = (std::string *)v32.__r_.__value_.__r.__words[0];
        }
        uint64_t v17 = [v14 stringWithUTF8String:v16];
        if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v32.__r_.__value_.__l.__data_);
        }
        std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v32, (long long *)&(*v8)[2]);
        if (v33)
        {
          if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            v18 = &v32;
          }
          else {
            v18 = (std::string *)v32.__r_.__value_.__r.__words[0];
          }
          unint64_t v19 = [*(id *)(v6 + 24) stringWithUTF8String:v18];
          if (v33 && SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v32.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          unint64_t v19 = 0;
        }
        char v20 = *v8;
        if ((*v8)[3].__r_.__value_.__s.__data_[16])
        {
          uint64_t v21 = [*(id *)(v7 + 3792) numberWithDouble:*(double *)&v20[3].__r_.__value_.__l.__size_];
          char v20 = *v8;
        }
        else
        {
          uint64_t v21 = 0;
        }
        if ((v20[4].__r_.__value_.__r.__words[0] & 0xFF00000000) != 0)
        {
          float v22 = objc_msgSend(*(id *)(v7 + 3792), "numberWithInt:");
          char v20 = *v8;
        }
        else
        {
          float v22 = 0;
        }
        if ((v20[4].__r_.__value_.__l.__size_ & 0xFF00000000) != 0)
        {
          BOOL v23 = objc_msgSend(*(id *)(v7 + 3792), "numberWithUnsignedInt:");
          char v20 = *v8;
        }
        else
        {
          BOOL v23 = 0;
        }
        unint64_t v24 = v6;
        if ((v20[4].__r_.__value_.__r.__words[2] & 0xFF00000000) != 0)
        {
          uint64_t v25 = objc_msgSend(*(id *)(v7 + 3792), "numberWithUnsignedInt:");
        }
        else
        {
          uint64_t v25 = 0;
        }
        uint64_t v26 = [[USOSerializedIdentifier alloc] initWithNodeIndex:a4 value:v13 appBundleId:v17 namespaceString:v19 probability:v21 sourceComponent:v22 groupIndex:v23 interpretationGroup:v25];
        [v31 addObject:v26];

        ++v8;
        unint64_t v6 = v24;
        unint64_t v7 = 0x1E4F28000;
      }
      while (v8 != v29);
    }
    if (__p) {
      operator delete(__p);
    }
  }
  return v31;
}

- (USOSerializedGraph)initWithNodes:(id)a3 edges:(id)a4 identifiers:(id)a5 alignments:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)USOSerializedGraph;
  unint64_t v15 = [(USOSerializedGraph *)&v18 init];
  uint8x8_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_nodes, a3);
    objc_storeStrong((id *)&v16->_edges, a4);
    objc_storeStrong((id *)&v16->_identifiers, a5);
    objc_storeStrong((id *)&v16->_alignments, a6);
  }

  return v16;
}

- (USOSerializedGraph)initWithNodes:(id)a3 edges:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)USOSerializedGraph;
  uint64_t v9 = [(USOSerializedGraph *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nodes, a3);
    objc_storeStrong((id *)&v10->_edges, a4);
    uint64_t v11 = [MEMORY[0x1E4F1C978] array];
    identifiers = v10->_identifiers;
    v10->_identifiers = (NSArray *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1C978] array];
    alignments = v10->_alignments;
    v10->_alignments = (NSArray *)v13;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end