@interface _PSRecipient
+ (BOOL)supportsSecureCoding;
+ (id)recipientForINPerson:(id)a3 contactResolver:(id)a4;
- (BOOL)familyHeuristic;
- (BOOL)isEqual:(id)a3;
- (BOOL)photosInference;
- (CNContact)contact;
- (NSString)displayName;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)handle;
- (NSString)handleString;
- (NSString)identifier;
- (NSString)mostRecentTransportBundleId;
- (NSString)senderHandle;
- (_PSRecipient)initWithCoder:(id)a3;
- (_PSRecipient)initWithIdentifier:(id)a3 handle:(id)a4 contact:(id)a5;
- (_PSRecipient)initWithIdentifier:(id)a3 handle:(id)a4 contact:(id)a5 mostRecentTransportBundleId:(id)a6;
- (_PSRecipient)initWithIdentifier:(id)a3 handle:(id)a4 displayName:(id)a5 contact:(id)a6;
- (_PSRecipient)initWithIdentifier:(id)a3 senderHandle:(id)a4 handle:(id)a5 displayName:(id)a6 contact:(id)a7;
- (_PSRecipient)initWithIdentifier:(id)a3 senderHandle:(id)a4 handle:(id)a5 displayName:(id)a6 contact:(id)a7 mostRecentTransportBundleId:(id)a8;
- (id)description;
- (id)descriptionRedacted:(BOOL)a3;
- (id)redactedDescription;
- (int64_t)handleType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContact:(id)a3;
- (void)setFamilyHeuristic:(BOOL)a3;
- (void)setFamilyName:(id)a3;
- (void)setGivenName:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHandleString:(id)a3;
- (void)setHandleType:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setMostRecentTransportBundleId:(id)a3;
- (void)setPhotosInference:(BOOL)a3;
- (void)setSenderHandle:(id)a3;
@end

@implementation _PSRecipient

- (_PSRecipient)initWithIdentifier:(id)a3 handle:(id)a4 contact:(id)a5
{
  return [(_PSRecipient *)self initWithIdentifier:a3 handle:a4 displayName:0 contact:a5];
}

- (_PSRecipient)initWithIdentifier:(id)a3 handle:(id)a4 displayName:(id)a5 contact:(id)a6
{
  return [(_PSRecipient *)self initWithIdentifier:a3 senderHandle:0 handle:a4 displayName:a5 contact:a6 mostRecentTransportBundleId:0];
}

- (_PSRecipient)initWithIdentifier:(id)a3 handle:(id)a4 contact:(id)a5 mostRecentTransportBundleId:(id)a6
{
  return [(_PSRecipient *)self initWithIdentifier:a3 senderHandle:0 handle:a4 displayName:0 contact:a5 mostRecentTransportBundleId:a6];
}

- (_PSRecipient)initWithIdentifier:(id)a3 senderHandle:(id)a4 handle:(id)a5 displayName:(id)a6 contact:(id)a7
{
  return [(_PSRecipient *)self initWithIdentifier:a3 senderHandle:a4 handle:a5 displayName:a6 contact:a7 mostRecentTransportBundleId:0];
}

- (_PSRecipient)initWithIdentifier:(id)a3 senderHandle:(id)a4 handle:(id)a5 displayName:(id)a6 contact:(id)a7 mostRecentTransportBundleId:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v32.receiver = self;
  v32.super_class = (Class)_PSRecipient;
  v20 = [(_PSRecipient *)&v32 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    identifier = v20->_identifier;
    v20->_identifier = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    senderHandle = v20->_senderHandle;
    v20->_senderHandle = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    handle = v20->_handle;
    v20->_handle = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    displayName = v20->_displayName;
    v20->_displayName = (NSString *)v27;

    objc_storeStrong((id *)&v20->_contact, a7);
    uint64_t v29 = [v19 copy];
    mostRecentTransportBundleId = v20->_mostRecentTransportBundleId;
    v20->_mostRecentTransportBundleId = (NSString *)v29;

    v20->_handleType = +[_PSInteractionStoreUtils getHandleTypeFromHandleString:v16];
  }

  return v20;
}

