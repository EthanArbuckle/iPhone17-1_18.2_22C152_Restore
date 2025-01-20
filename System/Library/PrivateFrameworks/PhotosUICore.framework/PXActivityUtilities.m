@interface PXActivityUtilities
+ (id)_initialsFromGivenName:(id)a3 familyName:(id)a4;
+ (id)sharedWorkQueue;
+ (id)textForDate:(id)a3;
+ (void)_requestContactMatchingEmail:(id)a3 orPhone:(id)a4 withFirstName:(id)a5 lastName:(id)a6 keysToFetch:(id)a7 withCompletion:(id)a8;
+ (void)_requestImageForContact:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 deliverOnce:(BOOL)a7 completion:(id)a8;
+ (void)_requestPlaceholderMonogramWithTargetSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5;
+ (void)requestImageForContact:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 deliverOnce:(BOOL)a7 completion:(id)a8;
+ (void)requestImageFromPeopleAlbumForPerson:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 highQualityFormat:(BOOL)a6 completion:(id)a7;
+ (void)requestMeContactForKeys:(id)a3 completionHandler:(id)a4;
+ (void)requestMeContactWithCompletion:(id)a3;
+ (void)requestMonogramForEmailAddress:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 completion:(id)a7;
+ (void)requestMonogramForGivenName:(id)a3 familyName:(id)a4 targetSize:(CGSize)a5 displayScale:(double)a6 isRTL:(BOOL)a7 completion:(id)a8;
+ (void)requestPersonImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 matchingEmail:(id)a6 orPhone:(id)a7 withFirstName:(id)a8 lastName:(id)a9 prefersPhotosImage:(BOOL)a10 withCompletion:(id)a11;
@end

@implementation PXActivityUtilities

uint64_t __100__PXActivityUtilities__requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke_221(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __99__PXActivityUtilities_requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __99__PXActivityUtilities_requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(double *)(a1 + 72);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 81);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__PXActivityUtilities_requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke_2;
  v7[3] = &unk_1E5DD24C0;
  v6 = *(void **)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  objc_msgSend(v6, "_requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v2, v4, v5, v7, *(double *)(a1 + 56), *(double *)(a1 + 64), v3);
}

+ (void)_requestImageForContact:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 deliverOnce:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  double height = a4.height;
  double width = a4.width;
  v56[1] = *MEMORY[0x1E4F143B8];
  v16 = a3;
  id v17 = a8;
  v18 = (void (**)(void, void, void))v17;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 176, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 177, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  uint64_t v19 = *MEMORY[0x1E4F1AF98];
  if (([v16 isKeyAvailable:*MEMORY[0x1E4F1AF98]] & 1) == 0)
  {
    v20 = [v16 identifier];
    id v21 = objc_alloc(MEMORY[0x1E4F1B908]);
    v56[0] = v19;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
    v23 = (void *)[v21 initWithKeysToFetch:v22];

    v24 = (void *)MEMORY[0x1E4F1B8F8];
    v55 = v20;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
    v26 = [v24 predicateForContactsWithIdentifiers:v25];
    [v23 setPredicate:v26];

    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__46229;
    v47 = __Block_byref_object_dispose__46230;
    id v48 = 0;
    v27 = +[PXPeopleUtilities sharedContactStore];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __100__PXActivityUtilities__requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke;
    v42[3] = &unk_1E5DC69F0;
    v42[4] = &v43;
    [v27 enumerateContactsWithFetchRequest:v23 error:0 usingBlock:v42];
    v28 = (void *)v44[5];
    if (v28)
    {
      v29 = v16;
      v16 = v28;
    }
    else
    {
      v29 = PLUIGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v52 = v20;
        __int16 v53 = 2112;
        v54 = v16;
        _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_ERROR, "Contact %{public}@ was missing thumbnail image data key, and refetching contact by identifier for that key returned nil. Attempting with original contact: %@", buf, 0x16u);
      }
    }

    _Block_object_dispose(&v43, 8);
  }
  id v30 = objc_alloc(MEMORY[0x1E4F1BB20]);
  v31 = [MEMORY[0x1E4F1BB28] defaultSettings];
  v32 = (void *)[v30 initWithSettings:v31];

  v33 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:", v10, 0, width, height, a5);
  if (v9)
  {
    v50 = v16;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
    v35 = [v32 avatarImageForContacts:v34 scope:v33];

    ((void (**)(void, void *, void))v18)[2](v18, v35, MEMORY[0x1E4F1CC28]);
  }
  else
  {
    v49 = v16;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __100__PXActivityUtilities__requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke_221;
    v40[3] = &unk_1E5DB3648;
    v41 = v18;
    id v37 = (id)[v32 renderAvatarsForContacts:v36 scope:v33 imageHandler:v40];

    v35 = v41;
  }
}

