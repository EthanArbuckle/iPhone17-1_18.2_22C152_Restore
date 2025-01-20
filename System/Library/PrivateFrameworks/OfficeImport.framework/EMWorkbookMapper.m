@interface EMWorkbookMapper
+ (id)borderStyleCache;
+ (id)borderWidthCache;
+ (id)cssStyleCache;
- (BOOL)hasMultipleSheets;
- (CGSize)pageSizeForDevice;
- (EMWorkbookMapper)initWithDocument:(id)a3 archiver:(id)a4;
- (NSString)fileName;
- (id)_copyStringForSheet:(id)a3 atIndex:(unint64_t)a4 withState:(id)a5 andMapper:(id)a6;
- (id)_frontPageByCopyingMainPage;
- (id)_mainPageBack;
- (id)archiver;
- (id)blipAtIndex:(unsigned int)a3;
- (id)copySheetMapperWithEdSheet:(id)a3;
- (id)documentTitle;
- (id)headElementForFrontPage;
- (id)styleMatrix;
- (id)tabTitleDrawingAttributes;
- (void)_pushTabForSheet:(id)a3 atIndex:(unint64_t)a4;
- (void)finishMappingWithState:(id)a3;
- (void)mapElement:(id)a3 atIndex:(unint64_t)a4 withState:(id)a5 isLastElement:(BOOL)a6;
- (void)mapStylesheetData:(id)a3 name:(id)a4 atElement:(id)a5;
- (void)mapStylesheetNamed:(id)a3 atElement:(id)a4;
- (void)setElementCount:(unint64_t)a3;
- (void)setFileName:(id)a3;
- (void)startMappingWithState:(id)a3;
@end

@implementation EMWorkbookMapper

- (void)setFileName:(id)a3
{
}

- (void)startMappingWithState:(id)a3
{
  id v9 = a3;
  self->mHasPushedHeader = 0;
  self->mIsFirstMappedSheet = 1;
  if ([(EMWorkbookMapper *)self hasMultipleSheets]) {
    self->mTabPosition = 0.0;
  }
  v4 = [(CMMapper *)self document];
  v5 = [v4 theme];
  v6 = [v5 baseStyles];
  v7 = [v6 colorScheme];
  [v9 setColorScheme:v7];

  v8 = [v4 resources];
  [v9 setResources:v8];
}

- (BOOL)hasMultipleSheets
{
  if (self->mRealSheetCount < 2) {
    return 0;
  }
  else {
    return ![(CMArchiveManager *)self->super.super.mArchiver isThumbnail];
  }
}

