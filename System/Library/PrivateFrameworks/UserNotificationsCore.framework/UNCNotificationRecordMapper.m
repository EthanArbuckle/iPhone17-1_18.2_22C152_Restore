@interface UNCNotificationRecordMapper
- (NSString)bundleIdentifier;
- (UNCNotificationRecordMapper)initWithBundle:(id)a3 categoryRepository:(id)a4;
- (id)_notificationCommunicationContextForNotificationRecord:(id)a3;
- (id)_notificationContentForNotificationRecord:(id)a3;
- (id)_notificationIconForNotificationRecord:(id)a3;
- (id)_notificationSoundForNotificationRecord:(id)a3;
- (id)_notificationTriggerForNotificationRecord:(id)a3;
- (id)notificationForNotificationRecord:(id)a3;
- (id)notificationRequestForNotificationRecord:(id)a3;
- (unint64_t)_notificationInterruptionLevelForNotificationRecord:(id)a3;
@end

@implementation UNCNotificationRecordMapper

- (UNCNotificationRecordMapper)initWithBundle:(id)a3 categoryRepository:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UNCNotificationRecordMapper;
  v9 = [(UNCNotificationRecordMapper *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundle, a3);
    objc_storeStrong((id *)&v10->_categoryRepository, a4);
  }

  return v10;
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(UNCNotificationBundle *)self->_bundle bundleIdentifier];
}

- (id)notificationForNotificationRecord:(id)a3
{
  id v4 = a3;
  v5 = [(UNCNotificationRecordMapper *)self notificationRequestForNotificationRecord:v4];
  v6 = [v4 date];
  id v7 = [(UNCNotificationBundle *)self->_bundle bundleIdentifier];
  categoryRepository = self->_categoryRepository;
  v9 = [v4 categoryIdentifier];

  v10 = [(UNSNotificationCategoryRepository *)categoryRepository categoryWithIdentifier:v9 bundleIdentifier:v7];

  v11 = [v10 intentIdentifiers];
  objc_super v12 = [MEMORY[0x263F1DF08] notificationWithRequest:v5 date:v6 sourceIdentifier:v7 intentIdentifiers:v11];

  return v12;
}

- (id)notificationRequestForNotificationRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  v6 = [(UNCNotificationRecordMapper *)self _notificationContentForNotificationRecord:v4];
  id v7 = [(UNCNotificationRecordMapper *)self _notificationTriggerForNotificationRecord:v4];
  if ([v4 allowsDefaultDestinations])
  {
    uint64_t v8 = 15;
  }
  else
  {
    if ([v4 allowsLockScreenDestination]) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 0;
    }
    if ([v4 allowsNotificationCenterDestination]) {
      v9 |= 4uLL;
    }
    uint64_t v10 = v9 | [v4 allowsAlertDestination];
    if ([v4 allowsCarPlayDestination]) {
      uint64_t v8 = v10 | 8;
    }
    else {
      uint64_t v8 = v10;
    }
  }
  v11 = [MEMORY[0x263F1DF48] requestWithIdentifier:v5 content:v6 trigger:v7 destinations:v8];

  return v11;
}

