@interface TUIElementTextAInstantiator
+ (Class)objectClass;
+ (id)builderProtocols;
+ (id)requiredBuilderProtocol;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7;
@end

@implementation TUIElementTextAInstantiator

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUITextModelBuilding;
}

+ (id)builderProtocols
{
  return 0;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v10 = a3;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___TUIElementTextAInstantiator;
  id v11 = a5;
  [super configureObject:v10 withNode:a4.var0 attributes:v11 context:a6];
  v12 = [v11 stringForAttribute:103 node:a4.var0];

  if (v12)
  {
    v13 = +[NSURL URLWithString:v12];
    [v10 setUrl:v13];
  }
  else
  {
    [v10 setUrl:0];
  }
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [v12 url];
  if (v16
    && (v17 = (void *)v16, unsigned __int8 v18 = [v13 options], v17, (v18 & 2) != 0))
  {
    v19 = [v12 url];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_6001C;
    v21[3] = &unk_2531B8;
    unsigned int var0 = a3.var0;
    id v22 = v12;
    id v23 = v13;
    id v24 = v14;
    id v25 = v15;
    id v26 = a1;
    [v23 appendHyperlinkWithURL:v19 block:v21];
  }
  else
  {
    v20.receiver = a1;
    v20.super_class = (Class)&OBJC_METACLASS___TUIElementTextAInstantiator;
    objc_msgSendSuper2(&v20, "instantiateChildrenOfNode:object:containingBuilder:context:block:", a3.var0, v12, v13, v14, v15);
  }
}

@end