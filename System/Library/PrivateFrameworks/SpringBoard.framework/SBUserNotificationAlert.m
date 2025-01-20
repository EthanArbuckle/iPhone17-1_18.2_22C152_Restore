@interface SBUserNotificationAlert
- (BOOL)_displayActionButtonOnLockScreen;
- (BOOL)allowInLoginWindow;
- (BOOL)allowLockScreenDismissal;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)behavesSuperModally;
- (BOOL)dismissOnLock;
- (BOOL)dismissesOverlaysOnLockScreen;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)hideOnClonedDisplay;
- (BOOL)prefersSystemAperturePresentation;
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldShowInLockScreen;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)wakeDisplay;
- (NSDictionary)vibrationPattern;
- (NSString)alertHeader;
- (NSString)alertMessage;
- (NSString)alertMessageDelimiter;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)defaultResponseLaunchBundleID;
- (NSString)description;
- (NSString)extensionIdentifier;
- (NSString)lockScreenAlertHeader;
- (NSString)lockScreenAlertMessage;
- (NSString)lockScreenAlertMessageDelimiter;
- (NSString)otherButtonTitle;
- (NSString)remoteServiceBundleIdentifier;
- (NSString)remoteViewControllerClassName;
- (NSString)soundAlertTopic;
- (NSString)soundPath;
- (NSURL)defaultResponseLaunchURL;
- (SBSUserNotificationImageDefinition)attachmentImageDefinition;
- (SBSUserNotificationImageDefinition)headerImageDefinition;
- (SBSUserNotificationImageDefinition)iconImageDefinition;
- (SBSUserNotificationSystemApertureContentDefinition)systemApertureContentDefinition;
- (SBUserNotificationAlert)initWithMessage:(id)a3 replyPort:(unsigned int)a4 requestFlags:(int)a5 auditToken:(id)a6;
- (id)_attachmentImage;
- (id)_createSystemApertureElement;
- (id)_headerImage;
- (id)_imageDefinitionForPath:(id)a3 catalogPath:(id)a4 catalogImageKey:(id)a5;
- (id)_imageForDefinition:(id)a3;
- (id)_parseAssetDefinition:(id)a3;
- (id)_parseCustomButtonDefinitions:(id)a3 locBundle:(id)a4;
- (id)_parseLegacyTextFieldDefinitions:(id)a3 locBundle:(id)a4;
- (id)_parseSystemApertureContentDefinition:(id)a3;
- (id)_parseTextFieldDefinitions:(id)a3 locBundle:(id)a4;
- (id)_prepareNewAlertControllerWithLockedState:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (id)_publicDescription;
- (id)_safeLocalizedValue:(id)a3 withBundle:(id)a4;
- (id)autocapitalizationTypes;
- (id)autocorrectionTypes;
- (id)clientIdentifier;
- (id)elementIdentifier;
- (id)iconImage;
- (id)keyboardTypes;
- (id)parseVisualStyleForMessage:(id)a3;
- (id)sound;
- (id)textFieldTitles;
- (id)textFieldValues;
- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5;
- (int)token;
- (int64_t)_uiAlertActionLayoutDirectionFromSBUserNotificationButtonLayoutDirection:(unsigned int)a3;
- (int64_t)_uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:(int)a3;
- (int64_t)soundAlertType;
- (unsigned)soundID;
- (unsigned)soundIDBehavior;
- (void)_activateApplication:(id)a3 withURL:(id)a4;
- (void)_cleanup;
- (void)_cleanupCustomContentViewControllers;
- (void)_clearRemoteViewControllerIfPresent;
- (void)_noteSilencingHardwareButtonPressed;
- (void)_sendResponseAndCleanUp:(int)a3;
- (void)_sendResponseAndCleanUp:(int)a3 customButtonResponse:(int)a4;
- (void)_setActivated:(BOOL)a3;
- (void)cancel;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (void)dealloc;
- (void)didDeactivateForReason:(int)a3;
- (void)didFailToActivate;
- (void)dismissIfNecessaryWithResponse:(int)a3;
- (void)dismissIfNecessaryWithResponse:(int)a3 customButtonResponse:(int)a4;
- (void)doCleanupAfterDeactivationAnimation;
- (void)performUnlockAction;
- (void)presentationStateDidChangeFromState:(unint64_t)a3 toState:(unint64_t)a4;
- (void)setAlertHeader:(id)a3;
- (void)setAlertMessage:(id)a3;
- (void)setAlertMessageDelimiter:(id)a3;
- (void)setAlternateButtonTitle:(id)a3;
- (void)setAttachmentImageDefinition:(id)a3;
- (void)setAutocapitalizationTypes:(id)a3;
- (void)setAutocorrectionTypes:(id)a3;
- (void)setDefaultButtonTitle:(id)a3;
- (void)setDefaultResponseLaunchBundleID:(id)a3;
- (void)setDefaultResponseLaunchURL:(id)a3;
- (void)setExtensionIdentifier:(id)a3;
- (void)setHeaderImageDefinition:(id)a3;
- (void)setIconImageDefinition:(id)a3;
- (void)setKeyboardTypes:(id)a3;
- (void)setLockScreenAlertHeader:(id)a3;
- (void)setLockScreenAlertMessage:(id)a3;
- (void)setLockScreenAlertMessageDelimiter:(id)a3;
- (void)setOtherButtonTitle:(id)a3;
- (void)setPrefersSystemAperturePresentation:(BOOL)a3;
- (void)setRemoteServiceBundleIdentifier:(id)a3;
- (void)setRemoteViewControllerClassName:(id)a3;
- (void)setSoundAlertTopic:(id)a3;
- (void)setSoundAlertType:(int64_t)a3;
- (void)setSoundID:(unsigned int)a3;
- (void)setSoundIDBehavior:(unsigned int)a3;
- (void)setSoundPath:(id)a3;
- (void)setSystemApertureContentDefinition:(id)a3;
- (void)setTextFieldTitles:(id)a3;
- (void)setTextFieldValues:(id)a3;
- (void)setVibrationPattern:(id)a3;
- (void)updateWithMessage:(id)a3 requestFlags:(int)a4;
- (void)willActivate;
- (void)willDeactivateForReason:(int)a3;
@end

@implementation SBUserNotificationAlert

- (id)_headerImage
{
  v3 = [(SBUserNotificationAlert *)self headerImageDefinition];
  v4 = [(SBUserNotificationAlert *)self _imageForDefinition:v3];

  return v4;
}

- (id)_attachmentImage
{
  v3 = [(SBUserNotificationAlert *)self attachmentImageDefinition];
  v4 = [(SBUserNotificationAlert *)self _imageForDefinition:v3];

  return v4;
}

- (id)iconImage
{
  v3 = [(SBUserNotificationAlert *)self iconImageDefinition];
  v4 = [(SBUserNotificationAlert *)self _imageForDefinition:v3];

  return v4;
}

- (id)_safeLocalizedValue:(id)a3 withBundle:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = safeStringValue(*(void **)(*((void *)&v17 + 1) + 8 * i));
            if (v6)
            {
              uint64_t v14 = objc_msgSend(v6, "localizedStringForKey:value:table:", v13, &stru_1F3084718, 0, (void)v17);

              v13 = (void *)v14;
            }
            objc_msgSend(v7, "addObject:", v13, (void)v17);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }
    }
    else
    {
      safeStringValue(v5);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        id v15 = [v6 localizedStringForKey:v8 value:&stru_1F3084718 table:0];
      }
      else
      {
        id v15 = v8;
        id v8 = v15;
      }
      v7 = v15;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SBUserNotificationAlert)initWithMessage:(id)a3 replyPort:(unsigned int)a4 requestFlags:(int)a5 auditToken:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  v37.receiver = self;
  v37.super_class = (Class)SBUserNotificationAlert;
  v12 = [(SBAlertItem *)&v37 init];
  if (v12)
  {
    v12[30] = [v11 pid];
    v12[31] = a4;
    uint64_t v13 = [v10 objectForKey:*MEMORY[0x1E4F1D9B0]];
    uint64_t v14 = (void *)*((void *)v12 + 14);
    *((void *)v12 + 14) = v13;

    uintptr_t v15 = v12[31];
    if ((v15 + 1) >= 2)
    {
      dispatch_source_t v17 = dispatch_source_create(MEMORY[0x1E4F14460], v15, 1uLL, MEMORY[0x1E4F14428]);
      long long v18 = (void *)*((void *)v12 + 16);
      *((void *)v12 + 16) = v17;

      long long v19 = *((void *)v12 + 16);
      if (v19)
      {
        handler[0] = MEMORY[0x1E4F143A8];
        handler[1] = 3221225472;
        handler[2] = __77__SBUserNotificationAlert_initWithMessage_replyPort_requestFlags_auditToken___block_invoke;
        handler[3] = &unk_1E6AF4AC0;
        long long v20 = v12;
        v36 = v20;
        dispatch_source_set_event_handler(v19, handler);
        v21 = *((void *)v12 + 16);
        uint64_t v30 = MEMORY[0x1E4F143A8];
        uint64_t v31 = 3221225472;
        v32 = __77__SBUserNotificationAlert_initWithMessage_replyPort_requestFlags_auditToken___block_invoke_2;
        v33 = &unk_1E6AF4AC0;
        v34 = v20;
        dispatch_source_set_cancel_handler(v21, &v30);
        dispatch_resume(*((dispatch_object_t *)v12 + 16));
      }
      uint64_t v22 = (void *)MEMORY[0x1E4F624B8];
      if (v11)
      {
        [v11 realToken];
      }
      else
      {
        long long v28 = 0u;
        long long v29 = 0u;
      }
      if ([v22 authenticateAuditToken:&v28 forEntitlement:@"com.apple.UIKit.vends-view-services" error:0])
      {
        id v23 = objc_alloc(MEMORY[0x1E4F4F390]);
        v24 = [v11 bundleID];
        v25 = [v12 description];
        uint64_t v26 = [v23 initWithBundleIdentifier:v24 flags:1 reason:9 name:v25];
        v27 = (void *)*((void *)v12 + 58);
        *((void *)v12 + 58) = v26;
      }
    }
    objc_msgSend(v12, "updateWithMessage:requestFlags:", v10, v7, v28, v29, v30, v31, v32, v33);
  }

  return (SBUserNotificationAlert *)v12;
}

void __77__SBUserNotificationAlert_initWithMessage_replyPort_requestFlags_auditToken___block_invoke(uint64_t a1)
{
}

uint64_t __77__SBUserNotificationAlert_initWithMessage_replyPort_requestFlags_auditToken___block_invoke_2(uint64_t a1)
{
  v2 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __77__SBUserNotificationAlert_initWithMessage_replyPort_requestFlags_auditToken___block_invoke_2_cold_1(a1, v2);
  }

  uint64_t result = *(void *)(a1 + 32);
  v4 = *(void **)(result + 128);
  if (v4)
  {
    *(void *)(result + 128) = 0;

    uint64_t result = *(void *)(a1 + 32);
  }
  if ((~*(_DWORD *)(result + 160) & 3) == 0
    || (*(void *)(result + 160) & 0x20) != 0
    && !*(void *)(result + 216)
    && !*(void *)(result + 224)
    && !*(void *)(result + 232))
  {
    return [(id)result cancel];
  }
  return result;
}

