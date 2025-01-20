@interface INImage(Workflow)
+ (uint64_t)wf_contentItemClass;
- (id)wf_contentItemWithCodableAttribute:()Workflow;
- (void)wf_transformUsingCodableAttribute:()Workflow completionHandler:;
@end

@implementation INImage(Workflow)

- (void)wf_transformUsingCodableAttribute:()Workflow completionHandler:
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  *(void *)&long long v21 = 0;
  *((void *)&v21 + 1) = &v21;
  uint64_t v22 = 0x2050000000;
  v8 = (void *)getINUIImageLoaderClass_softClass;
  uint64_t v23 = getINUIImageLoaderClass_softClass;
  if (!getINUIImageLoaderClass_softClass)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __getINUIImageLoaderClass_block_invoke;
    v19 = &unk_1E6558B78;
    v20 = (void **)&v21;
    __getINUIImageLoaderClass_block_invoke((uint64_t)&v16);
    v8 = *(void **)(*((void *)&v21 + 1) + 24);
  }
  id v9 = v8;
  _Block_object_dispose(&v21, 8);
  id v10 = (id)[v9 registeredImageLoaderWithScreenDelegate];
  v15 = 0;
  if (!VoiceShortcutClientLibraryCore_frameworkLibrary)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __VoiceShortcutClientLibraryCore_block_invoke;
    v19 = &__block_descriptor_40_e5_v8__0l;
    v20 = &v15;
    long long v21 = xmmword_1E6555908;
    uint64_t v22 = 0;
    VoiceShortcutClientLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VoiceShortcutClientLibraryCore_frameworkLibrary)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    a1 = [NSString stringWithUTF8String:"void *VoiceShortcutClientLibrary(void)"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", a1, @"INImage+Workflow.m", 16, @"%s", v15);

    __break(1u);
    goto LABEL_9;
  }
  v11 = v15;
  if (v15) {
LABEL_9:
  }
    free(v11);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__INImage_Workflow__wf_transformUsingCodableAttribute_completionHandler___block_invoke;
  v13[3] = &unk_1E65558D0;
  id v14 = v7;
  id v12 = v7;
  [a1 retrieveImageDataWithCompletion:v13];
}

- (id)wf_contentItemWithCodableAttribute:()Workflow
{
  v1 = (void *)MEMORY[0x1E4F5A940];
  v2 = (void *)MEMORY[0x1E4F5A900];
  v3 = [a1 _imageData];
  v4 = [v2 fileWithData:v3 ofType:0 proposedFilename:0];
  v5 = [v1 itemWithFile:v4];

  return v5;
}

+ (uint64_t)wf_contentItemClass
{
  return objc_opt_class();
}

@end