- (void)mapElement:(id)a3 atIndex:(unint64_t)a4 withState:(id)a5 isLastElement:(BOOL)a6
{
  id v31 = a3;
  id v10 = a5;
  if (([v31 isHidden] & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      && ![(CMArchiveManager *)self->super.super.mArchiver isCancelled])
    {
      v11 = (void *)MEMORY[0x23EC9A170]();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v29 = [MEMORY[0x263F08690] currentHandler];
        [v29 handleFailureInMethod:a2 object:self file:@"EMWorkbookMapper.mm" lineNumber:436 description:@"Expected a EMState"];
      }
      id v12 = v10;
      [v12 setCurrentSheet:v31];
      id v13 = [(EMWorkbookMapper *)self copySheetMapperWithEdSheet:v31];
      if (v13)
      {
        v14 = [v31 name];
        v15 = [v14 string];

        [(NSMutableArray *)self->mWorksheetNames addObject:v15];
        if (self->mIsFirstMappedSheet)
        {
          [(CMArchiveManager *)self->super.super.mArchiver pushText:&stru_26EBF24D8 toPath:0];
          [(CMArchiveManager *)self->super.super.mArchiver commitDataAtPath:0];
          self->mIsFirstMappedSheet = 0;
        }
        if ([(EMWorkbookMapper *)self hasMultipleSheets])
        {
          while ([(NSMutableArray *)self->mSheetURLs count] < a4)
          {
            mSheetURLs = self->mSheetURLs;
            v17 = [MEMORY[0x263EFF9D0] null];
            [(NSMutableArray *)mSheetURLs addObject:v17];
          }
          mArchiver = self->super.super.mArchiver;
          v19 = objc_msgSend(NSString, "stringWithFormat:", @"Sheet%lu.html", a4);
          id v20 = [(CMArchiveManager *)mArchiver copyResourceWithName:v19 type:10];

          if (v20) {
            [(NSMutableArray *)self->mSheetURLs addObject:v20];
          }
          else {
            NSLog((NSString *)@"Could not create URL for sheet %lu", a4);
          }
        }
        id v21 = [(EMWorkbookMapper *)self _copyStringForSheet:v31 atIndex:a4 withState:v12 andMapper:v13];
        if ([(CMArchiveManager *)self->super.super.mArchiver isThumbnail])
        {
          [v13 adjustedSize];
          double v23 = v22;
          [(CMArchiveManager *)self->super.super.mArchiver setHTMLWidth:(int)v24];
          [(CMArchiveManager *)self->super.super.mArchiver setHTMLHeight:(int)v23];
        }
        if (v21)
        {
          if ([(EMWorkbookMapper *)self hasMultipleSheets])
          {
            v25 = [(NSMutableArray *)self->mSheetURLs objectAtIndex:a4];
            if (!self->mHasPushedHeader)
            {
              v30 = v15;
              self->mHasPushedHeader = 1;
              v26 = [(EMWorkbookMapper *)self _frontPageByCopyingMainPage];
              [(CMArchiveManager *)self->super.super.mArchiver pushText:v26 toPath:0];

              v15 = v30;
            }
            [(EMWorkbookMapper *)self _pushTabForSheet:v31 atIndex:a4];
            [(CMArchiveManager *)self->super.super.mArchiver pushText:v21 toPath:v25];
            [(CMArchiveManager *)self->super.super.mArchiver commitDataAtPath:v25];
            [(CMArchiveManager *)self->super.super.mArchiver closeResourceAtPath:v25];
            ++self->mNumberOfMappedSheets;
            if (!self->mHasPushedFirstSheet)
            {
              self->mHasPushedFirstSheet = 1;
              v27 = [MEMORY[0x263F08AB0] processInfo];
              uint64_t v28 = [v27 activeProcessorCount];

              if (v28 == 1) {
                sleep(2u);
              }
            }
          }
          else
          {
            [(CMArchiveManager *)self->super.super.mArchiver pushText:v21 toPath:0];
            [(CMArchiveManager *)self->super.super.mArchiver commitDataAtPath:0];
            [(CMArchiveManager *)self->super.super.mArchiver closeResourceAtPath:0];
          }
        }
        else
        {
          ++self->mSheetIndex;
        }
      }
    }
  }
}

- (id)copySheetMapperWithEdSheet:(id)a3
{
  id v4 = a3;
  if ([v4 isHidden]) {
    goto LABEL_2;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [[EMChartsheetMapper alloc] initWithChartSheet:v4 parent:self];
LABEL_7:
    v5 = v6;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [[EMWorksheetMapper alloc] initWithEDWorksheet:v4 parent:self];
    goto LABEL_7;
  }
LABEL_2:
  v5 = 0;
LABEL_8:

  return v5;
}

- (id)_copyStringForSheet:(id)a3 atIndex:(unint64_t)a4 withState:(id)a5 andMapper:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = +[CMXmlUtils copyXhtmlDocument];
  v11 = +[OIXMLElement elementWithType:1];
  [v9 mapAt:v11 withState:v8];
  int v12 = [v9 width];
  if (v12 > self->mWidth) {
    self->mWidth = v12;
  }
  int v13 = [v9 height];
  if (v13 > self->mHeight) {
    self->mHeight = v13;
  }
  v14 = [(EMWorkbookMapper *)self archiver];
  v15 = [v14 cssStylesheetString];

  v16 = [(EMWorkbookMapper *)self documentTitle];
  id v17 = +[CMXmlUtils copyHeadElementWithTitle:v16];

  [(EMWorkbookMapper *)self mapStylesheetNamed:@"spreadsheet" atElement:v17];
  [(EMWorkbookMapper *)self mapStylesheetNamed:@"spreadsheet-ios" atElement:v17];
  v22.receiver = self;
  v22.super_class = (Class)EMWorkbookMapper;
  [(CMMapper *)&v22 mapStylesheetAt:v17 stylesheet:v15];
  v18 = [v10 rootElement];
  [v18 addChild:v17];

  v19 = [v10 rootElement];
  [v19 addChild:v11];

  id v20 = [v10 XMLString];

  return v20;
}

- (id)archiver
{
  return self->super.super.mArchiver;
}

