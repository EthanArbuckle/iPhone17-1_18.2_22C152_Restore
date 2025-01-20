@interface SFErrorFeedback
+ (BOOL)supportsSecureCoding;
- (NSError)error;
- (SFErrorFeedback)initWithCoder:(id)a3;
- (SFErrorFeedback)initWithError:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setError:(id)a3;
@end

@implementation SFErrorFeedback

- (void).cxx_destruct
{
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFErrorFeedback;
  id v4 = a3;
  [(SFFeedback *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_error, @"error", v5.receiver, v5.super_class);
}

- (SFErrorFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFErrorFeedback;
  objc_super v5 = [(SFFeedback *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;
  }
  return v5;
}

- (SFErrorFeedback)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFErrorFeedback;
  uint64_t v6 = [(SFFeedback *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end