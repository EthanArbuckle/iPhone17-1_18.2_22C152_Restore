@interface TUIElementTextDropCapInstantiator
+ (Class)objectClass;
+ (id)builderProtocols;
+ (id)requiredBuilderProtocol;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7;
@end

@implementation TUIElementTextDropCapInstantiator

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
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___TUIElementTextDropCapInstantiator;
  uint64_t var0 = a4.var0;
  id v9 = a5;
  id v10 = a3;
  [super configureObject:v10 withNode:var0 attributes:v9 context:a6];
  [v10 setCharCount:[v9 unsignedIntegerForAttribute:48 withDefault:0x7FFFFFFFFFFFFFFFLL node:var0 v12.receiver v12.super_class]];
  [v10 setLines:[v9 unsignedIntegerForAttribute:123 withDefault:2 node:var0]];
  [v10 setRaised:[v9 unsignedIntegerForAttribute:161 withDefault:0 node:var0]];
  [v9 floatForAttribute:147 node:var0];
  [v10 setPadding:];
  v11 = [v9 colorForAttribute:30 node:var0];

  [v10 setBackgroundColor:v11];
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  [v12 ensureParagraphBoundaryWithBuilder:v13];
  v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  v24 = sub_60528;
  v25 = &unk_2531B8;
  unsigned int var0 = a3.var0;
  id v26 = v12;
  id v27 = v13;
  id v28 = v14;
  id v29 = v15;
  id v30 = a1;
  id v16 = v15;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  [v18 appendWithBlock:&v22];
  if (v20 <= 1) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v20;
  }
  [v19 setCharCount:v21, v22, v23, v24, v25];
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v16 = a3;
  id v6 = a4;
  [v16 ensureParagraphBoundaryWithBuilder:v6];
  char v7 = objc_opt_respondsToSelector();
  id v8 = [v16 charCount];
  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = (uint64_t)v8;
  }
  if ((v7 & 1) != 0 && v9)
  {
    id v10 = [v16 lines];
    id v11 = [v16 raised];
    id v12 = [v16 style];
    id v13 = [v16 color];
    id v14 = [v16 fontSpec];
    id v15 = [v16 backgroundColor];
    [v16 padding];
    [v6 configureDropCapWithCount:v9 lines:v10 raised:v11 style:v12 color:v13 fontSpec:v14 backgroundColor:v15];
  }
}

@end