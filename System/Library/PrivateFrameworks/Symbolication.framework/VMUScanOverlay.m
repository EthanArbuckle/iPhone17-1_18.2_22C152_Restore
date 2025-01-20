@interface VMUScanOverlay
+ (BOOL)foundationHasNSSliceMemoryOptimization;
+ (id)defaultOverlay;
+ (id)defaultOverlayWithScanner:(id)a3;
- (NSArray)refinementRules;
- (VMUScanOverlay)initWithScanner:(id)a3;
- (void)addMetadataRefinementRule:(id)a3;
@end

@implementation VMUScanOverlay

+ (BOOL)foundationHasNSSliceMemoryOptimization
{
  if (foundationHasNSSliceMemoryOptimization_onceToken != -1) {
    dispatch_once(&foundationHasNSSliceMemoryOptimization_onceToken, &__block_literal_global_5);
  }
  return foundationHasNSSliceMemoryOptimization_foundationHasNSSliceMemoryOptimization;
}

objc_class *__56__VMUScanOverlay_foundationHasNSSliceMemoryOptimization__block_invoke()
{
  result = objc_getClass("NSConcreteHashTable");
  if (result)
  {
    result = class_getInstanceVariable(result, "slice");
    if (result)
    {
      result = (objc_class *)ivar_getTypeEncoding(result);
      if (result)
      {
        result = (objc_class *)strstr((char *)result, "acquisitionProps");
        if (result) {
          foundationHasNSSliceMemoryOptimization_foundationHasNSSliceMemoryOptimization = 1;
        }
      }
    }
  }
  return result;
}

+ (id)defaultOverlay
{
  return (id)[a1 defaultOverlayWithScanner:0];
}

+ (id)defaultOverlayWithScanner:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VMUScanOverlay_defaultOverlayWithScanner___block_invoke;
  block[3] = &unk_1E5D23998;
  id v9 = v3;
  uint64_t v4 = defaultOverlayWithScanner__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&defaultOverlayWithScanner__onceToken, block);
  }
  id v6 = (id)defaultOverlayWithScanner__s_defaultOverlay;

  return v6;
}

void __44__VMUScanOverlay_defaultOverlayWithScanner___block_invoke(uint64_t a1)
{
  v1 = [[VMUScanOverlay alloc] initWithScanner:*(void *)(a1 + 32)];
  v2 = (void *)defaultOverlayWithScanner__s_defaultOverlay;
  defaultOverlayWithScanner__s_defaultOverlay = (uint64_t)v1;
}

- (VMUScanOverlay)initWithScanner:(id)a3
{
  id v4 = a3;
  if (getenv("DT_NO_SCAN_OVERLAY"))
  {
    id v5 = 0;
  }
  else
  {
    v47.receiver = self;
    v47.super_class = (Class)VMUScanOverlay;
    id v6 = [(VMUScanOverlay *)&v47 init];
    if (v6)
    {
      uint64_t v7 = objc_opt_new();
      rules = v6->_rules;
      v6->_rules = (NSMutableArray *)v7;

      id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EFE40000];
      v10 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EFE40018];
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __34__VMUScanOverlay_initWithScanner___block_invoke;
      v43[3] = &unk_1E5D23A10;
      id v11 = v9;
      id v44 = v11;
      id v45 = v10;
      id v46 = &unk_1EFE40030;
      id v12 = v10;
      v13 = (void *)MEMORY[0x1AD0DA230](v43);
      v14 = [v11 setByAddingObject:@"libswiftCore.dylib"];
      v15 = [v4 objectIdentifier];
      v16 = [v15 swiftRuntimeInfoStableABI];
      v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        v19 = [v4 objectIdentifier];
        id v18 = [v19 swiftRuntimeInfoPreABI];
      }
      v20 = [v15 swiftRuntimeInfoStableABI];
      if (v20)
      {
        [v4 objectIdentifier];
        id v35 = v4;
        id v21 = v18;
        v22 = v6;
        v23 = v14;
        v24 = v13;
        id v25 = v11;
        v27 = id v26 = v12;
        v28 = [v27 swiftRuntimeInfoPreABI];

        id v12 = v26;
        id v11 = v25;
        v13 = v24;
        v14 = v23;
        id v6 = v22;
        id v18 = v21;
        id v4 = v35;
      }
      else
      {
        v28 = 0;
      }

      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_4;
      v36[3] = &unk_1E5D23AC0;
      id v37 = &unk_1EFE400D8;
      id v38 = v15;
      id v39 = v18;
      id v40 = v28;
      id v41 = v14;
      id v42 = v13;
      id v29 = v13;
      id v30 = v14;
      id v31 = v28;
      id v32 = v18;
      id v33 = v15;
      [(VMUScanOverlay *)v6 addMetadataRefinementRule:v36];
    }
    self = v6;
    id v5 = self;
  }

  return v5;
}

