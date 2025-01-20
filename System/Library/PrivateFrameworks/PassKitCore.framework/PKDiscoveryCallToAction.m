@interface PKDiscoveryCallToAction
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldRoundIcon;
- (NSArray)paymentNetworks;
- (NSDictionary)actionInfo;
- (NSNumber)appStoreAppIdentifier;
- (NSSet)allowedFeatureIdentifiers;
- (NSSet)productIdentifiers;
- (NSSet)transitNetworkIdentifiers;
- (NSString)buttonTextKey;
- (NSString)itemIdentifier;
- (NSString)localizedButtonText;
- (NSString)localizedSubtitle;
- (NSString)localizedTitle;
- (NSString)referrerIdentifier;
- (NSString)subtitleKey;
- (NSString)titleKey;
- (PKColor)backgroundColor;
- (PKDiscoveryCallToAction)initWithCoder:(id)a3;
- (PKDiscoveryCallToAction)initWithDictionary:(id)a3;
- (PKDiscoveryItem)item;
- (PKDiscoveryMedia)icon;
- (PKDiscoveryMedia)wordmarkAsset;
- (id)description;
- (int64_t)action;
- (int64_t)foregroundContentMode;
- (int64_t)paymentSetupMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)localizeWithBundle:(id)a3;
- (void)localizeWithBundle:(id)a3 table:(id)a4;
- (void)setForegroundContentMode:(int64_t)a3;
- (void)setItem:(id)a3;
- (void)setLocalizedButtonText:(id)a3;
- (void)setLocalizedSubtitle:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setRoundIcon:(BOOL)a3;
@end

@implementation PKDiscoveryCallToAction

- (PKDiscoveryCallToAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PKDiscoveryCallToAction;
  v5 = [(PKDiscoveryCallToAction *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"titleKey"];
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"subtitleKey"];
    subtitleKey = v5->_subtitleKey;
    v5->_subtitleKey = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"buttonTextKey"];
    buttonTextKey = v5->_buttonTextKey;
    v5->_buttonTextKey = (NSString *)v10;

    id v12 = [v4 PKStringForKey:@"action"];
    if ([@"transitDCI" isEqualToString:v12])
    {
      uint64_t v13 = 1;
    }
    else if ([@"featureApply" isEqualToString:v12])
    {
      uint64_t v13 = 2;
    }
    else if ([@"addCard" isEqualToString:v12])
    {
      uint64_t v13 = 3;
    }
    else if ([@"settingsExpressTransit" isEqualToString:v12])
    {
      uint64_t v13 = 4;
    }
    else if ([@"appleCashSetup" isEqualToString:v12])
    {
      uint64_t v13 = 6;
    }
    else if ([@"appleCashFamilySetup" isEqualToString:v12])
    {
      uint64_t v13 = 5;
    }
    else if ([@"accountUserCreateInvitation" isEqualToString:v12])
    {
      uint64_t v13 = 7;
    }
    else if ([@"appLink" isEqualToString:v12])
    {
      uint64_t v13 = 8;
    }
    else if ([@"provisionProduct" isEqualToString:v12])
    {
      uint64_t v13 = 11;
    }
    else if ([@"featureApplyStandalone" isEqualToString:v12])
    {
      uint64_t v13 = 9;
    }
    else if ([@"hideMyEmail" isEqualToString:v12])
    {
      uint64_t v13 = 10;
    }
    else
    {
      uint64_t v13 = 0;
    }

    v5->_action = v13;
    uint64_t v14 = [v4 PKDictionaryForKey:@"actionInfo"];
    actionInfo = v5->_actionInfo;
    v5->_actionInfo = (NSDictionary *)v14;

    v16 = [v4 PKDictionaryForKey:@"icon"];
    if (v16)
    {
      v17 = [[PKDiscoveryMedia alloc] initWithDictionary:v16];
      icon = v5->_icon;
      v5->_icon = v17;

      v5->_roundIcon = [v4 PKBoolForKey:@"shouldRoundIcon"];
    }
    v19 = [v4 PKDictionaryForKey:@"wordmarkAsset"];
    if (v19)
    {
      v20 = [[PKDiscoveryMedia alloc] initWithDictionary:v19];
      wordmarkAsset = v5->_wordmarkAsset;
      v5->_wordmarkAsset = v20;
    }
    uint64_t v22 = [v4 PKColorForKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v22;

    v24 = [v4 PKStringForKey:@"foregroundContentMode"];
    v25 = v24;
    if (v24)
    {
      v5->_foregroundContentModeIsSet = 1;
      v5->_foregroundContentMode = PKDiscoveryCardForegroundContentModeFromString(v24);
    }
  }
  return v5;
}

