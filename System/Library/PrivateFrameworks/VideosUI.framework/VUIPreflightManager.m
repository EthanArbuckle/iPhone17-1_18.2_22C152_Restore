@interface VUIPreflightManager
+ (id)defaultPreflightManager;
- (BOOL)_isAllowedToPlayOrPurchase;
- (BOOL)_isSportingEvent;
- (BOOL)_isTrailer;
- (BOOL)_shouldShowAgeConfirmationAlert;
- (BOOL)contentAllowsCellularDownload;
- (BOOL)isSubscriptionPurchaseWithoutPlayback;
- (TVPMediaItem)mediaItem;
- (VUIContentRating)contentRating;
- (VUIControllerPresenter)presentingController;
- (VUIExtrasInfo)extrasInfo;
- (VUIMediaEntity)mediaEntity;
- (VUIPreflightManager)init;
- (VUIVideosPlayable)videosPlayable;
- (id)_lastAgeConfirmationPrompted;
- (id)_ratingDomain;
- (id)_ratingValue;
- (id)restrictionsValidationToken;
- (id)savedRestrictionsCompletion;
- (int64_t)_lastConfirmedAge;
- (int64_t)_requiredAgeForPlayback;
- (int64_t)restrictionsState;
- (unint64_t)restrictionsCheckType;
- (void)_isAllowedToPlayOrPurchase;
- (void)_logRatingsInfo:(id)a3 maxAllowedRank:(id)a4 ratingValue:(id)a5;
- (void)_performAgeGateVerificationWithCompletion:(id)a3;
- (void)_performRestrictionsCheckWithCompletion:(id)a3;
- (void)_preflightDownloadWithCompletion:(id)a3;
- (void)_preflightWithOptions:(int64_t)a3 userInfo:(id)a4 completion:(id)a5;
- (void)_promptForHighQualityDownloadsWithCompletion:(id)a3;
- (void)_setLastAgeConfirmationPrompted:(id)a3;
- (void)_setLastConfirmedAge:(int64_t)a3;
- (void)_showAgeConfirmationWithPresentingViewController:(id)a3 completion:(id)a4;
- (void)_showRestrictionsAlertForRatingDomain:(id)a3 completion:(id)a4;
- (void)preflightWithOptions:(int64_t)a3 completion:(id)a4;
- (void)setContentAllowsCellularDownload:(BOOL)a3;
- (void)setContentRating:(id)a3;
- (void)setExtrasInfo:(id)a3;
- (void)setIsSubscriptionPurchaseWithoutPlayback:(BOOL)a3;
- (void)setMediaEntity:(id)a3;
- (void)setMediaItem:(id)a3;
- (void)setPresentingController:(id)a3;
- (void)setRestrictionsCheckType:(unint64_t)a3;
- (void)setRestrictionsState:(int64_t)a3;
- (void)setRestrictionsValidationToken:(id)a3;
- (void)setSavedRestrictionsCompletion:(id)a3;
- (void)setVideosPlayable:(id)a3;
@end

@implementation VUIPreflightManager

+ (id)defaultPreflightManager
{
  if (defaultPreflightManager_onceToken != -1) {
    dispatch_once(&defaultPreflightManager_onceToken, &__block_literal_global_89);
  }
  v2 = (void *)defaultPreflightManager_defaultPreflightManager;
  return v2;
}

void __46__VUIPreflightManager_defaultPreflightManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)defaultPreflightManager_defaultPreflightManager;
  defaultPreflightManager_defaultPreflightManager = v0;
}

- (VUIPreflightManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)VUIPreflightManager;
  result = [(VUIPreflightManager *)&v3 init];
  if (result)
  {
    result->_restrictionsCheckType = 0;
    result->_contentAllowsCellularDownload = 1;
  }
  return result;
}

- (void)setVideosPlayable:(id)a3
{
  v5 = (VUIVideosPlayable *)a3;
  if (self->_videosPlayable != v5)
  {
    objc_storeStrong((id *)&self->_videosPlayable, a3);
    mediaItem = self->_mediaItem;
    self->_mediaItem = 0;

    if (v5)
    {
      v7 = [(VUIVideosPlayable *)v5 metadata];

      if (!v7)
      {
        v8 = VUIDefaultLogObject();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          -[VUIPreflightManager setVideosPlayable:](v5, v8);
        }
      }
      if (sFrequencyOfConfirmation == -1)
      {
        v9 = [(VUIVideosPlayable *)v5 frequencyOfAgeConfirmation];
        v10 = v9;
        if (v9) {
          sFrequencyOfConfirmation = [v9 integerValue];
        }
      }
    }
  }
}

- (void)setMediaItem:(id)a3
{
  v5 = (TVPMediaItem *)a3;
  if (self->_mediaItem != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_mediaItem, a3);
    videosPlayable = self->_videosPlayable;
    self->_videosPlayable = 0;

    v5 = v9;
    if (v9)
    {
      if (sFrequencyOfConfirmation == -1)
      {
        v7 = [(TVPMediaItem *)v9 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9F18]];
        v8 = v7;
        if (v7) {
          sFrequencyOfConfirmation = [v7 integerValue];
        }

        v5 = v9;
      }
    }
  }
}