- (id)_notificationContentForNotificationRecord:(id)a3
{
  id v4 = a3;
  v63 = [(UNCNotificationRecordMapper *)self _notificationSoundForNotificationRecord:v4];
  v5 = [(UNCNotificationRecordMapper *)self _notificationIconForNotificationRecord:v4];
  v62 = [(UNCNotificationRecordMapper *)self _notificationCommunicationContextForNotificationRecord:v4];
  id v6 = objc_alloc_init(MEMORY[0x263F1DEF0]);
  id v7 = [v4 contentType];
  [v6 setContentType:v7];

  [v6 setCommunicationContext:v62];
  uint64_t v8 = [v4 accessoryImageName];
  [v6 setAccessoryImageName:v8];

  uint64_t v9 = [v4 attachments];
  uint64_t v10 = objc_msgSend(v9, "bs_map:", UNCAttachmentRecordToUNNotificationAttachment);
  [v6 setAttachments:v10];

  v11 = [v4 badge];
  [v6 setBadge:v11];

  objc_super v12 = (void *)MEMORY[0x263F1DED0];
  v13 = [v4 bodyLocalizationKey];
  v14 = [v4 bodyLocalizationArguments];
  uint64_t v15 = [(UNCNotificationBundle *)self->_bundle cfBundle];
  v16 = [v4 body];
  v17 = [v12 localizedUserNotificationStringForKey:v13 arguments:v14 cfBundle:v15 defaultValue:v16];
  [v6 setBody:v17];

  v18 = [v4 attributedBody];
  [v6 setAttributedBody:v18];

  v19 = [v4 categoryIdentifier];
  [v6 setCategoryIdentifier:v19];

  v20 = [v4 contentDate];
  [v6 setDate:v20];

  v21 = (void *)MEMORY[0x263F1DED0];
  v22 = [v4 defaultActionTitleLocalizationKey];
  uint64_t v23 = [(UNCNotificationBundle *)self->_bundle cfBundle];
  v24 = [v4 defaultActionTitle];
  v25 = [v21 localizedUserNotificationStringForKey:v22 arguments:MEMORY[0x263EFFA68] cfBundle:v23 defaultValue:v24];
  [v6 setDefaultActionTitle:v25];

  objc_msgSend(v6, "setHasDefaultAction:", objc_msgSend(v4, "hasDefaultAction"));
  v26 = [v4 defaultActionURL];
  [v6 setDefaultActionURL:v26];

  v27 = [v4 defaultActionBundleIdentifier];
  [v6 setDefaultActionBundleIdentifier:v27];

  v28 = [v4 expirationDate];
  [v6 setExpirationDate:v28];

  v29 = [v4 launchImageName];
  [v6 setLaunchImageName:v29];

  v30 = (void *)MEMORY[0x263F1DED0];
  v31 = [v4 headerLocalizationKey];
  v32 = [v4 headerLocalizationArguments];
  uint64_t v33 = [(UNCNotificationBundle *)self->_bundle cfBundle];
  v34 = [v4 header];
  v35 = [v30 localizedUserNotificationStringForKey:v31 arguments:v32 cfBundle:v33 defaultValue:v34];
  [v6 setHeader:v35];

  v36 = (void *)MEMORY[0x263F1DED0];
  v37 = [v4 footerLocalizationKey];
  v38 = [v4 footerLocalizationArguments];
  uint64_t v39 = [(UNCNotificationBundle *)self->_bundle cfBundle];
  v40 = [v4 footer];
  v41 = [v36 localizedUserNotificationStringForKey:v37 arguments:v38 cfBundle:v39 defaultValue:v40];
  [v6 setFooter:v41];

  [v6 setIcon:v5];
  [v6 setSound:v63];
  objc_msgSend(v6, "setShouldHideDate:", objc_msgSend(v4, "shouldHideDate"));
  objc_msgSend(v6, "setShouldHideTime:", objc_msgSend(v4, "shouldHideTime"));
  objc_msgSend(v6, "setShouldIgnoreDoNotDisturb:", objc_msgSend(v4, "shouldIgnoreDoNotDisturb"));
  objc_msgSend(v6, "setShouldIgnoreDowntime:", objc_msgSend(v4, "shouldIgnoreDowntime"));
  objc_msgSend(v6, "setShouldSuppressScreenLightUp:", objc_msgSend(v4, "shouldSuppressScreenLightUp"));
  objc_msgSend(v6, "setShouldAuthenticateDefaultAction:", objc_msgSend(v4, "shouldAuthenticateDefaultAction"));
  objc_msgSend(v6, "setShouldBackgroundDefaultAction:", objc_msgSend(v4, "shouldBackgroundDefaultAction"));
  objc_msgSend(v6, "setShouldPreventNotificationDismissalAfterDefaultAction:", objc_msgSend(v4, "shouldPreventNotificationDismissalAfterDefaultAction"));
  objc_msgSend(v6, "setShouldShowSubordinateIcon:", objc_msgSend(v4, "shouldShowSubordinateIcon"));
  objc_msgSend(v6, "setShouldSuppressSyncDismissalWhenRemoved:", objc_msgSend(v4, "shouldSuppressSyncDismissalWhenRemoved"));
  objc_msgSend(v6, "setShouldUseRequestIdentifierForDismissalSync:", objc_msgSend(v4, "shouldUseRequestIdentifierForDismissalSync"));
  objc_msgSend(v6, "setShouldPreemptPresentedNotification:", objc_msgSend(v4, "shouldPreemptPresentedNotification"));
  objc_msgSend(v6, "setShouldDisplayActionsInline:", objc_msgSend(v4, "shouldDisplayActionsInline"));
  v42 = (void *)MEMORY[0x263F1DED0];
  v43 = [v4 subtitleLocalizationKey];
  v44 = [v4 subtitleLocalizationArguments];
  uint64_t v45 = [(UNCNotificationBundle *)self->_bundle cfBundle];
  v46 = [v4 subtitle];
  v47 = [v42 localizedUserNotificationStringForKey:v43 arguments:v44 cfBundle:v45 defaultValue:v46];
  [v6 setSubtitle:v47];

  v48 = [v4 threadIdentifier];
  [v6 setThreadIdentifier:v48];

  v49 = (void *)MEMORY[0x263F1DED0];
  v50 = [v4 titleLocalizationKey];
  v51 = [v4 titleLocalizationArguments];
  uint64_t v52 = [(UNCNotificationBundle *)self->_bundle cfBundle];
  v53 = [v4 title];
  v54 = [v49 localizedUserNotificationStringForKey:v50 arguments:v51 cfBundle:v52 defaultValue:v53];
  [v6 setTitle:v54];

  v55 = [v4 topicIdentifiers];
  [v6 setTopicIdentifiers:v55];

  objc_msgSend(v6, "setRealertCount:", objc_msgSend(v4, "realertCount"));
  v56 = [v4 userInfo];
  [v6 setUserInfo:v56];

  v57 = [v4 summaryArgument];
  [v6 setSummaryArgument:v57];

  objc_msgSend(v6, "setSummaryArgumentCount:", objc_msgSend(v4, "summaryArgumentCount"));
  v58 = [v4 targetContentIdentifier];
  [v6 setTargetContentIdentifier:v58];

  objc_msgSend(v6, "setInterruptionLevel:", -[UNCNotificationRecordMapper _notificationInterruptionLevelForNotificationRecord:](self, "_notificationInterruptionLevelForNotificationRecord:", v4));
  [v4 relevanceScore];
  objc_msgSend(v6, "setRelevanceScore:");
  v59 = [v4 filterCriteria];
  [v6 setFilterCriteria:v59];

  objc_msgSend(v6, "setScreenCaptureProhibited:", objc_msgSend(v4, "screenCaptureProhibited"));
  v60 = [v4 speechLanguage];

  [v6 setSpeechLanguage:v60];

  return v6;
}

