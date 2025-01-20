@interface HVHtmlParser
- (HVHtmlParser)initWithData:(id)a3 encoding:(unint64_t)a4;
- (HVHtmlParser)initWithString:(id)a3;
- (HVHtmlParser)initWithUTF8DataEnumerator:(id)a3;
- (NSArray)hyperlinks;
- (NSArray)textLines;
- (NSIndexSet)quotedRegions;
- (NSIndexSet)signatureRegions;
- (NSIndexSet)tabularRegions;
- (NSSet)appleAnchorHrefs;
- (NSString)textContent;
- (uint64_t)_currentOutputLength;
- (uint64_t)_tagEnd;
- (void)_enterRegion:(uint64_t)a1;
- (void)_newBlock;
- (void)_respawnParserContext;
- (void)dealloc;
@end

@implementation HVHtmlParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperlinks, 0);
  objc_storeStrong((id *)&self->_hyperlinkRanges, 0);
  objc_storeStrong((id *)&self->_hyperlinkURLs, 0);
  objc_storeStrong((id *)&self->_partialHyperlinks, 0);
  objc_storeStrong((id *)&self->_hyperlinkDepths, 0);
  objc_storeStrong((id *)&self->_appleAnchorHrefs, 0);
  objc_storeStrong((id *)&self->_activeRegionIndexSetStack, 0);
  objc_storeStrong((id *)&self->_activeRegionStartPositionStack, 0);
  objc_storeStrong((id *)&self->_activeRegions, 0);
  objc_storeStrong((id *)&self->_depthsWithActiveRegions, 0);
  objc_storeStrong((id *)&self->_sigHtmlBlockRegions, 0);
  objc_storeStrong((id *)&self->_tabularRegions, 0);
  objc_storeStrong((id *)&self->_quotedRegions, 0);
  objc_storeStrong((id *)&self->_currentLineData, 0);
  objc_storeStrong((id *)&self->_plainTextContent, 0);
  objc_storeStrong((id *)&self->_plainTextLines, 0);

  objc_storeStrong((id *)&self->_mutablePlainTextLines, 0);
}

- (NSArray)hyperlinks
{
  return self->_hyperlinks;
}

- (NSSet)appleAnchorHrefs
{
  return &self->_appleAnchorHrefs->super;
}

- (NSIndexSet)signatureRegions
{
  return (NSIndexSet *)self->_sigHtmlBlockRegions;
}

- (NSIndexSet)tabularRegions
{
  return (NSIndexSet *)self->_tabularRegions;
}

- (NSIndexSet)quotedRegions
{
  return (NSIndexSet *)self->_quotedRegions;
}

- (NSString)textContent
{
  p_plainTextContentLock = &self->_plainTextContentLock;
  pthread_mutex_lock(&self->_plainTextContentLock);
  v4 = self->_plainTextContent;
  if (!v4)
  {
    v4 = [(NSArray *)self->_plainTextLines _pas_proxyComponentsJoinedByString:@"\n"];
    objc_storeStrong((id *)&self->_plainTextContent, v4);
  }
  pthread_mutex_unlock(p_plainTextContentLock);

  return v4;
}

- (NSArray)textLines
{
  return self->_plainTextLines;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_plainTextContentLock);
  v3.receiver = self;
  v3.super_class = (Class)HVHtmlParser;
  [(HVHtmlParser *)&v3 dealloc];
}