- (void)preflightWithOptions:(int64_t)a3 completion:(id)a4
{
  id v7 = a4;
  v6 = [(VUIPreflightManager *)self presentingController];

  if (v6)
  {
    [(VUIPreflightManager *)self _preflightWithOptions:a3 userInfo:0 completion:v7];
  }
  else if (v7)
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)setRestrictionsState:(int64_t)a3
{
  if (a3 == 2)
  {
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = 0;
      v6 = "VUIPreflightManager::Setting restrictionsState to VUIRestrictionsStateWaitingForUIDismissal";
      id v7 = (uint8_t *)&v9;
      goto LABEL_12;
    }
  }
  else if (a3 == 1)
  {
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v10 = 0;
      v6 = "VUIPreflightManager::Setting restrictionsState to VUIRestrictionsStatePerformingValidation";
      id v7 = (uint8_t *)&v10;
      goto LABEL_12;
    }
  }
  else if (a3)
  {
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = 0;
      v6 = "VUIPreflightManager::Setting restrictionsState to unknown value";
      id v7 = (uint8_t *)&v8;
      goto LABEL_12;
    }
  }
  else
  {
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = 0;
      v6 = "VUIPreflightManager::Setting restrictionsState to VUIRestrictionsStateIdle";
      id v7 = (uint8_t *)&v11;
LABEL_12:
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }

  self->_restrictionsState = a3;
}

- (void)_preflightWithOptions:(int64_t)a3 userInfo:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  int64_t v40 = a3;
  objc_initWeak(&location, self);
  if (!v8) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke;
  aBlock[3] = &unk_1E6DF90D8;
  objc_copyWeak(&v35, &location);
  id v10 = v9;
  id v34 = v10;
  id v11 = v8;
  id v33 = v11;
  v12 = _Block_copy(aBlock);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_16;
  v26[3] = &unk_1E6DF9100;
  objc_copyWeak(&v31, &location);
  v30 = &v37;
  id v13 = v12;
  id v28 = v13;
  id v14 = v11;
  id v27 = v14;
  id v15 = v10;
  id v29 = v15;
  v16 = _Block_copy(v26);
  v17 = v16;
  uint64_t v18 = v38[3];
  if (v18)
  {
    v20 = v25;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_2;
    v25[3] = &unk_1E6DF3D80;
    v25[4] = v16;
    [(VUIPreflightManager *)self _performRestrictionsCheckWithCompletion:v25];
LABEL_9:
    v19 = (id *)(v20 + 4);
    goto LABEL_10;
  }
  if ((v18 & 2) != 0)
  {
    v20 = v24;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_3;
    v24[3] = &unk_1E6DF3D80;
    v24[4] = v16;
    [(VUIPreflightManager *)self _performAgeGateVerificationWithCompletion:v24];
    goto LABEL_9;
  }
  if ((v18 & 8) != 0)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_4;
    v21[3] = &unk_1E6DF9128;
    id v22 = v14;
    id v23 = v17;
    [(VUIPreflightManager *)self _preflightDownloadWithCompletion:v21];
    v19 = &v22;

LABEL_10:
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v37, 8);
}

void __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v3 = [WeakRetained savedRestrictionsCompletion];

  v4 = VUIDefaultLogObject();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::not resetting params to nil because they will be used for pending restrictions check", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::setting params to nil", (uint8_t *)&v8, 2u);
    }

    [WeakRetained setVideosPlayable:0];
    [WeakRetained setMediaItem:0];
    [WeakRetained setMediaEntity:0];
    [WeakRetained setExtrasInfo:0];
    [WeakRetained setContentRating:0];
    [WeakRetained setIsSubscriptionPurchaseWithoutPlayback:0];
    [WeakRetained setContentAllowsCellularDownload:1];
  }
  if (*(void *)(a1 + 40))
  {
    v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = VUIBoolLogString();
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::finished preflighting with result: %@", (uint8_t *)&v8, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  [WeakRetained setPresentingController:0];
}

void __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_16(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v9 = WeakRetained;
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) &= ~a3;
    uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    if (v7)
    {
      [WeakRetained _preflightWithOptions:v7 userInfo:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
      goto LABEL_7;
    }
    int v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    int v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
LABEL_7:
}

uint64_t __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __65__VUIPreflightManager__preflightWithOptions_userInfo_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  [v6 setObject:v7 forKey:VUIPreflightCellularAllowedKey[0]];

  int v8 = *(void **)(a1 + 32);
  id v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
  [v8 setObject:v9 forKey:VUIPreflightDownloadQualityKey];

  uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v10();
}

