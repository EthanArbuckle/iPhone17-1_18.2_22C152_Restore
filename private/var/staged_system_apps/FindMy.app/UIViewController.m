@interface UIViewController
- (void)presentCard:(id)a3 completion:(id)a4;
@end

@implementation UIViewController

- (void)presentCard:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_10051253C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_100512220(v8, (uint64_t)v6, v7);
  sub_100036B90((uint64_t)v6);
}

@end