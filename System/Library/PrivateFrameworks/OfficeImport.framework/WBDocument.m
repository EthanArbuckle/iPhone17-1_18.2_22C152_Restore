@interface WBDocument
+ (id)readFrom:(id)a3;
+ (void)readNoteSeparatorFrom:(id)a3 type:(int)a4 separator:(id)a5;
+ (void)readProperties:(id)a3 document:(id)a4;
+ (void)readSectionsFrom:(id)a3 document:(id)a4;
+ (void)readTextBoxesFrom:(id)a3;
+ (void)setTimeStamp:(WrdDocumentProperties *)a3;
+ (void)setupZIndices:(id)a3 document:(id)a4 escherType:(int)a5;
- (WBDocument)init;
- (id)applicationName;
@end

@implementation WBDocument

+ (id)readFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(WDDocument);
  if (v4)
  {
    v7 = v4;
    [v3 setTargetDocument:v4];
    [(OCDDocument *)v4 setReader:v3];
    v5 = [(WDDocument *)v4 fontTable];
    +[WBFontTable readFrom:v3 fontTable:v5];

    +[WBDocument readProperties:v3 document:v7];
    operator new();
  }

  return 0;
}

+ (void)readProperties:(id)a3 document:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[WBObjectFactory create:15];
  if (v7) {
  else
  }
    v8 = 0;
  uint64_t v9 = [v5 wrdReader];
  (*(void (**)(uint64_t, char *))(*(void *)v9 + 240))(v9, v8);
  [v6 setTrackChanges:(*(void *)(v8 + 148) >> 8) & 1];
  [v6 setShowRevisionMarksOnScreen:(*(void *)(v8 + 148) >> 19) & 1];
  [v6 setShowInsertionsAndDeletions:(*(void *)(v8 + 156) >> 39) & 1];
  [v6 setShowFormatting:(*(void *)(v8 + 156) >> 40) & 1];
  [v6 setShowMarkup:(*(void *)(v8 + 156) >> 37) & 1];
  [v6 setShowComments:(*(void *)(v8 + 156) >> 38) & 1];
  [v6 setMirrorMargins:(*(void *)(v8 + 148) >> 14) & 1];
  [v6 setBorderSurroundHeader:(*(void *)(v8 + 156) >> 23) & 1];
  [v6 setBorderSurroundFooter:(*(void *)(v8 + 156) >> 24) & 1];
  [v6 setDefaultTabWidth:*((unsigned __int16 *)v8 + 70)];
  [v6 setAutoHyphenate:(*(void *)(v8 + 148) >> 5) & 1];
  [v6 setEvenAndOddHeaders:*((_DWORD *)v8 + 37) & 1];
  [v6 setFootnotePosition:*((unsigned int *)v8 + 16)];
  [v6 setEndnotePosition:*((unsigned int *)v8 + 19)];
  [v6 setFootnoteNumberFormat:*((unsigned int *)v8 + 20)];
  [v6 setEndnoteNumberFormat:*((unsigned int *)v8 + 21)];
  [v6 setFootnoteRestart:*((unsigned int *)v8 + 17)];
  [v6 setEndnoteRestart:*((unsigned int *)v8 + 18)];
  [v6 setFootnoteNumberingStart:*((unsigned __int16 *)v8 + 73)];
  [v6 setGutterPosition:*((unsigned int *)v8 + 25)];
  [v6 setBookFold:(*(void *)(v8 + 156) >> 52) & 1];
  [v6 setNoTabForHangingIndents:(*(void *)(v8 + 148) >> 41) & 1];
  [v6 setZoomPercentage:*((__int16 *)v8 + 66)];
  [v6 setShowOutline:*((_DWORD *)v8 + 22) == 2];
  WrdDOPTypography::WrdDOPTypography((WrdDOPTypography *)&v22, *((const WrdDOPTypography **)v8 + 2));
  [v6 setKinsokuStrict:(v26 >> 3) & 1];
  if (v23 == 2)
  {
    v10 = [NSString stringWithCharacters:v25.var1 length:v25.var2];
    [v6 setKinsokuAltBreakAfter:v10];

    v11 = [NSString stringWithCharacters:v24.var1 length:v24.var2];
    [v6 setKinsokuAltBreakBefore:v11];
  }
  v12 = [v5 officeArtState];
  int v13 = [v12 useXmlBlobs];

  if (v13)
  {
    uint64_t v14 = *((void *)v8 + 29);
    uint64_t v15 = *((unsigned int *)v8 + 60);
    v16 = [v6 theme];
    v17 = [v5 officeArtState];
    v18 = [v17 xmlDrawingState];
    +[OAXTheme readFromThemeData:v14 themeDataSize:v15 toTheme:v16 xmlDrawingState:v18];

    xmlNodePtr v19 = CXGetRootElement(*((const unsigned __int8 **)v8 + 31), *((_DWORD *)v8 + 64));
    xmlNodePtr v20 = v19;
    if (v19)
    {
      if (xmlStrEqual(v19->name, (const xmlChar *)"clrMap"))
      {
        v21 = objc_alloc_init(OADColorMap);
        +[OAXColorMap readFromXmlNode:v20 toColorMap:v21];
        [v6 setColorMap:v21];
      }
      xmlFreeDoc(v20->doc);
    }
  }
  (*(void (**)(char *))(*(void *)v8 + 8))(v8);
  v22 = &unk_26EBE4B00;
  CsString::~CsString(&v25);
  CsString::~CsString(&v24);
}

