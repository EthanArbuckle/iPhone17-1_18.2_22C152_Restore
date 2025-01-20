@interface NCAvatarImageRenderer
+ (id)sharedInstanceForPointSize:(double)a3;
- (id)_getAvatarImageGenerationQueueAndIncrementUsageCount;
- (id)_imageNamed:(id)a3 inBundleIdentifier:(id)a4 traitCollection:(id)a5;
- (id)_initWithPointSize:(double)a3;
- (id)_queue_imageForContacts:(id)a3 compatibleWithTraitCollection:(id)a4 circular:(BOOL)a5;
- (id)_silhouetteFallbackImageNameForContacts:(id)a3;
- (id)_systemImageNamed:(id)a3 traitCollection:(id)a4;
- (void)_decrementAvatarImageGenerationQueueUsageCountAndInvalidateIfNeeded;
- (void)renderAvatarForRequest:(id)a3 compatibleWithTraitCollection:(id)a4 completion:(id)a5;
@end

@implementation NCAvatarImageRenderer

+ (id)sharedInstanceForPointSize:(double)a3
{
  if (sharedInstanceForPointSize__onceToken != -1) {
    dispatch_once(&sharedInstanceForPointSize__onceToken, &__block_literal_global_12);
  }
  id v5 = a1;
  objc_sync_enter(v5);
  v6 = (void *)sharedInstanceForPointSize____pointSizesToRenderers;
  v7 = [NSNumber numberWithDouble:a3];
  id v8 = [v6 objectForKey:v7];

  if (!v8)
  {
    id v8 = [[NCAvatarImageRenderer alloc] _initWithPointSize:a3];
    v9 = (void *)sharedInstanceForPointSize____pointSizesToRenderers;
    v10 = [NSNumber numberWithDouble:a3];
    [v9 setObject:v8 forKey:v10];
  }
  objc_sync_exit(v5);

  return v8;
}

void __52__NCAvatarImageRenderer_sharedInstanceForPointSize___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)sharedInstanceForPointSize____pointSizesToRenderers;
  sharedInstanceForPointSize____pointSizesToRenderers = (uint64_t)v0;
}

- (void)renderAvatarForRequest:(id)a3 compatibleWithTraitCollection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(NCAvatarImageRenderer *)self _getAvatarImageGenerationQueueAndIncrementUsageCount];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__NCAvatarImageRenderer_renderAvatarForRequest_compatibleWithTraitCollection_completion___block_invoke;
  v15[3] = &unk_1E6A936D0;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __89__NCAvatarImageRenderer_renderAvatarForRequest_compatibleWithTraitCollection_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) content];
  v3 = [v2 communicationContext];

  v4 = [*(id *)(a1 + 32) topLevelSectionIdentifier];
  id v5 = [v3 imageName];
  if (v5) {
    int v6 = [v3 isSystemImage];
  }
  else {
    int v6 = 0;
  }
  char v7 = v6 ^ 1;
  if (v5) {
    int v8 = v6 ^ 1;
  }
  else {
    int v8 = 0;
  }
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__4;
  v56 = __Block_byref_object_dispose__4;
  id v57 = 0;
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__4;
  v50 = __Block_byref_object_dispose__4;
  id v51 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__NCAvatarImageRenderer_renderAvatarForRequest_compatibleWithTraitCollection_completion___block_invoke_3;
  aBlock[3] = &unk_1E6A936A8;
  id v40 = *(id *)(a1 + 56);
  v41 = &v52;
  char v43 = 0;
  id v9 = v4;
  id v36 = v9;
  id v10 = v3;
  char v44 = v6;
  char v45 = v8;
  id v37 = v10;
  id v38 = 0;
  uint64_t v11 = *(void *)(a1 + 40);
  v42 = &v46;
  uint64_t v39 = v11;
  id v12 = (void (**)(void))_Block_copy(aBlock);
  if ((v7 & 1) == 0)
  {
    uint64_t v13 = [*(id *)(a1 + 40) _systemImageNamed:v5 traitCollection:*(void *)(a1 + 48)];
    id v14 = (void *)v53[5];
    v53[5] = v13;
  }
  if (v8)
  {
    uint64_t v15 = [*(id *)(a1 + 40) _imageNamed:v5 inBundleIdentifier:v9 traitCollection:*(void *)(a1 + 48)];
    id v16 = (void *)v53[5];
    v53[5] = v15;
  }
  if (v53[5])
  {
    v12[2](v12);
    v17 = 0;
  }
  else
  {
    id v18 = (void *)MEMORY[0x1E4FB3818];
    id v19 = [*(id *)(a1 + 32) content];
    v20 = [v19 communicationContext];
    v21 = [*(id *)(a1 + 32) topLevelSectionIdentifier];
    v22 = [MEMORY[0x1E4F1BB20] descriptorForRequiredKeys];
    v17 = [v18 generateEphemeralContactsForImageRenderingWithContext:v20 bundleIdentifier:v21 descriptorForRequiredKeys:v22];

    v23 = objc_msgSend(*(id *)(a1 + 40), "_queue_imageForContacts:compatibleWithTraitCollection:circular:", v17, *(void *)(a1 + 48), objc_msgSend(v10, "isBusinessCorrespondence") ^ 1);
    v24 = v23;
    if (v23)
    {
      v25 = v53;
      id v26 = v23;
      v27 = (void *)v25[5];
      v25[5] = (uint64_t)v26;
    }
    else
    {
      v34 = *(void **)(a1 + 40);
      v28 = [*(id *)(a1 + 32) content];
      v29 = [v28 communicationContext];
      v30 = [v29 allContacts];
      uint64_t v31 = [v34 _silhouetteFallbackImageNameForContacts:v30];
      v32 = (void *)v47[5];
      v47[5] = v31;

      uint64_t v33 = [*(id *)(a1 + 40) _systemImageNamed:v47[5] traitCollection:*(void *)(a1 + 48)];
      v27 = (void *)v53[5];
      v53[5] = v33;
    }

    v12[2](v12);
  }

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
}

