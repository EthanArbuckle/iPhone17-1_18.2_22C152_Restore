@interface NSItemProvider(SocialLayer)
- (id)sl_representations;
- (uint64_t)sl_hasPossibleCollaborationRepresentation;
- (void)sl_loadRepresentationForTypeIdentifier:()SocialLayer completionHandler:;
@end

@implementation NSItemProvider(SocialLayer)

- (uint64_t)sl_hasPossibleCollaborationRepresentation
{
  uint64_t v2 = 1;
  v3 = [a1 registeredTypeIdentifiersWithFileOptions:1];
  if (![v3 count])
  {
    if ([a1 canLoadObjectOfClass:objc_opt_class()])
    {
      uint64_t v2 = 1;
    }
    else
    {
      uint64_t v8 = 0;
      v9 = &v8;
      uint64_t v10 = 0x2050000000;
      v4 = (void *)getCKContainerSetupInfoClass_softClass_1;
      uint64_t v11 = getCKContainerSetupInfoClass_softClass_1;
      if (!getCKContainerSetupInfoClass_softClass_1)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __getCKContainerSetupInfoClass_block_invoke_1;
        v7[3] = &unk_1E58A88B0;
        v7[4] = &v8;
        __getCKContainerSetupInfoClass_block_invoke_1((uint64_t)v7);
        v4 = (void *)v9[3];
      }
      id v5 = v4;
      _Block_object_dispose(&v8, 8);
      uint64_t v2 = [a1 canLoadObjectOfClass:v5];
    }
  }

  return v2;
}

- (id)sl_representations
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 registeredTypeIdentifiers];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v16;
    *(void *)&long long v6 = 138412546;
    long long v14 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(a1, "_representationConformingToType:", v10, v14, (void)v15);
        if (v11)
        {
          v12 = -[SLShareableContentRepresentation initWithTypeIdentifier:preferredRepresentation:]([SLShareableContentRepresentation alloc], "initWithTypeIdentifier:preferredRepresentation:", v10, [v11 preferredRepresentation]);
          [v3 addObject:v12];
        }
        else
        {
          SLShareableContentLogHandle();
          v12 = (SLShareableContentRepresentation *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            uint64_t v20 = v10;
            __int16 v21 = 2112;
            v22 = a1;
            _os_log_error_impl(&dword_19BE17000, &v12->super, OS_LOG_TYPE_ERROR, "Unexpectedly got empty representation for registered type identifier: %@ on item provider: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v7);
  }

  return v3;
}

- (void)sl_loadRepresentationForTypeIdentifier:()SocialLayer completionHandler:
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _representationConformingToType:v6];
  v9 = v8;
  if (v8)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__NSItemProvider_SocialLayer__sl_loadRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v16[3] = &unk_1E58AA2D0;
    id v17 = v8;
    id v18 = v7;
    id v10 = (id)objc_msgSend(v17, "loadWithOptions_v2:completionHandler:", 0, v16);

    id v11 = v17;
  }
  else
  {
    v12 = SLShareableContentLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[NSItemProvider(SocialLayer) sl_loadRepresentationForTypeIdentifier:completionHandler:]((uint64_t)v6, a1, v12);
    }

    v13 = (void *)MEMORY[0x1E4F28C58];
    v19 = @"typeIdentifier";
    v20[0] = v6;
    long long v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v11 = [v13 errorWithDomain:@"com.apple.SocialLayer.SLItemProviderErrorDomain" code:1 userInfo:v14];

    long long v15 = +[SLShareableContentLoadResult resultWithError:v11];
    (*((void (**)(id, void *))v7 + 2))(v7, v15);
  }
}

- (void)sl_loadRepresentationForTypeIdentifier:()SocialLayer completionHandler:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a2, "sl_representations");
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_19BE17000, a3, OS_LOG_TYPE_ERROR, "Failed to find registered representation for requested type identifier: %@ registered representations: %@", (uint8_t *)&v6, 0x16u);
}

@end