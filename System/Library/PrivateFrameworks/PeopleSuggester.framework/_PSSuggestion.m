@interface _PSSuggestion
+ (BOOL)supportsSecureCoding;
+ (id)suggestionForBundleID:(id)a3 derivedIntentIdentifier:(id)a4 knowledgeStore:(id)a5 contactResolver:(id)a6 reason:(id)a7 reasonType:(id)a8;
- (BOOL)familySuggestion;
- (BOOL)isAdaptedModelCreated;
- (BOOL)isAdaptedModelUsed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReturnToSender;
- (INImage)image;
- (NSArray)recipients;
- (NSDictionary)modelSuggestionProxies;
- (NSNumber)score;
- (NSString)adaptedModelRecipeID;
- (NSString)bundleID;
- (NSString)conversationIdentifier;
- (NSString)derivedIntentIdentifier;
- (NSString)description;
- (NSString)groupName;
- (NSString)messagesGroupIdentifier;
- (NSString)reason;
- (NSString)reasonType;
- (NSString)supportedBundleIDs;
- (NSString)trialID;
- (NSString)utiList;
- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6;
- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6 derivedIntentIdentifier:(id)a7 image:(id)a8 reason:(id)a9 reasonType:(id)a10 score:(id)a11;
- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6 derivedIntentIdentifier:(id)a7 image:(id)a8 reason:(id)a9 reasonType:(id)a10 score:(id)a11 familySuggestion:(BOOL)a12;
- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6 reason:(id)a7 reasonType:(id)a8;
- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6 reason:(id)a7 reasonType:(id)a8 score:(id)a9;
- (_PSSuggestion)initWithBundleID:(id)a3 recipients:(id)a4;
- (_PSSuggestion)initWithCoder:(id)a3;
- (int64_t)suggestionType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAdaptedModelRecipeID:(id)a3;
- (void)setImage:(id)a3;
- (void)setIsAdaptedModelCreated:(BOOL)a3;
- (void)setIsAdaptedModelUsed:(BOOL)a3;
- (void)setMessagesGroupIdentifier:(id)a3;
- (void)setModelSuggestionProxies:(id)a3;
- (void)setReason:(id)a3;
- (void)setReasonType:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSuggestionType:(int64_t)a3;
- (void)setSupportedBundleIDs:(id)a3;
- (void)setTrialID:(id)a3;
- (void)setUtiList:(id)a3;
@end

@implementation _PSSuggestion

- (_PSSuggestion)initWithBundleID:(id)a3 recipients:(id)a4
{
  return [(_PSSuggestion *)self initWithBundleID:a3 conversationIdentifier:0 groupName:0 recipients:a4];
}

- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6
{
  return [(_PSSuggestion *)self initWithBundleID:a3 conversationIdentifier:a4 groupName:a5 recipients:a6 reason:0 reasonType:0];
}

- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6 reason:(id)a7 reasonType:(id)a8
{
  return [(_PSSuggestion *)self initWithBundleID:a3 conversationIdentifier:a4 groupName:a5 recipients:a6 derivedIntentIdentifier:0 image:0 reason:a7 reasonType:a8 score:0];
}

- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6 reason:(id)a7 reasonType:(id)a8 score:(id)a9
{
  return [(_PSSuggestion *)self initWithBundleID:a3 conversationIdentifier:a4 groupName:a5 recipients:a6 derivedIntentIdentifier:0 image:0 reason:a7 reasonType:a8 score:a9];
}

- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6 derivedIntentIdentifier:(id)a7 image:(id)a8 reason:(id)a9 reasonType:(id)a10 score:(id)a11
{
  LOBYTE(v12) = 0;
  return [(_PSSuggestion *)self initWithBundleID:a3 conversationIdentifier:a4 groupName:a5 recipients:a6 derivedIntentIdentifier:a7 image:a8 reason:a9 reasonType:a10 score:a11 familySuggestion:v12];
}