- (void)_logRatingsInfo:(id)a3 maxAllowedRank:(id)a4 ratingValue:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x1E4FA9E50];
  if ([v7 isEqualToString:*MEMORY[0x1E4FA9E50]])
  {
    id v11 = VUIDefaultLogObject();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v27 = 138412290;
    uint64_t v28 = v10;
LABEL_7:
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::restriction validation for domain : %@", (uint8_t *)&v27, 0xCu);
    goto LABEL_10;
  }
  uint64_t v12 = *MEMORY[0x1E4FA9E58];
  int v13 = [v7 isEqualToString:*MEMORY[0x1E4FA9E58]];
  id v14 = VUIDefaultLogObject();
  id v11 = v14;
  if (v13)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v27 = 138412290;
    uint64_t v28 = v12;
    goto LABEL_7;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[VUIPreflightManager _logRatingsInfo:maxAllowedRank:ratingValue:]((uint64_t)v7, v11);
  }
LABEL_10:

  id v15 = VUIDefaultLogObject();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (!v16) {
      goto LABEL_16;
    }
    uint64_t v17 = [v9 integerValue];
    int v27 = 134217984;
    uint64_t v28 = v17;
    uint64_t v18 = "VUIPreflightManager::restriction validation with value : %ld";
    v19 = v15;
    uint32_t v20 = 12;
  }
  else
  {
    if (!v16) {
      goto LABEL_16;
    }
    LOWORD(v27) = 0;
    uint64_t v18 = "VUIPreflightManager::no ratingValue for content";
    v19 = v15;
    uint32_t v20 = 2;
  }
  _os_log_impl(&dword_1E2BD7000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v27, v20);
LABEL_16:

  v21 = VUIDefaultLogObject();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v22)
    {
      uint64_t v23 = [v8 integerValue];
      int v27 = 134217984;
      uint64_t v28 = v23;
      v24 = "VUIPreflightManager::restriction validation max allowed rank : %ld";
      v25 = v21;
      uint32_t v26 = 12;
LABEL_21:
      _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v27, v26);
    }
  }
  else if (v22)
  {
    LOWORD(v27) = 0;
    v24 = "VUIPreflightManager::Most permissive restriction";
    v25 = v21;
    uint32_t v26 = 2;
    goto LABEL_21;
  }
}

- (id)_ratingDomain
{
  objc_super v3 = [(VUIPreflightManager *)self mediaItem];

  if (v3)
  {
    v4 = [(VUIPreflightManager *)self mediaItem];
    id v5 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E48]];
LABEL_20:
    id v12 = v5;
    goto LABEL_21;
  }
  v6 = [(VUIPreflightManager *)self videosPlayable];

  if (!v6)
  {
    id v11 = [(VUIPreflightManager *)self extrasInfo];

    if (v11)
    {
      id v12 = (id)*MEMORY[0x1E4FA9E50];
      goto LABEL_22;
    }
    int v13 = [(VUIPreflightManager *)self mediaEntity];
    if (v13)
    {
    }
    else
    {
      id v12 = [(VUIPreflightManager *)self contentRating];

      if (!v12) {
        goto LABEL_22;
      }
    }
    id v14 = [(VUIPreflightManager *)self mediaEntity];
    if (v14)
    {
      id v15 = [(VUIPreflightManager *)self mediaEntity];
      v4 = [v15 contentRating];
    }
    else
    {
      v4 = [(VUIPreflightManager *)self contentRating];
    }

    uint64_t v16 = [v4 ratingSystemKind];
    uint64_t v10 = (id *)MEMORY[0x1E4FA9E58];
    if (v16 != 2) {
      uint64_t v10 = (id *)MEMORY[0x1E4FA9E50];
    }
    goto LABEL_19;
  }
  id v7 = [(VUIPreflightManager *)self videosPlayable];
  id v8 = [v7 metadata];
  v4 = [v8 ratingDomain];

  if ([v4 length])
  {
    int v9 = [v4 isEqualToString:@"Show"];
    uint64_t v10 = (id *)MEMORY[0x1E4FA9E58];
    if (!v9) {
      uint64_t v10 = (id *)MEMORY[0x1E4FA9E50];
    }
LABEL_19:
    id v5 = *v10;
    goto LABEL_20;
  }
  id v12 = 0;
LABEL_21:

LABEL_22:
  return v12;
}

- (BOOL)_isTrailer
{
  objc_super v3 = [(VUIPreflightManager *)self mediaItem];

  if (v3)
  {
    id v5 = [(VUIPreflightManager *)self mediaItem];
    v4 = [v5 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9FB0]];

    LOBYTE(v5) = [v4 isEqualToString:*MEMORY[0x1E4FAA1F0]];
LABEL_5:

    return (char)v5;
  }
  id v5 = [(VUIPreflightManager *)self videosPlayable];

  if (v5)
  {
    v4 = [(VUIPreflightManager *)self videosPlayable];
    v6 = [v4 mediaType];
    LOBYTE(v5) = [v6 isEqualToString:@"Trailer"];

    goto LABEL_5;
  }
  return (char)v5;
}

