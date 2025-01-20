@interface TUConversationLink
+ (BOOL)checkMatchingConversationLinkCriteriaForURL:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (TUUserConfiguration)userConfiguration;
+ (id)baseURLComponentsForURL:(id)a3;
+ (id)baseURLStrings;
+ (id)baseURLs;
+ (id)conversationLinkComponentsFromURL:(id)a3;
+ (id)conversationLinkForURL:(id)a3;
+ (id)featureFlags;
+ (id)preferredBaseURL;
+ (id)preferredBaseURLString;
+ (id)prefixedPseudonymFor:(id)a3;
+ (id)publicKeyForBase64EncodedString:(id)a3;
+ (unint64_t)conversationLinkVersion;
- (BOOL)allInvitedMembersInContactsChecking:(id)a3;
- (BOOL)canCreateConversations;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversationLink:(id)a3;
- (BOOL)isEquivalentToConversationLink:(id)a3;
- (BOOL)isEquivalentToPseudonym:(id)a3 andPublicKey:(id)a4;
- (BOOL)isLocallyCreated;
- (NSData)publicKey;
- (NSDate)creationDate;
- (NSDate)deletionDate;
- (NSDate)expirationDate;
- (NSSet)invitedMemberHandles;
- (NSString)URLFragment;
- (NSString)displayName;
- (NSString)linkName;
- (NSString)pseudonym;
- (NSURL)URL;
- (NSUUID)groupUUID;
- (TUConversationLink)initWithCoder:(id)a3;
- (TUConversationLink)initWithDescriptor:(id)a3;
- (TUConversationLink)initWithPseudonym:(id)a3 publicKey:(id)a4 groupUUID:(id)a5 originatorHandle:(id)a6;
- (TUConversationLink)initWithPseudonym:(id)a3 publicKey:(id)a4 groupUUID:(id)a5 originatorHandle:(id)a6 creationDate:(id)a7 deletionDate:(id)a8 expirationDate:(id)a9 invitedMemberHandles:(id)a10 locallyCreated:(BOOL)a11 linkName:(id)a12 linkLifetimeScope:(int64_t)a13 deleteReason:(int64_t)a14;
- (TUHandle)originatorHandle;
- (id)base64PublicKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fetchedResults;
- (id)generateDisplayName;
- (id)unprefixedPseudonym;
- (id)valueForKey:(id)a3;
- (int64_t)deleteReason;
- (int64_t)linkLifetimeScope;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setDeleteReason:(int64_t)a3;
- (void)setDeletionDate:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setGroupUUID:(id)a3;
- (void)setInvitedMemberHandles:(id)a3;
- (void)setLinkLifetimeScope:(int64_t)a3;
- (void)setLinkName:(id)a3;
- (void)setLocallyCreated:(BOOL)a3;
- (void)setOriginatorHandle:(id)a3;
- (void)setPseudonym:(id)a3;
- (void)setPublicKey:(id)a3;
- (void)setURLFragment:(id)a3;
@end

@implementation TUConversationLink

+ (id)baseURLStrings
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v12[0] = @"facetime.apple.com/join";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  if (_TUIsInternalInstall())
  {
    v4 = [a1 userConfiguration];
    v5 = [v4 conversationLinkBaseURLString];

    if (v5)
    {
      v6 = [a1 userConfiguration];
      v7 = [v6 conversationLinkBaseURLString];
      v11 = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
      uint64_t v9 = [v8 arrayByAddingObjectsFromArray:v3];

      v3 = (void *)v9;
    }
  }

  return v3;
}

+ (TUUserConfiguration)userConfiguration
{
  if (userConfiguration_onceToken != -1) {
    dispatch_once(&userConfiguration_onceToken, &__block_literal_global_29);
  }
  v2 = (void *)userConfiguration_sUserConfiguration;

  return (TUUserConfiguration *)v2;
}

uint64_t __39__TUConversationLink_userConfiguration__block_invoke()
{
  userConfiguration_sUserConfiguration = objc_alloc_init(TUUserConfiguration);

  return MEMORY[0x1F41817F8]();
}

+ (id)featureFlags
{
  if (featureFlags_onceToken != -1) {
    dispatch_once(&featureFlags_onceToken, &__block_literal_global_60);
  }
  v2 = (void *)featureFlags_flags;

  return v2;
}

uint64_t __34__TUConversationLink_featureFlags__block_invoke()
{
  featureFlags_flags = objc_alloc_init(TUFeatureFlags);

  return MEMORY[0x1F41817F8]();
}

