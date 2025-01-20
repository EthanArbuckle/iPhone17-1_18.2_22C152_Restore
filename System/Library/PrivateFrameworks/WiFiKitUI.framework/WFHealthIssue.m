@interface WFHealthIssue
+ (id)healthIssueSortComparator;
+ (id)highestPriorityIssueFromIssues:(id)a3;
+ (id)issueWithType:(unint64_t)a3;
- (BOOL)chinaDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHealthIssue:(id)a3;
- (BOOL)overrideIssue;
- (BOOL)subtitleOnlyIssue;
- (NSString)issueDescription;
- (NSString)issueDetailText;
- (NSString)issueRecommendation;
- (NSString)issueShortTitle;
- (NSString)issueTitle;
- (NSString)typeString;
- (WFHealthIssue)initWithType:(unint64_t)a3;
- (id)_descriptionForType:(unint64_t)a3;
- (id)_recommendationForType:(unint64_t)a3;
- (id)_shortTitleForType:(unint64_t)a3;
- (id)_titleForType:(unint64_t)a3;
- (id)_typeStringForType:(unint64_t)a3;
- (id)description;
- (unint64_t)_categoryForType:(unint64_t)a3;
- (unint64_t)category;
- (unint64_t)type;
- (void)setCategory:(unint64_t)a3;
- (void)setChinaDevice:(BOOL)a3;
- (void)setIssueDescription:(id)a3;
- (void)setIssueRecommendation:(id)a3;
- (void)setIssueShortTitle:(id)a3;
- (void)setIssueTitle:(id)a3;
- (void)setOverrideIssue:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation WFHealthIssue

+ (id)issueWithType:(unint64_t)a3
{
  v3 = [[WFHealthIssue alloc] initWithType:a3];
  return v3;
}

- (WFHealthIssue)initWithType:(unint64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)WFHealthIssue;
  v4 = [(WFHealthIssue *)&v16 init];
  if (v4)
  {
    if (WFHasWAPICapability___uiWapiEnabledCapabilityToken != -1) {
      dispatch_once(&WFHasWAPICapability___uiWapiEnabledCapabilityToken, &__block_literal_global_319);
    }
    v4->_chinaDevice = WFHasWAPICapability___wapiCapability_0;
    v4->_type = a3;
    v4->_category = [(WFHealthIssue *)v4 _categoryForType:a3];
    uint64_t v5 = [(WFHealthIssue *)v4 _shortTitleForType:a3];
    issueShortTitle = v4->_issueShortTitle;
    v4->_issueShortTitle = (NSString *)v5;

    uint64_t v7 = [(WFHealthIssue *)v4 _titleForType:a3];
    issueTitle = v4->_issueTitle;
    v4->_issueTitle = (NSString *)v7;

    uint64_t v9 = [(WFHealthIssue *)v4 _descriptionForType:a3];
    issueDescription = v4->_issueDescription;
    v4->_issueDescription = (NSString *)v9;

    uint64_t v11 = [(WFHealthIssue *)v4 _recommendationForType:a3];
    issueRecommendation = v4->_issueRecommendation;
    v4->_issueRecommendation = (NSString *)v11;

    uint64_t v13 = [(WFHealthIssue *)v4 _typeStringForType:a3];
    typeString = v4->_typeString;
    v4->_typeString = (NSString *)v13;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  BOOL v6 = (!self || v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(WFHealthIssue *)self isEqualToHealthIssue:v5];

  return v6;
}

- (BOOL)isEqualToHealthIssue:(id)a3
{
  uint64_t v4 = [a3 type];
  return v4 == [(WFHealthIssue *)self type];
}

