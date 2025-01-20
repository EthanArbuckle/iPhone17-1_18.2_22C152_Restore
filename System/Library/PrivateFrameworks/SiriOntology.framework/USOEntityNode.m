@interface USOEntityNode
- (USOEntityNode)initWithCppEntityNode:(void *)a3;
- (void)addEntitySpan:(id)a3;
- (void)addIdentifierWithValue:(id)a3 appBundleId:(id)a4 namespaceString:(id)a5;
- (void)addIdentifierWithValue:(id)a3 appBundleId:(id)a4 namespaceString:(id)a5 probability:(optional<double>)a6 nluComponent:(optional<siri:(optional<unsigned int>)a8 :(optional<unsigned int>)a9 ontology::UsoIdentifier::NluComponent>)a7 groupIndex:interpretationGroup:;
- (void)addIdentifierWithValue:(id)a3 appBundleId:(id)a4 namespaceString:(id)a5 probability:(optional<double>)a6 nluComponent:(optional<siri:(optional<unsigned int>)a8 :ontology::UsoIdentifier::NluComponent>)a7 groupIndex:;
- (void)addIdentifierWithValue:(id)a3 appBundleId:(id)a4 namespaceString:(id)a5 probability:(optional<double>)a6 nluComponent:(optional<siri::ontology::UsoIdentifier::NluComponent>)a7;
- (void)addUtteranceAlignmentWithAsrIndex:(unsigned int)a3 StartIndex:(unsigned int)a4 endIndex:(unsigned int)a5 startUnicodeScalarIndex:(unsigned int)a6 endUnicodeScalarIndex:(unsigned int)a7;
@end

@implementation USOEntityNode

- (void)addEntitySpan:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  v62.__r_.__value_.__s.__data_[0] = 0;
  char v63 = 0;
  id v53 = a3;
  v3 = [v53 originAppId];

  if (v3)
  {
    id v4 = [v53 originAppId];
    v5 = (void *)[v4 UTF8String];
    v6 = [v53 originAppId];
    std::string::basic_string[abi:ne180100](&__dst, v5, [v6 lengthOfBytesUsingEncoding:4]);
    std::string v62 = __dst;
    memset(&__dst, 0, sizeof(__dst));
    char v63 = 1;
  }
  v7 = [v53 sourceComponent];
  BOOL v8 = v7 == 0;

  if (!v8)
  {
    v9 = [v53 sourceComponent];
    [v9 unsignedIntValue];
  }
  v60.__r_.__value_.__s.__data_[0] = 0;
  char v61 = 0;
  v10 = [v53 label];
  BOOL v11 = v10 == 0;

  if (!v11)
  {
    id v12 = [v53 label];
    v13 = (void *)[v12 UTF8String];
    v14 = [v53 label];
    std::string::basic_string[abi:ne180100](&__dst, v13, [v14 lengthOfBytesUsingEncoding:4]);
    std::string v60 = __dst;
    memset(&__dst, 0, sizeof(__dst));
    char v61 = 1;
  }
  v52 = [v53 matchInfo];

  if (v52)
  {
    [v53 matchInfo];
    [(id)objc_claimAutoreleasedReturnValue() matchSignalBitSet];
    operator new();
  }
  memset(&v59[8], 0, 24);
  v15 = [v53 properties];
  BOOL v16 = v15 == 0;

  if (!v16)
  {
    memset(v59, 0, 64);
    id v54 = [v53 properties];
    if ([v54 countByEnumeratingWithState:v59 objects:v68 count:16])
    {
      id v17 = *(id *)v59[1];
      id v18 = [v17 key];
      v19 = (void *)[v18 UTF8String];
      v20 = [v17 key];
      std::string::basic_string[abi:ne180100](&v55, v19, [v20 lengthOfBytesUsingEncoding:4]);

      __p.__r_.__value_.__s.__data_[0] = 0;
      char v66 = 0;
      v21 = [v17 valueString];
      BOOL v22 = v21 != 0;

      if (v22)
      {
        id v23 = [v17 valueString];
        v24 = (void *)[v23 UTF8String];
        v25 = [v17 valueString];
        std::string::basic_string[abi:ne180100](&__dst, v24, [v25 lengthOfBytesUsingEncoding:4]);
        std::string __p = __dst;
        memset(&__dst, 0, sizeof(__dst));
        char v66 = 1;
      }
      v26 = [v17 valueInt];
      BOOL v27 = v26 == 0;

      if (!v27)
      {
        v28 = [v17 valueInt];
        [v28 intValue];
      }
      v29 = [v17 valueFloat];
      BOOL v30 = v29 == 0;

      if (!v30)
      {
        v31 = [v17 valueFloat];
        [v31 floatValue];
      }
      operator new();
    }
  }
  v32 = [v53 startIndex];
  BOOL v33 = v32 == 0;

  if (!v33)
  {
    v34 = [v53 startIndex];
    [v34 unsignedIntValue];
  }
  v35 = [v53 endIndex];
  BOOL v36 = v35 == 0;

  if (!v36)
  {
    v37 = [v53 endIndex];
    [v37 unsignedIntValue];
  }
  v57[4] = 0uLL;
  uint64_t v58 = 0;
  v38 = [v53 alternatives];
  BOOL v39 = v38 == 0;

  if (!v39)
  {
    memset(v57, 0, 64);
    v40 = [v53 alternatives];
    if ([v40 countByEnumeratingWithState:v57 objects:v67 count:16])
    {
      id v41 = **((id **)&v57[0] + 1);
      id v42 = [v41 value];
      v43 = (void *)[v42 UTF8String];
      v44 = [v41 value];
      std::string::basic_string[abi:ne180100](&__p, v43, [v44 lengthOfBytesUsingEncoding:4]);

      v45 = [v41 probability];
      LOBYTE(v42) = v45 == 0;

      if ((v42 & 1) == 0)
      {
        v46 = [v41 probability];
        [v46 floatValue];
      }
      operator new();
    }
  }
  v55.__r_.__value_.__s.__data_[0] = 0;
  char v56 = 0;
  v47 = [v53 originEntityId];
  BOOL v48 = v47 != 0;

  if (v48)
  {
    id v49 = [v53 originEntityId];
    v50 = (void *)[v49 UTF8String];
    v51 = [v53 originEntityId];
    std::string::basic_string[abi:ne180100](&__dst, v50, [v51 lengthOfBytesUsingEncoding:4]);
    std::string v55 = __dst;
    memset(&__dst, 0, sizeof(__dst));
    char v56 = 1;
  }
  operator new();
}

