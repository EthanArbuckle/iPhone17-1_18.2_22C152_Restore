@interface _ICQFollowupSpecification
+ (id)sharedFollowUpController;
+ (void)clearFollowupWithController:(id)a3 offerType:(int64_t)a4 completion:(id)a5;
+ (void)clearLegacyFollowupWithController:(id)a3;
+ (void)clearNotificationWithController:(id)a3 offerType:(int64_t)a4 completion:(id)a5;
- (BOOL)badgeApp;
- (BOOL)eventOffer;
- (BOOL)isForAccountGroup;
- (BOOL)isZeroAction;
- (BOOL)premiumOffer;
- (ICQLink)noteActivateLink;
- (ICQLink)noteClearLink;
- (NSArray)links;
- (NSDictionary)serverDict;
- (NSString)altMessage;
- (NSString)altNoteMessage;
- (NSString)groupIdentifier;
- (NSString)message;
- (NSString)noteMessage;
- (NSString)noteSubTitle;
- (NSString)noteTitle;
- (NSString)notifyingAppId;
- (NSString)offerId;
- (NSString)purchaseAttribution;
- (NSString)sfSymbolBundlePath;
- (NSString)sfSymbolID;
- (NSString)title;
- (NSURL)dynamicUIRouteURL;
- (NSURL)serverUIURL;
- (_ICQFollowupSpecification)init;
- (_ICQFollowupSpecification)initWithServerDictionary:(id)a3;
- (id)_buildFollowupItem;
- (id)followupActionForLink:(id)a3;
- (id)followupActionForLink:(id)a3 needsFlow:(BOOL)a4;
- (id)identifierPrefix;
- (int64_t)followupDisplayStyle;
- (int64_t)primaryAction;
- (void)_postFollowupWithController:(id)a3 completion:(id)a4;
- (void)addNotifyingAppIdForItem:(id)a3;
- (void)postFollowupWithController:(id)a3;
- (void)postFollowupWithController:(id)a3 replaceExisting:(BOOL)a4 completion:(id)a5;
- (void)setAltMessage:(id)a3;
- (void)setAltNoteMessage:(id)a3;
- (void)setBadgeApp:(BOOL)a3;
- (void)setEventOffer:(BOOL)a3;
- (void)setFollowupDisplayStyle:(int64_t)a3;
- (void)setForAccountGroup:(BOOL)a3;
- (void)setGroupIdentifier:(id)a3;
- (void)setLinks:(id)a3;
- (void)setMessage:(id)a3;
- (void)setNoteActivateLink:(id)a3;
- (void)setNoteClearLink:(id)a3;
- (void)setNoteMessage:(id)a3;
- (void)setNoteSubTitle:(id)a3;
- (void)setNoteTitle:(id)a3;
- (void)setNotifyingAppId:(id)a3;
- (void)setOfferId:(id)a3;
- (void)setPremiumOffer:(BOOL)a3;
- (void)setServerDict:(id)a3;
- (void)setSfSymbolBundlePath:(id)a3;
- (void)setSfSymbolID:(id)a3;
- (void)setTitle:(id)a3;
- (void)setZeroAction:(BOOL)a3;
@end

@implementation _ICQFollowupSpecification

+ (void)clearLegacyFollowupWithController:(id)a3
{
  v7[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (+[_ICQHelperFunctions userDefaultsBoolValueForKey:@"_ICQLegacyQuotaFollowupCleanup.2"])
  {
    v4 = _ICQGetLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      +[_ICQFollowupSpecification clearLegacyFollowupWithController:](v4);
    }
  }
  else
  {
    +[_ICQHelperFunctions setUserDefaultsBool:1 forKey:@"_ICQLegacyQuotaFollowupCleanup.2"];
    v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Clearing legacy ICQFollowup items", v6, 2u);
    }

    v7[0] = @"com.apple.iCloudQuotaDaemon.ICQFollowup";
    v7[1] = @"com.apple.iCloudQuotaDaemon.StorageManagement.followup";
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
    [v3 clearPendingFollowUpItemsWithUniqueIdentifiers:v4 completion:&__block_literal_global_20];
  }
}

