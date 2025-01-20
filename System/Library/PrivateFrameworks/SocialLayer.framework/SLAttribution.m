@interface SLAttribution
+ (BOOL)supportsSecureCoding;
+ (id)errorForAttributionDomain:(id)a3 andCode:(int64_t)a4 andUnderlyingError:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFromMe;
- (BOOL)isGroupConversation;
- (BOOL)isLean;
- (BOOL)isPinned;
- (NSArray)relatedPersons;
- (NSDate)timestamp;
- (NSString)attachmentGUID;
- (NSString)conversationIdentifier;
- (NSString)groupDisplayName;
- (NSString)sourceAppDisplayName;
- (NSString)uniqueIdentifier;
- (NSURL)groupPhotoPath;
- (NSUUID)groupID;
- (SLAttribution)initWithCSSearchableItem:(id)a3 error:(id *)a4;
- (SLAttribution)initWithCoder:(id)a3;
- (SLAttribution)initWithDictionary:(id)a3;
- (SLAttribution)initWithIdentifier:(id)a3 error:(id *)a4;
- (SLAttribution)initWithPortraitAttribution:(id)a3 error:(id *)a4;
- (SLPerson)sender;
- (_SWCollaborationMetadata)collaborationMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)portraitAttribution;
- (unint64_t)hash;
- (void)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setLean:(BOOL)a3;
@end

@implementation SLAttribution

- (SLAttribution)initWithIdentifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLAttribution;
  v8 = [(SLAttribution *)&v11 init];
  if (!v8) {
    goto LABEL_4;
  }
  if ([v7 length])
  {
    objc_storeStrong((id *)&v8->_uniqueIdentifier, a3);
    v8->_lean = 1;
LABEL_4:
    v9 = v8;
    goto LABEL_5;
  }
  if (a4)
  {
    [(id)objc_opt_class() errorForAttributionDomain:@"com.apple.SocialLayer.SLAttributionErrorDomain" andCode:2 andUnderlyingError:0];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
LABEL_5:

  return v9;
}

