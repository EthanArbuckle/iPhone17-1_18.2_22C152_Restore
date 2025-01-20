@interface DebugFormatUploadDiffGutterView
- (_TtC8NewsFeed31DebugFormatUploadDiffGutterView)initWithCoder:(id)a3;
- (_TtC8NewsFeed31DebugFormatUploadDiffGutterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation DebugFormatUploadDiffGutterView

- (_TtC8NewsFeed31DebugFormatUploadDiffGutterView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadDiffGutterView_contentSize);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadDiffGutterView_contentInsets);
  long long v6 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
  _OWORD *v5 = *MEMORY[0x1E4FB2848];
  v5[1] = v6;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadDiffGutterView_numberOfLines) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeed31DebugFormatUploadDiffGutterView_changedHunkRanges) = (Class)MEMORY[0x1E4FBC860];
  id v7 = a3;

  result = (_TtC8NewsFeed31DebugFormatUploadDiffGutterView *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C1504BC0();
}

- (_TtC8NewsFeed31DebugFormatUploadDiffGutterView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed31DebugFormatUploadDiffGutterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end