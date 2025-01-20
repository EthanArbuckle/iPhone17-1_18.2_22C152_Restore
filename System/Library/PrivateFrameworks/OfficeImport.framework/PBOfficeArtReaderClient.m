@interface PBOfficeArtReaderClient
+ (BOOL)escherIsFullySupported;
+ (BOOL)readClientTextBoxFromShape:(id)a3 toGraphic:(id)a4 clientData:(id)a5 state:(id)a6;
+ (BOOL)readOleFromClientDataHolder:(id)a3 toGraphic:(id)a4 tgtClientData:(id)a5 state:(id)a6;
+ (BOOL)readPlaceholderInfo:(id)a3 clientData:(id)a4 toGraphic:(id)a5 presentationState:(id)a6;
+ (BOOL)readRecolorInfoFromClientDataHolder:(id)a3 toClientData:(id)a4 state:(id)a5;
+ (BOOL)tablesAreAllowed;
+ (BOOL)xmlEquivalentOfDrawableCanBeUsed;
+ (id)newBuildFromBuildType:(int)a3;
+ (id)newTargetFromDrawable:(id)a3 clientData:(id)a4 buildType:(int)a5;
+ (id)readClientTextBoxFromShape:(id)a3 toTextBody:(id)a4 state:(id)a5;
+ (id)readDrawableFromPackagePart:(id)a3 foundInObject:(id)a4 state:(id)a5;
+ (int)directionFromFlyDirection:(int)a3;
+ (int)oadSchemeColorValueForEshSchemeColorIndex:(unsigned __int16)a3 state:(id)a4;
+ (int)presetIdFromFlyMethod:(int)a3 isEntrance:(BOOL)a4;
+ (void)addRecolorSpec:(const PptRecolorSpec *)a3 toDictionary:(id)a4 state:(id)a5;
+ (void)readClientAnchorFromContainer:(id)a3 toDrawable:(id)a4 state:(id)a5;
+ (void)readClientDataFromGroup:(id)a3 toGroup:(id)a4 state:(id)a5;
+ (void)readClientDataFromShape:(id)a3 toGraphic:(id)a4 state:(id)a5;
+ (void)readClientDataFromTableCell:(id)a3 toTableCell:(id)a4 state:(id)a5;
+ (void)readHyperlinkFromShapeContainerHolder:(id)a3 toDrawable:(id)a4 state:(id)a5;
@end

@implementation PBOfficeArtReaderClient

+ (BOOL)escherIsFullySupported
{
  return 1;
}

+ (void)readClientDataFromShape:(id)a3 toGraphic:(id)a4 state:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v9 presentationState];
    id v11 = v17;
    v12 = [v11 firstChildOfType:61457];
    v13 = objc_alloc_init(PDOfficeArtClient);
    [a1 readClientAnchorFromContainer:v11 toDrawable:v8 state:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v14 = [a1 readPlaceholderInfo:v11 clientData:v13 toGraphic:v8 presentationState:v10];
    }
    else {
      int v14 = 0;
    }
    int v15 = [a1 readClientTextBoxFromShape:v11 toGraphic:v8 clientData:v13 state:v9];
    [a1 readHyperlinkFromShapeContainerHolder:v11 toDrawable:v8 state:v9];
    int v16 = [a1 readRecolorInfoFromClientDataHolder:v11 toClientData:v13 state:v9];
    if (v14 | v15 | v16 | [a1 readOleFromClientDataHolder:v11 toGraphic:v8 tgtClientData:v13 state:v10])objc_msgSend(v8, "setClientData:", v13); {
  }
    }
}