- (id)parseVisualStyleForMessage:(id)a3
{
  v4 = objc_msgSend(a3, "bs_safeNumberForKey:", *MEMORY[0x1E4FA72E0]);
  id v5 = v4;
  if (v4)
  {
    int64_t v6 = -[SBUserNotificationAlert _uiAlertActionLayoutDirectionFromSBUserNotificationButtonLayoutDirection:](self, "_uiAlertActionLayoutDirectionFromSBUserNotificationButtonLayoutDirection:", [v4 unsignedIntValue]);
    id v7 = objc_alloc_init(MEMORY[0x1E4FA7930]);
    [v7 setPermittedActionLayoutDirection:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)updateWithMessage:(id)a3 requestFlags:(int)a4
{
  v178[9] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  self->_requestFlags = a4;
  id v7 = [v6 objectForKey:*MEMORY[0x1E4F1DA38]];
  self->_token = safeIntValue(v7);

  id v8 = [v6 objectForKey:*MEMORY[0x1E4F1DA30]];
  self->_timeout = safeIntValue(v8);

  uint64_t v9 = [v6 objectForKey:*MEMORY[0x1E4FA7338]];
  if (isSafePlistTrueBoolean(v9)) {
    char v10 = 16;
  }
  else {
    char v10 = 0;
  }
  *((unsigned char *)self + 448) = *((unsigned char *)self + 448) & 0xEF | v10;

  id v11 = [v6 objectForKey:*MEMORY[0x1E4FA7340]];
  if (isSafePlistTrueBoolean(v11)) {
    char v12 = 64;
  }
  else {
    char v12 = 0;
  }
  *((unsigned char *)self + 448) = *((unsigned char *)self + 448) & 0xBF | v12;

  uint64_t v13 = [v6 objectForKey:*MEMORY[0x1E4FA72D8]];
  if (isSafePlistTrueBoolean(v13)) {
    char v14 = 0x80;
  }
  else {
    char v14 = 0;
  }
  *((unsigned char *)self + 448) = v14 & 0x80 | *((unsigned char *)self + 448) & 0x7F;

  uintptr_t v15 = [v6 objectForKey:*MEMORY[0x1E4FA7288]];
  *((unsigned char *)self + 448) = *((unsigned char *)self + 448) & 0xFE | isSafePlistTrueBoolean(v15);

  v16 = [v6 objectForKey:*MEMORY[0x1E4FA7320]];
  if (isSafePlistTrueBoolean(v16)) {
    char v17 = 16;
  }
  else {
    char v17 = 0;
  }
  *((unsigned char *)self + 449) = *((unsigned char *)self + 449) & 0xEF | v17;

  long long v18 = [v6 objectForKey:*MEMORY[0x1E4FA7378]];
  if (isSafePlistTrueBoolean(v18)) {
    char v19 = 32;
  }
  else {
    char v19 = 0;
  }
  *((unsigned char *)self + 449) = *((unsigned char *)self + 449) & 0xDF | v19;

  long long v20 = [v6 objectForKey:*MEMORY[0x1E4FA7290]];
  [(SBAlertItem *)self setAllowInSetup:isSafePlistTrueBoolean(v20)];

  v21 = [v6 objectForKey:*MEMORY[0x1E4FA73C8]];
  [(SBAlertItem *)self setPendInSetupIfNotAllowed:isSafePlistTrueBoolean(v21)];

  uint64_t v22 = [v6 objectForKey:*MEMORY[0x1E4FA73D0]];
  [(SBAlertItem *)self setPendWhileKeyBagLocked:isSafePlistTrueBoolean(v22)];

  id v23 = [v6 objectForKey:*MEMORY[0x1E4FA7280]];
  [(SBAlertItem *)self setAllowInCar:isSafePlistTrueBoolean(v23)];

  v24 = [v6 objectForKey:*MEMORY[0x1E4FA73A0]];
  [(SBAlertItem *)self _setIgnoresQuietMode:isSafePlistTrueBoolean(v24)];

  v25 = [v6 objectForKey:*MEMORY[0x1E4FA72F0]];
  [(SBAlertItem *)self setContactIdentifier:v25];

  uint64_t v26 = [v6 objectForKey:*MEMORY[0x1E4FA72F8]];
  [(SBAlertItem *)self setContentType:v26];

  v27 = [v6 objectForKey:*MEMORY[0x1E4FA7380]];
  [(SBAlertItem *)self setShouldMaskIcon:isSafePlistTrueBoolean(v27) ^ 1];

  long long v28 = [v6 objectForKey:*MEMORY[0x1E4FA7278]];
  [(SBAlertItem *)self setAllowDuringTransitionAnimations:isSafePlistTrueBoolean(v28)];

  long long v29 = [v6 objectForKey:*MEMORY[0x1E4FA72B0]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v30 = v29;
  }
  else {
    uint64_t v30 = 0;
  }
  id v31 = v30;
  v32 = (void *)[v31 mutableCopy];

  if (v32)
  {
    v33 = [v32 indexesOfObjectsPassingTest:&__block_literal_global_41];
    [v32 removeObjectsAtIndexes:v33];
  }
  v165 = v32;
  if ([v32 count])
  {
    v34 = (void *)[v32 copy];
    [(SBAlertItem *)self setAllowedBundleIDs:v34];
  }
  else
  {
    [(SBAlertItem *)self setAllowedBundleIDs:0];
  }
  v35 = [(SBUserNotificationAlert *)self parseVisualStyleForMessage:v6];
  visualStyle = self->_visualStyle;
  self->_visualStyle = v35;

  objc_super v37 = [v6 objectForKey:*MEMORY[0x1E4F1D9B8]];
  if (isSafePlistTrueBoolean(v37)) {
    char v38 = 8;
  }
  else {
    char v38 = 0;
  }
  *((unsigned char *)self + 448) = *((unsigned char *)self + 448) & 0xF7 | v38;

  v39 = [v6 objectForKey:*MEMORY[0x1E4FA7328]];
  if (isSafePlistTrueBoolean(v39)) {
    char v40 = 32;
  }
  else {
    char v40 = 0;
  }
  *((unsigned char *)self + 448) = *((unsigned char *)self + 448) & 0xDF | v40;

  v41 = [v6 objectForKey:*MEMORY[0x1E4FA72A0]];
  *((unsigned char *)self + 449) = *((unsigned char *)self + 449) & 0xFE | isSafePlistTrueBoolean(v41);

  v42 = [v6 objectForKey:*MEMORY[0x1E4FA7358]];
  if (isSafePlistTrueBoolean(v42)) {
    char v43 = 4;
  }
  else {
    char v43 = 0;
  }
  *((unsigned char *)self + 449) = *((unsigned char *)self + 449) & 0xFB | v43;

  v44 = [v6 objectForKey:*MEMORY[0x1E4FA7330]];
  if (isSafePlistTrueBoolean(v44)) {
    char v45 = 8;
  }
  else {
    char v45 = 0;
  }
  *((unsigned char *)self + 449) = *((unsigned char *)self + 449) & 0xF7 | v45;

  v46 = [v6 objectForKey:*MEMORY[0x1E4FA7308]];
  v47 = v46;
  if (v46) {
    int v48 = safeIntValue(v46);
  }
  else {
    int v48 = -1;
  }
  self->_defaultButtonTag = v48;
  v49 = [v6 objectForKey:*MEMORY[0x1E4FA7298]];

  if (v49) {
    char v50 = safeIntValue(v49);
  }
  else {
    char v50 = 1;
  }
  *((unsigned char *)self + 472) = *((unsigned char *)self + 472) & 0xFE | v50 & 1;
  v171 = [v6 objectForKey:*MEMORY[0x1E4FA7440]];
  v166 = [v6 objectForKey:*MEMORY[0x1E4FA7438]];
  v51 = v171;
  if (v171 || (v51 = v166) != 0) {
    char v52 = *((unsigned char *)self + 449) & 0xFD | (2 * (safeIntValue(v51) & 1));
  }
  else {
    char v52 = *((unsigned char *)self + 449) | 2;
  }
  *((unsigned char *)self + 449) = v52;
  v53 = [v6 objectForKey:*MEMORY[0x1E4FA72E8]];

  if (v53) {
    int v54 = safeIntValue(v53);
  }
  else {
    int v54 = -1;
  }
  self->_unlockActionButtonTag = v54;
  v55 = [v6 objectForKey:*MEMORY[0x1E4FA7310]];
  v56 = safeStringValue(v55);
  [(SBUserNotificationAlert *)self setDefaultResponseLaunchBundleID:v56];

  v57 = [v6 objectForKey:*MEMORY[0x1E4FA7318]];
  v172 = safeStringValue(v57);

  if (v172)
  {
    v58 = [MEMORY[0x1E4F1CB10] URLWithString:v172];
    [(SBUserNotificationAlert *)self setDefaultResponseLaunchURL:v58];
  }
  v59 = [v6 objectForKey:*MEMORY[0x1E4FA7370]];
  v60 = safeStringValue(v59);
  v61 = [v6 objectForKey:*MEMORY[0x1E4FA7368]];
  v62 = safeStringValue(v61);
  v63 = [v6 objectForKey:*MEMORY[0x1E4FA7360]];
  v64 = safeStringValue(v63);
  v65 = [(SBUserNotificationAlert *)self _imageDefinitionForPath:v60 catalogPath:v62 catalogImageKey:v64];
  headerImageDefinition = self->_headerImageDefinition;
  self->_headerImageDefinition = v65;

  v67 = [v6 objectForKey:*MEMORY[0x1E4FA7398]];
  v68 = safeStringValue(v67);
  v69 = [v6 objectForKey:*MEMORY[0x1E4FA7390]];
  v70 = safeStringValue(v69);
  v71 = [v6 objectForKey:*MEMORY[0x1E4FA7388]];
  v72 = safeStringValue(v71);
  v73 = [(SBUserNotificationAlert *)self _imageDefinitionForPath:v68 catalogPath:v70 catalogImageKey:v72];
  iconImageDefinition = self->_iconImageDefinition;
  self->_iconImageDefinition = v73;

  v75 = [v6 objectForKey:*MEMORY[0x1E4FA72D0]];
  v76 = safeStringValue(v75);
  v77 = [v6 objectForKey:*MEMORY[0x1E4FA72C8]];
  v78 = safeStringValue(v77);
  v79 = [v6 objectForKey:*MEMORY[0x1E4FA72C0]];
  v80 = safeStringValue(v79);
  v81 = [(SBUserNotificationAlert *)self _imageDefinitionForPath:v76 catalogPath:v78 catalogImageKey:v80];
  attachmentImageDefinition = self->_attachmentImageDefinition;
  self->_attachmentImageDefinition = v81;

  v83 = [v6 objectForKey:*MEMORY[0x1E4F1DA18]];
  v84 = safeStringValue(v83);
  [(SBUserNotificationAlert *)self setSoundPath:v84];

  v85 = [v6 objectForKey:*MEMORY[0x1E4FA7420]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v86 = [v85 unsignedIntValue];
  }
  else {
    uint64_t v86 = 0;
  }
  [(SBUserNotificationAlert *)self setSoundID:v86];
  v87 = [v6 objectForKey:*MEMORY[0x1E4FA7418]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v88 = [v87 unsignedIntValue];
  }
  else {
    uint64_t v88 = 1;
  }
  [(SBUserNotificationAlert *)self setSoundIDBehavior:v88];
  v89 = [v6 objectForKey:*MEMORY[0x1E4FA7400]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v90 = v89;
  }
  else {
    v90 = 0;
  }
  id v91 = v90;
  [(SBUserNotificationAlert *)self setVibrationPattern:v91];

  v170 = [v6 objectForKey:*MEMORY[0x1E4FA73F0]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v92 = [v170 integerValue];
  }
  else {
    uint64_t v92 = 0;
  }
  [(SBUserNotificationAlert *)self setSoundAlertType:v92];
  v93 = [v6 objectForKey:*MEMORY[0x1E4FA73E8]];
  v94 = safeStringValue(v93);
  [(SBUserNotificationAlert *)self setSoundAlertTopic:v94];

  v95 = [v6 objectForKey:*MEMORY[0x1E4FA73F8]];
  if (objc_opt_respondsToSelector())
  {
    [v95 doubleValue];
    int v97 = (int)v96;
  }
  else
  {
    int v97 = 0;
  }
  self->_soundRepeatDuration = (double)v97;

  v98 = [v6 objectForKey:*MEMORY[0x1E4F1D9F8]];
  v169 = safeStringValue(v98);

  if (v169) {
    v99 = (void *)[objc_alloc(MEMORY[0x1E4F4F6D0]) initWithPath:v169];
  }
  else {
    v99 = 0;
  }
  v100 = [v6 objectForKey:*MEMORY[0x1E4F1D990]];
  v101 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v100 withBundle:v99];
  v102 = safeStringValue(v101);
  [(SBUserNotificationAlert *)self setAlertHeader:v102];

  v103 = [v6 objectForKey:*MEMORY[0x1E4F1D9A8]];
  v104 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v103 withBundle:v99];
  [(SBUserNotificationAlert *)self setAlertMessage:v104];

  v105 = [v6 objectForKey:*MEMORY[0x1E4FA7270]];
  v106 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v105 withBundle:v99];
  v107 = safeStringValue(v106);
  [(SBUserNotificationAlert *)self setAlertMessageDelimiter:v107];

  v108 = [v6 objectForKey:*MEMORY[0x1E4FA73A8]];
  v109 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v108 withBundle:v99];
  v110 = safeStringValue(v109);
  [(SBUserNotificationAlert *)self setLockScreenAlertHeader:v110];

  v111 = [v6 objectForKey:*MEMORY[0x1E4FA73B8]];
  v112 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v111 withBundle:v99];
  [(SBUserNotificationAlert *)self setLockScreenAlertMessage:v112];

  v113 = [v6 objectForKey:*MEMORY[0x1E4FA73B0]];
  v114 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v113 withBundle:v99];
  v115 = safeStringValue(v114);
  [(SBUserNotificationAlert *)self setLockScreenAlertMessageDelimiter:v115];

  v116 = [v6 objectForKey:*MEMORY[0x1E4F1D9E0]];
  v117 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v116 withBundle:v99];
  [(SBUserNotificationAlert *)self setDefaultButtonTitle:v117];

  v118 = [v6 objectForKey:*MEMORY[0x1E4F1D9D0]];
  v119 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v118 withBundle:v99];
  [(SBUserNotificationAlert *)self setAlternateButtonTitle:v119];

  v120 = [v6 objectForKey:*MEMORY[0x1E4F1DA10]];
  v121 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v120 withBundle:v99];
  [(SBUserNotificationAlert *)self setOtherButtonTitle:v121];

  v122 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7230]];
  v123 = [(SBUserNotificationAlert *)self _parseTextFieldDefinitions:v122 locBundle:v99];
  textFieldDefinitions = self->_textFieldDefinitions;
  self->_textFieldDefinitions = v123;

  if (!self->_textFieldDefinitions)
  {
    v125 = [(SBUserNotificationAlert *)self _parseLegacyTextFieldDefinitions:v6 locBundle:v99];
    v126 = self->_textFieldDefinitions;
    self->_textFieldDefinitions = v125;
  }
  v127 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FA7228]];
  v128 = [(SBUserNotificationAlert *)self _parseCustomButtonDefinitions:v127 locBundle:v99];
  customButtonDefinitions = self->_customButtonDefinitions;
  self->_customButtonDefinitions = v128;

  v130 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x1E4FA7300]);
  self->_defaultButtonActionStyle = -[SBUserNotificationAlert _uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:](self, "_uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:", [v130 intValue]);

  v131 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x1E4FA73C0]);
  self->_otherButtonActionStyle = -[SBUserNotificationAlert _uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:](self, "_uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:", [v131 intValue]);

  v132 = objc_msgSend(v6, "bs_safeNumberForKey:", *MEMORY[0x1E4FA72B8]);
  v168 = v132;
  if (v132) {
    int64_t v133 = -[SBUserNotificationAlert _uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:](self, "_uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:", [v132 intValue]);
  }
  else {
    int64_t v133 = [(NSString *)self->_alternateButtonTitle length]
  }
        && ![(NSString *)self->_otherButtonTitle length];
  self->_alternateButtonActionStyle = v133;
  v134 = [v6 objectForKey:*MEMORY[0x1E4FA7410]];
  uint64_t v135 = isSafePlistTrueBoolean(v134);

  [(SBUserNotificationAlert *)self setPrefersSystemAperturePresentation:v135];
  if (v135)
  {
    v136 = objc_msgSend(v6, "bs_safeDictionaryForKey:", *MEMORY[0x1E4FA7408]);
    v137 = [(SBUserNotificationAlert *)self _parseSystemApertureContentDefinition:v136];
    [(SBUserNotificationAlert *)self setSystemApertureContentDefinition:v137];
  }
  v178[0] = MEMORY[0x1E4F143A8];
  v178[1] = 3221225472;
  v178[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_145;
  v178[3] = &unk_1E6AF4AC0;
  v178[4] = self;
  v167 = (void (**)(void))MEMORY[0x1D948C7A0](v178);
  v138 = [v6 objectForKey:*MEMORY[0x1E4FA73D8]];
  v139 = safeStringValue(v138);
  [(SBUserNotificationAlert *)self setRemoteServiceBundleIdentifier:v139];

  v140 = [v6 objectForKey:*MEMORY[0x1E4FA73E0]];
  v141 = safeStringValue(v140);
  [(SBUserNotificationAlert *)self setRemoteViewControllerClassName:v141];

  if ((self->_remoteServiceBundleIdentifier == 0) != (self->_remoteViewControllerClassName == 0))
  {
    v158 = [MEMORY[0x1E4F28B00] currentHandler];
    [v158 handleFailureInMethod:a2 object:self file:@"SBUserNotificationAlert.m" lineNumber:675 description:@"Must specify both SBUserNotificationRemoteServiceBundleIdentifier and SBUserNotificationRemoteViewControllerClassName or neither"];
  }
  v142 = [v6 objectForKey:*MEMORY[0x1E4FA7348]];
  v143 = safeStringValue(v142);
  [(SBUserNotificationAlert *)self setExtensionIdentifier:v143];

  p_extensionIdentifier = (uint64_t *)&self->_extensionIdentifier;
  extensionIdentifier = self->_extensionIdentifier;
  if (extensionIdentifier)
  {
    id v177 = 0;
    v146 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:extensionIdentifier error:&v177];
    id v162 = v177;
    if (v146)
    {
      v164 = [v6 objectForKey:*MEMORY[0x1E4FA7350]];
      if (v164)
      {
        v147 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v164 error:0];
        v161 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v160 = objc_opt_class();
        uint64_t v159 = objc_opt_class();
        uint64_t v148 = objc_opt_class();
        uint64_t v149 = objc_opt_class();
        uint64_t v150 = objc_opt_class();
        uint64_t v151 = objc_opt_class();
        v152 = objc_msgSend(v161, "setWithObjects:", v160, v159, v148, v149, v150, v151, objc_opt_class(), 0);
        v153 = [v147 decodeObjectOfClasses:v152 forKey:*MEMORY[0x1E4F284E8]];
        [v147 finishDecoding];
      }
      else
      {
        v153 = 0;
      }
      v175[0] = MEMORY[0x1E4F143A8];
      v175[1] = 3221225472;
      v175[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_163;
      v175[3] = &unk_1E6AF9778;
      v175[4] = self;
      v176 = v167;
      [v146 instantiateViewControllerWithInputItems:v153 connectionHandler:v175];
    }
    else
    {
      v157 = SBLogCFUserNotifications();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR)) {
        -[SBUserNotificationAlert updateWithMessage:requestFlags:](p_extensionIdentifier, v162, v157);
      }

      v167[2]();
    }
  }
  else
  {
    remoteViewControllerClassName = self->_remoteViewControllerClassName;
    if (remoteViewControllerClassName && (remoteServiceBundleIdentifier = self->_remoteServiceBundleIdentifier) != 0)
    {
      v173[0] = MEMORY[0x1E4F143A8];
      v173[1] = 3221225472;
      v173[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_169;
      v173[3] = &unk_1E6AF97A0;
      v173[4] = self;
      v174 = v167;
      id v156 = +[_UIRemoteViewController requestViewController:remoteViewControllerClassName fromServiceWithBundleIdentifier:remoteServiceBundleIdentifier connectionHandler:v173];
    }
    else
    {
      v167[2]();
    }
  }
}