- (void)setForegroundContentMode:(int64_t)a3
{
  if (!self->_foregroundContentModeIsSet) {
    self->_foregroundContentMode = a3;
  }
}

- (void)setItem:(id)a3
{
  p_item = &self->_item;
  id v5 = a3;
  objc_storeWeak((id *)p_item, v5);
  uint64_t v6 = [v5 identifier];

  itemIdentifier = self->_itemIdentifier;
  self->_itemIdentifier = v6;
}

- (void)localizeWithBundle:(id)a3
{
}

- (void)localizeWithBundle:(id)a3 table:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  titleKey = self->_titleKey;
  if (titleKey)
  {
    uint64_t v8 = [v16 localizedStringForKey:titleKey value:&stru_1EE0F5368 table:v6];
    localizedTitle = self->_localizedTitle;
    self->_localizedTitle = v8;
  }
  subtitleKey = self->_subtitleKey;
  if (subtitleKey)
  {
    v11 = [v16 localizedStringForKey:subtitleKey value:&stru_1EE0F5368 table:v6];
    localizedSubtitle = self->_localizedSubtitle;
    self->_localizedSubtitle = v11;
  }
  buttonTextKey = self->_buttonTextKey;
  if (buttonTextKey)
  {
    uint64_t v14 = [v16 localizedStringForKey:buttonTextKey value:&stru_1EE0F5368 table:v6];
    localizedButtonText = self->_localizedButtonText;
    self->_localizedButtonText = v14;
  }
}

- (NSString)referrerIdentifier
{
  referrerIdentifier = (NSDictionary *)self->_referrerIdentifier;
  if (!referrerIdentifier)
  {
    referrerIdentifier = self->_actionInfo;
    if (referrerIdentifier)
    {
      id v4 = [(NSDictionary *)referrerIdentifier objectForKeyedSubscript:@"referrerIdentifier"];
      id v5 = self->_referrerIdentifier;
      self->_referrerIdentifier = v4;

      referrerIdentifier = (NSDictionary *)self->_referrerIdentifier;
    }
  }
  return (NSString *)referrerIdentifier;
}

- (int64_t)paymentSetupMode
{
  int64_t action = self->_action;
  switch(action)
  {
    case 11:
      return 3;
    case 2:
      return 4;
    case 1:
      return 3;
  }
  return 0;
}

- (NSArray)paymentNetworks
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  actionInfo = self->_actionInfo;
  if (actionInfo && !self->_paymentNetworks)
  {
    id v4 = [(NSDictionary *)actionInfo PKArrayForKey:@"paymentCredentials"];
    if ([v4 count])
    {
      id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        v9 = 0;
        uint64_t v10 = *(void *)v18;
        do
        {
          uint64_t v11 = 0;
          id v12 = v9;
          do
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v6);
            }
            v9 = PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v11), "integerValue", (void)v17));

            if (v9) {
              [v5 addObject:v9];
            }
            ++v11;
            id v12 = v9;
          }
          while (v8 != v11);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v8);
      }
      uint64_t v13 = (NSArray *)[v5 copy];
      paymentNetworks = self->_paymentNetworks;
      self->_paymentNetworks = v13;
    }
  }
  v15 = self->_paymentNetworks;
  return v15;
}

- (NSSet)allowedFeatureIdentifiers
{
  allowedFeatureIdentifiers = self->_allowedFeatureIdentifiers;
  if (!allowedFeatureIdentifiers)
  {
    allowedFeatureIdentifiers = self->_actionInfo;
    if (allowedFeatureIdentifiers)
    {
      id v4 = [allowedFeatureIdentifiers objectForKeyedSubscript:@"featureIdentifier"];
      if (PKFeatureIdentifierFromString(v4))
      {
        id v5 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v4, 0);
        id v6 = self->_allowedFeatureIdentifiers;
        self->_allowedFeatureIdentifiers = v5;
      }
      allowedFeatureIdentifiers = self->_allowedFeatureIdentifiers;
    }
  }
  return (NSSet *)allowedFeatureIdentifiers;
}