- (HVHtmlParser)initWithUTF8DataEnumerator:(id)a3
{
  id v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)HVHtmlParser;
  v5 = [(HVHtmlParser *)&v60 init];
  v6 = v5;
  if (v5)
  {
    v5->_depth = 0;
    uint64_t v7 = objc_opt_new();
    depthsWithActiveRegions = v6->_depthsWithActiveRegions;
    v6->_depthsWithActiveRegions = (NSMutableIndexSet *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:2];
    activeRegions = v6->_activeRegions;
    v6->_activeRegions = (NSHashTable *)v9;

    uint64_t v11 = objc_opt_new();
    activeRegionStartPositionStack = v6->_activeRegionStartPositionStack;
    v6->_activeRegionStartPositionStack = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    activeRegionIndexSetStack = v6->_activeRegionIndexSetStack;
    v6->_activeRegionIndexSetStack = (NSMutableArray *)v13;

    v6->_preBlockDepth = 0;
    uint64_t v15 = objc_opt_new();
    quotedRegions = v6->_quotedRegions;
    v6->_quotedRegions = (NSMutableIndexSet *)v15;

    uint64_t v17 = objc_opt_new();
    tabularRegions = v6->_tabularRegions;
    v6->_tabularRegions = (NSMutableIndexSet *)v17;

    uint64_t v19 = objc_opt_new();
    sigHtmlBlockRegions = v6->_sigHtmlBlockRegions;
    v6->_sigHtmlBlockRegions = (NSMutableIndexSet *)v19;

    uint64_t v21 = objc_opt_new();
    mutablePlainTextLines = v6->_mutablePlainTextLines;
    v6->_mutablePlainTextLines = (NSMutableArray *)v21;

    v6->_currentLineIsCollapsed = 1;
    uint64_t v23 = objc_opt_new();
    currentLineData = v6->_currentLineData;
    v6->_currentLineData = (NSMutableData *)v23;

    v6->_renderingSuspended = 0;
    v6->_unint64_t quoteToEndFromPosition = 0x7FFFFFFFFFFFFFFFLL;
    v6->_parserContext = 0;
    uint64_t v25 = objc_opt_new();
    appleAnchorHrefs = v6->_appleAnchorHrefs;
    v6->_appleAnchorHrefs = (NSMutableSet *)v25;

    uint64_t v27 = objc_opt_new();
    hyperlinkDepths = v6->_hyperlinkDepths;
    v6->_hyperlinkDepths = (NSMutableIndexSet *)v27;

    uint64_t v29 = objc_opt_new();
    partialHyperlinks = v6->_partialHyperlinks;
    v6->_partialHyperlinks = (NSMutableArray *)v29;

    uint64_t v31 = objc_opt_new();
    hyperlinkURLs = v6->_hyperlinkURLs;
    v6->_hyperlinkURLs = (NSMutableArray *)v31;

    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, 0);
    hyperlinkRanges = v6->_hyperlinkRanges;
    v6->_hyperlinkRanges = (NSMutableArray *)Mutable;

    -[HVHtmlParser _respawnParserContext](v6);
    id v35 = v4;
    unint64_t v36 = 0;
    v37 = 0;
    uint64_t v73 = 0;
    uint64_t v74 = (uint64_t)&v73;
    uint64_t v75 = 0x2020000000;
    LODWORD(v76) = 0;
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2020000000;
    uint64_t v72 = 0;
    while (1)
    {
      v38 = (void *)MEMORY[0x22A6667F0]();
      v39 = [v35 nextObject];

      if (!v39) {
        break;
      }
      uint64_t v61 = MEMORY[0x263EF8330];
      uint64_t v62 = 3221225472;
      v63 = __43__HVHtmlParser__consumeHtmlDataEnumerator___block_invoke;
      v64 = &unk_2647D5D18;
      v65 = v6;
      v66 = &v73;
      v67 = &v69;
      unint64_t v68 = v36;
      [v39 enumerateByteRangesUsingBlock:&v61];
      v36 += [v39 length];
      v37 = v39;
    }
    if (v70[3] < v36)
    {
      v6->_chunkStart = "";
      v6->_chunkLength = 0;
      htmlParseChunk(v6->_parserContext, "", 0, 1);
    }
    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v73, 8);

    while (v6->_depth)
      -[HVHtmlParser _tagEnd]((uint64_t)v6);
    v6->_renderingSuspended = 0;
    -[HVHtmlParser _newBlock]((uint64_t)v6);
    unint64_t quoteToEndFromPosition = v6->_quoteToEndFromPosition;
    if (quoteToEndFromPosition != 0x7FFFFFFFFFFFFFFFLL) {
      -[NSMutableIndexSet addIndexesInRange:](v6->_quotedRegions, "addIndexesInRange:", quoteToEndFromPosition, v6->_plainTextLinesTotalLength - quoteToEndFromPosition);
    }
    [(NSMutableIndexSet *)v6->_quotedRegions removeIndex:v6->_plainTextLinesTotalLength - 1];
    [(NSMutableIndexSet *)v6->_tabularRegions removeIndex:v6->_plainTextLinesTotalLength - 1];
    [(NSMutableIndexSet *)v6->_sigHtmlBlockRegions removeIndex:v6->_plainTextLinesTotalLength - 1];
    MEMORY[0x22A666740](v6->_parserContext);
    v6->_parserContext = 0;
    uint64_t v41 = [(NSMutableArray *)v6->_mutablePlainTextLines copy];
    plainTextLines = v6->_plainTextLines;
    v6->_plainTextLines = (NSArray *)v41;

    v43 = v6->_mutablePlainTextLines;
    v6->_mutablePlainTextLines = 0;

    v44 = v6->_activeRegions;
    v6->_activeRegions = 0;

    v45 = v6->_activeRegionStartPositionStack;
    v6->_activeRegionStartPositionStack = 0;

    v46 = v6->_activeRegionIndexSetStack;
    v6->_activeRegionIndexSetStack = 0;

    v47 = v6->_currentLineData;
    v6->_currentLineData = 0;

    v48 = v6->_hyperlinkDepths;
    v6->_hyperlinkDepths = 0;

    v49 = v6->_partialHyperlinks;
    v6->_partialHyperlinks = 0;

    v50 = (void *)[(NSMutableArray *)v6->_hyperlinkURLs copy];
    v51 = (uint64_t *)[(NSMutableArray *)v6->_hyperlinkRanges copy];
    v52 = v6->_hyperlinkURLs;
    v6->_hyperlinkURLs = 0;

    v53 = v6->_hyperlinkRanges;
    v6->_hyperlinkRanges = 0;

    v54 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v61 = MEMORY[0x263EF8330];
    uint64_t v62 = 3221225472;
    v63 = __30__HVHtmlParser__endProcessing__block_invoke;
    v64 = &unk_2647D5CC8;
    v65 = v50;
    v66 = v51;
    uint64_t v73 = MEMORY[0x263EF8330];
    uint64_t v74 = 3221225472;
    uint64_t v75 = (uint64_t)__30__HVHtmlParser__endProcessing__block_invoke_2;
    v76 = &unk_2647D5CF0;
    v77 = v65;
    v55 = v65;
    v56 = v51;
    uint64_t v57 = objc_msgSend(v54, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", &v61, &v73);
    hyperlinks = v6->_hyperlinks;
    v6->_hyperlinks = (NSArray *)v57;

    pthread_mutex_init(&v6->_plainTextContentLock, 0);
  }

  return v6;
}