- (_PSSuggestion)initWithBundleID:(id)a3 conversationIdentifier:(id)a4 groupName:(id)a5 recipients:(id)a6 derivedIntentIdentifier:(id)a7 image:(id)a8 reason:(id)a9 reasonType:(id)a10 score:(id)a11 familySuggestion:(BOOL)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v45 = a8;
  id v23 = a9;
  id v24 = a10;
  id v44 = a11;
  v46.receiver = self;
  v46.super_class = (Class)_PSSuggestion;
  v25 = [(_PSSuggestion *)&v46 init];
  if (v25)
  {
    uint64_t v26 = [v19 copy];
    v27 = (void *)*((void *)v25 + 2);
    *((void *)v25 + 2) = v26;

    uint64_t v28 = [v20 copy];
    v29 = (void *)*((void *)v25 + 3);
    *((void *)v25 + 3) = v28;

    uint64_t v30 = [v21 copy];
    v31 = (void *)*((void *)v25 + 4);
    *((void *)v25 + 4) = v30;

    uint64_t v32 = [v18 copy];
    v33 = (void *)*((void *)v25 + 5);
    *((void *)v25 + 5) = v32;

    uint64_t v34 = [v22 copy];
    v35 = (void *)*((void *)v25 + 8);
    *((void *)v25 + 8) = v34;

    objc_storeStrong((id *)v25 + 6, a8);
    uint64_t v36 = [v23 copy];
    v37 = (void *)*((void *)v25 + 15);
    *((void *)v25 + 15) = v36;

    uint64_t v38 = [v24 copy];
    v39 = (void *)*((void *)v25 + 16);
    *((void *)v25 + 16) = v38;

    v40 = (void *)*((void *)v25 + 17);
    *((void *)v25 + 17) = @"null";

    objc_storeStrong((id *)v25 + 10, a11);
    v25[8] = a12;
    *(_WORD *)(v25 + 9) = 0;
    v41 = (void *)*((void *)v25 + 11);
    *((void *)v25 + 11) = 0;

    if ((unint64_t)[v21 count] < 2)
    {
      if ([v21 count] != 1)
      {
        *((void *)v25 + 7) = 0;
        goto LABEL_8;
      }
      uint64_t v42 = 1;
    }
    else
    {
      uint64_t v42 = 2;
    }
    *((void *)v25 + 7) = v42;
  }
LABEL_8:

  return (_PSSuggestion *)v25;
}