- (NSString)linkName
{
  v3 = +[TUConversationLink featureFlags];
  int v4 = [v3 linkNamesEnabled];

  if (v4) {
    v5 = self->_linkName;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (NSString)displayName
{
  id v3 = [(TUConversationLink *)self linkName];

  if (v3)
  {
    int v4 = [(TUConversationLink *)self generateDisplayName];
    if ([v4 length]) {
      id v3 = v4;
    }
    else {
      id v3 = 0;
    }
  }

  return (NSString *)v3;
}

- (id)generateDisplayName
{
  if ([(TUConversationLink *)self isLocallyCreated]
    && ([(TUConversationLink *)self linkName],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    int v4 = [(TUConversationLink *)self linkName];
  }
  else
  {
    v5 = [(TUConversationLink *)self fetchedResults];
    if ([(TUConversationLink *)self allInvitedMembersInContactsChecking:v5])
    {
      int v4 = [(TUConversationLink *)self linkName];
    }
    else
    {
      int v4 = 0;
    }
  }

  return v4;
}

- (id)fetchedResults
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F1B990];
  int v4 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v5 = [v4 bundleIdentifier];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = @"com.apple.facetime";
  }
  uint64_t v8 = objc_msgSend(v3, "tu_contactStoreConfigurationForBundleIdentifier:", v7);

  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1B980]) initWithConfiguration:v8];
  v10 = [[TUContactsDataProvider alloc] initWithContactsDataSource:v9];
  v11 = [MEMORY[0x1E4F1CA48] array];
  v36 = (void *)v9;
  v37 = (void *)v8;
  if (fetchedResults__pred_IMPreferredAccountForServiceIMCore != -1) {
    dispatch_once(&fetchedResults__pred_IMPreferredAccountForServiceIMCore, &__block_literal_global_69);
  }
  v12 = (void *)CUTWeakLinkClass();
  v13 = (void *)CUTWeakLinkClass();
  if (v13)
  {
    v14 = [v13 sharedInstance];
    [v14 blockUntilConnected];
  }
  v15 = (void (*)(void))fetchedResults__IMPreferredAccountForService;
  v16 = [v12 facetimeService];
  v17 = v15();

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  if (v17)
  {
    v19 = [v17 aliases];
    v20 = [v18 setWithArray:v19];
  }
  else
  {
    v20 = objc_opt_new();
  }
  v21 = [(TUConversationLink *)self invitedMemberHandles];
  v22 = (void *)[v21 mutableCopy];

  v23 = [(TUConversationLink *)self originatorHandle];
  [v22 addObject:v23];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v30 = [v29 value];
        char v31 = [v20 containsObject:v30];

        if ((v31 & 1) == 0)
        {
          v32 = [[TUContactsDataProviderFetchRequest alloc] initWithHandle:v29];
          [v11 addObject:v32];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v26);
  }

  v33 = [(TUContactsDataProvider *)v10 executeBatchFetchRequests:v11];

  return v33;
}

void *__36__TUConversationLink_fetchedResults__block_invoke()
{
  result = (void *)CUTWeakLinkSymbol();
  fetchedResults__IMPreferredAccountForService = result;
  return result;
}

