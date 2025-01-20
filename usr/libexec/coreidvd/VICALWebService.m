@interface VICALWebService
@end

@implementation VICALWebService

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8coreidvd15VICALWebService_url;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8coreidvd15VICALWebService_validator;

  _s8coreidvd24DigitalPresentmentHelperVwxx_0((uint64_t)v5);
}

@end