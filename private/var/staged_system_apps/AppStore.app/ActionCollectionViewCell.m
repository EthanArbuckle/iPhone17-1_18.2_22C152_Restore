@interface ActionCollectionViewCell
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC8AppStore24ActionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore24ActionCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)accessoryDidActionWithSender:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ActionCollectionViewCell

- (_TtC8AppStore24ActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24ActionCollectionViewCell *)sub_10063EBF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore24ActionCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100641B0C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10063F4DC();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10063FDF8(a3);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  [(ActionCollectionViewCell *)&v3 prepareForReuse];
  v2[OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_hasArtworkToDisplay] = 0;
}

- (void)accessoryDidActionWithSender:(id)a3
{
  objc_super v3 = *(void (**)(id))((char *)&self->super.super.super.super.super.isa
                                 + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_accessoryAction);
  if (v3)
  {
    id v5 = a3;
    v6 = self;
    sub_100060050((uint64_t)v3);
    v3(v5);
    sub_10006012C((uint64_t)v3);
  }
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_textLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_accessoryView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_accessory, &qword_1009A2980);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_searchAdTransparencyButton));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_layoutMetrics;
  uint64_t v4 = type metadata accessor for ActionLayout.Metrics();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_lazilyCreatedArtworkView));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore24ActionCollectionViewCell_accessoryAction);

  sub_10006012C(v5);
}

@end