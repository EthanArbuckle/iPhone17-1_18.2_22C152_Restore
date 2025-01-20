@interface AlertTemplateView
- (_TtC8VideosUI17AlertTemplateView)initWithCoder:(id)a3;
- (_TtC8VideosUI17AlertTemplateView)initWithFrame:(CGRect)a3;
- (void)imageDidLoad:(id)a3;
- (void)layoutSubviews;
@end

@implementation AlertTemplateView

- (_TtC8VideosUI17AlertTemplateView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E32337CC();
}

- (_TtC8VideosUI17AlertTemplateView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI17AlertTemplateView *)sub_1E3233874();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E3233BE4();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)imageDidLoad:(id)a3
{
  uint64_t v4 = sub_1E3875C38();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1E3875BE8();
  v8 = self;
  sub_1E3234BF0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end