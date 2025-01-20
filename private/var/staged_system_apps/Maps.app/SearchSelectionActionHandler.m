@interface SearchSelectionActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation SearchSelectionActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v13 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v13;
    v7 = +[SearchSession currentSearchSession];
    v8 = [v7 currentResults];

    id v9 = [v8 count];
    if (v9 > [v6 selectedIndex])
    {
      v10 = [v8 objectAtIndexedSubscript:[v6 selectedIndex]];
      v11 = +[SearchFieldItem searchFieldItemWithObject:v10];
      v12 = [v5 coordinator];
      [v12 viewController:0 doSearchItem:v11 withUserInfo:&off_1013AE9E8];
    }
  }
}

@end