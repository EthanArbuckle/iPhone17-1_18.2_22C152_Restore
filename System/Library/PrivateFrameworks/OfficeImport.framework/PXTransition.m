@interface PXTransition
+ (BOOL)isPowerPoint2010TransitionType:(int)a3;
+ (BOOL)isPowerPoint2013TransitionType:(int)a3;
+ (BOOL)mapDirection:(id)a3 outDir:(int *)a4;
+ (TCEnumerationMap)directionAttributeMap;
+ (TCEnumerationMap)reverseDirectionAttributeMap;
+ (TCEnumerationMap)transitionNodeMap;
+ (int)readDirection:(_xmlNode *)a3 defaultValue:(int)a4;
+ (int)readInOut:(_xmlNode *)a3 defaultValue:(int)a4;
+ (int)readOrientation:(_xmlNode *)a3 attribute:(const char *)a4 defaultValue:(int)a5;
+ (int)readReverseDirection:(_xmlNode *)a3 defaultValue:(int)a4;
+ (void)readTransitionFromNode:(_xmlNode *)a3 tgtTransition:(id)a4 drawingState:(id)a5;
+ (void)writeDirection:(int)a3 file:(id)a4;
+ (void)writeInOut:(int)a3 file:(id)a4;
+ (void)writeOrientation:(int)a3 withAttributeName:(id)a4 file:(id)a5;
+ (void)writeReverseDirection:(int)a3 file:(id)a4;
+ (void)writeReverseInOut:(int)a3 file:(id)a4;
+ (void)writeReverseOrientation:(int)a3 withAttributeName:(id)a4 file:(id)a5;
+ (void)writeTransitionAttributes:(id)a3 attributePrefix:(id)a4 file:(id)a5;
+ (void)writeTransitionFromSlideBase:(id)a3 file:(id)a4 state:(id)a5;
+ (void)writeTransitionOptions:(id)a3 transitionType:(int)a4 file:(id)a5;
@end

@implementation PXTransition

