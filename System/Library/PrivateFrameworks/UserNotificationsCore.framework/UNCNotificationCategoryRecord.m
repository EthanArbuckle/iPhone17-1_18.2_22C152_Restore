@interface UNCNotificationCategoryRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)alwaysDisplayNotificationsIndicator;
- (BOOL)hasCustomDismissAction;
- (BOOL)hasCustomSilenceAction;
- (BOOL)hasFollowActivityAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)playMediaWhenRaised;
- (BOOL)presentFullScreenAlertOverList;
- (BOOL)preventAutomaticLock;
- (BOOL)preventAutomaticRemovalFromRecent;
- (BOOL)preventClearFromList;
- (BOOL)preventDismissWhenClosed;
- (BOOL)privacyOptionShowSubtitle;
- (BOOL)privacyOptionShowTitle;
- (BOOL)revealAdditionalContentWhenPresented;
- (BOOL)shouldAllowActionsInCarPlay;
- (BOOL)shouldAllowInCarPlay;
- (BOOL)shouldAllowPersistentBannersInCarPlay;
- (BOOL)suppressDelayForForwardedNotifications;
- (BOOL)suppressDismissActionInCarPlay;
- (BOOL)suppressPresentationInAmbient;
- (NSArray)actions;
- (NSArray)intentIdentifiers;
- (NSArray)minimalActions;
- (NSString)backgroundStyle;
- (NSString)identifier;
- (NSString)listPriority;
- (NSString)privateBody;
- (NSString)summaryFormat;
- (UNCNotificationCategoryRecord)initWithCoder:(id)a3;
- (UNCNotificationCategoryRecord)initWithDictionaryRepresentation:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setActions:(id)a3;
- (void)setAlwaysDisplayNotificationsIndicator:(BOOL)a3;
- (void)setBackgroundStyle:(id)a3;
- (void)setHasCustomDismissAction:(BOOL)a3;
- (void)setHasCustomSilenceAction:(BOOL)a3;
- (void)setHasFollowActivityAction:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIntentIdentifiers:(id)a3;
- (void)setListPriority:(id)a3;
- (void)setMinimalActions:(id)a3;
- (void)setPlayMediaWhenRaised:(BOOL)a3;
- (void)setPresentFullScreenAlertOverList:(BOOL)a3;
- (void)setPreventAutomaticLock:(BOOL)a3;
- (void)setPreventAutomaticRemovalFromRecent:(BOOL)a3;
- (void)setPreventClearFromList:(BOOL)a3;
- (void)setPreventDismissWhenClosed:(BOOL)a3;
- (void)setPrivacyOptionShowSubtitle:(BOOL)a3;
- (void)setPrivacyOptionShowTitle:(BOOL)a3;
- (void)setPrivateBody:(id)a3;
- (void)setRevealAdditionalContentWhenPresented:(BOOL)a3;
- (void)setShouldAllowActionsInCarPlay:(BOOL)a3;
- (void)setShouldAllowInCarPlay:(BOOL)a3;
- (void)setShouldAllowPersistentBannersInCarPlay:(BOOL)a3;
- (void)setSummaryFormat:(id)a3;
- (void)setSuppressDelayForForwardedNotifications:(BOOL)a3;
- (void)setSuppressDismissActionInCarPlay:(BOOL)a3;
- (void)setSuppressPresentationInAmbient:(BOOL)a3;
@end

@implementation UNCNotificationCategoryRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listPriority, 0);
  objc_storeStrong((id *)&self->_backgroundStyle, 0);
  objc_storeStrong((id *)&self->_summaryFormat, 0);
  objc_storeStrong((id *)&self->_privateBody, 0);
  objc_storeStrong((id *)&self->_minimalActions, 0);
  objc_storeStrong((id *)&self->_intentIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_actions, 0);
}

