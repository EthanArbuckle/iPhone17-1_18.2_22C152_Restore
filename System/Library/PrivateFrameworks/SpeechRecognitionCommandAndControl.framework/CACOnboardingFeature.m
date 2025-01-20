@interface CACOnboardingFeature
+ (id)featureWithTitleText:(id)a3 helperText:(id)a4;
+ (id)featureWithTitleText:(id)a3 helperText:(id)a4 imageBundleName:(id)a5;
- (CACOnboardingFeature)initWithTitleText:(id)a3 helperText:(id)a4 imageBundleName:(id)a5;
- (NSString)helperText;
- (NSString)imageBundleName;
- (NSString)titleText;
- (void)setHelperText:(id)a3;
- (void)setImageBundleName:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation CACOnboardingFeature

- (CACOnboardingFeature)initWithTitleText:(id)a3 helperText:(id)a4 imageBundleName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CACOnboardingFeature;
  v12 = [(CACOnboardingFeature *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_titleText, a3);
    objc_storeStrong((id *)&v13->_helperText, a4);
    objc_storeStrong((id *)&v13->_imageBundleName, a5);
  }

  return v13;
}

+ (id)featureWithTitleText:(id)a3 helperText:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[CACOnboardingFeature alloc] initWithTitleText:v6 helperText:v5 imageBundleName:0];

  return v7;
}

+ (id)featureWithTitleText:(id)a3 helperText:(id)a4 imageBundleName:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[CACOnboardingFeature alloc] initWithTitleText:v9 helperText:v8 imageBundleName:v7];

  return v10;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)helperText
{
  return self->_helperText;
}

- (void)setHelperText:(id)a3
{
}

- (NSString)imageBundleName
{
  return self->_imageBundleName;
}

- (void)setImageBundleName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageBundleName, 0);
  objc_storeStrong((id *)&self->_helperText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

@end