+ (void)readTransitionFromNode:(_xmlNode *)a3 tgtTransition:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v44 = v8;
  [v8 setType:0];
  v42 = a3;
  v43 = v9;
  v10 = OCXFirstChild(a3);
  v11 = 0;
  while (v10)
  {
    if (xmlStrEqual(v10->name, (const xmlChar *)"sndAc"))
    {
      v12 = 0;
    }
    else
    {
      if (xmlStrEqual(v10->name, (const xmlChar *)"prstTrans")) {
        CXRequiredStringAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst");
      }
      else {
      v12 = [NSString stringWithCString:v10->name encoding:4];
      }
    }
    if (objc_msgSend(v12, "length", v42, v43))
    {
      v13 = [a1 transitionNodeMap];
      uint64_t v14 = [v13 valueForString:v12];

      if (v14 != -130883970)
      {
        [v8 setType:v14];
        v11 = v10;
      }
    }

    v10 = OCXNextSibling(v10);
  }
  int v15 = [v8 type];
  v16 = v42;
  v17 = 0;
  switch(v15)
  {
    case 0:
      break;
    case 2:
    case 3:
    case 5:
    case 14:
    case 38:
    case 51:
      uint64_t v18 = [a1 readOrientation:v11 attribute:"dir" defaultValue:0];
      v17 = objc_alloc_init(PDOrientationOptions);
      [(PDOrientationOptions *)v17 setOrientation:v18];
      break;
    case 6:
    case 18:
    case 23:
    case 30:
    case 36:
    case 44:
    case 52:
      uint64_t v37 = [a1 readDirection:v11 defaultValue:1];
      v17 = objc_alloc_init(PDSideDirectionOptions);
      [(PDOrientationOptions *)v17 setDirection:v37];
      break;
    case 7:
    case 35:
    case 40:
    case 45:
      if (v15 == 40) {
        uint64_t v19 = 8;
      }
      else {
        uint64_t v19 = 1;
      }
      uint64_t v20 = objc_msgSend(a1, "readDirection:defaultValue:", v11, v19, v42, v43);
      v17 = objc_alloc_init(PDEightDirectionOptions);
      [(PDOrientationOptions *)v17 setDirection:v20];
      break;
    case 9:
    case 34:
      uint64_t v26 = [a1 readDirection:v11 defaultValue:1];
      v17 = objc_alloc_init(PDPrismOptions);
      [(PDOrientationOptions *)v17 setDirection:v26];
      uint64_t v27 = CXDefaultBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"isContent", 0);
      uint64_t v28 = CXDefaultBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"isInverted", 0);
      [(PDOrientationOptions *)v17 setIsContent:v27];
      [(PDOrientationOptions *)v17 setIsInverted:v28];
      break;
    case 11:
    case 16:
      uint64_t v29 = CXDefaultBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"thruBlk", 0);
      v17 = objc_alloc_init(PDBlackOptions);
      [(PDOrientationOptions *)v17 setIsThroughBlack:v29];
      break;
    case 19:
      v17 = objc_alloc_init(PDInOutDirectionOptions);
      [(PDOrientationOptions *)v17 setInOut:1];
      break;
    case 20:
      uint64_t v30 = [a1 readDirection:v11 defaultValue:1];
      v17 = objc_alloc_init(PDEightDirectionOptions);
      [(PDOrientationOptions *)v17 setDirection:v30];
      break;
    case 21:
    case 41:
    case 46:
    case 53:
      BOOL v22 = v15 != 21 && v15 != 41;
      uint64_t v23 = objc_msgSend(a1, "readInOut:defaultValue:", v11, v22, v42, v43);
      v17 = objc_alloc_init(PDInOutDirectionOptions);
      [(PDOrientationOptions *)v17 setInOut:v23];
      break;
    case 24:
      uint64_t v31 = [a1 readReverseDirection:v11 defaultValue:3];
      v17 = objc_alloc_init(PDEightDirectionOptions);
      [(PDOrientationOptions *)v17 setDirection:v31];
      break;
    case 25:
    case 49:
      v17 = objc_alloc_init(PDRotationOptions);
      [(PDOrientationOptions *)v17 setDirection:1];
      break;
    case 28:
    case 29:
    case 31:
    case 50:
      uint64_t v24 = CXDefaultBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"invX", 0);
      uint64_t v25 = CXDefaultBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"invY", 0);
      v17 = objc_alloc_init(PDInvertCoordinateOptions);
      [(PDOrientationOptions *)v17 setIsInvX:v24];
      [(PDOrientationOptions *)v17 setIsInvY:v25];
      break;
    case 39:
      uint64_t v32 = [a1 readDirection:v11 defaultValue:1];
      v17 = objc_alloc_init(PDRevealOptions);
      [(PDOrientationOptions *)v17 setDirection:v32];
      [(PDOrientationOptions *)v17 setIsThroughBlack:CXDefaultBoolAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"thruBlk", 0)];
      break;
    case 42:
      uint64_t v33 = [a1 readOrientation:v11 attribute:"orient" defaultValue:0];
      uint64_t v34 = [a1 readInOut:v11 defaultValue:1];
      v17 = objc_alloc_init(PDSplitDirectionOptions);
      [(PDOrientationOptions *)v17 setInOut:v34];
      [(PDOrientationOptions *)v17 setOrientation:v33];
      break;
    case 43:
      uint64_t v35 = [a1 readDirection:v11 defaultValue:4];
      v17 = objc_alloc_init(PDCornerDirectionOptions);
      [(PDOrientationOptions *)v17 setDirection:v35];
      break;
    case 48:
      uint64_t v36 = CXDefaultLongAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"spokes", 4);
      v17 = objc_alloc_init(PDWheelDirectionOptions);
      [(PDOrientationOptions *)v17 setSpokes:v36];
      break;
    default:
      v17 = objc_alloc_init(PDTransitionOptions);
      break;
  }
  BOOL v47 = 1;
  if (CXOptionalBoolAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"advClick", &v47)) {
    [v44 setIsAdvanceOnClick:v47];
  }
  v38 = CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"spd", 0);
  v39 = v38;
  if (v38)
  {
    if ([v38 isEqualToString:@"slow"])
    {
      uint64_t v40 = 2;
    }
    else if ([v39 isEqualToString:@"med"])
    {
      uint64_t v40 = 1;
    }
    else
    {
      [v39 isEqualToString:@"fast"];
      uint64_t v40 = 0;
    }
    objc_msgSend(v44, "setSpeed:", v40, v42);
  }
  uint64_t v46 = 0;
  if (CXOptionalLongAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"advTm", &v46)) {
    [v44 setAdvanceAfterTime:v46];
  }
  uint64_t v45 = 0;
  if (CXOptionalLongAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"dur", &v45))
  {
    v41 = [NSNumber numberWithDouble:(double)v45 / 1000.0];
    [v44 setDuration:v41];
  }
  objc_msgSend(v44, "setOptions:", v17, v42);
}