- (BOOL)_isSportingEvent
{
  uint64_t v3 = [(VUIPreflightManager *)self mediaItem];
  if (v3)
  {
    v4 = (void *)v3;
    id v5 = [(VUIPreflightManager *)self mediaItem];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = [(VUIPreflightManager *)self mediaItem];
      LOBYTE(v8) = [v7 isSportingEvent];
LABEL_6:

      return (char)v8;
    }
  }
  id v8 = [(VUIPreflightManager *)self videosPlayable];

  if (v8)
  {
    id v7 = [(VUIPreflightManager *)self videosPlayable];
    int v9 = [v7 mediaType];
    LOBYTE(v8) = [v9 isEqualToString:@"SportingEvent"];

    goto LABEL_6;
  }
  return (char)v8;
}

- (id)_ratingValue
{
  uint64_t v3 = [(VUIPreflightManager *)self mediaItem];

  if (v3)
  {
    v4 = [(VUIPreflightManager *)self mediaItem];
    uint64_t v5 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FA9E60]];
LABEL_3:
    v6 = (void *)v5;
LABEL_6:

    goto LABEL_7;
  }
  id v7 = [(VUIPreflightManager *)self videosPlayable];

  if (v7)
  {
    v4 = [(VUIPreflightManager *)self videosPlayable];
    id v8 = [v4 metadata];
    v6 = [v8 ratingValue];

    goto LABEL_6;
  }
  uint64_t v10 = [(VUIPreflightManager *)self extrasInfo];

  if (v10)
  {
    v4 = [(VUIPreflightManager *)self extrasInfo];
    uint64_t v5 = [v4 contentRating];
    goto LABEL_3;
  }
  id v11 = [(VUIPreflightManager *)self mediaEntity];
  if (v11)
  {

LABEL_15:
    id v12 = [(VUIPreflightManager *)self mediaEntity];
    if (v12)
    {
      int v13 = [(VUIPreflightManager *)self mediaEntity];
      v4 = [v13 contentRating];
    }
    else
    {
      v4 = [(VUIPreflightManager *)self contentRating];
    }

    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLong:", objc_msgSend(v4, "rank"));
    goto LABEL_3;
  }
  v6 = [(VUIPreflightManager *)self contentRating];

  if (v6) {
    goto LABEL_15;
  }
LABEL_7:
  return v6;
}

- (void)_performRestrictionsCheckWithCompletion:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::will perform restrictions check", buf, 2u);
  }

  if (v4)
  {
    if ([(VUIPreflightManager *)self _isSportingEvent])
    {
      v6 = VUIDefaultLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::isSportingEvent – skipping validation", v8, 2u);
      }
    }
    else if (![(VUIPreflightManager *)self _isAllowedToPlayOrPurchase])
    {
      id v7 = [(VUIPreflightManager *)self _ratingDomain];
      [(VUIPreflightManager *)self _showRestrictionsAlertForRatingDomain:v7 completion:v4];

      goto LABEL_11;
    }
    v4[2](v4, 1);
  }
LABEL_11:
}

- (void)_showRestrictionsAlertForRatingDomain:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager::media is not allowed by restrictions, showing alert.", buf, 2u);
  }

  if ([(VUIPreflightManager *)self _isTrailer])
  {
    int v9 = @"TRANSACTION_RESTRICTED_TRAILER";
  }
  else
  {
    int v9 = @"TRANSACTION_RESTRICTED_MOVIE";
    if ([v6 length] && objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E4FA9E58])) {
      int v9 = @"TRANSACTION_RESTRICTED_TVSHOW";
    }
  }
  if ([(VUIPreflightManager *)self restrictionsCheckType] == 1)
  {
    int v9 = @"DOWNLOAD_RESTRICTED_TVSHOW";
    if ([v6 length])
    {
      if ([v6 isEqualToString:*MEMORY[0x1E4FA9E50]]) {
        int v9 = @"DOWNLOAD_RESTRICTED_MOVIE";
      }
    }
  }
  uint64_t v10 = +[VUILocalizationManager sharedInstance];
  id v11 = [v10 localizedStringForKey:v9];
  id v12 = +[VUIAlertController vui_alertControllerWithTitle:0 message:v11 preferredStyle:1];

  int v13 = +[VUILocalizationManager sharedInstance];
  id v14 = [v13 localizedStringForKey:@"SETTINGS"];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __72__VUIPreflightManager__showRestrictionsAlertForRatingDomain_completion___block_invoke;
  v27[3] = &unk_1E6DF9150;
  id v15 = v7;
  id v28 = v15;
  uint64_t v16 = +[VUIAlertAction vui_actionWithTitle:v14 style:0 handler:v27];
  objc_msgSend(v12, "vui_addAction:", v16);

  uint64_t v17 = +[VUILocalizationManager sharedInstance];
  uint64_t v18 = [v17 localizedStringForKey:@"OK"];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __72__VUIPreflightManager__showRestrictionsAlertForRatingDomain_completion___block_invoke_2;
  v25 = &unk_1E6DF9150;
  id v26 = v15;
  id v19 = v15;
  uint32_t v20 = +[VUIAlertAction vui_actionWithTitle:v18 style:0 handler:&v22];
  objc_msgSend(v12, "vui_addAction:", v20, v22, v23, v24, v25);

  v21 = [(VUIPreflightManager *)self presentingController];
  objc_msgSend(v12, "vui_presentAlertFromPresentingController:animated:completion:", v21, 1, 0);
}