- (NSSet)transitNetworkIdentifiers
{
  transitNetworkIdentifiers = self->_transitNetworkIdentifiers;
  if (!transitNetworkIdentifiers)
  {
    transitNetworkIdentifiers = self->_actionInfo;
    if (transitNetworkIdentifiers)
    {
      id v4 = [transitNetworkIdentifiers PKArrayForKey:@"transitNetworkIdentifiers"];
      if ([v4 count])
      {
        id v5 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
        id v6 = self->_transitNetworkIdentifiers;
        self->_transitNetworkIdentifiers = v5;
      }
      transitNetworkIdentifiers = self->_transitNetworkIdentifiers;
    }
  }
  return (NSSet *)transitNetworkIdentifiers;
}

- (NSSet)productIdentifiers
{
  productIdentifiers = self->_productIdentifiers;
  if (!productIdentifiers)
  {
    productIdentifiers = self->_actionInfo;
    if (productIdentifiers)
    {
      id v4 = [productIdentifiers PKArrayForKey:@"productIdentifiers"];
      if ([v4 count])
      {
        id v5 = (NSSet *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v4];
        id v6 = self->_productIdentifiers;
        self->_productIdentifiers = v5;
      }
      productIdentifiers = self->_productIdentifiers;
    }
  }
  return (NSSet *)productIdentifiers;
}