void __99__PXActivityUtilities_requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PXActivityUtilities_requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke_3;
  block[3] = &unk_1E5DD0E78;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__PXActivityUtilities__requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void __38__PXActivityUtilities_sharedWorkQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.photos.activityUtilities.work", attr);
  uint64_t v2 = (void *)sharedWorkQueue_sharedWorkQueue;
  sharedWorkQueue_sharedWorkQueue = (uint64_t)v1;
}

+ (void)requestImageForContact:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 deliverOnce:(BOOL)a7 completion:(id)a8
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v16 = a3;
  id v17 = a8;
  v18 = v17;
  if (!v16)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 236, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
LABEL_5:
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 237, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v17) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v19 = [a1 sharedWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PXActivityUtilities_requestImageForContact_targetSize_displayScale_isRTL_deliverOnce_completion___block_invoke;
  block[3] = &unk_1E5DB3670;
  id v26 = v18;
  id v27 = a1;
  CGFloat v28 = width;
  CGFloat v29 = height;
  double v30 = a5;
  BOOL v31 = a6;
  BOOL v32 = a7;
  id v25 = v16;
  id v20 = v18;
  id v21 = v16;
  dispatch_async(v19, block);
}

+ (id)sharedWorkQueue
{
  if (sharedWorkQueue_onceToken != -1) {
    dispatch_once(&sharedWorkQueue_onceToken, &__block_literal_global_46244);
  }
  uint64_t v2 = (void *)sharedWorkQueue_sharedWorkQueue;
  return v2;
}

+ (id)_initialsFromGivenName:(id)a3 familyName:(id)a4
{
  uint64_t v5 = _initialsFromGivenName_familyName__onceToken;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&_initialsFromGivenName_familyName__onceToken, &__block_literal_global_240);
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  [v8 setGivenName:v7];

  [v8 setFamilyName:v6];
  id v9 = [(id)_initialsFromGivenName_familyName__formatter stringFromPersonNameComponents:v8];
  if ([(__CFString *)v9 length]) {
    BOOL v10 = v9;
  }
  else {
    BOOL v10 = &stru_1F00B0030;
  }
  id v11 = v10;

  return v11;
}

uint64_t __57__PXActivityUtilities__initialsFromGivenName_familyName___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F38]);
  dispatch_queue_t v1 = (void *)_initialsFromGivenName_familyName__formatter;
  _initialsFromGivenName_familyName__formatter = (uint64_t)v0;

  uint64_t v2 = (void *)_initialsFromGivenName_familyName__formatter;
  return [v2 setStyle:4];
}

+ (id)textForDate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[PXFeedDateFormatter defaultFeedSectionDateFormatter];
  uint64_t v5 = [v4 stringFromDate:v3];

  return v5;
}

