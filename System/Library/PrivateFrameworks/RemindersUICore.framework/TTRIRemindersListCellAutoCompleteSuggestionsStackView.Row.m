@interface TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityLabel;
- (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row)initWithArrangedSubviews:(id)a3;
- (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row)initWithCoder:(id)a3;
- (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row)initWithFrame:(CGRect)a3;
- (void)accessibilityElementDidBecomeFocused;
- (void)accessibilityElementDidLoseFocus;
- (void)didHover:(id)a3;
- (void)didTap:(id)a3;
- (void)layoutSubviews;
@end

@implementation TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row

- (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_suggestionDelegate) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_configuration);
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  v5[2] = 0u;
  v5[3] = 0u;
  v5[4] = 0u;
  v5[5] = 0u;
  v5[6] = 0u;
  v5[7] = 0u;
  v5[8] = 0u;
  v5[9] = 0u;
  v5[10] = 0u;
  v5[11] = 0u;
  v5[12] = 0u;
  v5[13] = 0u;
  id v6 = a3;

  result = (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void)didTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B94E4314();
}

- (void)didHover:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1B94E2728(v4);
}

- (NSString)accessibilityLabel
{
  v2 = self;
  TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row.accessibilityLabel.getter();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B996E9B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return (NSString *)v5;
}

- (NSArray)accessibilityUserInputLabels
{
  v2 = self;
  uint64_t v3 = TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row.accessibilityUserInputLabels.getter();

  if (v3)
  {
    uint64_t v4 = (void *)sub_1B996EE40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (NSArray *)v4;
}

- (void)accessibilityElementDidBecomeFocused
{
  v2 = self;
  TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row.accessibilityElementDidBecomeFocused()();
}

- (void)accessibilityElementDidLoseFocus
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row *)&v3 accessibilityElementDidLoseFocus];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_backgroundHighlight], sel_setHidden_, 1, v3.receiver, v3.super_class);
}

- (void)layoutSubviews
{
  v2 = self;
  TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row.layoutSubviews()();
}

- (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row)initWithFrame:(CGRect)a3
{
}

- (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row)initWithArrangedSubviews:(id)a3
{
  result = (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self+ OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_suggestionDelegate);
  swift_unknownObjectWeakDestroy();
  sub_1B94E3A30((uint64_t)self+ OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_backgroundHighlight));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_imagesView);
}

@end