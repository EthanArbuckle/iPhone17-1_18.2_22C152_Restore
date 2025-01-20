@interface PXAnimation
+ (BOOL)readOptionalStringAttribute:(id)a3 fromNode:(_xmlNode *)a4 attributeMap:(id)a5 toPDDomValue:(unint64_t *)a6;
+ (id)chartBuildStepMap;
+ (id)chartTypeMap;
+ (id)newShapeTarget:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)newTarget:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)presetClassMap;
+ (id)readAnimVariant:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readGraphicBuild:(_xmlNode *)a3 drawingState:(id)a4;
+ (id)readOleChartBuild:(_xmlNode *)a3;
+ (id)readParagraphBuild:(_xmlNode *)a3;
+ (id)restartTypeMap;
+ (id)sequentialNextActionMap;
+ (id)sequentialPreviousActionMap;
+ (id)timeNodeFillTypeMap;
+ (id)timeNodeTypeMap;
+ (id)triggerEventMap;
+ (int)readChartBuildType:(id)a3;
+ (void)readAnimAudioElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5;
+ (void)readAnimCmdElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5;
+ (void)readAnimEffectElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5;
+ (void)readAnimElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5;
+ (void)readAnimMotionElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5;
+ (void)readAnimParallelElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5;
+ (void)readAnimRotationElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5;
+ (void)readAnimScaleElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5;
+ (void)readAnimSequentialElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5;
+ (void)readAnimSetElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5;
+ (void)readAnimVideoElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5;
+ (void)readAnimationFromTimingXmlNode:(_xmlNode *)a3 tgtAnimation:(id)a4 drawingState:(id)a5;
+ (void)readChartBuildStep:(id)a3 chartTarget:(id)a4;
+ (void)readChartType:(id)a3 oleChartTarget:(id)a4;
+ (void)readChildTimeNodeList:(_xmlNode *)a3 commonTimeNodeData:(id)a4 drawingState:(id)a5;
+ (void)readCommonBehaviorData:(_xmlNode *)a3 tgtCommonBehaviorData:(id)a4 drawingState:(id)a5;
+ (void)readCommonMediaNodeData:(_xmlNode *)a3 commonMediaData:(id)a4 drawingState:(id)a5;
+ (void)readCommonTimeNodeData:(_xmlNode *)a3 commonTimeNodeData:(id)a4 drawingState:(id)a5;
+ (void)readCondition:(_xmlNode *)a3 timeCondition:(id)a4 drawingState:(id)a5;
+ (void)readConditionList:(_xmlNode *)a3 arrayOfConditions:(id)a4 drawingState:(id)a5;
+ (void)readIterate:(_xmlNode *)a3 commonTimeNodeData:(id)a4 drawingState:(id)a5;
+ (void)readPointFromNode:(_xmlNode *)a3 tgtPoint:(CGPoint *)a4;
+ (void)readPresetClass:(id)a3 commonTimeNodeData:(id)a4;
+ (void)readRestartType:(id)a3 commonTimeNodeData:(id)a4;
+ (void)readStConditionList:(_xmlNode *)a3 commonTimeNodeData:(id)a4 drawingState:(id)a5;
+ (void)readTimeNodeType:(id)a3 commonTimeNodeData:(id)a4;
+ (void)readTriggerEvent:(id)a3 timeCondition:(id)a4;
+ (void)writeAnimationFromSlideBase:(id)a3 to:(id)a4 state:(id)a5;
@end

@implementation PXAnimation

+ (void)readAnimationFromTimingXmlNode:(_xmlNode *)a3 tgtAnimation:(id)a4 drawingState:(id)a5
{
  id v31 = a4;
  id v7 = a5;
  v8 = v7;
  if (a3)
  {
    v9 = [v7 client];
    v10 = [v9 presentationState];

    v11 = [v10 PXPresentationMLNamespace];
    v12 = (_xmlNode *)OCXFindChild(a3, v11, "tnLst");

    if (v12)
    {
      v13 = [v10 PXPresentationMLNamespace];
      v14 = (_xmlNode *)OCXFindChild(v12, v13, "par");

      if (v14)
      {
        v15 = [v10 PXPresentationMLNamespace];
        v16 = (_xmlNode *)OCXFindChild(v14, v15, "cTn");

        if (v16)
        {
          v17 = CXDefaultStringAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"nodeType", 0);
          v18 = v17;
          if (v17 && [v17 isEqualToString:@"tmRoot"])
          {
            v19 = [v31 addRootTimeNode];
            [a1 readCommonTimeNodeData:v16 commonTimeNodeData:v19 drawingState:v8];
          }
        }
      }
    }
    v20 = [v10 PXPresentationMLNamespace];
    v21 = (_xmlNode *)OCXFindChild(a3, v20, "bldLst");

    if (v21)
    {
      v30 = v10;
      v32 = objc_alloc_init(OITSUNoCopyDictionary);
      for (i = OCXFirstChild(v21); ; i = OCXNextSibling(i))
      {
        if (!i)
        {
          [v31 setBuildMap:v32];

          v10 = v30;
          goto LABEL_30;
        }
        if (i->type == XML_ELEMENT_NODE) {
          break;
        }
LABEL_27:
        ;
      }
      v23 = CXRequiredLongAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"spid");
      v24 = CXDefaultStringAttribute(i, (CXNamespace *)CXNoNamespace, (xmlChar *)"grpId", 0);
      v25 = [v8 drawableForShapeId:v23];
      if (xmlStrEqual(i->name, (const xmlChar *)"bldP"))
      {
        v26 = (PDDiagramBuild *)[a1 readParagraphBuild:i];
      }
      else if (xmlStrEqual(i->name, (const xmlChar *)"bldDgm"))
      {
        v26 = objc_alloc_init(PDDiagramBuild);
      }
      else if (xmlStrEqual(i->name, (const xmlChar *)"bldOleChart"))
      {
        v26 = (PDDiagramBuild *)[a1 readOleChartBuild:i];
      }
      else
      {
        if (!xmlStrEqual(i->name, (const xmlChar *)"bldGraphic"))
        {
          v27 = 0;
LABEL_26:

          goto LABEL_27;
        }
        v26 = (PDDiagramBuild *)[a1 readGraphicBuild:i drawingState:v8];
      }
      v27 = v26;
      if (v25) {
        BOOL v28 = v26 == 0;
      }
      else {
        BOOL v28 = 1;
      }
      if (!v28)
      {
        v29 = [[PDBuildMapKey alloc] initWithDrawable:v25 groupId:v24];
        [(OITSUNoCopyDictionary *)v32 setObject:v27 forUncopiedKey:v29];
      }
      goto LABEL_26;
    }
