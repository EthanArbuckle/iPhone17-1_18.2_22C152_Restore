@interface WFPrivacyIssue
+ (id)carrierNetworkIssue;
+ (id)dnsFilteredNetworkIssue;
+ (id)privateAddressDisabledByCarrierIssueWithCarrierName:(id)a3;
+ (id)privateAddressDisabledByProfileIssueWithOrganizationName:(id)a3 profileName:(id)a4 profileUUID:(id)a5;
+ (id)privateAddressDisabledBySystemIssue;
+ (id)privateAddressDisabledByUserIssue;
- (WFPrivacyIssue)initWithPrivacyType:(unint64_t)a3 organizationName:(id)a4 profileName:(id)a5 profileUUID:(id)a6;
- (id)_descriptionForSubType:(unint64_t)a3 organizationName:(id)a4 profileName:(id)a5;
- (id)_privateAddressTypeToString:(unint64_t)a3;
- (id)_recommendationForSubType:(unint64_t)a3 organizationName:(id)a4;
- (id)_titleForSubType:(unint64_t)a3;
- (id)issueDescription;
- (id)issueRecommendation;
- (id)issueShortTitle;
- (id)issueTitle;
- (id)typeString;
- (unint64_t)_healthIssueTypeForSubType:(unint64_t)a3;
@end

@implementation WFPrivacyIssue

+ (id)privateAddressDisabledByUserIssue
{
  v2 = [[WFPrivacyIssue alloc] initWithPrivacyType:8 organizationName:0 profileName:0 profileUUID:0];
  return v2;
}

+ (id)privateAddressDisabledBySystemIssue
{
  v2 = [[WFPrivacyIssue alloc] initWithPrivacyType:1 organizationName:0 profileName:0 profileUUID:0];
  return v2;
}

+ (id)privateAddressDisabledByCarrierIssueWithCarrierName:(id)a3
{
  id v3 = a3;
  v4 = [[WFPrivacyIssue alloc] initWithPrivacyType:2 organizationName:v3 profileName:0 profileUUID:0];

  return v4;
}

+ (id)privateAddressDisabledByProfileIssueWithOrganizationName:(id)a3 profileName:(id)a4 profileUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[WFPrivacyIssue alloc] initWithPrivacyType:4 organizationName:v9 profileName:v8 profileUUID:v7];

  return v10;
}

+ (id)carrierNetworkIssue
{
  v2 = [(WFHealthIssue *)[WFPrivacyIssue alloc] initWithType:1024];
  return v2;
}

+ (id)dnsFilteredNetworkIssue
{
  v2 = [(WFHealthIssue *)[WFPrivacyIssue alloc] initWithType:2048];
  return v2;
}

- (WFPrivacyIssue)initWithPrivacyType:(unint64_t)a3 organizationName:(id)a4 profileName:(id)a5 profileUUID:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)WFPrivacyIssue;
  v11 = [(WFHealthIssue *)&v24 initWithType:0x4000];
  v12 = v11;
  if (v11)
  {
    uint64_t v13 = [(WFPrivacyIssue *)v11 _titleForSubType:a3];
    issueShortTitle = v12->_issueShortTitle;
    v12->_issueShortTitle = (NSString *)v13;

    uint64_t v15 = [(WFPrivacyIssue *)v12 _titleForSubType:a3];
    issueTitle = v12->_issueTitle;
    v12->_issueTitle = (NSString *)v15;

    uint64_t v17 = [(WFPrivacyIssue *)v12 _descriptionForSubType:a3 organizationName:v9 profileName:v10];
    issueDescription = v12->_issueDescription;
    v12->_issueDescription = (NSString *)v17;

    uint64_t v19 = [(WFPrivacyIssue *)v12 _recommendationForSubType:a3 organizationName:v9];
    issueRecommendation = v12->_issueRecommendation;
    v12->_issueRecommendation = (NSString *)v19;

    uint64_t v21 = [(WFPrivacyIssue *)v12 _privateAddressTypeToString:a3];
    typeString = v12->_typeString;
    v12->_typeString = (NSString *)v21;
  }
  return v12;
}

- (id)issueShortTitle
{
  issueShortTitle = self->_issueShortTitle;
  if (issueShortTitle)
  {
    id v3 = issueShortTitle;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WFPrivacyIssue;
    id v3 = [(WFHealthIssue *)&v5 issueShortTitle];
  }
  return v3;
}

