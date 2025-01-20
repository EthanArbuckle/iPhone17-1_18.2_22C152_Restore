@interface TUIElementExpandable
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)attributesToIgnoreWhenResolving;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 builder:(id)a5 context:(id)a6 block:(id)a7;
- ($201E9A47BE70A2B12CCA2F48B75AA2F7)binding;
@end

@implementation TUIElementExpandable

+ (id)supportedAttributes
{
  if (qword_2DF330 != -1) {
    dispatch_once(&qword_2DF330, &stru_252CB8);
  }
  v2 = (void *)qword_2DF328;

  return v2;
}

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

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2DF340 != -1) {
    dispatch_once(&qword_2DF340, &stru_252CD8);
  }
  v2 = (void *)qword_2DF338;

  return v2;
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v7 = a5;
  v8 = objc_alloc_init(_TUIElementExpandableBuilder);
  -[_TUIElementExpandableBuilder setBinding:](v8, "setBinding:", [v7 bindingNameForAttribute:36 node:a3.var0]);
  v9 = [v7 stringForAttribute:152 node:a3.var0];
  [(_TUIElementExpandableBuilder *)v8 setPointerRefId:v9];

  v10 = [v7 pointerStyleForNode:a3.var0];

  [(_TUIElementExpandableBuilder *)v8 setPointerStyle:v10];
  return v8;
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 finalizeModelsWithParent:v7 box:v7 context:v9];
  v11 = [v8 pointerRefId];
  [v7 setPointerRefId:v11];

  v12 = [v8 pointerStyle];
  [v7 setPointerStyle:v12];

  v13 = objc_opt_new();
  v29 = v7;
  [v7 appendLayoutChildrenToArray:v13];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    unsigned __int8 v17 = 0;
    int v18 = 0;
    int v19 = 0;
    uint64_t v20 = *(void *)v31;
    v27 = v9;
    id v28 = v8;
    while (2)
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v14);
        }
        v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        BOOL v23 = [v22 role] == 0;
        if (v23 & v19)
        {
          uint64_t v26 = 1021;
          goto LABEL_14;
        }
        BOOL v24 = [v22 role] == (char *)&def_141F14 + 2;
        if ((v24 & v18 & 1) != 0
          || (v25 = (char *)[v22 role], ((v25 == (unsigned char *)&dword_4 + 1) & v17) != 0))
        {
          uint64_t v26 = 1019;
LABEL_14:
          id v9 = v27;
          [v27 reportError:v26];
          id v8 = v28;
          goto LABEL_15;
        }
        v19 |= v23;
        v18 |= v24;
        v17 |= v25 == (unsigned char *)&dword_4 + 1;
      }
      id v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
      id v9 = v27;
      id v8 = v28;
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 builder:(id)a5 context:(id)a6 block:(id)a7
{
  id v19 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = (void (**)(id, void))a7;
  unsigned int v14 = [v11 binding];
  uint64_t v15 = v14;
  if (TUINameIsValid(v14))
  {
    uint64_t var0 = a3.var0;
    unsigned __int8 v17 = [v12 viewStateForNode:a3.var0 binding:v15];
    [v19 setViewState:v17];
    int v18 = [v12 instantiateBinding:v15 withDynamicProvider:v17 childrenOfNode:var0];
    if (v18) {
      [v11 addModel:v18];
    }
  }
  else
  {
    v13[2](v13, 0);
  }
}

- ($201E9A47BE70A2B12CCA2F48B75AA2F7)binding
{
  return ($201E9A47BE70A2B12CCA2F48B75AA2F7)self->_binding;
}

@end