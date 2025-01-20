@interface WBSFormerlySharedSavedAccountMarker
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)nameOfGroupCredentialWasLastSharedIn;
- (NSString)passwordManagerCredentialIdentifier;
- (WBSFormerlySharedSavedAccountMarker)initWithDictionaryRepresentation:(id)a3;
- (WBSFormerlySharedSavedAccountMarker)initWithPasswordManagerCredentialIdentifier:(id)a3 nameOfGroupCredentialWasLastSharedIn:(id)a4;
- (unint64_t)hash;
@end

@implementation WBSFormerlySharedSavedAccountMarker

- (WBSFormerlySharedSavedAccountMarker)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"passwordManagerCredentialIdentifier"];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"groupName"];
    v7 = [[WBSFormerlySharedSavedAccountMarker alloc] initWithPasswordManagerCredentialIdentifier:v5 nameOfGroupCredentialWasLastSharedIn:v6];
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXKeychain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WBSFormerlySharedSavedAccountMarker initWithDictionaryRepresentation:](v8);
    }
    v7 = 0;
  }

  return v7;
}

- (WBSFormerlySharedSavedAccountMarker)initWithPasswordManagerCredentialIdentifier:(id)a3 nameOfGroupCredentialWasLastSharedIn:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSFormerlySharedSavedAccountMarker;
  v8 = [(WBSFormerlySharedSavedAccountMarker *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    passwordManagerCredentialIdentifier = v8->_passwordManagerCredentialIdentifier;
    v8->_passwordManagerCredentialIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    nameOfGroupCredentialWasLastSharedIn = v8->_nameOfGroupCredentialWasLastSharedIn;
    v8->_nameOfGroupCredentialWasLastSharedIn = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSDictionary)dictionaryRepresentation
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  passwordManagerCredentialIdentifier = self->_passwordManagerCredentialIdentifier;
  uint64_t v9 = @"passwordManagerCredentialIdentifier";
  v10[0] = passwordManagerCredentialIdentifier;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v6 = [v3 dictionaryWithDictionary:v5];

  nameOfGroupCredentialWasLastSharedIn = self->_nameOfGroupCredentialWasLastSharedIn;
  if (nameOfGroupCredentialWasLastSharedIn) {
    [v6 setObject:nameOfGroupCredentialWasLastSharedIn forKeyedSubscript:@"groupName"];
  }
  return (NSDictionary *)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSFormerlySharedSavedAccountMarker *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      nameOfGroupCredentialWasLastSharedIn = self->_nameOfGroupCredentialWasLastSharedIn;
      id v7 = [(WBSFormerlySharedSavedAccountMarker *)v5 nameOfGroupCredentialWasLastSharedIn];
      if (WBSIsEqual(nameOfGroupCredentialWasLastSharedIn, v7))
      {
        passwordManagerCredentialIdentifier = self->_passwordManagerCredentialIdentifier;
        uint64_t v9 = [(WBSFormerlySharedSavedAccountMarker *)v5 passwordManagerCredentialIdentifier];
        char v10 = [(NSString *)passwordManagerCredentialIdentifier isEqualToString:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_nameOfGroupCredentialWasLastSharedIn hash];
  return [(NSString *)self->_passwordManagerCredentialIdentifier hash] ^ v3;
}

- (NSString)passwordManagerCredentialIdentifier
{
  return self->_passwordManagerCredentialIdentifier;
}

- (NSString)nameOfGroupCredentialWasLastSharedIn
{
  return self->_nameOfGroupCredentialWasLastSharedIn;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameOfGroupCredentialWasLastSharedIn, 0);
  objc_storeStrong((id *)&self->_passwordManagerCredentialIdentifier, 0);
}

- (void)initWithDictionaryRepresentation:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B728F000, log, OS_LOG_TYPE_ERROR, "formerly shared marker initialized with invalid dictionary", v1, 2u);
}

@end