LABEL_30:
  }
}

+ (void)readCommonTimeNodeData:(_xmlNode *)a3 commonTimeNodeData:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v38 = 0;
  id v37 = 0;
  BOOL v10 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"nodeType", &v37);
  id v11 = v37;
  if (v10) {
    [a1 readTimeNodeType:v11 commonTimeNodeData:v8];
  }
  id v36 = 0;
  BOOL v12 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"presetClass", &v36);
  id v13 = v36;
  if (v12) {
    [a1 readPresetClass:v13 commonTimeNodeData:v8];
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"presetSubtype", &v38)) {
    [v8 setPresetSubType:v38];
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"presetID", &v38)) {
    [v8 setPresetId:v38];
  }
  id v35 = 0;
  id v31 = v13;
  BOOL v14 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"grpId", &v35);
  id v15 = v35;
  if (v14) {
    [v8 setGroupId:v15];
  }
  id v34 = 0;
  v30 = v15;
  BOOL v16 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"repeatCount", &v34);
  id v17 = v34;
  v18 = v17;
  if (v16)
  {
    uint64_t v38 = 0;
    if ([v17 isEqualToString:@"indefinite"]) {
      int v19 = -1;
    }
    else {
      int v19 = [v18 intValue];
    }
    uint64_t v38 = v19;
    objc_msgSend(v8, "setRepeatCount:");
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"repeatDur", &v38)) {
    [v8 setRepeatDuration:v38];
  }
  BOOL v28 = v18;
  id v33 = 0;
  BOOL v20 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"restart", &v33);
  id v21 = v33;
  if (v20) {
    objc_msgSend(a1, "readRestartType:commonTimeNodeData:", v21, v8, v18, v30, v13);
  }
  v22 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dur", 0);
  v23 = v22;
  if (v22)
  {
    if ([v22 isEqualToString:@"indefinite"])
    {
      int v24 = -1;
    }
    else
    {
      int v24 = [v23 intValue];
      uint64_t v38 = v24;
    }
    objc_msgSend(v8, "setDuration:", (double)v24, v28);
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"spd", &v38)) {
    [v8 setSpeed:(double)v38];
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"accel", &v38)) {
    [v8 setAcceleration:(double)v38];
  }
  if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"decel", &v38)) {
    [v8 setDeceleration:(double)v38];
  }
  uint64_t v32 = 3;
  v25 = objc_msgSend(a1, "timeNodeFillTypeMap", v28);
  int v26 = [a1 readOptionalStringAttribute:@"fill" fromNode:a3 attributeMap:v25 toPDDomValue:&v32];

  if (v26) {
    [v8 setFillType:v32];
  }
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"childTnLst"))
    {
      [a1 readChildTimeNodeList:i commonTimeNodeData:v8 drawingState:v9];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"iterate"))
    {
      [a1 readIterate:i commonTimeNodeData:v8 drawingState:v9];
    }
    else if (xmlStrEqual(i->name, (const xmlChar *)"stCondLst"))
    {
      [a1 readStConditionList:i commonTimeNodeData:v8 drawingState:v9];
    }
  }
}

+ (void)readTimeNodeType:(id)a3 commonTimeNodeData:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [a1 timeNodeTypeMap];
  uint64_t v8 = [v7 valueForString:v9];

  if (v8 != -130883970) {
    [v6 setType:v8];
  }
}

+ (void)readRestartType:(id)a3 commonTimeNodeData:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [a1 restartTypeMap];
  uint64_t v8 = [v7 valueForString:v9];

  if (v8 != -130883970) {
    [v6 setRestartType:v8];
  }
}

+ (void)readChildTimeNodeList:(_xmlNode *)a3 commonTimeNodeData:(id)a4 drawingState:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  BOOL v10 = OCXFirstChild(a3);
  id v11 = 0;
  while (v10)
  {
    if (xmlStrEqual(v10->name, (const xmlChar *)"anim"))
    {
      BOOL v12 = objc_alloc_init(PDTimeNodeUnion);

      [a1 readAnimElement:v10 timeNode:v12 drawingState:v8];
      [v9 addObject:v12];
LABEL_11:

      id v13 = 0;
      goto LABEL_12;
    }
    if (xmlStrEqual(v10->name, (const xmlChar *)"animEffect"))
    {
      BOOL v12 = objc_alloc_init(PDTimeNodeUnion);

      [a1 readAnimEffectElement:v10 timeNode:v12 drawingState:v8];
      [v9 addObject:v12];
      goto LABEL_11;
    }
    if (xmlStrEqual(v10->name, (const xmlChar *)"animMotion"))
    {
      BOOL v12 = objc_alloc_init(PDTimeNodeUnion);

      [a1 readAnimMotionElement:v10 timeNode:v12 drawingState:v8];
      [v9 addObject:v12];
      goto LABEL_11;
    }
    if (xmlStrEqual(v10->name, (const xmlChar *)"animRot"))
    {
      BOOL v12 = objc_alloc_init(PDTimeNodeUnion);

      [a1 readAnimRotationElement:v10 timeNode:v12 drawingState:v8];
      [v9 addObject:v12];
      goto LABEL_11;
    }
    if (xmlStrEqual(v10->name, (const xmlChar *)"animScale"))
    {
      id v13 = objc_alloc_init(PDTimeNodeUnion);

      [a1 readAnimScaleElement:v10 timeNode:v13 drawingState:v8];
      [v9 addObject:v13];
    }
    else
    {
      if (xmlStrEqual(v10->name, (const xmlChar *)"audio"))
      {
        BOOL v12 = objc_alloc_init(PDTimeNodeUnion);

        [a1 readAnimAudioElement:v10 timeNode:v12 drawingState:v8];
        [v9 addObject:v12];
        goto LABEL_11;
      }
      if (xmlStrEqual(v10->name, (const xmlChar *)"video"))
      {
        BOOL v12 = objc_alloc_init(PDTimeNodeUnion);

        [a1 readAnimVideoElement:v10 timeNode:v12 drawingState:v8];
        [v9 addObject:v12];
        goto LABEL_11;
      }
      if (xmlStrEqual(v10->name, (const xmlChar *)"cmd"))
      {
        BOOL v12 = objc_alloc_init(PDTimeNodeUnion);

        [a1 readAnimCmdElement:v10 timeNode:v12 drawingState:v8];
        [v9 addObject:v12];
        goto LABEL_11;
      }
      if (xmlStrEqual(v10->name, (const xmlChar *)"par"))
      {
        id v13 = objc_alloc_init(PDTimeNodeUnion);

        [a1 readAnimParallelElement:v10 timeNode:v13 drawingState:v8];
        [v9 addObject:v13];
      }
      else
      {
        if (xmlStrEqual(v10->name, (const xmlChar *)"seq"))
        {
          BOOL v12 = objc_alloc_init(PDTimeNodeUnion);

          [a1 readAnimSequentialElement:v10 timeNode:v12 drawingState:v8];
          [v9 addObject:v12];
          goto LABEL_11;
        }
        if (xmlStrEqual(v10->name, (const xmlChar *)"set"))
        {
          BOOL v12 = objc_alloc_init(PDTimeNodeUnion);

          [a1 readAnimSetElement:v10 timeNode:v12 drawingState:v8];
          [v9 addObject:v12];
          goto LABEL_11;
        }
        id v13 = v11;
      }
    }
LABEL_12:
    id v11 = v13;
    BOOL v10 = OCXNextSibling(v10);
  }
  [v14 setChildTimeNodeList:v9];
}