- (id)documentTitle
{
  v3 = [(CMMapper *)self document];
  id v4 = [v3 summary];

  if (v4)
  {
    v5 = [v3 summary];
    v6 = [v5 title];

    if (v6 && [v6 length])
    {
      id v7 = v6;
LABEL_9:
      id v8 = v7;
      goto LABEL_11;
    }
  }
  else
  {
    v6 = 0;
  }
  id v8 = [v3 workbookName];

  if (v8 && [v8 length])
  {
    id v7 = v8;
    goto LABEL_9;
  }
  id v7 = [(EMWorkbookMapper *)self fileName];
LABEL_11:
  id v9 = v7;

  return v9;
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)finishMappingWithState:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"EMWorkbookMapper.mm" lineNumber:536 description:@"Expected a EMState"];
  }
  id v8 = v5;
  [v8 setCurrentSheet:0];
  if ([(EMWorkbookMapper *)self hasMultipleSheets])
  {
    v6 = [(EMWorkbookMapper *)self _mainPageBack];
    [(CMArchiveManager *)self->super.super.mArchiver pushText:v6 toPath:0];
    [(CMArchiveManager *)self->super.super.mArchiver commitDataAtPath:0];
    [(CMArchiveManager *)self->super.super.mArchiver closeResourceAtPath:0];
  }
}

+ (id)borderStyleCache
{
  return +[CMGlobalCache borderStyleCache];
}

+ (id)borderWidthCache
{
  return +[CMGlobalCache borderWidthCache];
}

- (id)_frontPageByCopyingMainPage
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v3 = +[CMXmlUtils copyXhtmlDocument];
  mXhtmlDoc = self->mXhtmlDoc;
  self->mXhtmlDoc = v3;

  v36 = [(EMWorkbookMapper *)self headElementForFrontPage];
  id v5 = [(OIXMLDocument *)self->mXhtmlDoc rootElement];
  [v5 addChild:v36];

  v6 = +[OIXMLElement elementWithType:1];
  mBodyElement = self->mBodyElement;
  self->mBodyElement = v6;

  id v8 = self->mBodyElement;
  id v9 = NSString;
  id v10 = [(NSMutableArray *)self->mSheetURLs objectAtIndex:0];
  v11 = [v9 stringWithFormat:@"javascript:ReloadFirstSheetIfNeeded('%@')", v10];
  int v12 = +[OIXMLAttribute attributeWithName:@"onload" stringValue:v11];
  [(OIXMLElement *)v8 addAttribute:v12];

  int v13 = [(OIXMLDocument *)self->mXhtmlDoc rootElement];
  [v13 addChild:self->mBodyElement];

  v37 = +[OIXMLElement elementWithType:3];
  v14 = +[OIXMLAttribute attributeWithName:@"id" stringValue:@"wrapper"];
  [v37 addAttribute:v14];

  v15 = +[OIXMLAttribute attributeWithName:@"style" stringValue:@"position:absolute; top:40; left:0; right:0; "];
  [v37 addAttribute:v15];

  v16 = +[OIXMLElement elementWithType:8];
  id v17 = +[OIXMLAttribute attributeWithName:@"id" stringValue:@"SheetFrame"];
  [v16 addAttribute:v17];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v18 = self->mSheetURLs;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v39;
LABEL_3:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v39 != v20) {
        objc_enumerationMutation(v18);
      }
      objc_super v22 = *(void **)(*((void *)&v38 + 1) + 8 * v21);
      double v23 = [MEMORY[0x263EFF9D0] null];
      BOOL v24 = v22 == v23;

      if (!v24) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v19) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v25 = v22;

    v26 = v25;
    if (v25) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v26 = &stru_26EBF24D8;
LABEL_12:
  v27 = +[OIXMLAttribute attributeWithName:@"src" stringValue:v26];
  [v16 addAttribute:v27];

  uint64_t v28 = +[OIXMLAttribute attributeWithName:@"style" stringValue:@"border:0; width:100%; height:100%;"];
  [v16 addAttribute:v28];

  [v37 addChild:v16];
  [(OIXMLElement *)self->mBodyElement addChild:v37];
  v29 = [MEMORY[0x263F089D8] string];
  v30 = [(OIXMLDocument *)self->mXhtmlDoc rootElement];
  id v31 = [v30 openingTagString];
  [v29 appendString:v31];

  v32 = [v36 XMLString];
  [v29 appendString:v32];

  v33 = [(OIXMLElement *)self->mBodyElement openingTagString];
  [v29 appendString:v33];

  v34 = [v37 XMLString];
  [v29 appendString:v34];

  return v29;
}

- (id)blipAtIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(CMMapper *)self document];
  id v5 = [v4 blips];
  v6 = [v5 blipAtIndex:v3];

  return v6;
}

