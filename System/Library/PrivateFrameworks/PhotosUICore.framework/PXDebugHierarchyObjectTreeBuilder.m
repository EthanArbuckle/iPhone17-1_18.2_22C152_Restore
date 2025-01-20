@interface PXDebugHierarchyObjectTreeBuilder
+ (id)buildObjectTreeForDebugHierarchyWithIdentifier:(id)a3 provider:(id)a4 options:(unint64_t)a5;
+ (id)createObjectForElement:(id)a3 parentObject:(id)a4 options:(unint64_t)a5;
@end

@implementation PXDebugHierarchyObjectTreeBuilder

+ (id)createObjectForElement:(id)a3 parentObject:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  [v10 handleFailureInMethod:a2, a1, @"PXDebugHierarchyObjectTreeBuilder.m", 38, @"Method %s is a responsibility of subclass %@", "+[PXDebugHierarchyObjectTreeBuilder createObjectForElement:parentObject:options:]", v12 object file lineNumber description];

  abort();
}

+ (id)buildObjectTreeForDebugHierarchyWithIdentifier:(id)a3 provider:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__137217;
  v25 = __Block_byref_object_dispose__137218;
  id v26 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__PXDebugHierarchyObjectTreeBuilder_buildObjectTreeForDebugHierarchyWithIdentifier_provider_options___block_invoke;
  v15[3] = &unk_1E5DBE3D0;
  id v12 = v11;
  SEL v18 = a2;
  id v19 = a1;
  unint64_t v20 = a5;
  id v16 = v12;
  v17 = &v21;
  [v10 enumerateDebugHierarchyWithIdentifier:v9 options:a5 usingBlock:v15];
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __101__PXDebugHierarchyObjectTreeBuilder_buildObjectTreeForDebugHierarchyWithIdentifier_provider_options___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = [v11 parentIdentifier];
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "parentIdentifier"));
    v6 = [v4 objectForKeyedSubscript:v5];

    if (v6) {
      goto LABEL_5;
    }
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 48), *(void *)(a1 + 56), @"PXDebugHierarchyObjectTreeBuilder.m", 24, @"couldn't find parent with identifier %lu", objc_msgSend(v11, "parentIdentifier"));
  }
  v6 = 0;
LABEL_5:
  id v8 = [*(id *)(a1 + 56) createObjectForElement:v11 parentObject:v6 options:*(void *)(a1 + 64)];
  if ([v11 canHaveChildren])
  {
    id v9 = *(void **)(a1 + 32);
    id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "identifier"));
    [v9 setObject:v8 forKeyedSubscript:v10];
  }
  if (!v3) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
  }
}

@end