@interface SBAlertItem
+ (id)_alertItemsController;
+ (void)activateAlertItem:(id)a3;
- (BOOL)_didEverActivate;
- (BOOL)_displayActionButtonOnLockScreen;
- (BOOL)_hasActiveKeyboardOnScreen;
- (BOOL)_ignoresQuietMode;
- (BOOL)_isPresented;
- (BOOL)allowDuringTransitionAnimations;
- (BOOL)allowInCar;
- (BOOL)allowInLoginWindow;
- (BOOL)allowInSetup;
- (BOOL)allowLockScreenDismissal;
- (BOOL)allowMenuButtonDismissal;
- (BOOL)allowMessageInCar;
- (BOOL)behavesSuperModally;
- (BOOL)didPlayPresentationSound;
- (BOOL)dismissOnLock;
- (BOOL)dismissesOverlaysOnLockScreen;
- (BOOL)hideOnClonedDisplay;
- (BOOL)ignoreIfAlreadyDisplaying;
- (BOOL)pendInSetupIfNotAllowed;
- (BOOL)pendWhileKeyBagLocked;
- (BOOL)reappearsAfterLock;
- (BOOL)reappearsAfterUnlock;
- (BOOL)shouldMaskIcon;
- (BOOL)shouldShowInEmergencyCall;
- (BOOL)shouldShowInLockScreen;
- (BOOL)suppressForKeynote;
- (BOOL)undimsScreen;
- (BOOL)unlocksScreen;
- (BOOL)wakeDisplay;
- (NSArray)allowedBundleIDs;
- (NSString)_iconImagePath;
- (NSString)clientIdentifier;
- (NSString)contactIdentifier;
- (NSString)contentType;
- (NSString)description;
- (NSString)elementIdentifier;
- (SAElement)_existingSystemApertureElement;
- (SBAlertItem)init;
- (UIImage)_attachmentImage;
- (UIImage)_headerImage;
- (UIImage)iconImage;
- (UIWindowScene)_preferredActivationWindowScene;
- (id)_alertController;
- (id)_createSystemApertureElement;
- (id)_prepareNewAlertControllerWithLockedState:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
- (id)_publicDescription;
- (id)_systemApertureElement;
- (id)alertController;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)lockLabel;
- (id)shortLockLabel;
- (id)sound;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5;
- (int)alertPriority;
- (unint64_t)_presentationState;
- (void)_clearAlertController;
- (void)_deactivationCompleted;
- (void)_setAttachmentImage:(id)a3;
- (void)_setHeaderImage:(id)a3;
- (void)_setIgnoresQuietMode:(BOOL)a3;
- (void)_setPreferredActivationWindowScene:(id)a3;
- (void)_setPresentationState:(unint64_t)a3;
- (void)_setPresented:(BOOL)a3;
- (void)deactivate;
- (void)deactivateForButton;
- (void)deactivateForReason:(int)a3;
- (void)didActivate;
- (void)elementLayoutSpecifier:(id)a3 layoutModeDidChange:(int64_t)a4 reason:(int64_t)a5;
- (void)playPresentationSound;
- (void)presentationStateDidChangeFromState:(unint64_t)a3 toState:(unint64_t)a4;
- (void)setAllowDuringTransitionAnimations:(BOOL)a3;
- (void)setAllowInCar:(BOOL)a3;
- (void)setAllowInSetup:(BOOL)a3;
- (void)setAllowMessageInCar:(BOOL)a3;
- (void)setAllowedBundleIDs:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setContentType:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setIconImagePath:(id)a3;
- (void)setIgnoreIfAlreadyDisplaying:(BOOL)a3;
- (void)setPendInSetupIfNotAllowed:(BOOL)a3;
- (void)setPendWhileKeyBagLocked:(BOOL)a3;
- (void)setShouldMaskIcon:(BOOL)a3;
- (void)setSuppressForKeynote:(BOOL)a3;
@end

