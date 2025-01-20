@interface EXChartsheet
+ (BOOL)readDistinctSheetElementsFrom:(_xmlTextReader *)a3 state:(id)a4;
+ (id)edSheetWithState:(id)a3;
+ (void)setupProcessors:(id)a3;
@end

@implementation EXChartsheet

+ (id)edSheetWithState:(id)a3
{
  id v4 = a3;
  v5 = [EDChartSheet alloc];
  v6 = [v4 workbook];
  v7 = [(EDSheet *)v5 initWithWorkbook:v6];

  v8 = [(EDSheet *)v7 processors];
  [a1 setupProcessors:v8];

  return v7;
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

+ (BOOL)readDistinctSheetElementsFrom:(_xmlTextReader *)a3 state:(id)a4
{
  return 0;
}

@end