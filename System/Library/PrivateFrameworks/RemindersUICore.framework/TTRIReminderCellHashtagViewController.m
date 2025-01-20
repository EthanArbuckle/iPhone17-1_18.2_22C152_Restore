@interface TTRIReminderCellHashtagViewController
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (_TtC15RemindersUICore37TTRIReminderCellHashtagViewController)init;
- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation TTRIReminderCellHashtagViewController

- (_TtC15RemindersUICore37TTRIReminderCellHashtagViewController)init
{
  result = (_TtC15RemindersUICore37TTRIReminderCellHashtagViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_hashtagsAttributedText));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_uncommittedHashtagsFont));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_uncommittedHashtagsBoldFont));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_committedHashtagsFont));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController____lazy_storage___committedHashtagsBoldFont));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_uncommittedTagsColor));
  swift_unknownObjectRelease();
  swift_release();
  sub_1B93FCD20(*(void **)((char *)&self->super.isa
                         + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_lastTextChangeDetail));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_descriptionAndTagsView);
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1B947977C((uint64_t)v4);

  return self & 1;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B94798E8(v4);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B9479AD4(v4);
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B9479C78(v4);
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B9479F10();
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = sub_1B996E9F0();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1B947A17C((uint64_t)v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  Swift::Int length = a4.length;
  Swift::Int location = a4.location;
  sub_1B90BFD68(0, (unint64_t *)&unk_1E9F00990);
  uint64_t v9 = sub_1B996EE50();
  type metadata accessor for TTRIReminderTitleTextView();
  if (swift_dynamicCastClass())
  {
    id v10 = a3;
    unint64_t v11 = self;
    v12.Swift::Int location = location;
    v12.Swift::Int length = length;
    v13 = (void *)TTRIReminderTitleTextView.editMenuForTextIn(_:suggestedActions:)(v12, (Swift::OpaquePointer)v9);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v13 = 0;
  }

  return v13;
}

@end