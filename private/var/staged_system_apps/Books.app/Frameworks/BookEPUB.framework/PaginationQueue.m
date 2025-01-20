@interface PaginationQueue
- (_TtC8BookEPUB15PaginationQueue)init;
@end

@implementation PaginationQueue

- (_TtC8BookEPUB15PaginationQueue)init
{
  return (_TtC8BookEPUB15PaginationQueue *)PaginationQueue.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB15PaginationQueue_log;
  uint64_t v4 = sub_2FB8A0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end