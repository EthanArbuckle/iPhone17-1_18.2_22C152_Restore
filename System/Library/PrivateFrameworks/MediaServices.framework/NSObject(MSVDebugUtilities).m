@interface NSObject(MSVDebugUtilities)
- (id)__msv_inspectWithOptions:()MSVDebugUtilities;
- (uint64_t)__msv_inspect;
- (uint64_t)__msv_ivars;
- (uint64_t)__msv_methods;
- (uint64_t)__msv_objectDescription;
- (uint64_t)__msv_properties;
@end

@implementation NSObject(MSVDebugUtilities)

- (id)__msv_inspectWithOptions:()MSVDebugUtilities
{
  if (!MSVProcessIsDebugging())
  {
    id v11 = 0;
    goto LABEL_11;
  }
  v5 = [MEMORY[0x1E4F28E78] string];
  v6 = objc_opt_class();
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke;
  v26[3] = &unk_1E5AD9B00;
  id v7 = v5;
  id v27 = v7;
  uint64_t v28 = a3;
  _MSVEnumerateClassHierarchy(v6, 1, v26);
  if ((a3 & 0x100) != 0)
  {
    [v7 appendString:@"{\n"];
    v12 = objc_opt_class();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_3;
    v24[3] = &unk_1E5AD9B50;
    v24[4] = a1;
    id v13 = v7;
    id v25 = v13;
    _MSVEnumerateClassHierarchy(v12, 0, v24);
    [v13 appendString:@"}\n"];

    if ((a3 & 0x10000) != 0)
    {
LABEL_4:
      [v7 appendString:@"\n# Properties\n"];
      v8 = [MEMORY[0x1E4F1CA80] set];
      v9 = objc_opt_class();
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_5;
      v20[3] = &unk_1E5AD9BA0;
      uint64_t v23 = a3;
      v20[4] = a1;
      id v10 = v8;
      id v21 = v10;
      id v22 = v7;
      _MSVEnumerateClassHierarchy(v9, 0, v20);

      if ((a3 & 0x1000000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else
  {
    [v7 appendString:@"\n"];
    if ((a3 & 0x10000) != 0) {
      goto LABEL_4;
    }
  }
  id v10 = 0;
  if ((a3 & 0x1000000) != 0)
  {
LABEL_9:
    [v7 appendString:@"\n# Methods\n"];
    v14 = objc_opt_class();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __56__NSObject_MSVDebugUtilities____msv_inspectWithOptions___block_invoke_7;
    v16[3] = &unk_1E5AD9C40;
    uint64_t v19 = a3;
    id v17 = v10;
    id v18 = v7;
    _MSVEnumerateClassHierarchy(v14, 0, v16);
  }
LABEL_10:
  id v11 = v7;

LABEL_11:
  return v11;
}

- (uint64_t)__msv_properties
{
  return objc_msgSend(a1, "__msv_inspectWithOptions:", 65538);
}

- (uint64_t)__msv_methods
{
  return objc_msgSend(a1, "__msv_inspectWithOptions:", 285212674);
}

- (uint64_t)__msv_ivars
{
  return objc_msgSend(a1, "__msv_inspectWithOptions:", 256);
}

- (uint64_t)__msv_inspect
{
  return objc_msgSend(a1, "__msv_inspectWithOptions:", 285278466);
}

- (uint64_t)__msv_objectDescription
{
  return [NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), a1];
}

@end