+ (id)recipientForINPerson:(id)a3 contactResolver:(id)a4
{
  id v5 = a3;
  v6 = [a4 resolveContactFromINPerson:v5];
  id v7 = objc_alloc((Class)objc_opt_class());
  v8 = [v5 contactIdentifier];
  v9 = [v5 personHandle];
  v10 = [v9 value];
  v11 = [v5 displayName];

  v12 = (void *)[v7 initWithIdentifier:v8 handle:v10 displayName:v11 contact:v6];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_PSRecipient)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_PSRecipient;
  id v5 = [(_PSRecipient *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderHandle"];
    senderHandle = v5->_senderHandle;
    v5->_senderHandle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"givenName"];
    givenName = v5->_givenName;
    v5->_givenName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"familyName"];
    familyName = v5->_familyName;
    v5->_familyName = (NSString *)v16;

    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2050000000;
    id v18 = (void *)getCNContactClass_softClass_4;
    uint64_t v31 = getCNContactClass_softClass_4;
    if (!getCNContactClass_softClass_4)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __getCNContactClass_block_invoke_4;
      v27[3] = &unk_1E5ADE858;
      v27[4] = &v28;
      __getCNContactClass_block_invoke_4((uint64_t)v27);
      id v18 = (void *)v29[3];
    }
    id v19 = v18;
    _Block_object_dispose(&v28, 8);
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
    contact = v5->_contact;
    v5->_contact = (CNContact *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mostRecentTransportBundleId"];
    mostRecentTransportBundleId = v5->_mostRecentTransportBundleId;
    v5->_mostRecentTransportBundleId = (NSString *)v22;

    v5->_handleType = [v4 decodeIntegerForKey:@"handleType"];
    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_senderHandle forKey:@"senderHandle"];
  [v5 encodeObject:self->_handle forKey:@"handle"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_givenName forKey:@"givenName"];
  [v5 encodeObject:self->_familyName forKey:@"familyName"];
  [v5 encodeObject:self->_contact forKey:@"contact"];
  [v5 encodeObject:self->_mostRecentTransportBundleId forKey:@"mostRecentTransportBundleId"];
  [v5 encodeInteger:self->_handleType forKey:@"handleType"];
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSString *)self->_handle hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_PSRecipient *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        uint64_t v7 = [(_PSRecipient *)self identifier];
        if (v7)
        {
          uint64_t v8 = (void *)v7;
          uint64_t v9 = [(_PSRecipient *)self handle];
          if (!v9)
          {
            char v16 = 0;
LABEL_16:

            goto LABEL_17;
          }
          uint64_t v10 = (void *)v9;
          uint64_t v11 = [(_PSRecipient *)v6 identifier];
          if (!v11) {
            goto LABEL_14;
          }
          uint64_t v12 = (void *)v11;
          v13 = [(_PSRecipient *)v6 handle];

          if (v13)
          {
            uint64_t v8 = [(_PSRecipient *)self identifier];
            uint64_t v10 = [(_PSRecipient *)v6 identifier];
            if ([v8 isEqualToString:v10])
            {
              uint64_t v14 = [(_PSRecipient *)self handle];
              id v15 = [(_PSRecipient *)v6 handle];
              char v16 = [v14 isEqualToString:v15];

LABEL_15:
              goto LABEL_16;
            }
LABEL_14:
            char v16 = 0;
            goto LABEL_15;
          }
        }
        char v16 = 0;
LABEL_17:

        goto LABEL_18;
      }
    }
    char v16 = 0;
  }
LABEL_18:

  return v16;
}

- (id)description
{
  return [(_PSRecipient *)self descriptionRedacted:0];
}

- (id)redactedDescription
{
  return [(_PSRecipient *)self descriptionRedacted:1];
}

- (id)descriptionRedacted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = NSString;
  uint64_t v21 = objc_opt_class();
  id v5 = (void *)MEMORY[0x1E4F5B418];
  v24 = [(_PSRecipient *)self identifier];
  uint64_t v6 = [v5 descriptionOfObject:v24 redacted:v3];
  uint64_t v7 = (void *)MEMORY[0x1E4F5B418];
  uint64_t v23 = [(_PSRecipient *)self senderHandle];
  uint64_t v8 = [v7 descriptionOfObject:v23 redacted:v3];
  uint64_t v9 = (void *)MEMORY[0x1E4F5B418];
  uint64_t v10 = [(_PSRecipient *)self handle];
  uint64_t v11 = [v9 descriptionOfObject:v10 redacted:v3];
  uint64_t v12 = (void *)MEMORY[0x1E4F5B418];
  v13 = [(_PSRecipient *)self displayName];
  uint64_t v14 = [v12 descriptionOfObject:v13 redacted:v3];
  id v15 = (void *)MEMORY[0x1E4F5B418];
  char v16 = [(_PSRecipient *)self contact];
  id v17 = [v15 descriptionOfObject:v16 redacted:v3];
  id v18 = [(_PSRecipient *)self mostRecentTransportBundleId];
  id v19 = [v22 stringWithFormat:@"<%@ %p> identifier: %@, senderHandle: %@, handle: %@, displayName: %@, contact: %@ mostRecentTransportBundleId: %@", v21, self, v6, v8, v11, v14, v17, v18];

  return v19;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)handleString
{
  return self->_handleString;
}

- (void)setHandleString:(id)a3
{
}

- (int64_t)handleType
{
  return self->_handleType;
}

- (void)setHandleType:(int64_t)a3
{
  self->_handleType = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (void)setSenderHandle:(id)a3
{
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
}

- (BOOL)familyHeuristic
{
  return self->_familyHeuristic;
}

- (void)setFamilyHeuristic:(BOOL)a3
{
  self->_familyHeuristic = a3;
}

- (BOOL)photosInference
{
  return self->_photosInference;
}

- (void)setPhotosInference:(BOOL)a3
{
  self->_photosInference = a3;
}

- (NSString)mostRecentTransportBundleId
{
  return self->_mostRecentTransportBundleId;
}

- (void)setMostRecentTransportBundleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentTransportBundleId, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_handleString, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end