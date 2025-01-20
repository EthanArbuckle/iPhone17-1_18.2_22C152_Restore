@interface WBSSavedAccountSharedSidecar
- (BOOL)isEqual:(id)a3;
- (NSArray)additionalSites;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)originalKeychainDictionary;
- (NSDictionary)prefixedSharableData;
- (NSString)customTitle;
- (NSString)notesEntry;
- (NSString)originalContributorParticipantID;
- (NSString)participantIDForUserThatMovedSavedAccountToRecentlyDeleted;
- (NSString)user;
- (NSURLProtectionSpace)protectionSpace;
- (WBSSavedAccountSharedSidecar)initWithPersonalSidecar:(id)a3;
- (WBSSavedAccountSharedSidecar)initWithUser:(id)a3 protectionSpace:(id)a4 dictionaryRepresentation:(id)a5;
- (WBSTOTPGenerator)totpGenerator;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setAdditionalSites:(id)a3;
- (void)setCustomTitle:(id)a3;
- (void)setNotesEntry:(id)a3;
- (void)setOriginalContributorParticipantID:(id)a3;
- (void)setOriginalKeychainDictionary:(id)a3;
- (void)setParticipantIDForUserThatMovedSavedAccountToRecentlyDeleted:(id)a3;
- (void)setTotpGenerator:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation WBSSavedAccountSharedSidecar

- (WBSSavedAccountSharedSidecar)initWithUser:(id)a3 protectionSpace:(id)a4 dictionaryRepresentation:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)WBSSavedAccountSharedSidecar;
  v11 = [(WBSSavedAccountSharedSidecar *)&v34 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    user = v11->_user;
    v11->_user = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    protectionSpace = v11->_protectionSpace;
    v11->_protectionSpace = (NSURLProtectionSpace *)v14;

    uint64_t v16 = [v10 copy];
    originalKeychainDictionary = v11->_originalKeychainDictionary;
    v11->_originalKeychainDictionary = (NSDictionary *)v16;

    v18 = [v10 objectForKeyedSubscript:@"totp"];
    if (v18)
    {
      v19 = [[WBSTOTPGenerator alloc] initWithDictionaryRepresentation:v18];
      totpGenerator = v11->_totpGenerator;
      v11->_totpGenerator = v19;
    }
    v21 = [v10 objectForKeyedSubscript:@"notes"];
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
    v25 = [v10 objectForKeyedSubscript:@"ocpid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = (void *)[[NSString alloc] initWithData:v25 encoding:4];
      if ([v26 length]) {
        objc_storeStrong((id *)&v11->_originalContributorParticipantID, v26);
      }
    }
    v27 = [v10 objectForKeyedSubscript:@"pidrd"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = (void *)[[NSString alloc] initWithData:v27 encoding:4];
      if ([v28 length]) {
        objc_storeStrong((id *)&v11->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted, v28);
      }
    }
    v29 = [v10 objectForKeyedSubscript:@"s_as"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v30 = objc_msgSend(v29, "safari_mapObjectsUsingBlock:", &__block_literal_global_59);
      additionalSites = v11->_additionalSites;
      v11->_additionalSites = (NSArray *)v30;
    }
    else
    {
      additionalSites = v11->_additionalSites;
      v11->_additionalSites = (NSArray *)MEMORY[0x1E4F1CBF0];
    }

    v32 = v11;
  }

  return v11;
}

WBSSavedAccountAdditionalSite *__86__WBSSavedAccountSharedSidecar_initWithUser_protectionSpace_dictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WBSSavedAccountAdditionalSite alloc] initWithDictionaryRepresentation:v2];

  return v3;
}

- (WBSSavedAccountSharedSidecar)initWithPersonalSidecar:(id)a3
{
  id v4 = a3;
  v5 = [v4 prefixedSharableData];
  v6 = [v4 user];
  v7 = [v4 protectionSpace];
  id v8 = [(WBSSavedAccountSharedSidecar *)self initWithUser:v6 protectionSpace:v7 dictionaryRepresentation:v5];

  if (v8)
  {
    uint64_t v9 = [v4 totpGenerator];
    totpGenerator = v8->_totpGenerator;
    v8->_totpGenerator = (WBSTOTPGenerator *)v9;

    v11 = [v4 notesEntry];
    uint64_t v12 = [v11 copy];
    notesEntry = v8->_notesEntry;
    v8->_notesEntry = (NSString *)v12;

    uint64_t v14 = [v4 customTitle];
    uint64_t v15 = [v14 copy];
    customTitle = v8->_customTitle;
    v8->_customTitle = (NSString *)v15;

    v17 = v8;
  }

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = (void *)[(NSDictionary *)self->_originalKeychainDictionary mutableCopy];
  id v4 = [(WBSTOTPGenerator *)self->_totpGenerator dictionaryRepresentation];
  [v3 setObject:v4 forKeyedSubscript:@"totp"];

  v5 = [(NSString *)self->_notesEntry dataUsingEncoding:4];
  [v3 setObject:v5 forKeyedSubscript:@"notes"];

  v6 = [(NSString *)self->_customTitle dataUsingEncoding:4];
  [v3 setObject:v6 forKeyedSubscript:@"title"];

  v7 = [(NSString *)self->_originalContributorParticipantID dataUsingEncoding:4];
  [v3 setObject:v7 forKeyedSubscript:@"ocpid"];

  id v8 = [(NSString *)self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted dataUsingEncoding:4];
  [v3 setObject:v8 forKeyedSubscript:@"pidrd"];

  uint64_t v9 = [(NSArray *)self->_additionalSites safari_mapObjectsUsingBlock:&__block_literal_global_11];
  [v3 setObject:v9 forKeyedSubscript:@"s_as"];

  return (NSDictionary *)v3;
}

