@interface MTSearchRequest
- (MTSearchRequest)init;
- (MTSearchRequest)initWithTerm:(id)a3 contentTypes:(id)a4;
- (void)performWithCompletion:(id)a3;
- (void)setLimit:(int64_t)a3;
@end

@implementation MTSearchRequest

- (MTSearchRequest)initWithTerm:(id)a3 contentTypes:(id)a4
{
  uint64_t v4 = sub_1ACE761B8();
  uint64_t v6 = v5;
  uint64_t v7 = sub_1ACE76578();
  return (MTSearchRequest *)SearchRequest.init(term:contentTypes:)(v4, v6, v7);
}

- (void)setLimit:(int64_t)a3
{
  v3 = (char *)self + OBJC_IVAR___MTSearchRequest_limit;
  *(void *)v3 = a3;
  v3[8] = 0;
}

- (void)performWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  sub_1ACC2CA94((uint64_t)sub_1ACA50AB0, v5);

  swift_release();
}

- (MTSearchRequest)init
{
  result = (MTSearchRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end