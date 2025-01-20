@interface WBSSavedAccountSidecar
- (BOOL)isEqual:(id)a3;
- (NSArray)additionalSites;
- (NSDate)lastOneTimeShareDateForPasskey;
- (NSDate)lastRecentlyDeletedNotificationDate;
- (NSDictionary)contextSpecificData;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)prefixedSharableData;
- (NSString)customTitle;
- (NSString)description;
- (NSString)notesEntry;
- (NSString)originalContributorParticipantID;
- (NSString)participantIDForUserThatMovedSavedAccountToRecentlyDeleted;
- (NSString)user;
- (NSURLProtectionSpace)protectionSpace;
- (WBSFormerlySharedSavedAccountMarker)formerlySharedSavedAccountMarker;
- (WBSPasswordWarningHideMarker)hideWarningMarker;
- (WBSSavedAccountSidecar)initWithSharedSidecar:(id)a3;
- (WBSSavedAccountSidecar)initWithUser:(id)a3 protectionSpace:(id)a4;
- (WBSSavedAccountSidecar)initWithUser:(id)a3 protectionSpace:(id)a4 dictionaryRepresentation:(id)a5;
- (WBSTOTPGenerator)totpGenerator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)lastUsedDateForContext:(id)a3;
- (unint64_t)hash;
- (void)adoptSharableDataFromSharedSidecar:(id)a3;
- (void)removeSharableData;
- (void)setAdditionalSites:(id)a3;
- (void)setCustomTitle:(id)a3;
- (void)setFormerlySharedSavedAccountMarker:(id)a3;
- (void)setHideWarningMarker:(id)a3;
- (void)setLastOneTimeShareDateForPasskey:(id)a3;
- (void)setLastRecentlyDeletedNotificationDate:(id)a3;
- (void)setLastUsedDate:(id)a3 forContext:(id)a4;
- (void)setNotesEntry:(id)a3;
- (void)setOriginalContributorParticipantID:(id)a3;
- (void)setParticipantIDForUserThatMovedSavedAccountToRecentlyDeleted:(id)a3;
- (void)setTotpGenerator:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation WBSSavedAccountSidecar

- (WBSSavedAccountSidecar)initWithUser:(id)a3 protectionSpace:(id)a4
{
  return [(WBSSavedAccountSidecar *)self initWithUser:a3 protectionSpace:a4 dictionaryRepresentation:MEMORY[0x1E4F1CC08]];
}

