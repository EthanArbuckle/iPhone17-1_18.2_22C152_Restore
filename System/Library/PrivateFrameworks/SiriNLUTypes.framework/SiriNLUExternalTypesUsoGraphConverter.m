@interface SiriNLUExternalTypesUsoGraphConverter
+ (id)convertFromGraphEdge:(id)a3;
+ (id)convertFromGraphEdges:(id)a3;
+ (id)convertFromUsoEntityIdentifier:(id)a3;
+ (id)convertFromUsoEntityIdentifiers:(id)a3;
+ (id)convertFromUsoGraph:(id)a3;
+ (id)convertFromUsoGraphs:(id)a3;
+ (id)convertFromUsoNode:(id)a3;
+ (id)convertFromUsoNodes:(id)a3;
+ (id)convertFromUtteranceAlignment:(id)a3;
+ (id)convertFromUtteranceAlignments:(id)a3;
+ (id)convertFromUtteranceSpan:(id)a3;
+ (id)convertFromUtteranceSpans:(id)a3;
@end

@implementation SiriNLUExternalTypesUsoGraphConverter

+ (id)convertFromUsoNode:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALUsoNode);
    v5 = [v3 entityLabel];
    [(SIRINLUEXTERNALUsoNode *)v4 setEntityLabel:v5];

    v6 = [v3 integerPayload];
    v7 = +[SiriNLUExternalTypesConverter convertFromNumber:v6];
    [(SIRINLUEXTERNALUsoNode *)v4 setIntegerPayload:v7];

    v8 = [v3 stringPayload];
    v9 = +[SiriNLUExternalTypesConverter convertFromString:v8];
    [(SIRINLUEXTERNALUsoNode *)v4 setStringPayload:v9];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v10 = objc_msgSend(v3, "normalizedStringPayloads", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          [(SIRINLUEXTERNALUsoNode *)v4 addNormalizedStringPayloads:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }

    v15 = [v3 verbLabel];
    [(SIRINLUEXTERNALUsoNode *)v4 setVerbLabel:v15];

    -[SIRINLUEXTERNALUsoNode setUsoElementId:](v4, "setUsoElementId:", [v3 usoElementId]);
    v16 = [v3 usoVerbId];

    if (v16)
    {
      v17 = objc_alloc_init(SIRICOMMONUInt32Value);
      v18 = [v3 usoVerbId];
      -[SIRICOMMONUInt32Value setValue:](v17, "setValue:", [v18 intValue]);

      [(SIRINLUEXTERNALUsoNode *)v4 setUsoVerbElementId:v17];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromUsoNodes:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(a1, "convertFromUsoNode:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromGraphEdges:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(a1, "convertFromGraphEdge:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromGraphEdge:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init(SIRINLUEXTERNALUsoEdge);
    -[SIRINLUEXTERNALUsoEdge setFromIndex:](v4, "setFromIndex:", [v3 fromVertex]);
    -[SIRINLUEXTERNALUsoEdge setToIndex:](v4, "setToIndex:", [v3 toVertex]);
    id v5 = objc_alloc_init(SIRINLUEXTERNALUsoLabel);
    id v6 = [v3 edgeLabel];
    [(SIRINLUEXTERNALUsoLabel *)v5 setValue:v6];

    uint64_t v7 = objc_alloc_init(SIRINLUEXTERNALUsoEdgeLabel);
    -[SIRINLUEXTERNALUsoEdgeLabel setUsoElementId:](v7, "setUsoElementId:", [v3 usoElementId]);
    uint64_t v8 = [v3 enumeration];

    [(SIRINLUEXTERNALUsoEdgeLabel *)v7 setEnumeration:v8];
    [(SIRINLUEXTERNALUsoEdgeLabel *)v7 setBaseEdgeLabel:v5];
    [(SIRINLUEXTERNALUsoEdge *)v4 setLabel:v7];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)convertFromUtteranceSpans:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(a1, "convertFromUtteranceSpan:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromUsoEntityIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(a1, "convertFromUsoEntityIdentifier:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromUsoEntityIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(SIRINLUEXTERNALUsoEntityIdentifier);
    id v5 = [v3 appBundleId];
    [(SIRINLUEXTERNALUsoEntityIdentifier *)v4 setBackingAppBundleId:v5];

    id v6 = [v3 namespaceString];
    uint64_t v7 = +[SiriNLUExternalTypesConverter convertFromString:v6];
    [(SIRINLUEXTERNALUsoEntityIdentifier *)v4 setNamespaceA:v7];

    -[SIRINLUEXTERNALUsoEntityIdentifier setNodeIndex:](v4, "setNodeIndex:", [v3 nodeIndex]);
    uint64_t v8 = [v3 value];
    [(SIRINLUEXTERNALUsoEntityIdentifier *)v4 setValue:v8];

    uint64_t v9 = [v3 probability];

    if (v9)
    {
      v10 = objc_alloc_init(SIRICOMMONDoubleValue);
      [(SIRINLUEXTERNALUsoEntityIdentifier *)v4 setProbability:v10];

      uint64_t v11 = [v3 probability];
      [v11 doubleValue];
      double v13 = v12;
      long long v14 = [(SIRINLUEXTERNALUsoEntityIdentifier *)v4 probability];
      [v14 setValue:v13];
    }
    long long v15 = [v3 sourceComponent];

    if (v15)
    {
      long long v16 = [v3 sourceComponent];
      -[SIRINLUEXTERNALUsoEntityIdentifier setSourceComponent:](v4, "setSourceComponent:", [v16 intValue]);
    }
    v17 = [v3 groupIndex];

    if (v17)
    {
      uint64_t v18 = [v3 groupIndex];
      -[SIRINLUEXTERNALUsoEntityIdentifier setGroupIndex:](v4, "setGroupIndex:", [v18 unsignedIntValue]);
    }
    v19 = [v3 interpretationGroup];

    if (v19)
    {
      long long v20 = [v3 interpretationGroup];
      -[SIRINLUEXTERNALUsoEntityIdentifier setInterpretationGroup:](v4, "setInterpretationGroup:", [v20 unsignedIntValue]);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)convertFromUtteranceSpan:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = objc_alloc_init(SIRINLUEXTERNALUtteranceSpan);
    -[SIRINLUEXTERNALUtteranceSpan setEndIndex:](v4, "setEndIndex:", [v3 endIndex]);
    -[SIRINLUEXTERNALUtteranceSpan setStartIndex:](v4, "setStartIndex:", [v3 startIndex]);
    -[SIRINLUEXTERNALUtteranceSpan setStartUnicodeScalarIndex:](v4, "setStartUnicodeScalarIndex:", [v3 startUnicodeScalarIndex]);
    -[SIRINLUEXTERNALUtteranceSpan setEndUnicodeScalarIndex:](v4, "setEndUnicodeScalarIndex:", [v3 endUnicodeScalarIndex]);
    -[SIRINLUEXTERNALUtteranceSpan setStartMilliSeconds:](v4, "setStartMilliSeconds:", [v3 startMilliSeconds]);
    uint64_t v5 = [v3 endMilliSeconds];

    [(SIRINLUEXTERNALUtteranceSpan *)v4 setEndMilliSeconds:v5];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)convertFromUtteranceAlignments:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(a1, "convertFromUtteranceAlignment:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromUtteranceAlignment:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init(SIRINLUEXTERNALUtteranceAlignment);
    id v6 = [v4 spans];
    uint64_t v7 = [a1 convertFromUtteranceSpans:v6];
    [(SIRINLUEXTERNALUtteranceAlignment *)v5 setSpans:v7];

    -[SIRINLUEXTERNALUtteranceAlignment setAsrHypothesisIndex:](v5, "setAsrHypothesisIndex:", [v4 asrHypothesisIndex]);
    uint64_t v8 = [v4 nodeIndex];

    [(SIRINLUEXTERNALUtteranceAlignment *)v5 setNodeIndex:v8];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)convertFromUsoGraphs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(a1, "convertFromUsoGraph:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)convertFromUsoGraph:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = objc_alloc_init(SIRINLUEXTERNALUsoGraph);
    id v6 = [v4 nodes];
    uint64_t v7 = [a1 convertFromUsoNodes:v6];
    [(SIRINLUEXTERNALUsoGraph *)v5 setNodes:v7];

    uint64_t v8 = [v4 edges];
    uint64_t v9 = [a1 convertFromGraphEdges:v8];
    [(SIRINLUEXTERNALUsoGraph *)v5 setEdges:v9];

    v10 = [v4 alignments];
    uint64_t v11 = [a1 convertFromUtteranceAlignments:v10];
    [(SIRINLUEXTERNALUsoGraph *)v5 setAlignments:v11];

    double v12 = [v4 identifiers];

    long long v13 = [a1 convertFromUsoEntityIdentifiers:v12];
    [(SIRINLUEXTERNALUsoGraph *)v5 setIdentifiers:v13];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

@end