- (BOOL)allInvitedMembersInContactsChecking:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__TUConversationLink_allInvitedMembersInContactsChecking___block_invoke;
  v6[3] = &unk_1E58E73F8;
  v6[4] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __58__TUConversationLink_allInvitedMembersInContactsChecking___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  v6 = [a3 contacts];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)canCreateConversations
{
  if ([(TUConversationLink *)self isLocallyCreated]) {
    return 1;
  }
  char v4 = [(TUConversationLink *)self groupUUID];
  if (v4)
  {
    uint64_t v5 = [(TUConversationLink *)self originatorHandle];
    if (v5)
    {
      v6 = [(TUConversationLink *)self invitedMemberHandles];
      BOOL v3 = v6 != 0;
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (TUConversationLink)initWithDescriptor:(id)a3
{
  id v4 = a3;
  v20 = [v4 pseudonym];
  v19 = [v4 publicKey];
  v18 = [v4 groupUUID];
  v21 = [v4 originator];
  v17 = [v21 handle];
  v16 = [v4 creationDate];
  uint64_t v5 = [v4 deletionDate];
  v6 = [v4 expirationDate];
  uint64_t v7 = [v4 invitedHandles];
  uint64_t v8 = [v4 privateKey];
  BOOL v9 = [v8 length] != 0;
  char v10 = [v4 name];
  uint64_t v11 = [v4 linkLifetimeScope];
  uint64_t v12 = [v4 deleteReason];

  LOBYTE(v14) = v9;
  v15 = [(TUConversationLink *)self initWithPseudonym:v20 publicKey:v19 groupUUID:v18 originatorHandle:v17 creationDate:v16 deletionDate:v5 expirationDate:v6 invitedMemberHandles:v7 locallyCreated:v14 linkName:v10 linkLifetimeScope:v11 deleteReason:v12];

  return v15;
}

- (TUConversationLink)initWithPseudonym:(id)a3 publicKey:(id)a4 groupUUID:(id)a5 originatorHandle:(id)a6
{
  LOBYTE(v7) = 0;
  return [(TUConversationLink *)self initWithPseudonym:a3 publicKey:a4 groupUUID:a5 originatorHandle:a6 creationDate:0 deletionDate:0 expirationDate:0 invitedMemberHandles:0 locallyCreated:v7 linkName:0 linkLifetimeScope:0 deleteReason:0];
}

- (TUConversationLink)initWithPseudonym:(id)a3 publicKey:(id)a4 groupUUID:(id)a5 originatorHandle:(id)a6 creationDate:(id)a7 deletionDate:(id)a8 expirationDate:(id)a9 invitedMemberHandles:(id)a10 locallyCreated:(BOOL)a11 linkName:(id)a12 linkLifetimeScope:(int64_t)a13 deleteReason:(int64_t)a14
{
  id v20 = a3;
  id v21 = a4;
  id v47 = a5;
  id v46 = a6;
  id v22 = a7;
  id v23 = a8;
  id v24 = a9;
  id v25 = a10;
  id v26 = a12;
  if (v20 && ([v20 destinationIdIsPseudonym] & 1) != 0)
  {
    if (v21) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v43 = [MEMORY[0x1E4F28B00] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"TUConversationLink.m", 173, @"Invalid parameter not satisfying: %@", @"pseudonym != nil && pseudonym.destinationIdIsPseudonym" object file lineNumber description];

    if (v21)
    {
LABEL_4:
      if ([v21 length]) {
        goto LABEL_5;
      }
    }
  }
  v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"TUConversationLink.m", 174, @"Invalid parameter not satisfying: %@", @"publicKey != nil && publicKey.length >= 1" object file lineNumber description];

LABEL_5:
  v48.receiver = self;
  v48.super_class = (Class)TUConversationLink;
  uint64_t v27 = [(TUConversationLink *)&v48 init];
  if (v27)
  {
    uint64_t v28 = [v20 copy];
    pseudonym = v27->_pseudonym;
    v27->_pseudonym = (NSString *)v28;

    uint64_t v30 = [v21 copy];
    publicKey = v27->_publicKey;
    v27->_publicKey = (NSData *)v30;

    objc_storeStrong((id *)&v27->_groupUUID, a5);
    objc_storeStrong((id *)&v27->_originatorHandle, a6);
    uint64_t v32 = [v22 copy];
    creationDate = v27->_creationDate;
    v27->_creationDate = (NSDate *)v32;

    uint64_t v34 = [v23 copy];
    deletionDate = v27->_deletionDate;
    v27->_deletionDate = (NSDate *)v34;

    uint64_t v36 = [v24 copy];
    expirationDate = v27->_expirationDate;
    v27->_expirationDate = (NSDate *)v36;

    uint64_t v38 = [v25 copy];
    invitedMemberHandles = v27->_invitedMemberHandles;
    v27->_invitedMemberHandles = (NSSet *)v38;

    v27->_locallyCreated = a11;
    uint64_t v40 = [v26 copy];
    linkName = v27->_linkName;
    v27->_linkName = (NSString *)v40;

    v27->_linkLifetimeScope = a13;
    v27->_deleteReason = a14;
  }

  return v27;
}

+ (id)conversationLinkComponentsFromURL:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v44 = a1;
  if ([(id)objc_opt_class() checkMatchingConversationLinkCriteriaForURL:v4])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F29088];
    v6 = NSString;
    uint64_t v7 = [v4 fragment];
    uint64_t v8 = [v6 stringWithFormat:@"?%@", v7];
    BOOL v9 = [v5 componentsWithString:v8];

    if (v9)
    {
      id v43 = v4;
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v42 = v9;
      uint64_t v11 = [v9 queryItems];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (!v12) {
        goto LABEL_30;
      }
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v46;
      while (1)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v46 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v45 + 1) + 8 * v15);
          v17 = [v16 name];
          int v18 = [v17 isEqualToIgnoringCase:@"v"];

          if (v18)
          {
            v19 = [v16 value];
            uint64_t v20 = [v19 integerValue];

            id v21 = [NSNumber numberWithUnsignedInteger:v20];
            id v22 = v10;
            id v23 = v21;
            id v24 = @"v";
LABEL_24:
            [v22 setObject:v23 forKey:v24];
            goto LABEL_25;
          }
          id v25 = [v16 name];
          int v26 = [v25 isEqualToIgnoringCase:@"p"];

          if (v26)
          {
            uint64_t v27 = [v16 value];
            id v21 = [v44 prefixedPseudonymFor:v27];

            if (!v21) {
              goto LABEL_25;
            }
            id v22 = v10;
            id v23 = v21;
            id v24 = @"p";
            goto LABEL_24;
          }
          uint64_t v28 = [v16 name];
          int v29 = [v28 isEqualToIgnoringCase:@"k"];

          if (v29)
          {
            uint64_t v30 = [v16 value];
            id v21 = [v44 publicKeyForBase64EncodedString:v30];

            if (!v21) {
              goto LABEL_25;
            }
            id v22 = v10;
            id v23 = v21;
            id v24 = @"k";
            goto LABEL_24;
          }
          char v31 = [v16 name];
          int v32 = [v31 isEqualToIgnoringCase:@"n"];

          if (v32)
          {
            v33 = TUDefaultLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v34 = [v16 value];
              *(_DWORD *)buf = 138412290;
              v50 = v34;
              _os_log_impl(&dword_19C496000, v33, OS_LOG_TYPE_DEFAULT, "Link had a nickname to pre-fill for the web (%@); we have no use for it, so ignoring",
                buf,
                0xCu);
            }
            id v21 = [v16 value];
            if (v21)
            {
              id v22 = v10;
              id v23 = v21;
              id v24 = @"n";
              goto LABEL_24;
            }
          }
          else
          {
            v35 = [v16 name];
            int v36 = [v35 isEqualToIgnoringCase:@"l"];

            if (v36)
            {
              id v21 = [v16 value];
              if (!v21) {
                goto LABEL_25;
              }
              id v22 = v10;
              id v23 = v21;
              id v24 = @"l";
              goto LABEL_24;
            }
            id v21 = TUDefaultLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v37 = [v16 name];
              uint64_t v38 = [v16 value];
              *(_DWORD *)buf = 138412546;
              v50 = v37;
              __int16 v51 = 2112;
              v52 = v38;
              _os_log_impl(&dword_19C496000, v21, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring unrecognized conversation link fragment query item: \"%@\"=>\"%@\"", buf, 0x16u);
            }
          }
