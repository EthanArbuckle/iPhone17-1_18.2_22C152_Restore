@interface SLCollaborationHighlight
+ (BOOL)supportsSecureCoding;
+ (id)errorForCollaborationHighlightDomain:(id)a3 andCode:(int64_t)a4 andUnderlyingError:(id *)a5;
+ (id)requiredSpotlightAttributeKeysforHighlightType:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSDictionary)earliestAttributionIdentifiers;
- (NSDictionary)handleToIdentityMap;
- (NSString)collaborationIdentifier;
- (NSString)contentType;
- (NSString)fileName;
- (NSString)fileProviderID;
- (SLCollaborationHighlight)initWithAttribution:(id)a3;
- (SLCollaborationHighlight)initWithCSSearchableItem:(id)a3 error:(id *)a4;
- (SLCollaborationHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 forContentType:(unsigned __int8)a4 error:(id *)a5;
- (SLCollaborationHighlight)initWithCoder:(id)a3;
- (SLCollaborationHighlight)initWithDictionary:(id)a3;
- (SLCollaborationHighlight)initWithPortraitCollaborationHighlight:(id)a3 error:(id *)a4;
- (SWPersonIdentity)localIdentity;
- (_SWPersonIdentityProof)localProofOfInclusion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SLCollaborationHighlight

- (SLCollaborationHighlight)initWithPortraitCollaborationHighlight:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v58.receiver = self;
  v58.super_class = (Class)SLCollaborationHighlight;
  v7 = [(SLHighlight *)&v58 initWithPortraitHighlight:v6 error:a4];
  if (!v7)
  {
LABEL_64:
    v11 = v7;
    goto LABEL_65;
  }
  v8 = [v6 collaborationIdentifier];

  if (v8) {
    [v6 collaborationIdentifier];
  }
  else {
  uint64_t v9 = [v6 identifier];
  }
  collaborationIdentifier = v7->_collaborationIdentifier;
  v7->_collaborationIdentifier = (NSString *)v9;

  v11 = [v6 contentDisplayName];

  if (v11)
  {
    uint64_t v12 = [v6 contentDisplayName];
    fileName = v7->_fileName;
    v7->_fileName = (NSString *)v12;

    v11 = [v6 contentType];

    if (v11)
    {
      uint64_t v14 = [v6 contentType];
      contentType = v7->_contentType;
      v7->_contentType = (NSString *)v14;

      v11 = [v6 creationDate];

      if (v11)
      {
        uint64_t v16 = [v6 creationDate];
        creationDate = v7->_creationDate;
        v7->_creationDate = (NSDate *)v16;

        if (objc_opt_respondsToSelector())
        {
          v18 = [v6 earliestAttributionIdentifiers];

          if (v18)
          {
            uint64_t v19 = [v6 earliestAttributionIdentifiers];
            earliestAttributionIdentifiers = v7->_earliestAttributionIdentifiers;
            v7->_earliestAttributionIdentifiers = (NSDictionary *)v19;
          }
          else
          {
            *a4 = [(id)objc_opt_class() errorForCollaborationHighlightDomain:@"com.apple.SocialLayer.SLCollaborationHighlightErrorDomain" andCode:4 andUnderlyingError:0];
            earliestAttributionIdentifiers = v7->_earliestAttributionIdentifiers;
            v7->_earliestAttributionIdentifiers = 0;
          }
        }
        if (objc_opt_respondsToSelector())
        {
          uint64_t v23 = [v6 fileProviderId];
          fileProviderID = v7->_fileProviderID;
          v7->_fileProviderID = (NSString *)v23;
        }
        else
        {
          if (a4)
          {
            *a4 = [(id)objc_opt_class() errorForCollaborationHighlightDomain:@"com.apple.SocialLayer.SLCollaborationHighlightErrorDomain" andCode:5 andUnderlyingError:0];
          }
          fileProviderID = v7->_fileProviderID;
          v7->_fileProviderID = 0;
        }

        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v6 localIdentity],
              v25 = objc_claimAutoreleasedReturnValue(),
              v25,
              v25))
        {
          v26 = (void *)MEMORY[0x1E4F28DC0];
          uint64_t v27 = objc_opt_class();
          v28 = [v6 localIdentity];
          id v57 = 0;
          v29 = [v26 unarchivedObjectOfClass:v27 fromData:v28 error:&v57];
          localIdentity = (SWPersonIdentity *)v57;

          if (localIdentity || !v29)
          {
            v31 = SLFrameworkLogHandle();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
              -[SLCollaborationHighlight initWithPortraitCollaborationHighlight:error:].cold.4();
            }

            if (a4) {
              *a4 = localIdentity;
            }
          }
          else
          {
            objc_storeStrong((id *)&v7->_localIdentity, v29);
          }
        }
        else
        {
          if (a4)
          {
            *a4 = [(id)objc_opt_class() errorForCollaborationHighlightDomain:@"com.apple.SocialLayer.SLCollaborationHighlightErrorDomain" andCode:7 andUnderlyingError:0];
          }
          localIdentity = v7->_localIdentity;
          v7->_localIdentity = 0;
        }

        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v6 localIdentityProof],
              v32 = objc_claimAutoreleasedReturnValue(),
              v32,
              v32))
        {
          v33 = (void *)MEMORY[0x1E4F28DC0];
          uint64_t v34 = objc_opt_class();
          v35 = [v6 localIdentityProof];
          id v56 = 0;
          v36 = [v33 unarchivedObjectOfClass:v34 fromData:v35 error:&v56];
          v37 = (_SWPersonIdentityProof *)v56;

          if (v37 || !v36)
          {
            if (a4) {
              *a4 = v37;
            }
            v40 = SLFrameworkLogHandle();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
              -[SLCollaborationHighlight initWithPortraitCollaborationHighlight:error:]();
            }

            localProofOfInclusion = v7->_localProofOfInclusion;
            v7->_localProofOfInclusion = 0;
          }
          else
          {
            v38 = v36;
            localProofOfInclusion = v7->_localProofOfInclusion;
            v7->_localProofOfInclusion = v38;
          }
        }
        else
        {
          if (a4)
          {
            *a4 = [(id)objc_opt_class() errorForCollaborationHighlightDomain:@"com.apple.SocialLayer.SLCollaborationHighlightErrorDomain" andCode:6 andUnderlyingError:0];
          }
          v37 = v7->_localProofOfInclusion;
          v7->_localProofOfInclusion = 0;
        }

        if ((objc_opt_respondsToSelector() & 1) != 0
          && ([v6 handleToIdentityMap],
              v41 = objc_claimAutoreleasedReturnValue(),
              v41,
              v41))
        {
          v42 = (void *)MEMORY[0x1E4F28DC0];
          v43 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v44 = objc_opt_class();
          uint64_t v45 = objc_opt_class();
          v46 = objc_msgSend(v43, "setWithObjects:", v44, v45, objc_opt_class(), 0);
          v47 = [v6 handleToIdentityMap];
          id v55 = 0;
          v48 = [v42 unarchivedObjectOfClasses:v46 fromData:v47 error:&v55];
          v49 = (NSDictionary *)v55;

          if (v49 || !v48)
          {
            v53 = SLFrameworkLogHandle();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
              -[SLCollaborationHighlight initWithPortraitCollaborationHighlight:error:]();
            }

            if (a4) {
              *a4 = v49;
            }
            handleToIdentityMap = v7->_handleToIdentityMap;
            v7->_handleToIdentityMap = 0;
          }
          else
          {
            v50 = v48;
            handleToIdentityMap = v7->_handleToIdentityMap;
            v7->_handleToIdentityMap = v50;
          }
        }
        else
        {
          v52 = SLFrameworkLogHandle();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
            -[SLCollaborationHighlight initWithPortraitCollaborationHighlight:error:]();
          }

          v49 = v7->_handleToIdentityMap;
          v7->_handleToIdentityMap = 0;
        }

        goto LABEL_64;
      }
      v21 = objc_opt_class();
      uint64_t v22 = 2;
    }
    else
    {
      v21 = objc_opt_class();
      uint64_t v22 = 3;
    }
  }
  else
  {
    v21 = objc_opt_class();
    uint64_t v22 = 1;
  }
  *a4 = [v21 errorForCollaborationHighlightDomain:@"com.apple.SocialLayer.SLCollaborationHighlightErrorDomain" andCode:v22 andUnderlyingError:0];