- (WBSSavedAccountSidecar)initWithUser:(id)a3 protectionSpace:(id)a4 dictionaryRepresentation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v51.receiver = self;
  v51.super_class = (Class)WBSSavedAccountSidecar;
  v11 = [(WBSSavedAccountSidecar *)&v51 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    originalKeychainDictionary = v11->_originalKeychainDictionary;
    v11->_originalKeychainDictionary = (NSDictionary *)v12;

    uint64_t v14 = [v8 copy];
    user = v11->_user;
    v11->_user = (NSString *)v14;

    id v48 = v9;
    uint64_t v16 = [v9 copy];
    protectionSpace = v11->_protectionSpace;
    v11->_protectionSpace = (NSURLProtectionSpace *)v16;

    uint64_t v18 = [v10 objectForKeyedSubscript:@"totp"];
    if (v18)
    {
      v19 = [[WBSTOTPGenerator alloc] initWithDictionaryRepresentation:v18];
      totpGenerator = v11->_totpGenerator;
      v11->_totpGenerator = v19;
    }
    v47 = (void *)v18;
    uint64_t v21 = [v10 objectForKeyedSubscript:@"notes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[[NSString alloc] initWithData:v21 encoding:4];
      if ([v22 length]) {
        objc_storeStrong((id *)&v11->_notesEntry, v22);
      }
    }
    v23 = [v10 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = (void *)[[NSString alloc] initWithData:v23 encoding:4];
      if ([v24 length]) {
        objc_storeStrong((id *)&v11->_customTitle, v24);
      }
    }
    v25 = [v10 objectForKeyedSubscript:@"hwm"];
    if (v25)
    {
      v26 = [[WBSPasswordWarningHideMarker alloc] initWithDictionaryRepresentation:v25];
      hideWarningMarker = v11->_hideWarningMarker;
      v11->_hideWarningMarker = v26;
    }
    v28 = objc_msgSend(v10, "safari_numberForKey:", @"otsd", v21);
    v29 = v28;
    if (v28)
    {
      v30 = (void *)MEMORY[0x1E4F1C9C8];
      [v28 doubleValue];
      uint64_t v31 = objc_msgSend(v30, "dateWithTimeIntervalSinceReferenceDate:");
      lastOneTimeShareDateForPasskey = v11->_lastOneTimeShareDateForPasskey;
      v11->_lastOneTimeShareDateForPasskey = (NSDate *)v31;
    }
    id v33 = v8;
    v34 = [v10 objectForKeyedSubscript:@"ctxt"];
    uint64_t v35 = [MEMORY[0x1E4F1CA60] dictionary];
    contextSpecificData = v11->_contextSpecificData;
    v11->_contextSpecificData = (NSMutableDictionary *)v35;

    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __80__WBSSavedAccountSidecar_initWithUser_protectionSpace_dictionaryRepresentation___block_invoke;
    v49[3] = &unk_1E615D1F8;
    v37 = v11;
    v50 = v37;
    [v34 enumerateKeysAndObjectsUsingBlock:v49];
    v38 = [v10 objectForKeyedSubscript:@"fsm"];
    if (v38)
    {
      v39 = [[WBSFormerlySharedSavedAccountMarker alloc] initWithDictionaryRepresentation:v38];
      formerlySharedSavedAccountMarker = v37->_formerlySharedSavedAccountMarker;
      v37->_formerlySharedSavedAccountMarker = v39;
    }
    v41 = [v10 objectForKeyedSubscript:@"s_as"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v42 = objc_msgSend(v41, "safari_mapObjectsUsingBlock:", &__block_literal_global_60);
      additionalSites = v37->_additionalSites;
      v37->_additionalSites = (NSArray *)v42;
    }
    else
    {
      additionalSites = v37->_additionalSites;
      v37->_additionalSites = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    v44 = v37;
    id v8 = v33;
    id v9 = v48;
  }

  return v11;
}

void __80__WBSSavedAccountSidecar_initWithUser_protectionSpace_dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = [[WBSSavedAccountContext alloc] initWithName:v6];

  v7 = [[WBSSavedAccountSidecarContextSpecificData alloc] initWithDictionaryRepresentation:v5];
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v7 forKeyedSubscript:v8];
}

WBSSavedAccountAdditionalSite *__80__WBSSavedAccountSidecar_initWithUser_protectionSpace_dictionaryRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WBSSavedAccountAdditionalSite alloc] initWithDictionaryRepresentation:v2];

  return v3;
}

- (WBSSavedAccountSidecar)initWithSharedSidecar:(id)a3
{
  id v4 = a3;
  id v5 = [v4 user];
  id v6 = [v4 protectionSpace];
  v7 = [(WBSSavedAccountSidecar *)self initWithUser:v5 protectionSpace:v6 dictionaryRepresentation:MEMORY[0x1E4F1CC08]];

  if (v7)
  {
    [(WBSSavedAccountSidecar *)v7 adoptSharableDataFromSharedSidecar:v4];
    id v8 = v7;
  }

  return v7;
}

- (void)adoptSharableDataFromSharedSidecar:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 totpGenerator];
  totpGenerator = self->_totpGenerator;
  self->_totpGenerator = v5;

  v7 = [v4 notesEntry];
  id v8 = (NSString *)[v7 copy];
  notesEntry = self->_notesEntry;
  self->_notesEntry = v8;

  id v10 = [v4 customTitle];
  v11 = (NSString *)[v10 copy];
  customTitle = self->_customTitle;
  self->_customTitle = v11;

  if (!self->_originalKeychainDictionary)
  {
    v13 = [MEMORY[0x1E4F1CA60] dictionary];
    originalKeychainDictionary = self->_originalKeychainDictionary;
    self->_originalKeychainDictionary = v13;
  }
  v15 = [v4 prefixedSharableData];
  uint64_t v16 = [v15 count];
  v17 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (v16 == 1) {
      uint64_t v18 = "";
    }
    else {
      uint64_t v18 = "s";
    }
    v19 = v17;
    v20 = [v15 allKeys];
    uint64_t v21 = [v20 componentsJoinedByString:@", "];
    int v24 = 134218498;
    uint64_t v25 = v16;
    __int16 v26 = 2080;
    v27 = v18;
    __int16 v28 = 2112;
    v29 = v21;
    _os_log_impl(&dword_1B728F000, v19, OS_LOG_TYPE_DEFAULT, "Migrating %ld unknown key%s from shared sidecar to personal sidecar: %@", (uint8_t *)&v24, 0x20u);
  }
  v22 = [(NSDictionary *)self->_originalKeychainDictionary safari_setValuesFromDictionary:v15];
  v23 = self->_originalKeychainDictionary;
  self->_originalKeychainDictionary = v22;
}