+ (int)readDirection:(_xmlNode *)a3 defaultValue:(int)a4
{
  id v10 = 0;
  BOOL v6 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"dir", &v10);
  id v7 = v10;
  if (v6)
  {
    id v8 = [a1 directionAttributeMap];
    a4 = [v8 valueForString:v7];
  }
  return a4;
}

+ (int)readInOut:(_xmlNode *)a3 defaultValue:(int)a4
{
  id v9 = 0;
  BOOL v5 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"dir", &v9);
  id v6 = v9;
  id v7 = v6;
  if (v5)
  {
    if ([v6 isEqualToString:@"out"])
    {
      a4 = 1;
    }
    else if ([v7 isEqualToString:@"in"])
    {
      a4 = 0;
    }
  }

  return a4;
}

+ (int)readOrientation:(_xmlNode *)a3 attribute:(const char *)a4 defaultValue:(int)a5
{
  id v10 = 0;
  BOOL v6 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)a4, &v10);
  id v7 = v10;
  id v8 = v7;
  if (v6)
  {
    if ([v7 isEqualToString:@"horz"])
    {
      a5 = 0;
    }
    else if ([v8 isEqualToString:@"vert"])
    {
      a5 = 1;
    }
  }

  return a5;
}

+ (TCEnumerationMap)transitionNodeMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_53, 0, &dword_238A75000);
  }
  if (+[PXTransition transitionNodeMap]::onceToken != -1) {
    dispatch_once(&+[PXTransition transitionNodeMap]::onceToken, &__block_literal_global_104);
  }
  v2 = (void *)+[PXTransition transitionNodeMap]::sTransitionNodeMap;
  return (TCEnumerationMap *)v2;
}

void __33__PXTransition_transitionNodeMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PXTransition transitionNodeMap]::sTransitionNodeStructs count:53 caseSensitive:1];
  v1 = (void *)+[PXTransition transitionNodeMap]::sTransitionNodeMap;
  +[PXTransition transitionNodeMap]::sTransitionNodeMap = (uint64_t)v0;
}

+ (TCEnumerationMap)directionAttributeMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_182_0, 0, &dword_238A75000);
  }
  if (+[PXTransition directionAttributeMap]::onceToken != -1) {
    dispatch_once(&+[PXTransition directionAttributeMap]::onceToken, &__block_literal_global_184);
  }
  v2 = (void *)+[PXTransition directionAttributeMap]::sDirectionAttributeMap;
  return (TCEnumerationMap *)v2;
}