LABEL_65:

  return v11;
}

- (SLCollaborationHighlight)initWithAttribution:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SLCollaborationHighlight;
  v3 = [(SLHighlight *)&v10 initWithAttribution:a3];
  v4 = v3;
  if (v3)
  {
    fileName = v3->_fileName;
    v3->_fileName = (NSString *)&stru_1EEC19158;

    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v4->_creationDate;
    v4->_creationDate = (NSDate *)v6;

    contentType = v4->_contentType;
    v4->_contentType = (NSString *)&stru_1EEC19158;
  }
  return v4;
}

- (SLCollaborationHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 forContentType:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  if (v8)
  {
    if (v6 > 1)
    {
      uint64_t v9 = 0;
    }
    else
    {
      uint64_t v9 = +[SLCollaborationHighlight requiredSpotlightAttributeKeysforHighlightType:v6];
    }
    v11 = [v9 allObjects];
    id v19 = 0;
    uint64_t v12 = +[SLCoreSpotlightUtilities fetchCSSearchableItemForUniqueIdentifier:v8 forContentType:v6 withRequiredAttributes:v11 error:&v19];
    id v13 = v19;

    if (v12)
    {
      self = [(SLCollaborationHighlight *)self initWithCSSearchableItem:v12 error:a5];
      objc_super v10 = self;
    }
    else if (a5)
    {
      id v18 = v13;
      uint64_t v14 = +[SLHighlight errorForHighlightDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" andCode:7 andUnderlyingError:&v18];
      id v15 = v18;

      id v16 = v14;
      objc_super v10 = 0;
      *a5 = v16;
      id v13 = v15;
    }
    else
    {
      objc_super v10 = 0;
    }
  }
  else if (a5)
  {
    +[SLHighlight errorForHighlightDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" andCode:8 andUnderlyingError:0];
    objc_super v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (SLCollaborationHighlight)initWithCSSearchableItem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)SLCollaborationHighlight;
  v7 = [(SLHighlight *)&v35 initWithCSSearchableItem:v6 error:a4];
  if (!v7) {
    goto LABEL_35;
  }
  id v8 = [v6 attributeSet];
  uint64_t v9 = [v8 messageType];

  int v10 = [v9 isEqualToString:@"lnk"];
  v11 = [v6 domainIdentifier];
  char v12 = [v11 isEqualToString:@"attachmentDomain"];

  if ((v12 & 1) == 0 && (v10 & 1) == 0)
  {
    id v13 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLCollaborationHighlight initWithCSSearchableItem:error:](v6, v13);
    }

    if (a4)
    {
      *a4 = [(id)objc_opt_class() errorForHighlightDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" andCode:6 andUnderlyingError:0];
    }

    goto LABEL_34;
  }
  uint64_t v14 = [v6 attributeSet];
  id v15 = [v14 filename];
  id v16 = v15;
  if (v15)
  {
    v17 = v15;
    fileName = v7->_fileName;
    v7->_fileName = v17;
LABEL_13:

    goto LABEL_14;
  }
  if (v10)
  {
    fileName = v7->_fileName;
    v7->_fileName = (NSString *)@"Gelato Collaboration";
    goto LABEL_13;
  }
  if (a4)
  {
    int v24 = 1;
    *a4 = [(id)objc_opt_class() errorForCollaborationHighlightDomain:@"com.apple.SocialLayer.SLCollaborationHighlightErrorDomain" andCode:1 andUnderlyingError:0];
    goto LABEL_33;
  }
LABEL_14:
  id v19 = [v14 contentCreationDate];
  if (!v19)
  {
    if (a4)
    {
      *a4 = [(id)objc_opt_class() errorForCollaborationHighlightDomain:@"com.apple.SocialLayer.SLCollaborationHighlightErrorDomain" andCode:2 andUnderlyingError:0];
    }
    int v24 = 1;
    goto LABEL_32;
  }
  objc_storeStrong((id *)&v7->_creationDate, v19);
  v20 = [v14 contentType];
  v21 = v20;
  if (v20)
  {
    uint64_t v22 = v20;
    contentType = v7->_contentType;
    v7->_contentType = v22;
LABEL_22:

LABEL_23:
    v25 = (void *)[objc_alloc(MEMORY[0x1E4F237C0]) initWithKeyName:@"com_apple_mobilesms_collaborationIdentifier"];
    v26 = [v6 attributeSet];
    uint64_t v27 = [v26 valueForCustomKey:v25];

    if (v27)
    {
      v28 = v27;
      collaborationIdentifier = v7->_collaborationIdentifier;
      v7->_collaborationIdentifier = v28;
    }
    else
    {
      v30 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v34 = 0;
        _os_log_impl(&dword_19BE17000, v30, OS_LOG_TYPE_INFO, "SLCH collaborationIdentifier was nil defaulting to identifier.", v34, 2u);
      }

      uint64_t v31 = [(SLHighlight *)v7 identifier];
      collaborationIdentifier = v7->_collaborationIdentifier;
      v7->_collaborationIdentifier = (NSString *)v31;
    }

    int v24 = 0;
    goto LABEL_31;
  }
  if (v10)
  {
    contentType = v7->_contentType;
    v7->_contentType = (NSString *)@"public.link";
    goto LABEL_22;
  }
  if (!a4) {
    goto LABEL_23;
  }
  *a4 = [(id)objc_opt_class() errorForCollaborationHighlightDomain:@"com.apple.SocialLayer.SLCollaborationHighlightErrorDomain" andCode:3 andUnderlyingError:0];
  int v24 = 1;
LABEL_31:

LABEL_32:
LABEL_33:

  if (!v24)
  {
LABEL_35:
    v32 = v7;
    goto LABEL_36;
  }
LABEL_34:
  v32 = 0;
LABEL_36:

  return v32;
}

