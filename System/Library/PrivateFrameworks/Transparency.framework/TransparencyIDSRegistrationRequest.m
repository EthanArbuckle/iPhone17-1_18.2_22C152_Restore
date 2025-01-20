@interface TransparencyIDSRegistrationRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)dontWaitForKeySigning;
- (NSDictionary)requests;
- (TransparencyIDSRegistrationRequest)initWithCoder:(id)a3;
- (TransparencyIDSRegistrationRequest)initWithSignatureRequests:(id)a3;
- (double)initialTimeout;
- (void)encodeWithCoder:(id)a3;
- (void)setDontWaitForKeySigning:(BOOL)a3;
- (void)setInitialTimeout:(double)a3;
- (void)setRequests:(id)a3;
@end

@implementation TransparencyIDSRegistrationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(TransparencyIDSRegistrationRequest *)self initialTimeout];
  objc_msgSend(v4, "encodeDouble:forKey:", @"initialTimeout");
  objc_msgSend(v4, "encodeBool:forKey:", -[TransparencyIDSRegistrationRequest dontWaitForKeySigning](self, "dontWaitForKeySigning"), @"dontWaitForKeySigning");
  id v5 = [(TransparencyIDSRegistrationRequest *)self requests];
  [v4 encodeObject:v5 forKey:@"requests"];
}

- (TransparencyIDSRegistrationRequest)initWithCoder:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 decodeDoubleForKey:@"initialTimeout"];
  double v6 = v5;
  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:3];
  v9 = objc_msgSend(v7, "setWithArray:", v8, v14, v15);

  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"requests"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v11 = [(TransparencyIDSRegistrationRequest *)self initWithSignatureRequests:v10],
        (self = v11) != 0))
  {
    [(TransparencyIDSRegistrationRequest *)v11 setInitialTimeout:v6];
    -[TransparencyIDSRegistrationRequest setDontWaitForKeySigning:](self, "setDontWaitForKeySigning:", [v4 decodeBoolForKey:@"dontWaitForKeySigning"]);
    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (TransparencyIDSRegistrationRequest)initWithSignatureRequests:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransparencyIDSRegistrationRequest;
  double v5 = [(TransparencyIDSRegistrationRequest *)&v9 init];
  double v6 = v5;
  if (v5)
  {
    [(TransparencyIDSRegistrationRequest *)v5 setRequests:v4];
    [(TransparencyIDSRegistrationRequest *)v6 setInitialTimeout:30.0];
    v7 = v6;
  }

  return v6;
}

- (double)initialTimeout
{
  return self->_initialTimeout;
}

- (void)setInitialTimeout:(double)a3
{
  self->_initialTimeout = a3;
}

- (BOOL)dontWaitForKeySigning
{
  return self->_dontWaitForKeySigning;
}

- (void)setDontWaitForKeySigning:(BOOL)a3
{
  self->_dontWaitForKeySigning = a3;
}

- (NSDictionary)requests
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRequests:(id)a3
{
}

- (void).cxx_destruct
{
}

@end