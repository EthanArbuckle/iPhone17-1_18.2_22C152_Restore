@interface WXCitation
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXCitation

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v38 = a4;
  id v7 = a5;
  v8 = [v7 WXOOBibliographyNamespace];
  uint64_t v9 = CXChildDefaultStringContent(a3, v8, (xmlChar *)"SourceType", 0);

  v36 = (void *)v9;
  if (v9) {
    [v38 setSourceType:v9];
  }
  v10 = [v7 WXOOBibliographyNamespace];
  uint64_t v11 = CXChildDefaultStringContent(a3, v10, (xmlChar *)"Year", 0);

  v35 = (void *)v11;
  if (v11) {
    [v38 setYear:v11];
  }
  v12 = [v7 WXOOBibliographyNamespace];
  uint64_t v13 = CXChildDefaultStringContent(a3, v12, (xmlChar *)"Pages", 0);

  v34 = (void *)v13;
  if (v13) {
    [v38 setPages:v13];
  }
  v14 = [v7 WXOOBibliographyNamespace];
  uint64_t v15 = CXChildDefaultStringContent(a3, v14, (xmlChar *)"Title", 0);

  v37 = (void *)v15;
  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    [v16 addObject:v15];
    [v38 setTitles:v16];
  }
  v17 = [v7 WXOOBibliographyNamespace];
  uint64_t v18 = CXChildDefaultStringContent(a3, v17, (xmlChar *)"Volume", 0);

  v33 = (void *)v18;
  if (v18) {
    [v38 setVolume:v18];
  }
  v19 = [v7 WXOOBibliographyNamespace];
  v20 = (_xmlNode *)OCXFindChild(a3, v19, "Author");

  v21 = [v7 WXOOBibliographyNamespace];
  Child = (_xmlNode *)OCXFindChild(v20, v21, "Author");

  v39 = [v38 authors];
  while (Child)
  {
    v23 = [v7 WXOOBibliographyNamespace];
    v24 = (_xmlNode *)OCXFindChild(Child, v23, "NameList");

    v25 = [v7 WXOOBibliographyNamespace];
    v26 = (_xmlNode *)OCXFindChild(v24, v25, "Person");

    v27 = [v7 WXOOBibliographyNamespace];
    uint64_t v28 = CXChildDefaultStringContent(v26, v27, (xmlChar *)"Last", 0);

    v29 = [v7 WXOOBibliographyNamespace];
    uint64_t v30 = CXChildDefaultStringContent(v26, v29, (xmlChar *)"First", 0);

    if (v28 | v30)
    {
      v31 = [[WDCitationAuthor alloc] initWithFirst:v30 last:v28];
      [v39 addObject:v31];
    }
    v32 = [v7 WXOOBibliographyNamespace];
    Child = OCXFindNextChild(Child, v32, (xmlChar *)"Author");
  }
}

@end