@interface UNSNotificationRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsAlertDestination;
- (BOOL)allowsCarPlayDestination;
- (BOOL)allowsDefaultDestinations;
- (BOOL)allowsLockScreenDestination;
- (BOOL)allowsNotificationCenterDestination;
- (BOOL)communicationContextBusinessCorrespondence;
- (BOOL)communicationContextMentionsCurrentUser;
- (BOOL)communicationContextNotifyRecipientAnyway;
- (BOOL)communicationContextReplyToCurrentUser;
- (BOOL)communicationContextSystemImage;
- (BOOL)hasAlertContent;
- (BOOL)hasBadge;
- (BOOL)hasCommunicationContext;
- (BOOL)hasCriticalAlertSound;
- (BOOL)hasDefaultAction;
- (BOOL)hasPendingTrigger;
- (BOOL)hasSound;
- (BOOL)iconShouldSuppressMask;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighlight;
- (BOOL)isSimilar:(id)a3;
- (BOOL)screenCaptureProhibited;
- (BOOL)shouldAuthenticateDefaultAction;
- (BOOL)shouldBackgroundDefaultAction;
- (BOOL)shouldBadgeApplicationIcon;
- (BOOL)shouldDisplayActionsInline;
- (BOOL)shouldHideDate;
- (BOOL)shouldHideTime;
- (BOOL)shouldIgnoreAccessibilityDisabledVibrationSetting;
- (BOOL)shouldIgnoreDoNotDisturb;
- (BOOL)shouldIgnoreDowntime;
- (BOOL)shouldIgnoreRingerSwitch;
- (BOOL)shouldPlaySound;
- (BOOL)shouldPreemptPresentedNotification;
- (BOOL)shouldPresentAlert;
- (BOOL)shouldPreventNotificationDismissalAfterDefaultAction;
- (BOOL)shouldShowSubordinateIcon;
- (BOOL)shouldSoundRepeat;
- (BOOL)shouldSuppressScreenLightUp;
- (BOOL)shouldSuppressSyncDismissalWhenRemoved;
- (BOOL)shouldUseRequestIdentifierForDismissalSync;
- (BOOL)triggerRepeats;
- (BOOL)willNotifyUser;
- (CLRegion)triggerRegion;
- (DNDClientEventBehavior)eventBehavior;
- (NSArray)attachments;
- (NSArray)bodyLocalizationArguments;
- (NSArray)communicationContextRecipients;
- (NSArray)footerLocalizationArguments;
- (NSArray)headerLocalizationArguments;
- (NSArray)subtitleLocalizationArguments;
- (NSArray)titleLocalizationArguments;
- (NSAttributedString)attributedBody;
- (NSAttributedString)summary;
- (NSDate)contentDate;
- (NSDate)date;
- (NSDate)expirationDate;
- (NSDate)requestDate;
- (NSDate)triggerDate;
- (NSDateComponents)triggerDateComponents;
- (NSDictionary)userInfo;
- (NSNumber)audioVolume;
- (NSNumber)badge;
- (NSNumber)contentAvailable;
- (NSNumber)mutableContent;
- (NSSet)topicIdentifiers;
- (NSString)accessoryImageName;
- (NSString)audioCategory;
- (NSString)body;
- (NSString)bodyLocalizationKey;
- (NSString)categoryIdentifier;
- (NSString)communicationContextAssociatedObjectUri;
- (NSString)communicationContextBundleIdentifier;
- (NSString)communicationContextDisplayName;
- (NSString)communicationContextIdentifier;
- (NSString)communicationContextImageName;
- (NSString)contentType;
- (NSString)debugDescription;
- (NSString)defaultActionBundleIdentifier;
- (NSString)defaultActionTitle;
- (NSString)defaultActionTitleLocalizationKey;
- (NSString)description;
- (NSString)filterCriteria;
- (NSString)footer;
- (NSString)footerLocalizationKey;
- (NSString)header;
- (NSString)headerLocalizationKey;
- (NSString)iconApplicationIdentifier;
- (NSString)iconName;
- (NSString)iconPath;
- (NSString)iconSystemImageName;
- (NSString)identifier;
- (NSString)launchImageName;
- (NSString)speechLanguage;
- (NSString)subtitle;
- (NSString)subtitleLocalizationKey;
- (NSString)summaryArgument;
- (NSString)targetContentIdentifier;
- (NSString)threadIdentifier;
- (NSString)title;
- (NSString)titleLocalizationKey;
- (NSString)toneAlertTopic;
- (NSString)toneFileName;
- (NSString)toneIdentifier;
- (NSString)triggerRepeatCalendarIdentifier;
- (NSString)triggerType;
- (NSString)vibrationIdentifier;
- (NSTimeZone)triggerTimeZone;
- (NSURL)communicationContextContentURL;
- (NSURL)defaultActionURL;
- (NSURL)toneFileURL;
- (NSURL)vibrationPatternFileURL;
- (UNCContactRecord)communicationContextSender;
- (UNSNotificationRecord)init;
- (UNSNotificationRecord)initWithCoder:(id)a3;
- (UNSNotificationRecord)initWithDictionaryRepresentation:(id)a3;
- (double)relevanceScore;
- (double)soundMaximumDuration;
- (double)triggerTimeInterval;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationWithTruncation:(BOOL)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)communicationContextCapabilities;
- (int64_t)pipelineState;
- (int64_t)revisionNumber;
- (int64_t)toneAlertType;
- (unint64_t)communicationContextRecipientCount;
- (unint64_t)hash;
- (unint64_t)interruptionLevel;
- (unint64_t)presentationOptions;
- (unint64_t)priorityStatus;
- (unint64_t)realertCount;
- (unint64_t)summaryArgumentCount;
- (unint64_t)summaryStatus;
- (unint64_t)toneMediaLibraryItemIdentifier;
- (unint64_t)triggerRepeatInterval;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryImageName:(id)a3;
- (void)setAllowsAlertDestination:(BOOL)a3;
- (void)setAllowsCarPlayDestination:(BOOL)a3;
- (void)setAllowsDefaultDestinations:(BOOL)a3;
- (void)setAllowsLockScreenDestination:(BOOL)a3;
- (void)setAllowsNotificationCenterDestination:(BOOL)a3;
- (void)setAttachments:(id)a3;
- (void)setAttributedBody:(id)a3;
- (void)setAudioCategory:(id)a3;
- (void)setAudioVolume:(id)a3;
- (void)setBadge:(id)a3;
- (void)setBody:(id)a3;
- (void)setBodyLocalizationArguments:(id)a3;
- (void)setBodyLocalizationKey:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setCommunicationContextAssociatedObjectUri:(id)a3;
- (void)setCommunicationContextBundleIdentifier:(id)a3;
- (void)setCommunicationContextBusinessCorrespondence:(BOOL)a3;
- (void)setCommunicationContextCapabilities:(int64_t)a3;
- (void)setCommunicationContextContentURL:(id)a3;
- (void)setCommunicationContextDisplayName:(id)a3;
- (void)setCommunicationContextIdentifier:(id)a3;
- (void)setCommunicationContextImageName:(id)a3;
- (void)setCommunicationContextMentionsCurrentUser:(BOOL)a3;
- (void)setCommunicationContextNotifyRecipientAnyway:(BOOL)a3;
- (void)setCommunicationContextRecipientCount:(unint64_t)a3;
- (void)setCommunicationContextRecipients:(id)a3;
- (void)setCommunicationContextReplyToCurrentUser:(BOOL)a3;
- (void)setCommunicationContextSender:(id)a3;
- (void)setCommunicationContextSystemImage:(BOOL)a3;
- (void)setContentAvailable:(id)a3;
- (void)setContentDate:(id)a3;
- (void)setContentType:(id)a3;
- (void)setDate:(id)a3;
- (void)setDefaultActionBundleIdentifier:(id)a3;
- (void)setDefaultActionTitle:(id)a3;
- (void)setDefaultActionTitleLocalizationKey:(id)a3;
- (void)setDefaultActionURL:(id)a3;
- (void)setEventBehavior:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setFilterCriteria:(id)a3;
- (void)setFooter:(id)a3;
- (void)setFooterLocalizationArguments:(id)a3;
- (void)setFooterLocalizationKey:(id)a3;
- (void)setHasCriticalAlertSound:(BOOL)a3;
- (void)setHasDefaultAction:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setHeaderLocalizationArguments:(id)a3;
- (void)setHeaderLocalizationKey:(id)a3;
- (void)setIconApplicationIdentifier:(id)a3;
- (void)setIconName:(id)a3;
- (void)setIconPath:(id)a3;
- (void)setIconShouldSuppressMask:(BOOL)a3;
- (void)setIconSystemImageName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterruptionLevel:(unint64_t)a3;
- (void)setIsHighlight:(BOOL)a3;
- (void)setLaunchImageName:(id)a3;
- (void)setMutableContent:(id)a3;
- (void)setPipelineState:(int64_t)a3;
- (void)setPresentationOptions:(unint64_t)a3;
- (void)setPriorityStatus:(unint64_t)a3;
- (void)setRealertCount:(unint64_t)a3;
- (void)setRelevanceScore:(double)a3;
- (void)setRequestDate:(id)a3;
- (void)setRevisionNumber:(int64_t)a3;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setShouldAuthenticateDefaultAction:(BOOL)a3;
- (void)setShouldBackgroundDefaultAction:(BOOL)a3;
- (void)setShouldBadgeApplicationIcon:(BOOL)a3;
- (void)setShouldDisplayActionsInline:(BOOL)a3;
- (void)setShouldHideDate:(BOOL)a3;
- (void)setShouldHideTime:(BOOL)a3;
- (void)setShouldIgnoreAccessibilityDisabledVibrationSetting:(BOOL)a3;
- (void)setShouldIgnoreDoNotDisturb:(BOOL)a3;
- (void)setShouldIgnoreDowntime:(BOOL)a3;
- (void)setShouldIgnoreRingerSwitch:(BOOL)a3;
- (void)setShouldPlaySound:(BOOL)a3;
- (void)setShouldPreemptPresentedNotification:(BOOL)a3;
- (void)setShouldPresentAlert:(BOOL)a3;
- (void)setShouldPreventNotificationDismissalAfterDefaultAction:(BOOL)a3;
- (void)setShouldShowSubordinateIcon:(BOOL)a3;
- (void)setShouldSoundRepeat:(BOOL)a3;
- (void)setShouldSuppressScreenLightUp:(BOOL)a3;
- (void)setShouldSuppressSyncDismissalWhenRemoved:(BOOL)a3;
- (void)setShouldUseRequestIdentifierForDismissalSync:(BOOL)a3;
- (void)setSoundMaximumDuration:(double)a3;
- (void)setSpeechLanguage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLocalizationArguments:(id)a3;
- (void)setSubtitleLocalizationKey:(id)a3;
- (void)setSummary:(id)a3;
- (void)setSummaryArgument:(id)a3;
- (void)setSummaryArgumentCount:(unint64_t)a3;
- (void)setSummaryStatus:(unint64_t)a3;
- (void)setTargetContentIdentifier:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLocalizationArguments:(id)a3;
- (void)setTitleLocalizationKey:(id)a3;
- (void)setToneAlertTopic:(id)a3;
- (void)setToneAlertType:(int64_t)a3;
- (void)setToneFileName:(id)a3;
- (void)setToneFileURL:(id)a3;
- (void)setToneIdentifier:(id)a3;
- (void)setToneMediaLibraryItemIdentifier:(unint64_t)a3;
- (void)setTopicIdentifiers:(id)a3;
- (void)setTriggerDate:(id)a3;
- (void)setTriggerDateComponents:(id)a3;
- (void)setTriggerRegion:(id)a3;
- (void)setTriggerRepeatCalendarIdentifier:(id)a3;
- (void)setTriggerRepeatInterval:(unint64_t)a3;
- (void)setTriggerRepeats:(BOOL)a3;
- (void)setTriggerTimeInterval:(double)a3;
- (void)setTriggerTimeZone:(id)a3;
- (void)setTriggerType:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setVibrationIdentifier:(id)a3;
- (void)setVibrationPatternFileURL:(id)a3;
@end

@implementation UNSNotificationRecord

- (UNSNotificationRecord)init
{
  return [(UNSNotificationRecord *)self initWithDictionaryRepresentation:MEMORY[0x263EFFA78]];
}

