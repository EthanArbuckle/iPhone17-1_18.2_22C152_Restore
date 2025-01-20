@interface LocationSearchCompleter
- (_TtC7Weather23LocationSearchCompleter)init;
- (void)completer:(id)a3 didFailWithError:(id)a4;
- (void)completerDidUpdateResults:(id)a3;
@end

@implementation LocationSearchCompleter

- (_TtC7Weather23LocationSearchCompleter)init
{
}

- (void).cxx_destruct
{
  sub_1001361AC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Weather23LocationSearchCompleter_onUpdate));
  sub_1001361AC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Weather23LocationSearchCompleter_onError));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Weather23LocationSearchCompleter_searchCompleter);
}

- (void)completerDidUpdateResults:(id)a3
{
  id v4 = a3;
  v5 = self;
  LocationSearchCompleter.completerDidUpdateResults(_:)((MKLocalSearchCompleter)v5);
}

- (void)completer:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  LocationSearchCompleter.completer(_:didFailWithError:)((uint64_t)v7, (uint64_t)v8);
}

@end