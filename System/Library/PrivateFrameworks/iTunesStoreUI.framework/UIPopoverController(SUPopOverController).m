@interface UIPopoverController(SUPopOverController)
- (SUScriptPopOver)copyScriptPopOver;
@end

@implementation UIPopoverController(SUPopOverController)

- (SUScriptPopOver)copyScriptPopOver
{
  v2 = objc_alloc_init(SUScriptPopOver);
  [(SUScriptObject *)v2 setNativeObject:+[SUScriptNativeObject objectWithNativeObject:a1]];
  return v2;
}

@end