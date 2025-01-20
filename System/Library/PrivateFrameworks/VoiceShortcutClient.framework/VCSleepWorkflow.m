@interface VCSleepWorkflow
+ (BOOL)supportsSecureCoding;
- (NSArray)actions;
- (NSString)bundleIdentifierForDisplay;
- (NSString)name;
- (NSString)summaryString;
- (VCSleepWorkflow)initWithActions:(id)a3;
- (VCSleepWorkflow)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VCSleepWorkflow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryString, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (NSString)summaryString
{
  return self->_summaryString;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)actions
{
  return self->_actions;
}

- (VCSleepWorkflow)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  v11 = [v5 decodeObjectOfClasses:v10 forKey:@"actions"];

  if (v11)
  {
    self = [(VCSleepWorkflow *)self initWithActions:v11];
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(VCSleepWorkflow *)self actions];
  [v4 encodeObject:v5 forKey:@"actions"];

  uint64_t v6 = [(VCSleepWorkflow *)self bundleIdentifierForDisplay];
  [v4 encodeObject:v6 forKey:@"bundleIdentifierForDisplay"];

  id v7 = [(VCSleepWorkflow *)self summaryString];
  [v4 encodeObject:v7 forKey:@"summaryString"];
}

- (NSString)bundleIdentifierForDisplay
{
  v3 = [(VCSleepWorkflow *)self actions];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    id v5 = [(VCSleepWorkflow *)self actions];
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = [v6 bundleIdentifierForDisplay];
    uint64_t v8 = (void *)v7;
    uint64_t v9 = @"com.apple.shortcuts";
    if (v7) {
      uint64_t v9 = (__CFString *)v7;
    }
    v10 = v9;
  }
  else
  {
    v10 = @"com.apple.shortcuts";
    v11 = @"com.apple.shortcuts";
  }
  return (NSString *)v10;
}

- (VCSleepWorkflow)initWithActions:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VCSleepWorkflow;
  id v5 = [(VCSleepWorkflow *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    actions = v5->_actions;
    v5->_actions = (NSArray *)v6;

    uint64_t v8 = [v4 firstObject];
    uint64_t v9 = [v8 title];
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      WFLocalizedString(@"New Shortcut");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    name = v5->_name;
    v5->_name = v11;

    v13 = [v4 firstObject];
    uint64_t v14 = [v13 subtitle];
    v15 = (void *)v14;
    if (v14) {
      v16 = (__CFString *)v14;
    }
    else {
      v16 = &stru_1F0C7EBE0;
    }
    objc_storeStrong((id *)&v5->_summaryString, v16);

    v17 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end