uint64_t __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 hasPrefix:@"swift-playgrounds"];
  if (v3)
  {
    v4 = SBLogCFUserNotifications();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v2;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "Filtering swift-playgrounds bundleID '%@' from 'allowed' set for user notification", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

void __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_145(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v1 + 448) & 4) != 0)
  {
    v4 = +[SBAlertItemsController sharedInstance];
    id v5 = [v4 visibleAlertItem];
    int v6 = *(void **)(a1 + 32);

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_2;
    v18[3] = &unk_1E6AF5290;
    v18[4] = *(void *)(a1 + 32);
    id v7 = v4;
    id v19 = v7;
    uint64_t v8 = (void (**)(void))MEMORY[0x1D948C7A0](v18);
    uint64_t v9 = v8;
    if (v5 == v6)
    {
      id v11 = (void *)MEMORY[0x1E4F42FF8];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_3;
      v14[3] = &unk_1E6AF5A00;
      char v17 = v8;
      id v12 = v7;
      uint64_t v13 = *(void *)(a1 + 32);
      id v15 = v12;
      uint64_t v16 = v13;
      [v11 _performWithoutDeferringTransitions:v14];
    }
    else
    {
      v8[2](v8);
      [v7 activateAlertItem:*(void *)(a1 + 32) animated:1];
    }
  }
  else if (*(unsigned char *)(v1 + 145))
  {
    id v2 = *(void **)(a1 + 32);
    [v2 _cleanupCustomContentViewControllers];
  }
  else
  {
    char v10 = (void *)MEMORY[0x1E4FA7938];
    objc_msgSend(v10, "activateAlertItem:");
  }
}

uint64_t __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 450) |= 2u;
  uint64_t result = [*(id *)(a1 + 40) deactivateAlertItem:*(void *)(a1 + 32) reason:5 animated:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 450) &= ~2u;
  return result;
}

uint64_t __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_3(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  return [v2 activateAlertItem:v3 animated:0];
}

void __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_163(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 392), a3);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 392), "setUserNotification:");
    uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 392);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_2_164;
    v14[3] = &unk_1E6AF5300;
    char v10 = &v15;
    id v15 = *(id *)(a1 + 40);
    [v9 configureWithCompletion:v14];
  }
  else
  {
    id v11 = SBLogCFUserNotifications();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_163_cold_1(v8, v11);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_166;
    v12[3] = &unk_1E6AF5300;
    char v10 = &v13;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], v12);
  }
}

