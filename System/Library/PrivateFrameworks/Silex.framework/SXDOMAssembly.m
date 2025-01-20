@interface SXDOMAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXDOMAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D5C6E40 factory:&__block_literal_global_4];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerClass:objc_opt_class() factory:&__block_literal_global_76];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerProtocol:&unk_26D5DEB98 factory:&__block_literal_global_86];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerProtocol:&unk_26D5DEB28 factory:&__block_literal_global_93];

  v12 = [v3 publicContainer];
  id v13 = (id)[v12 registerProtocol:&unk_26D5DEBF8 factory:&__block_literal_global_97];

  v14 = [v3 publicContainer];
  id v15 = (id)[v14 registerProtocol:&unk_26D5F1270 factory:&__block_literal_global_105];

  v16 = [v3 publicContainer];
  id v17 = (id)[v16 registerClass:objc_opt_class() factory:&__block_literal_global_109];

  v18 = [v3 publicContainer];
  id v19 = (id)[v18 registerProtocol:&unk_26D5DEAC8 factory:&__block_literal_global_117];

  v20 = [v3 privateContainer];
  id v21 = (id)[v20 registerClass:objc_opt_class() factory:&__block_literal_global_120];

  v22 = [v3 privateContainer];
  id v23 = (id)[v22 registerProtocol:&unk_26D617AB0 factory:&__block_literal_global_126];

  v24 = [v3 publicContainer];
  id v25 = (id)[v24 registerProtocol:&unk_26D5EF198 factory:&__block_literal_global_130];

  v26 = [v3 callback];
  v27 = TFCallbackScopeAny();
  [v26 whenResolvingProtocol:&unk_26D5B4C78 scope:v27 callbackBlock:&__block_literal_global_160];

  v28 = [v3 privateContainer];
  v29 = [v28 registerClass:objc_opt_class() factory:&__block_literal_global_164];
  id v30 = (id)[v29 withConfiguration:&__block_literal_global_173_0];

  v31 = [v3 publicContainer];
  id v32 = (id)[v31 registerClass:objc_opt_class() factory:&__block_literal_global_188];

  v33 = [v3 privateContainer];
  id v34 = (id)[v33 registerProtocol:&unk_26D5F0598 factory:&__block_literal_global_229];

  v35 = [v3 privateContainer];
  id v36 = (id)[v35 registerProtocol:&unk_26D5A9C98 factory:&__block_literal_global_238];

  v37 = [v3 privateContainer];
  id v38 = (id)[v37 registerClass:objc_opt_class() factory:&__block_literal_global_242];

  v39 = [v3 privateContainer];
  id v40 = (id)[v39 registerClass:objc_opt_class() factory:&__block_literal_global_245_0];

  v41 = [v3 privateContainer];
  id v42 = (id)[v41 registerClass:objc_opt_class() factory:&__block_literal_global_248_0];

  v43 = [v3 privateContainer];
  id v44 = (id)[v43 registerClass:objc_opt_class() factory:&__block_literal_global_251_0];

  v45 = [v3 privateContainer];
  id v46 = (id)[v45 registerClass:objc_opt_class() factory:&__block_literal_global_254_0];

  v47 = [v3 privateContainer];
  id v48 = (id)[v47 registerClass:objc_opt_class() factory:&__block_literal_global_257];

  v49 = [v3 privateContainer];
  id v50 = (id)[v49 registerClass:objc_opt_class() factory:&__block_literal_global_261];

  v51 = [v3 privateContainer];
  id v52 = (id)[v51 registerProtocol:&unk_26D5C3358 factory:&__block_literal_global_263_0];

  v53 = [v3 privateContainer];
  id v54 = (id)[v53 registerClass:objc_opt_class() factory:&__block_literal_global_266];

  v55 = [v3 privateContainer];
  id v56 = (id)[v55 registerClass:objc_opt_class() factory:&__block_literal_global_269];

  v57 = [v3 privateContainer];
  id v58 = (id)[v57 registerClass:objc_opt_class() factory:&__block_literal_global_316];

  v59 = [v3 privateContainer];
  id v60 = (id)[v59 registerClass:objc_opt_class() factory:&__block_literal_global_318];

  v61 = [v3 privateContainer];
  id v62 = (id)[v61 registerClass:objc_opt_class() factory:&__block_literal_global_320];

  v63 = [v3 privateContainer];
  id v64 = (id)[v63 registerClass:objc_opt_class() name:@"ComponentStyle" factory:&__block_literal_global_323];

  v65 = [v3 privateContainer];
  id v66 = (id)[v65 registerClass:objc_opt_class() name:@"ComponentTextStyle" factory:&__block_literal_global_332];

  v67 = [v3 privateContainer];
  id v68 = (id)[v67 registerClass:objc_opt_class() name:@"TextStyle" factory:&__block_literal_global_338];

  v69 = [v3 privateContainer];
  id v70 = (id)[v69 registerClass:objc_opt_class() name:@"Component" factory:&__block_literal_global_344];

  v71 = [v3 privateContainer];
  id v72 = (id)[v71 registerClass:objc_opt_class() name:@"ComponentLayout" factory:&__block_literal_global_350];

  v73 = [v3 privateContainer];
  id v74 = (id)[v73 registerClass:objc_opt_class() name:@"AdvertisementAutoPlacement" factory:&__block_literal_global_356];

  v75 = [v3 privateContainer];
  id v76 = (id)[v75 registerClass:objc_opt_class() name:@"SuggestedArticlesAutoPlacement" factory:&__block_literal_global_362];

  v77 = [v3 privateContainer];
  id v78 = (id)[v77 registerClass:objc_opt_class() name:@"DocumentStyle" factory:&__block_literal_global_368];

  v79 = [v3 privateContainer];
  id v80 = (id)[v79 registerClass:objc_opt_class() name:@"Component" factory:&__block_literal_global_375];

  v81 = [v3 privateContainer];
  id v82 = (id)[v81 registerClass:objc_opt_class() name:@"TextStyle" factory:&__block_literal_global_380];

  v83 = [v3 privateContainer];
  id v84 = (id)[v83 registerClass:objc_opt_class() name:@"ComponentTextStyle" factory:&__block_literal_global_382];

  v85 = [v3 privateContainer];
  id v86 = (id)[v85 registerClass:objc_opt_class() name:@"ComponentLayout" factory:&__block_literal_global_384];

  v87 = [v3 privateContainer];
  id v88 = (id)[v87 registerClass:objc_opt_class() name:@"ComponentStyle" factory:&__block_literal_global_386];

  v89 = [v3 privateContainer];
  id v90 = (id)[v89 registerClass:objc_opt_class() name:@"AdvertisementAutoPlacement" factory:&__block_literal_global_388];

  v91 = [v3 privateContainer];
  id v92 = (id)[v91 registerClass:objc_opt_class() name:@"SuggestedArticlesAutoPlacement" factory:&__block_literal_global_390];

  v93 = [v3 privateContainer];
  id v94 = (id)[v93 registerClass:objc_opt_class() name:@"DocumentStyle" factory:&__block_literal_global_392];

  v95 = [v3 callback];
  uint64_t v96 = objc_opt_class();
  v97 = TFCallbackScopeAny();
  [v95 whenResolvingClass:v96 scope:v97 callbackBlock:&__block_literal_global_396];

  v98 = [v3 publicContainer];
  id v99 = (id)[v98 registerProtocol:&unk_26D618F70 factory:&__block_literal_global_418];

  v100 = [v3 privateContainer];
  id v101 = (id)[v100 registerClass:objc_opt_class() factory:&__block_literal_global_421];

  v102 = [v3 publicContainer];
  id v103 = (id)[v102 registerProtocol:&unk_26D5B29A0 factory:&__block_literal_global_424];

  v104 = [v3 privateContainer];
  id v105 = (id)[v104 registerProtocol:&unk_26D5CF668 factory:&__block_literal_global_427];

  v106 = [v3 privateContainer];
  id v107 = (id)[v106 registerClass:objc_opt_class() factory:&__block_literal_global_431];

  v108 = [v3 privateContainer];
  id v109 = (id)[v108 registerClass:objc_opt_class() factory:&__block_literal_global_434];

  v110 = [v3 privateContainer];
  id v111 = (id)[v110 registerClass:objc_opt_class() factory:&__block_literal_global_437];

  v112 = [v3 privateContainer];
  id v113 = (id)[v112 registerClass:objc_opt_class() factory:&__block_literal_global_440];

  v114 = [v3 privateContainer];
  id v115 = (id)[v114 registerClass:objc_opt_class() factory:&__block_literal_global_443];

  v116 = [v3 privateContainer];
  id v117 = (id)[v116 registerClass:objc_opt_class() factory:&__block_literal_global_446];

  v118 = [v3 privateContainer];
  id v119 = (id)[v118 registerClass:objc_opt_class() factory:&__block_literal_global_449];

  v120 = [v3 privateContainer];
  id v121 = (id)[v120 registerClass:objc_opt_class() factory:&__block_literal_global_452];

  v122 = [v3 privateContainer];
  id v123 = (id)[v122 registerClass:objc_opt_class() factory:&__block_literal_global_455];

  v124 = [v3 privateContainer];
  id v125 = (id)[v124 registerClass:objc_opt_class() factory:&__block_literal_global_458];

  v126 = [v3 privateContainer];
  id v127 = (id)[v126 registerClass:objc_opt_class() factory:&__block_literal_global_461];

  v128 = [v3 privateContainer];
  id v129 = (id)[v128 registerClass:objc_opt_class() factory:&__block_literal_global_464];

  v130 = [v3 privateContainer];
  id v131 = (id)[v130 registerClass:objc_opt_class() factory:&__block_literal_global_467];

  v132 = [v3 privateContainer];
  id v133 = (id)[v132 registerClass:objc_opt_class() factory:&__block_literal_global_469];

  v134 = [v3 privateContainer];
  id v135 = (id)[v134 registerClass:objc_opt_class() factory:&__block_literal_global_471];

  v136 = [v3 privateContainer];
  id v137 = (id)[v136 registerClass:objc_opt_class() factory:&__block_literal_global_473];

  v138 = [v3 privateContainer];
  id v139 = (id)[v138 registerClass:objc_opt_class() factory:&__block_literal_global_476];

  v140 = [v3 publicContainer];
  id v141 = (id)[v140 registerClass:objc_opt_class() factory:&__block_literal_global_478];

  v142 = [v3 privateContainer];
  v143 = [v142 registerProtocol:&unk_26D605EE8 factory:&__block_literal_global_480];
  id v144 = (id)[v143 withConfiguration:&__block_literal_global_484];

  v145 = [v3 publicContainer];
  id v146 = (id)[v145 registerProtocol:&unk_26D5E9F88 factory:&__block_literal_global_489];

  v147 = [v3 privateContainer];
  id v148 = (id)[v147 registerClass:objc_opt_class() factory:&__block_literal_global_492];

  v149 = [v3 privateContainer];
  id v150 = (id)[v149 registerProtocol:&unk_26D632B20 factory:&__block_literal_global_494];

  v151 = [v3 privateContainer];
  id v152 = (id)[v151 registerClass:objc_opt_class() factory:&__block_literal_global_497];

  id v154 = [v3 privateContainer];

  id v153 = (id)[v154 registerClass:objc_opt_class() factory:&__block_literal_global_499];
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 resolveProtocol:&unk_26D5EF198];
  id v3 = [v2 createDOMObjectProvider];

  return v3;
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

