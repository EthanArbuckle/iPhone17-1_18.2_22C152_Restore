@interface KRLWebService
@end

@implementation KRLWebService

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8coreidvd13KRLWebService_baseURL;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8coreidvd13KRLWebService_validator;

  _s8coreidvd24DigitalPresentmentHelperVwxx_0((uint64_t)v5);
}

@end