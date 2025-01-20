@interface VUIAuthenticationManager
+ (BOOL)_isLibraryOnlyCountry;
+ (BOOL)_isLibraryOnlyCountryResolved;
+ (BOOL)allowsAccountModification;
+ (BOOL)isDemoAccount;
+ (BOOL)isLibraryOnlyCountry;
+ (BOOL)isLibraryOnlyCountryResolved;
+ (BOOL)lightWeightUserHasActiveAccount;
+ (BOOL)userHasActiveAccount;
+ (id)DSID;
+ (id)_profileImage;
+ (id)_userAccount;
+ (id)creditsString;
+ (id)identifier;
+ (id)monogramAvatarForSize:(CGSize)a3 scale:(double)a4 isRTL:(BOOL)a5;
+ (id)sharedInstance;
+ (id)storefrontId;
+ (id)userAccountName;
+ (id)userFirstName;
+ (id)userFullName;
+ (id)userLastName;
+ (id)userProfileImage;
+ (void)_performAuthenticationTask:(id)a3 isSilent:(BOOL)a4 completionHandler:(id)a5;
+ (void)_recordLog:(id)a3 isSignOut:(BOOL)a4 isSilent:(BOOL)a5;
+ (void)requestAuthenticationAlwaysPrompt:(BOOL)a3 withCompletionHandler:(id)a4;
+ (void)signInUserWithAppleID:(id)a3 password:(id)a4 completionHandler:(id)a5;
+ (void)signOutUserWithCompletionHandler:(id)a3;
- (AAUIProfilePictureStore)_profilePictureStore;
- (ACAccount)_activeUserAccount;
- (ACAccount)_localUserAccount;
- (AMSBinaryPromise)_signoutPromise;
- (AMSPromise)_authPromise;
- (BOOL)_isLibraryOnlyCountry;
- (BOOL)_isLibraryOnlyCountryResolved;
- (BOOL)_shouldNotifyAccountChange:(id)a3 newAccount:(id)a4;
- (UIImage)_profileImage;
- (VUIAuthenticationManager)init;
- (void)_accountStoreDidChange:(id)a3;
- (void)_determineIfLibraryOnlyCountry;
- (void)_fetchProfileImage;
- (void)_setUpProfileImageStoreAndFetchProfileImage;
- (void)set_authPromise:(id)a3;
- (void)set_isLibraryOnlyCountry:(BOOL)a3;
- (void)set_isLibraryOnlyCountryResolved:(BOOL)a3;
- (void)set_signoutPromise:(id)a3;
@end

@implementation VUIAuthenticationManager

- (void)_fetchProfileImage
{
  int v3 = WLKIsRegulatedSKU();
  v4 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v5 = objc_msgSend(v4, "ams_activeiCloudAccount");

  v6 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v7 = objc_msgSend(v6, "ams_activeiTunesAccount");

  if (!v3 || v5)
  {
    v12 = [v7 username];
    v13 = [v5 username];
    int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      objc_initWeak(buf, self);
      profilePictureStore = self->__profilePictureStore;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __46__VUIAuthenticationManager__fetchProfileImage__block_invoke;
      v17[3] = &unk_1E6DF5B48;
      objc_copyWeak(&v18, buf);
      [(AAUIProfilePictureStore *)profilePictureStore profilePictureForAccountOwnerWithCompletion:v17];
      objc_destroyWeak(&v18);
      objc_destroyWeak(buf);
    }
    else
    {
      profileImage = self->__profileImage;
      self->__profileImage = 0;
    }
  }
  else
  {
    v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.crop.circle"];
    v9 = self->__profileImage;
    self->__profileImage = v8;

    v10 = VUIDefaultLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: used fallback profile image for China region without iCloud signed in, posting VUIAuthenticationManagerProfileImageDidChangeNotification", (uint8_t *)buf, 2u);
    }

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"VUIAuthenticationManagerProfileImageDidChangeNotification" object:self userInfo:0];
  }
}

+ (id)userAccountName
{
  v2 = [(id)objc_opt_class() _userAccount];
  int v3 = [v2 username];

  return v3;
}

+ (id)DSID
{
  v2 = [(id)objc_opt_class() _userAccount];
  int v3 = objc_msgSend(v2, "ams_DSID");

  return v3;
}

