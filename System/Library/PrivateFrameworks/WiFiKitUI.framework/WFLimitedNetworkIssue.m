@interface WFLimitedNetworkIssue
+ (id)limitedNetwork;
+ (id)limitedNetwork_CH;
- (BOOL)subtitleOnlyIssue;
- (WFLimitedNetworkIssue)initWithChinaDevice:(BOOL)a3;
- (id)_RecommendationForChinaDevice:(BOOL)a3;
- (id)issueDescription;
- (id)issueRecommendation;
- (id)issueShortTitle;
- (id)issueTitle;
- (id)typeString;
@end

@implementation WFLimitedNetworkIssue

+ (id)limitedNetwork
{
  v2 = [[WFLimitedNetworkIssue alloc] initWithChinaDevice:0];
  return v2;
}

+ (id)limitedNetwork_CH
{
  v2 = [[WFLimitedNetworkIssue alloc] initWithChinaDevice:1];
  return v2;
}

- (WFLimitedNetworkIssue)initWithChinaDevice:(BOOL)a3
{
  BOOL v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFLimitedNetworkIssue;
  v4 = [(WFHealthIssue *)&v18 initWithType:0x20000];
  v5 = v4;
  if (v4)
  {
    v4->_subtitleOnlyIssue = 0;
    v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"kWFLocLimitNetworkTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings-WIFI_6E"];
    issueTitle = v5->_issueTitle;
    v5->_issueTitle = (NSString *)v7;

    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"kWFLocLimitNetworkTitle" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings-WIFI_6E"];
    issueShortTitle = v5->_issueShortTitle;
    v5->_issueShortTitle = (NSString *)v10;

    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"kWFLocLimitNetworkDescription" value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings-WIFI_6E"];
    issueDescription = v5->_issueDescription;
    v5->_issueDescription = (NSString *)v13;

    uint64_t v15 = [(WFLimitedNetworkIssue *)v5 _RecommendationForChinaDevice:v3];
    issueRecommendation = v5->_issueRecommendation;
    v5->_issueRecommendation = (NSString *)v15;
  }
  return v5;
}

- (id)_RecommendationForChinaDevice:(BOOL)a3
{
  BOOL v3 = @"kWFLocLimitNetworkRecommendation";
  if (a3)
  {
    BOOL v3 = [NSString stringWithFormat:@"%@_CH", @"kWFLocLimitNetworkRecommendation"];
  }
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:v3 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings-WIFI_6E"];

  return v5;
}

- (BOOL)subtitleOnlyIssue
{
  return self->_subtitleOnlyIssue;
}

- (id)issueShortTitle
{
  return self->_issueShortTitle;
}

- (id)typeString
{
  return self->_typeString;
}

- (id)issueTitle
{
  return self->_issueTitle;
}

- (id)issueRecommendation
{
  return self->_issueRecommendation;
}

- (id)issueDescription
{
  return self->_issueDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueDescription, 0);
  objc_storeStrong((id *)&self->_issueRecommendation, 0);
  objc_storeStrong((id *)&self->_issueTitle, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_issueShortTitle, 0);
}

@end