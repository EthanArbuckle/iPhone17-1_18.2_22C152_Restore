@interface STHourglassView
- (CGSize)intrinsicContentSize;
- (id)makeCAPackage;
- (void)animateToStateName:(id)a3 completionHandler:(id)a4;
- (void)prepareForInterfaceBuilder;
- (void)setStateName:(id)a3;
@end

@implementation STHourglassView

- (id)makeCAPackage
{
  v2 = [(STHourglassView *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 2) {
    v4 = @"hourGlass dark";
  }
  else {
    v4 = @"hourGlass light";
  }
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 URLForResource:v4 withExtension:@"ca"];
  v7 = [MEMORY[0x263F15838] packageWithContentsOfURL:v6 type:*MEMORY[0x263F15EE8] options:0 error:0];

  return v7;
}

- (void)setStateName:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)STHourglassView;
  [(STCAPackageView *)&v3 setStateName:a3];
}

- (void)animateToStateName:(id)a3 completionHandler:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)STHourglassView;
  [(STCAPackageView *)&v4 animateToStateName:a3 completionHandler:a4];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 72.0;
  double v3 = 72.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)prepareForInterfaceBuilder
{
  v3.receiver = self;
  v3.super_class = (Class)STHourglassView;
  [(STHourglassView *)&v3 prepareForInterfaceBuilder];
  [(STHourglassView *)self setStateName:@"fill"];
}

@end