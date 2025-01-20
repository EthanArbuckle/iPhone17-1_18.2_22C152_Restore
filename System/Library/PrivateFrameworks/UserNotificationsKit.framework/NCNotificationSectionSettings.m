@interface NCNotificationSectionSettings
- (BOOL)hasProvisionalAuthorization;
- (BOOL)isAppClip;
- (BOOL)isDeliveredQuietly;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserConfigurable;
- (BOOL)showsCustomSettingsLink;
- (NCNotificationMuteAssertion)muteAssertion;
- (NCNotificationSectionSettings)initWithNotificationSectionSettings:(id)a3;
- (NSDictionary)settings;
- (NSSet)subSectionSettings;
- (NSString)debugDescription;
- (NSString)displayName;
- (NSString)sectionIdentifier;
- (NSString)subSectionIdentifier;
- (UIImage)settingsIcon;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
@end

@implementation NCNotificationSectionSettings

- (NSDictionary)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteAssertion, 0);
  objc_storeStrong((id *)&self->_settingsIcon, 0);
  objc_storeStrong((id *)&self->_subSectionSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_subSectionIdentifier, 0);

  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

- (NCNotificationMuteAssertion)muteAssertion
{
  return self->_muteAssertion;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sectionIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_subSectionIdentifier hash] + v3;
  NSUInteger v5 = [(NSString *)self->_displayName hash];
  NSUInteger v6 = v4 + v5 + [(NSDictionary *)self->_settings hash];
  uint64_t v7 = [(NSSet *)self->_subSectionSettings hash] + self->_userConfigurable;
  NSUInteger v8 = v6 + v7 + [(UIImage *)self->_settingsIcon hash];
  unint64_t v9 = self->_showsCustomSettingsLink
     + (unint64_t)self->_isDeliveredQuietly
     + self->_hasProvisialAuthorization
     + self->_isAppClip;
  return v8 + v9 + [(NCNotificationMuteAssertion *)self->_muteAssertion hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    NSUInteger v5 = v4;
  }
  else {
    NSUInteger v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_16;
  }
  uint64_t v7 = [(NCNotificationSectionSettings *)self sectionIdentifier];
  NSUInteger v8 = [v6 sectionIdentifier];
  int v9 = NCIsEqual(v7, v8);

  if (!v9) {
    goto LABEL_16;
  }
  v10 = [(NCNotificationSectionSettings *)self subSectionIdentifier];
  v11 = [v6 subSectionIdentifier];
  int v12 = NCIsEqual(v10, v11);

  if (!v12) {
    goto LABEL_16;
  }
  v13 = [(NCNotificationSectionSettings *)self displayName];
  v14 = [v6 displayName];
  int v15 = NCIsEqual(v13, v14);

  if (!v15) {
    goto LABEL_16;
  }
  v16 = [(NCNotificationSectionSettings *)self settings];
  v17 = [v6 settings];
  int v18 = NCIsEqualToDictionary(v16, v17);

  if (!v18) {
    goto LABEL_16;
  }
  v19 = [(NCNotificationSectionSettings *)self subSectionSettings];
  v20 = [v6 subSectionSettings];
  int v21 = NCIsEqualToSet(v19, v20);

  if (!v21) {
    goto LABEL_16;
  }
  int v22 = [(NCNotificationSectionSettings *)self isUserConfigurable];
  if (v22 != [v6 isUserConfigurable]) {
    goto LABEL_16;
  }
  v23 = [(NCNotificationSectionSettings *)self settingsIcon];
  v24 = [v6 settingsIcon];
  int v25 = NCIsEqual(v23, v24);

  if (!v25) {
    goto LABEL_16;
  }
  int v26 = [(NCNotificationSectionSettings *)self showsCustomSettingsLink];
  if (v26 == [v6 showsCustomSettingsLink]
    && (int v27 = [(NCNotificationSectionSettings *)self isDeliveredQuietly],
        v27 == [v6 isDeliveredQuietly])
    && (int v28 = [(NCNotificationSectionSettings *)self hasProvisionalAuthorization],
        v28 == [v6 hasProvisionalAuthorization])
    && (int v29 = [(NCNotificationSectionSettings *)self isAppClip],
        v29 == [v6 isAppClip]))
  {
    v32 = [(NCNotificationSectionSettings *)self muteAssertion];
    v33 = [v6 muteAssertion];
    char v30 = NCIsEqual(v32, v33);
  }
  else
  {
LABEL_16:
    char v30 = 0;
  }

  return v30;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)subSectionIdentifier
{
  return self->_subSectionIdentifier;
}

