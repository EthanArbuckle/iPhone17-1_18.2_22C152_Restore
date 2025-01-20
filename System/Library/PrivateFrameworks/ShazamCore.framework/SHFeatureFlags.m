@interface SHFeatureFlags
- (BOOL)shouldDisplayShazamUpsell;
- (NSDictionary)featureFlags;
- (SHFeatureFlags)initWithConfiguration:(id)a3;
@end

@implementation SHFeatureFlags

- (SHFeatureFlags)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHFeatureFlags;
  v6 = [(SHFeatureFlags *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_featureFlags, a3);
  }

  return v7;
}

- (BOOL)shouldDisplayShazamUpsell
{
  v3 = [NSString stringWithFormat:@"%@.%@", @"nativeTrackPage", @"displayShazamUpsell"];
  v4 = [(SHFeatureFlags *)self featureFlags];
  id v5 = [v4 valueForKeyPath:v3];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (NSDictionary)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
}

@end