- (id)_mainPageBack
{
  uint64_t v3 = [MEMORY[0x263F089D8] string];
  id v4 = [(OIXMLElement *)self->mBodyElement closingTagString];
  [v3 appendString:v4];

  id v5 = [(OIXMLDocument *)self->mXhtmlDoc rootElement];
  v6 = [v5 closingTagString];
  [v3 appendString:v6];

  return v3;
}

- (EMWorkbookMapper)initWithDocument:(id)a3 archiver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    v26.receiver = self;
    v26.super_class = (Class)EMWorkbookMapper;
    id v9 = [(CMDocumentMapper *)&v26 initWithDocument:v8 archiver:v7];
    id v10 = v9;
    if (v9)
    {
      v9->mWidth = 0;
      v9->mHeight = 0;
      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      mWorksheetGuids = v10->mWorksheetGuids;
      v10->mWorksheetGuids = v11;

      int v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      mWorksheetUrls = v10->mWorksheetUrls;
      v10->mWorksheetUrls = v13;

      v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      mWorksheetNames = v10->mWorksheetNames;
      v10->mWorksheetNames = v15;

      id v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      mSheetURLs = v10->mSheetURLs;
      v10->mSheetURLs = v17;

      mResourceUrlPrefix = v10->mResourceUrlPrefix;
      v10->mResourceUrlPrefix = (NSString *)&stru_26EBF24D8;

      mStyleSheetGuid = v10->mStyleSheetGuid;
      v10->mStyleSheetGuid = (NSString *)&stru_26EBF24D8;

      v10->mRealSheetCount = 0;
      uint64_t v21 = [v8 sheetCount];
      if (v21 >= 1)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          double v23 = [v8 sheetAtIndex:i loadIfNeeded:0];
          if (([v23 isHidden] & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
              ++v10->mRealSheetCount;
            }
          }
        }
      }
    }
    self = v10;

    BOOL v24 = self;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

+ (id)cssStyleCache
{
  return +[CMGlobalCache cssStylesheetCache];
}

- (id)styleMatrix
{
  v2 = [(CMMapper *)self document];
  uint64_t v3 = [v2 theme];
  id v4 = [v3 baseStyles];

  if (v4)
  {
    id v5 = [v4 styleMatrix];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (CGSize)pageSizeForDevice
{
  int mWidth = self->mWidth;
  double mHeight = (double)self->mHeight;
  if ([(EMWorkbookMapper *)self hasMultipleSheets]) {
    double v4 = mHeight + 40.0;
  }
  else {
    double v4 = mHeight;
  }
  double v5 = (double)mWidth;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)mapStylesheetData:(id)a3 name:(id)a4 atElement:(id)a5
{
  id v14 = a5;
  id v8 = [(CMArchiveManager *)self->super.super.mArchiver addResource:a3 withName:a4 type:8];
  id v9 = +[OIXMLElement elementWithType:10];
  id v10 = +[OIXMLAttribute attributeWithName:@"href" stringValue:v8];
  [v9 addAttribute:v10];

  v11 = +[OIXMLAttribute attributeWithName:@"rel" stringValue:@"stylesheet"];
  [v9 addAttribute:v11];

  int v12 = +[OIXMLAttribute attributeWithName:@"type" stringValue:@"text/css"];
  [v9 addAttribute:v12];

  int v13 = +[OIXMLAttribute attributeWithName:@"charset" stringValue:@"utf-8"];
  [v9 addAttribute:v13];

  [v14 addChild:v9];
}

- (void)mapStylesheetNamed:(id)a3 atElement:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v8 = [v7 URLForResource:v11 withExtension:@"css"];
  id v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8];
  id v10 = [v11 stringByAppendingPathExtension:@"css"];
  [(EMWorkbookMapper *)self mapStylesheetData:v9 name:v10 atElement:v6];
}

