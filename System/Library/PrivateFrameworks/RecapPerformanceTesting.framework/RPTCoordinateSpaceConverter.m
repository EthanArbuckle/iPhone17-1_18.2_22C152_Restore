@interface RPTCoordinateSpaceConverter
+ (RPTCoordinateSpaceConverter)identityConverter;
+ (id)converterFromView:(id)a3;
+ (id)converterFromWindow:(id)a3;
+ (id)converterFromWindow:(id)a3 toScreen:(id)a4;
@end

@implementation RPTCoordinateSpaceConverter

uint64_t __48__RPTCoordinateSpaceConverter_identityConverter__block_invoke()
{
  identityConverter_identity = objc_alloc_init(RPTNullCoordinateSpaceConverter);
  return MEMORY[0x1F41817F8]();
}

+ (RPTCoordinateSpaceConverter)identityConverter
{
  if (identityConverter_onceToken != -1) {
    dispatch_once(&identityConverter_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)identityConverter_identity;
  return (RPTCoordinateSpaceConverter *)v2;
}

+ (id)converterFromView:(id)a3
{
  id v3 = a3;
  id v4 = [[RPTViewCoordinateSpaceConverter alloc] initFromView:v3];

  return v4;
}

+ (id)converterFromWindow:(id)a3
{
  id v3 = a3;
  id v4 = [RPTWindowCoordinateSpaceConverter alloc];
  v5 = [v3 screen];
  id v6 = [(RPTWindowCoordinateSpaceConverter *)v4 initFromWindow:v3 toScreen:v5];

  return v6;
}

+ (id)converterFromWindow:(id)a3 toScreen:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[RPTWindowCoordinateSpaceConverter alloc] initFromWindow:v6 toScreen:v5];

  return v7;
}

@end