- (void)removeSharableData
{
  totpGenerator = self->_totpGenerator;
  self->_totpGenerator = 0;

  notesEntry = self->_notesEntry;
  self->_notesEntry = 0;

  customTitle = self->_customTitle;
  self->_customTitle = 0;

  id v6 = [(NSDictionary *)self->_originalKeychainDictionary safari_mapAndFilterKeysUsingBlock:&__block_literal_global_50];
  originalKeychainDictionary = self->_originalKeychainDictionary;
  self->_originalKeychainDictionary = v6;
}

id __44__WBSSavedAccountSidecar_removeSharableData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasPrefix:@"s_"]) {
    v3 = 0;
  }
  else {
    v3 = v2;
  }
  id v4 = v3;

  return v4;
}

- (NSDictionary)contextSpecificData
{
  id v2 = (void *)[(NSMutableDictionary *)self->_contextSpecificData copy];
  return (NSDictionary *)v2;
}

- (void)setLastUsedDate:(id)a3 forContext:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v6 = +[WBSSavedAccountContext defaultContext];
  }
  v7 = [(NSMutableDictionary *)self->_contextSpecificData objectForKeyedSubscript:v6];
  if (!v7)
  {
    id v8 = [WBSSavedAccountSidecarContextSpecificData alloc];
    v7 = [(WBSSavedAccountSidecarContextSpecificData *)v8 initWithDictionaryRepresentation:MEMORY[0x1E4F1CC08]];
    [(NSMutableDictionary *)self->_contextSpecificData setObject:v7 forKeyedSubscript:v6];
  }
  [(WBSSavedAccountSidecarContextSpecificData *)v7 setLastUsedDate:v9];
}

- (id)lastUsedDateForContext:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_contextSpecificData objectForKeyedSubscript:a3];
  id v4 = [v3 lastUsedDate];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSSavedAccountSidecar *)a3;
  if (self == v4)
  {
    char v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      user = self->_user;
      v7 = [(WBSSavedAccountSidecar *)v5 user];
      if ([(NSString *)user isEqual:v7])
      {
        totpGenerator = self->_totpGenerator;
        id v9 = [(WBSSavedAccountSidecar *)v5 totpGenerator];
        if (WBSIsEqual(totpGenerator, v9))
        {
          notesEntry = self->_notesEntry;
          v11 = [(WBSSavedAccountSidecar *)v5 notesEntry];
          if (WBSIsEqual(notesEntry, v11))
          {
            customTitle = self->_customTitle;
            v13 = [(WBSSavedAccountSidecar *)v5 customTitle];
            if (WBSIsEqual(customTitle, v13)
              && WBSIsEqual(self->_contextSpecificData, v5->_contextSpecificData))
            {
              hideWarningMarker = self->_hideWarningMarker;
              v15 = [(WBSSavedAccountSidecar *)v5 hideWarningMarker];
              if (WBSIsEqual(hideWarningMarker, v15))
              {
                lastOneTimeShareDateForPasskey = self->_lastOneTimeShareDateForPasskey;
                v17 = [(WBSSavedAccountSidecar *)v5 lastOneTimeShareDateForPasskey];
                if (WBSIsEqual(lastOneTimeShareDateForPasskey, v17))
                {
                  additionalSites = self->_additionalSites;
                  v19 = [(WBSSavedAccountSidecar *)v5 additionalSites];
                  v20 = additionalSites;
                  uint64_t v21 = v19;
                  if (WBSIsEqual(v20, v19)) {
                    char v22 = [(NSURLProtectionSpace *)self->_protectionSpace isEqual:v5->_protectionSpace];
                  }
                  else {
                    char v22 = 0;
                  }
                }
                else
                {
                  char v22 = 0;
                }
              }
              else
              {
                char v22 = 0;
              }
            }
            else
            {
              char v22 = 0;
            }
          }
          else
          {
            char v22 = 0;
          }
        }
        else
        {
          char v22 = 0;
        }
      }
      else
      {
        char v22 = 0;
      }
    }
    else
    {
      char v22 = 0;
    }
  }

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_user hash];
  uint64_t v4 = [(NSURLProtectionSpace *)self->_protectionSpace hash] ^ v3;
  unint64_t v5 = [(WBSTOTPGenerator *)self->_totpGenerator hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_notesEntry hash];
  NSUInteger v7 = [(NSString *)self->_customTitle hash];
  unint64_t v8 = v7 ^ [(WBSPasswordWarningHideMarker *)self->_hideWarningMarker hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableDictionary *)self->_contextSpecificData hash];
  uint64_t v10 = [(NSDate *)self->_lastOneTimeShareDateForPasskey hash];
  return v9 ^ v10 ^ [(NSArray *)self->_additionalSites hash];
}