void __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_2_164(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_3_165;
  block[3] = &unk_1E6AF5300;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_3_165(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_166(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_169(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!v6 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 400), a2);
    id v7 = [*(id *)(*(void *)(a1 + 32) + 400) view];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v8 = *(void **)(*(void *)(a1 + 32) + 400);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_2_170;
    v9[3] = &unk_1E6AF5300;
    id v10 = *(id *)(a1 + 40);
    [v8 _getPreferredContentSizeWithReplyBlock:v9];
  }
}

uint64_t __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_2_170(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  if (!self->_cleanedUp)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBUserNotificationAlert.m", 736, @"Invalid parameter not satisfying: %@", @"_cleanedUp == YES" object file lineNumber description];
  }
  portWatcher = self->_portWatcher;
  if (portWatcher) {
    dispatch_source_cancel(portWatcher);
  }
  expirationTimer = self->_expirationTimer;
  if (expirationTimer) {
    dispatch_source_cancel(expirationTimer);
  }
  [(NSTimer *)self->_soundStopTimer invalidate];
  [(BKSProcessAssertion *)self->_processAssertion invalidate];
  id v5 = self->_viewServiceContentViewController;
  id v6 = self->_extensionContentViewController;
  id v7 = self->_sound;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __34__SBUserNotificationAlert_dealloc__block_invoke;
  char v17 = &unk_1E6AF4E00;
  long long v18 = v6;
  id v19 = v5;
  long long v20 = v7;
  id v8 = v7;
  uint64_t v9 = v5;
  id v10 = v6;
  BSDispatchMain();

  v13.receiver = self;
  v13.super_class = (Class)SBUserNotificationAlert;
  [(SBUserNotificationAlert *)&v13 dealloc];
}

void __34__SBUserNotificationAlert_dealloc__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__SBUserNotificationAlert_dealloc__block_invoke_2;
  v4[3] = &unk_1E6AF4AC0;
  id v5 = v2;
  [v5 invalidateWithCompletion:v4];
  id v3 = (id)[*(id *)(a1 + 40) disconnect];
  [*(id *)(a1 + 48) stop];
}

id __34__SBUserNotificationAlert_dealloc__block_invoke_2(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) disconnect];
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_alertHeader withName:@"title"];
  id v5 = (id)[v3 appendObject:self->_alertSource withName:@"source"];
  id v6 = (id)[v3 appendObject:self->_sound withName:@"sound" skipIfNil:1];
  id v7 = [v3 build];

  return (NSString *)v7;
}

- (id)_publicDescription
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_alertHeader withName:@"title"];
  id v5 = (id)[v3 appendObject:self->_alertSource withName:@"source"];
  id v6 = (id)[v3 appendInt:self->_originatingPID withName:@"pid"];
  id v7 = (id)[v3 appendObject:self->_sound withName:@"sound" skipIfNil:1];
  id v8 = [v3 build];

  return v8;
}

- (int)token
{
  return self->_token;
}

- (BOOL)shouldShowInLockScreen
{
  return (*((unsigned __int8 *)self + 448) >> 3) & 1;
}

- (BOOL)dismissOnLock
{
  return (*((unsigned __int8 *)self + 448) >> 5) & 1;
}

- (BOOL)allowMenuButtonDismissal
{
  return *((unsigned char *)self + 449) & 1;
}

- (BOOL)wakeDisplay
{
  return (*((unsigned __int8 *)self + 449) >> 1) & 1;
}

- (BOOL)_displayActionButtonOnLockScreen
{
  return (*((unsigned __int8 *)self + 448) >> 4) & 1;
}

- (void)willActivate
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "Can't activate a cleaned up alert", v1, 2u);
}

- (id)sound
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!self->_sound)
  {
    if (self->_soundPath)
    {
      id v3 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
      if (v3)
      {
        int64_t soundAlertType = self->_soundAlertType;
        id v5 = objc_alloc(MEMORY[0x1E4FAF5E8]);
        if (soundAlertType)
        {
          id v6 = [v5 initWithType:self->_soundAlertType];
          p_soundAlertTopic = &self->_soundAlertTopic;
        }
        else
        {
          id v6 = [v5 initWithType:16];
          p_soundAlertTopic = (NSString **)MEMORY[0x1E4FAF630];
        }
        [v6 setTopic:*p_soundAlertTopic];
        [v6 setExternalToneFileURL:v3];
        [v6 setShouldRepeat:self->_soundRepeatDuration > 0.0];
        [v6 setMaximumDuration:self->_soundRepeatDuration];
        if (self->_vibrationPattern) {
          -[NSObject setExternalVibrationPattern:](v6, "setExternalVibrationPattern:");
        }
        else {
          [v6 setVibrationIdentifier:*MEMORY[0x1E4FAF640]];
        }
        id v11 = objc_alloc(MEMORY[0x1E4FA79C8]);
        id v12 = [MEMORY[0x1E4FAF5E0] alertWithConfiguration:v6];
        objc_super v13 = (SBUISound *)[v11 initWithToneAlert:v12];
        sound = self->_sound;
        self->_sound = v13;
      }
      else
      {
        id v6 = SBLogCFUserNotifications();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          soundPath = self->_soundPath;
          int v17 = 138543362;
          long long v18 = soundPath;
          _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "Unable to create file URL for sound path: '%{public}@'", (uint8_t *)&v17, 0xCu);
        }
      }
    }
    else if (self->_soundID)
    {
      id v8 = (SBUISound *)[objc_alloc(MEMORY[0x1E4FA79C8]) initWithSystemSoundID:self->_soundID behavior:self->_soundIDBehavior vibrationPattern:self->_vibrationPattern];
      uint64_t v9 = self->_sound;
      self->_sound = v8;
    }
  }
  uint64_t v15 = self->_sound;
  return v15;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  BOOL v4 = a3;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if (a3) {
    char v6 = 64;
  }
  else {
    char v6 = 0;
  }
  *((unsigned char *)self + 449) = *((unsigned char *)self + 449) & 0xBF | v6;
  if (a4) {
    char v7 = 0x80;
  }
  else {
    char v7 = 0;
  }
  *((unsigned char *)self + 449) = v7 & 0x80 | *((unsigned char *)self + 449) & 0x7F;
  id v8 = [(SBAlertItem *)self alertController];
  if (v4)
  {
    p_lockScreenAlertHeader = &self->_lockScreenAlertHeader;
    if (self->_lockScreenAlertHeader && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (p_lockScreenAlertHeader = &self->_alertHeader, self->_alertHeader)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v8 setTitle:*p_lockScreenAlertHeader];
    }
    p_lockScreenAlertMessage = &self->_lockScreenAlertMessage;
    if (self->_lockScreenAlertMessage)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = 208;
LABEL_22:
        id v12 = *(__CFString **)((char *)&self->super.super.isa + v11);
        if (!v12) {
          id v12 = @" ";
        }
        id v13 = *p_lockScreenAlertMessage;
        uint64_t v14 = v12;
        uint64_t v15 = [v13 componentsJoinedByString:v14];
        id v16 = *p_lockScreenAlertMessage;
        id *p_lockScreenAlertMessage = (id)v15;

        goto LABEL_25;
      }
      goto LABEL_25;
    }
  }
  else if (self->_alertHeader)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v8 setTitle:self->_alertHeader];
    }
  }
  p_lockScreenAlertMessage = &self->_alertMessage;
  if (!self->_alertMessage) {
    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = 184;
    goto LABEL_22;
  }
LABEL_25:
  [v8 setMessage:*p_lockScreenAlertMessage];
LABEL_26:
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  int v17 = self->_textFieldDefinitions;
  uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v68 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke;
        v66[3] = &unk_1E6AF97C8;
        v66[4] = v22;
        v66[5] = self;
        [v8 addTextFieldWithConfigurationHandler:v66];
      }
      uint64_t v19 = [(NSArray *)v17 countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v19);
  }

  unint64_t requestFlags = self->_requestFlags;
  if ([(NSString *)self->_alternateButtonTitle length]) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = [(NSString *)self->_otherButtonTitle length] != 0;
  }
  NSUInteger v25 = [(NSArray *)self->_customButtonDefinitions count];
  if ((v25 || v24 || (requestFlags & 0x20) == 0)
    && (!v4 || [(SBUserNotificationAlert *)self _displayActionButtonOnLockScreen]))
  {
    if (v25)
    {
      if ([(NSArray *)self->_customButtonDefinitions count])
      {
        unint64_t v26 = 0;
        unint64_t v27 = 0x1E4F42000uLL;
        do
        {
          long long v28 = [(NSArray *)self->_customButtonDefinitions objectAtIndexedSubscript:v26];
          long long v29 = [v28 title];
          if ([v29 length])
          {
            uint64_t v30 = *(void **)(v27 + 1824);
            int64_t v31 = -[SBUserNotificationAlert _uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:](self, "_uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:", [v28 presentationStyle]);
            v65[0] = MEMORY[0x1E4F143A8];
            v65[1] = 3221225472;
            v65[2] = __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_2;
            v65[3] = &unk_1E6AF97F0;
            v65[4] = self;
            v65[5] = v26;
            v32 = [v30 actionWithTitle:v29 style:v31 handler:v65];
            [v8 addAction:v32];
            if ([v28 isPreferredButton])
            {
              unint64_t v33 = v27;
              [v8 setPreferredAction:v32];
              v34 = SBLogCFUserNotifications();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v35 = [v32 style];
                *(_DWORD *)buf = 134217984;
                uint64_t v72 = v35;
                _os_log_impl(&dword_1D85BA000, v34, OS_LOG_TYPE_DEFAULT, "presenting defaultAction with style: %ld", buf, 0xCu);
              }

              unint64_t v27 = v33;
            }
          }
          ++v26;
        }
        while (v26 < [(NSArray *)self->_customButtonDefinitions count]);
      }
    }
    else
    {
      if ([(NSString *)self->_alternateButtonTitle length])
      {
        alternateButtonTitle = self->_alternateButtonTitle;
        int64_t alternateButtonActionStyle = self->_alternateButtonActionStyle;
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_205;
        v64[3] = &unk_1E6AF4918;
        v64[4] = self;
        char v38 = [MEMORY[0x1E4F42720] actionWithTitle:alternateButtonTitle style:alternateButtonActionStyle handler:v64];
        [v8 addAction:v38];
        if (self->_defaultButtonTag == 1) {
          [v8 setPreferredAction:v38];
        }
      }
      if ([(NSString *)self->_otherButtonTitle length])
      {
        otherButtonTitle = self->_otherButtonTitle;
        int64_t otherButtonActionStyle = self->_otherButtonActionStyle;
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_2_206;
        v63[3] = &unk_1E6AF4918;
        v63[4] = self;
        v41 = [MEMORY[0x1E4F42720] actionWithTitle:otherButtonTitle style:otherButtonActionStyle handler:v63];
        [v8 addAction:v41];
        if (self->_defaultButtonTag == 2) {
          [v8 setPreferredAction:v41];
        }
      }
      v42 = self->_defaultButtonTitle;
      if (!v42)
      {
        if ((self->_requestFlags & 0x20) != 0)
        {
          v42 = 0;
        }
        else
        {
          char v43 = [MEMORY[0x1E4F28B50] mainBundle];
          v42 = [v43 localizedStringForKey:@"OK" value:&stru_1F3084718 table:@"SpringBoard"];
        }
      }
      if ([(NSString *)v42 length])
      {
        int64_t defaultButtonActionStyle = self->_defaultButtonActionStyle;
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_3;
        v62[3] = &unk_1E6AF4918;
        v62[4] = self;
        char v45 = [MEMORY[0x1E4F42720] actionWithTitle:v42 style:defaultButtonActionStyle handler:v62];
        [v8 addAction:v45];
        v46 = SBLogCFUserNotifications();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v47 = self->_defaultButtonActionStyle;
          *(_DWORD *)buf = 134217984;
          uint64_t v72 = v47;
          _os_log_impl(&dword_1D85BA000, v46, OS_LOG_TYPE_DEFAULT, "presenting defaultAction with style: %ld", buf, 0xCu);
        }

        if (self->_defaultButtonTag <= 0) {
          [v8 setPreferredAction:v45];
        }
      }
    }
  }
  extensionContentViewController = self->_extensionContentViewController;
  if (extensionContentViewController)
  {
    [(_UIRemoteViewController *)extensionContentViewController setServiceViewShouldShareTouchesWithHost:1];
    viewServiceContentViewController = self->_extensionContentViewController;
LABEL_74:
    [v8 setContentViewController:viewServiceContentViewController];
    goto LABEL_75;
  }
  viewServiceContentViewController = self->_viewServiceContentViewController;
  if (viewServiceContentViewController) {
    goto LABEL_74;
  }
