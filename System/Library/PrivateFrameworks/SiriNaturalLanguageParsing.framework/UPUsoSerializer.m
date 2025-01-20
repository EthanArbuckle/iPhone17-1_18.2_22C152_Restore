@interface UPUsoSerializer
+ (id)_convertBundleIdToEntity:(id)a3;
+ (id)_groupHigherLevelEntities:(id)a3;
+ (id)_intermediateNodeRepresentations:()vector<std:(std:()std:(std::reference_wrapper<const siri::ontology::UsoGraphEdge>>>> *)a3 :allocator<std::pair<std::reference_wrapper<siri::ontology::UsoGraphNode> :reference_wrapper<const)siri::ontology::UsoGraphEdge>> :pair<std::reference_wrapper<siri::ontology::UsoGraphNode>;
+ (id)_leafNodeFromGraphEdge:(const void *)a3 andGraphNode:(const UsoGraphNode *)a4;
+ (id)_leafNodeFromLabel:(id)a3 andGraphSemanticValueNode:(const void *)a4;
+ (id)_leafNodeFromLabel:(id)a3 andGraphStringNode:(const void *)a4;
- (UPUsoSerializer)init;
- (id).cxx_construct;
- (id)deserializeFromSerializedGraph:(id)a3;
- (id)serializeFromIntent:(id)a3 andEntities:(id)a4 forBundleId:(id)a5;
- (void)_addPathForLabel:(id)a3 range:(_NSRange)a4 text:(id)a5 semanticValue:(id)a6 sharedEntityGraph:(id)a7 toGraphNode:(UsoGraphNode *)a8 forGraph:(void *)a9;
- (void)_attachSharedEntity:(id)a3 withCustomEntityEdge:(const void *)a4 toGraphNode:(UsoGraphNode *)a5 forGraph:(void *)a6;
- (void)_insertHigherLevelEntities:(id)a3 intoGraph:(void *)a4 underTaskNode:(UsoGraphNode *)a5;
- (void)_insertSimpleEntity:(id)a3 intoGraph:(void *)a4 underTaskNode:(UsoGraphNode *)a5;
@end

@implementation UPUsoSerializer

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_usoVocabManager.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)_attachSharedEntity:(id)a3 withCustomEntityEdge:(const void *)a4 toGraphNode:(UsoGraphNode *)a5 forGraph:(void *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager((siri::ontology *)[MEMORY[0x1E4FA2B00] convertUsoGraphFromObjCToCpp:v7]);
  uint64_t v10 = *SharedUsoVocabManager;
  v9 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
  if (v9)
  {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    uint64_t v27 = v10;
    v28 = v9;
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  else
  {
    uint64_t v27 = v10;
    v28 = 0;
  }
  siri::ontology::UsoGraphProtoReader::fromProtobuf((uint64_t *)&v26, (siri::ontology::UsoGraphProtoReader *)&v27, v29);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v23);
  siri::ontology::UsoGraph::prettyPrint();
  v11 = SNLPOSLoggerForCategory(3);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    std::stringbuf::str();
    v12 = v22 >= 0 ? &__p : (void **)__p;
    *(_DWORD *)buf = 136642819;
    v31 = v12;
    _os_log_impl(&dword_1C8DA9000, v11, OS_LOG_TYPE_DEBUG, "Attaching shared entity graph: %{sensitive}s", buf, 0xCu);
    if (v22 < 0) {
      operator delete(__p);
    }
  }

  siri::ontology::UsoGraph::getSuccessors((uint64_t *)&__p, *(siri::ontology::UsoGraph **)(*((void *)v26 + 11) + 8), *((const UsoGraphNode **)v26 + 11));
  if (v21 - (unsigned char *)__p != 8)
  {
    v15 = SNLPOSLoggerForCategory(3);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v16 = "The shared entity graph does not have a single, unique entity below the root: skipping";
LABEL_20:
    _os_log_impl(&dword_1C8DA9000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_21;
  }
  v13 = *(const void **)__p;
  if ((*(unsigned int (**)(void))(**(void **)__p + 16))(*(void *)__p) != 2)
  {
    v15 = SNLPOSLoggerForCategory(3);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_WORD *)buf = 0;
    v16 = "The shared entity graph does not have an entity node";
    goto LABEL_20;
  }
  if (v14)
  {
    siri::ontology::UsoGraph::deepCopyToGraph(v26, v14, (siri::ontology::UsoGraph *)a6);
    siri::ontology::UsoGraphNode::setSuccessor();
    goto LABEL_22;
  }
  v15 = SNLPOSLoggerForCategory(3);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v16 = "The entity node could not be dynamically cast to a UsoEntityNode";
    goto LABEL_20;
  }
