@interface TTRIIntentsSnippetReminderViewCell
- (UILabel)contactTriggerLabel;
- (UILabel)locationTriggerLabel;
- (UILabel)timeTriggerLabel;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (_TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell)initWithCoder:(id)a3;
- (_TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)didTapAppLinkButton:(id)a3;
- (void)didTapCompleteButton:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContactTriggerLabel:(id)a3;
- (void)setLocationTriggerLabel:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTimeTriggerLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation TTRIIntentsSnippetReminderViewCell

- (void)prepareForReuse
{
  v2 = self;
  sub_100016D70();
}

- (UILabel)titleLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)timeTriggerLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setTimeTriggerLabel:(id)a3
{
}

- (UILabel)locationTriggerLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setLocationTriggerLabel:(id)a3
{
}

- (UILabel)contactTriggerLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setContactTriggerLabel:(id)a3
{
}

- (UIStackView)stackView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIStackView *)Strong;
}

- (void)setStackView:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100017074();
}

- (void)didTapCompleteButton:(id)a3
{
}

- (void)didTapAppLinkButton:(id)a3
{
}

- (_TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_100021998();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell *)sub_1000188C8(a3, (uint64_t)a4, v6);
}

- (_TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell)initWithCoder:(id)a3
{
  return (_TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell *)sub_100018A70(a3);
}

- (void).cxx_destruct
{
  sub_100018F48((uint64_t)self + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_viewModel, (uint64_t)v3);
  sub_1000194D0(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10001915C);
  sub_100019204((uint64_t)self + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell_delegate);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_1000190DC(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton), *(void **)&self->viewModel[OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___completedButton]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___flaggedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC27RemindersIntentsUIExtension34TTRIIntentsSnippetReminderViewCell____lazy_storage___appLinkIconView));
}

@end