- (UNCNotificationCategoryRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)UNCNotificationCategoryRecord;
  v5 = [(UNCNotificationCategoryRecord *)&v42 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"Actions"];
    v7 = objc_msgSend(v6, "bs_map:", UNSDictionaryToNotificationActionRecord);
    [(UNCNotificationCategoryRecord *)v5 setActions:v7];

    v8 = [v4 objectForKey:@"BackgroundStyle"];
    [(UNCNotificationCategoryRecord *)v5 setBackgroundStyle:v8];

    v9 = [v4 objectForKey:@"HasCustomDismissAction"];
    -[UNCNotificationCategoryRecord setHasCustomDismissAction:](v5, "setHasCustomDismissAction:", [v9 BOOLValue]);

    v10 = [v4 objectForKey:@"HasFollowActivityAction"];
    -[UNCNotificationCategoryRecord setHasFollowActivityAction:](v5, "setHasFollowActivityAction:", [v10 BOOLValue]);

    v11 = [v4 objectForKey:@"HasCustomSilenceAction"];
    -[UNCNotificationCategoryRecord setHasCustomSilenceAction:](v5, "setHasCustomSilenceAction:", [v11 BOOLValue]);

    v12 = [v4 objectForKey:@"Identifier"];
    [(UNCNotificationCategoryRecord *)v5 setIdentifier:v12];

    v13 = [v4 objectForKey:@"IntentIdentifiers"];
    [(UNCNotificationCategoryRecord *)v5 setIntentIdentifiers:v13];

    v14 = [v4 objectForKey:@"ListPriority"];
    [(UNCNotificationCategoryRecord *)v5 setListPriority:v14];

    v15 = [v4 objectForKey:@"MinimalActions"];
    v16 = objc_msgSend(v15, "bs_map:", UNSDictionaryToNotificationActionRecord);
    [(UNCNotificationCategoryRecord *)v5 setMinimalActions:v16];

    v17 = [v4 objectForKey:@"ShouldAllowInCarPlay"];
    -[UNCNotificationCategoryRecord setShouldAllowInCarPlay:](v5, "setShouldAllowInCarPlay:", [v17 BOOLValue]);

    v18 = NSString;
    v19 = [v4 objectForKey:@"PrivateBody"];
    v20 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    v21 = objc_msgSend(v18, "bs_secureDecodedFromData:withAdditionalClasses:", v19, v20);
    [(UNCNotificationCategoryRecord *)v5 setPrivateBody:v21];

    v22 = [v4 objectForKey:@"PrivacyOptionShowTitle"];
    -[UNCNotificationCategoryRecord setPrivacyOptionShowTitle:](v5, "setPrivacyOptionShowTitle:", [v22 BOOLValue]);

    v23 = [v4 objectForKey:@"PrivacyOptionShowSubtitle"];
    -[UNCNotificationCategoryRecord setPrivacyOptionShowSubtitle:](v5, "setPrivacyOptionShowSubtitle:", [v23 BOOLValue]);

    v24 = [v4 objectForKey:@"PreventAutomaticRemovalFromRecent"];
    -[UNCNotificationCategoryRecord setPreventAutomaticRemovalFromRecent:](v5, "setPreventAutomaticRemovalFromRecent:", [v24 BOOLValue]);

    v25 = [v4 objectForKey:@"RevealAdditionalContentOnPresentation"];
    -[UNCNotificationCategoryRecord setRevealAdditionalContentWhenPresented:](v5, "setRevealAdditionalContentWhenPresented:", [v25 BOOLValue]);

    v26 = [v4 objectForKey:@"PreventAutomaticLock"];
    -[UNCNotificationCategoryRecord setPreventAutomaticLock:](v5, "setPreventAutomaticLock:", [v26 BOOLValue]);

    v27 = [v4 objectForKey:@"PreventDismissWhenClosed"];
    -[UNCNotificationCategoryRecord setPreventDismissWhenClosed:](v5, "setPreventDismissWhenClosed:", [v27 BOOLValue]);

    v28 = [v4 objectForKey:@"PresentFullScreenAlertOverList"];
    -[UNCNotificationCategoryRecord setPresentFullScreenAlertOverList:](v5, "setPresentFullScreenAlertOverList:", [v28 BOOLValue]);

    v29 = NSString;
    v30 = [v4 objectForKey:@"SummaryFormat"];
    v31 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
    v32 = objc_msgSend(v29, "bs_secureDecodedFromData:withAdditionalClasses:", v30, v31);
    [(UNCNotificationCategoryRecord *)v5 setSummaryFormat:v32];

    v33 = [v4 objectForKey:@"ShouldAllowActionsInCarPlay"];
    -[UNCNotificationCategoryRecord setShouldAllowActionsInCarPlay:](v5, "setShouldAllowActionsInCarPlay:", [v33 BOOLValue]);

    v34 = [v4 objectForKey:@"ShouldAllowPersistentBannersInCarPlay"];
    -[UNCNotificationCategoryRecord setShouldAllowPersistentBannersInCarPlay:](v5, "setShouldAllowPersistentBannersInCarPlay:", [v34 BOOLValue]);

    v35 = [v4 objectForKey:@"PlayMediaWhenRaised"];
    -[UNCNotificationCategoryRecord setPlayMediaWhenRaised:](v5, "setPlayMediaWhenRaised:", [v35 BOOLValue]);

    v36 = [v4 objectForKey:@"PreventClearFromList"];
    -[UNCNotificationCategoryRecord setPreventClearFromList:](v5, "setPreventClearFromList:", [v36 BOOLValue]);

    v37 = [v4 objectForKey:@"AlwaysDisplayNotificationsIndicator"];
    -[UNCNotificationCategoryRecord setAlwaysDisplayNotificationsIndicator:](v5, "setAlwaysDisplayNotificationsIndicator:", [v37 BOOLValue]);

    v38 = [v4 objectForKey:@"SuppressDelayForForwardedNotifications"];
    -[UNCNotificationCategoryRecord setSuppressDelayForForwardedNotifications:](v5, "setSuppressDelayForForwardedNotifications:", [v38 BOOLValue]);

    v39 = [v4 objectForKey:@"SuppressDismissActionInCarPlay"];
    -[UNCNotificationCategoryRecord setSuppressDismissActionInCarPlay:](v5, "setSuppressDismissActionInCarPlay:", [v39 BOOLValue]);

    v40 = [v4 objectForKey:@"SuppressPresentationInAmbient"];
    -[UNCNotificationCategoryRecord setSuppressPresentationInAmbient:](v5, "setSuppressPresentationInAmbient:", [v40 BOOLValue]);
  }
  return v5;
}

