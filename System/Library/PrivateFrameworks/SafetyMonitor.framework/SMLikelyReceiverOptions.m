@interface SMLikelyReceiverOptions
+ (BOOL)supportsSecureCoding;
+ (id)defaultOptions;
- (BOOL)hasNoFilters;
- (BOOL)isEqual:(id)a3;
- (BOOL)requireContact;
- (BOOL)requireEligibility;
- (BOOL)requireNonBlockedContact;
- (BOOL)requireOnlyFavoritedHandles;
- (BOOL)requireOnlyPastSessionRecipients;
- (SMLikelyReceiverOptions)initWithCoder:(id)a3;
- (SMLikelyReceiverOptions)initWithRequireEligibility:(BOOL)a3 requireContact:(BOOL)a4 requireNonBlockedContact:(BOOL)a5 requireOnlyFavoritedHandles:(BOOL)a6 requireOnlyPastSessionRecipients:(BOOL)a7;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SMLikelyReceiverOptions

- (SMLikelyReceiverOptions)initWithRequireEligibility:(BOOL)a3 requireContact:(BOOL)a4 requireNonBlockedContact:(BOOL)a5 requireOnlyFavoritedHandles:(BOOL)a6 requireOnlyPastSessionRecipients:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)SMLikelyReceiverOptions;
  result = [(SMLikelyReceiverOptions *)&v13 init];
  if (result)
  {
    result->_requireEligibility = a3;
    result->_requireContact = a4;
    result->_requireNonBlockedContact = a5;
    result->_requireOnlyFavoritedHandles = a6;
    result->_requireOnlyPastSessionRecipients = a7;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SMLikelyReceiverOptions *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(SMLikelyReceiverOptions *)self requireEligibility];
      int v7 = v6 ^ [(SMLikelyReceiverOptions *)v5 requireEligibility];
      BOOL v8 = [(SMLikelyReceiverOptions *)self requireContact];
      int v9 = v7 | v8 ^ [(SMLikelyReceiverOptions *)v5 requireContact];
      BOOL v10 = [(SMLikelyReceiverOptions *)self requireNonBlockedContact];
      int v11 = v10 ^ [(SMLikelyReceiverOptions *)v5 requireNonBlockedContact];
      BOOL v12 = [(SMLikelyReceiverOptions *)self requireOnlyFavoritedHandles];
      int v13 = v9 | v11 | v12 ^ [(SMLikelyReceiverOptions *)v5 requireOnlyFavoritedHandles];
      BOOL v14 = [(SMLikelyReceiverOptions *)self requireOnlyPastSessionRecipients];
      LOBYTE(v12) = [(SMLikelyReceiverOptions *)v5 requireOnlyPastSessionRecipients];

      char v15 = (v13 | v14 ^ v12) ^ 1;
    }
    else
    {
      char v15 = 0;
    }
  }

  return v15 & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SMLikelyReceiverOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"requireEligibility"];
  uint64_t v6 = [v4 decodeBoolForKey:@"requireContact"];
  uint64_t v7 = [v4 decodeBoolForKey:@"requireNonBlockedContact"];
  uint64_t v8 = [v4 decodeBoolForKey:@"requireOnlyFavoritedHandles"];
  uint64_t v9 = [v4 decodeBoolForKey:@"requireOnlyPastSessionRecipients"];

  return [(SMLikelyReceiverOptions *)self initWithRequireEligibility:v5 requireContact:v6 requireNonBlockedContact:v7 requireOnlyFavoritedHandles:v8 requireOnlyPastSessionRecipients:v9];
}

- (void)encodeWithCoder:(id)a3
{
  BOOL requireEligibility = self->_requireEligibility;
  id v5 = a3;
  [v5 encodeBool:requireEligibility forKey:@"requireEligibility"];
  [v5 encodeBool:self->_requireContact forKey:@"requireContact"];
  [v5 encodeBool:self->_requireNonBlockedContact forKey:@"requireNonBlockedContact"];
  [v5 encodeBool:self->_requireOnlyFavoritedHandles forKey:@"requireOnlyFavoritedHandles"];
  [v5 encodeBool:self->_requireOnlyPastSessionRecipients forKey:@"requireOnlyPastSessionRecipients"];
}

- (BOOL)hasNoFilters
{
  if ([(SMLikelyReceiverOptions *)self requireEligibility]
    || [(SMLikelyReceiverOptions *)self requireContact]
    || [(SMLikelyReceiverOptions *)self requireNonBlockedContact]
    || [(SMLikelyReceiverOptions *)self requireOnlyFavoritedHandles])
  {
    return 0;
  }
  else
  {
    return ![(SMLikelyReceiverOptions *)self requireOnlyPastSessionRecipients];
  }
}

+ (id)defaultOptions
{
  v2 = [[SMLikelyReceiverOptions alloc] initWithRequireEligibility:0 requireContact:0 requireNonBlockedContact:0 requireOnlyFavoritedHandles:0 requireOnlyPastSessionRecipients:0];
  return v2;
}

- (BOOL)requireEligibility
{
  return self->_requireEligibility;
}

- (BOOL)requireContact
{
  return self->_requireContact;
}

- (BOOL)requireNonBlockedContact
{
  return self->_requireNonBlockedContact;
}

- (BOOL)requireOnlyFavoritedHandles
{
  return self->_requireOnlyFavoritedHandles;
}

- (BOOL)requireOnlyPastSessionRecipients
{
  return self->_requireOnlyPastSessionRecipients;
}

@end