SXDocumentProvider *__32__SXDOMAssembly_loadInRegistry___block_invoke_7()
{
  v0 = objc_alloc_init(SXDocumentProvider);
  return v0;
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

SXDocumentMetadataProvider *__32__SXDOMAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDocumentMetadataProvider alloc];
  v4 = [v2 resolveProtocol:&unk_26D5F1270];

  id v5 = [(SXDocumentMetadataProvider *)v3 initWithDocumentProvider:v4];
  return v5;
}

SXDOMFactory *__32__SXDOMAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDOMFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5F1270];

  id v5 = [(SXDOMFactory *)v3 initWithDocumentProvider:v4];
  return v5;
}

SXDOMObjectProviderFactory *__32__SXDOMAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDOMObjectProviderFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D620A88];
  id v5 = [v2 resolveClass:objc_opt_class() name:@"ComponentStyle"];
  v6 = [v2 resolveClass:objc_opt_class() name:@"ComponentTextStyle"];

  id v7 = [(SXDOMObjectProviderFactory *)v3 initWithDocumentControllerProvider:v4 componentStyleMerger:v5 componentTextStyleMerger:v6];
  return v7;
}

void __32__SXDOMAssembly_loadInRegistry___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addProcessor:v6 type:0];
}

SXDOMModifierManager *__32__SXDOMAssembly_loadInRegistry___block_invoke_13(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDOMModifierManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D617AB0];
  id v5 = [v2 resolveProtocol:&unk_26D5A9C98];
  id v6 = [v2 resolveProtocol:&unk_26D5C3358];

  id v7 = [(SXDOMModifierManager *)v3 initWithDOMFactory:v4 contextFactory:v5 cacheKeyFactory:v6];
  return v7;
}

