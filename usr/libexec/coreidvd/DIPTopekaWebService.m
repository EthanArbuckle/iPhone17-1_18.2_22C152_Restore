@interface DIPTopekaWebService
@end

@implementation DIPTopekaWebService

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8coreidvd19DIPTopekaWebService_redirectRetrier;
  uint64_t v4 = type metadata accessor for DIPRetrier();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8coreidvd19DIPTopekaWebService_authRetrier, v4);
  v5((char *)self + OBJC_IVAR____TtC8coreidvd19DIPTopekaWebService_retrier, v4);
  v6 = (char *)self + OBJC_IVAR____TtC8coreidvd19DIPTopekaWebService_selfHealer;

  sub_100025D08((uint64_t)v6);
}

@end