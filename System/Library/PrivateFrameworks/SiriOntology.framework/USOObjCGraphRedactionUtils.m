@interface USOObjCGraphRedactionUtils
+ (BOOL)isAllowedCatiEntitySpan:(const void *)a3 key:(const void *)a4;
+ (BOOL)isAllowedCatiIdentifier:(const void *)a3;
+ (BOOL)isContactIDNamespace:(const void *)a3;
+ (BOOL)isContactIDNamespaceString:(const void *)a3;
+ (BOOL)isContactRelatedEntityNode:(UsoGraphNode *)a3;
+ (BOOL)isHomeKitEntityTypeEntitySpan:(const void *)a3 key:(const void *)a4 value:(const void *)a5;
+ (BOOL)isHomeKitEntityTypeIdentifier:(const void *)a3;
+ (BOOL)shouldRetainEntitySpanValue:(const void *)a3 key:(const void *)a4 entitySpan:(const void *)a5 isContactRelatedEntityNode:(BOOL)a6;
+ (BOOL)shouldRetainIdentifierValue:(const void *)a3 isContactRelatedEntityNode:(BOOL)a4;
+ (id)allowedHomeKitEntityTypes;
+ (id)catiNamespacesForIdentifierValues;
+ (id)commonAppBundleIds;
+ (id)contactEntities;
+ (id)firstPartyAppBundleIds;
+ (id)getRedactedGraph:(void *)a3;
+ (id)obfuscateAppBundleId:()basic_string<char;
+ (unique_ptr<siri::ontology::UsoEntitySpan,)getRedactedEntitySpan:(UsoEntitySpan *)a3 isContactRelatedEntityNode:(BOOL)a4;
+ (unique_ptr<siri::ontology::UsoEntitySpan,)getRedactionEntitySpan;
+ (unique_ptr<siri::ontology::UsoIdentifier,)getRedactedIdentifier:(UsoIdentifier *)a3 isContactRelatedEntityNode:;
+ (unique_ptr<siri::ontology::UsoIdentifier,)getRedactionIdentifier;
+ (void)redactedGraphHelperWithRedactedGraph:(void *)a3 redactedList:(id)a4 visitedNodes:(id)a5 fromNode:(UsoGraphNode *)a6 successors:()vector<std:(std:()std:(std:(shared_ptr<siri::ontology::UsoVocabManager>)a8 :reference_wrapper<const siri::ontology::UsoGraphEdge>>>> *)a7 :allocator<std::pair<std::reference_wrapper<siri::ontology::UsoGraphNode> :reference_wrapper<const)siri::ontology::UsoGraphEdge>> :pair<std::reference_wrapper<siri::ontology::UsoGraphNode> vocabManager:;
@end

@implementation USOObjCGraphRedactionUtils

+ (void)redactedGraphHelperWithRedactedGraph:(void *)a3 redactedList:(id)a4 visitedNodes:(id)a5 fromNode:(UsoGraphNode *)a6 successors:()vector<std:(std:()std:(std:(shared_ptr<siri::ontology::UsoVocabManager>)a8 :reference_wrapper<const siri::ontology::UsoGraphEdge>>>> *)a7 :allocator<std::pair<std::reference_wrapper<siri::ontology::UsoGraphNode> :reference_wrapper<const)siri::ontology::UsoGraphEdge>> :pair<std::reference_wrapper<siri::ontology::UsoGraphNode> vocabManager:
{
  id v11 = a4;
  id v12 = a5;
  v23 = a6;
  v13 = [NSNumber numberWithUnsignedLongLong:a6->var2];
  LOBYTE(a5) = [v12 containsObject:v13];

  if ((a5 & 1) == 0)
  {
    var0 = (char *)a7->var0;
    if (a7->var1 != a7->var0)
    {
      unint64_t v15 = 0;
      while (2)
      {
        v16 = &var0[16 * v15];
        v17 = *(const void **)v16;
        switch((*(unsigned int (**)(void))(**(void **)v16 + 16))(*(void *)v16))
        {
          case 1u:
            siri::ontology::UsoGraph::createTaskNode(*(siri::ontology::UsoGraph **)a3, v18[3], v18[13]);
          case 2u:
            siri::ontology::UsoGraph::createEntityNode(*(siri::ontology::UsoGraph **)a3, v19[3]);
          case 3u:
            siri::ontology::UsoGraph::createStringNode();
          case 4u:
            siri::ontology::UsoGraph::createIntNode();
          case 5u:
            siri::ontology::UsoGraph::createOperatorNode(*(siri::ontology::UsoGraph **)a3, v20[3]);
          default:
            ++v15;
            var0 = (char *)a7->var0;
            if (v15 >= ((char *)a7->var1 - (char *)a7->var0) >> 4) {
              break;
            }
            continue;
        }
        break;
      }
    }
    v21 = [NSNumber numberWithUnsignedLongLong:v23->var2];
    [v12 addObject:v21];
  }
}