LABEL_21:

LABEL_22:
  if (__p)
  {
    v21 = __p;
    operator delete(__p);
  }
  v23[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v23 + *(void *)(v23[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v23[1] = MEMORY[0x1E4FBA470] + 16;
  if (v24 < 0) {
    operator delete((void *)v23[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1CB775B50](&v25);
  v17 = v26;
  v26 = 0;
  if (v17)
  {
    uint64_t v18 = MEMORY[0x1CB774F40]();
    MEMORY[0x1CB775C40](v18, 0x10A0C403D23BABBLL);
  }
  if (v28) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v28);
  }
  v19 = v29;
  v29 = 0;
  if (v19) {
    (*(void (**)(const sirinluexternal::UsoGraph *))(*(void *)v19 + 8))(v19);
  }
}

- (void)_addPathForLabel:(id)a3 range:(_NSRange)a4 text:(id)a5 semanticValue:(id)a6 sharedEntityGraph:(id)a7 toGraphNode:(UsoGraphNode *)a8 forGraph:(void *)a9
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v12 UTF8String]);
  siri::ontology::UsoVocabManager::createCustomEdgeName();
  if (v17 < 0) {
    operator delete(__p);
  }
  operator new();
}

- (void)_insertHigherLevelEntities:(id)a3 intoGraph:(void *)a4 underTaskNode:(UsoGraphNode *)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  [(id)objc_opt_class() _groupHigherLevelEntities:v18];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(id *)(*((void *)&v44 + 1) + 8 * i);
        v5 = objc_msgSend(obj, "objectForKey:");
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v26 = v5;
        uint64_t v25 = [v26 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v25)
        {
          uint64_t v23 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v41 != v23) {
                objc_enumerationMutation(v26);
              }
              id v28 = [v26 objectForKey:*(void *)(*((void *)&v40 + 1) + 8 * j)];
              char v39 = 19;
              strcpy(__p, "unknownCustomEntity");
              siri::ontology::UsoVocabManager::createCustomEntityName();
              if (v39 < 0) {
                operator delete(*(void **)__p);
              }
              std::string::basic_string[abi:ne180100]<0>(&v36, (char *)[v24 UTF8String]);
              siri::ontology::UsoVocabManager::createCustomEdgeName();
              if (v37 < 0) {
                operator delete(v36);
              }
              uint64_t EntityNode = siri::ontology::UsoGraph::createEntityNode();
              siri::ontology::UsoGraphNode::setSuccessor();
              long long v34 = 0u;
              long long v35 = 0u;
              long long v32 = 0u;
              long long v33 = 0u;
              id v29 = v28;
              uint64_t v7 = [v29 countByEnumeratingWithState:&v32 objects:v48 count:16];
              if (v7)
              {
                uint64_t v8 = *(void *)v33;
                do
                {
                  for (uint64_t k = 0; k != v7; ++k)
                  {
                    if (*(void *)v33 != v8) {
                      objc_enumerationMutation(v29);
                    }
                    uint64_t v10 = *(void **)(*((void *)&v32 + 1) + 8 * k);
                    v11 = [v10 higherLevelChildLabel];
                    uint64_t v12 = [v10 range];
                    uint64_t v14 = v13;
                    id v15 = [v10 text];
                    v16 = [v10 semanticValue];
                    char v17 = [v10 sharedEntityGraph];
                    -[UPUsoSerializer _addPathForLabel:range:text:semanticValue:sharedEntityGraph:toGraphNode:forGraph:](self, "_addPathForLabel:range:text:semanticValue:sharedEntityGraph:toGraphNode:forGraph:", v11, v12, v14, v15, v16, v17, EntityNode, a4, v18);
                  }
                  uint64_t v7 = [v29 countByEnumeratingWithState:&v32 objects:v48 count:16];
                }
                while (v7);
              }
            }
            uint64_t v25 = [v26 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v25);
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v19);
  }
}

- (void)_insertSimpleEntity:(id)a3 intoGraph:(void *)a4 underTaskNode:(UsoGraphNode *)a5
{
  id v15 = a3;
  uint64_t v8 = [v15 label];
  uint64_t v9 = [v15 range];
  uint64_t v11 = v10;
  uint64_t v12 = [v15 text];
  uint64_t v13 = [v15 semanticValue];
  uint64_t v14 = [v15 sharedEntityGraph];
  -[UPUsoSerializer _addPathForLabel:range:text:semanticValue:sharedEntityGraph:toGraphNode:forGraph:](self, "_addPathForLabel:range:text:semanticValue:sharedEntityGraph:toGraphNode:forGraph:", v8, v9, v11, v12, v13, v14, a5, a4);
}