void __32__SXDOMAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 resolveClass:objc_opt_class()];
  [v4 addModifier:v6];

  id v7 = [v5 resolveClass:objc_opt_class()];
  [v4 addModifier:v7];

  v8 = [v5 resolveClass:objc_opt_class()];
  [v4 addModifier:v8];

  id v9 = [v5 resolveClass:objc_opt_class()];
  [v4 addModifier:v9];

  v10 = [v5 resolveClass:objc_opt_class()];
  [v4 addModifier:v10];

  id v11 = [v5 resolveClass:objc_opt_class()];
  [v4 addModifier:v11];

  v12 = [v5 resolveClass:objc_opt_class()];
  [v4 addModifier:v12];

  id v13 = [v5 resolveClass:objc_opt_class()];
  [v4 addModifier:v13];

  v14 = [v5 resolveClass:objc_opt_class()];
  [v4 addModifier:v14];

  id v15 = [v5 resolveClass:objc_opt_class()];
  [v4 addModifier:v15];

  v16 = [v5 resolveClass:objc_opt_class()];
  [v4 addModifier:v16];

  id v17 = [v5 resolveClass:objc_opt_class()];

  [v4 addModifier:v17];
}

SXDOMConditionResolverModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDOMConditionResolverModifier alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5CF668];
  id v5 = [v2 resolveClass:objc_opt_class() name:@"Component"];
  id v6 = [v2 resolveClass:objc_opt_class() name:@"TextStyle"];
  id v7 = [v2 resolveClass:objc_opt_class() name:@"ComponentStyle"];
  id v15 = [v2 resolveClass:objc_opt_class() name:@"ComponentLayout"];
  v14 = [v2 resolveClass:objc_opt_class() name:@"ComponentTextStyle"];
  v8 = [v2 resolveClass:objc_opt_class() name:@"AdvertisementAutoPlacement"];
  id v9 = [v2 resolveClass:objc_opt_class() name:@"SuggestedArticlesAutoPlacement"];
  v10 = [v2 resolveClass:objc_opt_class() name:@"DocumentStyle"];
  id v11 = [v2 resolveProtocol:&unk_26D5F0598];

  id v13 = [(SXDOMConditionResolverModifier *)v3 initWithValidationContextFactory:v4 componentResolver:v5 textStyleResolver:v6 componentStyleResolver:v7 componentLayoutResolver:v15 componentTextStyleResolver:v14 advertisementAutoPlacementResolver:v8 suggestedArticlesAutoPlacementResolver:v9 documentStyleResolver:v10 instructions:v11];
  return v13;
}

