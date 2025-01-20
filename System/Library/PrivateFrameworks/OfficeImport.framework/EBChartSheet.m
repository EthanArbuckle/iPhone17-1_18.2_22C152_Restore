@interface EBChartSheet
+ (void)readChildrenWithState:(id)a3;
+ (void)readWithState:(id)a3;
+ (void)setupProcessors:(id)a3;
@end

@implementation EBChartSheet

+ (void)readWithState:(id)a3
{
  id v7 = a3;
  v4 = [v7 edSheet];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 processors];
    [a1 setupProcessors:v5];

    v6 = (float *)[v7 xlReader];
    objc_msgSend(v4, "setBounds:", v6[389], v6[390], (float)(v6[391] - v6[389]), (float)(v6[392] - v6[390]));
  }
}

+ (void)setupProcessors:(id)a3
{
  id v3 = a3;
  [v3 removeAllObjects];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
  [v3 addProcessorClass:objc_opt_class()];
}

+ (void)readChildrenWithState:(id)a3
{
  id v5 = a3;
  id v3 = [v5 edSheet];
  v4 = +[EBGraphic readMainChartWithState:v5];
  [v3 setMainChart:v4];

  +[EBGraphic readGraphicsWithState:v5];
}

@end