- (id)deserializeFromSerializedGraph:(id)a3
{
  id v4 = a3;
  cntrl = self->_usoVocabManager.__cntrl_;
  ptr = self->_usoVocabManager.__ptr_;
  v58 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  id v56 = 0;
  long long v46 = v4;
  if (v4)
  {
    [v4 toCppUsoGraph:&ptr withError:&v56];
    id v45 = v56;
    cntrl = v58;
    if (!v58) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v45 = 0;
  uint64_t v59 = 0;
  if (cntrl) {
LABEL_5:
  }
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
LABEL_6:
  siri::ontology::oname::graph::ontology_init::Argument_task((siri::ontology::oname::graph::ontology_init *)cntrl);
  siri::ontology::UsoGraph::getSuccessors();
  if (v55 == v54) {
    std::vector<nlv4_inference_orchestrator::trees::TreeNode>::__throw_out_of_range[abi:ne180100]();
  }
  if (!v6) {
    __cxa_bad_cast();
  }
  uint64_t v7 = v6;
  var1 = v6[4].var1;
  uint64_t v9 = (void *)((char *)var1 + 8);
  if (*((char *)var1 + 31) < 0) {
    uint64_t v9 = (void *)*v9;
  }
  uint64_t v43 = objc_msgSend(NSString, "stringWithCString:encoding:", v9, objc_msgSend(NSString, "defaultCStringEncoding"));
  siri::ontology::UsoGraph::getSuccessorsWithEdges((uint64_t *)&v52, (siri::ontology::UsoGraph *)v7->var1, v7);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v12 = v52;
  uint64_t v11 = v53;
  if (v52 == v53)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      uint64_t v16 = *v12;
      (*(void (**)(void **__return_ptr, void))(*(void *)*v12 + 48))(__p, *v12);
      if ((*(unsigned int (**)(uint64_t))(*(void *)v16 + 16))(v16) != 2) {
        goto LABEL_25;
      }
      unint64_t v17 = v51;
      if ((v51 & 0x80u) != 0) {
        unint64_t v17 = (unint64_t)__p[1];
      }
      if (v17 != 19) {
        goto LABEL_25;
      }
      id v18 = __p;
      if ((v51 & 0x80u) != 0) {
        id v18 = (void **)__p[0];
      }
      uint64_t v19 = *v18;
      uint64_t v20 = v18[1];
      uint64_t v21 = *(uint64_t *)((char *)v18 + 11);
      BOOL v22 = v19 == (void *)0x436E776F6E6B6E75 && v20 == (void *)0x746E456D6F747375;
      if (v22 && v21 == 0x797469746E456D6FLL)
      {
        if ((unint64_t)v14 >= v15)
        {
          uint64_t v25 = (v14 - v13) >> 4;
          unint64_t v26 = v25 + 1;
          if ((unint64_t)(v25 + 1) >> 60) {
            std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v15 - (void)v13) >> 3 > v26) {
            unint64_t v26 = (uint64_t)(v15 - (void)v13) >> 3;
          }
          if (v15 - (unint64_t)v13 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v27 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v27 = v26;
          }
          if (v27) {
            unint64_t v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(v27);
          }
          else {
            uint64_t v28 = 0;
          }
          id v29 = (_OWORD *)(v27 + 16 * v25);
          _OWORD *v29 = *(_OWORD *)v12;
          if (v14 == v13)
          {
            v31 = (char *)(v27 + 16 * v25);
          }
          else
          {
            unint64_t v30 = v27 + 16 * v25;
            do
            {
              v31 = (char *)(v30 - 16);
              *(_OWORD *)(v30 - 16) = *((_OWORD *)v14 - 1);
              v14 -= 16;
              v30 -= 16;
            }
            while (v14 != v13);
          }
          unint64_t v15 = v27 + 16 * v28;
          uint64_t v14 = (char *)(v29 + 1);
          if (v13) {
            operator delete(v13);
          }
          uint64_t v13 = v31;
        }
        else
        {
          *(_OWORD *)uint64_t v14 = *(_OWORD *)v12;
          v14 += 16;
        }
      }
      else
      {
LABEL_25:
        id v24 = +[UPUsoSerializer _leafNodeFromGraphEdge:andGraphNode:](UPUsoSerializer, "_leafNodeFromGraphEdge:andGraphNode:", v12[1], *v12, v43, v45, v46);
        [v10 addObject:v24];
      }
      if ((char)v51 < 0) {
        operator delete(__p[0]);
      }
      v12 += 2;
    }
    while (v12 != v11);
  }
  long long v32 = [UPResultRootNode alloc];
  v48 = 0;
  v49 = 0;
  long long v47 = 0;
  uint64_t v33 = v14 - v13;
  if (v14 != v13)
  {
    if (v33 < 0) {
      std::vector<boost::archive::detail::basic_iarchive_impl::aobject>::__throw_length_error[abi:ne180100]();
    }
    long long v34 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(v33 >> 4);
    long long v47 = v34;
    v48 = v34;
    v49 = &v34[v35];
    v36 = v13;
    do
    {
      long long v37 = *(_OWORD *)v36;
      v36 += 16;
      *v34++ = v37;
    }
    while (v36 != v14);
    v48 = v34;
  }
  v38 = +[UPUsoSerializer _intermediateNodeRepresentations:](UPUsoSerializer, "_intermediateNodeRepresentations:", &v47, v43);
  char v39 = [(UPResultRootNode *)v32 initWithLabel:v44 intermediateNodes:v38 directLeafNodes:v10];

  if (v47)
  {
    v48 = v47;
    operator delete(v47);
  }
  if (v13) {
    operator delete(v13);
  }

  if (v52)
  {
    v53 = v52;
    operator delete(v52);
  }

  if (v54)
  {
    v55 = v54;
    operator delete(v54);
  }
  uint64_t v40 = v59;
  uint64_t v59 = 0;
  if (v40)
  {
    uint64_t v41 = MEMORY[0x1CB774F40]();
    MEMORY[0x1CB775C40](v41, 0x10A0C403D23BABBLL);
  }

  return v39;
}

