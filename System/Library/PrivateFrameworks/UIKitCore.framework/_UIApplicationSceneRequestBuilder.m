@interface _UIApplicationSceneRequestBuilder
- (Class)_requestOptionsClass;
- (id)_optionsWithInitialClientSettings:(id)a3 activationOptions:(id)a4 targetSession:(id)a5 optionsClass:(Class)a6 outError:(id *)a7;
- (id)_specification;
- (void)buildWorkspaceRequestOptionsForRequest:(id)a3 withContinuation:(id)a4;
@end

@implementation _UIApplicationSceneRequestBuilder

- (void)buildWorkspaceRequestOptionsForRequest:(id)a3 withContinuation:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  if (self)
  {
    id v8 = v6;
    v9 = [(_UIApplicationSceneRequestBuilder *)self _specification];
    v10 = objc_msgSend((id)objc_msgSend(v9, "clientSettingsClass"), "settings");
    v11 = (void *)[v10 mutableCopy];

    [(_UIApplicationSceneRequestBuilder *)self _customizeInitialClientSettings:v11 usingRequest:v8];
    v12 = (void *)[v11 copy];
  }
  else
  {
    v12 = 0;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v13 = [v6 options];
  v14 = [v6 session];
  id v22 = 0;
  v15 = [(_UIApplicationSceneRequestBuilder *)self _optionsWithInitialClientSettings:v12 activationOptions:v13 targetSession:v14 optionsClass:[(_UIApplicationSceneRequestBuilder *)self _requestOptionsClass] outError:&v22];
  id v16 = v22;
  id v28 = v15;

  if (v16)
  {
    v7[2](v7, 0, v16);
  }
  else
  {
    [(_UIApplicationSceneRequestBuilder *)self _customizeWorkspaceRequestOptions:v24[5] usingRequest:v6];
    v17 = [v6 userActivity];

    if (v17)
    {
      v18 = [v6 userActivity];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __93___UIApplicationSceneRequestBuilder_buildWorkspaceRequestOptionsForRequest_withContinuation___block_invoke;
      v19[3] = &unk_1E52D9A08;
      v20 = v7;
      v21 = &v23;
      +[UISActivityContinuationAction buildWithUserActivity:v18 completion:v19];
    }
    else
    {
      v7[2](v7, v24[5], 0);
    }
  }
  _Block_object_dispose(&v23, 8);
}

- (id)_specification
{
  return +[FBSSceneSpecification specification];
}

- (Class)_requestOptionsClass
{
  return (Class)objc_opt_class();
}

- (id)_optionsWithInitialClientSettings:(id)a3 activationOptions:(id)a4 targetSession:(id)a5 optionsClass:(Class)a6 outError:(id *)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a3;
  id v15 = objc_alloc_init(a6);
  [v15 setInitialClientSettings:v14];

  id v16 = [MEMORY[0x1E4F1CA80] set];
  if (v13)
  {
    v17 = [v13 persistentIdentifier];
    [v15 setIdentifier:v17];
  }
  if (v12)
  {
    v18 = [v12 requestingScene];
    v19 = [v18 session];

    if (v19)
    {
      v20 = [v19 persistentIdentifier];
      [v15 setSourceIdentifier:v20];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v32 = a7;
      id v21 = v12;
      id v22 = [v21 _interactionIdentifier];
      [v15 setInteractionIdentifier:v22];

      uint64_t v23 = [v21 _quickLookSceneConfiguration];
      v24 = (void *)v23;
      if (!v13 && v23)
      {
        [v15 setRequestQuickLookScene:1];
        uint64_t v25 = +[UIQuickLookSceneConfigurationAction actionWithSceneConfiguration:v24];
        [v16 addObject:v25];
      }
      v33 = v24;
      objc_msgSend(v15, "setPreserveLayout:", objc_msgSend(v21, "_effectivelyWantsPreservedLayout"));
      objc_msgSend(v15, "setRequestFullscreen:", objc_msgSend(v21, "_effectivelyWantsFullscreen"));
      objc_msgSend(v15, "setRequestCenterSlot:", objc_msgSend(v21, "_effectivelyWantsProminence"));
      objc_msgSend(v15, "setRequestBackground:", objc_msgSend(v21, "_effectivelyWantsBackground"));
      v26 = [v21 placement];
      if (v26
        || (([v15 preserveLayout] & 1) != 0
         || ([v15 requestFullscreen] & 1) != 0
         || ([v15 requestCenterSlot] & 1) != 0
         || [v15 requestBackground])
        && (_UIWindowScenePlacementForLegacyFlags([v15 requestFullscreen], objc_msgSend(v15, "requestCenterSlot"), objc_msgSend(v15, "preserveLayout"), objc_msgSend(v15, "requestBackground")), (v26 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v34 = 0;
        v27 = [v26 _createConfigurationWithError:&v34];
        id v28 = v34;
        [v15 setScenePlacementConfiguration:v27];

        if (v28) {
          id *v32 = v28;
        }
      }
    }
    else
    {
      objc_msgSend(v15, "setRequestFullscreen:", objc_msgSend(v12, "_requestFullscreen"));
      objc_msgSend(v15, "setPreserveLayout:", objc_msgSend(v12, "preserveLayout"));
    }
  }
  v29 = [(_UIApplicationSceneRequestBuilder *)self _specification];
  [v15 setSpecification:v29];

  v30 = (void *)[v16 copy];
  [v15 setActions:v30];

  return v15;
}

@end