@implementation SBAlertItem

- (SBAlertItem)init
{
  v3.receiver = self;
  v3.super_class = (Class)SBAlertItem;
  result = [(SBAlertItem *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_allowInSetup = 256;
    result->_allowMessageInCar = 1;
    result->_presented = 0;
    result->_presentationState = 4;
    result->_shouldMaskIcon = 1;
  }
  return result;
}

+ (id)_alertItemsController
{
  Class v2 = NSClassFromString(&cfstr_Sbalertitemsco.isa);

  return [(objc_class *)v2 sharedInstance];
}

+ (void)activateAlertItem:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _alertItemsController];
  [v5 activateAlertItem:v4];
}

- (id)alertController
{
  return self->_alertController;
}

- (id)lockLabel
{
  return 0;
}

- (id)shortLockLabel
{
  return 0;
}

- (BOOL)allowMenuButtonDismissal
{
  return 0;
}

- (BOOL)allowLockScreenDismissal
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 1;
}

- (BOOL)shouldShowInEmergencyCall
{
  return 0;
}

- (BOOL)wakeDisplay
{
  BOOL v3 = [(SBAlertItem *)self undimsScreen];
  if (v3)
  {
    LOBYTE(v3) = [(SBAlertItem *)self unlocksScreen];
  }
  return v3;
}

- (BOOL)reappearsAfterLock
{
  return ![(SBAlertItem *)self dismissOnLock];
}

- (BOOL)reappearsAfterUnlock
{
  return 0;
}

- (BOOL)didPlayPresentationSound
{
  return self->_didPlayPresentationSound;
}

- (void)playPresentationSound
{
  if (![(SBAlertItem *)self didPlayPresentationSound])
  {
    self->_didPlayPresentationSound = 1;
    id v3 = [(SBAlertItem *)self sound];
    [v3 playInEvironments:1 completion:0];
  }
}

- (id)sound
{
  return 0;
}

- (void)didActivate
{
  if (!self->_didEverActivate) {
    self->_didEverActivate = 1;
  }
}

- (void)deactivate
{
}

- (void)deactivateForButton
{
}

- (void)deactivateForReason:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(id)objc_opt_class() _alertItemsController];
  [v5 deactivateAlertItem:self reason:v3];
}

- (void)setIconImagePath:(id)a3
{
  objc_storeStrong((id *)&self->_iconImagePath, a3);
  id v5 = a3;
  id v6 = [MEMORY[0x263F1C6B0] imageWithContentsOfFile:v5];

  [(SBAlertItem *)self setIconImage:v6];
}

- (BOOL)behavesSuperModally
{
  return 0;
}

- (BOOL)allowInLoginWindow
{
  return 0;
}

- (int)alertPriority
{
  return 0;
}

- (BOOL)dismissesOverlaysOnLockScreen
{
  return 0;
}

- (BOOL)hideOnClonedDisplay
{
  return 0;
}

- (void)_setPresentationState:(unint64_t)a3
{
  if (self->_presentationState != a3)
  {
    self->_presentationState = a3;
    -[SBAlertItem presentationStateDidChangeFromState:toState:](self, "presentationStateDidChangeFromState:toState:");
  }
}

- (void)presentationStateDidChangeFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = SBLogCFUserNotifications();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (a4 - 1 > 3) {
      v7 = @"Unknown";
    }
    else {
      v7 = off_2645D3D48[a4 - 1];
    }
    int v8 = 134218242;
    v9 = self;
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_2218C9000, v6, OS_LOG_TYPE_DEFAULT, "<%p> Presentation state changed to %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)_deactivationCompleted
{
  [(SBAlertItem *)self _setPresented:0];

  [(SBAlertItem *)self _clearAlertController];
}

- (id)_alertController
{
  return self->_alertController;
}

- (void)_clearAlertController
{
  self->_alertController = 0;
  MEMORY[0x270F9A758]();
}