+ (id)requiredSpotlightAttributeKeysforHighlightType:(unsigned __int8)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v3 = +[SLCoreSpotlightUtilities requiredSpotlightAttributeKeysForFiles];
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = +[SLCoreSpotlightUtilities requiredSpotlightAttributeKeysForLinks];
  }
  return v3;
}

- (SLCollaborationHighlight)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SLCollaborationHighlight;
  v5 = [(SLHighlight *)&v18 initWithDictionary:v4];
  if (!v5)
  {
LABEL_18:
    uint64_t v14 = v5;
    goto LABEL_19;
  }
  id v6 = [v4 objectForKey:@"fn"];
  if ([v6 length])
  {
    objc_storeStrong((id *)&v5->_fileName, v6);
    v7 = [v4 objectForKey:@"cd"];
    if (v7)
    {
      id v8 = v7;
      objc_storeStrong((id *)&v5->_creationDate, v7);
      uint64_t v9 = [v4 objectForKey:@"ct"];
      if ([v9 length])
      {
        objc_storeStrong((id *)&v5->_contentType, v9);
        int v10 = [v4 objectForKey:@"ci"];
        if ([v10 length])
        {
          v11 = v10;
          collaborationIdentifier = v5->_collaborationIdentifier;
          v5->_collaborationIdentifier = v11;
        }
        else
        {
          uint64_t v15 = [(SLHighlight *)v5 identifier];
          id v16 = v5->_collaborationIdentifier;
          v5->_collaborationIdentifier = (NSString *)v15;

          collaborationIdentifier = SLFrameworkLogHandle();
          if (os_log_type_enabled(collaborationIdentifier, OS_LOG_TYPE_ERROR)) {
            -[SLCollaborationHighlight initWithDictionary:].cold.4();
          }
        }

        goto LABEL_18;
      }
      id v13 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SLCollaborationHighlight initWithDictionary:]();
      }
    }
    else
    {
      id v8 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SLCollaborationHighlight initWithDictionary:]();
      }
    }
  }
  else
  {
    id v8 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SLCollaborationHighlight initWithDictionary:]();
    }
  }

  uint64_t v14 = 0;
