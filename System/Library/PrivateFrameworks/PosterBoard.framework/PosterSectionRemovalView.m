@interface PosterSectionRemovalView
- (UIButton)deleteButton;
- (_TtC11PosterBoard24PosterSectionRemovalView)initWithCoder:(id)a3;
- (_TtC11PosterBoard24PosterSectionRemovalView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDeleteButton:(id)a3;
@end

@implementation PosterSectionRemovalView

- (UIButton)deleteButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_deleteButton));
}

- (void)setDeleteButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_deleteButton);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_deleteButton) = (Class)a3;
  id v3 = a3;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PosterSectionRemovalView();
  v2 = (char *)v4.receiver;
  [(PosterSectionRemovalView *)&v4 prepareForReuse];
  id v3 = &v2[OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_posterID];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;

  swift_bridgeObjectRelease();
}

- (_TtC11PosterBoard24PosterSectionRemovalView)initWithFrame:(CGRect)a3
{
  return (_TtC11PosterBoard24PosterSectionRemovalView *)sub_1D32E31AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11PosterBoard24PosterSectionRemovalView)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_posterID);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_deleteButton) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_deleteButtonDimension) = (Class)0x4051000000000000;
  id v6 = a3;

  result = (_TtC11PosterBoard24PosterSectionRemovalView *)sub_1D3372A88();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1D32E37CC();
}

- (void).cxx_destruct
{
  sub_1D32CE208((uint64_t)self + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_delegate);
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11PosterBoard24PosterSectionRemovalView_deleteButton);
}

@end