+ (id)storefrontId
{
  int v3 = [(id)objc_opt_class() _userAccount];
  v4 = objc_msgSend(v3, "ams_storefront");
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [a1 sharedInstance];
    v8 = [v7 _localUserAccount];
    objc_msgSend(v8, "ams_storefront");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

+ (id)_userAccount
{
  v2 = [(id)objc_opt_class() sharedInstance];
  int v3 = [v2 _activeUserAccount];
  objc_sync_enter(v3);
  v4 = [v2 _activeUserAccount];
  objc_sync_exit(v3);

  return v4;
}

- (ACAccount)_activeUserAccount
{
  return self->__activeUserAccount;
}

+ (id)sharedInstance
{
  if (sharedInstance_once_0 != -1) {
    dispatch_once(&sharedInstance_once_0, &__block_literal_global_29);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;
  return v2;
}

+ (BOOL)isLibraryOnlyCountry
{
  v2 = objc_opt_class();
  return [v2 _isLibraryOnlyCountry];
}

+ (BOOL)_isLibraryOnlyCountry
{
  v2 = [(id)objc_opt_class() sharedInstance];
  char v3 = [v2 _isLibraryOnlyCountry];

  return v3;
}

- (BOOL)_isLibraryOnlyCountry
{
  return self->__isLibraryOnlyCountry;
}

+ (BOOL)isLibraryOnlyCountryResolved
{
  v2 = objc_opt_class();
  return [v2 _isLibraryOnlyCountryResolved];
}

+ (BOOL)_isLibraryOnlyCountryResolved
{
  v2 = [(id)objc_opt_class() sharedInstance];
  char v3 = [v2 _isLibraryOnlyCountryResolved];

  return v3;
}

- (BOOL)_isLibraryOnlyCountryResolved
{
  return self->__isLibraryOnlyCountryResolved;
}

void __42__VUIAuthenticationManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(VUIAuthenticationManager);
  v1 = (void *)sharedInstance_sharedInstance_2;
  sharedInstance_sharedInstance_2 = (uint64_t)v0;
}

- (VUIAuthenticationManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)VUIAuthenticationManager;
  v2 = [(VUIAuthenticationManager *)&v14 init];
  if (v2)
  {
    char v3 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    uint64_t v4 = objc_msgSend(v3, "ams_activeiTunesAccount");
    activeUserAccount = v2->__activeUserAccount;
    v2->__activeUserAccount = (ACAccount *)v4;

    if (!v2->__activeUserAccount)
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
      uint64_t v7 = objc_msgSend(v6, "ams_localiTunesAccount");
      localUserAccount = v2->__localUserAccount;
      v2->__localUserAccount = (ACAccount *)v7;
    }
    [(VUIAuthenticationManager *)v2 _setUpProfileImageStoreAndFetchProfileImage];
    if ([(id)objc_opt_class() allowsAccountModification])
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:v2 selector:sel__accountStoreDidChange_ name:*MEMORY[0x1E4F178D8] object:0];

      v10 = VUIDefaultLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1E2BD7000, v10, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: added observer to ACDAccountStoreDidChangeNotification", v13, 2u);
      }
    }
    *(_WORD *)&v2->__isLibraryOnlyCountry = 0;
    v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: resolving is library only country", v13, 2u);
    }

    [(VUIAuthenticationManager *)v2 _determineIfLibraryOnlyCountry];
  }
  return v2;
}

- (void)_setUpProfileImageStoreAndFetchProfileImage
{
  char v3 = (AAUIProfilePictureStore *)objc_alloc_init(MEMORY[0x1E4F4C068]);
  profilePictureStore = self->__profilePictureStore;
  self->__profilePictureStore = v3;

  [(VUIAuthenticationManager *)self _fetchProfileImage];
}

- (void)_determineIfLibraryOnlyCountry
{
  self->__isLibraryOnlyCountryResolved = 0;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __58__VUIAuthenticationManager__determineIfLibraryOnlyCountry__block_invoke;
  v2[3] = &unk_1E6DF5B20;
  v2[4] = self;
  [MEMORY[0x1E4FB5180] isFullTVAppEnabledwithCompletion:v2];
}

