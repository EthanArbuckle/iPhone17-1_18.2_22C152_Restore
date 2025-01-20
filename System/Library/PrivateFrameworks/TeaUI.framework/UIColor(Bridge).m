@interface UIColor(Bridge)
+ (id)ts_activityIndicatorColor;
+ (id)ts_dynamicColor:()Bridge withDarkStyleVariant:;
+ (uint64_t)ts_systemDarkTealColor;
+ (uint64_t)ts_tableCellDefaultSelectionTintColor;
@end

@implementation UIColor(Bridge)

+ (id)ts_dynamicColor:()Bridge withDarkStyleVariant:
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4FB1E20];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 traitCollectionWithUserInterfaceStyle:0];
  v9 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
  v13[0] = v8;
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v6;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v11 = [MEMORY[0x1E4FB1618] _dynamicColorWithColorsByTraitCollection:v10];

  return v11;
}

+ (uint64_t)ts_systemDarkTealColor
{
  return [MEMORY[0x1E4FB1618] systemDarkTealColor];
}

+ (uint64_t)ts_tableCellDefaultSelectionTintColor
{
  return [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
}

+ (id)ts_activityIndicatorColor
{
  v0 = (void *)MEMORY[0x1E4FB1618];
  v1 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.45];
  v2 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  v3 = objc_msgSend(v0, "ts_dynamicColor:withDarkStyleVariant:", v1, v2);

  return v3;
}

@end