+ (id)suggestionForBundleID:(id)a3 derivedIntentIdentifier:(id)a4 knowledgeStore:(id)a5 contactResolver:(id)a6 reason:(id)a7 reasonType:(id)a8
{
  v85[2] = *MEMORY[0x1E4F143B8];
  v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v67 = a7;
  id v72 = a8;
  v17 = (void *)MEMORY[0x1E4F5B5D0];
  id v18 = [MEMORY[0x1E4F5B550] derivedIntentIdentifier];
  uint64_t v19 = [v17 predicateForObjectsWithMetadataKey:v18 andStringValue:v14];

  id v20 = (void *)MEMORY[0x1E4F5B5D0];
  id v21 = [MEMORY[0x1E4F5B5F0] intentsSourceID];
  uint64_t v22 = [v20 predicateForEventsWithSourceID:v21 bundleID:v13];

  id v23 = (void *)MEMORY[0x1E4F28BA0];
  v66 = (void *)v19;
  v85[0] = v19;
  v85[1] = v22;
  v71 = (void *)v22;
  id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:2];
  uint64_t v25 = [v23 andPredicateWithSubpredicates:v24];

  uint64_t v26 = [MEMORY[0x1E4F5B5D0] startDateSortDescriptorAscending:0];
  v27 = (void *)MEMORY[0x1E4F5B518];
  uint64_t v28 = [MEMORY[0x1E4F5B5F8] appIntentsStream];
  v84 = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
  v69 = (void *)v26;
  uint64_t v83 = v26;
  uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
  v70 = (void *)v25;
  v31 = [v27 eventQueryWithPredicate:v25 eventStreams:v29 offset:0 limit:1 sortDescriptors:v30];

  uint64_t v32 = [NSString stringWithUTF8String:"_PSSuggestion.m"];
  v33 = objc_msgSend(v32, "stringByAppendingFormat:", @":%d", 836);
  [v31 setClientName:v33];

  [v31 setTracker:&__block_literal_global_261_0];
  id v77 = 0;
  uint64_t v34 = [v15 executeQuery:v31 error:&v77];
  id v68 = v77;
  if (v68)
  {
    v35 = +[_PSLogging knnChannel];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      +[_PSSuggestion suggestionForBundleID:derivedIntentIdentifier:knowledgeStore:contactResolver:reason:reasonType:]();
    }
    uint64_t v36 = 0;
    v37 = v66;
    uint64_t v38 = v67;
  }
  else
  {
    v39 = [v34 firstObject];
    v35 = v39;
    if (v39)
    {
      v40 = [v39 interaction];
      uint64_t v41 = [v40 intent];
      v64 = v13;
      v65 = v40;
      v63 = (void *)v41;
      if (v41 && (uint64_t v42 = (void *)v41, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v60 = v34;
        id v61 = v15;
        id v62 = v14;
        v43 = v42;
        id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v73 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        v59 = v43;
        id v45 = [v43 recipients];
        uint64_t v46 = [v45 countByEnumeratingWithState:&v73 objects:v78 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v74;
          do
          {
            for (uint64_t i = 0; i != v47; ++i)
            {
              if (*(void *)v74 != v48) {
                objc_enumerationMutation(v45);
              }
              v50 = +[_PSRecipient recipientForINPerson:*(void *)(*((void *)&v73 + 1) + 8 * i) contactResolver:v16];
              if (v50) {
                [v44 addObject:v50];
              }
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v73 objects:v78 count:16];
          }
          while (v47);
        }

        v51 = [_PSSuggestion alloc];
        v52 = v59;
        v58 = [v59 speakableGroupName];
        v57 = [v58 spokenPhrase];
        v53 = (void *)[v44 copy];
        v54 = [v59 keyImage];
        uint64_t v38 = v67;
        uint64_t v36 = [(_PSSuggestion *)v51 initWithBundleID:v64 conversationIdentifier:0 groupName:v57 recipients:v53 derivedIntentIdentifier:v62 image:v54 reason:v67 reasonType:v72 score:0];

        id v14 = v62;
        uint64_t v34 = v60;
        id v15 = v61;
        v37 = v66;
      }
      else
      {
        v52 = +[_PSLogging knnChannel];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v80 = v35;
          _os_log_impl(&dword_1A314B000, v52, OS_LOG_TYPE_INFO, "Could not retrieve send message intent from _DKEvent: %@", buf, 0xCu);
        }
        uint64_t v36 = 0;
        v37 = v66;
        uint64_t v38 = v67;
      }

      v13 = v64;
    }
    else
    {
      v55 = +[_PSLogging knnChannel];
      v65 = v55;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v80 = v13;
        __int16 v81 = 2112;
        id v82 = v14;
        _os_log_impl(&dword_1A314B000, v55, OS_LOG_TYPE_INFO, "No intent with bundleID: %@, derived identifier: %@", buf, 0x16u);
      }
      uint64_t v36 = 0;
      v37 = v66;
      uint64_t v38 = v67;
    }
  }

  return v36;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_PSSuggestion;
  v5 = [(_PSSuggestion *)&v46 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"conversationIdentifier"];
    conversationIdentifier = v5->_conversationIdentifier;
    v5->_conversationIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupName"];
    groupName = v5->_groupName;
    v5->_groupName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"derivedIntentIdentifier"];
    derivedIntentIdentifier = v5->_derivedIntentIdentifier;
    v5->_derivedIntentIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (INImage *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reasonType"];
    reasonType = v5->_reasonType;
    v5->_reasonType = (NSString *)v18;

    id v20 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"recipients"];
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trialID"];
    trialID = v5->_trialID;
    v5->_trialID = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"score"];
    score = v5->_score;
    v5->_score = (NSNumber *)v27;

    v5->_isAdaptedModelCreated = [v4 decodeBoolForKey:@"isAdaptedModelCreated"];
    v5->_isAdaptedModelUsed = [v4 decodeBoolForKey:@"isAdaptedModelUsed"];
    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adaptedModelRecipeID"];
    adaptedModelRecipeID = v5->_adaptedModelRecipeID;
    v5->_adaptedModelRecipeID = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportedBundleIDs"];
    supportedBundleIDs = v5->_supportedBundleIDs;
    v5->_supportedBundleIDs = (NSString *)v31;

    v33 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v33, "setWithObjects:", v34, v35, v36, objc_opt_class(), 0);
    uint64_t v38 = [v4 decodeObjectOfClasses:v37 forKey:@"modelSuggestionProxies"];
    modelSuggestionProxies = v5->_modelSuggestionProxies;
    v5->_modelSuggestionProxies = (NSDictionary *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"utiList"];
    utiList = v5->_utiList;
    v5->_utiList = (NSString *)v40;

    v5->_familySuggestion = [v4 decodeBoolForKey:@"familySuggestion"];
    uint64_t v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messagesGroupIdentifier"];
    messagesGroupIdentifier = v5->_messagesGroupIdentifier;
    v5->_messagesGroupIdentifier = (NSString *)v42;

    id v44 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  conversationIdentifier = self->_conversationIdentifier;
  id v5 = a3;
  [v5 encodeObject:conversationIdentifier forKey:@"conversationIdentifier"];
  [v5 encodeObject:self->_groupName forKey:@"groupName"];
  [v5 encodeObject:self->_bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_derivedIntentIdentifier forKey:@"derivedIntentIdentifier"];
  [v5 encodeObject:self->_image forKey:@"image"];
  [v5 encodeObject:self->_reason forKey:@"reason"];
  [v5 encodeObject:self->_reasonType forKey:@"reasonType"];
  [v5 encodeObject:self->_recipients forKey:@"recipients"];
  [v5 encodeObject:self->_trialID forKey:@"trialID"];
  [v5 encodeObject:self->_score forKey:@"score"];
  [v5 encodeBool:self->_isAdaptedModelCreated forKey:@"isAdaptedModelCreated"];
  [v5 encodeBool:self->_isAdaptedModelUsed forKey:@"isAdaptedModelUsed"];
  [v5 encodeObject:self->_adaptedModelRecipeID forKey:@"adaptedModelRecipeID"];
  [v5 encodeObject:self->_supportedBundleIDs forKey:@"supportedBundleIDs"];
  [v5 encodeObject:self->_modelSuggestionProxies forKey:@"modelSuggestionProxies"];
  [v5 encodeObject:self->_utiList forKey:@"utiList"];
  [v5 encodeBool:self->_familySuggestion forKey:@"familySuggestion"];
  [v5 encodeObject:self->_messagesGroupIdentifier forKey:@"messagesGroupIdentifier"];
}