+ (void)requestPersonImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 isRTL:(BOOL)a5 matchingEmail:(id)a6 orPhone:(id)a7 withFirstName:(id)a8 lastName:(id)a9 prefersPhotosImage:(BOOL)a10 withCompletion:(id)a11
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a11;
  if (!v25)
  {
    BOOL v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 313, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v26 = [a1 sharedWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke;
  block[3] = &unk_1E5DB3710;
  id v34 = v21;
  id v35 = v22;
  id v36 = v23;
  id v37 = v24;
  BOOL v43 = a10;
  CGFloat v40 = width;
  CGFloat v41 = height;
  double v42 = a4;
  id v38 = v25;
  id v39 = a1;
  BOOL v44 = a5;
  id v27 = v25;
  id v28 = v24;
  id v29 = v23;
  id v30 = v22;
  id v31 = v21;
  dispatch_async(v26, block);
}

void __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1B998] descriptorForRequiredKeys];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v20[0] = v2;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_2;
  v10[3] = &unk_1E5DB36E8;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 56);
  char v18 = *(unsigned char *)(a1 + 104);
  long long v9 = *(_OWORD *)(a1 + 64);
  long long v16 = *(_OWORD *)(a1 + 80);
  uint64_t v17 = *(void *)(a1 + 96);
  id v8 = (id)v9;
  long long v15 = v9;
  char v19 = *(unsigned char *)(a1 + 105);
  +[PXActivityUtilities _requestContactMatchingEmail:v3 orPhone:v4 withFirstName:v5 lastName:v6 keysToFetch:v7 withCompletion:v10];
}

void __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      long long v9 = [v3 identifier];
      *(_DWORD *)buf = 138413314;
      double v42 = v5;
      __int16 v43 = 2112;
      uint64_t v44 = v6;
      __int16 v45 = 2112;
      uint64_t v46 = v7;
      __int16 v47 = 2112;
      uint64_t v48 = v8;
      __int16 v49 = 2112;
      v50 = v9;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "[PXAvatarUtilities] Contact found for email: %@, phone: %@, first: %@, last: %@. Contact identifier: %@", buf, 0x34u);
    }
    BOOL v10 = [v3 identifier];
    id v11 = +[PXPeopleUtilities personWithPersonUri:v10];

    if (v11 && *(unsigned char *)(a1 + 104))
    {
      id v12 = PLUIGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v13 = [v3 identifier];
        *(_DWORD *)buf = 138412290;
        double v42 = v13;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEBUG, "[PXAvatarUtilities] Person found for contact identifier: %@", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 72), "requestImageFromPeopleAlbumForPerson:targetSize:displayScale:highQualityFormat:completion:", v11, 1, *(void *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
    }
    else
    {
      id v14 = PLUIGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        long long v15 = [v3 identifier];
        *(_DWORD *)buf = 138412290;
        double v42 = v15;
        _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_DEBUG, "[PXAvatarUtilities] Requesting contacts image for contact identifier: %@", buf, 0xCu);
      }
      long long v16 = *(void **)(a1 + 72);
      double v17 = *(double *)(a1 + 96);
      uint64_t v18 = *(unsigned __int8 *)(a1 + 105);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_232;
      v38[3] = &unk_1E5DB3698;
      id v39 = v3;
      id v40 = *(id *)(a1 + 64);
      objc_msgSend(v16, "_requestImageForContact:targetSize:displayScale:isRTL:deliverOnce:completion:", v39, v18, 0, v38, *(double *)(a1 + 80), *(double *)(a1 + 88), v17);
    }
  }
  else if ([*(id *)(a1 + 48) length] || objc_msgSend(*(id *)(a1 + 56), "length"))
  {
    char v19 = PLUIGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v20 = *(void **)(a1 + 32);
      uint64_t v21 = *(void *)(a1 + 40);
      uint64_t v22 = *(void *)(a1 + 48);
      uint64_t v23 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138413058;
      double v42 = v20;
      __int16 v43 = 2112;
      uint64_t v44 = v21;
      __int16 v45 = 2112;
      uint64_t v46 = v22;
      __int16 v47 = 2112;
      uint64_t v48 = v23;
      _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEBUG, "[PXAvatarUtilities] Contact not found for email: %@, phone: %@, first: %@, last: %@. Building monogram...", buf, 0x2Au);
    }

    id v24 = *(void **)(a1 + 72);
    id v25 = *(void **)(a1 + 48);
    uint64_t v26 = *(void *)(a1 + 56);
    double v27 = *(double *)(a1 + 96);
    uint64_t v28 = *(unsigned __int8 *)(a1 + 105);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_234;
    v34[3] = &unk_1E5DB36C0;
    id v35 = v25;
    id v36 = *(id *)(a1 + 56);
    id v37 = *(id *)(a1 + 64);
    objc_msgSend(v24, "requestMonogramForGivenName:familyName:targetSize:displayScale:isRTL:completion:", v35, v26, v28, v34, *(double *)(a1 + 80), *(double *)(a1 + 88), v27);

    id v11 = v35;
  }
  else
  {
    id v29 = PLUIGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v29, OS_LOG_TYPE_DEBUG, "[PXAvatarUtilities] No contact found, and no first & last name provided. Creating placeholder monogram...", buf, 2u);
    }

    double v30 = *(double *)(a1 + 96);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_235;
    v32[3] = &unk_1E5DB3648;
    id v31 = *(void **)(a1 + 72);
    id v33 = *(id *)(a1 + 64);
    objc_msgSend(v31, "_requestPlaceholderMonogramWithTargetSize:displayScale:completion:", v32, *(double *)(a1 + 80), *(double *)(a1 + 88), v30);
    id v11 = v33;
  }
}

