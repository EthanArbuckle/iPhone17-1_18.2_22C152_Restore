@interface EXPane
+ (id)activePaneTypeEnumMap;
+ (id)edPaneFromXMLPaneElement:(_xmlNode *)a3;
+ (id)paneStateEnumMap;
+ (int)edActivePaneEnumFromString:(id)a3;
@end

@implementation EXPane

+ (id)edPaneFromXMLPaneElement:(_xmlNode *)a3
{
  v5 = +[EDPane pane];
  id v20 = 0;
  BOOL v6 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"topLeftCell", &v20);
  id v7 = v20;
  if (v6)
  {
    v8 = +[EXReference edReferenceFromXmlReference:v7];
    [v5 setTopLeftCell:v8];
  }
  double v19 = 0.0;
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"xSplit", &v19)) {
    [v5 setXSplitPosition:v19];
  }
  double v18 = 0.0;
  if (CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"ySplit", &v18)) {
    [v5 setYSplitPosition:v18];
  }
  id v17 = 0;
  BOOL v9 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"activePane", &v17);
  id v10 = v17;
  if (v9) {
    uint64_t v11 = [a1 edActivePaneEnumFromString:v10];
  }
  else {
    uint64_t v11 = 3;
  }
  [v5 setActivePane:v11];
  id v16 = 0;
  BOOL v12 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"state", &v16);
  id v13 = v16;
  if (v12)
  {
    v14 = [a1 paneStateEnumMap];
    objc_msgSend(v5, "setPaneState:", objc_msgSend(v14, "valueForString:", v13));
  }
  else
  {
    [v5 setPaneState:0];
  }

  return v5;
}

+ (int)edActivePaneEnumFromString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (![v3 caseInsensitiveCompare:@"bottomRight"])
    {
      int v5 = 0;
      goto LABEL_10;
    }
    if (![v4 caseInsensitiveCompare:@"topRight"])
    {
      int v5 = 1;
      goto LABEL_10;
    }
    if (![v4 caseInsensitiveCompare:@"bottomLeft"])
    {
      int v5 = 2;
      goto LABEL_10;
    }
    [v4 caseInsensitiveCompare:@"topLeft"];
  }
  int v5 = 3;
LABEL_10:

  return v5;
}

+ (id)activePaneTypeEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_27, 0, &dword_238A75000);
  }
  if (+[EXPane activePaneTypeEnumMap]::onceToken != -1) {
    dispatch_once(&+[EXPane activePaneTypeEnumMap]::onceToken, &__block_literal_global_77);
  }
  v2 = (void *)+[EXPane activePaneTypeEnumMap]::sActivePaneTypeEnumMap;
  return v2;
}

void __31__EXPane_activePaneTypeEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXPane activePaneTypeEnumMap]::sActivePaneTypeStructs count:4 caseSensitive:1];
  v1 = (void *)+[EXPane activePaneTypeEnumMap]::sActivePaneTypeEnumMap;
  +[EXPane activePaneTypeEnumMap]::sActivePaneTypeEnumMap = (uint64_t)v0;
}

+ (id)paneStateEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_20_0, 0, &dword_238A75000);
  }
  if (+[EXPane paneStateEnumMap]::onceToken != -1) {
    dispatch_once(&+[EXPane paneStateEnumMap]::onceToken, &__block_literal_global_22_1);
  }
  v2 = (void *)+[EXPane paneStateEnumMap]::sPaneStateEnumMap;
  return v2;
}

void __26__EXPane_paneStateEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[EXPane paneStateEnumMap]::sPaneStateStructs count:3 caseSensitive:1];
  v1 = (void *)+[EXPane paneStateEnumMap]::sPaneStateEnumMap;
  +[EXPane paneStateEnumMap]::sPaneStateEnumMap = (uint64_t)v0;
}

@end