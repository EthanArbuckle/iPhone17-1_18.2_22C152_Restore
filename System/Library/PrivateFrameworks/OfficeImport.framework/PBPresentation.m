@interface PBPresentation
+ (id)drawingGroupHolderWithDocumentContainerHolder:(id)a3;
+ (void)addHeadersFootersToDocumentContainer:(id)a3 instance:(int)a4;
+ (void)processLayoutTypesFromDocument:(id)a3 masterLayoutMap:(id)a4 state:(id)a5;
+ (void)readCommentAuthorsFrom:(id)a3 state:(id)a4;
+ (void)readDefaultTextListStyle:(id)a3 fromDocumentContainer:(id)a4 state:(id)a5;
+ (void)readFrom:(void *)a3 to:(id)a4 cancel:(id)a5 asThumbnail:(BOOL)a6 delegate:(id)a7;
+ (void)readMasterAndLayouts:(id)a3 masterLayoutMap:(id)a4 state:(id)a5;
+ (void)readNotes:(id)a3 masterLayoutMap:(id)a4 slideIdMap:(id)a5 state:(id)a6 delegate:(id)a7;
+ (void)readSlideListWithInstance:(int)a3 documentContainerHolder:(id)a4 state:(id)a5 block:(id)a6;
+ (void)readSlides:(id)a3 masterLayoutMap:(id)a4 slideIdMap:(id)a5 state:(id)a6 isThumbnail:(BOOL)a7 delegate:(id)a8;
+ (void)readTextStyleFromNotesMaster:(id)a3 toNotesMaster:(id)a4 slideMaster:(id)a5 state:(id)a6;
+ (void)readTextStylesFromSlideMaster:(id)a3 toSlideMaster:(id)a4 state:(id)a5;
+ (void)readThemeFromSlideMaster:(id)a3 document:(id)a4 theme:(id)a5 colorMap:(id)a6 state:(id)a7;
+ (void)readXmlLayoutsFromSlideMaster:(id)a3 document:(id)a4 masterInfo:(id)a5 state:(id)a6;
+ (void)scanSlideListForLayoutTypes:(id)a3 slideListHolder:(id)a4 masterLayoutMap:(id)a5;
+ (void)setDefaultTextStyleWithEnvironmentHolder:(id)a3 state:(id)a4;
+ (void)setFontEntites:(id)a3 environmentHolder:(id)a4;
@end

@implementation PBPresentation

+ (void)readFrom:(void *)a3 to:(id)a4 cancel:(id)a5 asThumbnail:(BOOL)a6 delegate:(id)a7
{
  BOOL v46 = a6;
  id v49 = a4;
  id v11 = a5;
  id v48 = a7;
  v12 = [[PBPresentationReaderState alloc] initWithReader:a3 tgtPresentation:v49];
  [(PBPresentationReaderState *)v12 setCancelDelegate:v11];
  v13 = [[ESDRoot alloc] initWithPbState:v12];
  [(PBPresentationReaderState *)v12 setDocumentRoot:v13];
  v14 = [(ESDRoot *)v13 pbReferenceWithID:PptBinaryReader::getDocumentRef((PptBinaryReader *)a3)];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  TCVerifyInputMeetsCondition(isKindOfClass & 1);

  v16 = [v14 firstChildOfType:1010];
  objc_opt_class();
  char v17 = objc_opt_isKindOfClass();
  TCVerifyInputMeetsCondition(v17 & 1);
  [a1 setFontEntites:v12 environmentHolder:v16];
  [a1 setDefaultTextStyleWithEnvironmentHolder:v16 state:v12];
  v18 = [v14 firstChildOfType:1001];
  Atom = ESDAtomAccess<PptDocumentAtom>::extractAtom(v18, 1);

  +[PBHyperlink readHyperlinksWithPresentationState:v12];
  v47 = [v14 firstChildOfType:2000];
  objc_opt_class();
  char v20 = objc_opt_isKindOfClass();
  TCVerifyInputMeetsCondition(v20 & 1);
  objc_opt_class();
  +[PBProgTag readDocumentList:v47 state:v12];
  objc_msgSend(v49, "setSlideSize:", (double)(Atom[12] / 8), (double)(Atom[13] / 8));
  objc_msgSend(v49, "setNotesSize:", (double)(Atom[14] / 8), (double)(Atom[15] / 8));
  [v49 setIsCommentsVisible:*((unsigned char *)Atom + 82) != 0];
  v44 = [v14 firstChildOfType:1025];
  if (v44)
  {
    v21 = (const void *)[v44 eshObject];
    if (v21) {
    else
    }
      v22 = 0;
    TCVerifyInputMeetsCondition(v22 != 0);
    [v49 setIsLooping:*((unsigned __int8 *)v22 + 101)];
    [v49 setIsKiosk:v22[24] == 32];
  }
  v45 = [a1 drawingGroupHolderWithDocumentContainerHolder:v14];
  v23 = [(PBPresentationReaderState *)v12 officeArtState];
  +[OABDrawingGroup readBlipsFromDrawingGroup:v45 toDocument:v49 state:v23];

  v24 = [v16 firstChildOfType:4009];
  v25 = (char *)ESDAtomAccess<PptTextDefaultSpecialInfoAtom>::extractAtom(v24, 0);

  if (v25)
  {
    v26 = [v49 defaultTextStyle];
    v27 = [v26 defaultProperties];
    +[PBCharacterProperties readCharacterProperties:v27 specialInfo:v25 + 48 state:v12];
  }
  v28 = [(PBPresentationReaderState *)v12 officeArtState];
  v43 = [v28 xmlDocumentState];
  v29 = [(PBPresentationReaderState *)v12 officeArtState];
  int v30 = [v29 useXmlBlobs];

  if (v30)
  {
    v31 = [v14 firstChildOfType:1064];
    v32 = (OcBinaryData *)ESDAtomAccess<PptRoundTripCustomTableStylesAtom>::extractAtom(v31, 0);

    if (v32)
    {
      v33 = OCPNewZipPackageWithOcBinaryData(v32 + 1);
      v34 = v33;
      if (v33)
      {
        id v42 = v11;
        v41 = [v33 partByRelationshipType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/tableStyles"];
        v35 = [v43 tableStyleCache];
        v36 = [v43 officeArtState];
        +[OAXTable cacheTableStylesInPart:v41 cache:v35 drawingState:v36];

        id v11 = v42;
      }
    }
  }
  v37 = +[PBMasterLayoutMap masterLayoutMap];
  [a1 readMasterAndLayouts:v14 masterLayoutMap:v37 state:v12];
  id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [a1 readSlides:v14 masterLayoutMap:v37 slideIdMap:v38 state:v12 isThumbnail:v46 delegate:v48];
  if (!v46) {
    [a1 readNotes:v14 masterLayoutMap:v37 slideIdMap:v38 state:v12 delegate:v48];
  }
  v39 = [v49 summary];
  if (a3) {
    v40 = (char *)a3 + 8;
  }
  else {
    v40 = 0;
  }
  +[OCBSummary readSummary:v39 reader:v40];

  if (v48 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v48 readerDidEndDocument:v49];
  }
}

+ (void)setFontEntites:(id)a3 environmentHolder:(id)a4
{
  id v15 = a3;
  id v5 = a4;
  v6 = [v5 firstChildOfType:2005];
  if (v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    TCVerifyInputMeetsCondition(isKindOfClass & 1);
    uint64_t v8 = [v6 childCount];
    if (v8)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        v10 = [v6 childAt:i];
        uint64_t v11 = [v10 eshObject];
        if ((*(unsigned int (**)(uint64_t))(*(void *)v11 + 16))(v11) == 4023)
        {
          v12 = (const void *)[v10 eshObject];
          if (v12) {
          else
          }
            v13 = 0;
          v14 = [NSString stringWithCsString:v13 + 48];
          [v15 addFontEntity:v14 charSet:v13[73] type:v13[72] & 3 family:v13[72] & 0xF0];
        }
      }
    }
  }
}

