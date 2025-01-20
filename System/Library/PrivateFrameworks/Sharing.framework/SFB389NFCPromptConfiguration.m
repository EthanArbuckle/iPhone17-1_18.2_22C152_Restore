@interface SFB389NFCPromptConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)localizedTitle;
- (NSString)message;
- (NSString)phoneNumber;
- (NSString)userMessage;
- (NSUUID)baUUID;
- (SFB389NFCPromptConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)promptState;
- (void)encodeWithCoder:(id)a3;
- (void)setBaUUID:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setMessage:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPromptState:(unint64_t)a3;
- (void)setUserMessage:(id)a3;
@end

@implementation SFB389NFCPromptConfiguration

- (void)encodeWithCoder:(id)a3
{
  localizedTitle = self->_localizedTitle;
  id v5 = a3;
  [v5 encodeObject:localizedTitle forKey:@"localizedTitle"];
  [v5 encodeObject:self->_message forKey:@"message"];
  [v5 encodeObject:self->_phoneNumber forKey:@"phoneNumber"];
  [v5 encodeObject:self->_userMessage forKey:@"userMessage"];
  [v5 encodeObject:self->_baUUID forKey:@"baUUID"];
  [v5 encodeInteger:self->_promptState forKey:@"promptState"];
}

- (SFB389NFCPromptConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFB389NFCPromptConfiguration;
  id v5 = [(SFB389NFCPromptConfiguration *)&v22 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    uint64_t v7 = [v6 copy];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    uint64_t v10 = [v9 copy];
    message = v5->_message;
    v5->_message = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
    uint64_t v13 = [v12 copy];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userMessage"];
    uint64_t v16 = [v15 copy];
    userMessage = v5->_userMessage;
    v5->_userMessage = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baUUID"];
    uint64_t v19 = [v18 copy];
    baUUID = v5->_baUUID;
    v5->_baUUID = (NSUUID *)v19;

    v5->_promptState = [v4 decodeIntegerForKey:@"promptState"];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFB389NFCPromptConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(SFB389NFCPromptConfiguration *)self localizedTitle];
      v6 = [(SFB389NFCPromptConfiguration *)v4 localizedTitle];
      id v7 = v5;
      id v8 = v6;
      v9 = v8;
      if (v7 == v8)
      {
      }
      else
      {
        if ((v7 == 0) == (v8 != 0))
        {
          BOOL v11 = 0;
          uint64_t v16 = v8;
          id v14 = v7;
          goto LABEL_40;
        }
        int v10 = [v7 isEqual:v8];

        if (!v10)
        {
          BOOL v11 = 0;
LABEL_41:

          goto LABEL_42;
        }
      }
      v12 = [(SFB389NFCPromptConfiguration *)self message];
      uint64_t v13 = [(SFB389NFCPromptConfiguration *)v4 message];
      id v14 = v12;
      id v15 = v13;
      uint64_t v16 = v15;
      if (v14 == v15)
      {
      }
      else
      {
        if ((v14 == 0) == (v15 != 0))
        {
          BOOL v11 = 0;
          objc_super v22 = v15;
          id v20 = v14;
          goto LABEL_39;
        }
        int v17 = [v14 isEqual:v15];

        if (!v17)
        {
          BOOL v11 = 0;
LABEL_40:

          goto LABEL_41;
        }
      }
      v18 = [(SFB389NFCPromptConfiguration *)self phoneNumber];
      uint64_t v19 = [(SFB389NFCPromptConfiguration *)v4 phoneNumber];
      id v20 = v18;
      id v21 = v19;
      objc_super v22 = v21;
      if (v20 == v21)
      {
      }
      else
      {
        if ((v20 == 0) == (v21 != 0))
        {
          BOOL v11 = 0;
          v28 = v21;
          id v26 = v20;
          goto LABEL_38;
        }
        int v23 = [v20 isEqual:v21];

        if (!v23)
        {
          BOOL v11 = 0;
LABEL_39:

          goto LABEL_40;
        }
      }
      v24 = [(SFB389NFCPromptConfiguration *)self userMessage];
      v25 = [(SFB389NFCPromptConfiguration *)v4 userMessage];
      id v26 = v24;
      id v27 = v25;
      v28 = v27;
      if (v26 == v27)
      {
      }
      else
      {
        if ((v26 == 0) == (v27 != 0))
        {
          v45 = v22;
          BOOL v11 = 0;
          v35 = v27;
          v36 = v26;
LABEL_37:

          objc_super v22 = v45;
          goto LABEL_38;
        }
        int v43 = [v26 isEqual:v27];

        if (!v43)
        {
          BOOL v11 = 0;
LABEL_38:

          goto LABEL_39;
        }
      }
      v42 = v28;
      id v44 = v26;
      v29 = [(SFB389NFCPromptConfiguration *)self baUUID];
      v30 = [(SFB389NFCPromptConfiguration *)v4 baUUID];
      id v31 = v29;
      id v32 = v30;
      v45 = v22;
      if (v31 == v32)
      {
        id v40 = v32;

        id v41 = v31;
      }
      else
      {
        if ((v31 == 0) == (v32 != 0))
        {
          id v38 = v32;

          v35 = v38;
          BOOL v11 = 0;
          v36 = v31;
          v28 = v42;
          id v26 = v44;
          goto LABEL_37;
        }
        v33 = v32;
        int v34 = [v31 isEqual:v32];
        id v40 = v33;

        id v41 = v31;
        if (!v34)
        {
          BOOL v11 = 0;
LABEL_35:
          v28 = v42;
          id v26 = v44;
          v35 = v40;
          v36 = v41;
          goto LABEL_37;
        }
      }
      unint64_t v37 = [(SFB389NFCPromptConfiguration *)self promptState];
      BOOL v11 = v37 == [(SFB389NFCPromptConfiguration *)v4 promptState];
      goto LABEL_35;
    }
    BOOL v11 = 0;
  }
LABEL_42:

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<SFB389NFCPromptConfiguration: %p, localizedTitle: %@, message: \"%@\", userMessage: %@, phoneNumber: %@, baUUID: %@, promptState: %li>", self, self->_localizedTitle, self->_message, self->_userMessage, self->_phoneNumber, self->_baUUID, self->_promptState];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  id v5 = [(SFB389NFCPromptConfiguration *)self localizedTitle];
  v6 = (void *)[v5 copy];
  [v4 setLocalizedTitle:v6];

  id v7 = [(SFB389NFCPromptConfiguration *)self message];
  id v8 = (void *)[v7 copy];
  [v4 setMessage:v8];

  v9 = [(SFB389NFCPromptConfiguration *)self userMessage];
  int v10 = (void *)[v9 copy];
  [v4 setUserMessage:v10];

  BOOL v11 = [(SFB389NFCPromptConfiguration *)self phoneNumber];
  v12 = (void *)[v11 copy];
  [v4 setPhoneNumber:v12];

  uint64_t v13 = [(SFB389NFCPromptConfiguration *)self baUUID];
  id v14 = (void *)[v13 copy];
  [v4 setBaUUID:v14];

  objc_msgSend(v4, "setPromptState:", -[SFB389NFCPromptConfiguration promptState](self, "promptState"));
  return v4;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)userMessage
{
  return self->_userMessage;
}

- (void)setUserMessage:(id)a3
{
}

- (NSUUID)baUUID
{
  return self->_baUUID;
}

- (void)setBaUUID:(id)a3
{
}

- (unint64_t)promptState
{
  return self->_promptState;
}

- (void)setPromptState:(unint64_t)a3
{
  self->_promptState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baUUID, 0);
  objc_storeStrong((id *)&self->_userMessage, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end