- (SLAttribution)initWithPortraitAttribution:(id)a3 error:(id *)a4
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v72.receiver = self;
  v72.super_class = (Class)SLAttribution;
  id v7 = [(SLAttribution *)&v72 init];
  if (!v7)
  {
LABEL_47:
    v36 = v7;
    goto LABEL_48;
  }
  if (v6)
  {
    v8 = [v6 identifier];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = [v6 identifier];
      uniqueIdentifier = v7->_uniqueIdentifier;
      v7->_uniqueIdentifier = (NSString *)v10;

      v12 = [v6 sourceAppDisplayName];
      uint64_t v13 = [v12 length];

      if (v13)
      {
        uint64_t v14 = [v6 sourceAppDisplayName];
        sourceAppDisplayName = v7->_sourceAppDisplayName;
        v7->_sourceAppDisplayName = (NSString *)v14;

        v16 = [v6 conversationIdentifier];
        uint64_t v17 = [v16 length];

        if (v17)
        {
          uint64_t v18 = [v6 conversationIdentifier];
          conversationIdentifier = v7->_conversationIdentifier;
          v7->_conversationIdentifier = (NSString *)v18;

          if (objc_opt_respondsToSelector()) {
            v7->_pinned = [v6 isStarred];
          }
          v61 = a4;
          uint64_t v20 = [v6 groupPhotoPath];
          groupPhotoPath = v7->_groupPhotoPath;
          v7->_groupPhotoPath = (NSURL *)v20;

          id obj = (id)objc_opt_new();
          long long v68 = 0u;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          v22 = [v6 relatedPeople];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v68 objects:v75 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            id v25 = 0;
            uint64_t v26 = *(void *)v69;
            while (2)
            {
              uint64_t v27 = 0;
              v28 = v25;
              do
              {
                if (*(void *)v69 != v26) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v29 = *(void *)(*((void *)&v68 + 1) + 8 * v27);
                v30 = [SLPerson alloc];
                id v67 = v28;
                v31 = [(SLPerson *)v30 initWithPortraitPerson:v29 error:&v67];
                id v25 = v67;

                if (!v31)
                {
                  if (v61)
                  {
                    id v66 = v25;
                    v34 = [(id)objc_opt_class() errorForAttributionDomain:@"com.apple.SocialLayer.SLAttributionErrorDomain" andCode:6 andUnderlyingError:&v66];
                    id v35 = v66;

                    id *v61 = v34;
                    id v25 = v35;
                  }

                  goto LABEL_25;
                }
                [obj addObject:v31];

                ++v27;
                v28 = v25;
              }
              while (v24 != v27);
              uint64_t v24 = [v22 countByEnumeratingWithState:&v68 objects:v75 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }
          else
          {
            id v25 = 0;
          }

          objc_storeStrong((id *)&v7->_relatedPersons, obj);
          v37 = [SLPerson alloc];
          v38 = [v6 sender];
          id v65 = v25;
          v39 = [(SLPerson *)v37 initWithPortraitPerson:v38 error:&v65];
          id v40 = v65;

          if (v39)
          {
            objc_storeStrong((id *)&v7->_sender, v39);
            if (objc_opt_respondsToSelector()) {
              v7->_fromMe = [v6 isFromMe];
            }
            v41 = [v6 relatedPeople];
            v7->_isGroupConversation = (unint64_t)[v41 count] > 2;

            if (v7->_isGroupConversation)
            {
              uint64_t v42 = [v6 groupDisplayName];
              groupDisplayName = v7->_groupDisplayName;
              v7->_groupDisplayName = (NSString *)v42;

              if (objc_opt_respondsToSelector())
              {
                id v44 = objc_alloc(MEMORY[0x1E4F29128]);
                v45 = [v6 groupId];
                uint64_t v46 = [v44 initWithUUIDString:v45];
                groupID = v7->_groupID;
                v7->_groupID = (NSUUID *)v46;
              }
            }
            v7->_lean = 0;
            uint64_t v48 = [v6 timestamp];
            timestamp = v7->_timestamp;
            v7->_timestamp = (NSDate *)v48;

            if (objc_opt_respondsToSelector())
            {
              v50 = (void *)MEMORY[0x1E4F28DC0];
              uint64_t v51 = objc_opt_class();
              v52 = [v6 collaborationMetadata];
              id v63 = 0;
              v53 = [v50 unarchivedObjectOfClass:v51 fromData:v52 error:&v63];
              id v54 = v63;

              if (v53)
              {
                v55 = v53;
                collaborationMetadata = v7->_collaborationMetadata;
                v7->_collaborationMetadata = v55;
              }
              else
              {
                collaborationMetadata = SLFrameworkLogHandle();
                if (os_log_type_enabled(collaborationMetadata, OS_LOG_TYPE_INFO))
                {
                  v59 = [v54 description];
                  *(_DWORD *)buf = 138412290;
                  v74 = v59;
                  _os_log_impl(&dword_19BE17000, collaborationMetadata, OS_LOG_TYPE_INFO, "Failed to unarchive Collaboration Metadata: %@", buf, 0xCu);
                }
              }
            }
            goto LABEL_47;
          }
          if (v61)
          {
            id v64 = v40;
            v57 = [(id)objc_opt_class() errorForAttributionDomain:@"com.apple.SocialLayer.SLAttributionErrorDomain" andCode:5 andUnderlyingError:&v64];
            id v58 = v64;

            id *v61 = v57;
            id v40 = v58;
          }

LABEL_25:
          goto LABEL_29;
        }
        if (a4)
        {
          v32 = objc_opt_class();
          uint64_t v33 = 4;
          goto LABEL_28;
        }
LABEL_29:
        v36 = 0;
        goto LABEL_48;
      }
      if (!a4) {
        goto LABEL_29;
      }
      v32 = objc_opt_class();
      uint64_t v33 = 3;
    }
    else
    {
      if (!a4) {
        goto LABEL_29;
      }
      v32 = objc_opt_class();
      uint64_t v33 = 2;
    }
  }
  else
  {
    v32 = objc_opt_class();
    uint64_t v33 = 1;
  }
LABEL_28:
  [v32 errorForAttributionDomain:@"com.apple.SocialLayer.SLAttributionErrorDomain" andCode:v33 andUnderlyingError:0];
  v36 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_48:

  return v36;
}

- (id)portraitAttribution
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v4 = [(SLAttribution *)self relatedPersons];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v10 = objc_alloc(MEMORY[0x1E4F89F38]);
        objc_super v11 = [v9 handle];
        v12 = [v9 displayName];
        uint64_t v13 = (void *)[v10 initWithHandle:v11 displayName:v12];
        [v3 addObject:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v6);
  }

  id v14 = objc_alloc(MEMORY[0x1E4F89F38]);
  v15 = [(SLAttribution *)self sender];
  v16 = [v15 handle];
  uint64_t v17 = [(SLAttribution *)self sender];
  uint64_t v18 = [v17 displayName];
  v19 = (void *)[v14 initWithHandle:v16 displayName:v18];

  id v20 = objc_alloc(MEMORY[0x1E4F89F18]);
  v21 = [(SLAttribution *)self uniqueIdentifier];
  v22 = [(SLAttribution *)self sourceAppDisplayName];
  uint64_t v23 = [(SLAttribution *)self conversationIdentifier];
  uint64_t v24 = [(SLAttribution *)self groupPhotoPath];
  id v25 = [(SLAttribution *)self groupDisplayName];
  uint64_t v26 = [(SLAttribution *)self timestamp];
  uint64_t v27 = (void *)[v20 initWithIdentifier:v21 sourceAppDisplayName:v22 conversationIdentifier:v23 groupPhotoPath:v24 groupDisplayName:v25 relatedPeople:v3 sender:v19 timestamp:v26];

  return v27;
}

