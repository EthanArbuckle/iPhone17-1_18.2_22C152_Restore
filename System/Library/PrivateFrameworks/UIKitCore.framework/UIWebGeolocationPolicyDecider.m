@interface UIWebGeolocationPolicyDecider
+ (id)sharedPolicyDecider;
+ (void)initialize;
- (BOOL)_getAuthorizationStatusForToken:(id)a3 userVisibleDomain:(id)a4 requestingURL:(id)a5 promptInfo:(id *)a6;
- (BOOL)_isAuthorizationDate:(id)a3 inclusivelyBetweenDate:(id)a4 andDate:(id)a5;
- (BOOL)getAuthorizationStatusForOrigin:(id)a3 requestingURL:(id)a4 promptInfo:(id *)a5;
- (UIWebGeolocationPolicyDecider)init;
- (id)_siteFile;
- (id)_siteFileInContainerDirectory:(id)a3 creatingIntermediateDirectoriesIfNecessary:(BOOL)a4;
- (int64_t)_getChallengeCountFromHistoryForToken:(id)a3 requestingURL:(id)a4;
- (void)_addChallengeCount:(int64_t)a3 forToken:(id)a4 requestingURL:(id)a5;
- (void)_decidePolicyForGeolocationRequestFromOrigin:(id)a3 requestingURL:(id)a4 view:(id)a5 listener:(id)a6;
- (void)_executeNextChallenge;
- (void)_load;
- (void)_save;
- (void)clearAllCaches;
- (void)clearAuthorizationForDomain:(id)a3;
- (void)clearAuthorizationsAddedBetween:(id)a3 and:(id)a4;
- (void)clearCache;
- (void)clearSafariCache;
- (void)dealloc;
- (void)decidePolicyForGeolocationRequestFromOrigin:(id)a3 requestingURL:(id)a4 view:(id)a5 listener:(id)a6;
- (void)didAuthorizeGeolocationForPromptInfo:(id)a3;
- (void)didDenyGeolocationForPromptInfo:(id)a3;
- (void)webView:(id)a3 decidePolicyForGeolocationRequestFromOrigin:(id)a4 frame:(id)a5 listener:(id)a6;
@end

@implementation UIWebGeolocationPolicyDecider

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = dispatch_queue_create("com.apple.UIKit.webGeolocationCacheFileAccessQueue", 0);
    webGeolocationCacheFileAccessQueue = (uint64_t)v2;
    global_queue = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v2, global_queue);
  }
}

+ (id)sharedPolicyDecider
{
  id result = (id)sharedPolicyDecider_policyDecider;
  if (!sharedPolicyDecider_policyDecider)
  {
    id result = objc_alloc_init(UIWebGeolocationPolicyDecider);
    sharedPolicyDecider_policyDecider = (uint64_t)result;
  }
  return result;
}

- (UIWebGeolocationPolicyDecider)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIWebGeolocationPolicyDecider;
  v2 = [(UIWebGeolocationPolicyDecider *)&v5 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)clearGeolocationCache, @"com.apple.locationd.appreset", 0, CFNotificationSuspensionBehaviorCoalesce);
    v2->_challenges = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2->_activeChallenges = (NSMapTable *)(id)[MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.locationd.appreset", 0);

  v4.receiver = self;
  v4.super_class = (Class)UIWebGeolocationPolicyDecider;
  [(UIWebGeolocationPolicyDecider *)&v4 dealloc];
}

- (id)_siteFileInContainerDirectory:(id)a3 creatingIntermediateDirectoriesIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v5 = (void *)[a3 stringByAppendingPathComponent:@"Library/WebKit"];
  if (v4) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v5, 0);
  }
  return (id)[v5 stringByAppendingPathComponent:@"GeolocationSites.plist"];
}

- (id)_siteFile
{
  id result = (id)_siteFile_sSiteFile;
  if (!_siteFile_sSiteFile)
  {
    id result = [(UIWebGeolocationPolicyDecider *)self _siteFileInContainerDirectory:NSHomeDirectory() creatingIntermediateDirectoriesIfNecessary:1];
    _siteFile_sSiteFile = (uint64_t)result;
  }
  return result;
}

