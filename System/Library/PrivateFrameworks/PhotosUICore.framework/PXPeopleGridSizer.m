@interface PXPeopleGridSizer
+ (CGSize)cellSizeForGridClass:(int64_t)a3 width:(double)a4;
+ (double)marginForGridClass:(int64_t)a3 width:(double)result;
+ (id)_gridCColumnInterpolator;
+ (id)_gridCGutterInterpolator;
+ (id)_gridCMarginInterpolator;
+ (id)_peopleHomeColumnInterpolator;
+ (unint64_t)numberOfColumnsForGridClass:(int64_t)a3 width:(double)a4;
@end

@implementation PXPeopleGridSizer

+ (id)_gridCGutterInterpolator
{
  if (_gridCGutterInterpolator_onceToken != -1) {
    dispatch_once(&_gridCGutterInterpolator_onceToken, &__block_literal_global_7_271162);
  }
  v2 = (void *)_gridCGutterInterpolator_gutterInterpolator;
  return v2;
}

uint64_t __45__PXPeopleGridSizer__gridCGutterInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)_gridCGutterInterpolator_gutterInterpolator;
  _gridCGutterInterpolator_gutterInterpolator = (uint64_t)v0;

  [(id)_gridCGutterInterpolator_gutterInterpolator setReferenceValue:10.0 forMetric:460.0];
  [(id)_gridCGutterInterpolator_gutterInterpolator setReferenceValue:20.0 forMetric:981.0];
  v2 = (void *)_gridCGutterInterpolator_gutterInterpolator;
  return [v2 setReferenceValue:24.0 forMetric:1195.0];
}

+ (id)_gridCMarginInterpolator
{
  if (_gridCMarginInterpolator_onceToken != -1) {
    dispatch_once(&_gridCMarginInterpolator_onceToken, &__block_literal_global_5_271165);
  }
  v2 = (void *)_gridCMarginInterpolator_marginInterpolator;
  return v2;
}

uint64_t __45__PXPeopleGridSizer__gridCMarginInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)_gridCMarginInterpolator_marginInterpolator;
  _gridCMarginInterpolator_marginInterpolator = (uint64_t)v0;

  [(id)_gridCMarginInterpolator_marginInterpolator setReferenceValue:20.0 forMetric:460.0];
  [(id)_gridCMarginInterpolator_marginInterpolator setReferenceValue:34.0 forMetric:981.0];
  v2 = (void *)_gridCMarginInterpolator_marginInterpolator;
  return [v2 setReferenceValue:52.0 forMetric:1195.0];
}

+ (id)_peopleHomeColumnInterpolator
{
  if (_peopleHomeColumnInterpolator_onceToken != -1) {
    dispatch_once(&_peopleHomeColumnInterpolator_onceToken, &__block_literal_global_3_271167);
  }
  v2 = (void *)_peopleHomeColumnInterpolator_columnInterpolator;
  return v2;
}

uint64_t __50__PXPeopleGridSizer__peopleHomeColumnInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)_peopleHomeColumnInterpolator_columnInterpolator;
  _peopleHomeColumnInterpolator_columnInterpolator = (uint64_t)v0;

  [(id)_peopleHomeColumnInterpolator_columnInterpolator setReferenceValue:2.0 forMetric:460.0];
  [(id)_peopleHomeColumnInterpolator_columnInterpolator setReferenceValue:4.0 forMetric:726.0];
  [(id)_peopleHomeColumnInterpolator_columnInterpolator setReferenceValue:5.0 forMetric:981.0];
  [(id)_peopleHomeColumnInterpolator_columnInterpolator setReferenceValue:6.0 forMetric:1194.0];
  v2 = (void *)_peopleHomeColumnInterpolator_columnInterpolator;
  return [v2 setReferenceValue:7.0 forMetric:1195.0];
}

+ (id)_gridCColumnInterpolator
{
  if (_gridCColumnInterpolator_onceToken != -1) {
    dispatch_once(&_gridCColumnInterpolator_onceToken, &__block_literal_global_271169);
  }
  v2 = (void *)_gridCColumnInterpolator_columnInterpolator;
  return v2;
}

uint64_t __45__PXPeopleGridSizer__gridCColumnInterpolator__block_invoke()
{
  v0 = objc_alloc_init(PXLayoutMetricInterpolator);
  v1 = (void *)_gridCColumnInterpolator_columnInterpolator;
  _gridCColumnInterpolator_columnInterpolator = (uint64_t)v0;

  [(id)_gridCColumnInterpolator_columnInterpolator setReferenceValue:3.0 forMetric:460.0];
  [(id)_gridCColumnInterpolator_columnInterpolator setReferenceValue:4.0 forMetric:726.0];
  [(id)_gridCColumnInterpolator_columnInterpolator setReferenceValue:5.0 forMetric:981.0];
  [(id)_gridCColumnInterpolator_columnInterpolator setReferenceValue:6.0 forMetric:1194.0];
  v2 = (void *)_gridCColumnInterpolator_columnInterpolator;
  return [v2 setReferenceValue:7.0 forMetric:1195.0];
}

+ (unint64_t)numberOfColumnsForGridClass:(int64_t)a3 width:(double)a4
{
  if (a3 == 1)
  {
    v5 = +[PXPeopleGridSizer _peopleHomeColumnInterpolator];
  }
  else
  {
    if (a3) {
      return 0;
    }
    v5 = +[PXPeopleGridSizer _gridCColumnInterpolator];
  }
  v6 = v5;
  [v5 valueForMetric:a4];
  unint64_t v8 = (unint64_t)v7;

  return v8;
}

+ (CGSize)cellSizeForGridClass:(int64_t)a3 width:(double)a4
{
  if ((unint64_t)a3 > 1)
  {
    double v15 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    double v7 = (double)(unint64_t)objc_msgSend(a1, "numberOfColumnsForGridClass:width:");
    [a1 marginForGridClass:a3 width:a4];
    double v9 = v8;
    v10 = +[PXPeopleGridSizer _gridCGutterInterpolator];
    [v10 valueForMetric:a4];
    double v12 = v11;

    float v13 = (a4 - (v7 + -1.0) * v12 - (v9 + v9)) / v7;
    double v14 = floorf(v13);
    double v15 = v14;
  }
  result.height = v14;
  result.width = v15;
  return result;
}

+ (double)marginForGridClass:(int64_t)a3 width:(double)result
{
  if ((unint64_t)a3 <= 1)
  {
    double v4 = result;
    v5 = +[PXPeopleGridSizer _gridCMarginInterpolator];
    [v5 valueForMetric:v4];
    double v7 = v6;

    return v7;
  }
  return result;
}

@end