- (UNSNotificationRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v150.receiver = self;
  v150.super_class = (Class)UNSNotificationRecord;
  v5 = [(UNSNotificationRecord *)&v150 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"NotificationType"];
    [(UNSNotificationRecord *)v5 setContentType:v6];

    v7 = [v4 objectForKey:@"CommunicationContextIdentifier"];
    [(UNSNotificationRecord *)v5 setCommunicationContextIdentifier:v7];

    v8 = [v4 objectForKey:@"CommunicationContextBundleIdentifier"];
    [(UNSNotificationRecord *)v5 setCommunicationContextBundleIdentifier:v8];

    v9 = [v4 objectForKey:@"CommunicationContextAssociatedObjectUri"];
    [(UNSNotificationRecord *)v5 setCommunicationContextAssociatedObjectUri:v9];

    v10 = [v4 objectForKey:@"CommunicationContextDisplayName"];
    [(UNSNotificationRecord *)v5 setCommunicationContextDisplayName:v10];

    v11 = objc_msgSend(v4, "unc_nonNilArrayForKey:", @"CommunicationContextRecipients");
    v12 = objc_msgSend(v11, "bs_map:", UNCDictionaryToContactRecord);
    [(UNSNotificationRecord *)v5 setCommunicationContextRecipients:v12];

    v13 = [v4 objectForKey:@"CommunicationContextSender"];

    if (v13)
    {
      v14 = (void (**)(uint64_t, void *))UNCDictionaryToContactRecord;
      v15 = [v4 objectForKey:@"CommunicationContextSender"];
      v16 = v14[2]((uint64_t)v14, v15);
      [(UNSNotificationRecord *)v5 setCommunicationContextSender:v16];
    }
    v17 = [v4 objectForKey:@"CommunicationContextContentURL"];
    [(UNSNotificationRecord *)v5 setCommunicationContextContentURL:v17];

    v18 = [v4 objectForKey:@"CommunicationContextImageName"];
    [(UNSNotificationRecord *)v5 setCommunicationContextImageName:v18];

    v19 = [v4 objectForKey:@"CommunicationContextSystemImage"];
    -[UNSNotificationRecord setCommunicationContextSystemImage:](v5, "setCommunicationContextSystemImage:", [v19 BOOLValue]);

    v20 = [v4 objectForKey:@"CommunicationContextMentionsCurrentUser"];
    -[UNSNotificationRecord setCommunicationContextMentionsCurrentUser:](v5, "setCommunicationContextMentionsCurrentUser:", [v20 BOOLValue]);

    v21 = [v4 objectForKey:@"CommunicationContextNotifyRecipientAnyway"];
    -[UNSNotificationRecord setCommunicationContextNotifyRecipientAnyway:](v5, "setCommunicationContextNotifyRecipientAnyway:", [v21 BOOLValue]);

    v22 = [v4 objectForKey:@"CommunicationContextReplyToCurrentUser"];
    -[UNSNotificationRecord setCommunicationContextReplyToCurrentUser:](v5, "setCommunicationContextReplyToCurrentUser:", [v22 BOOLValue]);

    v23 = [v4 objectForKey:@"CommunicationContextRecipientCount"];
    -[UNSNotificationRecord setCommunicationContextRecipientCount:](v5, "setCommunicationContextRecipientCount:", [v23 unsignedIntegerValue]);

    v24 = [v4 objectForKey:@"CommunicationContextCapabilities"];
    -[UNSNotificationRecord setCommunicationContextCapabilities:](v5, "setCommunicationContextCapabilities:", [v24 unsignedIntegerValue]);

    v25 = [v4 objectForKey:@"CommunicationContextBusinessCorrespondence"];
    -[UNSNotificationRecord setCommunicationContextBusinessCorrespondence:](v5, "setCommunicationContextBusinessCorrespondence:", [v25 BOOLValue]);

    v26 = [v4 objectForKey:@"AccessoryImageName"];
    [(UNSNotificationRecord *)v5 setAccessoryImageName:v26];

    v27 = objc_msgSend(v4, "unc_nonNilArrayForKey:", @"AppNotificationAttachments");
    v28 = objc_msgSend(v27, "bs_map:", UNSDictionaryToAttachmentRecord);
    [(UNSNotificationRecord *)v5 setAttachments:v28];

    v29 = [v4 objectForKey:@"AppNotificationBadgeNumber"];
    [(UNSNotificationRecord *)v5 setBadge:v29];

    v30 = [v4 objectForKey:@"AppNotificationMessage"];
    [(UNSNotificationRecord *)v5 setBody:v30];

    v31 = [v4 objectForKey:@"AppNotificationMessageLocalizationArguments"];
    [(UNSNotificationRecord *)v5 setBodyLocalizationArguments:v31];

    v32 = [v4 objectForKey:@"AppNotificationMessageLocazationKey"];
    [(UNSNotificationRecord *)v5 setBodyLocalizationKey:v32];

    v33 = (void *)MEMORY[0x263F086A0];
    v34 = [v4 objectForKey:@"AppNotificationAttributedMessage"];
    v35 = objc_msgSend(v33, "_un_attributedStringWithRTFDData:", v34);
    [(UNSNotificationRecord *)v5 setAttributedBody:v35];

    v36 = [v4 objectForKey:@"AppNotificationSummaryArgument"];
    [(UNSNotificationRecord *)v5 setSummaryArgument:v36];

    v37 = [v4 objectForKey:@"AppNotificationSummaryArgumentCount"];
    -[UNSNotificationRecord setSummaryArgumentCount:](v5, "setSummaryArgumentCount:", [v37 unsignedIntegerValue]);

    v38 = [v4 objectForKey:@"TargetContentIdentifier"];
    [(UNSNotificationRecord *)v5 setTargetContentIdentifier:v38];

    v39 = objc_msgSend(v4, "unc_safeCastNonNilStringForKey:", @"SBSPushStoreNotificationCategoryKey");
    [(UNSNotificationRecord *)v5 setCategoryIdentifier:v39];

    v40 = [v4 objectForKey:@"ContentDate"];
    [(UNSNotificationRecord *)v5 setContentDate:v40];

    v41 = objc_msgSend(v4, "unc_safeCastNonNilStringForKey:", @"SBSPushStoreNotificationThreadKey");
    [(UNSNotificationRecord *)v5 setThreadIdentifier:v41];

    v42 = [v4 objectForKey:@"AppNotificationContentAvailable"];
    [(UNSNotificationRecord *)v5 setContentAvailable:v42];

    v43 = [v4 objectForKey:@"AppNotificationMutableContent"];
    [(UNSNotificationRecord *)v5 setMutableContent:v43];

    v44 = [v4 objectForKey:@"AppNotificationCreationDate"];
    [(UNSNotificationRecord *)v5 setDate:v44];

    v45 = [v4 objectForKey:@"ExpirationDate"];
    [(UNSNotificationRecord *)v5 setExpirationDate:v45];

    v46 = [v4 objectForKey:@"InterruptionLevel"];
    if (v46)
    {
      v47 = [v4 objectForKey:@"InterruptionLevel"];
      uint64_t v48 = [v47 unsignedIntValue];
    }
    else
    {
      uint64_t v48 = *MEMORY[0x263F1E0E0];
    }

    [(UNSNotificationRecord *)v5 setInterruptionLevel:v48];
    v49 = [v4 objectForKey:@"HasDefaultActionKey"];
    -[UNSNotificationRecord setHasDefaultAction:](v5, "setHasDefaultAction:", [v49 BOOLValue]);

    v50 = [v4 objectForKey:@"AppNotificationActionText"];
    [(UNSNotificationRecord *)v5 setDefaultActionTitle:v50];

    [(UNSNotificationRecord *)v5 setDefaultActionTitleLocalizationKey:0];
    v51 = [v4 objectForKey:@"DefaultActionURL"];

    if (v51)
    {
      v52 = NSURL;
      v53 = [v4 objectForKey:@"DefaultActionURL"];
      v54 = [v52 URLWithString:v53];
      [(UNSNotificationRecord *)v5 setDefaultActionURL:v54];
    }
    v55 = [v4 objectForKey:@"DefaultActionBundleIdentifier"];
    [(UNSNotificationRecord *)v5 setDefaultActionBundleIdentifier:v55];

    v56 = [v4 objectForKey:@"CriticalAlertSound"];
    -[UNSNotificationRecord setHasCriticalAlertSound:](v5, "setHasCriticalAlertSound:", [v56 BOOLValue]);

    v57 = [v4 objectForKey:@"Header"];
    [(UNSNotificationRecord *)v5 setHeader:v57];

    v58 = [v4 objectForKey:@"HeaderLocalizationArguments"];
    [(UNSNotificationRecord *)v5 setHeaderLocalizationArguments:v58];

    v59 = [v4 objectForKey:@"HeaderLocalizationKey"];
    [(UNSNotificationRecord *)v5 setHeaderLocalizationKey:v59];

    v60 = [v4 objectForKey:@"Footer"];
    [(UNSNotificationRecord *)v5 setFooter:v60];

    v61 = [v4 objectForKey:@"FooterLocalizationArguments"];
    [(UNSNotificationRecord *)v5 setFooterLocalizationArguments:v61];

    v62 = [v4 objectForKey:@"FooterLocalizationKey"];
    [(UNSNotificationRecord *)v5 setFooterLocalizationKey:v62];

    v63 = [v4 objectForKey:@"IconApplicationIdentifier"];
    [(UNSNotificationRecord *)v5 setIconApplicationIdentifier:v63];

    v64 = [v4 objectForKey:@"IconName"];
    [(UNSNotificationRecord *)v5 setIconName:v64];

    v65 = [v4 objectForKey:@"IconPath"];
    [(UNSNotificationRecord *)v5 setIconPath:v65];

    v66 = [v4 objectForKey:@"IconSystemImageName"];
    [(UNSNotificationRecord *)v5 setIconSystemImageName:v66];

    v67 = [v4 objectForKey:@"IconShouldSuppressMask"];
    -[UNSNotificationRecord setIconShouldSuppressMask:](v5, "setIconShouldSuppressMask:", [v67 BOOLValue]);

    v68 = [v4 objectForKey:@"AppNotificationIdentifier"];
    [(UNSNotificationRecord *)v5 setIdentifier:v68];

    v69 = objc_msgSend(v4, "unc_safeCastNonNilStringForKey:", @"AppNotificationLaunchImage");
    [(UNSNotificationRecord *)v5 setLaunchImageName:v69];

    v70 = [v4 objectForKey:@"RequestDate"];
    [(UNSNotificationRecord *)v5 setRequestDate:v70];

    v71 = [v4 objectForKey:@"BadgeApplicationIcon"];
    -[UNSNotificationRecord setShouldBadgeApplicationIcon:](v5, "setShouldBadgeApplicationIcon:", [v71 BOOLValue]);

    v72 = [v4 objectForKey:@"ShouldHideDate"];
    -[UNSNotificationRecord setShouldHideDate:](v5, "setShouldHideDate:", [v72 BOOLValue]);

    v73 = [v4 objectForKey:@"ShouldHideTime"];
    -[UNSNotificationRecord setShouldHideTime:](v5, "setShouldHideTime:", [v73 BOOLValue]);

    v74 = [v4 objectForKey:@"ShouldIgnoreAccessibilityDisabledVibrationSetting"];
    -[UNSNotificationRecord setShouldIgnoreAccessibilityDisabledVibrationSetting:](v5, "setShouldIgnoreAccessibilityDisabledVibrationSetting:", [v74 BOOLValue]);

    v75 = [v4 objectForKey:@"ShouldIgnoreDoNotDisturb"];
    -[UNSNotificationRecord setShouldIgnoreDoNotDisturb:](v5, "setShouldIgnoreDoNotDisturb:", [v75 BOOLValue]);

    v76 = [v4 objectForKey:@"ShouldIgnoreDowntime"];
    -[UNSNotificationRecord setShouldIgnoreDowntime:](v5, "setShouldIgnoreDowntime:", [v76 BOOLValue]);

    v77 = [v4 objectForKey:@"SoundShouldIgnoreRingerSwitch"];
    -[UNSNotificationRecord setShouldIgnoreRingerSwitch:](v5, "setShouldIgnoreRingerSwitch:", [v77 BOOLValue]);

    v78 = [v4 objectForKey:@"ShouldSuppressScreenLightUp"];
    -[UNSNotificationRecord setShouldSuppressScreenLightUp:](v5, "setShouldSuppressScreenLightUp:", [v78 BOOLValue]);

    v79 = [v4 objectForKey:@"SoundShouldRepeat"];
    -[UNSNotificationRecord setShouldSoundRepeat:](v5, "setShouldSoundRepeat:", [v79 BOOLValue]);

    v80 = [v4 objectForKey:@"SoundMaximumDuration"];
    [v80 doubleValue];
    -[UNSNotificationRecord setSoundMaximumDuration:](v5, "setSoundMaximumDuration:");

    v81 = [v4 objectForKey:@"ShouldPlaySound"];
    -[UNSNotificationRecord setShouldPlaySound:](v5, "setShouldPlaySound:", [v81 BOOLValue]);

    v82 = [v4 objectForKey:@"ShouldPresentAlert"];
    -[UNSNotificationRecord setShouldPresentAlert:](v5, "setShouldPresentAlert:", [v82 BOOLValue]);

    v83 = [v4 objectForKey:@"PresentationOptions"];
    -[UNSNotificationRecord setPresentationOptions:](v5, "setPresentationOptions:", [v83 unsignedIntegerValue]);

    v84 = [v4 objectForKey:@"ShouldAuthenticateDefaultAction"];
    -[UNSNotificationRecord setShouldAuthenticateDefaultAction:](v5, "setShouldAuthenticateDefaultAction:", [v84 BOOLValue]);

    v85 = [v4 objectForKey:@"ShouldBackgroundDefaultAction"];
    -[UNSNotificationRecord setShouldBackgroundDefaultAction:](v5, "setShouldBackgroundDefaultAction:", [v85 BOOLValue]);

    v86 = [v4 objectForKey:@"ShouldPreventNotificationDismissalAfterDefaultAction"];
    -[UNSNotificationRecord setShouldPreventNotificationDismissalAfterDefaultAction:](v5, "setShouldPreventNotificationDismissalAfterDefaultAction:", [v86 BOOLValue]);

    v87 = [v4 objectForKey:@"UNNotificationShouldShowSubordinateIcon"];
    -[UNSNotificationRecord setShouldShowSubordinateIcon:](v5, "setShouldShowSubordinateIcon:", [v87 BOOLValue]);

    v88 = [v4 objectForKey:@"ShouldSuppressSyncDismissalWhenRemoved"];
    -[UNSNotificationRecord setShouldSuppressSyncDismissalWhenRemoved:](v5, "setShouldSuppressSyncDismissalWhenRemoved:", [v88 BOOLValue]);

    v89 = [v4 objectForKey:@"ShouldUseRequestIdentifierForDismissalSync"];
    -[UNSNotificationRecord setShouldUseRequestIdentifierForDismissalSync:](v5, "setShouldUseRequestIdentifierForDismissalSync:", [v89 BOOLValue]);

    v90 = [v4 objectForKey:@"ShouldPreemptPresentedNotification"];
    -[UNSNotificationRecord setShouldPreemptPresentedNotification:](v5, "setShouldPreemptPresentedNotification:", [v90 BOOLValue]);

    v91 = [v4 objectForKey:@"ShouldDisplayActionsInline"];
    -[UNSNotificationRecord setShouldDisplayActionsInline:](v5, "setShouldDisplayActionsInline:", [v91 BOOLValue]);

    v92 = [v4 objectForKey:@"AudioCategory"];
    [(UNSNotificationRecord *)v5 setAudioCategory:v92];

    v93 = [v4 objectForKey:@"AudioVolume"];
    [(UNSNotificationRecord *)v5 setAudioVolume:v93];

    v94 = [v4 objectForKey:@"AppNotificationSubtitle"];
    [(UNSNotificationRecord *)v5 setSubtitle:v94];

    v95 = [v4 objectForKey:@"AppNotificationSubtitleLocalizationArguments"];
    [(UNSNotificationRecord *)v5 setSubtitleLocalizationArguments:v95];

    v96 = [v4 objectForKey:@"AppNotificationSubtitleLocalizationKey"];
    [(UNSNotificationRecord *)v5 setSubtitleLocalizationKey:v96];

    v97 = [v4 objectForKey:@"AppNotificationTitle"];
    [(UNSNotificationRecord *)v5 setTitle:v97];

    v98 = [v4 objectForKey:@"AppNotificationTitleLocalizationArguments"];
    [(UNSNotificationRecord *)v5 setTitleLocalizationArguments:v98];

    v99 = [v4 objectForKey:@"AppNotificationTitleLocalizationKey"];
    [(UNSNotificationRecord *)v5 setTitleLocalizationKey:v99];

    v100 = [v4 objectForKey:@"ToneAlertTopic"];
    [(UNSNotificationRecord *)v5 setToneAlertTopic:v100];

    v101 = [v4 objectForKey:@"ToneAlertType"];
    -[UNSNotificationRecord setToneAlertType:](v5, "setToneAlertType:", [v101 integerValue]);

    v102 = [v4 objectForKey:@"ToneFileName"];
    [(UNSNotificationRecord *)v5 setToneFileName:v102];

    v103 = [v4 objectForKey:@"ToneFileURL"];

    if (v103)
    {
      v104 = NSURL;
      v105 = [v4 objectForKey:@"ToneFileURL"];
      v106 = [v104 URLWithString:v105];
      [(UNSNotificationRecord *)v5 setToneFileURL:v106];
    }
    v107 = [v4 objectForKey:@"ToneIdentifier"];
    [(UNSNotificationRecord *)v5 setToneIdentifier:v107];

    v108 = [v4 objectForKey:@"ToneMediaLibraryItemIdentifier"];
    -[UNSNotificationRecord setToneMediaLibraryItemIdentifier:](v5, "setToneMediaLibraryItemIdentifier:", [v108 unsignedLongLongValue]);

    v109 = objc_msgSend(v4, "unc_nonNilSetForKey:", @"Topics");
    [(UNSNotificationRecord *)v5 setTopicIdentifiers:v109];

    v110 = [v4 objectForKey:@"RealertCount"];
    -[UNSNotificationRecord setRealertCount:](v5, "setRealertCount:", [v110 unsignedIntegerValue]);

    v111 = [v4 objectForKey:@"UNNotificationDefaultDestinations"];
    -[UNSNotificationRecord setAllowsDefaultDestinations:](v5, "setAllowsDefaultDestinations:", [v111 BOOLValue]);

    v112 = [v4 objectForKey:@"UNNotificationLockScreenDestination"];
    -[UNSNotificationRecord setAllowsLockScreenDestination:](v5, "setAllowsLockScreenDestination:", [v112 BOOLValue]);

    v113 = [v4 objectForKey:@"UNNotificationNotificationCenterDestination"];
    -[UNSNotificationRecord setAllowsNotificationCenterDestination:](v5, "setAllowsNotificationCenterDestination:", [v113 BOOLValue]);

    v114 = [v4 objectForKey:@"UNNotificationAlertDestination"];
    -[UNSNotificationRecord setAllowsAlertDestination:](v5, "setAllowsAlertDestination:", [v114 BOOLValue]);

    v115 = [v4 objectForKey:@"UNNotificationCarPlayDestination"];
    -[UNSNotificationRecord setAllowsCarPlayDestination:](v5, "setAllowsCarPlayDestination:", [v115 BOOLValue]);

    v116 = [v4 objectForKey:@"TriggerDate"];
    [(UNSNotificationRecord *)v5 setTriggerDate:v116];

    v117 = [v4 objectForKey:@"TriggerDateComponents"];
    [(UNSNotificationRecord *)v5 setTriggerDateComponents:v117];

    v118 = [v4 objectForKey:@"TriggerRegion"];

    if (v118)
    {
      v119 = (void *)MEMORY[0x263F00AB0];
      v120 = [v4 objectForKey:@"TriggerRegion"];
      v121 = objc_msgSend(v119, "bs_secureDecodedFromData:", v120);
      [(UNSNotificationRecord *)v5 setTriggerRegion:v121];
    }
    v122 = [v4 objectForKey:@"TriggerRepeatCalendar"];
    [(UNSNotificationRecord *)v5 setTriggerRepeatCalendarIdentifier:v122];

    v123 = [v4 objectForKey:@"TriggerRepeatInterval"];
    -[UNSNotificationRecord setTriggerRepeatInterval:](v5, "setTriggerRepeatInterval:", [v123 unsignedIntegerValue]);

    v124 = [v4 objectForKey:@"TriggerRepeats"];
    -[UNSNotificationRecord setTriggerRepeats:](v5, "setTriggerRepeats:", [v124 BOOLValue]);

    v125 = [v4 objectForKey:@"TriggerTimeInterval"];
    [v125 doubleValue];
    -[UNSNotificationRecord setTriggerTimeInterval:](v5, "setTriggerTimeInterval:");

    v126 = [v4 objectForKey:@"TriggerTimeZone"];

    if (v126)
    {
      v127 = (void *)MEMORY[0x263EFFA18];
      v128 = [v4 objectForKey:@"TriggerTimeZone"];
      v129 = [v127 timeZoneWithName:v128];
      [(UNSNotificationRecord *)v5 setTriggerTimeZone:v129];
    }
    v130 = [v4 objectForKey:@"UNNotificationTriggerType"];
    [(UNSNotificationRecord *)v5 setTriggerType:v130];

    v131 = [v4 objectForKey:@"UNNotificationUserInfo"];
    [(UNSNotificationRecord *)v5 setUserInfo:v131];

    v132 = [v4 objectForKey:@"VibrationIdentifier"];
    [(UNSNotificationRecord *)v5 setVibrationIdentifier:v132];

    v133 = [v4 objectForKey:@"VibrationPatternFileURL"];

    if (v133)
    {
      v134 = NSURL;
      v135 = [v4 objectForKey:@"VibrationPatternFileURL"];
      v136 = [v134 URLWithString:v135];
      [(UNSNotificationRecord *)v5 setVibrationPatternFileURL:v136];
    }
    v137 = [v4 objectForKey:@"UNNotificationRelevanceScore"];
    [v137 doubleValue];
    -[UNSNotificationRecord setRelevanceScore:](v5, "setRelevanceScore:");

    v138 = [v4 objectForKey:@"FilterCriteria"];
    [(UNSNotificationRecord *)v5 setFilterCriteria:v138];

    v139 = [v4 objectForKey:@"ScreenCaptureProhibited"];
    -[UNSNotificationRecord setScreenCaptureProhibited:](v5, "setScreenCaptureProhibited:", [v139 BOOLValue]);

    v140 = [v4 objectForKey:@"SpeechLanguage"];
    [(UNSNotificationRecord *)v5 setSpeechLanguage:v140];

    v141 = objc_msgSend(v4, "bs_safeNumberForKey:", @"RevisionNumber");
    -[UNSNotificationRecord setRevisionNumber:](v5, "setRevisionNumber:", [v141 integerValue]);

    v142 = objc_msgSend(v4, "bs_safeNumberForKey:", @"PipelineState");
    -[UNSNotificationRecord setPipelineState:](v5, "setPipelineState:", [v142 integerValue]);

    -[UNSNotificationRecord setIsHighlight:](v5, "setIsHighlight:", objc_msgSend(v4, "bs_BOOLForKey:", @"IsHighlight"));
    v143 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"Summary", objc_opt_class());
    [(UNSNotificationRecord *)v5 setSummary:v143];

    v144 = [v4 objectForKey:@"PriorityStatus"];
    if (v144)
    {
      v145 = objc_msgSend(v4, "bs_safeNumberForKey:", @"PriorityStatus");
      -[UNSNotificationRecord setPriorityStatus:](v5, "setPriorityStatus:", [v145 unsignedIntValue]);
    }
    else
    {
      [(UNSNotificationRecord *)v5 setPriorityStatus:0];
    }

    v146 = [v4 objectForKey:@"SummaryStatus"];
    if (v146)
    {
      v147 = objc_msgSend(v4, "bs_safeNumberForKey:", @"SummaryStatus");
      -[UNSNotificationRecord setSummaryStatus:](v5, "setSummaryStatus:", [v147 unsignedIntValue]);
    }
    else
    {
      [(UNSNotificationRecord *)v5 setSummaryStatus:0];
    }

    v148 = objc_msgSend(v4, "bs_safeObjectForKey:ofType:", @"EventBehavior", objc_opt_class());
    [(UNSNotificationRecord *)v5 setEventBehavior:v148];
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  return [(UNSNotificationRecord *)self dictionaryRepresentationWithTruncation:0];
}

