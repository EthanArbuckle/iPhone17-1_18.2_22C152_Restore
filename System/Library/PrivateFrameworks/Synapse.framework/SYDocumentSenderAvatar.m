@interface SYDocumentSenderAvatar
- (SYDocumentSender)documentSender;
- (SYDocumentSenderAvatar)initWithDocumentSender:(id)a3;
- (id)_createAvatarImageRenderer;
- (id)_createContactFromPersonNameComponents:(id)a3;
- (id)_createRenderingScopeWithSize:(CGSize)a3 scale:(double)a4 isRTL:(BOOL)a5;
- (id)_defaultThumbnailImageWithSize:(CGSize)a3 scale:(double)a4 isRTL:(BOOL)a5;
- (id)_documentSenderHandle;
- (id)_renderAvatarImageForContact:(id)a3 renderer:(id)a4 renderingScope:(id)a5;
- (id)_renderAvatarImageWithRenderer:(id)a3 renderingScope:(id)a4;
- (id)fetchThumbnailImages;
- (id)fetchThumbnailImagesWithScale:(double)a3 isRTL:(BOOL)a4;
- (void)fetchThumbnailImagesWithScale:(double)a3 isRTL:(BOOL)a4 completion:(id)a5;
@end

@implementation SYDocumentSenderAvatar

- (SYDocumentSenderAvatar)initWithDocumentSender:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SYDocumentSenderAvatar;
  v6 = [(SYDocumentSenderAvatar *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_documentSender, a3);
    v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.synapse.SYDocumentSenderAvatar", v8);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (void)fetchThumbnailImagesWithScale:(double)a3 isRTL:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke;
  v17[3] = &unk_1E6463990;
  id v18 = v8;
  id v9 = v8;
  v10 = (void *)MEMORY[0x1C8769940](v17);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2;
  block[3] = &unk_1E64639E0;
  double v15 = a3;
  BOOL v16 = a4;
  block[4] = self;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(processingQueue, block);
}

uint64_t __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2(uint64_t a1)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v3 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [*(id *)(a1 + 32) documentSender];
    *(_DWORD *)buf = 138477827;
    uint64_t v43 = (uint64_t)v4;
    _os_log_impl(&dword_1C2C5F000, v3, OS_LOG_TYPE_DEFAULT, "Fetching all matching contacts for sender: %{private}@", buf, 0xCu);
  }
  id v5 = (void *)MEMORY[0x1E4F1B8F8];
  v6 = [*(id *)(a1 + 32) _documentSenderHandle];
  uint64_t v7 = [v5 predicateForContactsMatchingEmailAddress:v6];

  v46[0] = *MEMORY[0x1E4F1AF98];
  [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  v29 = uint64_t v40 = 0;
  v30 = (void *)v7;
  id v8 = objc_msgSend(v2, "unifiedContactsMatchingPredicate:keysToFetch:error:", v7);
  id v9 = 0;
  if (!v8)
  {
    v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2_cold_1((uint64_t)v9, v10);
    }
  }
  v28 = v9;
  v31 = v2;
  v11 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_msgSend(v8, "count", v9);
    v13 = [*(id *)(a1 + 32) documentSender];
    *(_DWORD *)buf = 134218243;
    uint64_t v43 = v12;
    __int16 v44 = 2113;
    v45 = v13;
    _os_log_impl(&dword_1C2C5F000, v11, OS_LOG_TYPE_DEFAULT, "Found %ld matching contacts for sender: %{private}@", buf, 0x16u);
  }
  id v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  double v15 = [*(id *)(a1 + 32) _createAvatarImageRenderer];
  BOOL v16 = objc_msgSend(*(id *)(a1 + 32), "_createRenderingScopeWithSize:scale:isRTL:", *(unsigned __int8 *)(a1 + 56), 100.0, 100.0, *(double *)(a1 + 48));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v17 = v8;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v37 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v23 = objc_msgSend(v22, "thumbnailImageData", v28);

        if (v23)
        {
          v24 = [*(id *)(a1 + 32) _renderAvatarImageForContact:v22 renderer:v15 renderingScope:v16];
          if (v24) {
            [v14 addObject:v24];
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v19);
  }

  if ([v14 count])
  {
    uint64_t v25 = *(void *)(a1 + 40);
    v26 = (void *)[v14 copy];
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_7;
    block[3] = &unk_1E64639E0;
    v27 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    uint64_t v34 = *(void *)(a1 + 48);
    char v35 = *(unsigned char *)(a1 + 56);
    id v33 = v27;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_7(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_defaultThumbnailImageWithSize:scale:isRTL:", *(unsigned __int8 *)(a1 + 56), 100.0, 100.0, *(double *)(a1 + 48));
  v3 = (void *)v2;
  if (v2)
  {
    v11[0] = v2;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    v4 = 0;
  }
  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2_8;
  v8[3] = &unk_1E64639B8;
  id v6 = *(id *)(a1 + 40);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(v5, v8);
}

uint64_t __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_documentSenderHandle
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SYDocumentSenderAvatar *)self documentSender];
  v3 = [v2 handle];
  v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"<>"];
  id v5 = [v3 componentsSeparatedByCharactersInSet:v4];

  id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "length", (void)v15)) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  v13 = [v6 lastObject];

  return v13;
}

