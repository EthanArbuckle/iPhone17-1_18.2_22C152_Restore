@interface _PSSuggestionProxy
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)useGroupsWhenFindingRecipient;
- (INImage)image;
- (NSArray)handles;
- (NSNumber)modelScore;
- (NSString)bundleID;
- (NSString)contactID;
- (NSString)description;
- (NSString)groupName;
- (NSString)handle;
- (NSString)interactionRecipients;
- (NSString)reason;
- (NSString)reasonType;
- (NSString)suggestionKey;
- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handle:(id)a6 reason:(id)a7 reasonType:(id)a8;
- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handle:(id)a6 reason:(id)a7 reasonType:(id)a8 groupName:(id)a9 image:(id)a10;
- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handle:(id)a6 reason:(id)a7 reasonType:(id)a8 image:(id)a9;
- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handle:(id)a6 reason:(id)a7 reasonType:(id)a8 useGroupsWhenFindingRecipient:(BOOL)a9;
- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handles:(id)a6 reason:(id)a7 reasonType:(id)a8 useGroupsWhenFindingRecipient:(BOOL)a9 groupName:(id)a10 image:(id)a11;
- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handles:(id)a6 reason:(id)a7 reasonType:(id)a8 useGroupsWhenFindingRecipient:(BOOL)a9 groupName:(id)a10 image:(id)a11 modelScore:(id)a12;
- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 reason:(id)a6 reasonType:(id)a7;
- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 reason:(id)a6 reasonType:(id)a7 modelScore:(id)a8;
- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 handles:(id)a5 reason:(id)a6 reasonType:(id)a7;
- (_PSSuggestionProxy)initWithCoder:(id)a3;
- (id)descriptionRedacted:(BOOL)a3;
- (id)redactedDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _PSSuggestionProxy

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handle:(id)a6 reason:(id)a7 reasonType:(id)a8 groupName:(id)a9 image:(id)a10
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (v18)
  {
    v29[0] = v18;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  }
  else
  {
    v23 = 0;
  }
  v24 = [NSNumber numberWithDouble:-1.0];
  LOBYTE(v27) = 0;
  v25 = [(_PSSuggestionProxy *)self initWithBundleID:v28 interactionRecipients:v16 contactID:v17 handles:v23 reason:v19 reasonType:v20 useGroupsWhenFindingRecipient:v27 groupName:v21 image:v22 modelScore:v24];

  if (v18) {
  return v25;
  }
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handle:(id)a6 reason:(id)a7 reasonType:(id)a8 image:(id)a9
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (v18)
  {
    v27[0] = v18;
    id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  }
  else
  {
    id v22 = 0;
  }
  v23 = [NSNumber numberWithDouble:-1.0];
  LOBYTE(v26) = 0;
  v24 = [(_PSSuggestionProxy *)self initWithBundleID:v15 interactionRecipients:v16 contactID:v17 handles:v22 reason:v19 reasonType:v20 useGroupsWhenFindingRecipient:v26 groupName:0 image:v21 modelScore:v23];

  if (v18) {
  return v24;
  }
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 reason:(id)a6 reasonType:(id)a7
{
  v12 = NSNumber;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v12 numberWithDouble:-1.0];
  LOBYTE(v21) = 0;
  id v19 = [(_PSSuggestionProxy *)self initWithBundleID:v17 interactionRecipients:v16 contactID:v15 handles:0 reason:v14 reasonType:v13 useGroupsWhenFindingRecipient:v21 groupName:0 image:0 modelScore:v18];

  return v19;
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 reason:(id)a6 reasonType:(id)a7 modelScore:(id)a8
{
  LOBYTE(v9) = 0;
  return [(_PSSuggestionProxy *)self initWithBundleID:a3 interactionRecipients:a4 contactID:a5 handles:0 reason:a6 reasonType:a7 useGroupsWhenFindingRecipient:v9 groupName:0 image:0 modelScore:a8];
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handle:(id)a6 reason:(id)a7 reasonType:(id)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    id v36 = a6;
    id v14 = (void *)MEMORY[0x1E4F1C978];
    id v15 = a8;
    id v16 = a7;
    id v17 = a6;
    id v18 = a5;
    id v19 = a4;
    id v20 = a3;
    uint64_t v21 = [v14 arrayWithObjects:&v36 count:1];
    id v22 = [NSNumber numberWithDouble:-1.0];

    LOBYTE(v35) = 0;
    v23 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:](self, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:", v20, v19, v18, v21, v16, v15, v35, 0, 0, v22, v36, v37);

    v24 = v23;
  }
  else
  {
    v25 = NSNumber;
    id v26 = a8;
    id v27 = a7;
    id v28 = 0;
    id v29 = a5;
    id v30 = a4;
    id v31 = a3;
    v32 = [v25 numberWithDouble:-1.0];

    LOBYTE(v35) = 0;
    v33 = [(_PSSuggestionProxy *)self initWithBundleID:v31 interactionRecipients:v30 contactID:v29 handles:0 reason:v27 reasonType:v26 useGroupsWhenFindingRecipient:v35 groupName:0 image:0 modelScore:v32];

    v24 = v33;
  }

  return v24;
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 handles:(id)a5 reason:(id)a6 reasonType:(id)a7
{
  v12 = NSNumber;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [v12 numberWithDouble:-1.0];
  LOBYTE(v21) = 0;
  id v19 = [(_PSSuggestionProxy *)self initWithBundleID:v17 interactionRecipients:v16 contactID:0 handles:v15 reason:v14 reasonType:v13 useGroupsWhenFindingRecipient:v21 groupName:0 image:0 modelScore:v18];

  return v19;
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handle:(id)a6 reason:(id)a7 reasonType:(id)a8 useGroupsWhenFindingRecipient:(BOOL)a9
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (a6)
  {
    id v37 = a6;
    id v15 = (void *)MEMORY[0x1E4F1C978];
    id v16 = a8;
    id v17 = a7;
    id v18 = a6;
    id v19 = a5;
    id v20 = a4;
    id v21 = a3;
    id v22 = [v15 arrayWithObjects:&v37 count:1];
    v23 = [NSNumber numberWithDouble:-1.0];

    LOBYTE(v36) = a9;
    v24 = -[_PSSuggestionProxy initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:](self, "initWithBundleID:interactionRecipients:contactID:handles:reason:reasonType:useGroupsWhenFindingRecipient:groupName:image:modelScore:", v21, v20, v19, v22, v17, v16, v36, 0, 0, v23, v37, v38);

    v25 = v24;
  }
  else
  {
    id v26 = NSNumber;
    id v27 = a8;
    id v28 = a7;
    id v29 = 0;
    id v30 = a5;
    id v31 = a4;
    id v32 = a3;
    v33 = [v26 numberWithDouble:-1.0];

    LOBYTE(v36) = a9;
    v34 = [(_PSSuggestionProxy *)self initWithBundleID:v32 interactionRecipients:v31 contactID:v30 handles:0 reason:v28 reasonType:v27 useGroupsWhenFindingRecipient:v36 groupName:0 image:0 modelScore:v33];

    v25 = v34;
  }

  return v25;
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handles:(id)a6 reason:(id)a7 reasonType:(id)a8 useGroupsWhenFindingRecipient:(BOOL)a9 groupName:(id)a10 image:(id)a11
{
  id v17 = NSNumber;
  id v18 = a11;
  id v19 = a10;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v26 = [v17 numberWithDouble:-1.0];
  LOBYTE(v29) = a9;
  id v27 = [(_PSSuggestionProxy *)self initWithBundleID:v25 interactionRecipients:v24 contactID:v23 handles:v22 reason:v21 reasonType:v20 useGroupsWhenFindingRecipient:v29 groupName:v19 image:v18 modelScore:v26];

  return v27;
}

- (_PSSuggestionProxy)initWithBundleID:(id)a3 interactionRecipients:(id)a4 contactID:(id)a5 handles:(id)a6 reason:(id)a7 reasonType:(id)a8 useGroupsWhenFindingRecipient:(BOOL)a9 groupName:(id)a10 image:(id)a11 modelScore:(id)a12
{
  id v17 = a3;
  id v18 = a4;
  id v41 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  v42.receiver = self;
  v42.super_class = (Class)_PSSuggestionProxy;
  id v25 = [(_PSSuggestionProxy *)&v42 init];
  if (v25)
  {
    uint64_t v26 = [v17 copy];
    bundleID = v25->_bundleID;
    v25->_bundleID = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    interactionRecipients = v25->_interactionRecipients;
    v25->_interactionRecipients = (NSString *)v28;

    uint64_t v30 = [v20 copy];
    reason = v25->_reason;
    v25->_reason = (NSString *)v30;

    uint64_t v32 = [v21 copy];
    reasonType = v25->_reasonType;
    v25->_reasonType = (NSString *)v32;

    v25->_useGroupsWhenFindingRecipient = a9;
    uint64_t v34 = [v19 copy];
    handles = v25->_handles;
    v25->_handles = (NSArray *)v34;

    handle = v25->_handle;
    v25->_handle = 0;

    objc_storeStrong((id *)&v25->_contactID, a5);
    objc_storeStrong((id *)&v25->_groupName, a10);
    if (v19 && [v19 count] == 1)
    {
      uint64_t v37 = [v19 objectAtIndexedSubscript:0];
      uint64_t v38 = v25->_handle;
      v25->_handle = (NSString *)v37;
    }
    objc_storeStrong((id *)&v25->_image, a11);
    objc_storeStrong((id *)&v25->_modelScore, a12);
  }

  return v25;
}

- (NSString)suggestionKey
{
  v3 = [(_PSSuggestionProxy *)self bundleID];
  v4 = [(_PSSuggestionProxy *)self interactionRecipients];
  v5 = _PSSuggestionKey(v3, v4);

  return (NSString *)v5;
}

- (NSString)description
{
  return (NSString *)[(_PSSuggestionProxy *)self descriptionRedacted:0];
}

- (id)redactedDescription
{
  return [(_PSSuggestionProxy *)self descriptionRedacted:1];
}

- (id)descriptionRedacted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(_PSSuggestionProxy *)self bundleID];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(_PSSuggestionProxy *)self interactionRecipients];

    if (v7)
    {
      v8 = NSString;
      uint64_t v9 = [(_PSSuggestionProxy *)self bundleID];
      v10 = (void *)MEMORY[0x1E4F5B418];
      v11 = [(_PSSuggestionProxy *)self interactionRecipients];
      v12 = [v10 descriptionOfObject:v11 redacted:v3];
      id v13 = [v8 stringWithFormat:@"bundleID: %@, interactionRecipients: %@", v9, v12];

LABEL_8:
      goto LABEL_9;
    }
  }
  id v14 = [(_PSSuggestionProxy *)self contactID];

  if (v14)
  {
    id v15 = NSString;
    id v16 = (void *)MEMORY[0x1E4F5B418];
    uint64_t v9 = [(_PSSuggestionProxy *)self contactID];
    id v17 = [v16 descriptionOfObject:v9 redacted:v3];
    id v13 = [v15 stringWithFormat:@"contactID: %@", v17];

    goto LABEL_8;
  }
  id v18 = [(_PSSuggestionProxy *)self handles];

  if (v18)
  {
    id v19 = (void *)MEMORY[0x1E4F5B418];
    uint64_t v9 = [(_PSSuggestionProxy *)self handles];
    id v13 = [v19 descriptionOfArray:v9 redacted:v3];
    goto LABEL_8;
  }
  id v13 = 0;
