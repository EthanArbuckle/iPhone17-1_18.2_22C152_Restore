@interface UNCNotificationTopicRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)enablesAlerts;
- (BOOL)enablesBadges;
- (BOOL)enablesCarPlay;
- (BOOL)enablesCriticalAlerts;
- (BOOL)enablesLockScreen;
- (BOOL)enablesNotificationCenter;
- (BOOL)enablesSounds;
- (BOOL)enablesSpoken;
- (BOOL)enablesTimeSensitive;
- (BOOL)isEqual:(id)a3;
- (BOOL)modalAlertStyle;
- (BOOL)supportsAlerts;
- (BOOL)supportsBadges;
- (BOOL)supportsCarPlay;
- (BOOL)supportsCriticalAlerts;
- (BOOL)supportsLockScreen;
- (BOOL)supportsNotificationCenter;
- (BOOL)supportsSounds;
- (BOOL)supportsSpoken;
- (BOOL)supportsTimeSensitive;
- (NSString)displayName;
- (NSString)displayNameLocalizationKey;
- (NSString)identifier;
- (NSString)sortIdentifier;
- (UNCNotificationTopicRecord)initWithCoder:(id)a3;
- (UNCNotificationTopicRecord)initWithDictionaryRepresentation:(id)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)priority;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayNameLocalizationKey:(id)a3;
- (void)setEnablesAlerts:(BOOL)a3;
- (void)setEnablesBadges:(BOOL)a3;
- (void)setEnablesCarPlay:(BOOL)a3;
- (void)setEnablesCriticalAlerts:(BOOL)a3;
- (void)setEnablesLockScreen:(BOOL)a3;
- (void)setEnablesNotificationCenter:(BOOL)a3;
- (void)setEnablesSounds:(BOOL)a3;
- (void)setEnablesSpoken:(BOOL)a3;
- (void)setEnablesTimeSensitive:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setModalAlertStyle:(BOOL)a3;
- (void)setPriority:(unint64_t)a3;
- (void)setSortIdentifier:(id)a3;
- (void)setSupportsAlerts:(BOOL)a3;
- (void)setSupportsBadges:(BOOL)a3;
- (void)setSupportsCarPlay:(BOOL)a3;
- (void)setSupportsCriticalAlerts:(BOOL)a3;
- (void)setSupportsLockScreen:(BOOL)a3;
- (void)setSupportsNotificationCenter:(BOOL)a3;
- (void)setSupportsSounds:(BOOL)a3;
- (void)setSupportsSpoken:(BOOL)a3;
- (void)setSupportsTimeSensitive:(BOOL)a3;
@end