uint64_t __89__NCAvatarImageRenderer_renderAvatarForRequest_compatibleWithTraitCollection_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(unsigned __int8 *)(a1 + 88));
  }
  v3 = (id)*MEMORY[0x1E4FB3758];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    v4 = [*(id *)(a1 + 40) identifier];
    objc_msgSend(v4, "un_logDigest");
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
      int v6 = @"YES";
    }
    else {
      int v6 = @"NO";
    }
    if (*(unsigned char *)(a1 + 89)) {
      char v7 = @"YES";
    }
    else {
      char v7 = @"NO";
    }
    if (*(unsigned char *)(a1 + 90)) {
      int v8 = @"YES";
    }
    else {
      int v8 = @"NO";
    }
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"YES with count of '%lu'", objc_msgSend(*(id *)(a1 + 48), "count"));
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v10 = @"NO";
    }
    uint64_t v11 = *(__CFString **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    if (!v11) {
      uint64_t v11 = @"NO";
    }
    *(_DWORD *)buf = 138544898;
    uint64_t v15 = v13;
    __int16 v16 = 2114;
    id v17 = v5;
    __int16 v18 = 2114;
    id v19 = v6;
    __int16 v20 = 2114;
    v21 = v7;
    __int16 v22 = 2114;
    v23 = v8;
    __int16 v24 = 2114;
    v25 = v10;
    __int16 v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_1D7C04000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Context identifier:%{public}@ - Rendered avatar image: %{public}@. Tried System Image: %{public}@, Tried Bundle Image: %{public}@, Tried Ephemeral Contacts: %{public}@, Tried Silhouette Fallback of Name: %{public}@", buf, 0x48u);
    if (v9) {
  }
    }
  return [*(id *)(a1 + 56) _decrementAvatarImageGenerationQueueUsageCountAndInvalidateIfNeeded];
}

- (id)_initWithPointSize:(double)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NCAvatarImageRenderer;
  v4 = [(NCAvatarImageRenderer *)&v11 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1BB20]);
    int v6 = [MEMORY[0x1E4F1BB28] offMainThreadSynchronousRenderingOnlySettingsWithCacheSize:100];
    uint64_t v7 = [v5 initWithSettings:v6];
    avatarRenderer = v4->_avatarRenderer;
    v4->_avatarRenderer = (CNAvatarImageRenderer *)v7;

    v4->_avatarImageGenerationQueueUsageCount = 0;
    double v9 = 44.0;
    if (a3 > 0.0) {
      double v9 = a3;
    }
    v4->_pointSize = v9;
  }
  return v4;
}

