@interface PXOfficeArtClient
+ (int)readPlaceholderBoundsTrackFromNode:(_xmlNode *)a3;
+ (int)readPlaceholderTypeFromNode:(_xmlNode *)a3;
- (BOOL)chartAutoFillIsHollow;
- (BOOL)chartAutoStrokeIsHollow;
- (PXOfficeArtClient)initWithState:(id)a3;
- (PXPresentationState)presentationState;
- (id)readClientTextField:(_xmlNode *)a3 identity:(id)a4 paragraph:(id)a5 state:(id)a6;
- (id)readOle:(_xmlNode *)a3 state:(id)a4;
- (void)postprocessHyperlink:(id)a3 relationship:(id)a4 state:(id)a5;
- (void)readBlipExtWithURI:(id)a3 fromNode:(_xmlNode *)a4 toDrawable:(id)a5 state:(id)a6;
- (void)readClientDataFromGraphicalFramePropertiesNode:(_xmlNode *)a3 toDrawable:(id)a4 state:(id)a5;
- (void)readClientDataFromPictureNode:(_xmlNode *)a3 toImage:(id)a4 state:(id)a5;
- (void)readClientDataFromShapeNode:(_xmlNode *)a3 toShape:(id)a4 state:(id)a5;
@end

@implementation PXOfficeArtClient

- (PXOfficeArtClient)initWithState:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXOfficeArtClient;
  v5 = [(PXOfficeArtClient *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->mPresentationState, v4);
  }

  return v6;
}

- (void)readClientDataFromShapeNode:(_xmlNode *)a3 toShape:(id)a4 state:(id)a5
{
  id v19 = a4;
  if (xmlStrEqual(a3->name, (const xmlChar *)"sp"))
  {
    v7 = "nvSpPr";
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"cxnSp"))
  {
    v7 = "nvCxnSpPr";
  }
  else if (xmlStrEqual(a3->name, (const xmlChar *)"pic"))
  {
    v7 = "nvPicPr";
  }
  else
  {
    v7 = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->mPresentationState);
  v9 = [WeakRetained PXPresentationMLNamespace];
  v10 = (_xmlNode *)OCXFindChild(a3, v9, v7);

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->mPresentationState);
    v12 = [v11 PXPresentationMLNamespace];
    v13 = (_xmlNode *)OCXFindChild(v10, v12, "nvPr");

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->mPresentationState);
      v15 = [v14 PXPresentationMLNamespace];
      v16 = (_xmlNode *)OCXFindChild(v13, v15, "ph");

      if (v16)
      {
        v17 = [v19 ensureClientDataOfClass:objc_opt_class()];
        v18 = objc_alloc_init(PDPlaceholder);
        [v17 setPlaceholder:v18];
        -[PDPlaceholder setType:](v18, "setType:", [(id)objc_opt_class() readPlaceholderTypeFromNode:v16]);
        [(PDPlaceholder *)v18 setIndex:CXDefaultUnsignedLongAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx", 0)];
        -[PDPlaceholder setBoundsTrack:](v18, "setBoundsTrack:", [(id)objc_opt_class() readPlaceholderBoundsTrackFromNode:v16]);
      }
    }
  }
}

+ (int)readPlaceholderTypeFromNode:(_xmlNode *)a3
{
  v3 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"type", 0);
  if (!v3) {
    goto LABEL_6;
  }
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_51, 0, &dword_238A75000);
  }
  if (PXPlaceholderTypeEnumMap(void)::once != -1) {
    dispatch_once(&PXPlaceholderTypeEnumMap(void)::once, &__block_literal_global_102);
  }
  int v4 = [(id)PXPlaceholderTypeEnumMap(void)::theEnumMap valueForString:v3];
  if (v4 == -130883970) {
LABEL_6:
  }
    int v4 = 8;

  return v4;
}

+ (int)readPlaceholderBoundsTrackFromNode:(_xmlNode *)a3
{
  NoNsProp = xmlGetNoNsProp(a3, (const xmlChar *)"boundsTrack");
  if (!NoNsProp) {
    return 0;
  }
  int v4 = NoNsProp;
  if (xmlStrEqual(NoNsProp, (const xmlChar *)"slide")) {
    int v5 = 1;
  }
  else {
    int v5 = 2 * (xmlStrEqual(v4, (const xmlChar *)"union") != 0);
  }
  ((void (*)(const xmlChar *))*MEMORY[0x263F8C880])(v4);
  return v5;
}