+ (BOOL)readPlaceholderInfo:(id)a3 clientData:(id)a4 toGraphic:(id)a5 presentationState:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v9 firstChildOfType:61457];
  int v14 = [v13 firstChildOfType:3011];
  int v15 = v14;
  if (v14)
  {
    int v16 = (const void *)[v14 eshObject];
    if (v16)
    {
      if (v17)
      {
        v18 = v17;
        v19 = objc_alloc_init(PDPlaceholder);
        [v10 setPlaceholder:v19];
        [(PDPlaceholder *)v19 setIndex:v18[12]];
        uint64_t v20 = +[PBPlaceholder readPlaceholderType:*((unsigned __int8 *)v18 + 52)];
        [(PDPlaceholder *)v19 setType:v20];
        [(PDPlaceholder *)v19 setSize:+[PBPlaceholder readPlaceholderSize:*((unsigned __int8 *)v18 + 53)]];
        [(PDPlaceholder *)v19 setOrientation:+[PBPlaceholder readPlaceholderOrientation:*((unsigned __int8 *)v18 + 52)]];
        uint64_t v21 = objc_opt_class();
        uint64_t v22 = TSUDynamicCast(v21, (uint64_t)v11);
        v39 = (void *)v22;
        if (v20 != 5)
        {
          if ((v20 & 0xFFFFFFFD) != 4 || !v22) {
            goto LABEL_22;
          }
          v28 = [v9 firstChildOfType:61453];
          if (v28) {
            [v12 setSourceTextBoxContainerHolder:v28 forTargetShape:v39];
          }
          goto LABEL_21;
        }
        v23 = [v12 tgtSlide];
        objc_opt_class();
        char v24 = objc_opt_isKindOfClass() | (v22 == 0);

        if (v24)
        {
LABEL_22:
          BOOL v34 = +[PDPlaceholder isTextType:v20];
          v35 = [v39 shapeProperties];
          [v35 setIsTextBox:v34];

          BOOL v29 = 1;
          goto LABEL_23;
        }
        v25 = [v12 tgtSlide];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v27 = [v12 tgtSlide];
          v28 = [v27 slideMaster];
        }
        else
        {
          v30 = [v12 tgtSlide];
          objc_opt_class();
          char v31 = objc_opt_isKindOfClass();

          if ((v31 & 1) == 0)
          {
            v33 = 0;
            v28 = 0;
LABEL_20:

LABEL_21:
            goto LABEL_22;
          }
          v37 = [v12 tgtSlide];
          v32 = [v37 slideLayout];
          v28 = [v32 slideMaster];

          v27 = v37;
        }

        if (v28)
        {
          v38 = [v28 placeholderWithType:5 placeholderTypeIndex:0 overrideIndex:1];
          v33 = [v38 textBody];

          if (v33) {
            [v39 setTextBody:v33];
          }
        }
        else
        {
          v33 = 0;
        }
        goto LABEL_20;
      }
    }
  }
  BOOL v29 = 0;
LABEL_23:

  return v29;
}

+ (void)readHyperlinkFromShapeContainerHolder:(id)a3 toDrawable:(id)a4 state:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  id v8 = [a3 firstChildOfType:61457];
  if (v8)
  {
    id v9 = [v7 presentationState];
    id v10 = [v8 childOfType:4082 instance:0];
    if (v10)
    {
      id v11 = +[PBHyperlink readAnimationInfoContainerHolder:v10 presentationState:v9];
      id v12 = [v16 drawableProperties];
      [v12 setClickHyperlink:v11];
    }
    v13 = [v8 childOfType:4082 instance:1];
    if (v13)
    {
      int v14 = +[PBHyperlink readAnimationInfoContainerHolder:v13 presentationState:v9];
      int v15 = [v16 drawableProperties];
      [v15 setHoverHyperlink:v14];
    }
  }
}