+ (void)readAnimSequentialElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = objc_alloc_init(PDSequentialTimeNode);
  id v11 = [v9 client];
  BOOL v12 = [v11 presentationState];

  [(PDSequentialTimeNode *)v10 setConcurrent:CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"concurrent", 0)];
  uint64_t v26 = 0;
  id v13 = [a1 sequentialPreviousActionMap];
  int v14 = [a1 readOptionalStringAttribute:@"prevAc" fromNode:a3 attributeMap:v13 toPDDomValue:&v26];

  if (v14) {
    [(PDSequentialTimeNode *)v10 setPreviousAction:v26];
  }
  id v15 = objc_msgSend(a1, "sequentialNextActionMap", 0);
  int v16 = [a1 readOptionalStringAttribute:@"nextAc" fromNode:a3 attributeMap:v15 toPDDomValue:&v25];

  if (v16) {
    [(PDSequentialTimeNode *)v10 setNextAction:v25];
  }
  id v17 = [v12 PXPresentationMLNamespace];
  uint64_t v18 = OCXFindChild(a3, v17, "cTn");

  if (v18) {
    [a1 readCommonTimeNodeData:v18 commonTimeNodeData:v10 drawingState:v9];
  }
  int v19 = [v12 PXPresentationMLNamespace];
  uint64_t v20 = OCXFindChild(a3, v19, "prevCondLst");

  if (v20)
  {
    id v21 = objc_opt_new();
    [a1 readConditionList:v20 arrayOfConditions:v21 drawingState:v9];
    [(PDSequentialTimeNode *)v10 setPreviousConditions:v21];
  }
  v22 = [v12 PXPresentationMLNamespace];
  uint64_t v23 = OCXFindChild(a3, v22, "nextCondLst");

  if (v23)
  {
    int v24 = objc_opt_new();
    [a1 readConditionList:v23 arrayOfConditions:v24 drawingState:v9];
    [(PDSequentialTimeNode *)v10 setNextConditions:v24];
  }
  [v8 setSequential:v10];
}

+ (void)readAnimParallelElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(PDParallelTimeNode);
  BOOL v10 = [v8 client];
  id v11 = [v10 presentationState];

  BOOL v12 = [v11 PXPresentationMLNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "cTn");

  if (v13) {
    [a1 readCommonTimeNodeData:v13 commonTimeNodeData:v9 drawingState:v8];
  }
  [v14 setParallel:v9];
}

+ (void)readStConditionList:(_xmlNode *)a3 commonTimeNodeData:(id)a4 drawingState:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  [a1 readConditionList:a3 arrayOfConditions:v9 drawingState:v8];
  [v10 setStartTimeConditions:v9];
}

+ (void)readCondition:(_xmlNode *)a3 timeCondition:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"delay", 0);
  id v11 = v10;
  if (v10)
  {
    if ([v10 isEqualToString:@"indefinite"]) {
      uint64_t v12 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v12 = [v11 intValue];
    }
    [v8 setDelay:v12];
  }
  id v20 = 0;
  BOOL v13 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"evt", &v20);
  id v14 = v20;
  if (v13) {
    [a1 readTriggerEvent:v14 timeCondition:v8];
  }
  id v15 = [v9 client];
  int v16 = [v15 presentationState];

  id v17 = [v16 PXPresentationMLNamespace];
  uint64_t v18 = OCXFindChild(a3, v17, "tgtEl");

  if (v18)
  {
    int v19 = (void *)[a1 newTarget:v18 drawingState:v9];
    [v8 setTarget:v19];
  }
}

+ (void)readPresetClass:(id)a3 commonTimeNodeData:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [a1 presetClassMap];
  uint64_t v8 = [v7 valueForString:v9];

  if (v8 != -130883970) {
    [v6 setAnimationPresetClass:v8];
  }
}

+ (void)readAnimMotionElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(PDAnimateMotionBehavior);
  id v11 = [v9 client];
  uint64_t v12 = [v11 presentationState];

  BOOL v13 = [v12 PXPresentationMLNamespace];
  uint64_t v14 = OCXFindChild(a3, v13, "cBhvr");

  if (v14) {
    [a1 readCommonBehaviorData:v14 tgtCommonBehaviorData:v10 drawingState:v9];
  }
  id v28 = 0;
  BOOL v15 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"path", &v28);
  id v16 = v28;
  if (v15)
  {
    id v17 = +[PDAnimateMotionBehavior bezierPathFromNSString:v16];
    [(PDAnimateMotionBehavior *)v10 setPath:v17];
  }
  double v26 = 0.0;
  double v27 = 0.0;
  uint64_t v18 = [v12 PXPresentationMLNamespace];
  uint64_t v19 = OCXFindChild(a3, v18, "by");

  if (v19)
  {
    [a1 readPointFromNode:v19 tgtPoint:&v26];
    -[PDAnimateScaleBehavior setBy:](v10, "setBy:", v26, v27);
  }
  id v20 = [v12 PXPresentationMLNamespace];
  uint64_t v21 = OCXFindChild(a3, v20, "from");

  if (v21)
  {
    [a1 readPointFromNode:v21 tgtPoint:&v26];
    -[PDAnimateScaleBehavior setFrom:](v10, "setFrom:", v26, v27);
  }
  v22 = [v12 PXPresentationMLNamespace];
  uint64_t v23 = OCXFindChild(a3, v22, "to");

  if (v23)
  {
    [a1 readPointFromNode:v23 tgtPoint:&v26];
    -[PDAnimateScaleBehavior setTo:](v10, "setTo:", v26, v27);
  }
  int v24 = [v12 PXPresentationMLNamespace];
  uint64_t v25 = OCXFindChild(a3, v24, "rCtr");

  if (v25)
  {
    [a1 readPointFromNode:v23 tgtPoint:&v26];
    -[PDAnimateMotionBehavior setRotationCenter:](v10, "setRotationCenter:", v26, v27);
  }
  [v8 setMotionBehavior:v10];
}