LABEL_25:

          ++v15;
        }
        while (v13 != v15);
        uint64_t v39 = [v11 countByEnumeratingWithState:&v45 objects:v53 count:16];
        uint64_t v13 = v39;
        if (!v39)
        {
LABEL_30:

          uint64_t v40 = (void *)[v10 copy];
          BOOL v9 = v42;
          id v4 = v43;
          goto LABEL_33;
        }
      }
    }
    uint64_t v40 = 0;
LABEL_33:
  }
  else
  {
    uint64_t v40 = 0;
  }

  return v40;
}

+ (id)conversationLinkForURL:(id)a3
{
  id v4 = a3;
  if (![(id)objc_opt_class() checkMatchingConversationLinkCriteriaForURL:v4])
  {
    uint64_t v12 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = [a1 conversationLinkComponentsFromURL:v4];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKey:@"v"];
    unint64_t v8 = [v7 integerValue];

    BOOL v9 = [v6 objectForKey:@"p"];
    id v10 = [v6 objectForKey:@"k"];
    uint64_t v11 = [v6 objectForKey:@"l"];
    if (!v8) {
      goto LABEL_12;
    }
    uint64_t v12 = 0;
    if ([(id)objc_opt_class() conversationLinkVersion] < v8 || !v9 || !v10) {
      goto LABEL_13;
    }
    if ([v9 length] && objc_msgSend(v10, "length"))
    {
      LOBYTE(v14) = 0;
      uint64_t v12 = [[TUConversationLink alloc] initWithPseudonym:v9 publicKey:v10 groupUUID:0 originatorHandle:0 creationDate:0 deletionDate:0 expirationDate:0 invitedMemberHandles:0 locallyCreated:v14 linkName:v11 linkLifetimeScope:0 deleteReason:0];
    }
    else
    {
LABEL_12:
      uint64_t v12 = 0;
    }
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v12 = 0;
LABEL_14:

LABEL_15:

  return v12;
}

- (NSURL)URL
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(TUConversationLink *)self pseudonym];
  if (![v3 length])
  {

    goto LABEL_6;
  }
  id v4 = [(TUConversationLink *)self publicKey];
  uint64_t v5 = [v4 length];

  if (!v5)
  {
LABEL_6:
    id v11 = 0;
    goto LABEL_11;
  }
  v6 = [(TUConversationLink *)self URLFragment];
  if ([v6 length])
  {
    uint64_t v7 = objc_opt_class();
    unint64_t v8 = [(id)objc_opt_class() preferredBaseURL];
    BOOL v9 = [v7 baseURLComponentsForURL:v8];

    [v9 setFragment:v6];
    id v10 = [v9 URL];
  }
  else
  {
    uint64_t v12 = TUDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      uint64_t v15 = self;
      _os_log_impl(&dword_19C496000, v12, OS_LOG_TYPE_DEFAULT, "Cannot return URL; missing URL fragment for %@",
        (uint8_t *)&v14,
        0xCu);
    }

    id v10 = 0;
  }
  id v11 = v10;

LABEL_11:

  return (NSURL *)v11;
}

