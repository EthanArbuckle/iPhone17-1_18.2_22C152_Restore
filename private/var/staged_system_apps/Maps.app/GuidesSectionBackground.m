@interface GuidesSectionBackground
+ (id)decorationViewKind;
- (GuidesSectionBackground)initWithFrame:(CGRect)a3;
@end

@implementation GuidesSectionBackground

+ (id)decorationViewKind
{
  return @"GuidesSectionBackground";
}

- (GuidesSectionBackground)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GuidesSectionBackground;
  v3 = -[GuidesSectionBackground initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    id v5 = [(GuidesSectionBackground *)v3 _maps_addHairlineAtBottomWithMargin:0.0];
  }
  return v4;
}

@end