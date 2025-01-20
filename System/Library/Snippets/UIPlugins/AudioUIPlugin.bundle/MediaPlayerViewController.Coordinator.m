@interface MediaPlayerViewController.Coordinator
- (_TtCV13AudioUIPluginP33_20A183E58FC9C8C577EBBC3EDCE2267625MediaPlayerViewController11Coordinator)init;
- (void)nowPlayingViewController:(id)a3 didChangeSizeWithAnimations:(id)a4 completion:(id)a5;
@end

@implementation MediaPlayerViewController.Coordinator

- (void)nowPlayingViewController:(id)a3 didChangeSizeWithAnimations:(id)a4 completion:(id)a5
{
  v8 = (void (*)(uint64_t))_Block_copy(a4);
  v9 = (uint64_t (*)())_Block_copy(a5);
  v10 = v9;
  if (v8)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    v8 = (void (*)(uint64_t))sub_151A4;
    if (!v10) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  uint64_t v11 = 0;
  if (v9)
  {
LABEL_3:
    *(void *)(swift_allocObject() + 16) = v10;
    v10 = sub_15158;
  }
LABEL_5:
  id v12 = a3;
  v13 = self;
  sub_135E0(v12, v8, v11, (void (*)(uint64_t))v10);
  sub_15110((uint64_t)v10);
  sub_15110((uint64_t)v8);
}

- (_TtCV13AudioUIPluginP33_20A183E58FC9C8C577EBBC3EDCE2267625MediaPlayerViewController11Coordinator)init
{
  result = (_TtCV13AudioUIPluginP33_20A183E58FC9C8C577EBBC3EDCE2267625MediaPlayerViewController11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end