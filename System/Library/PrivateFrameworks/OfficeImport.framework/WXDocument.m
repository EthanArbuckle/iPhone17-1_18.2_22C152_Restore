@interface WXDocument
+ (id)documentFrom:(id)a3 reader:(id)a4 cancel:(id)a5 asThumbnail:(BOOL)a6;
+ (id)notePositionEnumMap;
+ (id)noteRestartEnumMap;
+ (void)readDocument:(id)a3 to:(id)a4 state:(id)a5;
+ (void)readDocumentSettings:(id)a3 to:(id)a4 state:(id)a5;
+ (void)readFontTable:(id)a3 to:(id)a4 state:(id)a5;
+ (void)readLists:(id)a3 to:(id)a4 state:(id)a5;
+ (void)readSources:(id)a3 to:(id)a4 state:(id)a5;
+ (void)readStyles:(id)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXDocument

+ (id)documentFrom:(id)a3 reader:(id)a4 cancel:(id)a5 asThumbnail:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = objc_alloc_init(WDDocument);
  [(OCDDocument *)v13 setReader:v11];
  if (v10 && v13)
  {
    id v38 = v10;
    id v39 = v12;
    id v36 = v11;
    v14 = objc_alloc_init(WXReadState);
    [(WXReadState *)v14 setDocument:v13];
    [(WXReadState *)v14 setCancelDelegate:v12];
    [(WXReadState *)v14 setIsThumbnail:v6];
    v15 = [v10 mainDocumentPart];
    v16 = [(OCPPackagePart *)v15 xmlReader];
    if (!v16) {
      +[TCMessageException raise:WXBadFormat];
    }
    if (xmlTextReaderRead(v16) != 1)
    {
      xmlFreeTextReader(v16);
      +[TCMessageException raise:WXBadFormat];
    }
    if (xmlTextReaderNodeType(v16) != 1
      || (v17 = xmlTextReaderConstLocalName(v16), !xmlStrEqual(v17, (const xmlChar *)"document")))
    {
      xmlFreeTextReader(v16);
      +[TCMessageException raise:WXBadFormat];
    }
    if (OCXIsStrictXmlFile(v16)) {
      [(WXReadState *)v14 setupNSForXMLFormat:1];
    }
    xmlFreeTextReader(v16);
    v18 = [(OCDDocument *)v13 theme];
    v35 = v18;
    v37 = OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v15, &v14->super.super, (objc_selector *)sel_OCXThemeRelationshipType);
    if (v37)
    {
      v19 = [(WXReadState *)v14 drawingState];
      +[OAXTheme readFromPackagePart:v37 toTheme:v18 state:v19];
    }
    [v18 validateTheme];
    v20 = [(WXReadState *)v14 drawingState];
    v21 = [v18 baseStyles];
    v22 = [v21 colorScheme];
    [v20 setColorScheme:v22];

    v23 = [(OCXState *)v14 OCXFontTableRelationshipType];
    v24 = [(OCPPackagePart *)v15 firstPartWithRelationshipOfType:v23];

    if (v24) {
      [a1 readFontTable:v24 to:v13 state:v14];
    }
    v25 = [(OCXState *)v14 OCXStylesRelationshipType];
    v26 = [(OCPPackagePart *)v15 firstPartWithRelationshipOfType:v25];

    if (v26)
    {
      [a1 readStyles:v26 to:v13 state:v14];
    }
    else
    {
      v27 = [(WDDocument *)v13 styleSheet];
      [v27 createDefaultStyles];
    }
    v28 = [(OCXState *)v14 OCXNumberingRelationshipType];
    v29 = [(OCPPackagePart *)v15 firstPartWithRelationshipOfType:v28];

    if (v29) {
      [a1 readLists:v29 to:v13 state:v14];
    }
    v30 = OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v15, &v14->super.super, (objc_selector *)sel_OCXCustomXmlRelationshipType);
    if (v30) {
      [a1 readSources:v30 to:v13 state:v14];
    }
    v31 = [(OCXState *)v14 OCXSettingsRelationshipType];
    v32 = [(OCPPackagePart *)v15 firstPartWithRelationshipOfType:v31];

    if (v32) {
      +[WXDocument readDocumentSettings:v32 to:v13 state:v14];
    }
    [(WXReadState *)v14 setDocumentPart:v15];
    [a1 readDocument:v15 to:v13 state:v14];
    v33 = [(OCDDocument *)v13 summary];
    +[OCXSummary readSummary:v33 package:v38];

    id v10 = v38;
    id v12 = v39;
    id v11 = v36;
  }

  return v13;
}