+ (void)setDefaultTextStyleWithEnvironmentHolder:(id)a3 state:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  uint64_t v6 = [v14 indexOfFirstChildOfType:4003 afterIndex:0];
  while (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = [v14 childAt:v6];
    TCVerifyInputMeetsCondition(v7 != 0);
    uint64_t v8 = (const void *)[v7 eshObject];
    if (v8)
    {
      if (v9)
      {
        v10 = v9;
        uint64_t Instance = EshRecord::getInstance(v9);
        TCVerifyInputMeetsCondition(Instance < 9);
        *(void *)[v5 docSourceMasterStyleInfoOfType:Instance] = v10;
        if (Instance == 4)
        {
          v12 = [v5 tgtPresentation];
          v13 = [v12 defaultTextStyle];
          +[PBMasterStyle readMasterStyleAtom:v10 baseMasterStyleAtom:0 masterBulletStyleAtom:0 textListStyle:v13 state:v5];
        }
      }
    }
    uint64_t v6 = [v14 indexOfFirstChildOfType:4003 afterIndex:v6];
  }
}

+ (id)drawingGroupHolderWithDocumentContainerHolder:(id)a3
{
  v3 = [a3 firstChildOfType:1035];
  objc_opt_class();
  uint64_t v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 childCount] == 1;
  TCVerifyInputMeetsCondition(v4);
  id v5 = [v3 childAt:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  TCVerifyInputMeetsCondition(isKindOfClass & 1);

  return v5;
}

+ (void)readMasterAndLayouts:(id)a3 masterLayoutMap:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 tgtPresentation];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__PBPresentation_Private__readMasterAndLayouts_masterLayoutMap_state___block_invoke;
  v19[3] = &unk_264D684F8;
  id v12 = v11;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  id v14 = v9;
  id v22 = v14;
  id v24 = a1;
  id v15 = v8;
  id v23 = v15;
  [a1 readSlideListWithInstance:1 documentContainerHolder:v15 state:v13 block:v19];
  v16 = [v15 childOfType:4080 instance:0];
  if (v16)
  {
    char v17 = [v13 documentRoot];
    [a1 scanSlideListForLayoutTypes:v17 slideListHolder:v16 masterLayoutMap:v14];
  }
  [a1 readCommentAuthorsFrom:v15 state:v13];
  v18 = [v13 documentRoot];
  [a1 processLayoutTypesFromDocument:v18 masterLayoutMap:v14 state:v13];
}

+ (void)readDefaultTextListStyle:(id)a3 fromDocumentContainer:(id)a4 state:(id)a5
{
  id v27 = a3;
  id v7 = a4;
  id v8 = a5;
  id v24 = v7;
  v25 = [v7 firstChildOfType:1010];
  id v9 = [v25 firstChildOfType:4005];
  Atom = ESDAtomAccess<PptTextDefaultParagraphStyleAtom>::extractAtom(v9, 0);

  id v10 = [v25 firstChildOfType:4004];
  uint64_t v11 = ESDAtomAccess<PptTextDefaultCharacterStyleAtom>::extractAtom(v10, 0);

  id v12 = [v25 firstChildOfType:4009];
  id v13 = (char *)ESDAtomAccess<PptTextDefaultSpecialInfoAtom>::extractAtom(v12, 0);

  id v22 = [v24 firstChildOfType:2000];
  id v21 = +[PBProgTag binaryTagDataWithName:L"___PPT9" inProgTagsParent:v22];
  id v14 = [v21 firstChildOfType:4016];
  ESDAtomAccess<PptTextDefaultStyle9Atom>::extractAtom(v14, 0);

  id v23 = [v27 defaultProperties];
  if (v13) {
    +[PBCharacterProperties readCharacterProperties:v23 specialInfo:v13 + 48 state:v8];
  }
  id v15 = [v25 childOfType:4003 instance:4];
  v16 = ESDAtomAccess<PptTextMasterStyleAtom>::extractAtom(v15, 1);

  unsigned int v17 = v16[14] - v16[12];
  uint64_t v18 = (unsigned __int16)(v17 >> 3);
  if ((unsigned __int16)(v17 >> 3))
  {
    uint64_t v19 = 0;
    do
    {
      id v20 = [v27 propertiesForListLevel:v19];
      if (v13) {
        +[PBCharacterProperties readCharacterProperties:v20 specialInfo:v13 + 48 state:v8];
      }
      if (Atom) {
        operator new();
      }
      if (v11) {
        operator new();
      }

      ++v19;
    }
    while (v18 != v19);
  }
}

+ (void)scanSlideListForLayoutTypes:(id)a3 slideListHolder:(id)a4 masterLayoutMap:(id)a5
{
  id v17 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 childCount];
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      uint64_t v11 = [v7 childAt:i];
      id v12 = (const void *)[v11 eshObject];
      if ((*(unsigned int (**)(const void *))(*(void *)v12 + 16))(v12) == 1011
        && (*(unsigned int (**)(const void *))(*(void *)v12 + 80))(v12))
      {
        id v13 = (ESDContainer *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        TCVerifyInputMeetsCondition(isKindOfClass & 1);
        id v15 = [v8 masterInfoForSlideHolder:v13];
        v16 = [v15 slideLayoutForSlideHolder:v13];
        if (!v16) {
          [v15 cacheTargetLayoutType:pdSlideLayoutTypeForPptSlideHolder(v13)];
        }
      }
    }
  }
}

