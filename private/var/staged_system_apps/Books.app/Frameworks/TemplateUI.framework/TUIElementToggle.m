@interface TUIElementToggle
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementToggle

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  if (qword_2DF7D8 != -1) {
    dispatch_once(&qword_2DF7D8, &stru_2563D0);
  }
  v2 = (void *)qword_2DF7D0;

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
  if (qword_2DF7E8 != -1) {
    dispatch_once(&qword_2DF7E8, &stru_2563F0);
  }
  v2 = (void *)qword_2DF7E0;

  return v2;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  LODWORD(v7) = a3;
  id v8 = a6;
  id v9 = a5;
  v10 = objc_alloc_init(_TUIElementToggleBuilder);
  uint64_t v7 = v7;
  v11 = [v8 viewStateForNode:v7 binding:[v9 bindingNameForAttribute:36 node:v7]];

  [(_TUIElementToggleBuilder *)v10 setViewState:v11];
  -[_TUIElementToggleBuilder setEnabled:](v10, "setEnabled:", [v9 BOOLForAttribute:74 withDefault:1 node:v7]);
  -[_TUIElementToggleBuilder setIsOn:](v10, "setIsOn:", [v9 BOOLForAttribute:145 withDefault:0 node:v7]);
  v12 = [v9 stringForAttribute:138 node:v7];

  [(_TUIElementToggleBuilder *)v10 setName:v12];
  return v10;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a3;
  id v9 = [a5 stringForAttribute:204 node:var0];
  [v8 setTitle:v9];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [TUIElementActionTriggerHandler alloc];
  v11 = [v8 finalizeTriggers];
  v12 = [v9 actionObject];
  v13 = [v9 actionDelegate];
  v14 = [(TUIElementActionTriggerHandler *)v10 initWithActionsData:v11 actionObject:v12 actionDelegate:v13];

  v15 = [v8 finalizeAnimationGroups];
  [v7 setAnimationGroups:v15];

  v16 = [v8 viewState];
  unsigned __int8 v17 = [v8 enabled];
  unsigned __int8 v18 = [v8 isOn];
  v19 = [v8 name];
  v20 = [v7 title];
  [v7 width];
  if ((v21 & 0x7000000000000) >= 0x2000000000001 && (HIWORD(v21) & 7) - 7 <= 0xFFFFFFFFFFFFFFFDLL) {
    [v9 reportError:1032];
  }
  v22 = [v7 refId];
  [(TUIElementActionTriggerHandler *)v14 setRefId:v22];

  objc_initWeak(&location, v7);
  [v7 setTriggerHandler:v14];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_145B70;
  v27[3] = &unk_256418;
  v23 = v14;
  v28 = v23;
  id v24 = v16;
  id v29 = v24;
  unsigned __int8 v33 = v17;
  objc_copyWeak(&v32, &location);
  id v25 = v19;
  id v30 = v25;
  id v26 = v20;
  id v31 = v26;
  unsigned __int8 v34 = v18;
  [v7 setRenderModelBlock:v27];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

@end