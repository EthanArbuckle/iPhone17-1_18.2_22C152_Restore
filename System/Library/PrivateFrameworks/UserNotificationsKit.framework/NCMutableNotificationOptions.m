@interface NCMutableNotificationOptions
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAddToLockScreenWhenUnlocked:(BOOL)a3;
- (void)setAlertSuppressionContexts:(id)a3;
- (void)setAlertsWhenLocked:(BOOL)a3;
- (void)setAllowActionsForCarPlay:(BOOL)a3;
- (void)setAlternateActionLabel:(id)a3;
- (void)setCanPlaySound:(BOOL)a3;
- (void)setCanShowSummary:(BOOL)a3;
- (void)setCanTurnOnDisplay:(BOOL)a3;
- (void)setCoalescesWhenLocked:(BOOL)a3;
- (void)setContentPreviewSetting:(unint64_t)a3;
- (void)setDismissAutomatically:(BOOL)a3;
- (void)setDismissAutomaticallyForCarPlay:(BOOL)a3;
- (void)setDisplaysActionsInline:(BOOL)a3;
- (void)setHideClearActionInList:(BOOL)a3;
- (void)setHideCloseActionForCarPlay:(BOOL)a3;
- (void)setLauchUsingSiriForCarPlayDefaultAction:(BOOL)a3;
- (void)setLockScreenPersistence:(unint64_t)a3;
- (void)setLockScreenPriority:(unint64_t)a3;
- (void)setNumberOfLinesInfinite:(BOOL)a3;
- (void)setOverridesDowntime:(BOOL)a3;
- (void)setOverridesPocketMode:(BOOL)a3;
- (void)setOverridesQuietMode:(BOOL)a3;
- (void)setPlayMediaWhenRaised:(BOOL)a3;
- (void)setPreemptsPresentedNotification:(BOOL)a3;
- (void)setPreventsAutomaticLock:(BOOL)a3;
- (void)setRealertCount:(unint64_t)a3;
- (void)setRequestsFullScreenPresentation:(BOOL)a3;
- (void)setRevealsAdditionalContentIfNoDefaultAction:(BOOL)a3;
- (void)setRevealsAdditionalContentOnPresentation:(BOOL)a3;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setShouldAnnounceForCarPlay:(BOOL)a3;
- (void)setSilencedByMenuButtonPress:(BOOL)a3;
- (void)setSpeechLanguage:(id)a3;
- (void)setSuppressPresentationInAmbient:(BOOL)a3;
- (void)setSuppressesAlertsWhenAppIsActive:(BOOL)a3;
- (void)setSuppressesBodyWhenLocked:(BOOL)a3;
- (void)setSuppressesSubtitleWhenLocked:(BOOL)a3;
- (void)setSuppressesTitleWhenLocked:(BOOL)a3;
@end

@implementation NCMutableNotificationOptions