+ (BOOL)isAllowedCatiEntitySpan:(const void *)a3 key:(const void *)a4
{
  if ((*((void *)a3 + 4) & 0xFF00000000) == 0 || *((void *)a3 + 4) != 5) {
    return 0;
  }
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v15, (long long *)a3);
  if (!v16) {
    return 0;
  }
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (long long *)a3);
  if (!v14) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  if (!std::string::compare(&__p, (const std::string::value_type *)[@"com.apple.siri.cati" UTF8String]))
  {
    v10 = [a1 catiNamespacesForIdentifierValues];
    if (*((char *)a4 + 23) >= 0) {
      id v11 = a4;
    }
    else {
      id v11 = *(const void **)a4;
    }
    id v12 = [NSString stringWithUTF8String:v11];
    char v8 = [v10 containsObject:v12];
  }
  else
  {
    char v8 = 0;
  }
  if (v14 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v16 && SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
  return v8;
}

+ (BOOL)isAllowedCatiIdentifier:(const void *)a3
{
  if ((*((void *)a3 + 12) & 0xFF00000000) == 0 || *((void *)a3 + 12) != 5) {
    return 0;
  }
  if (*((char *)a3 + 47) < 0) {
    std::string::__init_copy_ctor_external(&v14, *((const std::string::value_type **)a3 + 3), *((void *)a3 + 4));
  }
  else {
    std::string v14 = *(std::string *)((unsigned char *)a3 + 1);
  }
  if (!std::string::compare(&v14, (const std::string::value_type *)[@"com.apple.siri.cati" UTF8String]))
  {
    v7 = [a1 catiNamespacesForIdentifierValues];
    char v8 = NSString;
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (long long *)a3 + 3);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    v10 = [v8 stringWithUTF8String:p_p];
    char v4 = [v7 containsObject:v10];

    if (v13 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    char v4 = 0;
  }
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v14.__r_.__value_.__l.__data_);
  }
  return v4;
}

+ (BOOL)shouldRetainEntitySpanValue:(const void *)a3 key:(const void *)a4 entitySpan:(const void *)a5 isContactRelatedEntityNode:(BOOL)a6
{
  BOOL v6 = a6;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v16, (long long *)a5);
  if (v17)
  {
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (long long *)a5);
    if (!v15) {
      std::__throw_bad_optional_access[abi:ne180100]();
    }
    int v11 = std::string::compare(&__p, (const std::string::value_type *)[@"com.apple.siri.sirinl" UTF8String]);
    if (v15 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v17 && SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v16.__r_.__value_.__l.__data_);
    }
    if (!v11) {
      return 1;
    }
  }
  if ((*((void *)a5 + 4) & 0xFF00000000) == 0 || *((void *)a5 + 4) != 1) {
    return [a1 isAllowedCatiEntitySpan:a5 key:a4];
  }
  if (v6)
  {
    if (!+[PlatformUtils isInternalInstall]
      || std::string::compare((const std::string *)a4, (const std::string::value_type *)[@"semantic_value" UTF8String]))
    {
      return [a1 isContactIDNamespaceString:a4];
    }
    return 1;
  }
  return [a1 isHomeKitEntityTypeEntitySpan:a5 key:a4 value:a3];
}