LABEL_9:
  id v20 = [NSString stringWithFormat:@"<%@ %p> %@", objc_opt_class(), self, v13];

  return v20;
}

- (unint64_t)hash
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_PSSuggestionProxy *)self handles];

  if (v3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v4 = [(_PSSuggestionProxy *)self handles];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v4);
          }
          v7 ^= [*(id *)(*((void *)&v13 + 1) + 8 * i) hash];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_bundleID hash];
  NSUInteger v11 = [(NSString *)self->_interactionRecipients hash];
  return v10 ^ v7 ^ v11 ^ [(NSString *)self->_contactID hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (_PSSuggestionProxy *)a3;
  uint64_t v6 = v5;
  if (self == v5)
  {
    char v18 = 1;
  }
  else
  {
    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = v6;
        uint64_t v8 = [(_PSSuggestionProxy *)self bundleID];
        if (!v8) {
          goto LABEL_14;
        }
        uint64_t v9 = (void *)v8;
        uint64_t v10 = [(_PSSuggestionProxy *)self interactionRecipients];
        if (v10)
        {
          BOOL v3 = (void *)v10;
          uint64_t v11 = [(_PSSuggestionProxy *)v7 bundleID];
          if (v11)
          {
            v12 = (void *)v11;
            long long v13 = [(_PSSuggestionProxy *)v7 interactionRecipients];

            if (v13)
            {
              id v14 = [(_PSSuggestionProxy *)self bundleID];
              id v15 = [(_PSSuggestionProxy *)v7 bundleID];
              if ([v14 isEqualToString:v15])
              {
                long long v16 = [(_PSSuggestionProxy *)self interactionRecipients];
                uint64_t v17 = [(_PSSuggestionProxy *)v7 interactionRecipients];
LABEL_43:
                v45 = (void *)v17;
                char v18 = [v16 isEqualToString:v17];

LABEL_45:
                goto LABEL_46;
              }
              goto LABEL_44;
            }
LABEL_14:
            uint64_t v19 = [(_PSSuggestionProxy *)self contactID];
            if (v19)
            {
              id v20 = (void *)v19;
              uint64_t v21 = [(_PSSuggestionProxy *)v7 contactID];
              if (v21)
              {
                BOOL v3 = (void *)v21;
                id v22 = [(_PSSuggestionProxy *)self contactID];
                id v23 = [(_PSSuggestionProxy *)v7 contactID];
                int v24 = [v22 isEqualToString:v23];

                if (!v24)
                {
LABEL_26:
                  char v18 = 0;
LABEL_47:

                  goto LABEL_48;
                }
              }
              else
              {
              }
            }
            id v14 = [(_PSSuggestionProxy *)self contactID];
            if (v14)
            {
              BOOL v3 = [(_PSSuggestionProxy *)v7 contactID];
              if (!v3)
              {
                char v18 = 0;
LABEL_46:

                goto LABEL_47;
              }
            }
            id v25 = [(_PSSuggestionProxy *)v7 contactID];
            if (v25)
            {
              uint64_t v26 = [(_PSSuggestionProxy *)self contactID];

              if (v14)
              {
              }
              if (!v26) {
                goto LABEL_26;
              }
            }
            else
            {

              if (v14)
              {
              }
            }
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            uint64_t v27 = [(_PSSuggestionProxy *)self handles];
            if (!v27) {
              goto LABEL_51;
            }
            uint64_t v28 = (void *)v27;
            uint64_t v29 = [(_PSSuggestionProxy *)v7 handles];

            if (!v29) {
              goto LABEL_51;
            }
            uint64_t v30 = [(_PSSuggestionProxy *)self handles];
            uint64_t v31 = [v30 count];

            if (v31)
            {
              unint64_t v32 = 0;
              do
              {
                v33 = [(_PSSuggestionProxy *)self handles];
                uint64_t v34 = [v33 objectAtIndexedSubscript:v32];
                [v14 addObject:v34];

                ++v32;
                uint64_t v35 = [(_PSSuggestionProxy *)self handles];
                unint64_t v36 = [v35 count];
              }
              while (v36 > v32);
            }
            uint64_t v37 = [(_PSSuggestionProxy *)v7 handles];
            uint64_t v38 = [v37 count];

            if (v38)
            {
              unint64_t v39 = 0;
              do
              {
                v40 = [(_PSSuggestionProxy *)v7 handles];
                id v41 = [v40 objectAtIndexedSubscript:v39];
                [v15 addObject:v41];

                ++v39;
                objc_super v42 = [(_PSSuggestionProxy *)v7 handles];
                unint64_t v43 = [v42 count];
              }
              while (v43 > v39);
            }
            uint64_t v44 = [v14 count];
            if (v44 == [v15 count])
            {
              if ([v14 isEqualToSet:v15])
              {
LABEL_51:
                if ([v14 count]
                  && [v15 count]
                  && [v14 isEqualToSet:v15])
                {
                  long long v16 = [(_PSSuggestionProxy *)self bundleID];
                  uint64_t v17 = [(_PSSuggestionProxy *)v7 bundleID];
                  goto LABEL_43;
                }
              }
            }
LABEL_44:
            char v18 = 0;
            goto LABEL_45;
          }
        }
        goto LABEL_14;
      }
    }
    char v18 = 0;
  }
