@interface ICCalculateRecognitionController.ErrorInteractionController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4;
- (_TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController)init;
- (void)didTapTextView:(id)a3;
- (void)textViewDidChangeText:(id)a3;
@end

@implementation ICCalculateRecognitionController.ErrorInteractionController

- (void)didTapTextView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B0B6E85C(v4);
}

- (void)textViewDidChangeText:(id)a3
{
  uint64_t v4 = sub_1B0B7F86C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B7F82C();
  v8 = self;
  sub_1B0B6EDC4();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController)init
{
  result = (_TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_viewController));
  sub_1B0B6F218(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state), *(void *)&self->recognitionController[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state], *(void *)&self->viewController[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state], *(void *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state], *(void *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state+ 8], *(void *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state+ 16], *(void *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state+ 24], *(void *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state+ 32], *(void *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state+ 40], *(void *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state+ 48], *(void *)&self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state+ 56],
    self->state[OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_state + 64]);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCE7NotesUICSo32ICCalculateRecognitionController26ErrorInteractionController_errorMenuGestureRecognizer);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1B0B6F6C4(v7);

  return v9 & 1;
}

@end