+ (void)processLayoutTypesFromDocument:(id)a3 masterLayoutMap:(id)a4 state:(id)a5
{
  id v147 = a3;
  id v149 = a4;
  id v164 = a5;
  if ((+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultBoundsInitialized & 1) == 0)
  {
    +[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultBoundsInitialized = 1;
    TCRectMakeWithSides();
    *(void *)+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds = v7;
    *(void *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[8] = v8;
    *(void *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[16] = v9;
    *(void *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[24] = v10;
    TCRectMakeWithSides();
    *(void *)ymmword_2689BC828 = v11;
    *(void *)&ymmword_2689BC828[8] = v12;
    *(void *)&ymmword_2689BC828[16] = v13;
    *(void *)&ymmword_2689BC828[24] = v14;
    TCRectMakeWithSides();
    *(void *)ymmword_2689BC848 = v15;
    *(void *)&ymmword_2689BC848[8] = v16;
    *(void *)&ymmword_2689BC848[16] = v17;
    *(void *)&ymmword_2689BC848[24] = v18;
    TCRectMakeWithSides();
    *(void *)ymmword_2689BC868 = v19;
    *(void *)&ymmword_2689BC868[8] = v20;
    *(void *)&ymmword_2689BC868[16] = v21;
    *(void *)&ymmword_2689BC868[24] = v22;
    TCRectMakeWithSides();
    *(void *)ymmword_2689BC888 = v23;
    *(void *)&ymmword_2689BC888[8] = v24;
    *(void *)&ymmword_2689BC888[16] = v25;
    *(void *)&ymmword_2689BC888[24] = v26;
    TCRectMakeWithSides();
    qword_2689BC8C8 = v27;
    unk_2689BC8D0 = v28;
    qword_2689BC8D8 = v29;
    unk_2689BC8E0 = v30;
    TCRectMakeWithSides();
    qword_2689BC8E8 = v31;
    unk_2689BC8F0 = v32;
    qword_2689BC8F8 = v33;
    unk_2689BC900 = v34;
    TCRectMakeWithSides();
    qword_2689BC908 = v35;
    unk_2689BC910 = v36;
    qword_2689BC918 = v37;
    unk_2689BC920 = v38;
    TCRectMakeWithSides();
    qword_2689BC928 = v39;
    unk_2689BC930 = v40;
    qword_2689BC938 = v41;
    unk_2689BC940 = v42;
    TCRectMakeWithSides();
    qword_2689BC948 = v43;
    unk_2689BC950 = v44;
    qword_2689BC958 = v45;
    unk_2689BC960 = v46;
    TCRectMakeWithSides();
    qword_2689BC968 = v47;
    unk_2689BC970 = v48;
    qword_2689BC978 = v49;
    unk_2689BC980 = v50;
    TCRectMakeWithSides();
    *(void *)ymmword_2689BC988 = v51;
    *(void *)&ymmword_2689BC988[8] = v52;
    *(void *)&ymmword_2689BC988[16] = v53;
    *(void *)&ymmword_2689BC988[24] = v54;
    TCRectMakeWithSides();
    *(void *)ymmword_2689BC9A8 = v55;
    *(void *)&ymmword_2689BC9A8[8] = v56;
    *(void *)&ymmword_2689BC9A8[16] = v57;
    *(void *)&ymmword_2689BC9A8[24] = v58;
    *(CGRect *)ymmword_2689BC7A8 = CGRectUnion(*(CGRect *)ymmword_2689BC828, *(CGRect *)ymmword_2689BC848);
    *(CGRect *)ymmword_2689BC7C8 = CGRectUnion(*(CGRect *)ymmword_2689BC868, *(CGRect *)ymmword_2689BC888);
    *(CGRect *)ymmword_2689BC7E8 = CGRectUnion(*(CGRect *)ymmword_2689BC828, *(CGRect *)ymmword_2689BC868);
    *(CGRect *)ymmword_2689BC808 = CGRectUnion(*(CGRect *)ymmword_2689BC848, *(CGRect *)ymmword_2689BC888);
    *(CGRect *)ymmword_2689BC788 = CGRectUnion(*(CGRect *)ymmword_2689BC7E8, *(CGRect *)ymmword_2689BC808);
    *(CGRect *)ymmword_2689BC8A8 = CGRectUnion(*(CGRect *)+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds, *(CGRect *)ymmword_2689BC788);
    *(CGRect *)ymmword_2689BC9C8 = CGRectUnion(*(CGRect *)ymmword_2689BC988, *(CGRect *)ymmword_2689BC9A8);
  }
  v59 = (double *)MEMORY[0x263F00148];
  double v161 = *(double *)(MEMORY[0x263F00148] + 8);
  double v162 = *MEMORY[0x263F00148];
  CGFloat v187 = *(double *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[8];
  CGFloat v188 = *(double *)+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds;
  CGFloat v185 = *(double *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[24];
  CGFloat v186 = *(double *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[16];
  CGFloat v177 = *(double *)&ymmword_2689BC788[8];
  CGFloat v178 = *(double *)ymmword_2689BC788;
  CGFloat v175 = *(double *)&ymmword_2689BC788[24];
  CGFloat v176 = *(double *)&ymmword_2689BC788[16];
  CGRect v211 = CGRectUnion(*(CGRect *)+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds, *(CGRect *)ymmword_2689BC788);
  CGFloat y = v211.origin.y;
  CGFloat x = v211.origin.x;
  CGFloat height = v211.size.height;
  CGFloat width = v211.size.width;
  v60 = [v164 tgtPresentation];
  [v60 slideSize];
  double v62 = v61;
  double v64 = v63;

  memset(&v205, 0, sizeof(v205));
  CGAffineTransformMakeScale(&v205, v62 / 5760.0, v64 / 4320.0);
  double v159 = v59[1];
  double v160 = *v59;
  v148 = [v149 allMasterIds];
  uint64_t v65 = [v148 count];
  uint64_t v66 = v65;
  if (v65)
  {
    uint64_t v67 = 0;
    double v183 = v64;
    double v184 = v62;
    uint64_t v154 = v65;
    do
    {
      uint64_t v150 = v67;
      v68 = [v148 objectAtIndex:v147];
      uint64_t v69 = [v68 intValue];

      v153 = [v149 masterInfoForMasterId:v69];
      v174 = [v153 slideMaster];
      v165 = [v164 masterStyles:v174];
      CGAffineTransform v204 = v205;
      v212.origin.CGFloat y = v187;
      v212.origin.CGFloat x = v188;
      v212.size.CGFloat height = v185;
      v212.size.CGFloat width = v186;
      CGRect v213 = CGRectApplyAffineTransform(v212, &v204);
      CGFloat v191 = v213.origin.y;
      CGFloat v192 = v213.origin.x;
      CGFloat v189 = v213.size.height;
      CGFloat v190 = v213.size.width;
      v70 = [v174 placeholderWithType:0 placeholderTypeIndex:0 overrideIndex:1];
      v152 = v70;
      if (v70)
      {
        v71 = [v70 drawableProperties];
        v72 = [v71 orientedBounds];
        [v72 bounds];
        CGFloat v191 = v74;
        CGFloat v192 = v73;
        CGFloat v189 = v76;
        CGFloat v190 = v75;
      }
      CGAffineTransform v203 = v205;
      v214.origin.CGFloat y = v177;
      v214.origin.CGFloat x = v178;
      v214.size.CGFloat height = v175;
      v214.size.CGFloat width = v176;
      CGRect v215 = CGRectApplyAffineTransform(v214, &v203);
      CGFloat v181 = v215.origin.y;
      CGFloat v182 = v215.origin.x;
      CGFloat v179 = v215.size.height;
      CGFloat v180 = v215.size.width;
      v77 = [v174 placeholderWithType:1 placeholderTypeIndex:0 overrideIndex:1];
      v151 = v77;
      if (v77)
      {
        v78 = [v77 drawableProperties];
        v79 = [v78 orientedBounds];
        [v79 bounds];
        CGFloat v181 = v81;
        CGFloat v182 = v80;
        CGFloat v179 = v83;
        CGFloat v180 = v82;
      }
      v216.origin.CGFloat y = v191;
      v216.origin.CGFloat x = v192;
      v216.size.CGFloat height = v189;
      v216.size.CGFloat width = v190;
      v228.origin.CGFloat y = v181;
      v228.origin.CGFloat x = v182;
      v228.size.CGFloat height = v179;
      v228.size.CGFloat width = v180;
      CGRect v217 = CGRectUnion(v216, v228);
      CGFloat v172 = v217.origin.y;
      CGFloat v173 = v217.origin.x;
      CGFloat v170 = v217.size.height;
      CGFloat v171 = v217.size.width;
      uint64_t v84 = [v174 slideLayoutCount];
      if (v84)
      {
        for (uint64_t i = 0; i != v84; ++i)
        {
          v86 = [v174 slideLayoutAtIndex:i];
          +[PBSlideMaster flattenPlaceholderTextStylesIntoLayout:v86 layoutType:0 masterStyleMap:v165];
        }
      }
      v163 = [v153 allTargetLayoutTypes];
      uint64_t v87 = [v163 count];
      uint64_t v88 = v87;
      if (v87)
      {
        uint64_t v89 = 0;
        uint64_t v155 = v87;
        do
        {
          v90 = [v163 objectAtIndex:v89];
          uint64_t v91 = [v90 intValue];

          v92 = [v174 slideLayoutOfType:v91];
          if (!v92)
          {
            v158 = [v174 addSlideLayout];
            [v158 setSlideLayoutType:v91];
            int v93 = v91 - 1;
            int v94 = 18;
            int v95 = 13;
            int v96 = 14;
            int v97 = 15;
            int v98 = 16;
            int v99 = 17;
            int v100 = 7;
            int v101 = 1;
            v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyLayoutBoundsArray;
            v103 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::title4BodiesLayoutBoundsArray;
            v104 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleOnlyLayoutBoundsArray;
            v105 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::emptyLayoutBoundsArray;
            v106 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyNextToBodyLayoutBoundsArray;
            v107 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyOverBodyLayoutBoundsArray;
            v108 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::verticalTitleBodyLayoutBoundsArray;
            v109 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::title2BodiesOverBodyLayoutBoundsArray;
            v110 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::largeBodyLayoutBoundsArray;
            v111 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::verticalTitleBodyOverBodyLayoutBoundsArray;
            switch((int)v91)
            {
              case 1:
              case 3:
                int v101 = 0;
                v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::centerTitleSubtitleLayoutBoundsArray;
                goto LABEL_17;
              case 2:
              case 10:
              case 12:
              case 16:
              case 18:
              case 31:
                goto LABEL_17;
              case 4:
              case 13:
              case 14:
              case 15:
              case 19:
              case 20:
              case 22:
              case 24:
              case 30:
              case 32:
              case 33:
                int v101 = 8;
                v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyNextToBodyLayoutBoundsArray;
                goto LABEL_17;
              case 5:
LABEL_23:
                v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                goto LABEL_54;
              case 6:
LABEL_24:
                v103 = v104;
                int v96 = v100;
                v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                goto LABEL_54;
              case 7:
LABEL_25:
                v103 = v105;
                int v96 = v98;
                v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                goto LABEL_54;
              case 8:
LABEL_26:
                v103 = v106;
                int v96 = v91;
LABEL_27:
                v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__26_;
                goto LABEL_54;
              case 9:
LABEL_28:
                v103 = v107;
                int v96 = v91;
                v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                goto LABEL_54;
              case 11:
LABEL_29:
                v103 = v108;
                int v96 = v99;
                v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                goto LABEL_54;
              case 17:
LABEL_30:
                v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__15_;
                goto LABEL_54;
              case 21:
LABEL_31:
                v103 = v109;
                int v96 = v95;
LABEL_32:
                v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__21_;
                goto LABEL_54;
              case 23:
              case 34:
                int v101 = 11;
                v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::title2BodiesNextToBodyLayoutBoundsArray;
                goto LABEL_17;
              case 25:
              case 29:
                int v101 = 10;
                v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyNextTo2BodiesLayoutBoundsArray;
                goto LABEL_17;
              case 26:
              case 28:
                int v101 = 9;
                v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyOverBodyLayoutBoundsArray;
                goto LABEL_17;
              case 27:
LABEL_33:
                v103 = v110;
                int v96 = v97;
                v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__25_;
                goto LABEL_54;
              case 35:
LABEL_34:
                v103 = v111;
                int v96 = v94;
                v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__33_;
                goto LABEL_54;
              default:
                v113 = objc_msgSend(NSString, "stringWithUTF8String:", "PptSlideLayoutType pptSlideLayoutTypeForPDSlideLayoutType(PDSlideLayoutType)", &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyLayoutBoundsArray, &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyOverBodyLayoutBoundsArray, &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::verticalTitleBodyLayoutBoundsArray, &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::title2BodiesOverBodyLayoutBoundsArray, &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::largeBodyLayoutBoundsArray);
                v114 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Binary/Mapper/PBPresentation.mm"];
                +[OITSUAssertionHandler handleFailureInFunction:v113 file:v114 lineNumber:545 isFatal:0 description:"Unknown slide layout type"];

                +[OITSUAssertionHandler logBacktraceThrottled];
                int v101 = 1;
                v102 = &+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::titleBodyLayoutBoundsArray;
LABEL_17:
                v103 = v102;
                int v96 = v101;
                v104 = v102;
                int v100 = v101;
                v105 = v102;
                int v98 = v101;
                v106 = v102;
                LODWORD(v91) = v101;
                v107 = v102;
                v108 = v102;
                int v99 = v101;
                v109 = v102;
                int v95 = v101;
                v110 = v102;
                int v97 = v101;
                v111 = v102;
                int v94 = v101;
                v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                switch(v93)
                {
                  case 0:
                    break;
                  case 1:
                    v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                    break;
                  case 2:
                  case 30:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__29_;
                    break;
                  case 3:
                    v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                    break;
                  case 4:
                    goto LABEL_23;
                  case 5:
                    goto LABEL_24;
                  case 6:
                    goto LABEL_25;
                  case 7:
                    goto LABEL_26;
                  case 8:
                    goto LABEL_28;
                  case 9:
                    v112 = &pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)::pptPlaceholderTypeArray;
                    break;
                  case 10:
                    goto LABEL_29;
                  case 11:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__10_;
                    break;
                  case 12:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__11_;
                    break;
                  case 13:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__12_;
                    break;
                  case 14:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__13_;
                    break;
                  case 15:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__14_;
                    break;
                  case 16:
                    goto LABEL_30;
                  case 17:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__16_;
                    break;
                  case 18:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__17_;
                    break;
                  case 19:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__18_;
                    break;
                  case 20:
                    goto LABEL_31;
                  case 21:
                  case 25:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__24_;
                    break;
                  case 22:
                    goto LABEL_32;
                  case 23:
                  case 27:
                    goto LABEL_27;
                  case 24:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__23_;
                    break;
                  case 26:
                    goto LABEL_33;
                  case 28:
                  case 33:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__32_;
                    break;
                  case 29:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__28_;
                    break;
                  case 31:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__30_;
                    break;
                  case 32:
                    v112 = &_ZZL43pptPlaceholderTypeArrayForPDSlideLayoutType17PDSlideLayoutTypeE23pptPlaceholderTypeArray__31_;
                    break;
                  case 34:
                    goto LABEL_34;
                  default:
                    v115 = [NSString stringWithUTF8String:"const PptPlaceholder *pptPlaceholderTypeArrayForPDSlideLayoutType(PDSlideLayoutType)"];
                    v116 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Binary/Mapper/PBPresentation.mm"];
                    +[OITSUAssertionHandler handleFailureInFunction:v115 file:v116 lineNumber:484 isFatal:0 description:"Unexpected PD layout type"];

                    +[OITSUAssertionHandler logBacktraceThrottled];
                    v112 = 0;
                    break;
                }
LABEL_54:
                id v193 = objc_alloc_init(MEMORY[0x263EFF980]);
                unsigned int v156 = v96;
                uint64_t v157 = v89;
                uint64_t v117 = *v112;
                int v118 = *v103;
                if (v117)
                {
                  uint64_t v119 = 0;
                  v120 = v103 + 1;
                  v121 = v112 + 1;
                  do
                  {
                    TCVerifyInputMeetsCondition((_BYTE)v118 != 0xFF);
                    v122 = objc_alloc_init(OADShape);
                    [v193 addObject:v122];
                    v123 = objc_alloc_init(OADPresetShapeGeometry);
                    [(OADShape *)v122 setGeometry:v123];
                    [(OADShapeGeometry *)v123 setIsEscher:1];
                    [(OADPresetShapeGeometry *)v123 setType:1];
                    v124 = objc_alloc_init(PDOfficeArtClient);
                    [(OADDrawable *)v122 setClientData:v124];
                    v125 = objc_alloc_init(PDPlaceholder);
                    [(PDOfficeArtClient *)v124 setPlaceholder:v125];
                    [(PDPlaceholder *)v125 setIndex:v119];
                    [(PDPlaceholder *)v125 setType:+[PBPlaceholder readPlaceholderType:v117]];
                    if ((v118 - 2) >= 0x11u) {
                      uint64_t v126 = 0;
                    }
                    else {
                      uint64_t v126 = dword_238EF01C8[(char)(v118 - 2)];
                    }
                    [(PDPlaceholder *)v125 setSize:v126];
                    uint64_t v127 = +[PBPlaceholder readPlaceholderOrientation:v117];
                    [(PDPlaceholder *)v125 setOrientation:v127];
                    CGFloat v128 = v185;
                    CGFloat v129 = v186;
                    CGFloat v130 = v187;
                    CGFloat v131 = v188;
                    CGFloat v199 = v190;
                    CGFloat rect = v189;
                    CGFloat v132 = v192;
                    CGFloat v198 = v191;
                    if ((_BYTE)v118)
                    {
                      CGFloat v128 = v175;
                      CGFloat v129 = v176;
                      CGFloat v130 = v177;
                      CGFloat v131 = v178;
                      CGFloat v199 = v180;
                      CGFloat rect = v179;
                      CGFloat v132 = v182;
                      CGFloat v198 = v181;
                      if (v118 >= 0xAu)
                      {
                        if (v118 - 16 < 4) {
                          goto LABEL_63;
                        }
                        CGFloat v128 = 4320.0;
                        CGFloat v129 = 5760.0;
                        CGFloat v130 = v161;
                        CGFloat v131 = v162;
                        CGFloat v199 = v62;
                        CGFloat rect = v64;
                        CGFloat v132 = v160;
                        CGFloat v198 = v159;
                        if (v118 == 10)
                        {
LABEL_63:
                          CGFloat v128 = height;
                          CGFloat v129 = width;
                          CGFloat v130 = y;
                          CGFloat v131 = x;
                          CGFloat v199 = v171;
                          CGFloat rect = v170;
                          CGFloat v132 = v173;
                          CGFloat v198 = v172;
                        }
                      }
                    }
                    v133 = (double *)&+[PBPresentation(Private) processLayoutTypesFromDocument:masterLayoutMap:state:]::defaultPHBounds[32 * (char)v118];
                    CGFloat v196 = v133[1];
                    CGFloat v197 = *v133;
                    CGFloat v194 = v133[3];
                    CGFloat v195 = v133[2];
                    memset(&v202, 0, sizeof(v202));
                    v218.origin.CGFloat x = v131;
                    v218.origin.CGFloat y = v130;
                    v218.size.CGFloat width = v129;
                    v218.size.CGFloat height = v128;
                    double MidX = CGRectGetMidX(v218);
                    v219.origin.CGFloat x = v131;
                    v219.origin.CGFloat y = v130;
                    v219.size.CGFloat width = v129;
                    v219.size.CGFloat height = v128;
                    CGFloat MidY = CGRectGetMidY(v219);
                    CGAffineTransformMakeTranslation(&v202, -MidX, -MidY);
                    CGAffineTransform t1 = v202;
                    v220.origin.CGFloat x = v132;
                    v220.origin.CGFloat y = v198;
                    v220.size.CGFloat width = v199;
                    v220.size.CGFloat height = rect;
                    double v136 = CGRectGetWidth(v220);
                    v221.origin.CGFloat x = v131;
                    v221.origin.CGFloat y = v130;
                    v221.size.CGFloat width = v129;
                    v221.size.CGFloat height = v128;
                    double v137 = CGRectGetWidth(v221);
                    v222.origin.CGFloat x = v132;
                    v222.origin.CGFloat y = v198;
                    v222.size.CGFloat width = v199;
                    v222.size.CGFloat height = rect;
                    double v138 = CGRectGetHeight(v222);
                    v223.origin.CGFloat x = v131;
                    v223.origin.CGFloat y = v130;
                    v223.size.CGFloat width = v129;
                    v223.size.CGFloat height = v128;
                    CGFloat v139 = CGRectGetHeight(v223);
                    CGAffineTransformMakeScale(&t2, v136 / v137, v138 / v139);
                    CGAffineTransformConcat(&v210, &t1, &t2);
                    CGAffineTransform v202 = v210;
                    CGAffineTransform v207 = v210;
                    v224.origin.CGFloat x = v132;
                    v224.origin.CGFloat y = v198;
                    v224.size.CGFloat width = v199;
                    v224.size.CGFloat height = rect;
                    CGFloat v140 = CGRectGetMidX(v224);
                    v225.origin.CGFloat x = v132;
                    v225.origin.CGFloat y = v198;
                    v225.size.CGFloat width = v199;
                    v225.size.CGFloat height = rect;
                    CGFloat v141 = CGRectGetMidY(v225);
                    CGAffineTransformMakeTranslation(&v206, v140, v141);
                    CGAffineTransformConcat(&v210, &v207, &v206);
                    CGAffineTransform v202 = v210;
                    CGAffineTransform v201 = v210;
                    v226.origin.CGFloat y = v196;
                    v226.origin.CGFloat x = v197;
                    v226.size.CGFloat height = v194;
                    v226.size.CGFloat width = v195;
                    CGRect v227 = CGRectApplyAffineTransform(v226, &v201);
                    v142 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v227.origin.x, v227.origin.y, v227.size.width, v227.size.height);
                    v143 = [(OADDrawable *)v122 drawableProperties];
                    [v143 setOrientedBounds:v142];

                    v144 = objc_alloc_init(OADTextBody);
                    [(OADShape *)v122 setTextBody:v144];
                    double v64 = v183;
                    double v62 = v184;
                    if (v127 == 1)
                    {
                      v145 = [(OADTextBody *)v144 properties];
                      [v145 setFlowType:6];
                    }
                    uint64_t v117 = v121[v119];
                    int v118 = v120[v119++];
                  }
                  while (v117);
                }
                TCVerifyInputMeetsCondition(v118 == 255);
                +[PBHeadersFooters readHeadersFootersToSlideLayout:v158 drawables:v193 state:v164];
                uint64_t v66 = v154;
                uint64_t v88 = v155;
                uint64_t v89 = v157;
                [v158 setDrawables:v193];
                v146 = [v164 tgtPresentation];
                [v146 cacheGraphicStylesForSlideBase:v158];

                +[PBSlideBase mapSlideNumberPlaceholder:v174 tgtSlideBase:v158 state:v164];
                +[PBSlideMaster flattenPlaceholderTextStylesIntoLayout:v158 layoutType:v156 masterStyleMap:v165];

                v92 = v158;
                break;
            }
          }

          ++v89;
        }
        while (v89 != v88);
      }
      [v153 cacheSlideLayouts];

      uint64_t v67 = v150 + 1;
    }
    while (v150 + 1 != v66);
  }
}

+ (void)readSlides:(id)a3 masterLayoutMap:(id)a4 slideIdMap:(id)a5 state:(id)a6 isThumbnail:(BOOL)a7 delegate:(id)a8
{
  id v13 = a3;
  id v31 = a4;
  id v14 = a6;
  id v15 = a8;
  uint64_t v30 = v14;
  uint64_t v16 = [v14 tgtPresentation];
  if (v15)
  {
    if (objc_opt_respondsToSelector())
    {
      char v17 = objc_opt_respondsToSelector();
      if (v17)
      {
        uint64_t v18 = [v13 childOfType:4080 instance:0];
        uint64_t v19 = v18;
        if (v18)
        {
          uint64_t v20 = [v18 indexOfFirstChildOfType:1011 afterIndex:-1];
          id v21 = a1;
          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v22 = 0;
            do
            {
              uint64_t v20 = [v19 indexOfFirstChildOfType:1011 afterIndex:v20];
              ++v22;
            }
            while (v20 != 0x7FFFFFFFFFFFFFFFLL);
            goto LABEL_16;
          }
        }
        else
        {
          id v21 = a1;
        }
        uint64_t v22 = 0;
LABEL_16:
        uint64_t v23 = (void *)v16;
        [v15 readerDidStartDocument:v16 withElementCount:v22];
        char v24 = v17 & 1;

        int v25 = 1;
        goto LABEL_10;
      }
    }
  }
  id v21 = a1;
  uint64_t v23 = (void *)v16;
  char v24 = 0;
  int v25 = 0;
LABEL_10:
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__24;
  uint64_t v49 = __Block_byref_object_dispose__24;
  id v50 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __92__PBPresentation_Private__readSlides_masterLayoutMap_slideIdMap_state_isThumbnail_delegate___block_invoke;
  v32[3] = &unk_264D68520;
  id v26 = v30;
  id v33 = v26;
  id v27 = v31;
  BOOL v39 = a7;
  char v40 = v24;
  id v34 = v27;
  uint64_t v37 = &v45;
  id v28 = v15;
  id v35 = v28;
  uint64_t v38 = &v41;
  id v29 = v23;
  id v36 = v29;
  [v21 readSlideListWithInstance:0 documentContainerHolder:v13 state:v26 block:v32];
  if (v25 && v46[5])
  {
    ++v42[3];
    objc_msgSend(v28, "readerDidReadElement:atIndex:inDocument:isLastElement:");
  }

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
}

+ (void)addHeadersFootersToDocumentContainer:(id)a3 instance:(int)a4
{
  __int16 v4 = a4;
  id v7 = [a3 addPptContainerChildOfType:4057];
  EshRecord::setInstance([v7 eshContainer], v4);
  id v5 = (char *)operator new(0x40uLL);
  PptHeadersFootersAtom::PptHeadersFootersAtom((PptHeadersFootersAtom *)v5);
  id v6 = (id)[v7 addEshChild:v5];
  *((_DWORD *)v5 + 12) = 0;
  *((_WORD *)v5 + 26) = 256;
  *(_DWORD *)(v5 + 54) = 0;
}

+ (void)readThemeFromSlideMaster:(id)a3 document:(id)a4 theme:(id)a5 colorMap:(id)a6 state:(id)a7
{
  id v44 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [v44 firstChildOfType:1038];
  Atom = ESDAtomAccess<PptRoundTripThemeAtom>::extractAtom(v16, 0);

  uint64_t v18 = [v15 officeArtState];
  char v19 = [v18 useXmlBlobs];

  if (Atom) {
    char v20 = v19;
  }
  else {
    char v20 = 0;
  }
  if (v20)
  {
    uint64_t v21 = Atom[9];
    uint64_t v22 = *((unsigned int *)Atom + 16);
    uint64_t v23 = [v15 officeArtState];
    char v24 = [v23 xmlDrawingState];
    +[OAXTheme readFromThemeData:v21 themeDataSize:v22 toTheme:v13 xmlDrawingState:v24];

    int v25 = [v44 firstChildOfType:1039];
    id v26 = ESDAtomAccess<PptRoundTripColorMappingAtom>::extractAtom(v25, 0);

    if (v26)
    {
      xmlNodePtr v27 = CXGetRootElement(*((const unsigned __int8 **)v26 + 9), *((_DWORD *)v26 + 16));
      if (v27)
      {
        +[OAXColorMap readFromXmlNode:v27 toColorMap:v14];
        xmlFreeDoc(v27->doc);
      }
    }
  }
  else
  {
    id v28 = [v13 baseStyles];
    id v29 = [v28 colorScheme];
    +[PBSlideBase readColorScheme:v44 colorScheme:v29 colorMap:v14 state:v15];

    uint64_t v30 = [a1 drawingGroupHolderWithDocumentContainerHolder:v12];
    id v31 = [v13 drawableDefaults];
    id v32 = (id)[v31 addShapeDefaults];

    id v33 = [v13 drawableDefaults];
    id v34 = (id)[v33 addLineDefaults];

    id v35 = [v13 drawableDefaults];
    id v36 = (id)[v35 addTextDefaults];

    uint64_t v37 = [v15 officeArtState];
    +[OABDrawingGroup readGraphicalDefaultsFromDrawingGroup:v30 toTheme:v13 state:v37];

    uint64_t v38 = [v13 drawableDefaults];
    BOOL v39 = [v38 shapeDefaults];
    char v40 = [v39 textListStyle];
    [a1 readDefaultTextListStyle:v40 fromDocumentContainer:v12 state:v15];

    uint64_t v41 = [v13 drawableDefaults];
    uint64_t v42 = [v41 textDefaults];
    uint64_t v43 = [v42 textListStyle];
    [a1 readDefaultTextListStyle:v43 fromDocumentContainer:v12 state:v15];
  }
}

+ (void)readXmlLayoutsFromSlideMaster:(id)a3 document:(id)a4 masterInfo:(id)a5 state:(id)a6
{
  id v26 = a3;
  id v23 = a4;
  id v25 = a5;
  id v24 = a6;
  uint64_t v9 = 0;
  while (1)
  {
    uint64_t v9 = [v26 indexOfFirstChildOfType:1054 afterIndex:v9];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v10 = [v26 childAt:v9];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = (const void *)[v10 eshObject];
      if (v12)
      {
        if (v13)
        {
          id v14 = (EshRecord *)v13;
          id v15 = OCPNewZipPackageWithOcBinaryData(v13 + 1);
          uint64_t v16 = v15;
          if (v15)
          {
            char v17 = [v15 partByRelationshipType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout"];
            if (v17)
            {
              uint64_t v18 = [v25 slideMaster];
              char v19 = [v18 addSlideLayout];

              unsigned __int16 Instance = EshRecord::getInstance(v14);
              uint64_t v21 = [v24 officeArtState];
              uint64_t v22 = [v21 xmlDocumentState];
              +[PXSlideLayout readFromPackagePart:v17 toSlideLayout:v19 presentationState:v22];

              [v25 setSlideLayout:v19 forXmlLayoutId:Instance];
            }
          }
        }
      }
    }
  }
}

+ (void)readTextStylesFromSlideMaster:(id)a3 toSlideMaster:(id)a4 state:(id)a5
{
  id v20 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v20 firstChildOfType:1059];
  Atom = (OcBinaryData *)ESDAtomAccess<PptRoundTripOfficeArtTextStylesAtom>::extractAtom(v9, 0);

  uint64_t v11 = [v8 officeArtState];
  char v12 = [v11 useXmlBlobs];

  if (Atom) {
    char v13 = v12;
  }
  else {
    char v13 = 0;
  }
  if (v13)
  {
    id v14 = OCPNewZipPackageWithOcBinaryData(Atom + 1);
    id v15 = v14;
    if (v14)
    {
      uint64_t v16 = [v14 partByRelationshipType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster"];
      xmlNodePtr v17 = OCXGetRootElement((_xmlDoc *)[v16 xmlDocument]);
      uint64_t v18 = [v8 officeArtState];
      char v19 = [v18 xmlDocumentState];
      +[PXSlideMaster readTextStylesFromNode:v17 slideMaster:v7 state:v19];
    }
  }
  else
  {
    +[PBSlideMaster setSlideMasterTextStyles:v7 state:v8];
  }
}

+ (void)readTextStyleFromNotesMaster:(id)a3 toNotesMaster:(id)a4 slideMaster:(id)a5 state:(id)a6
{
  id v33 = a3;
  id v9 = a4;
  id v32 = a5;
  id v10 = a6;
  uint64_t v11 = [v33 firstChildOfType:1063];
  Atom = (OcBinaryData *)ESDAtomAccess<PptRoundTripNotesMasterTextStylesAtom>::extractAtom(v11, 0);

  char v13 = [v10 officeArtState];
  char v14 = [v13 useXmlBlobs];

  if (Atom) {
    char v15 = v14;
  }
  else {
    char v15 = 0;
  }
  if ((v15 & 1) == 0)
  {
    xmlNodePtr v17 = [v10 masterStyles:v32];
    id v28 = [NSNumber numberWithLong:2];
    uint64_t v18 = [v17 objectForKey:v28];

    id v29 = [v9 notesTextStyle];
    [v29 overrideWithTextStyle:v18];

    uint64_t v30 = [v9 theme];
    id v31 = [v30 baseStyles];
    id v24 = [v31 fontScheme];

    id v25 = [v24 minorFont];
    id v26 = [v18 propertiesForListLevel:0];
    +[PBSlideMaster setFont:v25 fromCharacterProperties:v26];
    goto LABEL_9;
  }
  uint64_t v16 = OCPNewZipPackageWithOcBinaryData(Atom + 1);
  xmlNodePtr v17 = v16;
  if (!v16) {
    goto LABEL_11;
  }
  uint64_t v18 = [v16 partByRelationshipType:@"http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideMaster"];
  char v19 = OCXGetRootElement((_xmlDoc *)[v18 xmlDocument]);
  id v20 = [v10 officeArtState];
  uint64_t v21 = [v20 xmlDocumentState];
  uint64_t v22 = [v21 PXPresentationMLNamespace];
  uint64_t v23 = OCXFindChild(v19, v22, "bodyStyle");

  if (v23)
  {
    id v24 = [v9 notesTextStyle];
    id v25 = [v10 officeArtState];
    id v26 = [v25 xmlDocumentState];
    xmlNodePtr v27 = [v26 officeArtState];
    +[OAXTextListStyle readNode:v23 textListStyle:v24 state:v27];

LABEL_9:
  }

LABEL_11:
}

+ (void)readSlideListWithInstance:(int)a3 documentContainerHolder:(id)a4 state:(id)a5 block:(id)a6
{
  __int16 v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v47 = (void (**)(id, void *, _DWORD *, char *))a6;
  uint64_t v48 = [v10 documentRoot];
  uint64_t v11 = [v9 childOfType:4080 instance:v8];
  unint64_t v49 = [v11 childCount];
  [v10 setSourceSlideListHolder:v11];
  uint64_t v12 = [v10 currentSlideTextBlockRecordIndexRangeVector];
  unint64_t v13 = 0;
  uint64_t v51 = (void *)(v12 + 16);
  do
  {
    if (v13 >= v49 || ([v10 isCancelled] & 1) != 0) {
      break;
    }
    char v54 = 0;
    char v14 = [v11 childAt:v13];
    Atom = ESDAtomAccess<PptSlidePersistAtom>::extractAtom(v14, 1);

    if (Atom)
    {
      id v50 = Atom;
      int v16 = Atom[13];
      xmlNodePtr v17 = *(_OWORD **)v12;
      *(void *)(v12 + 8) = *(void *)v12;
      int v52 = v16;
      if (v16 >= 1)
      {
        int v18 = 0;
        do
        {
          if ((unint64_t)v17 >= *v51)
          {
            id v20 = *(_OWORD **)v12;
            unint64_t v21 = (unint64_t)v17 - *(void *)v12;
            uint64_t v22 = (*v51 - *(void *)v12) >> 4;
            if (2 * (int)v22 <= (v21 >> 4) + 1) {
              unsigned int v23 = (v21 >> 4) + 1;
            }
            else {
              unsigned int v23 = 2 * v22;
            }
            if (v22 >= 0x7FFFFFFF) {
              unint64_t v24 = 0xFFFFFFFFLL;
            }
            else {
              unint64_t v24 = v23;
            }
            if (v24)
            {
              id v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)v51, v24);
              uint64_t v27 = v26;
              id v20 = *(_OWORD **)v12;
              xmlNodePtr v17 = *(_OWORD **)(v12 + 8);
            }
            else
            {
              id v25 = 0;
              uint64_t v27 = 0;
            }
            id v28 = &v25[v21 & 0xFFFFFFFF0];
            *(_OWORD *)id v28 = xmmword_238EDB050;
            char v19 = v28 + 16;
            if (v17 != v20)
            {
              do
              {
                *((_OWORD *)v28 - 1) = *(v17 - 1);
                v28 -= 16;
                --v17;
              }
              while (v17 != v20);
              id v20 = *(_OWORD **)v12;
            }
            *(void *)uint64_t v12 = v28;
            *(void *)(v12 + 8) = v19;
            *(void *)(v12 + 16) = &v25[16 * v27];
            if (v20) {
              operator delete(v20);
            }
          }
          else
          {
            *xmlNodePtr v17 = xmmword_238EDB050;
            char v19 = v17 + 1;
          }
          *(void *)(v12 + 8) = v19;
          ++v18;
          xmlNodePtr v17 = v19;
        }
        while (v18 != v52);
      }
      uint64_t v29 = [v11 indexOfFirstChildOfType:1011 afterIndex:v13];
      unint64_t v30 = v49;
      id v31 = v50;
      if (v29 != 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v30 = v29;
      }
      unint64_t v32 = v13 + 1;
      unint64_t v53 = v30;
      if (v32 < v30)
      {
        do
        {
          uint64_t v33 = [v11 indexOfFirstChildOfType:3999 afterIndex:v32];
          if (v33 == 0x7FFFFFFFFFFFFFFFLL) {
            unint64_t v34 = v53;
          }
          else {
            unint64_t v34 = v33;
          }
          if (v34 >= v53) {
            unint64_t v35 = v53;
          }
          else {
            unint64_t v35 = v34;
          }
          if (v35 <= v32)
          {
            id v36 = [NSString stringWithUTF8String:"+[PBPresentation(Private) readSlideListWithInstance:documentContainerHolder:state:block:]"];
            uint64_t v37 = v11;
            id v38 = v10;
            id v39 = v9;
            char v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Binary/Mapper/PBPresentation.mm"];
            +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v40, 1697, 0, "If the text block start index was < the start index of the next slide, then the text block must have a positive length");

            id v9 = v39;
            id v10 = v38;
            uint64_t v11 = v37;
            +[OITSUAssertionHandler logBacktraceThrottled];
            id v31 = v50;
          }
          uint64_t v41 = [v11 childAt:v32];
          uint64_t v42 = (EshRecord *)ESDAtomAccess<PptTextHeaderAtom>::extractAtom(v41, 1);

          if (v42) {
            BOOL v43 = v52 > (int)EshRecord::getInstance(v42);
          }
          else {
            BOOL v43 = 0;
          }
          TCVerifyInputMeetsCondition(v43);
          id v44 = (unint64_t *)(*(void *)v12 + 16 * EshRecord::getInstance(v42));
          unint64_t *v44 = v32;
          v44[1] = v35 - v32;
          unint64_t v32 = v35;
        }
        while (v53 > v34);
      }
      uint64_t v45 = [v48 pbReferenceWithID:v31[12]];
      if (v45)
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        TCVerifyInputMeetsCondition(isKindOfClass & 1);
        v47[2](v47, v45, v31, &v54);
      }
      *(void *)(v12 + 8) = *(void *)v12;

      unint64_t v13 = v53;
    }
    else
    {
      TCVerifyInputMeetsCondition(0);
    }
  }
  while (!v54);
}