- (uint64_t)_tagEnd
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = result;
    if ([*(id *)(result + 240) containsIndex:*(void *)(result + 184)])
    {
      v2 = [*(id *)(v1 + 248) lastObject];
      NSUInteger v3 = -[HVHtmlParser _currentOutputLength](v1);
      v29.location = [v2 range];
      v30.location = v3;
      v30.length = 0;
      NSRange v4 = NSUnionRange(v29, v30);
      v5 = [HVHtmlParserHyperlink alloc];
      v6 = [v2 url];
      uint64_t v7 = -[HVHtmlParserHyperlink initWithURL:range:](v5, "initWithURL:range:", v6, v4.location, v4.length);
      unint64_t v8 = [(HVHtmlParserHyperlink *)v7 range];
      if (HIDWORD(v8)) {
        BOOL v10 = 0;
      }
      else {
        BOOL v10 = HIDWORD(v9) == 0;
      }
      if (v10)
      {
        CFArrayAppendValue(*(CFMutableArrayRef *)(v1 + 264), (const void *)(v8 | (v9 << 32)));
        uint64_t v11 = *(void **)(v1 + 256);
        v12 = [(HVHtmlParserHyperlink *)v7 url];
        [v11 addObject:v12];
      }
      [*(id *)(v1 + 248) removeLastObject];
      [*(id *)(v1 + 240) removeIndex:*(void *)(v1 + 184)];
    }
    result = [*(id *)(v1 + 192) containsIndex:*(void *)(v1 + 184)];
    if (result)
    {
      uint64_t v13 = [*(id *)(v1 + 208) lastObject];
      uint64_t v14 = [v13 unsignedIntegerValue];

      uint64_t v15 = *(void *)(v1 + 112);
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v16 = objc_msgSend(*(id *)(v1 + 216), "lastObject", 0);
      uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = v15 - v14;
        uint64_t v20 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v16);
            }
            v22 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            objc_msgSend(v22, "addIndexesInRange:", v14, v19);
            [*(id *)(v1 + 200) removeObject:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v18);
      }

      [*(id *)(v1 + 192) removeIndex:*(void *)(v1 + 184)];
      [*(id *)(v1 + 208) removeLastObject];
      result = [*(id *)(v1 + 216) removeLastObject];
    }
    --*(void *)(v1 + 184);
  }
  return result;
}

