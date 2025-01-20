@interface LocationManager
- (_TtC29SiriNotebookSuggestionsPlugin15LocationManager)init;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation LocationManager

- (_TtC29SiriNotebookSuggestionsPlugin15LocationManager)init
{
  return (_TtC29SiriNotebookSuggestionsPlugin15LocationManager *)sub_FD14();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10060(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC29SiriNotebookSuggestionsPlugin15LocationManager_locationManager));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC29SiriNotebookSuggestionsPlugin15LocationManager_locationQueue);
}

@end