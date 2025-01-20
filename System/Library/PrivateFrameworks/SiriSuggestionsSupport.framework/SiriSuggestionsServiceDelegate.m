@interface SiriSuggestionsServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate)init;
@end

@implementation SiriSuggestionsServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1C69B92A4((int)v8, v7);

  return v9 & 1;
}

- (_TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate)init
{
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC22SiriSuggestionsSupport30SiriSuggestionsServiceDelegate_eventDrivenClient;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end