- (NSString)issueDetailText
{
  v3 = [MEMORY[0x263F089D8] string];
  uint64_t v4 = [(WFHealthIssue *)self issueDescription];

  if (v4)
  {
    uint64_t v5 = [(WFHealthIssue *)self issueDescription];
    [v3 appendString:v5];
  }
  BOOL v6 = [(WFHealthIssue *)self issueRecommendation];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v8 = [(WFHealthIssue *)self issueDescription];
    uint64_t v9 = [v8 length];

    if (v9) {
      [v3 appendString:@"\n\n"];
    }
    v10 = [(WFHealthIssue *)self issueRecommendation];
    [v3 appendString:v10];
  }
  return (NSString *)v3;
}

- (id)_shortTitleForType:(unint64_t)a3
{
  if (a3 == 512) {
    unint64_t v3 = 2;
  }
  else {
    unint64_t v3 = a3;
  }
  if (a3 == 256) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = v3;
  }
  uint64_t v5 = [(WFHealthIssue *)self _titleForType:v4];
  return v5;
}

- (id)_recommendationForType:(unint64_t)a3
{
  unint64_t v3 = 0;
  if ((uint64_t)a3 <= 511)
  {
    if ((uint64_t)a3 <= 31)
    {
      if ((uint64_t)a3 <= 7)
      {
        if (a3 != 2 && a3 != 4) {
          goto LABEL_44;
        }
        goto LABEL_26;
      }
      if (a3 == 8)
      {
        BOOL chinaDevice = self->_chinaDevice;
        uint64_t v5 = @"kWFLocNoSecurityRecommendation_CH";
        BOOL v6 = @"kWFLocNoSecurityRecommendation";
      }
      else
      {
        if (a3 != 16) {
          goto LABEL_44;
        }
        BOOL chinaDevice = self->_chinaDevice;
        uint64_t v5 = @"kWFLocLegacyRatesRecommendation_CH";
        BOOL v6 = @"kWFLocLegacyRatesRecommendation";
      }
LABEL_40:
      if (chinaDevice) {
        v8 = v5;
      }
      else {
        v8 = v6;
      }
      unint64_t v3 = v8;
      goto LABEL_44;
    }
    if ((uint64_t)a3 <= 127)
    {
      if (a3 == 32)
      {
        BOOL chinaDevice = self->_chinaDevice;
        uint64_t v5 = @"kWFLocAmbiguousNameRecommendation_CH";
        BOOL v6 = @"kWFLocAmbiguousNameRecommendation";
      }
      else
      {
        if (a3 != 64) {
          goto LABEL_44;
        }
        BOOL chinaDevice = self->_chinaDevice;
        uint64_t v5 = @"kWFLocHiddenNetworkRecommendation_CH";
        BOOL v6 = @"kWFLocHiddenNetworkRecommendation";
      }
      goto LABEL_40;
    }
    if (a3 == 128)
    {
      BOOL chinaDevice = self->_chinaDevice;
      uint64_t v5 = @"kWFLocOpenHiddenNetworkRecommendation_CH";
      BOOL v6 = @"kWFLocOpenHiddenNetworkRecommendation";
      goto LABEL_40;
    }
    if (a3 != 256) {
      goto LABEL_44;
    }
    goto LABEL_29;
  }
  if ((uint64_t)a3 >= 0x2000)
  {
    if ((uint64_t)a3 < 0x40000)
    {
      if (a3 != 0x2000)
      {
        if (a3 != 0x8000) {
          goto LABEL_44;
        }
        BOOL chinaDevice = self->_chinaDevice;
        uint64_t v5 = @"kWFLocNoInternetWithPrivateMACRecommendation_CH";
        BOOL v6 = @"kWFLocNoInternetWithPrivateMACRecommendation";
        goto LABEL_40;
      }
LABEL_29:
      BOOL chinaDevice = self->_chinaDevice;
      uint64_t v5 = @"kWFLocWPAHiddenNetworkRecommendation_CH";
      BOOL v6 = @"kWFLocWPAHiddenNetworkRecommendation";
      goto LABEL_40;
    }
    uint64_t v7 = @"kWFLocIMSIExposureNetworkRecommendation";
    if (a3 != 0x80000) {
      uint64_t v7 = 0;
    }
    if (a3 == 0x40000) {
      unint64_t v3 = @"kWFLocIMSIExposureNetworkRecommendation";
    }
    else {
      unint64_t v3 = v7;
    }
  }
  else
  {
    if ((uint64_t)a3 > 2047)
    {
      if (a3 == 2048)
      {
        unint64_t v3 = @"kWFLocDNSFilteredNetworkRecommendation";
        goto LABEL_44;
      }
      if (a3 != 4096) {
        goto LABEL_44;
      }
LABEL_26:
      BOOL chinaDevice = self->_chinaDevice;
      uint64_t v5 = @"kWFLocWeakSecurityRecommendation_CH";
      BOOL v6 = @"kWFLocWeakSecurityRecommendation";
      goto LABEL_40;
    }
    if (a3 == 512)
    {
      BOOL chinaDevice = self->_chinaDevice;
      uint64_t v5 = @"kWFLocWEPHiddenNetworkRecommendation_CH";
      BOOL v6 = @"kWFLocWEPHiddenNetworkRecommendation";
      goto LABEL_40;
    }
    if (a3 == 1024) {
      unint64_t v3 = @"kWFLocIMSIExposureNetworkRecommendation";
    }
    else {
      unint64_t v3 = 0;
    }
  }
LABEL_44:
  uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:v3 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v10;
}

