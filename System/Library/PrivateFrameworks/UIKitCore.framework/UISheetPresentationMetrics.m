@interface UISheetPresentationMetrics
@end

@implementation UISheetPresentationMetrics

void __46___UISheetPresentationMetrics__defaultMetrics__block_invoke()
{
  id v0 = [[_UISheetPresentationMetrics alloc] _init];
  v1 = (void *)_MergedGlobals_13_3;
  _MergedGlobals_13_3 = (uint64_t)v0;
}

void __67___UISheetPresentationMetrics_transitionSpringParametersHighSpeed___block_invoke()
{
  if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_917, @"SheetDampingRatio")) {
    double v0 = 1.0;
  }
  else {
    double v0 = *(double *)&qword_1EB2577D0;
  }
  if (_UIInternalPreferenceUsesDefault_1((int *)algn_1EB2577E8, @"SheetResponse")) {
    double v1 = 0.344144233;
  }
  else {
    double v1 = *(double *)&qword_1EB2577F0;
  }
  uint64_t v2 = +[_UISpringParameters parametersWithDampingRatio:v0 response:v1];
  v3 = (void *)qword_1EB25B438;
  qword_1EB25B438 = v2;

  if (_UIInternalPreferenceUsesDefault_1((int *)algn_1EB2577D8, @"SheetHighSpeedDampingRatio"))double v4 = 0.8; {
  else
  }
    double v4 = *(double *)&qword_1EB2577E0;
  if (_UIInternalPreferenceUsesDefault_1((int *)algn_1EB2577E8, @"SheetResponse")) {
    double v5 = 0.344144233;
  }
  else {
    double v5 = *(double *)&qword_1EB2577F0;
  }
  uint64_t v6 = +[_UISpringParameters parametersWithDampingRatio:v4 response:v5];
  v7 = (void *)qword_1EB25B440;
  qword_1EB25B440 = v6;
}

@end