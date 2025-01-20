@interface PXTimelineSize
+ (CGSize)widgetSizeForSizeClass:(unint64_t)a3;
+ (id)allSupportedSizes;
+ (id)sizeDescriptionForSizeClass:(unint64_t)a3;
@end

@implementation PXTimelineSize

+ (id)allSupportedSizes
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v2 addObject:&unk_1F02D6058];
  [v2 addObject:&unk_1F02D6070];
  [v2 addObject:&unk_1F02D6088];
  [v2 addObject:&unk_1F02D60A0];
  return v2;
}

+ (CGSize)widgetSizeForSizeClass:(unint64_t)a3
{
  if (a3 > 3)
  {
    double v4 = 369.0;
    double v3 = 384.0;
  }
  else
  {
    double v3 = dbl_1AB35A8A8[a3];
    double v4 = dbl_1AB35A8C8[a3];
  }
  v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];
  double v7 = v6;

  double v8 = v4 * v7;
  double v9 = v3 * v7;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (id)sizeDescriptionForSizeClass:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Small";
  }
  else {
    return off_1E5DB22D8[a3 - 1];
  }
}

@end