- (void)_newBlock
{
  if (a1)
  {
    if ([*(id *)(a1 + 128) length])
    {
      v2 = (void *)MEMORY[0x22A6667F0]();
      NSUInteger v3 = (__CFString *)[[NSString alloc] initWithData:*(void *)(a1 + 128) encoding:4];
      if (v3)
      {
        if (!*(unsigned char *)(a1 + 145))
        {
          v6 = v3;
          uint64_t v4 = _PASCollapseWhitespaceAndStrip();

          NSUInteger v3 = (__CFString *)v4;
        }
        uint64_t v7 = v3;
        if ([(__CFString *)v3 length]) {
          *(unsigned char *)(a1 + 120) = 0;
        }
      }
      else
      {
        uint64_t v7 = &stru_26DAC8728;
      }
    }
    else
    {
      uint64_t v7 = &stru_26DAC8728;
    }
    if (!*(unsigned char *)(a1 + 120))
    {
      [*(id *)(a1 + 24) addObject:v7];
      uint64_t v5 = *(void *)(a1 + 112) + [(__CFString *)v7 length];
      *(unsigned char *)(a1 + 120) = 1;
      *(void *)(a1 + 112) = v5 + 1;
    }
    [*(id *)(a1 + 128) setLength:0];
  }
}

HVHtmlParserHyperlink *__30__HVHtmlParser__endProcessing__block_invoke(uint64_t a1, CFIndex a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  unint64_t ValueAtIndex = (unint64_t)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 40), a2);
  v6 = -[HVHtmlParserHyperlink initWithURL:range:]([HVHtmlParserHyperlink alloc], "initWithURL:range:", v4, ValueAtIndex, HIDWORD(ValueAtIndex));

  return v6;
}

uint64_t __30__HVHtmlParser__endProcessing__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) count];
}

- (uint64_t)_currentOutputLength
{
  uint64_t v2 = *(void *)(a1 + 112);
  if ([*(id *)(a1 + 128) length])
  {
    NSUInteger v3 = objc_msgSend(NSString, "_pas_stringWithDataNoCopy:encoding:nullTerminated:", *(void *)(a1 + 128), 4, 0);
    if (v3)
    {
      uint64_t v4 = v3;
      if (![v3 length] || *(unsigned char *)(a1 + 145))
      {
        v6 = v4;
      }
      else
      {
        int v5 = objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1);
        v6 = _PASCollapseWhitespaceAndStrip();

        v2 += [v6 length];
        if ([v6 length]
          && objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v6, "length") - 1) != v5)
        {
          ++v2;
        }
      }
    }
    else
    {
      v6 = 0;
    }
  }
  return v2;
}