void __37__PXTransition_directionAttributeMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PXTransition directionAttributeMap]::sDirectionAttributeStructs count:8 caseSensitive:1];
  v1 = (void *)+[PXTransition directionAttributeMap]::sDirectionAttributeMap;
  +[PXTransition directionAttributeMap]::sDirectionAttributeMap = (uint64_t)v0;
}

+ (TCEnumerationMap)reverseDirectionAttributeMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_185_0, 0, &dword_238A75000);
  }
  if (+[PXTransition reverseDirectionAttributeMap]::onceToken != -1) {
    dispatch_once(&+[PXTransition reverseDirectionAttributeMap]::onceToken, &__block_literal_global_187_0);
  }
  v2 = (void *)+[PXTransition reverseDirectionAttributeMap]::sReverseDirectionAttributeMap;
  return (TCEnumerationMap *)v2;
}

void __44__PXTransition_reverseDirectionAttributeMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PXTransition reverseDirectionAttributeMap]::sReverseDirectionAttributeStructs count:8 caseSensitive:1];
  v1 = (void *)+[PXTransition reverseDirectionAttributeMap]::sReverseDirectionAttributeMap;
  +[PXTransition reverseDirectionAttributeMap]::sReverseDirectionAttributeMap = (uint64_t)v0;
}

+ (BOOL)isPowerPoint2010TransitionType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = (void *)+[PXTransition isPowerPoint2010TransitionType:]::ppt2010TransitionTypes;
  if (!+[PXTransition isPowerPoint2010TransitionType:]::ppt2010TransitionTypes)
  {
    id v5 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v33 = [NSNumber numberWithInt:14];
    uint64_t v25 = [NSNumber numberWithInt:51];
    uint64_t v6 = [NSNumber numberWithInt:40];
    uint64_t v24 = [NSNumber numberWithInt:45];
    id v7 = [NSNumber numberWithInt:20];
    id v8 = [NSNumber numberWithInt:24];
    uint64_t v31 = [NSNumber numberWithInt:21];
    uint64_t v30 = [NSNumber numberWithInt:41];
    uint64_t v32 = [NSNumber numberWithInt:46];
    uint64_t v29 = (void *)v6;
    uint64_t v23 = [NSNumber numberWithInt:53];
    id v9 = [NSNumber numberWithInt:6];
    BOOL v22 = [NSNumber numberWithInt:9];
    uint64_t v28 = [NSNumber numberWithInt:18];
    uint64_t v27 = [NSNumber numberWithInt:23];
    v21 = [NSNumber numberWithInt:30];
    uint64_t v20 = [NSNumber numberWithInt:44];
    uint64_t v26 = [NSNumber numberWithInt:39];
    uint64_t v19 = [NSNumber numberWithInt:34];
    uint64_t v18 = [NSNumber numberWithInt:19];
    unsigned int v16 = v3;
    v17 = [NSNumber numberWithInt:49];
    id v10 = [NSNumber numberWithInt:25];
    uint64_t v11 = objc_msgSend(v5, "initWithObjects:", v33, v25, v29, v24, v7, v8, v31, v30, v32, v23, v9, v22, v28, v27, v21, v20, v26,
            v19,
            v18,
            v17,
            v10,
            0);
    v12 = (void *)+[PXTransition isPowerPoint2010TransitionType:]::ppt2010TransitionTypes;
    +[PXTransition isPowerPoint2010TransitionType:]::ppt2010TransitionTypes = v11;

    v4 = (void *)+[PXTransition isPowerPoint2010TransitionType:]::ppt2010TransitionTypes;
    uint64_t v3 = v16;
  }
  v13 = [NSNumber numberWithInt:v3];
  char v14 = [v4 containsObject:v13];

  return v14;
}