- (id)serializeFromIntent:(id)a3 andEntities:(id)a4 forBundleId:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  *((unsigned char *)&v14.__r_.__value_.__s + 23) = 19;
  strcpy((char *)&v14, "unknownCustomEntity");
  id v11 = a5;
  if ([v11 length])
  {
    +[UPUsoSerializer _convertBundleIdToEntity:](UPUsoSerializer, "_convertBundleIdToEntity:", v11, v9, v10);
    id v7 = objc_claimAutoreleasedReturnValue();
    MEMORY[0x1CB7755B0](&v14, [v7 UTF8String]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v9 UTF8String]);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v12, v14.__r_.__value_.__l.__data_, v14.__r_.__value_.__l.__size_);
  }
  else {
    std::string v12 = v14;
  }
  siri::ontology::UsoVocabManager::createCustomEntityName();
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
  operator new();
}

- (UPUsoSerializer)init
{
  v8.receiver = self;
  v8.super_class = (Class)UPUsoSerializer;
  v2 = [(UPUsoSerializer *)&v8 init];
  SharedUsoVocabManager = (UsoVocabManager **)siri::ontology::getSharedUsoVocabManager((siri::ontology *)v2);
  v5 = *SharedUsoVocabManager;
  id v4 = SharedUsoVocabManager[1];
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)v4 + 1, 1uLL, memory_order_relaxed);
  }
  cntrl = (std::__shared_weak_count *)v2->_usoVocabManager.__cntrl_;
  v2->_usoVocabManager.__ptr_ = v5;
  v2->_usoVocabManager.__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
  }
  return v2;
}

+ (id)_leafNodeFromLabel:(id)a3 andGraphSemanticValueNode:(const void *)a4
{
  id v4 = (siri::ontology::oname::graph::ontology_init *)a3;
  siri::ontology::oname::graph::ontology_init::Argument_stringValue(v4);
  siri::ontology::UsoGraph::getSuccessors();
  if (v16 == v15) {
    std::vector<nlv4_inference_orchestrator::trees::TreeNode>::__throw_out_of_range[abi:ne180100]();
  }
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (long long *)(*(void *)v15 + 104));
  if (!v14) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  v5 = NSString;
  int v6 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  std::string::size_type v7 = __p.__r_.__value_.__r.__words[0];
  uint64_t v8 = [NSString defaultCStringEncoding];
  if (v6 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)v7;
  }
  id v10 = [v5 stringWithCString:p_p encoding:v8];
  id v11 = [[UPResultLeafNode alloc] initWithLabel:v4 andText:0 andSemanticValue:v10];

  if (v14 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v15)
  {
    uint64_t v16 = v15;
    operator delete(v15);
  }

  return v11;
}