+ (BOOL)shouldRetainIdentifierValue:(const void *)a3 isContactRelatedEntityNode:(BOOL)a4
{
  BOOL v4 = a4;
  if (*((char *)a3 + 47) < 0) {
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a3 + 3), *((void *)a3 + 4));
  }
  else {
    std::string __p = *(std::string *)((unsigned char *)a3 + 1);
  }
  int v7 = std::string::compare(&__p, (const std::string::value_type *)objc_msgSend(@"com.apple.siri.sirinl", "UTF8String", __p.__r_.__value_.__r.__words[0], __p.__r_.__value_.__l.__size_, __p.__r_.__value_.__r.__words[2]));
  int v8 = v7;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (!v8) {
      return 1;
    }
  }
  else if (!v7)
  {
    return 1;
  }
  if ((*((void *)a3 + 12) & 0xFF00000000) == 0 || *((void *)a3 + 12) != 1) {
    return [a1 isAllowedCatiIdentifier:a3];
  }
  if (v4)
  {
    if (!+[PlatformUtils isInternalInstall]) {
      return [a1 isContactIDNamespace:a3];
    }
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (long long *)a3 + 3);
    int v9 = std::string::compare(&__p, (const std::string::value_type *)[@"semantic_value" UTF8String]);
    if (v12)
    {
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    if (v9) {
      return [a1 isContactIDNamespace:a3];
    }
    return 1;
  }
  return [a1 isHomeKitEntityTypeIdentifier:a3];
}

+ (BOOL)isHomeKitEntityTypeEntitySpan:(const void *)a3 key:(const void *)a4 value:(const void *)a5
{
  if (std::string::compare((const std::string *)a4, (const std::string::value_type *)[@"homeKitEntityType" UTF8String]))
  {
    return 0;
  }
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v16, (long long *)a3);
  if (!v17) {
    return 0;
  }
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, (long long *)a3);
  if (!v15) {
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  int v10 = std::string::compare(&__p, (const std::string::value_type *)[@"HomeKit" UTF8String]);
  if (v15 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v17 && SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  if (v10) {
    return 0;
  }
  int v11 = [a1 allowedHomeKitEntityTypes];
  if (*((char *)a5 + 23) >= 0) {
    char v12 = a5;
  }
  else {
    char v12 = *(const void **)a5;
  }
  char v13 = [NSString stringWithUTF8String:v12];
  char v8 = [v11 containsObject:v13];

  return v8;
}

+ (BOOL)isHomeKitEntityTypeIdentifier:(const void *)a3
{
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v13, (long long *)a3 + 3);
  if (!std::string::compare(&v13, (const std::string::value_type *)[@"homeKitEntityType" UTF8String]))
  {
    if (*((char *)a3 + 47) < 0) {
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a3 + 3), *((void *)a3 + 4));
    }
    else {
      std::string __p = *(std::string *)((unsigned char *)a3 + 1);
    }
    BOOL v5 = std::string::compare(&__p, (const std::string::value_type *)objc_msgSend(@"HomeKit", "UTF8String", __p.__r_.__value_.__r.__words[0], __p.__r_.__value_.__l.__size_, __p.__r_.__value_.__r.__words[2])) != 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    BOOL v5 = 1;
  }
  if (v14 && SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }
  if (v5) {
    return 0;
  }
  int v7 = [a1 allowedHomeKitEntityTypes];
  char v8 = NSString;
  if (*((char *)a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v13, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else {
    std::string v13 = *(std::string *)a3;
  }
  if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v9 = &v13;
  }
  else {
    int v9 = (std::string *)v13.__r_.__value_.__r.__words[0];
  }
  int v10 = [v8 stringWithUTF8String:v9];
  char v6 = [v7 containsObject:v10];

  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v13.__r_.__value_.__l.__data_);
  }

  return v6;
}

+ (BOOL)isContactIDNamespaceString:(const void *)a3
{
  return !std::string::compare((const std::string *)a3, (const std::string::value_type *)[@"item_id" UTF8String])|| std::string::compare((const std::string *)a3, (const std::string::value_type *)objc_msgSend(@"intent_vocabulary_id", "UTF8String")) == 0;
}

