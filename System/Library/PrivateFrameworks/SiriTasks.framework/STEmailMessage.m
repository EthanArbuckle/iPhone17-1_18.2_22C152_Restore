@interface STEmailMessage
+ (BOOL)supportsSecureCoding;
- (NSArray)bccRecipients;
- (NSArray)ccRecipients;
- (NSArray)receivingAddresses;
- (NSArray)toRecipients;
- (NSString)messageBody;
- (NSString)subject;
- (NSURL)messageIdentifier;
- (STEmailMessage)initWithCoder:(id)a3;
- (STPerson)sender;
- (id)_aceContextObjectValue;
- (id)_personAttributesForRecipients:(id)a3;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setBccRecipients:(id)a3;
- (void)setCcRecipients:(id)a3;
- (void)setMessageBody:(id)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)setReceivingAddresses:(id)a3;
- (void)setSender:(id)a3;
- (void)setSubject:(id)a3;
- (void)setToRecipients:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation STEmailMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivingAddresses, 0);
  objc_storeStrong((id *)&self->_bccRecipients, 0);
  objc_storeStrong((id *)&self->_ccRecipients, 0);
  objc_storeStrong((id *)&self->_toRecipients, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_messageBody, 0);
}

- (void)setReceivingAddresses:(id)a3
{
}

- (NSArray)receivingAddresses
{
  return self->_receivingAddresses;
}

- (void)setBccRecipients:(id)a3
{
}

- (NSArray)bccRecipients
{
  return self->_bccRecipients;
}

- (void)setCcRecipients:(id)a3
{
}

- (NSArray)ccRecipients
{
  return self->_ccRecipients;
}

- (void)setToRecipients:(id)a3
{
}

- (NSArray)toRecipients
{
  return self->_toRecipients;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setSubject:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSender:(id)a3
{
}

- (STPerson)sender
{
  return self->_sender;
}

- (void)setMessageIdentifier:(id)a3
{
}

- (NSURL)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageBody:(id)a3
{
}

- (NSString)messageBody
{
  return self->_messageBody;
}

- (STEmailMessage)initWithCoder:(id)a3
{
  v39[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)STEmailMessage;
  v5 = [(STSiriModelObject *)&v35 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_messageBody"];
    messageBody = v5->_messageBody;
    v5->_messageBody = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_subject"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_messageIdentifier"];
    messageIdentifier = v5->_messageIdentifier;
    v5->_messageIdentifier = (NSURL *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_sender"];
    sender = v5->_sender;
    v5->_sender = (STPerson *)v12;

    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    v14 = (void *)MEMORY[0x263EFFA08];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
    v16 = [v14 setWithArray:v15];
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"_toRecipients"];
    toRecipients = v5->_toRecipients;
    v5->_toRecipients = (NSArray *)v17;

    v19 = (void *)MEMORY[0x263EFFA08];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
    v21 = [v19 setWithArray:v20];
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"_ccRecipients"];
    ccRecipients = v5->_ccRecipients;
    v5->_ccRecipients = (NSArray *)v22;

    v24 = (void *)MEMORY[0x263EFFA08];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
    v26 = [v24 setWithArray:v25];
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"_bccRecipients"];
    bccRecipients = v5->_bccRecipients;
    v5->_bccRecipients = (NSArray *)v27;

    v29 = (void *)MEMORY[0x263EFFA08];
    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
    v31 = [v29 setWithArray:v30];
    uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"_receivingAddresses"];
    receivingAddresses = v5->_receivingAddresses;
    v5->_receivingAddresses = (NSArray *)v32;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STEmailMessage;
  id v4 = a3;
  [(STSiriModelObject *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_messageBody, @"_messageBody", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_subject forKey:@"_subject"];
  [v4 encodeObject:self->_messageIdentifier forKey:@"_messageIdentifier"];
  [v4 encodeObject:self->_sender forKey:@"_sender"];
  [v4 encodeInteger:self->_type forKey:@"_type"];
  [v4 encodeObject:self->_toRecipients forKey:@"_toRecipients"];
  [v4 encodeObject:self->_ccRecipients forKey:@"_ccRecipients"];
  [v4 encodeObject:self->_bccRecipients forKey:@"_bccRecipients"];
  [v4 encodeObject:self->_receivingAddresses forKey:@"_receivingAddresses"];
}

- (id)_personAttributesForRecipients:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = v3;
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v28)
  {
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        objc_super v5 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        id v6 = objc_alloc_init(MEMORY[0x263F64B30]);
        id v7 = objc_alloc_init(MEMORY[0x263F64B28]);
        uint64_t v8 = [v5 fullName];
        v29 = v7;
        [v7 setFullName:v8];

        v9 = [v5 fullName];
        v30 = v6;
        [v6 setDisplayText:v9];

        uint64_t v10 = (void *)MEMORY[0x263EFF980];
        v11 = [v5 contactHandles];
        uint64_t v12 = objc_msgSend(v10, "arrayWithCapacity:", objc_msgSend(v11, "count"));

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        v13 = [v5 contactHandles];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v31 + 1) + 8 * j);
              if (![v18 type])
              {
                id v19 = objc_alloc_init(MEMORY[0x263F648C0]);
                v20 = [v18 handle];
                [v19 setEmailAddress:v20];

                v21 = [v18 label];
                [v19 setLabel:v21];

                if (v19) {
                  [v12 addObject:v19];
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
          }
          while (v15);
        }

        [v29 setEmails:v12];
        uint64_t v22 = [v12 firstObject];
        v23 = [v22 emailAddress];
        [v30 setData:v23];

        [v30 setObject:v29];
        if (v30) {
          [v26 addObject:v30];
        }
      }
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v28);
  }

  return v26;
}

- (id)_aceContextObjectValue
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F648C8]);
  [v3 setMessage:self->_messageBody];
  [v3 setSubject:self->_subject];
  unint64_t type = self->_type;
  if (type > 3) {
    id v5 = 0;
  }
  else {
    id v5 = **((id **)&unk_264762400 + type);
  }
  [v3 setType:v5];
  [v3 setIdentifier:self->_messageIdentifier];
  [v3 setReceivingAddresses:self->_receivingAddresses];
  id v6 = [(STEmailMessage *)self _personAttributesForRecipients:self->_toRecipients];
  [v3 setRecipientsTo:v6];

  id v7 = [(STEmailMessage *)self _personAttributesForRecipients:self->_ccRecipients];
  [v3 setRecipientsCc:v7];

  uint64_t v8 = [(STEmailMessage *)self _personAttributesForRecipients:self->_bccRecipients];
  [v3 setRecipientsBcc:v8];

  if (self->_sender)
  {
    v13[0] = self->_sender;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    uint64_t v10 = [(STEmailMessage *)self _personAttributesForRecipients:v9];
    v11 = [v10 firstObject];
    [v3 setFromEmail:v11];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end