+ (BOOL)isPowerPoint2013TransitionType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = (void *)+[PXTransition isPowerPoint2013TransitionType:]::ppt2013TransitionTypes;
  if (!+[PXTransition isPowerPoint2013TransitionType:]::ppt2013TransitionTypes)
  {
    id v5 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v29 = [NSNumber numberWithInt:1];
    uint64_t v28 = [NSNumber numberWithInt:5];
    uint64_t v6 = [NSNumber numberWithInt:8];
    id v7 = [NSNumber numberWithInt:10];
    uint64_t v27 = [NSNumber numberWithInt:15];
    uint64_t v8 = [NSNumber numberWithInt:17];
    id v9 = [NSNumber numberWithInt:22];
    uint64_t v26 = [NSNumber numberWithInt:27];
    uint64_t v25 = [NSNumber numberWithInt:29];
    id v10 = [NSNumber numberWithInt:28];
    uint64_t v24 = [NSNumber numberWithInt:31];
    unsigned int v22 = v3;
    uint64_t v23 = [NSNumber numberWithInt:33];
    uint64_t v11 = [NSNumber numberWithInt:50];
    v12 = (void *)v8;
    uint64_t v21 = v8;
    uint64_t v20 = v6;
    v13 = (void *)v6;
    char v14 = v12;
    uint64_t v15 = objc_msgSend(v5, "initWithObjects:", v29, v28, v20, v7, v27, v21, v9, v26, v25, v10, v24, v23, v11, 0);
    unsigned int v16 = (void *)+[PXTransition isPowerPoint2013TransitionType:]::ppt2013TransitionTypes;
    +[PXTransition isPowerPoint2013TransitionType:]::ppt2013TransitionTypes = v15;

    v4 = (void *)+[PXTransition isPowerPoint2013TransitionType:]::ppt2013TransitionTypes;
    uint64_t v3 = v22;
  }
  v17 = [NSNumber numberWithInt:v3];
  char v18 = [v4 containsObject:v17];

  return v18;
}