+ (void)readDocumentSettings:(id)a3 to:(id)a4 state:(id)a5
{
  id v92 = a4;
  v7 = (WXReadState *)a5;
  v8 = (_xmlDoc *)[a3 xmlDocument];
  if (v8)
  {
    v9 = OCXGetRootElement(v8);
    if (v9)
    {
      BOOL v96 = 0;
      v91 = v9;
      if (wmxmlGetBoolOnlyProperty(v9, "evenAndOddHeaders", (const xmlChar *)"val", &v96, v7)) {
        [v92 setEvenAndOddHeaders:v96];
      }
      id v10 = [(WXReadState *)v7 WXMainNamespace];
      BOOL v11 = OCXFindChild(v91, v10, "mirrorMargins") != 0;

      [v92 setMirrorMargins:v11];
      id v12 = [(WXReadState *)v7 WXMainNamespace];
      LODWORD(v11) = CXOptionalBoolAttribute(v91, v12, (xmlChar *)"bordersDoNotSurroundHeader", &v96);

      if (v11) {
        [v92 setBorderSurroundHeader:!v96];
      }
      v13 = [(WXReadState *)v7 WXMainNamespace];
      BOOL v14 = CXOptionalBoolAttribute(v91, v13, (xmlChar *)"bordersDoNotSurroundFooter", &v96);

      if (v14) {
        [v92 setBorderSurroundFooter:!v96];
      }
      v15 = [(WXReadState *)v7 WXMainNamespace];
      uint64_t v16 = OCXFindChild(v91, v15, "autoHyphenation");

      if (v16) {
        [v92 setAutoHyphenate:1];
      }
      v17 = [(WXReadState *)v7 WXMainNamespace];
      objc_msgSend(v92, "setBookFold:", OCXFindChild(v91, v17, "bookFoldPrinting") != 0);

      v18 = [(WXReadState *)v7 WXMainNamespace];
      BOOL v19 = OCXFindChild(v91, v18, "gutterAtTop") != 0;

      [v92 setGutterPosition:v19];
      v20 = [(WXReadState *)v7 WXMainNamespace];
      v21 = (_xmlNode *)OCXFindChild(v91, v20, "defaultTabStop");

      v22 = [(WXReadState *)v7 WXMainNamespace];
      LOWORD(v21) = CXDefaultLongAttribute(v21, v22, (xmlChar *)"val", 0, 14);

      [v92 setDefaultTabWidth:(unsigned __int16)v21];
      v23 = [(WXReadState *)v7 WXMainNamespace];
      uint64_t v24 = OCXFindChild(v91, v23, "strictFirstAndLastChars");

      if (v24) {
        [v92 setKinsokuStrict:1];
      }
      v25 = [(WXReadState *)v7 WXMainNamespace];
      v26 = (_xmlNode *)OCXFindChild(v91, v25, "noLineBreaksBefore");

      if (v26)
      {
        v27 = [(WXReadState *)v7 WXMainNamespace];
        v28 = CXRequiredStringAttribute(v26, v27, (xmlChar *)"val");

        [v92 setKinsokuAltBreakBefore:v28];
      }
      v29 = [(WXReadState *)v7 WXMainNamespace];
      v30 = (_xmlNode *)OCXFindChild(v91, v29, "noLineBreaksAfter");

      if (v30)
      {
        v31 = [(WXReadState *)v7 WXMainNamespace];
        v32 = CXRequiredStringAttribute(v30, v31, (xmlChar *)"val");

        [v92 setKinsokuAltBreakAfter:v32];
      }
      v33 = [(WXReadState *)v7 WXMainNamespace];
      v34 = (_xmlNode *)OCXFindChild(v91, v33, "revisionView");

      if (v34)
      {
        v35 = [(WXReadState *)v7 WXMainNamespace];
        uint64_t v36 = CXDefaultBoolAttribute(v34, v35, (xmlChar *)"comments", 1);

        v37 = [(WXReadState *)v7 WXMainNamespace];
        uint64_t v38 = CXDefaultBoolAttribute(v34, v37, (xmlChar *)"insDel", 1);

        id v39 = [(WXReadState *)v7 WXMainNamespace];
        uint64_t v40 = CXDefaultBoolAttribute(v34, v39, (xmlChar *)"formatting", 1);

        v41 = [(WXReadState *)v7 WXMainNamespace];
        uint64_t v42 = CXDefaultBoolAttribute(v34, v41, (xmlChar *)"markup", 1);
      }
      else
      {
        uint64_t v36 = 1;
        uint64_t v42 = 1;
        uint64_t v38 = 1;
        uint64_t v40 = 1;
      }
      [v92 setShowComments:v36];
      [v92 setShowMarkup:v42];
      [v92 setShowInsertionsAndDeletions:v38];
      [v92 setShowFormatting:v40];
      if (wmxmlGetBoolOnlyProperty(v91, "view", (const xmlChar *)"val", &v96, v7)) {
        [v92 setShowOutline:v96];
      }
      v43 = [(WXReadState *)v7 WXMainNamespace];
      uint64_t v44 = OCXFindChild(v91, v43, "trackRevisions");

      [v92 setTrackChanges:v44 != 0];
      v45 = [(WXReadState *)v7 WXMainNamespace];
      v46 = (_xmlNode *)OCXFindChild(v91, v45, "compat");

      if (v46)
      {
        v47 = [(WXReadState *)v7 WXMainNamespace];
        uint64_t v48 = OCXFindChild(v46, v47, "noTabHangInd");

        if (v48) {
          [v92 setNoTabForHangingIndents:1];
        }
      }
      v49 = [(WXReadState *)v7 WXMainNamespace];
      v50 = (_xmlNode *)OCXFindChild(v91, v49, "footnotePr");

      if (v50)
      {
        unsigned int v95 = 0;
        v51 = +[WXCommon numberFormatEnumMap];
        int v52 = readEnumProperty<WDNumberFormat>(v50, "numFmt", (const xmlChar *)"val", v51, &v95, v7);

        if (v52) {
          uint64_t v53 = v95;
        }
        else {
          uint64_t v53 = 0;
        }
        [v92 setFootnoteNumberFormat:v53];
        if (v95 == 62)
        {
          v54 = +[WXCommon customNumberFormatEnumMap];
          int v55 = readEnumProperty<WDNumberFormat>(v50, "numFmt", (const xmlChar *)"format", v54, &v95, v7);

          if (v55) {
            [v92 setFootnoteNumberFormat:v95];
          }
        }
        unsigned int v94 = 0;
        v56 = [a1 noteRestartEnumMap];
        int v57 = readEnumProperty<WDNoteRestart>(v50, "numRestart", (const xmlChar *)"val", v56, &v94, v7);

        uint64_t v58 = v57 ? v94 : 0;
        [v92 setFootnoteRestart:v58];
        unsigned int v93 = 0;
        v59 = [a1 notePositionEnumMap];
        int v60 = readEnumProperty<WDNotePosition>(v50, "pos", (const xmlChar *)"val", v59, &v93, v7);

        uint64_t v61 = v60 ? v93 : 1;
        [v92 setFootnotePosition:v61];
        v62 = [(WXReadState *)v7 WXMainNamespace];
        v63 = (_xmlNode *)OCXFindChild(v91, v62, "numStart");

        v64 = [(WXReadState *)v7 WXMainNamespace];
        LOWORD(v63) = CXDefaultLongAttribute(v63, v64, (xmlChar *)"val", 1);

        [v92 setFootnoteNumberingStart:(unsigned __int16)v63];
        v65 = [(WXReadState *)v7 WXMainNamespace];
        Child = (_xmlNode *)OCXFindChild(v50, v65, "footnote");

        if (Child)
        {
          v67 = (void (**)(xmlChar *))MEMORY[0x263F8C880];
          do
          {
            Prop = xmlGetProp(Child, (const xmlChar *)"type");
            if (xmlStrEqual(Prop, (const xmlChar *)"separator"))
            {
              v69 = [v92 footnoteSeparator];
              +[WXText readFrom:Child baseStyle:0 to:v69 state:v7];
            }
            else if (xmlStrEqual(Prop, (const xmlChar *)"continuationSeparator"))
            {
              v69 = [v92 footnoteContinuationSeparator];
              +[WXText readFrom:Child baseStyle:0 to:v69 state:v7];
            }
            else
            {
              if (!xmlStrEqual(Prop, (const xmlChar *)"continuationNotice") && Prop) {
                goto LABEL_48;
              }
              v69 = [v92 footnoteContinuationNotice];
              +[WXText readFrom:Child baseStyle:0 to:v69 state:v7];
            }

LABEL_48:
            (*v67)(Prop);
            v70 = [(WXReadState *)v7 WXMainNamespace];
            Child = OCXFindNextChild(Child, v70, (xmlChar *)"footnote");
          }
          while (Child);
        }
      }
      v71 = [(WXReadState *)v7 WXMainNamespace];
      v72 = (_xmlNode *)OCXFindChild(v91, v71, "endnotePr");

      if (v72)
      {
        unsigned int v95 = 0;
        v73 = +[WXCommon numberFormatEnumMap];
        int v74 = readEnumProperty<WDNumberFormat>(v72, "numFmt", (const xmlChar *)"val", v73, &v95, v7);

        if (v74) {
          uint64_t v75 = v95;
        }
        else {
          uint64_t v75 = 0;
        }
        [v92 setEndnoteNumberFormat:v75];
        if (v95 == 62)
        {
          v76 = +[WXCommon customNumberFormatEnumMap];
          int v77 = readEnumProperty<WDNumberFormat>(v72, "numFmt", (const xmlChar *)"format", v76, &v95, v7);

          if (v77) {
            [v92 setFootnoteNumberFormat:v95];
          }
        }
        unsigned int v94 = 0;
        v78 = [a1 noteRestartEnumMap];
        int v79 = readEnumProperty<WDNoteRestart>(v72, "numRestart", (const xmlChar *)"val", v78, &v94, v7);

        uint64_t v80 = v79 ? v94 : 0;
        [v92 setEndnoteRestart:v80];
        unsigned int v93 = 0;
        v81 = [a1 notePositionEnumMap];
        int v82 = readEnumProperty<WDNotePosition>(v72, "pos", (const xmlChar *)"val", v81, &v93, v7);

        uint64_t v83 = v82 ? v93 : 3;
        [v92 setEndnotePosition:v83];
        v84 = [(WXReadState *)v7 WXMainNamespace];
        v85 = (_xmlNode *)OCXFindChild(v72, v84, "endnote");

        if (v85)
        {
          v86 = (void (**)(xmlChar *))MEMORY[0x263F8C880];
          do
          {
            v87 = xmlGetProp(v85, (const xmlChar *)"type");
            if (xmlStrEqual(v87, (const xmlChar *)"separator"))
            {
              v88 = [v92 endnoteSeparator];
              +[WXText readFrom:v85 baseStyle:0 to:v88 state:v7];
            }
            else if (xmlStrEqual(v87, (const xmlChar *)"continuationSeparator"))
            {
              v88 = [v92 endnoteContinuationSeparator];
              +[WXText readFrom:v85 baseStyle:0 to:v88 state:v7];
            }
            else
            {
              if (!xmlStrEqual(v87, (const xmlChar *)"continuationNotice") && v87) {
                goto LABEL_72;
              }
              v88 = [v92 endnoteContinuationNotice];
              +[WXText readFrom:v85 baseStyle:0 to:v88 state:v7];
            }

LABEL_72:
            (*v86)(v87);
            v89 = [(WXReadState *)v7 WXMainNamespace];
            v85 = OCXFindNextChild(v85, v89, (xmlChar *)"endnote");
          }
          while (v85);
        }
      }
    }
  }
}