- (id)_prepareNewAlertControllerWithLockedState:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(SBAlertItem *)self _clearAlertController];
  v7 = [[_SBAlertController alloc] initWithStyleProvider:self];
  alertController = self->_alertController;
  self->_alertController = v7;

  [(_SBAlertController *)self->_alertController setAlertItem:self];
  [(_SBAlertController *)self->_alertController setPreferredStyle:1];
  if (!v5)
  {
    v9 = [(SBAlertItem *)self _headerImage];
    if (v9)
    {
      __int16 v10 = [[_SBAlertItemHeaderViewController alloc] initWithImage:v9];
      [(_SBAlertController *)self->_alertController _setHeaderContentViewController:v10];
    }
  }
  [(SBAlertItem *)self configure:v5 requirePasscodeForActions:v4];
  if ([(SBAlertItem *)self hideOnClonedDisplay]) {
    [(_SBAlertController *)self->_alertController setHiddenOnClonedDisplay:1];
  }
  v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:@"SBAlertItemDidPrepareNewAlertControllerNotification" object:self userInfo:0];

  uint64_t v12 = self->_alertController;

  return v12;
}

- (id)_systemApertureElement
{
  p_systemApertureElement = &self->_systemApertureElement;
  systemApertureElement = self->_systemApertureElement;
  if (!systemApertureElement)
  {
    BOOL v5 = [(SBAlertItem *)self _createSystemApertureElement];
    if (v5)
    {
      if (objc_opt_respondsToSelector()) {
        [v5 addElementLayoutSpecifierObserver:self];
      }
      objc_storeStrong((id *)p_systemApertureElement, v5);
    }

    systemApertureElement = *p_systemApertureElement;
  }

  return systemApertureElement;
}

- (SAElement)_existingSystemApertureElement
{
  return self->_systemApertureElement;
}

- (id)_createSystemApertureElement
{
  return 0;
}

- (void)_setPresented:(BOOL)a3
{
  BOOL presented = self->_presented;
  if (presented != a3)
  {
    self->_BOOL presented = a3;
    if (presented || !a3)
    {
      BOOL v4 = !presented;
      BOOL v5 = a3;
      if (v4) {
        BOOL v5 = 1;
      }
      if (!v5) {
        [(SBAlertItem *)self alertItemDidDisappear];
      }
    }
    else
    {
      [(SBAlertItem *)self alertItemDidAppear];
    }
  }
}

- (BOOL)_hasActiveKeyboardOnScreen
{
  Class v2 = [(SBAlertItem *)self alertController];
  uint64_t v3 = [v2 contentViewController];
  BOOL v4 = [v3 view];
  char v5 = objc_msgSend(v4, "sb_hasActiveKeyboardOnScreen");

  return v5;
}

- (BOOL)_didEverActivate
{
  return self->_didEverActivate;
}

- (BOOL)_displayActionButtonOnLockScreen
{
  return 0;
}

