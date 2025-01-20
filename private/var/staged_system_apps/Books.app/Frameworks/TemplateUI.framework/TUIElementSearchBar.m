@interface TUIElementSearchBar
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementSearchBar

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4A648;
  block[3] = &unk_252C50;
  block[4] = a1;
  if (qword_2DF310 != -1) {
    dispatch_once(&qword_2DF310, block);
  }
  v2 = (void *)qword_2DF308;

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
  if (qword_2DF320 != -1) {
    dispatch_once(&qword_2DF320, &stru_252C70);
  }
  v2 = (void *)qword_2DF318;

  return v2;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  v10 = objc_alloc_init(_TUIElementSearchBarBuilder);
  unsigned int v11 = [v9 bindingNameForAttribute:36 node:a3.var0];
  v12 = [v9 stringForAttribute:200 node:a3.var0];
  [(_TUIElementSearchBarBuilder *)v10 setText:v12];

  [v9 insetsForAttribute:112 node:a3.var0];
  -[_TUIElementSearchBarBuilder setEditingInsets:](v10, "setEditingInsets:");
  v13 = [v9 fontSpecForNode:a3.var0];
  v14 = [v13 attributesForAttributedString];

  v15 = [v9 stringForAttribute:138 node:a3.var0];
  [(_TUIElementSearchBarBuilder *)v10 setName:v15];

  v16 = [v9 stringForAttribute:175 node:a3.var0];
  [(_TUIElementSearchBarBuilder *)v10 setReturnKeyType:v16];

  v17 = [v8 viewStateForNode:a3.var0 binding:v11];

  [(_TUIElementSearchBarBuilder *)v10 setViewState:v17];
  v18 = [v9 stringForAttribute:47 node:a3.var0];
  [(_TUIElementSearchBarBuilder *)v10 setCancelText:v18];

  -[_TUIElementSearchBarBuilder setShowCancel:](v10, "setShowCancel:", [v9 BOOLForAttribute:190 node:a3.var0]);
  v19 = objc_alloc_init(TUITextContentStyler);
  v20 = [v9 colorForAttribute:30 node:a3.var0];
  [(TUIBackgroundColorStyler *)v19 setBackgroundColor:v20];

  v21 = [v9 colorForAttribute:51 node:a3.var0];
  [(TUITextContentStyler *)v19 setTextColor:v21];

  v22 = [v14 font];
  [(TUITextContentStyler *)v19 setFont:v22];

  v23 = [v9 colorForAttribute:203 node:a3.var0];

  [(TUITextContentStyler *)v19 setTintColor:v23];
  [(_TUIElementSearchBarBuilder *)v10 setStyle:v19];

  return v10;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v15 = a3;
  [v8 insetsForAttribute:206 node:var0];
  [v15 setTouchInsets:UIEdgeInsetsZero.top - v9, UIEdgeInsetsZero.left - v10, UIEdgeInsetsZero.bottom - v11, UIEdgeInsetsZero.right - v12];
  [v15 setEnabled:[v8 BOOLForAttribute:74 withDefault:1 node:var0]];
  [v8 floatForAttribute:156 withDefault:var0 node:1.0];
  double v14 = v13;

  [v15 setPressedScale:v14];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [v8 finalizeStateMapWithContext:v9];
  [v7 setStateMap:v10];

  double v11 = [TUIElementActionTriggerHandler alloc];
  double v12 = [v8 finalizeTriggers];
  double v13 = [v9 actionObject];
  double v14 = [v9 actionDelegate];
  id v15 = [(TUIElementActionTriggerHandler *)v11 initWithActionsData:v12 actionObject:v13 actionDelegate:v14];

  v16 = [v8 finalizeAnimationGroups];
  [v7 setAnimationGroups:v16];

  v17 = TUIBoxChildrenWithProtocolAndRole(v7, &OBJC_PROTOCOL___TUIPlaceholderTextBox, 6);
  v18 = [v17 firstObject];

  v19 = [v18 placeholderString];
  v20 = [v8 viewState];
  v45 = [v8 text];
  v21 = [v8 name];
  v44 = [v8 returnKeyType];
  [v8 editingInsets];
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = [v8 style];
  v40 = v9;
  v31 = [v9 environment];
  v43 = (void *)TUIKeyboardAppearanceFromEnvironmentStyle((uint64_t)[v31 style]);

  unsigned __int8 v42 = [v8 showCancel];
  v41 = [v8 cancelText];
  objc_initWeak(location, v7);
  [v7 setTriggerHandler:v15];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_4AF70;
  v46[3] = &unk_252C98;
  v39 = v15;
  v47 = v39;
  id v32 = v20;
  id v48 = v32;
  objc_copyWeak(v55, location);
  id v33 = v21;
  id v49 = v33;
  v55[1] = v23;
  v55[2] = v25;
  v55[3] = v27;
  v55[4] = v29;
  id v34 = v19;
  id v50 = v34;
  id v35 = v30;
  id v51 = v35;
  id v36 = v45;
  id v52 = v36;
  id v37 = v44;
  id v53 = v37;
  v55[5] = v43;
  id v38 = v41;
  id v54 = v38;
  unsigned __int8 v56 = v42;
  [v7 setRenderModelBlock:v46];

  objc_destroyWeak(v55);
  objc_destroyWeak(location);
}

@end