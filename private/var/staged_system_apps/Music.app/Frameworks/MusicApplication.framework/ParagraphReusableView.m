@interface ParagraphReusableView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplication21ParagraphReusableView)initWithCoder:(id)a3;
- (_TtC16MusicApplication21ParagraphReusableView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
@end

@implementation ParagraphReusableView

- (_TtC16MusicApplication21ParagraphReusableView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC16MusicApplication21ParagraphReusableView_paragraphView;
  type metadata accessor for ParagraphView();
  id v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v11 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)[v10 init];

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[ParagraphReusableView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  [(ParagraphReusableView *)v12 addSubview:*(Class *)((char *)&v12->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication21ParagraphReusableView_paragraphView)];
  return v12;
}

- (_TtC16MusicApplication21ParagraphReusableView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication21ParagraphReusableView_paragraphView;
  type metadata accessor for ParagraphView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC16MusicApplication21ParagraphReusableView *)sub_AB8280();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = self;
  sub_521350(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_525860();
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(ParagraphReusableView *)&v3 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21ParagraphReusableView_paragraphView));
}

@end