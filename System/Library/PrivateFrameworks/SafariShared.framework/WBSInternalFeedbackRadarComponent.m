@interface WBSInternalFeedbackRadarComponent
+ (WBSInternalFeedbackRadarComponent)safariAutoFill;
+ (WBSInternalFeedbackRadarComponent)safariIOS;
+ (WBSInternalFeedbackRadarComponent)safariNewBugs;
+ (WBSInternalFeedbackRadarComponent)safariStartPageIOS;
+ (WBSInternalFeedbackRadarComponent)safariStartPageMacOS;
- (NSString)identifier;
- (NSString)name;
- (NSString)version;
- (WBSInternalFeedbackRadarComponent)initWithIdentifier:(id)a3 name:(id)a4 version:(id)a5;
@end

@implementation WBSInternalFeedbackRadarComponent

+ (WBSInternalFeedbackRadarComponent)safariAutoFill
{
  if (safariAutoFill_onceToken != -1) {
    dispatch_once(&safariAutoFill_onceToken, &__block_literal_global_76);
  }
  v2 = (void *)safariAutoFill_component;
  return (WBSInternalFeedbackRadarComponent *)v2;
}

void __51__WBSInternalFeedbackRadarComponent_safariAutoFill__block_invoke()
{
  v0 = [[WBSInternalFeedbackRadarComponent alloc] initWithIdentifier:@"1549076" name:@"Safari AutoFill" version:@"All"];
  v1 = (void *)safariAutoFill_component;
  safariAutoFill_component = (uint64_t)v0;
}

+ (WBSInternalFeedbackRadarComponent)safariIOS
{
  if (safariIOS_onceToken != -1) {
    dispatch_once(&safariIOS_onceToken, &__block_literal_global_9_2);
  }
  v2 = (void *)safariIOS_component;
  return (WBSInternalFeedbackRadarComponent *)v2;
}

void __46__WBSInternalFeedbackRadarComponent_safariIOS__block_invoke()
{
  v0 = [[WBSInternalFeedbackRadarComponent alloc] initWithIdentifier:@"224849" name:@"Safari" version:@"iOS"];
  v1 = (void *)safariIOS_component;
  safariIOS_component = (uint64_t)v0;
}

+ (WBSInternalFeedbackRadarComponent)safariNewBugs
{
  if (safariNewBugs_onceToken != -1) {
    dispatch_once(&safariNewBugs_onceToken, &__block_literal_global_20_0);
  }
  v2 = (void *)safariNewBugs_component;
  return (WBSInternalFeedbackRadarComponent *)v2;
}

void __50__WBSInternalFeedbackRadarComponent_safariNewBugs__block_invoke()
{
  v0 = [[WBSInternalFeedbackRadarComponent alloc] initWithIdentifier:@"144485" name:@"Safari" version:@"(New Bugs)"];
  v1 = (void *)safariNewBugs_component;
  safariNewBugs_component = (uint64_t)v0;
}

+ (WBSInternalFeedbackRadarComponent)safariStartPageIOS
{
  if (safariStartPageIOS_onceToken != -1) {
    dispatch_once(&safariStartPageIOS_onceToken, &__block_literal_global_28_0);
  }
  v2 = (void *)safariStartPageIOS_component;
  return (WBSInternalFeedbackRadarComponent *)v2;
}

void __55__WBSInternalFeedbackRadarComponent_safariStartPageIOS__block_invoke()
{
  v0 = [[WBSInternalFeedbackRadarComponent alloc] initWithIdentifier:@"1175764" name:@"Safari Start Page" version:@"iOS"];
  v1 = (void *)safariStartPageIOS_component;
  safariStartPageIOS_component = (uint64_t)v0;
}

+ (WBSInternalFeedbackRadarComponent)safariStartPageMacOS
{
  if (safariStartPageMacOS_onceToken != -1) {
    dispatch_once(&safariStartPageMacOS_onceToken, &__block_literal_global_36_0);
  }
  v2 = (void *)safariStartPageMacOS_component;
  return (WBSInternalFeedbackRadarComponent *)v2;
}

void __57__WBSInternalFeedbackRadarComponent_safariStartPageMacOS__block_invoke()
{
  v0 = [[WBSInternalFeedbackRadarComponent alloc] initWithIdentifier:@"567407" name:@"Safari Start Page" version:@"macOS"];
  v1 = (void *)safariStartPageMacOS_component;
  safariStartPageMacOS_component = (uint64_t)v0;
}

- (WBSInternalFeedbackRadarComponent)initWithIdentifier:(id)a3 name:(id)a4 version:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSInternalFeedbackRadarComponent;
  v11 = [(WBSInternalFeedbackRadarComponent *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    version = v11->_version;
    v11->_version = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end