uint64_t __56__WBSSavedAccountSharedSidecar_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (NSDictionary)prefixedSharableData
{
  return (NSDictionary *)[(NSDictionary *)self->_originalKeychainDictionary safari_mapAndFilterKeysUsingBlock:&__block_literal_global_14_2];
}

id __52__WBSSavedAccountSharedSidecar_prefixedSharableData__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 hasPrefix:@"s_"]) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSSavedAccountSharedSidecar *)a3;
  if (self == v4)
  {
    char v21 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      user = self->_user;
      v7 = [(WBSSavedAccountSharedSidecar *)v5 user];
      if (WBSIsEqual(user, v7))
      {
        protectionSpace = self->_protectionSpace;
        uint64_t v9 = [(WBSSavedAccountSharedSidecar *)v5 protectionSpace];
        if (WBSIsEqual(protectionSpace, v9))
        {
          totpGenerator = self->_totpGenerator;
          v11 = [(WBSSavedAccountSharedSidecar *)v5 totpGenerator];
          if (WBSIsEqual(totpGenerator, v11))
          {
            notesEntry = self->_notesEntry;
            v13 = [(WBSSavedAccountSharedSidecar *)v5 notesEntry];
            if (WBSIsEqual(notesEntry, v13))
            {
              customTitle = self->_customTitle;
              uint64_t v15 = [(WBSSavedAccountSharedSidecar *)v5 customTitle];
              if (WBSIsEqual(customTitle, v15))
              {
                originalContributorParticipantID = self->_originalContributorParticipantID;
                v17 = [(WBSSavedAccountSharedSidecar *)v5 originalContributorParticipantID];
                if (WBSIsEqual(originalContributorParticipantID, v17))
                {
                  additionalSites = self->_additionalSites;
                  v23 = [(WBSSavedAccountSharedSidecar *)v5 additionalSites];
                  if (WBSIsEqual(additionalSites, v23))
                  {
                    participantIDForUserThatMovedSavedAccountToRecentlyDeleted = self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted;
                    v20 = [(WBSSavedAccountSharedSidecar *)v5 participantIDForUserThatMovedSavedAccountToRecentlyDeleted];
                    char v21 = WBSIsEqual(participantIDForUserThatMovedSavedAccountToRecentlyDeleted, v20);
                  }
                  else
                  {
                    char v21 = 0;
                  }
                }
                else
                {
                  char v21 = 0;
                }
              }
              else
              {
                char v21 = 0;
              }
            }
            else
            {
              char v21 = 0;
            }
          }
          else
          {
            char v21 = 0;
          }
        }
        else
        {
          char v21 = 0;
        }
      }
      else
      {
        char v21 = 0;
      }
    }
    else
    {
      char v21 = 0;
    }
  }

  return v21;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_user hash];
  uint64_t v4 = [(NSURLProtectionSpace *)self->_protectionSpace hash] ^ v3;
  unint64_t v5 = [(WBSTOTPGenerator *)self->_totpGenerator hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_notesEntry hash];
  NSUInteger v7 = [(NSString *)self->_customTitle hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_originalContributorParticipantID hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted hash];
  return v9 ^ [(NSArray *)self->_additionalSites hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [WBSSavedAccountSharedSidecar alloc];
  user = self->_user;
  protectionSpace = self->_protectionSpace;
  originalKeychainDictionary = self->_originalKeychainDictionary;
  return [(WBSSavedAccountSharedSidecar *)v4 initWithUser:user protectionSpace:protectionSpace dictionaryRepresentation:originalKeychainDictionary];
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

- (NSDictionary)originalKeychainDictionary
{
  return self->_originalKeychainDictionary;
}

- (void)setOriginalKeychainDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalKeychainDictionary, 0);
  objc_storeStrong((id *)&self->_additionalSites, 0);
  objc_storeStrong((id *)&self->_participantIDForUserThatMovedSavedAccountToRecentlyDeleted, 0);
  objc_storeStrong((id *)&self->_originalContributorParticipantID, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_notesEntry, 0);
  objc_storeStrong((id *)&self->_totpGenerator, 0);
  objc_storeStrong((id *)&self->_protectionSpace, 0);
  objc_storeStrong((id *)&self->_user, 0);
}

@end