- (id)dictionaryRepresentationWithTruncation:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 256;
  }
  else {
    uint64_t v4 = -1;
  }
  v5 = [MEMORY[0x263EFF9A0] dictionary];
  v6 = [(UNSNotificationRecord *)self contentType];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v6, @"NotificationType");

  v7 = [(UNSNotificationRecord *)self communicationContextIdentifier];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v7, @"CommunicationContextIdentifier");

  v8 = [(UNSNotificationRecord *)self communicationContextBundleIdentifier];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v8, @"CommunicationContextBundleIdentifier");

  v9 = [(UNSNotificationRecord *)self communicationContextAssociatedObjectUri];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v9, @"CommunicationContextAssociatedObjectUri");

  v10 = [(UNSNotificationRecord *)self communicationContextDisplayName];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v10, @"CommunicationContextDisplayName");

  v11 = (void (**)(uint64_t, void *))UNCContactRecordToDictionary;
  v12 = [(UNSNotificationRecord *)self communicationContextSender];
  v13 = v11[2]((uint64_t)v11, v12);
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v13, @"CommunicationContextSender");

  v14 = [(UNSNotificationRecord *)self communicationContextRecipients];
  v15 = objc_msgSend(v14, "bs_map:", UNCContactRecordToDictionary);
  objc_msgSend(v5, "unc_safeSetNonEmptyArray:forKey:", v15, @"CommunicationContextRecipients");

  v16 = [(UNSNotificationRecord *)self communicationContextContentURL];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v16, @"CommunicationContextContentURL");

  v17 = [(UNSNotificationRecord *)self communicationContextImageName];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v17, @"CommunicationContextImageName");

  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord communicationContextSystemImage](self, "communicationContextSystemImage"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v18, @"CommunicationContextSystemImage");

  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord communicationContextMentionsCurrentUser](self, "communicationContextMentionsCurrentUser"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v19, @"CommunicationContextMentionsCurrentUser");

  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord communicationContextNotifyRecipientAnyway](self, "communicationContextNotifyRecipientAnyway"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v20, @"CommunicationContextNotifyRecipientAnyway");

  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord communicationContextReplyToCurrentUser](self, "communicationContextReplyToCurrentUser"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v21, @"CommunicationContextReplyToCurrentUser");

  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNSNotificationRecord communicationContextRecipientCount](self, "communicationContextRecipientCount"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v22, @"CommunicationContextRecipientCount");

  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNSNotificationRecord communicationContextCapabilities](self, "communicationContextCapabilities"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v23, @"CommunicationContextCapabilities");

  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord communicationContextBusinessCorrespondence](self, "communicationContextBusinessCorrespondence"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v24, @"CommunicationContextBusinessCorrespondence");

  v25 = [(UNSNotificationRecord *)self accessoryImageName];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v25, @"AccessoryImageName");

  v26 = [(UNSNotificationRecord *)self attachments];
  v27 = objc_msgSend(v26, "bs_map:", UNCAttachmentRecordToDictionary);
  objc_msgSend(v5, "unc_safeSetNonEmptyArray:forKey:", v27, @"AppNotificationAttachments");

  v28 = [(UNSNotificationRecord *)self badge];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v28, @"AppNotificationBadgeNumber");

  v29 = [(UNSNotificationRecord *)self body];
  objc_msgSend(v5, "unc_safeSetNonEmptyString:withLimit:forKey:", v29, v4, @"AppNotificationMessage");

  v30 = [(UNSNotificationRecord *)self bodyLocalizationArguments];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v30, @"AppNotificationMessageLocalizationArguments");

  v31 = [(UNSNotificationRecord *)self bodyLocalizationKey];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v31, @"AppNotificationMessageLocazationKey");

  v32 = [(UNSNotificationRecord *)self attributedBody];
  v33 = objc_msgSend(v32, "_un_truncatedAttributedStringToMaxLength:", v4);
  v34 = objc_msgSend(v33, "_un_RTFDData");
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v34, @"AppNotificationAttributedMessage");

  v35 = [(UNSNotificationRecord *)self summaryArgument];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v35, @"AppNotificationSummaryArgument");

  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNSNotificationRecord summaryArgumentCount](self, "summaryArgumentCount"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v36, @"AppNotificationSummaryArgumentCount");

  v37 = [(UNSNotificationRecord *)self targetContentIdentifier];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v37, @"TargetContentIdentifier");

  v38 = [(UNSNotificationRecord *)self categoryIdentifier];
  objc_msgSend(v5, "unc_safeSetNonEmptyString:forKey:", v38, @"SBSPushStoreNotificationCategoryKey");

  v39 = [(UNSNotificationRecord *)self threadIdentifier];
  objc_msgSend(v5, "unc_safeSetNonEmptyString:forKey:", v39, @"SBSPushStoreNotificationThreadKey");

  v40 = [(UNSNotificationRecord *)self contentDate];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v40, @"ContentDate");

  v41 = [(UNSNotificationRecord *)self contentAvailable];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v41, @"AppNotificationContentAvailable");

  v42 = [(UNSNotificationRecord *)self mutableContent];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v42, @"AppNotificationMutableContent");

  v43 = [(UNSNotificationRecord *)self date];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v43, @"AppNotificationCreationDate");

  v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNSNotificationRecord interruptionLevel](self, "interruptionLevel"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v44, @"InterruptionLevel");

  v45 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord hasDefaultAction](self, "hasDefaultAction"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v45, @"HasDefaultActionKey");

  v46 = [(UNSNotificationRecord *)self defaultActionTitle];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v46, @"AppNotificationActionText");

  v47 = [(UNSNotificationRecord *)self defaultActionTitleLocalizationKey];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v47, @"AppNotificationActionTextLocalizationKeyKey");

  uint64_t v48 = [(UNSNotificationRecord *)self defaultActionURL];
  v49 = [v48 absoluteString];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v49, @"DefaultActionURL");

  v50 = [(UNSNotificationRecord *)self defaultActionBundleIdentifier];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v50, @"DefaultActionBundleIdentifier");

  v51 = [(UNSNotificationRecord *)self expirationDate];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v51, @"ExpirationDate");

  v52 = [(UNSNotificationRecord *)self header];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v52, @"Header");

  v53 = [(UNSNotificationRecord *)self headerLocalizationArguments];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v53, @"HeaderLocalizationArguments");

  v54 = [(UNSNotificationRecord *)self headerLocalizationKey];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v54, @"HeaderLocalizationKey");

  v55 = [(UNSNotificationRecord *)self footer];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v55, @"Footer");

  v56 = [(UNSNotificationRecord *)self footerLocalizationArguments];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v56, @"FooterLocalizationArguments");

  v57 = [(UNSNotificationRecord *)self footerLocalizationKey];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v57, @"FooterLocalizationKey");

  v58 = [(UNSNotificationRecord *)self identifier];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v58, @"AppNotificationIdentifier");

  v59 = [(UNSNotificationRecord *)self iconApplicationIdentifier];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v59, @"IconApplicationIdentifier");

  v60 = [(UNSNotificationRecord *)self iconName];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v60, @"IconName");

  v61 = [(UNSNotificationRecord *)self iconPath];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v61, @"IconPath");

  v62 = [(UNSNotificationRecord *)self iconSystemImageName];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v62, @"IconSystemImageName");

  v63 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord iconShouldSuppressMask](self, "iconShouldSuppressMask"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v63, @"IconShouldSuppressMask");

  v64 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord hasCriticalAlertSound](self, "hasCriticalAlertSound"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v64, @"CriticalAlertSound");

  v65 = [(UNSNotificationRecord *)self launchImageName];
  objc_msgSend(v5, "unc_safeSetNonEmptyString:forKey:", v65, @"AppNotificationLaunchImage");

  v66 = [(UNSNotificationRecord *)self requestDate];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v66, @"RequestDate");

  v67 = [NSNumber numberWithUnsignedInteger:11];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v67, @"SchemaVersion");

  v68 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldBadgeApplicationIcon](self, "shouldBadgeApplicationIcon"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v68, @"BadgeApplicationIcon");

  v69 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldHideDate](self, "shouldHideDate"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v69, @"ShouldHideDate");

  v70 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldHideTime](self, "shouldHideTime"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v70, @"ShouldHideTime");

  v71 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldIgnoreAccessibilityDisabledVibrationSetting](self, "shouldIgnoreAccessibilityDisabledVibrationSetting"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v71, @"ShouldIgnoreAccessibilityDisabledVibrationSetting");

  v72 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldIgnoreDoNotDisturb](self, "shouldIgnoreDoNotDisturb"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v72, @"ShouldIgnoreDoNotDisturb");

  v73 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldIgnoreDowntime](self, "shouldIgnoreDowntime"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v73, @"ShouldIgnoreDowntime");

  v74 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldIgnoreRingerSwitch](self, "shouldIgnoreRingerSwitch"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v74, @"SoundShouldIgnoreRingerSwitch");

  v75 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldSuppressScreenLightUp](self, "shouldSuppressScreenLightUp"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v75, @"ShouldSuppressScreenLightUp");

  v76 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldPlaySound](self, "shouldPlaySound"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v76, @"ShouldPlaySound");

  v77 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldPresentAlert](self, "shouldPresentAlert"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v77, @"ShouldPresentAlert");

  v78 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNSNotificationRecord presentationOptions](self, "presentationOptions"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v78, @"PresentationOptions");

  v79 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldAuthenticateDefaultAction](self, "shouldAuthenticateDefaultAction"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v79, @"ShouldAuthenticateDefaultAction");

  v80 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldBackgroundDefaultAction](self, "shouldBackgroundDefaultAction"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v80, @"ShouldBackgroundDefaultAction");

  v81 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldPreventNotificationDismissalAfterDefaultAction](self, "shouldPreventNotificationDismissalAfterDefaultAction"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v81, @"ShouldPreventNotificationDismissalAfterDefaultAction");

  v82 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldPreemptPresentedNotification](self, "shouldPreemptPresentedNotification"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v82, @"ShouldPreemptPresentedNotification");

  v83 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldDisplayActionsInline](self, "shouldDisplayActionsInline"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v83, @"ShouldDisplayActionsInline");

  v84 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldShowSubordinateIcon](self, "shouldShowSubordinateIcon"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v84, @"UNNotificationShouldShowSubordinateIcon");

  v85 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldSoundRepeat](self, "shouldSoundRepeat"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v85, @"SoundShouldRepeat");

  v86 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v86, @"ShouldSuppressSyncDismissalWhenRemoved");

  v87 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord shouldUseRequestIdentifierForDismissalSync](self, "shouldUseRequestIdentifierForDismissalSync"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v87, @"ShouldUseRequestIdentifierForDismissalSync");

  v88 = [(UNSNotificationRecord *)self audioCategory];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v88, @"AudioCategory");

  v89 = [(UNSNotificationRecord *)self audioVolume];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v89, @"AudioVolume");

  v90 = NSNumber;
  [(UNSNotificationRecord *)self soundMaximumDuration];
  v91 = objc_msgSend(v90, "numberWithDouble:");
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v91, @"SoundMaximumDuration");

  v92 = [(UNSNotificationRecord *)self subtitle];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v92, @"AppNotificationSubtitle");

  v93 = [(UNSNotificationRecord *)self subtitleLocalizationArguments];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v93, @"AppNotificationSubtitleLocalizationArguments");

  v94 = [(UNSNotificationRecord *)self subtitleLocalizationKey];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v94, @"AppNotificationSubtitleLocalizationKey");

  v95 = [(UNSNotificationRecord *)self title];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v95, @"AppNotificationTitle");

  v96 = [(UNSNotificationRecord *)self titleLocalizationArguments];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v96, @"AppNotificationTitleLocalizationArguments");

  v97 = [(UNSNotificationRecord *)self titleLocalizationKey];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v97, @"AppNotificationTitleLocalizationKey");

  v98 = [(UNSNotificationRecord *)self toneAlertTopic];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v98, @"ToneAlertTopic");

  v99 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNSNotificationRecord toneAlertType](self, "toneAlertType"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v99, @"ToneAlertType");

  v100 = [(UNSNotificationRecord *)self toneFileName];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v100, @"ToneFileName");

  v101 = [(UNSNotificationRecord *)self toneFileURL];
  v102 = [v101 absoluteString];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v102, @"ToneFileURL");

  v103 = [(UNSNotificationRecord *)self toneIdentifier];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v103, @"ToneIdentifier");

  v104 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[UNSNotificationRecord toneMediaLibraryItemIdentifier](self, "toneMediaLibraryItemIdentifier"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v104, @"ToneMediaLibraryItemIdentifier");

  v105 = [(UNSNotificationRecord *)self topicIdentifiers];
  objc_msgSend(v5, "unc_safeSetNonEmptySet:forKey:", v105, @"Topics");

  v106 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNSNotificationRecord realertCount](self, "realertCount"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v106, @"RealertCount");

  v107 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord allowsDefaultDestinations](self, "allowsDefaultDestinations"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v107, @"UNNotificationDefaultDestinations");

  v108 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord allowsLockScreenDestination](self, "allowsLockScreenDestination"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v108, @"UNNotificationLockScreenDestination");

  v109 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord allowsNotificationCenterDestination](self, "allowsNotificationCenterDestination"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v109, @"UNNotificationNotificationCenterDestination");

  v110 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord allowsAlertDestination](self, "allowsAlertDestination"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v110, @"UNNotificationAlertDestination");

  v111 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord allowsCarPlayDestination](self, "allowsCarPlayDestination"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v111, @"UNNotificationCarPlayDestination");

  v112 = [(UNSNotificationRecord *)self triggerDate];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v112, @"TriggerDate");

  v113 = [(UNSNotificationRecord *)self triggerDateComponents];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v113, @"TriggerDateComponents");

  v114 = [(UNSNotificationRecord *)self triggerRegion];

  if (v114)
  {
    v115 = (void *)MEMORY[0x263F08910];
    v116 = [(UNSNotificationRecord *)self triggerRegion];
    v117 = [v115 archivedDataWithRootObject:v116 requiringSecureCoding:1 error:0];
    objc_msgSend(v5, "unc_safeSetObject:forKey:", v117, @"TriggerRegion");
  }
  v118 = [(UNSNotificationRecord *)self triggerRepeatCalendarIdentifier];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v118, @"TriggerRepeatCalendar");

  v119 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNSNotificationRecord triggerRepeatInterval](self, "triggerRepeatInterval"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v119, @"TriggerRepeatInterval");

  v120 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord triggerRepeats](self, "triggerRepeats"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v120, @"TriggerRepeats");

  v121 = NSNumber;
  [(UNSNotificationRecord *)self triggerTimeInterval];
  v122 = objc_msgSend(v121, "numberWithDouble:");
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v122, @"TriggerTimeInterval");

  v123 = [(UNSNotificationRecord *)self triggerTimeZone];
  v124 = [v123 name];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v124, @"TriggerTimeZone");

  v125 = [(UNSNotificationRecord *)self triggerType];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v125, @"UNNotificationTriggerType");

  v126 = [(UNSNotificationRecord *)self userInfo];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v126, @"UNNotificationUserInfo");

  v127 = [(UNSNotificationRecord *)self vibrationIdentifier];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v127, @"VibrationIdentifier");

  v128 = [(UNSNotificationRecord *)self vibrationPatternFileURL];
  v129 = [v128 absoluteString];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v129, @"VibrationPatternFileURL");

  v130 = NSNumber;
  [(UNSNotificationRecord *)self relevanceScore];
  v131 = objc_msgSend(v130, "numberWithDouble:");
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v131, @"UNNotificationRelevanceScore");

  v132 = [(UNSNotificationRecord *)self filterCriteria];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v132, @"FilterCriteria");

  v133 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord screenCaptureProhibited](self, "screenCaptureProhibited"));
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v133, @"ScreenCaptureProhibited");

  v134 = [(UNSNotificationRecord *)self speechLanguage];
  objc_msgSend(v5, "unc_safeSetObject:forKey:", v134, @"SpeechLanguage");

  v135 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNSNotificationRecord revisionNumber](self, "revisionNumber"));
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v135, @"RevisionNumber");

  v136 = objc_msgSend(NSNumber, "numberWithInteger:", -[UNSNotificationRecord pipelineState](self, "pipelineState"));
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v136, @"PipelineState");

  v137 = objc_msgSend(NSNumber, "numberWithBool:", -[UNSNotificationRecord isHighlight](self, "isHighlight"));
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v137, @"IsHighlight");

  v138 = [(UNSNotificationRecord *)self summary];
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v138, @"Summary");

  v139 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNSNotificationRecord priorityStatus](self, "priorityStatus"));
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v139, @"PriorityStatus");

  v140 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNSNotificationRecord summaryStatus](self, "summaryStatus"));
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v140, @"SummaryStatus");

  v141 = [(UNSNotificationRecord *)self eventBehavior];
  objc_msgSend(v5, "bs_setSafeObject:forKey:", v141, @"EventBehavior");

  return v5;
}