+ (void)readCommonBehaviorData:(_xmlNode *)a3 tgtCommonBehaviorData:(id)a4 drawingState:(id)a5
{
  id v21 = a4;
  id v8 = a5;
  id v9 = [v8 client];
  id v10 = [v9 presentationState];

  id v11 = [v10 PXPresentationMLNamespace];
  uint64_t v12 = OCXFindChild(a3, v11, "cTn");

  if (v12) {
    [a1 readCommonTimeNodeData:v12 commonTimeNodeData:v21 drawingState:v8];
  }
  BOOL v13 = [v10 PXPresentationMLNamespace];
  uint64_t v14 = OCXFindChild(a3, v13, "tgtEl");

  if (v14)
  {
    BOOL v15 = (void *)[a1 newTarget:v14 drawingState:v8];
    [v21 setTarget:v15];
  }
  id v16 = [v10 PXPresentationMLNamespace];
  id v17 = (_xmlNode *)OCXFindChild(a3, v16, "attrNameLst");

  if (v17)
  {
    uint64_t v18 = objc_opt_new();
    uint64_t v19 = OCXFirstChildNamed(v17, (xmlChar *)"attrName");
    while (v19)
    {
      id v20 = CXDefaultStringContent(v19, (NSString *)&stru_26EBF24D8);
      if ([v20 length]) {
        [v18 addObject:v20];
      }
      uint64_t v19 = OCXNextSiblingNamed(v19, (xmlChar *)"attrName");
    }
    [v21 setAttributeNames:v18];
  }
}

+ (id)newTarget:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  id v7 = [v6 client];
  id v8 = [v7 presentationState];

  id v9 = [v8 PXPresentationMLNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "sldTgt");

  if (v10)
  {
    id v11 = off_264D60618;
LABEL_5:
    uint64_t v14 = (PDAnimationShapeTarget *)objc_alloc_init(*v11);
LABEL_6:
    BOOL v15 = v14;
    goto LABEL_7;
  }
  uint64_t v12 = [v8 PXPresentationMLNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "sndTgt");

  if (v13)
  {
    id v11 = off_264D605F8;
    goto LABEL_5;
  }
  id v17 = [v8 PXPresentationMLNamespace];
  uint64_t v18 = OCXFindChild(a3, v17, "spTgt");

  if (v18)
  {
    uint64_t v14 = (PDAnimationShapeTarget *)[a1 newShapeTarget:v18 drawingState:v6];
    goto LABEL_6;
  }
  uint64_t v19 = [v8 PXPresentationMLNamespace];
  id v20 = (_xmlNode *)OCXFindChild(a3, v19, "inkTgt");

  if (v20)
  {
    id v25 = 0;
    BOOL v21 = CXOptionalStringAttribute(v20, (void *)CXNoNamespace, (xmlChar *)"spid", &v25);
    id v22 = v25;
    if (v21)
    {
      uint64_t v23 = [v8 oavState];
      int v24 = [v23 drawableForVmlShapeId:v22];
      if (v24)
      {
        BOOL v15 = objc_alloc_init(PDAnimationShapeTarget);
        [(PDAnimationShapeTarget *)v15 setDrawable:v24];
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_7:

  return v15;
}

+ (id)newShapeTarget:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  id v7 = [v6 client];
  id v8 = [v7 presentationState];

  uint64_t v37 = -1;
  id v9 = [v8 PXPresentationMLNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "bg");

  if (v10)
  {
    id v11 = off_264D605E8;
LABEL_3:
    uint64_t v12 = (PDAnimationDiagramTarget *)objc_alloc_init(*v11);
LABEL_4:
    uint64_t v13 = (PDAnimationChartTarget *)v12;
    goto LABEL_5;
  }
  uint64_t v18 = [v8 PXPresentationMLNamespace];
  uint64_t v19 = (_xmlNode *)OCXFindChild(a3, v18, "graphicEl");

  if (v19)
  {
    id v20 = [v6 OAXMainNamespace];
    uint64_t v21 = OCXFindChild(v19, v20, "dgm");

    if (v21)
    {
      uint64_t v12 = objc_alloc_init(PDAnimationDiagramTarget);
      goto LABEL_4;
    }
    double v26 = [v6 OAXMainNamespace];
    double v27 = (_xmlNode *)OCXFindChild(v19, v26, "chart");

    if (v27)
    {
      uint64_t v13 = objc_alloc_init(PDAnimationChartTarget);
      id v36 = 0;
      BOOL v28 = CXOptionalStringAttribute(v27, (void *)CXNoNamespace, (xmlChar *)"bldStep", &v36);
      id v25 = v36;
      if (v28) {
        [a1 readChartBuildStep:v25 chartTarget:v13];
      }
      if (CXOptionalLongAttribute(v27, (CXNamespace *)CXNoNamespace, (xmlChar *)"categoryIdx", &v37)) {
        [(PDAnimationChartTarget *)v13 setCatagoryIndex:v37];
      }
      if (CXOptionalLongAttribute(v27, (CXNamespace *)CXNoNamespace, (xmlChar *)"seriesIdx", &v37)) {
        [(PDAnimationChartTarget *)v13 setSeriesIndex:v37];
      }
LABEL_23:

      goto LABEL_5;
    }
    uint64_t v13 = 0;
  }
  else
  {
    id v22 = [v8 PXPresentationMLNamespace];
    uint64_t v23 = (_xmlNode *)OCXFindChild(a3, v22, "oleChartEl");

    if (v23)
    {
      uint64_t v13 = objc_alloc_init(PDAnimationOleChartTarget);
      if (CXOptionalLongAttribute(v23, (CXNamespace *)CXNoNamespace, (xmlChar *)"lvl", &v37)) {
        [(PDAnimationChartTarget *)v13 setLevel:v37];
      }
      id v35 = 0;
      BOOL v24 = CXOptionalStringAttribute(v23, (void *)CXNoNamespace, (xmlChar *)"type", &v35);
      id v25 = v35;
      if (v24) {
        [a1 readChartType:v25 oleChartTarget:v13];
      }
      goto LABEL_23;
    }
    v29 = [v8 PXPresentationMLNamespace];
    v30 = (_xmlNode *)OCXFindChild(a3, v29, "txEl");

    if (!v30)
    {
      id v11 = off_264D605F0;
      goto LABEL_3;
    }
    uint64_t v13 = objc_alloc_init(PDAnimationTextTarget);
    id v31 = [v8 PXPresentationMLNamespace];
    uint64_t v32 = (_xmlNode *)OCXFindChild(v30, v31, "charRg");

    if (v32)
    {
      [(PDAnimationChartTarget *)v13 setType:0];
    }
    else
    {
      id v33 = [v8 PXPresentationMLNamespace];
      uint64_t v32 = (_xmlNode *)OCXFindChild(v30, v33, "pRg");

      [(PDAnimationChartTarget *)v13 setType:1];
      if (!v32) {
        goto LABEL_5;
      }
    }
    uint64_t v34 = 0;
    CXOptionalLongAttribute(v32, (CXNamespace *)CXNoNamespace, (xmlChar *)"st", &v37);
    CXOptionalLongAttribute(v32, (CXNamespace *)CXNoNamespace, (xmlChar *)"end", &v34);
    -[PDAnimationChartTarget setRange:](v13, "setRange:");
  }
LABEL_5:
  uint64_t v37 = (uint64_t)CXRequiredLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"spid");
  uint64_t v14 = [v6 drawableForShapeId:v37];
  if (!v14)
  {
    BOOL v15 = [v6 oavState];
    id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v37);
    uint64_t v14 = [v15 drawableForVmlShapeId:v16];
  }
  [(PDAnimationShapeTarget *)v13 setDrawable:v14];

  return v13;
}