- (void)_load
{
  if (!self->_sites)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__UIWebGeolocationPolicyDecider__load__block_invoke;
    block[3] = &unk_1E52DC580;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)webGeolocationCacheFileAccessQueue, block);
  }
}

id __38__UIWebGeolocationPolicyDecider__load__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithContentsOfFile:options:error:", objc_msgSend(*(id *)(a1 + 32), "_siteFile"), 1, 0);
  if (v1)
  {
    uint64_t v21 = 200;
    uint64_t v22 = 0;
    v2 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:v1 options:0 format:&v21 error:&v22];
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id result = (id)[v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
    id v5 = result;
    if (result)
    {
      uint64_t v6 = *(void *)v18;
      unint64_t v7 = 0x1E4F1C000uLL;
      do
      {
        v8 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v2);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v8);
          v10 = (void *)[v2 objectForKey:v9];
          v11 = (void *)[v10 objectForKey:@"ChallengeDate"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v3 setObject:v10 forKey:v9];
          }
          else
          {
            unint64_t v12 = v7;
            v13 = *(void **)(v7 + 2504);
            [v11 doubleValue];
            uint64_t v14 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");
            v23[0] = @"ChallengeCount";
            unint64_t v7 = v12;
            uint64_t v15 = objc_msgSend(v10, "objectForKey:");
            v23[1] = @"ChallengeDate";
            v24[0] = v15;
            v24[1] = v14;
            objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, v23, 2), v9);
          }
          v8 = (char *)v8 + 1;
        }
        while (v5 != v8);
        id result = (id)[v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
        id v5 = result;
      }
      while (result);
    }
  }
  else
  {
    id result = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v3 = result;
  }
  *(void *)(*(void *)(a1 + 32) + 8) = v3;
  return result;
}

- (void)_save
{
  if ([(NSMutableDictionary *)self->_sites count])
  {
    uint64_t v7 = 0;
    uint64_t v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:self->_sites format:200 options:0 error:&v7];
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = [(UIWebGeolocationPolicyDecider *)self _siteFile];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __38__UIWebGeolocationPolicyDecider__save__block_invoke;
      block[3] = &unk_1E52EBA80;
      block[4] = v4;
      void block[5] = v5;
      dispatch_async((dispatch_queue_t)webGeolocationCacheFileAccessQueue, block);
    }
  }
}

uint64_t __38__UIWebGeolocationPolicyDecider__save__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeToFile:*(void *)(a1 + 40) atomically:1];
}

- (void)clearCache
{
  self->_sites = 0;
  id v3 = [(UIWebGeolocationPolicyDecider *)self _siteFile];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__UIWebGeolocationPolicyDecider_clearCache__block_invoke;
  block[3] = &unk_1E52DC580;
  block[4] = v3;
  dispatch_async((dispatch_queue_t)webGeolocationCacheFileAccessQueue, block);
}

uint64_t __43__UIWebGeolocationPolicyDecider_clearCache__block_invoke(uint64_t a1)
{
  v2 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_web_removeFileOnlyAtPath:", v3);
}

- (void)clearSafariCache
{
  id v5 = 0;
  uint64_t v3 = (void *)[MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:@"com.apple.mobilesafari" allowPlaceholder:0 error:&v5];
  if (v5)
  {
    NSLog(&cfstr_UnableToClearT.isa, [v5 localizedDescription]);
  }
  else
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(v3, "dataContainerURL"), "path");
    if (v4) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "_web_removeFileOnlyAtPath:", -[UIWebGeolocationPolicyDecider _siteFileInContainerDirectory:creatingIntermediateDirectoriesIfNecessary:](self, "_siteFileInContainerDirectory:creatingIntermediateDirectoriesIfNecessary:", v4, 0));
    }
    else {
      NSLog(&cfstr_UnableToClearT_0.isa);
    }
  }
}

