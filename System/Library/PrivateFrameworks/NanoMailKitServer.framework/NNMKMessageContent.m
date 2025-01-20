@interface NNMKMessageContent
+ (BOOL)supportsSecureCoding;
+ (id)classesForUnarchivingTextData;
- (BOOL)hasTextData;
- (BOOL)isHTML;
- (BOOL)mainAlternativeValid;
- (BOOL)partiallyLoaded;
- (NNMKMessageContent)initWithCoder:(id)a3;
- (NSArray)attachments;
- (NSData)htmlContentData;
- (NSData)textData;
- (NSString)externalReferenceId;
- (NSString)messageId;
- (id)description;
- (unint64_t)originalContentSize;
- (void)encodeWithCoder:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setExternalReferenceId:(id)a3;
- (void)setHasTextData:(BOOL)a3;
- (void)setHtmlContentData:(id)a3;
- (void)setMainAlternativeValid:(BOOL)a3;
- (void)setMessageId:(id)a3;
- (void)setOriginalContentSize:(unint64_t)a3;
- (void)setPartiallyLoaded:(BOOL)a3;
- (void)setTextData:(id)a3;
@end

@implementation NNMKMessageContent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKMessageContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NNMKMessageContent;
  v5 = [(NNMKMessageContent *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyMessageId"];
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyExternalReferenceId"];
    externalReferenceId = v5->_externalReferenceId;
    v5->_externalReferenceId = (NSString *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyMainAlternativeValid"];
    v5->_mainAlternativeValid = [v10 BOOLValue];

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyTextData"];
    textData = v5->_textData;
    v5->_textData = (NSData *)v11;

    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"kNSCodingKeyAttachments"];
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyPartiallyLoaded"];
    v5->_partiallyLoaded = [v18 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  messageId = self->_messageId;
  id v5 = a3;
  [v5 encodeObject:messageId forKey:@"kNSCodingKeyMessageId"];
  [v5 encodeObject:self->_externalReferenceId forKey:@"kNSCodingKeyExternalReferenceId"];
  uint64_t v6 = [NSNumber numberWithBool:self->_mainAlternativeValid];
  [v5 encodeObject:v6 forKey:@"kNSCodingKeyMainAlternativeValid"];

  [v5 encodeObject:self->_textData forKey:@"kNSCodingKeyTextData"];
  [v5 encodeObject:self->_attachments forKey:@"kNSCodingKeyAttachments"];
  id v7 = [NSNumber numberWithBool:self->_partiallyLoaded];
  [v5 encodeObject:v7 forKey:@"kNSCodingKeyPartiallyLoaded"];
}

- (void)setAttachments:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (NSArray *)a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10 = [(NNMKMessageContent *)self messageId];
        [v9 setMessageId:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  attachments = self->_attachments;
  self->_attachments = v4;
}

- (BOOL)isHTML
{
  return [(NSData *)self->_htmlContentData length] != 0;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Message Id: %@\nText Data Length: %lu\nAttachments: %@\n", self->_messageId, -[NSData length](self->_textData, "length"), self->_attachments];
}

+ (id)classesForUnarchivingTextData
{
  if (classesForUnarchivingTextData_onceToken != -1) {
    dispatch_once(&classesForUnarchivingTextData_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)classesForUnarchivingTextData_classesForUnarchivingTextData;
  return v2;
}

uint64_t __51__NNMKMessageContent_classesForUnarchivingTextData__block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  classesForUnarchivingTextData_classesForUnarchivingTextData = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  return MEMORY[0x270F9A758]();
}

- (NSString)messageId
{
  return self->_messageId;
}

- (void)setMessageId:(id)a3
{
}

- (NSString)externalReferenceId
{
  return self->_externalReferenceId;
}

- (void)setExternalReferenceId:(id)a3
{
}

- (BOOL)mainAlternativeValid
{
  return self->_mainAlternativeValid;
}

- (void)setMainAlternativeValid:(BOOL)a3
{
  self->_mainAlternativeValid = a3;
}

- (NSData)textData
{
  return self->_textData;
}

- (void)setTextData:(id)a3
{
}

- (NSData)htmlContentData
{
  return self->_htmlContentData;
}

- (void)setHtmlContentData:(id)a3
{
}

- (BOOL)hasTextData
{
  return self->_hasTextData;
}

- (void)setHasTextData:(BOOL)a3
{
  self->_hasTextData = a3;
}

- (unint64_t)originalContentSize
{
  return self->_originalContentSize;
}

- (void)setOriginalContentSize:(unint64_t)a3
{
  self->_originalContentSize = a3;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (BOOL)partiallyLoaded
{
  return self->_partiallyLoaded;
}

- (void)setPartiallyLoaded:(BOOL)a3
{
  self->_partiallyLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_htmlContentData, 0);
  objc_storeStrong((id *)&self->_textData, 0);
  objc_storeStrong((id *)&self->_externalReferenceId, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
}

@end