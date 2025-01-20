@interface PMPresentationMapper
- (CGSize)pageSizeForDevice;
- (CGSize)pageSizeForDeviceIncludingMargins:(BOOL)a3;
- (CGSize)slideSize;
- (PMPresentationMapper)initWithDocument:(id)a3 archiver:(id)a4;
- (id)blipAtIndex:(unsigned int)a3;
- (id)defaultStyleSheet;
- (id)documentTitle;
- (void)_pushEmptySlideWithMessage:(id)a3;
- (void)finishMappingWithState:(id)a3;
- (void)mapElement:(id)a3 atIndex:(unint64_t)a4 withState:(id)a5 isLastElement:(BOOL)a6;
- (void)setHtmlDocumentSizeInArchiver;
- (void)startMappingWithState:(id)a3;
@end

@implementation PMPresentationMapper

- (CGSize)slideSize
{
  v2 = [(CMMapper *)self document];
  [v2 slideSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)startMappingWithState:(id)a3
{
  id v30 = [(CMMapper *)self document];
  [(PMPresentationMapper *)self setHtmlDocumentSizeInArchiver];
  double v4 = +[CMXmlUtils copyXhtmlDocument];
  mXhtmlDoc = self->mXhtmlDoc;
  self->mXhtmlDoc = v4;

  double v6 = [(PMPresentationMapper *)self documentTitle];
  id v7 = +[CMXmlUtils copyHeadElementWithTitle:v6 deviceWidth:self->mWidth];

  double v8 = [(PMPresentationMapper *)self defaultStyleSheet];
  v9 = +[OIXMLElement elementWithType:17 stringValue:v8];

  v10 = +[OIXMLAttribute attributeWithName:0x26EC11B98 stringValue:0x26EC18D18];
  [v9 addAttribute:v10];

  [v7 addChild:v9];
  v11 = NSString;
  [v30 slideSize];
  double v13 = v12;
  [v30 slideSize];
  objc_msgSend(v11, "stringWithFormat:", @"div.slide, div.loading-slide { width: %d; height: %d;}",
    (int)v13,
  v15 = (int)v14);
  v16 = +[OIXMLElement elementWithType:17 stringValue:v15];

  v17 = +[OIXMLAttribute attributeWithName:0x26EC11B98 stringValue:0x26EC18D18];
  [v16 addAttribute:v17];

  [v7 addChild:v16];
  v18 = [(OIXMLDocument *)self->mXhtmlDoc rootElement];
  [v18 addChild:v7];

  v19 = +[OIXMLElement elementWithType:1];
  mBodyElement = self->mBodyElement;
  self->mBodyElement = v19;

  [(CMArchiveManager *)self->super.super.mArchiver commitDataAtPath:0];
  mArchiver = self->super.super.mArchiver;
  v22 = [(OIXMLDocument *)self->mXhtmlDoc openingTagString];
  [(CMArchiveManager *)mArchiver pushText:v22 toPath:0];

  v23 = self->super.super.mArchiver;
  v24 = [(OIXMLDocument *)self->mXhtmlDoc rootElement];
  v25 = [v24 openingTagString];
  [(CMArchiveManager *)v23 pushText:v25 toPath:0];

  v26 = self->super.super.mArchiver;
  v27 = [v7 XMLString];
  [(CMArchiveManager *)v26 pushText:v27 toPath:0];

  [(CMArchiveManager *)self->super.super.mArchiver pushCssToPath:0];
  v28 = self->super.super.mArchiver;
  v29 = [(OIXMLElement *)self->mBodyElement openingTagString];
  [(CMArchiveManager *)v28 pushText:v29 toPath:0];

  if (objc_opt_respondsToSelector()) {
    [(CMArchiveManager *)self->super.super.mArchiver setAutoCommit:0];
  }
  self->mNextCommit = 1;
  self->mCurrentSlide = 0;
  self->mHasPushedFirstSlides = 0;
}

- (void)setHtmlDocumentSizeInArchiver
{
  [(PMPresentationMapper *)self pageSizeForDeviceIncludingMargins:[(CMArchiveManager *)self->super.super.mArchiver noDecorations] ^ 1];
  double v4 = v3;
  [(CMArchiveManager *)self->super.super.mArchiver setHTMLWidth:(int)v5];
  mArchiver = self->super.super.mArchiver;
  [(CMArchiveManager *)mArchiver setHTMLHeight:(int)v4];
}

- (CGSize)pageSizeForDevice
{
  [(PMPresentationMapper *)self pageSizeForDeviceIncludingMargins:0];
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)documentTitle
{
  return 0;
}

- (void)mapElement:(id)a3 atIndex:(unint64_t)a4 withState:(id)a5 isLastElement:(BOOL)a6
{
  id v17 = a3;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v17;
    [(PMPresentationMapper *)self slideSize];
    double v12 = v11;
    [(PMPresentationMapper *)self slideSize];
    double v14 = -[PMSlideMapper initWithPDSlide:slideRect:parent:]([PMSlideMapper alloc], "initWithPDSlide:slideRect:parent:", v10, self, 0.0, 0.0, v12, v13);
    [(PMSlideMapper *)v14 mapAt:self->mBodyElement withState:v9];
    if (self->mCurrentSlide >= self->mNextCommit)
    {
      if (!a6)
      {
        v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v16 = [v15 localizedStringForKey:@"Loading…" value:&stru_26EBF24D8 table:@"Localizable"];
        [(PMPresentationMapper *)self _pushEmptySlideWithMessage:v16];
      }
      [(CMArchiveManager *)self->super.super.mArchiver commitDataAtPath:0];
      self->mNextCommit *= 3;
      if (!self->mHasPushedFirstSlides) {
        self->mHasPushedFirstSlides = 1;
      }
    }
    ++self->mCurrentSlide;
  }
}

