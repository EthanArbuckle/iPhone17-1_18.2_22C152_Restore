@interface TUIElementSegmentedControl
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementSegmentedControl

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  if (qword_2DF8B8 != -1) {
    dispatch_once(&qword_2DF8B8, &stru_2567E8);
  }
  v2 = (void *)qword_2DF8B0;

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
  if (qword_2DF8C8 != -1) {
    dispatch_once(&qword_2DF8C8, &stru_256808);
  }
  v2 = (void *)qword_2DF8C0;

  return v2;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  LODWORD(v7) = a3;
  id v8 = a5;
  id v9 = a6;
  v10 = objc_alloc_init(_TUIElementSegmentControlBuilder);
  uint64_t v7 = v7;
  v11 = [v9 viewStateForNode:v7 binding:[v8 bindingNameForAttribute:36 node:v7]];
  [(_TUIElementSegmentControlBuilder *)v10 setViewState:v11];

  v12 = [v8 stringForAttribute:138 node:v7];
  [(_TUIElementSegmentControlBuilder *)v10 setName:v12];

  -[_TUIElementSegmentControlBuilder setSelectIndex:](v10, "setSelectIndex:", [v8 integerForAttribute:184 withDefault:0 node:v7]);
  v13 = [v8 colorForAttribute:51 node:v7];
  [(_TUIElementSegmentControlBuilder *)v10 setTintColor:v13];

  return v10;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v13 = a3;
  id v8 = a5;
  [v8 insetsForAttribute:206 node:a4.var0];
  [v13 setTouchInsets:UIEdgeInsetsZero.top - v9, UIEdgeInsetsZero.left - v10, UIEdgeInsetsZero.bottom - v11, UIEdgeInsetsZero.right - v12];
  [v13 setEnabled:[v8 BOOLForAttribute:74 withDefault:1 node:a4.var0]];
  [v8 floatForAttribute:156 withDefault:a4.var0 node:1.0];
  [v13 setPressedScale:];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v26 = a5;
  v25 = [v8 finalizeSegments];
  double v9 = [TUIElementActionTriggerHandler alloc];
  double v10 = [v8 finalizeTriggers];
  double v11 = [v26 actionObject];
  double v12 = [v26 actionDelegate];
  id v13 = [(TUIElementActionTriggerHandler *)v9 initWithActionsData:v10 actionObject:v11 actionDelegate:v12];

  v14 = [v8 finalizeAnimationGroups];
  [v7 setAnimationGroups:v14];

  v15 = [v8 viewState];
  v16 = [v8 name];
  id v17 = [v8 selectIndex];
  v24 = [v8 tintColor];
  objc_initWeak(&location, v7);
  [v7 setTriggerHandler:v13];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_15CE38;
  v27[3] = &unk_256830;
  v18 = v13;
  v28 = v18;
  v23 = v13;
  id v19 = v15;
  id v29 = v19;
  objc_copyWeak(v33, &location);
  id v20 = v16;
  id v30 = v20;
  v33[1] = v17;
  id v21 = v25;
  id v31 = v21;
  id v22 = v24;
  id v32 = v22;
  [v7 setRenderModelBlock:v27, v23];

  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
}

@end