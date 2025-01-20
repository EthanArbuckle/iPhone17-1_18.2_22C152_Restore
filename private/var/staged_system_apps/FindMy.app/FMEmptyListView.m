@interface FMEmptyListView
- (_TtC6FindMy15FMEmptyListView)initWithCoder:(id)a3;
- (_TtC6FindMy15FMEmptyListView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation FMEmptyListView

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy15FMEmptyListView_scrollableContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy15FMEmptyListView_actionButtonsStackView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC6FindMy15FMEmptyListView_actionButtonCenteringConstraint);
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FMEmptyListView();
  id v4 = a3;
  v5 = v7.receiver;
  id v6 = [(FMEmptyListView *)&v7 traitCollectionDidChange:v4];
  (*(void (**)(id))((swift_isaMask & *v5) + 0x128))(v6);
  sub_10004E4B8();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for FMEmptyListView();
  v2 = v4.receiver;
  id v3 = [(FMEmptyListView *)&v4 layoutSubviews];
  (*(void (**)(id))((swift_isaMask & *v2) + 0x128))(v3);
  if (*((unsigned char *)v2 + OBJC_IVAR____TtC6FindMy15FMEmptyListView_isFirstLayout) == 1) {
    *((unsigned char *)v2 + OBJC_IVAR____TtC6FindMy15FMEmptyListView_isFirstLayout) = 0;
  }
}

- (_TtC6FindMy15FMEmptyListView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10028DA84();
}

- (_TtC6FindMy15FMEmptyListView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy15FMEmptyListView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end