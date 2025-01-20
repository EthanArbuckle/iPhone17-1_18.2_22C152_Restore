@interface _UISwipeDownGestureRecognizer
- (BOOL)_willScrollX;
- (BOOL)_willScrollY;
- (_TtC5UIKit29_UISwipeDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (int64_t)state;
- (void)setState:(int64_t)a3;
@end

@implementation _UISwipeDownGestureRecognizer

- (_TtC5UIKit29_UISwipeDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_186A1F1CC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  return (_TtC5UIKit29_UISwipeDownGestureRecognizer *)sub_1858B7CF8((uint64_t)v6, (uint64_t)a4);
}

- (BOOL)_willScrollX
{
  return 0;
}

- (BOOL)_willScrollY
{
  v2 = self;
  char v3 = sub_185A056D0();

  return v3 & 1;
}

- (int64_t)state
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(UIGestureRecognizer *)&v3 state];
}

- (void)setState:(int64_t)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v10.receiver = self;
  v10.super_class = ObjectType;
  v6 = self;
  [(UIGestureRecognizer *)&v10 setState:a3];
  v9.receiver = v6;
  v9.super_class = ObjectType;
  if ((id)[(UIGestureRecognizer *)&v9 state] == (id)1)
  {
    v7 = [(UIGestureRecognizer *)v6 view];
    if (v7)
    {
      v8 = (_TtC5UIKit29_UISwipeDownGestureRecognizer *)v7;
      [(UIPanGestureRecognizer *)v6 translationInView:v7];
      [(UIPanGestureRecognizer *)v6 setTranslation:v8 inView:0.0];

      v6 = v8;
    }
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit29_UISwipeDownGestureRecognizer_lastTouchPoint));
}

@end