- (_ICQFollowupSpecification)init
{
  v6.receiver = self;
  v6.super_class = (Class)_ICQFollowupSpecification;
  v2 = [(_ICQFollowupSpecification *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    links = v2->_links;
    v2->_links = (NSArray *)MEMORY[0x1E4F1CBF0];

    *(_WORD *)&v3->_premiumOffer = 0;
  }
  return v3;
}

- (_ICQFollowupSpecification)initWithServerDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(_ICQFollowupSpecification *)self init];
  if (v5)
  {
    objc_super v6 = [v4 objectForKeyedSubscript:@"followUpInfo"];
    [(_ICQFollowupSpecification *)v5 setServerDict:v6];

    v7 = [v4 objectForKeyedSubscript:@"badgeApp"];
    v5->_badgeApp = _ICQBooleanForServerObjectDefault(v7, 1);

    v8 = [v4 objectForKeyedSubscript:@"isPremiumOffer"];
    v5->_premiumOffer = _ICQBooleanForServerObjectDefault(v8, 0);

    v9 = [v4 objectForKeyedSubscript:@"isEventOffer"];
    v5->_eventOffer = _ICQBooleanForServerObjectDefault(v9, 0);

    uint64_t v10 = _ICQStringForKey(v4, @"offerId");
    offerId = v5->_offerId;
    v5->_offerId = (NSString *)v10;
  }
  return v5;
}

- (id)identifierPrefix
{
  if ([(_ICQFollowupSpecification *)self premiumOffer])
  {
    id v3 = _ICQIdentifierPrefixPremium;
  }
  else
  {
    BOOL v4 = [(_ICQFollowupSpecification *)self eventOffer];
    id v3 = _ICQIdentifierPrefixRegular;
    if (v4) {
      id v3 = _ICQIdentifierPrefixEvent;
    }
  }
  v5 = *v3;
  return v5;
}

- (id)followupActionForLink:(id)a3
{
  return [(_ICQFollowupSpecification *)self followupActionForLink:a3 needsFlow:0];
}

- (id)followupActionForLink:(id)a3 needsFlow:(BOOL)a4
{
  v29[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = [v5 parameters];
  v7 = [v6 objectForKeyedSubscript:@"skipCFU"];

  v8 = [v5 parameters];
  v9 = [v8 objectForKeyedSubscript:@"dismissLockScreen"];

  if ([v7 isEqualToString:@"true"])
  {
    uint64_t v10 = _ICQGetLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[_ICQFollowupSpecification followupActionForLink:needsFlow:]((uint64_t)v5, v10);
    }

    v11 = [MEMORY[0x1E4F290C8] queryItemWithName:@"context" value:@"skipCFU"];
    v12 = (void *)MEMORY[0x1E4F290C8];
    v13 = [(_ICQFollowupSpecification *)self identifierPrefix];
    v14 = [v12 queryItemWithName:@"followUpItemIdentifier" value:v13];

    v15 = [MEMORY[0x1E4F290C8] queryItemWithName:@"dismissLockScreen" value:v9];
    v16 = [MEMORY[0x1E4F290C8] queryItemWithName:@"ServerLinkId" value:@"lockscreen"];
    v17 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://icq.icloud.com"];
    v29[0] = v11;
    v29[1] = v14;
    v29[2] = v15;
    v29[3] = v16;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
    v19 = objc_msgSend(v17, "icq_URLByAppendingQueryItems:", v18);
  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)MEMORY[0x1E4F5B760];
  v21 = [v5 text];
  v22 = [v20 actionWithLabel:v21 url:v19];

  v23 = _ICQStringForAction([v5 action]);
  v27[0] = @"ICQLinkAction";
  v27[1] = @"ICQLinkParameters";
  v28[0] = v23;
  v24 = [v5 parameters];
  v28[1] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  [v22 setUserInfo:v25];

  return v22;
}

- (NSURL)serverUIURL
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_links;
  id v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_super v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "serverUIURL", (void)v9);

        if (v7)
        {
          id v3 = [v6 serverUIURL];
          goto LABEL_11;
        }
      }
      id v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (NSURL *)v3;
}

- (NSURL)dynamicUIRouteURL
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_links;
  id v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_super v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "dynamicUIRouteURL", (void)v9);

        if (v7)
        {
          id v3 = [v6 dynamicUIRouteURL];
          goto LABEL_11;
        }
      }
      id v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (NSURL *)v3;
}

- (NSString)purchaseAttribution
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_links;
  id v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_super v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "purchaseAttribution", (void)v9);

        if (v7)
        {
          id v3 = [v6 purchaseAttribution];
          goto LABEL_11;
        }
      }
      id v3 = (void *)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (NSString *)v3;
}