+ (void)writeTransitionOptions:(id)a3 transitionType:(int)a4 file:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned int v32 = 0;
  int v10 = [a1 mapDirection:v8 outDir:&v32];
  switch(a4)
  {
    case 2:
      uint64_t v21 = objc_opt_class();
      unsigned int v22 = TSUDynamicCast(v21, (uint64_t)v8);
      char v14 = v22;
      if (v22) {
        objc_msgSend(a1, "writeReverseOrientation:withAttributeName:file:", objc_msgSend(v22, "orientation"), @"dir", v9);
      }
      goto LABEL_37;
    case 3:
    case 5:
    case 14:
    case 38:
    case 51:
      uint64_t v12 = objc_opt_class();
      v13 = TSUDynamicCast(v12, (uint64_t)v8);
      char v14 = v13;
      if (v13) {
        objc_msgSend(a1, "writeOrientation:withAttributeName:file:", objc_msgSend(v13, "orientation"), @"dir", v9);
      }
      goto LABEL_37;
    case 6:
    case 7:
    case 9:
    case 18:
    case 23:
    case 30:
    case 35:
    case 36:
    case 40:
    case 43:
    case 44:
    case 45:
    case 52:
      if (!v10) {
        break;
      }
      uint64_t v11 = v32;
      goto LABEL_4;
    case 11:
    case 16:
      uint64_t v17 = objc_opt_class();
      char v18 = TSUDynamicCast(v17, (uint64_t)v8);
      char v14 = v18;
      if (v18) {
        goto LABEL_10;
      }
      goto LABEL_37;
    case 19:
    case 41:
    case 53:
      uint64_t v15 = objc_opt_class();
      unsigned int v16 = TSUDynamicCast(v15, (uint64_t)v8);
      char v14 = v16;
      if (v16) {
        objc_msgSend(a1, "writeInOut:file:", objc_msgSend(v16, "inOut"), v9);
      }
      goto LABEL_37;
    case 20:
      if (!v10) {
        break;
      }
      uint64_t v11 = v32;
      if ((v32 & 0xFFFFFFFD) != 1)
      {
        uint64_t v11 = 1;
        unsigned int v32 = 1;
      }
LABEL_4:
      [a1 writeDirection:v11 file:v9];
      break;
    case 21:
    case 46:
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = TSUDynamicCast(v19, (uint64_t)v8);
      char v14 = v20;
      if (v20) {
        objc_msgSend(a1, "writeReverseInOut:file:", objc_msgSend(v20, "inOut"), v9);
      }
      goto LABEL_37;
    case 24:
      if (v10) {
        [a1 writeReverseDirection:v32 file:v9];
      }
      break;
    case 31:
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = TSUDynamicCast(v23, (uint64_t)v8);
      char v14 = v24;
      if (v24)
      {
        if ([v24 isInvX]) {
          [v9 writeAttribute:@"invX" BOOLContent:1];
        }
        if ([v14 isInvY]) {
          [v9 writeAttribute:@"invY" BOOLContent:1];
        }
      }
      goto LABEL_37;
    case 34:
      if (v10) {
        [a1 writeDirection:v32 file:v9];
      }
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = TSUDynamicCast(v25, (uint64_t)v8);
      char v14 = v26;
      if (v26)
      {
        objc_msgSend(v9, "writeAttribute:BOOLContent:", @"isContent", objc_msgSend(v26, "isContent"));
        objc_msgSend(v9, "writeAttribute:BOOLContent:", @"isInverted", objc_msgSend(v14, "isInverted"));
      }
      goto LABEL_37;
    case 39:
      if (v10) {
        [a1 writeDirection:v32 file:v9];
      }
      uint64_t v27 = objc_opt_class();
      char v18 = TSUDynamicCast(v27, (uint64_t)v8);
      char v14 = v18;
      if (v18) {
LABEL_10:
      }
        objc_msgSend(v9, "writeAttribute:BOOLContent:", @"thruBlk", objc_msgSend(v18, "isThroughBlack"));
      goto LABEL_37;
    case 42:
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = TSUDynamicCast(v28, (uint64_t)v8);
      char v14 = v29;
      if (v29)
      {
        objc_msgSend(a1, "writeOrientation:withAttributeName:file:", objc_msgSend(v29, "orientation"), @"orient", v9);
        objc_msgSend(a1, "writeInOut:file:", objc_msgSend(v14, "inOut"), v9);
      }
      goto LABEL_37;
    case 48:
      uint64_t v30 = objc_opt_class();
      uint64_t v31 = TSUDynamicCast(v30, (uint64_t)v8);
      char v14 = v31;
      if (v31) {
        objc_msgSend(v9, "writeAttribute:intContent:", @"spokes", (int)objc_msgSend(v31, "spokes"));
      }
LABEL_37:

      break;
    default:
      break;
  }
}