- (NSString)description
{
  id v15 = NSString;
  uint64_t v14 = objc_opt_class();
  v3 = [(_PSSuggestion *)self conversationIdentifier];
  id v4 = [(_PSSuggestion *)self groupName];
  id v5 = [(_PSSuggestion *)self bundleID];
  uint64_t v6 = [(_PSSuggestion *)self reason];
  v7 = [(_PSSuggestion *)self reasonType];
  uint64_t v8 = [(_PSSuggestion *)self recipients];
  v9 = [(_PSSuggestion *)self image];
  uint64_t v10 = [(_PSSuggestion *)self derivedIntentIdentifier];
  v11 = [(_PSSuggestion *)self trialID];
  uint64_t v12 = [v15 stringWithFormat:@"<%@ %p> conversationIdentifier: %@, groupName: %@, bundleID: %@, reason: %@, reasonType: %@, recipients: %@, image: %@, derivedIntentIdentifier: %@, trialID: %@", v14, self, v3, v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (unint64_t)hash
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = [(_PSSuggestion *)self recipients];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier];
        v6 ^= [v9 hash];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  NSUInteger v10 = [(NSString *)self->_conversationIdentifier hash];
  return v10 ^ v6 ^ [(NSString *)self->_groupName hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_PSSuggestion *)a3;
  uint64_t v5 = v4;
  if (self == v4)
  {
    char v54 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [(_PSSuggestion *)self conversationIdentifier];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      v9 = [(_PSSuggestion *)v6 conversationIdentifier];

      if (v9)
      {
        NSUInteger v10 = [(_PSSuggestion *)self conversationIdentifier];
        v11 = [(_PSSuggestion *)v6 conversationIdentifier];
        int v12 = [v10 isEqualToString:v11];

        if (!v12) {
          goto LABEL_28;
        }
      }
    }
    uint64_t v13 = [(_PSSuggestion *)self groupName];
    if (v13)
    {
      long long v14 = (void *)v13;
      long long v15 = [(_PSSuggestion *)v6 groupName];

      if (v15)
      {
        uint64_t v16 = [(_PSSuggestion *)self groupName];
        uint64_t v17 = [(_PSSuggestion *)v6 groupName];
        int v18 = [v16 isEqualToString:v17];

        if (!v18) {
          goto LABEL_28;
        }
      }
    }
    uint64_t v19 = [(_PSSuggestion *)self bundleID];
    if (v19)
    {
      id v20 = (void *)v19;
      uint64_t v21 = [(_PSSuggestion *)v6 bundleID];

      if (v21)
      {
        uint64_t v22 = [(_PSSuggestion *)self bundleID];
        uint64_t v23 = [(_PSSuggestion *)v6 bundleID];
        int v24 = [v22 isEqualToString:v23];

        if (!v24) {
          goto LABEL_28;
        }
      }
    }
    uint64_t v25 = [(_PSSuggestion *)v6 recipients];
    uint64_t v26 = [v25 count];
    uint64_t v27 = [(_PSSuggestion *)self recipients];
    uint64_t v28 = [v27 count];

    if (v26 != v28)
    {
LABEL_28:
      char v54 = 0;
    }
    else
    {
      id v29 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v30 = [(_PSSuggestion *)self recipients];
      uint64_t v31 = [v30 count];

      if (v31)
      {
        unint64_t v32 = 0;
        do
        {
          v33 = [(_PSSuggestion *)self recipients];
          uint64_t v34 = [v33 objectAtIndexedSubscript:v32];
          uint64_t v35 = [v34 handle];

          if (v35)
          {
            uint64_t v36 = [(_PSSuggestion *)self recipients];
            v37 = [v36 objectAtIndexedSubscript:v32];
            uint64_t v38 = [v37 handle];
            [v29 addObject:v38];
          }
          ++v32;
          v39 = [(_PSSuggestion *)self recipients];
          unint64_t v40 = [v39 count];
        }
        while (v40 > v32);
      }
      id v41 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v42 = [(_PSSuggestion *)v6 recipients];
      uint64_t v43 = [v42 count];

      if (v43)
      {
        unint64_t v44 = 0;
        do
        {
          id v45 = [(_PSSuggestion *)v6 recipients];
          objc_super v46 = [v45 objectAtIndexedSubscript:v44];
          uint64_t v47 = [v46 handle];

          if (v47)
          {
            uint64_t v48 = [(_PSSuggestion *)v6 recipients];
            v49 = [v48 objectAtIndexedSubscript:v44];
            v50 = [v49 handle];
            [v41 addObject:v50];
          }
          ++v44;
          v51 = [(_PSSuggestion *)v6 recipients];
          unint64_t v52 = [v51 count];
        }
        while (v52 > v44);
      }
      uint64_t v53 = [v41 count];
      if (v53 == [v29 count]) {
        char v54 = [v29 isEqualToSet:v41];
      }
      else {
        char v54 = 0;
      }
    }
  }
  else
  {
    char v54 = 0;
  }

  return v54;
}

