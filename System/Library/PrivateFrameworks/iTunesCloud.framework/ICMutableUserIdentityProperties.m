@interface ICMutableUserIdentityProperties
- (void)replaceValuesWithValuesFromProperties:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setActiveLocker:(BOOL)a3;
- (void)setAlternateDSID:(id)a3;
- (void)setCarrierBundleDeviceIdentifier:(id)a3;
- (void)setCloudBackupEnabled:(BOOL)a3;
- (void)setCloudLibraryStateReason:(id)a3;
- (void)setDSID:(id)a3;
- (void)setDelegateToken:(id)a3;
- (void)setDelegated:(BOOL)a3;
- (void)setFirstName:(id)a3;
- (void)setHomeUserIdentifiers:(id)a3;
- (void)setICloudPersonID:(id)a3;
- (void)setLastName:(id)a3;
- (void)setManagedAppleID:(BOOL)a3;
- (void)setMergeToCloudLibraryPreference:(id)a3;
- (void)setPrivacyAcknowledgementVersions:(id)a3;
- (void)setPrivateListeningEnabled:(id)a3;
- (void)setPrivateListeningEnabledForHomeUsers:(id)a3;
- (void)setSandboxed:(BOOL)a3;
- (void)setStorefrontIdentifier:(id)a3;
- (void)setSubscriptionStatusEnabled:(BOOL)a3;
- (void)setU18MinorAccount:(BOOL)a3;
- (void)setUsername:(id)a3;
@end

@implementation ICMutableUserIdentityProperties

- (void)setActiveLocker:(BOOL)a3
{
  self->super._activeLocker = a3;
}

- (void)setActive:(BOOL)a3
{
  self->super._active = a3;
}

- (void)setUsername:(id)a3
{
  if (self->super._username != a3)
  {
    self->super._username = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setU18MinorAccount:(BOOL)a3
{
  self->super._u18MinorAccount = a3;
}

- (void)setSubscriptionStatusEnabled:(BOOL)a3
{
  self->super._subscriptionStatusEnabled = a3;
}

- (void)setStorefrontIdentifier:(id)a3
{
  if (self->super._storefrontIdentifier != a3)
  {
    self->super._storefrontIdentifier = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setSandboxed:(BOOL)a3
{
  self->super._sandboxed = a3;
}

- (void)setPrivateListeningEnabledForHomeUsers:(id)a3
{
  if (self->super._privateListeningEnabledForHomeUsers != a3)
  {
    self->super._privateListeningEnabledForHomeUsers = (NSDictionary *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setPrivateListeningEnabled:(id)a3
{
  if (self->super._privateListeningEnabled != a3)
  {
    self->super._privateListeningEnabled = (NSNumber *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setPrivacyAcknowledgementVersions:(id)a3
{
  if (self->super._privacyAcknowledgementVersions != a3)
  {
    self->super._privacyAcknowledgementVersions = (NSDictionary *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setMergeToCloudLibraryPreference:(id)a3
{
  if (self->super._mergeToCloudLibraryPreference != a3)
  {
    self->super._mergeToCloudLibraryPreference = (NSNumber *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setManagedAppleID:(BOOL)a3
{
  self->super._managedAppleID = a3;
}

- (void)setLastName:(id)a3
{
  if (self->super._lastName != a3)
  {
    self->super._lastName = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setHomeUserIdentifiers:(id)a3
{
  if (self->super._homeUserIdentifiers != a3)
  {
    self->super._homeUserIdentifiers = (NSArray *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setFirstName:(id)a3
{
  if (self->super._firstName != a3)
  {
    self->super._firstName = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setDSID:(id)a3
{
  if (self->super._dsid != a3)
  {
    self->super._dsid = (NSNumber *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setCloudLibraryStateReason:(id)a3
{
  if (self->super._cloudLibraryStateReason != a3)
  {
    self->super._cloudLibraryStateReason = (NSDictionary *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setAlternateDSID:(id)a3
{
  if (self->super._alternateDSID != a3)
  {
    self->super._alternateDSID = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setICloudPersonID:(id)a3
{
  if (self->super._iCloudPersonID != a3)
  {
    v4 = (NSString *)[a3 copy];
    iCloudPersonID = self->super._iCloudPersonID;
    self->super._iCloudPersonID = v4;
    MEMORY[0x1F41817F8](v4, iCloudPersonID);
  }
}

- (void)setCloudBackupEnabled:(BOOL)a3
{
  self->super._cloudBackupEnabled = a3;
}

- (void)setDelegateToken:(id)a3
{
  if (self->super._delegateToken != a3)
  {
    v4 = (ICDelegateToken *)[a3 copy];
    delegateToken = self->super._delegateToken;
    self->super._delegateToken = v4;
    MEMORY[0x1F41817F8](v4, delegateToken);
  }
}

- (void)setDelegated:(BOOL)a3
{
  self->super._delegated = a3;
}

- (void)setCarrierBundleDeviceIdentifier:(id)a3
{
  if (self->super._carrierBundleDeviceIdentifier != a3)
  {
    v4 = (NSString *)[a3 copy];
    carrierBundleDeviceIdentifier = self->super._carrierBundleDeviceIdentifier;
    self->super._carrierBundleDeviceIdentifier = v4;
    MEMORY[0x1F41817F8](v4, carrierBundleDeviceIdentifier);
  }
}

- (void)replaceValuesWithValuesFromProperties:(id)a3
{
}

@end