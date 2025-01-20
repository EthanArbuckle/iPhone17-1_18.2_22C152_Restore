@interface FMNoItemView
- (_TtC6FindMy12FMNoItemView)initWithCoder:(id)a3;
- (void)dealloc;
- (void)handleAction;
- (void)handleLearnMoreButton;
- (void)handleSecondaryAction;
- (void)handleTertiaryAction;
@end

@implementation FMNoItemView

- (_TtC6FindMy12FMNoItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10047213C();
}

- (void)dealloc
{
  v2 = self;
  sub_100470BA4();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for FMNoItemView();
  [(FMNoItemView *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy12FMNoItemView_secondaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy12FMNoItemView_secondaryActionButtonHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy12FMNoItemView_tertiaryActionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy12FMNoItemView_tertiaryActionButtonHeight));
  swift_release();
  swift_unknownObjectRelease();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMNoItemView_learnMoreButton);
}

- (void)handleAction
{
  v2 = self;
  sub_1004710E8();
}

- (void)handleSecondaryAction
{
  v2 = self;
  sub_100471334();
}

- (void)handleTertiaryAction
{
  v2 = self;
  sub_10047138C();
}

- (void)handleLearnMoreButton
{
  v2 = self;
  sub_1004715F8();
}

@end