- (id)blipAtIndex:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  double v4 = [(CMMapper *)self document];
  double v5 = [v4 blips];
  double v6 = [v5 blipAtIndex:v3];

  return v6;
}

- (void)finishMappingWithState:(id)a3
{
  if ([(CMArchiveManager *)self->super.super.mArchiver isCancelled])
  {
    double v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v5 = [v4 localizedStringForKey:@"This document is only partially previewed." value:&stru_26EBF24D8 table:@"Localizable"];
    [(PMPresentationMapper *)self _pushEmptySlideWithMessage:v5];
  }
  mArchiver = self->super.super.mArchiver;
  id v7 = [(OIXMLElement *)self->mBodyElement closingTagString];
  [(CMArchiveManager *)mArchiver pushText:v7 toPath:0];

  double v8 = self->super.super.mArchiver;
  id v9 = [(OIXMLDocument *)self->mXhtmlDoc rootElement];
  id v10 = [v9 closingTagString];
  [(CMArchiveManager *)v8 pushText:v10 toPath:0];

  double v11 = self->super.super.mArchiver;
  double v12 = [(OIXMLDocument *)self->mXhtmlDoc closingTagString];
  [(CMArchiveManager *)v11 pushText:v12 toPath:0];

  [(CMArchiveManager *)self->super.super.mArchiver commitDataAtPath:0];
  double v13 = self->super.super.mArchiver;
  [(CMArchiveManager *)v13 closeResourceAtPath:0];
}

- (id)defaultStyleSheet
{
  double v2 = [(CMMapper *)self archiver];
  int v3 = [v2 noDecorations];

  if (v3) {
    double v4 = @"@media screen { body { margin : 0 !important; } }\n";
  }
  else {
    double v4 = @"@media screen {\nbody {\nbackground: #ACB2BB;\n}\n}\n";
  }
  objc_msgSend(@"body\n{\n-webkit-text-size-adjust: none;\n}\n@media print {\ndiv.loading-slide {\ndisplay: none;\n}\n}\ndiv\n{\nmargin-top: 0;\nmargin-bottom: 0;\nfont-family:Arial, sans-serif;\n}\n p\n{\nmargin-top: 0;\nmargin-bottom: 0;\nword-wrap:break-word;\n}\ntable\n{\nborder-collapse: collapse;\nborder-color: black;\nborder-style: solid;\nborder-width: thin;\n}\ntd\n{\nword-wrap:break-word;\nfont-family:Arial;\nvertical-align:top;\nborder-style: solid;\nborder-width: thin;\n}\ndiv.slide\n{\nposition:relative;\n}div.slide, div.loading-slide\n{\noverflow:hidden;\npage-break-inside: avoid;\nmargin-top: 5px;\n}\ndiv.slide:first-of-type {\n  margin-top: 0;\n}\ndiv.loading-slide\n{\nposition: absolute;\nbackground:#BBBBBB;\n}\n",
    "stringByAppendingString:",
  double v5 = v4);
  return v5;
}

