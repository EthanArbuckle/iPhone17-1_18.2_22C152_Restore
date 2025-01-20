@interface TTRIPinnedListsView
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)isUserInteractionEnabled;
- (_TtC9Reminders19TTRIPinnedListsView)initWithArrangedSubviewRows:(id)a3;
- (_TtC9Reminders19TTRIPinnedListsView)initWithCoder:(id)a3;
- (_TtC9Reminders19TTRIPinnedListsView)initWithFrame:(CGRect)a3;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (void)didSelectControl:(id)a3;
- (void)didTapControl:(id)a3;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(void *)a3 sessionDidEnter:;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation TTRIPinnedListsView

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIPinnedListsView();
  id v4 = v5.receiver;
  [(TTRIPinnedListsView *)&v5 setUserInteractionEnabled:v3];
  sub_10001AF94();
}

- (BOOL)isUserInteractionEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRIPinnedListsView();
  return [(TTRIPinnedListsView *)&v3 isUserInteractionEnabled];
}

- (_TtC9Reminders19TTRIPinnedListsView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders19TTRIPinnedListsView *)sub_10001273C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders19TTRIPinnedListsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002EAF70();
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (void)didTapControl:(id)a3
{
  if (a3)
  {
    objc_super v5 = self;
    id v4 = a3;
    sub_1002EA51C(v4, 1);
  }
}

- (void)didSelectControl:(id)a3
{
  if ((self->NUIContainerGridView_opaque[OBJC_IVAR____TtC9Reminders19TTRIPinnedListsView_selectionFollowsFocus] & 1) == 0
    && a3)
  {
    id v4 = self;
    objc_super v5 = (_TtC9Reminders19TTRIPinnedListsView *)a3;
    v6 = (_TtC9Reminders19TTRIPinnedListsView *)[(TTRIPinnedListsView *)v5 view];
    if (v6)
    {
      v8 = v6;
      type metadata accessor for TTRIPinnedListControl();
      v7 = (void *)swift_dynamicCastClass();
      if (v7) {
        sub_1002EA51C(v7, 0);
      }

      objc_super v5 = v4;
    }
    else
    {
      v8 = v4;
    }
  }
}

- (_TtC9Reminders19TTRIPinnedListsView)initWithArrangedSubviewRows:(id)a3
{
  result = (_TtC9Reminders19TTRIPinnedListsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  char v8 = sub_1002EB0D8(a4);

  swift_unknownObjectRelease();
  return v8 & 1;
}

- (void)dropInteraction:(void *)a3 sessionDidEnter:
{
  uint64_t v5 = sub_10003B754(&qword_100798708);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  id v9 = a3;
  swift_unknownObjectRetain();
  id v10 = a1;
  sub_1002E9200((uint64_t)v7);
  sub_10003B6F8((uint64_t)v7, &qword_100798708);

  swift_unknownObjectRelease();
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  id v8 = sub_1002EB168(a4);

  swift_unknownObjectRelease();

  return v8;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1002EB5B0(a4);

  swift_unknownObjectRelease();
}

@end