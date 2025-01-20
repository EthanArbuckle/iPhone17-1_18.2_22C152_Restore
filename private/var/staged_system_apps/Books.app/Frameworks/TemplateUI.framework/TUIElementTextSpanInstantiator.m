@interface TUIElementTextSpanInstantiator
+ (Class)objectClass;
+ (id)builderProtocols;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7;
@end

@implementation TUIElementTextSpanInstantiator

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
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUITextModelBuilding;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8 = a5;
  id v9 = a3;
  [v9 setStyle:0];
  v10 = [v8 fontSpecForNode:a4.var0];
  [v9 setFontSpec:v10];

  id v11 = [v8 colorForAttribute:51 node:a4.var0];

  [v9 setColor:v11];
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a7;
  if (([v10 options] & 2) != 0)
  {
    id v12 = [v9 style];
    v13 = [v9 color];
    v14 = [v9 fontSpec];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_5FD40;
    v15[3] = &unk_252600;
    id v17 = v11;
    id v16 = v10;
    [v16 appendWithStyle:v12 color:v13 fontSpec:v14 block:v15];
  }
  else
  {
    (*((void (**)(id, id, void))v11 + 2))(v11, v10, 0);
  }
}

@end