@interface _UIEditMenuProvider
+ (id)menuElementsFromResponderChain:(id)a3 atLocation:(CGPoint)a4 inCoordinateSpace:(id)a5 includeMenuControllerItems:(BOOL)a6;
@end

@implementation _UIEditMenuProvider

+ (id)menuElementsFromResponderChain:(id)a3 atLocation:(CGPoint)a4 inCoordinateSpace:(id)a5 includeMenuControllerItems:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a4.y;
  double x = a4.x;
  id v10 = a5;
  id v11 = a3;
  v12 = +[UIMenuSystem contextSystem];
  v13 = objc_msgSend(v12, "_newBuilderFromResponderChain:atLocation:inCoordinateSpace:", v11, v10, x, y);

  v14 = [v13 menuForIdentifier:@"com.apple.menu.root"];
  v15 = [v14 children];

  if (v6)
  {
    v16 = _UIMenuForUIMenuControllerMenuItems();
    if (v16)
    {
      uint64_t v17 = [v15 arrayByAddingObject:v16];

      v15 = (void *)v17;
    }
  }
  return v15;
}

@end