@interface NSItemProvider(MobileSafariFrameworkExtras)
+ (void)safari_loadObjectsFromItemProviders:()MobileSafariFrameworkExtras usingLoader:completionHandler:;
- (void)safari_loadObjectOfClasses:()MobileSafariFrameworkExtras completionHandler:;
- (void)safari_registerFileRepresentationForQuickLookDocument:()MobileSafariFrameworkExtras;
@end

@implementation NSItemProvider(MobileSafariFrameworkExtras)

+ (void)safari_loadObjectsFromItemProviders:()MobileSafariFrameworkExtras usingLoader:completionHandler:
{
  id v7 = a5;
  id v8 = a3;
  dispatch_group_t v9 = dispatch_group_create();
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke;
  aBlock[3] = &unk_1E54ECB88;
  id v11 = v10;
  id v28 = v11;
  v12 = _Block_copy(aBlock);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke_2;
  v23[3] = &unk_1E54ECBD8;
  v13 = v9;
  id v25 = v12;
  uint64_t v26 = a4;
  v24 = v13;
  id v14 = v12;
  [v8 enumerateObjectsUsingBlock:v23];

  v15 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectsFromItemProviders_usingLoader_completionHandler___block_invoke_4;
  block[3] = &unk_1E54E9A88;
  v20 = v13;
  id v21 = v11;
  id v22 = v7;
  id v16 = v7;
  id v17 = v11;
  v18 = v13;
  dispatch_async(v15, block);
}

- (void)safari_loadObjectOfClasses:()MobileSafariFrameworkExtras completionHandler:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ([a1 canLoadObjectOfClass:v13])
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __92__NSItemProvider_MobileSafariFrameworkExtras__safari_loadObjectOfClasses_completionHandler___block_invoke;
          v18[3] = &unk_1E54ECC00;
          id v19 = v7;
          id v17 = (id)[a1 loadObjectOfClass:v13 completionHandler:v18];

          goto LABEL_12;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v14 = WBS_LOG_CHANNEL_PREFIXItemProvider();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = v14;
    id v16 = [v8 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138543362;
    id v25 = v16;
    _os_log_impl(&dword_18C354000, v15, OS_LOG_TYPE_INFO, "Did not find object matching allowed classes: %{public}@", buf, 0xCu);
  }
LABEL_12:
}

- (void)safari_registerFileRepresentationForQuickLookDocument:()MobileSafariFrameworkExtras
{
  id v4 = a3;
  v5 = [v4 fileName];
  [a1 setSuggestedName:v5];

  id v6 = [v4 inferredUTI];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __101__NSItemProvider_MobileSafariFrameworkExtras__safari_registerFileRepresentationForQuickLookDocument___block_invoke;
  v8[3] = &unk_1E54ECC28;
  id v9 = v4;
  id v7 = v4;
  [a1 registerFileRepresentationForTypeIdentifier:v6 fileOptions:0 visibility:0 loadHandler:v8];
}

@end