- (NCNotificationSectionSettings)initWithNotificationSectionSettings:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)NCNotificationSectionSettings;
  NSUInteger v5 = [(NCNotificationSectionSettings *)&v27 init];
  if (v5)
  {
    id v6 = [v4 sectionIdentifier];
    uint64_t v7 = [v6 copy];
    sectionIdentifier = v5->_sectionIdentifier;
    v5->_sectionIdentifier = (NSString *)v7;

    int v9 = [v4 subSectionIdentifier];
    uint64_t v10 = [v9 copy];
    subSectionIdentifier = v5->_subSectionIdentifier;
    v5->_subSectionIdentifier = (NSString *)v10;

    int v12 = [v4 displayName];
    uint64_t v13 = [v12 copy];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v13;

    int v15 = [v4 settings];
    uint64_t v16 = [v15 copy];
    settings = v5->_settings;
    v5->_settings = (NSDictionary *)v16;

    int v18 = [v4 subSectionSettings];
    uint64_t v19 = [v18 copy];
    subSectionSettings = v5->_subSectionSettings;
    v5->_subSectionSettings = (NSSet *)v19;

    v5->_userConfigurable = [v4 isUserConfigurable];
    uint64_t v21 = [v4 settingsIcon];
    settingsIcon = v5->_settingsIcon;
    v5->_settingsIcon = (UIImage *)v21;

    v5->_showsCustomSettingsLink = [v4 showsCustomSettingsLink];
    v5->_isDeliveredQuietly = [v4 isDeliveredQuietly];
    v5->_hasProvisialAuthorization = [v4 hasProvisionalAuthorization];
    v5->_isAppClip = [v4 isAppClip];
    v23 = [v4 muteAssertion];
    uint64_t v24 = [v23 copyWithZone:0];
    muteAssertion = v5->_muteAssertion;
    v5->_muteAssertion = (NCNotificationMuteAssertion *)v24;
  }
  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationSectionSettings *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [NCMutableNotificationSectionSettings alloc];

  return [(NCNotificationSectionSettings *)v4 initWithNotificationSectionSettings:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  NSUInteger v3 = [(NCNotificationSectionSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__NCNotificationSectionSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_264559E60;
  id v7 = v6;
  id v11 = v7;
  int v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

void __71__NCNotificationSectionSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  NSUInteger v3 = [*(id *)(a1 + 40) sectionIdentifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"sectionId"];

  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) subSectionIdentifier];
  id v7 = (id)[v5 appendObject:v6 withName:@"subSectionId" skipIfNil:1];

  id v8 = *(void **)(a1 + 32);
  int v9 = [*(id *)(a1 + 40) displayName];
  id v10 = (id)[v8 appendObject:v9 withName:@"displayName"];

  id v11 = *(void **)(a1 + 32);
  int v12 = [*(id *)(a1 + 40) settings];
  [v11 appendDictionarySection:v12 withName:@"settings" skipIfEmpty:0];

  uint64_t v13 = *(void **)(a1 + 32);
  v14 = [*(id *)(a1 + 40) subSectionSettings];
  int v15 = [v14 allObjects];
  [v13 appendArraySection:v15 withName:@"subSectionSettings" skipIfEmpty:1];

  id v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUserConfigurable"), @"userConfigurable");
  id v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "showsCustomSettingsLink"), @"customSettingsLink");
  id v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isDeliveredQuietly"), @"deliveredQuietly");
  id v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "hasProvisionalAuthorization"), @"provisionalAuthorization");
  id v20 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isAppClip"), @"appClip");
  uint64_t v21 = *(void **)(a1 + 32);
  id v23 = [*(id *)(a1 + 40) muteAssertion];
  id v22 = (id)[v21 appendObject:v23 withName:@"muteAssertion"];
}

- (id)succinctDescription
{
  v2 = [(NCNotificationSectionSettings *)self succinctDescriptionBuilder];
  NSUInteger v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  NSUInteger v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(NCNotificationSectionSettings *)self sectionIdentifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"sectionId"];

  id v6 = [(NCNotificationSectionSettings *)self subSectionIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"subSectionId" skipIfNil:1];

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSSet)subSectionSettings
{
  return self->_subSectionSettings;
}

- (BOOL)isUserConfigurable
{
  return self->_userConfigurable;
}

- (UIImage)settingsIcon
{
  return self->_settingsIcon;
}

- (BOOL)showsCustomSettingsLink
{
  return self->_showsCustomSettingsLink;
}

- (BOOL)isDeliveredQuietly
{
  return self->_isDeliveredQuietly;
}

- (BOOL)hasProvisionalAuthorization
{
  return self->_hasProvisialAuthorization;
}

- (BOOL)isAppClip
{
  return self->_isAppClip;
}

@end