- (NSNumber)appStoreAppIdentifier
{
  appStoreAppIdentifier = self->_appStoreAppIdentifier;
  if (!appStoreAppIdentifier)
  {
    appStoreAppIdentifier = self->_actionInfo;
    if (appStoreAppIdentifier)
    {
      id v4 = [appStoreAppIdentifier PKNumberForKey:@"appStoreAppIdentifier"];
      id v5 = self->_appStoreAppIdentifier;
      self->_appStoreAppIdentifier = v4;

      appStoreAppIdentifier = self->_appStoreAppIdentifier;
    }
  }
  return (NSNumber *)appStoreAppIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_43;
  }
  titleKey = self->_titleKey;
  id v6 = (NSString *)*((void *)v4 + 8);
  if (titleKey && v6)
  {
    if ((-[NSString isEqual:](titleKey, "isEqual:") & 1) == 0) {
      goto LABEL_43;
    }
  }
  else if (titleKey != v6)
  {
    goto LABEL_43;
  }
  subtitleKey = self->_subtitleKey;
  uint64_t v8 = (NSString *)*((void *)v4 + 9);
  if (subtitleKey && v8)
  {
    if ((-[NSString isEqual:](subtitleKey, "isEqual:") & 1) == 0) {
      goto LABEL_43;
    }
  }
  else if (subtitleKey != v8)
  {
    goto LABEL_43;
  }
  if (self->_action != *((void *)v4 + 11)) {
    goto LABEL_43;
  }
  actionInfo = self->_actionInfo;
  uint64_t v10 = (NSDictionary *)*((void *)v4 + 12);
  if (actionInfo && v10)
  {
    if ((-[NSDictionary isEqual:](actionInfo, "isEqual:") & 1) == 0) {
      goto LABEL_43;
    }
  }
  else if (actionInfo != v10)
  {
    goto LABEL_43;
  }
  icon = self->_icon;
  id v12 = (PKDiscoveryMedia *)*((void *)v4 + 13);
  if (icon && v12)
  {
    if (!-[PKDiscoveryMedia isEqual:](icon, "isEqual:")) {
      goto LABEL_43;
    }
  }
  else if (icon != v12)
  {
    goto LABEL_43;
  }
  if (self->_roundIcon != v4[57]) {
    goto LABEL_43;
  }
  wordmarkAsset = self->_wordmarkAsset;
  uint64_t v14 = (PKDiscoveryMedia *)*((void *)v4 + 14);
  if (wordmarkAsset && v14)
  {
    if (!-[PKDiscoveryMedia isEqual:](wordmarkAsset, "isEqual:")) {
      goto LABEL_43;
    }
  }
  else if (wordmarkAsset != v14)
  {
    goto LABEL_43;
  }
  if (!CGColorEqualToColor(-[PKColor CGColor](self->_backgroundColor, "CGColor"), (CGColorRef)[*((id *)v4 + 15) CGColor])|| self->_foregroundContentMode != *((void *)v4 + 16))
  {
    goto LABEL_43;
  }
  localizedTitle = self->_localizedTitle;
  id v16 = (NSString *)*((void *)v4 + 17);
  if (localizedTitle && v16)
  {
    if ((-[NSString isEqual:](localizedTitle, "isEqual:") & 1) == 0) {
      goto LABEL_43;
    }
  }
  else if (localizedTitle != v16)
  {
    goto LABEL_43;
  }
  localizedSubtitle = self->_localizedSubtitle;
  long long v18 = (NSString *)*((void *)v4 + 18);
  if (!localizedSubtitle || !v18)
  {
    if (localizedSubtitle == v18) {
      goto LABEL_39;
    }
LABEL_43:
    char v21 = 0;
    goto LABEL_44;
  }
  if ((-[NSString isEqual:](localizedSubtitle, "isEqual:") & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  localizedButtonText = self->_localizedButtonText;
  long long v20 = (NSString *)*((void *)v4 + 19);
  if (localizedButtonText && v20) {
    char v21 = -[NSString isEqual:](localizedButtonText, "isEqual:");
  }
  else {
    char v21 = localizedButtonText == v20;
  }
LABEL_44:

  return v21;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_titleKey];
  [v3 safelyAddObject:self->_subtitleKey];
  [v3 safelyAddObject:self->_buttonTextKey];
  [v3 safelyAddObject:self->_actionInfo];
  [v3 safelyAddObject:self->_icon];
  [v3 safelyAddObject:self->_wordmarkAsset];
  [v3 safelyAddObject:self->_backgroundColor];
  [v3 safelyAddObject:self->_localizedTitle];
  [v3 safelyAddObject:self->_localizedSubtitle];
  [v3 safelyAddObject:self->_localizedButtonText];
  uint64_t v4 = PKCombinedHash(17, v3);
  int64_t v5 = self->_action - v4 + 32 * v4;
  uint64_t v6 = self->_roundIcon - v5 + 32 * v5;
  unint64_t v7 = self->_foregroundContentMode - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"titleKey", self->_titleKey];
  [v3 appendFormat:@"%@: '%@'; ", @"subtitleKey", self->_subtitleKey];
  [v3 appendFormat:@"%@: '%@'; ", @"buttonTextKey", self->_buttonTextKey];
  [v3 appendFormat:@"%@: '%ld'; ", @"action", self->_action];
  [v3 appendFormat:@"%@: '%@'; ", @"actionInfo", self->_actionInfo];
  [v3 appendFormat:@"%@: '%@'; ", @"icon", self->_icon];
  if (self->_roundIcon) {
    uint64_t v4 = @"YES";
  }
  else {
    uint64_t v4 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@'; ", @"shouldRoundIcon", v4];
  [v3 appendFormat:@"%@: '%@'; ", @"wordmarkAsset", self->_wordmarkAsset];
  [v3 appendFormat:@"%@: '%@'; ", @"backgroundColor", self->_backgroundColor];
  [v3 appendFormat:@"%@: '%ld'; ", @"foregroundContentMode", self->_foregroundContentMode];
  [v3 appendFormat:@"%@: '%@'; ", @"localizedTitle", self->_localizedTitle];
  [v3 appendFormat:@"%@: '%@'; ", @"localizedSubtitle", self->_localizedSubtitle];
  [v3 appendFormat:@"%@: '%@'; ", @"localizedButtonText", self->_localizedButtonText];
  [v3 appendFormat:@"%@: '%@'; ", @"itemIdentifier", self->_itemIdentifier];
  [v3 appendFormat:@">"];
  int64_t v5 = (void *)[v3 copy];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  titleKey = self->_titleKey;
  id v5 = a3;
  [v5 encodeObject:titleKey forKey:@"titleKey"];
  [v5 encodeObject:self->_subtitleKey forKey:@"subtitleKey"];
  [v5 encodeObject:self->_buttonTextKey forKey:@"buttonTextKey"];
  [v5 encodeInteger:self->_action forKey:@"action"];
  [v5 encodeObject:self->_actionInfo forKey:@"actionInfo"];
  [v5 encodeObject:self->_icon forKey:@"icon"];
  [v5 encodeBool:self->_roundIcon forKey:@"shouldRoundIcon"];
  [v5 encodeObject:self->_wordmarkAsset forKey:@"wordmarkAsset"];
  [v5 encodeObject:self->_backgroundColor forKey:@"backgroundColor"];
  [v5 encodeInteger:self->_foregroundContentMode forKey:@"foregroundContentMode"];
  [v5 encodeObject:self->_localizedTitle forKey:@"localizedTitle"];
  [v5 encodeObject:self->_localizedSubtitle forKey:@"localizedSubtitle"];
  [v5 encodeObject:self->_localizedButtonText forKey:@"localizedButtonText"];
  [v5 encodeObject:self->_itemIdentifier forKey:@"itemIdentifier"];
}

