@interface WBSAutoFillPasskey
+ (BOOL)supportsSecureCoding;
- (BOOL)requestUsedNonEmptyAllowList;
- (BOOL)shouldRequireUserVerification;
- (NSString)customTitle;
- (NSString)relyingPartyIdentifier;
- (NSString)username;
- (NSUUID)operationUUID;
- (WBSAutoFillPasskey)initWithCoder:(id)a3;
- (WBSAutoFillPasskey)initWithUsername:(id)a3 customTitle:(id)a4 relyingPartyIdentifier:(id)a5 identifier:(id)a6 operationUUID:(id)a7 shouldRequireUserVerification:(BOOL)a8 requestUsedNonEmptyAllowList:(BOOL)a9;
- (WBSPublicKeyCredentialIdentifier)identifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSAutoFillPasskey

- (WBSAutoFillPasskey)initWithUsername:(id)a3 customTitle:(id)a4 relyingPartyIdentifier:(id)a5 identifier:(id)a6 operationUUID:(id)a7 shouldRequireUserVerification:(BOOL)a8 requestUsedNonEmptyAllowList:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v31.receiver = self;
  v31.super_class = (Class)WBSAutoFillPasskey;
  v20 = [(WBSAutoFillPasskey *)&v31 init];
  if (v20)
  {
    uint64_t v21 = [v15 copy];
    username = v20->_username;
    v20->_username = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    customTitle = v20->_customTitle;
    v20->_customTitle = (NSString *)v23;

    uint64_t v25 = [v17 copy];
    relyingPartyIdentifier = v20->_relyingPartyIdentifier;
    v20->_relyingPartyIdentifier = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    identifier = v20->_identifier;
    v20->_identifier = (WBSPublicKeyCredentialIdentifier *)v27;

    objc_storeStrong((id *)&v20->_operationUUID, a7);
    v20->_shouldRequireUserVerification = a8;
    v20->_requestUsedNonEmptyAllowList = a9;
    v29 = v20;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSAutoFillPasskey)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"username"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customTitle"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relyingPartyIdentifier"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationUUD"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v10 = [v4 decodeBoolForKey:@"shouldRequireUserVerification"];
  char v11 = [v4 decodeBoolForKey:@"requestUsedNonEmptyAllowList"];

  LOBYTE(v14) = v11;
  v12 = [(WBSAutoFillPasskey *)self initWithUsername:v5 customTitle:v6 relyingPartyIdentifier:v7 identifier:v9 operationUUID:v8 shouldRequireUserVerification:v10 requestUsedNonEmptyAllowList:v14];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  username = self->_username;
  id v5 = a3;
  [v5 encodeObject:username forKey:@"username"];
  [v5 encodeObject:self->_customTitle forKey:@"customTitle"];
  [v5 encodeObject:self->_relyingPartyIdentifier forKey:@"relyingPartyIdentifier"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_operationUUID forKey:@"operationUUD"];
  [v5 encodeBool:self->_shouldRequireUserVerification forKey:@"shouldRequireUserVerification"];
  [v5 encodeBool:self->_requestUsedNonEmptyAllowList forKey:@"requestUsedNonEmptyAllowList"];
}

- (NSString)username
{
  return self->_username;
}

- (NSString)customTitle
{
  return self->_customTitle;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (WBSPublicKeyCredentialIdentifier)identifier
{
  return self->_identifier;
}

- (NSUUID)operationUUID
{
  return self->_operationUUID;
}

- (BOOL)shouldRequireUserVerification
{
  return self->_shouldRequireUserVerification;
}

- (BOOL)requestUsedNonEmptyAllowList
{
  return self->_requestUsedNonEmptyAllowList;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
  objc_storeStrong((id *)&self->_username, 0);
}

@end