@implementation UNCNotificationTopicRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortIdentifier, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (UNCNotificationTopicRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)UNCNotificationTopicRecord;
  v5 = [(UNCNotificationTopicRecord *)&v30 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"Identifier"];
    [(UNCNotificationTopicRecord *)v5 setIdentifier:v6];

    v7 = [v4 objectForKey:@"DisplayName"];
    [(UNCNotificationTopicRecord *)v5 setDisplayName:v7];

    v8 = [v4 objectForKey:@"DisplayNameLocalizationKey"];
    [(UNCNotificationTopicRecord *)v5 setDisplayNameLocalizationKey:v8];

    v9 = [v4 objectForKey:@"Priority"];
    -[UNCNotificationTopicRecord setPriority:](v5, "setPriority:", (int)[v9 intValue]);

    v10 = [v4 objectForKey:@"SortIdentifier"];
    [(UNCNotificationTopicRecord *)v5 setSortIdentifier:v10];

    v11 = [v4 objectForKey:@"Alert"];
    -[UNCNotificationTopicRecord setSupportsAlerts:](v5, "setSupportsAlerts:", objc_msgSend(v11, "un_safeBoolValue"));

    v12 = [v4 objectForKey:@"Badge"];
    -[UNCNotificationTopicRecord setSupportsBadges:](v5, "setSupportsBadges:", objc_msgSend(v12, "un_safeBoolValue"));

    v13 = [v4 objectForKey:@"LockScreen"];
    -[UNCNotificationTopicRecord setSupportsLockScreen:](v5, "setSupportsLockScreen:", objc_msgSend(v13, "un_safeBoolValue"));

    v14 = [v4 objectForKey:@"NotificationCenter"];
    -[UNCNotificationTopicRecord setSupportsNotificationCenter:](v5, "setSupportsNotificationCenter:", objc_msgSend(v14, "un_safeBoolValue"));

    v15 = [v4 objectForKey:@"CarPlay"];
    -[UNCNotificationTopicRecord setSupportsCarPlay:](v5, "setSupportsCarPlay:", objc_msgSend(v15, "un_safeBoolValue"));

    v16 = [v4 objectForKey:@"Spoken"];
    -[UNCNotificationTopicRecord setSupportsSpoken:](v5, "setSupportsSpoken:", objc_msgSend(v16, "un_safeBoolValue"));

    v17 = [v4 objectForKey:@"CriticalAlert"];
    -[UNCNotificationTopicRecord setSupportsCriticalAlerts:](v5, "setSupportsCriticalAlerts:", objc_msgSend(v17, "un_safeBoolValue"));

    v18 = [v4 objectForKey:@"TimeSensitive"];
    -[UNCNotificationTopicRecord setSupportsTimeSensitive:](v5, "setSupportsTimeSensitive:", objc_msgSend(v18, "un_safeBoolValue"));

    v19 = [v4 objectForKey:@"Sound"];
    -[UNCNotificationTopicRecord setSupportsSounds:](v5, "setSupportsSounds:", objc_msgSend(v19, "un_safeBoolValue"));

    v20 = [v4 objectForKey:@"EnablesAlert"];
    -[UNCNotificationTopicRecord setEnablesAlerts:](v5, "setEnablesAlerts:", objc_msgSend(v20, "un_safeBoolValue"));

    v21 = [v4 objectForKey:@"EnablesBadge"];
    -[UNCNotificationTopicRecord setEnablesBadges:](v5, "setEnablesBadges:", objc_msgSend(v21, "un_safeBoolValue"));

    v22 = [v4 objectForKey:@"EnablesLockScreen"];
    -[UNCNotificationTopicRecord setEnablesLockScreen:](v5, "setEnablesLockScreen:", objc_msgSend(v22, "un_safeBoolValue"));

    v23 = [v4 objectForKey:@"EnablesNotificationCenter"];
    -[UNCNotificationTopicRecord setEnablesNotificationCenter:](v5, "setEnablesNotificationCenter:", objc_msgSend(v23, "un_safeBoolValue"));

    v24 = [v4 objectForKey:@"EnablesCarPlay"];
    -[UNCNotificationTopicRecord setEnablesCarPlay:](v5, "setEnablesCarPlay:", objc_msgSend(v24, "un_safeBoolValue"));

    v25 = [v4 objectForKey:@"EnablesSpoken"];
    -[UNCNotificationTopicRecord setEnablesSpoken:](v5, "setEnablesSpoken:", objc_msgSend(v25, "un_safeBoolValue"));

    v26 = [v4 objectForKey:@"EnablesCriticalAlert"];
    -[UNCNotificationTopicRecord setEnablesCriticalAlerts:](v5, "setEnablesCriticalAlerts:", objc_msgSend(v26, "un_safeBoolValue"));

    v27 = [v4 objectForKey:@"EnablesSound"];
    -[UNCNotificationTopicRecord setEnablesSounds:](v5, "setEnablesSounds:", objc_msgSend(v27, "un_safeBoolValue"));

    v28 = [v4 objectForKey:@"Modal"];
    -[UNCNotificationTopicRecord setModalAlertStyle:](v5, "setModalAlertStyle:", objc_msgSend(v28, "un_safeBoolValue"));
  }
  return v5;
}

- (void)setSupportsSounds:(BOOL)a3
{
  self->_supportsSounds = a3;
}