LABEL_75:
  char v50 = [v8 title];
  if (v50 || ([v8 message], (char v50 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v51 = [v8 actions];
    if ([v51 count])
    {
    }
    else
    {
      char v52 = [v8 contentViewController];

      if (!v52)
      {
        v53 = SBLogCFUserNotifications();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          alertSource = self->_alertSource;
          *(_DWORD *)buf = 138543362;
          uint64_t v72 = (uint64_t)alertSource;
          _os_log_impl(&dword_1D85BA000, v53, OS_LOG_TYPE_DEFAULT, "'%{public}@' trying to show malformed CFUserNotification.", buf, 0xCu);
        }

        if (os_variant_has_internal_content())
        {
          v55 = [NSString stringWithFormat:@"%@ trying to show malformed CFUserNotification. Please file Radar.", self->_alertSource];
          [v8 setTitle:v55];
        }
        v56 = (void *)MEMORY[0x1E4F42720];
        v57 = [MEMORY[0x1E4F28B50] mainBundle];
        v58 = [v57 localizedStringForKey:@"OK" value:&stru_1F3084718 table:@"SpringBoard"];
        int64_t v59 = self->_defaultButtonActionStyle;
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_217;
        v61[3] = &unk_1E6AF4918;
        v61[4] = self;
        v60 = [v56 actionWithTitle:v58 style:v59 handler:v61];
        [v8 addAction:v60];
      }
    }
  }
}

void __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [*(id *)(a1 + 32) value];
  [v5 setText:v3];

  BOOL v4 = [*(id *)(a1 + 32) title];
  [v5 setPlaceholder:v4];

  objc_msgSend(v5, "setSecureTextEntry:", objc_msgSend(*(id *)(a1 + 32), "isSecure"));
  [v5 setKeyboardAppearance:1];
  objc_msgSend(v5, "setAutocapitalizationType:", objc_msgSend(*(id *)(a1 + 32), "autocapitalizationType"));
  objc_msgSend(v5, "setAutocorrectionType:", objc_msgSend(*(id *)(a1 + 32), "autocorrectionType"));
  objc_msgSend(v5, "setKeyboardType:", objc_msgSend(*(id *)(a1 + 32), "keyboardType"));
  if ([*(id *)(a1 + 32) _hasSetMaxLength])
  {
    objc_msgSend(v5, "sb_setMaxInputLength:", objc_msgSend(*(id *)(a1 + 32), "maxLength"));
    [v5 setDelegate:*(void *)(a1 + 40)];
  }
}

uint64_t __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissIfNecessaryWithResponse:2 customButtonResponse:*(unsigned int *)(a1 + 40)];
}

uint64_t __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_205(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissIfNecessaryWithResponse:1];
}

uint64_t __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_2_206(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissIfNecessaryWithResponse:2];
}

uint64_t __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissIfNecessaryWithResponse:0];
}

uint64_t __63__SBUserNotificationAlert_configure_requirePasscodeForActions___block_invoke_217(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissIfNecessaryWithResponse:0];
}

- (id)elementIdentifier
{
  v6.receiver = self;
  v6.super_class = (Class)SBUserNotificationAlert;
  id v3 = [(SBAlertItem *)&v6 elementIdentifier];
  BOOL v4 = objc_msgSend(v3, "stringByAppendingFormat:", @"-<%p>", self);

  return v4;
}

- (id)clientIdentifier
{
  alertSource = self->_alertSource;
  if (alertSource)
  {
    id v3 = alertSource;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"process with pid:%d", self->_originatingPID);
    id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_createSystemApertureElement
{
  if (![(SBUserNotificationAlert *)self prefersSystemAperturePresentation])
  {
    id v10 = 0;
    goto LABEL_46;
  }
  id v3 = [(SBUserNotificationAlert *)self systemApertureContentDefinition];
  id v4 = objc_alloc_init(MEMORY[0x1E4FA7D70]);
  id v5 = [v3 leadingAssetDefinition];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    char v7 = [(SBUserNotificationAlert *)self _imageForDefinition:v6];
    if (!v7)
    {
LABEL_13:

LABEL_14:
      goto LABEL_15;
    }
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FA7D80]) initWithImage:v7];
    uint64_t v9 = objc_msgSend(v6, "sb_resolvedTintColor");
    if (v9) {
      [v8 setContentColor:v9];
    }
    [v4 setLeadingContentViewProvider:v8];

LABEL_12:
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 caPackagePath];
    if (!v6) {
      goto LABEL_14;
    }
    uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
    if (!v11) {
      goto LABEL_14;
    }
    char v7 = (void *)v11;
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FA7D68]) initWithURL:v11];
    [v4 setLeadingContentViewProvider:v8];
    goto LABEL_12;
  }
LABEL_15:
  char v50 = v5;
  id v12 = [v3 alertTextAlignment];
  v49 = v12;
  if (v12) {
    uint64_t v13 = (int)safeIntValue(v12);
  }
  else {
    uint64_t v13 = 4;
  }
  uint64_t v14 = [v3 alertHeader];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    id v16 = [(SBUserNotificationAlert *)self alertHeader];
  }
  int v17 = v16;

  uint64_t v18 = [v3 alertMessage];
  uint64_t v19 = [v18 length];
  int64_t v47 = v17;
  if ([v17 length])
  {
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4FA7DB0]), "initWithText:style:", v17, v19 != 0, v17, v49);
    [v20 setTextAlignment:v13];
    [v20 setNumberOfLines:0];
    v21 = [v3 alertHeaderColor];
    uint64_t v22 = objc_msgSend(v21, "sb_resolvedColor");

    if (v22) {
      [v20 setContentColor:v22];
    }
    [v4 setPrimaryContentViewProvider:v20];
  }
  if (v19)
  {
    id v23 = (void *)[objc_alloc(MEMORY[0x1E4FA7DB0]) initWithText:v18 style:3];
    [v23 setTextAlignment:v13];
    [v23 setNumberOfLines:0];
    [v4 setSecondaryContentViewProvider:v23];
  }
  BOOL v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v47);
  objc_initWeak(&location, self);
  NSUInteger v25 = [v3 defaultButtonTitle];
  if ([v25 length])
  {
    id v26 = objc_alloc(MEMORY[0x1E4FA7D58]);
    unint64_t v27 = (void *)MEMORY[0x1E4F426E8];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke_2;
    v53[3] = &unk_1E6AF9818;
    objc_copyWeak(&v54, &location);
    long long v28 = [v27 actionWithTitle:v25 image:0 identifier:0 handler:v53];
    long long v29 = (void *)[v26 initWithDefaultTextActionConfigurationWithAction:v28];

    int64_t v31 = __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke(v30, self->_defaultButtonActionStyle);
    if (v31) {
      [v29 setContentColor:v31];
    }
    [v24 addObject:v29];

    objc_destroyWeak(&v54);
  }
  v32 = [v3 alternateButtonTitle];
  unint64_t v33 = v32;
  if (v32)
  {
    id v34 = v32;
  }
  else
  {
    id v34 = [(SBUserNotificationAlert *)self alternateButtonTitle];
  }
  uint64_t v35 = v34;

  if ([v35 length])
  {
    id v36 = objc_alloc(MEMORY[0x1E4FA7D58]);
    objc_super v37 = (void *)MEMORY[0x1E4F426E8];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke_3;
    v51[3] = &unk_1E6AF9818;
    objc_copyWeak(&v52, &location);
    char v38 = [v37 actionWithTitle:v35 image:0 identifier:0 handler:v51];
    v39 = (void *)[v36 initWithDefaultTextActionConfigurationWithAction:v38];

    v41 = __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke(v40, self->_alternateButtonActionStyle);
    if (v41) {
      [v39 setContentColor:v41];
    }
    [v24 addObject:v39];

    objc_destroyWeak(&v52);
  }
  uint64_t v42 = [v24 count];
  if (v42)
  {
    if (v42 == 1)
    {
      char v43 = [v24 firstObject];
    }
    else
    {
      char v43 = (void *)[objc_alloc(MEMORY[0x1E4FA7DA8]) initWithContentViewProviders:v24];
    }
    [v4 setActionContentViewProvider:v43];
  }
  id v10 = [(SBSystemApertureProvidedContentElement *)[_SBUserNotificationAlertElement alloc] initWithIdentifier:self contentProvider:v4];
  v44 = [v3 keyColor];
  char v45 = objc_msgSend(v44, "sb_resolvedColor");

  if (v45) {
    [(_SBUserNotificationAlertElement *)v10 setKeyColor:v45];
  }
  -[_SBUserNotificationAlertElement setPreventsAutomaticDismissal:](v10, "setPreventsAutomaticDismissal:", [v3 preventsAutomaticDismissal]);

  objc_destroyWeak(&location);
LABEL_46:
  return v10;
}

id __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    id v2 = [MEMORY[0x1E4F428B8] systemRedColor];
  }
  else if (a2 == 1)
  {
    id v2 = [MEMORY[0x1E4F428B8] systemBlueColor];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

void __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissIfNecessaryWithResponse:0];
}

void __55__SBUserNotificationAlert__createSystemApertureElement__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissIfNecessaryWithResponse:1];
}

- (id)_prepareNewAlertControllerWithLockedState:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(SBUserNotificationAlert *)self _clearRemoteViewControllerIfPresent];
  v9.receiver = self;
  v9.super_class = (Class)SBUserNotificationAlert;
  char v7 = [(SBAlertItem *)&v9 _prepareNewAlertControllerWithLockedState:v5 requirePasscodeForActions:v4];
  return v7;
}

- (void)_clearRemoteViewControllerIfPresent
{
  id v3 = [(SBAlertItem *)self alertController];
  if ((*((unsigned char *)self + 448) & 4) == 0)
  {
    if (v3)
    {
      if (self->_extensionContentViewController)
      {
        id v8 = v3;
        BOOL v4 = [v3 contentViewController];
        extensionContentViewController = self->_extensionContentViewController;

        id v3 = v8;
        if (v4 == extensionContentViewController)
        {
          [v8 setContentViewController:0];
          id v3 = v8;
        }
      }
    }
  }
  if ((*((unsigned char *)self + 448) & 4) == 0)
  {
    if (v3)
    {
      if (self->_viewServiceContentViewController)
      {
        id v9 = v3;
        id v6 = [v3 contentViewController];
        viewServiceContentViewController = self->_viewServiceContentViewController;

        id v3 = v9;
        if (v6 == viewServiceContentViewController)
        {
          [v9 setContentViewController:0];
          id v3 = v9;
        }
      }
    }
  }
}