- (id)_descriptionForType:(unint64_t)a3
{
  unint64_t v3 = 0;
  if ((uint64_t)a3 > 511)
  {
    if ((uint64_t)a3 >= 0x2000)
    {
      if ((uint64_t)a3 >= 0x40000)
      {
        if (a3 == 0x40000)
        {
          uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v5 = v4;
          BOOL v6 = @"kWFLocWeakSecurityNoTLSTrustedServerNamesDescription";
        }
        else
        {
          if (a3 != 0x80000) {
            goto LABEL_42;
          }
          uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v5 = v4;
          BOOL v6 = @"kWFLocWeakSecurityNoPayloadCertificateAnchorUUIDDescription";
        }
      }
      else
      {
        if (a3 != 0x2000)
        {
          if (a3 != 0x8000) {
            goto LABEL_42;
          }
LABEL_17:
          if (self->_chinaDevice) {
            uint64_t v7 = @"kWFLocNoInternetDescription_CH";
          }
          else {
            uint64_t v7 = @"kWFLocNoInternetDescription";
          }
          v8 = (void *)MEMORY[0x263F086E0];
          uint64_t v9 = v7;
          uint64_t v5 = [v8 bundleForClass:objc_opt_class()];
          unint64_t v3 = [v5 localizedStringForKey:v9 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

          goto LABEL_41;
        }
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocWPATKIPHiddenNetworkDescription";
      }
    }
    else if ((uint64_t)a3 > 2047)
    {
      if (a3 == 2048)
      {
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocDNSFilteredNetworkDescription";
      }
      else
      {
        if (a3 != 4096) {
          goto LABEL_42;
        }
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocWeakSecurityWPATKIPDescription";
      }
    }
    else if (a3 == 512)
    {
      uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      BOOL v6 = @"kWFLocWEPHiddenNetworkDescription";
    }
    else
    {
      if (a3 != 1024) {
        goto LABEL_42;
      }
      uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      BOOL v6 = @"kWFLocIMSIExposureNetworkDescription";
    }
  }
  else if ((uint64_t)a3 > 31)
  {
    if ((uint64_t)a3 > 127)
    {
      if (a3 == 128)
      {
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocOpenHiddenNetworkDescription";
      }
      else
      {
        if (a3 != 256) {
          goto LABEL_42;
        }
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocWPAHiddenNetworkDescription";
      }
    }
    else if (a3 == 32)
    {
      uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      BOOL v6 = @"kWFLocAmbiguousNameDescription";
    }
    else
    {
      if (a3 != 64) {
        goto LABEL_42;
      }
      uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      BOOL v6 = @"kWFLocHiddenNetworkDescription";
    }
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        goto LABEL_17;
      case 2uLL:
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocWeakSecurityWEPDescription";
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        goto LABEL_42;
      case 4uLL:
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocWeakSecurityWPADescription";
        break;
      case 8uLL:
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocNoSecurityDescription";
        break;
      default:
        if (a3 != 16) {
          goto LABEL_42;
        }
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocLegacyRatesDescription";
        break;
    }
  }
  unint64_t v3 = [v4 localizedStringForKey:v6 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
LABEL_41:

LABEL_42:
  return v3;
}

- (id)_titleForType:(unint64_t)a3
{
  unint64_t v3 = 0;
  if ((uint64_t)a3 <= 511)
  {
    if ((uint64_t)a3 <= 31)
    {
      switch(a3)
      {
        case 1uLL:
          goto LABEL_17;
        case 2uLL:
        case 4uLL:
          goto LABEL_26;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          goto LABEL_28;
        case 8uLL:
          uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v5 = v4;
          BOOL v6 = @"kWFLocNoSecurityTitle";
          goto LABEL_27;
        default:
          if (a3 != 16) {
            goto LABEL_28;
          }
          uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v5 = v4;
          BOOL v6 = @"kWFLocLegacyRatesTitle";
          break;
      }
      goto LABEL_27;
    }
    if ((uint64_t)a3 <= 127)
    {
      if (a3 == 32)
      {
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocAmbiguousNameTitle";
      }
      else
      {
        if (a3 != 64) {
          goto LABEL_28;
        }
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocHiddenNetworkTitle";
      }
      goto LABEL_27;
    }
    if (a3 == 128)
    {
      uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      BOOL v6 = @"kWFLocOpenHiddenNetworkTitle";
      goto LABEL_27;
    }
    if (a3 != 256) {
      goto LABEL_28;
    }
    goto LABEL_23;
  }
  if ((uint64_t)a3 < 0x2000)
  {
    if ((uint64_t)a3 <= 2047)
    {
      if (a3 == 512)
      {
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocWEPHiddenNetworkTitle";
      }
      else
      {
        if (a3 != 1024) {
          goto LABEL_28;
        }
        uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v5 = v4;
        BOOL v6 = @"kWFLocIMSIExposureNetworkTitle";
      }
      goto LABEL_27;
    }
    if (a3 == 2048)
    {
      uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      BOOL v6 = @"kWFLocDNSFilteredNetworkTitle";
      goto LABEL_27;
    }
    if (a3 != 4096) {
      goto LABEL_28;
    }
LABEL_26:
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    BOOL v6 = @"kWFLocWeakSecurityTitle";
    goto LABEL_27;
  }
  if ((uint64_t)a3 < 0x40000)
  {
    if (a3 != 0x2000)
    {
      if (a3 != 0x8000) {
        goto LABEL_28;
      }
LABEL_17:
      uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v5 = v4;
      BOOL v6 = @"kWFLocNoInternetTitle";
      goto LABEL_27;
    }
LABEL_23:
    uint64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v5 = v4;
    BOOL v6 = @"kWFLocWPAHiddenNetworkTitle";
LABEL_27:
    unint64_t v3 = [v4 localizedStringForKey:v6 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

    goto LABEL_28;
  }
  if (a3 == 0x40000 || a3 == 0x80000) {
    goto LABEL_26;
  }
LABEL_28:
  return v3;
}

- (unint64_t)_categoryForType:(unint64_t)a3
{
  unint64_t result = 0;
  if ((uint64_t)a3 > 1023)
  {
    if ((uint64_t)a3 >= 0x4000)
    {
      if ((uint64_t)a3 >= 0x40000)
      {
        if (a3 == 0x80000 || a3 == 0x40000) {
          return 1;
        }
        return result;
      }
      if (a3 != 0x4000)
      {
        if (a3 != 0x20000) {
          return result;
        }
        return 3;
      }
    }
    else
    {
      if ((uint64_t)a3 > 4095)
      {
        if (a3 == 4096 || a3 == 0x2000) {
          return 1;
        }
        return result;
      }
      if (a3 != 1024 && a3 != 2048) {
        return result;
      }
    }
    return 2;
  }
  if ((uint64_t)a3 <= 127)
  {
    char v4 = a3 - 2;
    if (a3 - 2 > 0x3E) {
      return result;
    }
    if (((1 << v4) & 0x4000000000000045) == 0)
    {
      if (((1 << v4) & 0x40004000) == 0) {
        return result;
      }
      return 3;
    }
    return 1;
  }
  if (a3 == 128 || a3 == 256 || a3 == 512) {
    return 1;
  }
  return result;
}

- (id)_typeStringForType:(unint64_t)a3
{
  if ((uint64_t)a3 > 1023)
  {
    char v4 = @"limit-network";
    uint64_t v5 = @"no-tls-trusted-server-names";
    BOOL v6 = @"no-payload-certificate-anchor-uuid";
    if (a3 != 0x80000) {
      BOOL v6 = 0;
    }
    if (a3 != 0x40000) {
      uint64_t v5 = v6;
    }
    if (a3 != 0x20000) {
      char v4 = v5;
    }
    uint64_t v7 = @"no-internet-private-address";
    v8 = @"cellular-outrank";
    if (a3 != 0x10000) {
      v8 = 0;
    }
    if (a3 != 0x8000) {
      uint64_t v7 = v8;
    }
    if ((uint64_t)a3 < 0x20000) {
      char v4 = v7;
    }
    uint64_t v9 = @"weak-wpa-tkip";
    v10 = @"hidden-wpa-tkip-network";
    uint64_t v11 = @"private-address-disabled";
    if (a3 != 0x4000) {
      uint64_t v11 = 0;
    }
    if (a3 != 0x2000) {
      v10 = v11;
    }
    if (a3 != 4096) {
      uint64_t v9 = v10;
    }
    v12 = @"carrier-imsi";
    uint64_t v13 = @"dns-filtered";
    if (a3 != 2048) {
      uint64_t v13 = 0;
    }
    if (a3 != 1024) {
      v12 = v13;
    }
    if ((uint64_t)a3 <= 4095) {
      uint64_t v9 = v12;
    }
    if ((uint64_t)a3 < 0x8000) {
      return v9;
    }
    else {
      return v4;
    }
  }
  else if ((uint64_t)a3 > 31)
  {
    v14 = @"hidden-open-network";
    v15 = @"hidden-wpa-network";
    objc_super v16 = @"hidden-wep-network";
    if (a3 != 512) {
      objc_super v16 = 0;
    }
    if (a3 != 256) {
      v15 = v16;
    }
    if (a3 != 128) {
      v14 = v15;
    }
    v17 = @"common-ssid";
    v18 = @"hidden-network";
    if (a3 != 64) {
      v18 = 0;
    }
    if (a3 != 32) {
      v17 = v18;
    }
    if ((uint64_t)a3 <= 127) {
      return v17;
    }
    else {
      return v14;
    }
  }
  else
  {
    id result = 0;
    switch(a3)
    {
      case 1uLL:
        id result = @"no-internet";
        break;
      case 2uLL:
        id result = @"weak-wep";
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return result;
      case 4uLL:
        id result = @"weak-wpa";
        break;
      case 8uLL:
        id result = @"weak-open";
        break;
      default:
        if (a3 == 16) {
          id result = @"legacy-rates";
        }
        else {
          id result = 0;
        }
        break;
    }
  }
  return result;
}

- (id)description
{
  unint64_t v3 = (void *)MEMORY[0x263F089D8];
  char v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  BOOL v6 = [(WFHealthIssue *)self typeString];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ : %p type='%@' code=%lu", v5, self, v6, -[WFHealthIssue type](self, "type")];

  if ([(WFHealthIssue *)self overrideIssue]) {
    [v7 appendString:@" override=1"];
  }
  v8 = [(WFHealthIssue *)self issueTitle];
  [v7 appendFormat:@" title='%@'", v8];

  uint64_t v9 = [(WFHealthIssue *)self issueDescription];

  if (v9)
  {
    v10 = [(WFHealthIssue *)self issueDescription];
    [v7 appendFormat:@" description='%@'", v10];
  }
  uint64_t v11 = [(WFHealthIssue *)self issueRecommendation];
  if (v11)
  {
    v12 = (void *)v11;
    uint64_t v13 = [(WFHealthIssue *)self issueRecommendation];
    uint64_t v14 = [v13 length];

    if (v14)
    {
      v15 = [(WFHealthIssue *)self issueRecommendation];
      [v7 appendFormat:@" recommendation='%@'", v15];
    }
  }
  [v7 appendString:@">"];
  return v7;
}

- (void)setOverrideIssue:(BOOL)a3
{
  BOOL v3 = a3;
  self->_overrideIssue = a3;
  uint64_t v5 = [(WFHealthIssue *)self _typeStringForType:[(WFHealthIssue *)self type]];
  if (v3)
  {
    uint64_t v9 = v5;
    BOOL v6 = [(NSString *)v5 stringByAppendingFormat:@"-OVERRIDE"];
    typeString = self->_typeString;
    self->_typeString = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_typeString;
    self->_typeString = v5;
  }
}

+ (id)healthIssueSortComparator
{
  return &__block_literal_global_1;
}

uint64_t __42__WFHealthIssue_healthIssueSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 category];
  if (v6 < [v5 category]) {
    goto LABEL_4;
  }
  unint64_t v7 = [v4 category];
  if (v7 > [v5 category]) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_4:
    uint64_t v8 = -1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_6:
    uint64_t v8 = 1;
    goto LABEL_7;
  }
  unint64_t v10 = [v4 type];
  if (v10 > [v5 type]) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = -1;
  }
