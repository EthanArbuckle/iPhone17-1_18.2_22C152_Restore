@interface ICCalculatePreviewBehaviorMenu
- (BOOL)isMathEnabled;
- (ICCalculatePreviewBehaviorMenu)init;
- (ICCalculatePreviewBehaviorMenu)initWithNote:(id)a3 isMathEnabled:(BOOL)a4;
- (ICNote)note;
- (id)makeMenu;
- (void)setNote:(id)a3;
@end

@implementation ICCalculatePreviewBehaviorMenu

- (ICNote)note
{
  v2 = (char *)self + OBJC_IVAR___ICCalculatePreviewBehaviorMenu_note;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x1B3E9F7C0](v2);
  return (ICNote *)v3;
}

- (void)setNote:(id)a3
{
}

- (BOOL)isMathEnabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICCalculatePreviewBehaviorMenu_isMathEnabled);
}

- (ICCalculatePreviewBehaviorMenu)initWithNote:(id)a3 isMathEnabled:(BOOL)a4
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICCalculatePreviewBehaviorMenu_allBehaviors) = (Class)&unk_1F096B710;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  *((unsigned char *)&self->super.isa + OBJC_IVAR___ICCalculatePreviewBehaviorMenu_isMathEnabled) = a4;
  v7.receiver = self;
  v7.super_class = (Class)ICCalculatePreviewBehaviorMenu;
  return [(ICCalculatePreviewBehaviorMenu *)&v7 init];
}

- (id)makeMenu
{
  v2 = self;
  v3 = (void *)ICCalculatePreviewBehaviorMenu.makeMenu()();

  return v3;
}

- (ICCalculatePreviewBehaviorMenu)init
{
  result = (ICCalculatePreviewBehaviorMenu *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
}

@end