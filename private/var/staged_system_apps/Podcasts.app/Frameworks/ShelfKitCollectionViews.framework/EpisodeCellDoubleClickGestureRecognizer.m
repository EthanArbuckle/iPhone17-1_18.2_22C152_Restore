@interface EpisodeCellDoubleClickGestureRecognizer
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer)init;
- (_TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
@end

@implementation EpisodeCellDoubleClickGestureRecognizer

- (_TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer)init
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for EpisodeCellDoubleClickGestureRecognizer();
  v2 = [(EpisodeCellDoubleClickGestureRecognizer *)&v4 initWithTarget:0 action:0];
  [(EpisodeCellDoubleClickGestureRecognizer *)v2 setDelegate:v2];
  [(EpisodeCellDoubleClickGestureRecognizer *)v2 setNumberOfTapsRequired:2];
  [(EpisodeCellDoubleClickGestureRecognizer *)v2 setCancelsTouchesInView:0];
  [(EpisodeCellDoubleClickGestureRecognizer *)v2 setDelaysTouchesBegan:0];
  [(EpisodeCellDoubleClickGestureRecognizer *)v2 setDelaysTouchesEnded:0];

  return v2;
}

- (_TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_385640();
    swift_unknownObjectRelease();
  }
  result = (_TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  v7 = (_TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer *)a4;
  v8 = self;
  v9 = (_TtC23ShelfKitCollectionViews39EpisodeCellDoubleClickGestureRecognizer *)[(EpisodeCellDoubleClickGestureRecognizer *)v7 view];
  if (v9)
  {
    v10 = v9;
    self;
    char v11 = swift_dynamicCastObjCClass() == 0;

    v7 = v8;
    v8 = v10;
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

@end