+ (BOOL)allowsAccountModification
{
  v2 = [MEMORY[0x1E4F31A28] sharedRestrictionsMonitor];
  char v3 = [v2 allowsAccountModification];

  return v3;
}

+ (BOOL)userHasActiveAccount
{
  v2 = [(id)objc_opt_class() _userAccount];
  BOOL v3 = v2 != 0;

  return v3;
}

+ (id)userProfileImage
{
  v2 = objc_opt_class();
  return (id)[v2 _profileImage];
}

+ (id)monogramAvatarForSize:(CGSize)a3 scale:(double)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  v19[1] = *MEMORY[0x1E4F143B8];
  v9 = +[VUIAuthenticationManager userFirstName];
  v10 = +[VUIAuthenticationManager userLastName];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  [v11 setGivenName:v9];
  [v11 setFamilyName:v10];
  id v12 = objc_alloc(MEMORY[0x1E4F1BB20]);
  v13 = [MEMORY[0x1E4F1BB28] defaultSettings];
  objc_super v14 = (void *)[v12 initWithSettings:v13];

  v15 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:", v5, 0, width, height, a4);
  v19[0] = v11;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v17 = [v14 avatarImageForContacts:v16 scope:v15];

  return v17;
}

+ (id)userLastName
{
  v2 = [(id)objc_opt_class() _userAccount];
  BOOL v3 = [v2 accountPropertyForKey:*MEMORY[0x1E4F176D0]];

  return v3;
}

+ (id)userFirstName
{
  v2 = [(id)objc_opt_class() _userAccount];
  BOOL v3 = [v2 accountPropertyForKey:*MEMORY[0x1E4F17690]];

  return v3;
}

+ (id)_profileImage
{
  v2 = [(id)objc_opt_class() sharedInstance];
  BOOL v3 = [v2 _profileImage];

  return v3;
}

- (UIImage)_profileImage
{
  return self->__profileImage;
}

void __58__VUIAuthenticationManager__determineIfLibraryOnlyCountry__block_invoke(uint64_t a1, char a2)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  BOOL v5 = __58__VUIAuthenticationManager__determineIfLibraryOnlyCountry__block_invoke_2;
  id v6 = &unk_1E6DF5330;
  objc_copyWeak(&v7, &location);
  char v8 = a2;
  BOOL v3 = v4;
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v5((uint64_t)v3);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __58__VUIAuthenticationManager__determineIfLibraryOnlyCountry__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[8] = *(unsigned char *)(a1 + 40) ^ 1;
  WeakRetained[9] = 1;
  BOOL v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    BOOL v4 = *(unsigned char *)(a1 + 40) == 0;
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: resolved is library only country to %d", (uint8_t *)v6, 8u);
  }

  BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"VUIAuthenticationManagerIsLibraryOnlyCountryDidChangeNotification" object:WeakRetained userInfo:0];
}

+ (BOOL)lightWeightUserHasActiveAccount
{
  v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  BOOL v3 = objc_msgSend(v2, "ams_activeiTunesAccount");
  BOOL v4 = v3 != 0;

  return v4;
}

+ (id)userFullName
{
  v2 = [(id)objc_opt_class() _userAccount];
  BOOL v3 = [v2 userFullName];

  return v3;
}

+ (id)identifier
{
  v2 = [(id)objc_opt_class() _userAccount];
  BOOL v3 = [v2 identifier];

  return v3;
}

+ (id)creditsString
{
  v2 = [(id)objc_opt_class() _userAccount];
  BOOL v3 = objc_msgSend(v2, "ams_creditsString");

  return v3;
}

+ (BOOL)isDemoAccount
{
  v2 = [(id)objc_opt_class() _userAccount];
  char v3 = objc_msgSend(v2, "ams_isDemoAccount");

  return v3;
}

