@interface CRCHPatternNetwork
+ (BOOL)isFinalCursor:(id)a3 inNetwork:(id)a4;
+ (id)cursorByAdvancingWithString:(id)a3 fromCursor:(id)a4 inNetwork:(id)a5;
+ (id)cursorByAdvancingWithSymbol:(id)a3 fromCursor:(id)a4 inNetwork:(id)a5;
+ (id)kDefaultPatterns;
+ (id)kDefaultPatternsPlusUrlsAndEmails;
+ (id)kEmailPatterns;
+ (id)kUrlPatterns;
+ (id)patternToSymbolMap;
+ (id)rootCursorForContentType:(int)a3 inNetwork:(id)a4;
- (CRCHPatternNetwork)initWithFile:(id)a3;
- (id)advanceCursor:(id)a3 withSymbol:(unint64_t)a4;
- (void)dealloc;
@end

@implementation CRCHPatternNetwork

+ (id)kDefaultPatternsPlusUrlsAndEmails
{
  return &unk_1F39332B0;
}

+ (id)kDefaultPatterns
{
  return &unk_1F39332C8;
}

+ (id)kEmailPatterns
{
  return &unk_1F39332E0;
}

+ (id)kUrlPatterns
{
  return &unk_1F39332F8;
}

+ (id)patternToSymbolMap
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"Prefix_DATE", @"0xc50a218", @"Prefix_EMOTICON", @"0x68ed49c", @"Prefix_URL", @"0x88ea31a", @"Extendable_PUNC_LOOP", @"0x099c12f", @"Extendable_EMOTICON", @"0x23cc72f", @"Extendable_TIME", @"0xdb53409", @"EMAIL", @"0x61a649a", @"Prefix_TIME", @"0x7186a84", @"Extendable_URL",
               @"0x1070ba2",
               @"Prefix_PHONE_NUMBER",
               @"0x4374d28",
               @"NUMBER",
               @"0x34f55ec",
               @"PUNC_LOOP",
               @"0x7f7446f",
               @"Prefix_EMAIL",
               @"0xd23b9c8",
               @"EMOTICON",
               @"0x08d4b39",
               @"Extendable_EMAIL",
               @"0xed4db98",
               @"Extendable_WORD_CASE_SENSITIVE",
               @"0x87eab3b",
               @"URL",
               @"0xe6b391a",
               @"DATE",
               @"0x633a6c7",
               @"Extendable_NUMBER",
               @"0x3ba3922",
               @"Extendable_WORD_CASE_INSENSITIVE",
               @"0x355486d",
               @"PHONE_NUMBER",
               @"0x837697b",
               @"Prefix_NUMBER",
               @"0x8005b66",
               @"WORD_CASE_INSENSITIVE",
               @"0x156f831",
               @"Extendable_DATE",
               @"0x9ddc000",
               @"Prefix_WORD_CASE_INSENSITIVE",
               @"0x8554b05",
               @"Prefix_WORD_CASE_SENSITIVE",
               @"0xe71cc3a",
               @"WORD_CASE_SENSITIVE",
               @"0x8aa8704",
               @"TIME",
               @"0x346ff32",
               0);
}

+ (id)rootCursorForContentType:(int)a3 inNetwork:(id)a4
{
  if (!a4) {
    return 0;
  }
  v4 = (void *)*((void *)a4 + 4);
  uint64_t v5 = [NSNumber numberWithInt:*(void *)&a3];
  return (id)[v4 objectForKey:v5];
}

+ (id)cursorByAdvancingWithString:(id)a3 fromCursor:(id)a4 inNetwork:(id)a5
{
  id result = 0;
  if (a4)
  {
    if (a5)
    {
      id result = (id)[a4 edgeIndexCount];
      if (result)
      {
        if ([a3 length])
        {
          uint64_t v10 = [a3 rangeOfComposedCharacterSequenceAtIndex:0];
          id result = 0;
          if (v9 <= 1)
          {
            unint64_t v11 = v9;
            v12 = objc_msgSend(a3, "substringWithRange:", v10, v9);
            uint64_t v13 = [a3 substringFromIndex:v10 + v11];
            uint64_t v14 = objc_msgSend(a5, "advanceCursor:withSymbol:", a4, objc_msgSend(v12, "characterAtIndex:", 0));
            return +[CRCHPatternNetwork cursorByAdvancingWithString:v13 fromCursor:v14 inNetwork:a5];
          }
        }
        else
        {
          return a4;
        }
      }
    }
  }
  return result;
}

