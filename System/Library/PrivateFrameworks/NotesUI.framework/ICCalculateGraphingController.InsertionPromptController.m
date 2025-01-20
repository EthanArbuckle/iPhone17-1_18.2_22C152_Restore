@interface ICCalculateGraphingController.InsertionPromptController
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (_TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController)init;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (void)documentControllerDidUpdate:(id)a3;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)noteDidPerformMerge:(id)a3;
- (void)noteWillPerformMerge:(id)a3;
- (void)promptTimerDidFire:(id)a3;
- (void)textViewDidChangeText:(id)a3;
@end

@implementation ICCalculateGraphingController.InsertionPromptController

- (void)promptTimerDidFire:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B0ABDA0C();
}

- (void)noteWillPerformMerge:(id)a3
{
  uint64_t v4 = sub_1B0B7F86C();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B0B7F82C();
  *((unsigned char *)&self->super.isa
  + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_noteIsMerging) = 1;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)noteDidPerformMerge:(id)a3
{
}

- (void)documentControllerDidUpdate:(id)a3
{
}

- (void)textViewDidChangeText:(id)a3
{
}

- (_TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController)init
{
  result = (_TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1B0ABD72C(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_state), *(void **)&self->graphingController[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_state], self->state[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_state]);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_editMenuInteraction);
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  double v9 = sub_1B0ABDB84();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  if (self->state[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_state] == 1) {
    id v5 = objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_state), sel_makeMenu, a3, a4, a5);
  }
  else {
    id v5 = 0;
  }
  return v5;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  if (self->state[OBJC_IVAR____TtCE7NotesUICSo29ICCalculateGraphingController25InsertionPromptController_state] == 1)
  {
    id v7 = a3;
    id v8 = a4;
    swift_unknownObjectRetain();
    double v9 = self;
    sub_1B0ABBCD0(0, 0, 2);

    swift_unknownObjectRelease();
  }
}

@end