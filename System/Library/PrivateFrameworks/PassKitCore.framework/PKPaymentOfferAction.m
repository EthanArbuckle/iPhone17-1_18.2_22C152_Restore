@interface PKPaymentOfferAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)useAuthenticationSession;
- (NSString)challenge;
- (NSString)identifier;
- (NSString)verifier;
- (NSURL)actionURL;
- (PKPaymentOfferAction)initWithCoder:(id)a3;
- (PKPaymentOfferAction)initWithDictionary:(id)a3;
- (PKPaymentOfferDynamicContent)dynamicContent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)populateChallenge:(id)a3 verifier:(id)a4;
@end

@implementation PKPaymentOfferAction

- (PKPaymentOfferAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentOfferAction;
  v5 = [(PKPaymentOfferAction *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 PKURLForKey:@"actionURL"];
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v8;

    v5->_useAuthenticationSession = [v4 PKBoolForKey:@"useAuthenticationSession"];
    v10 = [v4 PKDictionaryForKey:@"dynamicContent"];
    if ([v10 count])
    {
      v11 = [[PKPaymentOfferDynamicContent alloc] initWithDictionary:v10];
      dynamicContent = v5->_dynamicContent;
      v5->_dynamicContent = v11;
    }
  }

  return v5;
}

- (void)populateChallenge:(id)a3 verifier:(id)a4
{
  uint64_t v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  challenge = self->_challenge;
  self->_challenge = v6;
  v10 = v6;

  verifier = self->_verifier;
  self->_verifier = v7;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  id v4 = [(PKPaymentOfferAction *)self actionURL];
  v5 = [v4 absoluteString];
  [v3 setObject:v5 forKeyedSubscript:@"actionURL"];

  uint64_t v6 = [NSNumber numberWithBool:self->_useAuthenticationSession];
  [v3 setObject:v6 forKeyedSubscript:@"useAuthenticationSession"];

  v7 = [(PKPaymentOfferDynamicContent *)self->_dynamicContent dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"dynamicContent"];

  [v3 setObject:self->_challenge forKeyedSubscript:@"challenge"];
  [v3 setObject:self->_verifier forKeyedSubscript:@"verifier"];
  uint64_t v8 = (void *)[v3 copy];

  return v8;
}