+ (id)baseURLs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v3 = [a1 baseURLStrings];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = (void *)MEMORY[0x1E4F1CB10];
        BOOL v9 = [NSString stringWithFormat:@"%@://%@", @"https", *(void *)(*((void *)&v14 + 1) + 8 * i)];
        id v10 = [v8 URLWithString:v9];

        if (v10) {
          [v13 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  id v11 = (void *)[v13 copy];

  return v11;
}

+ (id)preferredBaseURLString
{
  v2 = [(id)objc_opt_class() baseURLStrings];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() baseURLStrings];
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)preferredBaseURL
{
  v2 = [(id)objc_opt_class() baseURLs];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() baseURLs];
    uint64_t v5 = [v4 objectAtIndexedSubscript:0];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)baseURLComponentsForURL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
  if (!v4)
  {
    uint64_t v5 = TUDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[TUConversationLink baseURLComponentsForURL:]((uint64_t)v3, v5);
    }
  }

  return v4;
}

- (NSString)URLFragment
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend((id)objc_opt_class(), "conversationLinkVersion"));
  id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
  uint64_t v5 = [MEMORY[0x1E4F290C8] queryItemWithName:@"v" value:v3];
  v23[0] = v5;
  uint64_t v6 = (void *)MEMORY[0x1E4F290C8];
  uint64_t v7 = [(TUConversationLink *)self unprefixedPseudonym];
  unint64_t v8 = [v6 queryItemWithName:@"p" value:v7];
  v23[1] = v8;
  BOOL v9 = (void *)MEMORY[0x1E4F290C8];
  id v10 = [(TUConversationLink *)self base64PublicKey];
  id v11 = [v9 queryItemWithName:@"k" value:v10];
  v23[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];

  uint64_t v13 = [(TUConversationLink *)self linkName];

  if (v13)
  {
    long long v14 = (void *)MEMORY[0x1E4F290C8];
    long long v15 = [(TUConversationLink *)self linkName];
    long long v16 = [v14 queryItemWithName:@"l" value:v15];

    long long v17 = (void *)[v12 mutableCopy];
    [v17 addObject:v16];

    uint64_t v12 = v17;
  }
  [v4 setQueryItems:v12];
  int v18 = [v4 URL];

  if (v18)
  {
    uint64_t v19 = [v4 URL];
    uint64_t v20 = [v19 absoluteString];
    int v18 = [v20 stringByReplacingOccurrencesOfString:@"?" withString:&stru_1EECEA668];
  }
  id v21 = [v18 stringByRemovingPercentEncoding];

  return (NSString *)v21;
}

+ (unint64_t)conversationLinkVersion
{
  return 1;
}

- (id)unprefixedPseudonym
{
  v2 = [(TUConversationLink *)self pseudonym];
  id v3 = [v2 stringByReplacingOccurrencesOfString:@"pseud:" withString:&stru_1EECEA668];

  return v3;
}

- (id)base64PublicKey
{
  v2 = [(TUConversationLink *)self publicKey];
  id v3 = objc_msgSend(v2, "tu_URLSafeBase64EncodedString");

  return v3;
}

+ (id)prefixedPseudonymFor:(id)a3
{
  return (id)[NSString stringWithFormat:@"%@%@", @"pseud:", a3];
}

+ (id)publicKeyForBase64EncodedString:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "tu_dataForURLSafeBase64EncodedString:", a3);
}

+ (BOOL)checkMatchingConversationLinkCriteriaForURL:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  uint64_t v4 = [v26 fragment];
  if (v4
    && (uint64_t v5 = (void *)v4,
        [a1 baseURLs],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v5,
        v7))
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    unint64_t v8 = [a1 baseURLs];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    id v10 = v26;
    if (v9)
    {
      uint64_t v11 = v9;
      uint64_t v12 = *(void *)v30;
      uint64_t v25 = *(void *)v30;
      do
      {
        uint64_t v13 = 0;
        uint64_t v28 = v11;
        do
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v8);
          }
          long long v14 = objc_msgSend(a1, "baseURLComponentsForURL:", *(void *)(*((void *)&v29 + 1) + 8 * v13), v25);
          long long v15 = [v14 scheme];
          long long v16 = [v10 scheme];
          if (!TUStringsAreCaseInsensitiveEqualOrNil(v15, v16)) {
            goto LABEL_13;
          }
          long long v17 = [v14 host];
          int v18 = [v10 host];
          if (!TUStringsAreCaseInsensitiveEqualOrNil(v17, v18))
          {

            uint64_t v11 = v28;
LABEL_13:

            goto LABEL_14;
          }
          [v14 path];
          uint64_t v19 = v8;
          v21 = id v20 = a1;
          id v22 = [v10 path];
          BOOL v27 = TUStringsAreCaseInsensitiveEqualOrNil(v21, v22);

          id v10 = v26;
          a1 = v20;
          unint64_t v8 = v19;
          uint64_t v12 = v25;

          uint64_t v11 = v28;
          if (v27)
          {
            BOOL v23 = 1;
            goto LABEL_18;
          }
LABEL_14:
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v11);
    }
    BOOL v23 = 0;
