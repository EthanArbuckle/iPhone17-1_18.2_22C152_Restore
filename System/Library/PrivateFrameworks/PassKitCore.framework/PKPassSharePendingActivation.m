@interface PKPassSharePendingActivation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPassSharePendingActivation:(id)a3;
- (BOOL)isWaitingOnUserAction;
- (NSString)shareIdentifier;
- (PKPassSharePendingActivation)initWithCoder:(id)a3;
- (PKSharingMessage)originalInvitation;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setIsWaitingOnUserAction:(BOOL)a3;
- (void)setOriginalInvitation:(id)a3;
- (void)setShareIdentifier:(id)a3;
@end

@implementation PKPassSharePendingActivation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassSharePendingActivation)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPassSharePendingActivation;
  v5 = [(PKPassSharePendingActivation *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalInvitation"];
    originalInvitation = v5->_originalInvitation;
    v5->_originalInvitation = (PKSharingMessage *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shareIdentifier"];
    shareIdentifier = v5->_shareIdentifier;
    v5->_shareIdentifier = (NSString *)v8;

    v5->_isWaitingOnUserAction = [v4 decodeBoolForKey:@"isWaitingOnUserAction"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  originalInvitation = self->_originalInvitation;
  id v5 = a3;
  [v5 encodeObject:originalInvitation forKey:@"originalInvitation"];
  [v5 encodeObject:self->_shareIdentifier forKey:@"shareIdentifier"];
  [v5 encodeBool:self->_isWaitingOnUserAction forKey:@"isWaitingOnUserAction"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  [v6 appendFormat:@"originalInvitation: '%@'; ", self->_originalInvitation];
  [v6 appendFormat:@"shareIdentifier: '%@'; ", self->_shareIdentifier];
  if (self->_isWaitingOnUserAction) {
    v7 = @"Yes";
  }
  else {
    v7 = @"No";
  }
  [v6 appendFormat:@"isWaitingOnUserAction: '%@'; ", v7];
  [v6 appendFormat:@">"];
  uint64_t v8 = [NSString stringWithString:v6];

  return v8;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_originalInvitation) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_shareIdentifier) {
    objc_msgSend(v4, "addObject:");
  }
  uint64_t v5 = PKCombinedHash(17, v4);
  unint64_t v6 = self->_isWaitingOnUserAction - v5 + 32 * v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPassSharePendingActivation *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassSharePendingActivation *)self isEqualToPassSharePendingActivation:v5];

  return v6;
}

- (BOOL)isEqualToPassSharePendingActivation:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_15;
  }
  originalInvitation = self->_originalInvitation;
  BOOL v6 = (PKSharingMessage *)v4[2];
  if (originalInvitation) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (originalInvitation != v6) {
      goto LABEL_15;
    }
  }
  else if ((-[PKSharingMessage isEqual:](originalInvitation, "isEqual:") & 1) == 0)
  {
    goto LABEL_15;
  }
  shareIdentifier = self->_shareIdentifier;
  v9 = (NSString *)v4[3];
  if (!shareIdentifier || !v9)
  {
    if (shareIdentifier == v9) {
      goto LABEL_13;
    }
LABEL_15:
    BOOL v10 = 0;
    goto LABEL_16;
  }
  if ((-[NSString isEqual:](shareIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  BOOL v10 = self->_isWaitingOnUserAction == *((unsigned __int8 *)v4 + 8);
LABEL_16:

  return v10;
}

- (PKSharingMessage)originalInvitation
{
  return self->_originalInvitation;
}

- (void)setOriginalInvitation:(id)a3
{
}

- (NSString)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void)setShareIdentifier:(id)a3
{
}

- (BOOL)isWaitingOnUserAction
{
  return self->_isWaitingOnUserAction;
}

- (void)setIsWaitingOnUserAction:(BOOL)a3
{
  self->_isWaitingOnUserAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareIdentifier, 0);
  objc_storeStrong((id *)&self->_originalInvitation, 0);
}

@end