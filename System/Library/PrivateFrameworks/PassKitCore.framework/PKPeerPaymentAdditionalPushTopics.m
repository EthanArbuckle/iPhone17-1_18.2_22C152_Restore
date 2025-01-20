@interface PKPeerPaymentAdditionalPushTopics
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)associatedAccounts;
- (NSString)endpoint;
- (NSString)preferences;
- (NSString)requests;
- (PKPeerPaymentAdditionalPushTopics)initWithCoder:(id)a3;
- (PKPeerPaymentAdditionalPushTopics)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedAccounts:(id)a3;
- (void)setEndpoint:(id)a3;
- (void)setPreferences:(id)a3;
- (void)setRequests:(id)a3;
@end

@implementation PKPeerPaymentAdditionalPushTopics

- (PKPeerPaymentAdditionalPushTopics)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentAdditionalPushTopics;
  v5 = [(PKPeerPaymentAdditionalPushTopics *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"preferences"];
    preferences = v5->_preferences;
    v5->_preferences = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"associatedAccounts"];
    associatedAccounts = v5->_associatedAccounts;
    v5->_associatedAccounts = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"requests"];
    requests = v5->_requests;
    v5->_requests = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"endpoint"];
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSString *)v12;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  preferences = self->_preferences;
  uint64_t v6 = (NSString *)v4[1];
  if (preferences && v6)
  {
    if ((-[NSString isEqual:](preferences, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (preferences != v6)
  {
    goto LABEL_19;
  }
  associatedAccounts = self->_associatedAccounts;
  uint64_t v8 = (NSString *)v4[2];
  if (associatedAccounts && v8)
  {
    if ((-[NSString isEqual:](associatedAccounts, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (associatedAccounts != v8)
  {
    goto LABEL_19;
  }
  requests = self->_requests;
  uint64_t v10 = (NSString *)v4[3];
  if (!requests || !v10)
  {
    if (requests == v10) {
      goto LABEL_15;
    }
LABEL_19:
    char v13 = 0;
    goto LABEL_20;
  }
  if ((-[NSString isEqual:](requests, "isEqual:") & 1) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  endpoint = self->_endpoint;
  uint64_t v12 = (NSString *)v4[4];
  if (endpoint && v12) {
    char v13 = -[NSString isEqual:](endpoint, "isEqual:");
  }
  else {
    char v13 = endpoint == v12;
  }
LABEL_20:

  return v13;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_preferences];
  [v3 safelyAddObject:self->_associatedAccounts];
  [v3 safelyAddObject:self->_requests];
  [v3 safelyAddObject:self->_endpoint];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"preferences: '%@'; ", self->_preferences];
  [v3 appendFormat:@"associatedAccounts: '%@'; ", self->_associatedAccounts];
  [v3 appendFormat:@"requests: '%@'; ", self->_requests];
  [v3 appendFormat:@"endpoint: '%@'; ", self->_endpoint];
  [v3 appendFormat:@">"];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[PKPeerPaymentAdditionalPushTopics allocWithZone:](PKPeerPaymentAdditionalPushTopics, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_preferences copyWithZone:a3];
  preferences = v5->_preferences;
  v5->_preferences = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_associatedAccounts copyWithZone:a3];
  associatedAccounts = v5->_associatedAccounts;
  v5->_associatedAccounts = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_requests copyWithZone:a3];
  requests = v5->_requests;
  v5->_requests = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_endpoint copyWithZone:a3];
  endpoint = v5->_endpoint;
  v5->_endpoint = (NSString *)v12;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentAdditionalPushTopics)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPeerPaymentAdditionalPushTopics;
  v5 = [(PKPeerPaymentAdditionalPushTopics *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferences"];
    preferences = v5->_preferences;
    v5->_preferences = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedAccounts"];
    associatedAccounts = v5->_associatedAccounts;
    v5->_associatedAccounts = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requests"];
    requests = v5->_requests;
    v5->_requests = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  preferences = self->_preferences;
  id v5 = a3;
  [v5 encodeObject:preferences forKey:@"preferences"];
  [v5 encodeObject:self->_associatedAccounts forKey:@"associatedAccounts"];
  [v5 encodeObject:self->_requests forKey:@"requests"];
  [v5 encodeObject:self->_endpoint forKey:@"endpoint"];
}

- (NSString)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (NSString)associatedAccounts
{
  return self->_associatedAccounts;
}

- (void)setAssociatedAccounts:(id)a3
{
}

- (NSString)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (NSString)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_associatedAccounts, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end