LABEL_19:

  return v14;
}

- (id)dictionaryRepresentation
{
  v17.receiver = self;
  v17.super_class = (Class)SLCollaborationHighlight;
  v3 = [(SLHighlight *)&v17 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(SLCollaborationHighlight *)self fileName];

  if (!v5)
  {
    id v13 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLCollaborationHighlight dictionaryRepresentation]();
    }
    goto LABEL_12;
  }
  id v6 = [(SLCollaborationHighlight *)self fileName];
  [v4 setObject:v6 forKey:@"fn"];

  v7 = [(SLCollaborationHighlight *)self creationDate];

  if (!v7)
  {
    id v13 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLCollaborationHighlight dictionaryRepresentation]();
    }
    goto LABEL_12;
  }
  id v8 = [(SLCollaborationHighlight *)self creationDate];
  [v4 setObject:v8 forKey:@"cd"];

  uint64_t v9 = [(SLCollaborationHighlight *)self contentType];

  if (!v9)
  {
    id v13 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[SLCollaborationHighlight dictionaryRepresentation]();
    }
LABEL_12:

    id v14 = 0;
    goto LABEL_16;
  }
  int v10 = [(SLCollaborationHighlight *)self contentType];
  [v4 setObject:v10 forKey:@"ct"];

  v11 = [(SLCollaborationHighlight *)self collaborationIdentifier];

  if (v11)
  {
    char v12 = [(SLCollaborationHighlight *)self collaborationIdentifier];
    [v4 setObject:v12 forKey:@"ci"];
  }
  else
  {
    uint64_t v15 = [(SLHighlight *)self identifier];
    [v4 setObject:v15 forKey:@"ci"];

    char v12 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SLCollaborationHighlight dictionaryRepresentation].cold.4();
    }
  }

  id v14 = v4;
