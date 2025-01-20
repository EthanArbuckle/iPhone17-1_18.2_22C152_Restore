@interface ResizeGestureRecognizer
- (_TtC8PaperKitP33_625D4AAB7AD9DA9F2F4DB07EDC29229023ResizeGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (int64_t)state;
- (void)setState:(int64_t)a3;
@end

@implementation ResizeGestureRecognizer

- (int64_t)state
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ResizeGestureRecognizer();
  return [(ResizeGestureRecognizer *)&v3 state];
}

- (void)setState:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ResizeGestureRecognizer();
  id v4 = v11.receiver;
  [(ResizeGestureRecognizer *)&v11 setState:a3];
  id v5 = objc_msgSend(v4, sel_delegate, v11.receiver, v11.super_class);
  if (v5)
  {
    id v6 = v5;
    swift_getObjectType();
    uint64_t v7 = swift_conformsToProtocol2();
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    if (v7) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
    if (v9)
    {
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(id, uint64_t, uint64_t))(v8 + 8))(v4, ObjectType, v8);
    }

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC8PaperKitP33_625D4AAB7AD9DA9F2F4DB07EDC29229023ResizeGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
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
  return (_TtC8PaperKitP33_625D4AAB7AD9DA9F2F4DB07EDC29229023ResizeGestureRecognizer *)ResizeGestureRecognizer.init(target:action:)((uint64_t)v6, (uint64_t)a4);
}

@end