- (void)postFollowupWithController:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_ICQFollowupSpecification *)self identifierPrefix];
  v19[0] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v4 clearPendingFollowUpItemsWithUniqueIdentifiers:v6 error:0];

  v7 = [(_ICQFollowupSpecification *)self _buildFollowupItem];
  id v12 = 0;
  [v4 postFollowUpItem:v7 error:&v12];

  id v8 = v12;
  long long v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = [v7 title];
    long long v11 = [v7 groupIdentifier];
    *(_DWORD *)buf = 138412802;
    uint64_t v14 = v10;
    __int16 v15 = 2112;
    v16 = v11;
    __int16 v17 = 2112;
    id v18 = v8;
    _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "Posted ICQFollowup item (title:%@ group:%@) with error: %@", buf, 0x20u);
  }
}

- (void)postFollowupWithController:(id)a3 replaceExisting:(BOOL)a4 completion:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v10 = v9;
  if (a4)
  {
    long long v11 = [(_ICQFollowupSpecification *)self identifierPrefix];
    v16[0] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v8 clearPendingFollowUpItemsWithUniqueIdentifiers:v12 error:0];

    [(_ICQFollowupSpecification *)self _postFollowupWithController:v8 completion:v10];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83___ICQFollowupSpecification_postFollowupWithController_replaceExisting_completion___block_invoke;
    v13[3] = &unk_1E6A53728;
    v13[4] = self;
    id v15 = v9;
    id v14 = v8;
    [v14 pendingFollowUpItemsWithCompletion:v13];
  }
}

- (void)_postFollowupWithController:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_ICQFollowupSpecification *)self _buildFollowupItem];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68___ICQFollowupSpecification__postFollowupWithController_completion___block_invoke;
  v11[3] = &unk_1E6A526A0;
  id v12 = v8;
  id v13 = v6;
  id v9 = v6;
  id v10 = v8;
  [v7 postFollowUpItem:v10 completion:v11];
}

- (id)_buildFollowupItem
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "Building followup item", buf, 2u);
  }

  id v4 = objc_opt_new();
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v5 = [(_ICQFollowupSpecification *)self links];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        long long v11 = [(_ICQFollowupSpecification *)self noteActivateLink];
        id v12 = [(_ICQFollowupSpecification *)self followupActionForLink:v10 needsFlow:v10 == v11];
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v7);
  }

  id v13 = [(_ICQFollowupSpecification *)self noteTitle];
  if (![v13 length])
  {

    goto LABEL_18;
  }
  id v14 = [(_ICQFollowupSpecification *)self noteMessage];
  uint64_t v15 = [v14 length];

  if (!v15)
  {
LABEL_18:
    v16 = 0;
    goto LABEL_19;
  }
  v16 = objc_opt_new();
  __int16 v17 = [(_ICQFollowupSpecification *)self noteTitle];
  [v16 setTitle:v17];

  id v18 = [(_ICQFollowupSpecification *)self noteSubTitle];
  [v16 setSubtitleText:v18];

  v19 = [(_ICQFollowupSpecification *)self noteMessage];
  v20 = [(_ICQFollowupSpecification *)self altNoteMessage];
  v21 = +[ICQDaemonOffer stringWithPlaceholderFormat:v19 alternateString:v20];
  [v16 setInformativeText:v21];

  v22 = [(_ICQFollowupSpecification *)self noteActivateLink];

  if (v22)
  {
    v23 = [(_ICQFollowupSpecification *)self noteActivateLink];
    v24 = [(_ICQFollowupSpecification *)self followupActionForLink:v23 needsFlow:1];
    [v16 setActivateAction:v24];
  }
  v25 = [(_ICQFollowupSpecification *)self noteClearLink];

  if (v25)
  {
    v26 = [(_ICQFollowupSpecification *)self noteClearLink];
    v27 = [(_ICQFollowupSpecification *)self followupActionForLink:v26];
    [v16 setClearAction:v27];
  }
  [v16 setFrequency:INFINITY];
