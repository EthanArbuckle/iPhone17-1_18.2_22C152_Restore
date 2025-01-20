@interface NCNotificationOptions
- (BOOL)addToLockScreenWhenUnlocked;
- (BOOL)alertsWhenLocked;
- (BOOL)allowActionsForCarPlay;
- (BOOL)canPlaySound;
- (BOOL)canShowSummary;
- (BOOL)canTurnOnDisplay;
- (BOOL)coalescesWhenLocked;
- (BOOL)dismissAutomatically;
- (BOOL)dismissAutomaticallyForCarPlay;
- (BOOL)displaysActionsInline;
- (BOOL)hideClearActionInList;
- (BOOL)hideCloseActionForCarPlay;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNumberOfLinesInfinite;
- (BOOL)lauchUsingSiriForCarPlayDefaultAction;
- (BOOL)overridesDowntime;
- (BOOL)overridesPocketMode;
- (BOOL)overridesQuietMode;
- (BOOL)playMediaWhenRaised;
- (BOOL)preemptsPresentedNotification;
- (BOOL)preventsAutomaticLock;
- (BOOL)requestsFullScreenPresentation;
- (BOOL)revealsAdditionalContentIfNoDefaultAction;
- (BOOL)revealsAdditionalContentOnPresentation;
- (BOOL)screenCaptureProhibited;
- (BOOL)shouldAnnounceForCarPlay;
- (BOOL)silencedByMenuButtonPress;
- (BOOL)suppressPresentationInAmbient;
- (BOOL)suppressesAlertsWhenAppIsActive;
- (BOOL)suppressesBodyWhenLocked;
- (BOOL)suppressesSubtitleWhenLocked;
- (BOOL)suppressesTitleWhenLocked;
- (NCNotificationOptions)initWithNotificationOptions:(id)a3;
- (NSSet)alertSuppressionContexts;
- (NSString)alternateActionLabel;
- (NSString)debugDescription;
- (NSString)speechLanguage;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)contentPreviewSetting;
- (unint64_t)hash;
- (unint64_t)lockScreenPersistence;
- (unint64_t)lockScreenPriority;
- (unint64_t)realertCount;
@end

@implementation NCNotificationOptions