- (id)_publicDescription
{
  Class v2 = [MEMORY[0x263F29C40] builderWithObject:self];
  uint64_t v3 = [v2 build];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(SBAlertItem *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  Class v2 = [(SBAlertItem *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_presented withName:@"presented"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(SBAlertItem *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)visualStyleForAlertControllerStyle:(int64_t)a3 traitCollection:(id)a4 descriptor:(id)a5
{
  return 0;
}

- (NSString)elementIdentifier
{
  Class v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (NSString)clientIdentifier
{
  if (clientIdentifier_onceToken != -1) {
    dispatch_once(&clientIdentifier_onceToken, &__block_literal_global_1);
  }
  Class v2 = (void *)clientIdentifier___clientIdentifier;

  return (NSString *)v2;
}

void __31__SBAlertItem_clientIdentifier__block_invoke()
{
  id v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v0 = [v2 bundleIdentifier];
  v1 = (void *)clientIdentifier___clientIdentifier;
  clientIdentifier___clientIdentifier = v0;
}

- (void)elementLayoutSpecifier:(id)a3 layoutModeDidChange:(int64_t)a4 reason:(int64_t)a5
{
  if ([a3 layoutMode] <= 0 && self->_presentationState != 3)
  {
    [(SBAlertItem *)self deactivateForReason:2];
  }
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (BOOL)undimsScreen
{
  return 1;
}

- (BOOL)unlocksScreen
{
  return 1;
}

- (BOOL)ignoreIfAlreadyDisplaying
{
  return self->_ignoreIfAlreadyDisplaying;
}

- (void)setIgnoreIfAlreadyDisplaying:(BOOL)a3
{
  self->_ignoreIfAlreadyDisplaying = a3;
}

- (BOOL)allowInSetup
{
  return self->_allowInSetup;
}

- (void)setAllowInSetup:(BOOL)a3
{
  self->_allowInSetup = a3;
}

- (BOOL)suppressForKeynote
{
  return self->_suppressForKeynote;
}

- (void)setSuppressForKeynote:(BOOL)a3
{
  self->_suppressForKeynote = a3;
}

- (BOOL)pendInSetupIfNotAllowed
{
  return self->_pendInSetupIfNotAllowed;
}

- (void)setPendInSetupIfNotAllowed:(BOOL)a3
{
  self->_pendInSetupIfNotAllowed = a3;
}

- (BOOL)pendWhileKeyBagLocked
{
  return self->_pendWhileKeyBagLocked;
}

- (void)setPendWhileKeyBagLocked:(BOOL)a3
{
  self->_pendWhileKeyBagLocked = a3;
}

- (NSArray)allowedBundleIDs
{
  return self->_allowedBundleIDs;
}

- (void)setAllowedBundleIDs:(id)a3
{
}

- (BOOL)allowInCar
{
  return self->_allowInCar;
}

- (void)setAllowInCar:(BOOL)a3
{
  self->_allowInCar = a3;
}

- (BOOL)allowMessageInCar
{
  return self->_allowMessageInCar;
}

- (void)setAllowMessageInCar:(BOOL)a3
{
  self->_allowMessageInCar = a3;
}

- (BOOL)_ignoresQuietMode
{
  return self->_ignoresQuietMode;
}

- (void)_setIgnoresQuietMode:(BOOL)a3
{
  self->_ignoresQuietMode = a3;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (BOOL)allowDuringTransitionAnimations
{
  return self->_allowDuringTransitionAnimations;
}

- (void)setAllowDuringTransitionAnimations:(BOOL)a3
{
  self->_allowDuringTransitionAnimations = a3;
}

- (NSString)_iconImagePath
{
  return self->_iconImagePath;
}

- (unint64_t)_presentationState
{
  return self->_presentationState;
}

- (BOOL)_isPresented
{
  return self->_presented;
}

- (UIImage)_headerImage
{
  return self->_headerImage;
}

- (void)_setHeaderImage:(id)a3
{
}

- (UIImage)_attachmentImage
{
  return self->_attachmentImage;
}

- (void)_setAttachmentImage:(id)a3
{
}

- (UIWindowScene)_preferredActivationWindowScene
{
  return self->__preferredActivationWindowScene;
}

- (void)_setPreferredActivationWindowScene:(id)a3
{
}

- (BOOL)shouldMaskIcon
{
  return self->_shouldMaskIcon;
}

- (void)setShouldMaskIcon:(BOOL)a3
{
  self->_shouldMaskIcon = a3;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->__preferredActivationWindowScene, 0);
  objc_storeStrong((id *)&self->_attachmentImage, 0);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_iconImagePath, 0);
  objc_storeStrong((id *)&self->_allowedBundleIDs, 0);
  objc_storeStrong((id *)&self->_systemApertureElement, 0);

  objc_storeStrong((id *)&self->_alertController, 0);
}

@end