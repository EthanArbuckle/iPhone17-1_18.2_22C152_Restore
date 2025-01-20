@interface UIViewController
+ (id)jsa_topMostViewControllerForWindow:(id)a3;
+ (void)jsa_presentViewController:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)present:(id)a3 :(BOOL)a4;
@end

@implementation UIViewController

- (void)present:(id)a3 :(BOOL)a4
{
}

+ (id)jsa_topMostViewControllerForWindow:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v6 = +[JSABridge sharedInstance];
    v7 = [v6 windowManager];
    id v5 = [v7 keyWindow];
  }
  v8 = [v5 rootViewController];
  v9 = [v8 presentedViewController];

  if (v9)
  {
    do
    {
      v10 = [v8 presentedViewController];

      v11 = [v10 presentedViewController];

      v8 = v10;
    }
    while (v11);
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

+ (void)jsa_presentViewController:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  v8 = _Block_copy(a6);
  uint64_t v9 = sub_86800();
  if (v8)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v8;
    v8 = sub_7E5AC;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  _sSo16UIViewControllerC5JSAppE7present_7options8animated10completionyAB_SDys11AnyHashableVypGSbyycSgtFZ_0(v11, v9, a5, (uint64_t)v8, v10);
  sub_31BA8((uint64_t)v8);

  swift_bridgeObjectRelease();
}

@end