- (void)clearAllCaches
{
  uint64_t v3 = UIApp;
  uint64_t v4 = [(id)UIApp _beginBackgroundTaskWithName:@"com.apple.UIKit.ClearAllGeolocationPolicyCaches" expirationHandler:&__block_literal_global_682];
  [(UIWebGeolocationPolicyDecider *)self clearCache];
  id v5 = (void *)[MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:CPSharedResourcesDirectory()];
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__UIWebGeolocationPolicyDecider_clearAllCaches__block_invoke_2;
  v10[3] = &unk_1E5311420;
  v10[4] = v6;
  v10[5] = v7;
  [v5 enumerateBundlesOfType:1 block:v10];
  global_queue = dispatch_get_global_queue(-2, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__UIWebGeolocationPolicyDecider_clearAllCaches__block_invoke_3;
  v9[3] = &unk_1E5311448;
  v9[4] = v7;
  v9[5] = self;
  v9[6] = v3;
  v9[7] = v4;
  dispatch_async(global_queue, v9);
}

void __47__UIWebGeolocationPolicyDecider_clearAllCaches__block_invoke()
{
}

uint64_t __47__UIWebGeolocationPolicyDecider_clearAllCaches__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 dataContainerURL];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t result = [(id)result isEqual:*(void *)(a1 + 32)];
    if ((result & 1) == 0)
    {
      id v5 = *(void **)(a1 + 40);
      return [v5 addObject:v4];
    }
  }
  return result;
}

uint64_t __47__UIWebGeolocationPolicyDecider_clearAllCaches__block_invoke_3(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(v2, "_web_removeFileOnlyAtPath:", objc_msgSend(*(id *)(a1 + 40), "_siteFileInContainerDirectory:creatingIntermediateDirectoriesIfNecessary:", objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "path"), 0));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  return [*(id *)(a1 + 48) _endBackgroundTask:*(void *)(a1 + 56)];
}

- (BOOL)_isAuthorizationDate:(id)a3 inclusivelyBetweenDate:(id)a4 andDate:(id)a5
{
  uint64_t v7 = objc_msgSend(a4, "compare:");
  uint64_t v8 = [a3 compare:a5];
  return v7 <= 0 && v8 < 1 || (v7 | v8) >= 0;
}