LABEL_16:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLCollaborationHighlight)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SLCollaborationHighlight;
  v5 = [(SLHighlight *)&v15 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fn"];
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cd"];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ct"];
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ci"];
    collaborationIdentifier = v5->_collaborationIdentifier;
    v5->_collaborationIdentifier = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SLCollaborationHighlight;
  id v4 = a3;
  [(SLHighlight *)&v9 encodeWithCoder:v4];
  v5 = [(SLCollaborationHighlight *)self fileName];
  [v4 encodeObject:v5 forKey:@"fn"];

  uint64_t v6 = [(SLCollaborationHighlight *)self creationDate];
  [v4 encodeObject:v6 forKey:@"cd"];

  v7 = [(SLCollaborationHighlight *)self contentType];
  [v4 encodeObject:v7 forKey:@"ct"];

  uint64_t v8 = [(SLCollaborationHighlight *)self collaborationIdentifier];
  [v4 encodeObject:v8 forKey:@"ci"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SLCollaborationHighlight alloc];
  v5 = [(SLCollaborationHighlight *)self dictionaryRepresentation];
  uint64_t v6 = [(SLCollaborationHighlight *)v4 initWithDictionary:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    v24.receiver = self;
    v24.super_class = (Class)SLCollaborationHighlight;
    if ([(SLHighlight *)&v24 isEqual:v6])
    {
      v7 = [(SLCollaborationHighlight *)self fileName];
      if (v7 || ([v6 fileName], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v8 = [(SLCollaborationHighlight *)self fileName];
        objc_super v9 = [v6 fileName];
        int v10 = [v8 isEqualToString:v9];

        if (v7)
        {

          if (!v10) {
            goto LABEL_25;
          }
        }
        else
        {

          if ((v10 & 1) == 0) {
            goto LABEL_25;
          }
        }
      }
      uint64_t v12 = [(SLCollaborationHighlight *)self creationDate];
      if (v12 || ([v6 creationDate], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v13 = [(SLCollaborationHighlight *)self creationDate];
        id v14 = [v6 creationDate];
        int v15 = [v13 isEqual:v14];

        if (v12)
        {

          if (!v15) {
            goto LABEL_25;
          }
        }
        else
        {

          if ((v15 & 1) == 0) {
            goto LABEL_25;
          }
        }
      }
      id v16 = [(SLCollaborationHighlight *)self contentType];
      if (!v16)
      {
        v3 = [v6 contentType];
        if (!v3)
        {
LABEL_20:
          v20 = [(SLCollaborationHighlight *)self collaborationIdentifier];
          if (v20
            || ([v6 collaborationIdentifier], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            v21 = [(SLCollaborationHighlight *)self collaborationIdentifier];
            uint64_t v22 = [v6 collaborationIdentifier];
            char v11 = [v21 isEqualToString:v22];

            if (v20)
            {
LABEL_30:

              goto LABEL_26;
            }
          }
          else
          {
            char v11 = 1;
          }

          goto LABEL_30;
        }
      }
      objc_super v17 = [(SLCollaborationHighlight *)self contentType];
      objc_super v18 = [v6 contentType];
      int v19 = [v17 isEqualToString:v18];

      if (v16)
      {

        if (v19) {
          goto LABEL_20;
        }
      }
      else
      {

        if (v19) {
          goto LABEL_20;
        }
      }
    }
LABEL_25:
    char v11 = 0;
LABEL_26:

    goto LABEL_27;
  }
  char v11 = 0;
LABEL_27:

  return v11;
}

- (unint64_t)hash
{
  v2 = [(SLHighlight *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(SLCollaborationHighlight *)self collaborationIdentifier];
  v7 = [(SLHighlight *)self resourceURL];
  uint64_t v8 = [(SLHighlight *)self supplementaryData];
  objc_super v9 = [(SLCollaborationHighlight *)self fileName];
  int v10 = [(SLCollaborationHighlight *)self contentType];
  char v11 = [v3 stringWithFormat:@"[%@: collaborationIdentifier: %@  resourceURL: %@ supplementaryData: %@ fileName: %@ contentType: %@]", v5, v6, v7, v8, v9, v10];

  return v11;
}

+ (id)errorForCollaborationHighlightDomain:(id)a3 andCode:(int64_t)a4 andUnderlyingError:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  switch(a4)
  {
    case 1:
      uint64_t v27 = *MEMORY[0x1E4F28228];
      v28[0] = @"SLCollaborationHighlight Init failed. Invalid or nil File Name.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      objc_super v9 = (__CFString **)v28;
      int v10 = &v27;
      goto LABEL_11;
    case 2:
      uint64_t v25 = *MEMORY[0x1E4F28228];
      v26 = @"SLCollaborationHighlight Init failed. Invalid or nil content creation date.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      objc_super v9 = &v26;
      int v10 = &v25;
      goto LABEL_11;
    case 3:
      uint64_t v23 = *MEMORY[0x1E4F28228];
      objc_super v24 = @"SLCollaborationHighlight Init failed. Invalid or nil content type.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      objc_super v9 = &v24;
      int v10 = &v23;
      goto LABEL_11;
    case 4:
      uint64_t v21 = *MEMORY[0x1E4F28228];
      uint64_t v22 = @"SLCollaborationHighlight Init. Invalid or nil earliest attributions Identifiers.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      objc_super v9 = &v22;
      int v10 = &v21;
      goto LABEL_11;
    case 5:
      uint64_t v19 = *MEMORY[0x1E4F28228];
      v20 = @"SLCollaborationHighlight Init error. Invalid or nil fileProviderID defaulting to nil.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      objc_super v9 = &v20;
      int v10 = &v19;
      goto LABEL_11;
    case 6:
      uint64_t v15 = *MEMORY[0x1E4F28228];
      id v16 = @"SLCollaborationHighlight Init failed. Invalid or nil localIdentityProof defaulting to nil.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      objc_super v9 = &v16;
      int v10 = &v15;
      goto LABEL_11;
    case 7:
      uint64_t v17 = *MEMORY[0x1E4F28228];
      objc_super v18 = @"SLCollaborationHighlight Init error. Invalid or nil localIdentity defaulting to nil.";
      uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      objc_super v9 = &v18;
      int v10 = &v17;
LABEL_11:
      char v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
      if (a5) {
        goto LABEL_12;
      }
      goto LABEL_13;
    default:
      char v11 = 0;
      if (!a5) {
        goto LABEL_13;
      }
LABEL_12:
      uint64_t v12 = (void *)[v11 mutableCopy];
      [v12 setObject:*a5 forKey:*MEMORY[0x1E4F28A50]];

      char v11 = v12;
LABEL_13:
      id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:v7 code:a4 userInfo:v11];

      return v13;
  }
}

- (NSString)collaborationIdentifier
{
  return self->_collaborationIdentifier;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)contentType
{
  return self->_contentType;
}

- (NSDictionary)earliestAttributionIdentifiers
{
  return self->_earliestAttributionIdentifiers;
}

- (NSString)fileProviderID
{
  return self->_fileProviderID;
}

- (SWPersonIdentity)localIdentity
{
  return self->_localIdentity;
}

- (_SWPersonIdentityProof)localProofOfInclusion
{
  return self->_localProofOfInclusion;
}

- (NSDictionary)handleToIdentityMap
{
  return self->_handleToIdentityMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleToIdentityMap, 0);
  objc_storeStrong((id *)&self->_localProofOfInclusion, 0);
  objc_storeStrong((id *)&self->_localIdentity, 0);
  objc_storeStrong((id *)&self->_fileProviderID, 0);
  objc_storeStrong((id *)&self->_earliestAttributionIdentifiers, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_collaborationIdentifier, 0);
}