LABEL_18:
  }
  else
  {
    BOOL v23 = 0;
    id v10 = v26;
  }

  return v23;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  uint64_t v4 = [(TUConversationLink *)self pseudonym];
  [v3 appendFormat:@" pseudonym=%@", v4];

  uint64_t v5 = [(TUConversationLink *)self publicKey];
  [v3 appendFormat:@" publicKey=%@", v5];

  uint64_t v6 = [(TUConversationLink *)self URL];
  [v3 appendFormat:@" URL=%@", v6];

  uint64_t v7 = [(TUConversationLink *)self linkName];
  [v3 appendFormat:@" linkName=%@", v7];

  objc_msgSend(v3, "appendFormat:", @" isLocallyCreated=%d", -[TUConversationLink isLocallyCreated](self, "isLocallyCreated"));
  objc_msgSend(v3, "appendFormat:", @" linkLifetimeScope=%ld", -[TUConversationLink linkLifetimeScope](self, "linkLifetimeScope"));
  BOOL v8 = [(TUConversationLink *)self canCreateConversations];
  uint64_t v9 = @"NO";
  if (v8) {
    uint64_t v9 = @"YES";
  }
  [v3 appendFormat:@" canCreateConversations=%@", v9];
  id v10 = [(TUConversationLink *)self deletionDate];
  [v3 appendFormat:@" deletionDate=%@", v10];

  objc_msgSend(v3, "appendFormat:", @" deleteReason=%ld", -[TUConversationLink deleteReason](self, "deleteReason"));
  uint64_t v11 = self;
  uint64_t v12 = [v11 groupUUID];

  if (v12)
  {
    uint64_t v13 = self;
    long long v14 = [v13 groupUUID];
    [v3 appendFormat:@" self.groupUUID=%@", v14];
  }
  long long v15 = self;
  long long v16 = [v15 originatorHandle];

  if (v16)
  {
    long long v17 = self;
    int v18 = [v17 originatorHandle];
    [v3 appendFormat:@" self.originatorHandle=%@", v18];
  }
  uint64_t v19 = self;
  id v20 = [v19 invitedMemberHandles];

  if (v20)
  {
    id v21 = self;
    id v22 = [v21 invitedMemberHandles];
    [v3 appendFormat:@" self.invitedMemberHandles=%@", v22];
  }
  [v3 appendString:@">"];
  BOOL v23 = (void *)[v3 copy];

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUConversationLink *)self isEqualToConversationLink:v4];

  return v5;
}

- (BOOL)isEquivalentToConversationLink:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 pseudonym];
  uint64_t v6 = [v4 publicKey];

  LOBYTE(self) = [(TUConversationLink *)self isEquivalentToPseudonym:v5 andPublicKey:v6];
  return (char)self;
}