- (BOOL)isReturnToSender
{
  v3 = +[_PSConstants returnToSenderReason];
  uint64_t v4 = [(_PSSuggestion *)self reason];
  char v5 = [v3 isEqual:v4];

  return v5;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (INImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (int64_t)suggestionType
{
  return self->_suggestionType;
}

- (void)setSuggestionType:(int64_t)a3
{
  self->_suggestionType = a3;
}

- (NSString)derivedIntentIdentifier
{
  return self->_derivedIntentIdentifier;
}

- (NSString)messagesGroupIdentifier
{
  return self->_messagesGroupIdentifier;
}

- (void)setMessagesGroupIdentifier:(id)a3
{
}

- (NSNumber)score
{
  return self->_score;
}

- (BOOL)familySuggestion
{
  return self->_familySuggestion;
}

- (BOOL)isAdaptedModelCreated
{
  return self->_isAdaptedModelCreated;
}

- (void)setIsAdaptedModelCreated:(BOOL)a3
{
  self->_isAdaptedModelCreated = a3;
}

- (BOOL)isAdaptedModelUsed
{
  return self->_isAdaptedModelUsed;
}

- (void)setIsAdaptedModelUsed:(BOOL)a3
{
  self->_isAdaptedModelUsed = a3;
}

- (NSString)adaptedModelRecipeID
{
  return self->_adaptedModelRecipeID;
}

- (void)setAdaptedModelRecipeID:(id)a3
{
}

- (NSString)supportedBundleIDs
{
  return self->_supportedBundleIDs;
}

- (void)setSupportedBundleIDs:(id)a3
{
}

- (NSString)utiList
{
  return self->_utiList;
}

- (void)setUtiList:(id)a3
{
}

- (NSDictionary)modelSuggestionProxies
{
  return self->_modelSuggestionProxies;
}

- (void)setModelSuggestionProxies:(id)a3
{
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (NSString)reasonType
{
  return self->_reasonType;
}

- (void)setReasonType:(id)a3
{
}

- (NSString)trialID
{
  return self->_trialID;
}

- (void)setTrialID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialID, 0);
  objc_storeStrong((id *)&self->_reasonType, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_modelSuggestionProxies, 0);
  objc_storeStrong((id *)&self->_utiList, 0);
  objc_storeStrong((id *)&self->_supportedBundleIDs, 0);
  objc_storeStrong((id *)&self->_adaptedModelRecipeID, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_messagesGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_derivedIntentIdentifier, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_groupName, 0);

  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
}

+ (void)suggestionForBundleID:derivedIntentIdentifier:knowledgeStore:contactResolver:reason:reasonType:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_1A314B000, v0, v1, "Error retrieving intent: %@", v2, v3, v4, v5, v6);
}

@end