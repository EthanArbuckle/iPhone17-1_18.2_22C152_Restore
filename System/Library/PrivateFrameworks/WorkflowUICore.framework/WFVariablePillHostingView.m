@interface WFVariablePillHostingView
- (WFVariablePillHostingView)initWithCoder:(id)a3;
- (WFVariablePillHostingView)initWithFrame:(CGRect)a3;
- (WFVariablePillHostingView)initWithName:(id)a3 icon:(id)a4 font:(id)a5 available:(BOOL)a6 height:(double)a7 controlState:(unint64_t)a8;
@end

@implementation WFVariablePillHostingView

- (WFVariablePillHostingView)initWithName:(id)a3 icon:(id)a4 font:(id)a5 available:(BOOL)a6 height:(double)a7 controlState:(unint64_t)a8
{
  uint64_t v13 = sub_2353FD4F8();
  uint64_t v15 = v14;
  id v16 = a4;
  id v17 = a5;
  return (WFVariablePillHostingView *)sub_23531A840(v13, v15, a4, a5, a6, a8, a7);
}

- (WFVariablePillHostingView)initWithCoder:(id)a3
{
}

- (WFVariablePillHostingView)initWithFrame:(CGRect)a3
{
}

@end