void __34__VMUScanOverlay_initWithScanner___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1AD0D9F90]();
  id v5 = [v3 binaryName];
  id v6 = [v3 className];
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v8 = [v3 binaryName];
    LODWORD(v7) = [v7 containsObject:v8];

    if (v7)
    {
      if (v6 && ([*(id *)(a1 + 40) containsObject:v6] & 1) == 0)
      {
        int v9 = [v3 pointerSize];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_2;
        v10[3] = &unk_1E5D239E8;
        id v11 = *(id *)(a1 + 48);
        id v12 = v3;
        int v13 = v9;
        [v12 mutateTypeFieldsWithBlock:v10];
      }
    }
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * v8);
        v10 = [v3 ivarName];
        LODWORD(v9) = [v10 isEqualToString:v9];

        if (v9)
        {
          id v11 = (void *)[v3 mutableCopy];
          [v11 setScanType:4];
          id v12 = *(void **)(a1 + 40);
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_3;
          v18[3] = &unk_1E5D239C0;
          id v19 = v3;
          int v20 = *(_DWORD *)(a1 + 48);
          [v12 addVariant:v11 forField:v19 withEvaluator:v18];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  int v13 = [v3 ivarName];
  if (![v13 isEqualToString:@"_bytes"]) {
    goto LABEL_13;
  }
  int v14 = [v3 scanType];

  if (v14 == 1)
  {
    v15 = [*(id *)(a1 + 40) displayName];
    int v13 = [v15 stringByAppendingString:@" (Bytes Storage)"];

    v16 = [*(id *)(a1 + 40) binaryPath];
    v17 = +[VMUClassInfo classInfoWithClassName:v13 binaryPath:v16 type:16];

    [v17 setDefaultScanType:1];
    [v3 setDestinationLayout:v17];

LABEL_13:
  }
}

uint64_t __34__VMUScanOverlay_initWithScanner___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  [*(id *)(a1 + 32) offset];
  LODWORD(a1) = *(_DWORD *)(a1 + 40);
  uint64_t v8 = v7;
  uint64_t v9 = (uint64_t (*)(void))v8[2];
  if (a1 == 8)
  {
    v10 = (uint64_t *)v9();
    if (v10)
    {
      uint64_t v11 = *v10;
      goto LABEL_7;
    }
  }
  else
  {
    id v12 = (unsigned int *)v9();
    if (v12)
    {
      uint64_t v11 = *v12;
      goto LABEL_7;
    }
  }
  uint64_t v11 = 0;
