@interface UILabel(MobileSafariFrameworkExtras)
+ (id)sf_startPageBannerTitleLabelWithFont:()MobileSafariFrameworkExtras;
@end

@implementation UILabel(MobileSafariFrameworkExtras)

+ (id)sf_startPageBannerTitleLabelWithFont:()MobileSafariFrameworkExtras
{
  id v4 = a3;
  id v5 = objc_alloc_init(a1);
  [v5 setFont:v4];

  [v5 setNumberOfLines:0];
  [v5 setTextAlignment:1];
  [v5 setAdjustsFontForContentSizeCategory:1];
  v6 = [MEMORY[0x1E4FB1618] labelColor];
  [v5 setTextColor:v6];

  return v5;
}

@end