- (NSURL)actionURL
{
  if (self->_verifier)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:self->_actionURL resolvingAgainstBaseURL:0];
    id v4 = [v3 queryItems];
    v5 = (void *)[v4 mutableCopy];
    uint64_t v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    v9 = v7;

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:@"verifier" value:self->_verifier];
    [v9 addObject:v10];

    [v3 setQueryItems:v9];
    uint64_t v8 = [v3 URL];
  }
  else
  {
    uint64_t v8 = self->_actionURL;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentOfferAction *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        identifier = v6->_identifier;
        uint64_t v8 = self->_identifier;
        v9 = identifier;
        if (v8 == v9)
        {
        }
        else
        {
          v10 = v9;
          LOBYTE(v11) = 0;
          if (!v8 || !v9) {
            goto LABEL_34;
          }
          BOOL v11 = [(NSString *)v8 isEqualToString:v9];

          if (!v11) {
            goto LABEL_35;
          }
        }
        actionURL = self->_actionURL;
        v13 = v6->_actionURL;
        if (actionURL && v13)
        {
          if ((-[NSURL isEqual:](actionURL, "isEqual:") & 1) == 0) {
            goto LABEL_27;
          }
        }
        else if (actionURL != v13)
        {
          goto LABEL_27;
        }
        if (self->_useAuthenticationSession == v6->_useAuthenticationSession)
        {
          dynamicContent = self->_dynamicContent;
          v15 = v6->_dynamicContent;
          if (dynamicContent && v15)
          {
            if (-[PKPaymentOfferDynamicContent isEqual:](dynamicContent, "isEqual:"))
            {
LABEL_21:
              challenge = v6->_challenge;
              uint64_t v8 = self->_challenge;
              v17 = challenge;
              if (v8 == v17)
              {

LABEL_29:
                verifier = self->_verifier;
                v19 = v6->_verifier;
                uint64_t v8 = verifier;
                v20 = v19;
                if (v8 == v20)
                {
                  LOBYTE(v11) = 1;
                  v10 = v8;
                }
                else
                {
                  v10 = v20;
                  LOBYTE(v11) = 0;
                  if (v8 && v20) {
                    LOBYTE(v11) = [(NSString *)v8 isEqualToString:v20];
                  }
                }
                goto LABEL_34;
              }
              v10 = v17;
              LOBYTE(v11) = 0;
              if (v8 && v17)
              {
                BOOL v11 = [(NSString *)v8 isEqualToString:v17];

                if (!v11) {
                  goto LABEL_35;
                }
                goto LABEL_29;
              }
LABEL_34:

              goto LABEL_35;
            }
          }
          else if (dynamicContent == v15)
          {
            goto LABEL_21;
          }
        }
LABEL_27:
        LOBYTE(v11) = 0;
LABEL_35:

        goto LABEL_36;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_36:

  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_actionURL];
  [v3 safelyAddObject:self->_dynamicContent];
  [v3 safelyAddObject:self->_challenge];
  [v3 safelyAddObject:self->_verifier];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_useAuthenticationSession - v4 + 32 * v4;

  return v5;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  uint64_t v4 = [(PKPaymentOfferAction *)self actionURL];
  [v3 appendFormat:@"actionURL: '%@'; ", v4];

  if (self->_useAuthenticationSession) {
    unint64_t v5 = @"YES";
  }
  else {
    unint64_t v5 = @"NO";
  }
  [v3 appendFormat:@"useAuthenticationSession: '%@;", v5];
  [v3 appendFormat:@"dynamicContent: '%@'; ", self->_dynamicContent];
  [v3 appendFormat:@"challenge: '%@'; ", self->_challenge];
  [v3 appendFormat:@"verifier: '%@'; ", self->_verifier];
  [v3 appendFormat:@">"];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentOfferAction;
  unint64_t v5 = [(PKPaymentOfferAction *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionURL"];
    actionURL = v5->_actionURL;
    v5->_actionURL = (NSURL *)v8;

    v5->_useAuthenticationSession = [v4 decodeBoolForKey:@"useAuthenticationSession"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dynamicContent"];
    dynamicContent = v5->_dynamicContent;
    v5->_dynamicContent = (PKPaymentOfferDynamicContent *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"challenge"];
    challenge = v5->_challenge;
    v5->_challenge = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"verifier"];
    verifier = v5->_verifier;
    v5->_verifier = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_actionURL forKey:@"actionURL"];
  [v5 encodeBool:self->_useAuthenticationSession forKey:@"useAuthenticationSession"];
  [v5 encodeObject:self->_dynamicContent forKey:@"dynamicContent"];
  [v5 encodeObject:self->_challenge forKey:@"challenge"];
  [v5 encodeObject:self->_verifier forKey:@"verifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentOfferAction allocWithZone:](PKPaymentOfferAction, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  uint64_t v8 = [(NSURL *)self->_actionURL copyWithZone:a3];
  actionURL = v5->_actionURL;
  v5->_actionURL = (NSURL *)v8;

  v5->_useAuthenticationSession = self->_useAuthenticationSession;
  uint64_t v10 = [(PKPaymentOfferDynamicContent *)self->_dynamicContent copyWithZone:a3];
  dynamicContent = v5->_dynamicContent;
  v5->_dynamicContent = v10;

  uint64_t v12 = [(NSString *)self->_challenge copyWithZone:a3];
  challenge = v5->_challenge;
  v5->_challenge = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_verifier copyWithZone:a3];
  verifier = v5->_verifier;
  v5->_verifier = (NSString *)v14;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)useAuthenticationSession
{
  return self->_useAuthenticationSession;
}

- (PKPaymentOfferDynamicContent)dynamicContent
{
  return self->_dynamicContent;
}

- (NSString)challenge
{
  return self->_challenge;
}

- (NSString)verifier
{
  return self->_verifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_dynamicContent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
}

@end