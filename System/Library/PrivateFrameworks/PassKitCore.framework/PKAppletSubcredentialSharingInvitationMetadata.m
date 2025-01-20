@interface PKAppletSubcredentialSharingInvitationMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldRequestInvitation;
- (NSString)anonymizationSalt;
- (PKAppletSubcredentialSharingInvitationMetadata)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAnonymizationSalt:(id)a3;
- (void)setShouldRequestInvitation:(BOOL)a3;
@end

@implementation PKAppletSubcredentialSharingInvitationMetadata

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  if (self->_shouldRequestInvitation) {
    v5 = "yes";
  }
  else {
    v5 = "no";
  }
  return (id)objc_msgSend(v3, "stringWithFormat:", @"< %@; %p; anonymization salt: %@; request invitation: %s >",
               v4,
               self,
               self->_anonymizationSalt,
               v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  anonymizationSalt = self->_anonymizationSalt;
  id v5 = a3;
  [v5 encodeObject:anonymizationSalt forKey:@"anonymizationSalt"];
  [v5 encodeBool:self->_shouldRequestInvitation forKey:@"shouldRequestInvitation"];
}

- (PKAppletSubcredentialSharingInvitationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAppletSubcredentialSharingInvitationMetadata *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anonymizationSalt"];
    anonymizationSalt = v5->_anonymizationSalt;
    v5->_anonymizationSalt = (NSString *)v6;

    v5->_shouldRequestInvitation = [v4 decodeBoolForKey:@"shouldRequestInvitation"];
  }

  return v5;
}

- (NSString)anonymizationSalt
{
  return self->_anonymizationSalt;
}

- (void)setAnonymizationSalt:(id)a3
{
}

- (BOOL)shouldRequestInvitation
{
  return self->_shouldRequestInvitation;
}

- (void)setShouldRequestInvitation:(BOOL)a3
{
  self->_shouldRequestInvitation = a3;
}

- (void).cxx_destruct
{
}

@end