- (BOOL)isEquivalentToPseudonym:(id)a3 andPublicKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(TUConversationLink *)self pseudonym];
  int v9 = TUStringsAreEqualOrNil((unint64_t)v8, (uint64_t)v7);

  if (v9)
  {
    id v10 = [(TUConversationLink *)self publicKey];
    char v11 = TUObjectsAreEqualOrNil((unint64_t)v10, (uint64_t)v6);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)isEqualToConversationLink:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUConversationLink *)self pseudonym];
  id v6 = [v4 pseudonym];
  if (TUStringsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    id v7 = [(TUConversationLink *)self publicKey];
    BOOL v8 = [v4 publicKey];
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      int v9 = [(TUConversationLink *)self groupUUID];
      id v10 = [v4 groupUUID];
      if (TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
      {
        char v11 = [(TUConversationLink *)self originatorHandle];
        uint64_t v12 = [v4 originatorHandle];
        if (TUObjectsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
        {
          long long v29 = v11;
          unint64_t v13 = [(TUConversationLink *)self invitedMemberHandles];
          long long v30 = [v4 invitedMemberHandles];
          long long v31 = (void *)v13;
          if (TUObjectsAreEqualOrNil(v13, (uint64_t)v30))
          {
            unint64_t v14 = [(TUConversationLink *)self creationDate];
            BOOL v27 = [v4 creationDate];
            uint64_t v28 = (void *)v14;
            if (TUObjectsAreEqualOrNil(v14, (uint64_t)v27))
            {
              unint64_t v15 = [(TUConversationLink *)self deletionDate];
              uint64_t v25 = [v4 deletionDate];
              id v26 = (void *)v15;
              if (TUObjectsAreEqualOrNil(v15, (uint64_t)v25))
              {
                unint64_t v16 = [(TUConversationLink *)self linkName];
                BOOL v23 = [v4 linkName];
                id v24 = (void *)v16;
                if (TUObjectsAreEqualOrNil(v16, (uint64_t)v23)
                  && (int v22 = [(TUConversationLink *)self isLocallyCreated],
                      v22 == [v4 isLocallyCreated]))
                {
                  int64_t v19 = [(TUConversationLink *)self linkLifetimeScope];
                  BOOL v20 = v19 == [v4 linkLifetimeScope];
                  char v11 = v29;
                  if (v20)
                  {
                    int64_t v21 = [(TUConversationLink *)self deleteReason];
                    BOOL v17 = v21 == [v4 deleteReason];
                  }
                  else
                  {
                    BOOL v17 = 0;
                  }
                }
                else
                {
                  BOOL v17 = 0;
                  char v11 = v29;
                }
              }
              else
              {
                BOOL v17 = 0;
                char v11 = v29;
              }
            }
            else
            {
              BOOL v17 = 0;
              char v11 = v29;
            }
          }
          else
          {
            BOOL v17 = 0;
            char v11 = v29;
          }
        }
        else
        {
          BOOL v17 = 0;
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  BOOL v23 = [(TUConversationLink *)self pseudonym];
  uint64_t v3 = [v23 hash];
  id v4 = [(TUConversationLink *)self publicKey];
  uint64_t v5 = [v4 hash] ^ v3;
  id v6 = [(TUConversationLink *)self groupUUID];
  uint64_t v7 = [v6 hash];
  BOOL v8 = [(TUConversationLink *)self originatorHandle];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  id v10 = [(TUConversationLink *)self invitedMemberHandles];
  uint64_t v11 = [v10 hash];
  uint64_t v12 = [(TUConversationLink *)self creationDate];
  uint64_t v13 = v11 ^ [v12 hash];
  unint64_t v14 = [(TUConversationLink *)self deletionDate];
  uint64_t v15 = v9 ^ v13 ^ [v14 hash];
  unint64_t v16 = [(TUConversationLink *)self linkName];
  uint64_t v17 = [v16 hash];
  BOOL v18 = [(TUConversationLink *)self isLocallyCreated];
  uint64_t v19 = 1237;
  if (v18) {
    uint64_t v19 = 1231;
  }
  int64_t v20 = v15 ^ v17 ^ v19 ^ [(TUConversationLink *)self linkLifetimeScope];
  unint64_t v21 = v20 ^ [(TUConversationLink *)self deleteReason];

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPseudonym:publicKey:groupUUID:originatorHandle:", self->_pseudonym, self->_publicKey, self->_groupUUID, self->_originatorHandle);
  uint64_t v6 = [(NSSet *)self->_invitedMemberHandles copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v6;

  uint64_t v8 = [(NSDate *)self->_creationDate copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSDate *)self->_deletionDate copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  uint64_t v12 = [(NSString *)self->_linkName copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v12;

  *(unsigned char *)(v5 + 8) = [(TUConversationLink *)self isLocallyCreated];
  *(void *)(v5 + 64) = [(TUConversationLink *)self linkLifetimeScope];
  *(void *)(v5 + 72) = [(TUConversationLink *)self deleteReason];
  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationLink)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = NSStringFromSelector(sel_pseudonym);
  uint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  uint64_t v9 = NSStringFromSelector(sel_publicKey);
  uint64_t v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  uint64_t v12 = NSStringFromSelector(sel_groupUUID);
  uint64_t v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  uint64_t v14 = objc_opt_class();
  uint64_t v15 = NSStringFromSelector(sel_originatorHandle);
  unint64_t v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

  uint64_t v17 = [(TUConversationLink *)self initWithPseudonym:v7 publicKey:v10 groupUUID:v13 originatorHandle:v16];
  if (v17)
  {
    BOOL v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    int64_t v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    unint64_t v21 = NSStringFromSelector(sel_invitedMemberHandles);
    uint64_t v22 = [v4 decodeObjectOfClasses:v20 forKey:v21];
    invitedMemberHandles = v17->_invitedMemberHandles;
    v17->_invitedMemberHandles = (NSSet *)v22;

    uint64_t v24 = objc_opt_class();
    uint64_t v25 = NSStringFromSelector(sel_creationDate);
    uint64_t v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
    creationDate = v17->_creationDate;
    v17->_creationDate = (NSDate *)v26;

    uint64_t v28 = objc_opt_class();
    long long v29 = NSStringFromSelector(sel_deletionDate);
    uint64_t v30 = [v4 decodeObjectOfClass:v28 forKey:v29];
    deletionDate = v17->_deletionDate;
    v17->_deletionDate = (NSDate *)v30;

    uint64_t v32 = objc_opt_class();
    v33 = NSStringFromSelector(sel_linkName);
    uint64_t v34 = [v4 decodeObjectOfClass:v32 forKey:v33];
    linkName = v17->_linkName;
    v17->_linkName = (NSString *)v34;

    int v36 = NSStringFromSelector(sel_isLocallyCreated);
    v17->_locallyCreated = [v4 decodeBoolForKey:v36];

    v37 = NSStringFromSelector(sel_linkLifetimeScope);
    v17->_linkLifetimeScope = [v4 decodeIntegerForKey:v37];

    uint64_t v38 = NSStringFromSelector(sel_deleteReason);
    v17->_deleteReason = [v4 decodeIntegerForKey:v38];
  }
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  pseudonym = self->_pseudonym;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_pseudonym);
  [v5 encodeObject:pseudonym forKey:v6];

  publicKey = self->_publicKey;
  uint64_t v8 = NSStringFromSelector(sel_publicKey);
  [v5 encodeObject:publicKey forKey:v8];

  groupUUID = self->_groupUUID;
  uint64_t v10 = NSStringFromSelector(sel_groupUUID);
  [v5 encodeObject:groupUUID forKey:v10];

  originatorHandle = self->_originatorHandle;
  uint64_t v12 = NSStringFromSelector(sel_originatorHandle);
  [v5 encodeObject:originatorHandle forKey:v12];

  invitedMemberHandles = self->_invitedMemberHandles;
  uint64_t v14 = NSStringFromSelector(sel_invitedMemberHandles);
  [v5 encodeObject:invitedMemberHandles forKey:v14];

  creationDate = self->_creationDate;
  unint64_t v16 = NSStringFromSelector(sel_creationDate);
  [v5 encodeObject:creationDate forKey:v16];

  deletionDate = self->_deletionDate;
  BOOL v18 = NSStringFromSelector(sel_deletionDate);
  [v5 encodeObject:deletionDate forKey:v18];

  linkName = self->_linkName;
  int64_t v20 = NSStringFromSelector(sel_linkName);
  [v5 encodeObject:linkName forKey:v20];

  BOOL locallyCreated = self->_locallyCreated;
  uint64_t v22 = NSStringFromSelector(sel_isLocallyCreated);
  [v5 encodeBool:locallyCreated forKey:v22];

  int64_t linkLifetimeScope = self->_linkLifetimeScope;
  uint64_t v24 = NSStringFromSelector(sel_linkLifetimeScope);
  [v5 encodeInteger:linkLifetimeScope forKey:v24];

  int64_t deleteReason = self->_deleteReason;
  NSStringFromSelector(sel_deleteReason);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:deleteReason forKey:v26];
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"pseudonym"])
  {
    uint64_t v5 = [(TUConversationLink *)self pseudonym];
LABEL_3:
    uint64_t v6 = (void *)v5;
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"publicKey"])
  {
    uint64_t v7 = [(TUConversationLink *)self publicKey];
    uint64_t v8 = [v7 base64EncodedStringWithOptions:0];
LABEL_8:
    uint64_t v6 = (void *)v8;

    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"groupUUID"])
  {
    uint64_t v7 = [(TUConversationLink *)self groupUUID];
    uint64_t v8 = [v7 UUIDString];
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"originatorHandle"])
  {
    uint64_t v5 = [(TUConversationLink *)self originatorHandle];
    goto LABEL_3;
  }
  uint64_t v6 = 0;