LABEL_19:
  v28 = objc_opt_new();
  v29 = [(_ICQFollowupSpecification *)self identifierPrefix];
  [v28 setUniqueIdentifier:v29];

  v30 = [(_ICQFollowupSpecification *)self title];
  [v28 setTitle:v30];

  v31 = [(_ICQFollowupSpecification *)self message];
  v32 = [(_ICQFollowupSpecification *)self altMessage];
  v33 = +[ICQDaemonOffer stringWithPlaceholderFormat:v31 alternateString:v32];
  [v28 setInformativeText:v33];

  [v28 setActions:v4];
  [v28 setNotification:v16];
  [v28 setExtensionIdentifier:@"com.apple.iCloudQuota.ICQFollowup"];
  [(_ICQFollowupSpecification *)self addNotifyingAppIdForItem:v28];
  v34 = [v28 userInfo];

  if (v34)
  {
    v35 = [v28 userInfo];
    v36 = (void *)[v35 mutableCopy];

    v37 = [(_ICQFollowupSpecification *)self offerId];
    [v36 setObject:v37 forKeyedSubscript:@"offerId"];

    [v28 setUserInfo:v36];
  }
  else
  {
    v55 = @"offerId";
    v36 = [(_ICQFollowupSpecification *)self offerId];
    v56 = v36;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    [v28 setUserInfo:v38];
  }
  if ([(_ICQFollowupSpecification *)self isForAccountGroup]) {
    [v28 setGroupIdentifier:*MEMORY[0x1E4F5B718]];
  }
  if ([(_ICQFollowupSpecification *)self isZeroAction]) {
    objc_msgSend(v28, "setDisplayStyle:", objc_msgSend(v28, "displayStyle") | 2);
  }
  if (![(_ICQFollowupSpecification *)self badgeApp])
  {
    v39 = _ICQGetLogSystem();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v39, OS_LOG_TYPE_DEFAULT, "not badging app", buf, 2u);
    }

    objc_msgSend(v28, "setDisplayStyle:", objc_msgSend(v28, "displayStyle") | 0x10);
  }
  if ([(_ICQFollowupSpecification *)self followupDisplayStyle] == 1)
  {
    [v28 setGroupIdentifier:*MEMORY[0x1E4F5B738]];
    objc_msgSend(v28, "setDisplayStyle:", objc_msgSend(v28, "displayStyle") | 0x12);
  }
  v40 = [(_ICQFollowupSpecification *)self groupIdentifier];

  if (v40)
  {
    v41 = [(_ICQFollowupSpecification *)self groupIdentifier];
    v42 = +[_ICQHelperFunctions followUpGroupIdentifierForString:v41];

    v43 = _ICQGetLogSystem();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v42;
      _os_log_impl(&dword_1D5851000, v43, OS_LOG_TYPE_DEFAULT, "Setting CFU group identifier to %@", buf, 0xCu);
    }

    [v28 setGroupIdentifier:v42];
  }
  v44 = [(_ICQFollowupSpecification *)self sfSymbolID];

  if (v44)
  {
    v45 = [(_ICQFollowupSpecification *)self sfSymbolID];
    [v28 setBundleIconName:v45];
  }
  v46 = [(_ICQFollowupSpecification *)self sfSymbolBundlePath];

  if (v46)
  {
    v47 = [(_ICQFollowupSpecification *)self sfSymbolBundlePath];
    [v28 setRepresentingBundlePath:v47];
  }
  return v28;
}

+ (void)clearFollowupWithController:(id)a3 offerType:(int64_t)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a3;
  id v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = +[_ICQHelperFunctions _getOfferDescriptionFromRequestType:a4];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v10;
    _os_log_impl(&dword_1D5851000, v9, OS_LOG_TYPE_DEFAULT, "Clearing ICQFollowup items for offerType %@", buf, 0xCu);
  }
  long long v11 = +[_ICQHelperFunctions followUpIdentifierPrefixForRequestType:a4];
  id v13 = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  [v8 clearPendingFollowUpItemsWithUniqueIdentifiers:v12 completion:v7];
}

+ (id)sharedFollowUpController
{
  if (sharedFollowUpController_onceToken != -1) {
    dispatch_once(&sharedFollowUpController_onceToken, &__block_literal_global_74);
  }
  v2 = (void *)sharedFollowUpController_controller;
  return v2;
}

+ (void)clearNotificationWithController:(id)a3 offerType:(int64_t)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[_ICQHelperFunctions followUpIdentifierPrefixForRequestType:a4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82___ICQFollowupSpecification_clearNotificationWithController_offerType_completion___block_invoke;
  v13[3] = &unk_1E6A53750;
  id v14 = v9;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  id v12 = v9;
  [v11 pendingFollowUpItemsWithCompletion:v13];
}