- (id)_notificationIconForNotificationRecord:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 iconShouldSuppressMask];
  v5 = [v3 iconApplicationIdentifier];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F1DF40];
    uint64_t v8 = [v3 iconApplicationIdentifier];
    uint64_t v9 = [v7 iconForApplicationIdentifier:v8];
LABEL_9:
    v19 = (void *)v9;

    goto LABEL_10;
  }
  uint64_t v10 = [v3 iconPath];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    objc_super v12 = (void *)MEMORY[0x263F1DF40];
    uint64_t v8 = [v3 iconPath];
    uint64_t v9 = [v12 iconAtPath:v8 shouldSuppressMask:v4];
    goto LABEL_9;
  }
  v13 = [v3 iconName];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    uint64_t v15 = (void *)MEMORY[0x263F1DF40];
    uint64_t v8 = [v3 iconName];
    uint64_t v9 = [v15 iconNamed:v8 shouldSuppressMask:v4];
    goto LABEL_9;
  }
  v16 = [v3 iconSystemImageName];
  uint64_t v17 = [v16 length];

  if (v17)
  {
    v18 = (void *)MEMORY[0x263F1DF40];
    uint64_t v8 = [v3 iconSystemImageName];
    uint64_t v9 = [v18 iconForSystemImageNamed:v8];
    goto LABEL_9;
  }
  v19 = 0;
LABEL_10:

  return v19;
}

