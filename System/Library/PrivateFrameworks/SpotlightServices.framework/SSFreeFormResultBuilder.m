@interface SSFreeFormResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (BOOL)supportsResult:(id)a3;
+ (id)bundleId;
- (NSString)freeFormDescription;
- (SSFreeFormResultBuilder)initWithResult:(id)a3;
- (id)buildDescriptions;
- (void)setFreeFormDescription:(id)a3;
@end

@implementation SSFreeFormResultBuilder

+ (id)bundleId
{
  return @"com.apple.freeform";
}

+ (BOOL)supportsResult:(id)a3
{
  id v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___SSFreeFormResultBuilder;
  if (objc_msgSendSuper2(&v9, sel_supportsResult_, v4))
  {
    char v5 = 1;
  }
  else
  {
    v6 = [v4 applicationBundleIdentifier];
    v7 = [a1 bundleId];
    char v5 = [v6 isEqual:v7];
  }
  return v5;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSFreeFormResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SSFreeFormResultBuilder;
  char v5 = [(SSResultBuilder *)&v8 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22CD0] withType:objc_opt_class()];
    [(SSFreeFormResultBuilder *)v5 setFreeFormDescription:v6];
  }
  return v5;
}

- (id)buildDescriptions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SSFreeFormResultBuilder *)self freeFormDescription];

  if (v3)
  {
    id v4 = objc_opt_class();
    char v5 = [(SSFreeFormResultBuilder *)self freeFormDescription];
    v10[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v7 = [v4 richTextsFromStrings:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SSFreeFormResultBuilder;
    v7 = [(SSResultBuilder *)&v9 buildDescriptions];
  }
  return v7;
}

- (NSString)freeFormDescription
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFreeFormDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end