@interface TextToolListItemView
- (BOOL)isHighlighted;
- (_TtC8PaperKit20TextToolListItemView)initWithCoder:(id)a3;
- (_TtC8PaperKit20TextToolListItemView)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation TextToolListItemView

- (_TtC8PaperKit20TextToolListItemView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized TextToolListItemView.init(coder:)();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TextToolListItemView *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v6 = self;
  [(TextToolListItemView *)&v9 setHighlighted:v3];
  v8.receiver = v6;
  v8.super_class = ObjectType;
  if ([(TextToolListItemView *)&v8 isHighlighted]) {
    id v7 = objc_msgSend(self, sel_secondarySystemFillColor);
  }
  else {
    id v7 = 0;
  }
  [(TextToolListItemView *)v6 setBackgroundColor:v7];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  type metadata accessor for NSObject(0, (unint64_t *)&lazy cache variable for type metadata for UIPointerRegion);
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  [(TextToolListItemView *)v12 bounds];
  v13 = (void *)UIPointerRegion.init(rect:identifier:)();

  return v13;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  id v9 = (void *)specialized TextToolListItemView.pointerInteraction(_:styleFor:)();

  return v9;
}

- (_TtC8PaperKit20TextToolListItemView)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit20TextToolListItemView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextToolListItemView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextToolListItemView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextToolListItemView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextToolListItemView_contentButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextToolListItemView_titleLabelTextColor));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit20TextToolListItemView_imageViewTintColor);
}

@end