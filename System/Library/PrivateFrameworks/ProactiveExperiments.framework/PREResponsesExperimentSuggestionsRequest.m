@interface PREResponsesExperimentSuggestionsRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)includesDynamicSuggestions;
- (BOOL)isEqual:(id)a3;
- (NSArray)receivedMessages;
- (NSArray)recipients;
- (NSArray)senderMessages;
- (NSDate)languageLastChangedDate;
- (NSDate)requestDate;
- (NSString)context;
- (NSString)languageCode;
- (PREResponsesExperimentSuggestionsRequest)initWithCoder:(id)a3;
- (PREResponsesExperimentSuggestionsRequest)initWithReceivedMessages:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContext:(id)a3;
- (void)setIncludesDynamicSuggestions:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLanguageLastChangedDate:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setRequestDate:(id)a3;
- (void)setSenderMessages:(id)a3;
@end

@implementation PREResponsesExperimentSuggestionsRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_languageLastChangedDate, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_senderMessages, 0);

  objc_storeStrong((id *)&self->_receivedMessages, 0);
}

- (void)setRequestDate:(id)a3
{
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setIncludesDynamicSuggestions:(BOOL)a3
{
  self->_includesDynamicSuggestions = a3;
}

- (BOOL)includesDynamicSuggestions
{
  return self->_includesDynamicSuggestions;
}

- (void)setLanguageLastChangedDate:(id)a3
{
}

- (NSDate)languageLastChangedDate
{
  return self->_languageLastChangedDate;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setContext:(id)a3
{
}

- (NSString)context
{
  return self->_context;
}

- (void)setRecipients:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setSenderMessages:(id)a3
{
}

- (NSArray)senderMessages
{
  return self->_senderMessages;
}

- (NSArray)receivedMessages
{
  return self->_receivedMessages;
}

- (unint64_t)hash
{
  v3 = [(PREResponsesExperimentSuggestionsRequest *)self context];
  uint64_t v4 = [v3 hash];
  v5 = [(PREResponsesExperimentSuggestionsRequest *)self languageCode];
  uint64_t v6 = v4 + [v5 hash];
  v7 = [(PREResponsesExperimentSuggestionsRequest *)self requestDate];
  uint64_t v8 = [v7 hash];
  v9 = [(PREResponsesExperimentSuggestionsRequest *)self languageLastChangedDate];
  unint64_t v10 = v6 + v8 + [v9 hash] + 31;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PREResponsesExperimentSuggestionsRequest *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      unint64_t v8 = [(PREResponsesExperimentSuggestionsRequest *)self hash];
      if (v8 == [(PREResponsesExperimentSuggestionsRequest *)v7 hash])
      {
        receivedMessages = self->_receivedMessages;
        unint64_t v10 = [(PREResponsesExperimentSuggestionsRequest *)v7 receivedMessages];
        if ([(NSArray *)receivedMessages isEqualToArray:v10])
        {
          senderMessages = self->_senderMessages;
          v12 = [(PREResponsesExperimentSuggestionsRequest *)v7 senderMessages];
          if ([(NSArray *)senderMessages isEqualToArray:v12])
          {
            recipients = self->_recipients;
            v14 = [(PREResponsesExperimentSuggestionsRequest *)v7 recipients];
            if ([(NSArray *)recipients isEqual:v14])
            {
              context = self->_context;
              v16 = [(PREResponsesExperimentSuggestionsRequest *)v7 context];
              if ([(NSString *)context isEqualToString:v16])
              {
                languageCode = self->_languageCode;
                v18 = [(PREResponsesExperimentSuggestionsRequest *)v7 languageCode];
                if ([(NSString *)languageCode isEqualToString:v18]
                  && (BOOL includesDynamicSuggestions = self->_includesDynamicSuggestions,
                      includesDynamicSuggestions == [(PREResponsesExperimentSuggestionsRequest *)v7 includesDynamicSuggestions]))
                {
                  requestDate = self->_requestDate;
                  v21 = [(PREResponsesExperimentSuggestionsRequest *)v7 requestDate];
                  if ([(NSDate *)requestDate isEqualToDate:v21])
                  {
                    languageLastChangedDate = self->_languageLastChangedDate;
                    v23 = [(PREResponsesExperimentSuggestionsRequest *)v7 languageLastChangedDate];
                    char v6 = [(NSDate *)languageLastChangedDate isEqualToDate:v23];
                  }
                  else
                  {
                    char v6 = 0;
                  }
                }
                else
                {
                  char v6 = 0;
                }
              }
              else
              {
                char v6 = 0;
              }
            }
            else
            {
              char v6 = 0;
            }
          }
          else
          {
            char v6 = 0;
          }
        }
        else
        {
          char v6 = 0;
        }
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[PREResponsesExperimentSuggestionsRequest alloc] initWithReceivedMessages:self->_receivedMessages];
  uint64_t v5 = (void *)[(NSArray *)self->_senderMessages copy];
  [(PREResponsesExperimentSuggestionsRequest *)v4 setSenderMessages:v5];

  char v6 = (void *)[(NSArray *)self->_recipients copy];
  [(PREResponsesExperimentSuggestionsRequest *)v4 setRecipients:v6];

  v7 = (void *)[(NSString *)self->_context copy];
  [(PREResponsesExperimentSuggestionsRequest *)v4 setContext:v7];

  unint64_t v8 = (void *)[(NSString *)self->_languageCode copy];
  [(PREResponsesExperimentSuggestionsRequest *)v4 setLanguageCode:v8];

  [(PREResponsesExperimentSuggestionsRequest *)v4 setIncludesDynamicSuggestions:self->_includesDynamicSuggestions];
  v9 = (void *)[(NSDate *)self->_requestDate copy];
  [(PREResponsesExperimentSuggestionsRequest *)v4 setRequestDate:v9];

  unint64_t v10 = (void *)[(NSDate *)self->_languageLastChangedDate copy];
  [(PREResponsesExperimentSuggestionsRequest *)v4 setLanguageLastChangedDate:v10];

  return v4;
}

- (PREResponsesExperimentSuggestionsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PREResponsesExperimentSuggestionsRequest *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"receivedMessages"];
    receivedMessages = v5->_receivedMessages;
    v5->_receivedMessages = (NSArray *)v6;

    uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"senderMessages"];
    senderMessages = v5->_senderMessages;
    v5->_senderMessages = (NSArray *)v8;

    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    unint64_t v10 = (void *)getCKEntityClass_softClass;
    uint64_t v29 = getCKEntityClass_softClass;
    if (!getCKEntityClass_softClass)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __getCKEntityClass_block_invoke;
      v25[3] = &unk_1E65B1F98;
      v25[4] = &v26;
      __getCKEntityClass_block_invoke((uint64_t)v25);
      unint64_t v10 = (void *)v27[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v26, 8);
    uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:v11 forKey:@"recipients"];
    recipients = v5->_recipients;
    v5->_recipients = (NSArray *)v12;

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
    uint64_t v15 = [v14 copy];
    context = v5->_context;
    v5->_context = (NSString *)v15;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"languageCode"];
    uint64_t v18 = [v17 copy];
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v18;

    v5->_BOOL includesDynamicSuggestions = [v4 decodeBoolForKey:@"includeDynamicSuggestions"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestDate"];
    requestDate = v5->_requestDate;
    v5->_requestDate = (NSDate *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"languageLastChangedDate"];
    languageLastChangedDate = v5->_languageLastChangedDate;
    v5->_languageLastChangedDate = (NSDate *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  receivedMessages = self->_receivedMessages;
  id v5 = a3;
  [v5 encodeObject:receivedMessages forKey:@"receivedMessages"];
  [v5 encodeObject:self->_senderMessages forKey:@"senderMessages"];
  [v5 encodeObject:self->_recipients forKey:@"recipients"];
  [v5 encodeObject:self->_context forKey:@"context"];
  [v5 encodeObject:self->_languageCode forKey:@"languageCode"];
  [v5 encodeBool:self->_includesDynamicSuggestions forKey:@"includeDynamicSuggestions"];
  [v5 encodeObject:self->_requestDate forKey:@"requestDate"];
  [v5 encodeObject:self->_languageLastChangedDate forKey:@"languageLastChangedDate"];
}

- (PREResponsesExperimentSuggestionsRequest)initWithReceivedMessages:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PREResponsesExperimentSuggestionsRequest;
  id v5 = [(PREResponsesExperimentSuggestionsRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    receivedMessages = v5->_receivedMessages;
    v5->_receivedMessages = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end