@interface Player.DataSource
- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4;
- (_TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource)init;
- (void)controller:(id)a3 defersResponseReplacement:(id)a4;
@end

@implementation Player.DataSource

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_10003D458(v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  if ([v6 request])
  {
    self;
    uint64_t v9 = swift_dynamicCastObjCClass();
    if (v9) {
      (*(void (**)(uint64_t, id))((char *)&v8->super.isa
    }
                                          + OBJC_IVAR____TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource_onError))(v9, v7);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  return 1;
}

- (_TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource)init
{
  result = (_TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource_request));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource_path));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC9MusicCore6PlayerP33_031AD420BBF8BBF113A2662767DAC2BB10DataSource_controller));
  swift_release();

  swift_release();
}

@end