@interface ClipImageFetchOperation
- (_TtC8VideosUI23ClipImageFetchOperation)init;
- (void)cancel;
- (void)executionDidBegin;
@end

@implementation ClipImageFetchOperation

- (void)executionDidBegin
{
  v2 = self;
  sub_1E34FBA8C();
}

- (void)cancel
{
  v2 = self;
  sub_1E34FBDD8();
}

- (_TtC8VideosUI23ClipImageFetchOperation)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8VideosUI23ClipImageFetchOperation_url;
  uint64_t v4 = sub_1E38760D8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1E34FB7D0(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8VideosUI23ClipImageFetchOperation_result), *(_WORD *)((char *)&self->super.super._iop.__prevOp + OBJC_IVAR____TtC8VideosUI23ClipImageFetchOperation_result));
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8VideosUI23ClipImageFetchOperation_imageProxy);
}

@end