+ (id)_leafNodeFromLabel:(id)a3 andGraphStringNode:(const void *)a4
{
  id v5 = a3;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (long long *)((char *)a4 + 104));
  if (!v15) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  int v6 = NSString;
  int v7 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  std::string::size_type v8 = __p.__r_.__value_.__r.__words[0];
  uint64_t v9 = [NSString defaultCStringEncoding];
  if (v7 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)v8;
  }
  id v11 = [v6 stringWithCString:p_p encoding:v9];
  std::string v12 = [[UPResultLeafNode alloc] initWithLabel:v5 andText:v11 andSemanticValue:0];

  if (v15 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  return v12;
}

+ (id)_convertBundleIdToEntity:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
  return v3;
}

+ (id)_groupHigherLevelEntities:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v21;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(v4);
        }
        std::string::size_type v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v9 = [v8 higherLevelParentLabel];
        id v10 = [v3 objectForKey:v9];
        BOOL v11 = v10 == 0;

        if (v11)
        {
          std::string v12 = [MEMORY[0x1E4F1CA60] dictionary];
          [v3 setObject:v12 forKey:v9];
        }
        uint64_t v13 = [v3 objectForKey:v9];
        char v14 = [v8 groupId];
        if (v14) {
          [v8 groupId];
        }
        else {
        char v15 = [NSNumber numberWithLong:0x7FFFFFFFFFFFFFFFLL];
        }

        uint64_t v16 = [v13 objectForKey:v15];
        BOOL v17 = v16 == 0;

        if (v17)
        {
          id v18 = [MEMORY[0x1E4F1CA48] array];
          [v13 setObject:v18 forKey:v15];
        }
        uint64_t v19 = [v13 objectForKey:v15];
        [v19 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v5);
  }

  return v3;
}

+ (id)_intermediateNodeRepresentations:()vector<std:(std:()std:(std::reference_wrapper<const siri::ontology::UsoGraphEdge>>>> *)a3 :allocator<std::pair<std::reference_wrapper<siri::ontology::UsoGraphNode> :reference_wrapper<const)siri::ontology::UsoGraphEdge>> :pair<std::reference_wrapper<siri::ontology::UsoGraphNode>
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  var0 = (const void **)a3->var0;
  var1 = a3->var1;
  if (a3->var0 != var1)
  {
    do
    {
      int v7 = (char *)var0[1];
      std::string::size_type v8 = v7 + 32;
      if (v7[55] < 0) {
        std::string::size_type v8 = (void *)*v8;
      }
      uint64_t v9 = *var0;
      id v10 = objc_msgSend(NSString, "stringWithCString:encoding:", v8, objc_msgSend(NSString, "defaultCStringEncoding"));
      if (!v11) {
        __cxa_bad_cast();
      }
      std::string v12 = v11;
      uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
      siri::ontology::UsoGraph::getSuccessorsWithEdges((uint64_t *)&v19, v12[1], (const UsoGraphNode *)v12);
      char v15 = v19;
      char v14 = v20;
      if (v19 != v20)
      {
        do
        {
          uint64_t v16 = +[UPUsoSerializer _leafNodeFromGraphEdge:v15[1] andGraphNode:*v15];
          [v13 addObject:v16];

          v15 += 2;
        }
        while (v15 != v14);
        char v15 = v19;
      }
      if (v15)
      {
        uint64_t v20 = v15;
        operator delete(v15);
      }
      BOOL v17 = [[UPResultIntermediateNode alloc] initWithLabel:v10 andLeafNodes:v13];
      [v4 addObject:v17];

      var0 += 2;
    }
    while (var0 != var1);
  }
  return v4;
}

+ (id)_leafNodeFromGraphEdge:(const void *)a3 andGraphNode:(const UsoGraphNode *)a4
{
  uint64_t v5 = NSString;
  uint64_t v6 = (char *)a3 + 32;
  int v7 = (char *)*((void *)a3 + 4);
  int v8 = *((char *)a3 + 55);
  uint64_t v9 = [NSString defaultCStringEncoding];
  if (v8 >= 0) {
    id v10 = v6;
  }
  else {
    id v10 = v7;
  }
  BOOL v11 = [v5 stringWithCString:v10 encoding:v9];
  if ((*((unsigned int (**)(const UsoGraphNode *))a4->var0 + 2))(a4) == 3) {
    +[UPUsoSerializer _leafNodeFromLabel:v11 andGraphStringNode:a4];
  }
  else {
  std::string v12 = +[UPUsoSerializer _leafNodeFromLabel:v11 andGraphSemanticValueNode:a4];
  }

  return v12;
}

@end