- (void)initWithPortraitCollaborationHighlight:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_19BE17000, v0, OS_LOG_TYPE_DEBUG, "-[PPSocialCollaboration handleToIdentityMap] is nil. This may mean this process is not entitled to have this property surfaced.", v1, 2u);
}

- (void)initWithPortraitCollaborationHighlight:error:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "Could not unarchive handleToIdentityMap from -[PPSocialCollaboration handleToIdentityMap]: %@", v2, v3, v4, v5, v6);
}

- (void)initWithPortraitCollaborationHighlight:error:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "Could not unarchive SWPersonIdentityProof from -[PPSocialCollaboration localIdentityProof]: %@", v2, v3, v4, v5, v6);
}

- (void)initWithPortraitCollaborationHighlight:error:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_19BE17000, v0, v1, "Could not unarchive SWPersonIdentity from -[PPSocialCollaboration localIdentity]: %@", v2, v3, v4, v5, v6);
}

- (void)initWithCSSearchableItem:(void *)a1 error:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 domainIdentifier];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "Attempted to initialize SLCH using a CSSearchableItem outside the attachment/links domain. Failing initialization from CSSearchableItem. domain: %@", v4, 0xCu);
}

- (void)initWithDictionary:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLCH dictionary fileName was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLCH dictionary creationDate was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLCH dictionary contentType was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.4()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLCH dictionary collaborationIdentifier was nil defaulting to identifier.", v2, v3, v4, v5, v6);
}

- (void)dictionaryRepresentation
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLCH collaborationIdentifier was nil defaulting to identifier.", v2, v3, v4, v5, v6);
}

@end