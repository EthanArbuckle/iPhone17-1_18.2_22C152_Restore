@interface MusicSBS_TextContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MusicSBS_TextContentView)initWithCoder:(id)a3;
- (MusicSBS_TextContentView)initWithFrame:(CGRect)a3;
- (id)copy;
- (void)layoutSubviews;
@end

@implementation MusicSBS_TextContentView

- (MusicSBS_TextContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003FA81C();
}

- (id)copy
{
  v2 = self;
  sub_1003F9A98(v5);

  sub_10000ECD4(v5, (uint64_t)v5[3]);
  id v3 = (void *)sub_100536770();
  sub_100013D48((uint64_t)v5);
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  sub_1003F9F80(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003FA088();
}

- (MusicSBS_TextContentView)initWithFrame:(CGRect)a3
{
  CGSize result = (MusicSBS_TextContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(v3, (char *)self + OBJC_IVAR___MusicSBS_TextContentView_specs, 0x219uLL);
  sub_1003F0898((uint64_t)v3);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end