- (NSString)description
{
  return (NSString *)[(UNSNotificationRecord *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(UNSNotificationRecord *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isSimilar:(id)a3
{
  uint64_t v4 = (UNSNotificationRecord *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v215 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_104;
    }
    uint64_t v6 = objc_opt_class();
    if (v6 != objc_opt_class()) {
      goto LABEL_104;
    }
    v7 = [(UNSNotificationRecord *)self contentType];
    v8 = [(UNSNotificationRecord *)v5 contentType];
    int v9 = UNEqualObjects();

    if (!v9) {
      goto LABEL_104;
    }
    v10 = [(UNSNotificationRecord *)self communicationContextIdentifier];
    v11 = [(UNSNotificationRecord *)v5 communicationContextIdentifier];
    int v12 = UNEqualObjects();

    if (!v12) {
      goto LABEL_104;
    }
    v13 = [(UNSNotificationRecord *)self communicationContextBundleIdentifier];
    v14 = [(UNSNotificationRecord *)v5 communicationContextBundleIdentifier];
    int v15 = UNEqualObjects();

    if (!v15) {
      goto LABEL_104;
    }
    v16 = [(UNSNotificationRecord *)self communicationContextAssociatedObjectUri];
    v17 = [(UNSNotificationRecord *)v5 communicationContextAssociatedObjectUri];
    int v18 = UNEqualObjects();

    if (!v18) {
      goto LABEL_104;
    }
    v19 = [(UNSNotificationRecord *)self communicationContextDisplayName];
    v20 = [(UNSNotificationRecord *)v5 communicationContextDisplayName];
    int v21 = UNEqualObjects();

    if (!v21) {
      goto LABEL_104;
    }
    v22 = [(UNSNotificationRecord *)self communicationContextSender];
    v23 = [(UNSNotificationRecord *)v5 communicationContextSender];
    int v24 = UNEqualObjects();

    if (!v24) {
      goto LABEL_104;
    }
    v25 = [(UNSNotificationRecord *)self communicationContextRecipients];
    v26 = [(UNSNotificationRecord *)v5 communicationContextRecipients];
    int v27 = UNSimilarArrays();

    if (!v27) {
      goto LABEL_104;
    }
    v28 = [(UNSNotificationRecord *)self communicationContextContentURL];
    v29 = [(UNSNotificationRecord *)v5 communicationContextContentURL];
    int v30 = UNEqualObjects();

    if (!v30) {
      goto LABEL_104;
    }
    v31 = [(UNSNotificationRecord *)self communicationContextImageName];
    v32 = [(UNSNotificationRecord *)v5 communicationContextImageName];
    int v33 = UNEqualObjects();

    if (!v33) {
      goto LABEL_104;
    }
    BOOL v34 = [(UNSNotificationRecord *)self communicationContextSystemImage];
    if (v34 != [(UNSNotificationRecord *)v5 communicationContextSystemImage]) {
      goto LABEL_104;
    }
    BOOL v35 = [(UNSNotificationRecord *)self communicationContextMentionsCurrentUser];
    if (v35 != [(UNSNotificationRecord *)v5 communicationContextMentionsCurrentUser])goto LABEL_104; {
    BOOL v36 = [(UNSNotificationRecord *)self communicationContextNotifyRecipientAnyway];
    }
    if (v36 != [(UNSNotificationRecord *)v5 communicationContextNotifyRecipientAnyway])goto LABEL_104; {
    BOOL v37 = [(UNSNotificationRecord *)self communicationContextReplyToCurrentUser];
    }
    if (v37 != [(UNSNotificationRecord *)v5 communicationContextReplyToCurrentUser])goto LABEL_104; {
    unint64_t v38 = [(UNSNotificationRecord *)self communicationContextRecipientCount];
    }
    if (v38 != [(UNSNotificationRecord *)v5 communicationContextRecipientCount]) {
      goto LABEL_104;
    }
    int64_t v39 = [(UNSNotificationRecord *)self communicationContextCapabilities];
    if (v39 != [(UNSNotificationRecord *)v5 communicationContextCapabilities]) {
      goto LABEL_104;
    }
    BOOL v40 = [(UNSNotificationRecord *)self communicationContextBusinessCorrespondence];
    if (v40 != [(UNSNotificationRecord *)v5 communicationContextBusinessCorrespondence])goto LABEL_104; {
    v41 = [(UNSNotificationRecord *)self accessoryImageName];
    }
    v42 = [(UNSNotificationRecord *)v5 accessoryImageName];
    int v43 = UNEqualObjects();

    if (!v43) {
      goto LABEL_104;
    }
    v44 = [(UNSNotificationRecord *)self attachments];
    v45 = [(UNSNotificationRecord *)v5 attachments];
    int v46 = UNEqualObjects();

    if (!v46) {
      goto LABEL_104;
    }
    v47 = [(UNSNotificationRecord *)self badge];
    [v47 integerValue];
    uint64_t v48 = [(UNSNotificationRecord *)v5 badge];
    [v48 integerValue];
    int v49 = UNEqualIntegers();

    if (!v49) {
      goto LABEL_104;
    }
    v50 = [(UNSNotificationRecord *)self bodyLocalizationKey];
    v51 = [(UNSNotificationRecord *)v5 bodyLocalizationKey];
    int v52 = UNSimilarStrings();

    if (!v52) {
      goto LABEL_104;
    }
    v53 = [(UNSNotificationRecord *)self bodyLocalizationArguments];
    v54 = [(UNSNotificationRecord *)v5 bodyLocalizationArguments];
    int v55 = UNEqualObjects();

    if (!v55) {
      goto LABEL_104;
    }
    v56 = [(UNSNotificationRecord *)self categoryIdentifier];
    v57 = [(UNSNotificationRecord *)v5 categoryIdentifier];
    int v58 = UNEqualObjects();

    if (!v58) {
      goto LABEL_104;
    }
    v59 = [(UNSNotificationRecord *)self threadIdentifier];
    v60 = [(UNSNotificationRecord *)v5 threadIdentifier];
    int v61 = UNEqualObjects();

    if (!v61) {
      goto LABEL_104;
    }
    v62 = [(UNSNotificationRecord *)self targetContentIdentifier];
    v63 = [(UNSNotificationRecord *)v5 targetContentIdentifier];
    int v64 = UNEqualObjects();

    if (!v64) {
      goto LABEL_104;
    }
    v65 = [(UNSNotificationRecord *)self contentAvailable];
    v66 = [(UNSNotificationRecord *)v5 contentAvailable];
    int v67 = UNEqualObjects();

    if (!v67) {
      goto LABEL_104;
    }
    v68 = [(UNSNotificationRecord *)self contentDate];
    v69 = [(UNSNotificationRecord *)v5 contentDate];
    int v70 = UNEqualObjects();

    if (!v70) {
      goto LABEL_104;
    }
    unint64_t v71 = [(UNSNotificationRecord *)self interruptionLevel];
    if (v71 != [(UNSNotificationRecord *)v5 interruptionLevel]) {
      goto LABEL_104;
    }
    v72 = [(UNSNotificationRecord *)self mutableContent];
    v73 = [(UNSNotificationRecord *)v5 mutableContent];
    int v74 = UNEqualObjects();

    if (!v74) {
      goto LABEL_104;
    }
    v75 = [(UNSNotificationRecord *)self defaultActionURL];
    v76 = [(UNSNotificationRecord *)v5 defaultActionURL];
    int v77 = UNEqualObjects();

    if (!v77) {
      goto LABEL_104;
    }
    v78 = [(UNSNotificationRecord *)self defaultActionBundleIdentifier];
    v79 = [(UNSNotificationRecord *)v5 defaultActionBundleIdentifier];
    int v80 = UNEqualObjects();

    if (!v80) {
      goto LABEL_104;
    }
    v81 = [(UNSNotificationRecord *)self expirationDate];
    v82 = [(UNSNotificationRecord *)v5 expirationDate];
    int v83 = UNEqualObjects();

    if (!v83) {
      goto LABEL_104;
    }
    BOOL v84 = [(UNSNotificationRecord *)self hasCriticalAlertSound];
    if (v84 != [(UNSNotificationRecord *)v5 hasCriticalAlertSound]) {
      goto LABEL_104;
    }
    v85 = [(UNSNotificationRecord *)self headerLocalizationKey];
    v86 = [(UNSNotificationRecord *)v5 headerLocalizationKey];
    int v87 = UNSimilarStrings();

    if (!v87) {
      goto LABEL_104;
    }
    v88 = [(UNSNotificationRecord *)self headerLocalizationArguments];
    v89 = [(UNSNotificationRecord *)v5 headerLocalizationArguments];
    int v90 = UNEqualObjects();

    if (!v90) {
      goto LABEL_104;
    }
    v91 = [(UNSNotificationRecord *)self footerLocalizationKey];
    v92 = [(UNSNotificationRecord *)v5 footerLocalizationKey];
    int v93 = UNSimilarStrings();

    if (!v93) {
      goto LABEL_104;
    }
    v94 = [(UNSNotificationRecord *)self footerLocalizationArguments];
    v95 = [(UNSNotificationRecord *)v5 footerLocalizationArguments];
    int v96 = UNEqualObjects();

    if (!v96) {
      goto LABEL_104;
    }
    v97 = [(UNSNotificationRecord *)self iconApplicationIdentifier];
    v98 = [(UNSNotificationRecord *)v5 iconApplicationIdentifier];
    int v99 = UNEqualObjects();

    if (!v99) {
      goto LABEL_104;
    }
    v100 = [(UNSNotificationRecord *)self iconName];
    v101 = [(UNSNotificationRecord *)v5 iconName];
    int v102 = UNEqualObjects();

    if (!v102) {
      goto LABEL_104;
    }
    v103 = [(UNSNotificationRecord *)self iconPath];
    v104 = [(UNSNotificationRecord *)v5 iconPath];
    int v105 = UNEqualObjects();

    if (!v105) {
      goto LABEL_104;
    }
    v106 = [(UNSNotificationRecord *)self iconSystemImageName];
    v107 = [(UNSNotificationRecord *)v5 iconSystemImageName];
    int v108 = UNEqualObjects();

    if (!v108) {
      goto LABEL_104;
    }
    v109 = [(UNSNotificationRecord *)self launchImageName];
    v110 = [(UNSNotificationRecord *)v5 launchImageName];
    int v111 = UNEqualObjects();

    if (!v111) {
      goto LABEL_104;
    }
    BOOL v112 = [(UNSNotificationRecord *)self shouldHideDate];
    if (v112 != [(UNSNotificationRecord *)v5 shouldHideDate]) {
      goto LABEL_104;
    }
    BOOL v113 = [(UNSNotificationRecord *)self shouldHideTime];
    if (v113 != [(UNSNotificationRecord *)v5 shouldHideTime]) {
      goto LABEL_104;
    }
    BOOL v114 = [(UNSNotificationRecord *)self shouldIgnoreAccessibilityDisabledVibrationSetting];
    if (v114 != [(UNSNotificationRecord *)v5 shouldIgnoreAccessibilityDisabledVibrationSetting])goto LABEL_104; {
    BOOL v115 = [(UNSNotificationRecord *)self shouldIgnoreDoNotDisturb];
    }
    if (v115 != [(UNSNotificationRecord *)v5 shouldIgnoreDoNotDisturb]) {
      goto LABEL_104;
    }
    BOOL v116 = [(UNSNotificationRecord *)self shouldIgnoreDowntime];
    if (v116 != [(UNSNotificationRecord *)v5 shouldIgnoreDowntime]) {
      goto LABEL_104;
    }
    [(UNSNotificationRecord *)self shouldIgnoreRingerSwitch];
    [(UNSNotificationRecord *)v5 shouldIgnoreRingerSwitch];
    if (!UNEqualBools()) {
      goto LABEL_104;
    }
    BOOL v117 = [(UNSNotificationRecord *)self shouldAuthenticateDefaultAction];
    if (v117 != [(UNSNotificationRecord *)v5 shouldAuthenticateDefaultAction]) {
      goto LABEL_104;
    }
    BOOL v118 = [(UNSNotificationRecord *)self shouldBackgroundDefaultAction];
    if (v118 != [(UNSNotificationRecord *)v5 shouldBackgroundDefaultAction]) {
      goto LABEL_104;
    }
    BOOL v119 = [(UNSNotificationRecord *)self shouldPreventNotificationDismissalAfterDefaultAction];
    if (v119 != [(UNSNotificationRecord *)v5 shouldPreventNotificationDismissalAfterDefaultAction])goto LABEL_104; {
    [(UNSNotificationRecord *)self shouldSoundRepeat];
    }
    [(UNSNotificationRecord *)v5 shouldSoundRepeat];
    if (!UNEqualBools()) {
      goto LABEL_104;
    }
    BOOL v120 = [(UNSNotificationRecord *)self shouldSuppressScreenLightUp];
    if (v120 != [(UNSNotificationRecord *)v5 shouldSuppressScreenLightUp]) {
      goto LABEL_104;
    }
    BOOL v121 = [(UNSNotificationRecord *)self shouldSuppressSyncDismissalWhenRemoved];
    if (v121 != [(UNSNotificationRecord *)v5 shouldSuppressSyncDismissalWhenRemoved])goto LABEL_104; {
    BOOL v122 = [(UNSNotificationRecord *)self shouldUseRequestIdentifierForDismissalSync];
    }
    if (v122 != [(UNSNotificationRecord *)v5 shouldUseRequestIdentifierForDismissalSync])goto LABEL_104; {
    BOOL v123 = [(UNSNotificationRecord *)self shouldPreemptPresentedNotification];
    }
    if (v123 != [(UNSNotificationRecord *)v5 shouldPreemptPresentedNotification]) {
      goto LABEL_104;
    }
    BOOL v124 = [(UNSNotificationRecord *)self shouldDisplayActionsInline];
    if (v124 != [(UNSNotificationRecord *)v5 shouldDisplayActionsInline]) {
      goto LABEL_104;
    }
    BOOL v125 = [(UNSNotificationRecord *)self shouldShowSubordinateIcon];
    if (v125 != [(UNSNotificationRecord *)v5 shouldShowSubordinateIcon]) {
      goto LABEL_104;
    }
    v126 = [(UNSNotificationRecord *)self audioCategory];
    v127 = [(UNSNotificationRecord *)v5 audioCategory];
    int v128 = UNEqualObjects();

    if (!v128) {
      goto LABEL_104;
    }
    v129 = [(UNSNotificationRecord *)self audioVolume];
    v130 = [(UNSNotificationRecord *)v5 audioVolume];
    int v131 = UNEqualObjects();

    if (!v131) {
      goto LABEL_104;
    }
    [(UNSNotificationRecord *)self soundMaximumDuration];
    [(UNSNotificationRecord *)v5 soundMaximumDuration];
    if (!UNEqualDoubles()) {
      goto LABEL_104;
    }
    v132 = [(UNSNotificationRecord *)self subtitleLocalizationKey];
    v133 = [(UNSNotificationRecord *)v5 subtitleLocalizationKey];
    int v134 = UNSimilarStrings();

    if (!v134) {
      goto LABEL_104;
    }
    v135 = [(UNSNotificationRecord *)self subtitleLocalizationArguments];
    v136 = [(UNSNotificationRecord *)v5 subtitleLocalizationArguments];
    int v137 = UNEqualObjects();

    if (!v137) {
      goto LABEL_104;
    }
    v138 = [(UNSNotificationRecord *)self titleLocalizationKey];
    v139 = [(UNSNotificationRecord *)v5 titleLocalizationKey];
    int v140 = UNSimilarStrings();

    if (!v140) {
      goto LABEL_104;
    }
    v141 = [(UNSNotificationRecord *)self titleLocalizationArguments];
    v142 = [(UNSNotificationRecord *)v5 titleLocalizationArguments];
    int v143 = UNEqualObjects();

    if (!v143) {
      goto LABEL_104;
    }
    v144 = [(UNSNotificationRecord *)self toneAlertTopic];
    v145 = [(UNSNotificationRecord *)v5 toneAlertTopic];
    int v146 = UNEqualObjects();

    if (!v146) {
      goto LABEL_104;
    }
    [(UNSNotificationRecord *)self toneAlertType];
    [(UNSNotificationRecord *)v5 toneAlertType];
    if (!UNEqualDoubles()) {
      goto LABEL_104;
    }
    v147 = [(UNSNotificationRecord *)self toneFileName];
    v148 = [(UNSNotificationRecord *)v5 toneFileName];
    int v149 = UNEqualObjects();

    if (!v149) {
      goto LABEL_104;
    }
    objc_super v150 = [(UNSNotificationRecord *)self toneFileURL];
    v151 = [(UNSNotificationRecord *)v5 toneFileURL];
    int v152 = UNEqualObjects();

    if (!v152) {
      goto LABEL_104;
    }
    v153 = [(UNSNotificationRecord *)self toneIdentifier];
    v154 = [(UNSNotificationRecord *)v5 toneIdentifier];
    int v155 = UNEqualObjects();

    if (!v155) {
      goto LABEL_104;
    }
    unint64_t v156 = [(UNSNotificationRecord *)self toneMediaLibraryItemIdentifier];
    if (v156 != [(UNSNotificationRecord *)v5 toneMediaLibraryItemIdentifier]) {
      goto LABEL_104;
    }
    v157 = [(UNSNotificationRecord *)self topicIdentifiers];
    v158 = [(UNSNotificationRecord *)v5 topicIdentifiers];
    int v159 = UNSimilarSets();

    if (!v159) {
      goto LABEL_104;
    }
    unint64_t v160 = [(UNSNotificationRecord *)self realertCount];
    if (v160 != [(UNSNotificationRecord *)v5 realertCount]) {
      goto LABEL_104;
    }
    BOOL v161 = [(UNSNotificationRecord *)self allowsDefaultDestinations];
    if (v161 != [(UNSNotificationRecord *)v5 allowsDefaultDestinations]) {
      goto LABEL_104;
    }
    BOOL v162 = [(UNSNotificationRecord *)self allowsLockScreenDestination];
    if (v162 != [(UNSNotificationRecord *)v5 allowsLockScreenDestination]) {
      goto LABEL_104;
    }
    BOOL v163 = [(UNSNotificationRecord *)self allowsNotificationCenterDestination];
    if (v163 != [(UNSNotificationRecord *)v5 allowsNotificationCenterDestination]) {
      goto LABEL_104;
    }
    BOOL v164 = [(UNSNotificationRecord *)self allowsAlertDestination];
    if (v164 != [(UNSNotificationRecord *)v5 allowsAlertDestination]) {
      goto LABEL_104;
    }
    BOOL v165 = [(UNSNotificationRecord *)self allowsCarPlayDestination];
    if (v165 != [(UNSNotificationRecord *)v5 allowsCarPlayDestination]) {
      goto LABEL_104;
    }
    v166 = [(UNSNotificationRecord *)self triggerDate];
    v167 = [(UNSNotificationRecord *)v5 triggerDate];
    int v168 = UNEqualObjects();

    if (!v168) {
      goto LABEL_104;
    }
    v169 = [(UNSNotificationRecord *)self triggerDateComponents];
    v170 = [(UNSNotificationRecord *)v5 triggerDateComponents];
    int v171 = UNEqualObjects();

    if (!v171) {
      goto LABEL_104;
    }
    v172 = [(UNSNotificationRecord *)self triggerRegion];
    v173 = [(UNSNotificationRecord *)v5 triggerRegion];
    int v174 = UNEqualObjects();

    if (!v174) {
      goto LABEL_104;
    }
    v175 = [(UNSNotificationRecord *)self triggerRepeatCalendarIdentifier];
    v176 = [(UNSNotificationRecord *)v5 triggerRepeatCalendarIdentifier];
    int v177 = UNEqualObjects();

    if (!v177) {
      goto LABEL_104;
    }
    unint64_t v178 = [(UNSNotificationRecord *)self triggerRepeatInterval];
    if (v178 != [(UNSNotificationRecord *)v5 triggerRepeatInterval]) {
      goto LABEL_104;
    }
    BOOL v179 = [(UNSNotificationRecord *)self triggerRepeats];
    if (v179 != [(UNSNotificationRecord *)v5 triggerRepeats]) {
      goto LABEL_104;
    }
    [(UNSNotificationRecord *)self triggerTimeInterval];
    [(UNSNotificationRecord *)v5 triggerTimeInterval];
    if (!UNEqualDoubles()) {
      goto LABEL_104;
    }
    v180 = [(UNSNotificationRecord *)self triggerTimeZone];
    v181 = [(UNSNotificationRecord *)v5 triggerTimeZone];
    int v182 = UNEqualObjects();

    if (!v182) {
      goto LABEL_104;
    }
    v183 = [(UNSNotificationRecord *)self triggerType];
    v184 = [(UNSNotificationRecord *)v5 triggerType];
    int v185 = UNEqualObjects();

    if (!v185) {
      goto LABEL_104;
    }
    v186 = [(UNSNotificationRecord *)self userInfo];
    v187 = [(UNSNotificationRecord *)v5 userInfo];
    int v188 = UNEqualObjects();

    if (!v188) {
      goto LABEL_104;
    }
    v189 = [(UNSNotificationRecord *)self vibrationIdentifier];
    v190 = [(UNSNotificationRecord *)v5 vibrationIdentifier];
    int v191 = UNEqualObjects();

    if (!v191) {
      goto LABEL_104;
    }
    v192 = [(UNSNotificationRecord *)self vibrationPatternFileURL];
    v193 = [(UNSNotificationRecord *)v5 vibrationPatternFileURL];
    int v194 = UNEqualObjects();

    if (!v194) {
      goto LABEL_104;
    }
    [(UNSNotificationRecord *)self relevanceScore];
    double v196 = v195;
    [(UNSNotificationRecord *)v5 relevanceScore];
    if (v196 != v197) {
      goto LABEL_104;
    }
    v198 = [(UNSNotificationRecord *)self filterCriteria];
    v199 = [(UNSNotificationRecord *)v5 filterCriteria];
    int v200 = UNEqualObjects();

    if (!v200) {
      goto LABEL_104;
    }
    BOOL v201 = [(UNSNotificationRecord *)self screenCaptureProhibited];
    if (v201 != [(UNSNotificationRecord *)v5 screenCaptureProhibited]) {
      goto LABEL_104;
    }
    v202 = [(UNSNotificationRecord *)self speechLanguage];
    v203 = [(UNSNotificationRecord *)v5 speechLanguage];
    int v204 = UNEqualObjects();

    if (!v204) {
      goto LABEL_104;
    }
    int64_t v205 = [(UNSNotificationRecord *)self revisionNumber];
    if (v205 != [(UNSNotificationRecord *)v5 revisionNumber]) {
      goto LABEL_104;
    }
    int64_t v206 = [(UNSNotificationRecord *)self pipelineState];
    if (v206 != [(UNSNotificationRecord *)v5 pipelineState]) {
      goto LABEL_104;
    }
    BOOL v207 = [(UNSNotificationRecord *)self isHighlight];
    if (v207 != [(UNSNotificationRecord *)v5 isHighlight]) {
      goto LABEL_104;
    }
    v208 = [(UNSNotificationRecord *)self summary];
    v209 = [(UNSNotificationRecord *)v5 summary];
    int v210 = UNEqualObjects();

    if (!v210) {
      goto LABEL_104;
    }
    unint64_t v211 = [(UNSNotificationRecord *)self priorityStatus];
    if (v211 == [(UNSNotificationRecord *)v5 priorityStatus]
      && (unint64_t v212 = [(UNSNotificationRecord *)self summaryStatus],
          v212 == [(UNSNotificationRecord *)v5 summaryStatus]))
    {
      v213 = [(UNSNotificationRecord *)self eventBehavior];
      v214 = [(UNSNotificationRecord *)v5 eventBehavior];
      char v215 = UNEqualObjects();
    }
    else
    {
LABEL_104:
      char v215 = 0;
    }
  }

  return v215;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_23;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_23;
  }
  if (![(UNSNotificationRecord *)self isSimilar:v4]) {
    goto LABEL_23;
  }
  int v6 = [(UNSNotificationRecord *)self shouldBadgeApplicationIcon];
  if (v6 != [v4 shouldBadgeApplicationIcon]) {
    goto LABEL_23;
  }
  int v7 = [(UNSNotificationRecord *)self shouldPlaySound];
  if (v7 != [v4 shouldPlaySound]) {
    goto LABEL_23;
  }
  int v8 = [(UNSNotificationRecord *)self shouldPresentAlert];
  if (v8 != [v4 shouldPresentAlert]) {
    goto LABEL_23;
  }
  unint64_t v9 = [(UNSNotificationRecord *)self presentationOptions];
  if (v9 != [v4 presentationOptions]) {
    goto LABEL_23;
  }
  v10 = [(UNSNotificationRecord *)self date];
  v11 = [v4 date];
  int v12 = UNEqualObjects();

  if (!v12) {
    goto LABEL_23;
  }
  unint64_t v13 = [(UNSNotificationRecord *)self interruptionLevel];
  if (v13 != [v4 interruptionLevel]) {
    goto LABEL_23;
  }
  v14 = [(UNSNotificationRecord *)self identifier];
  int v15 = [v4 identifier];
  int v16 = UNEqualObjects();

  if (!v16) {
    goto LABEL_23;
  }
  v17 = [(UNSNotificationRecord *)self requestDate];
  int v18 = [v4 requestDate];
  int v19 = UNEqualObjects();

  if (!v19) {
    goto LABEL_23;
  }
  v20 = [(UNSNotificationRecord *)self header];
  int v21 = [v4 header];
  int v22 = UNEqualObjects();

  if (!v22) {
    goto LABEL_23;
  }
  v23 = [(UNSNotificationRecord *)self footer];
  int v24 = [v4 footer];
  int v25 = UNEqualObjects();

  if (!v25) {
    goto LABEL_23;
  }
  v26 = [(UNSNotificationRecord *)self body];
  int v27 = [v4 body];
  int v28 = UNEqualObjects();

  if (!v28) {
    goto LABEL_23;
  }
  v29 = [(UNSNotificationRecord *)self attributedBody];
  int v30 = [v4 attributedBody];
  int v31 = UNEqualObjects();

  if (!v31) {
    goto LABEL_23;
  }
  v32 = [(UNSNotificationRecord *)self subtitle];
  int v33 = [v4 subtitle];
  int v34 = UNEqualObjects();

  if (!v34) {
    goto LABEL_23;
  }
  BOOL v35 = [(UNSNotificationRecord *)self title];
  BOOL v36 = [v4 title];
  int v37 = UNEqualObjects();

  if (!v37) {
    goto LABEL_23;
  }
  unint64_t v38 = [(UNSNotificationRecord *)self defaultActionTitle];
  int64_t v39 = [v4 defaultActionTitle];
  int v40 = UNEqualObjects();

  if (!v40) {
    goto LABEL_23;
  }
  v41 = [(UNSNotificationRecord *)self summaryArgument];
  v42 = [v4 summaryArgument];
  int v43 = UNEqualObjects();

  if (!v43) {
    goto LABEL_23;
  }
  unint64_t v44 = [(UNSNotificationRecord *)self summaryArgumentCount];
  if (v44 == [v4 summaryArgumentCount]
    && ([(UNSNotificationRecord *)self relevanceScore],
        double v46 = v45,
        [v4 relevanceScore],
        v46 == v47)
    && (int v48 = [(UNSNotificationRecord *)self hasDefaultAction],
        v48 == [v4 hasDefaultAction]))
  {
    v51 = [(UNSNotificationRecord *)self defaultActionTitleLocalizationKey];
    int v52 = [v4 defaultActionTitleLocalizationKey];
    char v49 = UNEqualObjects();
  }
  else
  {
LABEL_23:
    char v49 = 0;
  }

  return v49;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = [(UNSNotificationRecord *)self contentType];
  id v5 = (id)[v3 appendObject:v4];

  int v6 = [(UNSNotificationRecord *)self communicationContextIdentifier];
  id v7 = (id)[v3 appendObject:v6];

  int v8 = [(UNSNotificationRecord *)self communicationContextBundleIdentifier];
  id v9 = (id)[v3 appendObject:v8];

  v10 = [(UNSNotificationRecord *)self communicationContextAssociatedObjectUri];
  id v11 = (id)[v3 appendObject:v10];

  int v12 = [(UNSNotificationRecord *)self communicationContextDisplayName];
  id v13 = (id)[v3 appendObject:v12];

  v14 = [(UNSNotificationRecord *)self communicationContextSender];
  id v15 = (id)[v3 appendObject:v14];

  int v16 = [(UNSNotificationRecord *)self communicationContextRecipients];
  id v17 = (id)[v3 appendObject:v16];

  int v18 = [(UNSNotificationRecord *)self communicationContextContentURL];
  id v19 = (id)[v3 appendObject:v18];

  v20 = [(UNSNotificationRecord *)self communicationContextImageName];
  id v21 = (id)[v3 appendObject:v20];

  id v22 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord communicationContextSystemImage](self, "communicationContextSystemImage"));
  id v23 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord communicationContextMentionsCurrentUser](self, "communicationContextMentionsCurrentUser"));
  id v24 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord communicationContextNotifyRecipientAnyway](self, "communicationContextNotifyRecipientAnyway"));
  id v25 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord communicationContextReplyToCurrentUser](self, "communicationContextReplyToCurrentUser"));
  id v26 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord communicationContextRecipientCount](self, "communicationContextRecipientCount"));
  id v27 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord communicationContextCapabilities](self, "communicationContextCapabilities"));
  id v28 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord communicationContextBusinessCorrespondence](self, "communicationContextBusinessCorrespondence"));
  v29 = [(UNSNotificationRecord *)self accessoryImageName];
  id v30 = (id)[v3 appendObject:v29];

  int v31 = [(UNSNotificationRecord *)self attachments];
  id v32 = (id)[v3 appendObject:v31];

  int v33 = [(UNSNotificationRecord *)self badge];
  id v34 = (id)[v3 appendObject:v33];

  BOOL v35 = [(UNSNotificationRecord *)self bodyLocalizationKey];
  id v36 = (id)[v3 appendObject:v35];

  int v37 = [(UNSNotificationRecord *)self body];
  id v38 = (id)[v3 appendObject:v37];

  int64_t v39 = [(UNSNotificationRecord *)self bodyLocalizationArguments];
  id v40 = (id)[v3 appendObject:v39];

  v41 = [(UNSNotificationRecord *)self attributedBody];
  id v42 = (id)[v3 appendObject:v41];

  int v43 = [(UNSNotificationRecord *)self summaryArgument];
  id v44 = (id)[v3 appendObject:v43];

  id v45 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord summaryArgumentCount](self, "summaryArgumentCount"));
  double v46 = [(UNSNotificationRecord *)self targetContentIdentifier];
  id v47 = (id)[v3 appendObject:v46];

  int v48 = [(UNSNotificationRecord *)self categoryIdentifier];
  id v49 = (id)[v3 appendObject:v48];

  v50 = [(UNSNotificationRecord *)self threadIdentifier];
  id v51 = (id)[v3 appendObject:v50];

  int v52 = [(UNSNotificationRecord *)self contentAvailable];
  id v53 = (id)[v3 appendObject:v52];

  v54 = [(UNSNotificationRecord *)self contentDate];
  id v55 = (id)[v3 appendObject:v54];

  v56 = [(UNSNotificationRecord *)self mutableContent];
  id v57 = (id)[v3 appendObject:v56];

  int v58 = [(UNSNotificationRecord *)self date];
  id v59 = (id)[v3 appendObject:v58];

  id v60 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord interruptionLevel](self, "interruptionLevel"));
  id v61 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord hasDefaultAction](self, "hasDefaultAction"));
  v62 = [(UNSNotificationRecord *)self defaultActionTitle];
  id v63 = (id)[v3 appendObject:v62];

  int v64 = [(UNSNotificationRecord *)self defaultActionTitleLocalizationKey];
  id v65 = (id)[v3 appendObject:v64];

  v66 = [(UNSNotificationRecord *)self defaultActionURL];
  id v67 = (id)[v3 appendObject:v66];

  v68 = [(UNSNotificationRecord *)self defaultActionBundleIdentifier];
  id v69 = (id)[v3 appendObject:v68];

  int v70 = [(UNSNotificationRecord *)self expirationDate];
  id v71 = (id)[v3 appendObject:v70];

  id v72 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord hasCriticalAlertSound](self, "hasCriticalAlertSound"));
  v73 = [(UNSNotificationRecord *)self header];
  id v74 = (id)[v3 appendObject:v73];

  v75 = [(UNSNotificationRecord *)self headerLocalizationKey];
  id v76 = (id)[v3 appendObject:v75];

  int v77 = [(UNSNotificationRecord *)self headerLocalizationArguments];
  id v78 = (id)[v3 appendObject:v77];

  v79 = [(UNSNotificationRecord *)self footer];
  id v80 = (id)[v3 appendObject:v79];

  v81 = [(UNSNotificationRecord *)self footerLocalizationKey];
  id v82 = (id)[v3 appendObject:v81];

  int v83 = [(UNSNotificationRecord *)self footerLocalizationArguments];
  id v84 = (id)[v3 appendObject:v83];

  v85 = [(UNSNotificationRecord *)self iconApplicationIdentifier];
  id v86 = (id)[v3 appendObject:v85];

  int v87 = [(UNSNotificationRecord *)self iconName];
  id v88 = (id)[v3 appendObject:v87];

  v89 = [(UNSNotificationRecord *)self iconPath];
  id v90 = (id)[v3 appendObject:v89];

  v91 = [(UNSNotificationRecord *)self iconSystemImageName];
  id v92 = (id)[v3 appendObject:v91];

  int v93 = [(UNSNotificationRecord *)self identifier];
  id v94 = (id)[v3 appendObject:v93];

  v95 = [(UNSNotificationRecord *)self launchImageName];
  id v96 = (id)[v3 appendObject:v95];

  v97 = [(UNSNotificationRecord *)self requestDate];
  id v98 = (id)[v3 appendObject:v97];

  id v99 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldBadgeApplicationIcon](self, "shouldBadgeApplicationIcon"));
  id v100 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldHideDate](self, "shouldHideDate"));
  id v101 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldHideTime](self, "shouldHideTime"));
  id v102 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldIgnoreAccessibilityDisabledVibrationSetting](self, "shouldIgnoreAccessibilityDisabledVibrationSetting"));
  id v103 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldIgnoreDoNotDisturb](self, "shouldIgnoreDoNotDisturb"));
  id v104 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldIgnoreDowntime](self, "shouldIgnoreDowntime"));
  id v105 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldIgnoreRingerSwitch](self, "shouldIgnoreRingerSwitch"));
  id v106 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldSuppressScreenLightUp](self, "shouldSuppressScreenLightUp"));
  id v107 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldPreemptPresentedNotification](self, "shouldPreemptPresentedNotification"));
  id v108 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldDisplayActionsInline](self, "shouldDisplayActionsInline"));
  id v109 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldPlaySound](self, "shouldPlaySound"));
  id v110 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldPresentAlert](self, "shouldPresentAlert"));
  id v111 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord presentationOptions](self, "presentationOptions"));
  id v112 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldAuthenticateDefaultAction](self, "shouldAuthenticateDefaultAction"));
  id v113 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldBackgroundDefaultAction](self, "shouldBackgroundDefaultAction"));
  id v114 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldPreventNotificationDismissalAfterDefaultAction](self, "shouldPreventNotificationDismissalAfterDefaultAction"));
  id v115 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldShowSubordinateIcon](self, "shouldShowSubordinateIcon"));
  id v116 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldSoundRepeat](self, "shouldSoundRepeat"));
  id v117 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldSuppressSyncDismissalWhenRemoved](self, "shouldSuppressSyncDismissalWhenRemoved"));
  id v118 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord shouldUseRequestIdentifierForDismissalSync](self, "shouldUseRequestIdentifierForDismissalSync"));
  BOOL v119 = [(UNSNotificationRecord *)self audioCategory];
  id v120 = (id)[v3 appendObject:v119];

  BOOL v121 = [(UNSNotificationRecord *)self audioVolume];
  id v122 = (id)[v3 appendObject:v121];

  [(UNSNotificationRecord *)self soundMaximumDuration];
  id v123 = (id)objc_msgSend(v3, "appendDouble:");
  BOOL v124 = [(UNSNotificationRecord *)self subtitle];
  id v125 = (id)[v3 appendObject:v124];

  v126 = [(UNSNotificationRecord *)self subtitleLocalizationKey];
  id v127 = (id)[v3 appendObject:v126];

  int v128 = [(UNSNotificationRecord *)self subtitleLocalizationArguments];
  id v129 = (id)[v3 appendObject:v128];

  v130 = [(UNSNotificationRecord *)self title];
  id v131 = (id)[v3 appendObject:v130];

  v132 = [(UNSNotificationRecord *)self titleLocalizationKey];
  id v133 = (id)[v3 appendObject:v132];

  int v134 = [(UNSNotificationRecord *)self titleLocalizationArguments];
  id v135 = (id)[v3 appendObject:v134];

  v136 = [(UNSNotificationRecord *)self toneAlertTopic];
  id v137 = (id)[v3 appendObject:v136];

  id v138 = (id)objc_msgSend(v3, "appendInteger:", -[UNSNotificationRecord toneAlertType](self, "toneAlertType"));
  v139 = [(UNSNotificationRecord *)self toneFileName];
  id v140 = (id)[v3 appendObject:v139];

  v141 = [(UNSNotificationRecord *)self toneFileURL];
  id v142 = (id)[v3 appendObject:v141];

  int v143 = [(UNSNotificationRecord *)self toneIdentifier];
  id v144 = (id)[v3 appendObject:v143];

  v145 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[UNSNotificationRecord toneMediaLibraryItemIdentifier](self, "toneMediaLibraryItemIdentifier"));
  id v146 = (id)[v3 appendObject:v145];

  v147 = [(UNSNotificationRecord *)self topicIdentifiers];
  id v148 = (id)[v3 appendObject:v147];

  id v149 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord realertCount](self, "realertCount"));
  id v150 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord allowsDefaultDestinations](self, "allowsDefaultDestinations"));
  id v151 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord allowsLockScreenDestination](self, "allowsLockScreenDestination"));
  id v152 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord allowsNotificationCenterDestination](self, "allowsNotificationCenterDestination"));
  id v153 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord allowsAlertDestination](self, "allowsAlertDestination"));
  id v154 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord allowsCarPlayDestination](self, "allowsCarPlayDestination"));
  int v155 = [(UNSNotificationRecord *)self triggerDate];
  id v156 = (id)[v3 appendObject:v155];

  v157 = [(UNSNotificationRecord *)self triggerDateComponents];
  id v158 = (id)[v3 appendObject:v157];

  int v159 = [(UNSNotificationRecord *)self triggerRegion];
  id v160 = (id)[v3 appendObject:v159];

  BOOL v161 = [(UNSNotificationRecord *)self triggerRepeatCalendarIdentifier];
  id v162 = (id)[v3 appendObject:v161];

  id v163 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord triggerRepeatInterval](self, "triggerRepeatInterval"));
  id v164 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord triggerRepeats](self, "triggerRepeats"));
  [(UNSNotificationRecord *)self triggerTimeInterval];
  id v165 = (id)objc_msgSend(v3, "appendDouble:");
  v166 = [(UNSNotificationRecord *)self triggerTimeZone];
  id v167 = (id)[v3 appendObject:v166];

  int v168 = [(UNSNotificationRecord *)self triggerType];
  id v169 = (id)[v3 appendObject:v168];

  v170 = [(UNSNotificationRecord *)self userInfo];
  id v171 = (id)[v3 appendObject:v170];

  v172 = [(UNSNotificationRecord *)self vibrationIdentifier];
  id v173 = (id)[v3 appendObject:v172];

  int v174 = [(UNSNotificationRecord *)self vibrationPatternFileURL];
  id v175 = (id)[v3 appendObject:v174];

  [(UNSNotificationRecord *)self relevanceScore];
  id v176 = (id)objc_msgSend(v3, "appendDouble:");
  int v177 = [(UNSNotificationRecord *)self filterCriteria];
  id v178 = (id)[v3 appendObject:v177];

  id v179 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord screenCaptureProhibited](self, "screenCaptureProhibited"));
  v180 = [(UNSNotificationRecord *)self speechLanguage];
  id v181 = (id)[v3 appendObject:v180];

  id v182 = (id)objc_msgSend(v3, "appendInteger:", -[UNSNotificationRecord revisionNumber](self, "revisionNumber"));
  id v183 = (id)objc_msgSend(v3, "appendInteger:", -[UNSNotificationRecord pipelineState](self, "pipelineState"));
  id v184 = (id)objc_msgSend(v3, "appendBool:", -[UNSNotificationRecord isHighlight](self, "isHighlight"));
  int v185 = [(UNSNotificationRecord *)self summary];
  id v186 = (id)[v3 appendObject:v185];

  id v187 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord priorityStatus](self, "priorityStatus"));
  id v188 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[UNSNotificationRecord summaryStatus](self, "summaryStatus"));
  v189 = [(UNSNotificationRecord *)self eventBehavior];
  id v190 = (id)[v3 appendObject:v189];

  unint64_t v191 = [v3 hash];
  return v191;
}