LABEL_7:

  return v8;
}

+ (id)highestPriorityIssueFromIssues:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    if ((unint64_t)[v4 count] <= 1)
    {
      unint64_t v7 = [v4 firstObject];
    }
    else
    {
      id v5 = +[WFHealthIssue healthIssueSortComparator];
      unint64_t v6 = [v4 sortedArrayUsingComparator:v5];
      unint64_t v7 = [v6 firstObject];
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSString)issueShortTitle
{
  return self->_issueShortTitle;
}

- (void)setIssueShortTitle:(id)a3
{
}

- (NSString)issueTitle
{
  return self->_issueTitle;
}

- (void)setIssueTitle:(id)a3
{
}

- (NSString)issueDescription
{
  return self->_issueDescription;
}

- (void)setIssueDescription:(id)a3
{
}

- (NSString)issueRecommendation
{
  return self->_issueRecommendation;
}

- (void)setIssueRecommendation:(id)a3
{
}

- (NSString)typeString
{
  return self->_typeString;
}

- (BOOL)overrideIssue
{
  return self->_overrideIssue;
}

- (BOOL)subtitleOnlyIssue
{
  return self->_subtitleOnlyIssue;
}

- (BOOL)chinaDevice
{
  return self->_chinaDevice;
}

- (void)setChinaDevice:(BOOL)a3
{
  self->_BOOL chinaDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_issueRecommendation, 0);
  objc_storeStrong((id *)&self->_issueDescription, 0);
  objc_storeStrong((id *)&self->_issueTitle, 0);
  objc_storeStrong((id *)&self->_issueShortTitle, 0);
}

@end