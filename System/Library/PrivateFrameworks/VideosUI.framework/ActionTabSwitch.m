@interface ActionTabSwitch
- (_TtC8VideosUI15ActionTabSwitch)init;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
@end

@implementation ActionTabSwitch

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1E303D7D8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_1E3628064((uint64_t)v9, v6, v7);
  sub_1E2C5FB90((uint64_t)v6);
}

- (_TtC8VideosUI15ActionTabSwitch)init
{
}

- (void).cxx_destruct
{
}

@end