- (id)issueTitle
{
  issueTitle = self->_issueTitle;
  if (issueTitle)
  {
    id v3 = issueTitle;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WFPrivacyIssue;
    id v3 = [(WFHealthIssue *)&v5 issueTitle];
  }
  return v3;
}

- (id)issueDescription
{
  issueDescription = self->_issueDescription;
  if (issueDescription)
  {
    id v3 = issueDescription;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WFPrivacyIssue;
    id v3 = [(WFHealthIssue *)&v5 issueDescription];
  }
  return v3;
}

- (id)issueRecommendation
{
  issueRecommendation = self->_issueRecommendation;
  if (issueRecommendation)
  {
    id v3 = issueRecommendation;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WFPrivacyIssue;
    id v3 = [(WFHealthIssue *)&v5 issueRecommendation];
  }
  return v3;
}

- (id)_titleForSubType:(unint64_t)a3
{
  if (a3 == 1) {
    id v3 = @"kWFLocPrivateAddressDisabledBySystemTitle";
  }
  else {
    id v3 = @"kWFLocPrivateAddressDisabledByOthersTitle";
  }
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 localizedStringForKey:v3 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v5;
}

- (id)_descriptionForSubType:(unint64_t)a3 organizationName:(id)a4 profileName:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  v11 = 0;
  switch(a3)
  {
    case 1uLL:
    case 8uLL:
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      BOOL v13 = [(WFHealthIssue *)self chinaDevice];
      v14 = @"kWFLocPrivateAddressDisabledByGenericDescription";
      uint64_t v15 = @"kWFLocPrivateAddressDisabledByGenericDescription_CH";
      goto LABEL_21;
    case 2uLL:
      if (!v8 || ![v8 length]) {
        goto LABEL_20;
      }
      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      BOOL v17 = [(WFHealthIssue *)self chinaDevice];
      v18 = @"kWFLocPrivateAddressDisabledByCarrierDescription";
      uint64_t v19 = @"kWFLocPrivateAddressDisabledByCarrierDescription_CH";
      goto LABEL_15;
    case 4uLL:
      if (v9 && [v9 length])
      {
        v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if ([(WFHealthIssue *)self chinaDevice]) {
          uint64_t v21 = @"kWFLocPrivateAddressDisabledByProfileDescription_CH";
        }
        else {
          uint64_t v21 = @"kWFLocPrivateAddressDisabledByProfileDescription";
        }
        v12 = [v20 localizedStringForKey:v21 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

        objc_msgSend(NSString, "stringWithFormat:", v12, v10);
        uint64_t v23 = LABEL_19:;
        goto LABEL_25;
      }
      if (v8 && [v8 length])
      {
        v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        BOOL v17 = [(WFHealthIssue *)self chinaDevice];
        v18 = @"kWFLocPrivateAddressDisabledByProfileDescription";
        uint64_t v19 = @"kWFLocPrivateAddressDisabledByProfileDescription_CH";
LABEL_15:
        if (v17) {
          v22 = v19;
        }
        else {
          v22 = v18;
        }
        v12 = [v16 localizedStringForKey:v22 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

        objc_msgSend(NSString, "stringWithFormat:", v12, v8);
        goto LABEL_19;
      }
LABEL_20:
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      BOOL v13 = [(WFHealthIssue *)self chinaDevice];
      v14 = @"kWFLocPrivateAddressDisabledByOtherGenericDescription";
      uint64_t v15 = @"kWFLocPrivateAddressDisabledByOtherGenericDescription_CH";
LABEL_21:
      if (v13) {
        objc_super v24 = v15;
      }
      else {
        objc_super v24 = v14;
      }
      uint64_t v23 = [v12 localizedStringForKey:v24 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];
LABEL_25:
      v11 = (void *)v23;

LABEL_26:
      return v11;
    default:
      goto LABEL_26;
  }
}

- (id)_recommendationForSubType:(unint64_t)a3 organizationName:(id)a4
{
  if ([(WFHealthIssue *)self chinaDevice])
  {
    v4 = [@"kWFLocPrivateAddressDisabledByAllRecommendation" stringByAppendingString:@"_CH"];
  }
  else
  {
    v4 = @"kWFLocPrivateAddressDisabledByAllRecommendation";
  }
  objc_super v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:v4 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v6;
}

- (unint64_t)_healthIssueTypeForSubType:(unint64_t)a3
{
  return 0x4000;
}

- (id)_privateAddressTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return 0;
  }
  else {
    return off_264756818[a3 - 1];
  }
}

- (id)typeString
{
  return self->_typeString;
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