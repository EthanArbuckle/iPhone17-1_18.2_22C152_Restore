@interface WalkSuggestionCollectionViewCell
- (_TtC10FitnessApp32WalkSuggestionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp32WalkSuggestionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation WalkSuggestionCollectionViewCell

- (_TtC10FitnessApp32WalkSuggestionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp32WalkSuggestionCollectionViewCell *)sub_10044E7C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp32WalkSuggestionCollectionViewCell)initWithCoder:(id)a3
{
  return 0;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WalkSuggestionCollectionViewCell();
  v2 = (char *)v3.receiver;
  [(WalkSuggestionCollectionViewCell *)&v3 prepareForReuse];
  [*(id *)&v2[OBJC_IVAR____TtC10FitnessApp32WalkSuggestionCollectionViewCell_timeLabel] setAttributedText:0 v3.receiver, v3.super_class];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32WalkSuggestionCollectionViewCell_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32WalkSuggestionCollectionViewCell_workoutView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32WalkSuggestionCollectionViewCell_workoutIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32WalkSuggestionCollectionViewCell_workoutBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32WalkSuggestionCollectionViewCell_labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp32WalkSuggestionCollectionViewCell_timeLabel));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp32WalkSuggestionCollectionViewCell_descriptionLabel);
}

@end