void __70__PBPresentation_Private__readMasterAndLayouts_masterLayoutMap_state___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = *(unsigned int *)(a3 + 48);
  uint64_t v7 = *(unsigned int *)(a3 + 56);
  id v37 = v5;
  uint64_t v8 = [v5 eshObject];
  if ((*(unsigned int (**)(uint64_t))(*(void *)v8 + 16))(v8) == 1016)
  {
    id v9 = [[PDSlideMaster alloc] initWithPresentation:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) addSlideMaster:v9];
    id v10 = objc_alloc_init(PBMasterInfo);
    [(PBMasterInfo *)v10 setSlideMaster:v9];
    [(PBMasterInfo *)v10 setMainPbRef:v6];
    uint64_t v11 = [*(id *)(a1 + 40) officeArtState];
    -[PBMasterInfo setUseXmlBlobs:](v10, "setUseXmlBlobs:", [v11 useXmlBlobs]);

    [*(id *)(a1 + 48) setMasterInfo:v10 forMasterId:v7];
    objc_msgSend(*(id *)(a1 + 40), "setCurrentSourceMasterStyleInfoVector:", -[PBMasterInfo sourceTextStyling](v10, "sourceTextStyling"));
    uint64_t v12 = 0;
    do
    {
      unint64_t v13 = (_OWORD *)[*(id *)(a1 + 40) docSourceMasterStyleInfoOfType:v12];
      *(_OWORD *)[*(id *)(a1 + 40) currentSourceMasterStyleInfoOfType:v12] = *v13;
      uint64_t v12 = (v12 + 1);
    }
    while (v12 != 9);
    +[PBSlideMaster readSlideMasterTextStyles:v9 slideHolder:v37 state:*(void *)(a1 + 40)];
    uint64_t v14 = *(void *)(a1 + 56);
    char v15 = *(void **)(a1 + 64);
    int v16 = [(PDSlideMaster *)v9 theme];
    xmlNodePtr v17 = [(PDSlideMaster *)v9 colorMap];
    [v15 readThemeFromSlideMaster:v37 document:v14 theme:v16 colorMap:v17 state:*(void *)(a1 + 40)];

    [*(id *)(a1 + 64) readTextStylesFromSlideMaster:v37 toSlideMaster:v9 state:*(void *)(a1 + 40)];
    +[PBSlideMaster readMasterDrawables:v9 slideHolder:v37 state:*(void *)(a1 + 40)];
    +[PBSlideMaster readSlideMasterName:v9 slideHolder:v37 state:*(void *)(a1 + 40)];
    int v18 = [(PDSlideMaster *)v9 theme];
    [v18 validateTheme];

    [*(id *)(a1 + 40) setCurrentSourceMasterStyleInfoVector:0];
    if ([(PBMasterInfo *)v10 useXmlBlobs])
    {
      char v19 = [v37 firstChildOfType:1052];
      Atom = (unsigned int *)ESDAtomAccess<PptRoundTripOriginalMainMasterIdAtom>::extractAtom(v19, 0);

      if (Atom) {
        [(PBMasterInfo *)v10 setXmlMainMasterId:Atom[12]];
      }
      unint64_t v21 = [v37 firstChildOfType:1053];
      uint64_t v22 = (unsigned int *)ESDAtomAccess<PptRoundTripCompositeMasterIdAtom>::extractAtom(v21, 0);

      if (v22) {
        [(PBMasterInfo *)v10 setXmlMainMasterId:v22[12]];
      }
      [*(id *)(a1 + 64) readXmlLayoutsFromSlideMaster:v37 document:*(void *)(a1 + 56) masterInfo:v10 state:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v10 = [v37 firstChildOfType:1007];
    unsigned int v23 = (const void *)[(PBMasterInfo *)v10 eshObject];
    if (v23) {
    else
    }
      unint64_t v24 = 0;
    TCVerifyInputMeetsCondition(v24 != 0);
    if (v24)
    {
      LODWORD(v25) = v24[21];
      unsigned int v26 = [*(id *)(a1 + 48) masterInfoForMasterId:v25];
      if (!v26)
      {
        uint64_t v27 = [*(id *)(a1 + 48) allMasterIds];
        id v28 = [v27 sortedArrayUsingSelector:sel_compare_];
        uint64_t v29 = [v28 firstObject];

        TCVerifyInputMeetsCondition(v29 != 0);
        uint64_t v25 = [v29 intValue];
        unsigned int v26 = [*(id *)(a1 + 48) masterInfoForMasterId:v25];
      }
      [v26 setTitlePbRef:v6];
      id v9 = [v26 slideMaster];
      unint64_t v30 = [(PDSlideMaster *)v9 addSlideLayout];
      [v30 setSlideLayoutType:1];
      objc_msgSend(*(id *)(a1 + 40), "setCurrentSourceMasterStyleInfoVector:", objc_msgSend(v26, "sourceTextStyling"));
      unint64_t v34 = __PAIR64__(v7, v25);
      id v31 = objc_alloc_init(OADColorScheme);
      unint64_t v32 = objc_alloc_init(OADColorMap);
      if (+[PBSlideBase readColorScheme:v37 colorScheme:v31 colorMap:v32 state:*(void *)(a1 + 40)])
      {
        uint64_t v33 = [v30 themeOverrides];
        [v33 setColorScheme:v31];

        [v30 setColorMapOverride:v32];
      }
      +[PBSlideBase readDrawingGroup:slide:state:](PBSlideBase, "readDrawingGroup:slide:state:", v37, v30, *(void *)(a1 + 40), v34);
      [*(id *)(a1 + 40) setCurrentSourceMasterStyleInfoVector:0];
      [v30 setShowMasterShapes:*((unsigned __int8 *)v24 + 92)];
      [*(id *)(a1 + 48) setMasterId:v35 forTitleId:v36];
    }
    else
    {
      id v9 = 0;
    }
  }
}