- (BOOL)willNotifyUser
{
  if ([(UNSNotificationRecord *)self hasAlertContent]) {
    return 1;
  }

  return [(UNSNotificationRecord *)self hasSound];
}

- (BOOL)hasCommunicationContext
{
  v3 = [(UNSNotificationRecord *)self communicationContextIdentifier];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(UNSNotificationRecord *)self communicationContextAssociatedObjectUri];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      int v6 = [(UNSNotificationRecord *)self communicationContextBundleIdentifier];
      if (v6)
      {
        BOOL v4 = 1;
      }
      else
      {
        id v7 = [(UNSNotificationRecord *)self communicationContextDisplayName];
        if (v7)
        {
          BOOL v4 = 1;
        }
        else
        {
          int v8 = [(UNSNotificationRecord *)self communicationContextRecipients];
          if ([v8 count])
          {
            BOOL v4 = 1;
          }
          else
          {
            id v9 = [(UNSNotificationRecord *)self communicationContextSender];
            if (v9)
            {
              BOOL v4 = 1;
            }
            else
            {
              v10 = [(UNSNotificationRecord *)self communicationContextContentURL];
              if (v10)
              {
                BOOL v4 = 1;
              }
              else
              {
                id v11 = [(UNSNotificationRecord *)self communicationContextImageName];
                BOOL v4 = v11
                  || [(UNSNotificationRecord *)self communicationContextSystemImage]
                  || [(UNSNotificationRecord *)self communicationContextMentionsCurrentUser]|| [(UNSNotificationRecord *)self communicationContextNotifyRecipientAnyway]|| [(UNSNotificationRecord *)self communicationContextReplyToCurrentUser]|| [(UNSNotificationRecord *)self communicationContextRecipientCount]|| [(UNSNotificationRecord *)self communicationContextCapabilities]|| [(UNSNotificationRecord *)self communicationContextBusinessCorrespondence];
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

- (BOOL)hasAlertContent
{
  v3 = [(UNSNotificationRecord *)self body];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(UNSNotificationRecord *)self bodyLocalizationKey];
    if ([v5 length])
    {
      BOOL v4 = 1;
    }
    else
    {
      int v6 = [(UNSNotificationRecord *)self subtitle];
      if ([v6 length])
      {
        BOOL v4 = 1;
      }
      else
      {
        id v7 = [(UNSNotificationRecord *)self subtitleLocalizationKey];
        if ([v7 length])
        {
          BOOL v4 = 1;
        }
        else
        {
          int v8 = [(UNSNotificationRecord *)self title];
          if ([v8 length])
          {
            BOOL v4 = 1;
          }
          else
          {
            id v9 = [(UNSNotificationRecord *)self titleLocalizationKey];
            BOOL v4 = [v9 length] != 0;
          }
        }
      }
    }
  }
  return v4;
}

- (BOOL)hasBadge
{
  v2 = [(UNSNotificationRecord *)self badge];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasSound
{
  return [(UNSNotificationRecord *)self toneAlertType] != 0;
}

- (BOOL)hasPendingTrigger
{
  BOOL v3 = [(UNSNotificationRecord *)self triggerType];
  if (([v3 isEqualToString:@"Calendar"] & 1) != 0
    || ([v3 isEqualToString:@"Location"] & 1) != 0
    || ([v3 isEqualToString:@"TimeInterval"] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else if ([v3 isEqualToString:@"Local"])
  {
    unint64_t v6 = [(UNSNotificationRecord *)self triggerRepeatInterval];
    id v7 = [(UNSNotificationRecord *)self triggerDate];
    int v8 = v7;
    BOOL v4 = 1;
    if (!v6)
    {
      if (!v7 || ([v7 timeIntervalSinceNow], v9 <= 0.0)) {
        BOOL v4 = 0;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(UNSNotificationRecord *)self descriptionBuilderWithMultilinePrefix:a3];
  BOOL v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  unint64_t v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__UNSNotificationRecord_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_265567628;
  id v7 = v6;
  id v11 = v7;
  int v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __63__UNSNotificationRecord_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  BOOL v3 = (id *)(a1 + 40);
  BOOL v4 = [*(id *)(a1 + 40) contentType];
  [v2 appendString:v4 withName:@"ContentType" skipIfEmpty:1];

  uint64_t v5 = [*v3 hasCommunicationContext];
  id v6 = (id)[*v1 appendBool:v5 withName:@"HasCommunicationContext"];
  if (v5)
  {
    id v7 = *v1;
    id v8 = [*v3 communicationContextIdentifier];
    [v7 appendString:v8 withName:@"CommunicationContextIdentifier"];

    id v9 = *v1;
    v10 = [*v3 communicationContextBundleIdentifier];
    [v9 appendString:v10 withName:@"CommunicationContextBundleIdentifier"];

    id v11 = *v1;
    int v12 = [*v3 communicationContextAssociatedObjectUri];
    [v11 appendString:v12 withName:@"CommunicationContextAssociatedObjectUri"];

    id v13 = *v1;
    v14 = [*v3 communicationContextDisplayName];
    [v13 appendString:v14 withName:@"CommunicationContextDisplayName"];

    id v15 = *v1;
    int v16 = [*v3 communicationContextSender];
    id v17 = (id)[v15 appendObject:v16 withName:@"CommunicationContextSender"];

    id v18 = *v1;
    id v19 = [*v3 communicationContextRecipients];
    id v20 = (id)[v18 appendObject:v19 withName:@"CommunicationContextRecipients"];

    id v21 = *v1;
    id v22 = [*v3 communicationContextContentURL];
    id v23 = (id)[v21 appendObject:v22 withName:@"CommunicationContextContentURL"];

    id v24 = *v1;
    id v25 = [*v3 communicationContextImageName];
    id v26 = (id)[v24 appendObject:v25 withName:@"CommunicationContextImageName"];

    id v27 = (id)objc_msgSend(*v1, "appendBool:withName:", objc_msgSend(*v3, "communicationContextSystemImage"), @"CommunicationContextSystemImage");
    id v28 = (id)objc_msgSend(*v1, "appendBool:withName:", objc_msgSend(*v3, "communicationContextMentionsCurrentUser"), @"CommunicationContextMentionsCurrentUser");
    id v29 = (id)objc_msgSend(*v1, "appendBool:withName:", objc_msgSend(*v3, "communicationContextNotifyRecipientAnyway"), @"CommunicationContextNotifyRecipientAnyway");
    id v30 = (id)objc_msgSend(*v1, "appendBool:withName:", objc_msgSend(*v3, "communicationContextReplyToCurrentUser"), @"CommunicationContextReplyToCurrentUser");
    id v31 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "communicationContextRecipientCount"), @"CommunicationContextRecipientCount");
    id v32 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "communicationContextCapabilities"), @"CommunicationContextCapabilities");
    id v33 = (id)objc_msgSend(*v1, "appendBool:withName:", objc_msgSend(*v3, "communicationContextBusinessCorrespondence"), @"CommunicationContextBusinessCorrespondence");
  }
  id v34 = *v1;
  BOOL v35 = [*v3 accessoryImageName];
  [v34 appendString:v35 withName:@"AccessoryImageName" skipIfEmpty:1];

  id v36 = *v1;
  int v37 = [*v3 date];
  id v38 = (id)[v36 appendObject:v37 withName:@"Date" skipIfNil:1];

  id v39 = *v1;
  id v40 = [*v3 identifier];
  [v39 appendString:v40 withName:@"Identifier" skipIfEmpty:1];

  id v41 = *v1;
  id v42 = [*v3 threadIdentifier];
  [v41 appendString:v42 withName:@"ThreadIdentifier" skipIfEmpty:1];

  id v43 = *v1;
  id v44 = [*v3 categoryIdentifier];
  [v43 appendString:v44 withName:@"CategoryIdentifier" skipIfEmpty:1];

  id v45 = *v1;
  double v46 = [*v3 attachments];
  [v45 appendArraySection:v46 withName:@"Attachments" skipIfEmpty:1];

  id v47 = *v1;
  int v48 = [*v3 badge];
  id v49 = (id)[v47 appendObject:v48 withName:@"Badge" skipIfNil:1];

  id v50 = *v1;
  id v51 = [*v3 body];
  [v50 appendString:v51 withName:@"Body" skipIfEmpty:1];

  id v52 = *v1;
  id v53 = [*v3 bodyLocalizationKey];
  [v52 appendString:v53 withName:@"BodyLocalizationKey" skipIfEmpty:1];

  id v54 = *v1;
  id v55 = [*v3 bodyLocalizationArguments];
  [v54 appendArraySection:v55 withName:@"BodyLocalizationArguments" skipIfEmpty:1];

  id v56 = *v1;
  id v57 = [*v3 attributedBody];
  id v58 = (id)[v56 appendObject:v57 withName:@"AttributedBody" skipIfNil:1];

  id v59 = *v1;
  id v60 = [*v3 summaryArgument];
  [v59 appendString:v60 withName:@"SummaryArgument"];

  id v61 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "summaryArgumentCount"), @"SummaryArgumentCount");
  id v62 = *v1;
  id v63 = [*v3 targetContentIdentifier];
  [v62 appendString:v63 withName:@"TargetContentIdentifier"];

  id v64 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "hasCriticalAlertSound"), @"CriticalAlertSound", 1);
  id v65 = *v1;
  v66 = [*v3 header];
  [v65 appendString:v66 withName:@"Header" skipIfEmpty:1];

  id v67 = *v1;
  v68 = [*v3 headerLocalizationKey];
  [v67 appendString:v68 withName:@"HeaderLocalizationKey" skipIfEmpty:1];

  id v69 = *v1;
  int v70 = [*v3 headerLocalizationArguments];
  [v69 appendArraySection:v70 withName:@"HeaderLocalizationArguments" skipIfEmpty:1];

  id v71 = *v1;
  id v72 = [*v3 footer];
  [v71 appendString:v72 withName:@"Footer" skipIfEmpty:1];

  id v73 = *v1;
  id v74 = [*v3 footerLocalizationKey];
  [v73 appendString:v74 withName:@"FooterLocalizationKey" skipIfEmpty:1];

  id v75 = *v1;
  id v76 = [*v3 footerLocalizationArguments];
  [v75 appendArraySection:v76 withName:@"FooterLocalizationArguments" skipIfEmpty:1];

  id v77 = *v1;
  id v78 = [*v3 iconApplicationIdentifier];
  [v77 appendString:v78 withName:@"IconApplicationIdentifier" skipIfEmpty:1];

  id v79 = *v1;
  id v80 = [*v3 iconName];
  [v79 appendString:v80 withName:@"IconName" skipIfEmpty:1];

  id v81 = *v1;
  id v82 = [*v3 iconPath];
  [v81 appendString:v82 withName:@"IconPath" skipIfEmpty:1];

  id v83 = *v1;
  id v84 = [*v3 iconSystemImageName];
  [v83 appendString:v84 withName:@"IconSystemImageName" skipIfEmpty:1];

  id v85 = *v1;
  id v86 = [*v3 contentAvailable];
  id v87 = (id)[v85 appendObject:v86 withName:@"ContentAvailable" skipIfNil:1];

  id v88 = *v1;
  v89 = [*v3 mutableContent];
  id v90 = (id)[v88 appendObject:v89 withName:@"MutableContent" skipIfNil:1];

  id v91 = *v1;
  id v92 = [*v3 contentDate];
  id v93 = (id)[v91 appendObject:v92 withName:@"ContentDate" skipIfNil:1];

  id v94 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "interruptionLevel"), @"InterruptionLevel");
  id v95 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "hasDefaultAction"), @"hasDefaultAction", 0);
  id v96 = *v1;
  v97 = [*v3 defaultActionTitle];
  [v96 appendString:v97 withName:@"DefaultActionTitle" skipIfEmpty:1];

  id v98 = *v1;
  id v99 = [*v3 defaultActionTitleLocalizationKey];
  [v98 appendString:v99 withName:@"DefaultActionTitleLocalizationKey" skipIfEmpty:1];

  id v100 = *v1;
  id v101 = [*v3 defaultActionURL];
  id v102 = (id)[v100 appendObject:v101 withName:@"DefaultActionURL" skipIfNil:1];

  id v103 = *v1;
  id v104 = [*v3 defaultActionBundleIdentifier];
  [v103 appendString:v104 withName:@"DefaultActionBundleIdentifier" skipIfEmpty:1];

  id v105 = *v1;
  id v106 = [*v3 expirationDate];
  id v107 = (id)[v105 appendObject:v106 withName:@"ExpirationDate" skipIfNil:1];

  id v108 = *v1;
  id v109 = [*v3 launchImageName];
  [v108 appendString:v109 withName:@"LaunchImageName" skipIfEmpty:1];

  id v110 = *v1;
  id v111 = [*v3 requestDate];
  id v112 = (id)[v110 appendObject:v111 withName:@"RequestDate" skipIfNil:1];

  id v113 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldBadgeApplicationIcon"), @"ShouldBadgeApplicationIcon", 0);
  id v114 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldIgnoreRingerSwitch"), @"ShouldIgnoreRingerSwitch", 1);
  id v115 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldPlaySound"), @"ShouldPlaySound", 0);
  id v116 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldPresentAlert"), @"ShouldPresentAlert", 0);
  id v117 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "presentationOptions"), @"PresentationOptions");
  id v118 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldShowSubordinateIcon"), @"ShouldShowSubordinateIcon", 1);
  id v119 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldSoundRepeat"), @"ShouldSoundRepeat", 1);
  id v120 = *v1;
  BOOL v121 = [*v3 audioCategory];
  [v120 appendString:v121 withName:@"SoundAudioCategory" skipIfEmpty:1];

  id v122 = *v1;
  id v123 = [*v3 audioVolume];
  id v124 = (id)[v122 appendObject:v123 withName:@"SoundAudioVolume" skipIfNil:1];

  [*v3 soundMaximumDuration];
  if (v125 != 0.0)
  {
    id v126 = *v1;
    [*v3 soundMaximumDuration];
    id v127 = (id)objc_msgSend(v126, "appendDouble:withName:decimalPrecision:", @"SoundMaximumDuration", 1);
  }
  id v128 = *v1;
  id v129 = [*v3 subtitle];
  [v128 appendString:v129 withName:@"Subtitle" skipIfEmpty:1];

  id v130 = *v1;
  id v131 = [*v3 title];
  [v130 appendString:v131 withName:@"Title" skipIfEmpty:1];

  id v132 = *v1;
  id v133 = [*v3 titleLocalizationKey];
  [v132 appendString:v133 withName:@"TitleLocalizationKey" skipIfEmpty:1];

  id v134 = *v1;
  id v135 = [*v3 titleLocalizationArguments];
  [v134 appendArraySection:v135 withName:@"TitleLocalizationArguments" skipIfEmpty:1];

  id v136 = *v1;
  id v137 = [*v3 toneAlertTopic];
  [v136 appendString:v137 withName:@"ToneAlertTopic" skipIfEmpty:1];

  id v138 = *v1;
  [*v3 toneAlertType];
  v139 = NSStringFromTLAlertType();
  [v138 appendString:v139 withName:@"ToneAlertType" skipIfEmpty:1];

  id v140 = *v1;
  v141 = [*v3 toneFileName];
  [v140 appendString:v141 withName:@"ToneFileName" skipIfEmpty:1];

  id v142 = *v1;
  int v143 = [*v3 toneFileURL];
  id v144 = (id)[v142 appendObject:v143 withName:@"ToneFileURL" skipIfNil:1];

  id v145 = *v1;
  id v146 = [*v3 toneIdentifier];
  [v145 appendString:v146 withName:@"ToneIdentifier" skipIfEmpty:1];

  if ([*v3 toneMediaLibraryItemIdentifier]) {
    id v147 = (id)objc_msgSend(*v1, "appendUInt64:withName:", objc_msgSend(*v3, "toneMediaLibraryItemIdentifier"), @"ToneMediaLibraryItemIdentifier");
  }
  id v148 = *v1;
  id v149 = [*v3 topicIdentifiers];
  id v150 = [v149 allObjects];
  [v148 appendArraySection:v150 withName:@"TopicIdentifiers" skipIfEmpty:1];

  if ([*v3 realertCount]) {
    id v151 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "realertCount"), @"RealertCount");
  }
  id v152 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "allowsDefaultDestinations"), @"DefaultDestinations", 1);
  id v153 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "allowsLockScreenDestination"), @"LockScreenDestination", 1);
  id v154 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "allowsNotificationCenterDestination"), @"NotificationCenterDestination", 1);
  id v155 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "allowsAlertDestination"), @"AlertDestination", 1);
  id v156 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "allowsCarPlayDestination"), @"CarPlayDestination", 1);
  id v157 = *v1;
  id v158 = [*v3 triggerDate];
  id v159 = (id)[v157 appendObject:v158 withName:@"TriggerDate" skipIfNil:1];

  id v160 = *v1;
  BOOL v161 = [*v3 triggerDateComponents];
  id v162 = (id)[v160 appendObject:v161 withName:@"TriggerDateComponents" skipIfNil:1];

  id v163 = *v1;
  id v164 = [*v3 triggerRegion];
  id v165 = (id)[v163 appendObject:v164 withName:@"TriggerRegion" skipIfNil:1];

  id v166 = *v1;
  id v167 = [*v3 triggerRepeatCalendarIdentifier];
  [v166 appendString:v167 withName:@"TriggerRepeatCalendar" skipIfEmpty:1];

  if ([*v3 triggerRepeatInterval]) {
    id v168 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "triggerRepeatInterval"), @"TriggerRepeatInterval");
  }
  id v169 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "triggerRepeats"), @"TriggerRepeats", 1);
  [*v3 triggerTimeInterval];
  if (v170 != 0.0)
  {
    id v171 = *v1;
    [*v3 triggerTimeInterval];
    id v172 = (id)objc_msgSend(v171, "appendDouble:withName:decimalPrecision:", @"TriggerTimeInterval", 1);
  }
  id v173 = *v1;
  int v174 = [*v3 triggerTimeZone];
  id v175 = [v174 name];
  [v173 appendString:v175 withName:@"TriggerTimeZone" skipIfEmpty:1];

  id v176 = *v1;
  int v177 = [*v3 triggerType];
  [v176 appendString:v177 withName:@"TriggerType" skipIfEmpty:1];

  id v178 = *v1;
  id v179 = [*v3 userInfo];
  [v178 appendDictionarySection:v179 withName:@"UserInfo" skipIfEmpty:1];

  id v180 = *v1;
  id v181 = [*v3 vibrationIdentifier];
  [v180 appendString:v181 withName:@"VibrationIdentifier" skipIfEmpty:1];

  id v182 = *v1;
  id v183 = [*v3 vibrationPatternFileURL];
  id v184 = (id)[v182 appendObject:v183 withName:@"VibrationPatternFileURL" skipIfNil:1];

  id v185 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "shouldIgnoreAccessibilityDisabledVibrationSetting"), @"ShouldIgnoreAccessibilityDisabledVibrationSetting", 1);
  id v186 = *v1;
  [*v3 relevanceScore];
  id v187 = (id)objc_msgSend(v186, "appendDouble:withName:decimalPrecision:", @"RelevanceScore", 2);
  id v188 = *v1;
  v189 = [*v3 filterCriteria];
  [v188 appendString:v189 withName:@"FilterCriteria"];

  id v190 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "screenCaptureProhibited"), @"ScreenCaptureProhibited", 1);
  id v191 = *v1;
  v192 = [*v3 speechLanguage];
  [v191 appendString:v192 withName:@"SpeechLanguage"];

  id v193 = (id)objc_msgSend(*v1, "appendInteger:withName:", objc_msgSend(*v3, "revisionNumber"), @"RevisionNumber");
  id v194 = (id)objc_msgSend(*v1, "appendInteger:withName:", objc_msgSend(*v3, "pipelineState"), @"PipelineState");
  id v195 = (id)objc_msgSend(*v1, "appendBool:withName:ifEqualTo:", objc_msgSend(*v3, "isHighlight"), @"IsHighlight", 1);
  id v196 = *v1;
  double v197 = [*v3 summary];
  id v198 = (id)[v196 appendObject:v197 withName:@"Summary"];

  id v199 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "priorityStatus"), @"PriorityStatus");
  id v200 = (id)objc_msgSend(*v1, "appendUnsignedInteger:withName:", objc_msgSend(*v3, "summaryStatus"), @"SummaryStatus");
  id v201 = *v1;
  id v203 = [*v3 eventBehavior];
  id v202 = (id)[v201 appendObject:v203 withName:@"EventBehavior"];
}