- (void)clearAuthorizationForDomain:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [NSString stringWithFormat:@"www.%@", a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_sites allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:", v11), "host");
        if (([v12 isEqualToString:a3] & 1) != 0
          || [v12 isEqualToString:v5])
        {
          [(NSMutableDictionary *)self->_sites removeObjectForKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  [(UIWebGeolocationPolicyDecider *)self _save];
}

- (void)clearAuthorizationsAddedBetween:(id)a3 and:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (NSMutableDictionary *)[(NSMutableDictionary *)self->_sites mutableCopy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = (void *)[(NSMutableDictionary *)v7 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (-[UIWebGeolocationPolicyDecider _isAuthorizationDate:inclusivelyBetweenDate:andDate:](self, "_isAuthorizationDate:inclusivelyBetweenDate:andDate:", objc_msgSend((id)-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v13), "objectForKey:", @"ChallengeDate"), a3, a4))
        {
          [(NSMutableDictionary *)v7 removeObjectForKey:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  self->_sites = v7;
  [(UIWebGeolocationPolicyDecider *)self _save];
}

- (int64_t)_getChallengeCountFromHistoryForToken:(id)a3 requestingURL:(id)a4
{
  uint64_t v5 = [(NSMutableDictionary *)self->_sites objectForKey:a3];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (void *)v5;
  if (objc_msgSend((id)objc_msgSend(a4, "scheme"), "isEqualToString:", @"data")) {
    return 0;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"ChallengeDate"), "dateByAddingTimeInterval:", 86400.0);
  if (objc_msgSend(v7, "compare:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date")) == -1) {
    return 0;
  }
  uint64_t v8 = (void *)[v6 objectForKey:@"ChallengeCount"];
  return [v8 integerValue];
}

- (void)_addChallengeCount:(int64_t)a3 forToken:(id)a4 requestingURL:(id)a5
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int64_t v8 = [(UIWebGeolocationPolicyDecider *)self _getChallengeCountFromHistoryForToken:a4 requestingURL:a5];
  v9[0] = @"ChallengeCount";
  v9[1] = @"ChallengeDate";
  v10[0] = [NSNumber numberWithInteger:v8 + a3];
  v10[1] = [MEMORY[0x1E4F1C9C8] date];
  -[NSMutableDictionary setObject:forKey:](self->_sites, "setObject:forKey:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2], a4);
  [(UIWebGeolocationPolicyDecider *)self _save];
}

- (void)_executeNextChallenge
{
  if ([(NSMutableArray *)self->_challenges count] && ![(NSMapTable *)self->_activeChallenges count])
  {
    id v3 = (id)[(NSMutableArray *)self->_challenges objectAtIndex:0];
    [(NSMutableArray *)self->_challenges removeObjectAtIndex:0];
    id v11 = 0;
    BOOL v4 = -[UIWebGeolocationPolicyDecider _getAuthorizationStatusForToken:userVisibleDomain:requestingURL:promptInfo:](self, "_getAuthorizationStatusForToken:userVisibleDomain:requestingURL:promptInfo:", [v3 token], objc_msgSend(v3, "userVisibleDomain"), objc_msgSend(v3, "requestingURL"), &v11);
    if (v11)
    {
      uint64_t v5 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", [v11 objectForKeyedSubscript:@"title"], 0, 1);
      [(UIAlertController *)v5 _setTitleMaximumLineCount:0];
      [(NSMapTable *)self->_activeChallenges setObject:v3 forKey:v5];
      uint64_t v6 = [v11 objectForKeyedSubscript:@"denyButtonTitle"];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__UIWebGeolocationPolicyDecider__executeNextChallenge__block_invoke;
      void v10[3] = &unk_1E5311470;
      v10[4] = self;
      v10[5] = v5;
      [(UIAlertController *)v5 addAction:+[UIAlertAction actionWithTitle:v6 style:1 handler:v10]];
      uint64_t v7 = [v11 objectForKeyedSubscript:@"allowButtonTitle"];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      void v9[2] = __54__UIWebGeolocationPolicyDecider__executeNextChallenge__block_invoke_2;
      v9[3] = &unk_1E5311470;
      v9[4] = self;
      v9[5] = v5;
      [(UIAlertController *)v5 addAction:+[UIAlertAction actionWithTitle:v7 style:0 handler:v9]];
      objc_msgSend(+[UIViewController _viewControllerForFullScreenPresentationFromView:](UIViewController, "_viewControllerForFullScreenPresentationFromView:", objc_msgSend(v3, "view")), "presentViewController:animated:completion:", v5, 1, 0);
    }
    else
    {
      int64_t v8 = (void *)[v3 listener];
      if (v4) {
        [v8 allow];
      }
      else {
        [v8 deny];
      }
    }
  }
}

void *__54__UIWebGeolocationPolicyDecider__executeNextChallenge__block_invoke(uint64_t a1)
{
  uint64_t result = (void *)[*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  if (result)
  {
    id v3 = result;
    objc_msgSend((id)objc_msgSend(result, "listener"), "deny");
    objc_msgSend(*(id *)(a1 + 32), "_addChallengeCount:forToken:requestingURL:", -1, objc_msgSend(v3, "token"), objc_msgSend(v3, "requestingURL"));
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
    return (void *)[v5 removeObjectForKey:v4];
  }
  return result;
}

void *__54__UIWebGeolocationPolicyDecider__executeNextChallenge__block_invoke_2(uint64_t a1)
{
  uint64_t result = (void *)[*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  if (result)
  {
    id v3 = result;
    objc_msgSend((id)objc_msgSend(result, "listener"), "allow");
    objc_msgSend(*(id *)(a1 + 32), "_addChallengeCount:forToken:requestingURL:", 1, objc_msgSend(v3, "token"), objc_msgSend(v3, "requestingURL"));
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 24);
    return (void *)[v5 removeObjectForKey:v4];
  }
  return result;
}

- (void)_decidePolicyForGeolocationRequestFromOrigin:(id)a3 requestingURL:(id)a4 view:(id)a5 listener:(id)a6
{
  id v11 = objc_alloc_init(_UIWebGeolocationChallengeData);
  if ([a4 isFileURL]) {
    uint64_t v12 = [a4 path];
  }
  else {
    uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "host"), "_web_decodeHostName");
  }
  [(_UIWebGeolocationChallengeData *)v11 setUserVisibleDomain:v12];
  [(_UIWebGeolocationChallengeData *)v11 setToken:getToken(a3, a4)];
  [(_UIWebGeolocationChallengeData *)v11 setRequestingURL:a4];
  [(_UIWebGeolocationChallengeData *)v11 setView:a5];
  [(_UIWebGeolocationChallengeData *)v11 setListener:a6];
  [(NSMutableArray *)self->_challenges addObject:v11];
  [(UIWebGeolocationPolicyDecider *)self _executeNextChallenge];
}

- (BOOL)getAuthorizationStatusForOrigin:(id)a3 requestingURL:(id)a4 promptInfo:(id *)a5
{
  uint64_t Token = getToken(a3, a4);
  if ([a4 isFileURL]) {
    uint64_t v10 = [a4 path];
  }
  else {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "host"), "_web_decodeHostName");
  }
  return [(UIWebGeolocationPolicyDecider *)self _getAuthorizationStatusForToken:Token userVisibleDomain:v10 requestingURL:a4 promptInfo:a5];
}

