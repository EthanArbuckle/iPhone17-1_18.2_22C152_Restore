@interface PersonalizationFeedbackCollectionViewCell
- (_TtC8AppStore41PersonalizationFeedbackCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore41PersonalizationFeedbackCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)didTapSubmitButton:(id)a3;
- (void)feedbackButtonSelectedWithFeedbackOptioButton:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation PersonalizationFeedbackCollectionViewCell

- (_TtC8AppStore41PersonalizationFeedbackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore41PersonalizationFeedbackCollectionViewCell *)sub_100744A0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore41PersonalizationFeedbackCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1007497D0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100745394();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1007462D8();
}

- (void)feedbackButtonSelectedWithFeedbackOptioButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1007464FC(v4);
}

- (void)didTapSubmitButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100749BD4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_feedbackDescription));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_selectedOptionBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_submitButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_buttonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_dividerView));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_didSelectFeedbackOption));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore41PersonalizationFeedbackCollectionViewCell_didSelectSubmitButton);

  sub_10006012C(v3);
}

@end