void __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_232(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(id *)(a1 + 32);
  *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  px_dispatch_on_main_queue();
}

void __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_234(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PLUIGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = a1[4];
    uint64_t v9 = a1[5];
    v10[0] = 67109890;
    v10[1] = v5 != 0;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "[PXAvatarUtilities] Monogram created (%{BOOL}d) for first: %@, last: %@. Is degraded: %@", (uint8_t *)v10, 0x26u);
  }

  (*(void (**)(double, double, double, double))(a1[6] + 16))(*(double *)off_1E5DAB010, *((double *)off_1E5DAB010 + 1), *((double *)off_1E5DAB010 + 2), *((double *)off_1E5DAB010 + 3));
}

void __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_235(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 32);
  id v4 = v3;
  px_dispatch_on_main_queue();
}

uint64_t __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_2_236(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    BOOL v3 = *(void *)(a1 + 32) != 0;
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEBUG, "[PXAvatarUtilities] Placeholder monogram created: %{BOOL}d", (uint8_t *)v5, 8u);
  }

  return (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)off_1E5DAB010, *((double *)off_1E5DAB010 + 1), *((double *)off_1E5DAB010 + 2), *((double *)off_1E5DAB010 + 3));
}

uint64_t __154__PXActivityUtilities_requestPersonImageWithTargetSize_displayScale_isRTL_matchingEmail_orPhone_withFirstName_lastName_prefersPhotosImage_withCompletion___block_invoke_2_233(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLUIGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    BOOL v4 = *(void *)(a1 + 32) != 0;
    id v5 = [*(id *)(a1 + 48) identifier];
    v7[0] = 67109634;
    v7[1] = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    __int16 v11 = v5;
    _os_log_impl(&dword_1A9AE7000, v2, OS_LOG_TYPE_DEBUG, "[PXAvatarUtilities] Contacts image image found = %{BOOL}d (isDegraded: %@) for contact identifier: %@. ", (uint8_t *)v7, 0x1Cu);
  }
  return (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 56) + 16))(*(double *)off_1E5DAB010, *((double *)off_1E5DAB010 + 1), *((double *)off_1E5DAB010 + 2), *((double *)off_1E5DAB010 + 3));
}

+ (void)_requestPlaceholderMonogramWithTargetSize:(CGSize)a3 displayScale:(double)a4 completion:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  __int16 v8 = (objc_class *)MEMORY[0x1E4F1BB20];
  uint64_t v9 = (void (**)(id, void *))a5;
  id v10 = [v8 alloc];
  __int16 v11 = [MEMORY[0x1E4F1BB28] defaultSettings];
  id v14 = (id)[v10 initWithSettings:v11];

  uint64_t v12 = [v14 placeholderImageProvider];
  __int16 v13 = objc_msgSend(v12, "imageForSize:scale:style:", 0, width, height, a4);

  v9[2](v9, v13);
}

