@interface RouteLargeStepLabelListView
+ (id)fontsForStrings:(id)a3 route:(id)a4 step:(id)a5 tableMode:(BOOL)a6;
+ (int64_t)_instructionsContext;
@end

@implementation RouteLargeStepLabelListView

+ (id)fontsForStrings:(id)a3 route:(id)a4 step:(id)a5 tableMode:(BOOL)a6
{
  id v6 = [a3 count];
  v7 = +[NSMutableArray arrayWithCapacity:v6];
  v8 = +[UIFont _maps_boldSystemFontWithSize:35.0];
  [v7 addObject:v8];

  uint64_t v9 = 2;
  if ((unint64_t)v6 > 2) {
    uint64_t v9 = (uint64_t)v6;
  }
  uint64_t v10 = v9 - 1;
  do
  {
    v11 = +[UIFont _maps_systemFontWithSize:20.0];
    [v7 addObject:v11];

    --v10;
  }
  while (v10);

  return v7;
}

+ (int64_t)_instructionsContext
{
  return 2;
}

@end