- (void)doCleanupAfterDeactivationAnimation
{
  v3.receiver = self;
  v3.super_class = (Class)SBUserNotificationAlert;
  [(SBAlertItem *)&v3 doCleanupAfterDeactivationAnimation];
  [(SBUserNotificationAlert *)self _clearRemoteViewControllerIfPresent];
}

- (void)_setActivated:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_cleanedUp && a3)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"SBUserNotificationAlert.m" lineNumber:1164 description:@"cannot activate an already cleaned up alert"];
  }
  if (v3) {
    int v6 = 4;
  }
  else {
    int v6 = 0;
  }
  *((unsigned char *)self + 448) = *((unsigned char *)self + 448) & 0xFB | v6;
  expirationTimer = self->_expirationTimer;
  if (expirationTimer)
  {
    dispatch_source_cancel(expirationTimer);
    id v8 = self->_expirationTimer;
    self->_expirationTimer = 0;

    int v6 = *((unsigned char *)self + 448) & 4;
  }
  if (v6)
  {
    if (self->_timeout >= 1)
    {
      id v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 2uLL, 0, MEMORY[0x1E4F14428]);
      id v10 = self->_expirationTimer;
      self->_expirationTimer = v9;

      dispatch_time_t v11 = dispatch_time(0x8000000000000000, 1000000000 * self->_timeout);
      dispatch_source_set_timer((dispatch_source_t)self->_expirationTimer, v11, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      id v12 = self->_expirationTimer;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __41__SBUserNotificationAlert__setActivated___block_invoke;
      handler[3] = &unk_1E6AF4AC0;
      void handler[4] = self;
      dispatch_source_set_event_handler(v12, handler);
      dispatch_resume((dispatch_object_t)self->_expirationTimer);
    }
  }
}

void __41__SBUserNotificationAlert__setActivated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) cancel];
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 136);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void **)(v3 + 136);
    *(void *)(v3 + 136) = 0;
  }
}

- (void)_cleanup
{
  if (!self->_cleanedUp)
  {
    [(SBUserNotificationAlert *)self _setActivated:0];
    portWatcher = self->_portWatcher;
    if (portWatcher)
    {
      dispatch_source_cancel(portWatcher);
      BOOL v4 = self->_portWatcher;
      self->_portWatcher = 0;
    }
    expirationTimer = self->_expirationTimer;
    if (expirationTimer)
    {
      dispatch_source_cancel(expirationTimer);
      int v6 = self->_expirationTimer;
      self->_expirationTimer = 0;
    }
    self->_cleanedUp = 1;
    if ([(SBAlertItem *)self _presentationState] == 4) {
      [(SBUserNotificationAlert *)self _cleanupCustomContentViewControllers];
    }
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"SBUserNotificationDoneNotification" object:self];
  }
}

- (void)cancel
{
  *((unsigned char *)self + 448) |= 2u;
  if (!self->_sentResponse) {
    [(SBUserNotificationAlert *)self _sendResponseAndCleanUp:3];
  }
  [(SBAlertItem *)self deactivate];
}

- (void)_sendResponseAndCleanUp:(int)a3
{
}

- (void)_sendResponseAndCleanUp:(int)a3 customButtonResponse:(int)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (!self->_sentResponse)
  {
    uint64_t v4 = *(void *)&a4;
    self->_sentResponse = 1;
    id v7 = [(SBAlertItem *)self alertController];
    self->_replyFlags = a3;
    id v8 = [v7 textFields];
    int v9 = [v8 count];

    if (self->_replyFlags == 3 || v9 < 1)
    {
      dispatch_time_t v11 = 0;
    }
    else if (v9 == 1)
    {
      id v12 = [v7 textFields];
      uint64_t v13 = [v12 objectAtIndex:0];
      uint64_t v14 = [v13 text];

      if (v14) {
        dispatch_time_t v11 = (__CFString *)v14;
      }
      else {
        dispatch_time_t v11 = &stru_1F3084718;
      }
    }
    else
    {
      dispatch_time_t v11 = (__CFString *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
      uint64_t v15 = 0;
      do
      {
        id v16 = [v7 textFields];
        int v17 = [v16 objectAtIndex:v15];
        uint64_t v18 = [v17 text];

        if (v18) {
          uint64_t v19 = v18;
        }
        else {
          uint64_t v19 = &stru_1F3084718;
        }
        [(__CFString *)v11 addObject:v19];

        ++v15;
      }
      while (v9 != v15);
      uint64_t v4 = v4;
    }
    uint64_t v20 = SBLogCFUserNotifications();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v32 = v9;
      _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_INFO, "Sending back %d textField response(s) to alert item owner.", buf, 8u);
    }

    if ((v4 & 0x80000000) == 0 || v11)
    {
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      BOOL v24 = v23;
      if (v11) {
        [v23 setObject:v11 forKey:*MEMORY[0x1E4F1DA28]];
      }
      if ((v4 & 0x80000000) == 0)
      {
        NSUInteger v25 = [NSNumber numberWithInt:v4];
        [v24 setObject:v25 forKey:*MEMORY[0x1E4FA7220]];
      }
      CFDataRef Data = CFPropertyListCreateData(0, v24, kCFPropertyListXMLFormat_v1_0, 0, 0);
      CFDataRef v21 = Data;
      if (Data) {
        mach_msg_size_t v22 = ((CFDataGetLength(Data) + 3) & 0xFFFFFFFC) + 28;
      }
      else {
        mach_msg_size_t v22 = 28;
      }
    }
    else
    {
      CFDataRef v21 = 0;
      mach_msg_size_t v22 = 28;
    }
    unint64_t v27 = (char *)malloc_type_calloc(v22, 1uLL, 0x4CB55D88uLL);
    if (v27)
    {
      long long v28 = (UInt8 *)v27;
      *(_DWORD *)unint64_t v27 = 18;
      *((_DWORD *)v27 + 1) = v22;
      p_replyPort = &self->_replyPort;
      *((_DWORD *)v27 + 2) = self->_replyPort;
      *((_DWORD *)v27 + 3) = 0;
      *(void *)(v27 + 20) = self->_replyFlags;
      if (v21)
      {
        v34.length = CFDataGetLength(v21);
        v34.id location = 0;
        CFDataGetBytes(v21, v34, v28 + 28);
      }
      if (mach_msg((mach_msg_header_t *)v28, 1, v22, 0, 0, 0, 0))
      {
        mach_msg_destroy((mach_msg_header_t *)v28);
        unsigned int *p_replyPort = 0;
        uint64_t v30 = SBLogCFUserNotifications();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[SBUserNotificationAlert _sendResponseAndCleanUp:customButtonResponse:]((int *)&self->_replyPort, v30);
        }
      }
      else
      {
        unsigned int *p_replyPort = 0;
        uint64_t v30 = SBLogCFUserNotifications();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[SBUserNotificationAlert _sendResponseAndCleanUp:customButtonResponse:](v30);
        }
      }

      free(v28);
    }
    if (v21) {
      CFRelease(v21);
    }
    [(SBUserNotificationAlert *)self _cleanup];
  }
}

- (void)performUnlockAction
{
  char v2 = *((unsigned char *)self + 450);
  if (self->_unlockActionButtonTag != -1 || (v2 & 1) != 0)
  {
    *((unsigned char *)self + 450) = v2 & 0xFE;
    uint64_t unlockActionButtonTag = self->_unlockActionButtonTag;
    if ((unlockActionButtonTag + 1) <= 1)
    {
      int v6 = [(id)SBApp authenticationController];
      int v7 = [v6 isAuthenticated];

      if (v7)
      {
        defaultResponseLaunchURL = self->_defaultResponseLaunchURL;
        if (defaultResponseLaunchURL)
        {
          id v11 = 0;
          uint64_t unlockActionButtonTag = SBWorkspaceApplicationForURLWithError(defaultResponseLaunchURL, 0, &v11);
          id v9 = v11;
          if (!unlockActionButtonTag) {
            goto LABEL_17;
          }
          goto LABEL_15;
        }
        if (self->_defaultResponseLaunchBundleID)
        {
          id v10 = +[SBApplicationController sharedInstance];
          uint64_t unlockActionButtonTag = [v10 applicationWithBundleIdentifier:self->_defaultResponseLaunchBundleID];

          id v9 = 0;
          if (unlockActionButtonTag)
          {
LABEL_15:
            [(SBUserNotificationAlert *)self _activateApplication:unlockActionButtonTag withURL:v9];

            goto LABEL_16;
          }
LABEL_17:
          [(SBUserNotificationAlert *)self _sendResponseAndCleanUp:unlockActionButtonTag];

          return;
        }
      }
      else if (unlockActionButtonTag == -1)
      {
        return;
      }
      id v9 = 0;
LABEL_16:
      uint64_t unlockActionButtonTag = 0;
      goto LABEL_17;
    }
    id v9 = 0;
    goto LABEL_17;
  }
}

- (void)dismissIfNecessaryWithResponse:(int)a3
{
}

- (void)dismissIfNecessaryWithResponse:(int)a3 customButtonResponse:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (!a3)
  {
    defaultResponseLaunchBundleID = self->_defaultResponseLaunchBundleID;
    defaultResponseLaunchURL = self->_defaultResponseLaunchURL;
    if (defaultResponseLaunchBundleID)
    {
      if (!defaultResponseLaunchURL)
      {
        id v9 = +[SBApplicationController sharedInstance];
        id v10 = [v9 applicationWithBundleIdentifier:self->_defaultResponseLaunchBundleID];

        id v11 = 0;
        if (!v10) {
          goto LABEL_11;
        }
        goto LABEL_8;
      }
LABEL_7:
      id v25 = 0;
      id v10 = SBWorkspaceApplicationForURLWithError(defaultResponseLaunchURL, 0, &v25);
      id v11 = v25;
      if (!v10)
      {
LABEL_11:

        goto LABEL_12;
      }
LABEL_8:
      id v12 = [(id)SBApp authenticationController];
      char v13 = [v12 isAuthenticated];

      if ((v13 & 1) == 0) {
        *((unsigned char *)self + 450) |= 1u;
      }
      uint64_t v14 = objc_alloc_init(SBLockScreenUnlockRequest);
      [(SBLockScreenUnlockRequest *)v14 setSource:10];
      [(SBLockScreenUnlockRequest *)v14 setIntent:3];
      [(SBLockScreenUnlockRequest *)v14 setName:@"SpringBoard: unlock from SBUserNotificationAlert"];
      objc_initWeak(&location, self);
      uint64_t v15 = +[SBLockScreenManager sharedInstance];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __79__SBUserNotificationAlert_dismissIfNecessaryWithResponse_customButtonResponse___block_invoke;
      uint64_t v19 = &unk_1E6AF9840;
      uint64_t v20 = self;
      objc_copyWeak(&v23, &location);
      id v21 = v10;
      id v22 = v11;
      [v15 unlockWithRequest:v14 completion:&v16];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);

      goto LABEL_11;
    }
    if (defaultResponseLaunchURL) {
      goto LABEL_7;
    }
  }