+ (void)requestMonogramForGivenName:(id)a3 familyName:(id)a4 targetSize:(CGSize)a5 displayScale:(double)a6 isRTL:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  double height = a5.height;
  double width = a5.width;
  id v16 = a4;
  id v17 = a8;
  id v18 = a3;
  if (![v18 length] && !objc_msgSend(v16, "length"))
  {
    double v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 257, @"Invalid parameter not satisfying: %@", @"givenName.length || familyName.length" object file lineNumber description];

    if (v17) {
      goto LABEL_4;
    }
LABEL_6:
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 258, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

    goto LABEL_4;
  }
  if (!v17) {
    goto LABEL_6;
  }
LABEL_4:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__PXActivityUtilities_requestMonogramForGivenName_familyName_targetSize_displayScale_isRTL_completion___block_invoke;
  aBlock[3] = &unk_1E5DB3648;
  id v30 = v17;
  id v19 = v17;
  id v20 = _Block_copy(aBlock);
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:", v9, 0, width, height, a6);
  id v22 = objc_alloc(MEMORY[0x1E4F1BB20]);
  uint64_t v23 = [MEMORY[0x1E4F1BB28] defaultSettings];
  id v24 = (void *)[v22 initWithSettings:v23];

  id v25 = [a1 _initialsFromGivenName:v18 familyName:v16];

  id v26 = (id)[v24 renderMonogramForString:v25 scope:v21 imageHandler:v20];
}

void __103__PXActivityUtilities_requestMonogramForGivenName_familyName_targetSize_displayScale_isRTL_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(id *)(a1 + 32);
  id v4 = v3;
  px_dispatch_on_main_queue();
}

uint64_t __103__PXActivityUtilities_requestMonogramForGivenName_familyName_targetSize_displayScale_isRTL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

+ (void)requestMonogramForEmailAddress:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 isRTL:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  double height = a4.height;
  double width = a4.width;
  id v17 = a3;
  id v14 = a7;
  if ([v17 length])
  {
    if (v14) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 249, @"Invalid parameter not satisfying: %@", @"emailAddress.length > 0" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 250, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  +[PXActivityUtilities requestMonogramForGivenName:familyName:targetSize:displayScale:isRTL:completion:](PXActivityUtilities, "requestMonogramForGivenName:familyName:targetSize:displayScale:isRTL:completion:", v17, 0, v8, v14, width, height, a5);
}

+ (void)requestImageFromPeopleAlbumForPerson:(id)a3 targetSize:(CGSize)a4 displayScale:(double)a5 highQualityFormat:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  id v15 = a7;
  id v16 = v15;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 159, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];

    if (v16) {
      goto LABEL_3;
    }
  }
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 160, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_3:
  id v17 = -[PXPeopleFaceCropFetchOptions initWithPerson:targetSize:displayScale:]([PXPeopleFaceCropFetchOptions alloc], "initWithPerson:targetSize:displayScale:", v14, width, height, a5);
  id v18 = v17;
  if (v8) {
    [(PXPeopleFaceCropFetchOptions *)v17 setDeliveryMode:1];
  }
  id v19 = +[PXPeopleFaceCropManager sharedManager];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __113__PXActivityUtilities_requestImageFromPeopleAlbumForPerson_targetSize_displayScale_highQualityFormat_completion___block_invoke;
  v23[3] = &unk_1E5DD24E8;
  id v24 = v16;
  id v20 = v16;
  [v19 requestFaceCropForOptions:v18 resultHandler:v23];
}

void __113__PXActivityUtilities_requestImageFromPeopleAlbumForPerson_targetSize_displayScale_highQualityFormat_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(id *)(a1 + 32);
  id v7 = v5;
  id v8 = v6;
  px_dispatch_on_main_queue();
}

