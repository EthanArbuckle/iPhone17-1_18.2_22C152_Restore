@interface RingerSwitchObserver
- (_TtC17SequoiaTranslator20RingerSwitchObserver)init;
- (void)dealloc;
@end

@implementation RingerSwitchObserver

- (_TtC17SequoiaTranslator20RingerSwitchObserver)init
{
  return (_TtC17SequoiaTranslator20RingerSwitchObserver *)sub_10018D700();
}

- (void)dealloc
{
  int v2 = *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator20RingerSwitchObserver_token);
  v3 = self;
  if (v2 != -1) {
    notify_cancel(v2);
  }
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for RingerSwitchObserver();
  [(RingerSwitchObserver *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end