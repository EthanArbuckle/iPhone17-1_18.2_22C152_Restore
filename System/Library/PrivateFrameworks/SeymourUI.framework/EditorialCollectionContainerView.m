@interface EditorialCollectionContainerView
- (_TtC9SeymourUI32EditorialCollectionContainerView)initWithCoder:(id)a3;
- (_TtC9SeymourUI32EditorialCollectionContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EditorialCollectionContainerView

- (_TtC9SeymourUI32EditorialCollectionContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI32EditorialCollectionContainerView *)sub_239F8CB94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI32EditorialCollectionContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239F8DF00();
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EditorialCollectionContainerView();
  id v2 = v3.receiver;
  [(EditorialCollectionContainerView *)&v3 layoutSubviews];
  sub_239F8D834();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._subviewCache
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_layout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_bottomStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_footnoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_recencyIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_titleLabel));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionContainerView_titleWidthConstraint);
}

@end