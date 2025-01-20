@interface REUIDonatedElementProperties
+ (BOOL)supportsSecureCoding;
+ (void)createWithDonatedAction:(id)a3 completion:(id)a4;
- (BOOL)_hasLocalExtensionForIntentExecution;
- (BOOL)_isMusicDonation;
- (BOOL)_isPodcastsDonation;
- (BOOL)displayAppName;
- (BOOL)isBeginWorkoutDonation;
- (BOOL)isEndWorkoutDonation;
- (BOOL)isLocalDonation;
- (BOOL)isMediaDonation;
- (BOOL)isRunWorkflowDonation;
- (BOOL)isWorkoutDonation;
- (BOOL)requiresRemoteExecution;
- (BOOL)supportsBackgroundExecution;
- (BOOL)supportsLocalIntentExecution;
- (INIntent)intent;
- (INInteraction)interaction;
- (INRelevantShortcut)relevantShortcut;
- (NSString)appName;
- (NSString)bodyImageCompositingFilter;
- (NSString)bundleIdentifier;
- (NSString)localBundleIdentifier;
- (NSString)remoteBundleIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (NSUserActivity)userActivity;
- (REUIDonatedElementProperties)initWithCoder:(id)a3;
- (UIImage)appIcon;
- (UIImage)bodyImage;
- (UIImage)fullsizeAppIcon;
- (UIImage)monochromeBodyImage;
- (id)_placeholderImageNameForBundleID:(id)a3;
- (id)_scaleImageForDisplay:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)actionIdentifier;
- (unint64_t)donationType;
- (void)_loadAppContentPropertiesWithCompletion:(id)a3;
- (void)_loadContentForIntent:(id)a3 completion:(id)a4;
- (void)_loadContentForRelevantShortcut:(id)a3 completion:(id)a4;
- (void)_loadContentForUserActivity:(id)a3 completion:(id)a4;
- (void)_loadContentForUserActivityOnShortcut:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)loadForAction:(id)a3 completion:(id)a4;
@end

@implementation REUIDonatedElementProperties

+ (void)createWithDonatedAction:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__REUIDonatedElementProperties_createWithDonatedAction_completion___block_invoke;
  v10[3] = &unk_2644B7D40;
  id v11 = v7;
  id v12 = v5;
  id v8 = v7;
  id v9 = v5;
  [v8 loadForAction:v6 completion:v10];
}

