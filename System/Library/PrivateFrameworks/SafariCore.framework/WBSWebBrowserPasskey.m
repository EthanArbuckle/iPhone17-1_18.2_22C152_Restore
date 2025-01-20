@interface WBSWebBrowserPasskey
+ (BOOL)supportsSecureCoding;
- (NSData)credentialID;
- (NSData)userHandle;
- (NSString)customTitle;
- (NSString)name;
- (NSString)providerName;
- (NSString)relyingParty;
- (WBSWebBrowserPasskey)initWithCoder:(id)a3;
- (WBSWebBrowserPasskey)initWithName:(id)a3 relyingParty:(id)a4 credentialID:(id)a5 userHandle:(id)a6 customTitle:(id)a7 providerName:(id)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSWebBrowserPasskey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSWebBrowserPasskey)initWithName:(id)a3 relyingParty:(id)a4 credentialID:(id)a5 userHandle:(id)a6 customTitle:(id)a7 providerName:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v35.receiver = self;
  v35.super_class = (Class)WBSWebBrowserPasskey;
  v20 = [(WBSWebBrowserPasskey *)&v35 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    name = v20->_name;
    v20->_name = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    relyingParty = v20->_relyingParty;
    v20->_relyingParty = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    credentialID = v20->_credentialID;
    v20->_credentialID = (NSData *)v25;

    uint64_t v27 = [v17 copy];
    userHandle = v20->_userHandle;
    v20->_userHandle = (NSData *)v27;

    uint64_t v29 = [v18 copy];
    customTitle = v20->_customTitle;
    v20->_customTitle = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    providerName = v20->_providerName;
    v20->_providerName = (NSString *)v31;

    v33 = v20;
  }

  return v20;
}

- (WBSWebBrowserPasskey)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WBSWebBrowserPasskey;
  v5 = [(WBSWebBrowserPasskey *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relyingParty"];
    relyingParty = v5->_relyingParty;
    v5->_relyingParty = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialID"];
    credentialID = v5->_credentialID;
    v5->_credentialID = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userHandle"];
    userHandle = v5->_userHandle;
    v5->_userHandle = (NSData *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customTitle"];
    customTitle = v5->_customTitle;
    v5->_customTitle = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerName"];
    providerName = v5->_providerName;
    v5->_providerName = (NSString *)v16;

    id v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_relyingParty forKey:@"relyingParty"];
  [v5 encodeObject:self->_credentialID forKey:@"credentialID"];
  [v5 encodeObject:self->_userHandle forKey:@"userHandle"];
  [v5 encodeObject:self->_customTitle forKey:@"customTitle"];
  [v5 encodeObject:self->_providerName forKey:@"providerName"];
}

- (NSString)name
{
  return self->_name;
}

- (NSString)relyingParty
{
  return self->_relyingParty;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSData)userHandle
{
  return self->_userHandle;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)providerName
{
  return self->_providerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
  objc_storeStrong((id *)&self->_relyingParty, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end