- (void)readClientDataFromPictureNode:(_xmlNode *)a3 toImage:(id)a4 state:(id)a5
{
  id v18 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mPresentationState);
  objc_super v8 = [WeakRetained PXPresentationMLNamespace];
  v9 = (_xmlNode *)OCXFindChild(a3, v8, "nvPicPr");

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->mPresentationState);
    id v11 = [v10 PXPresentationMLNamespace];
    v12 = (_xmlNode *)OCXFindChild(v9, v11, "nvPr");

    if (v12)
    {
      v13 = [v18 ensureClientDataOfClass:objc_opt_class()];
      id v14 = objc_loadWeakRetained((id *)&self->mPresentationState);
      v15 = [v14 PXPresentationMLNamespace];
      v16 = (_xmlNode *)OCXFindChild(v12, v15, "ph");

      if (v16)
      {
        v17 = objc_alloc_init(PDPlaceholder);
        [v13 setPlaceholder:v17];
        -[PDPlaceholder setType:](v17, "setType:", [(id)objc_opt_class() readPlaceholderTypeFromNode:v16]);
        [(PDPlaceholder *)v17 setIndex:CXDefaultUnsignedLongAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx", 0)];
      }
    }
  }
}

- (void)postprocessHyperlink:(id)a3 relationship:(id)a4 state:(id)a5
{
  id v16 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = [v16 action];
  if ([v9 isEqualToString:@"ppaction://hlinksldjump"])
  {
    id v10 = [v7 type];
    char v11 = [v10 hasSuffix:@"/slide"];

    if ((v11 & 1) == 0) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    v12 = [v7 targetLocation];
    v13 = [v8 documentState];
    uint64_t v14 = [v13 slideIndexForSlideURL:v12];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    v15 = objc_msgSend(@"ppaction://hlinksldjump?slideindex=", "stringByAppendingFormat:", @"%ld", v14 + 1);

    [v16 setAction:v15];
  }
  else
  {
    v15 = v9;
  }
}

- (id)readOle:(_xmlNode *)a3 state:(id)a4
{
  id v37 = a4;
  location = (id *)&self->mPresentationState;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mPresentationState);
  id v7 = [WeakRetained PXPresentationMLNamespace];
  id v8 = (_xmlNode *)OCXFindChild(a3, v7, "oleObj");

  if (!v8) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v9 = CXDefaultStringAttribute(v8, (CXNamespace *)CXNoNamespace, (xmlChar *)"progId", 0);
  if (+[OADOle isProgIDChart:v9])
  {
    v35 = v9;
    id v10 = (void *)MEMORY[0x23EC9A170]();
    char v11 = [v37 packagePart];
    v12 = [v11 package];
    v13 = [v37 OCXReadRequiredRelationshipForNode:v8 packagePart:v11];
    uint64_t v14 = [v13 targetLocation];
    v15 = [v12 partForLocation:v14];

    id v16 = [v15 data];
    v17 = [v37 documentState];
    id v18 = [v17 cancelDelegate];

    if ([v35 hasSuffix:@".12"])
    {
      id v19 = [(OCDReader *)[EXReader alloc] initWithCancelDelegate:v18];
      if ([(OCXReader *)v19 start])
      {
        [(OCDReader *)v19 setData:v16];
        v20 = [(EXReader *)v19 read];
      }
      else
      {
        v20 = 0;
      }

      v21 = 0;
    }
    else
    {
      v21 = +[OABOle readFromData:v16 cancel:v18];
      v20 = 0;
    }

    v22 = [v13 targetLocation];
    v9 = v35;
    [v12 resetPartForLocation:v22];

    if (v21) {
      goto LABEL_16;
    }
  }
  else
  {
    v20 = 0;
  }
  v23 = objc_alloc_init(OADOle);
  v21 = v23;
  if (v20) {
    [(OADOle *)v23 setObject:v20];
  }
  if (v9) {
    [v21 setAnsiProgID:v9];
  }
