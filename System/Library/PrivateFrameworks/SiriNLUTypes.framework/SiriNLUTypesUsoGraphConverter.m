@interface SiriNLUTypesUsoGraphConverter
+ (id)convertUsoEdge:(id)a3;
+ (id)convertUsoEdges:(id)a3;
+ (id)convertUsoEntityIdentifier:(id)a3;
+ (id)convertUsoEntityIdentifiers:(id)a3;
+ (id)convertUsoGraph:(id)a3;
+ (id)convertUsoGraphs:(id)a3;
+ (id)convertUsoNode:(id)a3;
+ (id)convertUsoNodes:(id)a3;
+ (id)convertUtteranceAlignment:(id)a3;
+ (id)convertUtteranceAlignments:(id)a3;
+ (id)convertUtteranceSpan:(id)a3;
+ (id)convertUtteranceSpans:(id)a3;
@end

@implementation SiriNLUTypesUsoGraphConverter

+ (id)convertUsoNodes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = objc_msgSend(a1, "convertUsoNode:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertUsoNode:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA3A98]), "initWithUsoElementId:", objc_msgSend(v3, "usoElementId"));
    if ([v3 hasUsoVerbElementId])
    {
      id v5 = NSNumber;
      id v6 = [v3 usoVerbElementId];
      uint64_t v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "value"));
      [v4 setUsoVerbId:v7];
    }
    if ([v3 hasIntegerPayload])
    {
      uint64_t v8 = NSNumber;
      v9 = [v3 integerPayload];
      v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "value"));
      [v4 setIntegerPayload:v10];
    }
    if ([v3 hasStringPayload])
    {
      v11 = [v3 stringPayload];
      long long v12 = [v11 value];
      [v4 setStringPayload:v12];
    }
    long long v13 = [v3 normalizedStringPayloads];
    long long v14 = (void *)[v13 copy];
    [v4 setNormalizedStringPayloads:v14];

    long long v15 = [v3 entityLabel];
    [v4 setEntityLabel:v15];

    v16 = [v3 verbLabel];
    [v4 setVerbLabel:v16];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertUsoEntityIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = objc_msgSend(a1, "convertUsoEntityIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertUsoEntityIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    if ([v3 hasProbability])
    {
      id v5 = objc_alloc(NSNumber);
      id v6 = [v4 probability];
      [v6 value];
      v18 = objc_msgSend(v5, "initWithDouble:");
    }
    else
    {
      v18 = 0;
    }
    if ([v4 hasSourceComponent]) {
      uint64_t v8 = objc_msgSend(objc_alloc(NSNumber), "initWithInt:", objc_msgSend(v4, "sourceComponent"));
    }
    else {
      uint64_t v8 = 0;
    }
    if ([v4 hasGroupIndex]) {
      v9 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v4, "groupIndex"));
    }
    else {
      v9 = 0;
    }
    if ([v4 hasInterpretationGroup]) {
      v10 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v4, "interpretationGroup"));
    }
    else {
      v10 = 0;
    }
    id v11 = objc_alloc(MEMORY[0x1E4FA3AA0]);
    unsigned int v12 = [v4 nodeIndex];
    long long v13 = [v4 value];
    long long v14 = [v4 backingAppBundleId];
    long long v15 = [v4 namespaceA];
    v16 = [v15 value];
    uint64_t v7 = (void *)[v11 initWithNodeIndex:v12 value:v13 appBundleId:v14 namespaceString:v16 probability:v18 sourceComponent:v8 groupIndex:v9 interpretationGroup:v10];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)convertUsoEdges:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = objc_msgSend(a1, "convertUsoEdge:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertUsoEdge:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA3A90]);
    id v5 = [v3 label];
    uint64_t v6 = [v5 usoElementId];
    unsigned int v7 = [v3 fromIndex];
    unsigned int v8 = [v3 toIndex];
    v9 = [v3 label];
    v10 = objc_msgSend(v4, "initWithUsoElementId:fromVertex:toVertex:enumeration:", v6, v7, v8, objc_msgSend(v9, "enumeration"));

    id v11 = [v3 label];
    long long v12 = [v11 baseEdgeLabel];
    long long v13 = [v12 value];
    [v10 setEdgeLabel:v13];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)convertUtteranceSpans:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = objc_msgSend(a1, "convertUtteranceSpan:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertUtteranceSpan:(id)a3
{
  id v3 = a3;
  if (v3) {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA3AB0]), "initWithStartIndex:endIndex:startUnicodeScalarIndex:endUnicodeScalarIndex:startMilliSeconds:endMilliSeconds:", objc_msgSend(v3, "startIndex"), objc_msgSend(v3, "endIndex"), objc_msgSend(v3, "startUnicodeScalarIndex"), objc_msgSend(v3, "endUnicodeScalarIndex"), objc_msgSend(v3, "startMilliSeconds"), objc_msgSend(v3, "endMilliSeconds"));
  }
  else {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertUtteranceAlignments:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = objc_msgSend(a1, "convertUtteranceAlignment:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertUtteranceAlignment:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA3AA8]);
    unsigned int v6 = [v4 nodeIndex];
    uint64_t v7 = [v4 asrHypothesisIndex];
    uint64_t v8 = [v4 spans];
    v9 = [a1 convertUtteranceSpans:v8];
    v10 = (void *)[v5 initWithNodeIndex:v6 asrHypothesisIndex:v7 spans:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)convertUsoGraphs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = objc_msgSend(a1, "convertUsoGraph:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v5 addObject:v10];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertUsoGraph:(id)a3
{
  v42[20] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA3A88]);
    id v6 = [v4 nodes];
    uint64_t v7 = [a1 convertUsoNodes:v6];
    uint64_t v8 = [v4 edges];
    v9 = [a1 convertUsoEdges:v8];
    v10 = [v4 identifiers];
    id v11 = [a1 convertUsoEntityIdentifiers:v10];
    long long v12 = [v4 alignments];
    long long v13 = [a1 convertUtteranceAlignments:v12];
    v32 = (void *)[v5 initWithNodes:v7 edges:v9 identifiers:v11 alignments:v13];

    SharedUsoVocabManager = (uint64_t *)siri::ontology::getSharedUsoVocabManager(v14);
    uint64_t v16 = *SharedUsoVocabManager;
    uint64_t v17 = (std::__shared_weak_count *)SharedUsoVocabManager[1];
    if (v17)
    {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      v36 = v17;
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    else
    {
      v36 = 0;
    }
    uint64_t v35 = v16;
    if (v32) {
      [v32 toCppUsoGraph:&v35 withError:0];
    }
    else {
      uint64_t v37 = 0;
    }
    if (v36) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v36);
    }
    if (v37)
    {
      uint64_t v19 = MEMORY[0x1E4FBA498] + 64;
      v42[0] = MEMORY[0x1E4FBA498] + 64;
      v20 = (void *)MEMORY[0x1E4FBA418];
      uint64_t v21 = *(void *)(MEMORY[0x1E4FBA418] + 16);
      *(void *)&buf[0] = *(void *)(MEMORY[0x1E4FBA418] + 8);
      *(void *)((char *)buf + *(void *)(*(void *)&buf[0] - 24)) = v21;
      v22 = (std::ios_base *)((char *)buf + *(void *)(*(void *)&buf[0] - 24));
      std::ios_base::init(v22, (char *)buf + 8);
      uint64_t v23 = MEMORY[0x1E4FBA498] + 24;
      v22[1].__vftable = 0;
      v22[1].__fmtflags_ = -1;
      *(void *)&buf[0] = v23;
      v42[0] = v19;
      std::streambuf::basic_streambuf();
      uint64_t v24 = MEMORY[0x1E4FBA470] + 16;
      *((void *)&buf[0] + 1) = MEMORY[0x1E4FBA470] + 16;
      *(_OWORD *)v39 = 0u;
      long long v40 = 0u;
      int v41 = 16;
      siri::ontology::UsoGraph::prettyPrint();
      v25 = NSString;
      std::stringbuf::str();
      if (v34 >= 0) {
        p_p = &__p;
      }
      else {
        p_p = __p;
      }
      v27 = [v25 stringWithUTF8String:p_p];
      [v32 setPrintedForm:v27];

      if (v34 < 0) {
        operator delete(__p);
      }
      *(void *)&buf[0] = *v20;
      *(void *)((char *)buf + *(void *)(*(void *)&buf[0] - 24)) = v20[3];
      *((void *)&buf[0] + 1) = v24;
      if (SBYTE7(v40) < 0) {
        operator delete(v39[0]);
      }
      std::streambuf::~streambuf();
      std::ostream::~ostream();
      MEMORY[0x1CB772500](v42);
    }
    else
    {
      v28 = loggerContext(1);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf[0]) = 136315138;
        *(void *)((char *)buf + 4) = "+[SiriNLUTypesUsoGraphConverter convertUsoGraph:]";
        _os_log_impl(&dword_1C8881000, v28, OS_LOG_TYPE_INFO, "%s [WARN]: unable to convert serialized graph to cpp graph and get printed form", (uint8_t *)buf, 0xCu);
      }
    }
    id v18 = v32;
    uint64_t v29 = v37;
    uint64_t v37 = 0;
    if (v29)
    {
      uint64_t v30 = MEMORY[0x1CB772330]();
      MEMORY[0x1CB772580](v30, 0x10A0C403D23BABBLL);
    }
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

@end