@interface ContextMenuPrefetchOperation
- (_TtC8VideosUIP33_9818532A754D521898293EBAF3645FE528ContextMenuPrefetchOperation)init;
- (void)executionDidBegin;
@end

@implementation ContextMenuPrefetchOperation

- (void)executionDidBegin
{
  v2 = self;
  sub_1E36BA61C();
}

- (_TtC8VideosUIP33_9818532A754D521898293EBAF3645FE528ContextMenuPrefetchOperation)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_9818532A754D521898293EBAF3645FE528ContextMenuPrefetchOperation_documentDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUIP33_9818532A754D521898293EBAF3645FE528ContextMenuPrefetchOperation_appContext));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end