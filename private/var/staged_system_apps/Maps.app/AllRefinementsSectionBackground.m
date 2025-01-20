@interface AllRefinementsSectionBackground
+ (id)decorationViewKind;
- (AllRefinementsSectionBackground)initWithFrame:(CGRect)a3;
@end

@implementation AllRefinementsSectionBackground

+ (id)decorationViewKind
{
  return @"background";
}

- (AllRefinementsSectionBackground)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AllRefinementsSectionBackground;
  v3 = -[AllRefinementsSectionBackground initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3) {
    +[MUPlatterConfigurator configureView:v3];
  }
  return v3;
}

@end