- (SLAttribution)initWithCSSearchableItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v65.receiver = self;
  v65.super_class = (Class)SLAttribution;
  uint64_t v7 = [(SLAttribution *)&v65 init];
  if (!v7) {
    goto LABEL_69;
  }
  v8 = [v6 attributeSet];
  uint64_t v9 = [v8 messageType];

  int v10 = [v9 isEqualToString:@"lnk"];
  objc_super v11 = [v6 domainIdentifier];
  int v12 = [v11 isEqualToString:@"attachmentDomain"];

  if (v12 & 1) != 0 || (v10)
  {
    id v14 = [v6 bundleID];
    if (![v14 length])
    {
      if (a4)
      {
        *a4 = [(id)objc_opt_class() errorForAttributionDomain:@"com.apple.SocialLayer.SLAttributionErrorDomain" andCode:3 andUnderlyingError:0];
      }

      goto LABEL_14;
    }
    objc_storeStrong((id *)&v7->_sourceAppDisplayName, v14);
    v15 = [v6 attributeSet];
    v16 = v15;
    if (v10)
    {
      uint64_t v17 = [v15 uniqueIdentifier];
      uint64_t v18 = 0;
    }
    else if (v12)
    {
      uint64_t v17 = [v15 ownerIdentifier];
      uint64_t v18 = [v16 uniqueIdentifier];
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v17 = 0;
    }
    id v64 = v17;
    if (![v17 length])
    {
      if (a4)
      {
        *a4 = [(id)objc_opt_class() errorForAttributionDomain:@"com.apple.SocialLayer.SLAttributionErrorDomain" andCode:2 andUnderlyingError:0];
      }
      int v21 = 1;
LABEL_67:

      if (v21) {
        goto LABEL_68;
      }
LABEL_69:
      v52 = v7;
      goto LABEL_70;
    }
    objc_storeStrong((id *)&v7->_uniqueIdentifier, v17);
    id v63 = v18;
    if ([v18 length])
    {
      v19 = v18;
      attachmentGUID = v7->_attachmentGUID;
      v7->_attachmentGUID = v19;
    }
    else
    {
      attachmentGUID = SLFrameworkLogHandle();
      if (os_log_type_enabled(attachmentGUID, OS_LOG_TYPE_DEBUG)) {
        -[SLAttribution initWithCSSearchableItem:error:]();
      }
    }

    if (v10)
    {
      v22 = [v16 domainIdentifier];
      uint64_t v18 = v63;
    }
    else
    {
      uint64_t v18 = v63;
      if (v12)
      {
        v22 = [v16 accountIdentifier];
      }
      else
      {
        v22 = 0;
      }
    }
    if (![v22 length])
    {
      if (a4)
      {
        *a4 = [(id)objc_opt_class() errorForAttributionDomain:@"com.apple.SocialLayer.SLAttributionErrorDomain" andCode:4 andUnderlyingError:0];
      }
      int v21 = 1;
      goto LABEL_66;
    }
    v59 = v22;
    objc_storeStrong((id *)&v7->_conversationIdentifier, v22);
    uint64_t v23 = [v16 groupPhotoPath];
    if (v23
      || ([v16 customAttributeDictionary],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          [v24 objectForKey:@"com_apple_mobilesms_groupPhotoPath"],
          uint64_t v23 = objc_claimAutoreleasedReturnValue(),
          v24,
          v23))
    {
      uint64_t v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v23];
      groupPhotoPath = v7->_groupPhotoPath;
      v7->_groupPhotoPath = (NSURL *)v25;
    }
    else
    {
      uint64_t v23 = v7->_groupPhotoPath;
      v7->_groupPhotoPath = 0;
    }

    uint64_t v27 = [v16 displayName];
    if (!v27)
    {
      v28 = [v16 alternateNames];
      uint64_t v27 = [v28 firstObject];
    }
    objc_storeStrong((id *)&v7->_groupDisplayName, v27);
    long long v29 = [v16 customAttributeDictionary];
    uint64_t v30 = [v29 objectForKey:@"gid"];

    if (v30)
    {
      uint64_t v31 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v30];
      groupID = v7->_groupID;
      v7->_groupID = (NSUUID *)v31;
    }
    id v58 = (void *)v30;
    id obj = [MEMORY[0x1E4F1CA48] array];
    uint64_t v33 = [v16 authorNames];
    uint64_t v34 = [v33 firstObject];

    v57 = v16;
    id v35 = [v16 authorAddresses];
    uint64_t v36 = [v35 firstObject];

    v60 = (void *)v36;
    if (!v36)
    {
      if (a4)
      {
        *a4 = [(id)objc_opt_class() errorForAttributionDomain:@"com.apple.SocialLayer.SLAttributionErrorDomain" andCode:5 andUnderlyingError:0];
      }
      int v21 = 1;
      v49 = obj;
      uint64_t v18 = v63;
      v16 = v57;
      goto LABEL_65;
    }
    id v54 = v34;
    v55 = v14;
    id v37 = v34;
    v16 = v57;
    if (!v37)
    {
      v38 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        -[SLAttribution initWithCSSearchableItem:error:]();
      }

      id v37 = v60;
    }
    v56 = v27;
    v39 = [[SLPerson alloc] initWithHandle:v60 displayName:v37];
    sender = v7->_sender;
    v7->_sender = v39;
    v41 = v39;

    [obj addObject:v41];
    uint64_t v42 = [v57 recipientNames];
    v61 = [v57 recipientAddresses];
    if (v42 && v61)
    {
      uint64_t v43 = [v42 count];
      if (v43 != [v61 count])
      {
LABEL_61:
        if (a4)
        {
          *a4 = [(id)objc_opt_class() errorForAttributionDomain:@"com.apple.SocialLayer.SLAttributionErrorDomain" andCode:6 andUnderlyingError:0];
        }
        int v21 = 1;
        id v14 = v55;
        v49 = obj;
        uint64_t v18 = v63;
        goto LABEL_64;
      }
      if ([v42 count])
      {
        uint64_t v44 = 0;
        while (1)
        {
          v45 = [v42 objectAtIndexedSubscript:v44];
          uint64_t v46 = [v61 objectAtIndexedSubscript:v44];
          v47 = v46;
          if (!v45 || !v46) {
            break;
          }
          uint64_t v48 = [[SLPerson alloc] initWithHandle:v46 displayName:v45];
          [obj addObject:v48];

          if ([v42 count] <= (unint64_t)++v44) {
            goto LABEL_52;
          }
        }

        goto LABEL_61;
      }
    }
