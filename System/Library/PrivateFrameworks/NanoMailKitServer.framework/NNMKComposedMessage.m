@interface NNMKComposedMessage
+ (BOOL)supportsSecureCoding;
- (BOOL)includeAttachments;
- (NNMKComposedMessage)init;
- (NNMKComposedMessage)initWithCoder:(id)a3;
- (NSArray)attachments;
- (NSArray)cc;
- (NSArray)to;
- (NSString)accountId;
- (NSString)body;
- (NSString)composedMessageId;
- (NSString)from;
- (NSString)referenceMessageId;
- (NSString)standaloneReferenceMessageId;
- (NSString)subject;
- (id)copyWithNewId;
- (id)description;
- (int64_t)progress;
- (unint64_t)sendingType;
- (unint64_t)size;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountId:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBody:(id)a3;
- (void)setCc:(id)a3;
- (void)setComposedMessageId:(id)a3;
- (void)setFrom:(id)a3;
- (void)setIncludeAttachments:(BOOL)a3;
- (void)setProgress:(int64_t)a3;
- (void)setReferenceMessageId:(id)a3;
- (void)setSendingType:(unint64_t)a3;
- (void)setStandaloneReferenceMessageId:(id)a3;
- (void)setSubject:(id)a3;
- (void)setTo:(id)a3;
@end

@implementation NNMKComposedMessage

- (NNMKComposedMessage)init
{
  v7.receiver = self;
  v7.super_class = (Class)NNMKComposedMessage;
  v2 = [(NNMKComposedMessage *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    uint64_t v4 = [v3 UUIDString];
    composedMessageId = v2->_composedMessageId;
    v2->_composedMessageId = (NSString *)v4;

    v2->_sendingType = 1;
  }
  return v2;
}

- (unint64_t)size
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NSString *)self->_body lengthOfBytesUsingEncoding:4];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_attachments;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 += objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "fileSize", (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKComposedMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NNMKComposedMessage *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyComposedMessageId"];
    composedMessageId = v5->_composedMessageId;
    v5->_composedMessageId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeySendingType"];
    v5->_sendingType = [v8 unsignedIntegerValue];

    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    long long v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"kNSCodingKeyTo"];
    to = v5->_to;
    v5->_to = (NSArray *)v12;

    v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"kNSCodingKeyCC"];
    cc = v5->_cc;
    v5->_cc = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeySubject"];
    subject = v5->_subject;
    v5->_subject = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyFrom"];
    from = v5->_from;
    v5->_from = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyBody"];
    body = v5->_body;
    v5->_body = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyReferenceMessageId"];
    referenceMessageId = v5->_referenceMessageId;
    v5->_referenceMessageId = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyStandaloneReferenceMessageId"];
    standaloneReferenceMessageId = v5->_standaloneReferenceMessageId;
    v5->_standaloneReferenceMessageId = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyAccountId"];
    accountId = v5->_accountId;
    v5->_accountId = (NSString *)v29;

    v31 = (void *)MEMORY[0x263EFFA08];
    uint64_t v32 = objc_opt_class();
    v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"kNSCodingKeyAttachments"];
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v34;

    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyIncludeAttachments"];
    v5->_includeAttachments = [v36 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  composedMessageId = self->_composedMessageId;
  id v5 = a3;
  [v5 encodeObject:composedMessageId forKey:@"kNSCodingKeyComposedMessageId"];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_sendingType];
  [v5 encodeObject:v6 forKey:@"kNSCodingKeySendingType"];

  [v5 encodeObject:self->_to forKey:@"kNSCodingKeyTo"];
  [v5 encodeObject:self->_cc forKey:@"kNSCodingKeyCC"];
  [v5 encodeObject:self->_subject forKey:@"kNSCodingKeySubject"];
  [v5 encodeObject:self->_from forKey:@"kNSCodingKeyFrom"];
  [v5 encodeObject:self->_body forKey:@"kNSCodingKeyBody"];
  [v5 encodeObject:self->_referenceMessageId forKey:@"kNSCodingKeyReferenceMessageId"];
  [v5 encodeObject:self->_standaloneReferenceMessageId forKey:@"kNSCodingKeyStandaloneReferenceMessageId"];
  [v5 encodeObject:self->_accountId forKey:@"kNSCodingKeyAccountId"];
  [v5 encodeObject:self->_attachments forKey:@"kNSCodingKeyAttachments"];
  id v7 = [NSNumber numberWithBool:self->_includeAttachments];
  [v5 encodeObject:v7 forKey:@"kNSCodingKeyIncludeAttachments"];
}

