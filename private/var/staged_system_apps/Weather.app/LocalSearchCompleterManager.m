@interface LocalSearchCompleterManager
- (_TtC7Weather27LocalSearchCompleterManager)init;
- (void)completer:(id)a3 didFailWithError:(id)a4;
- (void)completerDidUpdateResults:(id)a3;
@end

@implementation LocalSearchCompleterManager

- (_TtC7Weather27LocalSearchCompleterManager)init
{
  return (_TtC7Weather27LocalSearchCompleterManager *)LocalSearchCompleterManager.init()();
}

- (void).cxx_destruct
{
  sub_100289798((uint64_t)self + OBJC_IVAR____TtC7Weather27LocalSearchCompleterManager_delegate);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7Weather27LocalSearchCompleterManager____lazy_storage___searchCompleter);
}

- (void)completerDidUpdateResults:(id)a3
{
  id v4 = a3;
  v5 = self;
  LocalSearchCompleterManager.completerDidUpdateResults(_:)((MKLocalSearchCompleter)v5);
}

- (void)completer:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  LocalSearchCompleterManager.completer(_:didFailWithError:)((uint64_t)v7, (uint64_t)v8);
}

@end