- (void)setSuppressPresentationInAmbient:(BOOL)a3
{
  self->_suppressPresentationInAmbient = a3;
}

- (void)setSuppressDismissActionInCarPlay:(BOOL)a3
{
  self->_suppressDismissActionInCarPlay = a3;
}

- (void)setSuppressDelayForForwardedNotifications:(BOOL)a3
{
  self->_suppressDelayForForwardedNotifications = a3;
}

- (void)setSummaryFormat:(id)a3
{
}

- (void)setShouldAllowPersistentBannersInCarPlay:(BOOL)a3
{
  self->_shouldAllowPersistentBannersInCarPlay = a3;
}

- (void)setShouldAllowInCarPlay:(BOOL)a3
{
  self->_shouldAllowInCarPlay = a3;
}

- (void)setShouldAllowActionsInCarPlay:(BOOL)a3
{
  self->_shouldAllowActionsInCarPlay = a3;
}

- (void)setRevealAdditionalContentWhenPresented:(BOOL)a3
{
  self->_revealAdditionalContentWhenPresented = a3;
}

- (void)setPrivateBody:(id)a3
{
}

- (void)setPrivacyOptionShowTitle:(BOOL)a3
{
  self->_privacyOptionShowTitle = a3;
}

- (void)setPrivacyOptionShowSubtitle:(BOOL)a3
{
  self->_privacyOptionShowSubtitle = a3;
}

- (void)setPreventDismissWhenClosed:(BOOL)a3
{
  self->_preventDismissWhenClosed = a3;
}

- (void)setPreventClearFromList:(BOOL)a3
{
  self->_preventClearFromList = a3;
}

- (void)setPreventAutomaticRemovalFromRecent:(BOOL)a3
{
  self->_preventAutomaticRemovalFromRecent = a3;
}

- (void)setPreventAutomaticLock:(BOOL)a3
{
  self->_preventAutomaticLock = a3;
}