LABEL_52:
    v49 = obj;
    objc_storeStrong((id *)&v7->_relatedPersons, obj);
    v7->_isGroupConversation = [(NSArray *)v7->_relatedPersons count] > 2;
    v7->_lean = 0;
    uint64_t v50 = [v57 contentCreationDate];
    timestamp = v7->_timestamp;
    v7->_timestamp = (NSDate *)v50;

    int v21 = 0;
    id v14 = v55;
    uint64_t v18 = v63;
LABEL_64:
    uint64_t v34 = v54;

    uint64_t v27 = v56;
LABEL_65:

    v22 = v59;
LABEL_66:

    goto LABEL_67;
  }
  uint64_t v13 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[SLAttribution initWithCSSearchableItem:error:](v6, v13);
  }

  if (a4)
  {
    *a4 = [(id)objc_opt_class() errorForAttributionDomain:@"com.apple.SocialLayer.SLAttributionErrorDomain" andCode:8 andUnderlyingError:0];
  }
LABEL_14:

LABEL_68:
  v52 = 0;
LABEL_70:

  return v52;
}

- (SLAttribution)initWithDictionary:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SLAttribution;
  uint64_t v5 = [(SLAttribution *)&v50 init];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = [v4 objectForKey:@"uid"];
  if (![v6 length])
  {
    uint64_t v9 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SLAttribution initWithDictionary:]();
    }
    goto LABEL_8;
  }
  objc_storeStrong((id *)&v5->_uniqueIdentifier, v6);
  uint64_t v7 = [v4 objectForKey:@"l"];
  v5->_lean = [v7 BOOLValue];

  if (!v5->_lean)
  {
    uint64_t v9 = [v4 objectForKey:@"atg"];
    if ([v9 length])
    {
      objc_super v11 = v9;
      attachmentGUID = v5->_attachmentGUID;
      v5->_attachmentGUID = (NSString *)&v11->isa;
    }
    else
    {
      attachmentGUID = SLFrameworkLogHandle();
      if (os_log_type_enabled(attachmentGUID, OS_LOG_TYPE_DEBUG)) {
        -[SLAttribution initWithDictionary:].cold.6();
      }
    }

    uint64_t v13 = [v4 objectForKey:@"sa"];
    if ([v13 length])
    {
      objc_storeStrong((id *)&v5->_sourceAppDisplayName, v13);
      id v14 = [v4 objectForKey:@"cid"];
      if ([v14 length])
      {
        objc_storeStrong((id *)&v5->_conversationIdentifier, v14);
        uint64_t v15 = [v4 objectForKey:@"gp"];
        uint64_t v42 = v9;
        uint64_t v43 = v13;
        v41 = v14;
        uint64_t v44 = v6;
        v45 = v15;
        if (v15)
        {
          uint64_t v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15];
          groupPhotoPath = v5->_groupPhotoPath;
          v5->_groupPhotoPath = (NSURL *)v16;
        }
        else
        {
          groupPhotoPath = v5->_groupPhotoPath;
          v5->_groupPhotoPath = 0;
        }

        uint64_t v21 = [v4 objectForKey:@"gdn"];
        groupDisplayName = v5->_groupDisplayName;
        v5->_groupDisplayName = (NSString *)v21;

        uint64_t v23 = [v4 objectForKey:@"rp"];
        uint64_t v24 = objc_opt_new();
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v25 = v23;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v47;
          while (2)
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v47 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = [[SLPerson alloc] initWithDictionary:*(void *)(*((void *)&v46 + 1) + 8 * i)];
              if (!v30)
              {
                SLFrameworkLogHandle();
                uint64_t v33 = (SLPerson *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v33->super, OS_LOG_TYPE_ERROR)) {
                  -[SLAttribution initWithDictionary:].cold.5();
                }
                int v20 = 1;
                long long v32 = v25;
                uint64_t v9 = v42;
                id v14 = v41;
                goto LABEL_43;
              }
              uint64_t v31 = v30;
              [v24 addObject:v30];
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v46 objects:v51 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }

        objc_storeStrong((id *)&v5->_relatedPersons, v24);
        long long v32 = [v4 objectForKey:@"s"];
        uint64_t v33 = [[SLPerson alloc] initWithDictionary:v32];
        if (v33)
        {
          objc_storeStrong((id *)&v5->_sender, v33);
          v5->_isGroupConversation = [(NSArray *)v5->_relatedPersons count] > 2;
          uint64_t v34 = [v4 objectForKey:@"t"];
          timestamp = v5->_timestamp;
          v5->_timestamp = (NSDate *)v34;

          uint64_t v36 = [v4 objectForKey:@"pi"];
          v5->_pinned = [v36 BOOLValue];

          id v37 = [v4 objectForKey:@"fm"];
          v5->_fromMe = [v37 BOOLValue];

          v38 = [v4 objectForKey:@"gid"];
          uint64_t v39 = [v38 UUID];
          groupID = v5->_groupID;
          v5->_groupID = (NSUUID *)v39;

          int v20 = 0;
          uint64_t v9 = v42;
        }
        else
        {
          v38 = SLFrameworkLogHandle();
          uint64_t v9 = v42;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            -[SLAttribution initWithDictionary:].cold.4();
          }
          int v20 = 1;
        }
        id v14 = v41;

        uint64_t v13 = v43;