- (id)copyWithNewId
{
  unint64_t v3 = objc_alloc_init(NNMKComposedMessage);
  [(NNMKComposedMessage *)v3 setSendingType:[(NNMKComposedMessage *)self sendingType]];
  id v4 = [(NNMKComposedMessage *)self to];
  [(NNMKComposedMessage *)v3 setTo:v4];

  id v5 = [(NNMKComposedMessage *)self cc];
  [(NNMKComposedMessage *)v3 setCc:v5];

  uint64_t v6 = [(NNMKComposedMessage *)self from];
  [(NNMKComposedMessage *)v3 setFrom:v6];

  id v7 = [(NNMKComposedMessage *)self subject];
  [(NNMKComposedMessage *)v3 setSubject:v7];

  uint64_t v8 = [(NNMKComposedMessage *)self body];
  [(NNMKComposedMessage *)v3 setBody:v8];

  v9 = [(NNMKComposedMessage *)self referenceMessageId];
  [(NNMKComposedMessage *)v3 setReferenceMessageId:v9];

  uint64_t v10 = [(NNMKComposedMessage *)self standaloneReferenceMessageId];
  [(NNMKComposedMessage *)v3 setStandaloneReferenceMessageId:v10];

  long long v11 = [(NNMKComposedMessage *)self accountId];
  [(NNMKComposedMessage *)v3 setAccountId:v11];

  uint64_t v12 = [(NNMKComposedMessage *)self attachments];
  long long v13 = (void *)[v12 copy];
  [(NNMKComposedMessage *)v3 setAttachments:v13];

  [(NNMKComposedMessage *)v3 setIncludeAttachments:[(NNMKComposedMessage *)self includeAttachments]];
  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Composed Message Id: %@\nSending Type: %lu\nTo: %@\nCC: %@\nSubject: %@\nBody: %@\nReference Message Id: %@\nStandalone Reference Message Id: %@\nAccount Id:%@\nInclude Attachments: %d", self->_composedMessageId, self->_sendingType, self->_to, self->_cc, self->_subject, self->_body, self->_referenceMessageId, self->_standaloneReferenceMessageId, self->_accountId, self->_includeAttachments];
}

- (NSString)composedMessageId
{
  return self->_composedMessageId;
}

- (void)setComposedMessageId:(id)a3
{
}

- (unint64_t)sendingType
{
  return self->_sendingType;
}

- (void)setSendingType:(unint64_t)a3
{
  self->_sendingType = a3;
}

- (int64_t)progress
{
  return self->_progress;
}

- (void)setProgress:(int64_t)a3
{
  self->_progress = a3;
}

- (NSArray)to
{
  return self->_to;
}

- (void)setTo:(id)a3
{
}

- (NSArray)cc
{
  return self->_cc;
}

- (void)setCc:(id)a3
{
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSString)from
{
  return self->_from;
}

- (void)setFrom:(id)a3
{
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (NSString)referenceMessageId
{
  return self->_referenceMessageId;
}

- (void)setReferenceMessageId:(id)a3
{
}

- (NSString)standaloneReferenceMessageId
{
  return self->_standaloneReferenceMessageId;
}

- (void)setStandaloneReferenceMessageId:(id)a3
{
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (BOOL)includeAttachments
{
  return self->_includeAttachments;
}

- (void)setIncludeAttachments:(BOOL)a3
{
  self->_includeAttachments = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_standaloneReferenceMessageId, 0);
  objc_storeStrong((id *)&self->_referenceMessageId, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_from, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_cc, 0);
  objc_storeStrong((id *)&self->_to, 0);
  objc_storeStrong((id *)&self->_composedMessageId, 0);
}

@end