@interface WDCitation
+ (_xmlNode)nodeAtPath:(id)a3 nodePtr:(_xmlNode *)a4;
+ (_xmlNode)trimStyle:(_xmlNode *)a3;
+ (id)endNoteStringForRefType:(int)a3;
+ (id)refTypeEnumMap;
+ (id)stringValueForNodeAtPath:(id)a3 nodePtr:(_xmlNode *)a4 trimStyle:(BOOL)a5;
+ (id)stringValuesForNodesAtPath:(id)a3 nodePtr:(_xmlNode *)a4 trimStyle:(BOOL)a5;
+ (id)subStringOf:(_xmlNode *)a3 forPath:(id)a4;
+ (id)wordRefTypeEnumMap;
+ (id)wordStringForRefType:(int)a3;
+ (int)refTypeForWordString:(id)a3;
- (NSMutableArray)authors;
- (NSMutableArray)titles;
- (NSMutableArray)urls;
- (NSString)number;
- (NSString)pages;
- (NSString)periodicalTitle;
- (NSString)pubDate;
- (NSString)section;
- (NSString)sourceType;
- (NSString)volume;
- (NSString)year;
- (WDCitation)initWithDocument:(id)a3;
- (WDDocument)document;
- (id)description;
- (void)setAuthors:(id)a3;
- (void)setNumber:(id)a3;
- (void)setPages:(id)a3;
- (void)setPeriodicalTitle:(id)a3;
- (void)setPubDate:(id)a3;
- (void)setSection:(id)a3;
- (void)setSourceType:(id)a3;
- (void)setTitles:(id)a3;
- (void)setUrls:(id)a3;
- (void)setVolume:(id)a3;
- (void)setYear:(id)a3;
@end

@implementation WDCitation

+ (id)wordRefTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_47, 0, &dword_238A75000);
  }
  if (+[WDCitation wordRefTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WDCitation wordRefTypeEnumMap]::onceToken, &__block_literal_global_96);
  }
  v2 = (void *)+[WDCitation wordRefTypeEnumMap]::sWordRefTypeEnumMap;
  return v2;
}

void __32__WDCitation_wordRefTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WDCitation wordRefTypeEnumMap]::sWordRefTypeEnumStructs count:17 caseSensitive:1];
  v1 = (void *)+[WDCitation wordRefTypeEnumMap]::sWordRefTypeEnumMap;
  +[WDCitation wordRefTypeEnumMap]::sWordRefTypeEnumMap = (uint64_t)v0;
}

+ (id)refTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_196_0, 0, &dword_238A75000);
  }
  if (+[WDCitation refTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[WDCitation refTypeEnumMap]::onceToken, &__block_literal_global_198);
  }
  v2 = (void *)+[WDCitation refTypeEnumMap]::sRefTypeEnumMap;
  return v2;
}

void __28__WDCitation_refTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WDCitation refTypeEnumMap]::sRefTypeEnumStructs count:47 caseSensitive:1];
  v1 = (void *)+[WDCitation refTypeEnumMap]::sRefTypeEnumMap;
  +[WDCitation refTypeEnumMap]::sRefTypeEnumMap = (uint64_t)v0;
}

- (WDCitation)initWithDocument:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WDCitation;
  v5 = [(WDCitation *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mDocument, v4);
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    mAuthors = v6->mAuthors;
    v6->mAuthors = (NSMutableArray *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
    mTitles = v6->mTitles;
    v6->mTitles = (NSMutableArray *)v9;
  }
  return v6;
}

+ (id)endNoteStringForRefType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [a1 refTypeEnumMap];
  v5 = [v4 stringForValue:v3];

  return v5;
}

+ (int)refTypeForWordString:(id)a3
{
  id v4 = a3;
  v5 = [a1 wordRefTypeEnumMap];
  int v6 = [v5 valueForString:v4];

  return v6;
}

+ (id)wordStringForRefType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = [a1 wordRefTypeEnumMap];
  int v6 = [v5 stringForValue:v3];

  if (!v6)
  {
    switch((int)v3)
    {
      case '$':
      case '4':
      case '5':
        goto LABEL_6;
      case '%':
      case '&':
      case '\'':
      case '(':
      case ')':
      case '*':
      case '.':
      case '/':
      case '1':
      case '2':
      case '3':
      case '6':
      case '7':
      case ':':
      case ';':
        goto LABEL_8;
      case '+':
      case ',':
      case '-':
      case '0':
      case '<':
        uint64_t v7 = [a1 wordRefTypeEnumMap];
        uint64_t v8 = [v7 stringForValue:202];
        goto LABEL_10;
      case '8':
        uint64_t v7 = [a1 wordRefTypeEnumMap];
        uint64_t v8 = [v7 stringForValue:12];
        goto LABEL_10;
      case '9':
        goto LABEL_7;
      default:
        if (v3 == 23)
        {
LABEL_7:
          uint64_t v7 = [a1 wordRefTypeEnumMap];
          uint64_t v8 = [v7 stringForValue:19];
        }
        else if (v3 == 28)
        {
LABEL_6:
          uint64_t v7 = [a1 wordRefTypeEnumMap];
          uint64_t v8 = [v7 stringForValue:6];
        }
        else
        {
LABEL_8:
          uint64_t v7 = [a1 wordRefTypeEnumMap];
          uint64_t v8 = [v7 stringForValue:13];
        }
LABEL_10:
        int v6 = (void *)v8;

        break;
    }
  }
  return v6;
}

