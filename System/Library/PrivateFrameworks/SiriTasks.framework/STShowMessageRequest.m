@interface STShowMessageRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)_makeAppFrontmost;
- (BOOL)showAsDraft;
- (STShowMessageRequest)initWithCoder:(id)a3;
- (id)_initWithMessage:(id)a3 showAsDraft:(BOOL)a4;
- (id)createResponse;
- (id)message;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STShowMessageRequest

- (void).cxx_destruct
{
}

- (STShowMessageRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STShowMessageRequest;
  v5 = [(AFSiriRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_message"];
    message = v5->_message;
    v5->_message = (STSiriMessage *)v6;

    v5->_showAsDraft = [v4 decodeBoolForKey:@"_showAsDraft"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STShowMessageRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_message, @"_message", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_showAsDraft forKey:@"_showAsDraft"];
}

- (id)createResponse
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F28620]) _initWithRequest:self];
  return v2;
}

- (BOOL)showAsDraft
{
  return self->_showAsDraft;
}

- (id)message
{
  return self->_message;
}

- (id)_initWithMessage:(id)a3 showAsDraft:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STShowMessageRequest;
  v8 = [(AFSiriRequest *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_message, a3);
    v9->_showAsDraft = a4;
  }

  return v9;
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