uint64_t __67__REUIDonatedElementProperties_createWithDonatedAction_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[REUIDonatedElementProperties allocWithZone:](REUIDonatedElementProperties, "allocWithZone:") init];
  uint64_t v6 = [(REUIDonatedElementProperties *)self bundleIdentifier];
  bundleIdentifier = v5->_bundleIdentifier;
  v5->_bundleIdentifier = (NSString *)v6;

  uint64_t v8 = [(REUIDonatedElementProperties *)self remoteBundleIdentifier];
  remoteBundleIdentifier = v5->_remoteBundleIdentifier;
  v5->_remoteBundleIdentifier = (NSString *)v8;

  uint64_t v10 = [(REUIDonatedElementProperties *)self localBundleIdentifier];
  localBundleIdentifier = v5->_localBundleIdentifier;
  v5->_localBundleIdentifier = (NSString *)v10;

  v5->_donationType = [(REUIDonatedElementProperties *)self donationType];
  v5->_localDonation = [(REUIDonatedElementProperties *)self isLocalDonation];
  v5->_actionIdentifier = [(REUIDonatedElementProperties *)self actionIdentifier];
  uint64_t v12 = [(NSString *)self->_appName copyWithZone:a3];
  appName = v5->_appName;
  v5->_appName = (NSString *)v12;

  objc_storeStrong((id *)&v5->_appIcon, self->_appIcon);
  objc_storeStrong((id *)&v5->_fullsizeAppIcon, self->_fullsizeAppIcon);
  uint64_t v14 = [(NSString *)self->_title copyWithZone:a3];
  title = v5->_title;
  v5->_title = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_subtitle copyWithZone:a3];
  subtitle = v5->_subtitle;
  v5->_subtitle = (NSString *)v16;

  objc_storeStrong((id *)&v5->_bodyImage, self->_bodyImage);
  objc_storeStrong((id *)&v5->_userActivity, self->_userActivity);
  uint64_t v18 = [(INIntent *)self->_intent copyWithZone:a3];
  intent = v5->_intent;
  v5->_intent = (INIntent *)v18;

  uint64_t v20 = [(INRelevantShortcut *)self->_relevantShortcut copyWithZone:a3];
  relevantShortcut = v5->_relevantShortcut;
  v5->_relevantShortcut = (INRelevantShortcut *)v20;

  v5->_displayAppName = self->_displayAppName;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REUIDonatedElementProperties)initWithCoder:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)REUIDonatedElementProperties;
  id v5 = [(REUIDonatedElementProperties *)&v40 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_bundleIdentifier);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = objc_opt_class();
    id v11 = NSStringFromSelector(sel_remoteBundleIdentifier);
    uint64_t v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    remoteBundleIdentifier = v5->_remoteBundleIdentifier;
    v5->_remoteBundleIdentifier = (NSString *)v12;

    uint64_t v14 = objc_opt_class();
    v15 = NSStringFromSelector(sel_localBundleIdentifier);
    uint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];
    localBundleIdentifier = v5->_localBundleIdentifier;
    v5->_localBundleIdentifier = (NSString *)v16;

    uint64_t v18 = NSStringFromSelector(sel_donationType);
    v5->_donationType = [v4 decodeIntegerForKey:v18];

    v19 = NSStringFromSelector(sel_isLocalDonation);
    v5->_localDonation = [v4 decodeBoolForKey:v19];

    uint64_t v20 = NSStringFromSelector(sel_actionIdentifier);
    v5->_actionIdentifier = [v4 decodeInt64ForKey:v20];

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appName"];
    appName = v5->_appName;
    v5->_appName = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appIcon"];
    appIcon = v5->_appIcon;
    v5->_appIcon = (UIImage *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullsizeAppIcon"];
    fullsizeAppIcon = v5->_fullsizeAppIcon;
    v5->_fullsizeAppIcon = (UIImage *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bodyImage"];
    bodyImage = v5->_bodyImage;
    v5->_bodyImage = (UIImage *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userActivity"];
    userActivity = v5->_userActivity;
    v5->_userActivity = (NSUserActivity *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
    intent = v5->_intent;
    v5->_intent = (INIntent *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relevantShortcut"];
    relevantShortcut = v5->_relevantShortcut;
    v5->_relevantShortcut = (INRelevantShortcut *)v37;

    v5->_displayAppName = [v4 decodeBoolForKey:@"displayAppName"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v25 = a3;
  id v4 = [(REUIDonatedElementProperties *)self bundleIdentifier];
  id v5 = NSStringFromSelector(sel_bundleIdentifier);
  [v25 encodeObject:v4 forKey:v5];

  uint64_t v6 = [(REUIDonatedElementProperties *)self remoteBundleIdentifier];
  v7 = NSStringFromSelector(sel_remoteBundleIdentifier);
  [v25 encodeObject:v6 forKey:v7];

  uint64_t v8 = [(REUIDonatedElementProperties *)self localBundleIdentifier];
  id v9 = NSStringFromSelector(sel_localBundleIdentifier);
  [v25 encodeObject:v8 forKey:v9];

  unint64_t v10 = [(REUIDonatedElementProperties *)self donationType];
  id v11 = NSStringFromSelector(sel_donationType);
  [v25 encodeInteger:v10 forKey:v11];

  BOOL v12 = [(REUIDonatedElementProperties *)self isLocalDonation];
  v13 = NSStringFromSelector(sel_isLocalDonation);
  [v25 encodeBool:v12 forKey:v13];

  unint64_t v14 = [(REUIDonatedElementProperties *)self actionIdentifier];
  v15 = NSStringFromSelector(sel_actionIdentifier);
  [v25 encodeInt64:v14 forKey:v15];

  uint64_t v16 = [(REUIDonatedElementProperties *)self appName];
  [v25 encodeObject:v16 forKey:@"appName"];

  v17 = [(REUIDonatedElementProperties *)self appIcon];
  [v25 encodeObject:v17 forKey:@"appIcon"];

  uint64_t v18 = [(REUIDonatedElementProperties *)self fullsizeAppIcon];
  [v25 encodeObject:v18 forKey:@"fullsizeAppIcon"];

  v19 = [(REUIDonatedElementProperties *)self title];
  [v25 encodeObject:v19 forKey:@"title"];

  uint64_t v20 = [(REUIDonatedElementProperties *)self subtitle];
  [v25 encodeObject:v20 forKey:@"subtitle"];

  uint64_t v21 = [(REUIDonatedElementProperties *)self bodyImage];
  [v25 encodeObject:v21 forKey:@"bodyImage"];

  v22 = [(REUIDonatedElementProperties *)self userActivity];
  [v25 encodeObject:v22 forKey:@"userActivity"];

  uint64_t v23 = [(REUIDonatedElementProperties *)self intent];
  [v25 encodeObject:v23 forKey:@"intent"];

  v24 = [(REUIDonatedElementProperties *)self relevantShortcut];
  [v25 encodeObject:v24 forKey:@"relevantShortcut"];

  objc_msgSend(v25, "encodeBool:forKey:", -[REUIDonatedElementProperties displayAppName](self, "displayAppName"), @"displayAppName");
}

- (void)loadForAction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &__block_literal_global_68;
  }
  id v9 = [v6 bundleIdentifier];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v9;

  id v11 = [v6 remoteBundleIdentifier];
  remoteBundleIdentifier = self->_remoteBundleIdentifier;
  self->_remoteBundleIdentifier = v11;

  v13 = [v6 localBundleIdentifier];
  localBundleIdentifier = self->_localBundleIdentifier;
  self->_localBundleIdentifier = v13;

  self->_donationType = [v6 type];
  self->_localDonation = [v6 isLocalDonation];
  v15 = [v6 actionTypeIdentifier];
  self->_actionIdentifier = objc_msgSend(v15, "re_actionIdentifierHashValue");

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_2;
  v25[3] = &unk_2644B7D68;
  v25[4] = self;
  uint64_t v16 = v8;
  id v26 = v16;
  v17 = (void *)MEMORY[0x223C2D7E0](v25);
  switch([v6 type])
  {
    case 0:
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_4;
      v21[3] = &unk_2644B7DB8;
      v21[4] = self;
      id v22 = v17;
      [v6 loadUserActivity:v21];
      uint64_t v18 = v22;
      goto LABEL_8;
    case 1:
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_3;
      v23[3] = &unk_2644B7D90;
      v23[4] = self;
      id v24 = v17;
      [v6 loadIntent:v23];
      uint64_t v18 = v24;
      goto LABEL_8;
    case 2:
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_5;
      v19[3] = &unk_2644B7DE0;
      v19[4] = self;
      id v20 = v17;
      [v6 loadRelevantShortcut:v19];
      uint64_t v18 = v20;
LABEL_8:

      break;
    case 3:
      v16[2](v16);
      break;
    default:
      break;
  }
}

uint64_t __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loadAppContentPropertiesWithCompletion:*(void *)(a1 + 40)];
}

void __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (RelevanceEngineLibraryCore())
  {
    id v7 = v6;
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v8 = (void (*)(id))getREIntentBySimplifyingParametersForIntentSymbolLoc_ptr;
    v17 = getREIntentBySimplifyingParametersForIntentSymbolLoc_ptr;
    if (!getREIntentBySimplifyingParametersForIntentSymbolLoc_ptr)
    {
      id v9 = (void *)RelevanceEngineLibrary();
      v15[3] = (uint64_t)dlsym(v9, "REIntentBySimplifyingParametersForIntent");
      getREIntentBySimplifyingParametersForIntentSymbolLoc_ptr = (_UNKNOWN *)v15[3];
      uint64_t v8 = (void (*)(id))v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (!v8)
    {
      v13 = (_Unwind_Exception *)softRESampleRelevanceProviderForPosition_cold_1();
      _Block_object_dispose(&v14, 8);
      _Unwind_Resume(v13);
    }
    unint64_t v10 = v8(v7);
  }
  else
  {
    unint64_t v10 = 0;
  }

  [*(id *)(a1 + 32) _loadContentForIntent:v10 completion:*(void *)(a1 + 40)];
  uint64_t v11 = *(void *)(a1 + 32);
  BOOL v12 = *(void **)(v11 + 112);
  *(void *)(v11 + 112) = v5;
}

void __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) _loadContentForUserActivity:a3 completion:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v5;
}

