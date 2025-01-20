@interface FBScene
@end

@implementation FBScene

uint64_t __63__FBScene_PRScene__pr_createPosterSceneWithRole_path_provider___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 bundleIdentifier];
  v4 = [*(id *)(a1 + 32) serverIdentity];
  v5 = [v4 provider];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

void __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F29128];
  id v7 = a2;
  v4 = [v3 UUID];
  v5 = [v4 UUIDString];
  [v7 setIdentifier:v5];

  uint64_t v6 = [MEMORY[0x1E4FB1450] specification];
  [v7 setSpecification:v6];

  [v7 setClientIdentity:*(void *)(a1 + 32)];
}

void __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke_357(uint64_t a1, void *a2)
{
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke_2;
  v12[3] = &unk_1E54DC7F8;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v15 = v4;
  uint64_t v16 = v5;
  id v6 = a2;
  [v6 updateSettingsWithBlock:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke_3;
  v9[3] = &unk_1E54DC820;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 56);
  id v10 = v7;
  uint64_t v11 = v8;
  [v6 updateClientSettingsWithBlock:v9];
}

void __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "pui_setRole:", v3);
  uint64_t v5 = [*(id *)(a1 + 40) serverIdentity];
  id v6 = [v5 provider];
  objc_msgSend(v4, "pui_setProvider:", v6);

  objc_msgSend(*(id *)(a1 + 48), "pr_applyPosterPath:toSettings:", *(void *)(a1 + 40), v4);
  uint64_t v7 = objc_msgSend(v4, "pr_posterConfiguredProperties");

  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __71__FBScene_PRScene___pr_createPosterSceneWithRole_path_processIdentity___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_msgSend(v5, "bls_setSupportsAlwaysOn:", objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x1E4F92840]));
  uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) renderingConfiguration];
  id v4 = v3;
  if (v3)
  {
    objc_msgSend(v5, "pr_setDepthEffectDisabled:", objc_msgSend(v3, "isDepthEffectDisabled"));
    objc_msgSend(v5, "pr_setParallaxEnabled:", objc_msgSend(v4, "isParallaxEnabled"));
  }
}

@end