void __113__PXActivityUtilities_requestImageFromPeopleAlbumForPerson_targetSize_displayScale_highQualityFormat_completion___block_invoke_2(uint64_t a1)
{
  id v14 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"PXPeopleContentsRectKey"];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48);
  [v14 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)off_1E5DAAFC8];
  __int16 v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"PXPeopleErrorKey"];
  (*(void (**)(uint64_t, uint64_t, void *, void *, double, double, double, double))(v2 + 16))(v2, v3, v12, v13, v5, v7, v9, v11);
}

+ (void)_requestContactMatchingEmail:(id)a3 orPhone:(id)a4 withFirstName:(id)a5 lastName:(id)a6 keysToFetch:(id)a7 withCompletion:(id)a8
{
  v88[2] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  unint64_t v15 = (unint64_t)a5;
  unint64_t v16 = (unint64_t)a6;
  id v17 = a7;
  id v18 = (void (**)(id, void *, id, void *))a8;
  id v19 = +[PXPeopleUtilities sharedContactStore];
  id v20 = [MEMORY[0x1E4F1CA48] arrayWithArray:v17];
  uint64_t v21 = (void *)*MEMORY[0x1E4F1ADC8];
  id v22 = (void *)*MEMORY[0x1E4F1AEE0];
  v88[0] = *MEMORY[0x1E4F1ADC8];
  v88[1] = v22;
  v59 = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:2];
  [v20 addObjectsFromArray:v23];

  if (v15 | v16 && (id v24 = objc_alloc_init(MEMORY[0x1E4F1B910])) != 0)
  {
    v70 = v24;
    [v24 setStyle:0];
    id v25 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
    [v20 addObject:v25];

    char v69 = 0;
  }
  else
  {
    v70 = 0;
    char v69 = 1;
  }
  v71 = v20;
  if (![v13 length])
  {
    id v29 = 0;
    id v31 = 0;
    goto LABEL_29;
  }
  [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v13];
  uint64_t v81 = 0;
  v61 = v65 = v19;
  id v26 = objc_msgSend(v19, "unifiedContactsMatchingPredicate:keysToFetch:error:");
  id v67 = 0;
  if (!v26 && v67)
  {
    double v27 = PLUIGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v85 = v13;
      __int16 v86 = 2112;
      id v87 = v67;
      _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_ERROR, "Error attempting to fetch all unified contacts matching predicate [email=%@] : %@", buf, 0x16u);
    }
  }
  if ([v26 count])
  {
    uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1B8F8], "pl_findBestMatchingContactFromMatchingContacts:firstName:lastName:contactFormatter:", v26, v15, v16, v70);
    if (v28)
    {
      id v53 = v17;
      unint64_t v55 = v15;
      id v29 = v21;
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v30 = [v28 emailAddresses];
      id v31 = (void *)[v30 countByEnumeratingWithState:&v77 objects:v83 count:16];
      if (v31)
      {
        unint64_t v49 = v16;
        id v51 = v29;
        v57 = v18;
        id v63 = v14;
        uint64_t v32 = *(void *)v78;
        while (2)
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(void *)v78 != v32) {
              objc_enumerationMutation(v30);
            }
            id v34 = *(void **)(*((void *)&v77 + 1) + 8 * i);
            id v35 = [v34 value];
            int v36 = [v35 isEqualToString:v13];

            if (v36)
            {
              id v31 = [v34 identifier];
              goto LABEL_25;
            }
          }
          id v31 = (void *)[v30 countByEnumeratingWithState:&v77 objects:v83 count:16];
          if (v31) {
            continue;
          }
          break;
        }