+ (void)readSectionsFrom:(id)a3 document:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = 0;
  unsigned int v8 = 0;
  v27 = &v27;
  v28 = (uint64_t *)&v27;
  while (1)
  {
    uint64_t v29 = v7;
    uint64_t v9 = +[WBObjectFactory create:48];
    v10 = v9
    v10[2] = 0;
    v10[3] = v8;
    uint64_t v11 = [v5 wrdReader];
    (*(void (**)(uint64_t, _DWORD *))(*(void *)v11 + 200))(v11, v10);
    uint64_t v12 = v10[4];
    if (!v12) {
      break;
    }
    unint64_t v13 = v12 + v8;
    if (HIDWORD(v13)) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    else {
      unsigned int v8 = v13;
    }
    uint64_t v14 = operator new(0x18uLL);
    v14[1] = &v27;
    v14[2] = v10;
    uint64_t v15 = v27;
    *uint64_t v14 = v27;
    v15[1] = v14;
    v27 = v14;
    uint64_t v7 = v29 + 1;
  }
  (*(void (**)(_DWORD *))(*(void *)v10 + 8))(v10);
  +[TCProgressContext createStageWithSteps:(double)v8 takingSteps:1.0];
  v16 = v28;
  if (v28 != (uint64_t *)&v27)
  {
    char v17 = 0;
    uint64_t v18 = 0;
    while ((v17 & 1) != 0)
    {
      uint64_t v21 = v16[2];
      if (v21) {
        goto LABEL_17;
      }
LABEL_18:
      uint64_t v22 = *v16;
      int v23 = (uint64_t *)v16[1];
      *(void *)(v22 + 8) = v23;
      *(void *)v16[1] = v22;
      --v29;
      operator delete(v16);
      uint64_t v18 = (v18 + 1);
      v16 = v23;
      if (v23 == (uint64_t *)&v27) {
        goto LABEL_23;
      }
    }
    xmlNodePtr v19 = [v5 cancelDelegate];
    char v20 = [v19 isCancelled];

    uint64_t v21 = v16[2];
    if (v20)
    {
      char v17 = 1;
      if (!v21) {
        goto LABEL_18;
      }
    }
    else
    {
      CsString v24 = [v6 addSection];
      +[WBSection readFrom:v5 textRun:v21 document:v6 index:v18 section:v24];

      if (!v21) {
        goto LABEL_18;
      }
    }
LABEL_17:
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
    goto LABEL_18;
  }
  char v17 = 0;
LABEL_23:
  for (i = v28; i != (uint64_t *)&v27; i = (uint64_t *)i[1])
  {
    uint64_t v26 = i[2];
    if (v26) {
      (*(void (**)(uint64_t))(*(void *)v26 + 8))(v26);
    }
  }
  if (v17) {
    +[TCMessageException raiseUntaggedMessage:@"TCUserCancelled", 0];
  }
  +[TCProgressContext endStage];
  std::__list_imp<WrdSectionTextRun *>::clear(&v27);
}

+ (void)readTextBoxesFrom:(id)a3
{
  id v7 = a3;
  uint64_t v3 = [v7 textBoxCount];
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      id v5 = (void *)[v7 textBoxInfoAtIndex:i];
      +[WBTextBox readTextFrom:v7 to:v5 chain:v6];
    }
  }
}

+ (void)readNoteSeparatorFrom:(id)a3 type:(int)a4 separator:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = [v7 tableHeaders];
  if (((*(_DWORD *)(v9 + 16) - *(_DWORD *)(v9 + 8)) & 0x3FFFC) != 0)
  {
    v10[0] = &unk_26EBE4AC0;
    WrdCPTableHeaders::getTextRun(v9, v10, a4, 0);
    +[WBText readFrom:v7 text:v8 textRun:v10];
    [v8 removeLastCharacter:13];
  }
}

+ (void)setupZIndices:(id)a3 document:(id)a4 escherType:(int)a5
{
  id v10 = a3;
  uint64_t v5 = [v10 count];
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v7 = [v10 objectAtIndex:i];
      id v8 = [v7 clientData];
      uint64_t v9 = [v8 anchor];

      if (v9) {
        objc_msgSend(v9, "setZIndex:", i + objc_msgSend(v9, "zIndex"));
      }
    }
  }
}

- (WBDocument)init
{
  v3.receiver = self;
  v3.super_class = (Class)WBDocument;
  return [(WBDocument *)&v3 init];
}

- (id)applicationName
{
  return @"Word";
}

+ (void)setTimeStamp:(WrdDocumentProperties *)a3
{
  v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v5 = [MEMORY[0x263EFF910] date];
  id v9 = [v4 components:638 fromDate:v5];

  var5 = a3->var5;
  var6 = a3->var6;
  __int16 v8 = [v9 era];
  var5->var6 = v8 - 1900;
  var6->var6 = v8 - 1900;
  var5->var5 = [v9 month];
  var6->var5 = [v9 month];
  var5->var1 = [v9 weekday] - 1;
  var6->var1 = [v9 weekday] - 1;
  var5->var4 = [v9 day];
  var6->var4 = [v9 day];
  var5->var3 = [v9 hour];
  var6->var3 = [v9 hour];
  var5->var2 = [v9 minute];
  var6->var2 = [v9 minute];
}

@end