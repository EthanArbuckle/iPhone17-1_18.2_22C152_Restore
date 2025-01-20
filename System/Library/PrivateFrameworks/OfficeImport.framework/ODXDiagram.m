@interface ODXDiagram
+ (_xmlNode)nodeForRelationship:(id)a3 part:(id)a4 state:(id)a5;
+ (_xmlNode)nodeForRelationshipName:(const char *)a3 relIdsNode:(_xmlNode *)a4 part:(id)a5 state:(id)a6;
+ (id)readFromParentNode:(_xmlNode *)a3 state:(id)a4;
@end

@implementation ODXDiagram

+ (id)readFromParentNode:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = [v6 ODXDiagramNamespace];
  v8 = (_xmlNode *)OCXFindChild(a3, v7, "relIds");

  if (!v8)
  {
    v9 = [v6 officeArtState];
    v10 = [v9 OAXMainNamespace];
    v8 = OCXFirstChild(a3, v10, (xmlChar *)"relIds");
  }
  v11 = [v6 officeArtState];
  v12 = [v11 packagePart];

  v13 = objc_alloc_init(ODDDiagram);
  v14 = [v6 officeArtState];
  uint64_t v15 = [a1 nodeForRelationshipName:"qs" relIdsNode:v8 part:v12 state:v14];

  v16 = [(ODDDiagram *)v13 styleDefinition];
  +[ODXStyleDefinition readNode:v15 definition:v16 state:v6];

  v17 = [v6 officeArtState];
  uint64_t v18 = [a1 nodeForRelationshipName:"cs" relIdsNode:v8 part:v12 state:v17];

  v19 = [(ODDDiagram *)v13 colorTransform];
  +[ODXColorTransform readNode:v18 transform:v19 state:v6];

  v20 = [v6 officeArtState];
  uint64_t v21 = [a1 nodeForRelationshipName:"dm" relIdsNode:v8 part:v12 state:v20];

  +[ODXData readNode:v21 toDiagram:v13 state:v6];
  v22 = +[ODXDrawing readDrawingRelationshipIdFromDataNode:v21 state:v6];
  if ([v22 length])
  {
    v23 = [v12 relationshipForIdentifier:v22];
    v24 = [v6 officeArtState];
    uint64_t v25 = [a1 nodeForRelationship:v23 part:v12 state:v24];

    +[ODXDrawing readNode:v25 toDiagram:v13 state:v6];
  }
  v26 = [v6 officeArtState];
  v27 = [v26 client];
  v28 = [v6 officeArtState];
  [v27 readClientDataFromGraphicDataNode:a3 toDiagram:v13 state:v28];

  v29 = [v6 officeArtState];
  [v29 setPackagePart:v12];

  return v13;
}

+ (_xmlNode)nodeForRelationshipName:(const char *)a3 relIdsNode:(_xmlNode *)a4 part:(id)a5 state:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v12 = [v11 OCXReadRequiredRelationshipForNode:a4 attributeName:a3 packagePart:v10];
  v13 = (_xmlNode *)[a1 nodeForRelationship:v12 part:v10 state:v11];

  return v13;
}

+ (_xmlNode)nodeForRelationship:(id)a3 part:(id)a4 state:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 package];
  id v11 = [v7 targetLocation];
  v12 = [v10 partForLocation:v11];

  if (!v12)
  {
    v13 = (void *)MEMORY[0x263EFF940];
    v14 = [v7 identifier];
    [v13 raise:@"ODXException", @"Couldn't find drawing part: %@", v14 format];
  }
  [v9 setPackagePart:v12];
  uint64_t v15 = OCXGetRootElement((_xmlDoc *)[v12 xmlDocument]);
  if (!v15)
  {
    v16 = (void *)MEMORY[0x263EFF940];
    v17 = [v7 identifier];
    [v16 raise:@"ODXException", @"Couldn't get root node for drawing part: %@", v17 format];
  }
  uint64_t v18 = [v8 package];
  v19 = [v7 targetLocation];
  [v18 resetPartForLocation:v19];

  return v15;
}

@end