+ (void)readCommentAuthorsFrom:(id)a3 state:(id)a4
{
  id v21 = a3;
  id v5 = a4;
  id v20 = [v21 firstChildOfType:2000];
  uint64_t v6 = +[PBProgTag binaryTagDataWithName:L"___PPT10" inProgTagsParent:v20];
  for (unsigned int i = 0; ; unsigned int i = v8 + 1)
  {
    unsigned int v8 = i;
    if ([v6 childCount] <= (unint64_t)i) {
      break;
    }
    id v9 = [v6 childAt:i];
    uint64_t v10 = [v9 eshObject];
    if ((*(unsigned int (**)(uint64_t))(*(void *)v10 + 16))(v10) == 12004)
    {
      uint64_t v11 = objc_alloc_init(PDCommentAuthor);
      uint64_t v12 = [v5 tgtPresentation];
      -[PDCommentAuthor setId:](v11, "setId:", [v12 commentAuthorCount]);

      unint64_t v13 = [v5 tgtPresentation];
      [v13 addCommentAuthor:v11];

      uint64_t v14 = [v9 firstChildOfType:12005];
      uint64_t v15 = [v14 eshObject];

      if (v15)
      {
        [(PDCommentAuthor *)v11 setColorIndex:*(unsigned int *)(v15 + 48)];
        [(PDCommentAuthor *)v11 setLastCommentIndex:(*(_DWORD *)(v15 + 52) - 1)];
      }
      int v16 = [v9 firstChildOfType:4026];
      xmlNodePtr v17 = (const void *)[v16 eshObject];
      if (v17)
      {
        if (v18)
        {
          char v19 = [NSString stringWithCsString:v18 + 48];
          [(PDCommentAuthor *)v11 setName:v19];
        }
      }
    }
  }
}