SXConditionalResolverModifierInstructions *__32__SXDOMAssembly_loadInRegistry___block_invoke_16(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXConditionalResolverModifierInstructions alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5F1270];
  id v5 = [v2 resolveProtocol:&unk_26D61F8A8];

  id v6 = [(SXConditionalResolverModifierInstructions *)v3 initWithDocumentProvider:v4 hintsConfigurationOptionProvider:v5];
  return v6;
}

SXDOMModificationContextFactory *__32__SXDOMAssembly_loadInRegistry___block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDOMModificationContextFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5F1270];

  id v5 = [(SXDOMModificationContextFactory *)v3 initWithDocumentProvider:v4];
  return v5;
}

SXContentDisplayContainerModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_18()
{
  v0 = objc_alloc_init(SXContentDisplayContainerModifier);
  return v0;
}

SXHiddenComponentRemovalModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_19()
{
  v0 = objc_alloc_init(SXHiddenComponentRemovalModifier);
  return v0;
}

SXAdComponentRemovalModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_20()
{
  v0 = objc_alloc_init(SXAdComponentRemovalModifier);
  return v0;
}

SXComponentLayoutParentWidthModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_21()
{
  v0 = objc_alloc_init(SXComponentLayoutParentWidthModifier);
  return v0;
}

SXDefaultComponentTextStyleModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_22()
{
  v0 = objc_alloc_init(SXDefaultComponentTextStyleModifier);
  return v0;
}

SXDefaultButtonComponentTextStyleModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_23()
{
  v0 = objc_alloc_init(SXDefaultButtonComponentTextStyleModifier);
  return v0;
}

SXColumnVisualizerModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_24()
{
  v0 = objc_alloc_init(SXColumnVisualizerModifier);
  return v0;
}

SXDOMCacheKeyFactory *__32__SXDOMAssembly_loadInRegistry___block_invoke_25(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDOMCacheKeyFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5F1270];
  id v5 = [v2 resolveProtocol:&unk_26D61F8A8];

  id v6 = [(SXDOMCacheKeyFactory *)v3 initWithDocumentProvider:v4 hintsConfigurationOptionProvider:v5];
  return v6;
}

SXLineBalancingComponentTextStyleModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_26(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLineBalancingComponentTextStyleModifier alloc];
  id v4 = [v2 resolveClass:objc_opt_class()];

  id v5 = [(SXLineBalancingComponentTextStyleModifier *)v3 initWithSettings:v4];
  return v5;
}

SXDarkModeModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_27(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDarkModeModifier alloc];
  id v4 = [v2 resolveProtocol:&unk_26D605EE8];
  id v5 = [v2 resolveProtocol:&unk_26D5E9F88];
  id v6 = [v2 resolveProtocol:&unk_26D632B20];

  id v7 = [(SXDarkModeModifier *)v3 initWithPolicyHandler:v4 configuration:v5 namespacedObjectFactory:v6];
  return v7;
}

SXDOMAnalyzerModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_28()
{
  v0 = objc_alloc_init(SXDOMAnalyzerModifier);
  return v0;
}

SXGradientFillToBackgroundColorModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_29()
{
  v0 = objc_alloc_init(SXGradientFillToBackgroundColorModifier);
  return v0;
}