LABEL_12:
  -[SBUserNotificationAlert _setActivated:](self, "_setActivated:", 0, v16, v17, v18, v19, v20);
  [(SBUserNotificationAlert *)self _sendResponseAndCleanUp:v5 customButtonResponse:v4];
  [(SBAlertItem *)self deactivateForButton];
}

void __79__SBUserNotificationAlert_dismissIfNecessaryWithResponse_customButtonResponse___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 450) &= ~1u;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _activateApplication:*(void *)(a1 + 40) withURL:*(void *)(a1 + 48)];
}

- (void)_activateApplication:(id)a3 withURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = +[SBWorkspace mainWorkspace];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__SBUserNotificationAlert__activateApplication_withURL___block_invoke;
  v10[3] = &unk_1E6AF67B0;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 requestTransitionWithBuilder:v10];
}

void __56__SBUserNotificationAlert__activateApplication_withURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__SBUserNotificationAlert__activateApplication_withURL___block_invoke_2;
  v4[3] = &unk_1E6AF5638;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  [v3 modifyApplicationContext:v4];
}

void __56__SBUserNotificationAlert__activateApplication_withURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [[SBDeviceApplicationSceneEntity alloc] initWithApplicationForMainDisplay:*(void *)(a1 + 32)];
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    [(SBWorkspaceEntity *)v3 setObject:v5 forActivationSetting:5];
  }
  [v6 setEntity:v4 forLayoutRole:1];
}

- (BOOL)allowLockScreenDismissal
{
  return *((unsigned char *)self + 472) & 1;
}

- (BOOL)allowInLoginWindow
{
  return *((unsigned char *)self + 448) & 1;
}

- (BOOL)behavesSuperModally
{
  return *((unsigned __int8 *)self + 448) >> 7;
}

- (BOOL)forcesModalAlertAppearance
{
  return (*((unsigned char *)self + 449) & 4) != 0 || *((char *)self + 448) < 0;
}

- (BOOL)dismissesOverlaysOnLockScreen
{
  return (*((unsigned __int8 *)self + 449) >> 3) & 1;
}

- (BOOL)hideOnClonedDisplay
{
  return (*((unsigned __int8 *)self + 449) >> 5) & 1;
}

- (BOOL)reappearsAfterLock
{
  return (*((unsigned char *)self + 448) & 0x20) == 0;
}

- (BOOL)reappearsAfterUnlock
{
  return (*((unsigned __int8 *)self + 448) >> 6) & 1;
}

- (void)_noteSilencingHardwareButtonPressed
{
  id v2 = [(SBUserNotificationAlert *)self sound];
  [v2 stop];
}

- (void)willDeactivateForReason:(int)a3
{
  if ((*((unsigned char *)self + 449) & 0x10) != 0)
  {
    idleTimerDisableAssertion = self->_idleTimerDisableAssertion;
    if (idleTimerDisableAssertion)
    {
      [(BSInvalidatable *)idleTimerDisableAssertion invalidate];
      uint64_t v5 = self->_idleTimerDisableAssertion;
      self->_idleTimerDisableAssertion = 0;
    }
  }
  id v6 = [(SBUserNotificationAlert *)self sound];
  [v6 stop];
}

- (void)didDeactivateForReason:(int)a3
{
  if ((*((unsigned char *)self + 450) & 2) == 0)
  {
    uint64_t v4 = *(void *)&a3;
    if ((*((unsigned char *)self + 448) & 2) == 0)
    {
      char v5 = *((unsigned char *)self + 448);
      LOBYTE(v6) = a3 != 1 && (v5 & 4) != 0;
      if (a3 == 6)
      {
        if (*((unsigned char *)self + 448) & 0x40) != 0 || (*((unsigned char *)self + 450))
        {
          [(SBUserNotificationAlert *)self _setActivated:0];
          goto LABEL_16;
        }
      }
      else
      {
        if (a3)
        {
          if (a3 == 1) {
            goto LABEL_16;
          }
          [(SBUserNotificationAlert *)self _setActivated:0];
          if ((v5 & 4) == 0 || (v4 | 2) == 3) {
            goto LABEL_16;
          }
          goto LABEL_15;
        }
        v6 &= *((unsigned __int8 *)self + 448) >> 5;
      }
      [(SBUserNotificationAlert *)self _setActivated:0];
      if ((v6 & 1) == 0)
      {
LABEL_16:
        v7.receiver = self;
        v7.super_class = (Class)SBUserNotificationAlert;
        [(SBAlertItem *)&v7 didDeactivateForReason:v4];
        return;
      }
    }
LABEL_15:
    [(SBUserNotificationAlert *)self _sendResponseAndCleanUp:3];
    goto LABEL_16;
  }
  [(SBUserNotificationAlert *)self _setActivated:0];
}

- (void)didFailToActivate
{
  [(SBUserNotificationAlert *)self _setActivated:0];
  [(SBUserNotificationAlert *)self _sendResponseAndCleanUp:3];
  v3.receiver = self;
  v3.super_class = (Class)SBUserNotificationAlert;
  [(SBAlertItem *)&v3 didFailToActivate];
}

- (void)presentationStateDidChangeFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBUserNotificationAlert;
  -[SBAlertItem presentationStateDidChangeFromState:toState:](&v6, sel_presentationStateDidChangeFromState_toState_, a3);
  if (a4 == 4 && self->_cleanedUp) {
    [(SBUserNotificationAlert *)self _cleanupCustomContentViewControllers];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  id v7 = a5;
  id v8 = a3;
  id v9 = [v8 text];
  unint64_t v10 = [v9 length];

  if (v10 >= length) {
    unint64_t v11 = v10 - length;
  }
  else {
    unint64_t v11 = 0;
  }
  uint64_t v12 = [v7 length];

  unint64_t v13 = v12 + v11;
  unint64_t v14 = objc_msgSend(v8, "sb_maxInputLength");

  return v13 <= v14;
}

- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5
{
  return self->_visualStyle;
}

- (void)_cleanupCustomContentViewControllers
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_cleanedUp)
  {
    unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"SBUserNotificationAlert.m" lineNumber:1519 description:@"AlertItem must be cleaned up to clear custom content view controller."];
  }
  if ([(SBAlertItem *)self _presentationState] != 4)
  {
    unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"SBUserNotificationAlert.m" lineNumber:1520 description:@"Presentation state must be \"disappeared\" before the custom content view controller may be cleaned up."];
  }
  uint64_t v4 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = self;
    _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEFAULT, "<%p> Clearing custom user content view controller for complete CFUserNotification.", buf, 0xCu);
  }

  char v5 = self->_extensionContentViewController;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__SBUserNotificationAlert__cleanupCustomContentViewControllers__block_invoke;
  v12[3] = &unk_1E6AF4AC0;
  unint64_t v13 = v5;
  objc_super v6 = v5;
  [(_SBSUICFUserNotificationContentHostViewController *)v6 invalidateWithCompletion:v12];
  id v7 = [(_UIRemoteViewController *)self->_viewServiceContentViewController disconnect];
  viewServiceContentViewController = self->_viewServiceContentViewController;
  self->_viewServiceContentViewController = 0;

  extensionContentViewController = self->_extensionContentViewController;
  self->_extensionContentViewController = 0;
}

id __63__SBUserNotificationAlert__cleanupCustomContentViewControllers__block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) disconnect];
}

- (id)_parseLegacyTextFieldDefinitions:(id)a3 locBundle:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:*MEMORY[0x1E4F1DA20]];
  uint64_t v9 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v8 withBundle:v7];

  unint64_t v10 = [v6 objectForKey:*MEMORY[0x1E4F1DA28]];
  uint64_t v42 = self;
  uint64_t v40 = v7;
  uint64_t v11 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v10 withBundle:v7];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v13 = (void *)v9;
  v39 = (void *)v9;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v44[0] = v9;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
      goto LABEL_6;
    }
    unint64_t v13 = 0;
  }
  id v14 = v13;
LABEL_6:
  uint64_t v15 = v14;
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();
  uint64_t v17 = (void *)v11;
  if ((v16 & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v43 = v11;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
      goto LABEL_11;
    }
    uint64_t v17 = 0;
  }
  id v18 = v17;
LABEL_11:
  uint64_t v19 = v18;
  char v38 = (void *)v11;
  if (![v15 count])
  {
    id v21 = 0;
    id v23 = 0;
    id v25 = 0;
    goto LABEL_37;
  }
  uint64_t v20 = [v6 objectForKey:*MEMORY[0x1E4F1D9F0]];
  id v21 = safeArrayOfIntNumberValue(v20);

  id v22 = [v6 objectForKey:*MEMORY[0x1E4FA7428]];
  id v23 = safeArrayOfIntNumberValue(v22);

  BOOL v24 = [v6 objectForKey:*MEMORY[0x1E4FA7430]];
  id v25 = safeArrayOfIntNumberValue(v24);

  if (![v15 count])
  {
LABEL_37:
    id v27 = 0;
    goto LABEL_38;
  }
  id v37 = v6;
  unint64_t v26 = 0;
  id v27 = 0;
  v41 = v19;
  do
  {
    if (v19 && [v19 count] > v26)
    {
      long long v28 = [v19 objectAtIndex:v26];
      long long v29 = safeStringValue(v28);
    }
    else
    {
      long long v29 = 0;
    }
    if ([v15 count] <= v26)
    {
      uint64_t v30 = 0;
    }
    else
    {
      uint64_t v30 = [v15 objectAtIndex:v26];
    }
    id v31 = objc_alloc_init(MEMORY[0x1E4FA6B60]);
    [v31 setValue:v29];
    [v31 setTitle:v30];
    if (((v42->_requestFlags >> v26) & 0x10000) != 0) {
      [v31 setSecure:1];
    }
    if (v23 && [v23 count] > v26)
    {
      int v32 = [v23 objectAtIndex:v26];
      objc_msgSend(v31, "setAutocapitalizationType:", (int)objc_msgSend(v32, "intValue"));

      uint64_t v19 = v41;
    }
    if (v25 && [v25 count] > v26)
    {
      uint64_t v33 = [v25 objectAtIndex:v26];
      objc_msgSend(v31, "setAutocorrectionType:", (int)objc_msgSend(v33, "intValue"));

      uint64_t v19 = v41;
    }
    if (v21 && [v21 count] > v26)
    {
      CFRange v34 = [v21 objectAtIndex:v26];
      objc_msgSend(v31, "setKeyboardType:", (int)objc_msgSend(v34, "intValue"));

      uint64_t v19 = v41;
    }
    if (!v27) {
      id v27 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    [v27 addObject:v31];

    ++v26;
  }
  while ([v15 count] > v26);
  id v6 = v37;
LABEL_38:
  id v35 = v27;

  return v35;
}

- (id)_parseTextFieldDefinitions:(id)a3 locBundle:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!v5)
  {
    id v28 = 0;
    goto LABEL_27;
  }
  id v25 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v28 = 0;
    id v7 = v25;
    goto LABEL_27;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v24 = v5;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v8)
  {
    id v28 = 0;
    id v7 = v25;
    goto LABEL_26;
  }
  uint64_t v9 = v8;
  id v28 = 0;
  uint64_t v10 = *(void *)v30;
  id v7 = v25;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v30 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FA6B60]) _initWithDictionary:v12];
        id v14 = [v13 title];
        uint64_t v15 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v14 withBundle:v7];

        char v16 = [v13 value];
        uint64_t v17 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v16 withBundle:v7];

        id v18 = [v13 title];
        if (BSEqualObjects())
        {
          uint64_t v19 = [v13 value];
          char v20 = BSEqualObjects();

          id v7 = v25;
          if (v20) {
            goto LABEL_15;
          }
        }
        else
        {
        }
        [v13 setTitle:v15];
        [v13 setValue:v17];
