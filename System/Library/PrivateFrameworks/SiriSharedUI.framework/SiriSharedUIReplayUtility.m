@interface SiriSharedUIReplayUtility
+ (_TtC12SiriSharedUI25SiriSharedUIReplayUtility)shared;
- (BOOL)hasContentAt:(CGPoint)a3;
- (BOOL)shouldSkipAutoDismissal;
- (_TtC12SiriSharedUI25SiriSharedUIReplayUtility)init;
- (void)addReplayControlTo:(id)a3;
- (void)receivedWithCommand:(id)a3;
- (void)registerWithReplayCallback:(id)a3;
- (void)speechRecognized:(id)a3;
@end

@implementation SiriSharedUIReplayUtility

+ (_TtC12SiriSharedUI25SiriSharedUIReplayUtility)shared
{
  if (qword_2676EB770 != -1) {
    swift_once();
  }
  v2 = (void *)qword_2676ED3C8;
  return (_TtC12SiriSharedUI25SiriSharedUIReplayUtility *)v2;
}

- (_TtC12SiriSharedUI25SiriSharedUIReplayUtility)init
{
  return (_TtC12SiriSharedUI25SiriSharedUIReplayUtility *)sub_20CA613A4();
}

- (void)addReplayControlTo:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20CA61528(v4);
}

- (void)receivedWithCommand:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20CA61AC8(v4);
}

- (void)registerWithReplayCallback:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_20CA62200((uint64_t)sub_20CA3AC98, v5);

  swift_release();
}

- (void)speechRecognized:(id)a3
{
  uint64_t v4 = sub_20CA82F08();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12SiriSharedUI25SiriSharedUIReplayUtility_currentUtterance);
  uint64_t *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)hasContentAt:(CGPoint)a3
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12SiriSharedUI25SiriSharedUIReplayUtility_viewHostingController);
  if (v3)
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    uint64_t v6 = self;
    id v7 = v3;
    id v8 = objc_msgSend(v7, sel_view);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, sel_frame);
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;

      v20.origin.CGFloat x = v11;
      v20.origin.CGFloat y = v13;
      v20.size.width = v15;
      v20.size.height = v17;
      v19.CGFloat x = x;
      v19.CGFloat y = y;
      LOBYTE(v9) = CGRectContainsPoint(v20, v19);

      LOBYTE(v8) = (_BYTE)v9;
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return (char)v8;
}

- (BOOL)shouldSkipAutoDismissal
{
  v2 = self;
  char v3 = sub_20CA62564();

  return v3 & 1;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI25SiriSharedUIReplayUtility_savedAceObjects));
  sub_20CA0CDD4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12SiriSharedUI25SiriSharedUIReplayUtility_storedCallback));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI25SiriSharedUIReplayUtility_viewHostingController));
  swift_release();
}

@end