void __57__REUIDonatedElementProperties_loadForAction_completion___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) _loadContentForRelevantShortcut:a3 completion:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v5;
}

- (BOOL)isMediaDonation
{
  v3 = [(REUIDonatedElementProperties *)self intent];
  if (v3)
  {
    id v4 = [(REUIDonatedElementProperties *)self intent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)isWorkoutDonation
{
  v2 = [(REUIDonatedElementProperties *)self bundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.SessionTrackerApp"];

  return v3;
}

- (BOOL)isBeginWorkoutDonation
{
  if ([(REUIDonatedElementProperties *)self isWorkoutDonation])
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v4 = [(REUIDonatedElementProperties *)self intent];
    if (v4)
    {
      id v5 = [(REUIDonatedElementProperties *)self intent];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char isKindOfClass = 1;
      }
      else
      {
        uint64_t v6 = [(REUIDonatedElementProperties *)self intent];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  return isKindOfClass & 1;
}

- (BOOL)isEndWorkoutDonation
{
  char v3 = [(REUIDonatedElementProperties *)self intent];
  if (v3)
  {
    id v4 = [(REUIDonatedElementProperties *)self intent];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      uint64_t v6 = [(REUIDonatedElementProperties *)self intent];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char isKindOfClass = 1;
      }
      else
      {
        id v7 = [(REUIDonatedElementProperties *)self intent];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
      }
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)isRunWorkflowDonation
{
  char v3 = [(REUIDonatedElementProperties *)self intent];
  if (v3)
  {
    id v4 = [(REUIDonatedElementProperties *)self intent];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)_isMusicDonation
{
  BOOL v3 = [(REUIDonatedElementProperties *)self isMediaDonation];
  if (v3)
  {
    id v4 = [(REUIDonatedElementProperties *)self bundleIdentifier];
    char v5 = [v4 isEqualToString:@"com.apple.Music"];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_isPodcastsDonation
{
  BOOL v3 = [(REUIDonatedElementProperties *)self isMediaDonation];
  if (v3)
  {
    id v4 = [(REUIDonatedElementProperties *)self bundleIdentifier];
    char v5 = [v4 isEqualToString:@"com.apple.podcasts"];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)requiresRemoteExecution
{
  BOOL v3 = [(REUIDonatedElementProperties *)self isMediaDonation];
  if (v3) {
    LOBYTE(v3) = ![(REUIDonatedElementProperties *)self isLocalDonation];
  }
  return v3;
}

- (BOOL)supportsLocalIntentExecution
{
  if (![(REUIDonatedElementProperties *)self requiresRemoteExecution]
    && [(REUIDonatedElementProperties *)self isLocalDonation])
  {
    return 1;
  }

  return [(REUIDonatedElementProperties *)self _hasLocalExtensionForIntentExecution];
}

- (BOOL)_hasLocalExtensionForIntentExecution
{
  return 0;
}

- (BOOL)supportsBackgroundExecution
{
  if (!self->_intent) {
    return 0;
  }
  if ([(REUIDonatedElementProperties *)self isMediaDonation]
    && [(REUIDonatedElementProperties *)self isLocalDonation])
  {
    return [(REUIDonatedElementProperties *)self _hasLocalExtensionForIntentExecution];
  }
  else
  {
    intent = self->_intent;
    return [(INIntent *)intent _supportsBackgroundExecution];
  }
}

- (id)_placeholderImageNameForBundleID:(id)a3
{
  uint64_t v3 = _placeholderImageNameForBundleID__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_placeholderImageNameForBundleID__onceToken, &__block_literal_global_80_0);
  }
  char v5 = [(id)_placeholderImageNameForBundleID__bundleIDToImageName objectForKeyedSubscript:v4];

  if (v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = @"Med Music";
  }
  id v7 = v6;

  return v7;
}

void __65__REUIDonatedElementProperties__placeholderImageNameForBundleID___block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  v2[0] = @"com.apple.Music";
  v2[1] = @"com.apple.podcasts";
  v3[0] = @"Med Music";
  v3[1] = @"Med Podcasts";
  v2[2] = @"com.apple.NanoRadio";
  v3[2] = @"Med Radio";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)_placeholderImageNameForBundleID__bundleIDToImageName;
  _placeholderImageNameForBundleID__bundleIDToImageName = v0;
}

- (UIImage)bodyImage
{
  if (!self->_bodyImage && [(REUIDonatedElementProperties *)self isMediaDonation])
  {
    uint64_t v3 = [(REUIDonatedElementProperties *)self bundleIdentifier];
    id v4 = [(REUIDonatedElementProperties *)self intent];
    char v5 = [v4 mediaContainer];
    uint64_t v6 = [v5 type];

    if (v6 == 9)
    {

      uint64_t v3 = @"com.apple.NanoRadio";
    }
    id v7 = [(REUIDonatedElementProperties *)self _placeholderImageNameForBundleID:v3];
    uint64_t v8 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.RelevanceEngineSiriActions"];
    REImageNamedFromBundle(v8, v7);
    id v9 = (UIImage *)objc_claimAutoreleasedReturnValue();
    bodyImage = self->_bodyImage;
    self->_bodyImage = v9;

    self->_isUsingPlaceholderArtwork = 1;
  }
  uint64_t v11 = self->_bodyImage;

  return v11;
}

- (NSString)bodyImageCompositingFilter
{
  if ([(REUIDonatedElementProperties *)self isMediaDonation]
    && (id v3 = [(REUIDonatedElementProperties *)self bodyImage],
        self->_isUsingPlaceholderArtwork))
  {
    id v4 = (id)*MEMORY[0x263F15D58];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)_loadContentForIntent:(id)a3 completion:(id)a4
{
  objc_storeStrong((id *)&self->_intent, a3);
  id v7 = a3;
  v17 = (void (**)(void))a4;
  uint64_t v8 = [v7 _title];
  title = self->_title;
  self->_title = v8;

  unint64_t v10 = [v7 _subtitle];
  subtitle = self->_subtitle;
  self->_subtitle = v10;

  BOOL v12 = (void *)MEMORY[0x263F1C6B0];
  v13 = [v7 keyImage];
  uint64_t v14 = [v13 _imageData];
  v15 = [v12 imageWithData:v14];
  bodyImage = self->_bodyImage;
  self->_bodyImage = v15;

  v17[2]();
}

- (void)_loadContentForUserActivity:(id)a3 completion:(id)a4
{
  objc_storeStrong((id *)&self->_userActivity, a3);
  id v7 = a3;
  v15 = (void (**)(void))a4;
  uint64_t v8 = [v7 title];
  title = self->_title;
  self->_title = v8;

  unint64_t v10 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v11 = [v7 contentAttributeSet];
  BOOL v12 = [v11 thumbnailData];
  v13 = [v10 imageWithData:v12];
  bodyImage = self->_bodyImage;
  self->_bodyImage = v13;

  v15[2]();
}

- (void)_loadContentForUserActivityOnShortcut:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 activitySubtitle];
  subtitle = self->_subtitle;
  self->_subtitle = v8;

  id v10 = [v7 userActivity];

  [(REUIDonatedElementProperties *)self _loadContentForUserActivity:v10 completion:v6];
}

- (void)_loadContentForRelevantShortcut:(id)a3 completion:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a4;
  objc_storeStrong((id *)&self->_relevantShortcut, a3);
  id v9 = [v7 shortcut];
  id v10 = [v9 intent];
  intent = self->_intent;
  self->_intent = v10;

  BOOL v12 = [v7 shortcut];
  v13 = [v12 userActivity];
  userActivity = self->_userActivity;
  self->_userActivity = v13;

  v15 = [v7 watchTemplate];

  if (v15)
  {
    uint64_t v16 = [v7 watchTemplate];
    v17 = [v16 title];
    title = self->_title;
    self->_title = v17;

    v19 = [v7 watchTemplate];
    id v20 = [v19 subtitle];
    subtitle = self->_subtitle;
    self->_subtitle = v20;

    id v22 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v23 = [v7 watchTemplate];
    id v24 = [(id)v23 image];
    id v25 = [v24 _imageData];
    id v26 = [v22 imageWithData:v25];
    bodyImage = self->_bodyImage;
    self->_bodyImage = v26;

    v28 = [v7 watchTemplate];
    LOBYTE(v23) = objc_opt_respondsToSelector();

    if (v23)
    {
      uint64_t v29 = [v7 watchTemplate];
      v30 = [v29 monochromeImage];

      if (v30)
      {
        uint64_t v31 = (void *)MEMORY[0x263F1C6B0];
        v32 = [v30 _imageData];
        uint64_t v33 = [v31 imageWithData:v32];
        monochromeBodyImage = self->_monochromeBodyImage;
        self->_monochromeBodyImage = v33;
      }
    }
  }
  else
  {
    uint64_t v35 = self->_intent;
    if (v35)
    {
      [(REUIDonatedElementProperties *)self _loadContentForIntent:v35 completion:v8];
      goto LABEL_11;
    }
    if (self->_userActivity)
    {
      v36 = [v7 shortcut];
      [(REUIDonatedElementProperties *)self _loadContentForUserActivityOnShortcut:v36 completion:v8];

      goto LABEL_11;
    }
    uint64_t v37 = RELogForDomain();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[REUIDonatedElementProperties _loadContentForRelevantShortcut:completion:](v37);
    }
  }
  v8[2](v8);
LABEL_11:
}

- (id)_scaleImageForDisplay:(id)a3
{
  id v3 = a3;
  double v4 = RESuggestedBodyImageSizeForStyle(0);
  double v6 = v5;
  id v7 = 0;
  double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (*MEMORY[0x263F001B0] != v4 || v8 != v6)
  {
    id v10 = objc_msgSend(MEMORY[0x263F1C688], "preferredFormat", *MEMORY[0x263F001B0], v8);
    [v10 setOpaque:0];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", v10, v4, v6);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__REUIDonatedElementProperties__scaleImageForDisplay___block_invoke;
    v13[3] = &unk_2644B7E08;
    id v14 = v3;
    double v15 = v4;
    double v16 = v6;
    id v7 = [v11 imageWithActions:v13];
  }

  return v7;
}

void __54__REUIDonatedElementProperties__scaleImageForDisplay___block_invoke(uint64_t a1, void *a2)
{
  id v28 = a2;
  [*(id *)(a1 + 32) size];
  double v4 = v3;
  RESupergreenSuggestedImageDonationWidth();
  if (v4 >= v5
    || ([*(id *)(a1 + 32) size], double v7 = v6, RESupergreenSuggestedImageDonationWidth(), v7 >= v8))
  {
    id v10 = (CGContext *)[v28 CGContext];
    CGContextSetInterpolationQuality(v10, kCGInterpolationHigh);
    double v11 = *(double *)(a1 + 40);
    double v12 = *(double *)(a1 + 48);
    v13 = [MEMORY[0x263EFD180] currentDevice];
    double v14 = ClippingRadiusForDevice(v13);

    objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v11, v12, v14);
    id v15 = objc_claimAutoreleasedReturnValue();
    double v16 = (const CGPath *)[v15 CGPath];

    CGContextAddPath(v10, v16);
    CGContextClip(v10);
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  v17 = [MEMORY[0x263F1C920] mainScreen];
  [v17 scale];
  double v19 = v18;

  [*(id *)(a1 + 32) size];
  double v21 = v20 / v19;
  double v22 = *(double *)(a1 + 40);
  double v24 = v23 / v19;
  if (v9)
  {
    double v25 = v22 / v21;
    double v26 = *(double *)(a1 + 48);
    if (v22 / v21 < v26 / v24) {
      double v25 = v26 / v24;
    }
  }
  else
  {
    RESupergreenSuggestedImageDonationWidth();
    double v25 = v22 / (v27 * 0.5);
    double v22 = *(double *)(a1 + 40);
    double v26 = *(double *)(a1 + 48);
  }
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", (v22 - v21 * v25) * 0.5, (v26 - v24 * v25) * 0.5);
}

- (void)_loadAppContentPropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  if (self->_bodyImage)
  {
    -[REUIDonatedElementProperties _scaleImageForDisplay:](self, "_scaleImageForDisplay:");
    float v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
    bodyImage = self->_bodyImage;
    self->_bodyImage = v5;
  }
  if ([(REUIDonatedElementProperties *)self _isMusicDonation]
    || [(REUIDonatedElementProperties *)self _isPodcastsDonation])
  {
    double v7 = self->_intent;
    title = self->_title;
    self->_title = 0;

    int v9 = [(INIntent *)v7 mediaContainer];
    id v10 = [v9 title];
    subtitle = self->_subtitle;
    self->_subtitle = v10;

    double v12 = [(INIntent *)v7 mediaItems];
    uint64_t v13 = [v12 count];

    if (!v13) {
      goto LABEL_9;
    }
    double v14 = [(INIntent *)v7 mediaItems];
    id v15 = [v14 firstObject];
    double v16 = [v15 title];
    v17 = self->_title;
    self->_title = v16;
  }
  else
  {
    double v18 = self->_title;
    double v19 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    double v7 = [(NSString *)v18 stringByTrimmingCharactersInSet:v19];

    double v20 = [MEMORY[0x263F08708] newlineCharacterSet];
    double v21 = [(INIntent *)v7 componentsSeparatedByCharactersInSet:v20];
    double v22 = [v21 componentsJoinedByString:@" "];
    double v23 = self->_title;
    self->_title = v22;

    double v24 = self->_subtitle;
    double v25 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    double v14 = [(NSString *)v24 stringByTrimmingCharactersInSet:v25];

    id v15 = [MEMORY[0x263F08708] newlineCharacterSet];
    v17 = [v14 componentsSeparatedByCharactersInSet:v15];
    double v26 = [v17 componentsJoinedByString:@" "];
    float v27 = self->_subtitle;
    self->_subtitle = v26;
  }
LABEL_9:

  if (![(NSString *)self->_title length])
  {
    objc_storeStrong((id *)&self->_title, self->_subtitle);
    id v28 = self->_subtitle;
    self->_subtitle = 0;
  }
  BOOL v29 = [(REUIDonatedElementProperties *)self isMediaDonation]
     || [(REUIDonatedElementProperties *)self isRunWorkflowDonation]
     || [(REUIDonatedElementProperties *)self isWorkoutDonation];
  v30 = [(REUIDonatedElementProperties *)self bundleIdentifier];
  uint64_t Type = REApplicationGetType();

  if (Type != 1
    || !self->_bodyImage
    && (![(NSString *)self->_title length] || ![(NSString *)self->_subtitle length]))
  {
    BOOL v29 = 1;
  }
  self->_displayAppName = v29;
  if ([(REUIDonatedElementProperties *)self supportsLocalIntentExecution])
  {
    BOOL v32 = 1;
  }
  else
  {
    uint64_t v33 = [(REUIDonatedElementProperties *)self userActivity];
    BOOL v32 = v33 != 0;
  }
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke;
  v52[3] = &unk_2644B7E58;
  v52[4] = self;
  BOOL v54 = v32;
  id v34 = v4;
  id v53 = v34;
  uint64_t v35 = MEMORY[0x223C2D7E0](v52);
  v36 = (void (**)(void, void, void))v35;
  if (v32)
  {
    uint64_t v37 = [(REUIDonatedElementProperties *)self localBundleIdentifier];
    id v38 = (id)RelevanceEngineLibraryCore();
    if (v38)
    {
      uint64_t v60 = 0;
      v61 = &v60;
      uint64_t v62 = 0x2050000000;
      v39 = (void *)getREAppNameCacheClass_softClass;
      uint64_t v63 = getREAppNameCacheClass_softClass;
      if (!getREAppNameCacheClass_softClass)
      {
        uint64_t v55 = MEMORY[0x263EF8330];
        uint64_t v56 = 3221225472;
        v57 = __getREAppNameCacheClass_block_invoke;
        v58 = &unk_2644B7CE0;
        v59 = &v60;
        __getREAppNameCacheClass_block_invoke((uint64_t)&v55);
        v39 = (void *)v61[3];
      }
      id v40 = v39;
      _Block_object_dispose(&v60, 8);
      id v38 = v40;
    }
    v41 = [v38 sharedInstance];
    v42 = [v41 localizedNameForApplicationWithIdentifier:v37];

    if ([(REUIDonatedElementProperties *)self isWorkoutDonation] && (v43 = self->_bodyImage) != 0)
    {
      self->_bodyImage = 0;
      v44 = v43;

      ((void (**)(void, void *, UIImage *))v36)[2](v36, v42, v44);
    }
    else
    {
      id v45 = (id)RelevanceEngineLibraryCore();
      if (v45)
      {
        uint64_t v60 = 0;
        v61 = &v60;
        uint64_t v62 = 0x2050000000;
        v46 = (void *)getREAppIconCacheClass_softClass;
        uint64_t v63 = getREAppIconCacheClass_softClass;
        if (!getREAppIconCacheClass_softClass)
        {
          uint64_t v55 = MEMORY[0x263EF8330];
          uint64_t v56 = 3221225472;
          v57 = __getREAppIconCacheClass_block_invoke;
          v58 = &unk_2644B7CE0;
          v59 = &v60;
          __getREAppIconCacheClass_block_invoke((uint64_t)&v55);
          v46 = (void *)v61[3];
        }
        id v47 = v46;
        _Block_object_dispose(&v60, 8);
        id v45 = v47;
      }
      v48 = [v45 sharedInstance];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_5;
      v49[3] = &unk_2644B7E80;
      v51 = v36;
      id v50 = v42;
      [v48 iconForApplicationWithIdentifier:v37 completion:v49];

      v44 = v51;
    }
  }
  else
  {
    (*(void (**)(uint64_t, void, void))(v35 + 16))(v35, 0, 0);
  }
}

