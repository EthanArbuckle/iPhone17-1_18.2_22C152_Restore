@interface HeaderView
- (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B110HeaderView)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B110HeaderView)initWithReuseIdentifier:(id)a3;
- (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView)init;
- (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HeaderView

- (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView)init
{
  return (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView *)sub_100016F14();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10063B988();
}

- (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003816B4();
}

- (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView_mediaView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStoreP33_50FB26AE35933B3A04EC44A4A275C3B010HeaderView_gradientBlurView);
}

- (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B110HeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)_s8AppStore10HeaderViewCMa_0();
  v5 = [(HeaderView *)&v7 initWithReuseIdentifier:v4];

  return v5;
}

- (_TtC8AppStoreP33_4C3663C3DFD2A515EF9390A728D5E4B110HeaderView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_s8AppStore10HeaderViewCMa_0();
  return [(HeaderView *)&v5 initWithCoder:a3];
}

@end