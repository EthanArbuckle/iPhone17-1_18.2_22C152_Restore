@interface CRTextOrientationModelV1
+ (id)defaultModelFileName;
- (id)modelURL;
@end

@implementation CRTextOrientationModelV1

+ (id)defaultModelFileName
{
  return @"cr_orientation_model_v1.mlmodelc";
}

- (id)modelURL
{
  v2 = objc_opt_class();
  return (id)[v2 defaultURLOfModelInThisBundle];
}

@end