LABEL_25:
        id v14 = v63;
        unint64_t v16 = v49;
        id v29 = v51;
        id v18 = v57;
      }

      id v17 = v53;
      unint64_t v15 = v55;
    }
    else
    {
      id v31 = 0;
      id v29 = 0;
    }
  }
  else
  {
    id v31 = 0;
    id v29 = 0;
    uint64_t v28 = 0;
  }

  id v19 = v65;
  if (!v28)
  {
LABEL_29:
    if (![v14 length])
    {
      uint64_t v28 = 0;
      goto LABEL_53;
    }
    v58 = v18;
    id v64 = v14;
    id v37 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v14];
    [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingPhoneNumber:v37];
    v62 = uint64_t v76 = 0;
    id v38 = objc_msgSend(v19, "unifiedContactsMatchingPredicate:keysToFetch:error:");
    id v68 = 0;
    if (!v38 && v68)
    {
      id v39 = PLUIGetLog();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v85 = v64;
        __int16 v86 = 2112;
        id v87 = v68;
        _os_log_impl(&dword_1A9AE7000, v39, OS_LOG_TYPE_ERROR, "Error attempting to fetch all unified contacts matching predicate [phone=%@] : %@", buf, 0x16u);
      }
    }
    v52 = v38;
    if ([v38 count])
    {
      uint64_t v28 = objc_msgSend(MEMORY[0x1E4F1B8F8], "pl_findBestMatchingContactFromMatchingContacts:firstName:lastName:contactFormatter:", v38, v15, v16, v70);
      if (v28)
      {
        id v54 = v17;
        unint64_t v56 = v15;
        id v40 = v59;

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        CGFloat v41 = [v28 phoneNumbers];
        uint64_t v42 = [v41 countByEnumeratingWithState:&v72 objects:v82 count:16];
        id v14 = v64;
        if (v42)
        {
          uint64_t v43 = v42;
          id v60 = v40;
          v66 = v19;
          unint64_t v50 = v16;
          uint64_t v44 = *(void *)v73;
          while (2)
          {
            for (uint64_t j = 0; j != v43; ++j)
            {
              if (*(void *)v73 != v44) {
                objc_enumerationMutation(v41);
              }
              uint64_t v46 = *(void **)(*((void *)&v72 + 1) + 8 * j);
              __int16 v47 = [v46 value];
              if ([v47 isLikePhoneNumber:v37])
              {
                uint64_t v48 = [v46 identifier];

                id v31 = (void *)v48;
                goto LABEL_50;
              }
            }
            uint64_t v43 = [v41 countByEnumeratingWithState:&v72 objects:v82 count:16];
            if (v43) {
              continue;
            }
            break;
          }
LABEL_50:
          id v14 = v64;
          id v19 = v66;
          unint64_t v16 = v50;
          id v40 = v60;
        }

        id v29 = v40;
        id v17 = v54;
        unint64_t v15 = v56;
        goto LABEL_52;
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    id v14 = v64;
LABEL_52:

    id v18 = v58;
  }
LABEL_53:
  if ((v69 & 1) == 0) {

  }
  if (v18) {
    v18[2](v18, v28, v29, v31);
  }
}

+ (void)requestMeContactForKeys:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 70, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  double v9 = [a1 sharedWorkQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__PXActivityUtilities_requestMeContactForKeys_completionHandler___block_invoke;
  block[3] = &unk_1E5DD3280;
  id v14 = v7;
  id v15 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __65__PXActivityUtilities_requestMeContactForKeys_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[PXPeopleUtilities sharedContactStore];
  uint64_t v3 = *(void *)(a1 + 32);
  id v13 = 0;
  double v4 = [v2 _crossPlatformUnifiedMeContactWithKeysToFetch:v3 error:&v13];
  id v5 = v13;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PXActivityUtilities_requestMeContactForKeys_completionHandler___block_invoke_2;
  v9[3] = &unk_1E5DD0E78;
  id v6 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = v6;
  id v10 = v4;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __65__PXActivityUtilities_requestMeContactForKeys_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)requestMeContactWithCompletion:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"PXActivityUtilities.m", 61, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v7 = *MEMORY[0x1E4F1AEE0];
  v10[0] = *MEMORY[0x1E4F1ADC8];
  v10[1] = v7;
  _DWORD v10[2] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  [a1 requestMeContactForKeys:v8 completionHandler:v5];
}

@end