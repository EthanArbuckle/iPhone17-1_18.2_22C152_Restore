@interface TUIElementTextView
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementTextView

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_714D4;
  block[3] = &unk_252C50;
  block[4] = a1;
  if (qword_2DF440 != -1) {
    dispatch_once(&qword_2DF440, block);
  }
  v2 = (void *)qword_2DF438;

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
  if (qword_2DF450 != -1) {
    dispatch_once(&qword_2DF450, &stru_2533D0);
  }
  v2 = (void *)qword_2DF448;

  return v2;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  v10 = objc_alloc_init(_TUIElementTextViewBuilder);
  unsigned int v11 = [v9 bindingNameForAttribute:36 node:a3.var0];
  v12 = [v9 stringForAttribute:200 node:a3.var0];
  [(_TUIElementTextViewBuilder *)v10 setText:v12];

  [v9 insetsForAttribute:112 node:a3.var0];
  -[_TUIElementTextViewBuilder setEditingInsets:](v10, "setEditingInsets:");
  v13 = [v9 fontSpecForNode:a3.var0];
  v14 = [v13 attributesForAttributedString];

  v15 = [v9 stringForAttribute:138 node:a3.var0];
  [(_TUIElementTextViewBuilder *)v10 setName:v15];

  v16 = [v9 stringForAttribute:175 node:a3.var0];
  [(_TUIElementTextViewBuilder *)v10 setReturnKeyType:v16];

  v17 = [v8 viewStateForNode:a3.var0 binding:v11];

  [(_TUIElementTextViewBuilder *)v10 setViewState:v17];
  v18 = objc_alloc_init(TUITextContentStyler);
  v19 = [v9 colorForAttribute:30 node:a3.var0];
  [(TUIBackgroundColorStyler *)v18 setBackgroundColor:v19];

  v20 = [v9 colorForAttribute:51 node:a3.var0];

  [(TUITextContentStyler *)v18 setTextColor:v20];
  v21 = [v14 font];
  [(TUITextContentStyler *)v18 setFont:v21];

  [(_TUIElementTextViewBuilder *)v10 setStyle:v18];
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
  [v15 setIsEditableControl:1];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [v8 finalizeStateMapWithContext:v9];
  [v7 setStateMap:v10];

  double v11 = [v8 finalizeAnimationGroups];
  [v7 setAnimationGroups:v11];

  double v12 = [TUIElementActionTriggerHandler alloc];
  double v13 = [v8 finalizeTriggers];
  double v14 = [v9 actionObject];
  id v15 = [v9 actionDelegate];
  v16 = [(TUIElementActionTriggerHandler *)v12 initWithActionsData:v13 actionObject:v14 actionDelegate:v15];

  v17 = [v8 finalizeAnimationGroups];
  [v7 setAnimationGroups:v17];

  v18 = TUIBoxChildrenWithProtocolAndRole(v7, &OBJC_PROTOCOL___TUIPlaceholderTextBox, 6);
  v19 = [v18 firstObject];

  v40 = v19;
  v20 = [v19 placeholderString];
  v21 = [v8 viewState];
  v44 = [v8 text];
  v22 = [v8 name];
  v43 = [v8 returnKeyType];
  [v8 editingInsets];
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v31 = [v8 style];
  v41 = v9;
  v32 = [v9 environment];
  v42 = (void *)TUIKeyboardAppearanceFromEnvironmentStyle((uint64_t)[v32 style]);

  objc_initWeak(location, v7);
  [v7 setTriggerHandler:v16];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_71D50;
  v45[3] = &unk_2533F8;
  v33 = v16;
  v46 = v33;
  id v34 = v21;
  id v47 = v34;
  objc_copyWeak(v53, location);
  id v35 = v22;
  id v48 = v35;
  v53[1] = v24;
  v53[2] = v26;
  v53[3] = v28;
  v53[4] = v30;
  id v36 = v31;
  id v49 = v36;
  id v37 = v20;
  id v50 = v37;
  id v38 = v44;
  id v51 = v38;
  id v39 = v43;
  id v52 = v39;
  v53[5] = v42;
  [v7 setRenderModelBlock:v45];

  objc_destroyWeak(v53);
  objc_destroyWeak(location);
}

@end