LABEL_7:

  if (v11)
  {
    int v13 = [v6 classInfoForObjectAtAddress:v11];
    int v14 = [v13 className];

    uint64_t v11 = [v14 isEqualToString:@"NSWeakObjectValue"] ^ 1;
  }

  return v11;
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_4(uint64_t a1, void *a2)
{
  v154[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 infoType] == 1
    || [v3 infoType] == 8
    || [v3 infoType] == 64
    || [v3 infoType] == 128)
  {
    id v4 = (void *)MEMORY[0x1AD0D9F90]();
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v3 className];
    id v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (__CFString *)v6;
    }
    else {
      uint64_t v8 = &stru_1EFE27F38;
    }
    uint64_t v9 = [v5 objectForKeyedSubscript:v8];

    if (v9) {
      [v3 setDisplayName:v9];
    }
    if ([v3 infoType] == 8
      || [v3 infoType] == 64
      || _isSwiftRootClass(v3))
    {
      v10 = [v3 className];
      if ([v10 hasPrefix:@"__"])
      {
        uint64_t v11 = [v3 binaryPath];
        int v12 = [v11 hasSuffix:@"libswiftCore.dylib"];

        if (v12)
        {
          int v13 = [v3 className];
          uint64_t v14 = [v13 substringFromIndex:2];
          goto LABEL_20;
        }
      }
      else
      {
      }
      int v13 = [*(id *)(a1 + 40) vmuTask];
      if (![v13 isExclaveCore])
      {
LABEL_21:

LABEL_22:
        int v20 = *(void **)(a1 + 48);
        id v19 = *(void **)(a1 + 56);
        long long v21 = *(void **)(a1 + 40);
        objc_initWeak(&location, v3);
        id v22 = v20;
        id v23 = v19;
        objc_initWeak(&from, v21);
        id v24 = objc_loadWeakRetained(&location);
        if ([v24 infoType] == 64)
        {
        }
        else
        {
          id v25 = objc_loadWeakRetained(&location);
          int isSwiftRootClass = _isSwiftRootClass(v25);

          if (isSwiftRootClass)
          {
            id v27 = objc_loadWeakRetained(&location);
            uint64_t v143 = MEMORY[0x1E4F143A8];
            uint64_t v144 = 3221225472;
            uint64_t v145 = (uint64_t)___variantForSwiftClass_block_invoke;
            v146 = &unk_1E5D23AE8;
            objc_copyWeak(&v148, &location);
            id v147 = v22;
            [v27 mutateTypeFieldsWithBlock:&v143];

            objc_destroyWeak(&v148);
LABEL_27:
            objc_destroyWeak(&from);

            objc_destroyWeak(&location);
LABEL_28:

            goto LABEL_29;
          }
        }
        id v28 = objc_loadWeakRetained(&location);
        uint64_t v143 = MEMORY[0x1E4F143A8];
        uint64_t v144 = 3221225472;
        uint64_t v145 = (uint64_t)___variantForSwiftClass_block_invoke_2;
        v146 = &unk_1E5D23BB0;
        id v147 = v22;
        objc_copyWeak(&v149, &location);
        id v148 = v23;
        objc_copyWeak(&v150, &from);
        [v28 mutateTypeFieldsRecursivelyWithBlock:&v143];

        objc_destroyWeak(&v150);
        objc_destroyWeak(&v149);

        goto LABEL_27;
      }
      v15 = [v3 className];
      int v16 = [v15 hasPrefix:@"Swift.__"];

      if (!v16) {
        goto LABEL_22;
      }
      int v13 = [v3 className];
      uint64_t v14 = [v13 substringFromIndex:8];
LABEL_20:
      v17 = (void *)v14;
      id v18 = [@"Swift." stringByAppendingString:v14];
      [v3 setDisplayName:v18];

      goto LABEL_21;
    }
    if ([*(id *)(a1 + 40) taskIsDriverKit]
      && [v3 infoType] == 128)
    {
      goto LABEL_28;
    }
    if ([v3 isARR]) {
      goto LABEL_28;
    }
    id v29 = *(void **)(a1 + 64);
    id v30 = [v3 binaryName];
    LODWORD(v29) = [v29 containsObject:v30];

    if (!v29) {
      goto LABEL_28;
    }
    id v31 = [v3 className];
    int v32 = [v31 isEqualToString:@"_CFXNotificationRegistrationContainer"];

    if (v32)
    {
      uint64_t v33 = [v3 pointerSize];
      v34 = [v3 firstFieldWithName:@"_children"];
      if (v34)
      {
        id v35 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", @"_children.elements", @"^v", 2, [v34 offset], v33);
        v36 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", @"_children.singleChildKey", @"^v", 1, [v34 offset] + v33, v33);
        id v37 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", @"_children.callbacks", @"^v", 2, [v34 offset] + 2 * v33, v33);
        v154[0] = v35;
        v154[1] = v36;
        v154[2] = v37;
        id v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v154 count:3];
        [v3 replaceField:v34 withFields:v38];

        id v39 = [(VMUFieldInfo *)v36 mutableCopy];
        [v39 setScanType:4];
        unsigned int v40 = [(VMUFieldInfo *)v37 offset];
        v140[0] = MEMORY[0x1E4F143A8];
        v140[1] = 3221225472;
        v140[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_5;
        v140[3] = &__block_descriptor_40_e45_B32__0Q8__VMUTaskMemoryScanner_16____v__QQ_24l;
        unsigned int v141 = v40;
        int v142 = v33;
        [v3 addVariant:v39 forField:v36 withEvaluator:v140];
      }
      goto LABEL_42;
    }
    id v41 = [v3 className];
    if ([v41 isEqualToString:@"__NSCFDictionary"])
    {

LABEL_41:
      _variantForCFBasicHash(v3);
LABEL_42:
      (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
      goto LABEL_28;
    }
    id v42 = [v3 className];
    int v43 = [v42 isEqualToString:@"__NSCFSet"];

    if (v43) {
      goto LABEL_41;
    }
    id v44 = [v3 className];
    int v45 = [v44 isEqualToString:@"__NSCFString"];

    if (v45)
    {
      id v46 = _destinationLayoutStorageVariant(v3, 16, @"content", 0, &stru_1EFE27F38);
      [v3 addVariant:v46 forField:0 withEvaluator:&__block_literal_global_347];
      [v3 setVariantScanType:0 withEvaluator:&__block_literal_global_349];

      goto LABEL_42;
    }
    objc_super v47 = [v3 className];
    int v48 = [v47 isEqualToString:@"NSConcreteHashTable"];

    if (v48
      || ([v3 className],
          v49 = objc_claimAutoreleasedReturnValue(),
          int v50 = [v49 isEqualToString:@"NSConcretePointerArray"],
          v49,
          v50))
    {
      v51 = @"slice";
      v52 = @"Object";
LABEL_48:
      _variantForNSSlice(v3, v51, v52);
      goto LABEL_42;
    }
    v53 = [v3 className];
    int v54 = [v53 isEqualToString:@"NSConcreteMapTable"];

    if (v54)
    {
      _variantForNSSlice(v3, @"keys", @"Key");
      v51 = @"values";
      v52 = @"Value";
      goto LABEL_48;
    }
    v55 = [v3 className];
    int v56 = [v55 isEqualToString:@"_CFXNotificationRegistrationBase"];

    if (v56)
    {
      v57 = &__block_literal_global_372;
      goto LABEL_61;
    }
    v58 = [v3 className];
    int v59 = [v58 isEqualToString:@"_NSThreadData"];

    if (v59)
    {
      v57 = &__block_literal_global_377;
      goto LABEL_61;
    }
    v60 = [v3 className];
    int v61 = [v60 isEqualToString:@"_CFXNotificationObserverRegistration"];

    if (v61)
    {
      v57 = &__block_literal_global_382;
      goto LABEL_61;
    }
    v62 = [v3 className];
    if ([v62 isEqualToString:@"_CFXNotificationObjectRegistration"])
    {

LABEL_60:
      v57 = &__block_literal_global_393;
      goto LABEL_61;
    }
    v63 = [v3 className];
    int v64 = [v63 isEqualToString:@"_CFXNotificationObjcObserverRegistration"];

    if (v64) {
      goto LABEL_60;
    }
    v65 = [v3 className];
    int v66 = [v65 isEqualToString:@"__NSObserver"];

    if (v66)
    {
      v57 = &__block_literal_global_401;
      goto LABEL_61;
    }
    v67 = [v3 className];
    int v68 = [v67 isEqualToString:@"_NSBindingInfo"];

    if (v68)
    {
      v57 = &__block_literal_global_409;
      goto LABEL_61;
    }
    v69 = [v3 className];
    int v70 = [v69 isEqualToString:@"_NSModelObservingTracker"];

    if (v70)
    {
      v57 = &__block_literal_global_417;
      goto LABEL_61;
    }
    v71 = [v3 className];
    int v72 = [v71 isEqualToString:@"__NSOperationInternal"];

    if (v72)
    {
      v57 = &__block_literal_global_425;
      goto LABEL_61;
    }
    v73 = [v3 className];
    int v74 = [v73 isEqualToString:@"NSKeyValueObservance"];

    if (v74)
    {
      v57 = &__block_literal_global_436;
      goto LABEL_61;
    }
    v75 = [v3 className];
    int v76 = [v75 isEqualToString:@"__NSSingleObjectArrayI"];

    if (v76)
    {
      v57 = &__block_literal_global_441;
      goto LABEL_61;
    }
    v77 = [v3 className];
    int v78 = [v77 isEqualToString:@"__NSSingleObjectSetI"];

    if (v78)
    {
      v57 = &__block_literal_global_443;
      goto LABEL_61;
    }
    v79 = [v3 className];
    if ([v79 isEqualToString:@"__NSArrayM"])
    {
    }
    else
    {
      v80 = [v3 className];
      int v81 = [v80 isEqualToString:@"__NSFrozenArrayM"];

      if (!v81)
      {
        v82 = [v3 className];
        if ([v82 isEqualToString:@"__NSDictionaryM"])
        {
        }
        else
        {
          v83 = [v3 className];
          int v84 = [v83 isEqualToString:@"__NSFrozenDictionaryM"];

          if (!v84)
          {
            v85 = [v3 className];
            if ([v85 isEqualToString:@"__NSSetM"])
            {
            }
            else
            {
              v86 = [v3 className];
              int v87 = [v86 isEqualToString:@"__NSFrozenSetM"];

              if (!v87)
              {
                v88 = [v3 className];
                int v89 = [v88 isEqualToString:@"__NSArrayI"];

                if (v89)
                {
                  [v3 setDefaultScanType:2];
                  goto LABEL_42;
                }
                v90 = [v3 className];
                int v91 = [v90 isEqualToString:@"NSResponder"];

                if (v91)
                {
                  v57 = &__block_literal_global_472;
                }
                else
                {
                  v92 = [v3 className];
                  int v93 = [v92 isEqualToString:@"NSMenuItem"];

                  if (v93)
                  {
                    v57 = &__block_literal_global_480;
                  }
                  else
                  {
                    v94 = [v3 className];
                    int v95 = [v94 isEqualToString:@"NSActionCell"];

                    if (v95)
                    {
                      v57 = &__block_literal_global_494;
                    }
                    else
                    {
                      v96 = [v3 className];
                      int v97 = [v96 isEqualToString:@"NSCellAuxiliary"];

                      if (v97)
                      {
                        v57 = &__block_literal_global_502;
                      }
                      else
                      {
                        v98 = [v3 className];
                        int v99 = [v98 isEqualToString:@"NSMenu"];

                        if (v99)
                        {
                          v57 = &__block_literal_global_510;
                        }
                        else
                        {
                          v100 = [v3 className];
                          int v101 = [v100 isEqualToString:@"NSLayoutConstraint"];

                          if (v101)
                          {
                            v57 = &__block_literal_global_518;
                          }
                          else
                          {
                            v102 = [v3 className];
                            int v103 = [v102 isEqualToString:@"NSLayoutAnchor"];

                            if (v103)
                            {
                              v57 = &__block_literal_global_532;
                            }
                            else
                            {
                              v104 = [v3 className];
                              int v105 = [v104 isEqualToString:@"NSView"];

                              if (v105)
                              {
                                v57 = &__block_literal_global_540;
                              }
                              else
                              {
                                v106 = [v3 className];
                                int v107 = [v106 isEqualToString:@"_NSViewAuxiliary"];

                                if (v107)
                                {
                                  v57 = &__block_literal_global_557;
                                }
                                else
                                {
                                  v108 = [v3 className];
                                  int v109 = [v108 isEqualToString:@"NSTextInputContext"];

                                  if (v109)
                                  {
                                    v57 = &__block_literal_global_562;
                                  }
                                  else
                                  {
                                    v110 = [v3 className];
                                    int v111 = [v110 isEqualToString:@"NSWeakObjectValue"];

                                    if (v111)
                                    {
                                      v57 = &__block_literal_global_567;
                                    }
                                    else
                                    {
                                      v112 = [v3 className];
                                      int v113 = [v112 isEqualToString:@"NSAccessibilityWeakReferenceContainer"];

                                      if (!v113)
                                      {
                                        v114 = [v3 className];
                                        if ([v114 isEqualToString:@"NSInputStream"])
                                        {
                                        }
                                        else
                                        {
                                          v115 = [v3 className];
                                          int v116 = [v115 isEqualToString:@"NSOutputStream"];

                                          if (!v116)
                                          {
                                            v123 = [v3 displayName];
                                            int v124 = [v123 isEqualToString:@"__SwiftNativeNSError"];

                                            if (v124)
                                            {
                                              [v3 setInfoType:8];
                                              goto LABEL_28;
                                            }
                                            v125 = [v3 className];
                                            int v126 = [v125 isEqualToString:@"_NSKVODeallocSentinel"];

                                            if (!v126) {
                                              goto LABEL_42;
                                            }
                                            v57 = &__block_literal_global_616;
                                            goto LABEL_61;
                                          }
                                        }
                                        v130 = [v3 firstFieldWithName:@"_reserved"];
                                        if (v130)
                                        {
                                          uint64_t v117 = [v3 pointerSize];
                                          v129 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"error" type:@"^v" scan:1 offset:(3 * v117) size:v117];
                                          v128 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"client" type:@"^{_CFStreamClient=}" scan:1 offset:(4 * v117) size:v117];
                                          v127 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"info" type:@"^v" scan:1 offset:(5 * v117) size:v117];
                                          v118 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"callBacks" type:@"^{_CFStreamCallBacks=}" scan:1 offset:(6 * v117) size:v117];
                                          v119 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"streamLock" type:@"^v" scan:1 offset:(7 * v117) size:v117];
                                          v120 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"previousRunloopsAndModes" type:@"^v" scan:1 offset:(8 * v117) size:v117];
                                          v121 = [(VMUFieldInfo *)[VMUMutableFieldInfo alloc] initWithName:@"queue" type:@"^v" scan:1 offset:(9 * v117) size:v117];
                                          v153[0] = v129;
                                          v153[1] = v128;
                                          v153[2] = v127;
                                          v153[3] = v118;
                                          v153[4] = v119;
                                          v153[5] = v120;
                                          v153[6] = v121;
                                          v122 = [MEMORY[0x1E4F1C978] arrayWithObjects:v153 count:7];
                                          [v3 replaceField:v130 withFields:v122];
                                        }
                                        goto LABEL_42;
                                      }
                                      v57 = &__block_literal_global_575;
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
LABEL_61:
                [v3 mutateTypeFieldsWithBlock:v57];
                goto LABEL_42;
              }
            }
            uint64_t v143 = 0;
            uint64_t v144 = (uint64_t)&v143;
            uint64_t v145 = 0x2020000000;
            LOBYTE(v146) = 0;
            v131[0] = MEMORY[0x1E4F143A8];
            v131[1] = 3221225472;
            v131[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_21;
            v131[3] = &unk_1E5D23A98;
            id v132 = v3;
            v133 = &v143;
            [v132 mutateTypeFieldsWithBlock:v131];

LABEL_80:
            _Block_object_dispose(&v143, 8);
            goto LABEL_42;
          }
        }
        uint64_t v143 = 0;
        uint64_t v144 = (uint64_t)&v143;
        uint64_t v145 = 0x2020000000;
        LOBYTE(v146) = 0;
        v134[0] = MEMORY[0x1E4F143A8];
        v134[1] = 3221225472;
        v134[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_20;
        v134[3] = &unk_1E5D23A98;
        id v135 = v3;
        v136 = &v143;
        [v135 mutateTypeFieldsWithBlock:v134];

        goto LABEL_80;
      }
    }
    uint64_t v143 = 0;
    uint64_t v144 = (uint64_t)&v143;
    uint64_t v145 = 0x2020000000;
    LOBYTE(v146) = 0;
    v137[0] = MEMORY[0x1E4F143A8];
    v137[1] = 3221225472;
    v137[2] = __34__VMUScanOverlay_initWithScanner___block_invoke_19;
    v137[3] = &unk_1E5D23A98;
    id v138 = v3;
    v139 = &v143;
    [v138 mutateTypeFieldsWithBlock:v137];

    goto LABEL_80;
  }
LABEL_29:
}

BOOL __34__VMUScanOverlay_initWithScanner___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t (*)(void))v7[2];
  if (*(_DWORD *)(a1 + 36) != 8)
  {
    uint64_t v11 = (_DWORD *)v8();
    if (!v11) {
      goto LABEL_7;
    }
    uint64_t v10 = *v11;
    if (!*v11) {
      goto LABEL_7;
    }
LABEL_9:
    uint64_t v13 = *(unsigned int *)(a1 + 36);
    uint64_t v14 = v10 + v13;
    v15 = (uint64_t (*)(void *, uint64_t, uint64_t))v7[2];
    if (v13 == 8)
    {
      int v16 = (uint64_t *)v15(v7, v14, 8);
      if (v16)
      {
        uint64_t v17 = *v16;
LABEL_15:
        BOOL v12 = v17 == 0;
        goto LABEL_16;
      }
    }
    else
    {
      id v18 = (unsigned int *)v15(v7, v14, 4);
      if (v18)
      {
        uint64_t v17 = *v18;
        goto LABEL_15;
      }
    }
    uint64_t v17 = 0;
    goto LABEL_15;
  }
  uint64_t v9 = (uint64_t *)v8();
  if (v9)
  {
    uint64_t v10 = *v9;
    if (*v9) {
      goto LABEL_9;
    }
  }
LABEL_7:
  BOOL v12 = 0;
LABEL_16:

  return v12;
}

uint64_t __34__VMUScanOverlay_initWithScanner___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a2, 16);
  if (result) {
    return !stringHasInlineContents(result);
  }
  return result;
}

uint64_t __34__VMUScanOverlay_initWithScanner___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 16))(a4, a2, 16);
  if (result)
  {
    return stringHasInlineContents(result);
  }
  return result;
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_8(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_parent"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_9(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_target"];

  if (v3) {
    [v4 setScanType:2];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_10(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_observer"];

  if (v3) {
    [v4 setScanType:0];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_11(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_object"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_12(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"object"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_13(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_retainedController"];

  if (v3) {
    [v4 setScanType:2];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_14(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_modelObserver"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_15(uint64_t a1, void *a2)
{
  id v6 = a2;
  v2 = [v6 ivarName];
  int v3 = [v2 isEqualToString:@"__outerOp"];

  if (v3) {
    [v6 setScanType:4];
  }
  id v4 = [v6 ivarName];
  int v5 = [v4 isEqualToString:@"__completion"];

  if (v5) {
    [v6 setScanType:2];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_16(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 scanType] == 1)
  {
    v2 = [v4 ivarName];
    char v3 = [v2 isEqualToString:@"_context"];

    if ((v3 & 1) == 0) {
      [v4 setScanType:4];
    }
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_17(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_object"];

  if (v3) {
    [v4 setScanType:2];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_18(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"element"];

  if (v3) {
    [v4 setScanType:2];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_19(uint64_t a1, void *a2)
{
  id v10 = a2;
  int v3 = [v10 ivarName];
  if ([v3 isEqualToString:@"_list"])
  {
  }
  else
  {
    id v4 = [v10 ivarName];
    int v5 = [v4 isEqualToString:@"storage"];

    if (!v5) {
      goto LABEL_5;
    }
  }
  id v6 = [*(id *)(a1 + 32) displayName];
  id v7 = [v6 stringByAppendingString:@" (Storage)"];

  uint64_t v8 = [*(id *)(a1 + 32) binaryPath];
  uint64_t v9 = +[VMUClassInfo classInfoWithClassName:v7 binaryPath:v8 type:16];

  [v9 setDefaultScanType:2];
  [v10 setDestinationLayout:v9];
  [v10 setScanType:2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

LABEL_5:
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_20(uint64_t a1, void *a2)
{
  id v15 = a2;
  int v3 = [v15 ivarName];
  char v4 = [v3 isEqualToString:@"_objs"];

  if (v4)
  {
    int v5 = @" (Value Storage)";
    int v6 = 1;
  }
  else
  {
    id v7 = [v15 ivarName];
    int v6 = [v7 isEqualToString:@"_keys"];

    if (v6) {
      int v5 = @" (Key Storage)";
    }
    else {
      int v5 = 0;
    }
  }
  uint64_t v8 = [v15 ivarName];
  int v9 = [v8 isEqualToString:@"storage"];

  if ((v9 & 1) != 0 || v6)
  {
    if (v9) {
      id v10 = @" (Storage)";
    }
    else {
      id v10 = v5;
    }
    uint64_t v11 = [*(id *)(a1 + 32) displayName];
    BOOL v12 = [v11 stringByAppendingString:v10];

    uint64_t v13 = [*(id *)(a1 + 32) binaryPath];
    uint64_t v14 = +[VMUClassInfo classInfoWithClassName:v12 binaryPath:v13 type:16];

    [v14 setDefaultScanType:2];
    [v15 setDestinationLayout:v14];
    [v15 setScanType:2];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_21(uint64_t a1, void *a2)
{
  id v10 = a2;
  int v3 = [v10 ivarName];
  if ([v3 isEqualToString:@"_objs"])
  {
  }
  else
  {
    char v4 = [v10 ivarName];
    int v5 = [v4 isEqualToString:@"storage"];

    if (!v5) {
      goto LABEL_5;
    }
  }
  int v6 = [*(id *)(a1 + 32) displayName];
  id v7 = [v6 stringByAppendingString:@" (Storage)"];

  uint64_t v8 = [*(id *)(a1 + 32) binaryPath];
  int v9 = +[VMUClassInfo classInfoWithClassName:v7 binaryPath:v8 type:16];

  [v9 setDefaultScanType:2];
  [v10 setDestinationLayout:v9];
  [v10 setScanType:2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;

LABEL_5:
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_22(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_nextResponder"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_23(uint64_t a1, void *a2)
{
  id v8 = a2;
  v2 = [v8 ivarName];
  int v3 = [v2 isEqualToString:@"_repObject"];

  if (v3) {
    [v8 setScanType:2];
  }
  id v4 = [v8 ivarName];
  int v5 = [v4 isEqualToString:@"_submenu"];

  if (v5) {
    [v8 setScanType:2];
  }
  int v6 = [v8 ivarName];
  int v7 = [v6 isEqualToString:@"_menu"];

  if (v7) {
    [v8 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_24(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_controlView"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_25(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"controlView"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_26(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_supermenu"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_27(uint64_t a1, void *a2)
{
  id v8 = a2;
  v2 = [v8 ivarName];
  int v3 = [v2 isEqualToString:@"_container"];

  if (v3) {
    [v8 setScanType:4];
  }
  id v4 = [v8 ivarName];
  int v5 = [v4 isEqualToString:@"_firstItem"];

  if (v5) {
    [v8 setScanType:4];
  }
  int v6 = [v8 ivarName];
  int v7 = [v6 isEqualToString:@"_secondItem"];

  if (v7) {
    [v8 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_28(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_referenceItem"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_29(uint64_t a1, void *a2)
{
  id v10 = a2;
  v2 = [v10 ivarName];
  int v3 = [v2 isEqualToString:@"_superview"];

  if (v3) {
    [v10 setScanType:4];
  }
  id v4 = [v10 ivarName];
  int v5 = [v4 isEqualToString:@"_window"];

  if (v5) {
    [v10 setScanType:4];
  }
  int v6 = [v10 ivarName];
  int v7 = [v6 isEqualToString:@"_viewController"];

  if (v7) {
    [v10 setScanType:8];
  }
  id v8 = [v10 ivarName];
  int v9 = [v8 isEqualToString:@"_ancestorWithLayerForLastLayerGeometryUpdate"];

  if (v9) {
    [v10 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_30(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_viewController"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_31(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_client"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_32(uint64_t a1, void *a2)
{
  id v6 = a2;
  v2 = [v6 ivarName];
  int v3 = [v2 isEqualToString:@"_value"];

  if (v3) {
    [v6 setScanType:4];
  }
  id v4 = [v6 ivarName];
  int v5 = [v4 isEqualToString:@"_object"];

  if (v5) {
    [v6 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_33(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_weakReference"];

  if (v3) {
    [v4 setScanType:4];
  }
}

void __34__VMUScanOverlay_initWithScanner___block_invoke_34(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 ivarName];
  int v3 = [v2 isEqualToString:@"_observedObject"];

  if (v3) {
    [v4 setScanType:8];
  }
}

- (void)addMetadataRefinementRule:(id)a3
{
  rules = self->_rules;
  id v4 = (id)MEMORY[0x1AD0DA230](a3, a2);
  [(NSMutableArray *)rules addObject:v4];
}

- (NSArray)refinementRules
{
  return &self->_rules->super;
}

- (void).cxx_destruct
{
}

@end