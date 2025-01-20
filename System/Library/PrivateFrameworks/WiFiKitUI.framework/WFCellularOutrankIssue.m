@interface WFCellularOutrankIssue
+ (id)cellularOutrankDownload;
+ (id)cellularOutrankPerformance;
+ (id)cellularOutrankPrivateNetwork;
+ (id)cellularOutrankSecurity;
- (BOOL)subtitleOnlyIssue;
- (WFCellularOutrankIssue)initWithSubType:(unint64_t)a3;
- (id)_cellularOutrankSubTypeToString:(unint64_t)a3;
- (id)_titleForSubType:(unint64_t)a3;
- (id)issueShortTitle;
- (id)issueTitle;
- (id)typeString;
@end

@implementation WFCellularOutrankIssue

+ (id)cellularOutrankSecurity
{
  v2 = [[WFCellularOutrankIssue alloc] initWithSubType:1];
  return v2;
}

+ (id)cellularOutrankDownload
{
  v2 = [[WFCellularOutrankIssue alloc] initWithSubType:2];
  return v2;
}

+ (id)cellularOutrankPerformance
{
  v2 = [[WFCellularOutrankIssue alloc] initWithSubType:4];
  return v2;
}

+ (id)cellularOutrankPrivateNetwork
{
  v2 = [[WFCellularOutrankIssue alloc] initWithSubType:8];
  return v2;
}

- (WFCellularOutrankIssue)initWithSubType:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WFCellularOutrankIssue;
  v4 = [(WFHealthIssue *)&v11 initWithType:0x10000];
  v5 = v4;
  if (v4)
  {
    v4->_subtitleOnlyIssue = 1;
    uint64_t v6 = [(WFCellularOutrankIssue *)v4 _titleForSubType:a3];
    issueShortTitle = v5->_issueShortTitle;
    v5->_issueShortTitle = (NSString *)v6;

    objc_storeStrong((id *)&v5->_issueTitle, v5->_issueShortTitle);
    uint64_t v8 = [(WFCellularOutrankIssue *)v5 _cellularOutrankSubTypeToString:a3];
    typeString = v5->_typeString;
    v5->_typeString = (NSString *)v8;
  }
  return v5;
}

- (id)_titleForSubType:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    v3 = 0;
  }
  else {
    v3 = off_264756798[a3 - 1];
  }
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:v3 value:&stru_26D8F6070 table:@"WiFiKitUILocalizableStrings"];

  return v5;
}

- (id)_cellularOutrankSubTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return 0;
  }
  else {
    return off_2647567D8[a3 - 1];
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueTitle, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_issueShortTitle, 0);
}

@end