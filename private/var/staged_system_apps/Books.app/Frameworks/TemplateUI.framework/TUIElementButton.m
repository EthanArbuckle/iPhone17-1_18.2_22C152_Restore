@interface TUIElementButton
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
+ (void)preconfigureBox:(id)a3 context:(id)a4;
@end

@implementation TUIElementButton

+ (unint64_t)definesScopes
{
  return 0;
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
  if (qword_2DF250 != -1) {
    dispatch_once(&qword_2DF250, &stru_252460);
  }
  v2 = (void *)qword_2DF248;

  return v2;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  LODWORD(v7) = a3;
  id v8 = a6;
  id v9 = a5;
  v10 = objc_alloc_init(_TUIElementButtonBuilder);
  uint64_t v7 = v7;
  v11 = [v9 stringForAttribute:138 node:v7];
  [(_TUIElementButtonBuilder *)v10 setName:v11];

  v12 = [v9 colorForAttribute:30 node:v7];
  [(_TUIElementButtonBuilder *)v10 setBackgroundColor:v12];

  v13 = [v8 viewStateForNode:v7 binding:[v9 bindingNameForAttribute:36 node:v7]];

  [(_TUIElementButtonBuilder *)v10 setViewState:v13];
  v14 = [v9 stringForAttribute:116 node:v7];
  [(_TUIElementButtonBuilder *)v10 setButtonType:+[TUIButtonBox buttonTypeFromString:v14]];

  v15 = [v9 stringForAttribute:44 node:v7];
  [(_TUIElementButtonBuilder *)v10 setButtonRole:+[TUIButtonBox buttonRoleFromString:v15]];

  id v16 = [v9 BOOLForAttribute:139 node:v7];
  [(_TUIElementButtonBuilder *)v10 setMenuIsPrimary:v16];
  return v10;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v20 = a3;
  [v20 setEnabled:[v8 BOOLForAttribute:74 withDefault:1 node:var0]];
  [v8 floatForAttribute:156 withDefault:var0 node:1.0];
  [v20 setPressedScale:];
  id v9 = [v8 pointerForNode:var0];
  [v20 setPointer:v9];

  v10 = [v8 stringForAttribute:214 node:var0];
  [v20 setUserInterfaceStyle:[TUIBox userInterfaceStyleFromString:v10]];

  v11 = [v8 focusStyleForAttribute:88 node:var0];
  [v20 setFocusStyle:v11];

  [v8 insetsForAttribute:206 node:var0];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  [v20 setTouchInsets:UIEdgeInsetsZero.top - v13, UIEdgeInsetsZero.left - v15, UIEdgeInsetsZero.bottom - v17, UIEdgeInsetsZero.right - v19];
}

+ (void)preconfigureBox:(id)a3 context:(id)a4
{
  id v4 = a3;
  [v4 setAXElement:1];
  [v4 setAxButton:1];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  [v7 setButtonType:[v8 buttonType]];
  [v7 setButtonRole:[v8 buttonRole]];
  v10 = [v8 finalizeStateMapWithContext:v9];
  [v7 setStateMap:v10];

  v11 = [v8 finalizeAnimationGroups];
  [v7 setAnimationGroups:v11];

  double v12 = [v8 menuContainer];
  [v7 setMenuContainer:v12];

  [v7 setMenuIsPrimary:[v8 menuIsPrimary]];
  double v13 = [v8 finalizeLinkEntities];
  [v7 setLinkEntities:v13];

  double v14 = [v9 actionObject];
  double v15 = [v9 actionDelegate];
  objc_initWeak(&location, v15);

  double v16 = [TUIElementActionTriggerHandler alloc];
  double v17 = [v8 finalizeTriggers];
  id v18 = objc_loadWeakRetained(&location);
  double v19 = [(TUIElementActionTriggerHandler *)v16 initWithActionsData:v17 actionObject:v14 actionDelegate:v18];

  [v7 setTriggerHandler:v19];
  id v20 = [v7 refId];
  [(TUIElementActionTriggerHandler *)v19 setRefId:v20];

  v21 = objc_alloc_init(TUIBackgroundColorStyler);
  uint64_t v22 = [v8 name];
  v23 = [v8 backgroundColor];
  [(TUIBackgroundColorStyler *)v21 setBackgroundColor:v23];

  v24 = [v8 viewState];
  v25 = [v9 environment];
  v33 = v9;
  v34 = (void *)v22;
  if ([v25 accessibilityElementsNeeded]
    && objc_msgSend(v7, "axHasNonDefaultAttributess", v9, v22))
  {
    v26 = [[TUIAXAttributes alloc] initWithAXAttributes:v7];
  }
  else
  {
    v26 = 0;
  }

  objc_initWeak(&from, v7);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_2F5B0;
  v35[3] = &unk_252488;
  objc_copyWeak(&v42, &from);
  id v27 = v14;
  id v36 = v27;
  objc_copyWeak(&v43, &location);
  v28 = v19;
  v37 = v28;
  id v29 = v24;
  id v38 = v29;
  v30 = v21;
  v39 = v30;
  id v31 = v34;
  id v40 = v31;
  v32 = v26;
  v41 = v32;
  [v7 setRenderModelBlock:v35];

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

@end