void __72__VUIPreflightManager__showRestrictionsAlertForRatingDomain_completion___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=SCREEN_TIME&path=CONTENT_PRIVACY"];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v2 openSensitiveURL:v4 withOptions:0];

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

uint64_t __72__VUIPreflightManager__showRestrictionsAlertForRatingDomain_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (BOOL)_isAllowedToPlayOrPurchase
{
  uint64_t v3 = [(VUIPreflightManager *)self _ratingDomain];
  id v4 = [(VUIPreflightManager *)self _ratingValue];
  if ([v3 length])
  {
    if ([v3 isEqualToString:*MEMORY[0x1E4FA9E50]])
    {
      uint64_t v5 = +[VUISettingsManager sharedInstance];
      id v6 = [v5 maxMovieRank];
    }
    else
    {
      id v6 = 0;
    }
    if ([v3 isEqualToString:*MEMORY[0x1E4FA9E58]])
    {
      uint64_t v17 = +[VUISettingsManager sharedInstance];
      uint64_t v18 = [v17 maxTVShowRank];

      id v6 = (void *)v18;
    }
    [(VUIPreflightManager *)self _logRatingsInfo:v3 maxAllowedRank:v6 ratingValue:v4];
    uint64_t v19 = [v4 integerValue];
    uint64_t v20 = [v6 integerValue];
    BOOL v22 = v19 > 0 && v20 >= v19;
    if (v4) {
      BOOL v23 = v22;
    }
    else {
      BOOL v23 = 0;
    }
    if (v6) {
      id v15 = v6;
    }
    else {
      id v15 = 0;
    }
    if (v6) {
      BOOL v16 = v23;
    }
    else {
      BOOL v16 = 1;
    }
  }
  else
  {
    id v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(VUIPreflightManager *)v7 _isAllowedToPlayOrPurchase];
    }

    id v15 = 0;
    BOOL v16 = 1;
  }

  return v16;
}

- (int64_t)_requiredAgeForPlayback
{
  uint64_t v3 = [(VUIPreflightManager *)self mediaItem];

  if (v3)
  {
    id v4 = [(VUIPreflightManager *)self mediaItem];
    uint64_t v5 = [v4 mediaItemMetadataForProperty:*MEMORY[0x1E4FAA030]];
  }
  else
  {
    id v6 = [(VUIPreflightManager *)self videosPlayable];

    if (!v6) {
      return -1;
    }
    id v4 = [(VUIPreflightManager *)self videosPlayable];
    uint64_t v5 = [v4 requiredAgeForPlayback];
  }
  id v7 = (void *)v5;

  if (v7)
  {
    int64_t v8 = [v7 integerValue];

    return v8;
  }
  return -1;
}

- (void)_performAgeGateVerificationWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[VUIAgeVerification sharedInstance];
  int v6 = [v5 isAgeVerificationEnabled];

  if (v6)
  {
    id v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "VUIPreflightManager:: isAgeVerificationEnabled=YES. Calling VUIAgeVerification", (uint8_t *)buf, 2u);
    }

    int64_t v8 = +[VUIAgeVerification sharedInstance];
    uint64_t v9 = [(VUIPreflightManager *)self _ratingValue];
    uint64_t v10 = [(VUIPreflightManager *)self _ratingDomain];
    [v8 performAgeGateVerificationWithRatingValue:v9 ratingDomain:v10 completion:v4];
  }
  else if ([(VUIPreflightManager *)self _shouldShowAgeConfirmationAlert])
  {
    objc_initWeak(buf, self);
    uint64_t v11 = [(VUIPreflightManager *)self presentingController];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __65__VUIPreflightManager__performAgeGateVerificationWithCompletion___block_invoke;
    v12[3] = &unk_1E6DF4428;
    objc_copyWeak(&v14, buf);
    id v13 = v4;
    [(VUIPreflightManager *)self _showAgeConfirmationWithPresentingViewController:v11 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(buf);
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
}

void __65__VUIPreflightManager__performAgeGateVerificationWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
  {
    uint64_t v4 = [WeakRetained _requiredAgeForPlayback];
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    [WeakRetained _setLastAgeConfirmationPrompted:v5];

    [WeakRetained _setLastConfirmedAge:v4];
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, a2);
  }
}

- (int64_t)_lastConfirmedAge
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int64_t v3 = [v2 integerForKey:@"lastConfirmedAge"];

  return v3;
}

