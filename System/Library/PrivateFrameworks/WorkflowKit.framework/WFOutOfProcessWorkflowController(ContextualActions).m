@interface WFOutOfProcessWorkflowController(ContextualActions)
+ (id)computeFinderResizedSizesForImages:()ContextualActions inSizes:error:;
@end

@implementation WFOutOfProcessWorkflowController(ContextualActions)

+ (id)computeFinderResizedSizesForImages:()ContextualActions inSizes:error:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FB4820]) initWithEnvironment:0 runningContext:0 presentationMode:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke;
  aBlock[3] = &unk_1E6558B28;
  id v12 = v11;
  id v35 = v12;
  v13 = (void (**)(void))_Block_copy(aBlock);
  id v33 = 0;
  v14 = [v12 synchronousRunnerWithError:&v33 reason:@"computing finder resized image"];
  id v15 = v33;
  v16 = v15;
  if (v14)
  {
    id v17 = v15;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__14907;
    v38 = __Block_byref_object_dispose__14908;
    id v39 = 0;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__14907;
    v31 = __Block_byref_object_dispose__14908;
    id v32 = 0;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __104__WFOutOfProcessWorkflowController_ContextualActions__computeFinderResizedSizesForImages_inSizes_error___block_invoke_170;
    v21[3] = &unk_1E654F378;
    id v22 = v10;
    v23 = &v27;
    uint64_t v25 = a2;
    uint64_t v26 = a1;
    v24 = buf;
    [v14 computeFinderResizedSizesForImages:v9 inSizes:v22 completion:v21];
    v16 = v17;
    if (a5) {
      *a5 = (id) v28[5];
    }
    id v18 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v19 = getWFXPCRunnerLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[WFOutOfProcessWorkflowController(ContextualActions) computeFinderResizedSizesForImages:inSizes:error:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_ERROR, "%s Unable to connect to runner: %@", buf, 0x16u);
    }

    id v18 = 0;
  }

  v13[2](v13);
  return v18;
}

@end