@interface DMDManagedSettingsEffectivePolicy
- (NSSet)excludedIdentifiers;
- (NSString)declarationIdentifier;
- (NSString)identifier;
- (NSString)organizationIdentifier;
- (NSString)type;
- (int64_t)policy;
- (int64_t)priority;
- (void)setDeclarationIdentifier:(id)a3;
- (void)setExcludedIdentifiers:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setPolicy:(int64_t)a3;
- (void)setPriority:(int64_t)a3;
- (void)setType:(id)a3;
@end

@implementation DMDManagedSettingsEffectivePolicy

- (NSSet)excludedIdentifiers
{
  return self->excludedIdentifiers;
}

- (void)setExcludedIdentifiers:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSString)declarationIdentifier
{
  return self->_declarationIdentifier;
}

- (void)setDeclarationIdentifier:(id)a3
{
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarationIdentifier, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->excludedIdentifiers, 0);
}

@end