+ (BOOL)isContactIDNamespace:(const void *)a3
{
  v3 = (long long *)((char *)a3 + 48);
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v8, (long long *)a3 + 3);
  if (!std::string::compare(&v8, (const std::string::value_type *)[@"item_id" UTF8String]))
  {
    BOOL v4 = 1;
  }
  else
  {
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, v3);
    BOOL v4 = std::string::compare(&__p, (const std::string::value_type *)[@"intent_vocabulary_id" UTF8String]) == 0;
    if (v7 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  if (v9 && SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  return v4;
}

+ (BOOL)isContactRelatedEntityNode:(UsoGraphNode *)a3
{
  BOOL v4 = NSString;
  (*((void (**)(void **__return_ptr, UsoGraphNode *, SEL))a3->var0 + 6))(__p, a3, a2);
  if (v11 >= 0) {
    BOOL v5 = __p;
  }
  else {
    BOOL v5 = (void **)__p[0];
  }
  char v6 = [v4 stringWithUTF8String:v5];
  if (v11 < 0) {
    operator delete(__p[0]);
  }
  char v7 = [a1 contactEntities];
  char v8 = [v7 containsObject:v6];

  return v8;
}

+ (unique_ptr<siri::ontology::UsoEntitySpan,)getRedactedEntitySpan:(UsoEntitySpan *)a3 isContactRelatedEntityNode:(BOOL)a4
{
  BOOL v4 = a4;
  long long v30 = 0uLL;
  uint64_t v31 = 0;
  siri::ontology::UsoEntitySpan::getSpanProperties((siri::ontology::UsoEntitySpan *)a3, (char **)v26);
  std::string __p = v26[0];
  if (v26[0] != v26[1])
  {
    v35.__r_.__value_.__s.__data_[0] = 0;
    char v36 = 0;
    uint64_t v7 = *(void *)v26[0];
    if (*(unsigned char *)(*(void *)v26[0] + 48))
    {
      std::optional<std::string>::operator=[abi:ne180100]<char const*,void>((uint64_t)&v35, (char *)[@"USO_REDACTION_DROPPED" UTF8String]);
      if (!*(unsigned char *)(*__p + 48)) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      int v8 = [a1 shouldRetainEntitySpanValue:*__p + 24 key:*__p entitySpan:a3 isContactRelatedEntityNode:v4];
      uint64_t v7 = *__p;
      if (v8)
      {
        char v9 = (const std::string *)(v7 + 24);
        if (v36 == *(unsigned char *)(v7 + 48))
        {
          if (v36) {
            std::string::operator=(&v35, v9);
          }
        }
        else
        {
          if (v36)
          {
            if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v35.__r_.__value_.__l.__data_);
            }
            char v10 = 0;
          }
          else
          {
            if (*(char *)(v7 + 47) < 0)
            {
              std::string::__init_copy_ctor_external(&v35, *(const std::string::value_type **)(v7 + 24), *(void *)(v7 + 32));
            }
            else
            {
              *(_OWORD *)&v35.__r_.__value_.__l.__data_ = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
              v35.__r_.__value_.__r.__words[2] = *(void *)(v7 + 40);
            }
            char v10 = 1;
          }
          char v36 = v10;
        }
        uint64_t v7 = *__p;
      }
    }
    if (*(unsigned char *)(v7 + 60))
    {
      std::to_string(&v32, *(_DWORD *)(v7 + 56));
      int v11 = [a1 shouldRetainEntitySpanValue:&v32 key:*__p entitySpan:a3 isContactRelatedEntityNode:v4];
      int v12 = v11;
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v32.__r_.__value_.__l.__data_);
        if (v12) {
          goto LABEL_21;
        }
      }
      else if (v11)
      {
LABEL_21:
        uint64_t v7 = *__p;
        goto LABEL_25;
      }
      std::optional<std::string>::operator=[abi:ne180100]<char const*,void>((uint64_t)&v35, (char *)[@"USO_REDACTION_DROPPED_INT" UTF8String]);
      uint64_t v7 = *__p;
    }
