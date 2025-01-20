@interface CRLiOSFolderGridViewController.SingleContinuousTouchGestureRecognizer
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (_TtCC8Freeform30CRLiOSFolderGridViewController38SingleContinuousTouchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CRLiOSFolderGridViewController.SingleContinuousTouchGestureRecognizer

- (_TtCC8Freeform30CRLiOSFolderGridViewController38SingleContinuousTouchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
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
  return (_TtCC8Freeform30CRLiOSFolderGridViewController38SingleContinuousTouchGestureRecognizer *)sub_100D9C788((uint64_t)v6, (uint64_t)a4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_10050BF48(0, &qword_10169B4B0);
  sub_10062E0F4(&qword_10169B4B8, &qword_10169B4B0);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  v8 = self;
  sub_100D9C9A4(v6, (uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)reset
{
  v2 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController38SingleContinuousTouchGestureRecognizer_trackedTouch);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController38SingleContinuousTouchGestureRecognizer_trackedTouch) = 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController38SingleContinuousTouchGestureRecognizer_trackedTouch));
}

@end