- (void)setPresentFullScreenAlertOverList:(BOOL)a3
{
  self->_presentFullScreenAlertOverList = a3;
}

- (void)setPlayMediaWhenRaised:(BOOL)a3
{
  self->_playMediaWhenRaised = a3;
}

- (void)setListPriority:(id)a3
{
}

- (void)setIntentIdentifiers:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setHasFollowActivityAction:(BOOL)a3
{
  self->_hasFollowActivityAction = a3;
}

- (void)setHasCustomSilenceAction:(BOOL)a3
{
  self->_hasCustomSilenceAction = a3;
}

- (void)setHasCustomDismissAction:(BOOL)a3
{
  self->_hasCustomDismissAction = a3;
}

- (void)setBackgroundStyle:(id)a3
{
}

- (void)setAlwaysDisplayNotificationsIndicator:(BOOL)a3
{
  self->_alwaysDisplayNotificationsIndicator = a3;
}

- (void)setActions:(id)a3
{
}

- (void)setMinimalActions:(id)a3
{
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord hasCustomDismissAction](self, "hasCustomDismissAction"));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord hasFollowActivityAction](self, "hasFollowActivityAction"));
  id v6 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord hasCustomSilenceAction](self, "hasCustomSilenceAction"));
  id v7 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord shouldAllowInCarPlay](self, "shouldAllowInCarPlay"));
  id v8 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord privacyOptionShowTitle](self, "privacyOptionShowTitle"));
  id v9 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord privacyOptionShowSubtitle](self, "privacyOptionShowSubtitle"));
  v10 = [(UNCNotificationCategoryRecord *)self listPriority];
  id v11 = (id)[v3 appendObject:v10];

  id v12 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord preventAutomaticRemovalFromRecent](self, "preventAutomaticRemovalFromRecent"));
  id v13 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord revealAdditionalContentWhenPresented](self, "revealAdditionalContentWhenPresented"));
  id v14 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord preventAutomaticLock](self, "preventAutomaticLock"));
  id v15 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord preventDismissWhenClosed](self, "preventDismissWhenClosed"));
  id v16 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord presentFullScreenAlertOverList](self, "presentFullScreenAlertOverList"));
  id v17 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord shouldAllowActionsInCarPlay](self, "shouldAllowActionsInCarPlay"));
  id v18 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord shouldAllowPersistentBannersInCarPlay](self, "shouldAllowPersistentBannersInCarPlay"));
  v19 = [(UNCNotificationCategoryRecord *)self actions];
  id v20 = (id)[v3 appendObject:v19];

  v21 = [(UNCNotificationCategoryRecord *)self identifier];
  id v22 = (id)[v3 appendObject:v21];

  v23 = [(UNCNotificationCategoryRecord *)self intentIdentifiers];
  id v24 = (id)[v3 appendObject:v23];

  v25 = [(UNCNotificationCategoryRecord *)self minimalActions];
  id v26 = (id)[v3 appendObject:v25];

  v27 = [(UNCNotificationCategoryRecord *)self privateBody];
  id v28 = (id)[v3 appendObject:v27];

  v29 = [(UNCNotificationCategoryRecord *)self summaryFormat];
  id v30 = (id)[v3 appendObject:v29];

  v31 = [(UNCNotificationCategoryRecord *)self backgroundStyle];
  id v32 = (id)[v3 appendObject:v31];

  id v33 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord playMediaWhenRaised](self, "playMediaWhenRaised"));
  id v34 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord preventClearFromList](self, "preventClearFromList"));
  id v35 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord alwaysDisplayNotificationsIndicator](self, "alwaysDisplayNotificationsIndicator"));
  id v36 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord suppressDelayForForwardedNotifications](self, "suppressDelayForForwardedNotifications"));
  id v37 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord suppressDismissActionInCarPlay](self, "suppressDismissActionInCarPlay"));
  id v38 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationCategoryRecord suppressPresentationInAmbient](self, "suppressPresentationInAmbient"));
  unint64_t v39 = [v3 hash];

  return v39;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_27;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_27;
  }
  id v6 = [(UNCNotificationCategoryRecord *)self actions];
  id v7 = [v4 actions];
  int v8 = UNEqualObjects();

  if (!v8) {
    goto LABEL_27;
  }
  int v9 = [(UNCNotificationCategoryRecord *)self hasCustomDismissAction];
  if (v9 != [v4 hasCustomDismissAction]) {
    goto LABEL_27;
  }
  int v10 = [(UNCNotificationCategoryRecord *)self hasFollowActivityAction];
  if (v10 != [v4 hasFollowActivityAction]) {
    goto LABEL_27;
  }
  int v11 = [(UNCNotificationCategoryRecord *)self hasCustomSilenceAction];
  if (v11 != [v4 hasCustomSilenceAction]) {
    goto LABEL_27;
  }
  id v12 = [(UNCNotificationCategoryRecord *)self identifier];
  id v13 = [v4 identifier];
  int v14 = UNEqualObjects();

  if (!v14) {
    goto LABEL_27;
  }
  id v15 = [(UNCNotificationCategoryRecord *)self intentIdentifiers];
  id v16 = [v4 intentIdentifiers];
  int v17 = UNEqualObjects();

  if (!v17) {
    goto LABEL_27;
  }
  id v18 = [(UNCNotificationCategoryRecord *)self listPriority];
  v19 = [v4 listPriority];
  int v20 = UNEqualObjects();

  if (!v20) {
    goto LABEL_27;
  }
  v21 = [(UNCNotificationCategoryRecord *)self minimalActions];
  id v22 = [v4 minimalActions];
  int v23 = UNEqualObjects();

  if (!v23) {
    goto LABEL_27;
  }
  int v24 = [(UNCNotificationCategoryRecord *)self shouldAllowInCarPlay];
  if (v24 != [v4 shouldAllowInCarPlay]) {
    goto LABEL_27;
  }
  v25 = [(UNCNotificationCategoryRecord *)self privateBody];
  id v26 = [v4 privateBody];
  int v27 = UNEqualObjects();

  if (!v27) {
    goto LABEL_27;
  }
  int v28 = [(UNCNotificationCategoryRecord *)self privacyOptionShowTitle];
  if (v28 != [v4 privacyOptionShowTitle]) {
    goto LABEL_27;
  }
  int v29 = [(UNCNotificationCategoryRecord *)self privacyOptionShowSubtitle];
  if (v29 != [v4 privacyOptionShowSubtitle]) {
    goto LABEL_27;
  }
  int v30 = [(UNCNotificationCategoryRecord *)self preventAutomaticRemovalFromRecent];
  if (v30 != [v4 preventAutomaticRemovalFromRecent]) {
    goto LABEL_27;
  }
  int v31 = [(UNCNotificationCategoryRecord *)self revealAdditionalContentWhenPresented];
  if (v31 != [v4 revealAdditionalContentWhenPresented]) {
    goto LABEL_27;
  }
  int v32 = [(UNCNotificationCategoryRecord *)self preventDismissWhenClosed];
  if (v32 != [v4 preventDismissWhenClosed]) {
    goto LABEL_27;
  }
  id v33 = [(UNCNotificationCategoryRecord *)self summaryFormat];
  id v34 = [v4 summaryFormat];
  int v35 = UNEqualObjects();

  if (!v35) {
    goto LABEL_27;
  }
  id v36 = [(UNCNotificationCategoryRecord *)self backgroundStyle];
  id v37 = [v4 backgroundStyle];
  int v38 = UNEqualObjects();

  if (!v38) {
    goto LABEL_27;
  }
  int v39 = [(UNCNotificationCategoryRecord *)self shouldAllowActionsInCarPlay];
  if (v39 == [v4 shouldAllowActionsInCarPlay]
    && (v40 = -[UNCNotificationCategoryRecord shouldAllowPersistentBannersInCarPlay](self, "shouldAllowPersistentBannersInCarPlay"), v40 == [v4 shouldAllowPersistentBannersInCarPlay])&& (v41 = -[UNCNotificationCategoryRecord playMediaWhenRaised](self, "playMediaWhenRaised"), v41 == objc_msgSend(v4, "playMediaWhenRaised"))&& (int v42 = -[UNCNotificationCategoryRecord preventClearFromList](self, "preventClearFromList"), v42 == objc_msgSend(v4, "preventClearFromList"))&& (v43 = -[UNCNotificationCategoryRecord alwaysDisplayNotificationsIndicator](self, "alwaysDisplayNotificationsIndicator"), v43 == objc_msgSend(v4, "alwaysDisplayNotificationsIndicator"))&& (v44 = -[UNCNotificationCategoryRecord suppressDelayForForwardedNotifications](self, "suppressDelayForForwardedNotifications"), v44 == objc_msgSend(v4, "suppressDelayForForwardedNotifications"))&& (v45 = -[UNCNotificationCategoryRecord suppressDismissActionInCarPlay](self, "suppressDismissActionInCarPlay"), v45 == objc_msgSend(v4, "suppressDismissActionInCarPlay")))
  {
    BOOL v48 = [(UNCNotificationCategoryRecord *)self suppressPresentationInAmbient];
    int v46 = v48 ^ [v4 suppressPresentationInAmbient] ^ 1;
  }
  else
  {
LABEL_27:
    LOBYTE(v46) = 0;
  }

  return v46;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSString)summaryFormat
{
  return self->_summaryFormat;
}