- (id)succinctDescription
{
  v2 = [(UNSNotificationRecord *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  BOOL v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  BOOL v4 = [(UNSNotificationRecord *)self date];
  id v5 = (id)[v3 appendObject:v4 withName:@"Date" skipIfNil:1];

  id v6 = [(UNSNotificationRecord *)self contentType];
  id v7 = (id)[v3 appendObject:v6 withName:@"ContentType" skipIfNil:1];

  id v8 = [(UNSNotificationRecord *)self identifier];
  [v3 appendString:v8 withName:@"Identifier" skipIfEmpty:1];

  id v9 = [(UNSNotificationRecord *)self threadIdentifier];
  [v3 appendString:v9 withName:@"ThreadIdentifier" skipIfEmpty:1];

  v10 = [(UNSNotificationRecord *)self categoryIdentifier];
  [v3 appendString:v10 withName:@"CategoryIdentifier" skipIfEmpty:1];

  id v11 = [(UNSNotificationRecord *)self targetContentIdentifier];
  [v3 appendString:v11 withName:@"TargetContentIdentifier" skipIfEmpty:1];

  int v12 = [(UNSNotificationRecord *)self filterCriteria];
  [v3 appendString:v12 withName:@"FilterCriteria" skipIfEmpty:1];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UNSNotificationRecord *)self dictionaryRepresentation];
  [v4 encodeObject:v5 forKey:@"dictionary"];
}