+ (void)writeTransitionFromSlideBase:(id)a3 file:(id)a4 state:(id)a5
{
  id v26 = a3;
  id v7 = a4;
  id v8 = [v26 transition];
  id v9 = v8;
  if (v8 && ([v8 hasType] & 1) != 0)
  {
    uint64_t v10 = [v9 type];
    if (!v10)
    {
      [v7 startElement:@"transition"];
      objc_msgSend(v7, "writeNamespace:uri:", @"p14", objc_msgSend((id)PXPowerPoint2010Namespace, "uri"));
      [a1 writeTransitionAttributes:v9 attributePrefix:@"p14" file:v7];
      [v7 endElement];
      goto LABEL_27;
    }
    objc_msgSend(v7, "startElement:prefix:ns:", @"AlternateContent", @"mc", objc_msgSend((id)OCXMarkupCompatibilityNamespace, "uri"));
    int v11 = [v9 hasTransitionOptions];
    if ([a1 isPowerPoint2013TransitionType:v10])
    {
      [v7 startElement:@"Choice" prefix:@"mc" ns:0];
      objc_msgSend(v7, "writeNamespace:uri:", @"p15", objc_msgSend((id)PXPowerPoint2012Namespace, "uri"));
      [v7 writeAttribute:@"Requires" content:@"p15" prefix:0 ns:0];
      [v7 startElement:@"transition"];
      objc_msgSend(v7, "writeNamespace:uri:", @"p14", objc_msgSend((id)PXPowerPoint2010Namespace, "uri"));
      [a1 writeTransitionAttributes:v9 attributePrefix:@"p14" file:v7];
      [v7 startElement:@"prstTrans" prefix:@"p15" ns:0];
      uint64_t v12 = [a1 transitionNodeMap];
      v13 = [v12 stringForValue:v10];
      [v7 writeAttribute:@"prst" content:v13];

      if (v11)
      {
        char v14 = [v9 options];
        [a1 writeTransitionOptions:v14 transitionType:v10 file:v7];
      }
      else
      {
        char v14 = 0;
      }
      [v7 endElement];
      [v7 endElement];
      [v7 endElement];
      unsigned int v16 = [v26 ppt2011Transition];

      if (!v16 || ([v26 ppt2011Transition], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v15 = 0;
LABEL_26:
        [v7 startElement:@"Fallback" prefix:@"mc" ns:0];
        [v7 startElement:@"transition"];
        uint64_t v23 = [v26 transition];
        [a1 writeTransitionAttributes:v23 attributePrefix:0 file:v7];

        uint64_t v24 = [a1 transitionNodeMap];
        uint64_t v25 = [v24 stringForValue:16];
        [v7 startElement:v25];

        [v7 endElement];
        [v7 endElement];
        [v7 endElement];
        [v7 endElement];

        goto LABEL_27;
      }
      id v15 = (id)v17;
    }
    else
    {
      id v15 = v9;
      char v14 = 0;
    }
    uint64_t v18 = [v15 type];
    [v7 startElement:@"Choice" prefix:@"mc" ns:0];
    objc_msgSend(v7, "writeNamespace:uri:", @"p14", objc_msgSend((id)PXPowerPoint2010Namespace, "uri"));
    [v7 writeAttribute:@"Requires" content:@"p14" prefix:0 ns:0];
    [v7 startElement:@"transition"];
    [a1 writeTransitionAttributes:v15 attributePrefix:@"p14" file:v7];
    if ([a1 isPowerPoint2010TransitionType:v18])
    {
      if (v18 == 53) {
        unsigned int v19 = 46;
      }
      else {
        unsigned int v19 = v18;
      }
      if (v19 == 9) {
        uint64_t v18 = 34;
      }
      else {
        uint64_t v18 = v19;
      }
      uint64_t v20 = [a1 transitionNodeMap];
      uint64_t v21 = [v20 stringForValue:v18];
      [v7 startElement:v21 prefix:@"p14" ns:0];
    }
    else
    {
      uint64_t v20 = [a1 transitionNodeMap];
      uint64_t v21 = [v20 stringForValue:v18];
      [v7 startElement:v21];
    }

    if ([v15 hasTransitionOptions])
    {
      uint64_t v22 = [v15 options];

      char v14 = (void *)v22;
      [a1 writeTransitionOptions:v22 transitionType:v18 file:v7];
    }
    [v7 endElement];
    [v7 endElement];
    [v7 endElement];
    goto LABEL_26;
  }
LABEL_27:
}

+ (int)readReverseDirection:(_xmlNode *)a3 defaultValue:(int)a4
{
  id v10 = 0;
  BOOL v6 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"dir", &v10);
  id v7 = v10;
  if (v6)
  {
    id v8 = [a1 reverseDirectionAttributeMap];
    a4 = [v8 valueForString:v7];
  }
  return a4;
}

+ (void)writeDirection:(int)a3 file:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  BOOL v6 = [a1 directionAttributeMap];
  id v7 = [v6 stringForValue:v4];
  [v8 writeAttribute:@"dir" content:v7];
}

