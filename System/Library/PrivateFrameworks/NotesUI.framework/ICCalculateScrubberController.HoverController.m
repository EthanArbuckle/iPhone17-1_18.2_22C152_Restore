@interface ICCalculateScrubberController.HoverController
- (_TtCE7NotesUICSo29ICCalculateScrubberController15HoverController)init;
- (void)showScrubber;
@end

@implementation ICCalculateScrubberController.HoverController

- (void)showScrubber
{
  uint64_t v3 = MEMORY[0x1B3E9F7C0]((char *)self + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_scrubberController, a2);
  if (v3)
  {
    uint64_t v4 = *(uint64_t *)((char *)&self->super.isa
                    + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_numberLiteral);
    id v6 = (id)v3;
    v5 = self;
    objc_msgSend(v6, sel_showScrubberForNumberLiteral_isCompact_, v4, 1);
  }
}

- (_TtCE7NotesUICSo29ICCalculateScrubberController15HoverController)init
{
  result = (_TtCE7NotesUICSo29ICCalculateScrubberController15HoverController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController_numberLiteral));
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCE7NotesUICSo29ICCalculateScrubberController15HoverController____lazy_storage___showScrubberDelayer);
}

@end