- (NSDictionary)dictionaryRepresentation
{
  NSUInteger v3 = (void *)[(NSDictionary *)self->_originalKeychainDictionary mutableCopy];
  uint64_t v4 = [(WBSTOTPGenerator *)self->_totpGenerator dictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"totp"];

  unint64_t v5 = [(NSString *)self->_notesEntry dataUsingEncoding:4];
  [v3 setObject:v5 forKeyedSubscript:@"notes"];

  NSUInteger v6 = [(NSString *)self->_customTitle dataUsingEncoding:4];
  [v3 setObject:v6 forKeyedSubscript:@"title"];

  NSUInteger v7 = [(WBSPasswordWarningHideMarker *)self->_hideWarningMarker dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"hwm"];

  lastOneTimeShareDateForPasskey = self->_lastOneTimeShareDateForPasskey;
  if (lastOneTimeShareDateForPasskey)
  {
    uint64_t v9 = NSNumber;
    [(NSDate *)lastOneTimeShareDateForPasskey timeIntervalSinceReferenceDate];
    uint64_t v10 = objc_msgSend(v9, "numberWithDouble:");
    [v3 setObject:v10 forKeyedSubscript:@"otsd"];
  }
  else
  {
    [v3 setObject:0 forKeyedSubscript:@"otsd"];
  }
  v11 = [MEMORY[0x1E4F1CA60] dictionary];
  contextSpecificData = self->_contextSpecificData;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __50__WBSSavedAccountSidecar_dictionaryRepresentation__block_invoke;
  v18[3] = &unk_1E615D220;
  id v19 = v11;
  id v13 = v11;
  [(NSMutableDictionary *)contextSpecificData enumerateKeysAndObjectsUsingBlock:v18];
  if ([v13 count]) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  [v3 setObject:v14 forKeyedSubscript:@"ctxt"];
  v15 = [(WBSFormerlySharedSavedAccountMarker *)self->_formerlySharedSavedAccountMarker dictionaryRepresentation];
  [v3 setObject:v15 forKeyedSubscript:@"fsm"];

  uint64_t v16 = [(NSArray *)self->_additionalSites safari_mapObjectsUsingBlock:&__block_literal_global_56_0];
  [v3 setObject:v16 forKeyedSubscript:@"s_as"];

  return (NSDictionary *)v3;
}

void __50__WBSSavedAccountSidecar_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = [a3 dictionaryRepresentation];
  NSUInteger v6 = *(void **)(a1 + 32);
  NSUInteger v7 = [v5 nameForPersistence];

  [v6 setObject:v8 forKeyedSubscript:v7];
}

uint64_t __50__WBSSavedAccountSidecar_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (NSDictionary)prefixedSharableData
{
  return (NSDictionary *)[(NSDictionary *)self->_originalKeychainDictionary safari_mapAndFilterKeysUsingBlock:&__block_literal_global_58_1];
}

