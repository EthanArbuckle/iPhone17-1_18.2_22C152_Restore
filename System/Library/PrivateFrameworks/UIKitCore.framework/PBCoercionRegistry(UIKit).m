@interface PBCoercionRegistry(UIKit)
- (void)uikit_registerExtraCoercions;
@end

@implementation PBCoercionRegistry(UIKit)

- (void)uikit_registerExtraCoercions
{
  [a1 registerCoercionFromObjectOfClass:objc_opt_class() toRepresentationOfType:@"com.apple.uikit.image" coercionBlock:&__block_literal_global_271_0];
  uint64_t v2 = objc_opt_class();
  v3 = (void *)*MEMORY[0x1E4F44460];
  v4 = [(id)*MEMORY[0x1E4F44460] identifier];
  [a1 registerCoercionFromObjectOfClass:v2 toRepresentationOfType:v4 coercionBlock:&__block_literal_global_274_1];

  uint64_t v5 = objc_opt_class();
  v6 = (void *)*MEMORY[0x1E4F44410];
  v7 = [(id)*MEMORY[0x1E4F44410] identifier];
  [a1 registerCoercionFromObjectOfClass:v5 toRepresentationOfType:v7 coercionBlock:&__block_literal_global_276];

  [a1 registerCoercionFromRepresentationConformingToType:@"com.apple.uikit.image" toObjectOfClass:objc_opt_class() coercionBlock:&__block_literal_global_279_0];
  v8 = [v3 identifier];
  uint64_t v9 = objc_opt_class();
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_6;
  v74[3] = &unk_1E52FFEB0;
  id v75 = &__block_literal_global_282_4;
  [a1 registerCoercionFromRepresentationConformingToType:v8 toObjectOfClass:v9 coercionBlock:v74];

  v10 = [v6 identifier];
  uint64_t v11 = objc_opt_class();
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_7;
  v72[3] = &unk_1E52FFEB0;
  id v73 = &__block_literal_global_282_4;
  [a1 registerCoercionFromRepresentationConformingToType:v10 toObjectOfClass:v11 coercionBlock:v72];

  v12 = [(id)*MEMORY[0x1E4F444E0] identifier];
  uint64_t v13 = objc_opt_class();
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_8;
  v70[3] = &unk_1E52FFEB0;
  id v71 = &__block_literal_global_282_4;
  [a1 registerCoercionFromRepresentationConformingToType:v12 toObjectOfClass:v13 coercionBlock:v70];

  v14 = [(id)*MEMORY[0x1E4F443D0] identifier];
  uint64_t v15 = objc_opt_class();
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_9;
  v68[3] = &unk_1E52FFEB0;
  id v69 = &__block_literal_global_282_4;
  [a1 registerCoercionFromRepresentationConformingToType:v14 toObjectOfClass:v15 coercionBlock:v68];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_14;
  aBlock[3] = &unk_1E52FFFB8;
  id v66 = &__block_literal_global_292_0;
  id v67 = &__block_literal_global_288_1;
  v60 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  [a1 registerCoercionFromObjectOfClass:objc_opt_class() toRepresentationOfType:@"com.apple.uikit.attributedstring" coercionBlock:&__block_literal_global_298];
  uint64_t v16 = objc_opt_class();
  v17 = (void *)*MEMORY[0x1E4F444A8];
  v18 = [(id)*MEMORY[0x1E4F444A8] identifier];
  v61 = *(void **)off_1E52D2208;
  v19 = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_10((uint64_t)v18, *(void **)off_1E52D2208);
  [a1 registerCoercionFromObjectOfClass:v16 toRepresentationOfType:v18 coercionBlock:v19];

  uint64_t v20 = objc_opt_class();
  v21 = (void *)*MEMORY[0x1E4F44470];
  v22 = [(id)*MEMORY[0x1E4F44470] identifier];
  v23 = *(void **)off_1E52D21C0;
  v62 = *(void **)off_1E52D21C0;
  v24 = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_10((uint64_t)v22, *(void **)off_1E52D21C0);
  [a1 registerCoercionFromObjectOfClass:v20 toRepresentationOfType:v22 coercionBlock:v24];

  uint64_t v25 = objc_opt_class();
  [a1 registerCoercionFromObjectOfClass:v25 toObjectOfClass:objc_opt_class() coercionBlock:&__block_literal_global_302_0];
  [a1 registerCoercionFromRepresentationConformingToType:@"com.apple.uikit.attributedstring" toObjectOfClass:objc_opt_class() coercionBlock:&__block_literal_global_304];
  v26 = [v17 identifier];
  uint64_t v27 = objc_opt_class();
  v28 = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_12(v27, v61);
  [a1 registerCoercionFromRepresentationConformingToType:v26 toObjectOfClass:v27 coercionBlock:v28];

  v29 = (void *)*MEMORY[0x1E4F444A0];
  v59 = (void *)*MEMORY[0x1E4F444A0];
  v30 = [(id)*MEMORY[0x1E4F444A0] identifier];
  uint64_t v31 = objc_opt_class();
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_20;
  v63[3] = &unk_1E52FFEB0;
  id v64 = &__block_literal_global_292_0;
  [a1 registerCoercionFromRepresentationConformingToType:v30 toObjectOfClass:v31 coercionBlock:v63];

  v32 = [v21 identifier];
  uint64_t v33 = objc_opt_class();
  v34 = __57__PBCoercionRegistry_UIKit__uikit_registerExtraCoercions__block_invoke_12(v33, v23);
  [a1 registerCoercionFromRepresentationConformingToType:v32 toObjectOfClass:v33 coercionBlock:v34];

  [a1 registerCoercionFromObjectOfClass:objc_opt_class() toRepresentationOfType:@"com.apple.uikit.color" coercionBlock:&__block_literal_global_309_0];
  [a1 registerCoercionFromRepresentationConformingToType:@"com.apple.uikit.color" toObjectOfClass:objc_opt_class() coercionBlock:&__block_literal_global_311_0];
  v35 = (void *)*MEMORY[0x1E4F44538];
  v36 = [(id)*MEMORY[0x1E4F44538] identifier];
  v37 = (void *)*MEMORY[0x1E4F443C0];
  v38 = [(id)*MEMORY[0x1E4F443C0] identifier];
  v39 = v60[2](v60, *(void *)off_1E52D2448, v61);
  [a1 registerCoercionFromRepresentationConformingToType:v36 toRepresentationOfType:v38 coercionBlock:v39];

  v40 = [v35 identifier];
  v41 = [v29 identifier];
  v42 = *(void **)off_1E52D2210;
  v43 = v60[2](v60, *(void *)off_1E52D2448, *(void **)off_1E52D2210);
  [a1 registerCoercionFromRepresentationConformingToType:v40 toRepresentationOfType:v41 coercionBlock:v43];

  v44 = [v35 identifier];
  v45 = (void *)*MEMORY[0x1E4F44510];
  v46 = [(id)*MEMORY[0x1E4F44510] identifier];
  v47 = v60[2](v60, *(void *)off_1E52D2448, v62);
  [a1 registerCoercionFromRepresentationConformingToType:v44 toRepresentationOfType:v46 coercionBlock:v47];

  v48 = (void *)*MEMORY[0x1E4F443F0];
  v49 = [(id)*MEMORY[0x1E4F443F0] identifier];
  v50 = [v37 identifier];
  uint64_t v51 = *(void *)off_1E52D2078;
  v52 = v60[2](v60, *(void *)off_1E52D2078, v61);
  [a1 registerCoercionFromRepresentationConformingToType:v49 toRepresentationOfType:v50 coercionBlock:v52];

  v53 = [v48 identifier];
  v54 = [v59 identifier];
  v55 = v60[2](v60, v51, v42);
  [a1 registerCoercionFromRepresentationConformingToType:v53 toRepresentationOfType:v54 coercionBlock:v55];

  v56 = [v48 identifier];
  v57 = [v45 identifier];
  v58 = v60[2](v60, v51, v62);
  [a1 registerCoercionFromRepresentationConformingToType:v56 toRepresentationOfType:v57 coercionBlock:v58];
}

@end