unint64_t __43__HVHtmlParser__consumeHtmlDataEnumerator___block_invoke(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    v6 = (void *)result;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = a4 - 1;
    while (1)
    {
      int v10 = *(_DWORD *)(*(void *)(v6[5] + 8) + 24);
      unsigned int v11 = *(char *)(a2 + v7);
      switch(v10)
      {
        case 1:
          int v10 = 2 * (v11 == 47);
          break;
        case 2:
          if ((v11 & 0xFFFFFFDF) == 0x48) {
            int v10 = 3;
          }
          else {
            int v10 = 0;
          }
          break;
        case 3:
          int v10 = 4 * ((v11 & 0xFFFFFFDF) == 84);
          break;
        case 4:
          if ((v11 & 0xFFFFFFDF) == 0x4D) {
            int v10 = 5;
          }
          else {
            int v10 = 0;
          }
          break;
        case 5:
          if ((v11 & 0xFFFFFFDF) == 0x4C) {
            int v10 = 6;
          }
          else {
            int v10 = 0;
          }
          break;
        case 6:
          if ((v11 & 0x80000000) != 0) {
            result = __maskrune(*(char *)(a2 + v7), 0x4000uLL);
          }
          else {
            result = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v11 + 60) & 0x4000;
          }
          if (v11 == 62) {
            int v10 = 7;
          }
          else {
            int v10 = 0;
          }
          if (result) {
            int v10 = 6;
          }
          break;
        case 7:
          break;
        default:
          int v10 = v11 == 60;
          break;
      }
      *(_DWORD *)(*(void *)(v6[5] + 8) + 24) = v10;
      uint64_t v12 = *(void *)(v6[5] + 8);
      int v13 = *(_DWORD *)(v12 + 24);
      if (v13 == 7) {
        break;
      }
      unint64_t v14 = v7 - v8;
      if (v7 == v9 || v14 > 0x7CF) {
        goto LABEL_29;
      }
      ++v7;
LABEL_33:
      if (v7 == a4) {
        return result;
      }
    }
    *(_DWORD *)(v12 + 24) = 0;
    unint64_t v14 = v7 - v8;
LABEL_29:
    *(void *)(v6[4] + 176) = v6[7] + v8;
    *(void *)(v6[4] + 8) = a2 + v8;
    *(void *)(v6[4] + 16) = v14 + 1;
    uint64_t v15 = v6[4];
    unint64_t v16 = *(void *)(v15 + 16);
    if (v16 >> 31) {
      __assert_rtn("-[HVHtmlParser _consumeHtmlDataEnumerator:]_block_invoke", "HVHtmlParser.m", 348, "_chunkLength <= INT_MAX");
    }
    result = htmlParseChunk(*(htmlParserCtxtPtr *)(v15 + 136), *(const char **)(v15 + 8), v16, v13 == 7);
    ++v7;
    if (v13 == 7)
    {
      result = (unint64_t)-[HVHtmlParser _respawnParserContext]((void *)v6[4]);
      *(void *)(*(void *)(v6[6] + 8) + 24) = v7;
    }
    uint64_t v8 = v7;
    goto LABEL_33;
  }
  return result;
}

- (void)_respawnParserContext
{
  if (user_data)
  {
    uint64_t v1 = user_data;
    if (user_data[17]) {
      MEMORY[0x22A666740]();
    }
    PushParserCtxt = htmlCreatePushParserCtxt(&unforwardSAXHandlerStruct, v1, 0, 0, 0, XML_CHAR_ENCODING_UTF8);
    v1[17] = PushParserCtxt;
    return (void *)htmlCtxtUseOptions(PushParserCtxt, 2164993);
  }
  return user_data;
}