- (NCNotificationOptions)initWithNotificationOptions:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NCNotificationOptions;
  v5 = [(NCNotificationOptions *)&v16 init];
  if (v5)
  {
    v6 = [v4 alertSuppressionContexts];
    uint64_t v7 = [v6 copy];
    alertSuppressionContexts = v5->_alertSuppressionContexts;
    v5->_alertSuppressionContexts = (NSSet *)v7;

    v9 = [v4 alternateActionLabel];
    uint64_t v10 = [v9 copy];
    alternateActionLabel = v5->_alternateActionLabel;
    v5->_alternateActionLabel = (NSString *)v10;

    v5->_dismissAutomatically = [v4 dismissAutomatically];
    v5->_dismissAutomaticallyForCarPlay = [v4 dismissAutomaticallyForCarPlay];
    v5->_overridesQuietMode = [v4 overridesQuietMode];
    v5->_overridesDowntime = [v4 overridesDowntime];
    v5->_alertsWhenLocked = [v4 alertsWhenLocked];
    v5->_addToLockScreenWhenLocked = [v4 addToLockScreenWhenUnlocked];
    v5->_lockScreenPersistence = [v4 lockScreenPersistence];
    v5->_lockScreenPriority = [v4 lockScreenPriority];
    v5->_realertCount = [v4 realertCount];
    v5->_suppressesAlertsWhenAppIsActive = [v4 suppressesAlertsWhenAppIsActive];
    v5->_silencedByMenuButtonPress = [v4 silencedByMenuButtonPress];
    v5->_overridesPocketMode = [v4 overridesPocketMode];
    v5->_canPlaySound = [v4 canPlaySound];
    v5->_canTurnOnDisplay = [v4 canTurnOnDisplay];
    v5->_requestsFullScreenPresentation = [v4 requestsFullScreenPresentation];
    v5->_hideClearActionInList = [v4 hideClearActionInList];
    v5->_numberOfLinesInfinite = [v4 isNumberOfLinesInfinite];
    v5->_preemptsPresentedNotification = [v4 preemptsPresentedNotification];
    v5->_displaysActionsInline = [v4 displaysActionsInline];
    v5->_revealsAdditionalContentOnPresentation = [v4 revealsAdditionalContentOnPresentation];
    v5->_suppressesTitleWhenLocked = [v4 suppressesTitleWhenLocked];
    v5->_suppressesSubtitleWhenLocked = [v4 suppressesSubtitleWhenLocked];
    v5->_suppressesBodyWhenLocked = [v4 suppressesBodyWhenLocked];
    v12 = [v4 speechLanguage];
    uint64_t v13 = [v12 copy];
    speechLanguage = v5->_speechLanguage;
    v5->_speechLanguage = (NSString *)v13;

    v5->_contentPreviewSetting = [v4 contentPreviewSetting];
    v5->_canShowSummary = [v4 canShowSummary];
    v5->_coalescesWhenLocked = [v4 coalescesWhenLocked];
    v5->_preventsAutomaticLock = [v4 preventsAutomaticLock];
    v5->_revealsAdditionalContentIfNoDefaultAction = [v4 revealsAdditionalContentIfNoDefaultAction];
    v5->_lauchUsingSiriForCarPlayDefaultAction = [v4 lauchUsingSiriForCarPlayDefaultAction];
    v5->_allowActionsForCarPlay = [v4 allowActionsForCarPlay];
    v5->_playMediaWhenRaised = [v4 playMediaWhenRaised];
    v5->_hideCloseActionForCarPlay = [v4 hideCloseActionForCarPlay];
    v5->_shouldAnnounceForCarPlay = [v4 shouldAnnounceForCarPlay];
    v5->_suppressPresentationInAmbient = [v4 suppressPresentationInAmbient];
    v5->_screenCaptureProhibited = [v4 screenCaptureProhibited];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = 0;
LABEL_43:
      LOBYTE(v50) = 0;
      goto LABEL_44;
    }
  }
  id v5 = v4;
  if (!v5) {
    goto LABEL_43;
  }
  v6 = [(NCNotificationOptions *)self alertSuppressionContexts];
  uint64_t v7 = [v5 alertSuppressionContexts];
  int v8 = NCIsEqual(v6, v7);

  if (!v8) {
    goto LABEL_43;
  }
  v9 = [(NCNotificationOptions *)self alternateActionLabel];
  uint64_t v10 = [v5 alternateActionLabel];
  int v11 = NCIsEqual(v9, v10);

  if (!v11) {
    goto LABEL_43;
  }
  int v12 = [(NCNotificationOptions *)self dismissAutomatically];
  if (v12 != [v5 dismissAutomatically]) {
    goto LABEL_43;
  }
  int v13 = [(NCNotificationOptions *)self dismissAutomaticallyForCarPlay];
  if (v13 != [v5 dismissAutomaticallyForCarPlay]) {
    goto LABEL_43;
  }
  int v14 = [(NCNotificationOptions *)self overridesQuietMode];
  if (v14 != [v5 overridesQuietMode]) {
    goto LABEL_43;
  }
  int v15 = [(NCNotificationOptions *)self overridesDowntime];
  if (v15 != [v5 overridesDowntime]) {
    goto LABEL_43;
  }
  int v16 = [(NCNotificationOptions *)self alertsWhenLocked];
  if (v16 != [v5 alertsWhenLocked]) {
    goto LABEL_43;
  }
  int v17 = [(NCNotificationOptions *)self addToLockScreenWhenUnlocked];
  if (v17 != [v5 addToLockScreenWhenUnlocked]) {
    goto LABEL_43;
  }
  unint64_t v18 = [(NCNotificationOptions *)self lockScreenPersistence];
  if (v18 != [v5 lockScreenPersistence]) {
    goto LABEL_43;
  }
  unint64_t v19 = [(NCNotificationOptions *)self lockScreenPriority];
  if (v19 != [v5 lockScreenPriority]) {
    goto LABEL_43;
  }
  unint64_t v20 = [(NCNotificationOptions *)self realertCount];
  if (v20 != [v5 realertCount]) {
    goto LABEL_43;
  }
  int v21 = [(NCNotificationOptions *)self suppressesAlertsWhenAppIsActive];
  if (v21 != [v5 suppressesAlertsWhenAppIsActive]) {
    goto LABEL_43;
  }
  int v22 = [(NCNotificationOptions *)self silencedByMenuButtonPress];
  if (v22 != [v5 silencedByMenuButtonPress]) {
    goto LABEL_43;
  }
  int v23 = [(NCNotificationOptions *)self overridesPocketMode];
  if (v23 != [v5 overridesPocketMode]) {
    goto LABEL_43;
  }
  int v24 = [(NCNotificationOptions *)self canPlaySound];
  if (v24 != [v5 canPlaySound]) {
    goto LABEL_43;
  }
  int v25 = [(NCNotificationOptions *)self canTurnOnDisplay];
  if (v25 != [v5 canTurnOnDisplay]) {
    goto LABEL_43;
  }
  int v26 = [(NCNotificationOptions *)self requestsFullScreenPresentation];
  if (v26 != [v5 requestsFullScreenPresentation]) {
    goto LABEL_43;
  }
  int v27 = [(NCNotificationOptions *)self hideClearActionInList];
  if (v27 != [v5 hideClearActionInList]) {
    goto LABEL_43;
  }
  int v28 = [(NCNotificationOptions *)self isNumberOfLinesInfinite];
  if (v28 != [v5 isNumberOfLinesInfinite]) {
    goto LABEL_43;
  }
  int v29 = [(NCNotificationOptions *)self preemptsPresentedNotification];
  if (v29 != [v5 preemptsPresentedNotification]) {
    goto LABEL_43;
  }
  int v30 = [(NCNotificationOptions *)self displaysActionsInline];
  if (v30 != [v5 displaysActionsInline]) {
    goto LABEL_43;
  }
  int v31 = [(NCNotificationOptions *)self revealsAdditionalContentOnPresentation];
  if (v31 != [v5 revealsAdditionalContentOnPresentation]) {
    goto LABEL_43;
  }
  int v32 = [(NCNotificationOptions *)self suppressesTitleWhenLocked];
  if (v32 != [v5 suppressesTitleWhenLocked]) {
    goto LABEL_43;
  }
  int v33 = [(NCNotificationOptions *)self suppressesSubtitleWhenLocked];
  if (v33 != [v5 suppressesSubtitleWhenLocked]) {
    goto LABEL_43;
  }
  int v34 = [(NCNotificationOptions *)self suppressesBodyWhenLocked];
  if (v34 != [v5 suppressesBodyWhenLocked]) {
    goto LABEL_43;
  }
  v35 = [(NCNotificationOptions *)self speechLanguage];
  v36 = [v5 speechLanguage];
  int v37 = NCIsEqual(v35, v36);

  if (!v37) {
    goto LABEL_43;
  }
  unint64_t v38 = [(NCNotificationOptions *)self contentPreviewSetting];
  if (v38 != [v5 contentPreviewSetting]) {
    goto LABEL_43;
  }
  int v39 = [(NCNotificationOptions *)self canShowSummary];
  if (v39 != [v5 canShowSummary]) {
    goto LABEL_43;
  }
  int v40 = [(NCNotificationOptions *)self coalescesWhenLocked];
  if (v40 != [v5 coalescesWhenLocked]) {
    goto LABEL_43;
  }
  int v41 = [(NCNotificationOptions *)self preventsAutomaticLock];
  if (v41 != [v5 preventsAutomaticLock]) {
    goto LABEL_43;
  }
  int v42 = [(NCNotificationOptions *)self revealsAdditionalContentIfNoDefaultAction];
  if (v42 != [v5 revealsAdditionalContentIfNoDefaultAction]) {
    goto LABEL_43;
  }
  int v43 = [(NCNotificationOptions *)self lauchUsingSiriForCarPlayDefaultAction];
  if (v43 != [v5 lauchUsingSiriForCarPlayDefaultAction]) {
    goto LABEL_43;
  }
  int v44 = [(NCNotificationOptions *)self allowActionsForCarPlay];
  if (v44 != [v5 allowActionsForCarPlay]) {
    goto LABEL_43;
  }
  int v45 = [(NCNotificationOptions *)self playMediaWhenRaised];
  if (v45 != [v5 playMediaWhenRaised]) {
    goto LABEL_43;
  }
  int v46 = [(NCNotificationOptions *)self hideCloseActionForCarPlay];
  if (v46 != [v5 hideCloseActionForCarPlay]) {
    goto LABEL_43;
  }
  int v47 = [(NCNotificationOptions *)self shouldAnnounceForCarPlay];
  if (v47 != [v5 shouldAnnounceForCarPlay]) {
    goto LABEL_43;
  }
  int v48 = [(NCNotificationOptions *)self suppressPresentationInAmbient];
  if (v48 != [v5 suppressPresentationInAmbient]) {
    goto LABEL_43;
  }
  BOOL v49 = [(NCNotificationOptions *)self screenCaptureProhibited];
  int v50 = v49 ^ [v5 screenCaptureProhibited] ^ 1;