+ (void)requestAuthenticationAlwaysPrompt:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v16[0] = 67109120;
    v16[1] = v4;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: requestAuthenticationAlwaysPrompt %d", (uint8_t *)v16, 8u);
  }

  id v8 = objc_alloc_init(MEMORY[0x1E4F4DBB0]);
  BOOL v9 = !v4;
  [v8 setAuthenticationType:v9];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F4DBB8]) initWithAccount:0 options:v8];
  id v11 = +[VUIApplicationRouter topMostVisibleViewController];
  if (!v11)
  {
    id v12 = +[VUITVAppLauncher sharedInstance];
    v13 = [v12 appWindow];
    id v11 = [v13 rootViewController];
  }
  objc_super v14 = (void *)[objc_alloc(MEMORY[0x1E4F4DF30]) initWithRequest:v10 presentingViewController:v11];
  v15 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
  [v14 setBag:v15];
  [a1 _performAuthenticationTask:v14 isSilent:v9 completionHandler:v6];
}

+ (void)signInUserWithAppleID:(id)a3 password:(id)a4 completionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = VUIDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    id v19 = v8;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: signInUserWithAppleID %@", (uint8_t *)&v18, 0xCu);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F4DBB0]);
  [v12 setAuthenticationType:0];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F4DBB8]) initWithDSID:0 altDSID:0 username:v8 options:v12];
  objc_super v14 = +[VUIApplicationRouter topMostVisibleViewController];
  if (!v14)
  {
    v15 = +[VUITVAppLauncher sharedInstance];
    v16 = [v15 appWindow];
    objc_super v14 = [v16 rootViewController];
  }
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F4DF30]) initWithRequest:v13 presentingViewController:v14];
  [v17 setRawPassword:v10];

  [a1 _performAuthenticationTask:v17 isSilent:0 completionHandler:v9];
}

+ (void)signOutUserWithCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: sign out", buf, 2u);
  }

  id v6 = [(id)objc_opt_class() _userAccount];
  uint64_t v7 = v6;
  if (v6)
  {
    [v6 setActive:0];
    id v8 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    id v9 = objc_msgSend(v8, "ams_saveAccount:", v7);

    id v10 = [a1 sharedInstance];
    id v11 = [v10 _signoutPromise];

    if (v11) {
      [v11 cancel];
    }
    id v12 = [a1 sharedInstance];
    objc_msgSend(v12, "set_signoutPromise:", v9);

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__VUIAuthenticationManager_signOutUserWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E6DF5AA8;
    id v15 = a1;
    id v14 = v4;
    [v9 addFinishBlock:v13];
  }
  else if (v4)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1, 0);
  }
}

