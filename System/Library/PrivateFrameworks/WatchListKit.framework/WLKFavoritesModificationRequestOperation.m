@interface WLKFavoritesModificationRequestOperation
- (NSString)entityID;
- (WLKFavoritesModificationRequestOperation)initWithAction:(unint64_t)a3 entityId:(id)a4 caller:(id)a5;
- (unint64_t)action;
- (void)processResponse;
@end

@implementation WLKFavoritesModificationRequestOperation

- (WLKFavoritesModificationRequestOperation)initWithAction:(unint64_t)a3 entityId:(id)a4 caller:(id)a5
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        v11 = @"favorites/remove";
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Invalid action provided (%ld)", a3);
        v11 = 0;
      }
    }
    else
    {
      v11 = @"favorites/add";
    }
    v19[0] = @"entityId";
    v19[1] = @"entityType";
    v20[0] = v9;
    v20[1] = @"team";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v14 = +[WLKURLRequestProperties requestPropertiesWithEndpoint:v11 queryParameters:v13 httpMethod:@"POST" caller:v10];
    v18.receiver = self;
    v18.super_class = (Class)WLKFavoritesModificationRequestOperation;
    v15 = [(WLKUTSNetworkRequestOperation *)&v18 initWithRequestProperties:v14];
    v16 = v15;
    if (v15)
    {
      v15->_action = a3;
      objc_storeStrong((id *)&v15->_entityID, a4);
    }
    self = v16;

    v12 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"entity ID is required"];
    v12 = 0;
  }

  return v12;
}

- (void)processResponse
{
  if (WLKIsTVApp())
  {
    v2 = dispatch_get_global_queue(21, 0);
    dispatch_async(v2, &__block_literal_global_52);
  }
}

void __59__WLKFavoritesModificationRequestOperation_processResponse__block_invoke()
{
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  NSLog(&cfstr_Wlkfavoritesmo_0.isa, v4);
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 setObject:v4 forKey:@"WLKFavoritesModificationDate"];

  id v1 = objc_alloc_init(MEMORY[0x1E4F79CE0]);
  v2 = WLKTVAppBundleID();
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:@"WLKFavoritesModificationDate"];
  [v1 synchronizeUserDefaultsDomain:v2 keys:v3];
}

- (unint64_t)action
{
  return self->_action;
}

- (NSString)entityID
{
  return self->_entityID;
}

- (void).cxx_destruct
{
}

@end