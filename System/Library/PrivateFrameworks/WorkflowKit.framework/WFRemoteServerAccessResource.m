@interface WFRemoteServerAccessResource
+ (BOOL)isSystemResource;
- (WFRemoteServerAccessResource)init;
- (id)icon;
- (id)name;
- (unint64_t)status;
@end

@implementation WFRemoteServerAccessResource

- (unint64_t)status
{
  return 4;
}

- (id)icon
{
  return (id)[MEMORY[0x1E4FB4770] workflowKitImageNamed:@"Network"];
}

- (id)name
{
  return WFLocalizedString(@"Internet");
}

- (WFRemoteServerAccessResource)init
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11 = @"WFResourceClass";
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v12[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v10.receiver = self;
  v10.super_class = (Class)WFRemoteServerAccessResource;
  v6 = [(WFAccessResource *)&v10 initWithDefinition:v5];
  v7 = v6;
  if (v6) {
    v8 = v6;
  }

  return v7;
}

+ (BOOL)isSystemResource
{
  return 1;
}

@end