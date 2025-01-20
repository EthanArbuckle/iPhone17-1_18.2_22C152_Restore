@interface CatchAllPassiveGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (_TtC5Music32CatchAllPassiveGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
@end

@implementation CatchAllPassiveGestureRecognizer

- (_TtC5Music32CatchAllPassiveGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC5Music32CatchAllPassiveGestureRecognizer *)sub_1005CAF64((uint64_t)v6, (uint64_t)a4);
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music32CatchAllPassiveGestureRecognizer____lazy_storage___alwaysSimultaneousGestureRecognizerDelegate));
}

@end