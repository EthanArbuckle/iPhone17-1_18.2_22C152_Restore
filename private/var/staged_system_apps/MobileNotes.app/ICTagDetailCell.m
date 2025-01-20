@interface ICTagDetailCell
- (BOOL)showOperatorMenuButton;
- (ICTagDetailCell)initWithCoder:(id)a3;
- (ICTagDetailCell)initWithFrame:(CGRect)a3;
- (ICTagSelection)tagSelection;
- (NSAttributedString)attributedText;
- (NSString)text;
- (id)selectionOperatorChangeHandler;
- (int64_t)maxNumberOfLines;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setMaxNumberOfLines:(int64_t)a3;
- (void)setSelectionOperatorChangeHandler:(id)a3;
- (void)setShowOperatorMenuButton:(BOOL)a3;
- (void)setTagSelection:(id)a3;
- (void)setText:(id)a3;
- (void)updateForTagSelection:(id)a3 animated:(BOOL)a4;
@end

@implementation ICTagDetailCell

- (id)selectionOperatorChangeHandler
{
  if (*(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler))
  {
    uint64_t v2 = *(void *)&self->selectionOperatorChangeHandler[OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler];
    v5[4] = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1003E10DC;
    v5[3] = &unk_10063ACC8;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setSelectionOperatorChangeHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1001A36CC;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10002E70C(v8);
}

- (NSString)text
{
  if (*(void *)&self->selectionOperatorChangeHandler[OBJC_IVAR___ICTagDetailCell_text])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICTagDetailCell_text);
  uint64_t *v6 = v4;
  v6[1] = v5;
  v7 = self;
  swift_bridgeObjectRelease();
  sub_1003E12A8();
}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                       + OBJC_IVAR___ICTagDetailCell_attributedText));
}

- (void)setAttributedText:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1003E2F30(a3);
}

- (int64_t)maxNumberOfLines
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR___ICTagDetailCell_maxNumberOfLines);
}

- (void)setMaxNumberOfLines:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagDetailCell_maxNumberOfLines) = (Class)a3;
  [(ICTagDetailCell *)self setNeedsUpdateConfiguration];
}

- (ICTagSelection)tagSelection
{
  return (ICTagSelection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                   + OBJC_IVAR___ICTagDetailCell_tagSelection));
}

- (void)setTagSelection:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagDetailCell_tagSelection);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagDetailCell_tagSelection) = (Class)a3;
  id v6 = a3;
  uint64_t v5 = self;

  sub_1003E1458();
  sub_1003E1574();
}

- (BOOL)showOperatorMenuButton
{
  return *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagDetailCell_showOperatorMenuButton);
}

- (void)setShowOperatorMenuButton:(BOOL)a3
{
  uint64_t v4 = OBJC_IVAR___ICTagDetailCell_showOperatorMenuButton;
  *((unsigned char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagDetailCell_showOperatorMenuButton) = a3;
  id v6 = self;
  uint64_t v5 = sub_1003E17AC();
  v5[OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_preservesMenuLineHeight] = *((unsigned char *)&self->super.super.super.super.super.super.isa
                                                                                        + v4);

  sub_1003E1574();
  [(ICTagDetailCell *)v6 setNeedsUpdateConfiguration];
}

- (void)updateForTagSelection:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1003E18C0(v6, a4);
}

- (ICTagDetailCell)initWithFrame:(CGRect)a3
{
  return (ICTagDetailCell *)sub_1003E1AB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ICTagDetailCell)initWithCoder:(id)a3
{
  return (ICTagDetailCell *)sub_1003E1C8C(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_1003E1E54((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_10002E70C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagDetailCell_attributedText));

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagDetailCell____lazy_storage___allAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagDetailCell____lazy_storage___anyAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagDetailCell____lazy_storage___menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagDetailCell____lazy_storage___listContentView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR___ICTagDetailCell____lazy_storage___textView);
}

@end