- (void)setSupportsNotificationCenter:(BOOL)a3
{
  self->_supportsNotificationCenter = a3;
}

- (void)setSupportsLockScreen:(BOOL)a3
{
  self->_supportsLockScreen = a3;
}

- (void)setSupportsCarPlay:(BOOL)a3
{
  self->_supportsCarPlay = a3;
}

- (void)setSupportsBadges:(BOOL)a3
{
  self->_supportsBadges = a3;
}

- (void)setSupportsAlerts:(BOOL)a3
{
  self->_supportsAlerts = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setEnablesSounds:(BOOL)a3
{
  self->_enablesSounds = a3;
}

- (void)setEnablesNotificationCenter:(BOOL)a3
{
  self->_enablesNotificationCenter = a3;
}

- (void)setEnablesLockScreen:(BOOL)a3
{
  self->_enablesLockScreen = a3;
}

- (void)setEnablesCarPlay:(BOOL)a3
{
  self->_enablesCarPlay = a3;
}

- (void)setEnablesBadges:(BOOL)a3
{
  self->_enablesBadges = a3;
}

- (void)setEnablesAlerts:(BOOL)a3
{
  self->_enablesAlerts = a3;
}

- (void)setDisplayName:(id)a3
{
}

- (void)setSupportsTimeSensitive:(BOOL)a3
{
  self->_supportsTimeSensitive = a3;
}

- (void)setModalAlertStyle:(BOOL)a3
{
  self->_modalAlertStyle = a3;
}

- (void)setSupportsSpoken:(BOOL)a3
{
  self->_supportsSpoken = a3;
}

- (void)setSupportsCriticalAlerts:(BOOL)a3
{
  self->_supportsCriticalAlerts = a3;
}

- (void)setSortIdentifier:(id)a3
{
}

- (void)setPriority:(unint64_t)a3
{
  self->_priority = a3;
}

- (void)setEnablesCriticalAlerts:(BOOL)a3
{
  self->_enablesCriticalAlerts = a3;
}

- (void)setEnablesSpoken:(BOOL)a3
{
  self->_enablesSpoken = a3;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_25;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class()) {
    goto LABEL_25;
  }
  v6 = [(UNCNotificationTopicRecord *)self identifier];
  v7 = [v4 identifier];
  int v8 = UNSimilarStrings();

  if (!v8) {
    goto LABEL_25;
  }
  v9 = [(UNCNotificationTopicRecord *)self displayName];
  v10 = [v4 displayName];
  int v11 = UNSimilarStrings();

  if (!v11) {
    goto LABEL_25;
  }
  v12 = [(UNCNotificationTopicRecord *)self displayNameLocalizationKey];
  v13 = [v4 displayNameLocalizationKey];
  int v14 = UNSimilarStrings();

  if (!v14) {
    goto LABEL_25;
  }
  unint64_t v15 = [(UNCNotificationTopicRecord *)self priority];
  if (v15 != [v4 priority]) {
    goto LABEL_25;
  }
  v16 = [(UNCNotificationTopicRecord *)self sortIdentifier];
  v17 = [v4 sortIdentifier];
  int v18 = UNSimilarStrings();

  if (!v18) {
    goto LABEL_25;
  }
  int v19 = [(UNCNotificationTopicRecord *)self supportsAlerts];
  if (v19 != [v4 supportsAlerts]) {
    goto LABEL_25;
  }
  int v20 = [(UNCNotificationTopicRecord *)self supportsBadges];
  if (v20 != [v4 supportsBadges]) {
    goto LABEL_25;
  }
  int v21 = [(UNCNotificationTopicRecord *)self supportsLockScreen];
  if (v21 != [v4 supportsLockScreen]) {
    goto LABEL_25;
  }
  int v22 = [(UNCNotificationTopicRecord *)self supportsNotificationCenter];
  if (v22 != [v4 supportsNotificationCenter]) {
    goto LABEL_25;
  }
  int v23 = [(UNCNotificationTopicRecord *)self supportsCarPlay];
  if (v23 != [v4 supportsCarPlay]) {
    goto LABEL_25;
  }
  int v24 = [(UNCNotificationTopicRecord *)self supportsCriticalAlerts];
  if (v24 != [v4 supportsCriticalAlerts]) {
    goto LABEL_25;
  }
  int v25 = [(UNCNotificationTopicRecord *)self supportsTimeSensitive];
  if (v25 != [v4 supportsTimeSensitive]) {
    goto LABEL_25;
  }
  int v26 = [(UNCNotificationTopicRecord *)self supportsSounds];
  if (v26 != [v4 supportsSounds]) {
    goto LABEL_25;
  }
  int v27 = [(UNCNotificationTopicRecord *)self supportsSpoken];
  if (v27 != [v4 supportsSpoken]) {
    goto LABEL_25;
  }
  int v28 = [(UNCNotificationTopicRecord *)self enablesAlerts];
  if (v28 != [v4 enablesAlerts]) {
    goto LABEL_25;
  }
  int v29 = [(UNCNotificationTopicRecord *)self enablesBadges];
  if (v29 == [v4 enablesBadges]
    && (int v30 = [(UNCNotificationTopicRecord *)self enablesLockScreen],
        v30 == [v4 enablesLockScreen])
    && (int v31 = [(UNCNotificationTopicRecord *)self enablesNotificationCenter],
        v31 == [v4 enablesNotificationCenter])
    && (int v32 = [(UNCNotificationTopicRecord *)self enablesCarPlay],
        v32 == [v4 enablesCarPlay])
    && (int v33 = [(UNCNotificationTopicRecord *)self enablesCriticalAlerts],
        v33 == [v4 enablesCriticalAlerts])
    && (int v34 = [(UNCNotificationTopicRecord *)self enablesSounds],
        v34 == [v4 enablesSounds])
    && (int v35 = [(UNCNotificationTopicRecord *)self enablesSpoken],
        v35 == [v4 enablesSpoken]))
  {
    BOOL v38 = [(UNCNotificationTopicRecord *)self modalAlertStyle];
    int v36 = v38 ^ [v4 modalAlertStyle] ^ 1;
  }
  else
  {
LABEL_25:
    LOBYTE(v36) = 0;
  }

  return v36;
}