+ (id)noteRestartEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_33, 0, &dword_238A75000);
  }
  if (+[WXDocument noteRestartEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXDocument noteRestartEnumMap]::onceToken, &__block_literal_global_83);
  }
  v2 = (void *)+[WXDocument noteRestartEnumMap]::sNoteRestartEnumMap;
  return v2;
}

void __32__WXDocument_noteRestartEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXDocument noteRestartEnumMap]::sNoteRestartEnumStructs count:3 caseSensitive:1];
  v1 = (void *)+[WXDocument noteRestartEnumMap]::sNoteRestartEnumMap;
  +[WXDocument noteRestartEnumMap]::sNoteRestartEnumMap = (uint64_t)v0;
}

+ (id)notePositionEnumMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_14_0, 0, &dword_238A75000);
  }
  if (+[WXDocument notePositionEnumMap]::onceToken != -1) {
    dispatch_once(&+[WXDocument notePositionEnumMap]::onceToken, &__block_literal_global_16);
  }
  v2 = (void *)+[WXDocument notePositionEnumMap]::sNotePositionEnumMap;
  return v2;
}

void __33__WXDocument_notePositionEnumMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[WXDocument notePositionEnumMap]::sNotePositionEnumStructs count:2 caseSensitive:1];
  v1 = (void *)+[WXDocument notePositionEnumMap]::sNotePositionEnumMap;
  +[WXDocument notePositionEnumMap]::sNotePositionEnumMap = (uint64_t)v0;
}