LABEL_44:

  return v50;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSSet *)self->_alertSuppressionContexts hash];
  return [(NSString *)self->_alternateActionLabel hash] + v3;
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationOptions *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [NCMutableNotificationOptions alloc];

  return [(NCNotificationOptions *)v4 initWithNotificationOptions:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(NCNotificationOptions *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__NCNotificationOptions_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_264559E60;
  id v7 = v6;
  id v11 = v7;
  int v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

id __63__NCNotificationOptions_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) alertSuppressionContexts];
  id v4 = [v3 allObjects];
  [v2 appendArraySection:v4 withName:@"alertSuppressionContexts" skipIfEmpty:0];

  id v5 = *(void **)(a1 + 32);
  v6 = [*(id *)(a1 + 40) alternateActionLabel];
  id v7 = (id)[v5 appendObject:v6 withName:@"alternateActionLabel" skipIfNil:1];

  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "dismissAutomatically"), @"dismissAutomatically");
  id v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "dismissAutomaticallyForCarPlay"), @"dismissAutomaticallyForCarPlay");
  id v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "overridesQuietMode"), @"overidesQuietMode");
  id v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "overridesDowntime"), @"overidesDowntime");
  id v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "alertsWhenLocked"), @"alertsWhenLocked");
  id v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "addToLockScreenWhenUnlocked"), @"addToLockScreenWhenUnlocked");
  id v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "lockScreenPersistence"), @"lockScreenPersistence");
  id v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "lockScreenPriority"), @"lockScreenPriority");
  id v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "suppressesAlertsWhenAppIsActive"), @"suppressesAlertsWhenAppIsActive");
  id v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "silencedByMenuButtonPress"), @"silencedByMenuButtonPress");
  id v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "overridesPocketMode"), @"overridesPocketMode");
  id v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "canPlaySound"), @"canPlaySound");
  id v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "canTurnOnDisplay"), @"canTurnOnDisplay");
  id v21 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "requestsFullScreenPresentation"), @"requestsFullScreenPresentation");
  id v22 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "hideClearActionInList"), @"hideClearActionInList");
  id v23 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isNumberOfLinesInfinite"), @"numberOfLinesInfinite");
  id v24 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "realertCount"), @"realertCount");
  id v25 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "preemptsPresentedNotification"), @"preemptsPresentedNotification");
  id v26 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "displaysActionsInline"), @"displaysActionsInline");
  id v27 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "revealsAdditionalContentOnPresentation"), @"revealsAdditionalContentOnPresentation");
  id v28 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "suppressesTitleWhenLocked"), @"suppressesTitleWhenLocked");
  id v29 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "suppressesSubtitleWhenLocked"), @"suppressesSubtitleWhenLocked");
  id v30 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "suppressesBodyWhenLocked"), @"suppressesBodyWhenLocked");
  int v31 = *(void **)(a1 + 32);
  int v32 = [*(id *)(a1 + 40) speechLanguage];
  [v31 appendString:v32 withName:@"speechLanguage"];

  id v33 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "contentPreviewSetting"), @"contentPreviewSetting");
  id v34 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "canShowSummary"), @"canShowSummary");
  id v35 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "coalescesWhenLocked"), @"coalescesWhenLocked");
  id v36 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "preventsAutomaticLock"), @"preventsAutomaticLock");
  id v37 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "revealsAdditionalContentIfNoDefaultAction"), @"revealsAdditionalContentIfNoDefaultAction");
  id v38 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "lauchUsingSiriForCarPlayDefaultAction"), @"lauchUsingSiriForCarPlayDefaultAction");
  id v39 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "allowActionsForCarPlay"), @"allowActionsForCarPlay");
  id v40 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "playMediaWhenRaised"), @"playMediaWhenRaised");
  id v41 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "hideCloseActionForCarPlay"), @"hideCloseActionForCarPlay");
  id v42 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "shouldAnnounceForCarPlay"), @"shouldAnnounceForCarPlay");
  id v43 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "suppressPresentationInAmbient"), @"suppressPresentationInAmbient");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "screenCaptureProhibited"), @"screenCaptureProhibited");
}