- (UNSNotificationRecord)initWithCoder:(id)a3
{
  v11[14] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  v11[2] = objc_opt_class();
  v11[3] = objc_opt_class();
  v11[4] = objc_opt_class();
  v11[5] = objc_opt_class();
  v11[6] = objc_opt_class();
  v11[7] = objc_opt_class();
  v11[8] = objc_opt_class();
  v11[9] = objc_opt_class();
  v11[10] = objc_opt_class();
  v11[11] = objc_opt_class();
  v11[12] = objc_opt_class();
  v11[13] = objc_opt_class();
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:14];
  id v7 = [v4 setWithArray:v6];

  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"dictionary"];

  id v9 = [[UNSNotificationRecord alloc] initWithDictionaryRepresentation:v8];
  return v9;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSString)communicationContextIdentifier
{
  return self->_communicationContextIdentifier;
}

- (void)setCommunicationContextIdentifier:(id)a3
{
}

- (NSString)communicationContextBundleIdentifier
{
  return self->_communicationContextBundleIdentifier;
}

- (void)setCommunicationContextBundleIdentifier:(id)a3
{
}

- (NSString)communicationContextAssociatedObjectUri
{
  return self->_communicationContextAssociatedObjectUri;
}

- (void)setCommunicationContextAssociatedObjectUri:(id)a3
{
}

- (NSString)communicationContextDisplayName
{
  return self->_communicationContextDisplayName;
}

- (void)setCommunicationContextDisplayName:(id)a3
{
}

- (UNCContactRecord)communicationContextSender
{
  return self->_communicationContextSender;
}

- (void)setCommunicationContextSender:(id)a3
{
}

- (NSArray)communicationContextRecipients
{
  return self->_communicationContextRecipients;
}

- (void)setCommunicationContextRecipients:(id)a3
{
}

- (NSURL)communicationContextContentURL
{
  return self->_communicationContextContentURL;
}

- (void)setCommunicationContextContentURL:(id)a3
{
}

- (NSString)communicationContextImageName
{
  return self->_communicationContextImageName;
}

- (void)setCommunicationContextImageName:(id)a3
{
}

- (BOOL)communicationContextSystemImage
{
  return self->_communicationContextSystemImage;
}

- (void)setCommunicationContextSystemImage:(BOOL)a3
{
  self->_communicationContextSystemImage = a3;
}

- (BOOL)communicationContextMentionsCurrentUser
{
  return self->_communicationContextMentionsCurrentUser;
}

- (void)setCommunicationContextMentionsCurrentUser:(BOOL)a3
{
  self->_communicationContextMentionsCurrentUser = a3;
}

- (BOOL)communicationContextNotifyRecipientAnyway
{
  return self->_communicationContextNotifyRecipientAnyway;
}

- (void)setCommunicationContextNotifyRecipientAnyway:(BOOL)a3
{
  self->_communicationContextNotifyRecipientAnyway = a3;
}

- (BOOL)communicationContextReplyToCurrentUser
{
  return self->_communicationContextReplyToCurrentUser;
}

- (void)setCommunicationContextReplyToCurrentUser:(BOOL)a3
{
  self->_communicationContextReplyToCurrentUser = a3;
}

- (int64_t)communicationContextCapabilities
{
  return self->_communicationContextCapabilities;
}

- (void)setCommunicationContextCapabilities:(int64_t)a3
{
  self->_communicationContextCapabilities = a3;
}

- (BOOL)communicationContextBusinessCorrespondence
{
  return self->_communicationContextBusinessCorrespondence;
}

- (void)setCommunicationContextBusinessCorrespondence:(BOOL)a3
{
  self->_communicationContextBusinessCorrespondence = a3;
}

- (unint64_t)communicationContextRecipientCount
{
  return self->_communicationContextRecipientCount;
}

- (void)setCommunicationContextRecipientCount:(unint64_t)a3
{
  self->_communicationContextRecipientCount = a3;
}

- (NSString)accessoryImageName
{
  return self->_accessoryImageName;
}

