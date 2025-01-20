@interface WBSProtectionSpaceMatch
- (NSDictionary)credentials;
- (NSURLCredential)defaultCredential;
- (NSURLProtectionSpace)protectionSpace;
- (WBSProtectionSpaceMatch)initWithProtectionSpace:(id)a3 credentials:(id)a4 defaultCredential:(id)a5 matchLevel:(int64_t)a6;
- (id)debugDescription;
- (int64_t)matchLevel;
@end

@implementation WBSProtectionSpaceMatch

- (WBSProtectionSpaceMatch)initWithProtectionSpace:(id)a3 credentials:(id)a4 defaultCredential:(id)a5 matchLevel:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSProtectionSpaceMatch;
  v14 = [(WBSProtectionSpaceMatch *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_protectionSpace, a3);
    uint64_t v16 = [v12 copy];
    credentials = v15->_credentials;
    v15->_credentials = (NSDictionary *)v16;

    objc_storeStrong((id *)&v15->_defaultCredential, a5);
    v15->_matchLevel = a6;
    v18 = v15;
  }

  return v15;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; protection space = %@; _matchLevel = %ld >",
    v5,
    self,
    self->_protectionSpace,
  v6 = self->_matchLevel);

  return v6;
}

- (NSURLProtectionSpace)protectionSpace
{
  return self->_protectionSpace;
}

- (NSDictionary)credentials
{
  return self->_credentials;
}

- (NSURLCredential)defaultCredential
{
  return self->_defaultCredential;
}

- (int64_t)matchLevel
{
  return self->_matchLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultCredential, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_protectionSpace, 0);
}

@end