- (BOOL)_getAuthorizationStatusForToken:(id)a3 userVisibleDomain:(id)a4 requestingURL:(id)a5 promptInfo:(id *)a6
{
  v19[4] = *MEMORY[0x1E4F143B8];
  [(UIWebGeolocationPolicyDecider *)self _load];
  int64_t v11 = [(UIWebGeolocationPolicyDecider *)self _getChallengeCountFromHistoryForToken:a3 requestingURL:a5];
  uint64_t v12 = v11;
  if (a6 && (unint64_t)(v11 - 2) >= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v13 = [NSString stringWithFormat:_UINSLocalizedStringWithDefaultValue(@"“%@” Would Like To Use Your Current Location", @"“%@” Would Like To Use Your Current Location", a4];
    id v14 = _UINSLocalizedStringWithDefaultValue(@"Don’t Allow", @"Don’t Allow");
    v18[0] = @"title";
    v18[1] = @"allowButtonTitle";
    v19[0] = v13;
    v19[1] = [_UIKitBundle() localizedStringForKey:@"OK (Geolocation)" value:@"OK" table:@"Localizable"];
    v18[2] = @"denyButtonTitle";
    v18[3] = @"token";
    v19[2] = v14;
    v19[3] = a3;
    long long v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v19, v18, 4), "mutableCopy");
    long long v16 = v15;
    if (a5) {
      [v15 setObject:a5 forKeyedSubscript:@"requestingURL"];
    }
    *a6 = (id)[v16 copy];
  }
  return v12 > 1;
}

- (void)webView:(id)a3 decidePolicyForGeolocationRequestFromOrigin:(id)a4 frame:(id)a5 listener:(id)a6
{
  if (objc_msgSend(a6, "shouldClearCache", a3)) {
    [(UIWebGeolocationPolicyDecider *)self clearCache];
  }
  uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a5, "dataSource"), "request"), "URL");
  id v11 = +[UIWebBrowserView getUIWebBrowserViewForWebFrame:a5];
  [(UIWebGeolocationPolicyDecider *)self _decidePolicyForGeolocationRequestFromOrigin:a4 requestingURL:v10 view:v11 listener:a6];
}

- (void)decidePolicyForGeolocationRequestFromOrigin:(id)a3 requestingURL:(id)a4 view:(id)a5 listener:(id)a6
{
  if ([a6 shouldClearCache]) {
    [(UIWebGeolocationPolicyDecider *)self clearCache];
  }
  [(UIWebGeolocationPolicyDecider *)self _decidePolicyForGeolocationRequestFromOrigin:a3 requestingURL:a4 view:a5 listener:a6];
}

- (void)didAuthorizeGeolocationForPromptInfo:(id)a3
{
  uint64_t v5 = [a3 objectForKeyedSubscript:@"token"];
  uint64_t v6 = [a3 objectForKeyedSubscript:@"requestingURL"];
  [(UIWebGeolocationPolicyDecider *)self _addChallengeCount:1 forToken:v5 requestingURL:v6];
}

- (void)didDenyGeolocationForPromptInfo:(id)a3
{
  uint64_t v5 = [a3 objectForKeyedSubscript:@"token"];
  uint64_t v6 = [a3 objectForKeyedSubscript:@"requestingURL"];
  [(UIWebGeolocationPolicyDecider *)self _addChallengeCount:-1 forToken:v5 requestingURL:v6];
}

@end