SXAccessibilityHyphenationModifier *__32__SXDOMAssembly_loadInRegistry___block_invoke_30()
{
  v0 = objc_alloc_init(SXAccessibilityHyphenationModifier);
  return v0;
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_31()
{
  v0 = [[SXJSONObjectMerger alloc] initWithObjectClass:objc_opt_class() exclusionKeys:&unk_26D593E60];
  return v0;
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_32()
{
  v0 = [[SXJSONObjectMerger alloc] initWithObjectClass:objc_opt_class() exclusionKeys:&unk_26D593E78];
  return v0;
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_33()
{
  v0 = [[SXJSONObjectMerger alloc] initWithObjectClass:objc_opt_class() exclusionKeys:&unk_26D593E90];
  return v0;
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_34(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXJSONObjectMerger alloc];
  id v4 = [v2 resolveClass:objc_opt_class()];

  id v5 = [(SXJSONObjectMerger *)v3 initWithClassProvider:v4 exclusionKeys:&unk_26D593EA8];
  return v5;
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_35()
{
  v0 = [[SXJSONObjectMerger alloc] initWithObjectClass:objc_opt_class() exclusionKeys:&unk_26D593EC0];
  return v0;
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_36()
{
  v0 = [[SXJSONObjectMerger alloc] initWithObjectClass:objc_opt_class() exclusionKeys:&unk_26D593ED8];
  return v0;
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_37()
{
  v0 = [[SXJSONObjectMerger alloc] initWithObjectClass:objc_opt_class() exclusionKeys:&unk_26D593EF0];
  return v0;
}

SXJSONObjectMerger *__32__SXDOMAssembly_loadInRegistry___block_invoke_38()
{
  v0 = [[SXJSONObjectMerger alloc] initWithObjectClass:objc_opt_class() exclusionKeys:&unk_26D593F08];
  return v0;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_39(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXConditionalObjectResolver alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B29A0];
  id v5 = [v2 resolveClass:objc_opt_class() name:@"Component"];

  id v6 = [(SXConditionalObjectResolver *)v3 initWithConditionValidator:v4 objectMerger:v5];
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_40(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXConditionalObjectResolver alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B29A0];
  id v5 = [v2 resolveClass:objc_opt_class() name:@"TextStyle"];

  id v6 = [(SXConditionalObjectResolver *)v3 initWithConditionValidator:v4 objectMerger:v5];
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_41(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXConditionalObjectResolver alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B29A0];
  id v5 = [v2 resolveClass:objc_opt_class() name:@"ComponentTextStyle"];

  id v6 = [(SXConditionalObjectResolver *)v3 initWithConditionValidator:v4 objectMerger:v5];
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_42(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXConditionalObjectResolver alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B29A0];
  id v5 = [v2 resolveClass:objc_opt_class() name:@"ComponentLayout"];

  id v6 = [(SXConditionalObjectResolver *)v3 initWithConditionValidator:v4 objectMerger:v5];
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_43(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXConditionalObjectResolver alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B29A0];
  id v5 = [v2 resolveClass:objc_opt_class() name:@"ComponentStyle"];

  id v6 = [(SXConditionalObjectResolver *)v3 initWithConditionValidator:v4 objectMerger:v5];
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_44(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXConditionalObjectResolver alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B29A0];
  id v5 = [v2 resolveClass:objc_opt_class() name:@"AdvertisementAutoPlacement"];

  id v6 = [(SXConditionalObjectResolver *)v3 initWithConditionValidator:v4 objectMerger:v5];
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_45(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXConditionalObjectResolver alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B29A0];
  id v5 = [v2 resolveClass:objc_opt_class() name:@"SuggestedArticlesAutoPlacement"];

  id v6 = [(SXConditionalObjectResolver *)v3 initWithConditionValidator:v4 objectMerger:v5];
  return v6;
}

SXConditionalObjectResolver *__32__SXDOMAssembly_loadInRegistry___block_invoke_46(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXConditionalObjectResolver alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B29A0];
  id v5 = [v2 resolveClass:objc_opt_class() name:@"DocumentStyle"];

  id v6 = [(SXConditionalObjectResolver *)v3 initWithConditionValidator:v4 objectMerger:v5];
  return v6;
}

void __32__SXDOMAssembly_loadInRegistry___block_invoke_47(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v6];

  id v7 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v7];

  v8 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v8];

  id v9 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v9];

  v10 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v10];

  id v11 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v11];

  v12 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v12];

  id v13 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v13];

  v14 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v14];

  id v15 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v15];

  v16 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v16];

  id v17 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v17];

  v18 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v18];

  id v19 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v19];

  v20 = [v4 resolveClass:objc_opt_class()];
  [v5 addConditionValidator:v20];

  id v21 = [v4 resolveClass:objc_opt_class()];

  [v5 addConditionValidator:v21];
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_48(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

SXConditionValidatorManager *__32__SXDOMAssembly_loadInRegistry___block_invoke_49()
{
  v0 = objc_alloc_init(SXConditionValidatorManager);
  return v0;
}

id __32__SXDOMAssembly_loadInRegistry___block_invoke_50(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

SXConditionValidationContextFactory *__32__SXDOMAssembly_loadInRegistry___block_invoke_51()
{
  v0 = objc_alloc_init(SXConditionValidationContextFactory);
  return v0;
}

SXPlatformConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_52()
{
  v0 = [[SXPlatformConditionValidator alloc] initWithPlatform:@"ios"];
  return v0;
}

SXSpecVersionConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_53()
{
  v0 = [[SXSpecVersionConditionValidator alloc] initWithSpecVersion:@"1.28"];
  return v0;
}

SXViewportConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_54()
{
  v0 = objc_alloc_init(SXViewportConditionValidator);
  return v0;
}

SXSizeClassConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_55()
{
  v0 = objc_alloc_init(SXSizeClassConditionValidator);
  return v0;
}

SXColumnConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_56()
{
  v0 = objc_alloc_init(SXColumnConditionValidator);
  return v0;
}

SXContentSizeCategoryValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_57()
{
  v0 = objc_alloc_init(SXContentSizeCategoryValidator);
  return v0;
}

SXSubscriptionStatusConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_58()
{
  v0 = objc_alloc_init(SXSubscriptionStatusConditionValidator);
  return v0;
}

SXSubscriptionActivationEligibilityConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_59()
{
  v0 = objc_alloc_init(SXSubscriptionActivationEligibilityConditionValidator);
  return v0;
}

SXOfferUpsellScenarioConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_60()
{
  v0 = objc_alloc_init(SXOfferUpsellScenarioConditionValidator);
  return v0;
}

SXTestingConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_61()
{
  v0 = objc_alloc_init(SXTestingConditionValidator);
  return v0;
}

SXViewLocationConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_62()
{
  v0 = objc_alloc_init(SXViewLocationConditionValidator);
  return v0;
}

SXForwardCompatibleConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_63()
{
  v0 = objc_alloc_init(SXForwardCompatibleConditionValidator);
  return v0;
}

SXPreferredColorSchemeConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_64()
{
  v0 = objc_alloc_init(SXPreferredColorSchemeConditionValidator);
  return v0;
}

SXNewsletterConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_65()
{
  v0 = objc_alloc_init(SXNewsletterConditionValidator);
  return v0;
}

SXConfiguredConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_66()
{
  v0 = objc_alloc_init(SXConfiguredConditionValidator);
  return v0;
}

SXAppConditionValidator *__32__SXDOMAssembly_loadInRegistry___block_invoke_67()
{
  v0 = objc_alloc_init(SXAppConditionValidator);
  return v0;
}

SXComponentMergerClassProvider *__32__SXDOMAssembly_loadInRegistry___block_invoke_68()
{
  v0 = objc_alloc_init(SXComponentMergerClassProvider);
  return v0;
}

SXLineBalancingSettings *__32__SXDOMAssembly_loadInRegistry___block_invoke_69()
{
  v0 = [[SXLineBalancingSettings alloc] initWithLineBalancingEnabled:0];
  return v0;
}

SXDarkModePolicyHandler *__32__SXDOMAssembly_loadInRegistry___block_invoke_70(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDarkModePolicyHandler alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5F1270];
  id v5 = [v2 resolveProtocol:&unk_26D5E9F88];

  id v6 = [(SXDarkModePolicyHandler *)v3 initWithDocumentProvider:v4 darkModeConfiguration:v5];
  return v6;
}

void __32__SXDOMAssembly_loadInRegistry___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v5 resolveClass:objc_opt_class()];
  [v4 addPolicyException:v6];

  id v7 = [v5 resolveClass:objc_opt_class()];
  [v4 addPolicyException:v7];

  id v8 = [v5 resolveClass:objc_opt_class()];

  [v4 addPolicyException:v8];
}