- (PMPresentationMapper)initWithDocument:(id)a3 archiver:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PMPresentationMapper;
  double v8 = [(CMDocumentMapper *)&v17 initWithDocument:v6 archiver:v7];
  id v9 = v8;
  if (v8)
  {
    [(PMPresentationMapper *)v8 slideSize];
    v9->mWidth = (int)(v10 + 0.0);
    double v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mSlideGuids = v9->mSlideGuids;
    v9->mSlideGuids = v11;

    double v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mSlideNames = v9->mSlideNames;
    v9->mSlideNames = v13;

    mResourceUrlPrefix = v9->mResourceUrlPrefix;
    v9->mResourceUrlPrefix = (NSString *)&stru_26EBF24D8;
  }
  return v9;
}

- (CGSize)pageSizeForDeviceIncludingMargins:(BOOL)a3
{
  BOOL v3 = a3;
  [(PMPresentationMapper *)self slideSize];
  if (v3)
  {
    double v5 = v5 + 5.0;
    double v4 = v4 + -3.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)_pushEmptySlideWithMessage:(id)a3
{
  id v18 = a3;
  double v4 = +[OIXMLElement elementWithType:3];
  double v5 = +[OIXMLAttribute attributeWithName:@"style" stringValue:@"position: relative; width:0; height: 0"];
  [v4 addAttribute:v5];

  id v6 = +[OIXMLElement elementWithType:3];
  [(PMPresentationMapper *)self slideSize];
  [(PMPresentationMapper *)self slideSize];
  id v7 = objc_alloc_init(CMStyle);
  -[CMStyle appendOriginInfoFromPoint:](v7, "appendOriginInfoFromPoint:", 0.0, 0.0);
  double v8 = +[OIXMLAttribute attributeWithName:@"class" stringValue:@"loading-slide"];
  [v6 addAttribute:v8];

  [(CMMapper *)self addStyleUsingGlobalCacheTo:v6 style:v7 embedStyle:1];
  [v4 addChild:v6];
  id v9 = objc_alloc_init(CMStyle);

  [(PMPresentationMapper *)self slideSize];
  double v11 = v10;
  [(PMPresentationMapper *)self slideSize];
  double v13 = v12;
  [(CMStyle *)v9 appendPropertyForName:0x26EC07038 stringValue:0x26EC0F218];
  -[CMStyle appendPositionInfoFromRect:](v9, "appendPositionInfoFromRect:", 0.0, v11 * 0.5 + -30.0, v13, 60.0);
  double v14 = [[CMStringProperty alloc] initWithString:0x26EC06A58];
  [(CMStyle *)v9 addProperty:v14 forKey:@"text-align"];
  [(CMStyle *)v9 appendPropertyForName:0x26EC08758 stringWithColons:@":Arial;"];
  [(CMStyle *)v9 appendPropertyForName:0x26EC08778 stringWithColons:@":48;"];
  v15 = +[OIXMLElement elementWithType:3 stringValue:v18];
  [(CMMapper *)self addStyleUsingGlobalCacheTo:v15 style:v9 embedStyle:1];
  [v6 addChild:v15];
  mArchiver = self->super.super.mArchiver;
  objc_super v17 = [v4 XMLString];
  [(CMArchiveManager *)mArchiver pushText:v17 toPath:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBodyElement, 0);
  objc_storeStrong((id *)&self->mXhtmlDoc, 0);
  objc_storeStrong((id *)&self->mResourceUrlProtocol, 0);
  objc_storeStrong((id *)&self->mResourceUrlPrefix, 0);
  objc_storeStrong((id *)&self->mSlideGuids, 0);
  objc_storeStrong((id *)&self->mSlideNames, 0);
}

@end