- (BOOL)shouldAllowInCarPlay
{
  return self->_shouldAllowInCarPlay;
}

- (NSString)privateBody
{
  return self->_privateBody;
}

- (BOOL)privacyOptionShowTitle
{
  return self->_privacyOptionShowTitle;
}

- (BOOL)privacyOptionShowSubtitle
{
  return self->_privacyOptionShowSubtitle;
}

- (NSArray)minimalActions
{
  return self->_minimalActions;
}

- (NSArray)intentIdentifiers
{
  return self->_intentIdentifiers;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)hasFollowActivityAction
{
  return self->_hasFollowActivityAction;
}

- (BOOL)hasCustomSilenceAction
{
  return self->_hasCustomSilenceAction;
}

- (BOOL)hasCustomDismissAction
{
  return self->_hasCustomDismissAction;
}

- (NSString)backgroundStyle
{
  return self->_backgroundStyle;
}

- (BOOL)suppressPresentationInAmbient
{
  return self->_suppressPresentationInAmbient;
}

- (BOOL)suppressDismissActionInCarPlay
{
  return self->_suppressDismissActionInCarPlay;
}

- (BOOL)suppressDelayForForwardedNotifications
{
  return self->_suppressDelayForForwardedNotifications;
}

- (BOOL)shouldAllowPersistentBannersInCarPlay
{
  return self->_shouldAllowPersistentBannersInCarPlay;
}