+ (id)cursorByAdvancingWithSymbol:(id)a3 fromCursor:(id)a4 inNetwork:(id)a5
{
  id result = 0;
  if (a4)
  {
    if (a5)
    {
      id result = (id)[a4 edgeIndexCount];
      if (result)
      {
        if ([a3 length])
        {
          if ((unint64_t)[a3 length] <= 1)
          {
            unint64_t v9 = objc_msgSend(a5, "advanceCursor:withSymbol:", a4, objc_msgSend(a3, "characterAtIndex:", 0));
            if ([v9 edgeIndexCount]) {
              return v9;
            }
            else {
              return 0;
            }
          }
          else
          {
            return 0;
          }
        }
        else
        {
          return a4;
        }
      }
    }
  }
  return result;
}

- (id)advanceCursor:(id)a3 withSymbol:(unint64_t)a4
{
  v7 = objc_alloc_init(CRCHNetworkCursor);
  if ([a3 edgeIndexCount])
  {
    unint64_t v8 = 0;
    do
    {
      NetworkEdge::NetworkEdge((NetworkEdge *)v17, (const NetworkEdge *)(*((void *)self->_network + 11) + 80 * [a3 edgeIndexAtPosition:v8]));
      uint64_t v9 = v18;
      uint64_t v10 = *(void *)(*((void *)self->_network + 5) + 56 * v18);
      if (v10)
      {
        uint64_t v11 = 0;
        while (1)
        {
          NetworkEdge::NetworkEdge((NetworkEdge *)v13, (const NetworkEdge *)(*((void *)self->_network + 11)+ 80 * (v11 + *(void *)(*((void *)self->_network + 5) + 56 * v9 + 16))));
          if (v14 == a4) {
            break;
          }
          if (__p)
          {
            v16 = __p;
            operator delete(__p);
          }
          if (v10 == ++v11) {
            goto LABEL_12;
          }
        }
        [(CRCHNetworkCursor *)v7 addEdgeIndex:*(void *)(*((void *)self->_network + 5) + 56 * v9 + 16) + v11];
        if (__p)
        {
          v16 = __p;
          operator delete(__p);
        }
      }
LABEL_12:
      if (v19)
      {
        v20 = v19;
        operator delete(v19);
      }
      ++v8;
    }
    while (v8 < [a3 edgeIndexCount]);
  }
  return v7;
}