- (id)headElementForFrontPage
{
  uint64_t v3 = [(EMWorkbookMapper *)self documentTitle];
  id v4 = +[CMXmlUtils copyHeadElementWithTitle:v3];

  double v5 = +[OIXMLElement elementWithType:12];
  id v6 = +[OIXMLAttribute attributeWithName:@"http-equiv" stringValue:@"Content-Type"];
  [v5 addAttribute:v6];

  id v7 = +[OIXMLAttribute attributeWithName:@"content" stringValue:@"text/html charset=utf-8"];;
  [v5 addAttribute:v7];

  [v4 addChild:v5];
  id v8 = (void *)MEMORY[0x263EFF8F8];
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 pathForResource:@"TabViewPhone" ofType:@"js"];
  id v11 = [v8 dataWithContentsOfFile:v10];

  int v12 = [(CMArchiveManager *)self->super.super.mArchiver addResource:v11 withName:@"Tabs.js" type:9];
  int v13 = +[OIXMLElement elementWithType:15];
  id v14 = +[OIXMLAttribute attributeWithName:@"src" stringValue:v12];
  [v13 addAttribute:v14];

  v15 = +[OIXMLAttribute attributeWithName:@"charset" stringValue:@"utf-8"];
  [v13 addAttribute:v15];

  [v4 addChild:v13];
  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v17 = [v16 pathForResource:@"TabViewPurple" ofType:@"css"];

  v18 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithContentsOfFile:v17 encoding:4 error:0];
  uint64_t v19 = [v18 dataUsingEncoding:4];
  [(EMWorkbookMapper *)self mapStylesheetData:v19 name:@"Tabs.css" atElement:v4];

  return v4;
}

- (id)tabTitleDrawingAttributes
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = *MEMORY[0x263F1D1E0];
  v11[0] = @"Arial";
  v2 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  uint64_t v3 = [MEMORY[0x263F1C660] fontDescriptorWithFontAttributes:v2];
  id v4 = objc_msgSend(v3, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v3, "symbolicTraits") | 2);

  double v5 = [MEMORY[0x263F1C658] fontWithDescriptor:v4 size:18.0];
  if (!v5)
  {
    double v5 = [MEMORY[0x263F1C658] boldSystemFontOfSize:18.0];
  }
  uint64_t v8 = *MEMORY[0x263F1C238];
  id v9 = v5;
  id v6 = [NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  return v6;
}

- (void)_pushTabForSheet:(id)a3 atIndex:(unint64_t)a4
{
  id v25 = a3;
  id v6 = [v25 name];
  id v7 = [v6 string];

  uint64_t v8 = +[OIXMLElement elementWithType:3 stringValue:v7];
  id v9 = NSString;
  uint64_t v10 = [(NSMutableArray *)self->mSheetURLs objectAtIndex:a4];
  id v11 = [v9 stringWithFormat:@"javascript:SelectSheet(%lu, '%@')", a4, v10];
  int v12 = +[OIXMLAttribute attributeWithName:@"onclick" stringValue:v11];
  [v8 addAttribute:v12];

  int v13 = objc_msgSend(NSString, "stringWithFormat:", @"Tab%lu", a4);
  id v14 = +[OIXMLAttribute attributeWithName:@"id" stringValue:v13];
  [v8 addAttribute:v14];

  v15 = &stru_26EBF24D8;
  if (!a4) {
    v15 = @" selected";
  }
  v16 = [NSString stringWithFormat:@"TabView%@", v15];
  id v17 = +[OIXMLAttribute attributeWithName:@"class" stringValue:v16];
  [v8 addAttribute:v17];

  v18 = [(EMWorkbookMapper *)self tabTitleDrawingAttributes];
  [v7 sizeWithAttributes:v18];
  double v20 = v19 + 40.0;
  objc_msgSend(NSString, "stringWithFormat:", @"position:absolute; overflow:hidden;  top:0; left:%d; width:%d; height:38;",
    (int)self->mTabPosition,
  uint64_t v21 = (int)(v19 + 40.0));
  objc_super v22 = +[OIXMLAttribute attributeWithName:@"style" stringValue:v21];
  [v8 addAttribute:v22];

  self->mTabPosition = v20 + self->mTabPosition;
  mArchiver = self->super.super.mArchiver;
  BOOL v24 = [v8 XMLString];
  [(CMArchiveManager *)mArchiver pushText:v24 toPath:0];
}

- (void)setElementCount:(unint64_t)a3
{
  self->mRealSheetCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSheetURLs, 0);
  objc_storeStrong((id *)&self->mTabBarURL, 0);
  objc_storeStrong((id *)&self->mTabBarDoc, 0);
  objc_storeStrong((id *)&self->mBodyElement, 0);
  objc_storeStrong((id *)&self->mXhtmlDoc, 0);
  objc_storeStrong((id *)&self->mFileName, 0);
  objc_storeStrong((id *)&self->mStyleSheetGuid, 0);
  objc_storeStrong((id *)&self->mResourceUrlProtocol, 0);
  objc_storeStrong((id *)&self->mResourceUrlPrefix, 0);
  objc_storeStrong((id *)&self->mWorksheetGuids, 0);
  objc_storeStrong((id *)&self->mWorksheetNames, 0);
  objc_storeStrong((id *)&self->mWorksheetUrls, 0);
}

@end