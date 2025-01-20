@interface NCMutableNotificationSectionSettings
- (void)setDisplayName:(id)a3;
- (void)setHasProvisionalAuthorization:(BOOL)a3;
- (void)setIsAppClip:(BOOL)a3;
- (void)setIsDeliveredQuietly:(BOOL)a3;
- (void)setMuteAssertion:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSettingsIcon:(id)a3;
- (void)setShowsCustomSettingsLink:(BOOL)a3;
- (void)setSubSectionIdentifier:(id)a3;
- (void)setSubSectionSettings:(id)a3;
- (void)setUserConfigurable:(BOOL)a3;
@end

@implementation NCMutableNotificationSectionSettings

- (void)setUserConfigurable:(BOOL)a3
{
  self->super._userConfigurable = a3;
}

- (void)setShowsCustomSettingsLink:(BOOL)a3
{
  self->super._showsCustomSettingsLink = a3;
}

- (void)setIsDeliveredQuietly:(BOOL)a3
{
  self->super._isDeliveredQuietly = a3;
}

- (void)setIsAppClip:(BOOL)a3
{
  self->super._isAppClip = a3;
}

- (void)setHasProvisionalAuthorization:(BOOL)a3
{
  self->super._hasProvisialAuthorization = a3;
}

- (void)setSettings:(id)a3
{
  self->super._settings = (NSDictionary *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setSubSectionIdentifier:(id)a3
{
  self->super._subSectionIdentifier = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setDisplayName:(id)a3
{
  self->super._displayName = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setSubSectionSettings:(id)a3
{
  self->super._subSectionSettings = (NSSet *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setSectionIdentifier:(id)a3
{
  self->super._sectionIdentifier = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setSettingsIcon:(id)a3
{
}

- (void)setMuteAssertion:(id)a3
{
  self->super._muteAssertion = (NCNotificationMuteAssertion *)[a3 copyWithZone:0];

  MEMORY[0x270F9A758]();
}

@end