- (void)setAccessoryImageName:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSNumber)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSDate)contentDate
{
  return self->_contentDate;
}

- (void)setContentDate:(id)a3
{
}

- (NSArray)bodyLocalizationArguments
{
  return self->_bodyLocalizationArguments;
}

- (void)setBodyLocalizationArguments:(id)a3
{
}

- (NSString)bodyLocalizationKey
{
  return self->_bodyLocalizationKey;
}

- (void)setBodyLocalizationKey:(id)a3
{
}

- (NSAttributedString)attributedBody
{
  return self->_attributedBody;
}

- (void)setAttributedBody:(id)a3
{
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
}

- (NSNumber)contentAvailable
{
  return self->_contentAvailable;
}

- (void)setContentAvailable:(id)a3
{
}

- (NSNumber)mutableContent
{
  return self->_mutableContent;
}

- (void)setMutableContent:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)interruptionLevel
{
  return self->_interruptionLevel;
}

- (void)setInterruptionLevel:(unint64_t)a3
{
  self->_interruptionLevel = a3;
}

- (BOOL)hasDefaultAction
{
  return self->_hasDefaultAction;
}

- (void)setHasDefaultAction:(BOOL)a3
{
  self->_hasDefaultAction = a3;
}

- (NSString)defaultActionTitle
{
  return self->_defaultActionTitle;
}

- (void)setDefaultActionTitle:(id)a3
{
}

- (NSString)defaultActionTitleLocalizationKey
{
  return self->_defaultActionTitleLocalizationKey;
}

- (void)setDefaultActionTitleLocalizationKey:(id)a3
{
}

- (NSURL)defaultActionURL
{
  return self->_defaultActionURL;
}

- (void)setDefaultActionURL:(id)a3
{
}

- (NSString)defaultActionBundleIdentifier
{
  return self->_defaultActionBundleIdentifier;
}

- (void)setDefaultActionBundleIdentifier:(id)a3
{
}

- (BOOL)hasCriticalAlertSound
{
  return self->_hasCriticalAlertSound;
}

- (void)setHasCriticalAlertSound:(BOOL)a3
{
  self->_hasCriticalAlertSound = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSArray)headerLocalizationArguments
{
  return self->_headerLocalizationArguments;
}

- (void)setHeaderLocalizationArguments:(id)a3
{
}

- (NSString)headerLocalizationKey
{
  return self->_headerLocalizationKey;
}

- (void)setHeaderLocalizationKey:(id)a3
{
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
}

- (NSArray)footerLocalizationArguments
{
  return self->_footerLocalizationArguments;
}

- (void)setFooterLocalizationArguments:(id)a3
{
}

- (NSString)footerLocalizationKey
{
  return self->_footerLocalizationKey;
}

- (void)setFooterLocalizationKey:(id)a3
{
}

- (NSString)iconApplicationIdentifier
{
  return self->_iconApplicationIdentifier;
}

- (void)setIconApplicationIdentifier:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
}

- (NSString)iconPath
{
  return self->_iconPath;
}

- (void)setIconPath:(id)a3
{
}

- (NSString)iconSystemImageName
{
  return self->_iconSystemImageName;
}

- (void)setIconSystemImageName:(id)a3
{
}

- (BOOL)iconShouldSuppressMask
{
  return self->_iconShouldSuppressMask;
}

- (void)setIconShouldSuppressMask:(BOOL)a3
{
  self->_iconShouldSuppressMask = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)launchImageName
{
  return self->_launchImageName;
}

- (void)setLaunchImageName:(id)a3
{
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
}

- (BOOL)shouldBadgeApplicationIcon
{
  return self->_shouldBadgeApplicationIcon;
}

- (void)setShouldBadgeApplicationIcon:(BOOL)a3
{
  self->_shouldBadgeApplicationIcon = a3;
}

- (BOOL)shouldHideDate
{
  return self->_shouldHideDate;
}

- (void)setShouldHideDate:(BOOL)a3
{
  self->_shouldHideDate = a3;
}

- (BOOL)shouldHideTime
{
  return self->_shouldHideTime;
}

- (void)setShouldHideTime:(BOOL)a3
{
  self->_shouldHideTime = a3;
}

- (BOOL)shouldIgnoreAccessibilityDisabledVibrationSetting
{
  return self->_shouldIgnoreAccessibilityDisabledVibrationSetting;
}

- (void)setShouldIgnoreAccessibilityDisabledVibrationSetting:(BOOL)a3
{
  self->_shouldIgnoreAccessibilityDisabledVibrationSetting = a3;
}

- (BOOL)shouldIgnoreDoNotDisturb
{
  return self->_shouldIgnoreDoNotDisturb;
}

- (void)setShouldIgnoreDoNotDisturb:(BOOL)a3
{
  self->_shouldIgnoreDoNotDisturb = a3;
}

- (BOOL)shouldIgnoreDowntime
{
  return self->_shouldIgnoreDowntime;
}

- (void)setShouldIgnoreDowntime:(BOOL)a3
{
  self->_shouldIgnoreDowntime = a3;
}

- (BOOL)shouldIgnoreRingerSwitch
{
  return self->_shouldIgnoreRingerSwitch;
}

- (void)setShouldIgnoreRingerSwitch:(BOOL)a3
{
  self->_shouldIgnoreRingerSwitch = a3;
}

- (BOOL)shouldSuppressScreenLightUp
{
  return self->_shouldSuppressScreenLightUp;
}

- (void)setShouldSuppressScreenLightUp:(BOOL)a3
{
  self->_shouldSuppressScreenLightUp = a3;
}

- (BOOL)shouldPlaySound
{
  return self->_shouldPlaySound;
}

- (void)setShouldPlaySound:(BOOL)a3
{
  self->_shouldPlaySound = a3;
}

- (BOOL)shouldPresentAlert
{
  return self->_shouldPresentAlert;
}

- (void)setShouldPresentAlert:(BOOL)a3
{
  self->_shouldPresentAlert = a3;
}

- (unint64_t)presentationOptions
{
  return self->_presentationOptions;
}

- (void)setPresentationOptions:(unint64_t)a3
{
  self->_presentationOptions = a3;
}

- (BOOL)shouldAuthenticateDefaultAction
{
  return self->_shouldAuthenticateDefaultAction;
}

- (void)setShouldAuthenticateDefaultAction:(BOOL)a3
{
  self->_shouldAuthenticateDefaultAction = a3;
}

- (BOOL)shouldBackgroundDefaultAction
{
  return self->_shouldBackgroundDefaultAction;
}

- (void)setShouldBackgroundDefaultAction:(BOOL)a3
{
  self->_shouldBackgroundDefaultAction = a3;
}

- (BOOL)shouldPreventNotificationDismissalAfterDefaultAction
{
  return self->_shouldPreventNotificationDismissalAfterDefaultAction;
}

- (void)setShouldPreventNotificationDismissalAfterDefaultAction:(BOOL)a3
{
  self->_shouldPreventNotificationDismissalAfterDefaultAction = a3;
}

- (BOOL)shouldShowSubordinateIcon
{
  return self->_shouldShowSubordinateIcon;
}

- (void)setShouldShowSubordinateIcon:(BOOL)a3
{
  self->_shouldShowSubordinateIcon = a3;
}

- (BOOL)shouldSoundRepeat
{
  return self->_shouldSoundRepeat;
}

- (void)setShouldSoundRepeat:(BOOL)a3
{
  self->_shouldSoundRepeat = a3;
}

- (BOOL)shouldSuppressSyncDismissalWhenRemoved
{
  return self->_shouldSuppressSyncDismissalWhenRemoved;
}

- (void)setShouldSuppressSyncDismissalWhenRemoved:(BOOL)a3
{
  self->_shouldSuppressSyncDismissalWhenRemoved = a3;
}

- (BOOL)shouldUseRequestIdentifierForDismissalSync
{
  return self->_shouldUseRequestIdentifierForDismissalSync;
}

- (void)setShouldUseRequestIdentifierForDismissalSync:(BOOL)a3
{
  self->_shouldUseRequestIdentifierForDismissalSync = a3;
}

- (BOOL)shouldPreemptPresentedNotification
{
  return self->_shouldPreemptPresentedNotification;
}

- (void)setShouldPreemptPresentedNotification:(BOOL)a3
{
  self->_shouldPreemptPresentedNotification = a3;
}

- (BOOL)shouldDisplayActionsInline
{
  return self->_shouldDisplayActionsInline;
}

- (void)setShouldDisplayActionsInline:(BOOL)a3
{
  self->_shouldDisplayActionsInline = a3;
}

- (NSString)audioCategory
{
  return self->_audioCategory;
}

- (void)setAudioCategory:(id)a3
{
}

- (NSNumber)audioVolume
{
  return self->_audioVolume;
}

- (void)setAudioVolume:(id)a3
{
}

- (double)soundMaximumDuration
{
  return self->_soundMaximumDuration;
}

- (void)setSoundMaximumDuration:(double)a3
{
  self->_soundMaximumDuration = a3;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSArray)subtitleLocalizationArguments
{
  return self->_subtitleLocalizationArguments;
}

- (void)setSubtitleLocalizationArguments:(id)a3
{
}

- (NSString)subtitleLocalizationKey
{
  return self->_subtitleLocalizationKey;
}

- (void)setSubtitleLocalizationKey:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSArray)titleLocalizationArguments
{
  return self->_titleLocalizationArguments;
}

- (void)setTitleLocalizationArguments:(id)a3
{
}

- (NSString)titleLocalizationKey
{
  return self->_titleLocalizationKey;
}

- (void)setTitleLocalizationKey:(id)a3
{
}

- (unint64_t)realertCount
{
  return self->_realertCount;
}

- (void)setRealertCount:(unint64_t)a3
{
  self->_realertCount = a3;
}

- (NSString)summaryArgument
{
  return self->_summaryArgument;
}

- (void)setSummaryArgument:(id)a3
{
}

- (unint64_t)summaryArgumentCount
{
  return self->_summaryArgumentCount;
}

- (void)setSummaryArgumentCount:(unint64_t)a3
{
  self->_summaryArgumentCount = a3;
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (void)setTargetContentIdentifier:(id)a3
{
}

- (NSString)toneAlertTopic
{
  return self->_toneAlertTopic;
}

- (void)setToneAlertTopic:(id)a3
{
}

- (int64_t)toneAlertType
{
  return self->_toneAlertType;
}

- (void)setToneAlertType:(int64_t)a3
{
  self->_toneAlertType = a3;
}

- (NSString)toneFileName
{
  return self->_toneFileName;
}

- (void)setToneFileName:(id)a3
{
}

- (NSURL)toneFileURL
{
  return self->_toneFileURL;
}

- (void)setToneFileURL:(id)a3
{
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (void)setToneIdentifier:(id)a3
{
}

- (unint64_t)toneMediaLibraryItemIdentifier
{
  return self->_toneMediaLibraryItemIdentifier;
}

- (void)setToneMediaLibraryItemIdentifier:(unint64_t)a3
{
  self->_toneMediaLibraryItemIdentifier = a3;
}

- (NSSet)topicIdentifiers
{
  return self->_topicIdentifiers;
}

- (void)setTopicIdentifiers:(id)a3
{
}

- (BOOL)allowsDefaultDestinations
{
  return self->_allowsDefaultDestinations;
}

- (void)setAllowsDefaultDestinations:(BOOL)a3
{
  self->_allowsDefaultDestinations = a3;
}

- (BOOL)allowsAlertDestination
{
  return self->_allowsAlertDestination;
}

- (void)setAllowsAlertDestination:(BOOL)a3
{
  self->_allowsAlertDestination = a3;
}

- (BOOL)allowsLockScreenDestination
{
  return self->_allowsLockScreenDestination;
}

- (void)setAllowsLockScreenDestination:(BOOL)a3
{
  self->_allowsLockScreenDestination = a3;
}

- (BOOL)allowsNotificationCenterDestination
{
  return self->_allowsNotificationCenterDestination;
}

- (void)setAllowsNotificationCenterDestination:(BOOL)a3
{
  self->_allowsNotificationCenterDestination = a3;
}

- (BOOL)allowsCarPlayDestination
{
  return self->_allowsCarPlayDestination;
}

- (void)setAllowsCarPlayDestination:(BOOL)a3
{
  self->_allowsCarPlayDestination = a3;
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (void)setTriggerDate:(id)a3
{
}

- (NSDateComponents)triggerDateComponents
{
  return self->_triggerDateComponents;
}

- (void)setTriggerDateComponents:(id)a3
{
}

- (NSString)triggerRepeatCalendarIdentifier
{
  return self->_triggerRepeatCalendarIdentifier;
}

- (void)setTriggerRepeatCalendarIdentifier:(id)a3
{
}

- (unint64_t)triggerRepeatInterval
{
  return self->_triggerRepeatInterval;
}

- (void)setTriggerRepeatInterval:(unint64_t)a3
{
  self->_triggerRepeatInterval = a3;
}

- (BOOL)triggerRepeats
{
  return self->_triggerRepeats;
}

- (void)setTriggerRepeats:(BOOL)a3
{
  self->_triggerRepeats = a3;
}

- (CLRegion)triggerRegion
{
  return self->_triggerRegion;
}

- (void)setTriggerRegion:(id)a3
{
}

- (double)triggerTimeInterval
{
  return self->_triggerTimeInterval;
}

- (void)setTriggerTimeInterval:(double)a3
{
  self->_triggerTimeInterval = a3;
}

- (NSTimeZone)triggerTimeZone
{
  return self->_triggerTimeZone;
}

- (void)setTriggerTimeZone:(id)a3
{
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (void)setVibrationIdentifier:(id)a3
{
}

- (NSURL)vibrationPatternFileURL
{
  return self->_vibrationPatternFileURL;
}

- (void)setVibrationPatternFileURL:(id)a3
{
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setRelevanceScore:(double)a3
{
  self->_relevanceScore = a3;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (void)setFilterCriteria:(id)a3
{
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  self->_screenCaptureProhibited = a3;
}

- (NSString)speechLanguage
{
  return self->_speechLanguage;
}

- (void)setSpeechLanguage:(id)a3
{
}

- (int64_t)revisionNumber
{
  return self->_revisionNumber;
}

- (void)setRevisionNumber:(int64_t)a3
{
  self->_revisionNumber = a3;
}

- (int64_t)pipelineState
{
  return self->_pipelineState;
}

- (void)setPipelineState:(int64_t)a3
{
  self->_pipelineState = a3;
}

- (BOOL)isHighlight
{
  return self->_isHighlight;
}

- (void)setIsHighlight:(BOOL)a3
{
  self->_isHighlight = a3;
}

- (NSAttributedString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (unint64_t)priorityStatus
{
  return self->_priorityStatus;
}

- (void)setPriorityStatus:(unint64_t)a3
{
  self->_priorityStatus = a3;
}

- (unint64_t)summaryStatus
{
  return self->_summaryStatus;
}

- (void)setSummaryStatus:(unint64_t)a3
{
  self->_summaryStatus = a3;
}

- (DNDClientEventBehavior)eventBehavior
{
  return self->_eventBehavior;
}

- (void)setEventBehavior:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBehavior, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_speechLanguage, 0);
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_vibrationPatternFileURL, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_triggerTimeZone, 0);
  objc_storeStrong((id *)&self->_triggerRegion, 0);
  objc_storeStrong((id *)&self->_triggerRepeatCalendarIdentifier, 0);
  objc_storeStrong((id *)&self->_triggerDateComponents, 0);
  objc_storeStrong((id *)&self->_triggerDate, 0);
  objc_storeStrong((id *)&self->_topicIdentifiers, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
  objc_storeStrong((id *)&self->_toneFileURL, 0);
  objc_storeStrong((id *)&self->_toneFileName, 0);
  objc_storeStrong((id *)&self->_toneAlertTopic, 0);
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_summaryArgument, 0);
  objc_storeStrong((id *)&self->_titleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_titleLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_subtitleLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_audioVolume, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_launchImageName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_iconSystemImageName, 0);
  objc_storeStrong((id *)&self->_iconPath, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_iconApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_footerLocalizationKey, 0);
  objc_storeStrong((id *)&self->_footerLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_headerLocalizationKey, 0);
  objc_storeStrong((id *)&self->_headerLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_defaultActionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultActionURL, 0);
  objc_storeStrong((id *)&self->_defaultActionTitleLocalizationKey, 0);
  objc_storeStrong((id *)&self->_defaultActionTitle, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_mutableContent, 0);
  objc_storeStrong((id *)&self->_contentAvailable, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_attributedBody, 0);
  objc_storeStrong((id *)&self->_bodyLocalizationKey, 0);
  objc_storeStrong((id *)&self->_bodyLocalizationArguments, 0);
  objc_storeStrong((id *)&self->_contentDate, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_accessoryImageName, 0);
  objc_storeStrong((id *)&self->_communicationContextImageName, 0);
  objc_storeStrong((id *)&self->_communicationContextContentURL, 0);
  objc_storeStrong((id *)&self->_communicationContextRecipients, 0);
  objc_storeStrong((id *)&self->_communicationContextSender, 0);
  objc_storeStrong((id *)&self->_communicationContextDisplayName, 0);
  objc_storeStrong((id *)&self->_communicationContextAssociatedObjectUri, 0);
  objc_storeStrong((id *)&self->_communicationContextBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_communicationContextIdentifier, 0);

  objc_storeStrong((id *)&self->_contentType, 0);
}

@end