+ (BOOL)readOleFromClientDataHolder:(id)a3 toGraphic:(id)a4 tgtClientData:(id)a5 state:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v69 = a6;
  uint64_t v12 = objc_opt_class();
  v13 = TSUDynamicCast(v12, (uint64_t)v10);
  if (!v13)
  {
    BOOL v56 = 0;
    goto LABEL_64;
  }
  int v14 = [v9 firstChildOfType:61457];
  int v15 = v14;
  if (!v14)
  {
    BOOL v56 = 0;
    goto LABEL_63;
  }
  id v16 = [v14 firstChildOfType:3009];
  if (!v16)
  {
    BOOL v25 = 0;
    goto LABEL_62;
  }
  v62 = v16;
  v63 = v15;
  id v64 = v10;
  id v65 = v9;
  v66 = v11;
  v68 = v13;
  id v17 = (const void *)[v16 eshObject];
  if (!v17
  {
    +[TCMessageException raise:TCUnknownProblemMessage];
    v18 = 0;
  }
  int v19 = v18[12];
  uint64_t DocumentRef = PptBinaryReader::getDocumentRef((PptBinaryReader *)[v69 reader]);
  uint64_t v21 = [v69 documentRoot];
  uint64_t v22 = [v21 pbReferenceWithID:DocumentRef];

  v61 = v22;
  v23 = [v22 firstChildOfType:1033];
  unsigned int v24 = 0;
  BOOL v25 = 0;
  p_info = OADImageFill.info;
  while (2)
  {
    if ([v23 childCount] <= (unint64_t)v24) {
      goto LABEL_61;
    }
    v27 = [v23 childAt:v24];
    uint64_t v28 = [v27 eshObject];
    int v29 = (*(uint64_t (**)(uint64_t))(*(void *)v28 + 16))(v28);
    switch(v29)
    {
      case 4102:
      case 4103:
        goto LABEL_26;
      case 4104:
      case 4105:
      case 4106:
      case 4107:
      case 4108:
      case 4110:
        goto LABEL_56;
      case 4109:
      case 4112:
        v30 = [v27 firstChildOfType:4100];
        char v31 = (const void *)[v30 eshObject];
        if (!v31
        {
          +[TCMessageException raise:TCUnknownProblemMessage];
          v32 = 0;
        }
        if (v32[12] != v19) {
          goto LABEL_55;
        }
        BOOL v33 = +[PBMedia readLinkedMovieFromMovieHolder:v27 toImage:v68 state:v69];
        goto LABEL_38;
      case 4111:
        v30 = [v27 firstChildOfType:4100];
        v43 = (const void *)[v30 eshObject];
        if (!v43
        {
          +[TCMessageException raise:TCUnknownProblemMessage];
          v44 = 0;
        }
        if (v44[12] != v19) {
          goto LABEL_55;
        }
        BOOL v33 = +[PBMedia readEmbeddedSoundFromClientDataHolder:v27 toImage:v68 state:v69];
LABEL_38:
        BOOL v25 = v33;
        goto LABEL_55;
      default:
        if (v29 == 4074)
        {
LABEL_26:
          v39 = [v27 firstContainerChildOfType:4101 mustExist:0];
          v30 = v39;
          if (v39)
          {
            v40 = [v39 firstChildOfType:4100];
            v41 = (const void *)[v40 eshObject];
            if (!v41
            {
              +[TCMessageException raise:TCUnknownProblemMessage];
              v42 = 0;
            }
            if (v42[12] == v19) {
              BOOL v25 = +[PBMedia readLinkedMovieFromMovieHolder:v30 toImage:v68 state:v69];
            }
          }
          goto LABEL_55;
        }
        if (v29 != 4044) {
          goto LABEL_56;
        }
        v30 = [v27 firstChildOfType:4035];
        if (!v30) {
          +[TCMessageException raise:TCUnknownProblemMessage];
        }
        BOOL v34 = (const void *)[v30 eshObject];
        if (!v34
        {
          +[TCMessageException raise:TCUnknownProblemMessage];
          v35 = 0;
        }
        if (v35[14] != v19) {
          goto LABEL_55;
        }
        v36 = [v27 childOfType:4026 instance:2];
        if (v36)
        {
          v67 = v36;
          v37 = (const void *)[v36 eshObject];
          if (v37) {
          else
          }
            v38 = 0;
          v45 = (void *)[[NSString alloc] initWithCsString:v38 + 48];
          if (![p_info + 356 isProgIDChart:v45])
          {
            id v54 = objc_alloc_init((Class)(p_info + 356));
            v55 = v54;
            if (v45) {
              [v54 setAnsiProgID:v45];
            }
            goto LABEL_54;
          }
          uint64_t v46 = v35[16];
          v47 = [v69 documentRoot];
          v48 = [v47 pbReferenceWithID:v46];

          v60 = v48;
          v49 = (const void *)[v48 eshObject];
          if (v49
          {
            v51 = v50;
            uint64_t v52 = v50[12];
            (*(void (**)(uint64_t, void, void))(*(void *)v52 + 16))(v52, *((unsigned int *)v50 + 16), 0);
            unsigned int v59 = *((_DWORD *)v51 + 18);
            unsigned int v58 = *((_DWORD *)v51 + 12);
            v53 = [v69 cancelDelegate];
            if (v58) {
              +[OABOle readCompressedFromStream:v52 compressedSize:v59 uncompressedSize:v58 cancel:v53];
            }
            else {
            v55 = +[OABOle readFromStream:v52 size:v59 cancel:v53];
            }

            if (v55)
            {
              [v55 setIconic:v35[12] == 4];
              p_info = (__objc2_class_ro **)(OADImageFill + 32);
              BOOL v25 = 1;
              [v66 setHasOleChart:1];
              goto LABEL_53;
            }
          }
          else
          {
            v55 = 0;
          }
          p_info = (__objc2_class_ro **)(OADImageFill + 32);
LABEL_53:

LABEL_54:
          [v68 setOle:v55];

LABEL_55:
LABEL_56:

          ++v24;
          continue;
        }

LABEL_61:
        id v10 = v64;
        id v9 = v65;
        id v11 = v66;
        v13 = v68;
        id v16 = v62;
        int v15 = v63;
LABEL_62:

        BOOL v56 = v25;
LABEL_63:

LABEL_64:
        return v56;
    }
  }
}

+ (BOOL)tablesAreAllowed
{
  return 1;
}

+ (void)readClientDataFromGroup:(id)a3 toGroup:(id)a4 state:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  id v9 = [a3 firstChildOfType:6];
  [a1 readClientAnchorFromContainer:v9 toDrawable:v10 state:v8];
}

+ (void)readClientDataFromTableCell:(id)a3 toTableCell:(id)a4 state:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 presentationState];
    id v10 = [v12 firstChildOfType:61453];
    if (v10)
    {
      id v11 = objc_alloc_init(OADTextBody);
      +[PBTextBlock readClientTextBox:v10 textBody:v11 state:v9];
      [v7 setTextBody:v11];
    }
  }
}

+ (id)readClientTextBoxFromShape:(id)a3 toTextBody:(id)a4 state:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v29 = a5;
  objc_opt_class();
  id v9 = [v29 presentationState];
  objc_opt_class();
  id v10 = v7;
  objc_opt_class();
  id v11 = [v10 firstChildOfType:61457];
  if (v11) {
    +[PBProgTag readClientData:v11 state:v9];
  }
  objc_opt_class();
  id v12 = [v10 firstChildOfType:61453];
  if ([v12 childCount])
  {
    v13 = [v12 firstChildOfType:3998];
    Atom = (unsigned int *)ESDAtomAccess<PptOutlineTextRefAtom>::extractAtom(v13, 0);

    if (Atom)
    {
      uint64_t v15 = Atom[12];
      id v16 = (void *)[v9 currentSlideTextBlockRecordIndexRangeVector];
      if (v15 < ((v16[1] - *v16) >> 4))
      {
        id v17 = (unint64_t *)(*v16 + 16 * v15);
        unint64_t v18 = v17[1];
        if (v18)
        {
          id v28 = v8;
          unint64_t v19 = *v17;
          uint64_t v20 = [(ESDObject *)[ESDContainer alloc] initWithType:61453];
          if (v20)
          {
            if (v19 < v18 + v19)
            {
              do
              {
                uint64_t v21 = [v9 sourceSlideListHolder];
                uint64_t v22 = [v21 childAt:v19];
                [(ESDContainer *)v20 addChild:v22];

                ++v19;
                --v18;
              }
              while (v18);
            }
            if ([(ESDContainer *)v20 childCount])
            {
              v23 = [(ESDContainer *)v20 firstChildOfType:3999];
            }
            unsigned int v24 = [v12 firstChildOfType:4006];
            if (v24) {
              [(ESDContainer *)v20 addChild:v24];
            }
            if ([(ESDContainer *)v20 childCount]) {
              +[PBTextBlock readClientTextBox:v20 textBody:v28 state:v9];
            }
          }
          id v8 = v28;
        }
      }
    }
    else
    {
      BOOL v25 = [v12 firstChildOfType:3999];
      v26 = ESDAtomAccess<PptTextHeaderAtom>::extractAtom(v25, 0);

      if (v26) {
        +[PBTextBlock readClientTextBox:v12 textBody:v8 state:v9];
      }
    }
  }

  return v12;
}

