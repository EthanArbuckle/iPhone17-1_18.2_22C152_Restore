@interface TUIElementPageControl
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementPageControl

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

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7 = a5;
  v8 = objc_alloc_init(_TUIElementPageControlBuilder);
  v9 = [v7 stringForAttribute:116 node:a3.var0];

  id v10 = v9;
  v11 = v10;
  if (qword_2DF9F0 != -1)
  {
    dispatch_once(&qword_2DF9F0, &stru_256E90);
    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    id v13 = 0;
    goto LABEL_6;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  v12 = [(id)qword_2DF9E8 objectForKeyedSubscript:v11];
  id v13 = [v12 unsignedIntegerValue];

LABEL_6:
  [(_TUIElementPageControlBuilder *)v8 setKind:v13];

  return v8;
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v11 = a3;
  [v11 setEnabled:[v8 BOOLForAttribute:74 withDefault:1 node:var0]];
  [v8 floatForAttribute:156 withDefault:var0 node:1.0];
  [v11 setPressedScale:];
  v9 = [v8 pointerForNode:var0];
  [v11 setPointer:v9];

  id v10 = [v8 BOOLForAttribute:93 node:var0];
  [v11 setGrouped:v10];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 finalizeStateMapWithContext:v9];
  [v7 setStateMap:v10];

  id v11 = [v8 finalizeAnimationGroups];
  [v7 setAnimationGroups:v11];

  id v12 = [v8 kind];
  id v13 = [v7 pointer];
  objc_initWeak(&location, v7);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_168E10;
  v15[3] = &unk_256E70;
  objc_copyWeak(v17, &location);
  id v14 = v13;
  id v16 = v14;
  v17[1] = v12;
  [v7 setRenderModelBlock:v15];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

@end