- (void)_setLastConfirmedAge:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setInteger:a3 forKey:@"lastConfirmedAge"];
}

- (id)_lastAgeConfirmationPrompted
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int64_t v3 = [v2 objectForKey:@"ageConfirmationLastPrompted"];

  return v3;
}

- (void)_setLastAgeConfirmationPrompted:(id)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F1CB18];
  id v4 = a3;
  id v5 = [v3 standardUserDefaults];
  [v5 setObject:v4 forKey:@"ageConfirmationLastPrompted"];
}

- (BOOL)_shouldShowAgeConfirmationAlert
{
  if ([(VUIPreflightManager *)self _isTrailer]) {
    return 0;
  }
  uint64_t v3 = [(VUIPreflightManager *)self _requiredAgeForPlayback];
  if (v3 < 1) {
    return 0;
  }
  int64_t v4 = v3;
  int64_t v5 = [(VUIPreflightManager *)self _lastConfirmedAge];
  uint64_t v6 = [(VUIPreflightManager *)self _lastAgeConfirmationPrompted];
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:v6];
  if (v6) {
    BOOL v10 = sFrequencyOfConfirmation < (uint64_t)(v8 / 60.0) || v4 > v5;
  }
  else {
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_showAgeConfirmationWithPresentingViewController:(id)a3 completion:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(VUIPreflightManager *)self _requiredAgeForPlayback];
  id v7 = NSString;
  double v8 = +[VUILocalizationManager sharedInstance];
  uint64_t v9 = [v8 localizedStringForKey:@"AGE_GATE_CONFIRMATION_MESSAGE"];
  BOOL v10 = objc_msgSend(v7, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, @"%d %d", 0, v6, v6);

  uint64_t v11 = +[VUIAlertController vui_alertControllerWithTitle:0 message:v10 preferredStyle:1];
  uint64_t v12 = +[VUILocalizationManager sharedInstance];
  id v13 = [v12 localizedStringForKey:@"YES"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __83__VUIPreflightManager__showAgeConfirmationWithPresentingViewController_completion___block_invoke;
  v23[3] = &unk_1E6DF9150;
  id v14 = v5;
  id v24 = v14;
  id v15 = +[VUIAlertAction vui_actionWithTitle:v13 style:0 handler:v23];
  objc_msgSend(v11, "vui_addAction:", v15);

  BOOL v16 = +[VUILocalizationManager sharedInstance];
  uint64_t v17 = [v16 localizedStringForKey:@"NO"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __83__VUIPreflightManager__showAgeConfirmationWithPresentingViewController_completion___block_invoke_2;
  v21[3] = &unk_1E6DF9150;
  id v22 = v14;
  id v18 = v14;
  uint64_t v19 = +[VUIAlertAction vui_actionWithTitle:v17 style:1 handler:v21];
  objc_msgSend(v11, "vui_addAction:", v19);

  uint64_t v20 = [(VUIPreflightManager *)self presentingController];
  objc_msgSend(v11, "vui_presentAlertFromPresentingController:animated:completion:", v20, 1, 0);
}

uint64_t __83__VUIPreflightManager__showAgeConfirmationWithPresentingViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t __83__VUIPreflightManager__showAgeConfirmationWithPresentingViewController_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_preflightDownloadWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke;
  aBlock[3] = &unk_1E6DF4D78;
  objc_copyWeak(&v15, &location);
  id v5 = v4;
  id v14 = v5;
  int64_t v6 = _Block_copy(aBlock);
  if (+[VUIAuthenticationManager userHasActiveAccount])
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_107;
    v11[3] = &unk_1E6DF3DD0;
    id v12 = v6;
    [(VUIPreflightManager *)self _promptForHighQualityDownloadsWithCompletion:v11];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_2_108;
    v7[3] = &unk_1E6DF9178;
    objc_copyWeak(&v10, &location);
    id v8 = v6;
    id v9 = v5;
    +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:1 withCompletionHandler:v7];

    objc_destroyWeak(&v10);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [MEMORY[0x1E4FB8618] sharedMonitor];
  uint64_t v4 = [v3 networkType];

  if (ICEnvironmentNetworkTypeIsCellular())
  {
    id v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Network type is cellular", buf, 2u);
    }

    if ([WeakRetained contentAllowsCellularDownload])
    {
      int64_t v6 = +[VUIPlaybackSettings sharedSettings];
      int v7 = [v6 cellularDataDownloadEnabled];

      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        id v9 = +[VUIPlaybackSettings sharedSettings];
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, 1, 1, [v9 preferredCellularDownloadQuality]);
      }
      else
      {
        int v41 = MGGetBoolAnswer();
        v42 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
        id v9 = [v42 localizedStringForKey:@"ASK_TO_USE_CELLULAR_DATA_FOR_DOWNLOADS_MESSAGE_TITLE" value:0 table:@"VideosUIEmbedded"];

        v43 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
        v44 = v43;
        if (v41) {
          v45 = @"ASK_TO_USE_CELLULAR_DATA_FOR_DOWNLOADS_MESSAGE_WLAN";
        }
        else {
          v45 = @"ASK_TO_USE_CELLULAR_DATA_FOR_DOWNLOADS_MESSAGE_WIFI";
        }
        v63 = [v43 localizedStringForKey:v45 value:0 table:@"VideosUIEmbedded"];

        v46 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
        v62 = [v46 localizedStringForKey:@"ALWAYS_USE_CELLULAR_DATA_FOR_DOWNLOADS_BUTTON_TITLE" value:0 table:@"VideosUIEmbedded"];

        v47 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
        v48 = [v47 localizedStringForKey:@"USE_CELLULAR_DATA_JUST_FOR_THIS_DOWNLOAD_BUTTON_TITLE" value:0 table:@"VideosUIEmbedded"];

        v49 = objc_msgSend(MEMORY[0x1E4F28B50], "vui_videosUIBundle");
        v50 = [v49 localizedStringForKey:@"DONT_USE_CELLULAR_DATA_FOR_DOWNLOADS_BUTTON_TITLE" value:0 table:@"VideosUIEmbedded"];

        v70[0] = MEMORY[0x1E4F143A8];
        v70[1] = 3221225472;
        v70[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_92;
        v70[3] = &unk_1E6DF9150;
        id v71 = *(id *)(a1 + 32);
        v51 = +[VUIAlertAction vui_actionWithTitle:v62 style:0 handler:v70];
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_2;
        v68[3] = &unk_1E6DF9150;
        id v69 = *(id *)(a1 + 32);
        v52 = +[VUIAlertAction vui_actionWithTitle:v48 style:0 handler:v68];
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_3;
        v66[3] = &unk_1E6DF9150;
        id v67 = *(id *)(a1 + 32);
        v53 = +[VUIAlertAction vui_actionWithTitle:v50 style:0 handler:v66];
        v54 = +[VUIAlertController vui_alertControllerWithTitle:v9 message:v63 preferredStyle:1];
        objc_msgSend(v54, "vui_addAction:isPreferred:", v51, 1);
        objc_msgSend(v54, "vui_addAction:", v52);
        objc_msgSend(v54, "vui_addAction:", v53);
        v55 = [WeakRetained presentingController];
        objc_msgSend(v54, "vui_presentAlertFromPresentingController:animated:completion:", v55, 1, 0);
      }
    }
    else
    {
      uint64_t v19 = VUIDefaultLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
      }

      char v27 = MGGetBoolAnswer();
      id v28 = +[VUILocalizationManager sharedInstance];
      uint64_t v29 = v28;
      if (v27)
      {
        id v9 = [v28 localizedStringForKey:@"CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WLAN_TITLE"];

        v30 = +[VUILocalizationManager sharedInstance];
        id v31 = v30;
        v32 = @"CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WLAN_MESSAGE";
      }
      else
      {
        id v9 = [v28 localizedStringForKey:@"CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WIFI_TITLE"];

        v30 = +[VUILocalizationManager sharedInstance];
        id v31 = v30;
        v32 = @"CANT_DOWNLOAD_NO_NETWORK_CONNECT_TO_WIFI_MESSAGE";
      }
      v56 = [v30 localizedStringForKey:v32];

      v57 = +[VUIAlertController vui_alertControllerWithTitle:v9 message:v56 preferredStyle:1];
      v58 = +[VUILocalizationManager sharedInstance];
      v59 = [v58 localizedStringForKey:@"OK"];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_105;
      v64[3] = &unk_1E6DF9150;
      id v65 = *(id *)(a1 + 32);
      v60 = +[VUIAlertAction vui_actionWithTitle:v59 style:0 handler:v64];

      objc_msgSend(v57, "vui_addAction:", v60);
      v61 = [WeakRetained presentingController];
      objc_msgSend(v57, "vui_presentAlertFromPresentingController:animated:completion:", v61, 1, 0);
    }
  }
  else
  {
    id v10 = VUIDefaultLogObject();
    uint64_t v11 = v10;
    if (v4)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "Network type is non-cellular", buf, 2u);
      }

      id v12 = +[VUIPlaybackSettings sharedSettings];
      uint64_t v13 = [v12 cellularDataDownloadEnabled];

      if (v13)
      {
        id v14 = +[VUIPlaybackSettings sharedSettings];
        uint64_t v15 = [v14 preferredWifiDownloadQuality];

        BOOL v16 = +[VUIPlaybackSettings sharedSettings];
        uint64_t v17 = [v16 preferredCellularDownloadQuality];

        if (v15 == v17 || (uint64_t v13 = 0, v15 == 1) && !v17) {
          uint64_t v13 = 1;
        }
      }
      uint64_t v18 = *(void *)(a1 + 32);
      id v9 = +[VUIPlaybackSettings sharedSettings];
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(v18, 1, v13, [v9 preferredWifiDownloadQuality]);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_cold_2(v11, v33, v34, v35, v36, v37, v38, v39);
      }

      uint64_t v40 = *(void *)(a1 + 32);
      id v9 = +[VUIPlaybackSettings sharedSettings];
      (*(void (**)(uint64_t, void, void, uint64_t))(v40 + 16))(v40, 0, 0, [v9 preferredWifiDownloadQuality]);
    }
  }
}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_92(uint64_t a1)
{
  v2 = +[VUIPlaybackSettings sharedSettings];
  [v2 setCellularDataDownloadEnabled:1];

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = +[VUIPlaybackSettings sharedSettings];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 16))(v3, 1, 1, [v4 preferredCellularDownloadQuality]);
}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[VUIPlaybackSettings sharedSettings];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v1 + 16))(v1, 1, 1, [v2 preferredCellularDownloadQuality]);
}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[VUIPlaybackSettings sharedSettings];
  (*(void (**)(uint64_t, void, void, uint64_t))(v1 + 16))(v1, 0, 0, [v2 preferredCellularDownloadQuality]);
}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_105(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[VUIPlaybackSettings sharedSettings];
  (*(void (**)(uint64_t, void, void, uint64_t))(v1 + 16))(v1, 0, 0, [v2 preferredCellularDownloadQuality]);
}