+ (void)writeReverseDirection:(int)a3 file:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  BOOL v6 = [a1 reverseDirectionAttributeMap];
  id v7 = [v6 stringForValue:v4];
  [v8 writeAttribute:@"dir" content:v7];
}

+ (void)writeOrientation:(int)a3 withAttributeName:(id)a4 file:(id)a5
{
  if (a3 == 1) {
    BOOL v6 = @"vert";
  }
  else {
    BOOL v6 = @"horz";
  }
  [a5 writeAttribute:a4 content:v6];
}

+ (void)writeReverseOrientation:(int)a3 withAttributeName:(id)a4 file:(id)a5
{
  if (a3 == 1) {
    BOOL v6 = @"horz";
  }
  else {
    BOOL v6 = @"vert";
  }
  [a5 writeAttribute:a4 content:v6];
}

+ (void)writeInOut:(int)a3 file:(id)a4
{
  if (a3) {
    id v5 = @"out";
  }
  else {
    id v5 = @"in";
  }
  [a4 writeAttribute:@"dir" content:v5];
}

+ (void)writeReverseInOut:(int)a3 file:(id)a4
{
  if (a3) {
    id v5 = @"in";
  }
  else {
    id v5 = @"out";
  }
  [a4 writeAttribute:@"dir" content:v5];
}

+ (BOOL)mapDirection:(id)a3 outDir:(int *)a4
{
  id v5 = a3;
  BOOL v6 = 0;
  if (v5 && a4)
  {
    uint64_t v7 = objc_opt_class();
    id v8 = TSUDynamicCast(v7, (uint64_t)v5);
    id v9 = v8;
    if (v8)
    {
      *a4 = [v8 direction];
      BOOL v6 = 1;
    }
    else
    {
      uint64_t v10 = objc_opt_class();
      int v11 = TSUDynamicCast(v10, (uint64_t)v5);
      uint64_t v12 = v11;
      if (v11)
      {
        *a4 = [v11 direction];
        BOOL v6 = 1;
      }
      else
      {
        uint64_t v13 = objc_opt_class();
        char v14 = TSUDynamicCast(v13, (uint64_t)v5);
        id v15 = v14;
        BOOL v6 = v14 != 0;
        if (v14) {
          *a4 = [v14 direction];
        }
      }
    }
  }
  return v6;
}

+ (void)writeTransitionAttributes:(id)a3 attributePrefix:(id)a4 file:(id)a5
{
  id v19 = a3;
  id v7 = a4;
  id v8 = a5;
  if (v19)
  {
    if ([v19 hasSpeed])
    {
      int v9 = [v19 speed];
      uint64_t v10 = @"fast";
      if (v9 == 1) {
        uint64_t v10 = @"med";
      }
      if (v9 == 2) {
        int v11 = @"slow";
      }
      else {
        int v11 = v10;
      }
      [v8 writeAttribute:@"spd" content:v11];
    }
    if (v7)
    {
      if ([v19 hasIsAdvanceOnClick])
      {
        uint64_t v12 = [v19 isAdvanceOnClick];
        [v8 writeAttribute:@"advClick" BOOLContent:v12];
        if ((v12 & 1) == 0)
        {
          if ([v19 hasAdvanceAfterTime]) {
            objc_msgSend(v8, "writeAttribute:intContent:", @"advTm", (int)objc_msgSend(v19, "advanceAfterTime"));
          }
        }
      }
      uint64_t v13 = [v19 duration];
      if (v13)
      {
        int v14 = [v19 type];

        if (v14)
        {
          id v15 = [v8 currentElementPrefix];
          id v16 = (id)[v8 pushStateWithElementPrefix:v15 attributePrefix:v7];

          uint64_t v17 = [v19 duration];
          [v17 doubleValue];
          [v8 writeAttribute:@"dur" intContent:(uint64_t)(v18 * 1000.0)];

          [v8 popState];
        }
      }
    }
  }
}

@end