- (BOOL)supportsTimeSensitive
{
  return self->_supportsTimeSensitive;
}

- (BOOL)supportsSpoken
{
  return self->_supportsSpoken;
}

- (BOOL)supportsSounds
{
  return self->_supportsSounds;
}

- (BOOL)supportsNotificationCenter
{
  return self->_supportsNotificationCenter;
}

- (BOOL)supportsLockScreen
{
  return self->_supportsLockScreen;
}

- (BOOL)supportsCriticalAlerts
{
  return self->_supportsCriticalAlerts;
}

- (BOOL)supportsCarPlay
{
  return self->_supportsCarPlay;
}

- (BOOL)supportsBadges
{
  return self->_supportsBadges;
}

- (BOOL)supportsAlerts
{
  return self->_supportsAlerts;
}

- (NSString)sortIdentifier
{
  return self->_sortIdentifier;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (BOOL)modalAlertStyle
{
  return self->_modalAlertStyle;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)enablesSpoken
{
  return self->_enablesSpoken;
}

- (BOOL)enablesSounds
{
  return self->_enablesSounds;
}

- (BOOL)enablesNotificationCenter
{
  return self->_enablesNotificationCenter;
}

- (BOOL)enablesLockScreen
{
  return self->_enablesLockScreen;
}

- (BOOL)enablesCriticalAlerts
{
  return self->_enablesCriticalAlerts;
}

- (BOOL)enablesCarPlay
{
  return self->_enablesCarPlay;
}

- (BOOL)enablesBadges
{
  return self->_enablesBadges;
}

- (BOOL)enablesAlerts
{
  return self->_enablesAlerts;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(UNCNotificationTopicRecord *)self identifier];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v4, @"Identifier");

  uint64_t v5 = [(UNCNotificationTopicRecord *)self displayName];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v5, @"DisplayName");

  v6 = [(UNCNotificationTopicRecord *)self displayNameLocalizationKey];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v6, @"DisplayNameLocalizationKey");

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[UNCNotificationTopicRecord priority](self, "priority"));
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v7, @"Priority");

  int v8 = [(UNCNotificationTopicRecord *)self sortIdentifier];
  objc_msgSend(v3, "unc_safeSetObject:forKey:", v8, @"SortIdentifier");

  if ([(UNCNotificationTopicRecord *)self supportsAlerts]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"Alert"];
  }
  if ([(UNCNotificationTopicRecord *)self supportsBadges]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"Badge"];
  }
  if ([(UNCNotificationTopicRecord *)self supportsLockScreen]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"LockScreen"];
  }
  if ([(UNCNotificationTopicRecord *)self supportsNotificationCenter]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"NotificationCenter"];
  }
  if ([(UNCNotificationTopicRecord *)self supportsCarPlay]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"CarPlay"];
  }
  if ([(UNCNotificationTopicRecord *)self supportsSpoken]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"Spoken"];
  }
  if ([(UNCNotificationTopicRecord *)self supportsCriticalAlerts]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"CriticalAlert"];
  }
  if ([(UNCNotificationTopicRecord *)self supportsTimeSensitive]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"TimeSensitive"];
  }
  if ([(UNCNotificationTopicRecord *)self supportsSounds]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"Sound"];
  }
  if ([(UNCNotificationTopicRecord *)self enablesAlerts]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"EnablesAlert"];
  }
  if ([(UNCNotificationTopicRecord *)self enablesBadges]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"EnablesBadge"];
  }
  if ([(UNCNotificationTopicRecord *)self enablesLockScreen]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"EnablesLockScreen"];
  }
  if ([(UNCNotificationTopicRecord *)self enablesNotificationCenter]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"EnablesNotificationCenter"];
  }
  if ([(UNCNotificationTopicRecord *)self enablesCarPlay]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"EnablesCarPlay"];
  }
  if ([(UNCNotificationTopicRecord *)self enablesSpoken]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"EnablesSpoken"];
  }
  if ([(UNCNotificationTopicRecord *)self enablesCriticalAlerts]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"EnablesCriticalAlert"];
  }
  if ([(UNCNotificationTopicRecord *)self enablesSounds]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"EnablesSound"];
  }
  if ([(UNCNotificationTopicRecord *)self modalAlertStyle]) {
    [v3 setObject:MEMORY[0x263EFFA88] forKey:@"Modal"];
  }

  return v3;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(UNCNotificationTopicRecord *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"Identifier"];

  v6 = [(UNCNotificationTopicRecord *)self displayName];
  id v7 = (id)[v3 appendObject:v6 withName:@"DisplayName"];

  int v8 = [(UNCNotificationTopicRecord *)self displayNameLocalizationKey];
  id v9 = (id)[v3 appendObject:v8 withName:@"DisplayNameLocalizationKey"];

  id v10 = (id)objc_msgSend(v3, "appendInteger:withName:", -[UNCNotificationTopicRecord priority](self, "priority"), @"Priority");
  int v11 = [(UNCNotificationTopicRecord *)self sortIdentifier];
  id v12 = (id)[v3 appendObject:v11 withName:@"SortIdentifier"];

  id v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsAlerts](self, "supportsAlerts"), @"SupportsAlert");
  id v14 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsBadges](self, "supportsBadges"), @"SupportsBadge");
  id v15 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsLockScreen](self, "supportsLockScreen"), @"SupportsLockScreen");
  id v16 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsNotificationCenter](self, "supportsNotificationCenter"), @"SupportsNotificationCenter");
  id v17 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsCarPlay](self, "supportsCarPlay"), @"SupportsCarPlay");
  id v18 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsCriticalAlerts](self, "supportsCriticalAlerts"), @"SupportsCriticalAlert");
  id v19 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsTimeSensitive](self, "supportsTimeSensitive"), @"SupportsTimeSensitive");
  id v20 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsSounds](self, "supportsSounds"), @"SupportsSound");
  id v21 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord supportsSpoken](self, "supportsSpoken"), @"SupportsSpoken");
  id v22 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesAlerts](self, "enablesAlerts"), @"EnablesAlert");
  id v23 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesBadges](self, "enablesBadges"), @"EnablesBadge");
  id v24 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesLockScreen](self, "enablesLockScreen"), @"EnablesLockScreen");
  id v25 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesNotificationCenter](self, "enablesNotificationCenter"), @"EnablesNotificationCenter");
  id v26 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesCarPlay](self, "enablesCarPlay"), @"EnablesCarPlay");
  id v27 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesCriticalAlerts](self, "enablesCriticalAlerts"), @"EnablesCriticalAlert");
  id v28 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesSounds](self, "enablesSounds"), @"EnablesSound");
  id v29 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord enablesSpoken](self, "enablesSpoken"), @"EnablesSpoken");
  id v30 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationTopicRecord modalAlertStyle](self, "modalAlertStyle"), @"ModalAlertStyle");
  int v31 = [v3 build];

  return v31;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = [(UNCNotificationTopicRecord *)self identifier];
  id v5 = (id)[v3 appendObject:v4];

  v6 = [(UNCNotificationTopicRecord *)self displayName];
  id v7 = (id)[v3 appendObject:v6];

  int v8 = [(UNCNotificationTopicRecord *)self displayNameLocalizationKey];
  id v9 = (id)[v3 appendObject:v8];

  id v10 = (id)objc_msgSend(v3, "appendInteger:", -[UNCNotificationTopicRecord priority](self, "priority"));
  int v11 = [(UNCNotificationTopicRecord *)self sortIdentifier];
  id v12 = (id)[v3 appendObject:v11];

  id v13 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsAlerts](self, "supportsAlerts"));
  id v14 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsBadges](self, "supportsBadges"));
  id v15 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsLockScreen](self, "supportsLockScreen"));
  id v16 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsNotificationCenter](self, "supportsNotificationCenter"));
  id v17 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsCarPlay](self, "supportsCarPlay"));
  id v18 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsCriticalAlerts](self, "supportsCriticalAlerts"));
  id v19 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsTimeSensitive](self, "supportsTimeSensitive"));
  id v20 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsSounds](self, "supportsSounds"));
  id v21 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord supportsSpoken](self, "supportsSpoken"));
  id v22 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesAlerts](self, "enablesAlerts"));
  id v23 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesBadges](self, "enablesBadges"));
  id v24 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesLockScreen](self, "enablesLockScreen"));
  id v25 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesNotificationCenter](self, "enablesNotificationCenter"));
  id v26 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesCarPlay](self, "enablesCarPlay"));
  id v27 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesCriticalAlerts](self, "enablesCriticalAlerts"));
  id v28 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesSounds](self, "enablesSounds"));
  id v29 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord enablesSpoken](self, "enablesSpoken"));
  id v30 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationTopicRecord modalAlertStyle](self, "modalAlertStyle"));
  unint64_t v31 = [v3 hash];

  return v31;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(UNCNotificationTopicRecord *)self dictionaryRepresentation];
  [v4 encodeObject:v5 forKey:@"dictionary"];
}

- (UNCNotificationTopicRecord)initWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v11 count:7];
  id v7 = objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14, v15, v16);

  int v8 = [v5 decodeObjectOfClasses:v7 forKey:@"dictionary"];

  id v9 = [[UNCNotificationTopicRecord alloc] initWithDictionaryRepresentation:v8];
  return v9;
}

- (BOOL)enablesTimeSensitive
{
  return self->_enablesTimeSensitive;
}

- (void)setEnablesTimeSensitive:(BOOL)a3
{
  self->_enablesTimeSensitive = a3;
}

@end