- (void)setAlertSuppressionContexts:(id)a3
{
  self->super._alertSuppressionContexts = (NSSet *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setAlternateActionLabel:(id)a3
{
  self->super._alternateActionLabel = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setDismissAutomatically:(BOOL)a3
{
  self->super._dismissAutomatically = a3;
}

- (void)setDismissAutomaticallyForCarPlay:(BOOL)a3
{
  self->super._dismissAutomaticallyForCarPlay = a3;
}

- (void)setOverridesQuietMode:(BOOL)a3
{
  self->super._overridesQuietMode = a3;
}

- (void)setOverridesDowntime:(BOOL)a3
{
  self->super._overridesDowntime = a3;
}

- (void)setAlertsWhenLocked:(BOOL)a3
{
  self->super._alertsWhenLocked = a3;
}

- (void)setAddToLockScreenWhenUnlocked:(BOOL)a3
{
  self->super._addToLockScreenWhenLocked = a3;
}

- (void)setLockScreenPersistence:(unint64_t)a3
{
  self->super._lockScreenPersistence = a3;
}

- (void)setLockScreenPriority:(unint64_t)a3
{
  self->super._lockScreenPriority = a3;
}

- (void)setRealertCount:(unint64_t)a3
{
  self->super._realertCount = a3;
}

- (void)setSuppressesAlertsWhenAppIsActive:(BOOL)a3
{
  self->super._suppressesAlertsWhenAppIsActive = a3;
}

- (void)setSilencedByMenuButtonPress:(BOOL)a3
{
  self->super._silencedByMenuButtonPress = a3;
}

- (void)setOverridesPocketMode:(BOOL)a3
{
  self->super._overridesPocketMode = a3;
}

- (void)setCanPlaySound:(BOOL)a3
{
  self->super._canPlaySound = a3;
}

- (void)setCanTurnOnDisplay:(BOOL)a3
{
  self->super._canTurnOnDisplay = a3;
}

- (void)setRequestsFullScreenPresentation:(BOOL)a3
{
  self->super._requestsFullScreenPresentation = a3;
}

- (void)setHideClearActionInList:(BOOL)a3
{
  self->super._hideClearActionInList = a3;
}

- (void)setNumberOfLinesInfinite:(BOOL)a3
{
  self->super._numberOfLinesInfinite = a3;
}

- (void)setPreemptsPresentedNotification:(BOOL)a3
{
  self->super._preemptsPresentedNotification = a3;
}

- (void)setDisplaysActionsInline:(BOOL)a3
{
  self->super._displaysActionsInline = a3;
}

- (void)setRevealsAdditionalContentOnPresentation:(BOOL)a3
{
  self->super._revealsAdditionalContentOnPresentation = a3;
}

- (void)setSuppressesTitleWhenLocked:(BOOL)a3
{
  self->super._suppressesTitleWhenLocked = a3;
}

- (void)setSuppressesSubtitleWhenLocked:(BOOL)a3
{
  self->super._suppressesSubtitleWhenLocked = a3;
}

- (void)setSuppressesBodyWhenLocked:(BOOL)a3
{
  self->super._suppressesBodyWhenLocked = a3;
}

- (void)setSpeechLanguage:(id)a3
{
  self->super._speechLanguage = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setContentPreviewSetting:(unint64_t)a3
{
  self->super._contentPreviewSetting = a3;
}

- (void)setCanShowSummary:(BOOL)a3
{
  self->super._canShowSummary = a3;
}

- (void)setCoalescesWhenLocked:(BOOL)a3
{
  self->super._coalescesWhenLocked = a3;
}

- (void)setPreventsAutomaticLock:(BOOL)a3
{
  self->super._preventsAutomaticLock = a3;
}

- (void)setRevealsAdditionalContentIfNoDefaultAction:(BOOL)a3
{
  self->super._revealsAdditionalContentIfNoDefaultAction = a3;
}

- (void)setLauchUsingSiriForCarPlayDefaultAction:(BOOL)a3
{
  self->super._lauchUsingSiriForCarPlayDefaultAction = a3;
}

- (void)setAllowActionsForCarPlay:(BOOL)a3
{
  self->super._allowActionsForCarPlay = a3;
}

- (void)setPlayMediaWhenRaised:(BOOL)a3
{
  self->super._playMediaWhenRaised = a3;
}

- (void)setHideCloseActionForCarPlay:(BOOL)a3
{
  self->super._hideCloseActionForCarPlay = a3;
}

- (void)setShouldAnnounceForCarPlay:(BOOL)a3
{
  self->super._shouldAnnounceForCarPlay = a3;
}

- (void)setSuppressPresentationInAmbient:(BOOL)a3
{
  self->super._suppressPresentationInAmbient = a3;
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  self->super._screenCaptureProhibited = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [NCNotificationOptions alloc];

  return [(NCNotificationOptions *)v4 initWithNotificationOptions:self];
}

@end