- (BOOL)shouldAllowActionsInCarPlay
{
  return self->_shouldAllowActionsInCarPlay;
}

- (BOOL)revealAdditionalContentWhenPresented
{
  return self->_revealAdditionalContentWhenPresented;
}

- (BOOL)preventDismissWhenClosed
{
  return self->_preventDismissWhenClosed;
}

- (BOOL)preventClearFromList
{
  return self->_preventClearFromList;
}

- (BOOL)preventAutomaticRemovalFromRecent
{
  return self->_preventAutomaticRemovalFromRecent;
}

- (BOOL)playMediaWhenRaised
{
  return self->_playMediaWhenRaised;
}

- (NSString)listPriority
{
  return self->_listPriority;
}

- (BOOL)alwaysDisplayNotificationsIndicator
{
  return self->_alwaysDisplayNotificationsIndicator;
}

- (BOOL)preventAutomaticLock
{
  return self->_preventAutomaticLock;
}

- (BOOL)presentFullScreenAlertOverList
{
  return self->_presentFullScreenAlertOverList;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(UNCNotificationCategoryRecord *)self actions];
  uint64_t v5 = objc_msgSend(v4, "bs_map:", UNCNotificationActionRecordToDictionary);
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v5, @"Actions");

  id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord hasCustomDismissAction](self, "hasCustomDismissAction"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v6, @"HasCustomDismissAction");

  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord hasFollowActivityAction](self, "hasFollowActivityAction"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v7, @"HasFollowActivityAction");

  int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord hasCustomSilenceAction](self, "hasCustomSilenceAction"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v8, @"HasCustomSilenceAction");

  int v9 = [(UNCNotificationCategoryRecord *)self identifier];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v9, @"Identifier");

  int v10 = [(UNCNotificationCategoryRecord *)self intentIdentifiers];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v10, @"IntentIdentifiers");

  int v11 = [(UNCNotificationCategoryRecord *)self minimalActions];
  id v12 = objc_msgSend(v11, "bs_map:", UNCNotificationActionRecordToDictionary);
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v12, @"MinimalActions");

  id v13 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord shouldAllowInCarPlay](self, "shouldAllowInCarPlay"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v13, @"ShouldAllowInCarPlay");

  int v14 = [(UNCNotificationCategoryRecord *)self privateBody];
  id v15 = objc_msgSend(v14, "bs_secureEncoded");
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v15, @"PrivateBody");

  id v16 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord privacyOptionShowTitle](self, "privacyOptionShowTitle"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v16, @"PrivacyOptionShowTitle");

  int v17 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord privacyOptionShowSubtitle](self, "privacyOptionShowSubtitle"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v17, @"PrivacyOptionShowSubtitle");

  id v18 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord preventAutomaticRemovalFromRecent](self, "preventAutomaticRemovalFromRecent"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v18, @"PreventAutomaticRemovalFromRecent");

  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord revealAdditionalContentWhenPresented](self, "revealAdditionalContentWhenPresented"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v19, @"RevealAdditionalContentOnPresentation");

  int v20 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord preventAutomaticLock](self, "preventAutomaticLock"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v20, @"PreventAutomaticLock");

  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord preventDismissWhenClosed](self, "preventDismissWhenClosed"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v21, @"PreventDismissWhenClosed");

  id v22 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord presentFullScreenAlertOverList](self, "presentFullScreenAlertOverList"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v22, @"PresentFullScreenAlertOverList");

  int v23 = [(UNCNotificationCategoryRecord *)self summaryFormat];
  int v24 = objc_msgSend(v23, "bs_secureEncoded");
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v24, @"SummaryFormat");

  v25 = [(UNCNotificationCategoryRecord *)self backgroundStyle];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v25, @"BackgroundStyle");

  id v26 = [(UNCNotificationCategoryRecord *)self listPriority];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v26, @"ListPriority");

  int v27 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord shouldAllowActionsInCarPlay](self, "shouldAllowActionsInCarPlay"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v27, @"ShouldAllowActionsInCarPlay");

  int v28 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord shouldAllowPersistentBannersInCarPlay](self, "shouldAllowPersistentBannersInCarPlay"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v28, @"ShouldAllowPersistentBannersInCarPlay");

  int v29 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord playMediaWhenRaised](self, "playMediaWhenRaised"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v29, @"PlayMediaWhenRaised");

  int v30 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord preventClearFromList](self, "preventClearFromList"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v30, @"PreventClearFromList");

  int v31 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord alwaysDisplayNotificationsIndicator](self, "alwaysDisplayNotificationsIndicator"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v31, @"AlwaysDisplayNotificationsIndicator");

  int v32 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord suppressDelayForForwardedNotifications](self, "suppressDelayForForwardedNotifications"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v32, @"SuppressDelayForForwardedNotifications");

  id v33 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord suppressDismissActionInCarPlay](self, "suppressDismissActionInCarPlay"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v33, @"SuppressDismissActionInCarPlay");

  id v34 = objc_msgSend(NSNumber, "numberWithBool:", -[UNCNotificationCategoryRecord suppressPresentationInAmbient](self, "suppressPresentationInAmbient"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v34, @"SuppressPresentationInAmbient");

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(UNCNotificationCategoryRecord *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"Identifier"];

  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord hasCustomDismissAction](self, "hasCustomDismissAction"), @"HasCustomDismissAction");
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord hasFollowActivityAction](self, "hasFollowActivityAction"), @"HasFollowActivityAction");
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord hasCustomSilenceAction](self, "hasCustomSilenceAction"), @"HasCustomSilenceAction");
  int v9 = [(UNCNotificationCategoryRecord *)self actions];
  id v10 = (id)[v3 appendObject:v9 withName:@"Actions"];

  int v11 = [(UNCNotificationCategoryRecord *)self listPriority];
  id v12 = (id)[v3 appendObject:v11 withName:@"ListPriority"];

  id v13 = [(UNCNotificationCategoryRecord *)self minimalActions];
  id v14 = (id)[v3 appendObject:v13 withName:@"MinimalActions"];

  id v15 = [(UNCNotificationCategoryRecord *)self intentIdentifiers];
  id v16 = (id)[v3 appendObject:v15 withName:@"IntentIdentifiers"];

  id v17 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord shouldAllowInCarPlay](self, "shouldAllowInCarPlay"), @"ShouldAllowInCarPlay");
  id v18 = [(UNCNotificationCategoryRecord *)self privateBody];
  id v19 = (id)[v3 appendObject:v18 withName:@"PrivateBody"];

  id v20 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord privacyOptionShowTitle](self, "privacyOptionShowTitle"), @"PrivacyOptionShowTitle");
  id v21 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord privacyOptionShowSubtitle](self, "privacyOptionShowSubtitle"), @"PrivacyOptionShowSubtitle");
  id v22 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord preventAutomaticRemovalFromRecent](self, "preventAutomaticRemovalFromRecent"), @"PreventAutomaticRemovalFromRecent");
  id v23 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord revealAdditionalContentWhenPresented](self, "revealAdditionalContentWhenPresented"), @"RevealAdditionalContentOnPresentation");
  id v24 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord preventAutomaticLock](self, "preventAutomaticLock"), @"PreventAutomaticLock");
  id v25 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord presentFullScreenAlertOverList](self, "presentFullScreenAlertOverList"), @"PresentFullScreenAlertOverList");
  id v26 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord preventDismissWhenClosed](self, "preventDismissWhenClosed"), @"PreventDismissWhenClosed");
  int v27 = [(UNCNotificationCategoryRecord *)self summaryFormat];
  id v28 = (id)[v3 appendObject:v27 withName:@"SummaryFormat"];

  int v29 = [(UNCNotificationCategoryRecord *)self backgroundStyle];
  id v30 = (id)[v3 appendObject:v29 withName:@"BackgroundStyle"];

  id v31 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord shouldAllowActionsInCarPlay](self, "shouldAllowActionsInCarPlay"), @"ShouldAllowActionsInCarPlay");
  id v32 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord shouldAllowPersistentBannersInCarPlay](self, "shouldAllowPersistentBannersInCarPlay"), @"ShouldAllowPersistentBannersInCarPlay");
  id v33 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord playMediaWhenRaised](self, "playMediaWhenRaised"), @"PlayMediaWhenRaised");
  id v34 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord preventClearFromList](self, "preventClearFromList"), @"PreventClearFromList");
  id v35 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord alwaysDisplayNotificationsIndicator](self, "alwaysDisplayNotificationsIndicator"), @"AlwaysDisplayNotificationsIndicator");
  id v36 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord suppressDelayForForwardedNotifications](self, "suppressDelayForForwardedNotifications"), @"SuppressDelayForForwardedNotifications");
  id v37 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord suppressDismissActionInCarPlay](self, "suppressDismissActionInCarPlay"), @"SuppressDismissActionInCarPlay");
  id v38 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationCategoryRecord suppressPresentationInAmbient](self, "suppressPresentationInAmbient"), @"SuppressPresentationInAmbient");
  int v39 = [v3 build];

  return v39;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCNotificationCategoryRecord *)self dictionaryRepresentation];
  [v4 encodeObject:v5 forKey:@"dictionary"];
}

- (UNCNotificationCategoryRecord)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:7];
  id v7 = objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14, v15, v16);

  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"dictionary"];

  int v9 = [[UNCNotificationCategoryRecord alloc] initWithDictionaryRepresentation:v8];
  return v9;
}

@end