SXDarkModeConfiguration *__32__SXDOMAssembly_loadInRegistry___block_invoke_72()
{
  v0 = [[SXDarkModeConfiguration alloc] initWithAutoDarkModeEnabled:0 inversionBehavior:2 saturationThreshold:0 colors:1.0];
  return v0;
}

SXFullscreenCaptionDarkModePolicyException *__32__SXDOMAssembly_loadInRegistry___block_invoke_73()
{
  v0 = objc_alloc_init(SXFullscreenCaptionDarkModePolicyException);
  return v0;
}

SXNamespacedObjectFactory *__32__SXDOMAssembly_loadInRegistry___block_invoke_74()
{
  v0 = objc_alloc_init(SXNamespacedObjectFactory);
  return v0;
}

SXTextContrastDarkModePolicyException *__32__SXDOMAssembly_loadInRegistry___block_invoke_75(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXTextContrastDarkModePolicyException alloc];
  id v4 = [v2 resolveClass:objc_opt_class() name:@"ComponentStyle"];
  id v5 = [v2 resolveClass:objc_opt_class() name:@"ComponentTextStyle"];

  id v6 = [(SXTextContrastDarkModePolicyException *)v3 initWithComponentStyleMerger:v4 componentTextStyleMerger:v5];
  return v6;
}

SXGradientFillDarkModePolicyException *__32__SXDOMAssembly_loadInRegistry___block_invoke_76()
{
  v0 = objc_alloc_init(SXGradientFillDarkModePolicyException);
  return v0;
}

@end