- (PKDiscoveryCallToAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKDiscoveryCallToAction;
  id v5 = [(PKDiscoveryCallToAction *)&v34 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"titleKey"];
    titleKey = v5->_titleKey;
    v5->_titleKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitleKey"];
    subtitleKey = v5->_subtitleKey;
    v5->_subtitleKey = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buttonTextKey"];
    buttonTextKey = v5->_buttonTextKey;
    v5->_buttonTextKey = (NSString *)v10;

    v5->_int64_t action = [v4 decodeIntegerForKey:@"action"];
    id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    id v16 = objc_msgSend(v12, "initWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"actionInfo"];
    actionInfo = v5->_actionInfo;
    v5->_actionInfo = (NSDictionary *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    icon = v5->_icon;
    v5->_icon = (PKDiscoveryMedia *)v19;

    v5->_roundIcon = [v4 decodeBoolForKey:@"shouldRoundIcon"];
    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v21;

    v5->_foregroundContentMode = [v4 decodeIntegerForKey:@"foregroundContentMode"];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedSubtitle"];
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedButtonText"];
    localizedButtonText = v5->_localizedButtonText;
    v5->_localizedButtonText = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemIdentifier"];
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v29;

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wordmarkAsset"];
    wordmarkAsset = v5->_wordmarkAsset;
    v5->_wordmarkAsset = (PKDiscoveryMedia *)v31;
  }
  return v5;
}

- (NSString)titleKey
{
  return self->_titleKey;
}

- (NSString)subtitleKey
{
  return self->_subtitleKey;
}

- (NSString)buttonTextKey
{
  return self->_buttonTextKey;
}

- (int64_t)action
{
  return self->_action;
}

- (NSDictionary)actionInfo
{
  return self->_actionInfo;
}

- (PKDiscoveryMedia)icon
{
  return self->_icon;
}

- (BOOL)shouldRoundIcon
{
  return self->_roundIcon;
}

- (void)setRoundIcon:(BOOL)a3
{
  self->_roundIcon = a3;
}

- (PKDiscoveryMedia)wordmarkAsset
{
  return self->_wordmarkAsset;
}

- (PKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int64_t)foregroundContentMode
{
  return self->_foregroundContentMode;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
}

- (NSString)localizedButtonText
{
  return self->_localizedButtonText;
}

- (void)setLocalizedButtonText:(id)a3
{
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (PKDiscoveryItem)item
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_item);
  return (PKDiscoveryItem *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedButtonText, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_wordmarkAsset, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_actionInfo, 0);
  objc_storeStrong((id *)&self->_buttonTextKey, 0);
  objc_storeStrong((id *)&self->_subtitleKey, 0);
  objc_storeStrong((id *)&self->_titleKey, 0);
  objc_storeStrong((id *)&self->_referrerIdentifier, 0);
  objc_storeStrong((id *)&self->_appStoreAppIdentifier, 0);
  objc_storeStrong((id *)&self->_productIdentifiers, 0);
  objc_storeStrong((id *)&self->_transitNetworkIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedFeatureIdentifiers, 0);
  objc_storeStrong((id *)&self->_paymentNetworks, 0);
}

@end