LABEL_25:
    if (*(unsigned char *)(v7 + 68))
    {
      std::to_string(&v32, *(float *)(v7 + 64));
      int v13 = [a1 shouldRetainEntitySpanValue:&v32 key:*__p entitySpan:a3 isContactRelatedEntityNode:v4];
      int v14 = v13;
      if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        if (v13) {
          goto LABEL_32;
        }
LABEL_31:
        std::optional<std::string>::operator=[abi:ne180100]<char const*,void>((uint64_t)&v35, (char *)[@"USO_REDACTION_DROPPED_FLOAT" UTF8String]);
        goto LABEL_32;
      }
      operator delete(v32.__r_.__value_.__l.__data_);
      if (!v14) {
        goto LABEL_31;
      }
    }
LABEL_32:
    operator new();
  }
  if (v26[0]) {
    operator delete(v26[0]);
  }
  long long v28 = 0uLL;
  uint64_t v29 = 0;
  siri::ontology::UsoEntitySpan::getAlternatives((siri::ontology::UsoEntitySpan *)a3, &v35.__r_.__value_.__l.__data_);
  v21 = (const std::string **)v35.__r_.__value_.__r.__words[0];
  if (v35.__r_.__value_.__r.__words[0] == v35.__r_.__value_.__l.__size_)
  {
    if (v35.__r_.__value_.__r.__words[0]) {
      operator delete(v35.__r_.__value_.__l.__data_);
    }
    if (LOBYTE(a3[1].var0.var0.var1.var0.var1.var0[1])) {
      operator new();
    }
    LOBYTE(v26[0]) = 0;
    char v27 = 0;
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v32, (long long *)&a3->var0.var0.var0);
    if ((_BYTE)v33)
    {
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v32.__r_.__value_.__l.__data_);
      }
      std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v32, (long long *)&a3->var0.var0.var0);
      if (!(_BYTE)v33) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      std::string v25 = v32;
      memset(&v32, 0, sizeof(v32));
      id v18 = [a1 obfuscateAppBundleId:&v25];
      std::optional<std::string>::operator=[abi:ne180100]<char const*,void>((uint64_t)v26, (char *)[v18 UTF8String]);

      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }
      if ((_BYTE)v33 && SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v32.__r_.__value_.__l.__data_);
      }
    }
    v23.__r_.__value_.__s.__data_[0] = 0;
    unsigned __int8 v24 = 0;
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v32, (long long *)&a3[3].var0.var0.var1.var0.var0.var0.var1.var1);
    if ((_BYTE)v33)
    {
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v32.__r_.__value_.__l.__data_);
      }
      std::optional<std::string>::operator=[abi:ne180100]<char const*,void>((uint64_t)&v23, (char *)[@"USO_REDACTION_DROPPED" UTF8String]);
      std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v32, (long long *)&a3[3].var0.var0.var1.var0.var0.var0.var1.var1);
      if (!(_BYTE)v33) {
        std::__throw_bad_optional_access[abi:ne180100]();
      }
      std::string::basic_string[abi:ne180100]<0>(&v35, (char *)[@"item_id" UTF8String]);
      int v19 = [a1 shouldRetainEntitySpanValue:&v32 key:&v35 entitySpan:a3 isContactRelatedEntityNode:v4];
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v35.__r_.__value_.__l.__data_);
      }
      if ((_BYTE)v33 && SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v32.__r_.__value_.__l.__data_);
      }
      if (v19)
      {
        std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v32, (long long *)&a3[3].var0.var0.var1.var0.var0.var0.var1.var1);
        if (v24 == v33)
        {
          if (v24)
          {
            if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v23.__r_.__value_.__l.__data_);
            }
            std::string v23 = v32;
            *((unsigned char *)&v32.__r_.__value_.__s + 23) = 0;
            v32.__r_.__value_.__s.__data_[0] = 0;
          }
        }
        else if (v24)
        {
          if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v23.__r_.__value_.__l.__data_);
          }
          unsigned __int8 v24 = 0;
        }
        else
        {
          std::string v23 = v32;
          memset(&v32, 0, sizeof(v32));
          unsigned __int8 v24 = 1;
        }
        if ((_BYTE)v33 && SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v32.__r_.__value_.__l.__data_);
        }
      }
    }
    std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v22, (long long *)&a3->var0.var0.var1.var0.var1.var0[2]);
    operator new();
  }
  std::string::basic_string[abi:ne180100]<0>(&v34, (char *)[@"USO_REDACTION_DROPPED" UTF8String]);
  char v15 = *v21;
  std::string::basic_string[abi:ne180100]<0>(&v32, (char *)[@"asr_alternative" UTF8String]);
  int v16 = [a1 shouldRetainEntitySpanValue:v15 key:&v32 entitySpan:a3 isContactRelatedEntityNode:v4];
  int v17 = v16;
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v32.__r_.__value_.__l.__data_);
    if (!v17) {
      goto LABEL_41;
    }
  }
  else if (!v16)
  {
LABEL_41:
    operator new();
  }
  std::string::operator=(&v34, *v21);
  goto LABEL_41;
}