LABEL_9:

  return v6;
}

- (NSString)pseudonym
{
  return self->_pseudonym;
}

- (void)setPseudonym:(id)a3
{
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (NSDate)deletionDate
{
  return self->_deletionDate;
}

- (void)setDeletionDate:(id)a3
{
}

- (NSUUID)groupUUID
{
  return self->_groupUUID;
}

- (void)setGroupUUID:(id)a3
{
}

- (BOOL)isLocallyCreated
{
  return self->_locallyCreated;
}

- (void)setLocallyCreated:(BOOL)a3
{
  self->_BOOL locallyCreated = a3;
}

- (TUHandle)originatorHandle
{
  return self->_originatorHandle;
}

- (void)setOriginatorHandle:(id)a3
{
}

- (int64_t)linkLifetimeScope
{
  return self->_linkLifetimeScope;
}

- (void)setLinkLifetimeScope:(int64_t)a3
{
  self->_int64_t linkLifetimeScope = a3;
}

- (int64_t)deleteReason
{
  return self->_deleteReason;
}

- (void)setDeleteReason:(int64_t)a3
{
  self->_int64_t deleteReason = a3;
}

- (void)setURLFragment:(id)a3
{
}

- (void)setLinkName:(id)a3
{
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (NSSet)invitedMemberHandles
{
  return self->_invitedMemberHandles;
}

- (void)setInvitedMemberHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitedMemberHandles, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_linkName, 0);
  objc_storeStrong((id *)&self->_URLFragment, 0);
  objc_storeStrong((id *)&self->_originatorHandle, 0);
  objc_storeStrong((id *)&self->_groupUUID, 0);
  objc_storeStrong((id *)&self->_deletionDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);

  objc_storeStrong((id *)&self->_pseudonym, 0);
}

+ (void)baseURLComponentsForURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C496000, a2, OS_LOG_TYPE_ERROR, "Failed to parse URL components for %@", (uint8_t *)&v2, 0xCu);
}

@end