+ (void)readPointFromNode:(_xmlNode *)a3 tgtPoint:(CGPoint *)a4
{
  a4->x = (double)CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"x", 0);
  a4->y = (double)CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"y", 0);
}

+ (void)readTriggerEvent:(id)a3 timeCondition:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [a1 triggerEventMap];
  uint64_t v8 = [v7 valueForString:v9];

  if (v8 != -130883970) {
    [v6 setTriggerEvent:v8];
  }
}

+ (void)readAnimSetElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v17 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(PDSetBehavior);
  uint64_t v10 = [v8 client];
  id v11 = [v10 presentationState];

  uint64_t v12 = [v11 PXPresentationMLNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "cBhvr");

  if (v13) {
    [a1 readCommonBehaviorData:v13 tgtCommonBehaviorData:v9 drawingState:v8];
  }
  uint64_t v14 = [v11 PXPresentationMLNamespace];
  uint64_t v15 = OCXFindChild(a3, v14, "to");

  if (v15)
  {
    id v16 = [a1 readAnimVariant:v15 drawingState:v8];
    if (v16) {
      [(PDSetBehavior *)v9 setValue:v16];
    }
  }
  [v17 setBehavior:v9];
}

+ (void)readAnimEffectElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(PDAnimateEffectBehavior);
  id v11 = [v9 client];
  uint64_t v12 = [v11 presentationState];

  uint64_t v13 = [v12 PXPresentationMLNamespace];
  uint64_t v14 = OCXFindChild(a3, v13, "cBhvr");

  if (v14) {
    [a1 readCommonBehaviorData:v14 tgtCommonBehaviorData:v10 drawingState:v9];
  }
  id v19 = 0;
  BOOL v15 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"transition", &v19);
  id v16 = v19;
  id v17 = v16;
  if (v15)
  {
    if ([v16 isEqualToString:@"none"])
    {
      uint64_t v18 = 0;
    }
    else if ([v17 isEqualToString:@"in"])
    {
      uint64_t v18 = 1;
    }
    else if ([v17 isEqualToString:@"out"])
    {
      uint64_t v18 = 2;
    }
    else
    {
      uint64_t v18 = 0;
    }
    [(PDAnimateEffectBehavior *)v10 setTransition:v18];
  }
  [v8 setEffectBehavior:v10];
}

+ (id)readParagraphBuild:(_xmlNode *)a3
{
  uint64_t v4 = CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"advAuto", -1);
  uint64_t v5 = CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"animBg", 0);
  uint64_t v6 = CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bldLvl", 1);
  uint64_t v7 = CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rev", 0);
  id v8 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"build", (NSString *)@"whole");
  if ([v8 isEqualToString:@"allAtOnce"])
  {
    uint64_t v9 = 0;
  }
  else if ([v8 isEqualToString:@"p"])
  {
    uint64_t v9 = 2;
  }
  else if ([v8 isEqualToString:@"cust"])
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 4;
  }
  uint64_t v10 = objc_alloc_init(PDParagraphBuild);
  [(PDParagraphBuild *)v10 setAutoAdvanceTime:(double)v4];
  [(PDBuild *)v10 setIsAnimateBackground:v5];
  [(PDParagraphBuild *)v10 setBuildLevel:v6];
  [(PDParagraphBuild *)v10 setIsReversedParagraphOrder:v7];
  [(PDParagraphBuild *)v10 setType:v9];

  return v10;
}

+ (void)readIterate:(_xmlNode *)a3 commonTimeNodeData:(id)a4 drawingState:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = objc_alloc_init(PDIterate);
  id v22 = 0;
  BOOL v10 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"type", &v22);
  id v11 = v22;
  if (!v10)
  {
    uint64_t v17 = 0;
    goto LABEL_16;
  }
  uint64_t v12 = [v8 client];
  uint64_t v13 = [v12 presentationState];

  uint64_t v14 = [v13 PXPresentationMLNamespace];
  BOOL v15 = (_xmlNode *)OCXFindChild(a3, v14, "tmPct");

  if (v15)
  {
    uint64_t v21 = 0;
    id v16 = (id *)&v21;
    CXOptionalStringAttribute(v15, (void *)CXNoNamespace, (xmlChar *)"val", &v21);
LABEL_7:
    id v19 = (_xmlNode *)*v16;
    goto LABEL_8;
  }
  uint64_t v18 = [v13 PXPresentationMLNamespace];
  id v19 = (_xmlNode *)OCXFindChild(a3, v18, "tmAbs");

  if (v19)
  {
    uint64_t v20 = 0;
    id v16 = (id *)&v20;
    CXOptionalStringAttribute(v19, (void *)CXNoNamespace, (xmlChar *)"val", &v20);
    goto LABEL_7;
  }
LABEL_8:
  if ((int)[(_xmlNode *)v19 intValue] < 1)
  {
    uint64_t v17 = 0;
  }
  else if ([v11 isEqualToString:@"wd"])
  {
    uint64_t v17 = 1;
  }
  else if ([v11 isEqualToString:@"lt"])
  {
    uint64_t v17 = 2;
  }
  else
  {
    uint64_t v17 = 0;
  }

LABEL_16:
  [(PDIterate *)v9 setType:v17];
  [v7 setIterate:v9];
}