void __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
  float v8 = [MEMORY[0x263F1C688] defaultFormat];
  [v8 setOpaque:0];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 80), a3);
  double v9 = RESuggestedHeaderImageSizeForStyle(0);
  double v11 = v10;
  if (*(unsigned char *)(a1 + 48) && ![*(id *)(a1 + 32) isWorkoutDonation])
  {
    id v17 = objc_alloc(MEMORY[0x263F4B540]);
    double v18 = [*(id *)(a1 + 32) localBundleIdentifier];
    double v16 = (void *)[v17 initWithBundleIdentifier:v18];

    double v19 = [MEMORY[0x263F1C920] mainScreen];
    [v19 scale];
    double v21 = v20;

    double v22 = objc_msgSend(objc_alloc(MEMORY[0x263F4B558]), "initWithSize:scale:", v9, v11, v21);
    [v22 setShape:2];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_3;
    v23[3] = &unk_2644B7E30;
    v23[4] = *(void *)(a1 + 32);
    double v26 = v21;
    double v27 = v9;
    double v28 = v11;
    id v24 = v8;
    id v25 = *(id *)(a1 + 40);
    [v16 getCGImageForImageDescriptor:v22 completion:v23];
  }
  else
  {
    double v12 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", v8, v9, v11);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_2;
    v29[3] = &unk_2644B7E08;
    id v30 = v7;
    double v31 = v9;
    double v32 = v11;
    uint64_t v13 = [v12 imageWithActions:v29];
    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 72);
    *(void *)(v14 + 72) = v13;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    double v16 = v30;
  }
}

