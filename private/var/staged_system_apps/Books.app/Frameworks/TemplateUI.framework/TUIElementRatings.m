@interface TUIElementRatings
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
+ (void)preconfigureBox:(id)a3 context:(id)a4;
@end

@implementation TUIElementRatings

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  if (qword_2DF5F8 != -1) {
    dispatch_once(&qword_2DF5F8, &stru_255030);
  }
  v2 = (void *)qword_2DF5F0;

  return v2;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2DF608 != -1) {
    dispatch_once(&qword_2DF608, &stru_255050);
  }
  v2 = (void *)qword_2DF600;

  return v2;
}

+ (void)preconfigureBox:(id)a3 context:(id)a4
{
  id v4 = a3;
  [v4 setAXElement:1];
  [v4 setAxAdjustable:1];
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  LODWORD(v10) = a3;
  id v7 = a5;
  id v8 = a6;
  v9 = objc_alloc_init(_TUIElementRatingsBuilder);
  uint64_t v10 = v10;
  id v11 = [v8 childCountForNode:v10];
  v12 = [v8 viewStateForNode:v10 binding:[v7 bindingNameForAttribute:36 node:v10]];

  [(_TUIElementRatingsBuilder *)v9 setViewState:v12];
  if (v11)
  {
    BOOL v13 = 1;
  }
  else
  {
    id v8 = [(_TUIElementRatingsBuilder *)v9 viewState];
    BOOL v13 = v8 != 0;
  }
  -[_TUIElementRatingsBuilder setEnabled:](v9, "setEnabled:", [v7 BOOLForAttribute:74 withDefault:v13 node:v10]);
  if (!v11) {

  }
  v14 = [v7 colorForAttribute:51 node:v10];
  [(_TUIElementRatingsBuilder *)v9 setColor:v14];

  v15 = [v7 colorForAttribute:196 node:v10];
  [(_TUIElementRatingsBuilder *)v9 setStartColor:v15];

  v16 = [v7 colorForAttribute:30 node:v10];
  [(_TUIElementRatingsBuilder *)v9 setBackgroundColor:v16];

  v17 = [v7 stringForAttribute:116 node:v10];
  [(_TUIElementRatingsBuilder *)v9 setBackgroundKind:+[TUIRatingsBox backgroundKindFromString:v17]];

  v18 = [v7 stringForAttribute:138 node:v10];
  [(_TUIElementRatingsBuilder *)v9 setName:v18];

  [v7 floatForAttribute:163 node:v10];
  -[_TUIElementRatingsBuilder setRating:](v9, "setRating:");

  return v9;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v24 = a3;
  id v8 = a5;
  id v9 = [v8 lengthForAttribute:223 node:a4.var0];
  [v24 setSize:[TUIRatingsBox sizeFromWidth:v9, v10]];
  id v11 = [v8 lengthForAttribute:223 node:a4.var0];
  [v24 setWidth:v11, v12];
  id v13 = [v8 lengthForAttribute:98 node:a4.var0];
  [v24 setHeight:v13 v14];
  v15 = [v24 axLabel];

  if (!v15)
  {
    [v8 floatForAttribute:163 node:a4.var0];
    double v17 = v16;
    v18 = TUIBundle();
    v19 = [v18 localizedStringForKey:@"Rating" value:&stru_257BF0 table:@"TemplateUILocalizable"];

    v20 = TUIBundle();
    v21 = [v20 localizedStringForKey:@"%lu stars" value:&stru_257BF0 table:@"TemplateUILocalizable"];
    float v22 = v17 / 0.2;
    v23 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v21, vcvtas_u32_f32(v22));

    [v24 setAxLabel:v19];
    [v24 setAxValue:v23];
  }
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v8 axActions];
  [v7 setAxCustomActions:v10];

  id v11 = [TUIElementActionTriggerHandler alloc];
  uint64_t v12 = [v8 finalizeTriggers];
  id v13 = [v9 actionObject];
  v32 = v9;
  uint64_t v14 = [v9 actionDelegate];
  v15 = [(TUIElementActionTriggerHandler *)v11 initWithActionsData:v12 actionObject:v13 actionDelegate:v14];

  double v16 = [v8 finalizeAnimationGroups];
  [v7 setAnimationGroups:v16];

  [v7 setTriggerHandler:v15];
  double v17 = [v7 refId];
  [(TUIElementActionTriggerHandler *)v15 setRefId:v17];

  v18 = [v8 viewState];
  v19 = [v8 name];
  v20 = [v8 color];
  v21 = [v8 startColor];
  v33 = [v8 backgroundColor];
  id v22 = [v8 backgroundKind];
  unsigned __int8 v23 = [v8 enabled];
  [v8 rating];
  v25 = v24;
  objc_initWeak(location, v7);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_CE6E4;
  v34[3] = &unk_255078;
  v26 = v15;
  v35 = v26;
  id v27 = v18;
  id v36 = v27;
  objc_copyWeak(v41, location);
  id v28 = v19;
  id v37 = v28;
  v41[1] = v25;
  unsigned __int8 v42 = v23;
  id v29 = v20;
  id v38 = v29;
  id v30 = v21;
  id v39 = v30;
  id v31 = v33;
  id v40 = v31;
  v41[2] = v22;
  [v7 setRenderModelBlock:v34];

  objc_destroyWeak(v41);
  objc_destroyWeak(location);
}

@end