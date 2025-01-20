@interface TagEditingCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC11MobileNotes14TagEditingCell)initWithCoder:(id)a3;
- (_TtC11MobileNotes14TagEditingCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)textChanged:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation TagEditingCell

- (_TtC11MobileNotes14TagEditingCell)initWithFrame:(CGRect)a3
{
  return (_TtC11MobileNotes14TagEditingCell *)sub_100338EE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11MobileNotes14TagEditingCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes14TagEditingCell *)sub_10033907C(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_100339418((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(TagEditingCell *)v5 ic_viewControllerManager];
  if (v6)
  {
    v7 = v6;
    unsigned __int8 v8 = [v6 isSplitViewExpandingOrCollapsing];

    if (v8) {
      return 0;
    }
  }
  else
  {
  }
  return 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_10033A838();

  return self & 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;
  id v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_10033A944(v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes14TagEditingCell_textField);
  id v5 = a3;
  id v6 = self;
  id v7 = [v4 text];
  if (v7)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();

    [v4 resignFirstResponder];
  }

  return v7 != 0;
}

- (void)textChanged:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_100339CD4();

  sub_10002B754((uint64_t)v6, &qword_10069B4D0);
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10033AA98();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes14TagEditingCell_hashtag));
  sub_10002B754((uint64_t)self + OBJC_IVAR____TtC11MobileNotes14TagEditingCell_tagEditingCellRenameDelegate, (uint64_t *)&unk_1006A3380);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes14TagEditingCell____lazy_storage___listContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes14TagEditingCell_textField));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes14TagEditingCell_tagObjectID);
}

@end