+ (void)readAnimElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  uint64_t v9 = objc_alloc_init(PDAnimateTimeBehavior);
  BOOL v10 = [v8 client];
  id v11 = [v10 presentationState];

  uint64_t v12 = [v11 PXPresentationMLNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "cBhvr");

  if (v13) {
    [a1 readCommonBehaviorData:v13 tgtCommonBehaviorData:v9 drawingState:v8];
  }
  uint64_t v14 = [v11 PXPresentationMLNamespace];
  OCXFindChild(a3, v14, "tavLst");

  [v15 setTimeBehavior:v9];
}

+ (void)readAnimScaleElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = objc_alloc_init(PDAnimateScaleBehavior);
  id v11 = [v9 client];
  uint64_t v12 = [v11 presentationState];

  uint64_t v13 = [v12 PXPresentationMLNamespace];
  uint64_t v14 = OCXFindChild(a3, v13, "cBhvr");

  if (v14) {
    [a1 readCommonBehaviorData:v14 tgtCommonBehaviorData:v10 drawingState:v9];
  }
  objc_msgSend(v12, "PXPresentationMLNamespace", 0, 0);
  id v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = OCXFindChild(a3, v15, "by");

  if (v16)
  {
    [a1 readPointFromNode:v16 tgtPoint:&v21];
    -[PDAnimateScaleBehavior setBy:](v10, "setBy:", v21, v22);
  }
  uint64_t v17 = [v12 PXPresentationMLNamespace];
  uint64_t v18 = OCXFindChild(a3, v17, "from");

  if (v18)
  {
    [a1 readPointFromNode:v18 tgtPoint:&v21];
    -[PDAnimateScaleBehavior setFrom:](v10, "setFrom:", v21, v22);
  }
  id v19 = [v12 PXPresentationMLNamespace];
  uint64_t v20 = OCXFindChild(a3, v19, "to");

  if (v20)
  {
    [a1 readPointFromNode:v20 tgtPoint:&v21];
    -[PDAnimateScaleBehavior setTo:](v10, "setTo:", v21, v22);
  }
  [v8 setScaleBehavior:v10];
}

+ (void)readAnimRotationElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(PDAnimateRotateBehavior);
  BOOL v10 = [v8 client];
  id v11 = [v10 presentationState];

  uint64_t v12 = [v11 PXPresentationMLNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "cBhvr");

  if (v13) {
    [a1 readCommonBehaviorData:v13 tgtCommonBehaviorData:v9 drawingState:v8];
  }
  [(PDAnimateRotateBehavior *)v9 setBy:(double)CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"by", 1)];
  [v14 setRotateBehavior:v9];
}

+ (void)readAnimCmdElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(PDCmdBehavior);
  BOOL v10 = [v8 client];
  id v11 = [v10 presentationState];

  uint64_t v12 = [v11 PXPresentationMLNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "cBhvr");

  if (v13) {
    [a1 readCommonBehaviorData:v13 tgtCommonBehaviorData:v9 drawingState:v8];
  }
  [v14 setCmdBehavior:v9];
}

+ (void)readAnimAudioElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(PDAudioNode);
  BOOL v10 = [v8 client];
  id v11 = [v10 presentationState];

  [(PDAudioNode *)v9 setIsNarration:CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"isNarration", 0)];
  uint64_t v12 = [v11 PXPresentationMLNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "cMediaNode");

  if (v13)
  {
    [a1 readCommonMediaNodeData:v13 commonMediaData:v9 drawingState:v8];
    [v14 setAudio:v9];
  }
}

+ (void)readCommonMediaNodeData:(_xmlNode *)a3 commonMediaData:(id)a4 drawingState:(id)a5
{
  id v20 = a4;
  id v8 = a5;
  id v9 = [v8 client];
  BOOL v10 = [v9 presentationState];

  id v11 = [v10 PXPresentationMLNamespace];
  uint64_t v12 = OCXFindChild(a3, v11, "cTn");

  if (!v12) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  [a1 readCommonTimeNodeData:v12 commonTimeNodeData:v20 drawingState:v8];
  uint64_t v13 = [v10 PXPresentationMLNamespace];
  uint64_t v14 = OCXFindChild(a3, v13, "tgtEl");

  id v15 = (void *)[a1 newTarget:v14 drawingState:v8];
  uint64_t v16 = CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"mute", 0);
  uint64_t v17 = CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showWhenStopped", 1);
  uint64_t v18 = CXDefaultLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"numSld", 1);
  double v19 = CXDefaultFractionAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"vol", 0.5);
  [v20 setTarget:v15];
  [v20 setIsMuted:v16];
  [v20 setIsShowWhenStopped:v17];
  [v20 setNumberOfSlides:v18];
  [v20 setVolume:(uint64_t)(v19 * 100000.0)];
}

+ (void)readAnimVideoElement:(_xmlNode *)a3 timeNode:(id)a4 drawingState:(id)a5
{
  id v14 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(PDVideoNode);
  BOOL v10 = [v8 client];
  id v11 = [v10 presentationState];

  [(PDVideoNode *)v9 setIsFullScreen:CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fullScrn", 0)];
  uint64_t v12 = [v11 PXPresentationMLNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "cMediaNode");

  if (v13)
  {
    [a1 readCommonMediaNodeData:v13 commonMediaData:v9 drawingState:v8];
    [v14 setVideo:v9];
  }
}

+ (int)readChartBuildType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"series"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"category"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"seriesEl"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"categoryEl"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (void)writeAnimationFromSlideBase:(id)a3 to:(id)a4 state:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = [v17 animation];
  id v11 = [v10 rootTimeNode];

  if (v11)
  {
    [v8 startElement:@"timing"];
    uint64_t v12 = [[PXAnimationWriteState alloc] initWithWriteState:v9 file:v8];
    [a1 writeTimeList:v11 state:v12];
    uint64_t v13 = [v17 animation];
    id v14 = [v13 buildMap];

    if (v14)
    {
      id v15 = [v17 animation];
      uint64_t v16 = [v15 buildMap];
      [a1 writeBuildList:v16 state:v12];
    }
    [v8 endElement];
  }
}

+ (id)timeNodeFillTypeMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_50, 0, &dword_238A75000);
  }
  if (+[PXAnimation(Private) timeNodeFillTypeMap]::onceToken != -1) {
    dispatch_once(&+[PXAnimation(Private) timeNodeFillTypeMap]::onceToken, &__block_literal_global_101);
  }
  v2 = (void *)+[PXAnimation(Private) timeNodeFillTypeMap]::sEnumerationMap;
  return v2;
}