+ (BOOL)readClientTextBoxFromShape:(id)a3 toGraphic:(id)a4 clientData:(id)a5 state:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  int v14 = [v13 presentationState];
  uint64_t v15 = objc_opt_class();
  id v16 = TSUDynamicCast(v15, (uint64_t)v11);
  if (v16)
  {
    char v31 = v12;
    id v17 = objc_alloc_init(OADTextBody);
    unint64_t v18 = [a1 readClientTextBoxFromShape:v10 toTextBody:v17 state:v13];
    unint64_t v19 = v18;
    BOOL v20 = v18 != 0;
    if (v18)
    {
      uint64_t v21 = [v18 firstChildOfType:3998];
      Atom = ESDAtomAccess<PptOutlineTextRefAtom>::extractAtom(v21, 0);

      if (!Atom)
      {
        v23 = [v19 firstChildOfType:3999];
        unsigned int v24 = (unsigned int *)ESDAtomAccess<PptTextHeaderAtom>::extractAtom(v23, 0);

        if (v24)
        {
          uint64_t v25 = +[PBPlaceholder placeholderTypeFromTextType:v24[12]];
          if (v25 != -1 && ([v31 hasPlaceholder] & 1) == 0)
          {
            v30 = [v14 tgtSlide];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass) {
              [v31 setInheritedTextStylePlaceholderType:v25];
            }
          }
          BOOL v27 = +[PDPlaceholder isTextType:](PDPlaceholder, "isTextType:", v25, v30);
          id v28 = [v16 shapeProperties];
          [v28 setIsTextBox:v27];
        }
      }
      [v16 setTextBody:v17];
    }

    id v12 = v31;
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

