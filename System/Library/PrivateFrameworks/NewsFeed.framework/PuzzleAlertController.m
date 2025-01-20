@interface PuzzleAlertController
- (BOOL)canBecomeFirstResponder;
- (NSArray)keyCommands;
- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController)initWithCoder:(id)a3;
- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didPressKey:(id)a3;
@end

@implementation PuzzleAlertController

- (NSArray)keyCommands
{
  swift_beginAccess();
  sub_1BFC39268(0, &qword_1EA1A54F0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1C151EBAC();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)didPressKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C0C7E3DC(v4);
}

- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1C151E62C();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_handler);
  void *v8 = 0;
  v8[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_events) = (Class)MEMORY[0x1E4FBC868];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_commands) = (Class)MEMORY[0x1E4FBC860];
  id v9 = a4;
  if (v7)
  {
    v10 = (void *)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for PuzzleAlertController();
  v11 = [(PuzzleAlertController *)&v13 initWithNibName:v10 bundle:a4];

  return v11;
}

- (_TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController)initWithCoder:(id)a3
{
  id v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_handler);
  *id v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_events) = (Class)MEMORY[0x1E4FBC868];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_commands) = (Class)MEMORY[0x1E4FBC860];
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PuzzleAlertController();
  return [(PuzzleAlertController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1BFC3E5C0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8NewsFeedP33_B3216C832986877D01E235539593604B21PuzzleAlertController_handler));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end