LABEL_16:
  v24 = [v37 oavState];
  id v38 = 0;
  CXOptionalStringAttribute(v8, (void *)CXNoNamespace, (xmlChar *)"spid", &v38);
  id v25 = v38;
  if (v25)
  {
    v26 = [v24 drawableForVmlShapeId:v25];
    if (v26) {
      goto LABEL_22;
    }
  }
  else
  {
    id v27 = objc_loadWeakRetained(location);
    v28 = [v27 PXPresentationMLNamespace];
    uint64_t v29 = OCXFindChild(v8, v28, "pic");

    if (v29)
    {
      id v30 = objc_loadWeakRetained(location);
      v31 = [v30 PXPresentationMLNamespace];
      uint64_t v32 = +[OAXDrawable readDrawableFromXmlNode:v29 inNamespace:v31 drawingState:v37];

      v26 = (OADImage *)v32;
      if (v32) {
        goto LABEL_22;
      }
    }
  }
  v26 = objc_alloc_init(OADImage);
LABEL_22:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v33 = v26;
    [(OADImage *)v33 setOle:v21];
    [v24 addDualDrawable:v33];
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)readClientDataFromGraphicalFramePropertiesNode:(_xmlNode *)a3 toDrawable:(id)a4 state:(id)a5
{
  id v15 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mPresentationState);
  id v8 = [WeakRetained PXPresentationMLNamespace];
  v9 = (_xmlNode *)OCXFindChild(a3, v8, "nvPr");

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->mPresentationState);
    char v11 = [v10 PXPresentationMLNamespace];
    v12 = (_xmlNode *)OCXFindChild(v9, v11, "ph");

    if (v12)
    {
      v13 = [v15 ensureClientDataOfClass:objc_opt_class()];
      uint64_t v14 = objc_alloc_init(PDPlaceholder);
      [v13 setPlaceholder:v14];
      -[PDPlaceholder setType:](v14, "setType:", [(id)objc_opt_class() readPlaceholderTypeFromNode:v12]);
      [(PDPlaceholder *)v14 setIndex:CXDefaultUnsignedLongAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx", 0)];
    }
  }
}

- (PXPresentationState)presentationState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mPresentationState);
  return (PXPresentationState *)WeakRetained;
}

- (id)readClientTextField:(_xmlNode *)a3 identity:(id)a4 paragraph:(id)a5 state:(id)a6
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v7 type];
  int v10 = [v9 isEqualToString:@"slidenum"];

  if (v10)
  {
    char v11 = [v8 addSlideNumberField];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)readBlipExtWithURI:(id)a3 fromNode:(_xmlNode *)a4 toDrawable:(id)a5 state:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if ([a3 isEqualToString:@"{DAA4B4D4-6D71-4841-9C94-3DE7FCFB9230}"])
  {
    char v11 = (_xmlNode *)OCXFindChild(a4, (CXNamespace *)PXPowerPoint2010Namespace, "media");
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = TSUDynamicCast(v12, (uint64_t)v9);
    uint64_t v14 = (void *)v13;
    if (v11) {
      BOOL v15 = v13 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      id v16 = objc_alloc_init(OADVideoFile);
      v17 = (_xmlNode *)OCXFindChild(v11, (CXNamespace *)PXPowerPoint2010Namespace, "trim");
      id v18 = v17;
      if (v17)
      {
        double v28 = 0.0;
        double v29 = 0.0;
        CXOptionalDoubleAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"st", &v29);
        CXOptionalDoubleAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"end", &v28);
        HIDWORD(v19) = HIDWORD(v29);
        *(float *)&double v19 = v29;
        [(OADMovie *)v16 setMovieStartPoint:v19];
        HIDWORD(v20) = HIDWORD(v28);
        *(float *)&double v20 = v28;
        [(OADMovie *)v16 setMovieEndPoint:v20];
      }
      v21 = objc_msgSend(v10, "packagePart", *(void *)&v28);
      v22 = [v10 OCXReadRelationshipForNode:v11 attributeName:"embed" packagePart:v21];

      v23 = [v22 targetLocation];
      v24 = [OAXMovieContext alloc];
      id v25 = [v10 packagePart];
      v26 = [v25 package];
      id v27 = [(OCXDelayedMediaContext *)v24 initWithTargetLocation:v23 package:v26];

      [(OCDDelayedNode *)v16 setDelayedContext:v27];
      [(OADLinkedMediaFile *)v16 setUrl:v23];
      -[OADLinkedMediaFile setIsExternal:](v16, "setIsExternal:", [v22 targetMode] == 1);
      [v14 setMovie:v16];
    }
  }
}

- (BOOL)chartAutoFillIsHollow
{
  return 1;
}

- (BOOL)chartAutoStrokeIsHollow
{
  return 1;
}

- (void).cxx_destruct
{
}

@end