void __43__PXAnimation_Private__timeNodeFillTypeMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PXAnimation(Private) timeNodeFillTypeMap]::sTimeNodeFillTypeStructs count:4 caseSensitive:1];
  v1 = (void *)+[PXAnimation(Private) timeNodeFillTypeMap]::sEnumerationMap;
  +[PXAnimation(Private) timeNodeFillTypeMap]::sEnumerationMap = (uint64_t)v0;
}

+ (BOOL)readOptionalStringAttribute:(id)a3 fromNode:(_xmlNode *)a4 attributeMap:(id)a5 toPDDomValue:(unint64_t *)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void *)CXNoNamespace;
  id v12 = v9;
  id v19 = 0;
  BOOL v13 = CXOptionalStringAttribute(a4, v11, (xmlChar *)[v12 UTF8String], &v19);
  id v14 = v19;
  if (v13)
  {
    unint64_t v15 = [v10 valueForString:v14];
    LOBYTE(v13) = v15 != -130883970;
    if (v15 == -130883970)
    {
      uint64_t v16 = [NSString stringWithUTF8String:"+[PXAnimation(Private) readOptionalStringAttribute:fromNode:attributeMap:toPDDomValue:]"];
      id v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/PowerPoint/Xml/PXAnimation.mm"];
      +[OITSUAssertionHandler handleFailureInFunction:v16, v17, 365, 0, "Located attribute for element but failed to resolve mapping %@ to %@", v12, v14 file lineNumber isFatal description];

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    *a6 = v15;
  }

  return v13;
}

+ (id)timeNodeTypeMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_145_0, 0, &dword_238A75000);
  }
  if (+[PXAnimation(Private) timeNodeTypeMap]::onceToken != -1) {
    dispatch_once(&+[PXAnimation(Private) timeNodeTypeMap]::onceToken, &__block_literal_global_147);
  }
  v2 = (void *)+[PXAnimation(Private) timeNodeTypeMap]::sEnumerationMap;
  return v2;
}

void __39__PXAnimation_Private__timeNodeTypeMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PXAnimation(Private) timeNodeTypeMap]::sTimeNodeTypeMapStructs count:9 caseSensitive:1];
  v1 = (void *)+[PXAnimation(Private) timeNodeTypeMap]::sEnumerationMap;
  +[PXAnimation(Private) timeNodeTypeMap]::sEnumerationMap = (uint64_t)v0;
}

+ (id)presetClassMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_166_0, 0, &dword_238A75000);
  }
  if (+[PXAnimation(Private) presetClassMap]::onceToken != -1) {
    dispatch_once(&+[PXAnimation(Private) presetClassMap]::onceToken, &__block_literal_global_168);
  }
  v2 = (void *)+[PXAnimation(Private) presetClassMap]::sEnumerationMap;
  return v2;
}

void __38__PXAnimation_Private__presetClassMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PXAnimation(Private) presetClassMap]::sPresetClassStructs count:6 caseSensitive:1];
  v1 = (void *)+[PXAnimation(Private) presetClassMap]::sEnumerationMap;
  +[PXAnimation(Private) presetClassMap]::sEnumerationMap = (uint64_t)v0;
}

+ (id)restartTypeMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_178_0, 0, &dword_238A75000);
  }
  if (+[PXAnimation(Private) restartTypeMap]::onceToken != -1) {
    dispatch_once(&+[PXAnimation(Private) restartTypeMap]::onceToken, &__block_literal_global_180_0);
  }
  v2 = (void *)+[PXAnimation(Private) restartTypeMap]::sEnumerationMap;
  return v2;
}

void __38__PXAnimation_Private__restartTypeMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PXAnimation(Private) restartTypeMap]::sRestartTypeStructs count:3 caseSensitive:1];
  v1 = (void *)+[PXAnimation(Private) restartTypeMap]::sEnumerationMap;
  +[PXAnimation(Private) restartTypeMap]::sEnumerationMap = (uint64_t)v0;
}

+ (void)readConditionList:(_xmlNode *)a3 arrayOfConditions:(id)a4 drawingState:(id)a5
{
  id v11 = a4;
  id v8 = a5;
  for (i = OCXFirstChild(a3); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"cond"))
    {
      id v10 = objc_alloc_init(PDTimeCondition);
      [a1 readCondition:i timeCondition:v10 drawingState:v8];
      [v11 addObject:v10];
    }
  }
}

+ (id)triggerEventMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_239_1, 0, &dword_238A75000);
  }
  if (+[PXAnimation(Private) triggerEventMap]::onceToken != -1) {
    dispatch_once(&+[PXAnimation(Private) triggerEventMap]::onceToken, &__block_literal_global_241);
  }
  v2 = (void *)+[PXAnimation(Private) triggerEventMap]::sEnumerationMap;
  return v2;
}

void __39__PXAnimation_Private__triggerEventMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PXAnimation(Private) triggerEventMap]::sTriggerEventStructs count:10 caseSensitive:1];
  v1 = (void *)+[PXAnimation(Private) triggerEventMap]::sEnumerationMap;
  +[PXAnimation(Private) triggerEventMap]::sEnumerationMap = (uint64_t)v0;
}

+ (id)chartBuildStepMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_295_0, 0, &dword_238A75000);
  }
  if (+[PXAnimation(Private) chartBuildStepMap]::onceToken != -1) {
    dispatch_once(&+[PXAnimation(Private) chartBuildStepMap]::onceToken, &__block_literal_global_297);
  }
  v2 = (void *)+[PXAnimation(Private) chartBuildStepMap]::sEnumerationMap;
  return v2;
}

void __41__PXAnimation_Private__chartBuildStepMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PXAnimation(Private) chartBuildStepMap]::sChartBuildStepStructs count:8 caseSensitive:1];
  v1 = (void *)+[PXAnimation(Private) chartBuildStepMap]::sEnumerationMap;
  +[PXAnimation(Private) chartBuildStepMap]::sEnumerationMap = (uint64_t)v0;
}

+ (void)readChartBuildStep:(id)a3 chartTarget:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [a1 chartBuildStepMap];
  uint64_t v8 = [v7 valueForString:v9];

  if (v8 != -130883970) {
    [v6 setBuildStep:v8];
  }
}

+ (id)chartTypeMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_298_0, 0, &dword_238A75000);
  }
  if (+[PXAnimation(Private) chartTypeMap]::onceToken != -1) {
    dispatch_once(&+[PXAnimation(Private) chartTypeMap]::onceToken, &__block_literal_global_300);
  }
  v2 = (void *)+[PXAnimation(Private) chartTypeMap]::sEnumerationMap;
  return v2;
}

