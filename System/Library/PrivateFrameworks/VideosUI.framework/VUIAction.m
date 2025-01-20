@interface VUIAction
+ (id)actionWithDictionary:(id)a3 appContext:(id)a4;
- (BOOL)isAccountRequired;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
@end

@implementation VUIAction

+ (id)actionWithDictionary:(id)a3 appContext:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = objc_msgSend(v6, "vui_stringForKey:", @"actionRef");
  v8 = objc_msgSend(v6, "vui_dictionaryForKey:", @"contextData");

  if (!v7)
  {
    v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      uint64_t v19 = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "VUIApplicationAction: Unknown action type %@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_17;
  }
  if (([v7 isEqualToString:@"actionRefBuy"] & 1) == 0
    && ([v7 isEqualToString:@"actionRefGet"] & 1) == 0
    && ([v7 isEqualToString:@"actionRefPreorder"] & 1) == 0
    && ([v7 isEqualToString:@"actionRefRent"] & 1) == 0
    && ([v7 isEqualToString:@"actionRefRentWatchNow"] & 1) == 0
    && ([v7 isEqualToString:@"actionRefComplete"] & 1) == 0
    && ([v7 isEqualToString:@"actionRefUpdate"] & 1) == 0
    && ![v7 isEqualToString:@"actionRefSubscribe"])
  {
    if (([v7 isEqualToString:@"actionRefPlay"] & 1) != 0
      || [v7 isEqualToString:@"actionRefRedownload"])
    {
      if (!v5)
      {
        v11 = VUIDefaultLogObject();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      v13 = VUIActionPlay;
      goto LABEL_26;
    }
    if ([v7 isEqualToString:@"actionRefPlaylist"])
    {
      if (!v5)
      {
        v11 = VUIDefaultLogObject();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      v13 = VUIActionPlaylist;
      goto LABEL_26;
    }
    if ([v7 isEqualToString:@"actionRefAppPunchout"])
    {
      v13 = VUIActionAppPunchout;
      goto LABEL_26;
    }
    if ([v7 isEqualToString:@"actionRefPunchout"])
    {
      v13 = VUIActionPunchout;
      goto LABEL_26;
    }
    if ([v7 isEqualToString:@"actionRefPromise"])
    {
      if (!v5)
      {
        v11 = VUIDefaultLogObject();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          goto LABEL_17;
        }
        goto LABEL_16;
      }
      v13 = VUIActionPromise;
      goto LABEL_26;
    }
    if ([v7 isEqualToString:@"actionRefItunesExtras"]) {
      goto LABEL_18;
    }
    if ([v7 isEqualToString:@"actionRefShareMediaItem"])
    {
      v9 = [[VUIActionShareSheet alloc] initWithContextData:v8 sourceView:0];
      goto LABEL_12;
    }
    if ([v7 isEqualToString:@"actionRefUpdateUpNext"])
    {
      v14 = VUIActionUpdateUpNext;
      goto LABEL_50;
    }
    if ([v7 isEqualToString:@"actionRefMarkAsWatched"])
    {
      v14 = VUIActionMarkedAsWatched;
      goto LABEL_50;
    }
    if ([v7 isEqualToString:@"actionRefRemoveFromPlayHistory"])
    {
      v15 = [VUIActionRemoveFromPlayHistory alloc];
      v16 = v8;
      uint64_t v17 = 0;
    }
    else
    {
      if (![v7 isEqualToString:@"actionRefClearFromPlayHistory"])
      {
        if ([v7 isEqualToString:@"actionRefUpdateMusic"])
        {
          v14 = VUIActionUpdateMusic;
        }
        else
        {
          if ([v7 isEqualToString:@"actionRefAlert"])
          {
            if (v5)
            {
              v9 = [[VUIActionAlert alloc] initWithContextData:v8 appContext:v5 controllerClass:objc_opt_class()];
              goto LABEL_12;
            }
            v11 = VUIDefaultLogObject();
            if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
              goto LABEL_17;
            }
            goto LABEL_16;
          }
          if ([v7 isEqualToString:@"actionRefLocationPrompt"])
          {
            v13 = VUIActionLocationPrompt;
            goto LABEL_26;
          }
          if (![v7 isEqualToString:@"actionRefUpdateSportsFavorite"])
          {
            if ([v7 isEqualToString:@"actionRefGdprProceed"])
            {
              if (!v5)
              {
                v11 = VUIDefaultLogObject();
                if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_17;
                }
                goto LABEL_16;
              }
              v13 = VUIActionTypeGDPR;
            }
            else
            {
              if ([v7 isEqualToString:@"actionRefSystemSettings"])
              {
                v14 = VUIActionSystemSettings;
                goto LABEL_50;
              }
              if ([v7 isEqualToString:@"actionRefARQLPreview"])
              {
                v14 = VUIActionARQLPreview;
                goto LABEL_50;
              }
              if ([v7 isEqualToString:@"actionRefBundleOffer"])
              {
                v13 = VUIActionBundleOffer;
                goto LABEL_26;
              }
              if ([v7 isEqualToString:@"actionRefActivateCarrierOffer"])
              {
                v14 = VUIActionActivateCarrierOffer;
                goto LABEL_50;
              }
              if ([v7 isEqualToString:@"actionRefLeaveGroupSession"])
              {
                v9 = objc_alloc_init(VUIActionLeaveGroupSession);
                goto LABEL_12;
              }
              if ([v7 isEqualToString:@"actionRefSearchRAC"])
              {
                v14 = VUIActionSearchRAC;
                goto LABEL_50;
              }
              if (![v7 isEqualToString:@"actionRefOpenWebLink"]) {
                goto LABEL_18;
              }
              if (!v5)
              {
                v11 = VUIDefaultLogObject();
                if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_17;
                }
                goto LABEL_16;
              }
              v13 = VUIActionOpenWebLink;
            }
LABEL_26:
            v9 = (VUIActionShareSheet *)[[v13 alloc] initWithContextData:v8 appContext:v5];
            goto LABEL_12;
          }
          v14 = VUIActionUpdateSportsFavorite;
        }
LABEL_50:
        v9 = (VUIActionShareSheet *)[[v14 alloc] initWithContextData:v8];
        goto LABEL_12;
      }
      v15 = [VUIActionRemoveFromPlayHistory alloc];
      v16 = v8;
      uint64_t v17 = 1;
    }
    v9 = [(VUIActionRemoveFromPlayHistory *)v15 initWithContextData:v16 isContinueWatching:v17];
    goto LABEL_12;
  }
  if (v5)
  {
    v9 = [[VUIActionCommerceTransaction alloc] initWithActionRef:v7 contextData:v8 appContext:v5];
LABEL_12:
    v10 = v9;
    goto LABEL_19;
  }
  v11 = VUIDefaultLogObject();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    goto LABEL_17;
  }
LABEL_16:
  +[VUIAction actionWithDictionary:appContext:]();
LABEL_17:

LABEL_18:
  v10 = 0;
LABEL_19:

  return v10;
}

- (BOOL)isAccountRequired
{
  return 0;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
}

+ (void)actionWithDictionary:appContext:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_4(&dword_1E2BD7000, v0, v1, "VUIApplicationAction: AppContext is nil for action type %@", v2, v3, v4, v5, v6);
}

@end