id __46__WBSSavedAccountSidecar_prefixedSharableData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasPrefix:@"s_"]) {
    NSUInteger v3 = v2;
  }
  else {
    NSUInteger v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (NSString)description
{
  NSUInteger v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)WBSSavedAccountSidecar;
  id v4 = [(WBSSavedAccountSidecar *)&v9 description];
  user = self->_user;
  NSUInteger v6 = [(NSURLProtectionSpace *)self->_protectionSpace host];
  NSUInteger v7 = [v3 stringWithFormat:@"<%@ user:%@ host:%@>", v4, user, v6];

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[WBSSavedAccountSidecar alloc] initWithUser:self->_user protectionSpace:self->_protectionSpace];
  uint64_t v5 = [(NSDictionary *)self->_originalKeychainDictionary copy];
  originalKeychainDictionary = v4->_originalKeychainDictionary;
  v4->_originalKeychainDictionary = (NSDictionary *)v5;

  objc_storeStrong((id *)&v4->_totpGenerator, self->_totpGenerator);
  uint64_t v7 = [(NSString *)self->_notesEntry copy];
  notesEntry = v4->_notesEntry;
  v4->_notesEntry = (NSString *)v7;

  uint64_t v9 = [(NSString *)self->_customTitle copy];
  customTitle = v4->_customTitle;
  v4->_customTitle = (NSString *)v9;

  uint64_t v11 = [(NSMutableDictionary *)self->_contextSpecificData copy];
  contextSpecificData = v4->_contextSpecificData;
  v4->_contextSpecificData = (NSMutableDictionary *)v11;

  objc_storeStrong((id *)&v4->_hideWarningMarker, self->_hideWarningMarker);
  uint64_t v13 = [(NSDate *)self->_lastOneTimeShareDateForPasskey copy];
  lastOneTimeShareDateForPasskey = v4->_lastOneTimeShareDateForPasskey;
  v4->_lastOneTimeShareDateForPasskey = (NSDate *)v13;

  uint64_t v15 = [(NSArray *)self->_additionalSites copy];
  additionalSites = v4->_additionalSites;
  v4->_additionalSites = (NSArray *)v15;

  return v4;
}

- (NSString)user
{
  return self->_user;
}

- (void)setUser:(id)a3
{
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_protectionSpace;
}

- (WBSTOTPGenerator)totpGenerator
{
  return self->_totpGenerator;
}

- (void)setTotpGenerator:(id)a3
{
}

- (NSString)notesEntry
{
  return self->_notesEntry;
}

- (void)setNotesEntry:(id)a3
{
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (void)setCustomTitle:(id)a3
{
}

- (NSString)originalContributorParticipantID
{
  return self->_originalContributorParticipantID;
}

- (void)setOriginalContributorParticipantID:(id)a3
{
}

- (NSString)participantIDForUserThatMovedSavedAccountToRecentlyDeleted
{
  return self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted;
}

- (void)setParticipantIDForUserThatMovedSavedAccountToRecentlyDeleted:(id)a3
{
}

- (NSArray)additionalSites
{
  return self->_additionalSites;
}

- (void)setAdditionalSites:(id)a3
{
}

- (WBSPasswordWarningHideMarker)hideWarningMarker
{
  return self->_hideWarningMarker;
}

- (void)setHideWarningMarker:(id)a3
{
}

- (NSDate)lastOneTimeShareDateForPasskey
{
  return self->_lastOneTimeShareDateForPasskey;
}

- (void)setLastOneTimeShareDateForPasskey:(id)a3
{
}

- (WBSFormerlySharedSavedAccountMarker)formerlySharedSavedAccountMarker
{
  return self->_formerlySharedSavedAccountMarker;
}

- (void)setFormerlySharedSavedAccountMarker:(id)a3
{
}

- (NSDate)lastRecentlyDeletedNotificationDate
{
  return self->_lastRecentlyDeletedNotificationDate;
}

- (void)setLastRecentlyDeletedNotificationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRecentlyDeletedNotificationDate, 0);
  objc_storeStrong((id *)&self->_formerlySharedSavedAccountMarker, 0);
  objc_storeStrong((id *)&self->_lastOneTimeShareDateForPasskey, 0);
  objc_storeStrong((id *)&self->_hideWarningMarker, 0);
  objc_storeStrong((id *)&self->_additionalSites, 0);
  objc_storeStrong((id *)&self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted, 0);
  objc_storeStrong((id *)&self->_originalContributorParticipantID, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_notesEntry, 0);
  objc_storeStrong((id *)&self->_totpGenerator, 0);
  objc_storeStrong((id *)&self->_protectionSpace, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_contextSpecificData, 0);
  objc_storeStrong((id *)&self->_originalKeychainDictionary, 0);
}

@end