- (id)fetchThumbnailImages
{
  double v3 = 2.0;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (SYScreenScale___onceToken != -1) {
      dispatch_once(&SYScreenScale___onceToken, &__block_literal_global_1);
    }
    double v3 = *(double *)&SYScreenScale___scale;
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (SYIsRTL___onceToken != -1) {
      dispatch_once(&SYIsRTL___onceToken, &__block_literal_global_55);
    }
    BOOL v4 = SYIsRTL___isRTL != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  return [(SYDocumentSenderAvatar *)self fetchThumbnailImagesWithScale:v4 isRTL:v3];
}

- (id)fetchThumbnailImagesWithScale:(double)a3 isRTL:(BOOL)a4
{
  BOOL v29 = a4;
  v42[1] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  id v7 = (void *)MEMORY[0x1E4F1B8F8];
  uint64_t v8 = [(SYDocumentSenderAvatar *)self _documentSenderHandle];
  uint64_t v9 = [v7 predicateForContactsMatchingEmailAddress:v8];

  v42[0] = *MEMORY[0x1E4F1AF98];
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  id v36 = 0;
  v30 = (void *)v9;
  v31 = v6;
  v11 = [v6 unifiedContactsMatchingPredicate:v9 keysToFetch:v10 error:&v36];
  id v12 = v36;
  if (!v11)
  {
    v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2_cold_1((uint64_t)v12, v13);
    }
  }
  id v14 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v11 count];
    long long v16 = [(SYDocumentSenderAvatar *)self documentSender];
    *(_DWORD *)buf = 134218243;
    uint64_t v39 = v15;
    __int16 v40 = 2113;
    v41 = v16;
    _os_log_impl(&dword_1C2C5F000, v14, OS_LOG_TYPE_DEFAULT, "Found %ld matching contacts for sender: %{private}@", buf, 0x16u);
  }
  long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v11, "count"));
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v24 = [v23 thumbnailImageData];

        if (v24)
        {
          uint64_t v25 = [v23 thumbnailImageData];
          [v17 addObject:v25];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v20);
  }

  if (![v17 count])
  {
    v26 = -[SYDocumentSenderAvatar _defaultThumbnailImageWithSize:scale:isRTL:](self, "_defaultThumbnailImageWithSize:scale:isRTL:", v29, 100.0, 100.0, a3);
    if (v26) {
      [v17 addObject:v26];
    }
  }
  v27 = (void *)[v17 copy];

  return v27;
}

- (id)_defaultThumbnailImageWithSize:(CGSize)a3 scale:(double)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  uint64_t v10 = [(SYDocumentSenderAvatar *)self _createAvatarImageRenderer];
  v11 = -[SYDocumentSenderAvatar _createRenderingScopeWithSize:scale:isRTL:](self, "_createRenderingScopeWithSize:scale:isRTL:", v5, width, height, a4);
  id v12 = [(SYDocumentSenderAvatar *)self _renderAvatarImageWithRenderer:v10 renderingScope:v11];

  return v12;
}

- (id)_createAvatarImageRenderer
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  uint64_t v2 = (void *)getCNAvatarImageRendererSettingsClass_softClass;
  uint64_t v17 = getCNAvatarImageRendererSettingsClass_softClass;
  if (!getCNAvatarImageRendererSettingsClass_softClass)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __getCNAvatarImageRendererSettingsClass_block_invoke;
    id v12 = &unk_1E64635F8;
    v13 = &v14;
    __getCNAvatarImageRendererSettingsClass_block_invoke((uint64_t)&v9);
    uint64_t v2 = (void *)v15[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v14, 8);
  BOOL v4 = [v3 defaultSettings];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  BOOL v5 = (void *)getCNAvatarImageRendererClass_softClass;
  uint64_t v17 = getCNAvatarImageRendererClass_softClass;
  if (!getCNAvatarImageRendererClass_softClass)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __getCNAvatarImageRendererClass_block_invoke;
    id v12 = &unk_1E64635F8;
    v13 = &v14;
    __getCNAvatarImageRendererClass_block_invoke((uint64_t)&v9);
    BOOL v5 = (void *)v15[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v14, 8);
  id v7 = (void *)[[v6 alloc] initWithSettings:v4];

  return v7;
}

