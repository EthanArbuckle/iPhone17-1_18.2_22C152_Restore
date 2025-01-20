@interface BacklightMonitor
- (_TtC17proximitycontrold16BacklightMonitor)init;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)dealloc;
@end

@implementation BacklightMonitor

- (_TtC17proximitycontrold16BacklightMonitor)init
{
  return (_TtC17proximitycontrold16BacklightMonitor *)sub_10001C294();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17proximitycontrold16BacklightMonitor_backlight);
  v3 = self;
  [v2 removeObserver:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for BacklightMonitor();
  [(BacklightMonitor *)&v4 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  swift_unknownObjectRetain();
  id v8 = a5;
  v9 = self;
  sub_10001C5CC(a4, a5);
  swift_unknownObjectRelease();
}

@end