void __61__VUIAuthenticationManager_signOutUserWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v11 = __61__VUIAuthenticationManager_signOutUserWithCompletionHandler___block_invoke_2;
  id v12 = &unk_1E6DF5A80;
  char v15 = a2;
  id v13 = v5;
  long long v9 = *(_OWORD *)(a1 + 32);
  id v6 = (id)v9;
  long long v14 = v9;
  uint64_t v7 = (void *)MEMORY[0x1E4F29060];
  id v8 = v5;
  if ([v7 isMainThread]) {
    v11((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __61__VUIAuthenticationManager_signOutUserWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    v2 = VUIDefaultLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __61__VUIAuthenticationManager_signOutUserWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
    }

    [*(id *)(a1 + 48) _recordLog:*(void *)(a1 + 32) isSignOut:1 isSilent:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

+ (void)_performAuthenticationTask:(id)a3 isSilent:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a5;
  long long v9 = [a3 performAuthentication];
  if (v9)
  {
    id v10 = [a1 sharedInstance];
    id v11 = [v10 _authPromise];

    if (v11 && ([v11 isCancelled] & 1) == 0 && (objc_msgSend(v11, "isFinished") & 1) == 0) {
      [v11 cancel];
    }
    id v12 = [a1 sharedInstance];
    objc_msgSend(v12, "set_authPromise:", v9);

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __82__VUIAuthenticationManager__performAuthenticationTask_isSilent_completionHandler___block_invoke;
    v14[3] = &unk_1E6DF5AF8;
    id v16 = a1;
    BOOL v17 = a4;
    id v15 = v8;
    [v9 addFinishBlock:v14];
  }
  else
  {
    id v13 = VUIDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[VUIAuthenticationManager _performAuthenticationTask:isSilent:completionHandler:](v13);
    }

    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
}

void __82__VUIAuthenticationManager__performAuthenticationTask_isSilent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  id v13 = __82__VUIAuthenticationManager__performAuthenticationTask_isSilent_completionHandler___block_invoke_2;
  long long v14 = &unk_1E6DF5AD0;
  id v15 = v5;
  id v16 = v6;
  char v18 = *(unsigned char *)(a1 + 48);
  long long v11 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v11;
  long long v17 = v11;
  id v8 = (void *)MEMORY[0x1E4F29060];
  id v9 = v6;
  id v10 = v5;
  if ([v8 isMainThread]) {
    v13((uint64_t)block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __82__VUIAuthenticationManager__performAuthenticationTask_isSilent_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (v2
    && ([v2 account], (char v3 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v4 = *(void *)(a1 + 40), v3, !v4))
  {
    uint64_t v5 = 1;
  }
  else
  {
    [*(id *)(a1 + 56) _recordLog:*(void *)(a1 + 40) isSignOut:0 isSilent:*(unsigned __int8 *)(a1 + 64)];
    uint64_t v5 = 0;
  }
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    v9[0] = 67109378;
    v9[1] = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: finished auth with success %d, error: %@", (uint8_t *)v9, 0x12u);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, v5, *(void *)(a1 + 40));
  }
  return result;
}

- (void)_accountStoreDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: _accountStoreDidChange - notification %@", buf, 0xCu);
  }

  id v6 = [v4 userInfo];
  uint64_t v7 = objc_msgSend(v6, "vui_stringForKey:", *MEMORY[0x1E4F17810]);
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F17890]];

  if (v8)
  {
    id v9 = self;
    objc_sync_enter(v9);
    __int16 v10 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
    uint64_t v11 = objc_msgSend(v10, "ams_activeiTunesAccount");

    uint64_t v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: _accountStoreDidChange - changedAccount %@", buf, 0xCu);
    }

    id v13 = [(id)objc_opt_class() _userAccount];
    objc_storeStrong((id *)&v9->__activeUserAccount, v11);
    if ([(VUIAuthenticationManager *)v9 _shouldNotifyAccountChange:v13 newAccount:v11])
    {
      [(VUIAuthenticationManager *)v9 _setUpProfileImageStoreAndFetchProfileImage];

      objc_sync_exit(v9);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      id v15 = __51__VUIAuthenticationManager__accountStoreDidChange___block_invoke;
      id v16 = &unk_1E6DF3D58;
      long long v17 = v9;
      if ([MEMORY[0x1E4F29060] isMainThread]) {
        v15((uint64_t)block);
      }
      else {
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
    else
    {

      objc_sync_exit(v9);
    }
  }
}

void __51__VUIAuthenticationManager__accountStoreDidChange___block_invoke(uint64_t a1)
{
  v2 = VUIDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E2BD7000, v2, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: ACDAccountStoreDidChangeNotification received, posting VUIAuthenticationManagerAccountStoreDidChangeNotification", v4, 2u);
  }

  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"VUIAuthenticationManagerAccountStoreDidChangeNotification" object:*(void *)(a1 + 32) userInfo:0];
}

- (BOOL)_shouldNotifyAccountChange:(id)a3 newAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5 && !v6)
  {
    int v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v18 = 0;
      id v9 = "User logged out";
      __int16 v10 = (uint8_t *)&v18;
LABEL_15:
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v5 && v6)
  {
    int v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = 0;
      id v9 = "User logged in";
      __int16 v10 = (uint8_t *)&v17;
      goto LABEL_15;
    }
LABEL_16:

    BOOL v11 = 1;
    goto LABEL_17;
  }
  BOOL v11 = 0;
  if (v5 && v6)
  {
    uint64_t v12 = [v5 identifier];
    id v13 = [v7 identifier];
    char v14 = [v12 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
      int v8 = VUIDefaultLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = 0;
        id v9 = "Account changed";
        __int16 v10 = (uint8_t *)&v16;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    BOOL v11 = 0;
  }
LABEL_17:

  return v11;
}

