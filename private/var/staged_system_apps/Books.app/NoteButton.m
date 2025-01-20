@interface NoteButton
- (NSArray)accessibilityUserInputLabels;
- (_TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton)initWithCoder:(id)a3;
- (_TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton)initWithFrame:(CGRect)a3;
@end

@implementation NoteButton

- (_TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton)initWithFrame:(CGRect)a3
{
  return (_TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton *)sub_1007E11EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton_annotation) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton_associatedHighlightText);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton *)sub_1007FF260();
  __break(1u);
  return result;
}

- (NSArray)accessibilityUserInputLabels
{
  v2 = self;
  uint64_t v3 = sub_1007E1AB4();

  if (v3)
  {
    v4.super.isa = sub_1007FDFE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end