+ (BOOL)xmlEquivalentOfDrawableCanBeUsed
{
  return 1;
}

+ (int)oadSchemeColorValueForEshSchemeColorIndex:(unsigned __int16)a3 state:(id)a4
{
  return +[PBColorScheme oadSchemeColorValueForEshSchemeColorIndex:](PBColorScheme, "oadSchemeColorValueForEshSchemeColorIndex:", a3, a4);
}

+ (id)readDrawableFromPackagePart:(id)a3 foundInObject:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v59 = a4;
  id v55 = a5;
  objc_opt_class();
  id v9 = v55;
  v57 = [v9 presentationState];
  id v10 = [v9 xmlDrawingState];
  id v11 = [v10 client];
  uint64_t v12 = [v11 presentationState];

  BOOL v56 = (void *)v12;
  id v13 = [v57 tgtSlide];
  [v10 setPackagePart:v8];
  int v14 = [v13 styleMatrix];
  [v10 setStyleMatrix:v14];

  uint64_t v15 = [v13 colorScheme];
  [v10 setColorScheme:v15];

  id v16 = [v13 colorMap];
  [v10 setColorMap:v16];

  id v17 = [v13 fontScheme];
  [v10 setFontScheme:v17];

  xmlNodePtr v18 = OCXGetRootElement((_xmlDoc *)[v8 xmlDocument]);
  unsigned int v58 = [(id)v12 PXPresentationMLNamespace];
  unint64_t v19 = [v8 contentType];
  LOBYTE(v12) = [v19 isEqualToString:@"application/vnd.ms-office.DrsConnector+xml"];

  if (v12)
  {
    BOOL v20 = off_264D60558;
LABEL_11:
    id v29 = [(__objc2_class *)*v20 readFromXmlNode:v18 inNamespace:v58 drawingState:v10];
    goto LABEL_12;
  }
  uint64_t v21 = [v8 contentType];
  char v22 = [v21 isEqualToString:@"application/vnd.ms-office.DrsE2oDoc+xml"];

  if (v22)
  {
    BOOL v20 = off_264D60560;
    goto LABEL_11;
  }
  v23 = [v8 contentType];
  char v24 = [v23 isEqualToString:@"application/vnd.ms-office.DrsGroupShape+xml"];

  if (v24)
  {
    BOOL v20 = off_264D60568;
    goto LABEL_11;
  }
  uint64_t v25 = [v8 contentType];
  char v26 = [v25 isEqualToString:@"application/vnd.ms-office.DrsPicture+xml"];

  if (v26)
  {
    BOOL v20 = off_264D60570;
    goto LABEL_11;
  }
  BOOL v27 = [v8 contentType];
  int v28 = [v27 isEqualToString:@"application/vnd.ms-office.DrsShape+xml"];

  if (v28)
  {
    BOOL v20 = off_264D60578;
    goto LABEL_11;
  }
  id v29 = 0;