- (NSDictionary)serverDict
{
  return self->_serverDict;
}

- (void)setServerDict:(id)a3
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_serverDict, a3);
  uint64_t v6 = [v5 objectForKeyedSubscript:@"title"];
  [(_ICQFollowupSpecification *)self setTitle:v6];

  id v7 = [v5 objectForKeyedSubscript:@"mesg"];
  if (v7)
  {
    [(_ICQFollowupSpecification *)self setMessage:v7];
  }
  else
  {
    id v8 = [v5 objectForKeyedSubscript:@"message"];
    [(_ICQFollowupSpecification *)self setMessage:v8];
  }
  id v9 = [v5 objectForKeyedSubscript:@"altMesg"];
  if (v9)
  {
    [(_ICQFollowupSpecification *)self setAltMessage:v9];
  }
  else
  {
    id v10 = [v5 objectForKeyedSubscript:@"altMessage"];
    [(_ICQFollowupSpecification *)self setAltMessage:v10];
  }
  id v11 = [(_ICQFollowupSpecification *)self message];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v13 = [(_ICQFollowupSpecification *)self message];

    if (v13)
    {
      id v14 = _ICQGetLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (objc_class *)objc_opt_class();
        Name = class_getName(v15);
        __int16 v17 = [(_ICQFollowupSpecification *)self message];
        *(_DWORD *)buf = 136315394;
        v88 = Name;
        __int16 v89 = 2112;
        v90 = v17;
        _os_log_impl(&dword_1D5851000, v14, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
    [(_ICQFollowupSpecification *)self setMessage:0];
  }
  id v18 = [(_ICQFollowupSpecification *)self altMessage];
  objc_opt_class();
  char v19 = objc_opt_isKindOfClass();

  if ((v19 & 1) == 0)
  {
    v20 = [(_ICQFollowupSpecification *)self altMessage];

    if (v20)
    {
      v21 = _ICQGetLogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (objc_class *)objc_opt_class();
        v23 = class_getName(v22);
        v24 = [(_ICQFollowupSpecification *)self altMessage];
        *(_DWORD *)buf = 136315394;
        v88 = v23;
        __int16 v89 = 2112;
        v90 = v24;
        _os_log_impl(&dword_1D5851000, v21, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
    [(_ICQFollowupSpecification *)self setAltMessage:0];
  }
  v25 = [v5 objectForKeyedSubscript:@"actions"];
  v26 = v25;
  v78 = self;
  if (v25)
  {
    id v27 = v25;
  }
  else
  {
    id v27 = [v5 objectForKeyedSubscript:@"Actions"];
  }
  v28 = v27;
  v79 = v5;

  id v29 = v28;
  v82 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v29, "count"));
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  id v30 = v29;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v83 objects:buf count:16];
  v81 = v30;
  if (v31)
  {
    uint64_t v32 = v31;
    id v80 = 0;
    id v33 = 0;
    uint64_t v34 = *(void *)v84;
    while (1)
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v84 != v34) {
          objc_enumerationMutation(v30);
        }
        v36 = *(void **)(*((void *)&v83 + 1) + 8 * v35);
        v37 = _ICQLinkForServerMessageParameter(v36);
        if (v37)
        {
          [v82 addObject:v37];
          id v38 = v36;
          v39 = [v38 objectForKeyedSubscript:@"btnDefault"];
          v40 = v39;
          if (v39)
          {
            id v41 = v39;
          }
          else
          {
            id v41 = [v38 objectForKeyedSubscript:@"BtnDefault"];
          }
          v42 = v41;

          if (objc_opt_respondsToSelector())
          {
            int v43 = [v42 BOOLValue];

            if (v43) {
              id v80 = v37;
            }
          }
          else
          {
          }
          id v44 = v38;
          v45 = [v44 objectForKeyedSubscript:@"btnId"];
          if ([v45 isEqualToString:@"dlCancel"]) {
            goto LABEL_38;
          }
          v46 = [v44 objectForKeyedSubscript:@"btnId"];
          if ([v46 isEqualToString:@"cancelled"])
          {

LABEL_38:
LABEL_39:
            id v33 = v37;
            goto LABEL_40;
          }
          v47 = [v44 objectForKeyedSubscript:@"btnAction"];
          char v48 = [v47 isEqualToString:@"DISMISS_ALERT"];

          id v30 = v81;
          if (v48) {
            goto LABEL_39;
          }
        }