void __36__PXAnimation_Private__chartTypeMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PXAnimation(Private) chartTypeMap]::sChartTypeStructs count:5 caseSensitive:1];
  v1 = (void *)+[PXAnimation(Private) chartTypeMap]::sEnumerationMap;
  +[PXAnimation(Private) chartTypeMap]::sEnumerationMap = (uint64_t)v0;
}

+ (void)readChartType:(id)a3 oleChartTarget:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [a1 chartTypeMap];
  uint64_t v8 = [v7 valueForString:v9];

  if (v8 != -130883970) {
    [v6 setChartSubElementType:v8];
  }
}

+ (id)readAnimVariant:(_xmlNode *)a3 drawingState:(id)a4
{
  uint64_t v5 = [a4 client];
  id v6 = [v5 presentationState];

  id v7 = [v6 PXPresentationMLNamespace];
  uint64_t v8 = (_xmlNode *)OCXFindChild(a3, v7, "strVal");

  if (v8)
  {
    id v21 = 0;
    BOOL v9 = CXOptionalStringAttribute(v8, (void *)CXNoNamespace, (xmlChar *)"val", &v21);
    id v10 = v21;
    id v11 = v10;
    if (v9) {
      id v12 = (_xmlNode *)v10;
    }
    else {
      id v12 = 0;
    }

    goto LABEL_17;
  }
  BOOL v13 = [v6 PXPresentationMLNamespace];
  id v14 = (_xmlNode *)OCXFindChild(a3, v13, "BOOLVal");

  if (v14)
  {
    LOBYTE(v20) = 0;
    if (CXOptionalBoolAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", (BOOL *)&v20))
    {
      uint64_t v15 = [MEMORY[0x263F08D40] valueWithBytes:&v20 objCType:"B"];
LABEL_15:
      id v12 = (_xmlNode *)v15;
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v16 = [v6 PXPresentationMLNamespace];
    id v17 = (_xmlNode *)OCXFindChild(a3, v16, "intVal");

    if (v17)
    {
      uint64_t v20 = 0;
      if (CXOptionalLongAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v20))
      {
        uint64_t v15 = [MEMORY[0x263F08D40] valueWithBytes:&v20 objCType:"q"];
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v18 = [v6 PXPresentationMLNamespace];
      id v12 = (_xmlNode *)OCXFindChild(a3, v18, "fltVal");

      if (!v12) {
        goto LABEL_17;
      }
      uint64_t v20 = 0;
      if (CXOptionalDoubleAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", (double *)&v20))
      {
        uint64_t v15 = [MEMORY[0x263F08D40] valueWithBytes:&v20 objCType:"d"];
        goto LABEL_15;
      }
    }
  }
  id v12 = 0;
LABEL_17:

  return v12;
}

+ (id)sequentialPreviousActionMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_354_0, 0, &dword_238A75000);
  }
  if (+[PXAnimation(Private) sequentialPreviousActionMap]::onceToken != -1) {
    dispatch_once(&+[PXAnimation(Private) sequentialPreviousActionMap]::onceToken, &__block_literal_global_356);
  }
  v2 = (void *)+[PXAnimation(Private) sequentialPreviousActionMap]::sEnumerationMap;
  return v2;
}

void __51__PXAnimation_Private__sequentialPreviousActionMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PXAnimation(Private) sequentialPreviousActionMap]::sSequentialPreviousActionStructs count:2 caseSensitive:1];
  v1 = (void *)+[PXAnimation(Private) sequentialPreviousActionMap]::sEnumerationMap;
  +[PXAnimation(Private) sequentialPreviousActionMap]::sEnumerationMap = (uint64_t)v0;
}

+ (id)sequentialNextActionMap
{
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_360_0, 0, &dword_238A75000);
  }
  if (+[PXAnimation(Private) sequentialNextActionMap]::onceToken != -1) {
    dispatch_once(&+[PXAnimation(Private) sequentialNextActionMap]::onceToken, &__block_literal_global_362);
  }
  v2 = (void *)+[PXAnimation(Private) sequentialNextActionMap]::sEnumerationMap;
  return v2;
}

void __47__PXAnimation_Private__sequentialNextActionMap__block_invoke()
{
  v0 = [[TCEnumerationMap alloc] initWithStructs:&+[PXAnimation(Private) sequentialNextActionMap]::sSequentialNextActionStructs count:2 caseSensitive:1];
  v1 = (void *)+[PXAnimation(Private) sequentialNextActionMap]::sEnumerationMap;
  +[PXAnimation(Private) sequentialNextActionMap]::sEnumerationMap = (uint64_t)v0;
}

+ (id)readOleChartBuild:(_xmlNode *)a3
{
  uint64_t v5 = CXDefaultBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"animBg", 0);
  id v6 = CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"bld", (NSString *)@"allAtOnce");
  id v7 = -[PDChartBuild initWithBuildType:]([PDChartBuild alloc], "initWithBuildType:", [a1 readChartBuildType:v6]);
  [(PDBuild *)v7 setIsAnimateBackground:v5];

  return v7;
}

+ (id)readGraphicBuild:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6 = a4;
  id v7 = [v6 client];
  uint64_t v8 = [v7 presentationState];

  BOOL v9 = [v8 PXPresentationMLNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "bldAsOne");

  if (!v10 || (id v11 = objc_alloc_init(PDBuild)) == 0)
  {
    id v12 = [v8 PXPresentationMLNamespace];
    BOOL v13 = (_xmlNode *)OCXFindChild(a3, v12, "bldSub");

    if (!v13) {
      goto LABEL_8;
    }
    id v14 = [v8 PXPresentationMLNamespace];
    uint64_t v15 = OCXFindChild(v13, v14, "bldDmg");

    if (!v15 || (id v11 = objc_alloc_init(PDDiagramBuild)) == 0)
    {
      uint64_t v16 = [v6 OAXMainNamespace];
      id v17 = (_xmlNode *)OCXFindChild(v13, v16, "bldChart");

      if (v17)
      {
        uint64_t v18 = CXDefaultLongAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"animBg", 1);
        id v19 = CXDefaultStringAttribute(v17, (CXNamespace *)CXNoNamespace, (xmlChar *)"bld", (NSString *)@"allAtOnce");
        id v11 = -[PDChartBuild initWithBuildType:]([PDChartBuild alloc], "initWithBuildType:", [a1 readChartBuildType:v19]);
        [(PDBuild *)v11 setIsAnimateBackground:v18 > 0];

        goto LABEL_9;
      }
LABEL_8:
      id v11 = 0;
    }
  }
LABEL_9:

  return v11;
}

@end