void __46__VUIAuthenticationManager__fetchProfileImage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__VUIAuthenticationManager__fetchProfileImage__block_invoke_2;
  v5[3] = &unk_1E6DF5490;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __46__VUIAuthenticationManager__fetchProfileImage__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 7, *(id *)(a1 + 32));
    if (*(void *)(a1 + 32))
    {
      id v4 = VUIDefaultLogObject();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v6[0] = 0;
        _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "VUIAuthenticationManager: recieved profile image, posting VUIAuthenticationManagerProfileImageDidChangeNotification", (uint8_t *)v6, 2u);
      }

      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"VUIAuthenticationManagerProfileImageDidChangeNotification" object:v3 userInfo:0];
    }
  }
}

+ (void)_recordLog:(id)a3 isSignOut:(BOOL)a4 isSilent:(BOOL)a5
{
  v31[4] = *MEMORY[0x1E4F143B8];
  if (a5) {
    id v6 = VUIMetricsLogAuthTypeValueSilentSignIn;
  }
  else {
    id v6 = VUIMetricsLogAuthTypeValueSignIn;
  }
  if (a4) {
    id v6 = VUIMetricsLogAuthTypeValueSignOut;
  }
  id v7 = *v6;
  v31[0] = @"auth task failure";
  v30[0] = @"message";
  v30[1] = @"errorCode";
  int v8 = (void *)MEMORY[0x1E4F28ED0];
  id v9 = a3;
  uint64_t v10 = objc_msgSend(v8, "numberWithLong:", objc_msgSend(v9, "code"));
  BOOL v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (__CFString *)v10;
  }
  else {
    uint64_t v12 = &stru_1F3E921E0;
  }
  v31[1] = v12;
  v30[2] = @"errorDomain";
  uint64_t v13 = [v9 domain];
  char v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = &stru_1F3E921E0;
  }
  v30[3] = @"authType";
  v31[2] = v15;
  v31[3] = v7;
  __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];

  __int16 v17 = objc_msgSend(v9, "ams_underlyingError");

  if (v17)
  {
    v28[0] = @"underlyingErrorCode";
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithLong:", objc_msgSend(v17, "code"));
    id v19 = (void *)v18;
    if (v18) {
      uint64_t v20 = (__CFString *)v18;
    }
    else {
      uint64_t v20 = &stru_1F3E921E0;
    }
    v29[0] = v20;
    v28[1] = @"underlyingErrorDomain";
    uint64_t v21 = [v17 domain];
    v22 = (void *)v21;
    if (v21) {
      v23 = (__CFString *)v21;
    }
    else {
      v23 = &stru_1F3E921E0;
    }
    v29[1] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

    v25 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v16];
    [v25 addEntriesFromDictionary:v24];
    uint64_t v26 = [v25 copy];

    __int16 v16 = (void *)v26;
  }
  v27 = +[VUIMetricsController sharedInstance];
  [v27 recordLog:v16];
}

- (AMSPromise)_authPromise
{
  return self->__authPromise;
}

- (void)set_authPromise:(id)a3
{
}

- (AMSBinaryPromise)_signoutPromise
{
  return self->__signoutPromise;
}

- (void)set_signoutPromise:(id)a3
{
}

- (ACAccount)_localUserAccount
{
  return self->__localUserAccount;
}

- (AAUIProfilePictureStore)_profilePictureStore
{
  return self->__profilePictureStore;
}

- (void)set_isLibraryOnlyCountry:(BOOL)a3
{
  self->__isLibraryOnlyCountry = a3;
}

- (void)set_isLibraryOnlyCountryResolved:(BOOL)a3
{
  self->__isLibraryOnlyCountryResolved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__profileImage, 0);
  objc_storeStrong((id *)&self->__profilePictureStore, 0);
  objc_storeStrong((id *)&self->__localUserAccount, 0);
  objc_storeStrong((id *)&self->__activeUserAccount, 0);
  objc_storeStrong((id *)&self->__signoutPromise, 0);
  objc_storeStrong((id *)&self->__authPromise, 0);
}

void __61__VUIAuthenticationManager_signOutUserWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "VUIAuthenticationManager: failed to sign out %@", (uint8_t *)&v3, 0xCu);
}

+ (void)_performAuthenticationTask:(os_log_t)log isSilent:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E2BD7000, log, OS_LOG_TYPE_ERROR, "VUIAuthenticationManager: failed to create auth promise", v1, 2u);
}

@end