void __92__PBPresentation_Private__readSlides_masterLayoutMap_slideIdMap_state_isThumbnail_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v13 = a2;
  [*(id *)(a1 + 32) setSourceSlideId:*(unsigned int *)(a3 + 56)];
  uint64_t v7 = objc_alloc_init(PDSlide);
  unsigned int v8 = [*(id *)(a1 + 40) slideLayoutForSlideHolder:v13];
  [(PDSlide *)v7 setSlideLayout:v8];

  id v9 = *(void **)(a1 + 32);
  uint64_t v10 = [*(id *)(a1 + 40) masterInfoForSlideHolder:v13];
  objc_msgSend(v9, "setCurrentSourceMasterStyleInfoVector:", objc_msgSend(v10, "sourceTextStyling"));

  +[PBSlide readFromSlideContainer:v13 toSlide:v7 state:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setCurrentSourceMasterStyleInfoVector:0];
  if (![(PDSlideBase *)v7 isHidden])
  {
    *a4 = *(unsigned char *)(a1 + 80);
    if (*(unsigned char *)(a1 + 81))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      if (*(void *)(v11 + 40))
      {
        uint64_t v12 = *(void **)(a1 + 48);
        ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        objc_msgSend(v12, "readerDidReadElement:atIndex:inDocument:isLastElement:");
        uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
      }
      objc_storeStrong((id *)(v11 + 40), v7);
    }
    else
    {
      [*(id *)(a1 + 56) addSlide:v7];
    }
  }
  [*(id *)(a1 + 32) setSourceSlideId:0xFFFFFFFFLL];
}