- (id)_createRenderingScopeWithSize:(CGSize)a3 scale:(double)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  uint64_t v9 = (void *)getCNAvatarImageRenderingScopeClass_softClass;
  uint64_t v17 = getCNAvatarImageRenderingScopeClass_softClass;
  if (!getCNAvatarImageRenderingScopeClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getCNAvatarImageRenderingScopeClass_block_invoke;
    v13[3] = &unk_1E64635F8;
    v13[4] = &v14;
    __getCNAvatarImageRenderingScopeClass_block_invoke((uint64_t)v13);
    uint64_t v9 = (void *)v15[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v14, 8);
  v11 = objc_msgSend(v10, "scopeWithPointSize:scale:rightToLeft:style:", v5, 0, width, height, a4);
  return v11;
}

- (id)_renderAvatarImageWithRenderer:(id)a3 renderingScope:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(SYDocumentSenderAvatar *)self documentSender];
    int v18 = 138477827;
    uint64_t v19 = v9;
    _os_log_impl(&dword_1C2C5F000, v8, OS_LOG_TYPE_DEFAULT, "Rendering avatar image for sender: %{private}@", (uint8_t *)&v18, 0xCu);
  }
  id v10 = [(SYDocumentSenderAvatar *)self documentSender];
  v11 = [v10 personNameComponentsFormattedWithStyle:4];

  if (v11)
  {
    id v12 = [(SYDocumentSenderAvatar *)self _createContactFromPersonNameComponents:v11];
    v13 = [(SYDocumentSenderAvatar *)self _renderAvatarImageForContact:v12 renderer:v6 renderingScope:v7];
    uint64_t v14 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(SYDocumentSenderAvatar *)self documentSender];
      uint64_t v16 = [v13 length];
      int v18 = 138478595;
      uint64_t v19 = v15;
      __int16 v20 = 2113;
      uint64_t v21 = v12;
      __int16 v22 = 2113;
      v23 = v11;
      __int16 v24 = 2048;
      uint64_t v25 = v16;
      _os_log_impl(&dword_1C2C5F000, v14, OS_LOG_TYPE_DEFAULT, "Finished rendering avatar image for sender: %{private}@, contact: %{private}@, components: %{private}@, size: %ld", (uint8_t *)&v18, 0x2Au);
    }
  }
  else
  {
    uint64_t v14 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SYDocumentSenderAvatar _renderAvatarImageWithRenderer:renderingScope:](self, v14);
    }
    v13 = 0;
    id v12 = v14;
  }

  return v13;
}

- (id)_renderAvatarImageForContact:(id)a3 renderer:(id)a4 renderingScope:(id)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v21[0] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  v11 = [v8 avatarImageForContacts:v10 scope:v9];

  id v12 = v11;
  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v13 = (void (*)(id))getUIImagePNGRepresentationSymbolLoc_ptr;
  __int16 v20 = getUIImagePNGRepresentationSymbolLoc_ptr;
  if (!getUIImagePNGRepresentationSymbolLoc_ptr)
  {
    uint64_t v14 = (void *)UIKitLibrary();
    v18[3] = (uint64_t)dlsym(v14, "UIImagePNGRepresentation");
    getUIImagePNGRepresentationSymbolLoc_ptr = (_UNKNOWN *)v18[3];
    v13 = (void (*)(id))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (!v13) {
    -[SYDocumentSenderAvatar _renderAvatarImageForContact:renderer:renderingScope:]();
  }
  uint64_t v15 = v13(v12);

  return v15;
}

- (id)_createContactFromPersonNameComponents:(id)a3
{
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F1BA40];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    id v6 = [v4 namePrefix];
    [v5 setNamePrefix:v6];

    id v7 = [v4 givenName];
    [v5 setGivenName:v7];

    id v8 = [v4 middleName];
    [v5 setMiddleName:v8];

    id v9 = [v4 familyName];
    [v5 setFamilyName:v9];

    id v10 = [v4 nameSuffix];
    [v5 setNameSuffix:v10];

    v11 = [v4 nickname];

    [v5 setNickname:v11];
    id v12 = (void *)[v5 copy];
  }
  else
  {
    id v12 = 0;
  }
  return v12;
}

- (SYDocumentSender)documentSender
{
  return self->_documentSender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentSender, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
}

void __73__SYDocumentSenderAvatar_fetchThumbnailImagesWithScale_isRTL_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Failed to find matching contacts, error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_renderAvatarImageWithRenderer:(void *)a1 renderingScope:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 documentSender];
  int v4 = 138477827;
  id v5 = v3;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Unable to get person name components for sender: %{private}@", (uint8_t *)&v4, 0xCu);
}

- (void)_renderAvatarImageForContact:renderer:renderingScope:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSData *sy_UIImagePNGRepresentation(UIImage *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYDocumentSenderAvatar.m", 26, @"%s", dlerror());

  __break(1u);
}

@end