- (id)succinctDescription
{
  v2 = [(NCNotificationOptions *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F29C40] builderWithObject:self];
}

- (NSSet)alertSuppressionContexts
{
  return self->_alertSuppressionContexts;
}

- (NSString)alternateActionLabel
{
  return self->_alternateActionLabel;
}

- (BOOL)dismissAutomatically
{
  return self->_dismissAutomatically;
}

- (BOOL)dismissAutomaticallyForCarPlay
{
  return self->_dismissAutomaticallyForCarPlay;
}

- (BOOL)overridesQuietMode
{
  return self->_overridesQuietMode;
}

- (BOOL)overridesDowntime
{
  return self->_overridesDowntime;
}

- (BOOL)alertsWhenLocked
{
  return self->_alertsWhenLocked;
}

- (BOOL)addToLockScreenWhenUnlocked
{
  return self->_addToLockScreenWhenLocked;
}

- (unint64_t)lockScreenPersistence
{
  return self->_lockScreenPersistence;
}

- (unint64_t)lockScreenPriority
{
  return self->_lockScreenPriority;
}

- (unint64_t)realertCount
{
  return self->_realertCount;
}

- (BOOL)suppressesAlertsWhenAppIsActive
{
  return self->_suppressesAlertsWhenAppIsActive;
}

