@interface UIBarButtonItem(IC)
+ (id)ic_itemWithFixedWidth:()IC;
+ (id)ic_itemWithFlexibleSpace;
- (id)ic_view;
- (void)ic_setTitleTextAttributesForAllStates:()IC;
- (void)setIc_titleAndAccessibilityLabel:()IC;
@end

@implementation UIBarButtonItem(IC)

- (id)ic_view
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[self respondsToSelector:@selector(view)]" functionName:"-[UIBarButtonItem(IC) ic_view]" simulateCrash:1 showAlert:0 format:@"UIBarButtonItem expected to respond to selector: view"];
  }
  if (objc_opt_respondsToSelector())
  {
    v2 = [a1 performSelector:sel_view];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)ic_setTitleTextAttributesForAllStates:()IC
{
  id v4 = a3;
  [a1 setTitleTextAttributes:v4 forState:0];
  [a1 setTitleTextAttributes:v4 forState:2];
  [a1 setTitleTextAttributes:v4 forState:1];
  [a1 setTitleTextAttributes:v4 forState:8];
}

- (void)setIc_titleAndAccessibilityLabel:()IC
{
  objc_msgSend(a1, "setTitle:");
  id v2 = [a1 accessibilityLabel];
  [a1 setAccessibilityLabel:v2];
}

+ (id)ic_itemWithFixedWidth:()IC
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:6 target:0 action:0];
  [v2 setWidth:a1];
  return v2;
}

+ (id)ic_itemWithFlexibleSpace
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  return v0;
}

@end