uint64_t __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_107(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_2_108(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_3_109;
    v8[3] = &unk_1E6DF3DD0;
    id v9 = *(id *)(a1 + 32);
    [WeakRetained _promptForHighQualityDownloadsWithCompletion:v8];

    id v4 = v9;
  }
  else
  {
    id v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "Not starting download since user was unable to sign in", v7, 2u);
    }

    uint64_t v6 = *(void *)(a1 + 40);
    id v4 = +[VUIPlaybackSettings sharedSettings];
    (*(void (**)(uint64_t, void, void, uint64_t))(v6 + 16))(v6, 0, 0, [v4 preferredCellularDownloadQuality]);
  }
}

uint64_t __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_3_109(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_promptForHighQualityDownloadsWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (VUIVideosPlayable)videosPlayable
{
  return self->_videosPlayable;
}

- (TVPMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (VUIMediaEntity)mediaEntity
{
  return self->_mediaEntity;
}

- (void)setMediaEntity:(id)a3
{
}

- (VUIExtrasInfo)extrasInfo
{
  return self->_extrasInfo;
}

- (void)setExtrasInfo:(id)a3
{
}

- (VUIContentRating)contentRating
{
  return self->_contentRating;
}

- (void)setContentRating:(id)a3
{
}

- (BOOL)contentAllowsCellularDownload
{
  return self->_contentAllowsCellularDownload;
}

- (void)setContentAllowsCellularDownload:(BOOL)a3
{
  self->_contentAllowsCellularDownload = a3;
}

- (unint64_t)restrictionsCheckType
{
  return self->_restrictionsCheckType;
}

- (void)setRestrictionsCheckType:(unint64_t)a3
{
  self->_restrictionsCheckType = a3;
}

- (VUIControllerPresenter)presentingController
{
  return self->_presentingController;
}

- (void)setPresentingController:(id)a3
{
}

- (BOOL)isSubscriptionPurchaseWithoutPlayback
{
  return self->_isSubscriptionPurchaseWithoutPlayback;
}

- (void)setIsSubscriptionPurchaseWithoutPlayback:(BOOL)a3
{
  self->_isSubscriptionPurchaseWithoutPlayback = a3;
}

- (id)savedRestrictionsCompletion
{
  return self->_savedRestrictionsCompletion;
}

- (void)setSavedRestrictionsCompletion:(id)a3
{
}

- (int64_t)restrictionsState
{
  return self->_restrictionsState;
}

- (id)restrictionsValidationToken
{
  return self->_restrictionsValidationToken;
}

- (void)setRestrictionsValidationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_restrictionsValidationToken, 0);
  objc_storeStrong(&self->_savedRestrictionsCompletion, 0);
  objc_storeStrong((id *)&self->_presentingController, 0);
  objc_storeStrong((id *)&self->_contentRating, 0);
  objc_storeStrong((id *)&self->_extrasInfo, 0);
  objc_storeStrong((id *)&self->_mediaEntity, 0);
  objc_storeStrong((id *)&self->_mediaItem, 0);
  objc_storeStrong((id *)&self->_videosPlayable, 0);
}

- (void)setVideosPlayable:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 canonicalID];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIPreflightManager::videosPlayable missing metadata for ratings preflight for canonicalId %@", (uint8_t *)&v4, 0xCu);
}

- (void)_logRatingsInfo:(uint64_t)a1 maxAllowedRank:(NSObject *)a2 ratingValue:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIPreflightManager:: unrecognized rating domain %@", (uint8_t *)&v2, 0xCu);
}

- (void)_isAllowedToPlayOrPurchase
{
}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__VUIPreflightManager__preflightDownloadWithCompletion___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end