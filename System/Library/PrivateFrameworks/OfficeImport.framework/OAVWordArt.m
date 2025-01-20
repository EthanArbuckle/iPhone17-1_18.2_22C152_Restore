@interface OAVWordArt
+ (unsigned)readTextAlign:(id)a3;
+ (void)readFromManager:(id)a3 toShape:(id)a4 state:(id)a5;
+ (void)readFromStyle:(id)a3 manager:(id)a4 toCharacterProperties:(id)a5 state:(id)a6;
@end

@implementation OAVWordArt

+ (void)readFromManager:(id)a3 toShape:(id)a4 state:(id)a5
{
  id v37 = a3;
  id v33 = a4;
  id v36 = a5;
  v7 = objc_alloc_init(OADPresetShapeGeometry);
  [(OADShapeGeometry *)v7 setIsEscher:1];
  [(OADPresetShapeGeometry *)v7 setType:1];
  [v33 setGeometry:v7];

  v8 = [v33 textBody];
  v32 = [v8 properties];
  v9 = +[OADTextBodyProperties defaultEscherWordArtProperties];
  [v32 setParent:v9];

  v31 = objc_alloc_init(OADPresetTextWarp);
  [(OADPresetTextWarp *)v31 setPresetTextWarpType:29];
  [v32 setTextWarp:v31];
  v10 = (_xmlNode *)[v37 shape];
  v11 = (_xmlNode *)OCXFindChild(v10, (CXNamespace *)OAVOfficeMainNamespace, "textpath");
  CXDefaultStringAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"style", 0);
  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
  v34 = OAVReadComposite(v30);
  uint64_t v12 = [v34 objectForKey:@"v-text-align"];
  if (v12) {
    v13 = (__CFString *)v12;
  }
  else {
    v13 = @"left";
  }
  v29 = v13;
  uint64_t v14 = objc_msgSend(a1, "readTextAlign:");
  v28 = CXDefaultStringAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"string", 0);
  v27 = (void *)[v28 mutableCopy];
  objc_msgSend(v27, "tc_replaceAllSubstr:with:", @"\r\n", @"\r");
  objc_msgSend(v27, "tc_replaceAllSubstr:with:", @"\n", @"\r");
  v15 = [v27 componentsSeparatedByString:@"\r"];
  for (unsigned int i = 0; [v15 count] > (unint64_t)i; ++i)
  {
    v17 = [v15 objectAtIndex:i];
    v18 = v8;
    v19 = [v8 addParagraph];
    v20 = [v19 properties];
    [v20 setAlign:v14];
    if ([v17 length])
    {
      v21 = [v19 addRegularTextRun];
      v22 = [v21 text];
      [v22 setString:v17];

      v23 = [v21 properties];
      [a1 readFromStyle:v34 manager:v37 toCharacterProperties:v23 state:v36];
    }
    v24 = [v19 paragraphEndCharacterProperties];
    [a1 readFromStyle:v34 manager:v37 toCharacterProperties:v24 state:v36];
    v25 = [v33 graphicProperties];
    if ([v25 hasFill])
    {
      v26 = [v25 fill];
      [v24 setFill:v26];

      [v25 setFill:0];
    }

    v8 = v18;
  }
}

+ (unsigned)readTextAlign:(id)a3
{
  id v3 = a3;
  v4 = (void *)+[OAVWordArt(Private) readTextAlign:]::enumMap;
  if (!+[OAVWordArt(Private) readTextAlign:]::enumMap)
  {
    id v5 = objc_alloc(NSDictionary);
    v6 = [NSNumber numberWithInt:3];
    v7 = [NSNumber numberWithInt:1];
    v8 = [NSNumber numberWithInt:0];
    v9 = [NSNumber numberWithInt:2];
    v10 = [NSNumber numberWithInt:5];
    v11 = [NSNumber numberWithInt:5];
    uint64_t v12 = objc_msgSend(v5, "initWithObjectsAndKeys:", v6, @"justify", v7, @"center", v8, @"left", v9, @"right", v10, @"letter-justify", v11, @"stretch-justify", 0);
    v13 = (void *)+[OAVWordArt(Private) readTextAlign:]::enumMap;
    +[OAVWordArt(Private) readTextAlign:]::enumMap = v12;

    v4 = (void *)+[OAVWordArt(Private) readTextAlign:]::enumMap;
  }
  uint64_t v14 = [v4 objectForKey:v3];
  unsigned __int8 v15 = [v14 intValue];

  return v15;
}

+ (void)readFromStyle:(id)a3 manager:(id)a4 toCharacterProperties:(id)a5 state:(id)a6
{
  id v24 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [v24 objectForKey:@"font-family"];
  v23 = (void *)v12;
  if (v12) {
    [v10 setLatinFont:v12];
  }
  uint64_t v13 = [v24 objectForKey:@"font-size"];
  if (v13) {
    uint64_t v14 = (NSString *)v13;
  }
  else {
    uint64_t v14 = (NSString *)@"36pt";
  }
  *(float *)&double v15 = (float)(unint64_t)OAVReadLength(v14);
  [v10 setSize:v15];
  v16 = [v24 objectForKey:@"font-weight"];
  objc_msgSend(v10, "setIsBold:", objc_msgSend(v16, "isEqualToString:", @"bold"));
  v17 = [v24 objectForKey:@"font-style"];
  objc_msgSend(v10, "setIsItalic:", objc_msgSend(v17, "isEqualToString:", @"italic"));
  v18 = [v24 objectForKey:@"text-decoration"];
  if ([v18 isEqualToString:@"underline"]) {
    [v10 setUnderlineType:2];
  }
  objc_msgSend(v10, "setStrikeThroughType:", objc_msgSend(v18, "isEqualToString:", @"line-through"));
  v19 = [v24 objectForKey:@"font-variant"];
  [v19 isEqualToString:@"small-caps"];
  v20 = v9;
  v21 = +[OAVFill readFromManager:v9 state:v11];
  [v10 setFill:v21];
  v22 = +[OAVStroke readFromManager:v20];
  [v10 setStroke:v22];
}

@end