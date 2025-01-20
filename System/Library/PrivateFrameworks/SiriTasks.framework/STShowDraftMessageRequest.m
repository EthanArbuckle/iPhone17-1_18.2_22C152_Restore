@interface STShowDraftMessageRequest
+ (BOOL)supportsSecureCoding;
- (STShowDraftMessageRequest)initWithCoder:(id)a3;
- (id)_initWithDraftMessageIdentifier:(id)a3;
- (id)createResponse;
- (id)createUsageResult;
- (id)description;
- (id)draftMessageIdentifier;
- (id)message;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STShowDraftMessageRequest

- (void).cxx_destruct
{
}

- (STShowDraftMessageRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STShowDraftMessageRequest;
  v5 = [(AFSiriRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_draftMessageIdentifier"];
    draftMessageIdentifier = v5->_draftMessageIdentifier;
    v5->_draftMessageIdentifier = (NSURL *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowDraftMessageRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_draftMessageIdentifier, @"_draftMessageIdentifier", v5.receiver, v5.super_class);
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<%@ %p: draftMessageIdentifier=%@>", objc_opt_class(), self, self->_draftMessageIdentifier];
  return v2;
}

- (id)createUsageResult
{
  v3 = [STShowDraftMessageUsageResult alloc];
  id v4 = [(AFSiriRequest *)self _originatingAceID];
  id v5 = [(AFSiriTaskUsageResult *)v3 _initWithOriginatingAceID:v4];

  return v5;
}

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

- (id)message
{
  return 0;
}

- (id)draftMessageIdentifier
{
  return self->_draftMessageIdentifier;
}

- (id)_initWithDraftMessageIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STShowDraftMessageRequest;
  id v5 = [(AFSiriRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    draftMessageIdentifier = v5->_draftMessageIdentifier;
    v5->_draftMessageIdentifier = (NSURL *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end