- (void)_enterRegion:(uint64_t)a1
{
  id v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 200), "containsObject:") & 1) == 0)
  {
    if (([*(id *)(a1 + 192) containsIndex:*(void *)(a1 + 184)] & 1) == 0)
    {
      [*(id *)(a1 + 192) addIndex:*(void *)(a1 + 184)];
      NSUInteger v3 = *(void **)(a1 + 208);
      uint64_t v4 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 112)];
      [v3 addObject:v4];

      int v5 = *(void **)(a1 + 216);
      v6 = objc_opt_new();
      [v5 addObject:v6];
    }
    [*(id *)(a1 + 200) addObject:v8];
    uint64_t v7 = [*(id *)(a1 + 216) lastObject];
    [v7 addObject:v8];
  }
}

- (HVHtmlParser)initWithData:(id)a3 encoding:(unint64_t)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 == 4 || a4 == 1)
  {
    uint64_t v7 = (void *)MEMORY[0x22A6667F0]();
    v13[0] = v6;
    id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    uint64_t v9 = [v8 objectEnumerator];

    int v10 = [(HVHtmlParser *)self initWithUTF8DataEnumerator:v9];
  }
  else
  {
    unsigned int v11 = objc_msgSend(NSString, "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v6, a4, 0);
    int v10 = [(HVHtmlParser *)self initWithString:v11];
  }
  return v10;
}

- (HVHtmlParser)initWithString:(id)a3
{
  v34[1] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    int v13 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = [a3 length];
  id v6 = (void *)MEMORY[0x22A6667F0]();
  if (!v5)
  {
    int v13 = [MEMORY[0x263EFFA68] objectEnumerator];
    goto LABEL_15;
  }
  CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x600u);
  if (CStringPtr)
  {
    id v8 = CStringPtr;
    uint64_t v9 = (void *)MEMORY[0x22A6667F0]();
    id v10 = objc_alloc(MEMORY[0x263EFF8F8]);
    uint64_t v25 = MEMORY[0x263EF8330];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __70__NSString_HVNSString__hv_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_2;
    uint64_t v28 = &unk_2647D5C00;
    id v29 = a3;
    unsigned int v11 = (void *)[v10 initWithBytesNoCopy:v8 length:v5 deallocator:&v25];
    v34[0] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:1];
    int v13 = [v12 objectEnumerator];

LABEL_15:
    goto LABEL_16;
  }
  if ([a3 fastestEncoding] == 4)
  {
    unint64_t v14 = (void *)MEMORY[0x22A6667F0]();
    uint64_t v15 = [a3 dataUsingEncoding:4];
    uint64_t v16 = [v15 length];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = nullByteData();
      uint64_t v19 = objc_msgSend(v15, "rangeOfData:options:range:", v18, 0, v17 - 1, 1);

      if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v20 = v17;
      }
      else {
        uint64_t v20 = v17 - 1;
      }
      uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
      uint64_t v25 = MEMORY[0x263EF8330];
      uint64_t v26 = 3221225472;
      uint64_t v27 = __70__NSString_HVNSString__hv_dataEnumeratorUsingEncoding_nullTerminated___block_invoke_3;
      uint64_t v28 = &unk_2647D5C28;
      uint64_t v31 = 0;
      uint64_t v32 = v20;
      uint64_t v33 = v17;
      id v22 = v21;
      id v29 = v22;
      id v30 = v15;
      [v30 enumerateByteRangesUsingBlock:&v25];
      int v13 = [v22 objectEnumerator];
    }
    else
    {
      int v13 = [MEMORY[0x263EFFA68] objectEnumerator];
    }

    goto LABEL_15;
  }
  int v13 = [[_HVNSStringEncodingEnumerator alloc] initWithString:a3 encoding:4 nullTerminated:0];
LABEL_16:
  long long v23 = [(HVHtmlParser *)self initWithUTF8DataEnumerator:v13];

  return v23;
}

@end