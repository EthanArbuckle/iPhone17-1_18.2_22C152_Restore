@interface NTKCFaceDetailSpacerCell
+ (double)actionExtraRowHeight;
+ (double)rowHeight;
+ (id)reuseIdentifier;
- (double)rowHeight;
@end

@implementation NTKCFaceDetailSpacerCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (double)rowHeight
{
  return 35.0;
}

- (double)rowHeight
{
  return 35.0;
}

+ (double)actionExtraRowHeight
{
  return 13.0;
}

@end