+ (unique_ptr<siri::ontology::UsoEntitySpan,)getRedactionEntitySpan
{
  long long v2 = 0uLL;
  uint64_t v3 = 0;
  [@"usoRedactionId" UTF8String];
  [@"USO_REDACTION_NA" UTF8String];
  operator new();
}

+ (unique_ptr<siri::ontology::UsoIdentifier,)getRedactedIdentifier:(UsoIdentifier *)a3 isContactRelatedEntityNode:
{
  uint64_t v4 = v3;
  if (SHIBYTE(a3->var0.var0.var1.var0[2]) < 0) {
    std::string::__init_copy_ctor_external(&var1, (const std::string::value_type *)a3->var0.var0.var1.var0[0], a3->var0.var0.var1.var0[1]);
  }
  else {
    std::string var1 = (std::string)a3->var0.var0.var1;
  }
  uint64_t v7 = [a1 obfuscateAppBundleId:&var1];
  if (SHIBYTE(var1.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(var1.__r_.__value_.__l.__data_);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[@"USO_REDACTION_DROPPED" UTF8String]);
  if ([a1 shouldRetainIdentifierValue:a3 isContactRelatedEntityNode:v4])
  {
    if (*((char *)&a3->var0.var0.var0.var0.var1 + 23) < 0) {
      std::string::__init_copy_ctor_external((std::string *)&var0, a3->var0.var0.var0.var0.var1.var0, a3->var0.var0.var0.var0.var1.var1);
    }
    else {
      __rep var0 = a3->var0.var0.var0;
    }
    if (*((char *)&__p.var0.var1 + 23) < 0) {
      operator delete(__p.var0.var1.var0);
    }
    __rep __p = var0;
  }
  [v7 UTF8String];
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100]((std::string *)&var0, (long long *)a3[1].var0.var0.var0.var0.var0.var0);
  operator new();
}

+ (unique_ptr<siri::ontology::UsoIdentifier,)getRedactionIdentifier
{
}

+ (id)obfuscateAppBundleId:()basic_string<char
{
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0) {
    __rep var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
  }
  uint64_t v4 = [NSString stringWithUTF8String:var0];
  BOOL v5 = [a1 commonAppBundleIds];
  char v6 = [v5 containsObject:v4];

  uint64_t v7 = v4;
  if ((v6 & 1) == 0)
  {
    int v8 = [a1 firstPartyAppBundleIds];
    int v9 = [v8 containsObject:v4];

    if (v9) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = @"USO_APP_BUNDLE_ID_3P";
    }
  }
  char v10 = v7;

  return v10;
}

+ (id)getRedactedGraph:(void *)a3
{
  siri::ontology::getSharedUsoVocabManager((siri::ontology *)a1);
  uint64_t v4 = siri::ontology::getSharedUsoVocabManager(void)::inst;
  uint64_t v5 = unk_1EBCA3AE0;
  if (unk_1EBCA3AE0) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(unk_1EBCA3AE0 + 8), 1uLL, memory_order_relaxed);
  }
  operator new();
}

+ (id)catiNamespacesForIdentifierValues
{
  if (+[USOObjCGraphRedactionUtils catiNamespacesForIdentifierValues]::onceToken != -1) {
    dispatch_once(&+[USOObjCGraphRedactionUtils catiNamespacesForIdentifierValues]::onceToken, &__block_literal_global_27);
  }
  long long v2 = (void *)+[USOObjCGraphRedactionUtils catiNamespacesForIdentifierValues]::catiNamespacesForIdentifierValues;
  return v2;
}

