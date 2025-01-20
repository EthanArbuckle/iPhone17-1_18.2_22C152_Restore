@interface ExternalLinkCell
- (_TtC23ShelfKitCollectionViews16ExternalLinkCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews16ExternalLinkCell)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConstraints;
@end

@implementation ExternalLinkCell

- (_TtC23ShelfKitCollectionViews16ExternalLinkCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews16ExternalLinkCell *)sub_28FDB4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews16ExternalLinkCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_290EA8();
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(ExternalLinkCell *)&v6 traitCollectionDidChange:v4];
  [v5 setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(ExternalLinkCell *)&v6 updateConstraints];
  id v3 = sub_28FC78();
  id v4 = [v2 traitCollection];
  id v5 = (char *)[v4 horizontalSizeClass];

  [v3 setActive:v5 == (unsigned char *)&dword_0 + 1];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ExternalLinkCell_listContent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ExternalLinkCell_iconView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews16ExternalLinkCell____lazy_storage___iconForcedToTrailingEdgeConstraint);
}

@end