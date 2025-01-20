@interface STSendDraftMessageRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)_makeAppFrontmost;
- (STSendDraftMessageRequest)initWithCoder:(id)a3;
- (id)_initWithMessage:(id)a3;
- (id)createResponse;
- (id)message;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSendDraftMessageRequest

- (void).cxx_destruct
{
}

- (STSendDraftMessageRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSendDraftMessageRequest;
  v5 = [(AFSiriRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_message"];
    message = v5->_message;
    v5->_message = (STSiriMessage *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSendDraftMessageRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_message, @"_message", v5.receiver, v5.super_class);
}

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

- (id)message
{
  return self->_message;
}

- (id)_initWithMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSendDraftMessageRequest;
  uint64_t v6 = [(AFSiriRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

- (BOOL)_makeAppFrontmost
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end