LABEL_43:

        id v6 = v44;
        v19 = v45;
      }
      else
      {
        v19 = SLFrameworkLogHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[SLAttribution initWithDictionary:]();
        }
        int v20 = 1;
      }

      if (!v20) {
        goto LABEL_4;
      }
LABEL_9:

      v8 = 0;
      goto LABEL_10;
    }
    uint64_t v18 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[SLAttribution initWithDictionary:]();
    }

LABEL_8:
    goto LABEL_9;
  }
LABEL_4:

LABEL_5:
  v8 = v5;
LABEL_10:

  return v8;
}

- (id)dictionaryRepresentation
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(SLAttribution *)self uniqueIdentifier];

  if (!v4)
  {
    v8 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SLAttribution dictionaryRepresentation]();
    }
    goto LABEL_34;
  }
  uint64_t v5 = [(SLAttribution *)self uniqueIdentifier];
  [v3 setObject:v5 forKey:@"uid"];

  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SLAttribution isLean](self, "isLean"));
  [v3 setObject:v6 forKey:@"l"];

  if ([(SLAttribution *)self isLean])
  {
LABEL_3:
    id v7 = v3;
    goto LABEL_36;
  }
  uint64_t v9 = [(SLAttribution *)self attachmentGUID];

  if (v9)
  {
    int v10 = [(SLAttribution *)self attachmentGUID];
    [v3 setObject:v10 forKey:@"atg"];
  }
  else
  {
    int v10 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SLAttribution dictionaryRepresentation].cold.8();
    }
  }

  objc_super v11 = [(SLAttribution *)self sourceAppDisplayName];

  if (!v11)
  {
    v8 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SLAttribution dictionaryRepresentation]();
    }
    goto LABEL_34;
  }
  int v12 = [(SLAttribution *)self sourceAppDisplayName];
  [v3 setObject:v12 forKey:@"sa"];

  uint64_t v13 = [(SLAttribution *)self conversationIdentifier];

  if (!v13)
  {
    v8 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SLAttribution dictionaryRepresentation]();
    }
