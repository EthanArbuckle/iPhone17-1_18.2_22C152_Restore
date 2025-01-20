@interface TUIElementTBox
+ (Class)objectClass;
+ (id)builderProtocols;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureChildBox:(id)a3 withChildNode:(id)a4 attributes:(id)a5 builder:(id)a6 context:(id)a7;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
+ (void)preconfigureBox:(id)a3 context:(id)a4;
@end

@implementation TUIElementTBox

+ (id)supportedAttributes
{
  if (qword_2DF420 != -1) {
    dispatch_once(&qword_2DF420, &stru_253190);
  }
  v2 = (void *)qword_2DF418;

  return v2;
}

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (id)builderProtocols
{
  v4[0] = &OBJC_PROTOCOL___TUITextModelBuilding;
  v4[1] = &OBJC_PROTOCOL___TUIModelBuilding;
  v4[2] = &OBJC_PROTOCOL___TUIBoxBuilding;
  v4[3] = &OBJC_PROTOCOL___TUIAXActionsBuilding;
  v4[4] = &OBJC_PROTOCOL___TUIAnimationGroupBuilding;
  v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  uint64_t var0 = a3.var0;
  id v12 = a4;
  uint64_t v34 = [v9 colorForAttribute:51 node:a3.var0];
  uint64_t v33 = [v9 fontSpecForNode:a3.var0];
  unsigned int v13 = [v9 BOOLForAttribute:122 node:a3.var0];
  v14 = [v9 stringForAttribute:201 node:a3.var0];
  int64_t v15 = +[TUIBox textAlignmentFromString:v14];

  v16 = [v10 serviceConformingToProtocol:&OBJC_PROTOCOL___TUIWPService];
  v17 = [v10 environment];
  v18 = (char *)[v17 layoutDirection];

  unsigned __int8 v19 = [v9 BOOLForAttribute:189 node:a3.var0];
  v20 = (char *)[v12 role];

  if (v20 == (unsigned char *)&dword_4 + 2)
  {
    v22 = (void *)v33;
    v21 = (void *)v34;
    v23 = [[TUIAttributedStringBuilder alloc] initWithFontSpec:v33 style:0 color:v34 textAlignment:v15];
  }
  else
  {
    BOOL v32 = v18 == (unsigned char *)&def_141F14 + 2;
    if (v13) {
      uint64_t v24 = 4;
    }
    else {
      uint64_t v24 = 0;
    }
    v25 = [v10 environment];
    [v25 language];
    v27 = v26 = v16;
    LOBYTE(v31) = v19;
    v22 = (void *)v33;
    uint64_t v28 = v24;
    v21 = (void *)v34;
    v23 = +[TUIWPBox textModelBuilderWithFontSpec:v33 style:v28 color:v34 alignment:v15 writingDirection:v32 language:v27 shouldHyphenate:v31 service:v26];

    v16 = v26;
  }
  v29 = [v9 stringForAttribute:102 node:var0];
  [(TUIAttributedStringBuilder *)v23 setOptions:sub_5ED20(v29, 2uLL)];

  return v23;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v9 = a3;
  objc_msgSend(v9, "setMaxLines:", (unint64_t)fmax((double)(uint64_t)objc_msgSend(v8, "integerForAttribute:withDefault:node:", 129, 0, var0), 0.0));
  [v9 setHideEllipses:[v8 BOOLForAttribute:100 node:var0]];
  [v9 setAllowHangingPunctuation:[v8 BOOLForAttribute:6 node:var0]];
  [v9 setAllowShrinkToFit:[v8 BOOLForAttribute:7 node:var0]];
  id v11 = [v8 stringForAttribute:37 node:var0];

  id v10 = +[TUIBox blendModeFromString:v11];
  [v9 setBlendMode:v10];
}

+ (void)preconfigureBox:(id)a3 context:(id)a4
{
  id v4 = a3;
  [v4 setAXElement:1];
  [v4 setAxStaticText:1];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = (char *)[v14 role];
  id v10 = [v7 finalizeTextModelWithContext:v8];
  if (v9 == (unsigned char *)&dword_4 + 2) {
    [v14 setPlaceholderString:v10];
  }
  else {
    [v14 setTextModel:v10];
  }

  id v11 = [v7 finalizeModelsWithParent:v14 box:v14 context:v8];
  if ([v14 isAXElement])
  {
    id v12 = [v14 axLabel];

    if (!v12)
    {
      unsigned int v13 = [v14 string];
      [v14 setAxLabel:v13];
    }
  }
}

+ (void)configureChildBox:(id)a3 withChildNode:(id)a4 attributes:(id)a5 builder:(id)a6 context:(id)a7
{
  uint64_t var0 = a4.var0;
  id v9 = a6;
  [a5 floatForAttribute:34 node:var0];
  [v9 setBaselineOffset:];
}

@end