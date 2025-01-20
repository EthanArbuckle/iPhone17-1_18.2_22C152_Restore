@interface SPCoreSpotlightResult
- (BOOL)bestInContainer;
- (BOOL)completed;
- (BOOL)hasAssociatedUserActivity;
- (BOOL)hasDetail;
- (Class)classForCoder;
- (NSArray)launchDates;
- (NSDate)contentCreationDate;
- (NSDate)interestingDate;
- (NSString)accountIdentifier;
- (NSString)bundleID;
- (NSString)containerIdentifier;
- (NSString)domainIdentifier;
- (NSString)itemIdentifier;
- (NSString)mailConversationIdentifier;
- (NSString)relatedBundleID;
- (NSString)relatedUniqueIdentifier;
- (NSString)stringForDedupe;
- (SPCoreSpotlightResult)init;
- (id)debugDescription;
- (int)title_maxlines;
- (int64_t)incomingCount;
- (int64_t)outgoingCount;
- (uint64_t)buddyScore;
- (void)setAccountIdentifier:(id)a3;
- (void)setBestInContainer:(BOOL)a3;
- (void)setBuddyScore:(SPCoreSpotlightResult *)self;
- (void)setBundleID:(id)a3;
- (void)setCompatibilityDescriptions:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setContentCreationDate:(id)a3;
- (void)setDomainIdentifier:(id)a3;
- (void)setHasAssociatedUserActivity:(BOOL)a3;
- (void)setIncomingCount:(int64_t *)a3;
- (void)setInterestingDate:(id)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setLaunchDates:(id)a3;
- (void)setMailConversationIdentifier:(id)a3;
- (void)setOutgoingCount:(int64_t *)a3;
- (void)setRelatedBundleID:(id)a3;
- (void)setRelatedUniqueIdentifier:(id)a3;
- (void)setStringForDedupe:(id)a3;
- (void)setTitle_maxlines:(int)a3;
@end

@implementation SPCoreSpotlightResult

- (SPCoreSpotlightResult)init
{
  v3.receiver = self;
  v3.super_class = (Class)SPCoreSpotlightResult;
  return [(SFSearchResult_SpotlightExtras *)&v3 init];
}

- (void)setCompatibilityDescriptions:(id)a3
{
  v15 = self;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "objectForKeyedSubscript:", @"formatted_text", v15);
        v11 = [v10 objectAtIndexedSubscript:0];
        v12 = [v11 objectForKey:@"text"];
        v13 = [v9 objectForKey:@"text_maxlines"];
        id v14 = objc_alloc_init(MEMORY[0x263F67A90]);
        [v14 setText:v12];
        objc_msgSend(v14, "setMaxLines:", (int)objc_msgSend(v13, "intValue"));
        [v4 addObject:v14];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  [(SPCoreSpotlightResult *)v15 setDescriptions:v4];
}

- (BOOL)hasDetail
{
  id v3 = (void *)MEMORY[0x223C2BE00](self, a2);
  v4 = [(SPCoreSpotlightResult *)self secondaryTitle];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(SPCoreSpotlightResult *)self descriptions];
    if ([v6 count])
    {
      BOOL v5 = 1;
    }
    else
    {
      uint64_t v7 = [(SPCoreSpotlightResult *)self auxiliaryTopText];
      if (v7)
      {
        BOOL v5 = 1;
      }
      else
      {
        v8 = [(SPCoreSpotlightResult *)self auxiliaryMiddleText];
        if (v8)
        {
          BOOL v5 = 1;
        }
        else
        {
          v9 = [(SPCoreSpotlightResult *)self auxiliaryBottomText];
          BOOL v5 = v9 != 0;
        }
      }
    }
  }

  return v5;
}

- (void)setTitle_maxlines:(int)a3
{
  BOOL v5 = [(SPCoreSpotlightResult *)self title];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F67A90]);
    [(SPCoreSpotlightResult *)self setTitle:v6];
  }
  id v7 = [(SPCoreSpotlightResult *)self title];
  [v7 setMaxLines:a3];
}

- (int)title_maxlines
{
  v2 = [(SPCoreSpotlightResult *)self title];
  int v3 = [v2 maxLines];

  return v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (id)debugDescription
{
  int v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)SPCoreSpotlightResult;
  v4 = [(SFSearchResult_Compatibility *)&v9 debugDescription];
  BOOL v5 = [(SPCoreSpotlightResult *)self identifier];
  id v6 = [(SPCoreSpotlightResult *)self interestingDate];
  id v7 = [v3 stringWithFormat:@"%@ %@ %@", v4, v5, v6];

  return v7;
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSString)relatedUniqueIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setRelatedUniqueIdentifier:(id)a3
{
}

- (NSString)accountIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setAccountIdentifier:(id)a3
{
}

- (uint64_t)buddyScore
{
  objc_copyStruct(&v2, (const void *)(a1 + 1136), 16, 1, 0);
  return v2;
}

- (void)setBuddyScore:(SPCoreSpotlightResult *)self
{
  uint64_t v4 = v2;
  uint64_t v5 = v3;
  objc_copyStruct(self->_buddyScore, &v4, 16, 1, 0);
}

- (NSString)itemIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSDate)interestingDate
{
  return (NSDate *)objc_getProperty(self, a2, 1056, 1);
}

- (void)setInterestingDate:(id)a3
{
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSString)domainIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1064, 1);
}

- (void)setDomainIdentifier:(id)a3
{
}

- (int64_t)incomingCount
{
  return self->_incomingCount;
}

- (void)setIncomingCount:(int64_t *)a3
{
  self->_incomingCount = a3;
}

- (int64_t)outgoingCount
{
  return self->_outgoingCount;
}

- (void)setOutgoingCount:(int64_t *)a3
{
  self->_outgoingCount = a3;
}

- (NSString)relatedBundleID
{
  return (NSString *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setRelatedBundleID:(id)a3
{
}

- (NSString)mailConversationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setMailConversationIdentifier:(id)a3
{
}

- (NSString)stringForDedupe
{
  return (NSString *)objc_getProperty(self, a2, 1104, 1);
}

- (void)setStringForDedupe:(id)a3
{
}

- (BOOL)bestInContainer
{
  return self->_bestInContainer;
}

- (void)setBestInContainer:(BOOL)a3
{
  self->_bestInContainer = a3;
}

- (BOOL)hasAssociatedUserActivity
{
  return self->_hasAssociatedUserActivity;
}

- (void)setHasAssociatedUserActivity:(BOOL)a3
{
  self->_hasAssociatedUserActivity = a3;
}

- (NSArray)launchDates
{
  return self->_launchDates;
}

- (void)setLaunchDates:(id)a3
{
}

- (NSDate)contentCreationDate
{
  return self->_contentCreationDate;
}

- (void)setContentCreationDate:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_contentCreationDate, 0);
  objc_storeStrong((id *)&self->_launchDates, 0);
  objc_storeStrong((id *)&self->_stringForDedupe, 0);
  objc_storeStrong((id *)&self->_mailConversationIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedBundleID, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_interestingDate, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_relatedUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end