- (void)addUtteranceAlignmentWithAsrIndex:(unsigned int)a3 StartIndex:(unsigned int)a4 endIndex:(unsigned int)a5 startUnicodeScalarIndex:(unsigned int)a6 endUnicodeScalarIndex:(unsigned int)a7
{
}

- (void)addIdentifierWithValue:(id)a3 appBundleId:(id)a4 namespaceString:(id)a5 probability:(optional<double>)a6 nluComponent:(optional<siri:(optional<unsigned int>)a8 :(optional<unsigned int>)a9 ontology::UsoIdentifier::NluComponent>)a7 groupIndex:interpretationGroup:
{
  optional<double> v23 = a6;
  __dst[3] = (void *)a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = v11;
  std::string::basic_string[abi:ne180100](__dst, (void *)[v14 UTF8String], objc_msgSend(v14, "lengthOfBytesUsingEncoding:", 4));
  id v15 = v12;
  std::string::basic_string[abi:ne180100](&v21, (void *)[v15 UTF8String], objc_msgSend(v15, "lengthOfBytesUsingEncoding:", 4));
  LOBYTE(__p[0]) = 0;
  char v20 = 0;
  if (v13)
  {
    std::string::basic_string[abi:ne180100]<0>(&v16, (char *)[v13 UTF8String]);
    *(_OWORD *)std::string __p = v16;
    uint64_t v19 = v17;
    char v20 = 1;
  }
  siri::ontology::UsoEntityNode::addIdentifier();
}

- (void)addIdentifierWithValue:(id)a3 appBundleId:(id)a4 namespaceString:(id)a5 probability:(optional<double>)a6 nluComponent:(optional<siri:(optional<unsigned int>)a8 :ontology::UsoIdentifier::NluComponent>)a7 groupIndex:
{
}

- (void)addIdentifierWithValue:(id)a3 appBundleId:(id)a4 namespaceString:(id)a5 probability:(optional<double>)a6 nluComponent:(optional<siri::ontology::UsoIdentifier::NluComponent>)a7
{
}

- (void)addIdentifierWithValue:(id)a3 appBundleId:(id)a4 namespaceString:(id)a5
{
}

- (USOEntityNode)initWithCppEntityNode:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)USOEntityNode;
  result = -[USOGraphNode initWithCppGraphNode:](&v5, sel_initWithCppGraphNode_);
  if (result) {
    result->_usoEntityNode = a3;
  }
  return result;
}

@end