+ (BOOL)isFinalCursor:(id)a3 inNetwork:(id)a4
{
  BOOL v4 = 0;
  if (a3 && a4)
  {
    if ([a3 edgeIndexCount])
    {
      unint64_t v7 = 0;
      do
      {
        NetworkEdge::NetworkEdge((NetworkEdge *)v11, (const NetworkEdge *)(*(void *)(*((void *)a4 + 1) + 88)+ 80 * [a3 edgeIndexAtPosition:v7]));
        uint64_t v8 = *(void *)(*((void *)a4 + 1) + 40) + 56 * v11[1];
        int v9 = *(unsigned __int8 *)(v8 + 48);
        BOOL v4 = *(unsigned char *)(v8 + 48) != 0;
        if (__p)
        {
          uint64_t v13 = __p;
          operator delete(__p);
        }
        if (v9) {
          break;
        }
        ++v7;
      }
      while (v7 < [a3 edgeIndexCount]);
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (CRCHPatternNetwork)initWithFile:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)CRCHPatternNetwork;
  BOOL v4 = [(CRCHPatternNetwork *)&v57 init];
  if (pathForResource((const char *)[a3 UTF8String], 0, __s)) {
    operator new();
  }
  v4->_symbols = (NSDictionary *)+[CRCHPatternNetwork patternToSymbolMap];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = *((void *)v4->_network + 11);
  if (*((void *)v4->_network + 12) != v6)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      NetworkEdge::NetworkEdge((NetworkEdge *)v52, (const NetworkEdge *)(v6 + v7));
      if (v53 == v54)
      {
        uint64_t v9 = -[NSDictionary objectForKey:](v4->_symbols, "objectForKey:", objc_msgSend(NSString, "stringWithFormat:", @"0x%07lx", v53));
        if (v9) {
          objc_msgSend(v5, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithLong:", v8), v9);
        }
      }
      if (__p)
      {
        v56 = __p;
        operator delete(__p);
      }
      ++v8;
      uint64_t v6 = *((void *)v4->_network + 11);
      v7 += 80;
    }
    while (v8 < 0xCCCCCCCCCCCCCCCDLL * ((*((void *)v4->_network + 12) - v6) >> 4));
  }
  v4->_startEdges = (NSDictionary *)v5;
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v11 = objc_alloc_init(CRCHNetworkCursor);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v12 = +[CRCHPatternNetwork kDefaultPatternsPlusUrlsAndEmails];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v49 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v48 + 1) + 8 * i);
        if ([(NSDictionary *)v4->_startEdges objectForKey:v16]) {
          -[CRCHNetworkCursor addEdgeIndex:](v11, "addEdgeIndex:", objc_msgSend(-[NSDictionary objectForKey:](v4->_startEdges, "objectForKey:", v16), "unsignedLongValue"));
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v61 count:16];
    }
    while (v13);
  }
  objc_msgSend(v10, "setObject:forKey:", v11, objc_msgSend(NSNumber, "numberWithInt:", 1));
  v17 = objc_alloc_init(CRCHNetworkCursor);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v18 = +[CRCHPatternNetwork kDefaultPatterns];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v60 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v45 != v20) {
          objc_enumerationMutation(v18);
        }
        uint64_t v22 = *(void *)(*((void *)&v44 + 1) + 8 * j);
        if ([(NSDictionary *)v4->_startEdges objectForKey:v22]) {
          -[CRCHNetworkCursor addEdgeIndex:](v17, "addEdgeIndex:", objc_msgSend(-[NSDictionary objectForKey:](v4->_startEdges, "objectForKey:", v22), "unsignedLongValue"));
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v60 count:16];
    }
    while (v19);
  }
  objc_msgSend(v10, "setObject:forKey:", v17, objc_msgSend(NSNumber, "numberWithInt:", 0));
  v23 = objc_alloc_init(CRCHNetworkCursor);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v24 = +[CRCHPatternNetwork kEmailPatterns];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v59 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v28 = *(void *)(*((void *)&v40 + 1) + 8 * k);
        if ([(NSDictionary *)v4->_startEdges objectForKey:v28]) {
          -[CRCHNetworkCursor addEdgeIndex:](v23, "addEdgeIndex:", objc_msgSend(-[NSDictionary objectForKey:](v4->_startEdges, "objectForKey:", v28), "unsignedLongValue"));
        }
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v59 count:16];
    }
    while (v25);
  }
  objc_msgSend(v10, "setObject:forKey:", v23, objc_msgSend(NSNumber, "numberWithInt:", 2));
  v29 = objc_alloc_init(CRCHNetworkCursor);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v30 = +[CRCHPatternNetwork kUrlPatterns];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v36 objects:v58 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v37;
    do
    {
      for (uint64_t m = 0; m != v31; ++m)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v30);
        }
        uint64_t v34 = *(void *)(*((void *)&v36 + 1) + 8 * m);
        if ([(NSDictionary *)v4->_startEdges objectForKey:v34]) {
          -[CRCHNetworkCursor addEdgeIndex:](v29, "addEdgeIndex:", objc_msgSend(-[NSDictionary objectForKey:](v4->_startEdges, "objectForKey:", v34), "unsignedLongValue"));
        }
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v36 objects:v58 count:16];
    }
    while (v31);
  }
  objc_msgSend(v10, "setObject:forKey:", v29, objc_msgSend(NSNumber, "numberWithInt:", 3));
  v4->_startCursorForContentTypes = (NSDictionary *)v10;
  return v4;
}

- (void)dealloc
{
  networuint64_t k = (CRCHNetwork *)self->_network;
  if (network)
  {
    CRCHNetwork::~CRCHNetwork(network);
    MEMORY[0x1E01BF140]();
    self->_networuint64_t k = 0;
  }
  symbols = self->_symbols;
  if (symbols)
  {

    self->_symbols = 0;
  }
  startEdges = self->_startEdges;
  if (startEdges)
  {

    self->_startEdges = 0;
  }
  startCursorForContentTypes = self->_startCursorForContentTypes;
  if (startCursorForContentTypes)
  {

    self->_startCursorForContentTypes = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)CRCHPatternNetwork;
  [(CRCHPatternNetwork *)&v7 dealloc];
}

@end