+ (_xmlNode)nodeAtPath:(id)a3 nodePtr:(_xmlNode *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [a3 componentsSeparatedByString:@"/"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        a4 = CXFirstChildNamed(a4, (xmlChar *)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "tc_xmlString", (void)v10));
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return a4;
}

+ (_xmlNode)trimStyle:(_xmlNode *)a3
{
  children = a3->children;
  if (!children || !xmlStrEqual((const xmlChar *)"style", children->name)) {
    return a3;
  }
  return children;
}

+ (id)subStringOf:(_xmlNode *)a3 forPath:(id)a4
{
  id v5 = (xmlNode *)[a1 nodeAtPath:a4 nodePtr:a3];
  xmlSetBufferAllocationScheme(XML_BUFFER_ALLOC_EXACT);
  xmlBufferPtr v6 = xmlBufferCreate();
  xmlNodeDump(v6, a3->doc, v5, 0, 0);
  if (xmlBufferLength(v6))
  {
    uint64_t v7 = objc_msgSend(NSString, "tc_stringWithXmlString:", xmlBufferContent(v6));
  }
  else
  {
    uint64_t v7 = 0;
  }
  xmlBufferFree(v6);
  return v7;
}

+ (id)stringValueForNodeAtPath:(id)a3 nodePtr:(_xmlNode *)a4 trimStyle:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [a1 nodeAtPath:v8 nodePtr:a4];
  if (!v9) {
    goto LABEL_7;
  }
  if (v5) {
    uint64_t v9 = [a1 trimStyle:v9];
  }
  uint64_t v10 = *(void *)(v9 + 24);
  if (v10)
  {
    if (*(_DWORD *)(v10 + 8) == 1) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = *(void *)(v10 + 80);
    }
    long long v12 = objc_msgSend(NSString, "tc_stringWithXmlString:", v11);
  }
  else
  {
LABEL_7:
    long long v12 = 0;
  }

  return v12;
}

+ (id)stringValuesForNodesAtPath:(id)a3 nodePtr:(_xmlNode *)a4 trimStyle:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  uint64_t v9 = [v8 stringByDeletingLastPathComponent];
  uint64_t v10 = (_xmlNode *)[a1 nodeAtPath:v9 nodePtr:a4];

  if (v10)
  {
    uint64_t v11 = [v8 lastPathComponent];
    long long v12 = (xmlChar *)objc_msgSend(v11, "tc_xmlString");
    long long v13 = CXFirstChildNamed(v10, v12);
    uint64_t v10 = [MEMORY[0x263EFF980] array];
    while (v13)
    {
      if (v5) {
        long long v13 = (_xmlNode *)[a1 trimStyle:v13];
      }
      children = v13->children;
      if (children->type != XML_ELEMENT_NODE)
      {
        if (children->content)
        {
          uint64_t v15 = objc_msgSend(NSString, "tc_stringWithXmlString:");
          [(_xmlNode *)v10 addObject:v15];
        }
      }
      long long v13 = CXNextSiblingNamed(v13, v12);
    }
  }
  return v10;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDCitation;
  v2 = [(WDCitation *)&v4 description];
  return v2;
}

- (NSString)year
{
  return self->mYear;
}

- (void)setYear:(id)a3
{
}

- (NSMutableArray)authors
{
  return self->mAuthors;
}

- (void)setAuthors:(id)a3
{
}

- (NSString)sourceType
{
  return self->mSourceType;
}

- (void)setSourceType:(id)a3
{
}

- (NSMutableArray)titles
{
  return self->mTitles;
}

- (void)setTitles:(id)a3
{
}

- (NSString)periodicalTitle
{
  return self->mPeriodicalTitle;
}

- (void)setPeriodicalTitle:(id)a3
{
}

- (NSString)volume
{
  return self->mVolume;
}

- (void)setVolume:(id)a3
{
}

- (NSString)number
{
  return self->mNumber;
}

- (void)setNumber:(id)a3
{
}

- (NSString)section
{
  return self->mSection;
}

- (void)setSection:(id)a3
{
}

- (NSString)pubDate
{
  return self->mPubDate;
}

- (void)setPubDate:(id)a3
{
}

- (NSMutableArray)urls
{
  return self->mUrls;
}

- (void)setUrls:(id)a3
{
}

- (NSString)pages
{
  return self->mPages;
}

- (void)setPages:(id)a3
{
}

- (WDDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mDocument);
  return (WDDocument *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDocument);
  objc_storeStrong((id *)&self->mPages, 0);
  objc_storeStrong((id *)&self->mPubDate, 0);
  objc_storeStrong((id *)&self->mSection, 0);
  objc_storeStrong((id *)&self->mNumber, 0);
  objc_storeStrong((id *)&self->mVolume, 0);
  objc_storeStrong((id *)&self->mPeriodicalTitle, 0);
  objc_storeStrong((id *)&self->mUrls, 0);
  objc_storeStrong((id *)&self->mTitles, 0);
  objc_storeStrong((id *)&self->mYear, 0);
  objc_storeStrong((id *)&self->mAuthors, 0);
  objc_storeStrong((id *)&self->mSourceType, 0);
}

@end