- (id)_getAvatarImageGenerationQueueAndIncrementUsageCount
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  avatarImageGenerationQueue = v2->_avatarImageGenerationQueue;
  if (avatarImageGenerationQueue)
  {
    ++v2->_avatarImageGenerationQueueUsageCount;
  }
  else
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 bundleIdentifier];
    int v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    int v8 = [v5 stringByAppendingFormat:@".%@.avatarGeneration", v7];
    uint64_t SerialWithQoS = BSDispatchQueueCreateSerialWithQoS();
    id v10 = v2->_avatarImageGenerationQueue;
    v2->_avatarImageGenerationQueue = (OS_dispatch_queue *)SerialWithQoS;

    v2->_avatarImageGenerationQueueUsageCount = 1;
    avatarImageGenerationQueue = v2->_avatarImageGenerationQueue;
  }
  objc_super v11 = avatarImageGenerationQueue;
  objc_sync_exit(v2);

  return v11;
}

- (void)_decrementAvatarImageGenerationQueueUsageCountAndInvalidateIfNeeded
{
  obj = self;
  objc_sync_enter(obj);
  unint64_t avatarImageGenerationQueueUsageCount = obj->_avatarImageGenerationQueueUsageCount;
  if (avatarImageGenerationQueueUsageCount < 2)
  {
    avatarImageGenerationQueue = obj->_avatarImageGenerationQueue;
    obj->_avatarImageGenerationQueue = 0;
  }
  else
  {
    obj->_unint64_t avatarImageGenerationQueueUsageCount = avatarImageGenerationQueueUsageCount - 1;
  }
  objc_sync_exit(obj);
}

- (id)_imageNamed:(id)a3 inBundleIdentifier:(id)a4 traitCollection:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(MEMORY[0x1E4F223C8], "unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:", v8);
  objc_super v11 = [v10 URL];
  id v12 = (void *)[v11 copy];

  if (!v12
    || ([MEMORY[0x1E4F28B50] bundleWithURL:v12], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) == 0)
    || (id v14 = (void *)v13,
        [MEMORY[0x1E4FB1818] imageNamed:v7 inBundle:v13 compatibleWithTraitCollection:v9],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        !v15))
  {
    __int16 v16 = (void *)*MEMORY[0x1E4FB3758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3758], OS_LOG_TYPE_ERROR)) {
      -[NCAvatarImageRenderer _imageNamed:inBundleIdentifier:traitCollection:](v16, v7, (uint64_t)v8);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)_systemImageNamed:(id)a3 traitCollection:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4FB1830];
  double pointSize = self->_pointSize;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v5 configurationWithPointSize:pointSize];
  id v10 = [v9 configurationWithTraitCollection:v7];

  objc_super v11 = [MEMORY[0x1E4FB1818] systemImageNamed:v8 withConfiguration:v10];

  return v11;
}

- (id)_queue_imageForContacts:(id)a3 compatibleWithTraitCollection:(id)a4 circular:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([v8 count])
  {
    [v9 displayScale];
    double v11 = v10;
    if ([v9 userInterfaceStyle] == 2) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 2;
    }
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:backgroundStyle:", 0, !v5, v12, self->_pointSize, self->_pointSize, v11);
    id v14 = [(CNAvatarImageRenderer *)self->_avatarRenderer avatarImageForContacts:v8 scope:v13];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_silhouetteFallbackImageNameForContacts:(id)a3
{
  unint64_t v3 = [a3 count];
  if (v3 > 2) {
    return @"person.3.fill";
  }
  else {
    return off_1E6A936F0[v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarImageGenerationQueue, 0);

  objc_storeStrong((id *)&self->_avatarRenderer, 0);
}

- (void)_imageNamed:(void *)a1 inBundleIdentifier:(void *)a2 traitCollection:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v5 = a1;
  int v6 = objc_msgSend(a2, "un_logDigest");
  int v7 = 138543874;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a3;
  __int16 v11 = 2112;
  uint64_t v12 = @"<NULL>";
  _os_log_error_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_ERROR, "Error loading image named '%{public}@' in bundle '%{public}@'. Error: %@", (uint8_t *)&v7, 0x20u);
}

@end