LABEL_12:
  uint64_t v30 = objc_opt_class();
  char v31 = TSUDynamicCast(v30, (uint64_t)v29);
  if (v31)
  {
    v32 = objc_opt_new();
    id v33 = (id)[a1 readClientTextBoxFromShape:v59 toTextBody:v32 state:v9];
    BOOL v34 = [v31 textBody];
    char v35 = [v34 isSimilarToTextBody:v32];

    if ((v35 & 1) == 0)
    {
      uint64_t v36 = [v59 eshShape];
      if (v36)
      {
        v37 = [v32 properties];
        +[OABTextBodyProperties readTextBodyProperties:v37 textBox:v36 + 272 useDefaults:0 state:v9];
      }
      [v31 setTextBody:v32];
    }
  }
  uint64_t v38 = objc_opt_class();
  v39 = TSUDynamicCast(v38, (uint64_t)v59);
  if (v39)
  {
    uint64_t v40 = objc_opt_class();
    v41 = [v39 firstChildOfType:61457];
    v42 = TSUDynamicCast(v40, (uint64_t)v41);

    if (v42)
    {
      v43 = [v42 firstChildOfType:1055];
      Atom = ESDAtomAccess<PptRoundTripShapeIdAtom>::extractAtom(v43, 0);

      char v45 = [v9 useXmlBlobs];
      char v46 = Atom ? v45 : 0;
      if (v46)
      {
        int v53 = Atom[12];
        id v54 = [v9 presentationState];
        uint64_t v47 = objc_opt_class();
        v48 = [v54 tgtSlide];
        v49 = TSUDynamicCast(v47, (uint64_t)v48);

        if (v49)
        {
          v50 = [v49 slideLayout];
          v51 = [v50 drawables];
          v60[0] = MEMORY[0x263EF8330];
          v60[1] = 3221225472;
          v60[2] = __75__PBOfficeArtReaderClient_readDrawableFromPackagePart_foundInObject_state___block_invoke;
          v60[3] = &unk_264D684D0;
          id v61 = v29;
          int v62 = v53;
          [v51 enumerateObjectsUsingBlock:v60];
        }
      }
    }
  }
  return v29;
}

void __75__PBOfficeArtReaderClient_readDrawableFromPackagePart_foundInObject_state___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v14 = a2;
  if ([*(id *)(a1 + 32) id] == *(_DWORD *)(a1 + 40))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [v14 clientData];
    id v8 = TSUDynamicCast(v6, (uint64_t)v7);

    id v9 = [v8 placeholder];
    if (v9)
    {
      uint64_t v10 = objc_opt_class();
      id v11 = [*(id *)(a1 + 32) clientData];
      uint64_t v12 = TSUDynamicCast(v10, (uint64_t)v11);

      id v13 = [v12 placeholder];
      objc_msgSend(v13, "setIndex:", objc_msgSend(v9, "index"));
    }
    *a4 = 1;
  }
}

