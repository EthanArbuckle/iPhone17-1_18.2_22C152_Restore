@interface WFVariablePillView
+ (double)widthForVariableViewWithName:(id)a3 icon:(id)a4 font:(id)a5 height:(double)a6;
- (WFVariablePillView)initWithName:(id)a3 icon:(id)a4 font:(id)a5 available:(BOOL)a6 height:(double)a7 controlState:(unint64_t)a8;
@end

@implementation WFVariablePillView

- (WFVariablePillView)initWithName:(id)a3 icon:(id)a4 font:(id)a5 available:(BOOL)a6 height:(double)a7 controlState:(unint64_t)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WFVariablePillView;
  v17 = -[WFVariablePillView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v17)
  {
    v18 = [[WFVariablePillHostingView alloc] initWithName:v14 icon:v15 font:v16 available:v10 height:a8 controlState:a7];
    [(WFVariablePillHostingView *)v18 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(WFVariablePillHostingView *)v18 setAutoresizingMask:18];
    [(WFVariablePillView *)v17 addSubview:v18];
    v19 = v17;
  }
  return v17;
}

+ (double)widthForVariableViewWithName:(id)a3 icon:(id)a4 font:(id)a5 height:(double)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [[WFVariablePillLayoutMetrics alloc] initWithName:v11 icon:v10 font:v9 height:a6];

  [(WFVariablePillLayoutMetrics *)v12 totalWidth];
  double v14 = v13;

  return v14;
}

@end