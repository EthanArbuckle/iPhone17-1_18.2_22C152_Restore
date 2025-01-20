@interface TUIElementSupported
+ (id)attributesToIgnoreWhenResolving;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementSupported

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return 0;
}

+ (id)attributesToIgnoreWhenResolving
{
  if (qword_2DF9C0 != -1) {
    dispatch_once(&qword_2DF9C0, &stru_256B88);
  }
  v2 = (void *)qword_2DF9B8;

  return v2;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v26 = a6;
  uint64_t var0 = a4.var0;
  id v9 = a5;
  unsigned int v10 = [v9 constantNameForAttribute:137 node:a4.var0];
  v11 = [v9 stringForAttribute:71 node:var0];
  v12 = [v9 stringForAttribute:81 node:var0];
  v13 = [v9 stringForAttribute:14 node:var0];

  uint64_t v14 = +[TUIAttributeRegistry lookupAttributeWithName:v13];
  uint64_t v15 = v14;
  if (v11)
  {
    v16 = [v26 manager];
    v17 = [v16 elementRegistry];
    id v18 = [v17 elementClassForName:v11];

    unsigned int v19 = v18 != 0;
    if (!v13) {
      goto LABEL_7;
    }
    id v20 = 0;
    if (v15 != 0xFFFF && v18)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_22:
        id v20 = 0;
        goto LABEL_23;
      }
      v21 = [v18 supportedAttributes];
      unsigned int v19 = [v21 containsAttribute:v15];

LABEL_7:
      if (v12) {
        id v20 = 0;
      }
      else {
        id v20 = (id)v19;
      }
      if (!v12 || !v19) {
        goto LABEL_23;
      }
      if (objc_opt_respondsToSelector())
      {
        id v20 = [v18 supportAttribute:v15 feature:v12];
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if (v14 != 0xFFFF && v12 == 0)
  {
    v25 = +[TUIAttributeSet allSupportedAttributes];
    id v20 = [v25 containsAttribute:v15];
  }
  else
  {
    id v20 = 0;
    if (v14 == 0xFFFF && v12)
    {
      v23 = [v26 manager];
      v24 = [v23 elementRegistry];
      id v20 = [v24 supportFeature:v12];
    }
  }
LABEL_23:
  [v26 defineBool:v20 withName:v10];
}

@end