LABEL_40:

        ++v35;
      }
      while (v32 != v35);
      uint64_t v49 = [v30 countByEnumeratingWithState:&v83 objects:buf count:16];
      uint64_t v32 = v49;
      if (!v49) {
        goto LABEL_47;
      }
    }
  }
  id v80 = 0;
  id v33 = 0;
LABEL_47:

  long long v50 = v30;
  long long v51 = (void *)[v82 copy];

  id v52 = v80;
  id v53 = v33;
  v54 = v78;
  [(_ICQFollowupSpecification *)v78 setLinks:v51];

  v55 = [v79 objectForKeyedSubscript:@"lockTitle"];
  [(_ICQFollowupSpecification *)v78 setNoteTitle:v55];

  v56 = [v79 objectForKeyedSubscript:@"lockMesg"];
  if (v56)
  {
    [(_ICQFollowupSpecification *)v78 setNoteMessage:v56];
  }
  else
  {
    v57 = [v79 objectForKeyedSubscript:@"lockMessage"];
    [(_ICQFollowupSpecification *)v78 setNoteMessage:v57];
  }
  uint64_t v58 = [v79 objectForKeyedSubscript:@"altLockMesg"];
  if (v58)
  {
    [(_ICQFollowupSpecification *)v78 setAltNoteMessage:v58];
  }
  else
  {
    v59 = [v79 objectForKeyedSubscript:@"altLockMessage"];
    [(_ICQFollowupSpecification *)v78 setAltNoteMessage:v59];
  }
  v60 = [(_ICQFollowupSpecification *)v78 noteMessage];
  objc_opt_class();
  char v61 = objc_opt_isKindOfClass();

  if ((v61 & 1) == 0)
  {
    v62 = [(_ICQFollowupSpecification *)v78 noteMessage];

    if (v62)
    {
      v63 = _ICQGetLogSystem();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        v64 = (objc_class *)objc_opt_class();
        v65 = class_getName(v64);
        v66 = [(_ICQFollowupSpecification *)v78 noteMessage];
        *(_DWORD *)buf = 136315394;
        v88 = v65;
        __int16 v89 = 2112;
        v90 = v66;
        _os_log_impl(&dword_1D5851000, v63, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
    -[_ICQFollowupSpecification setNoteMessage:](v78, "setNoteMessage:", 0, v78);
  }
  v67 = [(_ICQFollowupSpecification *)v54 altNoteMessage];
  objc_opt_class();
  char v68 = objc_opt_isKindOfClass();

  if ((v68 & 1) == 0)
  {
    v69 = [(_ICQFollowupSpecification *)v54 altNoteMessage];

    if (v69)
    {
      v70 = _ICQGetLogSystem();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        v71 = (objc_class *)objc_opt_class();
        v72 = class_getName(v71);
        v73 = [(_ICQFollowupSpecification *)v54 altNoteMessage];
        *(_DWORD *)buf = 136315394;
        v88 = v72;
        __int16 v89 = 2112;
        v90 = v73;
        _os_log_impl(&dword_1D5851000, v70, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
    [(_ICQFollowupSpecification *)v54 setAltNoteMessage:0];
  }
  [(_ICQFollowupSpecification *)v54 setNoteActivateLink:v52];
  if (v53)
  {
    [(_ICQFollowupSpecification *)v54 setNoteClearLink:v53];
  }
  else
  {
    v74 = [ICQLink alloc];
    v75 = [(ICQLink *)v74 initWithText:&stru_1F2DCE430 action:101 parameters:MEMORY[0x1E4F1CC08]];
    [(_ICQFollowupSpecification *)v54 setNoteClearLink:v75];
  }
  v76 = [v79 objectForKeyedSubscript:@"enableDirectAction"];
  [(_ICQFollowupSpecification *)v54 setZeroAction:_ICQBooleanForServerObjectDefault(v76, 0)];

  v77 = [v79 objectForKeyedSubscript:@"groupIdentifier"];
  [(_ICQFollowupSpecification *)v54 setGroupIdentifier:v77];
}

- (int64_t)primaryAction
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(_ICQFollowupSpecification *)self links];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v8 parameters];
        id v10 = [v9 objectForKeyedSubscript:@"btnId"];
        char v11 = [v10 isEqualToString:@"followUpOkBtnId"];

        uint64_t v12 = [v8 action];
        if (v11)
        {
          int64_t v5 = v12;
          goto LABEL_14;
        }
        if (v12) {
          int64_t v5 = [v8 action];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v5 = 0;
  }
LABEL_14:

  return v5;
}