+ (void)readClientAnchorFromContainer:(id)a3 toDrawable:(id)a4 state:(id)a5
{
  id v31 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [v31 firstChildOfType:61456];
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = (const void *)[v9 eshObject];
    if (v11) {
    else
    }
      uint64_t v12 = 0;
    if ((int)[v8 groupDepth] <= 0) {
      float v13 = 0.125;
    }
    else {
      float v13 = 1.0;
    }
    int v15 = v12[7];
    int v14 = v12[8];
    int v17 = v12[9];
    int v16 = v12[10];
    xmlNodePtr v18 = [v7 drawableProperties];
    int v19 = [v18 hasOrientedBounds];
    double v20 = (float)(v13 * (float)v15);
    double v21 = (float)(v13 * (float)v14);
    double v22 = (float)(v13 * (float)(v17 - v15));
    double v23 = (float)(v13 * (float)(v16 - v14));

    if (v19)
    {
      char v24 = [v7 drawableProperties];
      uint64_t v25 = [v24 orientedBounds];

      [v25 rotation];
      if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
      {
        double v20 = NSTransposedRectWithSameCenter(v20, v21, v22, v23);
        double v21 = v26;
        double v22 = v27;
        double v23 = v28;
      }
      objc_msgSend(v25, "setBounds:", v20, v21, v22, v23);
    }
    else
    {
      id v29 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", v20, v21, v22, v23);
      uint64_t v30 = [v7 drawableProperties];
      [v30 setOrientedBounds:v29];

      uint64_t v25 = v29;
    }
  }
}

+ (BOOL)readRecolorInfoFromClientDataHolder:(id)a3 toClientData:(id)a4 state:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 firstChildOfType:61457];
  uint64_t v12 = v11;
  if (v11)
  {
    float v13 = [v11 firstChildOfType:4071];
    int v14 = v13;
    if (v13 && (int v15 = (const void *)[v13 eshObject]) != 0)
    {
      id v29 = v9;
      if (v16)
      {
        int v17 = v16;
        id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v19 = *((void *)v17 + 7) - *((void *)v17 + 6);
        if ((__int16)((int)v19 >> 3) >= 1)
        {
          LOWORD(v20) = 0;
          unsigned int v21 = v19 >> 3;
          do
          {
            objc_msgSend(a1, "addRecolorSpec:toDictionary:state:", XlChartDataSeries::getCachedCustomFormat(v17, (__int16)v20), v18, v10);
            int v20 = (__int16)(v20 + 1);
          }
          while (v20 < (__int16)v21);
        }
        id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v23 = *((void *)v17 + 10) - *((void *)v17 + 9);
        if ((__int16)((int)v23 >> 3) >= 1)
        {
          LOWORD(v24) = 0;
          unsigned int v25 = v23 >> 3;
          do
          {
            objc_msgSend(a1, "addRecolorSpec:toDictionary:state:", XlChartDataSeries::getCachedCustomLabel(v17, (__int16)v24), v22, v10);
            int v24 = (__int16)(v24 + 1);
          }
          while (v24 < (__int16)v25);
        }
        double v26 = [[OADImageRecolorInfo alloc] initWithColors:v18 fills:v22];
        [v29 setImageRecolorInfo:v26];

        BOOL v27 = 1;
      }
      else
      {
        BOOL v27 = 0;
      }
      id v9 = v29;
    }
    else
    {
      BOOL v27 = 0;
    }
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

+ (void)addRecolorSpec:(const PptRecolorSpec *)a3 toDictionary:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (a3->var3)
  {
    EshColor::EshColor(&v14, &a3->var2);
    unsigned int Red = EshColor::getRed(&v14);
    unsigned int Green = EshColor::getGreen(&v14);
    id v11 = +[OITSUColor colorWithCalibratedRed:(double)Red / 255.0 green:(double)Green / 255.0 blue:(double)EshColor::getBlue(&v14) / 255.0 alpha:1.0];
    EshColor::EshColor(&v13, &a3->var1);
    uint64_t v12 = +[OABColor readColor:&v13 colorPropertiesManager:0 state:v8];
    [v7 setObject:v12 forKey:v11];
  }
}

