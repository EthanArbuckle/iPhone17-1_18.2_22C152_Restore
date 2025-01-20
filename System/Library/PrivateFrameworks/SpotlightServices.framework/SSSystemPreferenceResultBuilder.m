@interface SSSystemPreferenceResultBuilder
+ (BOOL)isCoreSpotlightResult;
+ (id)bundleId;
- (NSString)bundleId;
- (NSString)name;
- (NSString)preferenceDescription;
- (SSSystemPreferenceResultBuilder)initWithResult:(id)a3;
- (id)buildDescriptions;
- (void)setBundleId:(id)a3;
- (void)setName:(id)a3;
- (void)setPreferenceDescription:(id)a3;
@end

@implementation SSSystemPreferenceResultBuilder

+ (id)bundleId
{
  return @"com.apple.Preferences";
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSSystemPreferenceResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SSSystemPreferenceResultBuilder;
  v5 = [(SSResultBuilder *)&v10 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 applicationBundleIdentifier];
    [(SSSystemPreferenceResultBuilder *)v5 setBundleId:v6];

    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F22CE8] withType:objc_opt_class()];
    [(SSSystemPreferenceResultBuilder *)v5 setName:v7];

    v8 = [v4 valueForAttribute:*MEMORY[0x1E4F22CD0] withType:objc_opt_class()];
    [(SSSystemPreferenceResultBuilder *)v5 setPreferenceDescription:v8];
  }
  return v5;
}

- (id)buildDescriptions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v3 = [(SSSystemPreferenceResultBuilder *)self preferenceDescription];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F9A378];
    v6 = [(SSSystemPreferenceResultBuilder *)self preferenceDescription];
    v7 = [v5 textWithString:v6];
    v10[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)preferenceDescription
{
  return self->_preferenceDescription;
}

- (void)setPreferenceDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferenceDescription, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end