uint64_t __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_2(double *a1, void *a2)
{
  CGContextSetInterpolationQuality((CGContextRef)[a2 CGContext], kCGInterpolationHigh);
  double v3 = (void *)*((void *)a1 + 4);
  double v4 = a1[5];
  double v5 = a1[6];

  return objc_msgSend(v3, "drawInRect:", 0.0, 0.0, v4, v5);
}

void __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double v3 = [MEMORY[0x263F1C6B0] imageWithCGImage:a2 scale:0 orientation:*(double *)(a1 + 56)];
  double v4 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_4;
  v9[3] = &unk_2644B7E08;
  id v10 = v3;
  long long v11 = *(_OWORD *)(a1 + 64);
  id v5 = v3;
  uint64_t v6 = [v4 imageWithActions:v9];
  uint64_t v7 = *(void *)(a1 + 32);
  float v8 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = v6;

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_4(double *a1, void *a2)
{
  CGContextSetInterpolationQuality((CGContextRef)[a2 CGContext], kCGInterpolationHigh);
  double v3 = (void *)*((void *)a1 + 4);
  double v4 = a1[5];
  double v5 = a1[6];

  return objc_msgSend(v3, "drawInRect:", 0.0, 0.0, v4, v5);
}

void __72__REUIDonatedElementProperties__loadAppContentPropertiesWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = [a2 image];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)remoteBundleIdentifier
{
  return self->_remoteBundleIdentifier;
}

- (NSString)localBundleIdentifier
{
  return self->_localBundleIdentifier;
}

- (unint64_t)donationType
{
  return self->_donationType;
}

- (BOOL)isLocalDonation
{
  return self->_localDonation;
}

- (unint64_t)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)appName
{
  return self->_appName;
}

- (UIImage)appIcon
{
  return self->_appIcon;
}

- (UIImage)fullsizeAppIcon
{
  return self->_fullsizeAppIcon;
}

- (BOOL)displayAppName
{
  return self->_displayAppName;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)monochromeBodyImage
{
  return self->_monochromeBodyImage;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INRelevantShortcut)relevantShortcut
{
  return self->_relevantShortcut;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantShortcut, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_monochromeBodyImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_fullsizeAppIcon, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_localBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_bodyImage, 0);
}

- (void)_loadContentForRelevantShortcut:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21E651000, log, OS_LOG_TYPE_ERROR, "Error: Attempted to load content for REUIDonatedElementProperties with neither an intent or user activity.", v1, 2u);
}

@end