+ (id)newTargetFromDrawable:(id)a3 clientData:(id)a4 buildType:(int)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v7 shapeProperties],
          id v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 isTextBox],
          v9,
          (v10 & 1) != 0))
    {
      id v11 = off_264D60600;
    }
    else
    {
      id v11 = off_264D605F0;
    }
    uint64_t v12 = (PDAnimationOleChartTarget *)objc_alloc_init(*v11);
    [(PDAnimationShapeTarget *)v12 setDrawable:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v7;
      if ([v8 hasOleChart])
      {
        uint64_t v12 = objc_alloc_init(PDAnimationOleChartTarget);
        [(PDAnimationShapeTarget *)v12 setDrawable:v14];
        if ((a5 - 7) >= 4) {
          uint64_t v15 = 0;
        }
        else {
          uint64_t v15 = (a5 - 6);
        }
        [(PDAnimationOleChartTarget *)v12 setChartSubElementType:v15];
      }
      else
      {
        int v16 = [v14 ole];
        int v17 = [v16 object];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          uint64_t v12 = objc_alloc_init(PDAnimationSoundTarget);
        }
        else {
          uint64_t v12 = objc_alloc_init(PDAnimationShapeTarget);
        }
        [(PDAnimationShapeTarget *)v12 setDrawable:v14];
      }
    }
    else
    {
      uint64_t v12 = 0;
    }
  }

  return v12;
}

+ (int)presetIdFromFlyMethod:(int)a3 isEntrance:(BOOL)a4
{
  if (a3 > 51)
  {
    if (a3 <= 71)
    {
      if (a3 == 52) {
        return 15;
      }
      if (a3 == 62)
      {
        BOOL v5 = !a4;
        int v6 = 50;
        int v7 = 17;
LABEL_22:
        if (v5) {
          return v6;
        }
        else {
          return v7;
        }
      }
    }
    else
    {
      if (a3 == 72) {
        return 23;
      }
      if (a3 == 82) {
        return 19;
      }
    }
    return 1;
  }
  int result = 24;
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      int result = 3;
      break;
    case 3:
      int result = 5;
      break;
    case 5:
      int result = 9;
      break;
    case 6:
      int result = 10;
      break;
    case 8:
      int result = 14;
      break;
    case 9:
      int result = 18;
      break;
    case 10:
      int result = 22;
      break;
    case 11:
      int result = 4;
      break;
    case 12:
      int result = 2;
      break;
    case 13:
      int result = 16;
      break;
    case 14:
      int result = 11;
      break;
    case 17:
      BOOL v5 = !a4;
      int v6 = 10;
      int v7 = 160;
      goto LABEL_22;
    case 19:
      int result = 20;
      break;
    case 26:
      int result = 21;
      break;
    case 32:
      int result = 7;
      break;
    case 42:
      int result = 12;
      break;
    default:
      return 1;
  }
  return result;
}

+ (int)directionFromFlyDirection:(int)a3
{
  if (a3 > 0x47) {
    return 1;
  }
  else {
    return *(_DWORD *)&asc_238EEFCF0[4 * a3];
  }
}

+ (id)newBuildFromBuildType:(int)a3
{
  if ((a3 - 2) <= 4)
  {
    v4 = objc_alloc_init(PDParagraphBuild);
    [(PDParagraphBuild *)v4 setBuildLevel:(a3 - 1)];
    [(PDParagraphBuild *)v4 setType:2];
    goto LABEL_5;
  }
  if ((a3 - 7) <= 3)
  {
    v4 = [[PDChartBuild alloc] initWithBuildType:(a3 - 6)];
LABEL_5:
    if (!a3) {
      return v4;
    }
    goto LABEL_8;
  }
  v4 = 0;
  if (!a3) {
    return v4;
  }
LABEL_8:
  if (v4) {
    return v4;
  }
  return objc_alloc_init(PDBuild);
}

@end