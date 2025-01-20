@interface TTRIRemindersListBackgroundView
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4;
- (_TtC9Reminders31TTRIRemindersListBackgroundView)initWithCoder:(id)a3;
- (_TtC9Reminders31TTRIRemindersListBackgroundView)initWithFrame:(CGRect)a3;
- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4;
- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6;
- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)tapGestureAction:(id)a3;
@end

@implementation TTRIRemindersListBackgroundView

- (_TtC9Reminders31TTRIRemindersListBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders31TTRIRemindersListBackgroundView *)sub_10058557C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders31TTRIRemindersListBackgroundView)initWithCoder:(id)a3
{
  return (_TtC9Reminders31TTRIRemindersListBackgroundView *)sub_1005857AC(a3);
}

- (void)tapGestureAction:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    if (UIAccessibilityIsVoiceOverRunning()) {
      goto LABEL_7;
    }
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v5 = self;
    if (UIAccessibilityIsVoiceOverRunning())
    {
LABEL_7:

      goto LABEL_8;
    }
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(*(void *)(Strong + OBJC_IVAR____TtC9Reminders38TTRIRemindersListContentViewController_presenter)
                 + 64);
  uint64_t ObjectType = swift_getObjectType();
  v9 = *(void (**)(uint64_t, void, void, uint64_t, uint64_t))(v7 + 296);
  swift_unknownObjectRetain();
  v9(1, 0, 0, ObjectType, v7);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
LABEL_8:
  sub_10003D3BC((uint64_t)v10);
}

- (void).cxx_destruct
{
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders31TTRIRemindersListBackgroundView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIRemindersListBackgroundView_scribbleInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders31TTRIRemindersListBackgroundView_scribbleElementIdentifier));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders31TTRIRemindersListBackgroundView_ovalLayer);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return [a4 type] != 2;
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  uint64_t v7 = (void (**)(void *, Class, uint64_t))_Block_copy(a5);
  sub_10003B754((uint64_t *)&unk_1007894B0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10066D470;
  v9 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders31TTRIRemindersListBackgroundView_scribbleElementIdentifier);
  *(void *)(v8 + 32) = v9;
  specialized Array._endMutation()();
  id v10 = a3;
  v14 = self;
  id v11 = v9;
  uint64_t v12 = NSNotFound.getter();
  sub_10003B754(&qword_1007A8750);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v7[2](v7, isa, v12);
  swift_bridgeObjectRelease();

  _Block_release(v7);
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = sub_100585DC8();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  swift_unknownObjectRelease();
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  double v9 = _Block_copy(a6);
  _Block_copy(v9);
  id v10 = a3;
  swift_unknownObjectRetain();
  double v11 = self;
  sub_100585EB0((uint64_t)a4, (uint64_t)v11, (void (**)(void, void))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_unknownObjectRelease();
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 0;
}

@end