@interface NTKGreenfieldFallbackTemplateProvider
+ (id)_tombstoneImageForFamily:(int64_t)a3;
+ (id)templateForClientIdentifier:(id)a3 displayName:(id)a4 family:(int64_t)a5 device:(id)a6 sdkVersion:(id)a7;
@end

@implementation NTKGreenfieldFallbackTemplateProvider

+ (id)templateForClientIdentifier:(id)a3 displayName:(id)a4 family:(int64_t)a5 device:(id)a6 sdkVersion:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a4;
  v14 = [a1 _tombstoneImageForFamily:a5];
  v15 = +[NTKNoContentTemplateProvider templateForDisplayName:v13 image:v14 family:a5 device:v12 sdkVersion:v11];

  return v15;
}

+ (id)_tombstoneImageForFamily:(int64_t)a3
{
  if (unint64_t)a3 <= 0xC && ((0x1595u >> a3)) {
    NTKImageNamed(off_1E62C12F0[a3]);
  }
  return 0;
}

@end