@interface TUIElementButtonStateInstantiator
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7;
@end

@implementation TUIElementButtonStateInstantiator

+ (unint64_t)definesScopes
{
  return 63;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIStateBuilding;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v8 = a3;
  uint64_t v9 = [a5 stringForAttribute:137 node:a4.var0];
  v10 = (void *)v9;
  if (v9)
  {
    uint64_t v12 = v9;
    v11 = +[NSArray arrayWithObjects:&v12 count:1];
    [v8 setStates:v11];
  }
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  v13 = [a4 states];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_164624;
  v17[3] = &unk_2561B0;
  id v19 = v10;
  id v20 = v12;
  id v18 = v11;
  id v14 = v10;
  id v15 = v11;
  id v16 = v12;
  [v15 evaluateStates:v13 block:v17];
}

@end