LABEL_48:

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSSuggestionProxy)initWithCoder:(id)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_PSSuggestionProxy;
  uint64_t v5 = [(_PSSuggestionProxy *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"interactionRecipients"];
    interactionRecipients = v5->_interactionRecipients;
    v5->_interactionRecipients = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactID"];
    contactID = v5->_contactID;
    v5->_contactID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reason"];
    reason = v5->_reason;
    v5->_reason = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"reasonType"];
    reasonType = v5->_reasonType;
    v5->_reasonType = (NSString *)v16;

    v5->_useGroupsWhenFindingRecipient = [v4 decodeBoolForKey:@"useGroupsWhenFindingRecipient"];
    char v18 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    id v20 = [v18 setWithArray:v19];

    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"handles"];
    handles = v5->_handles;
    v5->_handles = (NSArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modelScore"];
    modelScore = v5->_modelScore;
    v5->_modelScore = (NSNumber *)v23;

    id v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  bundleID = self->_bundleID;
  id v5 = a3;
  [v5 encodeObject:bundleID forKey:@"bundleID"];
  [v5 encodeObject:self->_interactionRecipients forKey:@"interactionRecipients"];
  [v5 encodeObject:self->_contactID forKey:@"contactID"];
  [v5 encodeObject:self->_handle forKey:@"handle"];
  [v5 encodeObject:self->_reason forKey:@"reason"];
  [v5 encodeObject:self->_reasonType forKey:@"reasonType"];
  [v5 encodeBool:self->_useGroupsWhenFindingRecipient forKey:@"useGroupsWhenFindingRecipient"];
  [v5 encodeObject:self->_handles forKey:@"handles"];
  [v5 encodeObject:self->_modelScore forKey:@"modelScore"];
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (INImage)image
{
  return self->_image;
}

- (NSString)interactionRecipients
{
  return self->_interactionRecipients;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (NSArray)handles
{
  return self->_handles;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)groupName
{
  return self->_groupName;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)reasonType
{
  return self->_reasonType;
}

- (NSNumber)modelScore
{
  return self->_modelScore;
}

- (BOOL)useGroupsWhenFindingRecipient
{
  return self->_useGroupsWhenFindingRecipient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelScore, 0);
  objc_storeStrong((id *)&self->_reasonType, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_interactionRecipients, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end