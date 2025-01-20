@interface GuidedSearchTokenCell
- (_TtC8AppStore21GuidedSearchTokenCell)initWithCoder:(id)a3;
- (_TtC8AppStore21GuidedSearchTokenCell)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation GuidedSearchTokenCell

- (_TtC8AppStore21GuidedSearchTokenCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore21GuidedSearchTokenCell *)sub_1000FC9A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore21GuidedSearchTokenCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000FE084();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000FD478();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000FD890(v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21GuidedSearchTokenCell_pill));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21GuidedSearchTokenCell_label));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore21GuidedSearchTokenCell_closeImage);
}

@end