+ (void)readFontTable:(id)a3 to:(id)a4 state:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  v8 = (_xmlDoc *)[a3 xmlDocument];
  if (v8)
  {
    xmlNodePtr v9 = OCXGetRootElement(v8);
    id v10 = [v11 fontTable];
    +[WXFontTable readFrom:v9 to:v10 state:v7];
  }
}

+ (void)readStyles:(id)a3 to:(id)a4 state:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  v8 = (_xmlDoc *)[a3 xmlDocument];
  if (v8)
  {
    xmlNodePtr v9 = OCXGetRootElement(v8);
    id v10 = [v11 styleSheet];
    +[WXStyleSheet readFrom:v9 to:v10 state:v7];
  }
}

+ (void)readLists:(id)a3 to:(id)a4 state:(id)a5
{
  id v37 = a3;
  id v7 = a4;
  id v8 = a5;
  xmlNodePtr v9 = [v8 wxoavState];
  [v9 setPackagePart:v37];

  id v10 = [v8 drawingState];
  [v10 setPackagePart:v37];

  id v11 = (_xmlDoc *)[v37 xmlDocument];
  if (v11)
  {
    xmlNodePtr v36 = OCXGetRootElement(v11);
    if (v36)
    {
      id v12 = [v8 WXMainNamespace];
      Child = (_xmlNode *)OCXFindChild(v36, v12, "numPicBullet");

      if (Child)
      {
        BOOL v14 = [v7 imageBullets];
        v15 = [v7 imageBulletParagraph];
        do
        {
          objc_msgSend(v8, "WXMainNamespace", v36);
          uint64_t v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          if (CXCountChildren(Child, v16, (xmlChar *)"pict") == 1)
          {
          }
          else
          {
            v17 = [v8 WXMainNamespace];
            int v18 = CXCountChildren(Child, v17, (xmlChar *)"drawing");

            if (v18 != 1)
            {
              BOOL v19 = [NSString stringWithUTF8String:"+[WXDocument(Private) readLists:to:state:]"];
              v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Word/Xml/Mapper/WXDocument.mm"];
              +[OITSUAssertionHandler handleFailureInFunction:v19 file:v20 lineNumber:396 isFatal:0 description:"Unexpect number of office art image bullet elements."];

              +[OITSUAssertionHandler logBacktraceThrottled];
            }
          }
          v21 = [v8 WXMainNamespace];
          uint64_t v22 = OCXFindChild(Child, v21, "pict");

          if (v22
            || ([v8 WXMainNamespace],
                v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
                uint64_t v22 = OCXFindChild(Child, v23, "drawing"),
                v23,
                v22))
          {
            uint64_t v24 = [WDOfficeArt alloc];
            v25 = [v7 imageBulletParagraph];
            v26 = [(WDOfficeArt *)v24 initWithParagraph:v25];

            +[WXOfficeArt readFrom:v22 parentRElement:Child parentParagraph:v15 state:v8 to:v26];
            [v15 addRun:v26];
            [v14 addObject:v26];
          }
          else
          {
            v28 = [NSString stringWithUTF8String:"+[WXDocument(Private) readLists:to:state:]"];
            v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Word/Xml/Mapper/WXDocument.mm"];
            +[OITSUAssertionHandler handleFailureInFunction:v28 file:v29 lineNumber:403 isFatal:0 description:"WXDocument readLists: unable to find image bullet node"];

            +[OITSUAssertionHandler logBacktraceThrottled];
          }
          v27 = [v8 WXMainNamespace];
          Child = OCXFindNextChild(Child, v27, (xmlChar *)"numPicBullet");
        }
        while (Child);
      }
      v30 = objc_msgSend(v7, "listDefinitionTable", v36);
      +[WXListDefinitionTable readFrom:v36 to:v30 state:v8];

      v31 = [v7 listTable];
      +[WXListTable readFrom:v36 to:v31 state:v8];
    }
  }
  v32 = objc_msgSend(v8, "wxoavState", v36);
  [v32 setPackagePart:0];

  v33 = [v8 drawingState];
  [v33 setPackagePart:0];

  v34 = [v8 wxoavState];
  [v34 resetForNewDrawing];

  v35 = [v8 drawingState];
  [v35 resetForNewDrawing];
}