LABEL_34:

    goto LABEL_35;
  }
  id v14 = [(SLAttribution *)self conversationIdentifier];
  [v3 setObject:v14 forKey:@"cid"];

  uint64_t v15 = [(SLAttribution *)self sender];
  uint64_t v16 = [v15 dictionaryRepresentation];

  if (v16)
  {
    [v3 setObject:v16 forKey:@"s"];
    uint64_t v17 = [(SLAttribution *)self relatedPersons];

    if (v17)
    {
      uint64_t v39 = v16;
      uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      v19 = [(SLAttribution *)self relatedPersons];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v41;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v41 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = [*(id *)(*((void *)&v40 + 1) + 8 * i) dictionaryRepresentation];
            if (!v24)
            {
              v38 = SLFrameworkLogHandle();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                -[SLAttribution dictionaryRepresentation].cold.7();
              }

              uint64_t v16 = v39;
              goto LABEL_46;
            }
            id v25 = (void *)v24;
            [v18 addObject:v24];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v44 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }

      [v3 setObject:v18 forKey:@"rp"];
      uint64_t v26 = [(SLAttribution *)self groupPhotoPath];

      if (v26)
      {
        uint64_t v27 = [(SLAttribution *)self groupPhotoPath];
        uint64_t v28 = [v27 path];
        [v3 setObject:v28 forKey:@"gp"];
      }
      long long v29 = [(SLAttribution *)self groupDisplayName];

      if (v29)
      {
        uint64_t v30 = [(SLAttribution *)self groupDisplayName];
        [v3 setObject:v30 forKey:@"gdn"];
      }
      uint64_t v31 = [(SLAttribution *)self timestamp];

      uint64_t v16 = v39;
      if (v31)
      {
        long long v32 = [(SLAttribution *)self timestamp];
        [v3 setObject:v32 forKey:@"t"];

        uint64_t v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SLAttribution isPinned](self, "isPinned"));
        [v3 setObject:v33 forKey:@"pi"];

        uint64_t v34 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SLAttribution isFromMe](self, "isFromMe"));
        [v3 setObject:v34 forKey:@"fm"];

        id v35 = [(SLAttribution *)self groupID];

        if (v35)
        {
          uint64_t v36 = [(SLAttribution *)self groupID];
          [v3 setObject:v36 forKey:@"gid"];
        }
        goto LABEL_3;
      }
      uint64_t v18 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SLAttribution dictionaryRepresentation].cold.6();
      }
    }
    else
    {
      uint64_t v18 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SLAttribution dictionaryRepresentation].cold.5();
      }
    }
  }
  else
  {
    uint64_t v18 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      [(SLAttribution *)self dictionaryRepresentation];
    }
  }
LABEL_46:

LABEL_35:
  id v7 = 0;
