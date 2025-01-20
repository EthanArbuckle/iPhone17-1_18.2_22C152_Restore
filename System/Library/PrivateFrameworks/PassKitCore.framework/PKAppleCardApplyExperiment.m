@interface PKAppleCardApplyExperiment
- (id)experimentDetails;
- (id)heroImagePath;
- (id)heroInstallmentImagePath;
- (id)namespaceName;
- (id)variant;
@end

@implementation PKAppleCardApplyExperiment

- (id)namespaceName
{
  return @"WALLET_APP_BROADWAY_APPLY";
}

- (id)variant
{
  return [(PKExperiment *)self stringForFactor:@"variant"];
}

- (id)heroImagePath
{
  if (PKScreenScale() <= 2.0) {
    v3 = @"image_hero_2x";
  }
  else {
    v3 = @"image_hero_3x";
  }
  return [(PKExperiment *)self filePathForFactor:v3];
}

- (id)heroInstallmentImagePath
{
  if (PKScreenScale() <= 2.0) {
    v3 = @"image_hero_installment_2x";
  }
  else {
    v3 = @"image_hero_installment_3x";
  }
  return [(PKExperiment *)self filePathForFactor:v3];
}

- (id)experimentDetails
{
  v8.receiver = self;
  v8.super_class = (Class)PKAppleCardApplyExperiment;
  v3 = [(PKExperiment *)&v8 experimentDetails];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(PKAppleCardApplyExperiment *)self variant];
  [v4 safelySetObject:v5 forKey:@"variant"];

  v6 = (void *)[v4 copy];
  return v6;
}

@end