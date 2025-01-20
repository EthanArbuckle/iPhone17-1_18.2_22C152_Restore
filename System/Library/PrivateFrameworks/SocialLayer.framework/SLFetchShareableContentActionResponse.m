@interface SLFetchShareableContentActionResponse
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)responseWithResult:(id)a3;
- (SLFetchShareableContentActionResponse)initWithBSXPCCoder:(id)a3;
- (SLFetchShareableContentActionResponse)initWithCoder:(id)a3;
- (SLShareableContentLoadResult)result;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation SLFetchShareableContentActionResponse

+ (id)responseWithResult:(id)a3
{
  id v4 = a3;
  v5 = [a1 response];
  [v5 setResult:v4];

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLFetchShareableContentActionResponse)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLFetchShareableContentActionResponse;
  v5 = [(SLShareableContentActionResponse *)&v11 initWithBSXPCCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector(sel_result);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    v9 = v5->_result;
    v5->_result = (SLShareableContentLoadResult *)v8;
  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SLFetchShareableContentActionResponse *)self result];
  uint64_t v6 = NSStringFromSelector(sel_result);
  [v4 encodeObject:v5 forKey:v6];

  v7.receiver = self;
  v7.super_class = (Class)SLFetchShareableContentActionResponse;
  [(SLShareableContentActionResponse *)&v7 encodeWithBSXPCCoder:v4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLFetchShareableContentActionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLFetchShareableContentActionResponse;
  v5 = [(SLShareableContentActionResponse *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    objc_super v7 = NSStringFromSelector(sel_result);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    v9 = v5->_result;
    v5->_result = (SLShareableContentLoadResult *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SLFetchShareableContentActionResponse *)self result];
  uint64_t v6 = NSStringFromSelector(sel_result);
  [v4 encodeObject:v5 forKey:v6];

  v7.receiver = self;
  v7.super_class = (Class)SLFetchShareableContentActionResponse;
  [(SLShareableContentActionResponse *)&v7 encodeWithCoder:v4];
}

- (SLShareableContentLoadResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
}

@end