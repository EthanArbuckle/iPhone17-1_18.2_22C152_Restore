@interface PosterEditor
- (_TtC13WeatherPoster12PosterEditor)init;
- (id)looksForEditor:(id)a3;
- (id)titleContentStylePickerConfigurationForEditor:(id)a3;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
@end

@implementation PosterEditor

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_10003F9E4(v6, a4);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_100040094((int)v10, a4, a5);

  swift_unknownObjectRelease();
}

- (id)looksForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100040344();

  sub_100018DB0(0, (unint64_t *)&unk_10006D3F0);
  v6.super.isa = sub_100053FB8().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (id)titleContentStylePickerConfigurationForEditor:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100040588();

  return v6;
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_1000406E8((uint64_t)v10, a4);

  swift_unknownObjectRelease();
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
  id v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_10004162C(v7, (uint64_t)v8, (void (**)(void))v6);
  _Block_release(v6);
}

- (void)editorDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000418D4();
}

- (_TtC13WeatherPoster12PosterEditor)init
{
}

- (void).cxx_destruct
{
  sub_10001F7A8((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_posterData, (uint64_t *)&unk_10006C4B0);
  sub_10001F7A8((uint64_t)self + OBJC_IVAR____TtC13WeatherPoster12PosterEditor_lastRenderedAnimationViewModel, &qword_10006C320);
  swift_unknownObjectRelease();

  swift_release();

  swift_release();
}

@end