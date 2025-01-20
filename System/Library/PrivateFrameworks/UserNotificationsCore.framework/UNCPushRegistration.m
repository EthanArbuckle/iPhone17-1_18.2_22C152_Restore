@interface UNCPushRegistration
+ (id)pushRegistrationWithEnvironment:(id)a3 tokenIdentifier:(id)a4 token:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSData)token;
- (NSString)environment;
- (NSString)tokenIdentifier;
- (UNCPushRegistration)initWithDictionaryRepresentation:(id)a3;
- (UNCPushRegistration)initWithEnvironment:(id)a3 tokenIdentifier:(id)a4 token:(id)a5;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation UNCPushRegistration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenIdentifier, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong((id *)&self->_environment, 0);
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(UNCPushRegistration *)self environment];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, @"Environment");

  v5 = [(UNCPushRegistration *)self token];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, @"Token");

  v6 = [(UNCPushRegistration *)self tokenIdentifier];
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, @"TokenIdentifier");

  return v3;
}

- (NSString)environment
{
  return self->_environment;
}

- (NSData)token
{
  return self->_token;
}

- (NSString)tokenIdentifier
{
  return self->_tokenIdentifier;
}

+ (id)pushRegistrationWithEnvironment:(id)a3 tokenIdentifier:(id)a4 token:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithEnvironment:v10 tokenIdentifier:v9 token:v8];

  return v11;
}

- (UNCPushRegistration)initWithEnvironment:(id)a3 tokenIdentifier:(id)a4 token:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UNCPushRegistration;
  v11 = [(UNCPushRegistration *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    environment = v11->_environment;
    v11->_environment = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    tokenIdentifier = v11->_tokenIdentifier;
    v11->_tokenIdentifier = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    token = v11->_token;
    v11->_token = (NSData *)v16;
  }
  return v11;
}

- (UNCPushRegistration)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKey:@"Environment"];
  v6 = [v4 objectForKey:@"TokenIdentifier"];
  v7 = [v4 objectForKey:@"Token"];

  id v8 = [(UNCPushRegistration *)self initWithEnvironment:v5 tokenIdentifier:v6 token:v7];
  return v8;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(UNCPushRegistration *)self environment];
  id v5 = (id)[v3 appendObject:v4 withName:@"Environment"];

  v6 = [(UNCPushRegistration *)self tokenIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"TokenIdentifier"];

  id v8 = [(UNCPushRegistration *)self token];
  id v9 = [v8 debugDescription];
  id v10 = (id)[v3 appendObject:v9 withName:@"Token"];

  v11 = [v3 build];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_6;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_6;
  }
  v6 = [(UNCPushRegistration *)self environment];
  id v7 = [v4 environment];
  int v8 = UNEqualObjects();

  if (!v8) {
    goto LABEL_6;
  }
  id v9 = [(UNCPushRegistration *)self token];
  id v10 = [v4 environment];
  int v11 = UNEqualObjects();

  if (v11)
  {
    uint64_t v12 = [(UNCPushRegistration *)self tokenIdentifier];
    v13 = [v4 environment];
    char v14 = UNEqualObjects();
  }
  else
  {
LABEL_6:
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = [(UNCPushRegistration *)self environment];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(UNCPushRegistration *)self token];
  id v7 = (id)[v3 appendObject:v6];

  int v8 = [(UNCPushRegistration *)self tokenIdentifier];
  id v9 = (id)[v3 appendObject:v8];

  unint64_t v10 = [v3 hash];
  return v10;
}

@end