LABEL_15:
        id v21 = (void *)[v13 copy];
        if (v21)
        {
          id v22 = v28;
          if (!v28) {
            id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          id v28 = v22;
          [v22 addObject:v21];
        }

        continue;
      }
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v9);
LABEL_26:

  id v5 = v24;
LABEL_27:

  return v28;
}

- (id)_parseCustomButtonDefinitions:(id)a3 locBundle:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v22 = a4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v20 = v5;
    id v6 = v5;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4FA6B58]) _initWithDictionary:v12];
            id v14 = [v13 title];
            uint64_t v15 = [(SBUserNotificationAlert *)self _safeLocalizedValue:v14 withBundle:v22];

            char v16 = [v13 title];
            char v17 = BSEqualObjects();

            if ((v17 & 1) == 0) {
              [v13 setTitle:v15];
            }
            id v18 = (void *)[v13 copy];
            if (v18)
            {
              if (!v9) {
                id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              }
              [v9 addObject:v18];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    id v5 = v20;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (int64_t)_uiAlertActionStyleFromSBUserNotificationButtonPresentationStyle:(int)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return 2 * (a3 == 1);
  }
}

- (int64_t)_uiAlertActionLayoutDirectionFromSBUserNotificationButtonLayoutDirection:(unsigned int)a3
{
  if ((a3 & 3) != 0) {
    return a3 & 3;
  }
  else {
    return 3;
  }
}

- (id)_parseSystemApertureContentDefinition:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FA6CA8]) _initWithDictionary:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_parseAssetDefinition:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v4 = [MEMORY[0x1E4FA6C90] _definitionFromSerializedDefinition:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)_imageDefinitionForPath:(id)a3 catalogPath:(id)a4 catalogImageKey:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v7)
  {
    uint64_t v11 = [MEMORY[0x1E4FA6CA0] definitionWithImagePath:v7];
LABEL_6:
    uint64_t v12 = (void *)v11;
    goto LABEL_7;
  }
  uint64_t v12 = 0;
  if (v8 && v9)
  {
    uint64_t v11 = [MEMORY[0x1E4FA6CA0] definitionWithImageCatalogPath:v8 catalogImageKey:v9];
    goto LABEL_6;
  }
LABEL_7:

  return v12;
}

- (id)_imageForDefinition:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMapTable *)self->_imagesByDefinition objectForKey:v4];
    if (v5)
    {
LABEL_7:
      id v10 = v5;

      goto LABEL_9;
    }
    uint64_t v6 = objc_msgSend(v4, "sb_resolvedImage");
    if (v6)
    {
      id v5 = (void *)v6;
      imagesByDefinition = self->_imagesByDefinition;
      if (!imagesByDefinition)
      {
        id v8 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
        id v9 = self->_imagesByDefinition;
        self->_imagesByDefinition = v8;

        imagesByDefinition = self->_imagesByDefinition;
      }
      [(NSMapTable *)imagesByDefinition setObject:v5 forKey:v4];
      goto LABEL_7;
    }
  }
  id v10 = 0;
LABEL_9:

  return v10;
}

- (id)keyboardTypes
{
  return objc_getProperty(self, a2, 296, 1);
}

- (void)setKeyboardTypes:(id)a3
{
}

- (id)autocapitalizationTypes
{
  return objc_getProperty(self, a2, 304, 1);
}

- (void)setAutocapitalizationTypes:(id)a3
{
}

- (id)autocorrectionTypes
{
  return objc_getProperty(self, a2, 312, 1);
}

- (void)setAutocorrectionTypes:(id)a3
{
}

- (id)textFieldTitles
{
  return objc_getProperty(self, a2, 320, 1);
}

- (void)setTextFieldTitles:(id)a3
{
}

- (id)textFieldValues
{
  return objc_getProperty(self, a2, 328, 1);
}

- (void)setTextFieldValues:(id)a3
{
}

- (NSString)soundPath
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSoundPath:(id)a3
{
}

- (unsigned)soundID
{
  return self->_soundID;
}

- (void)setSoundID:(unsigned int)a3
{
  self->_soundID = a3;
}

- (unsigned)soundIDBehavior
{
  return self->_soundIDBehavior;
}

- (void)setSoundIDBehavior:(unsigned int)a3
{
  self->_soundIDBehavior = a3;
}

- (NSDictionary)vibrationPattern
{
  return (NSDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setVibrationPattern:(id)a3
{
}

- (int64_t)soundAlertType
{
  return self->_soundAlertType;
}

- (void)setSoundAlertType:(int64_t)a3
{
  self->_int64_t soundAlertType = a3;
}

- (NSString)soundAlertTopic
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (void)setSoundAlertTopic:(id)a3
{
}

- (NSString)alertHeader
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAlertHeader:(id)a3
{
}

- (NSString)alertMessage
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAlertMessage:(id)a3
{
}

- (NSString)alertMessageDelimiter
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAlertMessageDelimiter:(id)a3
{
}

- (NSString)lockScreenAlertHeader
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLockScreenAlertHeader:(id)a3
{
}

- (NSString)lockScreenAlertMessage
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setLockScreenAlertMessage:(id)a3
{
}

- (NSString)lockScreenAlertMessageDelimiter
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setLockScreenAlertMessageDelimiter:(id)a3
{
}

- (NSString)defaultButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setDefaultButtonTitle:(id)a3
{
}

- (NSString)alternateButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setAlternateButtonTitle:(id)a3
{
}

- (NSString)otherButtonTitle
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setOtherButtonTitle:(id)a3
{
}

- (NSString)defaultResponseLaunchBundleID
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
}

- (void)setDefaultResponseLaunchBundleID:(id)a3
{
}

- (NSURL)defaultResponseLaunchURL
{
  return (NSURL *)objc_getProperty(self, a2, 368, 1);
}

- (void)setDefaultResponseLaunchURL:(id)a3
{
}

- (SBSUserNotificationImageDefinition)headerImageDefinition
{
  return (SBSUserNotificationImageDefinition *)objc_getProperty(self, a2, 512, 1);
}

- (void)setHeaderImageDefinition:(id)a3
{
}

- (SBSUserNotificationImageDefinition)iconImageDefinition
{
  return (SBSUserNotificationImageDefinition *)objc_getProperty(self, a2, 520, 1);
}

- (void)setIconImageDefinition:(id)a3
{
}

- (SBSUserNotificationImageDefinition)attachmentImageDefinition
{
  return (SBSUserNotificationImageDefinition *)objc_getProperty(self, a2, 528, 1);
}

- (void)setAttachmentImageDefinition:(id)a3
{
}

- (BOOL)prefersSystemAperturePresentation
{
  return self->_prefersSystemAperturePresentation;
}

- (void)setPrefersSystemAperturePresentation:(BOOL)a3
{
  self->_prefersSystemAperturePresentation = a3;
}

- (SBSUserNotificationSystemApertureContentDefinition)systemApertureContentDefinition
{
  return (SBSUserNotificationSystemApertureContentDefinition *)objc_getProperty(self, a2, 536, 1);
}

- (void)setSystemApertureContentDefinition:(id)a3
{
}

- (NSString)remoteViewControllerClassName
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setRemoteViewControllerClassName:(id)a3
{
}

- (NSString)remoteServiceBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void)setRemoteServiceBundleIdentifier:(id)a3
{
}

- (NSString)extensionIdentifier
{
  return self->_extensionIdentifier;
}

- (void)setExtensionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIdentifier, 0);
  objc_storeStrong((id *)&self->_systemApertureContentDefinition, 0);
  objc_storeStrong((id *)&self->_attachmentImageDefinition, 0);
  objc_storeStrong((id *)&self->_iconImageDefinition, 0);
  objc_storeStrong((id *)&self->_headerImageDefinition, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_imagesByDefinition, 0);
  objc_storeStrong((id *)&self->_idleTimerDisableAssertion, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_customButtonDefinitions, 0);
  objc_storeStrong((id *)&self->_textFieldDefinitions, 0);
  objc_storeStrong((id *)&self->_viewServiceContentViewController, 0);
  objc_storeStrong((id *)&self->_extensionContentViewController, 0);
  objc_storeStrong((id *)&self->_remoteServiceBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_defaultResponseLaunchURL, 0);
  objc_storeStrong((id *)&self->_defaultResponseLaunchBundleID, 0);
  objc_storeStrong(&self->_textFieldValues, 0);
  objc_storeStrong(&self->_textFieldTitles, 0);
  objc_storeStrong(&self->_autocorrectionTypes, 0);
  objc_storeStrong(&self->_autocapitalizationTypes, 0);
  objc_storeStrong(&self->_keyboardTypes, 0);
  objc_storeStrong((id *)&self->_soundStopTimer, 0);
  objc_storeStrong((id *)&self->_soundAlertTopic, 0);
  objc_storeStrong((id *)&self->_vibrationPattern, 0);
  objc_storeStrong((id *)&self->_soundPath, 0);
  objc_storeStrong((id *)&self->_otherButtonTitle, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_lockScreenAlertMessageDelimiter, 0);
  objc_storeStrong(&self->_lockScreenAlertMessage, 0);
  objc_storeStrong((id *)&self->_lockScreenAlertHeader, 0);
  objc_storeStrong((id *)&self->_alertMessageDelimiter, 0);
  objc_storeStrong(&self->_alertMessage, 0);
  objc_storeStrong((id *)&self->_alertHeader, 0);
  objc_storeStrong((id *)&self->_expirationTimer, 0);
  objc_storeStrong((id *)&self->_portWatcher, 0);
  objc_storeStrong((id *)&self->_alertSource, 0);
}

void __77__SBUserNotificationAlert_initWithMessage_replyPort_requestFlags_auditToken___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 124);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "Port %d died. Cancelling.", (uint8_t *)v3, 8u);
}

- (void)updateWithMessage:(NSObject *)a3 requestFlags:.cold.1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  id v5 = [a2 localizedDescription];
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  id v10 = v5;
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, a3, v6, "Unable to find extension for identifier: \"%{public}@\" error: %{public}@", (uint8_t *)&v7);
}

- (void)updateWithMessage:(uint64_t)a3 requestFlags:(NSObject *)a4 .cold.2(void *a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, a4, a3, "Exception \"%{public}@\" encountered while decoding archive value for SBUserNotificationExtensionIdentifierKey: %{public}@", (uint8_t *)a3);
}

void __58__SBUserNotificationAlert_updateWithMessage_requestFlags___block_invoke_163_cold_1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 localizedDescription];
  int v6 = 138543618;
  int v7 = v4;
  __int16 v8 = 2114;
  __int16 v9 = a1;
  OUTLINED_FUNCTION_2_0(&dword_1D85BA000, a2, v5, "Unable to create remote view controller: %{public}@ - error: %{public}@", (uint8_t *)&v6);
}

- (void)_sendResponseAndCleanUp:(os_log_t)log customButtonResponse:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Successfully sent reply", v1, 2u);
}

- (void)_sendResponseAndCleanUp:(int *)a1 customButtonResponse:(NSObject *)a2 .cold.2(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed to send reply to %u", (uint8_t *)v3, 8u);
}

@end