LABEL_36:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLAttribution)initWithCoder:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SLAttribution;
  uint64_t v5 = [(SLAttribution *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sa"];
    sourceAppDisplayName = v5->_sourceAppDisplayName;
    v5->_sourceAppDisplayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uid"];
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"atg"];
    attachmentGUID = v5->_attachmentGUID;
    v5->_attachmentGUID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cid"];
    conversationIdentifier = v5->_conversationIdentifier;
    v5->_conversationIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gp"];
    groupPhotoPath = v5->_groupPhotoPath;
    v5->_groupPhotoPath = (NSURL *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gdn"];
    groupDisplayName = v5->_groupDisplayName;
    v5->_groupDisplayName = (NSString *)v16;

    uint64_t v18 = (void *)MEMORY[0x1E4F1CAD0];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    uint64_t v20 = [v18 setWithArray:v19];
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"rp"];
    relatedPersons = v5->_relatedPersons;
    v5->_relatedPersons = (NSArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"s"];
    sender = v5->_sender;
    v5->_sender = (SLPerson *)v23;

    v5->_isGroupConversation = [(NSArray *)v5->_relatedPersons count] > 2;
    id v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"l"];
    v5->_lean = [v25 BOOLValue];

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v26;

    v5->_pinned = [v4 decodeBoolForKey:@"pi"];
    v5->_fromMe = [v4 decodeBoolForKey:@"fm"];
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gid"];
    groupID = v5->_groupID;
    v5->_groupID = (NSUUID *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLAttribution *)self sourceAppDisplayName];
  [v4 encodeObject:v5 forKey:@"sa"];

  uint64_t v6 = [(SLAttribution *)self uniqueIdentifier];
  [v4 encodeObject:v6 forKey:@"uid"];

  id v7 = [(SLAttribution *)self attachmentGUID];
  [v4 encodeObject:v7 forKey:@"atg"];

  uint64_t v8 = [(SLAttribution *)self conversationIdentifier];
  [v4 encodeObject:v8 forKey:@"cid"];

  uint64_t v9 = [(SLAttribution *)self groupPhotoPath];
  [v4 encodeObject:v9 forKey:@"gp"];

  uint64_t v10 = [(SLAttribution *)self groupDisplayName];
  [v4 encodeObject:v10 forKey:@"gdn"];

  objc_super v11 = [(SLAttribution *)self relatedPersons];
  [v4 encodeObject:v11 forKey:@"rp"];

  uint64_t v12 = [(SLAttribution *)self sender];
  [v4 encodeObject:v12 forKey:@"s"];

  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SLAttribution isLean](self, "isLean"));
  [v4 encodeObject:v13 forKey:@"l"];

  uint64_t v14 = [(SLAttribution *)self timestamp];
  [v4 encodeObject:v14 forKey:@"t"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SLAttribution isPinned](self, "isPinned"), @"pi");
  objc_msgSend(v4, "encodeBool:forKey:", -[SLAttribution isFromMe](self, "isFromMe"), @"fm");
  id v15 = [(SLAttribution *)self groupID];
  [v4 encodeObject:v15 forKey:@"gid"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SLAttribution alloc];
  uint64_t v5 = [(SLAttribution *)self dictionaryRepresentation];
  uint64_t v6 = [(SLAttribution *)v4 initWithDictionary:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [(SLAttribution *)self uniqueIdentifier];
    if (v7 || ([v6 uniqueIdentifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v8 = [(SLAttribution *)self uniqueIdentifier];
      uint64_t v9 = [v6 uniqueIdentifier];
      uint64_t v10 = [v8 isEqualToString:v9];

      if (v7)
      {
LABEL_9:

        BOOL v12 = [(SLAttribution *)self isLean];
        char v11 = v12 & v10;
        if (v12 || !v10) {
          goto LABEL_33;
        }
        uint64_t v13 = [(SLAttribution *)self sourceAppDisplayName];
        if (v13
          || ([v6 sourceAppDisplayName], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v14 = [(SLAttribution *)self sourceAppDisplayName];
          id v15 = [v6 sourceAppDisplayName];
          uint64_t v10 = [v14 isEqualToString:v15];

          if (v13)
          {

            if (!v10) {
              goto LABEL_32;
            }
          }
          else
          {

            if ((v10 & 1) == 0) {
              goto LABEL_32;
            }
          }
        }
        uint64_t v16 = [(SLAttribution *)self conversationIdentifier];
        if (v16
          || ([v6 conversationIdentifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          uint64_t v17 = [(SLAttribution *)self conversationIdentifier];
          uint64_t v18 = [v6 conversationIdentifier];
          uint64_t v10 = [v17 isEqualToString:v18];

          if (v16)
          {

            if (!v10) {
              goto LABEL_32;
            }
          }
          else
          {

            if ((v10 & 1) == 0) {
              goto LABEL_32;
            }
          }
        }
        v19 = [(SLAttribution *)self groupDisplayName];
        if (!v19)
        {
          v3 = [v6 groupDisplayName];
          if (!v3)
          {
LABEL_27:
            uint64_t v22 = [(SLAttribution *)self sender];
            if (v22 || ([v6 sender], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              uint64_t v23 = [(SLAttribution *)self sender];
              uint64_t v24 = [v6 sender];
              char v11 = [v23 isEqual:v24];

              if (v22)
              {
LABEL_37:

                goto LABEL_33;
              }
            }
            else
            {
              char v11 = 1;
            }

            goto LABEL_37;
          }
        }
        uint64_t v20 = [(SLAttribution *)self groupDisplayName];
        uint64_t v21 = [v6 groupDisplayName];
        uint64_t v10 = [v20 isEqualToString:v21];

        if (v19)
        {

          if (v10) {
            goto LABEL_27;
          }
        }
        else
        {

          if (v10) {
            goto LABEL_27;
          }
        }
LABEL_32:
        char v11 = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v10 = 1;
    }

    goto LABEL_9;
  }
  char v11 = 0;
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  v2 = [(SLAttribution *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  BOOL v3 = [(SLAttribution *)self isLean];
  id v4 = NSString;
  id v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  uint64_t v7 = [(SLAttribution *)self uniqueIdentifier];
  uint64_t v8 = (void *)v7;
  if (v3)
  {
    uint64_t v9 = [v4 stringWithFormat:@"[%@: identifier: %@ ]", v6, v7];
  }
  else
  {
    uint64_t v21 = [(SLAttribution *)self attachmentGUID];
    uint64_t v20 = [(SLAttribution *)self sourceAppDisplayName];
    v19 = [(SLAttribution *)self conversationIdentifier];
    uint64_t v18 = [(SLAttribution *)self groupPhotoPath];
    uint64_t v10 = [(SLAttribution *)self groupDisplayName];
    uint64_t v17 = [(SLAttribution *)self relatedPersons];
    char v11 = [(SLAttribution *)self sender];
    BOOL v12 = [(SLAttribution *)self timestamp];
    BOOL v13 = [(SLAttribution *)self isPinned];
    BOOL v14 = [(SLAttribution *)self isFromMe];
    id v15 = [(SLAttribution *)self groupID];
    uint64_t v9 = [v4 stringWithFormat:@"[%@: identifier: %@ attachmentGUID:%@ sourceAppDisplayName: %@  conversationIdentifier: %@  groupPhotoPath: %@  displayName: %@  relatedPersons: %@ sender: %@ timestamp: %@ isPinned: %i isFromMe: %i groupID: %@]", v6, v8, v21, v20, v19, v18, v10, v17, v11, v12, v13, v14, v15];
  }
  return v9;
}

+ (id)errorForAttributionDomain:(id)a3 andCode:(int64_t)a4 andUnderlyingError:(id *)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  switch(a4)
  {
    case 1:
      uint64_t v31 = *MEMORY[0x1E4F28228];
      v32[0] = @"SLAttribution Init failed. Invalid or nil PPSocialAttribution.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = (__CFString **)v32;
      uint64_t v10 = &v31;
      goto LABEL_13;
    case 2:
      uint64_t v29 = *MEMORY[0x1E4F28228];
      uint64_t v30 = @"SLAttribution Init failed. PPSocialAttribution contains an invalid or nil identifier.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v30;
      uint64_t v10 = &v29;
      goto LABEL_13;
    case 3:
      uint64_t v27 = *MEMORY[0x1E4F28228];
      uint64_t v28 = @"SLAttribution Init failed. PPSocialAttribution contains an invalid or nil source app display name.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v28;
      uint64_t v10 = &v27;
      goto LABEL_13;
    case 4:
      uint64_t v25 = *MEMORY[0x1E4F28228];
      uint64_t v26 = @"SLAttribution Init failed. PPSocialAttribution contains an invalid or nil conversation name.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v26;
      uint64_t v10 = &v25;
      goto LABEL_13;
    case 5:
      uint64_t v23 = *MEMORY[0x1E4F28228];
      uint64_t v24 = @"SLAttribution Init failed. PPSocialAttribution contains an invalid or nil PPSocialSender.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v24;
      uint64_t v10 = &v23;
      goto LABEL_13;
    case 6:
      uint64_t v21 = *MEMORY[0x1E4F28228];
      uint64_t v22 = @"SLAttribution Init failed. PPSocialAttribution contains an invalid or nil PPSocialSender.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v22;
      uint64_t v10 = &v21;
      goto LABEL_13;
    case 7:
      uint64_t v19 = *MEMORY[0x1E4F28228];
      uint64_t v20 = @"SLAttribution Init failed. PPSocialAttribution contains an invalid or nil timestamp.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v20;
      uint64_t v10 = &v19;
      goto LABEL_13;
    case 8:
      uint64_t v17 = *MEMORY[0x1E4F28228];
      uint64_t v18 = @"SLAttribution Init failed. PPSocialAttribution contains an invalid or nil domain identifier.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v18;
      uint64_t v10 = &v17;
      goto LABEL_13;
    case 9:
      uint64_t v15 = *MEMORY[0x1E4F28228];
      uint64_t v16 = @"SLAttribution Init failed. PPSocialAttribution contains an invalid or nil attachment GUID.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v16;
      uint64_t v10 = &v15;
LABEL_13:
      char v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
      if (a5) {
        goto LABEL_14;
      }
      goto LABEL_15;
    default:
      char v11 = 0;
      if (!a5) {
        goto LABEL_15;
      }
LABEL_14:
      BOOL v12 = (void *)[v11 mutableCopy];
      [v12 setObject:*a5 forKey:*MEMORY[0x1E4F28A50]];

      char v11 = v12;
LABEL_15:
      BOOL v13 = [MEMORY[0x1E4F28C58] errorWithDomain:v7 code:a4 userInfo:v11];

      return v13;
  }
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (BOOL)isLean
{
  return self->_lean;
}

- (void)setLean:(BOOL)a3
{
  self->_lean = a3;
}

- (NSString)sourceAppDisplayName
{
  return self->_sourceAppDisplayName;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (BOOL)isGroupConversation
{
  return self->_isGroupConversation;
}

- (NSURL)groupPhotoPath
{
  return self->_groupPhotoPath;
}

- (NSString)groupDisplayName
{
  return self->_groupDisplayName;
}

- (NSArray)relatedPersons
{
  return self->_relatedPersons;
}

- (SLPerson)sender
{
  return self->_sender;
}

- (BOOL)isFromMe
{
  return self->_fromMe;
}

- (NSUUID)groupID
{
  return self->_groupID;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSString)attachmentGUID
{
  return self->_attachmentGUID;
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_storeStrong((id *)&self->_attachmentGUID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_relatedPersons, 0);
  objc_storeStrong((id *)&self->_groupDisplayName, 0);
  objc_storeStrong((id *)&self->_groupPhotoPath, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceAppDisplayName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (void)initWithCSSearchableItem:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "SLA falling back to handle as displayName for sender.", v2, v3, v4, v5, v6);
}

- (void)initWithCSSearchableItem:error:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "SLA had no unique identifier (attachment GUID not set).", v2, v3, v4, v5, v6);
}

- (void)initWithCSSearchableItem:(void *)a1 error:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 domainIdentifier];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_19BE17000, a2, v4, "Attempted to initialize SLH using a CSSearchableItem outside the attachment/links domain. Failing initialization from CSSearchableItem. domain: %@", v5);
}

- (void)initWithDictionary:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLA dictionary uniqueIdentifier was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLA dictionary sourceAppDisplayName was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLA dictionary conversationIdentifier was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.4()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_19BE17000, v0, v1, "SLA dictionary sender person was nil. Failing initialization from dictionary. senderDictionary: %@", v2);
}

- (void)initWithDictionary:.cold.5()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_19BE17000, v0, v1, "SLA dictionary related person was nil. Failing initialization from dictionary. personDictionary: %@", v2);
}

- (void)initWithDictionary:.cold.6()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "SLA dictionary attachmentGUID was nil.", v2, v3, v4, v5, v6);
}

- (void)dictionaryRepresentation
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_19BE17000, v0, v1, "SLA attachmentGUID was nil.", v2, v3, v4, v5, v6);
}

@end