+ (void)readNotes:(id)a3 masterLayoutMap:(id)a4 slideIdMap:(id)a5 state:(id)a6 delegate:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v32 = a7;
  uint64_t v33 = [v13 documentRoot];
  uint64_t v14 = [v13 tgtPresentation];
  uint64_t v15 = objc_alloc_init(PDNotesMaster);
  [v14 addNotesMaster:v15];
  int v16 = [v11 firstChildOfType:1001];
  Atom = ESDAtomAccess<PptDocumentAtom>::extractAtom(v16, 1);

  if (Atom[16])
  {
    int v18 = objc_msgSend(v33, "pbReferenceWithID:");
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    TCVerifyInputMeetsCondition(isKindOfClass & 1);
    id v20 = [v18 firstChildOfType:1009];
    id v21 = (unsigned int *)ESDAtomAccess<PptNotesAtom>::extractAtom(v20, 1);

    uint64_t v22 = [v12 masterInfoForMasterId:v21[12]];
    if (!v22)
    {
      unsigned int v23 = [v12 allMasterIds];
      unint64_t v24 = [v23 sortedArrayUsingSelector:sel_compare_];
      uint64_t v25 = [v24 firstObject];

      TCVerifyInputMeetsCondition(v25 != 0);
      uint64_t v22 = objc_msgSend(v12, "masterInfoForMasterId:", objc_msgSend(v25, "intValue"));
    }
    TCVerifyInputMeetsCondition(v22 != 0);
    objc_msgSend(v13, "setCurrentSourceMasterStyleInfoVector:", objc_msgSend(v22, "sourceTextStyling"));
    unsigned int v26 = [(PDNotesMaster *)v15 theme];
    uint64_t v27 = [(PDNotesMaster *)v15 colorMap];
    [a1 readThemeFromSlideMaster:v18 document:v11 theme:v26 colorMap:v27 state:v13];

    id v28 = [v22 slideMaster];
    [a1 readTextStyleFromNotesMaster:v18 toNotesMaster:v15 slideMaster:v28 state:v13];
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __79__PBPresentation_Private__readNotes_masterLayoutMap_slideIdMap_state_delegate___block_invoke;
  v34[3] = &unk_264D68548;
  id v29 = v13;
  id v35 = v29;
  id v30 = v32;
  id v36 = v30;
  id v31 = v14;
  id v37 = v31;
  [a1 readSlideListWithInstance:2 documentContainerHolder:v11 state:v29 block:v34];
  [v29 setCurrentSourceMasterStyleInfoVector:0];
}

void __79__PBPresentation_Private__readNotes_masterLayoutMap_slideIdMap_state_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 eshObject];
  if ((*(unsigned int (**)(uint64_t))(*(void *)v3 + 16))(v3) == 1008)
  {
    __int16 v4 = +[PBSlide notesSlideFromSlideContainer:v5 state:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) readerDidReadElement:v4 atIndex:0x7FFFFFFFFFFFFFFFLL inDocument:*(void *)(a1 + 48) isLastElement:0];
  }
}

@end