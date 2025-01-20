@interface UIControl(advertising)
- (id)adPrivacyData;
- (void)setAdPrivacyData:()advertising;
@end

@implementation UIControl(advertising)

- (id)adPrivacyData
{
  return objc_getAssociatedObject(a1, sel_adPrivacyData);
}

- (void)setAdPrivacyData:()advertising
{
  id value = a3;
  v4 = [a1 adPrivacyData];
  if (v4) {
    [a1 removeTarget:0 action:sel_suuiadvertising_adTransparencyButtonTapped_ forControlEvents:64];
  }
  objc_setAssociatedObject(a1, sel_adPrivacyData, value, (void *)3);
  if (value) {
    [a1 addTarget:0 action:sel_suuiadvertising_adTransparencyButtonTapped_ forControlEvents:64];
  }
}

@end