- (id)_notificationCommunicationContextForNotificationRecord:(id)a3
{
  id v3 = a3;
  if ([v3 hasCommunicationContext])
  {
    id v4 = objc_alloc_init(MEMORY[0x263F1DFC8]);
    v5 = [v3 communicationContextIdentifier];
    [v4 setIdentifier:v5];

    uint64_t v6 = [v3 communicationContextAssociatedObjectUri];
    [v4 setAssociatedObjectUri:v6];

    id v7 = [v3 communicationContextBundleIdentifier];
    [v4 setBundleIdentifier:v7];

    uint64_t v8 = [v3 communicationContextDisplayName];
    [v4 setDisplayName:v8];

    uint64_t v9 = [v3 communicationContextRecipients];
    uint64_t v10 = objc_msgSend(v9, "bs_map:", UNCContactRecordToUNNotificationContact);
    [v4 setRecipients:v10];

    uint64_t v11 = [v3 communicationContextSender];

    if (v11)
    {
      objc_super v12 = (void (**)(uint64_t, void *))UNCContactRecordToUNNotificationContact;
      v13 = [v3 communicationContextSender];
      uint64_t v14 = v12[2]((uint64_t)v12, v13);
      [v4 setSender:v14];
    }
    uint64_t v15 = [v3 communicationContextContentURL];
    [v4 setContentURL:v15];

    v16 = [v3 communicationContextImageName];
    [v4 setImageName:v16];

    objc_msgSend(v4, "setSystemImage:", objc_msgSend(v3, "communicationContextSystemImage"));
    objc_msgSend(v4, "setMentionsCurrentUser:", objc_msgSend(v3, "communicationContextMentionsCurrentUser"));
    objc_msgSend(v4, "setNotifyRecipientAnyway:", objc_msgSend(v3, "communicationContextNotifyRecipientAnyway"));
    objc_msgSend(v4, "setReplyToCurrentUser:", objc_msgSend(v3, "communicationContextReplyToCurrentUser"));
    objc_msgSend(v4, "setRecipientCount:", objc_msgSend(v3, "communicationContextRecipientCount"));
    objc_msgSend(v4, "setCapabilities:", objc_msgSend(v3, "communicationContextCapabilities"));
    objc_msgSend(v4, "setBusinessCorrespondence:", objc_msgSend(v3, "communicationContextBusinessCorrespondence"));
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_notificationSoundForNotificationRecord:(id)a3
{
  id v3 = a3;
  if ([v3 hasSound])
  {
    id v4 = objc_msgSend(MEMORY[0x263F1DF00], "soundWithAlertType:", objc_msgSend(v3, "toneAlertType"));
    v5 = [v3 toneAlertTopic];
    [v4 setAlertTopic:v5];

    uint64_t v6 = [v3 audioCategory];
    [v4 setAudioCategory:v6];

    id v7 = [v3 audioVolume];
    [v4 setAudioVolume:v7];

    objc_msgSend(v4, "setCritical:", objc_msgSend(v3, "hasCriticalAlertSound"));
    [v3 soundMaximumDuration];
    objc_msgSend(v4, "setMaximumDuration:");
    objc_msgSend(v4, "setShouldIgnoreAccessibilityDisabledVibrationSetting:", objc_msgSend(v3, "shouldIgnoreAccessibilityDisabledVibrationSetting"));
    objc_msgSend(v4, "setShouldIgnoreRingerSwitch:", objc_msgSend(v3, "shouldIgnoreRingerSwitch"));
    objc_msgSend(v4, "setShouldRepeat:", objc_msgSend(v3, "shouldSoundRepeat"));
    uint64_t v8 = [v3 toneFileName];
    [v4 setToneFileName:v8];

    uint64_t v9 = [v3 toneFileURL];
    [v4 setToneFileURL:v9];

    uint64_t v10 = [v3 toneIdentifier];
    [v4 setToneIdentifier:v10];

    objc_msgSend(v4, "setToneMediaLibraryItemIdentifier:", objc_msgSend(v3, "toneMediaLibraryItemIdentifier"));
    uint64_t v11 = [v3 vibrationIdentifier];
    [v4 setVibrationIdentifier:v11];

    objc_super v12 = [v3 vibrationPatternFileURL];
    [v4 setVibrationPatternFileURL:v12];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_notificationTriggerForNotificationRecord:(id)a3
{
  return (*((id (**)(uint64_t, void *))UNSNotificationRecordToUNNotificationTrigger + 2))((uint64_t)UNSNotificationRecordToUNNotificationTrigger, a3);
}

- (unint64_t)_notificationInterruptionLevelForNotificationRecord:(id)a3
{
  return [a3 interruptionLevel];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryRepository, 0);

  objc_storeStrong((id *)&self->_bundle, 0);
}

@end