- (void)addNotifyingAppIdForItem:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = [(_ICQFollowupSpecification *)self notifyingAppId];

  if (v5)
  {
    id v8 = ICQFollowupNotifyingAppIdKey;
    uint64_t v6 = [(_ICQFollowupSpecification *)self notifyingAppId];
    v9[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v4 setUserInfo:v7];
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)altMessage
{
  return self->_altMessage;
}

- (void)setAltMessage:(id)a3
{
}

- (NSArray)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
}

- (NSString)noteTitle
{
  return self->_noteTitle;
}

- (void)setNoteTitle:(id)a3
{
}

- (NSString)noteSubTitle
{
  return self->_noteSubTitle;
}

- (void)setNoteSubTitle:(id)a3
{
}

- (NSString)noteMessage
{
  return self->_noteMessage;
}

- (void)setNoteMessage:(id)a3
{
}

- (NSString)altNoteMessage
{
  return self->_altNoteMessage;
}

- (void)setAltNoteMessage:(id)a3
{
}

- (ICQLink)noteActivateLink
{
  return self->_noteActivateLink;
}

- (void)setNoteActivateLink:(id)a3
{
}

- (ICQLink)noteClearLink
{
  return self->_noteClearLink;
}

- (void)setNoteClearLink:(id)a3
{
}

- (BOOL)isForAccountGroup
{
  return self->_forAccountGroup;
}

- (void)setForAccountGroup:(BOOL)a3
{
  self->_forAccountGroup = a3;
}

- (BOOL)isZeroAction
{
  return self->_zeroAction;
}

- (void)setZeroAction:(BOOL)a3
{
  self->_zeroAction = a3;
}

- (BOOL)badgeApp
{
  return self->_badgeApp;
}

- (void)setBadgeApp:(BOOL)a3
{
  self->_badgeApp = a3;
}

- (int64_t)followupDisplayStyle
{
  return self->_followupDisplayStyle;
}

- (void)setFollowupDisplayStyle:(int64_t)a3
{
  self->_followupDisplayStyle = a3;
}

- (NSString)sfSymbolID
{
  return self->_sfSymbolID;
}

- (void)setSfSymbolID:(id)a3
{
}

- (NSString)sfSymbolBundlePath
{
  return self->_sfSymbolBundlePath;
}

- (void)setSfSymbolBundlePath:(id)a3
{
}

- (NSString)notifyingAppId
{
  return self->_notifyingAppId;
}

- (void)setNotifyingAppId:(id)a3
{
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
}

- (BOOL)premiumOffer
{
  return self->_premiumOffer;
}

- (void)setPremiumOffer:(BOOL)a3
{
  self->_premiumOffer = a3;
}

- (BOOL)eventOffer
{
  return self->_eventOffer;
}

- (void)setEventOffer:(BOOL)a3
{
  self->_eventOffer = a3;
}

- (NSString)offerId
{
  return self->_offerId;
}

- (void)setOfferId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerId, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_notifyingAppId, 0);
  objc_storeStrong((id *)&self->_sfSymbolBundlePath, 0);
  objc_storeStrong((id *)&self->_sfSymbolID, 0);
  objc_storeStrong((id *)&self->_noteClearLink, 0);
  objc_storeStrong((id *)&self->_noteActivateLink, 0);
  objc_storeStrong((id *)&self->_altNoteMessage, 0);
  objc_storeStrong((id *)&self->_noteMessage, 0);
  objc_storeStrong((id *)&self->_noteSubTitle, 0);
  objc_storeStrong((id *)&self->_noteTitle, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_altMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_serverDict, 0);
}

- (void)followupActionForLink:(uint64_t)a1 needsFlow:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D5851000, a2, OS_LOG_TYPE_DEBUG, "Skipping CFU for lockscreen link: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)clearLegacyFollowupWithController:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D5851000, log, OS_LOG_TYPE_DEBUG, "Skipping legacy CFU cleanup. Already been done", v1, 2u);
}

@end