- (BOOL)canPlaySound
{
  return self->_canPlaySound;
}

- (BOOL)canTurnOnDisplay
{
  return self->_canTurnOnDisplay;
}

- (BOOL)requestsFullScreenPresentation
{
  return self->_requestsFullScreenPresentation;
}

- (BOOL)silencedByMenuButtonPress
{
  return self->_silencedByMenuButtonPress;
}

- (BOOL)overridesPocketMode
{
  return self->_overridesPocketMode;
}

- (BOOL)hideClearActionInList
{
  return self->_hideClearActionInList;
}

- (BOOL)isNumberOfLinesInfinite
{
  return self->_numberOfLinesInfinite;
}

- (BOOL)preemptsPresentedNotification
{
  return self->_preemptsPresentedNotification;
}

- (BOOL)displaysActionsInline
{
  return self->_displaysActionsInline;
}

- (BOOL)revealsAdditionalContentOnPresentation
{
  return self->_revealsAdditionalContentOnPresentation;
}

- (BOOL)suppressesTitleWhenLocked
{
  return self->_suppressesTitleWhenLocked;
}

- (BOOL)suppressesSubtitleWhenLocked
{
  return self->_suppressesSubtitleWhenLocked;
}

- (BOOL)suppressesBodyWhenLocked
{
  return self->_suppressesBodyWhenLocked;
}

- (NSString)speechLanguage
{
  return self->_speechLanguage;
}

- (unint64_t)contentPreviewSetting
{
  return self->_contentPreviewSetting;
}

- (BOOL)canShowSummary
{
  return self->_canShowSummary;
}

- (BOOL)coalescesWhenLocked
{
  return self->_coalescesWhenLocked;
}

- (BOOL)preventsAutomaticLock
{
  return self->_preventsAutomaticLock;
}

- (BOOL)revealsAdditionalContentIfNoDefaultAction
{
  return self->_revealsAdditionalContentIfNoDefaultAction;
}

- (BOOL)lauchUsingSiriForCarPlayDefaultAction
{
  return self->_lauchUsingSiriForCarPlayDefaultAction;
}

- (BOOL)allowActionsForCarPlay
{
  return self->_allowActionsForCarPlay;
}

- (BOOL)playMediaWhenRaised
{
  return self->_playMediaWhenRaised;
}

- (BOOL)hideCloseActionForCarPlay
{
  return self->_hideCloseActionForCarPlay;
}

- (BOOL)shouldAnnounceForCarPlay
{
  return self->_shouldAnnounceForCarPlay;
}

- (BOOL)suppressPresentationInAmbient
{
  return self->_suppressPresentationInAmbient;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechLanguage, 0);
  objc_storeStrong((id *)&self->_alternateActionLabel, 0);

  objc_storeStrong((id *)&self->_alertSuppressionContexts, 0);
}

@end