uint64_t __63__USOObjCGraphRedactionUtils_catiNamespacesForIdentifierValues__block_invoke()
{
  +[USOObjCGraphRedactionUtils catiNamespacesForIdentifierValues]::catiNamespacesForIdentifierValues = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ensemble", @"guid", @"intentName", 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)allowedHomeKitEntityTypes
{
  if (+[USOObjCGraphRedactionUtils allowedHomeKitEntityTypes]::onceToken != -1) {
    dispatch_once(&+[USOObjCGraphRedactionUtils allowedHomeKitEntityTypes]::onceToken, &__block_literal_global_25);
  }
  long long v2 = (void *)+[USOObjCGraphRedactionUtils allowedHomeKitEntityTypes]::allowedHomeKitEntityTypes;
  return v2;
}

uint64_t __55__USOObjCGraphRedactionUtils_allowedHomeKitEntityTypes__block_invoke()
{
  +[USOObjCGraphRedactionUtils allowedHomeKitEntityTypes]::allowedHomeKitEntityTypes = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"homeAutomationAccessoryName", @"homeAutomationHome", @"homeAutomationRoom", @"homeAutomationScene", @"homeAutomationServiceGroup", @"homeAutomationServiceName", @"homeAutomationTrigger", @"homeAutomationZone", 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)commonAppBundleIds
{
  if (+[USOObjCGraphRedactionUtils commonAppBundleIds]::onceToken != -1) {
    dispatch_once(&+[USOObjCGraphRedactionUtils commonAppBundleIds]::onceToken, &__block_literal_global_23);
  }
  long long v2 = (void *)+[USOObjCGraphRedactionUtils commonAppBundleIds]::commonAppBundleIds;
  return v2;
}

uint64_t __48__USOObjCGraphRedactionUtils_commonAppBundleIds__block_invoke()
{
  +[USOObjCGraphRedactionUtils commonAppBundleIds]::commonAppBundleIds = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.siri.SiriRedaction", @"com.apple.siri.sirinl", 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)contactEntities
{
  if (+[USOObjCGraphRedactionUtils contactEntities]::onceToken != -1) {
    dispatch_once(&+[USOObjCGraphRedactionUtils contactEntities]::onceToken, &__block_literal_global_21);
  }
  long long v2 = (void *)+[USOObjCGraphRedactionUtils contactEntities]::contactEntities;
  return v2;
}

uint64_t __45__USOObjCGraphRedactionUtils_contactEntities__block_invoke()
{
  +[USOObjCGraphRedactionUtils contactEntities]::contactEntities = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", GROUP, PERSON, ORGANIZATION, POSTAL_ADDRESS, EMAIL_ADDRESS, PHONE_NUMBER, PERSON_RELATIONSHIP, 0);
  return MEMORY[0x1F41817F8]();
}

+ (id)firstPartyAppBundleIds
{
  if (+[USOObjCGraphRedactionUtils firstPartyAppBundleIds]::onceToken != -1) {
    dispatch_once(&+[USOObjCGraphRedactionUtils firstPartyAppBundleIds]::onceToken, &__block_literal_global_4428);
  }
  long long v2 = (void *)+[USOObjCGraphRedactionUtils firstPartyAppBundleIds]::firstPartyAppBundleIds;
  return v2;
}

uint64_t __52__USOObjCGraphRedactionUtils_firstPartyAppBundleIds__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Messages", @"Photos", @"Shortcuts", @"Contacts", @"Applications", @"HomeKit", @"MediaPlayer", @"Tokens", @"com.apple.siri.cati", @"HomeMemberInfo", @"Podcasts", @"Fitness", @"Keyboard", @"CoreRoutine", @"Portrait", @"Calendar", @"UserAccount",
    @"CarPlay",
    @"FindMy",
    @"UserFeedbackLearning",
  +[USOObjCGraphRedactionUtils firstPartyAppBundleIds]::firstPartyAppBundleIds = 0);
  return MEMORY[0x1F41817F8]();
}

@end