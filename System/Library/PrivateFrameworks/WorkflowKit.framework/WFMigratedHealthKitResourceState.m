@interface WFMigratedHealthKitResourceState
+ (BOOL)supportsSecureCoding;
- (WFMigratedHealthKitResourceState)initWithCoder:(id)a3;
@end

@implementation WFMigratedHealthKitResourceState

- (void).cxx_destruct
{
}

- (WFMigratedHealthKitResourceState)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFMigratedHealthKitResourceState;
  v5 = [(WFMigratedHealthKitResourceState *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"entries"];
    entries = v5->entries;
    v5->entries = (NSSet *)v9;

    v11 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end