+ (void)readSources:(id)a3 to:(id)a4 state:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = (_xmlDoc *)[a3 xmlDocument];
  if (v8) {
    +[WXCitationTable readFrom:OCXGetRootElement(v8) to:v9 state:v7];
  }
}

+ (void)readDocument:(id)a3 to:(id)a4 state:(id)a5
{
  id v19 = a3;
  id v18 = a4;
  id v7 = a5;
  id v8 = (xmlTextReader *)[v19 xmlReader];
  if (!v8) {
    +[TCMessageException raise:WXBadFormat];
  }
  if (xmlTextReaderRead(v8) != 1)
  {
    xmlFreeTextReader(v8);
    +[TCMessageException raise:WXBadFormat];
  }
  if (xmlTextReaderNodeType(v8) != 1
    || (id v9 = xmlTextReaderConstLocalName(v8), !xmlStrEqual(v9, (const xmlChar *)"document")))
  {
    xmlFreeTextReader(v8);
    +[TCMessageException raise:WXBadFormat];
  }
  char v17 = 0;
  int v10 = xmlTextReaderDepth(v8) + 1;
  while (xmlTextReaderRead(v8) == 1)
  {
    int v11 = xmlTextReaderNodeType(v8);
    if (xmlTextReaderDepth(v8) == v10 && v11 == 1)
    {
      id v12 = xmlTextReaderConstLocalName(v8);
      if (xmlStrEqual(v12, (const xmlChar *)"body"))
      {
        char v17 = 1;
        +[WXText readFromStream:v8 state:v7];
      }
      else if (xmlStrEqual(v12, (const xmlChar *)"background"))
      {
        xmlNodePtr v13 = xmlTextReaderExpand(v8);
        if (!v13) {
          +[TCMessageException raise:WXBadFormat];
        }
        BOOL v14 = [v7 drawingState];
        v15 = +[OAXFill readFillFromXmlNode:v13 packagePart:v19 drawingState:v14];

        uint64_t v16 = objc_alloc_init(OADBackgroundProperties);
        [(OADBackgroundProperties *)v16 setFill:v15];
        [v18 setDocumentBackground:v16];
      }
    }
  }
  xmlFreeTextReader(v8);
  if ((v17 & 1) == 0) {
    +[TCMessageException raise:WXBadFormat];
  }
}

@end