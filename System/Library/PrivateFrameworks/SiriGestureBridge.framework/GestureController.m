@interface GestureController
- (_TtC17SiriGestureBridge17GestureController)init;
- (void)didDetectedError;
- (void)didDetectedWithHeadGesture:(id)a3;
- (void)didStartStreamingWithIsStreaming:(BOOL)a3;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
@end

@implementation GestureController

- (void)didDetectedWithHeadGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_25C8810C0();
}

- (void)didDetectedError
{
  v2 = self;
  sub_25C8825DC();
}

- (void)didStartStreamingWithIsStreaming:(BOOL)a3
{
  id v4 = self;
  sub_25C88267C(a3);
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  id v8 = a3;
  v9 = self;
  sub_25C886950((uint64_t)v9, a4, a5);
}

- (_TtC17SiriGestureBridge17GestureController)init
{
}

- (void).cxx_destruct
{
  sub_25C87D938((uint64_t)self + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_sessionState, &qword_26B355500);
  sub_25C87D938((uint64_t)self + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_gestureMapping, &qword_26A5D8BD8);
  sub_25C88A468((uint64_t)self + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_delegate);

  sub_25C88A490((uint64_t)self + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_headGestureDeduper, (void (*)(void))type metadata accessor for EventDeduper);
  sub_25C87D938((uint64_t)self + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastPromptInfo, (uint64_t *)&unk_26B355210);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_siriObserverQueue));
  sub_25C87D938((uint64_t)self + OBJC_IVAR____TtC17SiriGestureBridge17GestureController_lastActionEventId, &qword_26B3554E0);
}

@end