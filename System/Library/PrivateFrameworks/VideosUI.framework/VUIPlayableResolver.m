@interface VUIPlayableResolver
+ (id)appContext;
+ (void)playableForAdamID:(id)a3 completion:(id)a4;
+ (void)playableForCanonicalID:(id)a3 showID:(id)a4 mediaType:(id)a5 completion:(id)a6;
@end

@implementation VUIPlayableResolver

+ (id)appContext
{
  v2 = +[VUITVAppLauncher sharedInstance];
  v3 = [v2 appController];
  v4 = [v3 appContext];

  return v4;
}

+ (void)playableForAdamID:(id)a3 completion:(id)a4
{
  v27[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 appContext];

  if (v8)
  {
    v9 = [a1 appContext];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_2;
    v20[3] = &unk_1E6DF5FE0;
    id v21 = v6;
    id v22 = v7;
    id v10 = v7;
    [v9 evaluate:v20];

    id v11 = v21;
  }
  else
  {
    v26[0] = @"title";
    v12 = +[VUILocalizationManager sharedInstance];
    v13 = [v12 localizedStringForKey:@"TV.GroupActivities.UnknownErrorTitle"];
    v27[0] = v13;
    v26[1] = @"message";
    v14 = +[VUILocalizationManager sharedInstance];
    v15 = [v14 localizedStringForKey:@"TV.GroupActivities.UnknownErrorMessage"];
    v27[1] = v15;
    v26[2] = @"primaryActionTitle";
    v16 = +[VUILocalizationManager sharedInstance];
    v17 = [v16 localizedStringForKey:@"TV.GroupActivities.UnknownErrorAction"];
    v27[2] = v17;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];

    v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VUIPlayableResolverErrorDomain" code:0 userInfo:v10];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke;
    block[3] = &unk_1E6DF41E8;
    id v24 = v18;
    id v25 = v7;
    id v19 = v7;
    id v11 = v18;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v3 = [a2 objectForKeyedSubscript:@"VideoURLRouterInterface"];
  v15[0] = *(void *)(a1 + 32);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_3;
  aBlock[3] = &unk_1E6DF5FB8;
  id v14 = *(id *)(a1 + 40);
  v4 = _Block_copy(aBlock);
  v15[1] = v4;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_5;
  id v11 = &unk_1E6DF5FB8;
  id v12 = *(id *)(a1 + 40);
  v5 = _Block_copy(&v8);
  v15[2] = v5;
  id v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 3, v8, v9, v10, v11);
  id v7 = (id)[v3 invokeMethod:@"getPlayableForAdamID" withArguments:v6];
}

void __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[VUIVideosPlayable alloc] initWithDictionary:v3 andMetadataDictionary:0];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_4;
  v7[3] = &unk_1E6DF41E8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VUIPlayableResolverErrorDomain" code:1 userInfo:a2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_6;
  v6[3] = &unk_1E6DF41E8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __52__VUIPlayableResolver_playableForAdamID_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

+ (void)playableForCanonicalID:(id)a3 showID:(id)a4 mediaType:(id)a5 completion:(id)a6
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [a1 appContext];

  if (v14)
  {
    if (v11)
    {
      id v15 = v11;
    }
    else
    {
      id v15 = [MEMORY[0x1E4F1CA98] null];
    }
    v26 = v15;
    v27 = [a1 appContext];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_2;
    v29[3] = &unk_1E6DF6008;
    id v30 = v10;
    id v31 = v26;
    id v32 = v12;
    id v33 = v13;
    id v25 = v13;
    id v22 = v26;
    [v27 evaluate:v29];

    id v24 = v30;
  }
  else
  {
    v37[0] = @"title";
    v16 = +[VUILocalizationManager sharedInstance];
    [v16 localizedStringForKey:@"TV.GroupActivities.UnknownErrorTitle"];
    v17 = id v28 = v10;
    v38[0] = v17;
    v37[1] = @"message";
    v18 = +[VUILocalizationManager sharedInstance];
    id v19 = [v18 localizedStringForKey:@"TV.GroupActivities.UnknownErrorMessage"];
    v38[1] = v19;
    v37[2] = @"primaryActionTitle";
    v20 = +[VUILocalizationManager sharedInstance];
    id v21 = [v20 localizedStringForKey:@"TV.GroupActivities.UnknownErrorAction"];
    v38[2] = v21;
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];

    id v10 = v28;
    v23 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VUIPlayableResolverErrorDomain" code:0 userInfo:v22];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke;
    block[3] = &unk_1E6DF41E8;
    id v35 = v23;
    id v36 = v13;
    id v24 = v13;
    id v25 = v23;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 objectForKeyedSubscript:@"VideoURLRouterInterface"];
  long long v15 = *(_OWORD *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 48);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_3;
  aBlock[3] = &unk_1E6DF5FB8;
  id v14 = *(id *)(a1 + 56);
  id v4 = _Block_copy(aBlock);
  v17 = v4;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_5;
  id v11 = &unk_1E6DF5FB8;
  id v12 = *(id *)(a1 + 56);
  id v5 = _Block_copy(&v8);
  v18 = v5;
  id v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v15, 5, v8, v9, v10, v11);
  id v7 = (id)[v3 invokeMethod:@"getPlayableForCanonicalID" withArguments:v6];
}

void __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[VUIVideosPlayable alloc] initWithDictionary:v3 andMetadataDictionary:0];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_4;
  v7[3] = &unk_1E6DF41E8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v8 = v4;
  id v9 = v5;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VUIPlayableResolverErrorDomain" code:1 userInfo:a2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_6;
  v6[3] = &unk_1E6DF41E8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __74__VUIPlayableResolver_playableForCanonicalID_showID_mediaType_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

@end